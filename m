Return-Path: <linux-media+bounces-48931-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC6DCC53D0
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 22:41:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C5D80304D486
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 21:40:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25C5C33EB1D;
	Tue, 16 Dec 2025 21:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="EH5fsjh2"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75EE4314A8D
	for <linux-media@vger.kernel.org>; Tue, 16 Dec 2025 21:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765921250; cv=none; b=SjhvAic7WEB/cTiiIPDAScg7adDS23t3T4lvbphNXxlyFJTFnJk4x1AO0nlQErF02zzzsKoph2vDVlc0tPrsQh54PYe8AaFSnu+STSlNVlWW3wgERsv0K0smvzoowa6HpfOamabj290htZhpRvlx9CnWKZ/ED/oNokUiCc/iRsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765921250; c=relaxed/simple;
	bh=dEXqCfld4X36KSV7nqClq7+cDI89ydHsFPBmfdJHtxg=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=t+GOEBZGYjGvbNW7GIzs/7qXnyaIItoqBF+hIWAaCKTd7xjtp83YaiNeKk1CjghUfMCoVdjkOx4QoWw3RF6cpEniQlrag4SzHE1+AMK5OWxXKnNmqoNfntA+l1hs1LJVeWAN5qqcwbMYwnyl/Sd29o3vQps6yBwotj1XnJR63hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=EH5fsjh2; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-88a379ca088so26265186d6.0
        for <linux-media@vger.kernel.org>; Tue, 16 Dec 2025 13:40:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1765921246; x=1766526046; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=O4AELFpU1THdwARc02Y1V5uIhLUDaIBDQWmAVMQD+KI=;
        b=EH5fsjh2cp/Od/BNhWRZsM0qptmnG94aGWh28rEC7obQ7WkGRtfv7wCgKsI5mTAclo
         EhQERNo50Xek4zF+jRE95P9V3ovSUsju2t0h3IJvo9r04TLerBPoI/n7aZ03WGNfbu+g
         AGd/ulFGI4k5VLRJuIjB9O9qegtJek3I72YTsmIeV/vCRm4FlCn+OP8aL2KUp0k2gUYH
         kH6ajJZa/udDZnM5U4PIesdfkzmEg+0hL02P/rt6tclFdPQiAom9uiE5qLp1E6skPAKz
         dcbWl0cpeOYFMIEh+6ygI43vWBTKxOiEjLvofe7qBgm8ajXFUdtl7t5+ZquxBfBfjBky
         5Mkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765921246; x=1766526046;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O4AELFpU1THdwARc02Y1V5uIhLUDaIBDQWmAVMQD+KI=;
        b=kEOgb29nzmHFprByzO5hqBzavi27wsfXhkkuBMzmPixJouRIOaB0l58xoXjHHSND8U
         E7E9o12M85waXPBfXIteuCJ6KcZjMs8Ts0XfQ3eUtXOHnVq3kcED8n3HRL/8fU/JXBZm
         91/4ikxunC7I2LpVD9qnetvIZXjnZuZxzsXcvXty9GYExf+YA1ltbJ9e88gAg6V0RIfT
         bod25o0C7Zjz/GW0yeqhx8XnEB4OjgEXHvkUEByy3pMW4RtWeJx46QJdwyHzpJZxb1OZ
         8PRISNbDRa6uthzBfk3M4T9+PqvUkTTYn/Jb3JYHvVdUYvzXZVHURSPnlRVlaGOfnRn2
         09DA==
X-Forwarded-Encrypted: i=1; AJvYcCVwH+0s2t/f0XDomLAiqSJNMkiHLOTPJZgpjtS2yoq0Co/JG+TaVrrbLxP+xbcqJKMTecJH3HHI/tLp7g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZ0Jb1POiRcY8kKXjtO4PTeRvGd1CgsPHmvSYSdwEvSdN0m55N
	PLCyCw8KEHWIZnRT+7BeYNWxqfMYcMj1Sj7OBIYMAsbwzidhV2zCM49gLmbuLUaDuHA=
X-Gm-Gg: AY/fxX7Dm/QOengRCc05FGEXtAcXp1led+iD779PrGLxh1pQjQXdte5r73ZBgfZEO0y
	Wkwo1iWr4kbQoTv3vRSK0dPPnH0LNQdVS3B6WvgiJloSYPdoQPW1m60zfYnPY+8RMHRMt6azZre
	fsNEEs+S9GIZoLv083Okgs3OS9qabpjsi0evoh5Egi11GYvyi1J610CIlhtLnLRbSgvR1o6moBF
	ugEUGiBgakl0VeN0yVubUm36pl6lOhsZfeDpC4yars26CYpyCCGXD1gh7uzT6MWdFQOfDFcHt47
	9CLmHATBzUXKv0/rhSutmIDv9HIYjgDsv7BaOy8gdn/x1Qv+dy5Gd/RHtHizFjPaa4nfveRV4mi
	mWRE5N0KnRvSoaCaz4UOGRImedu3riEZgnV93P+hymwjqwZ6OC8ldKTGIbWgLZK00BIbgBCcZKY
	FO276iUrQvFf4oYc8Q
