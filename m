Return-Path: <linux-media+bounces-48567-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9F3CB3667
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 16:59:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 388A130161F8
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 15:58:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F140929A32D;
	Wed, 10 Dec 2025 15:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="IoL6qZFz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com [209.85.219.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9CCD2874FF
	for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 15:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765382328; cv=none; b=YP1p3iKNE1vqhuuLmihd7AwSQ+Ga6WdeZkjjwBfCOB+3eoIK1mwHn098h93RNxzDXepSYnRgVIAEamZGMyqU+P4tusmVezvq0lWPAu7E5AfvCBvJsH5Lqg9RqnGLw2SGbc7r/AVNTFmWdWuDqYN1EiI5ERytsfknJzArYnuOhjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765382328; c=relaxed/simple;
	bh=7ZfKB29CS941eF8OI9vfnt+kl1s9mmpEJVDq1VWjTQs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eakDydo1nQ5jtrNNhMSvh5RvueTXK9RHdzfUgPaCsOCDoF3AEyFAE7JM6KT2w+eIFWuKMPKUgtQboRa7lZ+b9roaNI+uo4Y4GHs6TSFuvQcUqNW7VfkEw2meL0WAiS0o6h6aoGmAUrNVvswlYA8A5TQ1bhiCEiFJuzdTLCNyPgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=IoL6qZFz; arc=none smtp.client-ip=209.85.219.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qv1-f66.google.com with SMTP id 6a1803df08f44-8845498be17so79997836d6.3
        for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 07:58:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1765382324; x=1765987124; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1GE5RptosWdqJy/yyq4WzVzSYS2R40OO8bXPy8Eb35g=;
        b=IoL6qZFzOaeQmb1+v2U2RUgr+HlxkWts1ibGqSrLePP6ww2CS8HFAQc7b3hnlAOENC
         ZdmVfnOjA5WjHL8Gr84JdCahDrL1XtReXLQyPv4yZ4XWWC2bSoV8YThQQvHjzo5IBqB1
         nUPkHK4On92YtK0nFWWxPgotktk59RhC0dHa9H2yDTNx8SCOsVvLiiz9fR+MRLJNHTVW
         1SFCNYT96m4+IicWZWzKwi82zGUKe0htcqE19G6/XG409OlmuiinyZKm8Au2M5Gef7iP
         /5aCruAttaKbWKUqyspbvf9mXDbDnN9c5CkFHXQyAZAlFopF4soub5Q+QOOnhMKnGn8i
         J2yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765382324; x=1765987124;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1GE5RptosWdqJy/yyq4WzVzSYS2R40OO8bXPy8Eb35g=;
        b=F3w+8X+n1zr5K8JZdYVuNHBMenogtfH+da2eXYtc+elDDc70wFIu4MKp8jhogyh6nr
         CQFqy6MNPzWMKujJfUQxjvhhxGbJ6BjZDTtMOmwnmDdZ3YQS+mBgF/lDueloUp8tSt2l
         cgvVAVH/QtOQ8krcdFVrZzsDfXVn86fLlHL9DIp7+E9T70/1qjdan6P3w9q7L/q4mTws
         uYeAEQxLRww0HakuYvojmH7725Hlk6VmPp4vtYeEMpzV/OWwverrkuGgBpY5WaHfcTVX
         C28AfoC8oAqdNK9+yjJwiNILzU03DDxNB+u/rZxwpj/0ChthOhoRAaNAvPozNtMA0NLM
         VIVw==
X-Forwarded-Encrypted: i=1; AJvYcCUAGTmQ5BbXGSbDNzyb6vSdvjTqv4peEXoRh0PO8SQwL6zWZCFweLrXL1b0dWvMjHrP6gohIjgRBLfnmA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyIuALqs3hX/OVxl0pjE0t7w8xja7p9wOhy2ts6XZOnho9FRZMW
	SBsThnDOUmmSwGpS4vsLsCIXw6UHorI1U0IFb7qzeA+AwVJ/hoSrRfS9BCYIM5HvWHk=
X-Gm-Gg: AY/fxX6MKbJieXAlSR/WETX1sbfeDQZSQFULGTrQYNMPh+WmsRpvAx78Smogv6UcIRo
	cv+cvhonGBEdoQhCWaobOtrJrq9eUnsd64oguMMTlYRWflRQGHt0euiAeyvzAxL6Gem7qr3k6rw
	m1Ihs4lpKYzDvcsmuZ4NH6bozXPzre8pvEQd7Do3fpreot19REVF7UOP8oiEqeRVd83XLE0n1pH
	Uja1kMlI0U//4jFaWN1uimqwD2trwJDJPeDsyAgo835TYVsnBataA6/AiFq94IAmUfS77IGJH7z
	nZPCA7g1X0dosjQ1r6pzQO4lbPm3zChy152mgPKp3VB9B2ed5XzpFT4ANUtAbB8/rZ5gjdk4IMq
	mPIuH+N5ZIo7i5xuhJzJDdEzpOq2WZCWcqc8q7NolBZQe8blxztS/LBJ2P/1i2/XldArOuGbJxC
	iek200IL1cMxH4bRXeaVYd/KQWx4w=
