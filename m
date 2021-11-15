Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 484704501E3
	for <lists+linux-media@lfdr.de>; Mon, 15 Nov 2021 10:59:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230472AbhKOKCb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Nov 2021 05:02:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230466AbhKOKC3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Nov 2021 05:02:29 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46EC1C061746
        for <linux-media@vger.kernel.org>; Mon, 15 Nov 2021 01:59:30 -0800 (PST)
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BC3A09CA;
        Mon, 15 Nov 2021 10:59:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1636970368;
        bh=nvKNz/edAkzr+aJRKtlgcEc84i/xWrVZOaqpaCrwtTA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Q4Vs6/iP24528wDKgxAK/EIruQxkSwd8MLUt8VrGnjTDY2VkXJnqgMTZnS9PN4chN
         1HGW2UXr4KUXtoD/FMN92GfQDN0/i1W4L0ax7K5VPA1wWQAXVoLtKLRYsa/IzycKCe
         BqBHtvqlMrNoF1FCFigp9KMmA1n2a9rIMeIKAo9c=
Date:   Mon, 15 Nov 2021 11:59:06 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        James Hilliard <james.hilliard1@gmail.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v2] media: uvcvideo: Set the colorspace as sRGB if
 undefined
Message-ID: <YZIvatXoeJclJiHN@pendragon.ideasonboard.com>
References: <20211112195710.286151-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211112195710.286151-1-ribalda@chromium.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ricardo,

Thank you for the patch.

On Fri, Nov 12, 2021 at 08:57:10PM +0100, Ricardo Ribalda wrote:
> Never return V4L2_COLORSPACE_DEFAULT. From the standard:
> 
> """
> In the absence of this descriptor, or in the case of
> “Unspecified” values within the descriptor, color matching
> defaults will be assumed. The color matching defaults are
> compliant with sRGB since the BT.709 transfer function and
> the sRGB transfer function are very similar.
> """
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> @James: Can you try this version? Thanks!
> 
>  drivers/media/usb/uvc/uvc_driver.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index 29befcb229b2..27234fe60a48 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -256,7 +256,7 @@ static struct uvc_format_desc *uvc_format_by_guid(const u8 guid[16])
>  static enum v4l2_colorspace uvc_colorspace(const u8 primaries)
>  {
>  	static const enum v4l2_colorspace colorprimaries[] = {
> -		V4L2_COLORSPACE_DEFAULT,  /* Unspecified */
> +		V4L2_COLORSPACE_SRGB,  /* Unspecified */
>  		V4L2_COLORSPACE_SRGB,
>  		V4L2_COLORSPACE_470_SYSTEM_M,
>  		V4L2_COLORSPACE_470_SYSTEM_BG,
> @@ -267,7 +267,7 @@ static enum v4l2_colorspace uvc_colorspace(const u8 primaries)
>  	if (primaries < ARRAY_SIZE(colorprimaries))
>  		return colorprimaries[primaries];
>  
> -	return V4L2_COLORSPACE_DEFAULT;  /* Reserved */
> +	return V4L2_COLORSPACE_SRGB;  /* Reserved */
>  }
>  
>  static enum v4l2_xfer_func uvc_xfer_func(const u8 transfer_characteristics)
> @@ -769,6 +769,8 @@ static int uvc_parse_format(struct uvc_device *dev,
>  
>  		buflen -= buffer[0];
>  		buffer += buffer[0];
> +	} else {
> +		format->colorspace = V4L2_COLORSPACE_SRGB;
>  	}
>  
>  	return buffer - start;

-- 
Regards,

Laurent Pinchart
