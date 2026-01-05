Return-Path: <linux-media+bounces-49947-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4D3CF55D9
	for <lists+linux-media@lfdr.de>; Mon, 05 Jan 2026 20:24:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 66AFD30FF1A5
	for <lists+linux-media@lfdr.de>; Mon,  5 Jan 2026 19:20:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38C2A335579;
	Mon,  5 Jan 2026 19:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="TJ3sIlDR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A152236F2
	for <linux-media@vger.kernel.org>; Mon,  5 Jan 2026 19:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767640810; cv=none; b=MQcIqsJXrIJwQXjI8CpKJj4GwRaKFUOaa/bWcWyjcPmb9p8LZqmhRGdB09/Uzu2RoMtjpE0Huga6Cn+3HzJ+Rdd//L8W0bUJQvVq+ZFkdorMncrxgZeikYDRB5SuLypdAXFgHtF49ePlemwDHCaLd2ji7nUPlJfwcS7zHFqX+GQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767640810; c=relaxed/simple;
	bh=u5pleekLtqG+MdhYkCY33LZhw5klizNOoYJrUXAVaBo=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ihfBbzKEvIIDHEomWsWpM11mr+7QawAKFR3O/QEnUMcPtHjTjmCDmGVg+MG0DbhR/t7mU7XPy2i+UXjwFV4Zw5HaVgyZGCqLmbayQE6LleO6dtVxIOxtO/rSte6AzQhXlFUvuezJlqSoL7BjM8ozJRhCU8DEKKQ6zOOqWGf4PwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=TJ3sIlDR; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8c24f867b75so22403285a.2
        for <linux-media@vger.kernel.org>; Mon, 05 Jan 2026 11:20:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1767640808; x=1768245608; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tDDvkHfL5SsDyjmtGrwtC4U8Vp9VsmLY6KqyAaQnAtw=;
        b=TJ3sIlDR2Zr1fxGTPnL2kmP1+uCUcNJDOPTnHThXRh2U6mXJKQ4i6KOwa5x9Rt2Lqi
         sFcG+4itmQYt9f0Do/BkPk0+GFSLV/HIdTKFwDaGp1yNdIdlmcRzPqfTx4GXgDL/NNyk
         hKuJd2gLpSM47PWG73xxoZJDUi7qtQ5y0ZAngy5PhUT5drUQGHkhweFkG1xCeXzZbqFE
         beLXHnGl4hw/EmUxhaU2zzw4pMO8RJHRynFBkj6yJCkUhh3v0EkW7+DZO1umucuSlW0Z
         WrjljTxEBzxVT34Lxt7v2q2bUtewxd4du6g45ocgZFTLxjBR5N8Ai9grZ/lsNHLABFFW
         sIfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767640808; x=1768245608;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tDDvkHfL5SsDyjmtGrwtC4U8Vp9VsmLY6KqyAaQnAtw=;
        b=IyrcnVEq1GNjE4/Th4aSfuRvGXFcuh3hOe6sSoXNzhQXcOtE3Xhs/XYPqW8Eufn5Lh
         Df7bdlIXg+/2bCzR9fPSD+hgHtP9yJU0ornpCOAMDVG4ByloBNDuMem8X56SeQ/btYtw
         sllglY16OilAnOU8o1qhYXKHMP+V8oMHA3ndfiyOTWj25Mamqu81YlzfIRZxBpcVifkd
         HYuUjL9qPH15EOkGUkbrcjkkPkfkt402TX8aV2JUEMtIfr67D2okQP3iH7TsAKhJCzG+
         C3mbtMT0PFEIwSxGAwPGLellhgrmhpCMaTUxlynyF1yW+c00XtAs2OOreGsHkkXex3nQ
         k2Ug==
X-Forwarded-Encrypted: i=1; AJvYcCV8pmd8OgFsbejk9uL4U9EDUE4+eqSWHPgrtMhbOMwbKAQys3JPKpJOdjAanyf6xhhlzHSZX9ePVDWEfQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQ45oZ3f9YWenkazcP1t7j7FF5dHqPbDXC18t7RSaCff9/ZQgw
	62tOLNPlberqlqprFIna5Gy2tYJhf2G/Ip5lElG23jgGEBwkGAKPtTrcOPXSRQkHD6M=
