Return-Path: <linux-media+bounces-41739-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFAC2B42BFF
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 23:35:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 38743582B35
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 21:35:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7EC32EB872;
	Wed,  3 Sep 2025 21:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JeZ68veM"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42122EEC0
	for <linux-media@vger.kernel.org>; Wed,  3 Sep 2025 21:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756935334; cv=none; b=SK4GM9cWVeP+kPO6tU28sSI3VoPD96MzQqN0y8o8qFqflnT3KLJGqJJBVthQmHkaMYkNzCff8Gbfqfk2cWNi1P+fO12v0gufKlCjnASGRz1ajm6LqN6pb27ApGvd44zZGmNiZL3EGcdt9lxuzs9KpB06oxo+qVkoayfvpqJ/fx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756935334; c=relaxed/simple;
	bh=cUBkkUV+Uv6l/sYKGEwMFrtmw6hoTrqqhuJZ4xi7lKU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GVavYoDbyT9UFimJejLQh1pYApo1Bf1Gc3Z2AJe7K7DDX3BaFwIja4jxgLO80bLVtzvGy3tHC7RKKZ0Wt6dy7/7iLSoTwUst7qyUB/XlZ+i2HY9mNhGIu2ZHIy87XhEapugz3l0yxf0LU1vCuAgOk2r0vRZ46R0TPKkZdj99rus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=JeZ68veM; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (230.215-178-91.adsl-dyn.isp.belgacom.be [91.178.215.230])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 8A8DF6F3;
	Wed,  3 Sep 2025 23:34:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756935260;
	bh=cUBkkUV+Uv6l/sYKGEwMFrtmw6hoTrqqhuJZ4xi7lKU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JeZ68veMA9ELAGde6R9FeXJSqiN1scmjB+nVLp9dBTMnvuPS4zBSlcVROLJUJl636
	 QNWDgoRCnZvBXbNqrdSbvTRNu5+OVcxnx6UezTpUgqawlvg7AeSFkcfDRix8tjkfpB
	 +xLJFuslKPLPPdUYyID8MMN0lPl7kkL4CurUa0BM=
Date: Wed, 3 Sep 2025 23:35:07 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	"Cao, Bingbu" <bingbu.cao@intel.com>,
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
	"Wang, Hongju" <hongju.wang@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v11 37/66] media: uapi: Correct generic CSI-2 metadata
 format 4cc
Message-ID: <20250903213507.GB3648@pendragon.ideasonboard.com>
References: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
 <20250825095107.1332313-38-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250825095107.1332313-38-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Mon, Aug 25, 2025 at 12:50:38PM +0300, Sakari Ailus wrote:
