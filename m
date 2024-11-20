Return-Path: <linux-media+bounces-21639-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 455049D3CE0
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2024 14:58:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AF07EB27659
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2024 13:58:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 276A21AAE13;
	Wed, 20 Nov 2024 13:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="mWzz4+AQ"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2227A19CC1C;
	Wed, 20 Nov 2024 13:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732111075; cv=none; b=Y7aDbi5uHUL97Z43H9MSZgpFo7Icg0c5LVhuZi7OtwAcWM3Adf3Hc1hCPU8DsO+3ndpvqcGQY6/L91v7Bq7TOs3hSF82kpV/it1za4vVgKLxYOlQLrTkYE36MUv+XengO3cX44rw1BMIdGWefFNVSFjf0DjQqiSgR12DtF68TUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732111075; c=relaxed/simple;
	bh=JioEN8RRj6ihvI/G0TuyhLDjOR5w9SeO0oWhpyVfsN4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iyTocUTt9ssWK8NyQkjFSTAHJK7h1ErIsWjp/6f0v9cJfs9xHDchMmQwtWrCy6hWO4U9IRK3pwYpId8+aQstwVt/axoUbw5H49SNOITtbtO+FI2VH+Um03tSQGTgJOO7/9C/fhdK6UQ61J/R/TXqwyj1IuKz7OjNLBsjuVd5YAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=mWzz4+AQ; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1732111071;
	bh=JioEN8RRj6ihvI/G0TuyhLDjOR5w9SeO0oWhpyVfsN4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=mWzz4+AQWzYPfWrUc4XobsCU3dmQC+00wxfM4tkh8+/K9sAUiRUkmGu96kE4LmAav
	 upt9ohgvF3+bcZ/kv5jYivgXO5WaPAKo5RJb9hvtCbsXsTRLKH4ojclmnKWbg309K+
	 uqV0+TqAYKTtmYP1M3ZEPJdI6X7jrA1pkuA3y+dizUrokpp8CWjpz/R5dcLnErR6t2
	 ptsD+xcvpkL2WeL5UqWEewXxNA53H+n9Qk//s9l4tnJD5TPsGls0haHJWYuTLpf7BE
	 tGPiyAAh7nUnfDXfxVu7GQwklJI35iugt6p6NP4pYDSK4RYSY5mSWtMvJ2vwT211jY
	 QxirMHL5TZLWg==
Received: from nicolas-tpx395.localdomain (unknown [IPv6:2606:6d00:15:862e::580])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9539917E35E3;
	Wed, 20 Nov 2024 14:57:49 +0100 (CET)
Message-ID: <00c0405112b808929f6a7b8e8375b4182c26086e.camel@collabora.com>
Subject: Re: [PATCH v2 1/3] media: uapi: add WebP uAPI
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Link Mauve <linkmauve@linkmauve.fr>, Hugues Fruchet
	 <hugues.fruchet@foss.st.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Ezequiel Garcia	
 <ezequiel@vanguardiasur.com.ar>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Fritz Koenig
 <frkoenig@chromium.org>, Sebastian Fricke	
 <sebastian.fricke@collabora.com>, Daniel Almeida
 <daniel.almeida@collabora.com>,  Andrzej Pietrasiewicz
 <andrzej.p@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, 	linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Date: Wed, 20 Nov 2024 08:57:48 -0500
In-Reply-To: <Zz3nK9FvSpxgVzmo@desktop>
References: <20241120110105.244413-1-hugues.fruchet@foss.st.com>
	 <20241120110105.244413-2-hugues.fruchet@foss.st.com>
	 <Zz3nK9FvSpxgVzmo@desktop>
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

Hi,

Le mercredi 20 novembre 2024 à 14:42 +0100, Link Mauve a écrit :
> Hi,
> 
> On Wed, Nov 20, 2024 at 12:01:03PM +0100, Hugues Fruchet wrote:
> > This patch adds the WebP picture decoding kernel uAPI.
> > 
> > This design is based on currently available VP8 API implementation and
> > aims to support the development of WebP stateless video codecs
> > on Linux.
> 
> Why do you need this new uAPI exactly?  The WebP format is more complex
> than the simple 'VP8 ' format, the 'VP8X' fourcc for instance is an
> animated format which may contain multiple VP8 keyframes, or an alpha
> side channel, and just like any other video container we queue each
> VP8 frame separately in V4L2 for decoding, not the whole file.

This is a v2, you should have read v1 thread before commenting this in my
opinion. Let me resume it: While a VP8 HW decoder is compatible with WebP (lossy
only), a WebP (lossy) decoders are not always compatible wit VP8. The reason is
that some design may sacrifice support for references in order to allow larger
resolutions.

This is proven by Hantro implementation, which is the main implementation out
there since back when Google owned it this hardware design was given away for
free to anyone wanting to support VP8 in HW.

> 
> In Onix[1] I parse the WebP header and pass the raw VP8 frame to V4L2
> without the RIFF around it.
> 
> So I’d rather NACK this patch, I don’t think it’s a good idea to
> hardcode the simplest version of the WebP container in the uAPI, to the
> detriment of all other possible WebP files.

I don't expect the RIFF to be passed to the stateless decoder, this is a
stateless interface that is proposed here. Though, you need the RIFF to determin
if the stream is Lossy WebP (keyframe only), so if someone comes up with a
stateful HW design, it will face the same challenge. As said, what you do in
Onix is valid, but limiting. 

