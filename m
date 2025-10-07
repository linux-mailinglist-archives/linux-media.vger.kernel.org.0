Return-Path: <linux-media+bounces-43866-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AEFE9BC26E2
	for <lists+linux-media@lfdr.de>; Tue, 07 Oct 2025 20:47:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8B8BF19A167B
	for <lists+linux-media@lfdr.de>; Tue,  7 Oct 2025 18:48:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84DD92E92DA;
	Tue,  7 Oct 2025 18:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="K3bvBi1+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F4352E8DED
	for <linux-media@vger.kernel.org>; Tue,  7 Oct 2025 18:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759862864; cv=none; b=i0mvhYNq77u8Yv3bewxLIF+8Xh/Mb5is77mf7/huHic5/SIw9e8RV4NjpuCPYYIrAWXVd/V/41HtjVgmBnqGdzwbS5dYMR0RqNInAZDoEzwoVqWqKQe8lUrbxjKW6Lq2/BMnLdImgCjg5zOUTr2jH5BRNpQRR2BkfKtCvG2gv/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759862864; c=relaxed/simple;
	bh=GGtiJAlfcZTDjSiTu3CY2Jidx0+ml7dlf3+LKBL2U88=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Hc+rw/2KZ29K1j1PDsixuY1b7vxoU2cboqael4EmJUmGcwjlzTgy5WPGiXtzZfwpuEj61RL+yr/cqFjI5bhbZAiAOBD1ZIkibe1bvS8+TtNF2C1kr3v6jAq23YoclKp/c156yxsT0Y1pOQpcgz6Y+aaLIdzAyJQZ+3ZGL3MG7Ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=K3bvBi1+; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-855d525cd00so822816385a.2
        for <linux-media@vger.kernel.org>; Tue, 07 Oct 2025 11:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1759862861; x=1760467661; darn=vger.kernel.org;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=58+grWU1+fLQ3iYvFx1p0RHwupl8wNBxalqFpZYiDLA=;
        b=K3bvBi1+sO8Ou/2uDvl67IrhUaz6KSNJiXLC4z2yqEw+52UCLcVUoIg+E1XTMC6lj2
         OAM3yXstaKkam6C1V9uk9JCDHQY7j1m3naXpIhWVvyQXqebIGSDVro2v+JPjqn4y2hpk
         0BqnRHCV2kJcSZoaxqobVrf6hd70cUhtxfvhoiuKBfdfssyBfZaFuiYKWExw2r8PU45i
         0PmqyGlYQgB/0JSfxnkAhqThx8oX1G+jdJ2Ujz4xkZqylDcrXXIzbHHD0u7DZbkAt59Q
         x+BhtDXTPhOFtopb9eYMT+/pCdp3L4i6CmN+cDe7i5KOTtHNVsVyoEtqPq6pkAmbdaaw
         ml9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759862861; x=1760467661;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=58+grWU1+fLQ3iYvFx1p0RHwupl8wNBxalqFpZYiDLA=;
        b=Yu3kQ6ABa7wG5AV0f6cmnTp7iJn7/wh/78yRSDp059FVGEijjzMl6w/lgwg0fUYvyG
         JkvRaJKnRl6irs6QMRu9BbI6RqWpD7LxdxzDgClksIHdIh7KvCEu4ALfPmzhvIi0aoOm
         cosfxMin488zX8H2C+rB3yJoIAqtKmBvAHgHRdn4PvgXpSzjUObxeTFAdhsQBg3h70/Y
         fn0WgXEN3vzv+kUA6tAVeeE7IcT1AlF/unluIBQPHhRYdut4I9cp4COCYO4nsOCL0cK4
         9xhfR9po0yn86qYaKhQIVTaMBW7SLyDn5XJHUSo8AgwUgRvIMQKydDAkjrHkk8KJZtMu
         OVUg==
X-Gm-Message-State: AOJu0YxepHFsTKnqgxfFki0ct/3HX8h46C2MDOipe5VOOOJlA0MIPUuI
	EmUP+SPodSe/CvvCLf8b+ZIuq2luOT6d10VyIYaSOhpifRT59pCHIGOGu1bCRtwnCDU=
X-Gm-Gg: ASbGncupBIJvYg3/M109n6VYvDE5Y8H4/it+lzSF0zv69qtQUusNPCVoe9/zMqqYF41
	HP0x9PbR61uR+gsEJ2kGqpzcnhalNtRZU3FUxqNSBxj/NB4R/zLD3qfgduXSyHjzdSVkvashTZP
	i+5CHQHGl2C2eIezyKFGjW6WFtvL5t408Enl2H4T0Gi6/X9W7U7v28VAI6tlW3YxeNBcI4Xow8C
	EZXVarWiDwukUTjmFW34V7xNJ9/BFYey2m0WwqytnvY0V+ta+f9Nn1Wl+6Ugri4FtWbeH6+UNFv
	z15R1ZEfb/HflysSStfSbgKEtX7ayCDvUkPABtMBP9q0sWy//cMIBruawgbLjHMjxNPnGqSmU9j
	Fi8IfmgqjjNv5qZS2fse2HCTBOuJjgUQmOqGKfn/ycAIWzPugB8tg
