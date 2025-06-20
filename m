Return-Path: <linux-media+bounces-35488-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F0261AE1AA4
	for <lists+linux-media@lfdr.de>; Fri, 20 Jun 2025 14:11:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 758DD5A5BD1
	for <lists+linux-media@lfdr.de>; Fri, 20 Jun 2025 12:11:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35E1F289E21;
	Fri, 20 Jun 2025 12:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YhEt6cdQ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7281328E616
	for <linux-media@vger.kernel.org>; Fri, 20 Jun 2025 12:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750421410; cv=none; b=h4LcKaJDkCbj5uRjvljO/9ICgSIQu6KlN2rbYZan8ImUvUDxoNcLV/26LOn9LEeJUh9Gy6om9ReB7qtI/vQtlcRmPnODXhm0PN7nUrMBUzUjEt20EHI/7TDptgoOa8qcEvu/nMMIb7K1WcMuT3Sqpvb242t1e5Qqoi5uA5szRgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750421410; c=relaxed/simple;
	bh=tIoCrRv5se2ONWrhAZGXa3Qn8lNPdPnw75bB2mzJxyc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HOu2g9cQ7hcY0Uvd3UuYsFWFGwWeNaBtWQaZEGkEbGD7WfeWHVr5MVKzxjhgdxDqRdlriRlrcyBERFu69vF/sN3R1UixtDs4GBT43/z1zG4R1geZDNY7Z2QiQAzDiuNhh0dnckIHYdNUps21yMKGp8A+t3o0WtRJ6mhwVFnxkNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=YhEt6cdQ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9D3A07FA;
	Fri, 20 Jun 2025 14:09:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750421388;
	bh=tIoCrRv5se2ONWrhAZGXa3Qn8lNPdPnw75bB2mzJxyc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YhEt6cdQMVU7qeXDzMAtHDQ9Ahg4fi/wSGCRR0Y+z6q7cGvfqhQzXuRWJYIU6niFO
	 CuInk0Su5VrU96zWnmzqeIzYY9M4Zw31AJNEPG2qzFPCgE3qbv8tXYVMs9j0J//svH
	 NK2nLKtlDo/2PETKXAkBa3E00VremG/M4U2/S3AI=
Date: Fri, 20 Jun 2025 14:10:00 +0200
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
Subject: Re: [PATCH v10 18/64] media: uapi: Add V4L2_CID_COLOR_PATTERN for
 describing color patterns
Message-ID: <pczbu7ubfshbhtc5ukmxhbd4xjrmcbwnv7saqy73q2mrgta4q7@5xmultpljt7f>
References: <20250619115836.1946016-1-sakari.ailus@linux.intel.com>
 <20250619115836.1946016-19-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250619115836.1946016-19-sakari.ailus@linux.intel.com>

Hi Sakari

On Thu, Jun 19, 2025 at 02:57:50PM +0300, Sakari Ailus wrote:
> Add V4L2_CID_COLOR_PATTERN to tell the camera sensor's native color
> pattern.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  .../media/v4l/ext-ctrls-image-source.rst      | 39 +++++++++++++++++++
>  .../media/v4l/subdev-formats.rst              |  2 +
>  drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  1 +
>  include/uapi/linux/v4l2-controls.h            |  6 +++
>  4 files changed, 48 insertions(+)
>
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> index 71f23f131f97..b19aaaffbce0 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> @@ -92,3 +92,42 @@ Image Source Control IDs
>      representing a gain of exactly 1.0. For example, if this default value
>      is reported as being (say) 128, then a value of 192 would represent
>      a gain of exactly 1.5.
> +
> +``V4L2_CID_COLOR_PATTERN (integer)``
> +    This control determines the color components and native pixel order in the
> +    sensor's CFA (Color Filter Array) when used in conjunction with
> +    :ref:`generic raw mbus codes MEDIA_BUS_FMT_RAW_x (where 'x' is the bit
> +    depth) <v4l2-mbus-pixelcode-generic-raw>` pixelcodes. The native pixel
> +    order is constant for a given device, it is not affected by cropping or
> +    flipping.
> +
> +    This control may only be used on V4L2 sub-devices.
> +
> +    This is a read-only control.
> +
> +    Available patterns:
> +
> +.. flat-table:: V4L2 color patterns
> +    :header-rows:  1
> +    :stub-columns: 0
> +    :widths:       1 2 1
> +
> +    * - Macro name
> +      - Synopsis
> +      - Value
> +    * - V4L2_COLOR_PATTERN_GRBG
> +      - Raw Bayer, with alternating lines beginning with green, red pixels and
> +        blue, green pixels.
> +      - 0
> +    * - V4L2_COLOR_PATTERN_RGGB
> +      - Raw Bayer, with alternating lines beginning with red, green pixels and
> +        green, blue pixels.
> +      - 1
> +    * - V4L2_COLOR_PATTERN_BGGR
> +      - Raw Bayer, with alternating lines beginning with blue, green pixels and
> +        green, red pixels.
> +      - 2
> +    * - V4L2_COLOR_PATTERN_GBRG
> +      - Raw Bayer, with alternating lines beginning with green, blue pixels and
> +        red, green pixels.
> +      - 3
> diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> index c06d8c83e2b8..d6d0e9a0eee1 100644
> --- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
> +++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> @@ -3434,6 +3434,8 @@ organization is given as an example for the first pixel only.
>
>      \endgroup
>
> +.. _v4l2-mbus-pixelcode-generic-raw:
> +
>  Generic raw formats on serial interfaces
>  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> index dd5f06546773..8119012c2638 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> @@ -1155,6 +1155,7 @@ const char *v4l2_ctrl_get_name(u32 id)
>  	case V4L2_CID_TEST_PATTERN_BLUE:	return "Blue Pixel Value";
>  	case V4L2_CID_TEST_PATTERN_GREENB:	return "Green (Blue) Pixel Value";
>  	case V4L2_CID_NOTIFY_GAINS:		return "Notify Gains";
> +	case V4L2_CID_COLOR_PATTERN:		return "Color Pattern";
>
>  	/* Image processing controls */
>  	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index c3e6a49b2549..09e5d5bbe7f8 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -1221,6 +1221,12 @@ enum v4l2_jpeg_chroma_subsampling {
>  #define V4L2_CID_UNIT_CELL_SIZE			(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 8)
>  #define V4L2_CID_NOTIFY_GAINS			(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 9)
>
> +#define V4L2_CID_COLOR_PATTERN			(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 10)
> +#define V4L2_COLOR_PATTERN_GRBG			0U
> +#define V4L2_COLOR_PATTERN_RGGB			1U
> +#define V4L2_COLOR_PATTERN_BGGR			2U
> +#define V4L2_COLOR_PATTERN_GBRG			3U
> +

Additional empty line ?

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
  j

>
>  /* Image processing controls */
>
> --
> 2.39.5
>
>

