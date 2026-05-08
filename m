Return-Path: <linux-media+bounces-60982-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sLOCFOxf/mnCpwAAu9opvQ
	(envelope-from <linux-media+bounces-60982-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 09 May 2026 00:13:00 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A74664FC354
	for <lists+linux-media@lfdr.de>; Sat, 09 May 2026 00:12:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 89680301F4AB
	for <lists+linux-media@lfdr.de>; Fri,  8 May 2026 22:11:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09E6733F59C;
	Fri,  8 May 2026 22:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b="kbYYsQnM"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F2333D4F8
	for <linux-media@vger.kernel.org>; Fri,  8 May 2026 22:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778278296; cv=none; b=dFMwvFDLQwNCICbdImCrzjoIyzKCVboe2wpktEY40uZzz9KL5ZG1XdMksOnc1Jr7EXUxILtp4Cxdc9PCrtDnIqQn6bBme4YXPm7lfuAQV1nc4Niq2NpZX7N+k9MTor86mZVRzO1u0YfCUpSokssFdUhkc66HhQUlYjdn457KkrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778278296; c=relaxed/simple;
	bh=N93+oVBLzf4PuI4STk7zWzRO4FnwKeBdOBwpGSgDFVs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XmRxRMxn/7+eTkgDak0Iv7SBegN9Yp3WWLCxkEWym/S8uBf2mSAjsEw9MoYiu08g+Jw+5kDQFgHnAKCGeGFB4QEM9QL+VAayK7YwWMzblViJm+m71tz9P7/ugx303iU7owrndgxQZnc/tVmltgR3gm25JJ3hrdSuUXxRH2yzKdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=kbYYsQnM; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-8b7ec7bedcbso11390076d6.2
        for <linux-media@vger.kernel.org>; Fri, 08 May 2026 15:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1778278294; x=1778883094; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=423hWhSi5+hijWcsdmhIbZKRcVhHLdzm80D5vMOt0CA=;
        b=kbYYsQnMwYHbInkiA+Yc/kSG8D2mtY0soup/MxxcP2RL7g4SX4M3ffSTvOrH5u3QZM
         7Krq3/NQjGhqlsLsH3OV95zu/2E3DSWf5QW6Hm+XS8I5Q/PjwcN09xAHbL0BzZ+bhQti
         2SCkTVS02bhZ5S/6jrrPu05ZWAx6V3JZ7SCfXvW8qRlX0NwPeW11Q5Drgm+td3VktYdM
         9NMUAxrWeE2dUf8xmIl5D4QkP3OFrVnCpyabUdSMxHcuo5b67+jL23I6Tkb7UiN80I2B
         AsH2G4AshcjsnD/NR+nDE+NwFg4R7GNGO2B5slMNNpSlh5F+/oaz7cvrB59pJ3pqwayZ
         XHwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778278294; x=1778883094;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=423hWhSi5+hijWcsdmhIbZKRcVhHLdzm80D5vMOt0CA=;
        b=Gfn0loJVOepevVvxJYX+LfWqy7IEZeP2AIzYbQGOeFSCOuuWXONKOtFLtNECFH9kqZ
         iQwEUPKV2SwClCh/StXbJImu0+DWi6678CEDneC6ad4myJv42timtM5KldJCm0g9J6YT
         DLUlKLUUtdKZWjvWQFywfQCQDHCV+BIbWG401iDt1SCBy4HJuVudUa7kpWDInsvBjWDS
         novzSdQ3DEi1XnTUJ/RhuGvA9G0pIlmjarBG4KlK5QytFoG78LUiyq7SGILqfoTkklTN
         3PsVi3C+YEwFmlyiuQ51h8AnGfDjAFxTPDLmAunBKECZquj7C5VrDdVq1m3xpvpXKW3Y
         ctpg==
X-Gm-Message-State: AOJu0Ywt11qcGMLOB+aXZDuhHLhU6M1iR67oE9sKVvdFt8EnaKgGkovj
	tzPiBkrXirMCMULiwErGxdoYIe53n+HgvfPsKQEFE8vQBdcUF9IKSVP6JbwLVLo2G1A=
X-Gm-Gg: Acq92OH27SJO754pV4xS3YKtvz2X4uRch/c81T3DjNyZayDFhkVTZXA6wzahxYRwaiQ
	bplm55Ly3X9r5wNuT7CnmmvOpOsZE90A9NTYceEFtpaYaju1pqaAPGq2XyJ0ZKUQuUkMdmkcxVo
	ec6iQU1ETD8fcEdULLLlTeuhsfrlVxxkKQ5qMYSf14MjRcL1rTi4y1wZl2nmba3zGniSsrtac3v
	hTN2bZmrPaSDaujzYSpE19WKgQE5FAqmn3Zj9HL3kCFHd1xeVkb0p/v6hwUeG4AvHCuXp2ZXd7T
	iBodDCSn9qIkiazfwlrUD83XtWDbY0rv2S7zyy3RG9cMC2AkvZjzZZKmMXmHSDQulQHpn95STUY
	mbGxnRQOiZHnbvbVyoKr94+RjfhSKZXQq9Lj+lnVDuRWowg6HA/IW0TlQs3d4JM047R7BJ0vWyG
	f/gXiyHmjkHYVJ4hB14ruNp0O1AC82
X-Received: by 2002:a05:6214:8082:b0:8ac:b1ce:3244 with SMTP id 6a1803df08f44-8bc42f522e5mr198672566d6.19.1778278293937;
        Fri, 08 May 2026 15:11:33 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b::5ac? ([2606:6d00:15:e06b::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8bf3a43636fsm29335326d6.21.2026.05.08.15.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 15:11:33 -0700 (PDT)
Message-ID: <ebe5cd6689923eb1e2124e177f694895383fba54.camel@ndufresne.ca>
Subject: Re: [PATCH v5 16/29] media: rockchip: rga: split flip and rotate
 into separate function
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Sven =?ISO-8859-1?Q?P=FCschel?= <s.pueschel@pengutronix.de>, Jacob Chen
	 <jacob-chen@iotwrt.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Rob Herring
	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	 <conor+dt@kernel.org>, Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, kernel@pengutronix.de, 
	sebastian.reichel@collabora.com
Date: Fri, 08 May 2026 18:11:31 -0400
In-Reply-To: <20260428-spu-rga3-v5-16-eb7f5d019d86@pengutronix.de>
References: <20260428-spu-rga3-v5-0-eb7f5d019d86@pengutronix.de>
	 <20260428-spu-rga3-v5-16-eb7f5d019d86@pengutronix.de>
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
	protocol="application/pgp-signature"; boundary="=-lVlR1XuC3qO6FqUNpkDq"
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: A74664FC354
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[ndufresne-ca.20251104.gappssmtp.com:s=20251104];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[ndufresne.ca : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60982-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[ndufresne-ca.20251104.gappssmtp.com:+];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas@ndufresne.ca,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ndufresne.ca:mid,ndufresne-ca.20251104.gappssmtp.com:dkim,pengutronix.de:email]
X-Rspamd-Action: no action


--=-lVlR1XuC3qO6FqUNpkDq
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 28 avril 2026 =C3=A0 11:00 +0200, Sven P=C3=BCschel a =C3=A9crit=
=C2=A0:
> Split the flip and rotate command configuration into a separate
> function in preparation of filling the command stream at streamon.
> As the userspace can change the flipping and rotation controls while
> streaming, we have to update them with each new frame to prevent the
> user being unable to change them while streaming.
>=20
> Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>

For code point of view, everything seems fine, but the commit message leave=
 me a
bit wondering. Any rotation that isn't 180 degree will cause the width and
height to be reversed, and a new stride is needed to present the buffer
correctly. Meaning the capture format can be affected by this change.

To stick with the spec, the capture format needs to be updated, and it need=
s to
happen in a way user can be able to read it back for the correct frame if
userspace make use of the queues. I see 3 options, let me know what you thi=
nk,
or what is later implemented if you already thought about that.

1. Synchronously update the capture format width/height, document in the
respective control this behaviour, leaving to userspace to remember which f=
rames
the change will apply to.

This works nicely for this type of HW, but would be a bit complicated for a
deinterlacer, since the buffering might be HW specific. It also make usage =
of
queues harder, less independent.

2. Force a drain/stop/start for any 90 degree rotation

This might impose a longer idle time for the converter core, and is kind of
opposite of your commit message. But requires no spec work.

3. Emit SRC_CH, implement the drain procedure typical to decoder resolution
change.

Typically it means userspace can keep buffering on the OUTPUT queue, and on=
ce
the LAST buffer is met, it can simply read the new format (and new stride, =
since
due to alignment, this might be hardware specific) and toggle streamoff/on =
only
on capture queue to reactivate the processing.

The 3. is more complex for the driver, but its a proven race-free method fo=
r
decoders already. 2 would be statusquo to get this series in, and we could =
post-
poned more advance work for seamless 90degree rorations. 1., I don't really=
 like
that solution, it not quite generic enough.

feedback welcome,
Nicolas

> ---
> =C2=A0drivers/media/platform/rockchip/rga/rga-hw.c | 57 +++++++++++++++++=
-----------
> =C2=A01 file changed, 34 insertions(+), 23 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c b/drivers/media=
/platform/rockchip/rga/rga-hw.c
> index dac3cb6aa17d3..6c1956b04f6ba 100644
> --- a/drivers/media/platform/rockchip/rga/rga-hw.c
> +++ b/drivers/media/platform/rockchip/rga/rga-hw.c
> @@ -156,7 +156,38 @@ static void rga_cmd_set_dst_addr(struct rga_ctx *ctx=
, dma_addr_t dma_addr)
> =C2=A0	dest[reg >> 2] |=3D 0x7 << 8;
> =C2=A0}
> =C2=A0
> -static void rga_cmd_set_trans_info(struct rga_ctx *ctx)
> +static void rga_cmd_set_flip_rotate_info(struct rga_ctx *ctx)
> +{
> +	u32 *dest =3D ctx->cmdbuf_virt;
> +	union rga_src_info src_info;
> +
> +	src_info.val =3D dest[(RGA_SRC_INFO - RGA_MODE_BASE_REG) >> 2];
> +
> +	if (ctx->vflip)
> +		src_info.data.mir_mode |=3D RGA_SRC_MIRR_MODE_X;
> +
> +	if (ctx->hflip)
> +		src_info.data.mir_mode |=3D RGA_SRC_MIRR_MODE_Y;
> +
> +	switch (ctx->rotate) {
> +	case 90:
> +		src_info.data.rot_mode =3D RGA_SRC_ROT_MODE_90_DEGREE;
> +		break;
> +	case 180:
> +		src_info.data.rot_mode =3D RGA_SRC_ROT_MODE_180_DEGREE;
> +		break;
> +	case 270:
> +		src_info.data.rot_mode =3D RGA_SRC_ROT_MODE_270_DEGREE;
> +		break;
> +	default:
> +		src_info.data.rot_mode =3D RGA_SRC_ROT_MODE_0_DEGREE;
> +		break;
> +	}
> +
> +	dest[(RGA_SRC_INFO - RGA_MODE_BASE_REG) >> 2] =3D src_info.val;
> +}
> +
> +static void rga_cmd_set_format_scale_info(struct rga_ctx *ctx)
> =C2=A0{
> =C2=A0	struct rockchip_rga *rga =3D ctx->rga;
> =C2=A0	u32 *dest =3D ctx->cmdbuf_virt;
> @@ -219,27 +250,6 @@ static void rga_cmd_set_trans_info(struct rga_ctx *c=
tx)
> =C2=A0		}
> =C2=A0	}
> =C2=A0
> -	if (ctx->vflip)
> -		src_info.data.mir_mode |=3D RGA_SRC_MIRR_MODE_X;
> -
> -	if (ctx->hflip)
> -		src_info.data.mir_mode |=3D RGA_SRC_MIRR_MODE_Y;
> -
> -	switch (ctx->rotate) {
> -	case 90:
> -		src_info.data.rot_mode =3D RGA_SRC_ROT_MODE_90_DEGREE;
> -		break;
> -	case 180:
> -		src_info.data.rot_mode =3D RGA_SRC_ROT_MODE_180_DEGREE;
> -		break;
> -	case 270:
> -		src_info.data.rot_mode =3D RGA_SRC_ROT_MODE_270_DEGREE;
> -		break;
> -	default:
> -		src_info.data.rot_mode =3D RGA_SRC_ROT_MODE_0_DEGREE;
> -		break;
> -	}
> -
> =C2=A0	/*
> =C2=A0	 * Calculate the up/down scaling mode/factor.
> =C2=A0	 *
> @@ -431,7 +441,8 @@ static void rga_cmd_set(struct rga_ctx *ctx,
> =C2=A0
> =C2=A0	rga_cmd_set_src_info(ctx, &src->offset);
> =C2=A0	rga_cmd_set_dst_info(ctx, &dst->offset);
> -	rga_cmd_set_trans_info(ctx);
> +	rga_cmd_set_format_scale_info(ctx);
> +	rga_cmd_set_flip_rotate_info(ctx);
> =C2=A0
> =C2=A0	rga_write(rga, RGA_CMD_BASE, ctx->cmdbuf_phy);
> =C2=A0

--=-lVlR1XuC3qO6FqUNpkDq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHQEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaf5fkwAKCRDZQZRRKWBy
9LC3APdmFKAFkqTp6qEPlQCir+NJJOXQVBYZ7bHoVHuXUem7AQC4zPYGkGqV7x4I
JShJJJ7CiYN1opexRldmsDpBBgQYCA==
=Cg+D
-----END PGP SIGNATURE-----

--=-lVlR1XuC3qO6FqUNpkDq--

