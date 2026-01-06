Return-Path: <linux-media+bounces-50077-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 60975CFB11E
	for <lists+linux-media@lfdr.de>; Tue, 06 Jan 2026 22:19:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0292E303FE23
	for <lists+linux-media@lfdr.de>; Tue,  6 Jan 2026 21:17:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 227F42FE58C;
	Tue,  6 Jan 2026 21:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="wKnUZHIL"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC5B296BBF
	for <linux-media@vger.kernel.org>; Tue,  6 Jan 2026 21:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767734224; cv=none; b=EH7D9k40eRT+OgG1/rbZlB7nFBAviiJkk52bGzD+poSrYUbldxTybVzDjmOg0Xlp7bFP0XUaa/sa4ZbIgquI21EyucNaKHwxet3Wkv6oE2myJa+xkaHDZTHZ5wC7xtytMkRIEX6JicECE0ELnel8UxVxqXBnwKoZI6KNMS5rGgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767734224; c=relaxed/simple;
	bh=jHtip6V0HkmReJlbFx/rwoJf80cFxyWcmUxx3DEgCFQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uj2DPuM3bgk29cO9VLg7KuyIZD1L4bTmuctSFxhgKlxVS6Nhe2UpUDuHNpBgCGCNIg1mktciL+7UeRv0KlAQUYABAxG/pWtrnU9PhIdKnmwzf6G1S1/Xwwla30xdpn0MqVlTbLOLgOaqUeLW1NYR/aSXIY7NXY/Jlz6MzP+CtVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=wKnUZHIL; arc=none smtp.client-ip=209.85.222.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f194.google.com with SMTP id af79cd13be357-8b2a4b6876fso176334685a.3
        for <linux-media@vger.kernel.org>; Tue, 06 Jan 2026 13:17:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1767734221; x=1768339021; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7TV2WRsatUGScTT5wRm1AbQhvqUeZU8Yk5dVGjwGAag=;
        b=wKnUZHILwcCTISqj8hdBBq70nRfRZTH50PEPRqQLZmElRcYTS5eA4EdorK/43pdmuq
         ZYnis1/KsXthJRY4S2rT+5KncsSLdl3mJMTC9mmmhmlgcHcsU4YfqzkXdm/6HjS9wiqP
         U848in3eu5rF7E1eLwjtWXHkgyB2Qf84HQroC2goB6MI+G6/6IbydLThSu8kqdqFHqun
         P3H58kK3EUqBcs3FUUJBNzE4ud7qFtk/zPnErs3fPW0akjmfMSCNh84QnEAM81UjynBZ
         q+rekVrsGC6B1UNwerSZ1Rm+E71W09amgj85Fbde/COGQm0nnCMFnkal73MT2DIABVAY
         S3+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767734221; x=1768339021;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7TV2WRsatUGScTT5wRm1AbQhvqUeZU8Yk5dVGjwGAag=;
        b=RZvroWZ43DD0bmkMJwPs6mZrQnHl/OYnWqB+08nClwJ1LU3Mvz3OHDFSACS66q9oYv
         mJ0KX0pESgz3AFixCTzss/YQeidcuiJ+/uCjINwHKDaBphmxkfzOSHjn9vVIDCikOm8j
         lQua1vfoZYSk1kZCl7AANHNIsxuzBiw2gWHJvSZZPiUi7M1m77XnYmFxrcgwhcsjOB3K
         Yh54ab3ryht7KmBpV9EowUCfVtIL5j0ZfuwSSmgqkIMZ9uFALFZ5OzcOwzL0BFG5+pSQ
         OnF/UewAHOo2lUgSOUFWILRW8zU4P4GD+4GKvNQSSLJTyu+FzGx/DreuBnyqkXVSEIsW
         kRpA==
X-Forwarded-Encrypted: i=1; AJvYcCUT6NLbPcGjV9UGbmopTlyBCChJWQ7IUAFJS6ASJAVuLLhYq8elOwnkSut8FBGsu+NFrVRi2M7WjLnOdA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3iNj02X3uwweLb038H9xhauu5njFuta3qotwPg7h7Qejcf+7P
	wiItVTSrWJmtB1daz0YWR56wqMMPwFfggmM2Qwnoo2X1Sa+fsxPM+8PPI806ZPpGlxc=
X-Gm-Gg: AY/fxX48sWOW69l7QC0jP7SkPiXSXqUwxkQ9MltcYggaBx1o9VCXj1Wl1gGPzdbs0nE
	7IN4musxLOZmjMw6YxxHBkFPdadsDhIGTEurWwu/QocBK0hKV5YX2IgpqPO+Z/0Js4AOqHU6GD1
	0TnubLxSlbkDY+20gUy2K8nkTesQ32GAl7oR8MKCfQuiNOeq/se7P3blUlxaaRRTxMLky7JpFnl
	Qx3M5z7kk/6uTg0pPLH0FC0LwHeSxBVT+C/1FdupklGYN7SaNWJhMl2MXHFskcNNgExdQG7BVea
	oUXL1+PYSFF/JyTJY7OZissTJf+t29h8QcYOWCNnKZ9dX2H+8TFFpEYaLQeCKn8lnyqeTqDPTjF
	TMQC98MQ+NFjAi7qoKq+dffgObFOAM2hKI5/XC+WjT8RcHj93raY3w2Izi77XSRgx3XnemIiPTJ
	hpBBDzLCHdXAM02fAw
