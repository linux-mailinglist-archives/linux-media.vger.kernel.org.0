Return-Path: <linux-media+bounces-62392-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gEzpOqpLDmrL9gUAu9opvQ
	(envelope-from <linux-media+bounces-62392-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 02:02:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D6B59D1EC
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 02:02:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2BB5A303BDE1
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 23:55:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 767743C342B;
	Wed, 20 May 2026 23:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b="rkTl979M"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C736B3BC687
	for <linux-media@vger.kernel.org>; Wed, 20 May 2026 23:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779321343; cv=none; b=btXenYP2Kougd3ul9AzlixR2c+WAPgN3ns3BShI+BkdeISaz42MHns09WO88LeJukPks6epRkYKe258LdN3aRzS3Iug3JgxHJaE7yb9tiZAgI7ZsISLVvDulVBpdrXS9T1OfVmmgICtRPce3JCJO3mcVIe2hF5IoDHTbMBM51uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779321343; c=relaxed/simple;
	bh=/xbpYJYyTd1UKE8Lzer4LO7cC73Dak7ZfajrqiKOVHo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=F4F0D3GPzcDgJe1a2nM4v4WUKMftQbgwVIqDVkydeOAXd8e2fxf5M5EB8ftnW+N+V267IA7z/KBXXBaRVo6dU7my3tiUKYpP7Kr2/S3iAwit2CzdPq7iJUDWGuK/bMXVVQ9QBmglnxg6/scl/Tf8K6dGXJ7itlN09KONHEq89zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=rkTl979M; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-9144163319fso490949985a.2
        for <linux-media@vger.kernel.org>; Wed, 20 May 2026 16:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1779321334; x=1779926134; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WO2Jlnfwd8E/DGsD03RFdw4xjY/iz1az5ExsXccXSE8=;
        b=rkTl979M6Ci3kL+s8oClot+pn+Ucw9w7zJakSlfvjPsQl7KMBtB0QTk+No8KYqUP+Q
         4xKdq+8EGDenYHKIaEwitlttYQs8yJnrbHMPGIsUuRmanKmw3aOVpbb15z4lyzuPVREg
         +Yic64J8FWItUaA1OOn0T2W7yevEvkfwQQHc2qOw/2zwneeOMb7Bl6LnlcP6o9ZZU+1N
         ey9YPTSvCv1kkv4EWmZzYbypupMkXAfTq+YyHx03bNxS4a+Jrsj7bUF13txhy4ARHhLm
         8W+nNxpdW7wgT5/L6pO0WvuQYgsVxkKlCRw9aqISJbvAc0UI2obWCjLRypWdRgCHNVfQ
         J3LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779321334; x=1779926134;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WO2Jlnfwd8E/DGsD03RFdw4xjY/iz1az5ExsXccXSE8=;
        b=F9chLsRgTIia7Z2q45Ghk+6CVqCF3keGiLmq2lnqcnJrtvOWMJZzFYvq6DD+779qFV
         XUAQZ+quQC7BAAjMXrr1dqfpm0cYijqKPgEDeSsR7/uOW0whMvvclN6BzRE+vdJ8rYIh
         LjgyLqJt6uwZrEzr6Thf86u89Y/LFmxnVwEKZkR70hjtYkRuHTl+V/Sq8qMeOI9DDGgL
         u3qtmghlOyxq+E8laper5qFsY3G/PfW6zTlagHOgvqfH1fJ20TKFurOxJBBHVcC7qUQI
         QSpuTAkIm5BzeMOg3mG8V0DRRlKSch3kXwt+S25n8emXWzK5ScUar4tqy48FJPrnXm//
         dr5A==
X-Gm-Message-State: AOJu0YyB0BA4zz+XIM5mY0cTStQKXUhBjvlJTZUBW4cEu1uevp18IXsg
	OIzFD0xUHpft453uibAUC9IBFSErSbkQ4ADPuCMYsZMmuE2Sgsim4E+a88ELQqtsREk=
X-Gm-Gg: Acq92OFq3XMMtJE7hCpGRSbXUyUOYfzLAYRAvZuLfOcT7aEr2OO1IhCYzo4jZJZAEbS
	wGvfDG+hucKybxQEN65YCvkcCVixO8qwIKhqS10nNmVAW2SReuiZkPO66rJbpq2biMTkQH4oisW
	iquqenSLUKRtj6QqwtFZjp7JCT3AGqQKurwQQD4ddocuDVuWM1ud/JKsODp/SthhLVJtCTawiuO
	g0FlAybwbHTROZ3o+ux4uXSTPSAkMBXHMtsFovB3QgklGVwnr2VRG5Iqm4fWGh5iZDN3P5vHULI
	u4WkMttgtoDx5JAMMrKeoeLaD41d/1eMsTK891G2aECYsyATLIKwvaJcyN/Kw5/q8+KcnM8g/Lf
	N2d83r/gH++qDHcb66Smvv064Vn1kHfWovmX9VqQ0zqsuwLOA+7DgPjPf9y31H4v66+6JsASe2n
	E7SHziG0iQf9Q1sauJs0DF6yqNofhCOTRLEZ0bHozAucoDfcHZM5/IhcxKm7d95/6sdwlA
X-Received: by 2002:a05:620a:f01:b0:90f:b39e:ec8 with SMTP id af79cd13be357-914a2a6220fmr67310485a.17.1779321334282;
        Wed, 20 May 2026 16:55:34 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b:3a7c:76ff:fea1:2ac0? ([2606:6d00:15:e06b:3a7c:76ff:fea1:2ac0])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-910bcf3732dsm2241597285a.33.2026.05.20.16.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 16:55:32 -0700 (PDT)
Message-ID: <01ed1968d49691b47da056d5e07b376e5a2ef028.camel@ndufresne.ca>
Subject: Re: [PATCH v7 16/28] media: rockchip: rga: reuse cmdbuf contents
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
Date: Wed, 20 May 2026 19:55:31 -0400
In-Reply-To: <20260521-spu-rga3-v7-16-3f33e8c7145f@pengutronix.de>
References: <20260521-spu-rga3-v7-0-3f33e8c7145f@pengutronix.de>
	 <20260521-spu-rga3-v7-16-3f33e8c7145f@pengutronix.de>
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
	protocol="application/pgp-signature"; boundary="=-iE9F37poAHpBbdW9jc1N"
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[ndufresne-ca.20251104.gappssmtp.com:s=20251104];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[ndufresne.ca : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62392-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[ndufresne-ca.20251104.gappssmtp.com:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas@ndufresne.ca,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ndufresne.ca:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,collabora.com:email,ndufresne-ca.20251104.gappssmtp.com:dkim,sashiko.dev:url]
X-Rspamd-Queue-Id: 00D6B59D1EC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--=-iE9F37poAHpBbdW9jc1N
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 21 mai 2026 =C3=A0 00:44 +0200, Sven P=C3=BCschel a =C3=A9crit=C2=
=A0:
> Reuse the command buffer contents instead of completely writing it
> for every frame. Therefore we only need to replace the source and
> destination addresses for each frame. This reduces the amount of CPU
> and memory operations done in each frame. A new cmdbuf_dirty flag notes
> if the cmdbuf has to be rewritten on the next frame.
>=20
> The initial idea of initializing the cmdbuf on streamon broke the
> ability to update controls while streaming (e.g. mirroring).
>=20
> Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

>=20
> ---
> Changes in v6:
> - Reworked the commit to not setup the cmdbuf on streamon but rather
> =C2=A0 re-initialize it on the next frame when something changed.
> - Sasahiko flagged the cmdbuf setup at streamon:
> =C2=A0 https://sashiko.dev/#/patchset/20260428-spu-rga3-v5-0-eb7f5d019d86=
%40pengutronix.de?part=3D17
> - Dropped Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> =C2=A0 due to the reworked patch and commit message contents
>=20
> Changes in v5:
> - Don't set the flipping and rotation values at streamon and preventing
> =C2=A0 the userspace from chainging them at runtime
> ---
> =C2=A0drivers/media/platform/rockchip/rga/rga-hw.c | 13 +++++++++----
> =C2=A0drivers/media/platform/rockchip/rga/rga.c=C2=A0=C2=A0=C2=A0 | 11 ++=
+++++++--
> =C2=A0drivers/media/platform/rockchip/rga/rga.h=C2=A0=C2=A0=C2=A0 |=C2=A0=
 2 ++
> =C2=A03 files changed, 20 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c b/drivers/media=
/platform/rockchip/rga/rga-hw.c
> index dac3cb6aa17d3..567d39e58d33f 100644
> --- a/drivers/media/platform/rockchip/rga/rga-hw.c
> +++ b/drivers/media/platform/rockchip/rga/rga-hw.c
> @@ -417,8 +417,6 @@ static void rga_cmd_set(struct rga_ctx *ctx,
> =C2=A0{
> =C2=A0	struct rockchip_rga *rga =3D ctx->rga;
> =C2=A0
> -	memset(ctx->cmdbuf_virt, 0, RGA_CMDBUF_SIZE);
> -
> =C2=A0	rga_cmd_set_src_addr(ctx, src->dma_desc_pa);
> =C2=A0	/*
> =C2=A0	 * Due to hardware bug,
> @@ -427,11 +425,9 @@ static void rga_cmd_set(struct rga_ctx *ctx,
> =C2=A0	rga_cmd_set_src1_addr(ctx, dst->dma_desc_pa);
> =C2=A0
> =C2=A0	rga_cmd_set_dst_addr(ctx, dst->dma_desc_pa);
> -	rga_cmd_set_mode(ctx);
> =C2=A0
> =C2=A0	rga_cmd_set_src_info(ctx, &src->offset);
> =C2=A0	rga_cmd_set_dst_info(ctx, &dst->offset);
> -	rga_cmd_set_trans_info(ctx);
> =C2=A0
> =C2=A0	rga_write(rga, RGA_CMD_BASE, ctx->cmdbuf_phy);
> =C2=A0
> @@ -440,6 +436,14 @@ static void rga_cmd_set(struct rga_ctx *ctx,
> =C2=A0				=C2=A0=C2=A0 PAGE_SIZE, DMA_BIDIRECTIONAL);
> =C2=A0}
> =C2=A0
> +static void rga_hw_setup_cmdbuf(struct rga_ctx *ctx)
> +{
> +	memset(ctx->cmdbuf_virt, 0, RGA_CMDBUF_SIZE);
> +
> +	rga_cmd_set_mode(ctx);
> +	rga_cmd_set_trans_info(ctx);
> +}
> +
> =C2=A0static void rga_hw_start(struct rockchip_rga *rga,
> =C2=A0			 struct rga_vb_buffer *src,=C2=A0 struct rga_vb_buffer *dst)
> =C2=A0{
> @@ -582,6 +586,7 @@ const struct rga_hw rga2_hw =3D {
> =C2=A0	.max_height =3D MAX_HEIGHT,
> =C2=A0	.stride_alignment =3D 4,
> =C2=A0
> +	.setup_cmdbuf =3D rga_hw_setup_cmdbuf,
> =C2=A0	.start =3D rga_hw_start,
> =C2=A0	.handle_irq =3D rga_handle_irq,
> =C2=A0	.get_version =3D rga_get_version,
> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/pl=
atform/rockchip/rga/rga.c
> index d080cb672740b..394b14b9469df 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -38,6 +38,11 @@ static void device_run(void *prv)
> =C2=A0	unsigned long flags;
> =C2=A0
> =C2=A0	spin_lock_irqsave(&rga->ctrl_lock, flags);
> +	if (ctx->cmdbuf_dirty) {
> +		ctx->cmdbuf_dirty =3D false;
> +		rga->hw->setup_cmdbuf(ctx);
> +	}
> +	spin_unlock_irqrestore(&rga->ctrl_lock, flags);
> =C2=A0
> =C2=A0	rga->curr =3D ctx;
> =C2=A0
> @@ -47,8 +52,6 @@ static void device_run(void *prv)
> =C2=A0	dst =3D v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
> =C2=A0
> =C2=A0	rga->hw->start(rga, vb_to_rga(src), vb_to_rga(dst));
> -
> -	spin_unlock_irqrestore(&rga->ctrl_lock, flags);
> =C2=A0}
> =C2=A0
> =C2=A0static irqreturn_t rga_isr(int irq, void *prv)
> @@ -141,6 +144,7 @@ static int rga_s_ctrl(struct v4l2_ctrl *ctrl)
> =C2=A0		ctx->fill_color =3D ctrl->val;
> =C2=A0		break;
> =C2=A0	}
> +	ctx->cmdbuf_dirty =3D true;
> =C2=A0	spin_unlock_irqrestore(&ctx->rga->ctrl_lock, flags);
> =C2=A0	return 0;
> =C2=A0}
> @@ -228,6 +232,7 @@ static int rga_open(struct file *file)
> =C2=A0		ret =3D -ENOMEM;
> =C2=A0		goto rel_ctx;
> =C2=A0	}
> +	ctx->cmdbuf_dirty =3D true;
> =C2=A0
> =C2=A0	ctx->rga =3D rga;
> =C2=A0	/* Set default formats */
> @@ -448,6 +453,7 @@ static int vidioc_s_fmt(struct file *file, void *priv=
, struct v4l2_format *f)
> =C2=A0	frm->crop.height =3D pix_fmt->height;
> =C2=A0
> =C2=A0	frm->pix =3D *pix_fmt;
> +	ctx->cmdbuf_dirty =3D true;
> =C2=A0
> =C2=A0	v4l2_dbg(debug, 1, &rga->v4l2_dev,
> =C2=A0		 "[%s] fmt - %p4cc %dx%d (stride %d, sizeimage %d)\n",
> @@ -564,6 +570,7 @@ static int vidioc_s_selection(struct file *file, void=
 *priv,
> =C2=A0	}
> =C2=A0
> =C2=A0	f->crop =3D s->r;
> +	ctx->cmdbuf_dirty =3D true;
> =C2=A0
> =C2=A0	return ret;
> =C2=A0}
> diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/pl=
atform/rockchip/rga/rga.h
> index 38518146910a6..5360f092fecf0 100644
> --- a/drivers/media/platform/rockchip/rga/rga.h
> +++ b/drivers/media/platform/rockchip/rga/rga.h
> @@ -55,6 +55,7 @@ struct rga_ctx {
> =C2=A0
> =C2=A0	void *cmdbuf_virt;
> =C2=A0	dma_addr_t cmdbuf_phy;
> +	bool cmdbuf_dirty;
> =C2=A0
> =C2=A0	int osequence;
> =C2=A0	int csequence;
> @@ -152,6 +153,7 @@ struct rga_hw {
> =C2=A0	u32 max_width, max_height;
> =C2=A0	u8 stride_alignment;
> =C2=A0
> +	void (*setup_cmdbuf)(struct rga_ctx *ctx);
> =C2=A0	void (*start)(struct rockchip_rga *rga,
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct rga_vb_buffer *src, struct =
rga_vb_buffer *dst);
> =C2=A0	bool (*handle_irq)(struct rockchip_rga *rga);

--=-iE9F37poAHpBbdW9jc1N
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCag5J8wAKCRDZQZRRKWBy
9DAZAP9Xf7IdErtf/h9OYj66sgKI7S2PALOfOoCONV6yRBPk5wEA8266iKH8r1NF
zwhjBDfN6Qioq0E01auxFy1Gft3WbAw=
=ULXz
-----END PGP SIGNATURE-----

--=-iE9F37poAHpBbdW9jc1N--

