Return-Path: <linux-media+bounces-20331-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 900339B0BB0
	for <lists+linux-media@lfdr.de>; Fri, 25 Oct 2024 19:36:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B45671C212A1
	for <lists+linux-media@lfdr.de>; Fri, 25 Oct 2024 17:36:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3147314277;
	Fri, 25 Oct 2024 17:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="AD6i35HF"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD6C20C330;
	Fri, 25 Oct 2024 17:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729877471; cv=none; b=E/bX2XhzX3U1iiKsilT94Sp+8xVrmkwGIFE0YrvXOmYQz0Db7Of3MIxfz5YXV4jiMGavoP7WlMparikX7o37dr2YXi1XW3d0rfXqr30hnDEAbUOLrsleV0MLeqlsGXZd7XU+W8gsQrHr53/fdbIOTjHwhIKgFoL3KkGExw2RPRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729877471; c=relaxed/simple;
	bh=1Z+cK8hK9nZ0+voBqc5inhySWEagtkKPmPLCPfhVY6o=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QOnbKQBHOcxz4rYFzKV4uW+IsKtSUZ0w1B+isibQ8Lg8sCu9/OtBydqB8///PLlXu/m3LmkQL+YDfFqB9I373tLOFR90KDfldqdDU+wAX3jh2kCUWOL9CsnHUAElLztCW1bwosa5ySXCXqPVZnfANVD6/fFAqAIknTkhz4CGmI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=AD6i35HF; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1729877466;
	bh=1Z+cK8hK9nZ0+voBqc5inhySWEagtkKPmPLCPfhVY6o=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=AD6i35HFT1g6qyXPeOObREgH9kXm0nSkwjrtvhlGli0aD1dIfQV6uPCnLB0vzzH8T
	 fnKxh90gdt2GpSsjoWXydSTxB1+vhVKnb+870IfWXnzcR3bDZ284AsAk8PcU6yWjHD
	 rDvHjla7DVGbMYA7QBP3tHtC3z1QKKyeneRXsb3NgI4zNAPSeW5Jb7SNsDe+yn4lTA
	 +ZMXuSRRTZ2mTvN3pSa9dWUJP9/y+Ct3bbT7JDSDAoB2qqS5fLfXuBp1o3KLAO01mA
	 Tgs+/I71nThuRN0RhNEQpTTv14JlzHrUjag9VRiDLPUzWF0znemwZLExpQewAhD1Ud
	 1U3kQt71+Yfaw==