X-Google-Smtp-Source: AGHT+IEh3+aMTT+69SVk2qQBnQj0741wIei3uKMlKrQWP8MB9v7jQGSEyVTJ0cWhWW2Caga3ImCEOg==
X-Received: by 2002:a0c:ed42:0:b0:888:8096:a09c with SMTP id 6a1803df08f44-8888096a4f6mr180400916d6.62.1765921246135;
        Tue, 16 Dec 2025 13:40:46 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::c41? ([2606:6d00:17:7b4b::c41])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88993b41845sm82007646d6.2.2025.12.16.13.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 13:40:45 -0800 (PST)
Message-ID: <41e00b0f4c667ff8e8a8f8b81f64fe1bbca7c001.camel@ndufresne.ca>
Subject: Re: [PATCH v11 07/12] media: mediatek: jpeg: fix decoding
 resolution change operation
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Kyrie Wu <kyrie.wu@mediatek.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>,  Mauro Carvalho Chehab	 <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski	 <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger	
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Date: Tue, 16 Dec 2025 16:40:44 -0500
In-Reply-To: <20251202094800.6140-8-kyrie.wu@mediatek.com>
References: <20251202094800.6140-1-kyrie.wu@mediatek.com>
	 <20251202094800.6140-8-kyrie.wu@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-WiTrr4gl+5/mCAw/rMLC"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-WiTrr4gl+5/mCAw/rMLC
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mardi 02 d=C3=A9cembre 2025 =C3=A0 17:47 +0800, Kyrie Wu a =C3=A9crit=C2=
=A0:
> 1.add a judgement for src buffer to avoid kernel crash
> in the stop streaming function;
> 2.When a resolution changing occurs, it needs to set new
> resolution parameter immediately and then report this event.
> Otherwise, if the original software process is maintained,
> the resolution change event is reported firstly, the CPU is
> dispatched to the app to process the event, and the driver
> does not set a new resolution, which will cause parameter errors.
> 3.After a resolution change occurred, decoding should not continue,
> needs to wait until new buffers are ready and the state machine
> changed.

I mention this in other patchset, very often, 3 bullets means 3 distinct
changes. Don't use bullets. Reflow this text, rework this text, there is ma=
ny
syntax error here.

>=20
> Fixes: dedc21500334 ("media: mtk-jpegdec: add jpeg decode worker interfac=
e")
>=20
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> ---
> =C2=A0drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 9 +++++++--
> =C2=A01 file changed, 7 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> index 5ffaee4dcd19..9233bbfe2d97 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> @@ -887,7 +887,8 @@ static void mtk_jpeg_dec_stop_streaming(struct vb2_qu=
eue
> *q)
> =C2=A0
> =C2=A0		vb =3D v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
> =C2=A0		src_buf =3D mtk_jpeg_vb2_to_srcbuf(&vb->vb2_buf);
> -		mtk_jpeg_set_queue_data(ctx, &src_buf->dec_param);
> +		if (!IS_ERR_OR_NULL(src_buf))
> +			mtk_jpeg_set_queue_data(ctx, &src_buf->dec_param);

The lack of vb2_wait_for_all_buffers() might explains this better, you migh=
t not
need to do random null checks like this.

Nicolas

> =C2=A0		ctx->state =3D MTK_JPEG_RUNNING;
> =C2=A0	} else if (V4L2_TYPE_IS_OUTPUT(q->type)) {
> =C2=A0		ctx->state =3D MTK_JPEG_INIT;
> @@ -1749,11 +1750,15 @@ static void mtk_jpegdec_worker(struct work_struct
> *work)
> =C2=A0
> =C2=A0	if (mtk_jpeg_check_resolution_change(ctx,
> =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0 &jpeg_src_buf->dec_param)) {
> -		mtk_jpeg_queue_src_chg_event(ctx);
> +		mtk_jpeg_set_queue_data(ctx, &jpeg_src_buf->dec_param);
> =C2=A0		ctx->state =3D MTK_JPEG_SOURCE_CHANGE;
> +		mtk_jpeg_queue_src_chg_event(ctx);
> =C2=A0		goto getbuf_fail;
> =C2=A0	}
> =C2=A0
> +	if (ctx->state =3D=3D MTK_JPEG_SOURCE_CHANGE)
> +		goto getbuf_fail;
> +
> =C2=A0	mtk_jpegdec_set_hw_param(ctx, hw_id, src_buf, dst_buf);
> =C2=A0	ret =3D pm_runtime_resume_and_get(comp_jpeg[hw_id]->dev);
> =C2=A0	if (ret < 0) {

--=-WiTrr4gl+5/mCAw/rMLC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaUHR3AAKCRDZQZRRKWBy
9CwsAQCyuxoAqjtYHse6WiWw9r1vAIqN8RsAZzvbh5RFyVgTgQD/XjRgo9FDnGk4
3bziswMEpYDICcpXmalCD6/v7owEUQs=
=aXJ6
-----END PGP SIGNATURE-----

--=-WiTrr4gl+5/mCAw/rMLC--

