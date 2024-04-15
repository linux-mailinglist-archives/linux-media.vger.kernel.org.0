Return-Path: <linux-media+bounces-9338-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C7E8A4C43
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 12:10:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 627F21F22B93
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 10:10:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F9A95A4CF;
	Mon, 15 Apr 2024 10:08:04 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11155A117;
	Mon, 15 Apr 2024 10:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713175683; cv=none; b=WeFOvqp7YjUW5bQoBJjUKqQwZruTWI4uH+kO+Gb23Aayo0Wif8YxigftJetx5zB7KFjwutgdcSzvYYvdi55PlkOInlIRG2XOvxEr4lzVOcvbRdaPRgP4J8eCOxvr9eXMjrVo5KBpCFx05prT7zMYiOARtKkH53fjfbp7xBopmtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713175683; c=relaxed/simple;
	bh=rXl8kTVSVyIjpHlzfxyrSUmoRxjmjB3uzT/bLEqpxps=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Atc3jbDnoPOFHtYJUG0ycMgoWjhrmn+hEJjfYlirHN1uGcDWcTeYQ7Vd1KK41t/OBRewmA0T9fBj1qKUv4aaBL6hMgf31+rpNGFHun5uCL806/pRAedbQzWZ+ZaVwQ2Cl7oA83JpN2W5ANuOg/NIRC3DViHGKtT0Okec1yZdgIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF5D0C4AF08;
	Mon, 15 Apr 2024 10:08:01 +0000 (UTC)
Message-ID: <38bc9cc4-107b-4915-a5ab-2f305264363a@xs4all.nl>
Date: Mon, 15 Apr 2024 12:08:00 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] media: usb: siano: Fix allocation of urbs
Content-Language: en-US, nl
To: Ricardo Ribalda <ribalda@chromium.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Yasunari Takiguchi <Yasunari.Takiguchi@sony.com>,
 Jean-Christophe Trotin <jean-christophe.trotin@foss.st.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-input@vger.kernel.org
References: <20240410-smatch-v1-0-785d009a852b@chromium.org>
 <20240410-smatch-v1-1-785d009a852b@chromium.org>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20240410-smatch-v1-1-785d009a852b@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/04/2024 23:54, Ricardo Ribalda wrote:
> USB urbs must be allocated with usb_alloc_urb. Quoting the manual
> 
> Only use this function (usb_init_urb) if you _really_ understand what you
> are doing.
> 
> Fix the following smatch error:
> 
> drivers/media/usb/siano/smsusb.c:53:38: warning: array of flexible structures
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/siano/smsusb.c | 28 ++++++++++++++++++++--------
>  1 file changed, 20 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/usb/siano/smsusb.c b/drivers/media/usb/siano/smsusb.c
> index 723510520d092..d85308e0785db 100644
> --- a/drivers/media/usb/siano/smsusb.c
> +++ b/drivers/media/usb/siano/smsusb.c
> @@ -40,7 +40,7 @@ struct smsusb_urb_t {
>  	struct smscore_buffer_t *cb;
>  	struct smsusb_device_t *dev;
>  
> -	struct urb urb;
> +	struct urb *urb;
>  
>  	/* For the bottom half */
>  	struct work_struct wq;
> @@ -160,7 +160,7 @@ static int smsusb_submit_urb(struct smsusb_device_t *dev,
>  	}
>  
>  	usb_fill_bulk_urb(
> -		&surb->urb,
> +		surb->urb,
>  		dev->udev,
>  		usb_rcvbulkpipe(dev->udev, dev->in_ep),
>  		surb->cb->p,
> @@ -168,9 +168,9 @@ static int smsusb_submit_urb(struct smsusb_device_t *dev,
>  		smsusb_onresponse,
>  		surb
>  	);
> -	surb->urb.transfer_flags |= URB_FREE_BUFFER;
> +	surb->urb->transfer_flags |= URB_FREE_BUFFER;
>  
> -	return usb_submit_urb(&surb->urb, GFP_ATOMIC);
> +	return usb_submit_urb(surb->urb, GFP_ATOMIC);
>  }
>  
>  static void smsusb_stop_streaming(struct smsusb_device_t *dev)
> @@ -178,7 +178,7 @@ static void smsusb_stop_streaming(struct smsusb_device_t *dev)
>  	int i;
>  
>  	for (i = 0; i < MAX_URBS; i++) {
> -		usb_kill_urb(&dev->surbs[i].urb);
> +		usb_kill_urb(dev->surbs[i].urb);
>  		if (dev->surbs[i].wq.func)
>  			cancel_work_sync(&dev->surbs[i].wq);
>  
> @@ -338,6 +338,8 @@ static void smsusb_term_device(struct usb_interface *intf)
>  	struct smsusb_device_t *dev = usb_get_intfdata(intf);
>  
>  	if (dev) {
> +		int i;
> +
>  		dev->state = SMSUSB_DISCONNECTED;
>  
>  		smsusb_stop_streaming(dev);
> @@ -346,6 +348,9 @@ static void smsusb_term_device(struct usb_interface *intf)
>  		if (dev->coredev)
>  			smscore_unregister_device(dev->coredev);
>  
> +		for (i = 0; i < MAX_URBS; i++)
> +			usb_free_urb(dev->surbs[i].urb);
> +
>  		pr_debug("device 0x%p destroyed\n", dev);
>  		kfree(dev);
>  	}
> @@ -390,6 +395,7 @@ static int smsusb_init_device(struct usb_interface *intf, int board_id)
>  	void *mdev;
>  	int i, rc;
>  	int align = 0;
> +	int n_urb = 0;
>  
>  	/* create device object */
>  	dev = kzalloc(sizeof(struct smsusb_device_t), GFP_KERNEL);
> @@ -461,9 +467,11 @@ static int smsusb_init_device(struct usb_interface *intf, int board_id)
>  	dev->coredev->is_usb_device = true;
>  
>  	/* initialize urbs */
> -	for (i = 0; i < MAX_URBS; i++) {
> -		dev->surbs[i].dev = dev;
> -		usb_init_urb(&dev->surbs[i].urb);
> +	for (n_urb = 0; n_urb < MAX_URBS; n_urb++) {
> +		dev->surbs[n_urb].dev = dev;
> +		dev->surbs[n_urb].urb = usb_alloc_urb(0, GFP_KERNEL);
> +		if (!dev->surbs[n_urb].urb)
> +			goto free_urbs;
>  	}

After allocating the URBs there are a few more error paths that do
'goto err_unregister_device;' instead of 'goto free_urbs;'. From what
I can see, those need to go through 'free_urbs' as well.

>  
>  	pr_debug("smsusb_start_streaming(...).\n");
> @@ -485,6 +493,10 @@ static int smsusb_init_device(struct usb_interface *intf, int board_id)
>  
>  	return rc;
>  
> +free_urbs:
> +	for (i = 0; i < n_urb; i++)
> +		usb_free_urb(dev->surbs[n_urb].urb);

Would it be better to also assign NULL to dev->surbs[n_urb].urb?
That way there are no invalid pointers that can mess up things.

Regards,

	Hans

> +
>  err_unregister_device:
>  	smsusb_term_device(intf);
>  #ifdef CONFIG_MEDIA_CONTROLLER_DVB
> 


