Return-Path: <linux-media+bounces-4942-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D253485029D
	for <lists+linux-media@lfdr.de>; Sat, 10 Feb 2024 06:18:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 43E95B25ED1
	for <lists+linux-media@lfdr.de>; Sat, 10 Feb 2024 05:18:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15C0DCA7F;
	Sat, 10 Feb 2024 05:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="QI5SSV1W"
X-Original-To: linux-media@vger.kernel.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A6A63BF
	for <linux-media@vger.kernel.org>; Sat, 10 Feb 2024 05:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.248
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707542288; cv=none; b=RElyvNHIKDNZNCzkrOBfhzJEiXimoHSHbtGPq19nZe/kA60d7VIVQUfdQqyTPXgqdTA8W93SjEUmRxr1hvO/VUVMsFzwfRcX15YdX76WY0vmN6zS9aOlx/GpkRfVoDt018utTw5TITf26pmui8lMzrFBo9VsteZuAjgqFe3+65Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707542288; c=relaxed/simple;
	bh=bD/tTDY6qTIEenaKbcIFfFmx2MPU2StbmXOIZ6OOED8=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sPRzq6YDwMUmbCLZZjMyzrPQETWt+ox19kiLae3H3WBOQ2O5yY9PtKJeMaVpkE59oLu45onRNMgqto6038rdciGiYi43ZvgaFxxQkWBo4uZeO5uT2H3A9/ZBqUTu+1KiwsKTPaqugNIlIgbIONZvenzfdP7+pkYZdLUWJFzndJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=QI5SSV1W; arc=none smtp.client-ip=198.47.23.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41A5Hj40084967;
	Fri, 9 Feb 2024 23:17:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1707542265;
	bh=nLJGPzwwrJgp99qlfzngpCC6ULak7lrOZoQeq/skUAg=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=QI5SSV1WUikEQ4uW2Gbe1Z94rfmuR9/DfafDTEWhSI05tiVV3vycTcByFcAigI4Mk
	 mBI0w/yIZ1o23TZRH2VVHRoFUycUmYgEVJ1yDCuuTLkpgbdgm5viq7aHCac6NGickn
	 xW2MVS1IQP5XZkIyP7kWseiGEl4EJ7/oEgLcLPzk=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41A5HjZk097806
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 9 Feb 2024 23:17:45 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 9
 Feb 2024 23:17:44 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 9 Feb 2024 23:17:44 -0600
Received: from localhost (jluthra.dhcp.ti.com [172.24.227.217])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41A5Hiir009953;
	Fri, 9 Feb 2024 23:17:44 -0600
Date: Sat, 10 Feb 2024 10:47:43 +0530
From: Jai Luthra <j-luthra@ti.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
CC: Linux Media Mailing List <linux-media@vger.kernel.org>,
        David Plowman
	<david.plowman@raspberrypi.com>,
        Naushir Patuck <naush@raspberrypi.com>,
        Nick
 Hollinghurst <nick.hollinghurst@raspberrypi.org>,
        Dave Stevenson
	<dave.stevenson@raspberrypi.com>,
        Tomi Valkeinen
	<tomi.valkeinen@ideasonboard.com>,
        Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>,
        Kieran Bingham
	<kieran.bingham@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Hans
 Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>
Subject: Re: [PATCH 2/8] media: Add a pixel format for MIPI packed 14bit luma
 only
Message-ID: <vfdhqj6yw5gsljrpsiftykozazu2o3tcwmjj32s7xm5b2d33k2@6e4azsy5as3k>
References: <20240209164825.166800-1-jacopo.mondi@ideasonboard.com>
 <20240209164825.166800-3-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240209164825.166800-3-jacopo.mondi@ideasonboard.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Hi Jacopo,

Thanks for the patch.

