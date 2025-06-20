Return-Path: <linux-media+bounces-35492-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A57E7AE1BF0
	for <lists+linux-media@lfdr.de>; Fri, 20 Jun 2025 15:19:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 409304A3D61
	for <lists+linux-media@lfdr.de>; Fri, 20 Jun 2025 13:19:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 792B328B7EC;
	Fri, 20 Jun 2025 13:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="e42qxK8j"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52CB28AAE9
	for <linux-media@vger.kernel.org>; Fri, 20 Jun 2025 13:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750425573; cv=none; b=rSE664A8ZNL+Bg82nn7UR/8McjfdZ8Uk3VosS2cUJjv3bbk9XoceGKIRtcwn+t1ZVfH6S5TGe5TKDLufeU5cHn870ErTKUuntxSoGKqyY3Ng/dNIsPMjg3IJUsMnWBNinVQDSG8jZdRXWOwh9PMAQkibGmJ6VxSYxJFwWyhrt24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750425573; c=relaxed/simple;
	bh=6kPRMAmRouDrpVFs6jNES5eV8XvKBROMpRWHrAiSAvk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CD/cRWWj/aSTyYHy+RkP2W+O/stt+Th6CLO6/KcVXA+PwC0nrRz73xSeOVA0Urcym8w/xTk11HIgNYEOvLtFdxeAFzRadpoLjO5IrckxQBaZA0upab2TTQ7QVik+eJZud1mncvJS2LC/kK1D07vP5BHB7h/9YB1H94x4/YmnmVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=e42qxK8j; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 66AE0C0B;
	Fri, 20 Jun 2025 15:19:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750425554;
	bh=6kPRMAmRouDrpVFs6jNES5eV8XvKBROMpRWHrAiSAvk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e42qxK8jtrzbqdhFSUaBl3VpjTvelv+5HmSOrBmpQtpO5RDHoypNn/8MMLLsaobmx
	 auR0X725v8h8njZpBhIft93yTg5iinVJWstgviZgkfkFecrb5CduSdxLxxA+eUoEkc
	 l7HsmX6YjeM1zmqS9Z5Nj6eOw++2w5E6oW6j9w/k=
Date: Fri, 20 Jun 2025 15:19:26 +0200
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
Subject: Re: [PATCH v10 23/64] media: Documentation: Document embedded data
 guidelines for camera sensors
Message-ID: <aetocz3q4afsfye7drpuaiyeyehxs7h4cwithmmhbhv26aaerp@ogdgfcigozz3>
References: <20250619115836.1946016-1-sakari.ailus@linux.intel.com>
 <20250619115836.1946016-24-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250619115836.1946016-24-sakari.ailus@linux.intel.com>

Hi Sakari

On Thu, Jun 19, 2025 at 02:57:55PM +0300, Sakari Ailus wrote:
> Document how embedded data support should be implemented for camera
> sensors, and when and how CCS embedded data layout should be referenced.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Julien Massot <julien.massot@collabora.com>
> ---
>  .../media/drivers/camera-sensor.rst           | 21 +++++++++++++++++++
>  1 file changed, 21 insertions(+)
>
> diff --git a/Documentation/userspace-api/media/drivers/camera-sensor.rst b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> index 9f68d24dfe0b..450e5940c6e7 100644
> --- a/Documentation/userspace-api/media/drivers/camera-sensor.rst
> +++ b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> @@ -115,3 +115,24 @@ register programming sequences shall initialize the :ref:`V4L2_CID_HFLIP
>  values programmed by the register sequences. The default values of these
>  controls shall be 0 (disabled). Especially these controls shall not be inverted,
>  independently of the sensor's mounting rotation.
> +
> +Embedded data
> +-------------
> +
> +Many sensors, mostly raw sensors, support embedded data which is used to convey
> +the sensor configuration for the captured frame back to the host. While CSI-2 is
> +the most common data interface used by such sensors, embedded data can be
> +available on other interfaces as well.
> +
> +Such sensors expose two internal sink pads (pads that have both the
> +``MEDIA_PAD_FL_SINK <MEDIA-PAD-FL-SINK>`` and ``MEDIA_PAD_FL_INTERNAL
> +<MEDIA-PAD-FL-INTERNAL>`` flags set) to model the source of the image and
> +embedded data streams. Both of these pads produces a single stream, and the
> +sub-device routes those streams to the external (source) pad. If the sub-device
> +driver supports disabling embedded data, this can be done by disabling the
> +embedded data route via the ``VIDIOC_SUBDEV_S_ROUTING`` IOCTL.
> +
> +In general, changing the embedded data layout from the driver-configured values
> +is not supported. The height of the metadata is device-specific and the width
> +is that (or less of that) of the image width, as configured on the pixel data

Maybe "the width is equal to (or less than) the one of the image data, as
configured on the pixel data stream"

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
  j


> +stream.
> --
> 2.39.5
>
>

