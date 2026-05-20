Return-Path: <linux-media+bounces-62393-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +GROIs5KDmoM9gUAu9opvQ
	(envelope-from <linux-media+bounces-62393-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 01:59:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7333859D0D5
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 01:59:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 614DE3011EB9
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 23:59:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A5E833D6F9;
	Wed, 20 May 2026 23:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b="BgYPaL4a"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0CC1395D87
	for <linux-media@vger.kernel.org>; Wed, 20 May 2026 23:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779321543; cv=none; b=uRu+npKmZ25fjsFWETuy7F1rum9UkjFewjeFIb454YjXkKv+v7iXYUoSojkeoOdyad8MPFNqPRLu9S4LNGpo2a4aDOI06RqEeO16wkzmOah81VFNG9tXXxjff+X3QcnrEoop812nwbKHPWvkKUo4vrwBEJe4kTjCXGYR1QsBmbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779321543; c=relaxed/simple;
	bh=joPSnpUtrDJM3RSpJxT3RlTsp7Yuvzim4L7lc4TnBTg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HTeVbclcKa3rwEn3miO3ZVgWtDrFYWBmdTvZcrGJ8Jt0ZzZ5QWfJvNtA7Ks00FN+zv+F01+CB2guNS9DVNmdusEiG7SwYpLkp1L24q9bWhi1XRpql8W14nTjaMbHmnEbrxKvuJRg9JLYNrqidaG9b6CXZ6AKmRxcyvz5SvzQXVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=BgYPaL4a; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-39556b00a85so46783191fa.0
        for <linux-media@vger.kernel.org>; Wed, 20 May 2026 16:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1779321539; x=1779926339; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BEhywNjRyQXniz/pcQ13Co3tXpnmGzhcmCEno154HXY=;
        b=BgYPaL4aY4WaQTaVLYH6EXoIqgGHH1c50q6rY5qwy77W19wTTQTQdWm679F1X+uS2W
         /cDGlF/P/g1I+RzD4HxufmQ698Bv6rW4SIEWBGXMbESdTJIG7GkNOaX/mXar+mDf2hQ2
         RR+h1C+j81OOOKjKawzD6ka3HdK42CP6XJ+XkrPBeXEnN8x43Si+2DDuVTYDVnxyZsDm
         34rgyKzSxl4zT257u7ZAGzU8ToYOzpF9jEr9ggPMJqzcUoMecedwT8VCWj4x2hxBzk8S
         Zoky3NV6SVQsdFJK2iEfOijvGuTY4CbccTde59RmlsM01eY3CTqBfrupCJ+wdgwS9fTq
         fTWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779321539; x=1779926339;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BEhywNjRyQXniz/pcQ13Co3tXpnmGzhcmCEno154HXY=;
        b=gUbuzaXZuK9/z419zGS/N07S+AgvR7VGLVfp6IsdZXe6RvuPdc60fC3bDr0klPIrRW
         DIKq70okr6Ju+1Db8G++fWvlqO/aVZh7g2XUVt8UoiYJDVngkYhEeKXYtYK2x6vz2Yn1
         fQquc1L1mXPxkQqK76Xiww5SMvLrTsGzETulRqZ6r0vdzrB1uMscswFaxdnMj0vXiVpL
         fJL6AyUIhauHjLcXx+dE3eyFGGMW8YqiBPosnprDqpBPSbYZOzw0RZbjTLbm5Yzi1lcE
         sdgEfSbUIozLDJ0P67ocfbxH3rIQhvqkiRcyGGabZnWUI/gr6HbS/IQJ6JaMHn33vXZz
         hUAQ==
X-Gm-Message-State: AOJu0YyhKlaQk/puCYLUDHqmsPqOoShZHyYp9sPDcI6bByu2v1qMFpPi
	G6Lz8CN4gkkJuRjkBuoUhUR5AkdKyKFS4qGpt+DA7PlpQaTqcfh0LaStLnMKPRtI21g=
X-Gm-Gg: Acq92OHH7s3DJBzn0wkQQQP/63qBdDHGrFVi+aSZpmSD38DQyFBLbqJfhyBuMUrR23B
	MiZr82Ebw/hgQRL7p80hncOlMGj+rq3VFbrEH9yiYYrxdzrnTzjrPlZkwdfc3ep7nr2+jsx+o4z
	FPL2dY/0IH59oGSyv18q7qL4b+BX2YhqnHkqP/HKsGZpKoOND5UdIL3TMnoSyt4/lX4SpLzd+vb
	pIjZ/TMnnzeOVGPYvlqOV7xI1I+e7uUM+YQO2PYEBZU2ATpmOR0kpVnyr1YJFMl1c+GamO2Onl9
	lfUY5QHPePn/wNnR89Hj8/TXaMCr6oMA51xK0G6RBmi42HOqbev/kj7oFhj2KxjGhMMM/B+UP1Z
	lJAVGbP+MlxxX923Phz6pV76LrU+2Iph+8SiWYy6TTvcLm8T/0FNoSS8QW/sTO8u6/v+veeUmvK
	N/ykrxotXyRIRS32WgGBId48WbzPRBSmu6BFN/s15jh2J2GxAgB7YTbFzLvyX0r9Wzv+4STksay
	CGjEuA=
X-Received: by 2002:a2e:bd17:0:b0:393:d6dd:e8a1 with SMTP id 38308e7fff4ca-395ca24e814mr1927031fa.2.1779321538328;
        Wed, 20 May 2026 16:58:58 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b:3a7c:76ff:fea1:2ac0? ([2606:6d00:15:e06b:3a7c:76ff:fea1:2ac0])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395882d28f4sm33341501fa.17.2026.05.20.16.58.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 16:58:57 -0700 (PDT)
Message-ID: <5eeeaa5979a3f16ec8397b62bc35fd9b08d36032.camel@ndufresne.ca>
Subject: Re: [PATCH v7 17/28] media: rockchip: rga: check scaling factor
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
	sebastian.reichel@collabora.com, m.tretter@pengutronix.de, 
	p.zabel@pengutronix.de
Date: Wed, 20 May 2026 19:58:53 -0400
In-Reply-To: <20260521-spu-rga3-v7-17-3f33e8c7145f@pengutronix.de>
References: <20260521-spu-rga3-v7-0-3f33e8c7145f@pengutronix.de>
	 <20260521-spu-rga3-v7-17-3f33e8c7145f@pengutronix.de>
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
	protocol="application/pgp-signature"; boundary="=-rdFBmfYTegp3nVJVJScl"
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[ndufresne-ca.20251104.gappssmtp.com:s=20251104];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[ndufresne.ca : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62393-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[ndufresne-ca.20251104.gappssmtp.com:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas@ndufresne.ca,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,collabora.com:email,ndufresne.ca:mid,pengutronix.de:email,ndufresne-ca.20251104.gappssmtp.com:dkim]
X-Rspamd-Queue-Id: 7333859D0D5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--=-rdFBmfYTegp3nVJVJScl
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 21 mai 2026 =C3=A0 00:44 +0200, Sven P=C3=BCschel a =C3=A9crit=C2=
=A0:
> Check the scaling factor to avoid potential problems. This is relevant
> for the upcoming RGA3 support, as it can hang when the scaling factor
> is exceeded.
>=20
> The check is done at streamon when the other side is already streaming
> to avoid incorrectly failing if the application configures the other
> side after calling streamon. As try_fmt shouldn't be state aware,
> it cannot be used to limit the format based on the scaling factor.
> Therefore the check is done just before the actual streaming would be
> started.
>=20
> As the driver allows changing the rotation and selection while
> streaming, add additional checks to ensure these changes
> don't exceed the scaling factor.
>=20
> Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

>=20
> ---
> Changes in v6:
> - Dropped scaling adjustment in s_fmt, as this didn't match the try_fmt
> =C2=A0 result (which shouldn't have it to avoid making it stateful)
> - Moved scaling check to the prepare_streaming callback instead of
> =C2=A0 overwriting the ioctl directly
> - Consider rotation when checking the scaling
> - Check scaling factor when adjusting rotation and selection while
> =C2=A0 streaming
> ---
> =C2=A0drivers/media/platform/rockchip/rga/rga-buf.c | 28 ++++++++++++
> =C2=A0drivers/media/platform/rockchip/rga/rga-hw.c=C2=A0 |=C2=A0 1 +
> =C2=A0drivers/media/platform/rockchip/rga/rga-hw.h=C2=A0 |=C2=A0 1 +
> =C2=A0drivers/media/platform/rockchip/rga/rga.c=C2=A0=C2=A0=C2=A0=C2=A0 |=
 63 +++++++++++++++++++++++++--
> =C2=A0drivers/media/platform/rockchip/rga/rga.h=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 4 ++
> =C2=A05 files changed, 94 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rga/rga-buf.c b/drivers/medi=
a/platform/rockchip/rga/rga-buf.c
> index ffc6162b2e681..dcaba66f5c1fc 100644
> --- a/drivers/media/platform/rockchip/rga/rga-buf.c
> +++ b/drivers/media/platform/rockchip/rga/rga-buf.c
> @@ -197,6 +197,33 @@ static void rga_buf_return_buffers(struct vb2_queue =
*q,
> =C2=A0	}
> =C2=A0}
> =C2=A0
> +static int rga_buf_prepare_streaming(struct vb2_queue *q)
> +{
> +	struct rga_ctx *ctx =3D vb2_get_drv_priv(q);
> +	const struct rga_hw *hw =3D ctx->rga->hw;
> +	int ret;
> +
> +	/* It's safe to check the streaming state of the other queue,
> +	 * as the streamon ioctl's can't race due to the lock set in
> +	 * the queue_init function.
> +	 */
> +	if ((V4L2_TYPE_IS_OUTPUT(q->type) &&
> +	=C2=A0=C2=A0=C2=A0=C2=A0 vb2_is_streaming(v4l2_m2m_get_dst_vq(ctx->fh.m=
2m_ctx))) ||
> +	=C2=A0=C2=A0=C2=A0 (V4L2_TYPE_IS_CAPTURE(q->type) &&
> +	=C2=A0=C2=A0=C2=A0=C2=A0 vb2_is_streaming(v4l2_m2m_get_src_vq(ctx->fh.m=
2m_ctx)))) {
> +		/*
> +		 * As the other side is already streaming,
> +		 * check that the max scaling factor isn't exceeded.
> +		 */
> +		ret =3D rga_check_scaling(hw, &ctx->in.crop, &ctx->out.crop,
> +					ctx->rotate);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> =C2=A0static int rga_buf_start_streaming(struct vb2_queue *q, unsigned in=
t count)
> =C2=A0{
> =C2=A0	struct rga_ctx *ctx =3D vb2_get_drv_priv(q);
> @@ -232,6 +259,7 @@ const struct vb2_ops rga_qops =3D {
> =C2=A0	.buf_prepare =3D rga_buf_prepare,
> =C2=A0	.buf_queue =3D rga_buf_queue,
> =C2=A0	.buf_cleanup =3D rga_buf_cleanup,
> +	.prepare_streaming =3D rga_buf_prepare_streaming,
> =C2=A0	.start_streaming =3D rga_buf_start_streaming,
> =C2=A0	.stop_streaming =3D rga_buf_stop_streaming,
> =C2=A0};
> diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c b/drivers/media=
/platform/rockchip/rga/rga-hw.c
> index 567d39e58d33f..f2900812ba76f 100644
> --- a/drivers/media/platform/rockchip/rga/rga-hw.c
> +++ b/drivers/media/platform/rockchip/rga/rga-hw.c
> @@ -584,6 +584,7 @@ const struct rga_hw rga2_hw =3D {
> =C2=A0	.max_width =3D MAX_WIDTH,
> =C2=A0	.min_height =3D MIN_HEIGHT,
> =C2=A0	.max_height =3D MAX_HEIGHT,
> +	.max_scaling_factor =3D MAX_SCALING_FACTOR,
> =C2=A0	.stride_alignment =3D 4,
> =C2=A0
> =C2=A0	.setup_cmdbuf =3D rga_hw_setup_cmdbuf,
> diff --git a/drivers/media/platform/rockchip/rga/rga-hw.h b/drivers/media=
/platform/rockchip/rga/rga-hw.h
> index c2e34be751939..805ec23e5e3f4 100644
> --- a/drivers/media/platform/rockchip/rga/rga-hw.h
> +++ b/drivers/media/platform/rockchip/rga/rga-hw.h
> @@ -14,6 +14,7 @@
> =C2=A0
> =C2=A0#define MIN_WIDTH 34
> =C2=A0#define MIN_HEIGHT 34
> +#define MAX_SCALING_FACTOR 16
> =C2=A0
> =C2=A0#define RGA_TIMEOUT 500
> =C2=A0
> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/pl=
atform/rockchip/rga/rga.c
> index 394b14b9469df..22954bbae55fc 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -127,7 +127,9 @@ static int rga_s_ctrl(struct v4l2_ctrl *ctrl)
> =C2=A0{
> =C2=A0	struct rga_ctx *ctx =3D container_of(ctrl->handler, struct rga_ctx=
,
> =C2=A0					=C2=A0=C2=A0 ctrl_handler);
> +	const struct rga_hw *hw =3D ctx->rga->hw;
> =C2=A0	unsigned long flags;
> +	int ret =3D 0;
> =C2=A0
> =C2=A0	spin_lock_irqsave(&ctx->rga->ctrl_lock, flags);
> =C2=A0	switch (ctrl->id) {
> @@ -138,6 +140,13 @@ static int rga_s_ctrl(struct v4l2_ctrl *ctrl)
> =C2=A0		ctx->vflip =3D ctrl->val;
> =C2=A0		break;
> =C2=A0	case V4L2_CID_ROTATE:
> +		if (vb2_is_streaming(v4l2_m2m_get_dst_vq(ctx->fh.m2m_ctx)) &&
> +		=C2=A0=C2=A0=C2=A0 vb2_is_streaming(v4l2_m2m_get_src_vq(ctx->fh.m2m_ct=
x))) {
> +			ret =3D rga_check_scaling(hw, &ctx->in.crop,
> +						&ctx->out.crop, ctrl->val);
> +			if (ret < 0)
> +				goto s_ctrl_done;
> +		}
> =C2=A0		ctx->rotate =3D ctrl->val;
> =C2=A0		break;
> =C2=A0	case V4L2_CID_BG_COLOR:
> @@ -145,8 +154,10 @@ static int rga_s_ctrl(struct v4l2_ctrl *ctrl)
> =C2=A0		break;
> =C2=A0	}
> =C2=A0	ctx->cmdbuf_dirty =3D true;
> +
> +s_ctrl_done:
> =C2=A0	spin_unlock_irqrestore(&ctx->rga->ctrl_lock, flags);
> -	return 0;
> +	return ret;
> =C2=A0}
> =C2=A0
> =C2=A0static const struct v4l2_ctrl_ops rga_ctrl_ops =3D {
> @@ -182,6 +193,38 @@ static int rga_setup_ctrls(struct rga_ctx *ctx)
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> +static bool check_scaling_factor(const struct rga_hw *hw, u32 src_size,
> +				 u32 dst_size)
> +{
> +	if (src_size < dst_size)
> +		return src_size * hw->max_scaling_factor >=3D dst_size;
> +	else
> +		return dst_size * hw->max_scaling_factor >=3D src_size;
> +}
> +
> +int rga_check_scaling(const struct rga_hw *hw, const struct v4l2_rect *c=
rop_in,
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct v4l2_rect *crop_out, u32 r=
otate)
> +{
> +	u32 scaled_width;
> +	u32 scaled_height;
> +
> +	if (rotate =3D=3D 90 || rotate =3D=3D 270) {
> +		scaled_width =3D crop_out->height;
> +		scaled_height =3D crop_out->width;
> +	} else {
> +		scaled_width =3D crop_out->width;
> +		scaled_height =3D crop_out->height;
> +	}
> +
> +	if (!check_scaling_factor(hw, crop_in->width, scaled_width))
> +		return -EINVAL;
> +
> +	if (!check_scaling_factor(hw, crop_in->height, scaled_height))
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> =C2=A0static struct rga_fmt *rga_fmt_find(struct rockchip_rga *rga, u32 p=
ixelformat)
> =C2=A0{
> =C2=A0	unsigned int i;
> @@ -525,7 +568,6 @@ static int vidioc_s_selection(struct file *file, void=
 *priv,
> =C2=A0	struct rga_ctx *ctx =3D file_to_rga_ctx(file);
> =C2=A0	struct rockchip_rga *rga =3D ctx->rga;
> =C2=A0	struct rga_frame *f;
> -	int ret =3D 0;
> =C2=A0
> =C2=A0	f =3D rga_get_frame(ctx, s->type);
> =C2=A0	if (IS_ERR(f))
> @@ -569,10 +611,25 @@ static int vidioc_s_selection(struct file *file, vo=
id *priv,
> =C2=A0		return -EINVAL;
> =C2=A0	}
> =C2=A0
> +	if (vb2_is_streaming(v4l2_m2m_get_dst_vq(ctx->fh.m2m_ctx)) &&
> +	=C2=A0=C2=A0=C2=A0 vb2_is_streaming(v4l2_m2m_get_src_vq(ctx->fh.m2m_ctx=
))) {
> +		int ret =3D 0;
> +
> +		if (V4L2_TYPE_IS_OUTPUT(s->type))
> +			ret =3D rga_check_scaling(rga->hw, &s->r, &ctx->out.crop,
> +						ctx->rotate);
> +		else
> +			ret =3D rga_check_scaling(rga->hw, &ctx->in.crop, &s->r,
> +						ctx->rotate);
> +
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> =C2=A0	f->crop =3D s->r;
> =C2=A0	ctx->cmdbuf_dirty =3D true;
> =C2=A0
> -	return ret;
> +	return 0;
> =C2=A0}
> =C2=A0
> =C2=A0static const struct v4l2_ioctl_ops rga_ioctl_ops =3D {
> diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/pl=
atform/rockchip/rga/rga.h
> index 5360f092fecf0..df525c6aea8b6 100644
> --- a/drivers/media/platform/rockchip/rga/rga.h
> +++ b/drivers/media/platform/rockchip/rga/rga.h
> @@ -123,6 +123,9 @@ static inline struct rga_vb_buffer *vb_to_rga(struct =
vb2_v4l2_buffer *vb)
> =C2=A0
> =C2=A0struct rga_frame *rga_get_frame(struct rga_ctx *ctx, enum v4l2_buf_=
type type);
> =C2=A0
> +int rga_check_scaling(const struct rga_hw *hw, const struct v4l2_rect *c=
rop_in,
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct v4l2_rect *crop_out, u32 r=
otate);
> +
> =C2=A0/* RGA Buffers Manage */
> =C2=A0extern const struct vb2_ops rga_qops;
> =C2=A0
> @@ -151,6 +154,7 @@ struct rga_hw {
> =C2=A0	size_t cmdbuf_size;
> =C2=A0	u32 min_width, min_height;
> =C2=A0	u32 max_width, max_height;
> +	u8 max_scaling_factor;
> =C2=A0	u8 stride_alignment;
> =C2=A0
> =C2=A0	void (*setup_cmdbuf)(struct rga_ctx *ctx);

--=-rdFBmfYTegp3nVJVJScl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCag5KvQAKCRDZQZRRKWBy
9E9rAQDiJbGoDoukTZoC800Ujw8eKYRfiw95dLx/TYGqe+Q0sgD7B6/L2PKKbwBM
wjRPxzakETkICLxJ+XtnlfrFYSrmBAo=
=Il/H
-----END PGP SIGNATURE-----

--=-rdFBmfYTegp3nVJVJScl--