Let's first have a look at the code before taking out big guns, also make sure
you have the full context before proposing to nack something.

regards,
Nicolas

> 
> [1] git clone https://git.linkmauve.fr/onix.git/
> 
> > 
> > Signed-off-by: Hugues Fruchet <hugues.fruchet@foss.st.com>
> > ---
> >  Documentation/userspace-api/media/v4l/biblio.rst  |  9 +++++++++
> >  .../userspace-api/media/v4l/pixfmt-compressed.rst | 15 +++++++++++++++
> >  drivers/media/v4l2-core/v4l2-ioctl.c              |  1 +
> >  include/uapi/linux/videodev2.h                    |  1 +
> >  4 files changed, 26 insertions(+)
> > 
> > diff --git a/Documentation/userspace-api/media/v4l/biblio.rst b/Documentation/userspace-api/media/v4l/biblio.rst
> > index 35674eeae20d..df3e963fc54f 100644
> > --- a/Documentation/userspace-api/media/v4l/biblio.rst
> > +++ b/Documentation/userspace-api/media/v4l/biblio.rst
> > @@ -447,3 +447,12 @@ AV1
> >  :title:     AV1 Bitstream & Decoding Process Specification
> >  
> >  :author:    Peter de Rivaz, Argon Design Ltd, Jack Haughton, Argon Design Ltd
> > +
> > +.. _webp:
> > +
> > +WEBP
> > +====
> > +
> > +:title:     WEBP picture Bitstream & Decoding Process Specification
> > +
> > +:author:    Google (https://developers.google.com/speed/webp)
> > diff --git a/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst b/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
> > index 806ed73ac474..e664e70b0619 100644
> > --- a/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
> > +++ b/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
> > @@ -169,6 +169,21 @@ Compressed Formats
> >  	this pixel format. The output buffer must contain the appropriate number
> >  	of macroblocks to decode a full corresponding frame to the matching
> >  	capture buffer.
> > +    * .. _V4L2-PIX-FMT-WEBP-FRAME:
> > +
> > +      - ``V4L2_PIX_FMT_WEBP_FRAME``
> > +      - 'WEBP'
> > +      - WEBP VP8 parsed frame, excluding WEBP RIFF header, keeping only the VP8
> > +	bistream including the frame header, as extracted from the container.
> > +	This format is adapted for stateless video decoders that implement a
> > +	WEBP pipeline with the :ref:`stateless_decoder`.
> > +	Metadata associated with the frame to decode is required to be passed
> > +	through the ``V4L2_CID_STATELESS_VP8_FRAME`` control.
> > +	See the :ref:`associated Codec Control IDs <v4l2-codec-stateless-vp8>`.
> > +	Exactly one output and one capture buffer must be provided for use with
> > +	this pixel format. The output buffer must contain the appropriate number
> > +	of macroblocks to decode a full corresponding frame to the matching
> > +	capture buffer.
> >  
> >      * .. _V4L2-PIX-FMT-VP9:
> >  
> > diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> > index 0304daa8471d..e2ff03d0d773 100644
> > --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> > +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> > @@ -1501,6 +1501,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
> >  		case V4L2_PIX_FMT_VC1_ANNEX_L:	descr = "VC-1 (SMPTE 412M Annex L)"; break;
> >  		case V4L2_PIX_FMT_VP8:		descr = "VP8"; break;
> >  		case V4L2_PIX_FMT_VP8_FRAME:    descr = "VP8 Frame"; break;
> > +		case V4L2_PIX_FMT_WEBP_FRAME:    descr = "WEBP VP8 Frame"; break;
> >  		case V4L2_PIX_FMT_VP9:		descr = "VP9"; break;
> >  		case V4L2_PIX_FMT_VP9_FRAME:    descr = "VP9 Frame"; break;
> >  		case V4L2_PIX_FMT_HEVC:		descr = "HEVC"; break; /* aka H.265 */
> > diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> > index e7c4dce39007..09fff269e852 100644
> > --- a/include/uapi/linux/videodev2.h
> > +++ b/include/uapi/linux/videodev2.h
> > @@ -757,6 +757,7 @@ struct v4l2_pix_format {
> >  #define V4L2_PIX_FMT_VC1_ANNEX_L v4l2_fourcc('V', 'C', '1', 'L') /* SMPTE 421M Annex L compliant stream */
> >  #define V4L2_PIX_FMT_VP8      v4l2_fourcc('V', 'P', '8', '0') /* VP8 */
> >  #define V4L2_PIX_FMT_VP8_FRAME v4l2_fourcc('V', 'P', '8', 'F') /* VP8 parsed frame */
> > +#define V4L2_PIX_FMT_WEBP_FRAME v4l2_fourcc('W', 'B', 'P', 'F') /* WEBP VP8 parsed frame */
> >  #define V4L2_PIX_FMT_VP9      v4l2_fourcc('V', 'P', '9', '0') /* VP9 */
> >  #define V4L2_PIX_FMT_VP9_FRAME v4l2_fourcc('V', 'P', '9', 'F') /* VP9 parsed frame */
> >  #define V4L2_PIX_FMT_HEVC     v4l2_fourcc('H', 'E', 'V', 'C') /* HEVC aka H.265 */
> > -- 
> > 2.25.1
> > 
> > 
> > _______________________________________________
> > Linux-rockchip mailing list
> > Linux-rockchip@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-rockchip
> 