X-Gm-Gg: AY/fxX5X9tMrR6CO/rpLuRbj4LMN2NucGqBPTccBqDsoZBPjJI+jW9y8JCKcke0Z6b5
	F1RSXXCk6Iye13Ks04TUGh5LsK2JZSWw4Kn0jDrMFQB9B/zqhHqO0bEEgSg3oHzC1x6tRBbdWu0
	j5OdaBV0GtyBb3sKjXqRpBDTq9NNg0tjtSIVtc0AMkFfaipn1NQn7GL/PNX/zjOeM7pBIjyjPpJ
	cg69P5Y24saA5HljEHJigzIBuDZ9S7Mb41/YxtU8Iu8ptvUyFhF1g6MJQah/yEUBNRAyirCIPFl
	IUAjIpnvYSVntZOh2Sfrzcn+j3YumrIkOoMxshR8hONge4CA/HfVO79zUlSgdrqiTLD18w3Vbi6
	bfwgLrOYaDrxwHajMoC5OCPHix+KkX1bJ14g3SyBqDrtlFDA2cUOsiT+WpM0g+kNjOLDMKED5z6
	PsXMI3brkQMqp8Htfn
X-Google-Smtp-Source: AGHT+IE5ziBUA1L6ZAL+rkRAZxmOcXQvbxBtmVTb5t38TGd5tiHW8FkBWpqUQMf/N8PhTT3xc9qk1w==
X-Received: by 2002:a05:622a:250b:b0:4eb:a6c5:f6c7 with SMTP id d75a77b69052e-4ffa769a084mr8345811cf.2.1767640807852;
        Mon, 05 Jan 2026 11:20:07 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::5ac? ([2606:6d00:17:7b4b::5ac])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ffa708853fsm4201461cf.9.2026.01.05.11.20.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 11:20:07 -0800 (PST)
Message-ID: <415509d2c4639d086614e9a473b09be16442648a.camel@ndufresne.ca>
Subject: Re: [PATCH v11 03/12] media: mediatek: jpeg: fix jpeg buffer layout
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Kyrie Wu =?UTF-8?Q?=28=E5=90=B4=E6=99=97=29?= <Kyrie.Wu@mediatek.com>, 
 "linux-kernel@vger.kernel.org"
	 <linux-kernel@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
	 <linux-mediatek@lists.infradead.org>, "linux-media@vger.kernel.org"
	 <linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	 <devicetree@vger.kernel.org>, "mchehab@kernel.org" <mchehab@kernel.org>, 
 "conor+dt@kernel.org"
	 <conor+dt@kernel.org>, "robh@kernel.org" <robh@kernel.org>, 
 "hverkuil-cisco@xs4all.nl"
	 <hverkuil-cisco@xs4all.nl>, "linux-arm-kernel@lists.infradead.org"
	 <linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	 <matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Date: Mon, 05 Jan 2026 14:20:05 -0500
