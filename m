Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51C54221215
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2020 18:17:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725854AbgGOQRE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jul 2020 12:17:04 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33506 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725770AbgGOQRE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jul 2020 12:17:04 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C1612564;
        Wed, 15 Jul 2020 18:17:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594829821;
        bh=IomH7o8rac3NGmFDKq1XchQn1ckZPiqly9xWhwp/YxU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jaUQqOIp4sYgb5+PK2ECSVB6gHmIaFhcSOyjNOzGVkTcMGoxDBN4GFcOHGYUoLEjP
         s+zYYO6jRFaImebUx8AWRf8RrYYXW27cFtVEzyEXmMPlhc7UTyGLTPgm1pdNSeoXhh
         kE5d5JEXRS5csWu5w1LJvfqm5M2cIciiNaUA8XnY=
Date:   Wed, 15 Jul 2020 19:16:47 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Vishal Sagar <vishal.sagar@xilinx.com>
Cc:     hyunk@xilinx.com, hverkuil@xs4all.nl, mchehab@kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com, michals@xilinx.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        joe@perches.com, sandipk@xilinx.com, dineshk@xilinx.com
Subject: Re: [PATCH v3 1/3] v4l2-dv-timings: Add timings for 1920x1080P48 and
 4KP48
Message-ID: <20200715161647.GD6144@pendragon.ideasonboard.com>
References: <20200618053304.14551-1-vishal.sagar@xilinx.com>
 <20200618053304.14551-2-vishal.sagar@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200618053304.14551-2-vishal.sagar@xilinx.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Vishal,

Thank you for the patch.

On Thu, Jun 18, 2020 at 11:03:02AM +0530, Vishal Sagar wrote:
> Add the timing entry for 1920x1080p48, 3840x2160p48 and 4096x2160p48
> from CTA-861-G.
> 1920x1080p48 is VIC 111.
> 3840x2160P48 is VIC 114.
> 4096x2160P48 is VIC 115.
> 
> Signed-off-by: Vishal Sagar <vishal.sagar@xilinx.com>
> ---
> v3
> - Added for first time
> 
>  include/uapi/linux/v4l2-dv-timings.h | 31 +++++++++++++++++++++++++++-
>  1 file changed, 30 insertions(+), 1 deletion(-)
> 
> diff --git a/include/uapi/linux/v4l2-dv-timings.h b/include/uapi/linux/v4l2-dv-timings.h
> index b52b67c62562..6ceaa7841923 100644
> --- a/include/uapi/linux/v4l2-dv-timings.h
> +++ b/include/uapi/linux/v4l2-dv-timings.h
> @@ -167,6 +167,16 @@
>  		V4L2_DV_FL_HAS_CEA861_VIC, { 0, 0 }, 20) \
>  }
>  
> +#define V4L2_DV_BT_CEA_1920X1080P48 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(1920, 1080, 0, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		148500000, 638, 44, 148, 4, 5, 36, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_CAN_REDUCE_FPS | V4L2_DV_FL_IS_CE_VIDEO | \
> +		V4L2_DV_FL_HAS_CEA861_VIC, { 0, 0 }, 111) \
> +}
> +
>  #define V4L2_DV_BT_CEA_1920X1080P50 { \
>  	.type = V4L2_DV_BT_656_1120, \
>  	V4L2_INIT_BT_TIMINGS(1920, 1080, 0, \
> @@ -229,6 +239,16 @@
>  		{ 0, 0 }, 95, 1) \
>  }
>  
> +#define V4L2_DV_BT_CEA_3840X2160P48 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(3840, 2160, 0, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		594000000, 1276, 88, 296, 8, 10, 72, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_CAN_REDUCE_FPS | V4L2_DV_FL_IS_CE_VIDEO | \
> +		V4L2_DV_FL_HAS_CEA861_VIC, { 0, 0 }, 114) \
> +}
> +
>  #define V4L2_DV_BT_CEA_3840X2160P50 { \
>  	.type = V4L2_DV_BT_656_1120, \
>  	V4L2_INIT_BT_TIMINGS(3840, 2160, 0, \
> @@ -278,6 +298,16 @@
>  		V4L2_DV_FL_HAS_CEA861_VIC, { 0, 0 }, 100) \
>  }
>  
> +#define V4L2_DV_BT_CEA_4096X2160P48 { \
> +	.type = V4L2_DV_BT_656_1120, \
> +	V4L2_INIT_BT_TIMINGS(4096, 2160, 0, \
> +		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
> +		594000000, 1020, 88, 296, 8, 10, 72, 0, 0, 0, \
> +		V4L2_DV_BT_STD_CEA861, \
> +		V4L2_DV_FL_CAN_REDUCE_FPS | V4L2_DV_FL_IS_CE_VIDEO | \
> +		V4L2_DV_FL_HAS_CEA861_VIC, { 0, 0 }, 115) \
> +}
> +
>  #define V4L2_DV_BT_CEA_4096X2160P50 { \
>  	.type = V4L2_DV_BT_656_1120, \
>  	V4L2_INIT_BT_TIMINGS(4096, 2160, 0, \
> @@ -297,7 +327,6 @@
>  		V4L2_DV_FL_HAS_CEA861_VIC, { 0, 0 }, 102) \
>  }
>  
> -

This seems to be an unrelated change. Apart from that,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  /* VESA Discrete Monitor Timings as per version 1.0, revision 12 */
>  
>  #define V4L2_DV_BT_DMT_640X350P85 { \

-- 
Regards,

Laurent Pinchart