X-Google-Smtp-Source: AGHT+IGM6WgG6OTQoMVXMZbYSPPE54NLk24Y0L7yLT6AonwvB7ilumFcgtdxb3bcVhP4gw7WgQL0Xw==
X-Received: by 2002:a05:620a:ac0b:b0:883:7309:c0eb with SMTP id af79cd13be357-8837309d08bmr41017885a.41.1759862860945;
        Tue, 07 Oct 2025 11:47:40 -0700 (PDT)
Received: from ?IPv6:2606:6d00:17:ebd3::c41? ([2606:6d00:17:ebd3::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-87772278098sm1596357385a.16.2025.10.07.11.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 11:47:40 -0700 (PDT)
Message-ID: <a57669be1d58e71229dedcf4acbe6eda201e45ea.camel@ndufresne.ca>
Subject: Re: [PATCH 12/16] media: rockchip: rga: handle error interrupt
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
Date: Tue, 07 Oct 2025 14:47:38 -0400
In-Reply-To: <20251007-spu-rga3-v1-12-36ad85570402@pengutronix.de>
References: <20251007-spu-rga3-v1-0-36ad85570402@pengutronix.de>
	 <20251007-spu-rga3-v1-12-36ad85570402@pengutronix.de>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-9ssd6DUBbBvl6JPlwbl3"
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-9ssd6DUBbBvl6JPlwbl3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 07 octobre 2025 =C3=A0 10:32 +0200, Sven P=C3=BCschel a =C3=A9crit=
=C2=A0:
> Handle the error interrupt status in preparation of the RGA3 addition.
> This allows the buffer to be marked as done, as it would otherwise
> be stuck in the queue.
>=20
> The RGA3 needs a soft reset to properly work after an error occurred,
> as it would otherwise cease to deliver new interrupts. Also the soft
> reset avoids additional error interrupts to be triggered, which are
> currently not supported by the rga_isr function.
> As it is unknown how the RGA2 behaves in the error case, no
> error interrupt was enabled and handled.
>=20
> Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>
> ---
> =C2=A0drivers/media/platform/rockchip/rga/rga-hw.c |=C2=A0 6 ++++--
> =C2=A0drivers/media/platform/rockchip/rga/rga.c=C2=A0=C2=A0=C2=A0 | 32 ++=
+++++++++++++++----------
> -
> =C2=A0drivers/media/platform/rockchip/rga/rga.h=C2=A0=C2=A0=C2=A0 |=C2=A0=
 8 ++++++-
> =C2=A03 files changed, 31 insertions(+), 15 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c
> b/drivers/media/platform/rockchip/rga/rga-hw.c
> index
> d54183d224b3e9c42d5503acf172257f2e736f7b..93822b5b8b15e76862bd022759eaa5c=
b9552
> dd76 100644
> --- a/drivers/media/platform/rockchip/rga/rga-hw.c
> +++ b/drivers/media/platform/rockchip/rga/rga-hw.c
> @@ -459,7 +459,7 @@ static void rga_hw_start(struct rockchip_rga *rga,
> =C2=A0	rga_write(rga, RGA_CMD_CTRL, 0x1);
> =C2=A0}
> =C2=A0
> -static bool rga_handle_irq(struct rockchip_rga *rga)
> +static enum rga_irq_result rga_handle_irq(struct rockchip_rga *rga)
> =C2=A0{
> =C2=A0	int intr;
> =C2=A0
> @@ -467,7 +467,9 @@ static bool rga_handle_irq(struct rockchip_rga *rga)
> =C2=A0
> =C2=A0	rga_mod(rga, RGA_INT, intr << 4, 0xf << 4);
> =C2=A0
> -	return intr & 0x04;
> +	if (intr & 0x04)
> +		return RGA_IRQ_DONE;

Since you reuse an old driver, would be nice to create proper defines for
RGA_INT bit 3 (current command finish interrupt flag).

> +	return RGA_IRQ_IGNORE;
> =C2=A0}
> =C2=A0
> =C2=A0static void rga_get_version(struct rockchip_rga *rga)
> diff --git a/drivers/media/platform/rockchip/rga/rga.c
> b/drivers/media/platform/rockchip/rga/rga.c
> index
> 0a725841b0cfa41bbc5b861b8f5ceac2452fc2b5..3b5d2eb8e109f44af76dd2240a239b1=
fa8a7
> 8cee 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -56,30 +56,38 @@ static void device_run(void *prv)
> =C2=A0static irqreturn_t rga_isr(int irq, void *prv)
> =C2=A0{
> =C2=A0	struct rockchip_rga *rga =3D prv;
> +	struct vb2_v4l2_buffer *src, *dst;
> +	struct rga_ctx *ctx =3D rga->curr;
> +	enum rga_irq_result result;
> =C2=A0
> -	if (rga->hw->handle_irq(rga)) {
> -		struct vb2_v4l2_buffer *src, *dst;
> -		struct rga_ctx *ctx =3D rga->curr;
> +	result =3D rga->hw->handle_irq(rga);
> +	if (result =3D=3D RGA_IRQ_IGNORE)
> +		return IRQ_HANDLED;
> =C2=A0
> -		WARN_ON(!ctx);
> +	WARN_ON(!ctx);
> =C2=A0
> -		rga->curr =3D NULL;
> +	rga->curr =3D NULL;
> =C2=A0
> -		src =3D v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
> -		dst =3D v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
> +	src =3D v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
> +	dst =3D v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
> =C2=A0
> -		WARN_ON(!src);
> -		WARN_ON(!dst);
> +	WARN_ON(!src);
> +	WARN_ON(!dst);
> =C2=A0
> -		v4l2_m2m_buf_copy_metadata(src, dst, true);
> +	v4l2_m2m_buf_copy_metadata(src, dst, true);
> =C2=A0
> -		dst->sequence =3D ctx->csequence++;
> +	dst->sequence =3D ctx->csequence++;
> =C2=A0
> +	if (result =3D=3D RGA_IRQ_DONE) {
> =C2=A0		v4l2_m2m_buf_done(src, VB2_BUF_STATE_DONE);
> =C2=A0		v4l2_m2m_buf_done(dst, VB2_BUF_STATE_DONE);
> -		v4l2_m2m_job_finish(rga->m2m_dev, ctx->fh.m2m_ctx);
> +	} else {
> +		v4l2_m2m_buf_done(src, VB2_BUF_STATE_ERROR);
> +		v4l2_m2m_buf_done(dst, VB2_BUF_STATE_ERROR)

I'm not fan of assumption that its an error on else case. If often lead to
multiple calls. Please use an explicit error return.

> ;
> =C2=A0	}
> =C2=A0
> +	v4l2_m2m_job_finish(rga->m2m_dev, ctx->fh.m2m_ctx);

What if you get an IRQ and none of the flags are raised ? I did see that in=
 the
past, and that least to bad things happening.

> +
> =C2=A0	return IRQ_HANDLED;
> =C2=A0}
> =C2=A0
> diff --git a/drivers/media/platform/rockchip/rga/rga.h
> b/drivers/media/platform/rockchip/rga/rga.h
> index
> e19c4c82aca5ae2056f52d525138093fbbb81af8..dc4bb85707d12f5378c4891098cd7ea=
4a4d7
> 5e2d 100644
> --- a/drivers/media/platform/rockchip/rga/rga.h
> +++ b/drivers/media/platform/rockchip/rga/rga.h
> @@ -143,6 +143,12 @@ static inline void rga_mod(struct rockchip_rga *rga,=
 u32
> reg, u32 val, u32 mask)
> =C2=A0	rga_write(rga, reg, temp);
> =C2=A0};
> =C2=A0
> +enum rga_irq_result {
> +	RGA_IRQ_IGNORE,
> +	RGA_IRQ_DONE,
> +	RGA_IRQ_ERROR,
> +};
> +
> =C2=A0struct rga_hw {
> =C2=A0	const char *card_type;
> =C2=A0	bool has_internal_iommu;
> @@ -152,7 +158,7 @@ struct rga_hw {
> =C2=A0
> =C2=A0	void (*start)(struct rockchip_rga *rga,
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct rga_vb_buffer *src, struct =
rga_vb_buffer *dst);
> -	bool (*handle_irq)(struct rockchip_rga *rga);
> +	enum rga_irq_result (*handle_irq)(struct rockchip_rga *rga);
> =C2=A0	void (*get_version)(struct rockchip_rga *rga);
> =C2=A0	void *(*try_format)(u32 *fourcc, bool is_output);
> =C2=A0	int (*enum_format)(struct v4l2_fmtdesc *f);

--=-9ssd6DUBbBvl6JPlwbl3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaOVgSgAKCRDZQZRRKWBy
9P5qAP9AQJCTUQL4yGjLYO6fhiRHkYApeYjS3ILIAxwJZRgyoAEAuIsn+1r5gHyo
fE4WQoTjedA/458KE+PcMg5FcVxZZA0=
=4Ait
-----END PGP SIGNATURE-----

--=-9ssd6DUBbBvl6JPlwbl3--

