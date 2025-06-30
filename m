Return-Path: <linux-media+bounces-36262-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3DCAED82D
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 11:08:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6878C3A4259
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 09:07:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78CF0238C20;
	Mon, 30 Jun 2025 09:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Akq67TBd"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0BC2253AB
	for <linux-media@vger.kernel.org>; Mon, 30 Jun 2025 09:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751274493; cv=none; b=SmUGqjup4hsVghLfwEz6n6nL5/xIOSD048BVrs75bMYyRb0rvXx/lhVuAvHWWPf6UOIQkPZO+geODFGvh1Q28nvX8w7rqS+IUvd+yyRE7FGIg91pWffODVmF9qy+21R6C4fDen/p5bHR5QHrOEuSEPHAfFR2OKTO7eEwVVhbj+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751274493; c=relaxed/simple;
	bh=zRwXR4RJFJ6asTJMJUXRdykld+FsZxdQ6zxnfIBNbx8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iw07bBmFYrQNHX4vRBWImksVwK20BybtOE4UrLFxCDPziJIK5N9Yt3jAMNuGkqTFu5uHbNZpVpiFjjd/Dzc+VPLhIj/4eqL+Mx8NHxQPSr/P9+0yjMP/EBtDRAB1lMEQdy1iThJXAvoGbWCqjIZUWlqAun5C3gHYfu+dvcarnJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Akq67TBd; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 233C2C75;
	Mon, 30 Jun 2025 11:07:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751274469;
	bh=zRwXR4RJFJ6asTJMJUXRdykld+FsZxdQ6zxnfIBNbx8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Akq67TBd5ZZULNnjEdItFqdLMZ1l5x0JDO8ktpUTY14b/QFfGiFtELGkJc0J1gr01
	 /Jstdp06bFB54KE+y9LKqk/e3Cimcn+lxsFhbUjhdP32Znnf9A29VnyxVHsDMszUSk
	 GxxnL3ppJ0KAzxv4IrdZByduO8JaNa2G0GqHCd3c=
Date: Mon, 30 Jun 2025 12:07:45 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dan Scally <dan.scally@ideasonboard.com>
Cc: linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	jacopo.mondi@ideasonboard.com, Hans Verkuil <hverkuil@xs4all.nl>,
	Daniel Scally <dan.scally+renesas@ideasonboard.com>
Subject: Re: [PATCH v6 5/6] media: rzg2l-cru: Support multiple mbus codes per
 pixel format
Message-ID: <20250630090745.GD24861@pendragon.ideasonboard.com>
References: <20250625-rzg2l-cru-v6-0-a9099ed26c14@ideasonboard.com>
 <20250625-rzg2l-cru-v6-5-a9099ed26c14@ideasonboard.com>
 <20250629234531.GA24641@pendragon.ideasonboard.com>
 <f19463f3-d74c-49b7-8f96-d862f6bfebdf@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f19463f3-d74c-49b7-8f96-d862f6bfebdf@ideasonboard.com>

