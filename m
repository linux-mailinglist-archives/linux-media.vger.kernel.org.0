Return-Path: <linux-media+bounces-48926-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1F9CC5334
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 22:23:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0F1A630433F5
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 21:22:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B564D313541;
	Tue, 16 Dec 2025 21:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="ewx9V/qs"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5931C2F1FE4
	for <linux-media@vger.kernel.org>; Tue, 16 Dec 2025 21:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765920171; cv=none; b=HveTfZn1eXWJxMdHttUtRHoUZHbrLiraYK9vyacPikDWZq9gOgfftpmsag9KsoLGkO9j0GfhcDZCxz2Q/Q2wIv690Xu6Q55+L8BjtQej0Ufq/EuARuh4cJCE87TzC0cFojFSXCnoJM+k9xuTvNxqO5D4Pk9CmC+M0MhNaMUpo00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765920171; c=relaxed/simple;
	bh=/krS0BWI65jop3z0unqJB84FOIc0RmeeYbt+JMWGDnQ=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Fbw26BkHw2bxi4FEHPz826XksBB4e8Yrge8TIMEd5AsBUv/G4wZC/0l4iAm9b6B/CeQcCx0TZesIeEo2MCZ83SdoLukVrwEhruAq7W9KlO9H3QVAaK6lUZ3qHwQ57AN8uC6rzU7mcLUdkiYzSZo5g0m7GpH3om7OoCGkbG+uh6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=ewx9V/qs; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-8ba0d6c68a8so551974985a.1
        for <linux-media@vger.kernel.org>; Tue, 16 Dec 2025 13:22:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1765920168; x=1766524968; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5NXLEIY/HJo5YPCQOLY5gXfYsdslZjjo+0R5gru3yJ8=;
        b=ewx9V/qsUI4PVryZDovX+00DUFyXfvmEw3g72+oJUCx1KWXsqyBD5vkmLKPfYSplto
         soDBo0DEjF3P+L26716PjHsmEH72tluQFmWnPlE1wwUYeToXB13L6A61/FsODkbk3gQu
         rCY6HWXGL1Y3WPqlpAWhodFx3YAbrAj62JaEiWS1ahWSJBCOYFZxPWlGT1d0IADAxVJ4
         UhouzoUfqx1XziOhBuvRkoHT8hPjbHFouky45EaLPGgbgQBiIHYOyMCVVrLIEqUhWnjA
         ZkNaIDSQlsQX2J4gf/kdXQIj0/02hw23fCmrL7CpEF5nZgXzV7D2FbhEaAZxHSWD5SHX
         rpAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765920168; x=1766524968;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5NXLEIY/HJo5YPCQOLY5gXfYsdslZjjo+0R5gru3yJ8=;
        b=DADAlU5s/TpcU3hwEz4+2VMHZJT9iJORcC5CN0PhXodYsDNlGNAam5TtHyoK3jgH+k
         9+jfvBAHdRs/sTzvX2LRxukNpUxyu+tstTUrodFDRuAQBkA1wlDWaiOurlaoz5U/WepG
         me/cvuUZ/v2Ywh693aqN9OB5BgQGcz7i83Xr1rQM0s/f4Eighwalc6s/7YCHKRmilwFe
         xwbEDKhXjxnEaNBbr+mmplmlhdaJ6o9QfgPMvjpO/0cdKM20jPbim0cslW9So5vlbcog
         Dqdb3A5QoHJGw8v+wVfKQtWp1GNGEHhlgskUtrMvBbG2Lv12Bge092Vg+JIs3KB2mqSr
         sxig==
X-Forwarded-Encrypted: i=1; AJvYcCWfFlh/ufSIoqywYirCbt0kBSpkCQxrA3G4VFKWA7LLgX2VVC82Plb9HPWLynTy0fYlfW/vqxW5Z1lhZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQ1kZtxsrgo7/LFj8MzpE67EmlWN0cn2DlAYQaYseDq/RcUoRM
	X1d6bfbiTKhCu6j2XuBNThwitDjEHlPQwpyDM1decZkVykrRnmee00ZtsBrjh7ohFhI=
X-Gm-Gg: AY/fxX5E7YJhn+39yo6qwAp3iJxBs3DaN99ZR73/rz+d2V5fglx7WlmO69pnq9oVTmW
	dWk0Wh1oSuC0dAej69p+TsStAPrj0Ki2yfP+3OJ6jmsRvKJNA+BPiVb4iCq00s+VnnA7+Ey40sq
	5xVgjRQ6FbLUPFpb81LlS4IuureaN8O99IzHN0JTFPQ49YRfo1Acsw5KOmdLYrbyCfzPdfD/pvk
	WPzjDqHywIuKcWbnNRJ6TWmtiP23lkPsc/8YCpkUIicTBT21X3Jk8s0eTVSh6TcuKSDAPNKKHof
	RGk7JM3fMPJ1Hpq+V9wk5DZUAiYANrHFe0jvK5OQMygQtLXUWxKjsbAD6y/dVKc27305/CqARhM
	tarZ+Avghp1R+ppkcURshLHLtUs9wD7CFaSF8eot41r4m6tuesWNwn1yj5//zlHCits0Ex5Xz8e
	S7t1OsMhBfLFQcWenR