X-Google-Smtp-Source: AGHT+IEDtBcDNf5d5I+gsrvmMoXJBR0rE9MDwk2UybQnSIliOc1+CIFRNYrlBfOAksp85cLAttnjyw==
X-Received: by 2002:a05:620a:1a19:b0:8a3:cd9e:e3fd with SMTP id af79cd13be357-8c389379de1mr33587185a.9.1767734220893;
        Tue, 06 Jan 2026 13:17:00 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::5ac? ([2606:6d00:17:7b4b::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f5438f6sm235814385a.53.2026.01.06.13.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 13:17:00 -0800 (PST)
Message-ID: <71b286c20cd7806d9788043d11958b4eeeaa819b.camel@ndufresne.ca>
Subject: Re: [PATCH] media: amphion: Drop min_queued_buffers assignment
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: ming.qian@oss.nxp.com, linux-media@vger.kernel.org
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl, 
	sebastian.fricke@collabora.com, shawnguo@kernel.org,
 s.hauer@pengutronix.de, 	kernel@pengutronix.de, festevam@gmail.com,
 linux-imx@nxp.com, Frank.li@nxp.com, 	xiahong.bao@nxp.com,
 eagle.zhou@nxp.com, imx@lists.linux.dev, 	linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Date: Tue, 06 Jan 2026 16:16:58 -0500
In-Reply-To: <20251223062754.836-1-ming.qian@oss.nxp.com>
References: <20251223062754.836-1-ming.qian@oss.nxp.com>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-bX9K4x8lN/AiWznT4ldN"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-bX9K4x8lN/AiWznT4ldN
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 23 d=C3=A9cembre 2025 =C3=A0 14:27 +0800, ming.qian@oss.nxp.com a =
=C3=A9crit=C2=A0:
> From: Ming Qian <ming.qian@oss.nxp.com>
>=20
> The min_queued_buffers field controls when start_streaming() is called
> by the vb2 core (it delays the callback until at least N buffers are
> queued). Setting it to 1 affects the timing of start_streaming(), which
> breaks the seek flow in decoder scenarios and causes test failures.
>=20
> The current driver implementation does not rely on this minimum buffer
> requirement and handles streaming start correctly with the default
> value of 0, so remove these assignments.
>=20
> Fixes: 3cd084519c6f ("media: amphion: add vpu v4l2 m2m support")
> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: stable@vger.kernel.org

> ---
> =C2=A0drivers/media/platform/amphion/vpu_v4l2.c | 2 --
> =C2=A01 file changed, 2 deletions(-)
>=20
> diff --git a/drivers/media/platform/amphion/vpu_v4l2.c
> b/drivers/media/platform/amphion/vpu_v4l2.c
> index 47dff9a35bb4..1fb887b9098c 100644
> --- a/drivers/media/platform/amphion/vpu_v4l2.c
> +++ b/drivers/media/platform/amphion/vpu_v4l2.c
> @@ -670,7 +670,6 @@ static int vpu_m2m_queue_init(void *priv, struct vb2_=
queue
> *src_vq, struct vb2_q
> =C2=A0		src_vq->mem_ops =3D &vb2_vmalloc_memops;
> =C2=A0	src_vq->drv_priv =3D inst;
> =C2=A0	src_vq->buf_struct_size =3D sizeof(struct vpu_vb2_buffer);
> -	src_vq->min_queued_buffers =3D 1;
> =C2=A0	src_vq->dev =3D inst->vpu->dev;
> =C2=A0	src_vq->lock =3D &inst->lock;
> =C2=A0	ret =3D vb2_queue_init(src_vq);
> @@ -687,7 +686,6 @@ static int vpu_m2m_queue_init(void *priv, struct vb2_=
queue
> *src_vq, struct vb2_q
> =C2=A0		dst_vq->mem_ops =3D &vb2_vmalloc_memops;
> =C2=A0	dst_vq->drv_priv =3D inst;
> =C2=A0	dst_vq->buf_struct_size =3D sizeof(struct vpu_vb2_buffer);
> -	dst_vq->min_queued_buffers =3D 1;
> =C2=A0	dst_vq->dev =3D inst->vpu->dev;
> =C2=A0	dst_vq->lock =3D &inst->lock;
> =C2=A0	ret =3D vb2_queue_init(dst_vq);

--=-bX9K4x8lN/AiWznT4ldN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaV17ywAKCRDZQZRRKWBy
9AJvAQCOUqkKAoFddF4SylaesLlyIFIg1BJfhSG9YtxlQRDd0QEAx2tLbQPMsfkV
5Q0sfD2HPdhP0VQqRwP28tOY0jXrQgo=
=Wyl7
-----END PGP SIGNATURE-----

--=-bX9K4x8lN/AiWznT4ldN--

