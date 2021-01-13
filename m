Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B3212F4D16
	for <lists+linux-media@lfdr.de>; Wed, 13 Jan 2021 15:28:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726003AbhAMO2a (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Jan 2021 09:28:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725772AbhAMO23 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Jan 2021 09:28:29 -0500
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFFD8C061575;
        Wed, 13 Jan 2021 06:27:49 -0800 (PST)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 0AB5DC6378; Wed, 13 Jan 2021 14:27:46 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1610548066; bh=UktXgG9wkBHTGV//3PGFQd/yEA8ExzR/nxPRJulSGQA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Facmcd+CkeoNSgGoSfHw7RKuh9lt4n46w1p2uqfH6iFCzcgOyNzY2eLZMxF2Yyx0N
         Dh8UHI+BjVsuYsRzm/WY+8Hb01/cPeVzgHJfcSXr0ElscF0aJbNpWZqo3jeNsMvp61
         xJ8Y3MRBhDbqJajQsnz6xKnBxDRYZ6TodbL1BvA+7APXBgW7Vow3QXo4u8EOxbQdlL
         iOGfnzDnvxs9Ar5AQoKjh0MDZvO8pqvZurneYfiSHdoRekyEGr0seyar0FJYHxWM0x
         rIiTeVvbwSu0cZNB09aRzDjarNB3v3w9QKBjGDVwe8ZVfNIEgOr6FlUvXUj5TCepwD
         WnQzxV3uJfoCg==
Date:   Wed, 13 Jan 2021 14:27:45 +0000
From:   Sean Young <sean@mess.org>
To:     Dongliang Mu <mudongliangabcd@gmail.com>
Cc:     mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Fix shift-out-of-bound in mceusb_process_ir_data
Message-ID: <20210113142745.GA8138@gofer.mess.org>
References: <20210113111122.1739478-1-mudongliangabcd@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210113111122.1739478-1-mudongliangabcd@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jan 13, 2021 at 07:11:22PM +0800, Dongliang Mu wrote:
> The missing check of ir->buf_in[i+1] can lead to an shift-out-of-bound
> in mceusb_handle_command or mceusb_dev_printdata. This patch adds a
> check to limit its value lower than 16. The concrete report of UBSAN is
> as follows.
> 
> UBSAN: shift-out-of-bounds in drivers/media/rc/mceusb.c:704:13
> shift exponent 230 is too large for 32-bit type 'unsigned int'
> CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.10.0-syzkaller #0
> Call Trace:
>  <IRQ>
>  __dump_stack lib/dump_stack.c:79 [inline]
>  dump_stack+0x107/0x163 lib/dump_stack.c:120
>  ubsan_epilogue+0xb/0x5a lib/ubsan.c:148
>  __ubsan_handle_shift_out_of_bounds.cold+0xb1/0x181 lib/ubsan.c:395
>  mceusb_dev_printdata.cold+0x19/0x1e drivers/media/rc/mceusb.c:704
>  mceusb_process_ir_data drivers/media/rc/mceusb.c:1275 [inline]
>  mceusb_dev_recv+0x3cb/0x1990 drivers/media/rc/mceusb.c:1376
>  __usb_hcd_giveback_urb+0x2b0/0x5c0 drivers/usb/core/hcd.c:1657
>  usb_hcd_giveback_urb+0x38c/0x430 drivers/usb/core/hcd.c:1728
>  dummy_timer+0x11f4/0x32a0 drivers/usb/gadget/udc/dummy_hcd.c:1971
> 
> Signed-off-by: Dongliang Mu <mudongliangabcd@gmail.com>
> ---
>  drivers/media/rc/mceusb.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/media/rc/mceusb.c b/drivers/media/rc/mceusb.c
> index f9616158bcf4..755808c6e747 100644
> --- a/drivers/media/rc/mceusb.c
> +++ b/drivers/media/rc/mceusb.c
> @@ -1272,6 +1272,8 @@ static void mceusb_process_ir_data(struct mceusb_dev *ir, int buf_len)
>  		switch (ir->parser_state) {
>  		case SUBCMD:
>  			ir->rem = mceusb_cmd_datasize(ir->cmd, ir->buf_in[i]);
> +			if (ir->buf_in[i+1] >= 16)
> +				continue;

I'm not sure this is correct. This checks the second byte for *any* response,
not just MCE_RSP_EQIRCFS response which is causing the "shift out of bounds"
issue.

I think the check belongs within the MCE_RSP_EQIRCFS case.

Lastly it should have been break, not continue.

Thanks

Sean



>  			mceusb_dev_printdata(ir, ir->buf_in, buf_len, i - 1,
>  					     ir->rem + 2, false);
>  			if (i + ir->rem < buf_len)
> -- 
> 2.25.1
