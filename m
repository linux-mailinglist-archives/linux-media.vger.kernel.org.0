Return-Path: <linux-media+bounces-7344-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C90D88085C
	for <lists+linux-media@lfdr.de>; Wed, 20 Mar 2024 01:03:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A03221C22219
	for <lists+linux-media@lfdr.de>; Wed, 20 Mar 2024 00:03:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43EF3622;
	Wed, 20 Mar 2024 00:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="E0ht3dhy"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38AA8628
	for <linux-media@vger.kernel.org>; Wed, 20 Mar 2024 00:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710892986; cv=none; b=EtukpaLmgmOiZ4yCKkzDqIU2sY0HMNIvXc862qbVolcnDeuzM2jdA4SGkmZd69APDhazB/YFXAJIQTvb0ayZvLCgW8QBrg+nkt+arHxV+9KCnlzaqdbQ9OU1jXC1wN9aK/6AIqkHiGytUGqXc0fIScEi01nRpjCSD9MnX65MFLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710892986; c=relaxed/simple;
	bh=3O7IsOhJxBaSGRsNW+e7an8h22XjF6yBWgbsM7PDtgU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sVPcuB+eYf3/XkflDA9OFXpAY7yKcuhEQs0zlet6brlrXtUq9mOD+h1sNh+oCUXL6qzTvDI9C4vJidQ35TW+zLj8ouoLWnx2vf8ftj+9+pxxaUDQdvVvPNIhLufSUmF7uqjZ2eD0qOAlCV9zqlywaDmNqqEhwoRM0OS6sOObK90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=E0ht3dhy; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 89AB3B1;
	Wed, 20 Mar 2024 01:02:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1710892956;
	bh=3O7IsOhJxBaSGRsNW+e7an8h22XjF6yBWgbsM7PDtgU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E0ht3dhyN5+dMjLpqRl2szanc8EZWJuETRFP0GvsKytIrH7HY3pvOij+wNoYAO+ha
	 rlYPmnJIGGX0wXrZ9MVe3S35Po+Fj/maJHa87ADEAOIw8nhyNpy8apy9ptvCuR1IpU
	 UHCl/WyXijqDMljeK/0mukx5J4uX2CYxkn/wrOT4=
Date: Wed, 20 Mar 2024 02:03:00 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v8 08/38] media: Documentation: Document embedded data
 guidelines for camera sensors
Message-ID: <20240320000300.GM8501@pendragon.ideasonboard.com>
References: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
 <20240313072516.241106-9-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240313072516.241106-9-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Wed, Mar 13, 2024 at 09:24:46AM +0200, Sakari Ailus wrote:
> Document how embedded data support should be implemented for camera
> sensors, and when and how CCS embedded data format should be referenced.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  .../media/drivers/camera-sensor.rst           | 29 +++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/drivers/camera-sensor.rst b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> index 919a50e8b9d9..92545538b855 100644
> --- a/Documentation/userspace-api/media/drivers/camera-sensor.rst
> +++ b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> @@ -102,3 +102,32 @@ register programming sequences shall initialize the :ref:`V4L2_CID_HFLIP
>  values programmed by the register sequences. The default values of these
>  controls shall be 0 (disabled). Especially these controls shall not be inverted,
>  independently of the sensor's mounting rotation.
> +
> +Embedded data
> +-------------
> +
> +Many sensors, mostly raw sensors, support embedded data which is used to convey
> +the sensor configuration for the captured frame back to the host. While CSI-2 is
> +the most common bus used by such sensors, embedded data can be available on
> +other bus types as well.
> +
> +Embedded data support shall use an internal source pad (a pad that has

s/source pad/sink pad/

Or do we call those "internal source pad" ?

As this is uAPI documentation, it is mainly targetting (in my opinion)
userspace developers. I would write "Embedded data support uses ..." to
describe the behaviour seen from userspace, instead of using "shall" to
describe the requirements towards drivers.

> +``MEDIA_PAD_FL_SINK <MEDIA-PAD-FL-SINK>`` and ``MEDIA_PAD_FL_INTERNAL
> +<MEDIA-PAD-FL-INTERNAL>`` flags set) and route to the external pad. If embedded
> +data output can be disabled in hardware, it should be possible to disable the
> +embedded data route via ``VIDIOC_SUBDEV_S_ROUTING`` IOCTL.

You should mention the image pad here too:

Such sensors expose two internal sink pads (pads that have both the
``MEDIA_PAD_FL_SINK <MEDIA-PAD-FL-SINK>`` and ``MEDIA_PAD_FL_INTERNAL
<MEDIA-PAD-FL-INTERNAL>`` flags set) to model the source of the image and
embedded data streams. Each of those pads produces a single stream, and the
sub-device routes those streams to the external (source) pad. If embedded data
output can be disabled in hardware, the sub-device allows disabling the
embedded data route via the ``VIDIOC_SUBDEV_S_ROUTING`` IOCTL.

> +
> +In general, changing the embedded data format from the driver-configured values
> +is not supported. The height of the metadata is hardware specific and the width

s/hardware specific/device-specific/

> +is that (or less of that) of the image width, as configured on the pixel data
> +stream.
> +
> +CCS and non-CCS embedded data
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +Embedded data which is compliant with CCS definitions shall use ``CCS embedded
> +data format <MEDIA-BUS-FMT-CCS-EMBEDDED>``. Device specific embedded data which

You should clarify here that you're talking about the internal sink pad.

s/Device specific/Only device-specific/

> +is compliant up to MIPI CCS embedded data levels 1 or 2 only shall refer to CCS

s/up to/with the/
s/only shall/may/

> +embedded data formats and document the level of conformance. The rest of the
> +device specific embedded data format shall be documented in the context of the

s/device specific/device-specific/

> +data format itself.

Not sure what you mean by the context in the last sentence.

-- 
Regards,

Laurent Pinchart

