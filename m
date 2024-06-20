Return-Path: <linux-media+bounces-13778-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B496910065
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 11:31:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AE50FB21DEA
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 09:31:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03ADF1A3BC8;
	Thu, 20 Jun 2024 09:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="XWEJO25s"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99BB9199EBA
	for <linux-media@vger.kernel.org>; Thu, 20 Jun 2024 09:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718875876; cv=none; b=Z6qgROxEvz9SFdr6HpnXASsFX/VMxIDbjiu0U8KTjD9YM7JwYp+td10NdEDEG5h478txR3PsN+fDXrTnTW2aiO55leGYN0viV8c8UD5W6nBXNPmshNXxw8+66dY0QxSitv5QjRQTYKLYz/zu4YIuKoxeNU+qKqj9NEI1migIFP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718875876; c=relaxed/simple;
	bh=oNQWqjoHp1e0pj0OyDiwmZzwh92Q1HiSWBqxKNbIzrA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Oo4BMIPXzl7M8x1AE5kW4xxAUeuBAk8bZI5iC0rwdnLjFgcKbsOD7Jn2hUe2CgNkn1hvBjngANObDxWrwACi/VizlUT8CooW27M9dkWIJ4y50JSyavb4m8cJUuR/AeCJcFEsKd76n2Z/DxOP6J5h804KyPpEIypl2s6hHYgOhX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=XWEJO25s; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pyrite.rasen.tech (h175-177-049-156.catv02.itscom.jp [175.177.49.156])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DFAAAA4C;
	Thu, 20 Jun 2024 11:30:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718875853;
	bh=oNQWqjoHp1e0pj0OyDiwmZzwh92Q1HiSWBqxKNbIzrA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XWEJO25s7v0+50n9rykDrnSm52sdsC5+jIa6i/PFYinNyGXNeoEeloktZ/2CHCcRu
	 aoOcwflkVBt3TjI/3ahG/PB/toxqodo7gwEWDET0Ek+4BUopW2VZuO+HvJOViDfOsb
	 ghJJIPl6slTlRum3C6CLiW8+6rC26uBJ8fZyptpE=
Date: Thu, 20 Jun 2024 18:31:02 +0900
From: Paul Elder <paul.elder@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH 2/8] uapi: videodev2: Add V4L2_META_FMT_RK_ISP1_EXT_PARAMS
Message-ID: <ZnP21hj1cJzMHnpJ@pyrite.rasen.tech>
References: <20240605165434.432230-1-jacopo.mondi@ideasonboard.com>
 <20240605165434.432230-3-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240605165434.432230-3-jacopo.mondi@ideasonboard.com>

On Wed, Jun 05, 2024 at 06:54:21PM +0200, Jacopo Mondi wrote:
> Add a new format definition for the RkISP1 extensible parameters
> format and document it.
> 
> Document the usage of the new format in the rkisp1 admin guide.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  Documentation/admin-guide/media/rkisp1.rst    | 11 +++-
>  .../media/v4l/metafmt-rkisp1.rst              | 62 ++++++++++++++++---
>  drivers/media/v4l2-core/v4l2-ioctl.c          |  1 +
>  include/uapi/linux/videodev2.h                |  1 +
>  4 files changed, 64 insertions(+), 11 deletions(-)
> 
> diff --git a/Documentation/admin-guide/media/rkisp1.rst b/Documentation/admin-guide/media/rkisp1.rst
> index 6f14d9561fa5..934c25e191df 100644
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
> +:c:type:`rkisp1_params_cfg`, and userspace set
>  :ref:`V4L2_META_FMT_RK_ISP1_PARAMS <v4l2-meta-fmt-rk-isp1-params>` as the
>  dataformat.
>  
> +When using the fixed parameters method the buffer format is defined by struct

s/fixed/extensible/ ?

> +:c:type:`rkisp1_ext_params_cfg`, and userspace set
> +:ref:`V4L2_META_FMT_RK_ISP1_EXT_PARAMS <v4l2-meta-fmt-rk-isp1-ext-params>` as
> +the dataformat.
>  
>  Capturing Video Frames Example
>  ==============================
> diff --git a/Documentation/userspace-api/media/v4l/metafmt-rkisp1.rst b/Documentation/userspace-api/media/v4l/metafmt-rkisp1.rst
> index fa04f00bcd2e..6ff776d071a3 100644
> --- a/Documentation/userspace-api/media/v4l/metafmt-rkisp1.rst
> +++ b/Documentation/userspace-api/media/v4l/metafmt-rkisp1.rst
> @@ -1,28 +1,72 @@
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
> +There are currently two methods that allow to configure the ISP, the `fixed
> +parameters` configuration format and the `extensible parameters` configuration
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
> +the `V4L2_META_FMT_RK_ISP1_PARAMS` meta pixel format.
> +
> +The buffer contains a single instance of the C structure
> +:c:type:`rkisp1_params_cfg` defined in ``rkisp1-config.h``. So the structure can
> +be obtained from the buffer by:
>  
>  .. code-block:: c
>  
>  	struct rkisp1_params_cfg *params = (struct rkisp1_params_cfg*) buffer;
>  
> +As the members of :c:type:`rkisp1_params_cfg` are defined in the
> +``rkisp1-config.h`` header, the structure layout is immutable and cannot be
> +extended further. For this reason the fixed configuration format only allows the
> +configuration of the ISP blocks supported at the time when the structure had
> +been defined in the header file, as introducing new parameters or modifying the
> +existing ones would change the buffer layout and cause breakages in existing
> +applications.
> +
> +.. _v4l2-meta-fmt-rk-isp1-ext-params:
> +
> +Extensible parameters configuration format
> +==========================================
> +
> +When using the extensible configuration format, parameters are passed to the
> +:ref:`rkisp1_params <rkisp1_params>` metadata output video node, using
> +the `V4L2_META_FMT_RK_ISP1_EXT_PARAMS` meta pixel format.
> +
> +The buffer contains a single instance of the C structure
> +:c:type:`rkisp1_ext_params_cfg` defined in ``rkisp1-config.h``. The
> +:c:type:`rkisp1_ext_params_cfg` structure is designed to allow userspace to
> +populate the data buffer with only the configuration data for the ISP block it
> +intends to configure. The extensible parameters format design allows to define

s/allows to define/allows defining/

> +new block types and new configuration parameters and defines a versioning scheme

s/parameters/parameters,/


Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>

> +so that it can be extended and versioned without breaking compatibility with
> +existing applications.
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
> -- 
> 2.45.1
> 

