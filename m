Return-Path: <linux-media+bounces-11803-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE188CD0C9
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2024 13:01:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 22EB01F21662
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2024 11:01:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5914713F42B;
	Thu, 23 May 2024 11:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="S6EMJetG"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C97146AF
	for <linux-media@vger.kernel.org>; Thu, 23 May 2024 11:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716462099; cv=pass; b=H0GImirPYIj69O+2yCkgtapjRAvf3n3U198sEEZj7aY4r1lGKGi3DrHPWtUW/j6wjZqUgskrpRmR1vXNDDF4KedQY+aWh4gdDt+e0yrBsejwHMF/DbnzvvCqJBwiZ/5iLu74fxvoSBBDuAVJYOTz5yXqG2XNcw92sj030phRRsQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716462099; c=relaxed/simple;
	bh=mXuXece2SVaH52kcjSGOe47v3RgjBf4xE7mYWdRItWU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TdSe9oC+UB/TLYd2erSsIlvSahGNNh1L6TquPuwM7xqKPqmB5fJbeTVve4I1RwNAfDKRYUckWEmdlBCDr8ppFOoop2C4L+7C8EhW6XM0BLbQ0n6E5d0WBVuaKgErxpl/YvLHaQ06+0emciNSZ8CgIde9U3NHXa6vT1lLaQ1aw9U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=S6EMJetG; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4VlQGQ5ZSlzyQq;
	Thu, 23 May 2024 14:01:34 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1716462094;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+JCgYQ6tbOj1+JLjUG5vpbLILod++7Z6cE4CV5ualNs=;
	b=S6EMJetGnllqPLPMv+XxSb//+m0R7PnanQjB0Ob8gFuUalhYhfrkhLVmuYX2nze/tj6bni
	tRYcs0WCXgTZ9BUZClJ286VWBgncJLirqKN/j2MqiZbh6+Q4kyyDlhncWQzKUMlLKOKRA4
	6OnjXI16u9N7WF25d7TSdsbDrRzTxtA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1716462094;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+JCgYQ6tbOj1+JLjUG5vpbLILod++7Z6cE4CV5ualNs=;
	b=qmueUO1I9Yhs1hHcSbhBOECSQ3J27qpeG/ENsOOnnBoazYy4svlc38526pOr2kR6pxhnNh
	Y14v4R9EflJ5c1NvMZmYa6vipZFbYx+tjIkM1N7UFKAg7N889VKnWayI8OhYtOBk/QEj1W
	yy+ih9ENM3R4ojLtp55jCi5cKTqZN68=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1716462094; a=rsa-sha256; cv=none;
	b=JPGbhUkCoSea4f3/YDXi64rfsaXwIDp78o40ehLyDs4ZcQn8hDQ7P5v80MJXko1Djjk4m1
	P7jU2SYV9bnsZU1djLqvJmbcblNPC0VSOa6E8ST6bugu/Ib7DbB824xx3ObdyF9jpiaYK9
	9uJQO6vEk0h06ylwrt2fIQNAQ9GPDt4=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 8D126634C94;
	Thu, 23 May 2024 13:58:56 +0300 (EEST)
Date: Thu, 23 May 2024 10:58:56 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
	David Plowman <david.plowman@raspberrypi.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	Nick Hollinghurst <nick.hollinghurst@raspberrypi.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v6 3/7] media: uapi: Add meta pixel format for PiSP BE
 config
Message-ID: <Zk8hcDAjXygZDQ2w@valkosipuli.retiisi.eu>
References: <20240502110503.38412-1-jacopo.mondi@ideasonboard.com>
 <20240502110503.38412-4-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240502110503.38412-4-jacopo.mondi@ideasonboard.com>

Hi Jacopo,

