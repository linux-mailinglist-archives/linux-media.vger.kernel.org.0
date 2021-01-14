Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EC542F58EA
	for <lists+linux-media@lfdr.de>; Thu, 14 Jan 2021 04:31:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726590AbhANDEi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Jan 2021 22:04:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725888AbhANDEf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Jan 2021 22:04:35 -0500
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB6BAC061575;
        Wed, 13 Jan 2021 19:03:54 -0800 (PST)
Received: by mail-qk1-x729.google.com with SMTP id v126so5372005qkd.11;
        Wed, 13 Jan 2021 19:03:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cT7hvbTf8x59iE/9LS2QkLowj8NsuZmGiRCFrVA58Vg=;
        b=hYyl93l8KAptLJoTTo8ouhTXC8BDbQK+bKBpnMzIDgxhdjPvqBhVDFvlUdSnBVtJeP
         fEWO0YON8FDe2K1Vw4FlYb3zcGZziDOlWICiu/sMKqHIfbCOJOFHlvg1kbd/WXC63Nh9
         vXfgdnoWglonCNEe7w0iu0NU3iZRQa38ide2I0nIuMSdsasWi+zqKCWqzLPBgQh6MSFY
         5GOfDAgkEio1F1xHr4cMwcc9wPpvJhnS7iijq3LYuFRznIU06PZW3IX1DG7W7DxeWYMq
         MYJoDZS/+CpVhuMUGg/EX86ZKZunH0bJyF1NCo/degRRHReG35+1evQg+E9vbH5FSYdR
         PfLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cT7hvbTf8x59iE/9LS2QkLowj8NsuZmGiRCFrVA58Vg=;
        b=PYjCbWJ/o9PMuxdR/FlZOIteCSKIIFghD1ijebaPR21X2WSipjS0wxtmTokAXx8VG+
         33HZdchVeQrf9pSzJIPeclGaufwbOuOW1t7YtRnx1XlRLNTS3C8L8MoqkeX5AntZfl+Q
         S8B1Qqmvg9fVoZgVuhweez7i/z/5+PE45ni2LvL73VQO48z3PiLO9w2GMzMjfB0rb56U
         YV4AuXlACs4zelbqtx7JT1BTVjPb0aNoj8Mc0srqWnz+ED9zZ5M69/ohxxu0Xe7YgS/9
         dh8rmCdmLV8sVxvGesD9K9zp7+PuawFHbuFAD+CXct3y24zzCf+byhzRZ8KUWN6cpq4L
         xuRQ==
X-Gm-Message-State: AOAM532zXiXY+zeXWCRq7mvFCtEuDV4NJtXRZwW1nI8fj+nYp42avN6b
        wprD2FfprbsoZoqNiK8tV7JQztLHFaY6XiROVDo=
X-Google-Smtp-Source: ABdhPJy+kIzcOri0G+2SyJxH+35358m8JK39bHYf/hoif0xNPkY0BDFSPzKZHO4B4kS+SUuifpUPynb6sZ4UcHvnpGw=
X-Received: by 2002:a25:538a:: with SMTP id h132mr7593079ybb.247.1610593433796;
 Wed, 13 Jan 2021 19:03:53 -0800 (PST)
MIME-Version: 1.0
References: <20210113111122.1739478-1-mudongliangabcd@gmail.com> <20210113142745.GA8138@gofer.mess.org>
In-Reply-To: <20210113142745.GA8138@gofer.mess.org>
From:   =?UTF-8?B?5oWV5Yas5Lqu?= <mudongliangabcd@gmail.com>
Date:   Thu, 14 Jan 2021 11:03:27 +0800
Message-ID: <CAD-N9QUzK+chpT+p9M+b1TAYUagNVGenChCU-rqD0XxVbcAYrw@mail.gmail.com>
Subject: Re: [PATCH] Fix shift-out-of-bound in mceusb_process_ir_data
To:     Sean Young <sean@mess.org>
Cc:     mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jan 13, 2021 at 10:27 PM Sean Young <sean@mess.org> wrote:
>
> On Wed, Jan 13, 2021 at 07:11:22PM +0800, Dongliang Mu wrote:
> > The missing check of ir->buf_in[i+1] can lead to an shift-out-of-bound
> > in mceusb_handle_command or mceusb_dev_printdata. This patch adds a
> > check to limit its value lower than 16. The concrete report of UBSAN is
> > as follows.
> >
> > UBSAN: shift-out-of-bounds in drivers/media/rc/mceusb.c:704:13
> > shift exponent 230 is too large for 32-bit type 'unsigned int'
> > CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.10.0-syzkaller #0
> > Call Trace:
> >  <IRQ>
> >  __dump_stack lib/dump_stack.c:79 [inline]
> >  dump_stack+0x107/0x163 lib/dump_stack.c:120
> >  ubsan_epilogue+0xb/0x5a lib/ubsan.c:148
> >  __ubsan_handle_shift_out_of_bounds.cold+0xb1/0x181 lib/ubsan.c:395
> >  mceusb_dev_printdata.cold+0x19/0x1e drivers/media/rc/mceusb.c:704
> >  mceusb_process_ir_data drivers/media/rc/mceusb.c:1275 [inline]
> >  mceusb_dev_recv+0x3cb/0x1990 drivers/media/rc/mceusb.c:1376
> >  __usb_hcd_giveback_urb+0x2b0/0x5c0 drivers/usb/core/hcd.c:1657
> >  usb_hcd_giveback_urb+0x38c/0x430 drivers/usb/core/hcd.c:1728
> >  dummy_timer+0x11f4/0x32a0 drivers/usb/gadget/udc/dummy_hcd.c:1971
> >
> > Signed-off-by: Dongliang Mu <mudongliangabcd@gmail.com>
> > ---
> >  drivers/media/rc/mceusb.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/media/rc/mceusb.c b/drivers/media/rc/mceusb.c
> > index f9616158bcf4..755808c6e747 100644
> > --- a/drivers/media/rc/mceusb.c
> > +++ b/drivers/media/rc/mceusb.c
> > @@ -1272,6 +1272,8 @@ static void mceusb_process_ir_data(struct mceusb_dev *ir, int buf_len)
> >               switch (ir->parser_state) {
> >               case SUBCMD:
> >                       ir->rem = mceusb_cmd_datasize(ir->cmd, ir->buf_in[i]);
> > +                     if (ir->buf_in[i+1] >= 16)
> > +                             continue;
>
> I'm not sure this is correct. This checks the second byte for *any* response,
> not just MCE_RSP_EQIRCFS response which is causing the "shift out of bounds"
> issue.
>

I am not familiar with the logic of this driver and the semantics of
ir->buf_in[i+1]. I just added one filter and if it breaks the
condition, then skip the current loop.

> I think the check belongs within the MCE_RSP_EQIRCFS case.
>
> Lastly it should have been break, not continue.

If this error data could affect the following parser_state and makes
it stop in the logic, "break" is better.

>
> Thanks
>
> Sean
>
>
>
> >                       mceusb_dev_printdata(ir, ir->buf_in, buf_len, i - 1,
> >                                            ir->rem + 2, false);
> >                       if (i + ir->rem < buf_len)
> > --
> > 2.25.1
