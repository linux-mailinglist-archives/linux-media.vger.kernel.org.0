Return-Path: <linux-media+bounces-14389-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BBC991CCB7
	for <lists+linux-media@lfdr.de>; Sat, 29 Jun 2024 14:33:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A8B881C21170
	for <lists+linux-media@lfdr.de>; Sat, 29 Jun 2024 12:33:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24A7C79B87;
	Sat, 29 Jun 2024 12:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SesPk52c"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E927947F4A
	for <linux-media@vger.kernel.org>; Sat, 29 Jun 2024 12:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719664430; cv=none; b=hLSJ1cuBqLwAuEiZbwYTVg2kUOYdv0X1ZTjD5xQ1DqK2vMZKj4V3XtqdJvWgr9c14mi10m899vQQJdCU5yrvgy3awf3h/GeNesVl7EfBJmxfJu35vJDV85+SOs6yLMVosvGJhnQTdT/3m6gchZsvxMSAC27WV3hXb3bNg5igdEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719664430; c=relaxed/simple;
	bh=6tk1oHG8igYvM+ii8Mq4R8f1YExGx6Fl5iZWh84F1u8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oppjN3Pe4cYR9zKqXjYZG3xiTLddtY2awx0xNLQONggrN9gmFxaONhjmBSOdz6ijysqolqC++YDsBd/gDcHjPRA5CDjIS09sXl0RTT9wUpzvGti9XGd6ML88DWjwphnyq3P/HKyiXTpk6hA2JUJZi6GGkk8q3COHtHW5mXHkVOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=SesPk52c; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 43DAB890;
	Sat, 29 Jun 2024 14:33:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1719664401;
	bh=6tk1oHG8igYvM+ii8Mq4R8f1YExGx6Fl5iZWh84F1u8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SesPk52cPOQjdTaJ175T4VgJZ60oE9nqZ+uy/1qAvqEFFQYqxUDX8sW6donBJJ8Gz
	 g44pzgV3clTDXRgxEnDoYMJHTqyZD4uCHpvNsY4esC/3Ri32ZVGvOUuSahM0fNCRgO
	 4FRSsnKChvZRXeOmtZPPNJalBqXGPnnDeCZggrsY=
Date: Sat, 29 Jun 2024 15:33:24 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH 2/7] uapi: videodev2: Add V4L2_META_FMT_RK_ISP1_EXT_PARAMS
Message-ID: <20240629123324.GC30900@pendragon.ideasonboard.com>
References: <20240621145406.119088-1-jacopo.mondi@ideasonboard.com>
 <20240621145406.119088-3-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240621145406.119088-3-jacopo.mondi@ideasonboard.com>

Hi Jacopo,

Thank you for the patch.

On Fri, Jun 21, 2024 at 04:54:00PM +0200, Jacopo Mondi wrote:
> Add a new format definition for the RkISP1 extensible parameters
> format and document it.
> 
> Document the usage of the new format in the rkisp1 admin guide.

In the previous version you explained the rationale in the
documentation. I think it's useful to capture it in the commit message.

----
The rkisp1 driver stores ISP configuration parameters in the fixed
rkisp1_params_cfg structure. As the members of the structure are part of
the userspace API, the structure layout is immutable and cannot be
extended further. Introducing new parameters or modifying the existing
ones would change the buffer layout and cause breakages in existing
applications.

The allow for future extensions to the ISP parameters, introduce a new
extensible parameters format, with a new format 4CC. Document usage of
the new format in the rkisp1 admin guide.
----

> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
> Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>
> ---
>  Documentation/admin-guide/media/rkisp1.rst    | 11 +++-
>  .../media/v4l/metafmt-rkisp1.rst              | 57 ++++++++++++++++---
>  drivers/media/v4l2-core/v4l2-ioctl.c          |  1 +
>  include/uapi/linux/videodev2.h                |  1 +
>  4 files changed, 59 insertions(+), 11 deletions(-)
> 
> diff --git a/Documentation/admin-guide/media/rkisp1.rst b/Documentation/admin-guide/media/rkisp1.rst
> index 6f14d9561fa5..2fc2939b0040 100644
> --- a/Documentation/admin-guide/media/rkisp1.rst
> +++ b/Documentation/admin-guide/media/rkisp1.rst
> @@ -114,11 +114,18 @@ to be applied to the hardware during a video stream, allowing userspace
>  to dynamically modify values such as black level, cross talk corrections
>  and others.
>  
> -The buffer format is defined by struct :c:type:`rkisp1_params_cfg`, and
> -userspace should set
> +The ISP driver supports two different parameters configuration methods, the
> +`fixed parameters format` or the `extensible parameters format`.
> +
> +When using the `fixed parameters` method the buffer format is defined by struct
> +:c:type:`rkisp1_params_cfg`, and userspace should set
>  :ref:`V4L2_META_FMT_RK_ISP1_PARAMS <v4l2-meta-fmt-rk-isp1-params>` as the
>  dataformat.
>  
> +When using the fixed parameters method the buffer format is defined by struct

