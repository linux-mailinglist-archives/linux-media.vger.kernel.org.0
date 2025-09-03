Return-Path: <linux-media+bounces-41720-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0643EB42585
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 17:33:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1DA1EB60342
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 15:31:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B62023D7E3;
	Wed,  3 Sep 2025 15:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="svB6dyCD"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62850239562
	for <linux-media@vger.kernel.org>; Wed,  3 Sep 2025 15:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756913529; cv=none; b=VpAXVfYMXPrM0HMAwSBLHG+gIQ/pzi+zPSZ935JWiMDERFe3MYpcmpbL7Ego6hF5iI4LMQKw+L3O34WebnNU9tRO6vp4dlmloShYqb5o51u6RXj9hlvwV/kgzmlld4pwRMaEijWRHsqKQUlmX5G2l1y6tMH6UEygvau0Gt2aK00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756913529; c=relaxed/simple;
	bh=Boghmkz4fh77qA1Qdn0wNzYuMjtuucJ/atjl/0oh7x4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gomHpGZJ3s8jJv3hhq6zR6Rcvz8Wvr++GkG+KbmMXy4T/LKcm33+DnaVWMIJJ4oL57yGvKBNTH1Vx5aznhh3SscZjSmBNzDDC9OGI8JCqvSwybAsb1Fs07phwfti0sZmB4X6qGADc16am/A+YOJ7d31iSp5qT1a+8klcyZholwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=svB6dyCD; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (230.215-178-91.adsl-dyn.isp.belgacom.be [91.178.215.230])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id AA5F88CB;
	Wed,  3 Sep 2025 17:30:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756913454;
	bh=Boghmkz4fh77qA1Qdn0wNzYuMjtuucJ/atjl/0oh7x4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=svB6dyCDoQ7Oq0lX3ZuwJsxhW2chwaybxyxlIndlzxGODOhWyvfAIY2dVCBPqkJh9
	 rbdcYCHJ0yKvFG2SfLiZ+4kC5hQs2YcfJ7YU/2DrgPFD32gA9DPGyMFGUPXfL+Kamx
	 ItOQDfMhrDzzjD122BdxozDFRV9ePL0xIHvse2d4=
Date: Wed, 3 Sep 2025 17:31:43 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	"Cao, Bingbu" <bingbu.cao@intel.com>,
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
	"Wang, Hongju" <hongju.wang@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v11 22/66] media: Documentation: Reference flipping
 controls in raw format docs
Message-ID: <20250903153143.GS3648@pendragon.ideasonboard.com>
References: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
 <20250825095107.1332313-23-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250825095107.1332313-23-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Mon, Aug 25, 2025 at 12:50:23PM +0300, Sakari Ailus wrote:
> Add a reference to the flipping related controls (V4L2_CID_HFLIP,
> V4L2_CID_VFLIP and V4L2_CID_COLOR_PATTERN_FLIP) to the generic raw format
> documentation.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Assuming we'll agree on the V4L2_CID_COLOR_PATTERN_FLIP,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  .../userspace-api/media/v4l/ext-ctrls-image-source.rst         | 2 ++
>  Documentation/userspace-api/media/v4l/subdev-formats.rst       | 3 +++
>  2 files changed, 5 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> index ef3784d1119a..3cb7ee1b0aed 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> @@ -134,6 +134,8 @@ Image Source Control IDs
>          red, green pixels.
>        - 3
>  
> +.. _image-source-control-color-pattern-flip:
> +
>  ``V4L2_CID_COLOR_PATTERN_FLIP (bitmask)``
>      Whether the horizontal or vertical flipping controls (V4L2_CID_HFLIP and
>      V4L2_CID_VFLIP) have an effect on the pixel order of the output color
> diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> index 77571adeb21e..c36cd42b09c6 100644
> --- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
> +++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> @@ -3446,6 +3446,9 @@ however the bit depth is still specific to the format.
>  
>  The colour components and the native pixel order are determined by the
>  :ref:`V4L2_CID_COLOR_PATTERN <image-source-control-color-pattern>` control.
> +Whether or not flipping controls (``V4L2_CID_HFLIP`` and ``V4L2_CID_VFLIP``)
> +affect the pattern is conveyed via the :ref:`V4L2_CID_COLOR_PATTERN_FLIP
> +<image-source-control-color-pattern-flip>` control.
>  
>  .. tabularcolumns:: |p{2.0cm}|p{4.0cm}|p{11.3cm}|
>  

-- 
Regards,

Laurent Pinchart

