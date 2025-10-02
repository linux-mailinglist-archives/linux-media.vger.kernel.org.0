Return-Path: <linux-media+bounces-43671-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B81C0BB5071
	for <lists+linux-media@lfdr.de>; Thu, 02 Oct 2025 21:42:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B717169459
	for <lists+linux-media@lfdr.de>; Thu,  2 Oct 2025 19:42:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 331DE2877DF;
	Thu,  2 Oct 2025 19:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="x9ZeJ/hS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA701285CA2
	for <linux-media@vger.kernel.org>; Thu,  2 Oct 2025 19:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759434128; cv=none; b=FC+rWdKwy7vSYR02h097S5okflCmVSX3V+XRj1O5LlN6aZAfDNHkSeEfUoeTiY+RVdt7IOl82dGeQ1tVt4dmtlD+9W/jsLD58+qbUmf6SHbVUfRi9J7HKEflA18Rai1n7G/OBXPT2olL02QOBJLt6zfhgFxiOZjj1rFW7sXHjTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759434128; c=relaxed/simple;
	bh=9tSwzLcJqvFc3boxKu3LpBjYAdficu1XbyXQfBMYvR8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VTeUvpydADvNjsdQCt8YnyZhHNkR2br/bkxo7Q1+VrtynwOh5xm1slE00xvxCe3BYLZTXFKMJZIMns8Kb0EIFo67sXok3Arb8+w5cL/2Shx8fR9ayIGZHrO3zLj1aQCMtFtNrdNm4ISWb1tlq+wmcXwWlIKpbibudPtycYi1ct0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=x9ZeJ/hS; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-86278558d6fso116287885a.1
        for <linux-media@vger.kernel.org>; Thu, 02 Oct 2025 12:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1759434124; x=1760038924; darn=vger.kernel.org;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9tSwzLcJqvFc3boxKu3LpBjYAdficu1XbyXQfBMYvR8=;
        b=x9ZeJ/hSXddkewfFqwPtfrJLd8YYlTBCkfDroYtxYuOVWl3dGB7cFL8mS9Ta4P+4w8
         c15UOGSAYFA5NDT2jKs3mYL4s0iPxnsUWVVpqBYrBSUhTEtwIoC7KFlVG/oL8VuBZkq7
         WctBGFAFt3rAoo1GoXmXTYzFisyzioaE1mH4k3prag/BazAdZ6nXc+Yy5CbKiPdKKhhR
         2Fqt5RDsjYM1Tz/6U7Dn+K6bVIcHID1wweEOQa5ha+9iH1U4KrWu3SvY6B7GfZ4cSwxq
         l6NeVmy1Q3pnV/5o1j7uBVLol6XfcuvCFfT+RL7NLebyYJYSVcMO7OUkXYchEkVkz4nR
         uPvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759434124; x=1760038924;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9tSwzLcJqvFc3boxKu3LpBjYAdficu1XbyXQfBMYvR8=;
        b=R7MfMHd9pPL87osByyE1mi9gTTcQMdtwpbYTgL8rGWoIDrJeQHtv44rH+txG+HCo86
         2O2gGJ4TULaYmfkLiZuMFgEuTMarj5J882HyxEqsnX6OWLGbEdUbw47YHE8zjGEoCHBl
         L3YhA5GhciauG9UfgieKylxpYrcCVyF+W1tR5PPydszT4X/Fpj3FuX/GQldHkah2DRJa
         T5eIs3Ls3RuGGFQp0FkRupuagFMRtNYc47y8a6PLN2VODk2FsvQ70axhnZlgZLmbpPf3
         VLXkkJs0FQcV717Ws9OoE+fYjX7mHrWn6YqiZVqdKP05RtXn6MJR/sZ5WA55JVSZHWz/
         6+sQ==
X-Gm-Message-State: AOJu0YxaZSqojuhFMwxwwKp6gm4k/sJp8FaY1MnfZGTQ1ljfLhYV7nSa
	Ajxe6cLGBIp6SXALHhRKFcoeuL/gazeYn4aeLOX0mF8siwE82n48uFe4QLYoX494nVxjJKoJAz+
	0Yphoml4=
X-Gm-Gg: ASbGncsnJ2MG4RgbJzvtGZv9tNlD1KlBP3N0tCxlPJNdrT3RiqYkEo5TOZwkC2folLC
	s8JzbhUOGLWk6FwI+u6iMVx/3LweORMfMjxr4wP56myACj7J1f0paXx9UXxw8u+QJlZG8HdoKye
	8DbRnc1QdRwTh6/PgWT+X3pxwpIBHlZdjmdfajG8GePyetOMXnXESSBE+y5uMhIBHaKvEtcxhPO
	aOYLQebkdFEn5fVU1bWVUzyXxMWf446ATsMY1WNIqMwUrIG08obriZWZoeeFSh/dURVIGHwJ0BQ
	lop2cz6jQTm4NCzvOD60i/pMLAEGMORfzdE1uQzjN+3C42L1yMEy4hCrM2FDED8Z82PyjMRgKZ1
	Cz6X3LV93yy3QJLVF2TRePQ1ACMrvgGok+ZeFbp4TwHx8e6VmrJqIjmcLEt5J7to=
X-Google-Smtp-Source: AGHT+IF2Mzaa1GM10qd0Br5Ca6dE3KvWVWpmD5Z0dsxS/0YWrFWGrX8QNt+0sM2dv+vntpuyD8eXFg==
X-Received: by 2002:a05:620a:470e:b0:86e:21a4:473c with SMTP id af79cd13be357-87a33677090mr102716085a.4.1759434123532;
        Thu, 02 Oct 2025 12:42:03 -0700 (PDT)