s/fixed parameters/`extensible parameters`/

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +:c:type:`rkisp1_ext_params_cfg`, and userspace should set
> +:ref:`V4L2_META_FMT_RK_ISP1_EXT_PARAMS <v4l2-meta-fmt-rk-isp1-ext-params>` as
> +the dataformat.
>  
>  Capturing Video Frames Example
>  ==============================
> diff --git a/Documentation/userspace-api/media/v4l/metafmt-rkisp1.rst b/Documentation/userspace-api/media/v4l/metafmt-rkisp1.rst
> index fa04f00bcd2e..4e3f4ea9e1c8 100644
> --- a/Documentation/userspace-api/media/v4l/metafmt-rkisp1.rst
> +++ b/Documentation/userspace-api/media/v4l/metafmt-rkisp1.rst
> @@ -1,28 +1,67 @@
>  .. SPDX-License-Identifier: GPL-2.0
>  
> -.. _v4l2-meta-fmt-rk-isp1-params:
> -
>  .. _v4l2-meta-fmt-rk-isp1-stat-3a:
>  
> -*****************************************************************************
> -V4L2_META_FMT_RK_ISP1_PARAMS ('rk1p'), V4L2_META_FMT_RK_ISP1_STAT_3A ('rk1s')
> -*****************************************************************************
> +************************************************************************************************************************
> +V4L2_META_FMT_RK_ISP1_PARAMS ('rk1p'), V4L2_META_FMT_RK_ISP1_STAT_3A ('rk1s'), V4L2_META_FMT_RK_ISP1_EXT_PARAMS ('rk1e')
> +************************************************************************************************************************
>  
> +========================
>  Configuration parameters
>  ========================
>  
> -The configuration parameters are passed to the
> +The configuration of the RkISP1 ISP is performed by userspace by providing
> +parameters for the ISP to the driver using the :c:type:`v4l2_meta_format`
> +interface.
> +
> +There are two methods that allow to configure the ISP, the `fixed parameters`
> +configuration format and the `extensible parameters` configuration
> +format.
> +
> +.. _v4l2-meta-fmt-rk-isp1-params:
> +
> +Fixed parameters configuration format
> +=====================================
> +
> +When using the fixed configuration format, parameters are passed to the
>  :ref:`rkisp1_params <rkisp1_params>` metadata output video node, using
> -the :c:type:`v4l2_meta_format` interface. The buffer contains
> -a single instance of the C structure :c:type:`rkisp1_params_cfg` defined in
> -``rkisp1-config.h``. So the structure can be obtained from the buffer by:
> +the `V4L2_META_FMT_RK_ISP1_PARAMS` meta format.
> +
> +The buffer contains a single instance of the C structure
> +:c:type:`rkisp1_params_cfg` defined in ``rkisp1-config.h``. So the structure can
> +be obtained from the buffer by:
>  
>  .. code-block:: c
>  
>  	struct rkisp1_params_cfg *params = (struct rkisp1_params_cfg*) buffer;
>  
> +This method supports a subset of the ISP features only, new applications should
> +use the extensible parameters method.
> +
> +.. _v4l2-meta-fmt-rk-isp1-ext-params:
> +
> +Extensible parameters configuration format
> +==========================================
> +
> +When using the extensible configuration format, parameters are passed to the
> +:ref:`rkisp1_params <rkisp1_params>` metadata output video node, using
> +the `V4L2_META_FMT_RK_ISP1_EXT_PARAMS` meta format.
> +
> +The buffer contains a single instance of the C structure
> +:c:type:`rkisp1_ext_params_cfg` defined in ``rkisp1-config.h``. The
> +:c:type:`rkisp1_ext_params_cfg` structure is designed to allow userspace to
> +populate the data buffer with only the configuration data for the ISP blocks it
> +intends to configure. The extensible parameters format design allows developers
> +to define new block types to support new configuration parameters, and defines a
> +versioning scheme so that it can be extended and versioned without breaking
> +compatibility with existing applications.
> +
> +For these reasons, this configuration method if preferred over the `fixed
> +parameters` format alternative.
> +
>  .. rkisp1_stat_buffer
>  
> +===========================
>  3A and histogram statistics
>  ===========================
>  
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 4c76d17b4629..aefdc1efd24b 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1456,6 +1456,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>  	case V4L2_META_FMT_VIVID:       descr = "Vivid Metadata"; break;
>  	case V4L2_META_FMT_RK_ISP1_PARAMS:	descr = "Rockchip ISP1 3A Parameters"; break;
>  	case V4L2_META_FMT_RK_ISP1_STAT_3A:	descr = "Rockchip ISP1 3A Statistics"; break;
> +	case V4L2_META_FMT_RK_ISP1_EXT_PARAMS:	descr = "Rockchip ISP1 Ext 3A Params"; break;
>  	case V4L2_PIX_FMT_NV12_8L128:	descr = "NV12 (8x128 Linear)"; break;
>  	case V4L2_PIX_FMT_NV12M_8L128:	descr = "NV12M (8x128 Linear)"; break;
>  	case V4L2_PIX_FMT_NV12_10BE_8L128:	descr = "10-bit NV12 (8x128 Linear, BE)"; break;
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index fe6b67e83751..7c2a303c6f59 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -840,6 +840,7 @@ struct v4l2_pix_format {
>  /* Vendor specific - used for RK_ISP1 camera sub-system */
>  #define V4L2_META_FMT_RK_ISP1_PARAMS	v4l2_fourcc('R', 'K', '1', 'P') /* Rockchip ISP1 3A Parameters */
>  #define V4L2_META_FMT_RK_ISP1_STAT_3A	v4l2_fourcc('R', 'K', '1', 'S') /* Rockchip ISP1 3A Statistics */
> +#define V4L2_META_FMT_RK_ISP1_EXT_PARAMS	v4l2_fourcc('R', 'K', '1', 'E') /* Rockchip ISP1 3a Extensible Parameters */
>  
>  #ifdef __KERNEL__
>  /*

-- 
Regards,

Laurent Pinchart

