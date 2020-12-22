Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5693D2E08D5
	for <lists+linux-media@lfdr.de>; Tue, 22 Dec 2020 11:31:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726547AbgLVKau (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Dec 2020 05:30:50 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:43752 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726333AbgLVKat (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Dec 2020 05:30:49 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C6B6C9E6;
        Tue, 22 Dec 2020 11:30:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1608633007;
        bh=Yzzayy1jXlp0/639WscGDZbsKqyI1CX8/CSqZKJW5Ms=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aF4v5R0xHOgJg1bh1cylglnVJbVxLF5ENpCbWHQwRXk7yiCICiQIiMo8QGg99Mhmz
         V+FUFuf+eIqXN5IU55eZ5IrrSWbsYj36mf9PBtYd/JnIUy9JSYUmWL6QJixXhGJmL9
         +Q9ZnMyHEF3SX0WZqlUnbyuzDeHA13K4lmb85XoU=
Date:   Tue, 22 Dec 2020 12:29:59 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 09/12] media: uvcvideo: Implement
 UVC_QUIRK_PRIVACY_DURING_STREAM
Message-ID: <X+HKpxzbVC29lNlk@pendragon.ideasonboard.com>
References: <20201221164819.792019-1-ribalda@chromium.org>
 <20201221164819.792019-10-ribalda@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201221164819.792019-10-ribalda@chromium.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ricardo,

Thank you for the patch.

On Mon, Dec 21, 2020 at 05:48:16PM +0100, Ricardo Ribalda wrote:
> Some devices, can only read the privacy_pin if the device is

s/devices,/devices/

> streaming.
> 
> This patch implement a quirk for such devices, in order to avoid invalid
> reads and/or spurious events.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 57 ++++++++++++++++++++++++++++--
>  drivers/media/usb/uvc/uvc_queue.c  |  3 ++
>  drivers/media/usb/uvc/uvcvideo.h   |  4 +++
>  3 files changed, 61 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index 72516101fdd0..7af37d4bd60a 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -7,6 +7,7 @@
>   */
>  
>  #include <linux/atomic.h>
> +#include <linux/dmi.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/kernel.h>
>  #include <linux/list.h>
> @@ -1472,6 +1473,17 @@ static int uvc_parse_control(struct uvc_device *dev)
>  /* -----------------------------------------------------------------------------
>   * Privacy GPIO
>   */

There should be a blank line here.

> +static bool uvc_gpio_is_streaming(struct uvc_device *dev)
> +{
> +	struct uvc_streaming *streaming;
> +
> +	list_for_each_entry(streaming, &dev->streams, list) {
> +		if (uvc_queue_streaming(&streaming->queue))
> +			return true;
> +	}
> +
> +	return false;
> +}
>  
>  

But not too blank lines here.

>  static u8 uvc_gpio_update_value(struct uvc_device *dev,
> @@ -1499,7 +1511,12 @@ static int uvc_gpio_get_cur(struct uvc_device *dev, struct uvc_entity *entity,
>  	if (cs != UVC_CT_PRIVACY_CONTROL || size < 1)
>  		return -EINVAL;
>  
> +	if ((dev->quirks & UVC_QUIRK_PRIVACY_DURING_STREAM) &&
> +	    !uvc_gpio_is_streaming(dev))
> +		return -EBUSY;
> +
>  	*(uint8_t *)data = uvc_gpio_update_value(dev, entity);
> +
>  	return 0;
>  }
>  
> @@ -1528,19 +1545,50 @@ static struct uvc_entity *uvc_gpio_find_entity(struct uvc_device *dev)
>  	return NULL;
>  }
>  
> -static irqreturn_t uvc_gpio_irq(int irq, void *data)
> +void uvc_privacy_gpio_event(struct uvc_device *dev)
>  {
> -	struct uvc_device *dev = data;
>  	struct uvc_entity *unit;
>  
> +
>  	unit = uvc_gpio_find_entity(dev);
>  	if (!unit)
> -		return IRQ_HANDLED;
> +		return;
>  
>  	uvc_gpio_update_value(dev, unit);
> +}
> +
> +static irqreturn_t uvc_gpio_irq(int irq, void *data)
> +{
> +	struct uvc_device *dev = data;
> +
> +	/* Ignore privacy events during streamoff */
> +	if (dev->quirks & UVC_QUIRK_PRIVACY_DURING_STREAM)
> +		if (!uvc_gpio_is_streaming(dev))
> +			return IRQ_HANDLED;

I'm still a bit concerned of race conditions. When stopping the stream,
vb2_queue.streaming is set to 0 after calling the driver's .stop_stream()
handler. This means that the device will cut power before
uvc_gpio_is_streaming() can detect that streaming has stopped, and the
GPIO could thus trigger an IRQ.

You mentioned that devices have a pull-up or pull-down on the GPIO line.
As there are only two devices affected, do you know if it's a pull-up or
pull-down ? Would it be worse to expose that state to userspace than to
return -EBUSY when reading the control ?

> +
> +	uvc_privacy_gpio_event(dev);
> +
>  	return IRQ_HANDLED;
>  }
>  
> +static const struct dmi_system_id privacy_valid_during_streamon[] = {
> +	{
> +		.ident = "HP Elite c1030 Chromebook",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "HP"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Jinlon"),
> +		},
> +	},
> +	{
> +		.ident = "HP Pro c640 Chromebook",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "HP"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Dratini"),
> +		},
> +	},
> +	{ } /* terminate list */
> +};
> +
>  static int uvc_gpio_parse(struct uvc_device *dev)
>  {
>  	struct uvc_entity *unit;
> @@ -1577,6 +1625,9 @@ static int uvc_gpio_parse(struct uvc_device *dev)
>  
>  	list_add_tail(&unit->list, &dev->entities);
>  
> +	if (dmi_check_system(privacy_valid_during_streamon))
> +		dev->quirks |= UVC_QUIRK_PRIVACY_DURING_STREAM;

This will also match any external UVC camera plugged to one of the
affected systems, right ? It shouldn't matter in practice as those
devices won't have a GPIO entity.

I suppose we can't match on VID:PID instead because the same VID:PID is
used in both devices affected by this issue, and devices immune to it ?

> +
>  	return 0;
>  }
>  
> diff --git a/drivers/media/usb/uvc/uvc_queue.c b/drivers/media/usb/uvc/uvc_queue.c
> index cd60c6c1749e..e800d491303f 100644
> --- a/drivers/media/usb/uvc/uvc_queue.c
> +++ b/drivers/media/usb/uvc/uvc_queue.c
> @@ -337,9 +337,12 @@ int uvc_dequeue_buffer(struct uvc_video_queue *queue, struct v4l2_buffer *buf,
>  int uvc_queue_streamon(struct uvc_video_queue *queue, enum v4l2_buf_type type)
>  {
>  	int ret;
> +	struct uvc_streaming *stream = uvc_queue_to_stream(queue);

Please swap the two lines.

>  
>  	mutex_lock(&queue->mutex);
>  	ret = vb2_streamon(&queue->queue, type);
> +	if (stream->dev->quirks & UVC_QUIRK_PRIVACY_DURING_STREAM)
> +		uvc_privacy_gpio_event(stream->dev);

Even when vb2_streamon() failed ?

>  	mutex_unlock(&queue->mutex);
>  
>  	return ret;
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index 079a407ebba5..32c1ba246d97 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -209,6 +209,7 @@
>  #define UVC_QUIRK_RESTORE_CTRLS_ON_INIT	0x00000400
>  #define UVC_QUIRK_FORCE_Y8		0x00000800
>  #define UVC_QUIRK_FORCE_BPP		0x00001000
> +#define UVC_QUIRK_PRIVACY_DURING_STREAM	0x00002000
>  
>  /* Format flags */
>  #define UVC_FMT_FLAG_COMPRESSED		0x00000001
> @@ -826,6 +827,9 @@ extern const struct v4l2_file_operations uvc_fops;
>  int uvc_mc_register_entities(struct uvc_video_chain *chain);
>  void uvc_mc_cleanup_entity(struct uvc_entity *entity);
>  
> +/* Privacy gpio */
> +void uvc_privacy_gpio_event(struct uvc_device *dev);
> +
>  /* Video */
>  int uvc_video_init(struct uvc_streaming *stream);
>  int uvc_video_suspend(struct uvc_streaming *stream);

-- 
Regards,

Laurent Pinchart