X-Google-Smtp-Source: AGHT+IF6i0V89RApudcP5yeANqOOTTwCYv/qsuj7/dQsvJiJLLv2PXtBBDPe+3zPaacPXUeT/ZONBw==
X-Received: by 2002:a05:6214:d08:b0:882:401c:e37d with SMTP id 6a1803df08f44-88863ad3a25mr40591616d6.63.1765382323629;
        Wed, 10 Dec 2025 07:58:43 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::c41? ([2606:6d00:17:7b4b::c41])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8886ec2d32esm333676d6.5.2025.12.10.07.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 07:58:42 -0800 (PST)
Message-ID: <78aeb9303f3d57a28b2edc3b6b2b2f45498ee3fd.camel@ndufresne.ca>
Subject: Re: [PATCH v2 2/2] media: mediatek: amend vpu_get_plat_device()
 documentation
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Johan Hovold <johan@kernel.org>
Cc: Minghsiu Tsai <minghsiu.tsai@mediatek.com>, Houlong Wei	
 <houlong.wei@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Mauro Carvalho Chehab	 <mchehab@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,  AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Tiffany Lin
 <tiffany.lin@mediatek.com>, Yunfei Dong	 <yunfei.dong@mediatek.com>,
 linux-media@vger.kernel.org, 	linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: Wed, 10 Dec 2025 10:58:41 -0500
In-Reply-To: <aTjnH_i0q0xyLysD@hovoldconsulting.com>
References: <20251028100454.4086-1-johan@kernel.org>
	 <20251028100454.4086-3-johan@kernel.org>
	 <836bcbc3e35c267abd93a4d2174a3e570ca9e181.camel@ndufresne.ca>
	 <aTjnH_i0q0xyLysD@hovoldconsulting.com>
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
	protocol="application/pgp-signature"; boundary="=-+J+gL0rfBvLlL7o9z/0H"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-+J+gL0rfBvLlL7o9z/0H
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 10 d=C3=A9cembre 2025 =C3=A0 12:21 +0900, Johan Hovold a =C3=A9=
crit=C2=A0:
> On Tue, Dec 09, 2025 at 03:43:30PM -0500, Nicolas Dufresne wrote:
> > Hi,
> >=20
> > Le mardi 28 octobre 2025 =C3=A0 11:04 +0100, Johan Hovold a =C3=A9crit=
=C2=A0:
> > > Add a comment to the vpu_get_plat_device() documentation to make it
> > > clear that the VPU platform device is returned with an incremented
> > > reference count (which needs to be dropped after use).
> > >=20
> > > Signed-off-by: Johan Hovold <johan@kernel.org>
> > > ---
> > > =C2=A0drivers/media/platform/mediatek/vpu/mtk_vpu.h | 2 +-
> > > =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
> > >=20
> > > diff --git a/drivers/media/platform/mediatek/vpu/mtk_vpu.h
> > > b/drivers/media/platform/mediatek/vpu/mtk_vpu.h
> > > index da05f3e74081..5808311d2b15 100644
> > > --- a/drivers/media/platform/mediatek/vpu/mtk_vpu.h
> > > +++ b/drivers/media/platform/mediatek/vpu/mtk_vpu.h
> > > @@ -120,7 +120,7 @@ int vpu_ipi_send(struct platform_device *pdev,
> > > =C2=A0 *		device for using VPU API.
> > > =C2=A0 *
> > > =C2=A0 * Return: Return NULL if it is failed.
> > > - * otherwise it is VPU's platform device
> > > + * otherwise it is VPU's platform device with incremented reference =
count
> >=20
> > I picked this patch but rewrote with what felt like better and dense.
> >=20
> > - * Return: Return NULL if it is failed.
> > - * otherwise it is VPU's platform device
> > + * Return: a reference to the VPU's platform device, or NULL on failur=
e.
> >=20
> > hope its ok with you,
>=20
> Sure, my only concern is that just saying "reference" is too subtle,
> that's why I explicitly mentioned the refcount.

For me everyone should read "a reference" as a kref based reference counted
structure.  A quick grep across out documentation, this is the vast majorit=
y of
the wording. Though, I spent limited time looking.

>=20
> Btw, why is patch 2/2 marked obsolete? That leak is still there both on
> probe errors (which I saw someone else posted a fix for) and on driver
> unbind.

I had two patches fixing the same thing, it just happen that I ended up pic=
king
the other one first, and liked you documentation fix, except it was replica=
ting
obvious weird english such as "if it is failed", and documenting the error
before the expected outcome (opposite of my preference, not sure there is a=
ny
rules or guidelines).

https://lore.kernel.org/all/20251008090156.14224-1-haoxiang_li2024@163.com/

cheers,
Nicolas

>=20
> Johan

--=-+J+gL0rfBvLlL7o9z/0H
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaTmYsQAKCRDZQZRRKWBy
9LyKAP9enelzywFizrpad8u/0Za3pIfyQ9BcWEt7RBs2neM1GAD/XXHUI1c9UEpL
yRRdzGOwhD2B25O6fXVKtUS2AKIoNQY=
=Bzdj
-----END PGP SIGNATURE-----

--=-+J+gL0rfBvLlL7o9z/0H--