On Feb 09, 2024 at 17:48:17 +0100, Jacopo Mondi wrote:
> From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> 
> This is the format used by monochrome 14bit image sensors.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  .../userspace-api/media/v4l/pixfmt-y14p.rst   | 47 +++++++++++++++++++
>  .../userspace-api/media/v4l/yuv-formats.rst   |  1 +
>  drivers/media/v4l2-core/v4l2-ioctl.c          |  1 +
>  include/uapi/linux/videodev2.h                |  1 +
>  4 files changed, 50 insertions(+)
>  create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-y14p.rst
> 
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-y14p.rst b/Documentation/userspace-api/media/v4l/pixfmt-y14p.rst
> new file mode 100644
> index 000000000000..8e986bc6904f
> --- /dev/null
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-y14p.rst
> @@ -0,0 +1,47 @@
> +.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
> +
> +.. _V4L2-PIX-FMT-Y14P:
> +
> +**************************
> +V4L2_PIX_FMT_Y14P ('Y14P')
> +**************************
> +
> +Grey-scale image as a MIPI RAW14 packed array
> +
> +
> +Description
> +===========
> +
> +This is a packed grey-scale image format with a depth of 14 bits per
> +pixel. Every four consecutive samples are packed into seven bytes. Each
> +of the first four bytes contain the eight high order bits of the pixels,
> +and the three following bytes contains the six least significants bits of
> +each pixel, in the same order.
> +
> +**Byte Order.**
> +Each cell is one byte.
> +
> +.. tabularcolumns:: |p{1.8cm}|p{1.0cm}|p{1.0cm}|p{1.0cm}|p{1.1cm}|p{3.3cm}|p{3.3cm}|p{3.3cm}|
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths:       2 1 1 1 1 3 3 3
> +
> +
> +    -  -  start + 0:
> +       -  Y'\ :sub:`00high`
> +       -  Y'\ :sub:`01high`
> +       -  Y'\ :sub:`02high`
> +       -  Y'\ :sub:`03high`
> +       -  Y'\ :sub:`01low bits 1--0`\ (bits 7--6)
> +
> +	  Y'\ :sub:`00low bits 5--0`\ (bits 5--0)
> +
> +       -  Y'\ :sub:`02low bits 3--0`\ (bits 7--4)
> +
> +	  Y'\ :sub:`01low bits 5--2`\ (bits 3--0)
> +
> +       -  Y'\ :sub:`03low bits 5--0`\ (bits 7--2)
> +
> +	  Y'\ :sub:`02low bits 5--4`\ (bits 1--0)
> diff --git a/Documentation/userspace-api/media/v4l/yuv-formats.rst b/Documentation/userspace-api/media/v4l/yuv-formats.rst
> index 7c9ccfdd94cd..6104747d17d4 100644
> --- a/Documentation/userspace-api/media/v4l/yuv-formats.rst
> +++ b/Documentation/userspace-api/media/v4l/yuv-formats.rst
> @@ -268,6 +268,7 @@ image.
>      pixfmt-yuv-planar
>      pixfmt-yuv-luma
>      pixfmt-y12p
> +    pixfmt-y14p
>      pixfmt-y8i
>      pixfmt-y12i
>      pixfmt-uv8
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 483498c55899..24f52485e59c 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1312,6 +1312,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>  	case V4L2_PIX_FMT_Y10BPACK:	descr = "10-bit Greyscale (Packed)"; break;
>  	case V4L2_PIX_FMT_Y10P:		descr = "10-bit Greyscale (MIPI Packed)"; break;
>  	case V4L2_PIX_FMT_Y12P:		descr = "12-bit Greyscale (MIPI Packed)"; break;
> +	case V4L2_PIX_FMT_Y14P:		descr = "14-bit Greyscale (MIPI Packed)"; break;
>  	case V4L2_PIX_FMT_IPU3_Y10:	descr = "10-bit greyscale (IPU3 Packed)"; break;
>  	case V4L2_PIX_FMT_Y8I:		descr = "Interleaved 8-bit Greyscale"; break;
>  	case V4L2_PIX_FMT_Y12I:		descr = "Interleaved 12-bit Greyscale"; break;
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 11ebf9b22ccb..94a0373e8234 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -599,6 +599,7 @@ struct v4l2_pix_format {
>  #define V4L2_PIX_FMT_Y10BPACK    v4l2_fourcc('Y', '1', '0', 'B') /* 10  Greyscale bit-packed */
>  #define V4L2_PIX_FMT_Y10P    v4l2_fourcc('Y', '1', '0', 'P') /* 10  Greyscale, MIPI RAW10 packed */
>  #define V4L2_PIX_FMT_Y12P    v4l2_fourcc('Y', '1', '2', 'P') /* 12  Greyscale, MIPI RAW12 packed */
> +#define V4L2_PIX_FMT_Y14P    v4l2_fourcc('Y', '1', '4', 'P') /* 14  Greyscale, MIPI RAW12 packed */

I guess comment should have RAW14 instead of RAW12?

>  #define V4L2_PIX_FMT_IPU3_Y10		v4l2_fourcc('i', 'p', '3', 'y') /* IPU3 packed 10-bit greyscale */
>  
>  /* Palette formats */
> -- 
> 2.43.0
> 
> 

-- 
Thanks,
Jai

GPG Fingerprint: 4DE0 D818 E5D5 75E8 D45A AFC5 43DE 91F9 249A 7145

