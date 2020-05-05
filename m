Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61F911C5FBA
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2020 20:10:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730694AbgEESKq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 May 2020 14:10:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:57132 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729315AbgEESKq (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 5 May 2020 14:10:46 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 105ED206B8;
        Tue,  5 May 2020 18:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588702244;
        bh=mGS1zU5DxoI3NiTeJqYlRSitfGPu+7ydmkvDNU5fOF0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=wAa1o6DrLpic163+KTKRsx5N3N/wdrmFTtm3TGfGHovtZF9/Y6a49T9cjz/rGU8fp
         IZWVLyDkTAhihq4bsIzcdEPlgC6ANGCGll8j/5b2lsYOj7KGuX2xqeBwex2+p7r+Ng
         M24V89Wo4FmdzUPeKMkZ0NjtG9+h/86Riq9cSmx8=
Date:   Tue, 5 May 2020 20:10:42 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Jia-Ju Bai <baijiaju1990@gmail.com>
Cc:     mchehab@kernel.org, kstewart@linuxfoundation.org,
        tomasbortoli@gmail.com, sean@mess.org, allison@lohutok.net,
        tglx@linutronix.de, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: usb: ttusb-dec: avoid buffer overflow in
 ttusb_dec_handle_irq() when DMA failures/attacks occur
Message-ID: <20200505181042.GD1199718@kroah.com>
References: <20200505142110.7620-1-baijiaju1990@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200505142110.7620-1-baijiaju1990@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, May 05, 2020 at 10:21:10PM +0800, Jia-Ju Bai wrote:
> In ttusb_dec_init_usb():
>   dec->irq_buffer = usb_alloc_coherent(...)

Nice.

> Thus, "dec->irq_buffer" is a DMA value, and it is assigned to "buffer"
> in ttusb_dec_handle_irq():
>   char *buffer = dec->irq_buffer;

Nice.

> When DMA failures or attacks occur, the value of buffer[4] can be
> changed at any time.

Wait, how can that happen?

The kernel can not protect itself from something like that in each
individual driver, that's impossible.  Your patch just makes that
"window" a few cycles smaller than before.

> In this case, "buffer[4] - 1 < ARRAY_SIZE(rc_keys)"
> can be first satisfied, and then the value of buffer[4] can be changed
> to a large number, causing a buffer-overflow vulnerability.

Um, maybe.  I agree testing and then using the value can cause problems
when userspace provides you with that data and control, but for
DMA-backed memory, we are in so much other trouble if that is the case.

> To avoid the risk of this vulnerability, buffer[4] is assigned to a
> non-DMA local variable "index" at the beginning of
> ttusb_dec_handle_irq(), and then this variable replaces each use of
> buffer[4] in the function.

I strongly doubt this is even possible.  Can you describe how you can
modify DMA memory and if so, would you do something tiny like this?

> 
> Signed-off-by: Jia-Ju Bai <baijiaju1990@gmail.com>
> ---
>  drivers/media/usb/ttusb-dec/ttusb_dec.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/usb/ttusb-dec/ttusb_dec.c b/drivers/media/usb/ttusb-dec/ttusb_dec.c
> index 3198f9624b7c..8543c552515b 100644
> --- a/drivers/media/usb/ttusb-dec/ttusb_dec.c
> +++ b/drivers/media/usb/ttusb-dec/ttusb_dec.c
> @@ -250,6 +250,7 @@ static void ttusb_dec_handle_irq( struct urb *urb)
>  	struct ttusb_dec *dec = urb->context;
>  	char *buffer = dec->irq_buffer;
>  	int retval;
> +	u8 index = buffer[4];
>  
>  	switch(urb->status) {
>  		case 0: /*success*/
> @@ -281,11 +282,11 @@ static void ttusb_dec_handle_irq( struct urb *urb)
>  		 * this should/could be added later ...
>  		 * for now lets report each signal as a key down and up
>  		 */
> -		if (buffer[4] - 1 < ARRAY_SIZE(rc_keys)) {
> -			dprintk("%s:rc signal:%d\n", __func__, buffer[4]);
> -			input_report_key(dec->rc_input_dev, rc_keys[buffer[4] - 1], 1);
> +		if (index - 1 < ARRAY_SIZE(rc_keys)) {
> +			dprintk("%s:rc signal:%d\n", __func__, index);
> +			input_report_key(dec->rc_input_dev, rc_keys[index - 1], 1);
>  			input_sync(dec->rc_input_dev);
> -			input_report_key(dec->rc_input_dev, rc_keys[buffer[4] - 1], 0);
> +			input_report_key(dec->rc_input_dev, rc_keys[index - 1], 0);
>  			input_sync(dec->rc_input_dev);
>  		}
>  	}

The above complaints aside, the patch does make sense for the simple
fact that it might reduce the number of memory accesses.

But, the compiler might already be doing this type of optimization
anyway, right?  So your original issue might not even be a problem.

Anyhow, the patch looks fine, but it's a minor cleanup, not a fix for
any sort of bug/security issue at all.  If you change the text in the
changelog area, I'll be glad to ack it.

thanks,

greg k-h
