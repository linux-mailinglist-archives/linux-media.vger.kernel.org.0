Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4088D64383C
	for <lists+linux-media@lfdr.de>; Mon,  5 Dec 2022 23:39:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232903AbiLEWjF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Dec 2022 17:39:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230235AbiLEWjE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Dec 2022 17:39:04 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55719C31;
        Mon,  5 Dec 2022 14:39:03 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5EFC3589;
        Mon,  5 Dec 2022 23:39:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1670279941;
        bh=ECF4/ggfsJHS1bBwpAA9kt0ujQT/67nmOpBkwOK9+/8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qslbiqk6nhdSh6yDX0DvE8z1K5c2lqcfWzttSH1qCUHW9ygWc/xxZ3IjXGuopI5VG
         brJk6kynbGfMwWrkBmv5koTy9MJCdbD2WerqY02sqY00RC1G1yFPb4MKYrfzB2n3dS
         14yizv8JOcjjlykuHKpO2z5Z71O93xoeUfAog5LQ=
Date:   Tue, 6 Dec 2022 00:38:58 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Yunke Cao <yunkec@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCH v3] media: uvcvideo: Recover stalled ElGato devices
Message-ID: <Y45zApHY34WocyeM@pendragon.ideasonboard.com>
References: <20220920-resend-elgato-v3-0-57668054127f@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220920-resend-elgato-v3-0-57668054127f@chromium.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ricardo,

Thank you for the patch.

On Mon, Dec 05, 2022 at 01:53:01PM +0100, Ricardo Ribalda wrote:
> Elgato Cam Link 4k can be in a stalled state if the resolution of
> the external source has changed while the firmware initializes.
> Once in this state, the device is useless until it receives a
> USB reset. It has even been observed that the stalled state will
> continue even after unplugging the device.

Why, ô, why :'-(

> lsusb -v
> 
> Bus 002 Device 002: ID 0fd9:0066 Elgato Systems GmbH Cam Link 4K
> Device Descriptor:
>   bLength                18
>   bDescriptorType         1
>   bcdUSB               3.00
>   bDeviceClass          239 Miscellaneous Device
>   bDeviceSubClass         2
>   bDeviceProtocol         1 Interface Association
>   bMaxPacketSize0         9
>   idVendor           0x0fd9 Elgato Systems GmbH
>   idProduct          0x0066
>   bcdDevice            0.00
>   iManufacturer           1 Elgato
>   iProduct                2 Cam Link 4K
>   iSerial                 4 0005AC52FE000
>   bNumConfigurations      1
> 
> Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
> Recover stalled ElGato devices
> 
> Just a resend of this hw fix.
> 
> To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> To: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: linux-media@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: Sergey Senozhatsky <senozhatsky@chromium.org>
> Cc: Yunke Cao <yunkec@chromium.org>
> ---
> Changes in v3:
> - Add Reviewed-by: Sergey
> - Improve identation (Thanks Sergey!)
> - Link to v2: https://lore.kernel.org/r/20220920-resend-elgato-v2-0-06b48b3b486a@chromium.org
> 
> Changes in v2:
> - Remove info from lsusb 
> - Link to v1: https://lore.kernel.org/r/20220920-resend-elgato-v1-0-8672a2380e3d@chromium.org
> ---
>  drivers/media/usb/uvc/uvc_video.c | 23 +++++++++++++++++++----
>  1 file changed, 19 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index 170a008f4006..a8323cf0e9f9 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -129,12 +129,13 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
>  	return -EPIPE;
>  }
>  
> +static const struct usb_device_id elgato_cam_link_4k = {
> +	USB_DEVICE(0x0fd9, 0x0066)
> +};
> +
>  static void uvc_fixup_video_ctrl(struct uvc_streaming *stream,
>  	struct uvc_streaming_control *ctrl)
>  {
> -	static const struct usb_device_id elgato_cam_link_4k = {
> -		USB_DEVICE(0x0fd9, 0x0066)
> -	};
>  	struct uvc_format *format = NULL;
>  	struct uvc_frame *frame = NULL;
>  	unsigned int i;
> @@ -297,7 +298,7 @@ static int uvc_get_video_ctrl(struct uvc_streaming *stream,
>  		dev_err(&stream->intf->dev,
>  			"Failed to query (%u) UVC %s control : %d (exp. %u).\n",
>  			query, probe ? "probe" : "commit", ret, size);
> -		ret = -EIO;
> +		ret = (ret == -EPROTO) ? -EPROTO : -EIO;

This will change the error returned by VIDIOC_S_FMT and VIDIOC_TRY_FMT,
but I don't think that will cause issues.

>  		goto out;
>  	}
>  
> @@ -2121,6 +2122,20 @@ int uvc_video_init(struct uvc_streaming *stream)
>  	 * request on the probe control, as required by the UVC specification.
>  	 */
>  	ret = uvc_get_video_ctrl(stream, probe, 1, UVC_GET_CUR);
> +
> +	/*
> +	 * Elgato Cam Link 4k can be in a stalled state if the resolution of
> +	 * the external source has changed while the firmware initializes.
> +	 * Once in this state, the device is useless until it receives a
> +	 * USB reset. It has even been observed that the stalled state will
> +	 * continue even after unplugging the device.
> +	 */
> +	if (usb_match_one_id(stream->dev->intf, &elgato_cam_link_4k) &&
> +	    (ret == -EPROTO)) {

I'd swap the tests, as the second one is cheaper. You also don't need
the inner parentheses.

> +		usb_reset_device(stream->dev->udev);
> +		dev_err(&stream->intf->dev, "Restarting Elgato Cam Link 4K\n");

I would also swap those two lines, if an error occurs when resetting the
device, it's good to have the "restarting" message printed first.

If I understand this correctly, probe will still fail, and the user will
have to unplug and replug the device to fix this, right ? If so I'd
expand the error message, maybe something along those lines:

		dev_err(&stream->intf->dev, "Elgato Cam Link 4K firmware crash detected\n");
		dev_err(&stream->intf->dev, "Resetting the device, unplug and replug to recover\n");

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +	}
> +
>  	if (ret < 0)
>  		return ret;
>  
> 
> ---
> base-commit: 521a547ced6477c54b4b0cc206000406c221b4d6
> change-id: 20220920-resend-elgato-a845482bdd02

-- 
Regards,

Laurent Pinchart
