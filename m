Return-Path: <linux-media+bounces-21684-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A6D9D3F44
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2024 16:43:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A69B41F24D40
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2024 15:43:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7AA313BC39;
	Wed, 20 Nov 2024 15:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b="DBTlBHZz"
X-Original-To: linux-media@vger.kernel.org
Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630081369B4
	for <linux-media@vger.kernel.org>; Wed, 20 Nov 2024 15:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732117411; cv=none; b=m0cWo0Y30ai1/ovzUOSQQsyZj+9VfyxRjplQ+Myl+ENDT7z27jgxCKc50om/FMsyo23V1UvfR77js/DZocp7PJWqoUMltuqg3DRtbnq8ks17I+FJXtTMSlbivCk2HQnlRaNl705ROqkr6SJyPYsdUPLEjywURioftbRODfLPrCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732117411; c=relaxed/simple;
	bh=n7krYv8irMilQSiI9yW0xyO1Mm9nXGP9jSNFzPpXqGI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:
	 References:In-Reply-To; b=RPhAkbEfLQsFkBAUc78G7o4rCgd7RSO6jEtKKty4I2vFEYn64ynPaNyMkqtvqcEsaSwlGCXKdOHfM92vfYwu+CUSgbn8llySpJKAAICLKywm7dOK/MWyvMsKYIWcv0akhBhtm2UhiCPGnYeEqjVTaLvAZUIpTT7LoP00tF9uSzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org; spf=pass smtp.mailfrom=cknow.org; dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b=DBTlBHZz; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow.org
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1732117404;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ijQiYTo0MvMqRbNI+nXr/6jG3DNVFiqWLypIQ4tp2GQ=;
	b=DBTlBHZzytFj+n1f8kvCoCVM5a86U9PQK68XJJhVVuVgXe73SOkiolNFeI8aBMEPV6Usv3
	9v+NyzlhR7rsOqc2JGkGEMpF+paIACUeXG9b8cvG23lSL5k2IE8kZh+KfFAfpDuo5fYj6Y
	z7p0tCb5hybS/fAmzoPObSFKZ3c1l+51bHMsq70MYqGckgJD89O/lgxuyNV2EwOtY44Nuj
	DB+Pk2h2RoCROpZuFlNNuMW4Wfx7oaAELuBbWdWOwDRoMw1RqXub7VGq8n67huLwzgeuPf
	ssxN+qaNzeMaWWVz6Td3H3AEstWvzcE2J9l8mDxAPtTB9wCo9qWEhiewHSrzPg==
Content-Type: multipart/signed;
 boundary=362558ba14649f8628571f03aa27dfee1e8f08fb67a13bd40c8920dc409c;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Date: Wed, 20 Nov 2024 16:43:12 +0100
Message-Id: <D5R4DD00Z0A4.3BHMO8E5IZ6CH@cknow.org>
Subject: Re: [PATCH v2 1/3] media: uapi: add WebP uAPI
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Hugues Fruchet" <hugues.fruchet@foss.st.com>, "Mauro Carvalho Chehab"
 <mchehab@kernel.org>, "Ezequiel Garcia" <ezequiel@vanguardiasur.com.ar>,
 "Philipp Zabel" <p.zabel@pengutronix.de>, "Hans Verkuil"
 <hverkuil-cisco@xs4all.nl>, "Fritz Koenig" <frkoenig@chromium.org>,
 "Sebastian Fricke" <sebastian.fricke@collabora.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Andrzej Pietrasiewicz"
 <andrzej.p@collabora.com>, "Nicolas Dufresne"
 <nicolas.dufresne@collabora.com>, "Benjamin Gaignard"
 <benjamin.gaignard@collabora.com>, <linux-media@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-rockchip@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>
References: <20241120110105.244413-1-hugues.fruchet@foss.st.com>
 <20241120110105.244413-2-hugues.fruchet@foss.st.com>
In-Reply-To: <20241120110105.244413-2-hugues.fruchet@foss.st.com>
X-Migadu-Flow: FLOW_OUT

--362558ba14649f8628571f03aa27dfee1e8f08fb67a13bd40c8920dc409c
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed Nov 20, 2024 at 12:01 PM CET, Hugues Fruchet wrote:
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
> ...
>
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst =
b/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
> index 806ed73ac474..e664e70b0619 100644
> --- a/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
> @@ -169,6 +169,21 @@ Compressed Formats
>  	this pixel format. The output buffer must contain the appropriate numbe=
r
>  	of macroblocks to decode a full corresponding frame to the matching
>  	capture buffer.
> +    * .. _V4L2-PIX-FMT-WEBP-FRAME:
> +
> +      - ``V4L2_PIX_FMT_WEBP_FRAME``
> +      - 'WEBP'
> +      - WEBP VP8 parsed frame, excluding WEBP RIFF header, keeping only =
the VP8
> +	bistream including the frame header, as extracted from the container.

s/bistream/bitstream/ ?

> +	This format is adapted for stateless video decoders that implement a
> +	WEBP pipeline with the :ref:`stateless_decoder`.
> +	Metadata associated with the frame to decode is required to be passed
> +	through the ``V4L2_CID_STATELESS_VP8_FRAME`` control.
> +	See the :ref:`associated Codec Control IDs <v4l2-codec-stateless-vp8>`.
> +	Exactly one output and one capture buffer must be provided for use with
> +	this pixel format. The output buffer must contain the appropriate numbe=
r
> +	of macroblocks to decode a full corresponding frame to the matching
> +	capture buffer.
> =20
>      * .. _V4L2-PIX-FMT-VP9:
> =20

--362558ba14649f8628571f03aa27dfee1e8f08fb67a13bd40c8920dc409c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCZz4DkwAKCRDXblvOeH7b
bl3+AQCQrqorEMx7IHx/yV9Ks+ZGWhPSDsuvFpHTmkJw4/J9CwEAuCPRCAChUMRj
ZKzD27zT1v0e+k8CyZQlSc/Dhg+GmwA=
=dqtH
-----END PGP SIGNATURE-----

--362558ba14649f8628571f03aa27dfee1e8f08fb67a13bd40c8920dc409c--