In-Reply-To: <714f2e57521e990d77b80d23a9eb773ca878b07a.camel@mediatek.com>
References: <20251202094800.6140-1-kyrie.wu@mediatek.com>
		 <20251202094800.6140-4-kyrie.wu@mediatek.com>
		 <89f845b45405bbf985a5e92c195078074bcce0e2.camel@ndufresne.ca>
	 <714f2e57521e990d77b80d23a9eb773ca878b07a.camel@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-4+oXkLqgBdCrGoVfdxJj"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-4+oXkLqgBdCrGoVfdxJj
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 25 d=C3=A9cembre 2025 =C3=A0 06:05 +0000, Kyrie Wu (=E5=90=B4=E6=
=99=97) a =C3=A9crit=C2=A0:
> On Tue, 2025-12-16 at 16:22 -0500, Nicolas Dufresne wrote:
> > Hi,
> >=20
> > Le mardi 02 d=C3=A9cembre 2025 =C3=A0 17:47 +0800, Kyrie Wu a =C3=A9cri=
t :
> > > For memory alloc operation of jpeg dst buffer: the mallocing
> > > memory function interface use vb2_buffer as the base addr.
> > > If structure mtk_jpeg_src_buf wants to be allocated to memory,
> > > it needs to be placed vb2_v4l2_buffer at the starting position,
> > > because structure vb2_buffer is at the starting position of
> > > vb2_v4l2_buffer, and the allocated size is set to the size of
> > > structure mtk_jpeg_src_buf, so as to ensure that structures
> > > mtk_jpeg_src_buf, vb2_v4l2_buffer and vb2_buffer can all be
> > > allocated memory.
> >=20
> > Please correct the wording, "mallocing" is not a word, addr ->
> > address. I tend
> > to do the same, but refrain from giving the code a personality, the
> > vb2_buffer
> > have no will. This is overall complicated way to simply say:
> >=20
> > 	Fix the size of the allocated mtk_jpeg_src_buf structure.
> >=20
> > >=20
> > > Fixes: 5fb1c2361e56 ("mtk-jpegenc: add jpeg encode worker
> > > interface")
> > >=20
> >=20
> > Drop the blank line.
> >=20
> > > Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> > > ---
> > > =C2=A0drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 2 +-
> > > =C2=A0drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h | 2 +-
> > > =C2=A02 files changed, 2 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> > > b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> > > index 0cf3dc5407e4..bd0afc93d491 100644
> > > --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> > > +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> > > @@ -1099,7 +1099,7 @@ static int mtk_jpeg_queue_init(void *priv,
> > > struct vb2_queue *src_vq,
> > > =C2=A0	dst_vq->type =3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
> > > =C2=A0	dst_vq->io_modes =3D VB2_DMABUF | VB2_MMAP;
> > > =C2=A0	dst_vq->drv_priv =3D ctx;
> > > -	dst_vq->buf_struct_size =3D sizeof(struct v4l2_m2m_buffer);
> > > +	dst_vq->buf_struct_size =3D sizeof(struct mtk_jpeg_src_buf);
> > > =C2=A0	dst_vq->ops =3D jpeg->variant->qops;
> > > =C2=A0	dst_vq->mem_ops =3D &vb2_dma_contig_memops;
> > > =C2=A0	dst_vq->timestamp_flags =3D V4L2_BUF_FLAG_TIMESTAMP_COPY;
> > > diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
> > > b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
> > > index 6be5cf30dea1..148fd41759b7 100644
> > > --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
> > > +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
> > > @@ -85,10 +85,10 @@ struct mtk_jpeg_variant {
> > > =C2=A0};
> > > =C2=A0
> > > =C2=A0struct mtk_jpeg_src_buf {
> > > -	u32 frame_num;
> > > =C2=A0	struct vb2_v4l2_buffer b;
> > > =C2=A0	struct list_head list;
> > > =C2=A0	u32 bs_size;
> > > +	u32 frame_num;
> >=20
> > I like the change, but this shouldn't be an issue if you use
> > container_of, which
> > is safer then a plain cast. Please review the code and make sure to
> > use it. It
> > may be confusing to include a cosmetic change in a fixes.
> >=20
> > Nicolas
>=20
> Dear Nicolas,
>=20
> The driver requests memory space for mtk_jpeg_src_buf in the
> function of mtk_jpeg_queue_init,
> and it used struct vb2_v4l2_buffer b as the starting base address,
> the parameter,frame_num, will not get a memory if we keep the old
> structure. And a unknown memory would be get if we used container_of
> to get the starting address of mtk_jpeg_src_buf.

You are right, and the documentation says so:

 *              The first field of the
 *		driver-specific buffer structure must be the subsystem-specific
 *		struct (vb2_v4l2_buffer in the case of V4L2).

This is inconsistent with how other objects are overloaded, notably the req=
uest
object, which does not have this limitation. We should probably fix that
someday, meanwhile.

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

>=20
> Thanks.
>=20
> Regards,
> Kyrie.
> >=20
> > > =C2=A0	struct mtk_jpeg_dec_param dec_param;
> > > =C2=A0
> > > =C2=A0	struct mtk_jpeg_ctx *curr_ctx;

--=-4+oXkLqgBdCrGoVfdxJj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaVwO5QAKCRDZQZRRKWBy
9JQpAP0dnUFHHjrwSdklIXv0iM9Mn2ffy7uO4iLtFZ1F13veZwEAxFlPuKq8bjib
yxKl4rlCUkzH3EGoWvZd1nccuFKJ5Qw=
=uGnL
-----END PGP SIGNATURE-----

--=-4+oXkLqgBdCrGoVfdxJj--

