Return-Path: <linux-media+bounces-9797-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 870AC8ABA39
	for <lists+linux-media@lfdr.de>; Sat, 20 Apr 2024 10:11:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 43CCE28187F
	for <lists+linux-media@lfdr.de>; Sat, 20 Apr 2024 08:11:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9633A14005;
	Sat, 20 Apr 2024 08:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="PLHvRV3d"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9685A12E5D
	for <linux-media@vger.kernel.org>; Sat, 20 Apr 2024 08:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713600662; cv=none; b=I5Sc6q2G9fEXbffOKCtD0zUdc2qmjaYcBCZoxsaq4uOwwQ7uVy7eW2NKy9rPZDPig817dY5OtqXua69eQx2VKA68dRVsA9bWVenvvY8s0BqEvgeESNtat3DOt3hOLz415kE5WGg7PC84PdXi77AVk48ldqgZ8iE0w4RvJpOszH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713600662; c=relaxed/simple;
	bh=Vpmbtk3DCMdrzsTTsm8opY6512SiAu6AyJLdWsZ55/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SJi1rR7IXBuOZ5UCcEd2FBr833uOFoVLUITOulwAm3DOQC9b+yIAiIxXlPPDIeEkuYf7Eq1qbUZSvJWGOVqnljS4QhzMZLfpxr8StkVeB1nDCOHoRo8J3pLZrLNEd2Bx8svQ8S3OJ4E58s9KOzzM4/NaWJusSVeoUbxIQ1onyfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=PLHvRV3d; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8AFF02BC;
	Sat, 20 Apr 2024 10:10:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1713600609;
	bh=Vpmbtk3DCMdrzsTTsm8opY6512SiAu6AyJLdWsZ55/Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PLHvRV3dDLOa9uZVjbp+S+1uz3RzsRlFT2d9g9caZXnkkudJjcgO7BHTvm79Bo4Cb
	 f1rnsuOUvHdrNJoB4RrdAVS3Zz16ckANv8nOmrAPg4BcCqniLAoRlU3IGJOfCY19RN
	 2TH/pJuMsZykuSGN4GguK4YSoR91UT2QyWZuEj7U=
Date: Sat, 20 Apr 2024 11:10:50 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v9 27/46] media: uapi: ccs: Add media bus code for MIPI
 CCS embedded data
Message-ID: <20240420081050.GP6414@pendragon.ideasonboard.com>
References: <20240416193319.778192-1-sakari.ailus@linux.intel.com>
 <20240416193319.778192-28-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240416193319.778192-28-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Tue, Apr 16, 2024 at 10:33:00PM +0300, Sakari Ailus wrote:
> Add new MIPI CCS embedded data media bus code
> (MEDIA_BUS_FMT_CCS_EMBEDDED).
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Julien Massot <julien.massot@collabora.com>

There's still an open question on how to document embedded data formats
for sensors compatible with level 2 only. The discussion is ongoing and
may affect this patch, but the changes can be implemented later, so

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  .../media/v4l/subdev-formats.rst              | 32 +++++++++++++++++++
>  include/uapi/linux/media-bus-format.h         |  3 ++
>  2 files changed, 35 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> index 0547f2733ee3..fa181ce8f48c 100644
> --- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
> +++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> @@ -8316,6 +8316,10 @@ content is more or less device specific but the data is transmitted and received
>  by multiple devices that do not process the data in any way, simply writing
>  it to system memory for processing in software at the end of the pipeline.
>  
> +The exact format of the data generated by the device is reported on the internal
> +source pad of the originating sub-device, using one of the more specific
> +metadata formats such as MEDIA_BUS_FMT_CCS_EMBEDDED.
> +
>  "b" in an array cell signifies a byte of data, followed by the number of the bit
>  and finally the bit number in subscript. "x" indicates a padding bit.
>  
> @@ -8562,3 +8566,31 @@ and finally the bit number in subscript. "x" indicates a padding bit.
>        - x
>        - x
>        - x
> +
> +.. _MEDIA-BUS-FMT-CCS-EMBEDDED:
> +
> +MIPI CCS Embedded Data Formats
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +`MIPI CCS <https://www.mipi.org/specifications/camera-command-set>`_ defines a
> +metadata format for sensor embedded data, which is used to store the register
> +configuration used for capturing a given frame. The format is defined in the CCS
> +specification. The media bus code for this format is
> +``MEDIA_BUS_FMT_CCS_EMBEDDED``.
> +
> +The CCS embedded data format definition includes three levels:
> +
> +1. Padding within CSI-2 bus :ref:`Data Unit <media-glossary-data-unit>` as
> +   documented in the MIPI CCS specification.
> +
> +2. The tagged data format as documented in the MIPI CCS specification.
> +
> +3. Register addresses and register documentation as documented in the MIPI CCS
> +   specification.
> +
> +The format definition shall be used only by devices that fulfill all three
> +levels above.
> +
> +This mbus code are only used for "2-byte simplified tagged data format" (code
> +0xa) but their use may be extended further in the future, to cover other CCS
> +embedded data format codes.
> diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/media-bus-format.h
> index d4c1d991014b..03f7e9ab517b 100644
> --- a/include/uapi/linux/media-bus-format.h
> +++ b/include/uapi/linux/media-bus-format.h
> @@ -183,4 +183,7 @@
>  #define MEDIA_BUS_FMT_META_20			0x8006
>  #define MEDIA_BUS_FMT_META_24			0x8007
>  
> +/* Specific metadata formats. Next is 0x9002. */
> +#define MEDIA_BUS_FMT_CCS_EMBEDDED		0x9001
> +
>  #endif /* __LINUX_MEDIA_BUS_FORMAT_H */

-- 
Regards,

Laurent Pinchart