Received: from ?IPv6:2606:6d00:17:ebd3::5ac? ([2606:6d00:17:ebd3::5ac])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4e55a34aa08sm24890361cf.5.2025.10.02.12.42.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 12:42:02 -0700 (PDT)
Message-ID: <dfe8bdbbf12ec54c7a27888f911082ab63d6030f.camel@ndufresne.ca>
Subject: Re: [PATCH 1/5] media: uapi: videodev2: Add support for AV1
 stateful decoder
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Vikash Garodia
 <vikash.garodia@oss.qualcomm.com>, Dikshita Agarwal	
 <dikshita.agarwal@oss.qualcomm.com>, Abhinav Kumar
 <abhinav.kumar@linux.dev>,  Bryan O'Donoghue	 <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Date: Thu, 02 Oct 2025 15:42:00 -0400
In-Reply-To: <20251001-av1_irisdecoder-v1-1-9fb08f3b96a0@oss.qualcomm.com>
References: <20251001-av1_irisdecoder-v1-0-9fb08f3b96a0@oss.qualcomm.com>
	 <20251001-av1_irisdecoder-v1-1-9fb08f3b96a0@oss.qualcomm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-JQxcsF4r3HFmPr2QkW8f"
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-JQxcsF4r3HFmPr2QkW8f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mercredi 01 octobre 2025 =C3=A0 12:00 -0700, Deepa Guthyappa Madivalara =
a =C3=A9crit=C2=A0:
> Introduce a new pixel format, V4L2_PIX_FMT_AV1, to the
> Video4Linux2(V4L2) API. This format is intended for AV1
> bitstreams in stateful decoding/encoding workflows.
> The fourcc code 'AV10' is used to distinguish
> this format from the existing V4L2_PIX_FMT_AV1_FRAME,
> which is used for stateless AV1 decoder implementation.
>=20
> Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.=
com>
> ---
> =C2=A0Documentation/userspace-api/media/v4l/pixfmt-compressed.rst | 8 +++=
+++++
> =C2=A0include/uapi/linux/videodev2.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 +
> =C2=A02 files changed, 9 insertions(+)
>=20
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
> b/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
> index
> 806ed73ac474ce0e6df00f902850db9fd0db240e..043ec57d7d48a36005f2a0121a5bc7b=
733d0
> 6590 100644
> --- a/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
> @@ -274,6 +274,14 @@ Compressed Formats
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 of macroblocks to decode=
 a full corresponding frame to the matching
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 capture buffer.
> =C2=A0
> +=C2=A0=C2=A0=C2=A0 * .. _V4L2-PIX-FMT-AV1:
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - ``V4L2_PIX_FMT_AV1``
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - 'AV10'
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - AV1 compressed video frame. This format=
 is adapted for implementing
> AV1
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pipeline as stateful video de=
coder. The decoder expects one Temporal

I would do a small edit here. Instead of stating that this is for decoders,=
 I
would rather document the intended behaviour for video codec. This way the =
spec
remains open for CAPTURE driver to produce AV1 in the future, or OUTPUT dri=
ver
consuming it in the future.

> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Unit per buffer from OBU-stre=
am or AnnexB.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 The encoder generates one Tem=
poral Unit per buffer.

Otherwise I'm fine with the proposal of using TU aligned. Similar to other
codecs, we can always allow adapting the behaviour using controls, keeping =
this
as the mandatory default so it just works regardless of the HW we run on.

regards,
Nicolas

> =C2=A0.. raw:: latex
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 \normalsize
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev=
2.h
> index
> becd08fdbddb857f8f2bf205d2164dc6e20e80b2..4c07ad6afd45d6a56d19d65fd25f091=
d8172
> 5823 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -775,6 +775,7 @@ struct v4l2_pix_format {
> =C2=A0#define V4L2_PIX_FMT_H264_SLICE v4l2_fourcc('S', '2', '6', '4') /* =
H264
> parsed slices */
> =C2=A0#define V4L2_PIX_FMT_HEVC_SLICE v4l2_fourcc('S', '2', '6', '5') /* =
HEVC
> parsed slices */
> =C2=A0#define V4L2_PIX_FMT_AV1_FRAME v4l2_fourcc('A', 'V', '1', 'F') /* A=
V1 parsed
> frame */
> +#define V4L2_PIX_FMT_AV1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 v4l2_fourcc('A', =
'V', '1', '0') /* AV1
> (stateful) */
> =C2=A0#define V4L2_PIX_FMT_SPK=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 v4l2_fourcc(=
'S', 'P', 'K', '0') /* Sorenson
> Spark */
> =C2=A0#define V4L2_PIX_FMT_RV30=C2=A0=C2=A0=C2=A0=C2=A0 v4l2_fourcc('R', =
'V', '3', '0') /* RealVideo 8
> */
> =C2=A0#define V4L2_PIX_FMT_RV40=C2=A0=C2=A0=C2=A0=C2=A0 v4l2_fourcc('R', =
'V', '4', '0') /* RealVideo 9
> & 10 */

--=-JQxcsF4r3HFmPr2QkW8f
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaN7ViAAKCRDZQZRRKWBy
9DuGAP48dh5aG0VkfQy/nd4oV9gvVlexbBpR9m3bbWdvTIQb0gD+PuyHmbVeT68A
GmjBcXdiqd0VvgGhvVd02phpj7bicwU=
=vkEq
-----END PGP SIGNATURE-----

--=-JQxcsF4r3HFmPr2QkW8f--