On Thu, May 02, 2024 at 01:04:58PM +0200, Jacopo Mondi wrote:
> Add format description for the PiSP Back End configuration parameter
> buffer.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Reviewed-by: Naushir Patuck <naush@raspberrypi.com>
> ---
>  .../userspace-api/media/v4l/meta-formats.rst  |  1 +
>  .../media/v4l/metafmt-pisp-be.rst             | 46 +++++++++++++++++++
>  drivers/media/v4l2-core/v4l2-ioctl.c          |  1 +
>  include/uapi/linux/videodev2.h                |  3 ++
>  4 files changed, 51 insertions(+)
>  create mode 100644 Documentation/userspace-api/media/v4l/metafmt-pisp-be.rst
> 
> diff --git a/Documentation/userspace-api/media/v4l/meta-formats.rst b/Documentation/userspace-api/media/v4l/meta-formats.rst
> index c23aac823d2c..c6e56b5888bc 100644
> --- a/Documentation/userspace-api/media/v4l/meta-formats.rst
> +++ b/Documentation/userspace-api/media/v4l/meta-formats.rst
> @@ -15,6 +15,7 @@ These formats are used for the :ref:`metadata` interface only.
>      metafmt-d4xx
>      metafmt-generic
>      metafmt-intel-ipu3
> +    metafmt-pisp-be
>      metafmt-rkisp1
>      metafmt-uvc
>      metafmt-vivid
> diff --git a/Documentation/userspace-api/media/v4l/metafmt-pisp-be.rst b/Documentation/userspace-api/media/v4l/metafmt-pisp-be.rst
> new file mode 100644
> index 000000000000..f3d30ba989b3
> --- /dev/null
> +++ b/Documentation/userspace-api/media/v4l/metafmt-pisp-be.rst
> @@ -0,0 +1,46 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +.. _v4l2-meta-fmt-rpi-be-cfg:
> +
> +************************
> +V4L2_META_FMT_RPI_BE_CFG
> +************************
> +
> +Raspberry Pi PiSP Back End configuration format
> +===============================================
> +
> +The Raspberry Pi PiSP Back End memory-to-memory image signal processor is
> +configured by userspace by providing a buffer of configuration parameters
> +to the `pispbe-config` output video device node using the
> +:c:type:`v4l2_meta_format` interface.
> +
> +The PiSP Back End processes images in tiles, and its configuration requires
> +specifying two different sets of parameters by populating the members of
> +:c:type:`pisp_be_tiles_config` defined in the ``pisp_be_config.h`` header file.

Could you add kernel-doc documentation for pisp_be_config.h and refer to
that instead? Also the header would need to be moved to an earlier patch.

> +
> +The `Raspberry Pi PiSP technical specification
> +<https://datasheets.raspberrypi.com/camera/raspberry-pi-image-signal-processor-specification.pdf>_`
> +provide detailed description of the ISP back end configuration and programming
> +model.
> +
> +Global configuration data
> +-------------------------
> +
> +The global configuration data describe how the pixels in a particular image are
> +to be processed and is therefore shared across all the tiles of the image. So
> +for example, LSC (Lens Shading Correction) or Denoise parameters would be common
> +across all tiles from the same frame.
> +
> +Global configuration data are passed to the ISP by populating the member of
> +:c:type:`pisp_be_config`.
> +
> +Tile parameters
> +---------------
> +
> +As the ISP processes images in tiles, each set of tiles parameters describe how
> +a single tile in an image is going to be processed. A single set of tile
> +parameters consist of 160 bytes of data and to process a batch of tiles several
> +sets of tiles parameters are required.
> +
> +Tiles parameters are passed to the ISP by populating the member of
> +:c:type:`pisp_tile` and the :c:type:`num_tiles` field.
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index ee97643ff3a7..7c684788997c 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1465,6 +1465,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>  	case V4L2_PIX_FMT_Y210:		descr = "10-bit YUYV Packed"; break;
>  	case V4L2_PIX_FMT_Y212:		descr = "12-bit YUYV Packed"; break;
>  	case V4L2_PIX_FMT_Y216:		descr = "16-bit YUYV Packed"; break;
> +	case V4L2_META_FMT_RPI_BE_CFG:	descr = "RPi PiSP BE Config format"; break;
>  	case V4L2_META_FMT_GENERIC_8:	descr = "8-bit Generic Metadata"; break;
>  	case V4L2_META_FMT_GENERIC_CSI2_10:	descr = "8-bit Generic Meta, 10b CSI-2"; break;
>  	case V4L2_META_FMT_GENERIC_CSI2_12:	descr = "8-bit Generic Meta, 12b CSI-2"; break;
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index dd6876380fe3..530898b5b342 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -843,6 +843,9 @@ struct v4l2_pix_format {
>  #define V4L2_META_FMT_RK_ISP1_PARAMS	v4l2_fourcc('R', 'K', '1', 'P') /* Rockchip ISP1 3A Parameters */
>  #define V4L2_META_FMT_RK_ISP1_STAT_3A	v4l2_fourcc('R', 'K', '1', 'S') /* Rockchip ISP1 3A Statistics */
>  
> +/* Vendor specific - used for RaspberryPi PiSP */
> +#define V4L2_META_FMT_RPI_BE_CFG 	v4l2_fourcc('R', 'P', 'B', 'C') /* PiSP BE configuration */
> +
>  #ifdef __KERNEL__
>  /*
>   * Line-based metadata formats. Remember to update v4l_fill_fmtdesc() when

-- 
Kind regards,

Sakari Ailus

