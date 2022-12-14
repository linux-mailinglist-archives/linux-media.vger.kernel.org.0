Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8B6964C742
	for <lists+linux-media@lfdr.de>; Wed, 14 Dec 2022 11:37:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237643AbiLNKh3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Dec 2022 05:37:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229463AbiLNKh2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Dec 2022 05:37:28 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3DD31EAE9;
        Wed, 14 Dec 2022 02:37:27 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3969649C;
        Wed, 14 Dec 2022 11:37:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1671014246;
        bh=gpZ8PSh2qbdy6b1RvdK4BKYFwUJsFMuYAD9CQjY1N7c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uy1s04SR7EPT1t0AYTwulyMePJG4TYdHe5ZqbZlKEnrVfBtTkzeO+3mvJi4zzogo/
         dAo/PumUoxouMLjRoiyB2y8/89TTnPGRE1g8w//43Ocy2X6Lh8EsfKz5z/uq2BlIiA
         UsR48DTfEejUZD9ZzT+VQhGn0+y6tP+RF/xVcosM=
Date:   Wed, 14 Dec 2022 12:37:23 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc:     gregkh@linuxfoundation.org, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, linux-usb@vger.kernel.org,
        linux-media@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 3/5] usb: uvc: make uvc_format_desc table const
Message-ID: <Y5mnYzBBQ6cuZN+V@pendragon.ideasonboard.com>
References: <20221212194716.2995569-1-m.grzeschik@pengutronix.de>
 <20221212194716.2995569-4-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221212194716.2995569-4-m.grzeschik@pengutronix.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Michael,

Thank you for the patch.

On Mon, Dec 12, 2022 at 08:47:14PM +0100, Michael Grzeschik wrote:
> Since the uvc_fmts array can not be modified we declare it const and
> change every user of the uvc_format_by_guid function aswell.
> 
> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/common/uvc.c             | 4 ++--
>  drivers/media/usb/uvc/uvc_driver.c     | 2 +-
>  drivers/usb/gadget/function/uvc_v4l2.c | 8 ++++----
>  include/linux/usb/uvc.h                | 2 +-
>  4 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/common/uvc.c b/drivers/media/common/uvc.c
> index a3cf40215a0754..a6787f1999becd 100644
> --- a/drivers/media/common/uvc.c
> +++ b/drivers/media/common/uvc.c
> @@ -9,7 +9,7 @@
>   * Video formats
>   */
>  
> -static struct uvc_format_desc uvc_fmts[] = {
> +static const struct uvc_format_desc uvc_fmts[] = {
>  	{
>  		.name		= "YUV 4:2:2 (YUYV)",
>  		.guid		= UVC_GUID_FORMAT_YUY2,
> @@ -197,7 +197,7 @@ static struct uvc_format_desc uvc_fmts[] = {
>  	},
>  };
>  
> -struct uvc_format_desc *uvc_format_by_guid(const u8 guid[16])
> +const struct uvc_format_desc *uvc_format_by_guid(const u8 guid[16])
>  {
>  	unsigned int len = ARRAY_SIZE(uvc_fmts);
>  	unsigned int i;
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index 13023cdd37e50b..12b6ad0966d94a 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -224,7 +224,7 @@ static int uvc_parse_format(struct uvc_device *dev,
>  {
>  	struct usb_interface *intf = streaming->intf;
>  	struct usb_host_interface *alts = intf->cur_altsetting;
> -	struct uvc_format_desc *fmtdesc;
> +	const struct uvc_format_desc *fmtdesc;
>  	struct uvc_frame *frame;
>  	const unsigned char *start = buffer;
>  	unsigned int width_multiplier = 1;
> diff --git a/drivers/usb/gadget/function/uvc_v4l2.c b/drivers/usb/gadget/function/uvc_v4l2.c
> index 7435df0cf2a847..21e573e628f4e7 100644
> --- a/drivers/usb/gadget/function/uvc_v4l2.c
> +++ b/drivers/usb/gadget/function/uvc_v4l2.c
> @@ -27,10 +27,10 @@
>  #include "uvc_v4l2.h"
>  #include "uvc_configfs.h"
>  
> -static struct uvc_format_desc *to_uvc_format(struct uvcg_format *uformat)
> +static const struct uvc_format_desc *to_uvc_format(struct uvcg_format *uformat)
>  {
>  	char guid[16] = UVC_GUID_FORMAT_MJPEG;
> -	struct uvc_format_desc *format;
> +	const struct uvc_format_desc *format;
>  	struct uvcg_uncompressed *unc;
>  
>  	if (uformat->type == UVCG_UNCOMPRESSED) {
> @@ -119,7 +119,7 @@ static struct uvcg_format *find_format_by_pix(struct uvc_device *uvc,
>  	struct uvcg_format *uformat = NULL;
>  
>  	list_for_each_entry(format, &uvc->header->formats, entry) {
> -		struct uvc_format_desc *fmtdesc = to_uvc_format(format->fmt);
> +		const struct uvc_format_desc *fmtdesc = to_uvc_format(format->fmt);
>  
>  		if (fmtdesc->fcc == pixelformat) {
>  			uformat = format->fmt;
> @@ -364,7 +364,7 @@ uvc_v4l2_enum_format(struct file *file, void *fh, struct v4l2_fmtdesc *f)
>  {
>  	struct video_device *vdev = video_devdata(file);
>  	struct uvc_device *uvc = video_get_drvdata(vdev);
> -	struct uvc_format_desc *fmtdesc;
> +	const struct uvc_format_desc *fmtdesc;
>  	struct uvcg_format *uformat;
>  
>  	if (f->index >= uvc->header->num_fmt)
> diff --git a/include/linux/usb/uvc.h b/include/linux/usb/uvc.h
> index a2dae2b40a2318..227a03f252a5c0 100644
> --- a/include/linux/usb/uvc.h
> +++ b/include/linux/usb/uvc.h
> @@ -151,6 +151,6 @@ struct uvc_format_desc {
>  	u32 fcc;
>  };
>  
> -struct uvc_format_desc *uvc_format_by_guid(const u8 guid[16]);
> +const struct uvc_format_desc *uvc_format_by_guid(const u8 guid[16]);
>  
>  #endif /* __LINUX_V4L2_UVC_H */

-- 
Regards,

Laurent Pinchart
