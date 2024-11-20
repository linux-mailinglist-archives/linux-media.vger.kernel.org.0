Return-Path: <linux-media+bounces-21642-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 563259D3D69
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2024 15:21:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 183B7281FA3
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2024 14:21:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E95381AA781;
	Wed, 20 Nov 2024 14:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="hYuovrBb"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C60E5381BA;
	Wed, 20 Nov 2024 14:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732112469; cv=none; b=onQns+2H97cMPgu9NBdwfAEDa8Hy0Q0u06CvMsHnDxAkLtXeHOzX26nmYZKX8RI9KgM6adMxvRLv+uTpTY1scbHhnuhEAlFSX54d0D4gEyR9mFzYqcpiJoDwVke/35EoeDOCfu6IsKnRUAIXXZ4RqXxmom9c7B1rf9KytDZ5KSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732112469; c=relaxed/simple;
	bh=8cTqGsmGudynJgTzvwaLDSQ2AMY2obRkbefKULIFLAc=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rp3Y6ofPo2cqcmv8al/VrWD+RPgot/DypP7/Eb3dJC+CXWlE8KEPsHhExwmJi3rkST7GMxSJbD3veFn2djrMgbcLkplyGYk0WooI7UcZlbo4vyjcmv5vC7SAwLuobVD5xz3PbY7Dc5Bi1rbShJ2zze6sSQoz8E/9Pvh5UYNinOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=hYuovrBb; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1732112465;
	bh=8cTqGsmGudynJgTzvwaLDSQ2AMY2obRkbefKULIFLAc=;
	h=Subject:From:To:Date:In-Reply-To:References:From;
	b=hYuovrBbnjC9qV5BFgycLCS5CYxetYlExRTzAhoz9DlrNaHRjWihVmw1viYzie66z
	 1rIptfWi8JWxY2ZwCH57aXYbbq0DoCvfZznAydZjmjbifAonXLr0G4fMkNNc8RhCa6
	 y9nK1lEB/zvmVQSbEj9oiB3EAuviK6+42wSnI8epjpXSVt70iPz4dgk0RppARE9e5d
	 2eiJBlMJnicjMYE6u3ZkRfw9CHo6rI+FsEYAAgUHi90kIlsYbfvoCJrLEb8E1ON3/n
	 eg4Cc99XgtUxkBYCHTFu0K7Z2jqGmG0ToRaNFK7n0GxpgfugyTAPUm5Sqeroz9le3E
	 xKfkUBHKMol6Q==
Received: from nicolas-tpx395.localdomain (unknown [IPv6:2606:6d00:15:862e::580])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6D86317E3686;
	Wed, 20 Nov 2024 15:21:03 +0100 (CET)
Message-ID: <19cf9e45e00ccf68f35339d8d694e026ffa48037.camel@collabora.com>
Subject: Re: [PATCH v2 1/3] media: uapi: add WebP uAPI
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>, Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, Fritz Koenig	 <frkoenig@chromium.org>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,  Daniel Almeida
 <daniel.almeida@collabora.com>, Andrzej Pietrasiewicz
 <andrzej.p@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com
