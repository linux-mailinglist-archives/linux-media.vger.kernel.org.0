Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBF593D39C1
	for <lists+linux-media@lfdr.de>; Fri, 23 Jul 2021 13:50:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234353AbhGWLKG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Jul 2021 07:10:06 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:44624 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234218AbhGWLKF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Jul 2021 07:10:05 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DA5043F2;
        Fri, 23 Jul 2021 13:50:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1627041038;
        bh=oaGp71Pn82ESFJ7wM7lQkJJvoJlCzgBAHG8xXSC/pg4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qqpE66nHHl6NAsWotnmcEhFhbY3ccUWHSS1bM+0uo8FOzDJpNuORda4tRu3oXKAkY
         BovzSZratZ5Owwl1VowYXIscpEAoABpG/066muPYDTYWZknzG6YTuouyl5a8hk8n3k
         C0vBhL0WSvbU1Gt8QnXLGjyLvNngEeQAPo0qSP0M=
Date:   Fri, 23 Jul 2021 14:50:35 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Umang Jain <umang.jain@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bingbu Cao <bingbu.cao@intel.com>
Subject: Re: [PATCH 1/2] media: imx258: Rectify mismatch of VTS value
Message-ID: <YPqtC0KITMbB2I4F@pendragon.ideasonboard.com>
References: <20210723112233.1361319-1-umang.jain@ideasonboard.com>
 <20210723112233.1361319-2-umang.jain@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210723112233.1361319-2-umang.jain@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Umang,

Thank you for the patch.

(Expanding the CC list)

On Fri, Jul 23, 2021 at 04:52:32PM +0530, Umang Jain wrote:
> From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> The frame_length_lines (0x0340) registers are hard-coded as follows:
> 
> - 4208x3118
>   frame_length_lines = 0x0c50
> 
> - 2104x1560
>   frame_length_lines = 0x0638
> 
> - 1048x780
>   frame_length_lines = 0x034c
> 
> The driver exposes the V4L2_CID_VBLANK control in read-only mode and
> sets its value to vts_def - height, where vts_def is a mode-dependent
> value coming from the supported_modes array. It is set using one of
> the following macros defined in the driver:
> 
>   #define IMX258_VTS_30FPS                0x0c98
>   #define IMX258_VTS_30FPS_2K             0x0638
>   #define IMX258_VTS_30FPS_VGA            0x034c
> 
> There's a clear mismatch in the value for the full resolution mode i.e.
> IMX258_VTS_30FPS. Fix it by rectifying the macro with the value set for
> the frame_length_lines register as stated above.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/i2c/imx258.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
> index 7ab9e5f9f267..4e695096e5d0 100644
> --- a/drivers/media/i2c/imx258.c
> +++ b/drivers/media/i2c/imx258.c
> @@ -23,7 +23,7 @@
>  #define IMX258_CHIP_ID			0x0258
>  
>  /* V_TIMING internal */
> -#define IMX258_VTS_30FPS		0x0c98
> +#define IMX258_VTS_30FPS		0x0c50
>  #define IMX258_VTS_30FPS_2K		0x0638
>  #define IMX258_VTS_30FPS_VGA		0x034c
>  #define IMX258_VTS_MAX			0xffff

-- 
Regards,

Laurent Pinchart
