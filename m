Return-Path: <linux-media+bounces-20046-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CCDC9AB1B1
	for <lists+linux-media@lfdr.de>; Tue, 22 Oct 2024 17:08:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C763D1F239F8
	for <lists+linux-media@lfdr.de>; Tue, 22 Oct 2024 15:08:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 056D31A00D6;
	Tue, 22 Oct 2024 15:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="gLJU0yko"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90CC113A865
	for <linux-media@vger.kernel.org>; Tue, 22 Oct 2024 15:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729609710; cv=none; b=al6t+5fZldWf5mJP46pTUNLxVjMKYGdQRWvFYu3dGZ5EZZVfIehkkQ6SK/3ALw0oYB5wWWIBToDIF/qVZGppo8I9dROZq9bQuqL79RN2n0nWNEMtbcSyJsvNrSCC0B2YmdWzgBETlHU/wsq8hwf3b6mVvHNhTvpVl1a2WKuL7jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729609710; c=relaxed/simple;
	bh=9TxBlzuq9EnvfEox6WhQcZBXtba3hd3Ty2mP+bDE7qo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NGQhFMmkrcaUjY2cKJlkqVrQ9VOSY1Jb6VSTxn+C06kCLAsead29AaRVenUwTCP5uPG2iPHWAfQhlBerRBDAP3da0XjvDldBXkKdx7lyKGbBlJ3GeUfmSGPyiRMIbrz1MxMhBjdnhQDq/kpjWAVzRuOgTa3jLwrBjfDKelOMZ6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=gLJU0yko; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7BEF43EA;
	Tue, 22 Oct 2024 17:06:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1729609598;
	bh=9TxBlzuq9EnvfEox6WhQcZBXtba3hd3Ty2mP+bDE7qo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gLJU0ykoREYPLwrd41SG40JLmNWMbufQoCUIXtQF7vtc6QUpCJX4Y6RUuDMi1bz/G
	 ePw83bftvIEdjAdl90KseCe8moPYiwLDkRa+673C7tHVdJ3Yc7bdUahCiYnsSw08IM
	 bWMJom75nfJ35yqA2i2+ffdUIA0LCySP7TnKz5no=
Date: Tue, 22 Oct 2024 17:08:21 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, hverkuil@xs4all.nl, 
	laurent.pinchart@ideasonboard.com, Prabhakar <prabhakar.csengg@gmail.com>, 
	Kate Hsuan <hpa@redhat.com>, Alexander Shiyan <eagle.alexander923@gmail.com>, 
	Mikhail Rudenko <mike.rudenko@gmail.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Tommaso Merciai <tomm.merciai@gmail.com>, Umang Jain <umang.jain@ideasonboard.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Julien Massot <julien.massot@collabora.com>, 
	Naushir Patuck <naush@raspberrypi.com>
Subject: Re: [RFC 1/4] media: Documentation: Rework embedded data
 documentation
Message-ID: <eqhifp7vendgt7qyq7uj4m2dvvwbnalfyxst4mnak6fmsevjw6@faugbizkk4ee>
References: <20241011075535.588140-1-sakari.ailus@linux.intel.com>
 <20241011075535.588140-2-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241011075535.588140-2-sakari.ailus@linux.intel.com>

Hi Sakari

On Fri, Oct 11, 2024 at 10:55:32AM +0300, Sakari Ailus wrote:
> Rework embedded data documentation by removing the reference to the pixel
> data stream. The specific documentation of the embedded data interface
> will be elsewhere.

I'm not sure how to interpret the last phrase. What specific
documentation ? The formats description ? Should this be part of the
commit message ?

>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  .../userspace-api/media/drivers/camera-sensor.rst   | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
>
> diff --git a/Documentation/userspace-api/media/drivers/camera-sensor.rst b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> index dc415b8f6c8e..d82cd803e337 100644
> --- a/Documentation/userspace-api/media/drivers/camera-sensor.rst
> +++ b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> @@ -111,13 +111,12 @@ the sensor configuration for the captured frame back to the host. While CSI-2 is
>  the most common data interface used by such sensors, embedded data can be
>  available on other interfaces as well.
>
> -Such sensors expose two internal sink pads (pads that have both the
> -``MEDIA_PAD_FL_SINK <MEDIA-PAD-FL-SINK>`` and ``MEDIA_PAD_FL_INTERNAL
> -<MEDIA-PAD-FL-INTERNAL>`` flags set) to model the source of the image and
> -embedded data streams. Both of these pads produces a single stream, and the
> -sub-device routes those streams to the external (source) pad. If the sub-device
> -driver supports disabling embedded data, this can be done by disabling the
> -embedded data route via the ``VIDIOC_SUBDEV_S_ROUTING`` IOCTL.
> +Embedded data support is indicated by an internal sink pad (pad that has both

"is indicated by the presence of an" ?

> +the ``MEDIA_PAD_FL_SINK <MEDIA-PAD-FL-SINK>`` and ``MEDIA_PAD_FL_INTERNAL
> +<MEDIA-PAD-FL-INTERNAL>`` flags set) with a metadata format to model the
> +embedded data stream. If the sub-device driver supports disabling embedded data,
> +this can be done by disabling the embedded data route via the
> +``VIDIOC_SUBDEV_S_ROUTING`` IOCTL.

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>
>  In general, changing the embedded data format from the driver-configured values
>  is not supported. The height of the metadata is device-specific and the width
> --
> 2.39.5
>
>

