Return-Path: <linux-media+bounces-35486-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CE137AE1A68
	for <lists+linux-media@lfdr.de>; Fri, 20 Jun 2025 14:03:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 13D2C4A4E4D
	for <lists+linux-media@lfdr.de>; Fri, 20 Jun 2025 12:03:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECF46289E21;
	Fri, 20 Jun 2025 12:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ngRyFdhV"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCFF417E
	for <linux-media@vger.kernel.org>; Fri, 20 Jun 2025 12:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750421006; cv=none; b=jO3SEHLHiE2JJIpnwXlPZbcS4zg/ZrSUhjqdf2pI5FuMu3/rfiQUGPp8LOW29/oMniLQxjh5EH6p0jJ7en7O7K24lKiRT27HV6wUgbNLCvLaMA6X1TF21fcc9ky43P2+ZV9iU53r6LtO8DUKWJCp3Ydu8pWiLYH6POKTkYyD7B4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750421006; c=relaxed/simple;
	bh=i3PuDP1SqUU6EzfdlAg5Bopcr+Mi6+yUm1LqNNd0OhU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SovKpqBN9quNmY11Xzs2YPxXL4fxA2RCLpCl4CSLQ3EI48bfiwpyslFTpA0bvI1v5uevDJ9tAQj9mXJS+rdvzeW/QCLllJ/tIS2BKg55wFtyJ/VZxSS48+pCvUjGbBjz30ozqY6LpzOboXtvj+mt4rUOKP7nh02dcHG38OjdzUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ngRyFdhV; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 508EB7FA;
	Fri, 20 Jun 2025 14:03:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750420987;
	bh=i3PuDP1SqUU6EzfdlAg5Bopcr+Mi6+yUm1LqNNd0OhU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ngRyFdhV5Gn6Om5/YlRgqQpW1R/FrMav7+Sr+EspISJ2BB3VEcrm580Ly70tYpYeB
	 xZll3qVni81gz7cEUa+gxvDrOVQ3Ba2HdxVj/NdkhQkYk3x1aKthjN4Fa8sactMEEx
	 6fuzm1c201FFUrC/xcmYnAhn2dtUPwcgeirzbb0A=
Date: Fri, 20 Jun 2025 14:03:18 +0200
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
Subject: Re: [PATCH v10 16/64] media: uapi: Add new media bus codes for
 generic raw formats
Message-ID: <dv7rd5i2t56tj3gd3yraps2vw4x76t7qkfy4zzan6pwmvpqrpd@5saqeolet424>
References: <20250619115836.1946016-1-sakari.ailus@linux.intel.com>
 <20250619115836.1946016-17-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250619115836.1946016-17-sakari.ailus@linux.intel.com>

Hi Sakari

On Thu, Jun 19, 2025 at 02:57:48PM +0300, Sakari Ailus wrote:
> Add new media bus codes for generic raw formats that are not specific to
> the colour filter array but that simply specify the bit depth. The layout
> (packing) of the data is interface specific.
>
> The rest of the properties of the format are specified with controls in
> the image source.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  .../media/v4l/subdev-formats.rst              | 40 +++++++++++++++++++
>  include/uapi/linux/media-bus-format.h         | 10 +++++
>  2 files changed, 50 insertions(+)
>
> diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> index 9ef1bc22ad9c..c06d8c83e2b8 100644
> --- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
> +++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> @@ -3434,6 +3434,46 @@ organization is given as an example for the first pixel only.
>
>      \endgroup
>
> +Generic raw formats on serial interfaces
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +Those formats transfer (largely) unprocessed raw pixel data typically from raw
> +camera sensors using Bayer and other Colour Filter Arrays (CFAs) on serial
> +interfaces. The packing of the data on the bus is determined by the hardware,
> +however the bit depth is still specific to the format.
> +
> +The colour components and the native pixel order are determined by the
> +``V4L2_CID_COLOUR_PATTERN`` control. Whether or not flipping controls
> +(``V4L2_CID_HFLIP`` and ``V4L2_CID_VFLIP``) affect the pattern is conveyed via
> +the ``V4L2_CID_COLOUR_PATTERN_MODIFY`` control.

Why not reuse the V4L2_CTRL_FLAG_MODIFY_LAYOUT flag that many drivers
use already ?

> +
> +.. tabularcolumns:: |p{2.0cm}|p{4.0cm}|p{11.3cm}|
> +
> +.. cssclass:: longtable
> +
> +.. flat-table:: Generic raw formats on serial buses
> +    :header-rows:  1
> +    :stub-columns: 0
> +    :widths:       1 1
> +
> +    * - Format name
> +      - Bit depth
> +    * - MEDIA_BUS_FMT_RAW_8
> +      - 8
> +    * - MEDIA_BUS_FMT_RAW_10
> +      - 10
> +    * - MEDIA_BUS_FMT_RAW_12
> +      - 12
> +    * - MEDIA_BUS_FMT_RAW_14
> +      - 14
> +    * - MEDIA_BUS_FMT_RAW_16
> +      - 16
> +    * - MEDIA_BUS_FMT_RAW_20
> +      - 20
> +    * - MEDIA_BUS_FMT_RAW_24
> +      - 24
> +    * - MEDIA_BUS_FMT_RAW_28
> +      - 28
>
>  Packed YUV Formats
>  ^^^^^^^^^^^^^^^^^^
> diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/media-bus-format.h
> index ff62056feed5..3abae4c77c6d 100644
> --- a/include/uapi/linux/media-bus-format.h
> +++ b/include/uapi/linux/media-bus-format.h
> @@ -185,4 +185,14 @@
>  #define MEDIA_BUS_FMT_META_20			0x8006
>  #define MEDIA_BUS_FMT_META_24			0x8007
>
> +/* Generic (CFA independent) pixel data formats. Next is 0xa009. */
> +#define MEDIA_BUS_FMT_RAW_8			0xa001
> +#define MEDIA_BUS_FMT_RAW_10			0xa002
> +#define MEDIA_BUS_FMT_RAW_12			0xa003
> +#define MEDIA_BUS_FMT_RAW_14			0xa004
> +#define MEDIA_BUS_FMT_RAW_16			0xa005
> +#define MEDIA_BUS_FMT_RAW_20			0xa006
> +#define MEDIA_BUS_FMT_RAW_24			0xa007
> +#define MEDIA_BUS_FMT_RAW_28			0xa008
> +
>  #endif /* __LINUX_MEDIA_BUS_FORMAT_H */
> --
> 2.39.5
>
>

