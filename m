Return-Path: <linux-media+bounces-41445-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B56E4B3E80D
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 17:00:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 63A283A1BE1
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 14:59:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DC27340DB5;
	Mon,  1 Sep 2025 14:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fPi7SPyI"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D92334372
	for <linux-media@vger.kernel.org>; Mon,  1 Sep 2025 14:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756738791; cv=none; b=H8QZhCXx0gBzbNIo2LimscOoKSHAYvz/8wTHsYuNtqCZwWAnSt3rJAze8aXAC0WfSMdfjuipvw11QP2H6FVBU7GcmyD8DLzBK8JuFabHXVxVAp8rSymGF1qrTPriLw98BjoPn/TSgBcnh1gBfpIk0wnzv32kbbI7lLZi4aZ1cmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756738791; c=relaxed/simple;
	bh=IRQUeBVB7M4k02c7Nj+tT8w1E94+iIQs17zEouTbt1o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q3aQ7+GxXpHEFMiyaEHpSjWvtO+JVkw83JZi2qo7xdxwX86oKGKFdRZ6oWHwhUSW1Zs7yKwNDhT+29iCdgYlni7Uerhi+xNkjIxd/VUD9v0oGr5Ey/wGWXCISa+RThQzjI8DEkN1GYu30Hj7kNhIPORyQteOm0AcaFHTR6ICgbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=fPi7SPyI; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-63-95.net.vodafone.it [5.90.63.95])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3B3F0D77;
	Mon,  1 Sep 2025 16:58:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756738719;
	bh=IRQUeBVB7M4k02c7Nj+tT8w1E94+iIQs17zEouTbt1o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fPi7SPyIV6R1EpJI/BKyiaKN4TbEbdo173QMHsv5k9vIYzQr9UZV8admHKFI2D5s2
	 GHhCOSX41DViTSSO6gqfRo9oGTmTKBi1zXifEZkYg9hNSEeSW8eES/bLiIgEavajce
	 zcfN369X2WV6OVTadazwElvTBWkFjBcmy2aaXSUY=
Date: Mon, 1 Sep 2025 16:59:42 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl, 
	laurent.pinchart@ideasonboard.com, Prabhakar <prabhakar.csengg@gmail.com>, 
	Kate Hsuan <hpa@redhat.com>, Alexander Shiyan <eagle.alexander923@gmail.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Tommaso Merciai <tomm.merciai@gmail.com>, 
	Umang Jain <umang.jain@ideasonboard.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
	Julien Massot <julien.massot@collabora.com>, Naushir Patuck <naush@raspberrypi.com>, 
	"Yan, Dongcheng" <dongcheng.yan@intel.com>, "Cao, Bingbu" <bingbu.cao@intel.com>, 
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>, "Wang, Hongju" <hongju.wang@intel.com>, 
	Stefan Klug <stefan.klug@ideasonboard.com>, Mirela Rabulea <mirela.rabulea@nxp.com>, 
	=?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>, Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>, 
	Mehdi Djait <mehdi.djait@linux.intel.com>, Ricardo Ribalda Delgado <ribalda@kernel.org>, 
	Hans de Goede <hdegoede@redhat.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v11 23/66] media: Documentation: Document raw mbus codes
 and CFA for cameras
Message-ID: <5ajf3ywfraxumrcm6a6mrwgcl6koutghyivftuhbcxs3tcwi7f@6toxy2ikdkwv>
References: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
 <20250825095107.1332313-24-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250825095107.1332313-24-sakari.ailus@linux.intel.com>

Hi Sakari

On Mon, Aug 25, 2025 at 12:50:24PM +0300, Sakari Ailus wrote:
> Document the use of raw mbus codes for camera sensors and how the
> V4L2_CID_COLOR_PATTERN and V4L2_CID_COLOR_PATTERN_FLIP controls are used
> to convey the color filter array pattern on UAPI.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  .../userspace-api/media/drivers/camera-sensor.rst   | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/Documentation/userspace-api/media/drivers/camera-sensor.rst b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> index 75fd9166383f..a8e0e4accbc9 100644
> --- a/Documentation/userspace-api/media/drivers/camera-sensor.rst
> +++ b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> @@ -39,6 +39,19 @@ format set on a source pad at the end of the device's internal pipeline.
>
>  Most sensor drivers are implemented this way.
>
> +V4L2_CID_COLOR_PATTERN, raw mbus formats, flipping and cropping
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This will appear as a subsection of

"2.1. Sensor internal pipeline configuration"

With

2.1.1. Freely configurable camera sensor drivers
2.1.2. Register list-based drivers
2.1.3. V4L2_CID_COLOR_PATTERN, raw mbus formats, flipping and cropping

I don't know if it's intentional or not, but I would rather make out
of this a paragraph of its own, as it will be done for

2.3. Rotation, orientation and flipping
2.4. Binning and sub-sampling

etc

> +
> +For raw image data originating from camera sensors, specific :ref:`raw mbus
> +codes MEDIA_BUS_FMT_RAW_x (where 'x' is the bit depth)
> +<v4l2-mbus-pixelcode-generic-raw>` are used as Color Filter Array (CFA) agnostic
> +raw formats. The ``V4L2_CID_COLOR_PATTERN <image-source-control-color-pattern>``

This and the below ``V4L2_CID_COLOR_PATTERN_FLIP ...`` links are
broken.

Shuould this be

:ref:`V4L2_CID_COLOR_PATTERN <image-source-control-color-pattern>`

> +control in the same sub-device defines the native color pattern of the
> +device. Flipping may further affect the readout pattern as indicated by the
> +``V4L2_CID_COLOR_PATTERN_FLIP <image-source-control-color-pattern-flip>``

and this

:ref:`V4L2_CID_COLOR_PATTERN_FLIP <image-source-control-color-pattern-flip>`

instead ?

> +control. Further on, cropping also has an effect on the pattern if cropped
> +amount is not divisible by the size of the pattern, horizontally and vertically.
> +
>  Frame interval configuration
>  ----------------------------
>
> --
> 2.47.2
>
>

