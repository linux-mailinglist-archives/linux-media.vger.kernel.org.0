Return-Path: <linux-media+bounces-48932-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E3935CC53EE
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 22:45:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B2CF630778DA
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 21:43:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9426339879;
	Tue, 16 Dec 2025 21:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="saOpqtGK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96ED63370ED
	for <linux-media@vger.kernel.org>; Tue, 16 Dec 2025 21:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765921419; cv=none; b=MYJ01jvBLJnejufuHCrDCavGUPw3mDpufLqmm8f2Dc069wZQBRs4+mFeiYcZkeglbG6uyK1/4RkJoNwuw0x9fXLeVfVFNIyoliJ9QyuRiueNZQ74YwY9sG5+K5ugsX/e5moRA6gZQOksuoWnw4LYBWXsMWhVmEhUxkv7X6000DE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765921419; c=relaxed/simple;
	bh=h5rV15t7GXp58Fsps00YLI7NDF1b+tSNlvSme/wN+4E=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Yyj1Ep2WBTAEBD5BrcfrLczdlU4jv7/NkKm7QGJurADZkZD+f79ZY8JFj7zIn5jaglk3e5wGk8MvdZId/9x/mZyE/gdA0UoAqPKrK8OTPcOLnjx5sD+S/DBd1YOjq+PKY9ZAMC2nfauEZGQH+vcQUrqFwnQeS/h4sjJxh0du/Bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=saOpqtGK; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-8ba0d6c68a8so553756285a.1
        for <linux-media@vger.kernel.org>; Tue, 16 Dec 2025 13:43:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1765921413; x=1766526213; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=b1hVF7LpvbkkuKE9m+RYf2cnRUEh77RSxKXBsc+XQp8=;
        b=saOpqtGKcbiREHgcKvgAyNLGdvkPjsKAMhdJeC9SObuoDFHZXLWRxDnCMHWYhxvmEl
         HkdNW0xf+j8U8x/5NrM7hm5oehhe9jB0x1AaOiVHQGflnPzInNaz012PNQCraYgmxItE
         dEZwFcn9s/U7K2K7Ro1JVdsRGc63f6zkMbLEse48CR1O9kP2k+2ZMNxApxi7oiKpzlNT
         xelulu87hkBjzMm++BPPnxLxJjlUID/C3DGvQOqjDY3WPTxyaSVZSDckbsZBUPBhZAF2
         9xDMAZYWdA3cZyR0bEP+syGT4CMpRilPMQ41tjd3yOQFiRi2XLTh9J+kTX1q2TTOZ45G
         lAUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765921413; x=1766526213;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b1hVF7LpvbkkuKE9m+RYf2cnRUEh77RSxKXBsc+XQp8=;
        b=K8m+oUmEPi0T56uCsslnsiUYa0vO4SPGwoFAoL1bJPxVFXs8I3YLkGeHGTc1sULfEb
         TtD0/7MI1GUx+EMbrCIfvLiUpEHq1zX2sI173uFHU/uRA0rRQPMdTqQzNtmhod8yELFB
         pR6ynYcRyTHCSEbyAZmzunEk9KgJrz00yKk+1URY5NipYDNqF45Z9geIy3h6DUwRY7nI
         rFPz+sT+/R0IFNLeR2tGfoHic3g34uFAaO6jUQJ0Opf5z99C1yCo8898GQGyxHhX24OG
         mfscEhoiziA6KaLiNT0tP83URxx232q44QjbNdBqFf7rWJtQXcOMhM/6DrHlz/emmGgy
         vKwg==
X-Forwarded-Encrypted: i=1; AJvYcCWwgsjCq2GEectukFzdI++Yrmv2XmcZPyUUST9bjRWdtr8cvyKXwC1749K9qnk12vNtLCY67imE1tPkIA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyjgDusGRCbgyRDqta60xDM9PUvhXQEDQQk+uFD0t1JhQZHBkvU
	9RYcWuBEjbqJY9vePxV0AXvMlR/2IJLNC6W4U2xF5QqbH7bO8ZbdLkd4NQ6muZgTxI0=
X-Gm-Gg: AY/fxX4kQ8hdAydyYzusg3ZFZDNgoZ1AdkeQtYNyEu9PBesOT9m/NcVOQGwpRTzwhU/
	h9I7oC70rzI+vAGnkU0ykbpT6RaG59Jb/KDldrM77+QjSuOT/joVJM5BTVs76X0Q2xrppMpQJ/e
	2zFyNy1gytViRZ4LQFhRhUB3c9t2hHNQOtofvKjmoo3pIptnsoEvPqeEWKY+Hg48GTKYxbks1ng
	EnwpTUP9x9eXqItHw/4QvSO5akk5pficWz3x59htZRffj0pSQ+QwkW7QSRchIXvE0PsfRoA3nsu
	ftTzUMLYwl1TeIro166jlJ3krLtgBYEmvgIzGya/2KA39zm9K7U8F3giUExAcGPnm6xJmJzel8p
	7r2jBDhjm78F7m7ctIOwavWGjyDzVBu6f2zlvO9n1hyedW7YMdIY9M0J1YcGuKa5K95LPp7OdyS
	1mUMcxuPOuUp0CWZFG
