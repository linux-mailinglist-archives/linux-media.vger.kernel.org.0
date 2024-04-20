Return-Path: <linux-media+bounces-9799-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F34958ABA47
	for <lists+linux-media@lfdr.de>; Sat, 20 Apr 2024 10:32:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1C35DB21742
	for <lists+linux-media@lfdr.de>; Sat, 20 Apr 2024 08:32:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AE82C8C7;
	Sat, 20 Apr 2024 08:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vX1eoHTy"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB6A205E17
	for <linux-media@vger.kernel.org>; Sat, 20 Apr 2024 08:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713601921; cv=none; b=oIfr3JGWmbHSVMzmyMyZBrk/0r/EwQ7+7r1n1poZoridVWClkmIXZHQm6lJKeHuKoOaahCprSHquI283y9OtzGZL9jRgGgPWf15UmuV7nzbANVnHRUlNR0XX0sd3Pc0/w1zc0NNBkPIwAdam91xmg8wql+8knJS9FjLQJsC5QSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713601921; c=relaxed/simple;
	bh=kRk/XZS1D/Xz+YMXSS0z73tHU3sNnocx0zH578r10wo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QooTjKWB091f/flpj7n4B++suEPCqbN+fv5BhqxJl1b0x16DPL9vxCKAeURpX4C3a0upppRf9tdgxBZwHqA+Y5pUCVnxD/Zw3RTGy1soxZSMPUjfgQNyaFQ5X2km8dM7drRxQgoZEi4fhqc254fbp/FPm//xHtkg3sfBAIKUrAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vX1eoHTy; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 09B562BC;
	Sat, 20 Apr 2024 10:31:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1713601868;
	bh=kRk/XZS1D/Xz+YMXSS0z73tHU3sNnocx0zH578r10wo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vX1eoHTyfjrIEceKHi78wqJmqPsQXIRZBanaAUGkROcXKK4qD6ZU+iwmIrTgsGzYd
	 gYuOiqJbETwZ70tFOxKqQgVatr/dy803JxGQrflapkc93xHC7cXBP+wttxhU64t3hp
	 mzqTW+8nWMZYM7rjNj0N9eDlsLpecyOWPU9Avay8=
Date: Sat, 20 Apr 2024 11:31:47 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v9 29/46] media: Documentation: ccs: Document routing
Message-ID: <20240420083147.GR6414@pendragon.ideasonboard.com>
References: <20240416193319.778192-1-sakari.ailus@linux.intel.com>
 <20240416193319.778192-30-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240416193319.778192-30-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Tue, Apr 16, 2024 at 10:33:02PM +0300, Sakari Ailus wrote:
> Document which routes are available for the CCS driver (source) sub-device
> and what configuration are possible.
> 
> Also update copyright.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  .../userspace-api/media/drivers/ccs.rst       | 38 ++++++++++++++++++-
>  .../media/v4l/subdev-formats.rst              |  2 +
>  2 files changed, 39 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/userspace-api/media/drivers/ccs.rst b/Documentation/userspace-api/media/drivers/ccs.rst
> index 03015b33d5ab..53890ac54dab 100644
> --- a/Documentation/userspace-api/media/drivers/ccs.rst
> +++ b/Documentation/userspace-api/media/drivers/ccs.rst
> @@ -111,4 +111,40 @@ than in the centre.
>  Shading correction needs to be enabled for luminance correction level to have an
>  effect.
>  
> -**Copyright** |copy| 2020 Intel Corporation
> +.. _media-ccs-routes:
> +
> +Routes
> +------
> +
> +The CCS driver implements one or two :ref:`routes <subdev-routing>` in
> +its source sub-device (scaler sub-device if exists for the device, otherwise

s/if exists/if it exists/

> +binner) depending on whether the sensor supports embedded data. (All CCS
> +compliant sensors do but the CCS driver supports preceding standards that did
> +not require embedded data support, too.)
> +
> +The first route of the CCS source sub-device is for pixel data (sink pad
> +0/stream 0 -> source pad 1/stream 0) and the second one is for embedded data
> +(internal sink pad 2/stream 0 -> source pad 1/stream 1).
> +
> +Embedded data
> +~~~~~~~~~~~~~
> +
> +MIPI CCS supports generation of camera sensor embedded data. The media bus code
> +used for this format on the internal sink pad is
> +:ref:`MEDIA_BUS_FMT_CCS_EMBEDDDED <MEDIA-BUS-FMT-CCS-EMBEDDED>`.
> +
> +The bit depth of the CCS pixel data affects how the sensor will output the
> +embedded data, adding padding to align with CSI-2 bus :ref:`Data Units
> +<media-glossary-data-unit>` for that particular bit depth. This is indicated by
> +the generic metadata format on the sensor's source sub-device's source pad.

That's a bit hard to parse, maybe "on the source pad of the sensor's
source sub-device" ?

> +
> +Devices supporting embedded data for bit depths greater than or equal to 16 may
> +support more dense packing or legacy single metadata byte per data unit, or both
> +of these. The supported embedded data formats can be enumerated and configured
> +on stream 1 of the source pad (1) of the CCS source sub-device.
> +
> +The use of the denser packing results in embedded data lines being longer than
> +the pixel data in data units since the data units are smaller. In bytes the
> +embedded data lines are still not longer than the image data lines.
> +
> +**Copyright** |copy| 2020, 2023 Intel Corporation

2024 ?

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> index fa181ce8f48c..a04756092238 100644
> --- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
> +++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> @@ -8594,3 +8594,5 @@ levels above.
>  This mbus code are only used for "2-byte simplified tagged data format" (code
>  0xa) but their use may be extended further in the future, to cover other CCS
>  embedded data format codes.
> +
> +Also see :ref:`CCS driver documentation <media-ccs-routes>`.

-- 
Regards,

Laurent Pinchart

