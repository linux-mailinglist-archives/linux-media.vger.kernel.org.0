Return-Path: <linux-media+bounces-20058-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2DC9AB6BD
	for <lists+linux-media@lfdr.de>; Tue, 22 Oct 2024 21:27:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A2A51F244F9
	for <lists+linux-media@lfdr.de>; Tue, 22 Oct 2024 19:27:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 932351CB50B;
	Tue, 22 Oct 2024 19:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="PM2QxzKc"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 348ED1CB506
	for <linux-media@vger.kernel.org>; Tue, 22 Oct 2024 19:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729625265; cv=none; b=VaSN2AEkP1tRjB/5ByXAJ7Vf2Uq7RKzkh8LsnDkpNONgRwJRoa7eFDMIIo0vL5u3NWBCcTqK/zF064GvSr0/u3/7fsiz+KavgY9IJp8JN22PSTDRR3U91ggNvxcNrS+8TKsnFf5tP1O8SgvfwMdjm2A7zuqmYINiQzUM3HqJB/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729625265; c=relaxed/simple;
	bh=Z0mDOjHDSs4Jrol0egWo3C/kOcn9XQcGmoUMKGX1Bzc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=byEVwpJV1UuNGjDleAb05rEVvRAZZUXyZ+Mk++DK24XEHsQpfiO/c+WAWl9FpNsSsMtGwgia5eDIQRPx9tsHG6IA1aR2wA7vlvwFXV/Mdfm1xg9i+04u/Z2PCoFRLtnyZSDVKI6N/5y/iP4dIJUWLSCYdFLymSI6K8eke8zfUyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=PM2QxzKc; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 36E5D752;
	Tue, 22 Oct 2024 21:25:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1729625154;
	bh=Z0mDOjHDSs4Jrol0egWo3C/kOcn9XQcGmoUMKGX1Bzc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PM2QxzKcX8pHGYWuaYYwWhc0DfQB8h1UpzNdHPTfbXjga1eOSRecybH+u6+z0SEn5
	 ptQXOh82uSkVeY85B/iCgpV2CBCf/1xYEC18PLYtZCOeS0k2mS/PkGT6VHg09WoE1C
	 WmzhRqQUAoVTQcdhiW8UvhTz1VDOrFcmgPosB0PY=
Date: Tue, 22 Oct 2024 22:27:34 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, hverkuil@xs4all.nl,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Mikhail Rudenko <mike.rudenko@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>
Subject: Re: [RFC 1/4] media: Documentation: Rework embedded data
 documentation
Message-ID: <20241022192734.GC9497@pendragon.ideasonboard.com>
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

Hi Sakari,

Thank you for the patch.

On Fri, Oct 11, 2024 at 10:55:32AM +0300, Sakari Ailus wrote:
> Rework embedded data documentation by removing the reference to the pixel
> data stream. The specific documentation of the embedded data interface
> will be elsewhere.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

(possibly with Jacopo's suggestion included)

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
> +the ``MEDIA_PAD_FL_SINK <MEDIA-PAD-FL-SINK>`` and ``MEDIA_PAD_FL_INTERNAL
> +<MEDIA-PAD-FL-INTERNAL>`` flags set) with a metadata format to model the
> +embedded data stream. If the sub-device driver supports disabling embedded data,
> +this can be done by disabling the embedded data route via the
> +``VIDIOC_SUBDEV_S_ROUTING`` IOCTL.
>  
>  In general, changing the embedded data format from the driver-configured values
>  is not supported. The height of the metadata is device-specific and the width

-- 
Regards,

Laurent Pinchart