Date: Wed, 20 Nov 2024 09:21:01 -0500
In-Reply-To: <20241120110105.244413-2-hugues.fruchet@foss.st.com>
References: <20241120110105.244413-1-hugues.fruchet@foss.st.com>
	 <20241120110105.244413-2-hugues.fruchet@foss.st.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.54.1 (3.54.1-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Hughe,

thanks for the update.

Le mercredi 20 novembre 2024 à 12:01 +0100, Hugues Fruchet a écrit :
> This patch adds the WebP picture decoding kernel uAPI.
> 
> This design is based on currently available VP8 API implementation and
> aims to support the development of WebP stateless video codecs
> on Linux.
> 
> Signed-off-by: Hugues Fruchet <hugues.fruchet@foss.st.com>
> ---
>  Documentation/userspace-api/media/v4l/biblio.rst  |  9 +++++++++
>  .../userspace-api/media/v4l/pixfmt-compressed.rst | 15 +++++++++++++++
>  drivers/media/v4l2-core/v4l2-ioctl.c              |  1 +
>  include/uapi/linux/videodev2.h                    |  1 +
>  4 files changed, 26 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/biblio.rst b/Documentation/userspace-api/media/v4l/biblio.rst
> index 35674eeae20d..df3e963fc54f 100644
> --- a/Documentation/userspace-api/media/v4l/biblio.rst
> +++ b/Documentation/userspace-api/media/v4l/biblio.rst
> @@ -447,3 +447,12 @@ AV1
>  :title:     AV1 Bitstream & Decoding Process Specification
>  
>  :author:    Peter de Rivaz, Argon Design Ltd, Jack Haughton, Argon Design Ltd
> +
> +.. _webp:
> +
> +WEBP
> +====
> +
> +:title:     WEBP picture Bitstream & Decoding Process Specification
> +
> +:author:    Google (https://developers.google.com/speed/webp)
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst b/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
> index 806ed73ac474..e664e70b0619 100644
> --- a/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
> @@ -169,6 +169,21 @@ Compressed Formats
>  	this pixel format. The output buffer must contain the appropriate number
>  	of macroblocks to decode a full corresponding frame to the matching
>  	capture buffer.
> +    * .. _V4L2-PIX-FMT-WEBP-FRAME:
> +
> +      - ``V4L2_PIX_FMT_WEBP_FRAME``
> +      - 'WEBP'
> +      - WEBP VP8 parsed frame, excluding WEBP RIFF header, keeping only the VP8
> +	bistream including the frame header, as extracted from the container.
> +	This format is adapted for stateless video decoders that implement a
> +	WEBP pipeline with the :ref:`stateless_decoder`.
> +	Metadata associated with the frame to decode is required to be passed
> +	through the ``V4L2_CID_STATELESS_VP8_FRAME`` control.
> +	See the :ref:`associated Codec Control IDs <v4l2-codec-stateless-vp8>`.
> +	Exactly one output and one capture buffer must be provided for use with
> +	this pixel format. The output buffer must contain the appropriate number
> +	of macroblocks to decode a full corresponding frame to the matching
> +	capture buffer.

I wonder if we should document the constraints, I think
V4L2_VP8_FRAME_FLAG_KEY_FRAME must be set, which imply that last/golden/alt
timestamp are ignored.

With that clarified:

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> 
>  
>      * .. _V4L2-PIX-FMT-VP9:
>  
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 0304daa8471d..e2ff03d0d773 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1501,6 +1501,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>  		case V4L2_PIX_FMT_VC1_ANNEX_L:	descr = "VC-1 (SMPTE 412M Annex L)"; break;
>  		case V4L2_PIX_FMT_VP8:		descr = "VP8"; break;
>  		case V4L2_PIX_FMT_VP8_FRAME:    descr = "VP8 Frame"; break;
> +		case V4L2_PIX_FMT_WEBP_FRAME:    descr = "WEBP VP8 Frame"; break;
>  		case V4L2_PIX_FMT_VP9:		descr = "VP9"; break;
>  		case V4L2_PIX_FMT_VP9_FRAME:    descr = "VP9 Frame"; break;
>  		case V4L2_PIX_FMT_HEVC:		descr = "HEVC"; break; /* aka H.265 */
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index e7c4dce39007..09fff269e852 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -757,6 +757,7 @@ struct v4l2_pix_format {
>  #define V4L2_PIX_FMT_VC1_ANNEX_L v4l2_fourcc('V', 'C', '1', 'L') /* SMPTE 421M Annex L compliant stream */
>  #define V4L2_PIX_FMT_VP8      v4l2_fourcc('V', 'P', '8', '0') /* VP8 */
>  #define V4L2_PIX_FMT_VP8_FRAME v4l2_fourcc('V', 'P', '8', 'F') /* VP8 parsed frame */
> +#define V4L2_PIX_FMT_WEBP_FRAME v4l2_fourcc('W', 'B', 'P', 'F') /* WEBP VP8 parsed frame */
>  #define V4L2_PIX_FMT_VP9      v4l2_fourcc('V', 'P', '9', '0') /* VP9 */
>  #define V4L2_PIX_FMT_VP9_FRAME v4l2_fourcc('V', 'P', '9', 'F') /* VP9 parsed frame */
>  #define V4L2_PIX_FMT_HEVC     v4l2_fourcc('H', 'E', 'V', 'C') /* HEVC aka H.265 */


