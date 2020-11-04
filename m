Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 288C82A63E1
	for <lists+linux-media@lfdr.de>; Wed,  4 Nov 2020 13:07:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729481AbgKDMHJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Nov 2020 07:07:09 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:57204 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729309AbgKDMHJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Nov 2020 07:07:09 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C8011563;
        Wed,  4 Nov 2020 13:07:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1604491627;
        bh=ygWpvQj25r2Vca1Jq0ioF2x0z0sdDUnRu2etsqZ21UA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SifgKZIXIZuBpBjWUrVz8L6To0LNEfr9efIEUKzMQnDHzZg1lBOjYEa3oOiwb7zrn
         H7stKqc6qtUeecGtokdifunVIYY6+SkLpEF4xZA0C1rD2KCAwx/Gp3lo9pJZgbFTLx
         2eOUTmxLE+ARGRFDskbFsPgRkqCoRfWAYpYAi0s4=
Date:   Wed, 4 Nov 2020 14:06:19 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org
Subject: Re: [PATCH 6/6] media: uvcvideo: Handle IRQs from the privacy_pin
Message-ID: <20201104120619.GL26171@pendragon.ideasonboard.com>
References: <20201022133753.310506-1-ribalda@chromium.org>
 <20201022133753.310506-7-ribalda@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201022133753.310506-7-ribalda@chromium.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ricardo,

Thank you for the patch.

On Thu, Oct 22, 2020 at 03:37:53PM +0200, Ricardo Ribalda wrote:
> If the privacy pin produces an IRQ, read the gpio and notify userspace
> via an event.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c   |  3 +++
>  drivers/media/usb/uvc/uvc_driver.c | 30 ++++++++++++++++++++++++++++++
>  2 files changed, 33 insertions(+)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 3a49a1326a90..00c41cba0f68 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -1346,6 +1346,9 @@ static void uvc_ctrl_status_event_work(struct work_struct *work)
>  
>  	mutex_unlock(&chain->ctrl_mutex);
>  
> +	if (!w->urb)
> +		return;
> +
>  	/* Resubmit the URB. */
>  	w->urb->interval = dev->int_ep->desc.bInterval;
>  	ret = usb_submit_urb(w->urb, GFP_KERNEL);
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index 180e503e900f..d1260d131bd8 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -1460,6 +1460,25 @@ static int uvc_gpio_get_info(struct uvc_entity *entity, u8 cs, u8 *caps)
>  	return 0;
>  }
>  
> +static irqreturn_t uvc_privacy_gpio_irq(int irq, void *data)
> +{
> +	struct uvc_device *dev = data;
> +	struct uvc_video_chain *chain;
> +	struct uvc_entity *term;

The entity isn't a terminal, so I'd call the variable unit. I think
there was another occurrence of this issue in another patch in the
series.

> +	u8 value;
> +
> +	list_for_each_entry(chain, &dev->chains, list) {

This will effectively call uvc_ctrl_status_event() once per chain, is
that really what you were intending ?

> +		list_for_each_entry(term, &dev->entities, list) {
> +			if (UVC_ENTITY_TYPE(term) == UVC_GPIO_UNIT) {
> +				value = gpiod_get_value(term->gpio.gpio_privacy);
> +				uvc_ctrl_status_event(NULL, chain, term->controls, &value);

80 columns.

> +			}
> +		}
> +	}
> +
> +	return IRQ_HANDLED;
> +}
> +
>  static int uvc_parse_gpio(struct uvc_device *dev)
>  {
>  	struct uvc_entity *unit;
> @@ -1490,6 +1509,17 @@ static int uvc_parse_gpio(struct uvc_device *dev)
>  
>  	list_add_tail(&unit->list, &dev->entities);
>  
> +	irq = gpiod_to_irq(gpio_privacy);
> +

No need for a blank line.

And it looks like the local irq variable should be introduced in this
patch, not in the previous one. I think I'd squash this with 5/6.

> +	if (irq == -EPROBE_DEFER)
> +		return -EPROBE_DEFER;



> +
> +	if (irq < 0)
> +		return 0;
> +
> +	ret = devm_request_irq(&dev->udev->dev, irq, uvc_privacy_gpio_irq, IRQF_SHARED,

80 columns.

> +			       "uvc_privacy_gpio", dev);

Do we need to handle failures ?

> +
>  	return 0;
>  }
>  

-- 
Regards,

Laurent Pinchart
