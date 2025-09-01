Return-Path: <linux-media+bounces-41469-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2266EB3EC75
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 18:43:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EBAE62C0323
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 16:43:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4B833064BC;
	Mon,  1 Sep 2025 16:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ZZOrtEKy"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14FF30648E
	for <linux-media@vger.kernel.org>; Mon,  1 Sep 2025 16:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756744962; cv=none; b=kRcRXYgx1DbsRMqJOA4snK1CM8zivAo5zOoJ2GIqV+/49ec9RODei34uff0V/iNdDnNdhp7f/vmJEpFCAR+Gwek1EMQ23UQwm2PyfoMDDEEl2973d0aMZ1olWrKxliJv/7xg6twWgAjyPm6hWRqIAO/UaDHkGvYHy4QMoP7fJ2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756744962; c=relaxed/simple;
	bh=toJ7xNCswq/EGUl5PQ7LUO1H5QN11y6t+KUWuY29aNw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hcJ9ezEfQvVRxRJj8WbIzIKNOuWQvYRLj4ZiH1PH9RB3w1am2VJN+EB0nn2+9kVnxpfhQqOAoHTx93LPly18mr7YvkhnFSWKQpeimmXGempbWIVnks1zShCNbyzDukXInuHXGEHewTcdxKF6m4LV4HzFwJLCKjMtsQo0XAwT/jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ZZOrtEKy; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-63-95.net.vodafone.it [5.90.63.95])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C2283E77;
	Mon,  1 Sep 2025 18:41:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756744890;
	bh=toJ7xNCswq/EGUl5PQ7LUO1H5QN11y6t+KUWuY29aNw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZZOrtEKyl69zUJH6/mcZMgdufg1VuPv1jmAY8kOIglWEcT8fJoxgLk8EQpFzoSPu2
	 frLuZDlgbyQKbpu7ZtBe3Lru45S03DYd1lNQN+nucwYabfTJQ+VisHXvJXIvGMWdHU
	 9BNYCUTDY5MYEFhOAzr6EfiSKsGumFOZsZEqo2go=
Date: Mon, 1 Sep 2025 18:42:33 +0200
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
Subject: Re: [PATCH v11 26/66] media: Documentation: Document embedded data
 guidelines for camera sensors
Message-ID: <wsa4s2ele6nejp5jcca5ny44oerwxdnyjn2ggxu6e2x5yqlm4g@vihn6rrtdnkg>
References: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
 <20250825095107.1332313-27-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250825095107.1332313-27-sakari.ailus@linux.intel.com>

Hi Sakari

On Mon, Aug 25, 2025 at 12:50:27PM +0300, Sakari Ailus wrote:
> Document how embedded data support should be implemented for camera
> sensors, and when and how CCS embedded data layout should be referenced.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Julien Massot <julien.massot@collabora.com>
> ---
>  .../media/drivers/camera-sensor.rst           | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/Documentation/userspace-api/media/drivers/camera-sensor.rst b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> index a8e0e4accbc9..a719c6f88f11 100644
> --- a/Documentation/userspace-api/media/drivers/camera-sensor.rst
> +++ b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> @@ -117,3 +117,23 @@ register programming sequences shall initialize the :ref:`V4L2_CID_HFLIP
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
> +Embedded data support is indicated by the presence of an internal sink pad (pad
> +that has both the ``MEDIA_PAD_FL_SINK <MEDIA-PAD-FL-SINK>`` and
> +``MEDIA_PAD_FL_INTERNAL <MEDIA-PAD-FL-INTERNAL>`` flags set) with a metadata

These are rendered as verbatim text, not links

> +format to model the embedded data stream. If the sub-device driver supports
> +disabling embedded data, this can be done by disabling the embedded data route
> +via the ``VIDIOC_SUBDEV_S_ROUTING`` IOCTL.
> +
> +In general, changing the embedded data layout from the driver-configured values
> +is not supported. The height of the metadata is device-specific and the width
> +is that (or less of that) of the image width, as configured on the pixel data

s/is that (or less of that) of/is the same (or smaller) than/

reads better in my possibily broke English


> +stream.

With the links fixed
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
  j

> --
> 2.47.2
>
>

