Return-Path: <linux-media+bounces-21637-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F799D3CB9
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2024 14:47:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5D428B22118
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2024 13:47:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A1921A7274;
	Wed, 20 Nov 2024 13:47:24 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from luna.linkmauve.fr (luna.linkmauve.fr [82.65.109.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B0A46B8;
	Wed, 20 Nov 2024 13:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.65.109.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732110444; cv=none; b=SXoVWxxTCSVy2iDAE7NBWis5zn/5xTrfPZ4VGMW9St5C2TqEAxWWzBKw4M7ihJg20jJTFM4WDYMkQJAUqs2K/SbzLP61aZSlG31wVbZBylU+Ce+1+Kr+hXcd5zLwGi2Gb3EhOdfXdQePf4ifWRu2m3dtJEscsd0Y+zVHYI0ibZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732110444; c=relaxed/simple;
	bh=GP/o+Od12FOpsHcCB1ShPWRmit3YqkCpFr4TAa12ps4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=scO8cR0FuRpbVMX1eQbXAn4AklWyfYIcIHKm9cVLRqO9fkUQPt9mqFYa21AZu+wTbYqc6SEHqK0/cQXeUkohuaTVxwGN8+lUOZjrP4vR1YBop2NGqaRnTRIHQeHpKILOMcf0KdAQFacgV7mfnnFTJBA9TTDaLTq3w0nWRba2P90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr; spf=pass smtp.mailfrom=linkmauve.fr; arc=none smtp.client-ip=82.65.109.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linkmauve.fr
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
	id D522618559CF; Wed, 20 Nov 2024 14:42:03 +0100 (CET)
Date: Wed, 20 Nov 2024 14:42:03 +0100
From: Link Mauve <linkmauve@linkmauve.fr>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Fritz Koenig <frkoenig@chromium.org>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v2 1/3] media: uapi: add WebP uAPI
Message-ID: <Zz3nK9FvSpxgVzmo@desktop>
References: <20241120110105.244413-1-hugues.fruchet@foss.st.com>
 <20241120110105.244413-2-hugues.fruchet@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241120110105.244413-2-hugues.fruchet@foss.st.com>
Jabber-ID: linkmauve@linkmauve.fr

Hi,

On Wed, Nov 20, 2024 at 12:01:03PM +0100, Hugues Fruchet wrote:
> This patch adds the WebP picture decoding kernel uAPI.
> 
> This design is based on currently available VP8 API implementation and
> aims to support the development of WebP stateless video codecs
> on Linux.

Why do you need this new uAPI exactly?  The WebP format is more complex
than the simple 'VP8 ' format, the 'VP8X' fourcc for instance is an
animated format which may contain multiple VP8 keyframes, or an alpha
side channel, and just like any other video container we queue each
VP8 frame separately in V4L2 for decoding, not the whole file.

In Onix[1] I parse the WebP header and pass the raw VP8 frame to V4L2
without the RIFF around it.

So I’d rather NACK this patch, I don’t think it’s a good idea to
hardcode the simplest version of the WebP container in the uAPI, to the
detriment of all other possible WebP files.

[1] git clone https://git.linkmauve.fr/onix.git/

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
> -- 
> 2.25.1
> 
> 
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip

-- 
Link Mauve

