Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B450333F8B
	for <lists+linux-media@lfdr.de>; Wed, 10 Mar 2021 14:47:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232130AbhCJNqh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Mar 2021 08:46:37 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:34366 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232814AbhCJNqH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Mar 2021 08:46:07 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BB1B49E7;
        Wed, 10 Mar 2021 14:46:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1615383961;
        bh=MXgXODAMGUfepWN6MfqFL2OpOjLIYyW5vzVS92C90sQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iS41Y/90WyDKTZuTTLUwa1WrlI3D91YYpk+fVA30sRGtdBDBYe32sICP28mFF0cEa
         bORt5xhF2Tvq9/F2FNtGsBN8xrffm2nJv8U/hjsryltSWyYTcoa9h76gYJlaYPjDw+
         nCRhy037sZBXvwuSmMMK3MQdPHRFGkTSFfKswfc0=
Date:   Wed, 10 Mar 2021 15:45:29 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Liu Ying <victor.liu@nxp.com>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, airlied@linux.ie, daniel@ffwll.ch,
        robh+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        mchehab@kernel.org, a.hajda@samsung.com, narmstrong@baylibre.com,
        jonas@kwiboo.se, jernej.skrabec@siol.net, kishon@ti.com,
        vkoul@kernel.org, robert.foss@linaro.org, lee.jones@linaro.org
Subject: Re: [PATCH v5 01/14] media: uapi: Add some RGB bus formats for
 i.MX8qm/qxp pixel combiner
Message-ID: <YEjNeaZMPptd6oB2@pendragon.ideasonboard.com>
References: <1615370138-5673-1-git-send-email-victor.liu@nxp.com>
 <1615370138-5673-2-git-send-email-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1615370138-5673-2-git-send-email-victor.liu@nxp.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Liu,

Thank you for the patch.

On Wed, Mar 10, 2021 at 05:55:25PM +0800, Liu Ying wrote:
> This patch adds RGB666_1X30_CPADLO, RGB888_1X30_CPADLO, RGB666_1X36_CPADLO
> and RGB888_1X36_CPADLO bus formats used by i.MX8qm/qxp pixel combiner.
> The RGB pixels with padding low per component are transmitted on a 30-bit
> input bus(10-bit per component) from a display controller or a 36-bit
> output bus(12-bit per component) to a pixel link.
> 
> Reviewed-by: Robert Foss <robert.foss@linaro.org>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> v4->v5:
> * Add Robert's R-b tag.
> 
> v3->v4:
> * No change.
> 
> v2->v3:
> * No change.
> 
> v1->v2:
> * No change.
> 
>  include/uapi/linux/media-bus-format.h | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/media-bus-format.h
> index 0dfc11e..ec3323d 100644
> --- a/include/uapi/linux/media-bus-format.h
> +++ b/include/uapi/linux/media-bus-format.h
> @@ -34,7 +34,7 @@
>  
>  #define MEDIA_BUS_FMT_FIXED			0x0001
>  
> -/* RGB - next is	0x101e */
> +/* RGB - next is	0x1022 */
>  #define MEDIA_BUS_FMT_RGB444_1X12		0x1016
>  #define MEDIA_BUS_FMT_RGB444_2X8_PADHI_BE	0x1001
>  #define MEDIA_BUS_FMT_RGB444_2X8_PADHI_LE	0x1002
> @@ -59,9 +59,13 @@
>  #define MEDIA_BUS_FMT_RGB888_3X8_DELTA		0x101d
>  #define MEDIA_BUS_FMT_RGB888_1X7X4_SPWG		0x1011
>  #define MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA	0x1012
> +#define MEDIA_BUS_FMT_RGB666_1X30_CPADLO	0x101e
> +#define MEDIA_BUS_FMT_RGB888_1X30_CPADLO	0x101f
>  #define MEDIA_BUS_FMT_ARGB8888_1X32		0x100d
>  #define MEDIA_BUS_FMT_RGB888_1X32_PADHI		0x100f
>  #define MEDIA_BUS_FMT_RGB101010_1X30		0x1018
> +#define MEDIA_BUS_FMT_RGB666_1X36_CPADLO	0x1020
> +#define MEDIA_BUS_FMT_RGB888_1X36_CPADLO	0x1021
>  #define MEDIA_BUS_FMT_RGB121212_1X36		0x1019
>  #define MEDIA_BUS_FMT_RGB161616_1X48		0x101a
>  

-- 
Regards,

Laurent Pinchart