X-Google-Smtp-Source: AGHT+IHCVAnsdhFi8VkMSKLmu7Ku3KLARd8TeNT/vK47QyRUaJG+LTfRi/IKTHyD/KvPom88nmKrrw==
X-Received: by 2002:a05:620a:4112:b0:89f:2d97:98fd with SMTP id af79cd13be357-8bb399dc444mr2151909585a.2.1765921412932;
        Tue, 16 Dec 2025 13:43:32 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::c41? ([2606:6d00:17:7b4b::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8be30d86a2dsm265456785a.15.2025.12.16.13.43.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 13:43:32 -0800 (PST)
Message-ID: <a8376a71b87cc8944bf05be3bc45dc2e4fe2764e.camel@ndufresne.ca>
Subject: Re: [PATCH v11 08/12] media: mediatek: jpeg: fix remove buffer
 operation for multi-core
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Kyrie Wu <kyrie.wu@mediatek.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>,  Mauro Carvalho Chehab	 <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski	 <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger	
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Date: Tue, 16 Dec 2025 16:43:31 -0500
In-Reply-To: <20251202094800.6140-9-kyrie.wu@mediatek.com>
References: <20251202094800.6140-1-kyrie.wu@mediatek.com>
	 <20251202094800.6140-9-kyrie.wu@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-Si22i6HkJzRfHSqHC37A"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-Si22i6HkJzRfHSqHC37A
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mardi 02 d=C3=A9cembre 2025 =C3=A0 17:47 +0800, Kyrie Wu a =C3=A9crit=C2=
=A0:
> move remove buffer code to spinlock protect area for multi-core

Perhaps:

Move calls to v4l2_m2m_src/dst_buf_remove() outside of the spinlock protect=
ed
scope.

And perhaps extend in why this is needed. Deadlock, bad lock ordering?

>=20
> Fixes: 86379bd9d399 ("media: mtk-jpeg: Fixes jpeg enc&dec worker sw flow"=
)
>=20

No blank.

> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

Nicolas

> ---
> =C2=A0drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 10 ++++-----=
-
> =C2=A01 file changed, 4 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> index 9233bbfe2d97..da1ca494ed4b 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> @@ -1665,9 +1665,6 @@ static void mtk_jpegenc_worker(struct work_struct *=
work)
> =C2=A0		goto enc_end;
> =C2=A0	}
> =C2=A0
> -	v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
> -	v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
> -
> =C2=A0	schedule_delayed_work(&comp_jpeg[hw_id]->job_timeout_work,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 msecs_to_jiffies(MTK_JPEG_HW_TIME=
OUT_MSEC));
> =C2=A0
> @@ -1685,6 +1682,8 @@ static void mtk_jpegenc_worker(struct work_struct *=
work)
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 &src_buf->vb2_buf);
> =C2=A0	mtk_jpeg_set_enc_params(ctx, comp_jpeg[hw_id]->reg_base);
> =C2=A0	mtk_jpeg_enc_start(comp_jpeg[hw_id]->reg_base);
> +	v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
> +	v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
> =C2=A0	jpeg_buf_queue_inc(ctx);
> =C2=A0	v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
> =C2=A0	spin_unlock_irqrestore(&comp_jpeg[hw_id]->hw_lock, flags);
> @@ -1767,9 +1766,6 @@ static void mtk_jpegdec_worker(struct work_struct *=
work)
> =C2=A0		goto dec_end;
> =C2=A0	}
> =C2=A0
> -	v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
> -	v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
> -
> =C2=A0	mtk_jpeg_set_dec_src(ctx, &src_buf->vb2_buf, &bs);
> =C2=A0	if (mtk_jpeg_set_dec_dst(ctx,
> =C2=A0				 &jpeg_src_buf->dec_param,
> @@ -1794,6 +1790,8 @@ static void mtk_jpegdec_worker(struct work_struct *=
work)
> =C2=A0				jpeg_src_buf->bs_size,
> =C2=A0				&bs,
> =C2=A0				&fb);
> +	v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
> +	v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
> =C2=A0	mtk_jpeg_dec_start(comp_jpeg[hw_id]->reg_base);
> =C2=A0	jpeg_buf_queue_inc(ctx);
> =C2=A0	v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);

--=-Si22i6HkJzRfHSqHC37A
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaUHSgwAKCRDZQZRRKWBy
9JcnAP9X9/KPI6GsErRhlqFgw3okba30C65KuHLjIZqWoee34gD/fbQFW9sQBK3S
ex/e1Ql3MM0wQLFqMGzHvi8lUaErCgA=
=L24+
-----END PGP SIGNATURE-----

--=-Si22i6HkJzRfHSqHC37A--