> Rework the pixelformat 4cc for CSI-2 generic metadata, the 16- and 24-bit
> variants are not specific to CSI-2. This can be done as no driver uses
> this yet and the interface is disabled.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  .../media/v4l/metafmt-generic.rst             | 37 +++++++++----------
>  .../media/pci/intel/ipu6/ipu6-isys-video.c    |  2 +-
>  drivers/media/v4l2-core/v4l2-ioctl.c          |  8 ++--
>  include/uapi/linux/videodev2.h                | 12 +++---
>  4 files changed, 29 insertions(+), 30 deletions(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/metafmt-generic.rst b/Documentation/userspace-api/media/v4l/metafmt-generic.rst
> index e8824b5a65d6..ca960907efde 100644
> --- a/Documentation/userspace-api/media/v4l/metafmt-generic.rst
> +++ b/Documentation/userspace-api/media/v4l/metafmt-generic.rst
> @@ -1,7 +1,7 @@
>  .. SPDX-License-Identifier: GPL-2.0 OR GFDL-1.1-no-invariants-or-later
>  
>  ********************************************************************************************************************************************************************************************************************************************************************************
> -V4L2_META_FMT_GENERIC_8 ('MET8'), V4L2_META_FMT_GENERIC_CSI2_10 ('MC1A'), V4L2_META_FMT_GENERIC_CSI2_12 ('MC1C'), V4L2_META_FMT_GENERIC_CSI2_14 ('MC1E'), V4L2_META_FMT_GENERIC_CSI2_16 ('MC1G'), V4L2_META_FMT_GENERIC_CSI2_20 ('MC1K'), V4L2_META_FMT_GENERIC_CSI2_24 ('MC1O')
> +V4L2_META_FMT_GENERIC_8 ('MET8'), V4L2_META_FMT_GENERIC_CSI2_10 ('MECA'), V4L2_META_FMT_GENERIC_CSI2_12 ('MECC'), V4L2_META_FMT_GENERIC_CSI2_14 ('MECE'), V4L2_META_FMT_GENERIC_16 ('METG'), V4L2_META_FMT_GENERIC_CSI2_20 ('MECK'), V4L2_META_FMT_GENERIC_24 ('METO')
>  ********************************************************************************************************************************************************************************************************************************************************************************
>  
>  
> @@ -29,7 +29,7 @@ is used on CSI-2 for 8 bits per :term:`Data Unit`.
>  
>  Additionally it is used for 16 bits per Data Unit when two bytes of metadata are
>  packed into one 16-bit Data Unit. Otherwise the 16 bits per pixel dataformat is
> -:ref:`V4L2_META_FMT_GENERIC_CSI2_16 <v4l2-meta-fmt-generic-csi2-16>`.
> +:ref:`V4L2_META_FMT_GENERIC_16 <v4l2-meta-fmt-generic-16>`.
>  
>  **Byte Order Of V4L2_META_FMT_GENERIC_8.**
>  Each cell is one byte. "M" denotes a byte of metadata.
> @@ -112,8 +112,8 @@ the data is defined in the MIPI CCS specification.
>  
>  This format is also used in conjunction with 24 bits per :term:`Data Unit`
>  formats that pack two bytes of metadata into one Data Unit. Otherwise the
> -24 bits per pixel dataformat is :ref:`V4L2_META_FMT_GENERIC_CSI2_24
> -<v4l2-meta-fmt-generic-csi2-24>`.
> +24 bits per pixel dataformat is :ref:`V4L2_META_FMT_GENERIC_24
> +<v4l2-meta-fmt-generic-24>`.
>  
>  This format is little endian.
>  
> @@ -185,14 +185,14 @@ Each cell is one byte. "M" denotes a byte of metadata and "x" a byte of padding.
>        - x
>        - x
>  
> -.. _v4l2-meta-fmt-generic-csi2-16:
> +.. _v4l2-meta-fmt-generic-16:
>  
> -V4L2_META_FMT_GENERIC_CSI2_16
> ------------------------------
> +V4L2_META_FMT_GENERIC_16
> +------------------------
>  
> -V4L2_META_FMT_GENERIC_CSI2_16 contains 8-bit generic metadata packed in 16-bit
> -Data Units, with one padding byte after every byte of metadata. This format is
> -typically used by CSI-2 receivers with a source that transmits
> +V4L2_META_FMT_GENERIC_16 contains 8-bit generic metadata packed in 16-bit Data
> +Units, with one padding byte after every byte of metadata. This format is
> +also used by CSI-2 receivers with a source that transmits
>  MEDIA_BUS_FMT_META_16 and the CSI-2 receiver writes the received data to memory

MEDIA_BUS_FMT_META_16 fits on the previous line.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  as-is.
>  
> @@ -205,7 +205,7 @@ Some devices support more efficient packing of metadata in conjunction with
>  
>  This format is little endian.
>  
> -**Byte Order Of V4L2_META_FMT_GENERIC_CSI2_16.**
> +**Byte Order Of V4L2_META_FMT_GENERIC_16.**
>  Each cell is one byte. "M" denotes a byte of metadata and "x" a byte of padding.
>  
>  .. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{.8cm}|p{1.2cm}|p{.8cm}|p{1.2cm}|p{.8cm}|p{1.2cm}|p{.8cm}|
> @@ -287,16 +287,15 @@ Each cell is one byte. "M" denotes a byte of metadata and "x" a byte of padding.
>        - x
>        - x
>  
> -.. _v4l2-meta-fmt-generic-csi2-24:
> +.. _v4l2-meta-fmt-generic-24:
>  
> -V4L2_META_FMT_GENERIC_CSI2_24
> ------------------------------
> +V4L2_META_FMT_GENERIC_24
> +------------------------
>  
> -V4L2_META_FMT_GENERIC_CSI2_24 contains 8-bit generic metadata packed in 24-bit
> -Data Units, with two padding bytes after every byte of metadata. This format is
> -typically used by CSI-2 receivers with a source that transmits
> -MEDIA_BUS_FMT_META_24 and the CSI-2 receiver writes the received data to memory
> -as-is.
> +V4L2_META_FMT_GENERIC_24 contains 8-bit generic metadata packed in 24-bit Data
> +Units, with two padding bytes after every byte of metadata. This format is also
> +used by CSI-2 receivers with a source that transmits MEDIA_BUS_FMT_META_24 and
> +the CSI-2 receiver writes the received data to memory as-is.
>  
>  The packing of the data follows the MIPI CSI-2 specification and the padding of
>  the data is defined in the MIPI CCS specification.
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
> index f3f3bc0615e5..e1306b9510e7 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
> +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
> @@ -91,7 +91,7 @@ const struct ipu6_isys_pixelformat ipu6_isys_pfmts[] = {
>  	  IPU6_FW_ISYS_FRAME_FORMAT_RAW10, true },
>  	{ V4L2_META_FMT_GENERIC_CSI2_12, 12, 12, MEDIA_BUS_FMT_META_12,
>  	  IPU6_FW_ISYS_FRAME_FORMAT_RAW12, true },
> -	{ V4L2_META_FMT_GENERIC_CSI2_16, 16, 16, MEDIA_BUS_FMT_META_16,
> +	{ V4L2_META_FMT_GENERIC_16, 16, 16, MEDIA_BUS_FMT_META_16,
>  	  IPU6_FW_ISYS_FRAME_FORMAT_RAW16, true },
>  };
>  
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index e538c1230631..d197002d640d 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1487,9 +1487,9 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>  	case V4L2_META_FMT_GENERIC_CSI2_10:	descr = "8-bit Generic Meta, 10b CSI-2"; break;
>  	case V4L2_META_FMT_GENERIC_CSI2_12:	descr = "8-bit Generic Meta, 12b CSI-2"; break;
>  	case V4L2_META_FMT_GENERIC_CSI2_14:	descr = "8-bit Generic Meta, 14b CSI-2"; break;
> -	case V4L2_META_FMT_GENERIC_CSI2_16:	descr = "8-bit Generic Meta, 16b CSI-2"; break;
> +	case V4L2_META_FMT_GENERIC_16:	descr = "8-bit Generic Meta, 16b"; break;
>  	case V4L2_META_FMT_GENERIC_CSI2_20:	descr = "8-bit Generic Meta, 20b CSI-2"; break;
> -	case V4L2_META_FMT_GENERIC_CSI2_24:	descr = "8-bit Generic Meta, 24b CSI-2"; break;
> +	case V4L2_META_FMT_GENERIC_24:	descr = "8-bit Generic Meta, 24b"; break;
>  
>  	default:
>  		/* Compressed formats */
> @@ -1576,9 +1576,9 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>  		case V4L2_META_FMT_GENERIC_CSI2_10:
>  		case V4L2_META_FMT_GENERIC_CSI2_12:
>  		case V4L2_META_FMT_GENERIC_CSI2_14:
> -		case V4L2_META_FMT_GENERIC_CSI2_16:
> +		case V4L2_META_FMT_GENERIC_16:
>  		case V4L2_META_FMT_GENERIC_CSI2_20:
> -		case V4L2_META_FMT_GENERIC_CSI2_24:
> +		case V4L2_META_FMT_GENERIC_24:
>  			fmt->flags |= V4L2_FMT_FLAG_META_LINE_BASED;
>  			break;
>  		default:
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index c4c4f3eb67e1..6a5d9ac7bdb9 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -896,12 +896,12 @@ struct v4l2_pix_format {
>   * adding new ones!
>   */
>  #define V4L2_META_FMT_GENERIC_8		v4l2_fourcc('M', 'E', 'T', '8') /* Generic 8-bit metadata */
> -#define V4L2_META_FMT_GENERIC_CSI2_10	v4l2_fourcc('M', 'C', '1', 'A') /* 10-bit CSI-2 packed 8-bit metadata */
> -#define V4L2_META_FMT_GENERIC_CSI2_12	v4l2_fourcc('M', 'C', '1', 'C') /* 12-bit CSI-2 packed 8-bit metadata */
> -#define V4L2_META_FMT_GENERIC_CSI2_14	v4l2_fourcc('M', 'C', '1', 'E') /* 14-bit CSI-2 packed 8-bit metadata */
> -#define V4L2_META_FMT_GENERIC_CSI2_16	v4l2_fourcc('M', 'C', '1', 'G') /* 16-bit CSI-2 packed 8-bit metadata */
> -#define V4L2_META_FMT_GENERIC_CSI2_20	v4l2_fourcc('M', 'C', '1', 'K') /* 20-bit CSI-2 packed 8-bit metadata */
> -#define V4L2_META_FMT_GENERIC_CSI2_24	v4l2_fourcc('M', 'C', '1', 'O') /* 24-bit CSI-2 packed 8-bit metadata */
> +#define V4L2_META_FMT_GENERIC_CSI2_10	v4l2_fourcc('M', 'E', 'C', 'A') /* 10-bit CSI-2 packed 8-bit metadata */
> +#define V4L2_META_FMT_GENERIC_CSI2_12	v4l2_fourcc('M', 'E', 'C', 'C') /* 12-bit CSI-2 packed 8-bit metadata */
> +#define V4L2_META_FMT_GENERIC_CSI2_14	v4l2_fourcc('M', 'E', 'C', 'E') /* 14-bit CSI-2 packed 8-bit metadata */
> +#define V4L2_META_FMT_GENERIC_16	v4l2_fourcc('M', 'E', 'T', 'G') /* Generic 16-bit 8-bit metadata */
> +#define V4L2_META_FMT_GENERIC_CSI2_20	v4l2_fourcc('M', 'E', 'C', 'K') /* 20-bit CSI-2 packed 8-bit metadata */
> +#define V4L2_META_FMT_GENERIC_24	v4l2_fourcc('M', 'E', 'T', 'O') /* Generic 24-bit 8-bit metadata */
>  #endif
>  
>  /* priv field value to indicates that subsequent fields are valid. */

-- 
Regards,

Laurent Pinchart

