Return-Path: <linux-media+bounces-56556-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sPAJIyOGvWnQ+gIAu9opvQ
	(envelope-from <linux-media+bounces-56556-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 18:38:43 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 543F52DEC85
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 18:38:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 821F4302D6AA
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 17:36:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 398343D1CCF;
	Fri, 20 Mar 2026 17:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="vjSSpdgo"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 421703D3331
	for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 17:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774028194; cv=none; b=StW3oJWLovRIG0gmBZVegd0j49fLxJQsMDvDAsBpglREHI1rORpUVs0LFdr18Z6srXBOfets8dW3bQJKGhtV6N491Gr5sQqVmOw+MN3rKSYBx9jgk84Ok7eZD8yloOkj0tZFWa6TkaozZrPU04WQov+QPPtO34K7JfhWFqqZC1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774028194; c=relaxed/simple;
	bh=pfxs9IdNryFjRq069JzIPXLyY6+razRyVFToCMtAUhk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Bqbt0cUPwRUOtPX09sfkAqvZgaJo1/Dt0hwjOdzYkhow96DnGcaRWlje8yRKPm65ca7QS8Pjpsbqx3khMSFHFyC8o3OfDlTh6iUtw4Jl4dtP8dSRVtuWIKHw8Cjo+u541sldImtXF6jS2Ea9mxTXQE4hAOW9xc+P3rNtNahmy4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=vjSSpdgo; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-8cfcb045909so108197085a.0
        for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 10:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1774028192; x=1774632992; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xMAwl75HKNDbj5ZNfCoVlvOAZudKVS7YfwFm4MVhr08=;
        b=vjSSpdgo3RWOtrl94Vy7e6DKKukVUGlYdvsTTuD4hZztwS9xGteGJSrrHGQvmCVrdS
         qhzC5o99kssYmTaihd5/0sJaTQ6m8v3ebdWBOEycJSErL/OyF/Jn978kH4n8AtHyt6d5
         tSjtpD4vFN6faTsNyS1XX0F+RM0Btae9VbFDDbeekYiCxmRKUq6YDWNe8xLfcV3Sr8T+
         YMqWCwkyI6LLpWQvh5cfOcqaKlUBuNHZunbB+QRg3tUp2K/FbiLJEJYR41FNr0KcASKN
         72+EfUc06UgPN+BDPHJW8mk5gRrlVviF8i5j1LdTBVCaviwjWLT/HzgYpIsq2fdWidiB
         Ehww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774028192; x=1774632992;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xMAwl75HKNDbj5ZNfCoVlvOAZudKVS7YfwFm4MVhr08=;
        b=kL4/UfhKgY782/5OFyZIxHB1Rx745C+HpTqTQ/8/cn6vBmCqeTZLgC4teKhrNF6CW+
         6OUEQ/NbaauzjrVcMGOttWZTb6tyEo1HAK435cOYTJBHnuFTJdjgMN+DcW7j4c/agC0r
         J0RW5FY82TumYhgDuKzvgdo0oQnHbwFAem7hGjBKxdbOqhpkPReoaCWPP7gJYWqSvx57
         W4+2b7UEP+ky3V0BEXwSE7H3fdyVv2QmXjTFkv9GrvSC+lpnj8SayiBcwJAA5lst00ks
         1ATW4YKVXNqjwNc827cRONPfqa/KbCspTIHb+FyMkE13IXXrzTB2udoVk9ViCWUEEjPE
         e9NQ==
X-Gm-Message-State: AOJu0YyYM6+xF6aC1wx34Qs636Fa8j/Bntsm8vFi9mgk91IVVvu8iWJ2
	24wDrX01cHpHPgJdvLzYVO5mnfnhlwsHSmOq9AyCiDaiWTEp+37twcecjNa6P/aoynw=
X-Gm-Gg: ATEYQzyfjkCD9PDdKkyxIwl+d2+KtcuC7yO0sbR2rCQTeid/dDAi5yb06kxtQVrfxIA
	6umbvJIdBHMmOgd1ly7lv1Um+weflizX9JXGtmIdu2NKdFN7bI5wT/4/3okqcW944hYfqDiB+AW
	yAC3AvKgWVBtDbl8gunjo5Wb54VQm2h3ZoHN6iGDSHJKBV9itw5KZMR9M7GJeTYvATBEjdD237x
	AS5iweE2Fya5Sw9FI2coEgHLp+gob0lbjkA9s/hhMmiaScpJX6x5gISApfFRGyugHzKZRNN4c/W
	fG3mYK91LRbyikCet7uNirMxIhpo11K+0xPdRIFoSlRf07o1LF9zDqP4Eu6+uuTvCGprCj3pRxD
	YKx4QNB30oUB5DSYYCXcInKHWvrmeRAaOz8qiNB943fd+T1V5z/5Y29dLhC/cI0eeSIRFJhRS1I
	7MvhMS16UdvT4Cf+y2W8ECrhi9hmt6
X-Received: by 2002:a05:620a:288d:b0:8cd:827a:2abd with SMTP id af79cd13be357-8cfc7f8adb8mr551611885a.72.1774028192036;
        Fri, 20 Mar 2026 10:36:32 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:b76d::5ac? ([2606:6d00:11:b76d::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cfc8fa74c1sm203629185a.18.2026.03.20.10.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 10:36:31 -0700 (PDT)
Message-ID: <8e1e1d54371e1eb43405ebe315dc646f15e495d8.camel@ndufresne.ca>
Subject: Re: [PATCH v3 07/27] media: rockchip: rga: use stride for offset
 calculation
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Sven =?ISO-8859-1?Q?P=FCschel?= <s.pueschel@pengutronix.de>, Jacob Chen
	 <jacob-chen@iotwrt.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Rob Herring
	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	 <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, kernel@pengutronix.de
Date: Fri, 20 Mar 2026 13:36:30 -0400
In-Reply-To: <20260127-spu-rga3-v3-7-77b273067beb@pengutronix.de>
References: <20260127-spu-rga3-v3-0-77b273067beb@pengutronix.de>
	 <20260127-spu-rga3-v3-7-77b273067beb@pengutronix.de>
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
	protocol="application/pgp-signature"; boundary="=-IktT+5Q5ygBqkaZSvy5d"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Spamd-Result: default: False [-2.16 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[ndufresne-ca.20230601.gappssmtp.com:s=20230601];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[ndufresne.ca : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56556-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[ndufresne-ca.20230601.gappssmtp.com:+];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas@ndufresne.ca,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.994];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,ndufresne-ca.20230601.gappssmtp.com:dkim,collabora.com:email,ndufresne.ca:mid,pengutronix.de:email]
X-Rspamd-Queue-Id: 543F52DEC85
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--=-IktT+5Q5ygBqkaZSvy5d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 27 janvier 2026 =C3=A0 15:39 +0100, Sven P=C3=BCschel a =C3=A9crit=
=C2=A0:
> Use the stride instead of the width for the offset calculation. This
> ensures that the bytesperline value doesn't need to match the width
> value of the image.
>=20
> Furthermore this patch removes the dependency on the uv_factor property
> and instead reuses the v4l2_format_info to determine the correct
> division factor.
>=20
> Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0drivers/media/platform/rockchip/rga/rga-buf.c | 14 +++++++++-----
> =C2=A0drivers/media/platform/rockchip/rga/rga.c=C2=A0=C2=A0=C2=A0=C2=A0 |=
 16 ----------------
> =C2=A0drivers/media/platform/rockchip/rga/rga.h=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 1 -
> =C2=A03 files changed, 9 insertions(+), 22 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rga/rga-buf.c b/drivers/medi=
a/platform/rockchip/rga/rga-buf.c
> index bb575873f2b24..65fc0d5b4aa10 100644
> --- a/drivers/media/platform/rockchip/rga/rga-buf.c
> +++ b/drivers/media/platform/rockchip/rga/rga-buf.c
> @@ -14,7 +14,6 @@
> =C2=A0#include <media/videobuf2-dma-sg.h>
> =C2=A0#include <media/videobuf2-v4l2.h>
> =C2=A0
> -#include "rga-hw.h"
> =C2=A0#include "rga.h"
> =C2=A0
> =C2=A0static ssize_t fill_descriptors(struct rga_dma_desc *desc, size_t m=
ax_desc,
> @@ -95,14 +94,19 @@ static int rga_buf_init(struct vb2_buffer *vb)
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> -static int get_plane_offset(struct rga_frame *f, int plane)
> +static int get_plane_offset(struct rga_frame *f,
> +			=C2=A0=C2=A0=C2=A0 const struct v4l2_format_info *info,
> +			=C2=A0=C2=A0=C2=A0 int plane)
> =C2=A0{
> +	u32 stride =3D f->pix.plane_fmt[0].bytesperline;
> +
> =C2=A0	if (plane =3D=3D 0)
> =C2=A0		return 0;
> =C2=A0	if (plane =3D=3D 1)
> -		return f->width * f->height;
> +		return stride * f->height;
> =C2=A0	if (plane =3D=3D 2)
> -		return f->width * f->height + (f->width * f->height / f->fmt->uv_facto=
r);
> +		return stride * f->height +
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (stride * f->height / info->hdiv =
/ info->vdiv);
> =C2=A0
> =C2=A0	return -EINVAL;
> =C2=A0}
> @@ -148,7 +152,7 @@ static int rga_buf_prepare(struct vb2_buffer *vb)
> =C2=A0	/* Fill the remaining planes */
> =C2=A0	info =3D v4l2_format_info(f->fmt->fourcc);
> =C2=A0	for (i =3D info->mem_planes; i < info->comp_planes; i++)
> -		offsets[i] =3D get_plane_offset(f, i);
> +		offsets[i] =3D get_plane_offset(f, info, i);
> =C2=A0
> =C2=A0	rbuf->offset.y_off =3D offsets[0];
> =C2=A0	rbuf->offset.u_off =3D offsets[1];
> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/pl=
atform/rockchip/rga/rga.c
> index 338c7796490bc..da4d5bec7a0a5 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -190,7 +190,6 @@ static struct rga_fmt formats[] =3D {
> =C2=A0		.color_swap =3D RGA_COLOR_ALPHA_SWAP,
> =C2=A0		.hw_format =3D RGA_COLOR_FMT_ABGR8888,
> =C2=A0		.depth =3D 32,
> -		.uv_factor =3D 1,
> =C2=A0		.y_div =3D 1,
> =C2=A0		.x_div =3D 1,
> =C2=A0	},
> @@ -199,7 +198,6 @@ static struct rga_fmt formats[] =3D {
> =C2=A0		.color_swap =3D RGA_COLOR_RB_SWAP,
> =C2=A0		.hw_format =3D RGA_COLOR_FMT_ABGR8888,
> =C2=A0		.depth =3D 32,
> -		.uv_factor =3D 1,
> =C2=A0		.y_div =3D 1,
> =C2=A0		.x_div =3D 1,
> =C2=A0	},
> @@ -208,7 +206,6 @@ static struct rga_fmt formats[] =3D {
> =C2=A0		.color_swap =3D RGA_COLOR_RB_SWAP,
> =C2=A0		.hw_format =3D RGA_COLOR_FMT_XBGR8888,
> =C2=A0		.depth =3D 32,
> -		.uv_factor =3D 1,
> =C2=A0		.y_div =3D 1,
> =C2=A0		.x_div =3D 1,
> =C2=A0	},
> @@ -217,7 +214,6 @@ static struct rga_fmt formats[] =3D {
> =C2=A0		.color_swap =3D RGA_COLOR_NONE_SWAP,
> =C2=A0		.hw_format =3D RGA_COLOR_FMT_RGB888,
> =C2=A0		.depth =3D 24,
> -		.uv_factor =3D 1,
> =C2=A0		.y_div =3D 1,
> =C2=A0		.x_div =3D 1,
> =C2=A0	},
> @@ -226,7 +222,6 @@ static struct rga_fmt formats[] =3D {
> =C2=A0		.color_swap =3D RGA_COLOR_RB_SWAP,
> =C2=A0		.hw_format =3D RGA_COLOR_FMT_RGB888,
> =C2=A0		.depth =3D 24,
> -		.uv_factor =3D 1,
> =C2=A0		.y_div =3D 1,
> =C2=A0		.x_div =3D 1,
> =C2=A0	},
> @@ -235,7 +230,6 @@ static struct rga_fmt formats[] =3D {
> =C2=A0		.color_swap =3D RGA_COLOR_RB_SWAP,
> =C2=A0		.hw_format =3D RGA_COLOR_FMT_ABGR4444,
> =C2=A0		.depth =3D 16,
> -		.uv_factor =3D 1,
> =C2=A0		.y_div =3D 1,
> =C2=A0		.x_div =3D 1,
> =C2=A0	},
> @@ -244,7 +238,6 @@ static struct rga_fmt formats[] =3D {
> =C2=A0		.color_swap =3D RGA_COLOR_RB_SWAP,
> =C2=A0		.hw_format =3D RGA_COLOR_FMT_ABGR1555,
> =C2=A0		.depth =3D 16,
> -		.uv_factor =3D 1,
> =C2=A0		.y_div =3D 1,
> =C2=A0		.x_div =3D 1,
> =C2=A0	},
> @@ -253,7 +246,6 @@ static struct rga_fmt formats[] =3D {
> =C2=A0		.color_swap =3D RGA_COLOR_RB_SWAP,
> =C2=A0		.hw_format =3D RGA_COLOR_FMT_BGR565,
> =C2=A0		.depth =3D 16,
> -		.uv_factor =3D 1,
> =C2=A0		.y_div =3D 1,
> =C2=A0		.x_div =3D 1,
> =C2=A0	},
> @@ -262,7 +254,6 @@ static struct rga_fmt formats[] =3D {
> =C2=A0		.color_swap =3D RGA_COLOR_UV_SWAP,
> =C2=A0		.hw_format =3D RGA_COLOR_FMT_YUV420SP,
> =C2=A0		.depth =3D 12,
> -		.uv_factor =3D 4,
> =C2=A0		.y_div =3D 2,
> =C2=A0		.x_div =3D 1,
> =C2=A0	},
> @@ -271,7 +262,6 @@ static struct rga_fmt formats[] =3D {
> =C2=A0		.color_swap =3D RGA_COLOR_UV_SWAP,
> =C2=A0		.hw_format =3D RGA_COLOR_FMT_YUV422SP,
> =C2=A0		.depth =3D 16,
> -		.uv_factor =3D 2,
> =C2=A0		.y_div =3D 1,
> =C2=A0		.x_div =3D 1,
> =C2=A0	},
> @@ -280,7 +270,6 @@ static struct rga_fmt formats[] =3D {
> =C2=A0		.color_swap =3D RGA_COLOR_NONE_SWAP,
> =C2=A0		.hw_format =3D RGA_COLOR_FMT_YUV420SP,
> =C2=A0		.depth =3D 12,
> -		.uv_factor =3D 4,
> =C2=A0		.y_div =3D 2,
> =C2=A0		.x_div =3D 1,
> =C2=A0	},
> @@ -289,7 +278,6 @@ static struct rga_fmt formats[] =3D {
> =C2=A0		.color_swap =3D RGA_COLOR_NONE_SWAP,
> =C2=A0		.hw_format =3D RGA_COLOR_FMT_YUV420SP,
> =C2=A0		.depth =3D 12,
> -		.uv_factor =3D 4,
> =C2=A0		.y_div =3D 2,
> =C2=A0		.x_div =3D 1,
> =C2=A0	},
> @@ -298,7 +286,6 @@ static struct rga_fmt formats[] =3D {
> =C2=A0		.color_swap =3D RGA_COLOR_NONE_SWAP,
> =C2=A0		.hw_format =3D RGA_COLOR_FMT_YUV422SP,
> =C2=A0		.depth =3D 16,
> -		.uv_factor =3D 2,
> =C2=A0		.y_div =3D 1,
> =C2=A0		.x_div =3D 1,
> =C2=A0	},
> @@ -307,7 +294,6 @@ static struct rga_fmt formats[] =3D {
> =C2=A0		.color_swap =3D RGA_COLOR_NONE_SWAP,
> =C2=A0		.hw_format =3D RGA_COLOR_FMT_YUV420P,
> =C2=A0		.depth =3D 12,
> -		.uv_factor =3D 4,
> =C2=A0		.y_div =3D 2,
> =C2=A0		.x_div =3D 2,
> =C2=A0	},
> @@ -316,7 +302,6 @@ static struct rga_fmt formats[] =3D {
> =C2=A0		.color_swap =3D RGA_COLOR_NONE_SWAP,
> =C2=A0		.hw_format =3D RGA_COLOR_FMT_YUV422P,
> =C2=A0		.depth =3D 16,
> -		.uv_factor =3D 2,
> =C2=A0		.y_div =3D 1,
> =C2=A0		.x_div =3D 2,
> =C2=A0	},
> @@ -325,7 +310,6 @@ static struct rga_fmt formats[] =3D {
> =C2=A0		.color_swap =3D RGA_COLOR_UV_SWAP,
> =C2=A0		.hw_format =3D RGA_COLOR_FMT_YUV420P,
> =C2=A0		.depth =3D 12,
> -		.uv_factor =3D 4,
> =C2=A0		.y_div =3D 2,
> =C2=A0		.x_div =3D 2,
> =C2=A0	},
> diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/pl=
atform/rockchip/rga/rga.h
> index 2db10acecb405..477cf5b62bbb2 100644
> --- a/drivers/media/platform/rockchip/rga/rga.h
> +++ b/drivers/media/platform/rockchip/rga/rga.h
> @@ -17,7 +17,6 @@
> =C2=A0struct rga_fmt {
> =C2=A0	u32 fourcc;
> =C2=A0	int depth;
> -	u8 uv_factor;
> =C2=A0	u8 y_div;
> =C2=A0	u8 x_div;
> =C2=A0	u8 color_swap;

--=-IktT+5Q5ygBqkaZSvy5d
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCab2FngAKCRDZQZRRKWBy
9BloAPsHKgr+KaFyY9VVUNheC4oagzZIVyhFpCYJn5gTmsLnQQEAowO96Dv+27KK
DpZZJP6AXY9axehC4NQNZaqzyQAtGAE=
=aIWY
-----END PGP SIGNATURE-----

--=-IktT+5Q5ygBqkaZSvy5d--