Received: from nicolas-tpx395.lan (unknown [IPv6:2606:6d00:15:862e::7a9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7D66917E36AD;
	Fri, 25 Oct 2024 19:31:04 +0200 (CEST)
Message-ID: <0fe86c712839e3dec8ccd0d5ac7b9489a5015f42.camel@collabora.com>
Subject: Re: [PATCH v6 02/11] media: v4l2: Add NV15 and NV20 pixel formats
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Jonas Karlman <jonas@kwiboo.se>, Sebastian Fricke
 <sebastian.fricke@collabora.com>, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Alex Bee <knaerzche@gmail.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Detlev Casanova
 <detlev.casanova@collabora.com>, Dan Carpenter <dan.carpenter@linaro.org>, 
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Christopher
 Obbard <chris.obbard@collabora.com>
Date: Fri, 25 Oct 2024 13:31:01 -0400
In-Reply-To: <20240909192522.1076704-3-jonas@kwiboo.se>
References: <20240909192522.1076704-1-jonas@kwiboo.se>
	 <20240909192522.1076704-3-jonas@kwiboo.se>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Le lundi 09 septembre 2024 à 19:25 +0000, Jonas Karlman a écrit :
> Add NV15 and NV20 pixel formats used by the Rockchip Video Decoder for
> 10-bit buffers.
> 
> NV15 and NV20 is 10-bit 4:2:0/4:2:2 semi-planar YUV formats similar to
> NV12 and NV16, using 10-bit components with no padding between each
> component. Instead, a group of 4 luminance/chrominance samples are
> stored over 5 bytes in little endian order:
> 
> YYYY = UVUV = 4 * 10 bits = 40 bits = 5 bytes
> 
> The '15' and '20' suffix refers to the optimum effective bits per pixel
> which is achieved when the total number of luminance samples is a
> multiple of 8 for NV15 and 4 for NV20.
> 
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> Tested-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Tested-by: Christopher Obbard <chris.obbard@collabora.com>
> ---
> v6:
> - No change
> 
> v5:
> - Collect t-b tags
> 
> v4:
> - No change
> 
> v3:
> - Use bpp and bpp_div instead of the misuse of block_w/block_h
> - Update documentation, expand to use full 4x4 sample image
> ---
>  .../media/v4l/pixfmt-yuv-planar.rst           | 128 ++++++++++++++++++
>  drivers/media/v4l2-core/v4l2-common.c         |   2 +
>  drivers/media/v4l2-core/v4l2-ioctl.c          |   2 +
>  include/uapi/linux/videodev2.h                |   2 +
>  4 files changed, 134 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
> index b788f6933855..22cad8c9726b 100644
> --- a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
> @@ -79,6 +79,13 @@ All components are stored with the same number of bits per component.
>        - Cr, Cb
>        - Yes
>        - Linear
> +    * - V4L2_PIX_FMT_NV15

When I look at the existing grouping, all the NV12 variants are together, but
this patch splits them appart, and leaves a distance with its tiled variant
NV15_4L4.

I think I'd prefer to see that right before NV15_4L4, it can also allow removing
redundant wordings between the two.

> +      - 'NV15'
> +      - 10
> +      - 4:2:0
> +      - Cb, Cr
> +      - Yes
> +      - Linear
>      * - V4L2_PIX_FMT_NV12M
>        - 'NM12'
>        - 8
> @@ -172,6 +179,13 @@ All components are stored with the same number of bits per component.
>        - Cr, Cb
>        - Yes
>        - Linear
> +    * - V4L2_PIX_FMT_NV20
> +      - 'NV20'
> +      - 10
> +      - 4:2:2
> +      - Cb, Cr
> +      - Yes
> +      - Linear

Again, following some logic, I'd place that after V4L2_PIX_FMT_NV61M, keeping
all 8bit 4:2:2 formats before the 10bit ones.

>      * - V4L2_PIX_FMT_NV16M
>        - 'NM16'
>        - 8
> @@ -302,6 +316,57 @@ of the luma plane.
>        - Cr\ :sub:`11`
>  
>  
> +.. _V4L2-PIX-FMT-NV15:
> +
> +NV15
> +----
> +
> +Semi-planar 10-bit YUV 4:2:0 format similar to NV12, using 10-bit components
> +with no padding between each component. A group of 4 components are stored over
> +5 bytes in little endian order.
> +
> +.. flat-table:: Sample 4x4 NV15 Image (1 byte per cell)
> +    :header-rows:  0
> +    :stub-columns: 0
> +
> +    * - start + 0:
> +      - Y'\ :sub:`00[7:0]`
> +      - Y'\ :sub:`01[5:0]`\ Y'\ :sub:`00[9:8]`
> +      - Y'\ :sub:`02[3:0]`\ Y'\ :sub:`01[9:6]`
> +      - Y'\ :sub:`03[1:0]`\ Y'\ :sub:`02[9:4]`
> +      - Y'\ :sub:`03[9:2]`
> +    * - start + 5:
> +      - Y'\ :sub:`10[7:0]`
> +      - Y'\ :sub:`11[5:0]`\ Y'\ :sub:`10[9:8]`
> +      - Y'\ :sub:`12[3:0]`\ Y'\ :sub:`11[9:6]`
> +      - Y'\ :sub:`13[1:0]`\ Y'\ :sub:`12[9:4]`
> +      - Y'\ :sub:`13[9:2]`
> +    * - start + 10:
> +      - Y'\ :sub:`20[7:0]`
> +      - Y'\ :sub:`21[5:0]`\ Y'\ :sub:`20[9:8]`
> +      - Y'\ :sub:`22[3:0]`\ Y'\ :sub:`21[9:6]`
> +      - Y'\ :sub:`23[1:0]`\ Y'\ :sub:`22[9:4]`
> +      - Y'\ :sub:`23[9:2]`
> +    * - start + 15:
> +      - Y'\ :sub:`30[7:0]`
> +      - Y'\ :sub:`31[5:0]`\ Y'\ :sub:`30[9:8]`
> +      - Y'\ :sub:`32[3:0]`\ Y'\ :sub:`31[9:6]`
> +      - Y'\ :sub:`33[1:0]`\ Y'\ :sub:`32[9:4]`
> +      - Y'\ :sub:`33[9:2]`
> +    * - start + 20:
> +      - Cb\ :sub:`00[7:0]`
> +      - Cr\ :sub:`00[5:0]`\ Cb\ :sub:`00[9:8]`
> +      - Cb\ :sub:`01[3:0]`\ Cr\ :sub:`00[9:6]`
> +      - Cr\ :sub:`01[1:0]`\ Cb\ :sub:`01[9:4]`
> +      - Cr\ :sub:`01[9:2]`
> +    * - start + 25:
> +      - Cb\ :sub:`10[7:0]`
> +      - Cr\ :sub:`10[5:0]`\ Cb\ :sub:`10[9:8]`
> +      - Cb\ :sub:`11[3:0]`\ Cr\ :sub:`10[9:6]`
> +      - Cr\ :sub:`11[1:0]`\ Cb\ :sub:`11[9:4]`
> +      - Cr\ :sub:`11[9:2]`
> +
> +
>  .. _V4L2-PIX-FMT-NV12MT:
>  .. _V4L2-PIX-FMT-NV12MT-16X16:
>  .. _V4L2-PIX-FMT-NV12-4L4:
> @@ -631,6 +696,69 @@ number of lines as the luma plane.
>        - Cr\ :sub:`32`
>  
>  
> +.. _V4L2-PIX-FMT-NV20:
> +
> +NV20
> +----
> +
> +Semi-planar 10-bit YUV 4:2:2 format similar to NV16, using 10-bit components
> +with no padding between each component. A group of 4 components are stored over
> +5 bytes in little endian order.
> +
> +.. flat-table:: Sample 4x4 NV20 Image (1 byte per cell)
> +    :header-rows:  0
> +    :stub-columns: 0
> +
> +    * - start + 0:
> +      - Y'\ :sub:`00[7:0]`
> +      - Y'\ :sub:`01[5:0]`\ Y'\ :sub:`00[9:8]`
> +      - Y'\ :sub:`02[3:0]`\ Y'\ :sub:`01[9:6]`
> +      - Y'\ :sub:`03[1:0]`\ Y'\ :sub:`02[9:4]`
> +      - Y'\ :sub:`03[9:2]`
> +    * - start + 5:
> +      - Y'\ :sub:`10[7:0]`
> +      - Y'\ :sub:`11[5:0]`\ Y'\ :sub:`10[9:8]`
> +      - Y'\ :sub:`12[3:0]`\ Y'\ :sub:`11[9:6]`
> +      - Y'\ :sub:`13[1:0]`\ Y'\ :sub:`12[9:4]`
> +      - Y'\ :sub:`13[9:2]`
> +    * - start + 10:
> +      - Y'\ :sub:`20[7:0]`
> +      - Y'\ :sub:`21[5:0]`\ Y'\ :sub:`20[9:8]`
> +      - Y'\ :sub:`22[3:0]`\ Y'\ :sub:`21[9:6]`
> +      - Y'\ :sub:`23[1:0]`\ Y'\ :sub:`22[9:4]`
> +      - Y'\ :sub:`23[9:2]`
> +    * - start + 15:
> +      - Y'\ :sub:`30[7:0]`
> +      - Y'\ :sub:`31[5:0]`\ Y'\ :sub:`30[9:8]`
> +      - Y'\ :sub:`32[3:0]`\ Y'\ :sub:`31[9:6]`
> +      - Y'\ :sub:`33[1:0]`\ Y'\ :sub:`32[9:4]`
> +      - Y'\ :sub:`33[9:2]`
> +    * - start + 20:
> +      - Cb\ :sub:`00[7:0]`
> +      - Cr\ :sub:`00[5:0]`\ Cb\ :sub:`00[9:8]`
> +      - Cb\ :sub:`01[3:0]`\ Cr\ :sub:`00[9:6]`
> +      - Cr\ :sub:`01[1:0]`\ Cb\ :sub:`01[9:4]`
> +      - Cr\ :sub:`01[9:2]`
> +    * - start + 25:
> +      - Cb\ :sub:`10[7:0]`
> +      - Cr\ :sub:`10[5:0]`\ Cb\ :sub:`10[9:8]`
> +      - Cb\ :sub:`11[3:0]`\ Cr\ :sub:`10[9:6]`
> +      - Cr\ :sub:`11[1:0]`\ Cb\ :sub:`11[9:4]`
> +      - Cr\ :sub:`11[9:2]`
> +    * - start + 30:
> +      - Cb\ :sub:`20[7:0]`
> +      - Cr\ :sub:`20[5:0]`\ Cb\ :sub:`20[9:8]`
> +      - Cb\ :sub:`21[3:0]`\ Cr\ :sub:`20[9:6]`
> +      - Cr\ :sub:`21[1:0]`\ Cb\ :sub:`21[9:4]`
> +      - Cr\ :sub:`21[9:2]`
> +    * - start + 35:
> +      - Cb\ :sub:`30[7:0]`
> +      - Cr\ :sub:`30[5:0]`\ Cb\ :sub:`30[9:8]`
> +      - Cb\ :sub:`31[3:0]`\ Cr\ :sub:`30[9:6]`
> +      - Cr\ :sub:`31[1:0]`\ Cb\ :sub:`31[9:4]`
> +      - Cr\ :sub:`31[9:2]`
> +
> +
>  .. _V4L2-PIX-FMT-NV24:
>  .. _V4L2-PIX-FMT-NV42:
>  
> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> index 8ad04d48a023..53b6fdfcb4dd 100644
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -277,8 +277,10 @@ const struct v4l2_format_info *v4l2_format_info(u32 format)
>  		/* YUV planar formats */
>  		{ .format = V4L2_PIX_FMT_NV12,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 2 },
>  		{ .format = V4L2_PIX_FMT_NV21,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 2 },
> +		{ .format = V4L2_PIX_FMT_NV15,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 5, 10, 0, 0 }, .bpp_div = { 4, 4, 1, 1 }, .hdiv = 2, .vdiv = 2 },
>  		{ .format = V4L2_PIX_FMT_NV16,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 1 },
>  		{ .format = V4L2_PIX_FMT_NV61,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 1 },
> +		{ .format = V4L2_PIX_FMT_NV20,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 5, 10, 0, 0 }, .bpp_div = { 4, 4, 1, 1 }, .hdiv = 2, .vdiv = 1 },
>  		{ .format = V4L2_PIX_FMT_NV24,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
>  		{ .format = V4L2_PIX_FMT_NV42,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
>  		{ .format = V4L2_PIX_FMT_P010,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 2, 2, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 1 },
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index e14db67be97c..9f09f5cf3e3e 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1360,8 +1360,10 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>  	case V4L2_PIX_FMT_YUV48_12:	descr = "12-bit YUV 4:4:4 Packed"; break;
>  	case V4L2_PIX_FMT_NV12:		descr = "Y/UV 4:2:0"; break;
>  	case V4L2_PIX_FMT_NV21:		descr = "Y/VU 4:2:0"; break;
> +	case V4L2_PIX_FMT_NV15:		descr = "10-bit Y/UV 4:2:0 (Packed)"; break;
>  	case V4L2_PIX_FMT_NV16:		descr = "Y/UV 4:2:2"; break;
>  	case V4L2_PIX_FMT_NV61:		descr = "Y/VU 4:2:2"; break;
> +	case V4L2_PIX_FMT_NV20:		descr = "10-bit Y/UV 4:2:2 (Packed)"; break;
>  	case V4L2_PIX_FMT_NV24:		descr = "Y/UV 4:4:4"; break;
>  	case V4L2_PIX_FMT_NV42:		descr = "Y/VU 4:4:4"; break;
>  	case V4L2_PIX_FMT_P010:		descr = "10-bit Y/UV 4:2:0"; break;
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 725e86c4bbbd..941a96b81672 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -642,8 +642,10 @@ struct v4l2_pix_format {
>  /* two planes -- one Y, one Cr + Cb interleaved  */
>  #define V4L2_PIX_FMT_NV12    v4l2_fourcc('N', 'V', '1', '2') /* 12  Y/CbCr 4:2:0  */
>  #define V4L2_PIX_FMT_NV21    v4l2_fourcc('N', 'V', '2', '1') /* 12  Y/CrCb 4:2:0  */
> +#define V4L2_PIX_FMT_NV15    v4l2_fourcc('N', 'V', '1', '5') /* 15  Y/CbCr 4:2:0 10-bit packed */
>  #define V4L2_PIX_FMT_NV16    v4l2_fourcc('N', 'V', '1', '6') /* 16  Y/CbCr 4:2:2  */
>  #define V4L2_PIX_FMT_NV61    v4l2_fourcc('N', 'V', '6', '1') /* 16  Y/CrCb 4:2:2  */
> +#define V4L2_PIX_FMT_NV20    v4l2_fourcc('N', 'V', '2', '0') /* 20  Y/CbCr 4:2:2 10-bit packed */
>  #define V4L2_PIX_FMT_NV24    v4l2_fourcc('N', 'V', '2', '4') /* 24  Y/CbCr 4:4:4  */
>  #define V4L2_PIX_FMT_NV42    v4l2_fourcc('N', 'V', '4', '2') /* 24  Y/CrCb 4:4:4  */
>  #define V4L2_PIX_FMT_P010    v4l2_fourcc('P', '0', '1', '0') /* 24  Y/CbCr 4:2:0 10-bit per component */


Appart from the location, I'm happy with the implementation and the
documentation.

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>


