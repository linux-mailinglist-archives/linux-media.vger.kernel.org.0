Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 227321C87D6
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2020 13:15:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726891AbgEGLP3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 May 2020 07:15:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:45922 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725903AbgEGLP3 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 7 May 2020 07:15:29 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 839FD20870;
        Thu,  7 May 2020 11:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588850129;
        bh=m5j26vopqsarHASCUs41VneRgz6W4ivAN8SWIs8XUAo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=io0+5PU2Jeftf20wluUzmyi6annaxFgvMBpalV5HD+3n1J20l9FbtshQAzuO3We6G
         WoUGLmhyX19mn3i2NhD5tGOlVldDjiTX0Iy1pXVWMgvHqvvYFc+I35BG5JPIcCsOYj
         XIS5ok98Sh/Aiopp4KLuMTh3HNg0bPK7aW4zOP5M=
Date:   Thu, 7 May 2020 13:15:26 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Jia-Ju Bai <baijiaju1990@gmail.com>
Cc:     mchehab@kernel.org, allison@lohutok.net, tglx@linutronix.de,
        rfontana@redhat.com, tomasbortoli@gmail.com, sean@mess.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: usb: ttusb-dec: reduce the number of memory reads
 in ttusb_dec_handle_irq()
Message-ID: <20200507111526.GA1498671@kroah.com>
References: <20200507102521.17602-1-baijiaju1990@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200507102521.17602-1-baijiaju1990@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, May 07, 2020 at 06:25:21PM +0800, Jia-Ju Bai wrote:
> In ttusb_dec_handle_irq(), buffer[4] is continuously read from memory 
> three times, without being modified.
> To reduce the number of memory reads, buffer[4] is first assigned to a
> local variable index, and then index is used to replace buffer[4].
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
> +	int index = buffer[4];
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
> -- 
> 2.17.1
> 

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