On Mon, Jun 30, 2025 at 09:49:55AM +0100, Daniel Scally wrote:
> On 30/06/2025 00:45, Laurent Pinchart wrote:
> > On Wed, Jun 25, 2025 at 10:20:31AM +0100, Daniel Scally wrote:
> >> From: Daniel Scally <dan.scally+renesas@ideasonboard.com>
> >>
> >> As a preliminary step for supporting the CRU pixel formats, extend
> >> the driver such that multiple media bus codes can support each of
> >> the output pixel formats.
> >>
> >> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> >> Signed-off-by: Daniel Scally <dan.scally+renesas@ideasonboard.com>
> >> ---
> >> Changes in v5:
> >>
> >> 	- None
> >>
> >> Changes in v4:
> >>
> >> 	- None
> >>
> >> Changes in v3:
> >>
> >> 	- New patch due to changes to patch 1
> >> ---
> >>   .../media/platform/renesas/rzg2l-cru/rzg2l-cru.h   |  8 ++-
> >>   .../media/platform/renesas/rzg2l-cru/rzg2l-ip.c    | 67 +++++++++++++++++-----
> >>   .../media/platform/renesas/rzg2l-cru/rzg2l-video.c |  2 +-
> >>   3 files changed, 61 insertions(+), 16 deletions(-)
> >>
> >> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> >> index 8d74bdfae7c854f8f4c9c82303b455ef8c6d5db3..49b11d0b814850042d1b3ca3b72725d0220c2987 100644
> >> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> >> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> >> @@ -71,7 +71,11 @@ struct rzg2l_cru_ip {
> >>    * @yuv: Flag to indicate whether the format is YUV-based.
> >>    */
> >>   struct rzg2l_cru_ip_format {
> >> -	u32 code;
> >> +	/*
> >> +	 * RAW output formats might be produced by RAW media codes with any one
> >> +	 * of the 4 common bayer patterns.
> >> +	 */
> >> +	u32 codes[4];
> > It looks like you forgot to update the documentation.
> 
> I'm sorry, I'm confused; I can see that I forgot to update the references to the pixel formats in 
> patch 1, but I can't see what Documentation needs updating for this patch.

You're modifying the structure, and there's a kerneldoc block
documenting it right above.

> >   Please make sure
> > to build documentation when submitting a patch series.
> >
> > You can send a v6.1 of this patch as a reply, no need to post a full v7.
> 
> Ack
> 
> >>   	u32 datatype;
> >>   	u32 format;
> >>   	u32 icndmr;
> >> @@ -190,6 +194,8 @@ struct v4l2_mbus_framefmt *rzg2l_cru_ip_get_src_fmt(struct rzg2l_cru_dev *cru);
> >>   const struct rzg2l_cru_ip_format *rzg2l_cru_ip_code_to_fmt(unsigned int code);
> >>   const struct rzg2l_cru_ip_format *rzg2l_cru_ip_format_to_fmt(u32 format);
> >>   const struct rzg2l_cru_ip_format *rzg2l_cru_ip_index_to_fmt(u32 index);
> >> +bool rzg2l_cru_ip_fmt_supports_mbus_code(const struct rzg2l_cru_ip_format *fmt,
> >> +					 unsigned int code);
> >>   
> >>   void rzg2l_cru_enable_interrupts(struct rzg2l_cru_dev *cru);
> >>   void rzg2l_cru_disable_interrupts(struct rzg2l_cru_dev *cru);
> >> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
> >> index 15fc1028082add27ad3d6fa9e1314b6240ff0d4e..fbbcdb96c4570baf07cc9685c2fc847fb489df89 100644
> >> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
> >> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
> >> @@ -13,35 +13,45 @@
> >>   
> >>   static const struct rzg2l_cru_ip_format rzg2l_cru_ip_formats[] = {
> >>   	{
> >> -		.code = MEDIA_BUS_FMT_UYVY8_1X16,
> >> +		.codes = {
> >> +			MEDIA_BUS_FMT_UYVY8_1X16,
> >> +		},
> >>   		.datatype = MIPI_CSI2_DT_YUV422_8B,
> >>   		.format = V4L2_PIX_FMT_UYVY,
> >>   		.icndmr = ICnDMR_YCMODE_UYVY,
> >>   		.yuv = true,
> >>   	},
> >>   	{
> >> -		.code = MEDIA_BUS_FMT_SBGGR8_1X8,
> >> +		.codes = {
> >> +			MEDIA_BUS_FMT_SBGGR8_1X8,
> >> +		},
> >>   		.format = V4L2_PIX_FMT_SBGGR8,
> >>   		.datatype = MIPI_CSI2_DT_RAW8,
> >>   		.icndmr = 0,
> >>   		.yuv = false,
> >>   	},
> >>   	{
> >> -		.code = MEDIA_BUS_FMT_SGBRG8_1X8,
> >> +		.codes = {
> >> +			MEDIA_BUS_FMT_SGBRG8_1X8,
> >> +		},
> >>   		.format = V4L2_PIX_FMT_SGBRG8,
> >>   		.datatype = MIPI_CSI2_DT_RAW8,
> >>   		.icndmr = 0,
> >>   		.yuv = false,
> >>   	},
> >>   	{
> >> -		.code = MEDIA_BUS_FMT_SGRBG8_1X8,
> >> +		.codes = {
> >> +			MEDIA_BUS_FMT_SGRBG8_1X8,
> >> +		},
> >>   		.format = V4L2_PIX_FMT_SGRBG8,
> >>   		.datatype = MIPI_CSI2_DT_RAW8,
> >>   		.icndmr = 0,
> >>   		.yuv = false,
> >>   	},
> >>   	{
> >> -		.code = MEDIA_BUS_FMT_SRGGB8_1X8,
> >> +		.codes = {
> >> +			MEDIA_BUS_FMT_SRGGB8_1X8,
> >> +		},
> >>   		.format = V4L2_PIX_FMT_SRGGB8,
> >>   		.datatype = MIPI_CSI2_DT_RAW8,
> >>   		.icndmr = 0,
> >> @@ -51,11 +61,14 @@ static const struct rzg2l_cru_ip_format rzg2l_cru_ip_formats[] = {
> >>   
> >>   const struct rzg2l_cru_ip_format *rzg2l_cru_ip_code_to_fmt(unsigned int code)
> >>   {
> >> -	unsigned int i;
> >> +	unsigned int i, j;
> >>   
> >> -	for (i = 0; i < ARRAY_SIZE(rzg2l_cru_ip_formats); i++)
> >> -		if (rzg2l_cru_ip_formats[i].code == code)
> >> -			return &rzg2l_cru_ip_formats[i];
> >> +	for (i = 0; i < ARRAY_SIZE(rzg2l_cru_ip_formats); i++) {
> >> +		for (j = 0; j < ARRAY_SIZE(rzg2l_cru_ip_formats[i].codes); j++) {
> >> +			if (rzg2l_cru_ip_formats[i].codes[j] == code)
> >> +				return &rzg2l_cru_ip_formats[i];
> >> +		}
> >> +	}
> >>   
> >>   	return NULL;
> >>   }
> >> @@ -80,6 +93,17 @@ const struct rzg2l_cru_ip_format *rzg2l_cru_ip_index_to_fmt(u32 index)
> >>   	return &rzg2l_cru_ip_formats[index];
> >>   }
> >>   
> >> +bool rzg2l_cru_ip_fmt_supports_mbus_code(const struct rzg2l_cru_ip_format *fmt,
> >> +					 unsigned int code)
> >> +{
> >> +	unsigned int i;
> >> +
> >> +	for (i = 0; i < ARRAY_SIZE(fmt->codes); i++)
> >> +		if (fmt->codes[i] == code)
> >> +			return true;
> >> +
> >> +	return false;
> >> +}
> >>   struct v4l2_mbus_framefmt *rzg2l_cru_ip_get_src_fmt(struct rzg2l_cru_dev *cru)
> >>   {
> >>   	struct v4l2_subdev_state *state;
> >> @@ -157,7 +181,7 @@ static int rzg2l_cru_ip_set_format(struct v4l2_subdev *sd,
> >>   	sink_format = v4l2_subdev_state_get_format(state, fmt->pad);
> >>   
> >>   	if (!rzg2l_cru_ip_code_to_fmt(fmt->format.code))
> >> -		sink_format->code = rzg2l_cru_ip_formats[0].code;
> >> +		sink_format->code = rzg2l_cru_ip_formats[0].codes[0];
> >>   	else
> >>   		sink_format->code = fmt->format.code;
> >>   
> >> @@ -183,11 +207,26 @@ static int rzg2l_cru_ip_enum_mbus_code(struct v4l2_subdev *sd,
> >>   				       struct v4l2_subdev_state *state,
> >>   				       struct v4l2_subdev_mbus_code_enum *code)
> >>   {
> >> -	if (code->index >= ARRAY_SIZE(rzg2l_cru_ip_formats))
> >> -		return -EINVAL;
> >> +	unsigned int index = code->index;
> >> +	unsigned int i, j;
> >>   
> >> -	code->code = rzg2l_cru_ip_formats[code->index].code;
> >> -	return 0;
> >> +	for (i = 0; i < ARRAY_SIZE(rzg2l_cru_ip_formats); i++) {
> >> +		const struct rzg2l_cru_ip_format *fmt = &rzg2l_cru_ip_formats[i];
> >> +
> >> +		for (j = 0; j < ARRAY_SIZE(fmt->codes); j++) {
> >> +			if (!fmt->codes[j])
> >> +				continue;
> >> +
> >> +			if (!index) {
> >> +				code->code = fmt->codes[j];
> >> +				return 0;
> >> +			}
> >> +
> >> +			index--;
> >> +		}
> >> +	}
> >> +
> >> +	return -EINVAL;
> >>   }
> >>   
> >>   static int rzg2l_cru_ip_enum_frame_size(struct v4l2_subdev *sd,
> >> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> >> index 650a23f7b5bd61ee035dd35d1754c5d9b5e614f6..8e83eb5ed5c32e1ee1a8355dc6144eb18ca598cf 100644
> >> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> >> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> >> @@ -1147,7 +1147,7 @@ static int rzg2l_cru_video_link_validate(struct media_link *link)
> >>   	if (fmt.format.width != cru->format.width ||
> >>   	    fmt.format.height != cru->format.height ||
> >>   	    fmt.format.field != cru->format.field ||
> >> -	    video_fmt->code != fmt.format.code)
> >> +	    !rzg2l_cru_ip_fmt_supports_mbus_code(video_fmt, fmt.format.code))
> >>   		return -EPIPE;
> >>   
> >>   	return 0;

-- 
Regards,

Laurent Pinchart

