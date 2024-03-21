Return-Path: <linux-media+bounces-7534-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65ADE885FF7
	for <lists+linux-media@lfdr.de>; Thu, 21 Mar 2024 18:43:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 967D9B217C3
	for <lists+linux-media@lfdr.de>; Thu, 21 Mar 2024 17:43:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97C8F13173D;
	Thu, 21 Mar 2024 17:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="wi4fEqCa"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1B48592D
	for <linux-media@vger.kernel.org>; Thu, 21 Mar 2024 17:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711042993; cv=none; b=WinOiET89VWr1wZALkIEeeZt2jIVOFpNZ/lfUHBtIuwvUCc1j2Sw/GZo5jz2VLZA7rPWZ0oSw/bUXoN/zFPBh8gkOrL3eeK/Ayvl0XLezehs6oNIavKetXVRM9Faqr+fbbSFK/+RqUCmcJbWGicPzWPp3nWUpFG9bkEzCMYIBco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711042993; c=relaxed/simple;
	bh=DDl5+cNHsZZAIbuvSoqNGu6KTSy6YGuvSsvYqUJBxpE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QCuIX8P6mIwhMYjOd44v1qiWqiBcC5sYFp5ZT+/psEb3d6uLeFauuwrjiK7rLURV9eeq9nqU8InYyEkHCiWonFb3FsKoyn1YzkhJ8R6Y2vxdzYR/df5vtPmwRZ4tbKSKz5ACGPxzpDg0FTJzalMmnBficLhNVlXXCwUn4kHI8B4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=wi4fEqCa; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D20D62B3;
	Thu, 21 Mar 2024 18:42:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1711042961;
	bh=DDl5+cNHsZZAIbuvSoqNGu6KTSy6YGuvSsvYqUJBxpE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wi4fEqCaSv+XIkSP+yVDMqNORQn4aN3HHbspNCsszJwrPFczBRNc/5hs+TsCCG90n
	 3CqU0GhKjfhX02BDfri5cuio21PzZC4Sbq4KK7z2H5/V6IZt9zwvCXYDybKUpozs/G
	 pLIojUSfsRJm31+Mb2DWKVO4Fbvs8kyWsxvf2rJo=
Date: Thu, 21 Mar 2024 19:43:06 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v8 30/38] media: Documentation: ccs: Document routing
Message-ID: <20240321174306.GQ9582@pendragon.ideasonboard.com>
References: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
 <20240313072516.241106-31-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240313072516.241106-31-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Wed, Mar 13, 2024 at 09:25:08AM +0200, Sakari Ailus wrote:
> Document which routes are available for the CCS driver (source) sub-device
> and what configuration are possible.
> 
> Also update copyright.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  .../userspace-api/media/drivers/ccs.rst       | 34 ++++++++++++++++++-
>  .../media/v4l/subdev-formats.rst              |  2 ++
>  2 files changed, 35 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/userspace-api/media/drivers/ccs.rst b/Documentation/userspace-api/media/drivers/ccs.rst
> index 03015b33d5ab..bc2804ec663b 100644
> --- a/Documentation/userspace-api/media/drivers/ccs.rst
> +++ b/Documentation/userspace-api/media/drivers/ccs.rst
> @@ -111,4 +111,36 @@ than in the centre.
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
> +binner) depending on whether the sensor supports embedded data. (All CCS
> +compliant sensors do but the CCS driver supports preceding standards that did
> +not require embedded data support, too.)

s/too.)/too).

> +
> +The first route of the CCS source sub-device is for pixel data (internal pad
> +1/stream 0 -> pad 0/stream 0) and the second one is for embedded data (internal

I thought the source subdev had one external sink pad for image data,
one internal sink pad for embedded data, and one source pad.

> +pad 2/stream 0 -> pad 0/stream 1).
> +
> +Embedded data
> +~~~~~~~~~~~~~
> +
> +MIPI CCS supports generation of camera sensor embedded data. The media bus code
> +used for this format is :ref:`MEDIA_BUS_FMT_CCS_EMBEDDDED
> +<MEDIA-BUS-FMT-CCS-EMBEDDED>`.

Maybe state that this is the format on the internal ED sink pad.

> +
> +The bit depth of the CCS pixel data affects how the sensor will output the
> +embedded data, adding padding to align with CSI-2 bus :ref:`Data units
> +<media-glossary-data-unit>` for that particular bit depth. This is indicated by
> +the generic metadata format on the sensor's source sub-device's source pad.
> +
> +Embedded data for bit depths greater than or equal to 16 may support more dense
> +packing or legacy single metadata byte per data unit, or both of these,
> +depending on the device. The supported embedded data formats can be enumerated
> +and configured on stream 1 of the source pad (1) of the CCS source sub-device.
> +
> +**Copyright** |copy| 2020, 2023 Intel Corporation

2024 ?

> diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> index c8f982411e70..ca4da6a400ff 100644
> --- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
> +++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> @@ -8592,3 +8592,5 @@ levels above.
>  This mbus code are only used for "2-byte simplified tagged data format" (code
>  0xa) but their use may be extended further in the future, to cover other CCS
>  embedded data format codes.
> +
> +Also see :ref:`CCS driver documentation <media-ccs-routes>`.

-- 
Regards,

Laurent Pinchart

