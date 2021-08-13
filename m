Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 393DC3EAEAC
	for <lists+linux-media@lfdr.de>; Fri, 13 Aug 2021 04:43:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238396AbhHMCnw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Aug 2021 22:43:52 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:42228 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238357AbhHMCnw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Aug 2021 22:43:52 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 21A27EE;
        Fri, 13 Aug 2021 04:43:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1628822605;
        bh=2WH2CsDXW0GJadkI7XCG3tVTr8MDTCSSKZC5A6X+rBg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BNkFLlDJWHYoPnelhw3a44wwC3+nFS9cWAIjQI5hA/Ipr3dXdhunSvmVu9KVBq1YP
         k7WcHSWsHQP23ZBGG5tyLSVpi+NsMBEP4FkZJqrxMVICdX4r2OKrrSjASIxxX27TNO
         VdRjEeV9YKjeHeNLbofb3JxQ/64HuhSP6nW4Hngo=
Date:   Fri, 13 Aug 2021 05:43:21 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     David Plowman <david.plowman@raspberrypi.com>
Cc:     linux-media@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>, sakari.ailus@iki.fi,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v5 1/2] media: v4l2-ctrls: Add V4L2_CID_NOTIFY_GAINS
 control
Message-ID: <YRXcSZgqbSb+Uvgk@pendragon.ideasonboard.com>
References: <20210810093811.7205-1-david.plowman@raspberrypi.com>
 <20210810093811.7205-2-david.plowman@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210810093811.7205-2-david.plowman@raspberrypi.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi David,

Thank you for the patch.

On Tue, Aug 10, 2021 at 10:38:10AM +0100, David Plowman wrote:
> We add a new control V4L2_CID_NOTIFY_GAINS which allows the sensor to
> be notified what gains will be applied to the different colour
> channels by subsequent processing (such as by an ISP), even though the
> sensor will not apply any of these gains itself.
> 
> For Bayer sensors this will be an array control taking 4 values which
> are the 4 gains arranged in the fixed order B, Gb, Gr and R,
> irrespective of the exact Bayer order of the sensor itself. The use of
> an array makes it straightforward to extend this control to non-Bayer
> sensors (for example, sensors with an RGBW pattern) in future.
> 
> The units are in all cases linear with the default value indicating a
> gain of exactly 1. For example, if the default value were reported as
> 128 then the value 256 would represent a gain of exactly 2.
> 
> Signed-off-by: David Plowman <david.plowman@raspberrypi.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/v4l2-core/v4l2-ctrls-defs.c | 1 +
>  include/uapi/linux/v4l2-controls.h        | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> index 421300e13a41..f87053c83249 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> @@ -1107,6 +1107,7 @@ const char *v4l2_ctrl_get_name(u32 id)
>  	case V4L2_CID_TEST_PATTERN_GREENR:	return "Green (Red) Pixel Value";
>  	case V4L2_CID_TEST_PATTERN_BLUE:	return "Blue Pixel Value";
>  	case V4L2_CID_TEST_PATTERN_GREENB:	return "Green (Blue) Pixel Value";
> +	case V4L2_CID_NOTIFY_GAINS:		return "Notify Gains";
>  
>  	/* Image processing controls */
>  	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index 5532b5f68493..133e20444939 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -1118,6 +1118,7 @@ enum v4l2_jpeg_chroma_subsampling {
>  #define V4L2_CID_TEST_PATTERN_BLUE		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 6)
>  #define V4L2_CID_TEST_PATTERN_GREENB		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 7)
>  #define V4L2_CID_UNIT_CELL_SIZE			(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 8)
> +#define V4L2_CID_NOTIFY_GAINS			(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 9)
>  
>  
>  /* Image processing controls */

-- 
Regards,

Laurent Pinchart
