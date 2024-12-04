Return-Path: <linux-media+bounces-22607-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3779E38BA
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2024 12:25:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DFFEF2831C2
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2024 11:25:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C8801B2188;
	Wed,  4 Dec 2024 11:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SHZ1foGN"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909B2746E
	for <linux-media@vger.kernel.org>; Wed,  4 Dec 2024 11:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733311520; cv=none; b=AvFl55BgINjShckGjzgseJkdIQQDp1sL134SgpR8+w2DQL4R8masdKXuzo9kYq3amGiH6KC0nF1LoSfOlPJNIbGV6cfPTSr4vA0UxWk64gLjAK6axJ52vLHE1Pys4eOYKQSxNCC9MXY14w2lyCnfoGrvp8I92+ktKhBcEJ0qRIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733311520; c=relaxed/simple;
	bh=h+/nutCQMOZFGUxFYXSkX2UbsTV8VqnYYOrIBVFIhO0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uZnpFz03BW4INtDs+1fPFAVmJuKTTEC9JwWaekaTI7cjUDp8AMbzGk1OvFvTodiunWwIpnuJ2VoXgdr1GR6T9/sRlki5GOdELk1gLDahAPj/WpIGL8ucIJFbcMNNSJnaiSla0pdmqCLPkFdE4ovt0GGdzLHU1ZrHtg6Ihi86Vqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=SHZ1foGN; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E94194D4;
	Wed,  4 Dec 2024 12:24:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733311488;
	bh=h+/nutCQMOZFGUxFYXSkX2UbsTV8VqnYYOrIBVFIhO0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SHZ1foGNEvkwrQbx7raZz9BtLB8Fg+IGQ6Q1GeC8cTeu+6uLnvFQOvVvVRSKCAnjB
	 zvKfquLaw6YkkxBBQj9X2hyIVriuemt9Iqy2fEMeulVG30jXRsEjMnPkGcfp6Kt7QD
	 OEOD5YuBWOpMxyT0o4wDj/CT+NkXlXxhTh+Q11BY=
Date: Wed, 4 Dec 2024 12:25:11 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, hverkuil@xs4all.nl, 
	laurent.pinchart@ideasonboard.com, Prabhakar <prabhakar.csengg@gmail.com>, 
	Kate Hsuan <hpa@redhat.com>, Alexander Shiyan <eagle.alexander923@gmail.com>, 
	Mikhail Rudenko <mike.rudenko@gmail.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Tommaso Merciai <tomm.merciai@gmail.com>, Umang Jain <umang.jain@ideasonboard.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Julien Massot <julien.massot@collabora.com>, 
	Naushir Patuck <naush@raspberrypi.com>, "Yan, Dongcheng" <dongcheng.yan@intel.com>, 
	"Cao, Bingbu" <bingbu.cao@intel.com>, "Qiu, Tian Shu" <tian.shu.qiu@intel.com>, 
	"Wang, Hongju" <hongju.wang@intel.com>, Stefan Klug <stefan.klug@ideasonboard.com>, 
	Mirela Rabulea <mirela.rabulea@nxp.com>, =?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>, 
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>, Mehdi Djait <mehdi.djait@linux.intel.com>, 
	Ricardo Ribalda Delgado <ribalda@kernel.org>
Subject: Re: [RFC v3 5/9] media: Documentation: Add scaling and post-scaler
 crop for common raw
Message-ID: <ioomhmdxhr2wmunibh456umrczv5p2grqdvqyvq2gt5gb2wirn@m4nep4s6pbnu>
References: <20241129095142.87196-1-sakari.ailus@linux.intel.com>
 <20241129095142.87196-6-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241129095142.87196-6-sakari.ailus@linux.intel.com>

Hi Sakari
  thanks for the update

On Fri, Nov 29, 2024 at 11:51:38AM +0200, Sakari Ailus wrote:
> Document scaling and post-scaler digital crop operations for the common
> raw sensor model.
> Signedg-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  .../media/v4l/subdev-config-model.rst         | 19 +++++++++++++++----
>  1 file changed, 15 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/userspace-api/media/v4l/subdev-config-model.rst b/Documentation/userspace-api/media/v4l/subdev-config-model.rst
> index 4ddf98e3143c..1ae20800f34b 100644
> --- a/Documentation/userspace-api/media/v4l/subdev-config-model.rst
> +++ b/Documentation/userspace-api/media/v4l/subdev-config-model.rst
> @@ -119,9 +119,13 @@ The digital crop operation takes place after binning and sub-sampling. It is
>  configured by setting the ``V4L2_SEL_TGT_CROP`` rectangle on (pad, stream) pair
>  0/0. The resulting image size is further output by the sensor.

I think this last line "The resulting image size is further output by
the sensor." doesn't apply anymore now that we have [digital crop +
digital scaling + post-scaling crop].

>
> +The digital scaling operation is performed after the digital crop. It is
> +configured by setting the ``V4L2_SEL_TGT_COMPOSE`` rectangle on (pad, stream) pair
> +0/0, relative to the digital crop.
> +

"to the digital crop rectangle." maybe ?


>  The sensor's output mbus code is configured by setting the format on the (pad,
> -stream) pair 0/0. When setting the format, always use the same width and height
> -as for the digital crop setting.
> +stream) pair 0/0. The width and height fields are used to configure post-scaler
> +digital crop, affecting the right side and the bottom of the frame.
>

I would introduce the (optional) presence of an additional post-scaler
digital crop step explicitly, also I get this is kind of rare feature,
isn't it ?

-------------------------------------------------------------------------------
The digital scaling operation is performed after the digital crop. It
is configured by setting the ``V4L2_SEL_TGT_COMPOSE`` rectangle on
(pad, stream) pair 0/0, relative to the digital crop rectangle.

The sensor's output mbus code is configured by setting the format on the (pad,
stream) pair 0/0. An optional post-scaler crop step might be performed by
specifying a width and height smaller than the digital scaling
rectangle. If post-scaler cropping is not supported the format's sizes
will always match the compose rectangle sizes applied on the same 0/0
(pad, stream) pair.
-------------------------------------------------------------------------------

I didn't get when we spoke about it where the "affecting the right
side and bottom of the frame" comes from when talking about
post-scaler cropping.


>  Drivers may only support some of even none of these configurations, in which
>  case they do not expose the corresponding selection rectangles. If any selection
> @@ -179,12 +183,19 @@ Also refer to :ref:`Selection targets <v4l2-selection-targets-table>`.
>        - X
>        - Digital crop. This rectangle is relative to the ``V4L2_SEL_TGT_COMPOSE``
>          rectangle on (pad, stream) pair 1/0.
> +    * - 0/0
> +      - ``V4L2_SEL_TGT_COMPOSE``
> +      - \-
> +      - X
> +      - Scaling. This rectangle is relative to the ``V4L2_SEL_TGT_CROP``

"Digital scaling" ? or is not necessary ?

> +        rectangle on (pad, stream) pair 0/0.
>      * - 0/0
>        - Format
>        - X
>        - X
> -      - Image data source format. Always assign the width and height fields of
> -        the format to the same values than for the ``V4L2_SEL_TGT_CROP``
> +      - Image data source format and post-scaler crop. The width and height
> +        fields of the format, used to configure post-scaler crop on the right
> +        and bottom edges of the image, are related to the ``V4L2_SEL_TGT_COMPOSE``
>          rectangle on (pad, stream) pair 0/0. The media bus code reflects the
>          pixel data output of the sensor.
>      * - 0/1
> --
> 2.39.5
>
>

