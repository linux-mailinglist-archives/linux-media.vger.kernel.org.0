Return-Path: <linux-media+bounces-37824-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 92349B06A50
	for <lists+linux-media@lfdr.de>; Wed, 16 Jul 2025 02:07:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F07541A60A5E
	for <lists+linux-media@lfdr.de>; Wed, 16 Jul 2025 00:08:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76ABE2E3700;
	Wed, 16 Jul 2025 00:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SDxUo7cN"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F9D10F1;
	Wed, 16 Jul 2025 00:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752624463; cv=none; b=h4T5BlP2ab2nKRqnfmN9iipF138HnoHMysrik+xe60a9GWMC/C1+J3iiI+Cw37Aq2xZRLT85TqQBTNHOiqo9a1bUT00AmDfxGTsvWqtxn/YVudQUnWwwlPtft4dDDkIM5S8tDxyLaHk7Jvs7J740Tw7icp7Ze2+nSxULOstKvEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752624463; c=relaxed/simple;
	bh=CLdIyNYuhLKexW+LZL8Wb7UR7bMpS6UL+IQkQPkomUo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VuJscxqG2pWu9mli1lUUXUOakrxi31fEAPq30jcwhMWoxsfnvysyEMd6s8QtYr8x5PaJWJ+P2uox+FzrRhiZsDwiu0cuNGeGE2AC+atMofZeW572w1naN+giyxXOkmL6AJ/xdzJ1r/RGapT0k0N16/ijMcx6yUz9ApIO/zKOuEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=SDxUo7cN; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 550477E1;
	Wed, 16 Jul 2025 02:07:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752624427;
	bh=CLdIyNYuhLKexW+LZL8Wb7UR7bMpS6UL+IQkQPkomUo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SDxUo7cNF58az9Ey3k53Cv4TFBP0w4d+P4VRVAnkBtUqLDrbbv/PdRwGr9XO6C2hq
	 CVo2N42wHpeptD1sBl1T/ziRRfLtei05FF0tab3qxToiSZHGzmnGoMEfqzrJ/dJcaS
	 5LN6K2RajuDOK4Y+cGA8wu38KsXavahhiHgn7g9Y=
Date: Wed, 16 Jul 2025 03:07:38 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mirela Rabulea <mirela.rabulea@nxp.com>
Cc: mchehab@kernel.org, sakari.ailus@linux.intel.com,
	hverkuil-cisco@xs4all.nl, ribalda@chromium.org,
	jai.luthra@ideasonboard.com, laurentiu.palcu@nxp.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	LnxRevLi@nxp.com, julien.vuillaumier@nxp.com,
	celine.laurencin@nxp.com
Subject: Re: [RFC 2/2] Documentation: media: Describe exposure and gain
 controls for multiple captures
Message-ID: <20250716000738.GF19299@pendragon.ideasonboard.com>
References: <20250710220544.89066-1-mirela.rabulea@nxp.com>
 <20250710220544.89066-3-mirela.rabulea@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250710220544.89066-3-mirela.rabulea@nxp.com>

Hi Mirela,

Thank you for the patch.

On Fri, Jul 11, 2025 at 01:05:44AM +0300, Mirela Rabulea wrote:
> The standard controls for exposure and gains allow a
> single value, for a single capture. For sensors with HDR
> capabilities or context switching, this is not enough, so
> add new controls that allow multiple values, one for each
> capture.

One important question not addressed by this patch is how the new
controls interact with the old ones. For instance, if a sensor
implements 2-DOL, it should expose a V4L2_CID_EXPOSURE_MULTI control
with 2 elements. Should it also expose the V4L2_CID_EXPOSURE control,
when operating in SDR mode ? What should happen when both controls are
set ?

There are also sensors that implement multi-exposure with direct control
of the long exposure, and indirect control of the short exposure through
an exposure ratio. The sensors I'm working on support both, so we could
just ignore the exposure ratio, but if I recall correctly CCS allows
sensors to implement exposure ratio only without direct short exposure
control. How should we deal with that ?

Finally, I was recently wondering if it would be possible to reuse the
existing controls instead, allowing them to be either single values or
arrays. The idea would be that setting the control to a single value
(essentially ignoring it's an array) would provide the current
behaviour, while setting values for multiple elements would control the
separate exposures. I haven't checked if the control framework supports
this, or if it could be supported with minimum changes. The advantage is
that we wouldn't need to define how the new and old controls interact if
we don't introduce new controls. Hans, what do you think ?

> Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
> ---
>  .../media/v4l/ext-ctrls-image-source.rst             | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> index 71f23f131f97..6efdb58dacf5 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> @@ -92,3 +92,15 @@ Image Source Control IDs
>      representing a gain of exactly 1.0. For example, if this default value
>      is reported as being (say) 128, then a value of 192 would represent
>      a gain of exactly 1.5.
> +
> +``V4L2_CID_EXPOSURE_MULTI (__u32 array)``
> +    Same as V4L2_CID_EXPOSURE, but for multiple exposure sensors. Each
> +    element of the array holds the exposure value for one capture.
> +
> +``V4L2_CID_AGAIN_MULTI (__u32 array)``
> +    Same as V4L2_CID_ANALOGUE_GAIN, but for multiple exposure sensors. Each
> +    element of the array holds the analog gain value for one capture.
> +
> +``V4L2_CID_DGAIN_MULTI (__u32 array)``
> +    Same as V4L2_CID_DIGITAL_GAIN, but for multiple exposure sensors. Each
> +    element of the array holds the digital gain value for one capture.

-- 
Regards,

Laurent Pinchart

