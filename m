Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1CBB2F4591
	for <lists+linux-media@lfdr.de>; Wed, 13 Jan 2021 08:52:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726608AbhAMHwT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Jan 2021 02:52:19 -0500
Received: from mail.kernel.org ([198.145.29.99]:57618 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726136AbhAMHwT (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Jan 2021 02:52:19 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6D6392311F;
        Wed, 13 Jan 2021 07:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1610524298;
        bh=pGMaaIllS4magcVjWolOOHb7CsgiI5Zj3CzLFu268og=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=i7DXqJIhPex9YSxi4hMko3aevLv0nD8FOwFJsk5Xv7ZLBJZHFp+BnsuJDTaJ2S3XV
         nt0m0rRJokcZWQQRS9uGMRayzwaUtTE86maZmJ9u8dsX481uZSnLwl8WCf3r5usfNm
         YOid601TMw5JKB8HIW6aSpnL8BPSEwqlIPOtOmVE=
Date:   Wed, 13 Jan 2021 08:51:33 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     =?utf-8?B?5oWV5Yas5Lqu?= <mudongliangabcd@gmail.com>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        linux-media@vger.kernel.org, mchehab@kernel.org, sean@mess.org,
        anant.thazhemadam@gmail.com,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        Dmitry Vyukov <dvyukov@google.com>
Subject: Re: "UBSAN: shift-out-of-bounds in mceusb_dev_recv" should share the
 same root cause with "UBSAN: shift-out-of-bounds in mceusb_dev_printdata"
Message-ID: <X/6mhQfPRt0QoorO@kroah.com>
References: <CAD-N9QW-zm37f9PW-iF-NaAH5LLePWFba3aG5LkXD2a07YBZpg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD-N9QW-zm37f9PW-iF-NaAH5LLePWFba3aG5LkXD2a07YBZpg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jan 13, 2021 at 01:04:44PM +0800, 慕冬亮 wrote:
> Hi developers,
> 
> I found that "UBSAN: shift-out-of-bounds in mceusb_dev_recv" and
> "UBSAN: shift-out-of-bounds in mceusb_dev_printdata" should share the
> same root cause.
> The reason is that the PoCs after minimization has a high similarity
> with the other. And their stack trace only diverges at the last
> function call. The following is some analysis for this bug.
> 
> The following code in the mceusb_process_ir_data is the vulnerable
> --------------------------------------------------------------------------------------------------------------------------
> for (; i < buf_len; i++) {
>      switch (ir->parser_state) {
>      case SUBCMD:
>              ir->rem = mceusb_cmd_datasize(ir->cmd, ir->buf_in[i]);
>              mceusb_dev_printdata(ir, ir->buf_in, buf_len, i - 1,
>                                                    ir->rem + 2, false);
>              if (i + ir->rem < buf_len)
>              mceusb_handle_command(ir, &ir->buf_in[i - 1]);
> --------------------------------------------------------------------------------------------------------------------------
> 
> The first report crashes at a shift operation(1<<*hi) in mceusb_handle_command.
> --------------------------------------------------------------------------------------------------------------------------
> static void mceusb_handle_command(struct mceusb_dev *ir, u8 *buf_in)
> {
> u8 *hi = &buf_in[2]; /* read only when required */
> if (cmd == MCE_CMD_PORT_SYS) {
>       switch (subcmd) {
>       case MCE_RSP_GETPORTSTATUS:
>               if (buf_in[5] == 0)
>                      ir->txports_cabled |= 1 << *hi;
> --------------------------------------------------------------------------------------------------------------------------
> 
> The second report crashes at another shift operation (1U << data[0])
> in mceusb_dev_printdata.
> --------------------------------------------------------------------------------------------------------------------------
> static void mceusb_dev_printdata(struct mceusb_dev *ir, u8 *buf, int buf_len,
> int offset, int len, bool out)
> {
> data   = &buf[offset] + 2;
> 
>           period = DIV_ROUND_CLOSEST((1U << data[0] * 2) *
>                         (data[1] + 1), 10);
> --------------------------------------------------------------------------------------------------------------------------
> 
> >From the analysis, we can know the data[0] and *hi access the same
> memory cell - ``ir->buf_in[i+1]``. So the root cause should be that it
> misses the check of ir->buf_in[i+1].
> 
> For the patch of this bug, there is one from anant.thazhemadam@gmail.com:
> --------------------------------------------------------------------------------------------------------------------------
> diff --git a/drivers/media/rc/mceusb.c b/drivers/media/rc/mceusb.c
> index f1dbd059ed08..79de721b1c4a 100644
> --- a/drivers/media/rc/mceusb.c
> +++ b/drivers/media/rc/mceusb.c
> @@ -1169,7 +1169,7 @@ static void mceusb_handle_command(struct
> mceusb_dev *ir, u8 *buf_in)
>   switch (subcmd) {
>   /* the one and only 5-byte return value command */
>   case MCE_RSP_GETPORTSTATUS:
> - if (buf_in[5] == 0)
> + if ((buf_in[5] == 0) && (*hi <= 32))
>   ir->txports_cabled |= 1 << *hi;
>   break;
> --------------------------------------------------------------------------------------------------------------------------
> I tried this patch in the second crash report and found it does not
> work. I think we should add another filter for the value in
> ``ir->buf_in[i+1]``.
> 
> With this grouping, I think developers can take into consideration the
> issue in mceusb_dev_printdata and generate a complete patch for this
> bug.

Why not create a patch yourself and submit it?  That way you get the
correct credit for solving the problem.

thanks,

greg k-h
