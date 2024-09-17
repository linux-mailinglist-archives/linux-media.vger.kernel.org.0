Return-Path: <linux-media+bounces-18342-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B4B97B1A9
	for <lists+linux-media@lfdr.de>; Tue, 17 Sep 2024 16:58:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F33821C2214E
	for <lists+linux-media@lfdr.de>; Tue, 17 Sep 2024 14:58:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71571178397;
	Tue, 17 Sep 2024 14:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="MXfbPE/8"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65DCA20323
	for <linux-media@vger.kernel.org>; Tue, 17 Sep 2024 14:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726585092; cv=none; b=ca/HrVOH8WzZuPFSJY6PnDUZN8iob4o2GfVwn5OT2OGc4DQCludb/0QR7anI9AhEM1aVDtRmO4sLems7dxud4Dsc+VK3G091CVu1uMrCNR59npav/32i/j7IX/3A1V+FUaGAMmXVGCooohkYg/lB5FyiNnrsA+c/yZDOcztCgCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726585092; c=relaxed/simple;
	bh=iMoTVq0JI3OmT3XtyKkZhFWMzF+C7ahniQMQczAf7cc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rGCFTQW1Cq9ide3gByzmYQF/B6l/LKGnkkhsgOikBCCPvJyY26BkSHJWCy6SS6ryjZepN29fswLAE1mWjJutzCnkZKKxoK6A6sgrgNU2u+p/gJt71mDj9nWxSmQoeDDXtGTSlcG8wIEty66AhozFNEi5RbkRFc1FMMQr44PM/yI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=MXfbPE/8; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (62-46-121-59.adsl.highway.telekom.at [62.46.121.59])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2041D514;
	Tue, 17 Sep 2024 16:56:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1726585008;
	bh=iMoTVq0JI3OmT3XtyKkZhFWMzF+C7ahniQMQczAf7cc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MXfbPE/88BgSU5AiDKJ+ED7SLLSPVAIkHlvTqH5H/mQFRzojgKAGsqmpkPPdcCjNF
	 BYqCjmBwvNGXOFa3TJhj7e2bl8SX3G9Wr+Q2yTeALDD03mjSB0SbLbx/FoNuEPXFgY
	 uAXfuYaZHaEpCNzvECx2qtI3DzINj0x91jHw9dkI=
Date: Tue, 17 Sep 2024 17:57:35 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	Alain Volmat <alain.volmat@foss.st.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, hverkuil@xs4all.nl
Subject: Re: [PATCH 2/2] media: Documentation: Update
 {enable,disable}_streams documentation
Message-ID: <20240917145735.GE17350@pendragon.ideasonboard.com>
References: <20240917124345.16681-1-sakari.ailus@linux.intel.com>
 <20240917124345.16681-2-sakari.ailus@linux.intel.com>
 <20240917130047.GC17350@pendragon.ideasonboard.com>
 <61a0d763-2a6f-48f7-9439-3cc8102cb803@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <61a0d763-2a6f-48f7-9439-3cc8102cb803@ideasonboard.com>

On Tue, Sep 17, 2024 at 05:16:25PM +0300, Tomi Valkeinen wrote:
> On 17/09/2024 16:00, Laurent Pinchart wrote:
> > On Tue, Sep 17, 2024 at 03:43:45PM +0300, Sakari Ailus wrote:
> >> Document the expected {enable,disable}_streams callback behaviour for
> >> drivers that are stream-unaware i.e. don't specify the
> >> V4L2_SUBDEV_CAP_STREAMS sub-device capability flat. In this specific case,
> >> the mask argument can be ignored.
> > 
> > Wouldn't it be better to use BIT(0) in that case to simplifiy
> > interoperability with stream-aware devices ?
> 
> The caller has to set BIT(0), but I think here the documentation is 
> about the callee.
> 
> If the driver is not stream aware and implements the callbacks, it will 
> get BIT(0) as the mask parameter (do we enforce this?), but as there's 
> nothing it can do with the parameter it "does not need to be concerned 
> with the mask argument".

Right. I had misunderstood the patch.

> >> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> >> ---
> >>   include/media/v4l2-subdev.h | 8 ++++++++
> >>   1 file changed, 8 insertions(+)
> >>
> >> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> >> index 3cc6b4a5935f..67a6e6ec58b8 100644
> >> --- a/include/media/v4l2-subdev.h
> >> +++ b/include/media/v4l2-subdev.h
> >> @@ -834,11 +834,19 @@ struct v4l2_subdev_state {
> >>    *	v4l2_subdev_init_finalize() at initialization time). Do not call
> >>    *	directly, use v4l2_subdev_enable_streams() instead.
> >>    *
> >> + *	Drivers that support only a single stream without setting the
> >> + *	V4L2_SUBDEV_CAP_STREAMS sub-device capatility flag do not need to

s/capatility/capability/

Same below.

> >> + *	be concerned with the mask argument.

How about "can ignore the mask argument" instead ? I interpreted as "not
need to be concerned with" from the point of view of the caller.

> >> + *
> >>    * @disable_streams: Disable the streams defined in streams_mask on the given
> >>    *	source pad. Subdevs that implement this operation must use the active
> >>    *	state management provided by the subdev core (enabled through a call to
> >>    *	v4l2_subdev_init_finalize() at initialization time). Do not call
> >>    *	directly, use v4l2_subdev_disable_streams() instead.
> >> + *
> >> + *	Drivers that support only a single stream without setting the
> >> + *	V4L2_SUBDEV_CAP_STREAMS sub-device capatility flag do not need to
> >> + *	be concerned with the mask argument.
> >>    */
> >>   struct v4l2_subdev_pad_ops {
> >>   	int (*enum_mbus_code)(struct v4l2_subdev *sd,

-- 
Regards,

Laurent Pinchart