X-Google-Smtp-Source: AGHT+IGnNvmGoO8yPWVpsFsbYZAaj2DCffDyxI9Yos1OcWwvsPhTC8Cpvvm5ho/CQeeMUg7IeOVbhA==
X-Received: by 2002:a05:620a:1aa1:b0:8b2:63ed:dd10 with SMTP id af79cd13be357-8bb3a39de7emr2290802885a.78.1765920168123;
        Tue, 16 Dec 2025 13:22:48 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::c41? ([2606:6d00:17:7b4b::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8be31b66937sm266561085a.41.2025.12.16.13.22.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 13:22:47 -0800 (PST)
Message-ID: <89f845b45405bbf985a5e92c195078074bcce0e2.camel@ndufresne.ca>
Subject: Re: [PATCH v11 03/12] media: mediatek: jpeg: fix jpeg buffer layout
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Kyrie Wu <kyrie.wu@mediatek.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>,  Mauro Carvalho Chehab	 <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski	 <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger	
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Date: Tue, 16 Dec 2025 16:22:46 -0500
In-Reply-To: <20251202094800.6140-4-kyrie.wu@mediatek.com>
References: <20251202094800.6140-1-kyrie.wu@mediatek.com>
	 <20251202094800.6140-4-kyrie.wu@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-mJv6RkBPu7sPfVj/Eoxm"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-mJv6RkBPu7sPfVj/Eoxm
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mardi 02 d=C3=A9cembre 2025 =C3=A0 17:47 +0800, Kyrie Wu a =C3=A9crit=C2=
=A0:
> For memory alloc operation of jpeg dst buffer: the mallocing
> memory function interface use vb2_buffer as the base addr.
> If structure mtk_jpeg_src_buf wants to be allocated to memory,
> it needs to be placed vb2_v4l2_buffer at the starting position,
> because structure vb2_buffer is at the starting position of
> vb2_v4l2_buffer, and the allocated size is set to the size of
> structure mtk_jpeg_src_buf, so as to ensure that structures
> mtk_jpeg_src_buf, vb2_v4l2_buffer and vb2_buffer can all be
> allocated memory.

Please correct the wording, "mallocing" is not a word, addr -> address. I t=
end
to do the same, but refrain from giving the code a personality, the vb2_buf=
fer
have no will. This is overall complicated way to simply say:

	Fix the size of the allocated mtk_jpeg_src_buf structure.

>=20
> Fixes: 5fb1c2361e56 ("mtk-jpegenc: add jpeg encode worker interface")
>=20

Drop the blank line.

> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> ---
> =C2=A0drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 2 +-
> =C2=A0drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h | 2 +-
> =C2=A02 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drive=
rs/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> index 0cf3dc5407e4..bd0afc93d491 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> @@ -1099,7 +1099,7 @@ static int mtk_jpeg_queue_init(void *priv, struct v=
b2_queue *src_vq,
> =C2=A0	dst_vq->type =3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
> =C2=A0	dst_vq->io_modes =3D VB2_DMABUF | VB2_MMAP;
> =C2=A0	dst_vq->drv_priv =3D ctx;
> -	dst_vq->buf_struct_size =3D sizeof(struct v4l2_m2m_buffer);
> +	dst_vq->buf_struct_size =3D sizeof(struct mtk_jpeg_src_buf);
> =C2=A0	dst_vq->ops =3D jpeg->variant->qops;
> =C2=A0	dst_vq->mem_ops =3D &vb2_dma_contig_memops;
> =C2=A0	dst_vq->timestamp_flags =3D V4L2_BUF_FLAG_TIMESTAMP_COPY;
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h b/drive=
rs/media/platform/mediatek/jpeg/mtk_jpeg_core.h
> index 6be5cf30dea1..148fd41759b7 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
> @@ -85,10 +85,10 @@ struct mtk_jpeg_variant {
> =C2=A0};
> =C2=A0
> =C2=A0struct mtk_jpeg_src_buf {
> -	u32 frame_num;
> =C2=A0	struct vb2_v4l2_buffer b;
> =C2=A0	struct list_head list;
> =C2=A0	u32 bs_size;
> +	u32 frame_num;

I like the change, but this shouldn't be an issue if you use container_of, =
which
is safer then a plain cast. Please review the code and make sure to use it.=
 It
may be confusing to include a cosmetic change in a fixes.

Nicolas

> =C2=A0	struct mtk_jpeg_dec_param dec_param;
> =C2=A0
> =C2=A0	struct mtk_jpeg_ctx *curr_ctx;

--=-mJv6RkBPu7sPfVj/Eoxm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaUHNpgAKCRDZQZRRKWBy
9GauAQDSjSJy57f4INnhNyoTxgXltOjS3AO/O50mgH9AbrdfXQD+IMCZiJL8oDJg
iZKHJQfhVDMZqx9S6kHFrKdYog6F1gw=
=T/eA
-----END PGP SIGNATURE-----

--=-mJv6RkBPu7sPfVj/Eoxm--

