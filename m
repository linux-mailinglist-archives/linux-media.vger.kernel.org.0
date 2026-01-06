Return-Path: <linux-media+bounces-50076-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 01074CFB0F3
	for <lists+linux-media@lfdr.de>; Tue, 06 Jan 2026 22:12:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 581B430361CA
	for <lists+linux-media@lfdr.de>; Tue,  6 Jan 2026 21:11:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD8ED2D3750;
	Tue,  6 Jan 2026 21:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="BZd2o/pU"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E39D29B793
	for <linux-media@vger.kernel.org>; Tue,  6 Jan 2026 21:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767733904; cv=none; b=tbbTrIJi3IJ9QH85Swa8xIYFrSh3DorQPGZAcrAcbebfo1JKr5G8oHrKxZgI4er++hlFFDkmt3VvKdweC11EyPXDjeu2u5kDwjShU7AXS9J9jqs6SQRzszH2EXH+a0ILsqQO3gUNsz2tx949tIsGtHBTajjqKvWlf7NU0GMxrks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767733904; c=relaxed/simple;
	bh=rhCOm1dYgXC082yhaNw3lvg0VrdND0R4ZLKYpr3qYzc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qa7OaiBxr5uKlUoA2PkzoPVnhdknpyfrTCm+K4GXU1Yd5gNQw8Au3HwtiFva7UE4pHEZ9jh/tne0z2+7XW2hRM4IIQKBtWsGNX9CEpQ7oOqY7vrc4jqhc2TY5uu3vEvfVsAEn6cexj8/HXVLzDps1CxWltn8Qzud4BktnMZyxAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=BZd2o/pU; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-88a288811a4so13772946d6.3
        for <linux-media@vger.kernel.org>; Tue, 06 Jan 2026 13:11:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1767733901; x=1768338701; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QhN1WAuMMr05B3KPSfvPQnFSaJ788oFx+QDIhlRIVYE=;
        b=BZd2o/pU+5/KCd4RVg4pTLxhS9G99oA3pLzzXJamGRT0S0pADv7Qcy1c89Ilpf4gqi
         qzUOkvuHTj7NgoKFd4BVU6NR+cSrxvDosMPzKaaqcQyBJUFUuZT5ljS7lAuYYRV6c4EF
         hRaJl4+k0LY8O9fQz/ysn3zLVZYTdLn/2XlyUK0fgtqXp1O/Dxme139RsVArRfkCDrCh
         VXm86QudFRCknH0grwHWKtC27SVjlXH1M0Gkh8UbHGlX/inzo9UpYtIKW6hjcYwo7YA8
         WxGFX5ycZMG/KMo1IMjCwpCNwUFipjB1Pm4yqBQciLC6VwR34uSEilnL2C3PjQ7acHUF
         n7uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767733901; x=1768338701;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QhN1WAuMMr05B3KPSfvPQnFSaJ788oFx+QDIhlRIVYE=;
        b=cBiF0967mQQVrLU5cfcHTHoCyZxnfYRVIwhMEerHtaU/wNIq+L8Fx2rQPLcvV+iLqk
         /rvCdNHykVXDCPSLGBHE91LUlEQPmbyEwPNDXPKkPtuj3QU2KMWO2asC0uDbMbouZiSU
         9z6cLIzV1oHQuP/2vVIesP9QpmKmQcnHJMWEXrELh9mUZFY1USD1e1FMhTP5KbCyyoZe
         cL5YmBID+Rfh408HwPCa+8GI9hYTfwj2DTIqJgzlvcFLvonnIPwj7LftzOa5s0+3078F
         Eiwzacsn/bD/BY75eQC5+X210nrv6T0LCj5CZpdpx8cDeGcTGFUjeWQVvxwwrx939Uoh
         unMg==
X-Forwarded-Encrypted: i=1; AJvYcCV3Ljt8gzF0yAqwzVfIZyw1PR3VgnvV30lPPukPhE9gafENjl6FxYSsZbjYDpVn7Ec58uAScpJW56dxgQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyyfc/PAg7oUECl0DbO8zew3QhR+E0voAQ2wBzuSwAjpWFHVwA/
	OY55ZSaoZ3pNqgqTe//O49iLQDCX6OZv1VTP6jq7+JlNrcAHTGPEcapday7/yrUXJow=
X-Gm-Gg: AY/fxX4DFfwiBGIqI1OMgwSdLzBRgVKPbMmOyBGHjsmFb5qFP4qtD0JapdGA8Ba/dtE
	3P7eN+g/NiAo262PNHvnR5K5uEzvych3/J2tLKTtnCmwAHILxkrjSenRUgZhXnenwfrGEho2of8
	fr0ZjtxCI5N1lYNQk73PUGuDDyeGKltMRxpuEqz5E2dUMQyIWogUcCoSoyPTWv7DxTeg3knWoOr
	+8Dqb8tn4lsLU6hMYxziiU9+tADrJf/H+t52dArhZ3j0c/hD6kVo6lOfz/zqHOcXUtmENe+rpt0
	kFLWJfys9ya5v357rTbNV79eKx5mLTv0Z5iuEu/Oqh6GcoFwM6sohjJ29/9s3KbW0QsI8qJJ1nV
	bfsED1LQv1CKWhFz71Mbnl4bB3dL7CJBT5HAnadmZ9k9v3kCdFr1zDlFaaoJ6mdtonU/xfWm8EI
	SZ1WAabh2Ckv3YNfoC
X-Google-Smtp-Source: AGHT+IGkuyCRu/Q0Kl0G1KNS2qkhBKE92qfOqtUSoW0GG/DuxCV7QpwSsCvsAQoK2tmgoaaLEgC0Kw==
X-Received: by 2002:a05:6214:3c8f:b0:88a:2c78:d625 with SMTP id 6a1803df08f44-89084257197mr4038516d6.48.1767733901288;
        Tue, 06 Jan 2026 13:11:41 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::5ac? ([2606:6d00:17:7b4b::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89077234c96sm20302746d6.27.2026.01.06.13.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 13:11:40 -0800 (PST)
Message-ID: <e792da7b15eb4f58820f4c44dc695ddfe40d5007.camel@ndufresne.ca>
Subject: Re: [PATCH v2 2/4] dt-bindings: media: mediatek-jpeg-decoder: add
 MT8189 compatible string
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Jianhua Lin <jianhua.lin@mediatek.com>, mchehab@kernel.org,
 robh@kernel.org, 	krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, 	angelogioacchino.delregno@collabora.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com,
 sirius.wang@mediatek.com, 	vince-wl.liu@mediatek.com, jh.hsu@mediatek.com
Date: Tue, 06 Jan 2026 16:11:38 -0500
In-Reply-To: <20251224031721.9942-3-jianhua.lin@mediatek.com>
References: <20251224031721.9942-1-jianhua.lin@mediatek.com>
	 <20251224031721.9942-3-jianhua.lin@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-eEh22EQQUYjPOaWs78RQ"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-eEh22EQQUYjPOaWs78RQ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mercredi 24 d=C3=A9cembre 2025 =C3=A0 11:17 +0800, Jianhua Lin a =C3=A9c=
rit=C2=A0:
> Compared to the previous generation IC, the MT8189 uses 34-bit iova
> address-space (16GB) and requires a single clock configuration.
> Therefore, add "mediatek,mt8189-jpgdec" compatible to the binding documen=
t.
> Additionally, it corrects the inheritance for MT8188, aligning it
> with MT8189 due to their shared architecture and 34-bit iova address
> space (16GB) and singlesingle clock requirement.

singlesingle -> single

> Previously, MT8188 was incorrectly defined alongside SoCs with 32-bit
> iova address-space (4GB), such as "mediatek,mt2701-jpgdec". This mismatch
> results in an ABI break, as MT8188 cannot function correctly under
> the 32-bit iova address-space (4GB) configuration.

Was already mentioned earlier, badly introduce DT code create an ABI, and f=
ixing
it is the ABI break, not the other way around. The MT8188 issue should be f=
ixed
on its own, with proper Fixes: tag.

>=20
> Key changes include:
> - Introducing "mediatek,mt8189-jpgdec" as a new compatible string to
> =C2=A0 represent the correct architecture.
> - Updating MT8188 to inherit from MT8189, ensuring proper support for

It is odd to have older chips inherit from newer one, should be reversed
assuming you can fix MT8188. See more comment below.

> =C2=A0 34-bit iova address-space (16GB) and simplifying clock configurati=
on.
> - Add property "mediatek,larb" for MT8189 requirements.
> - Improved formatting for better readability and consistency.

Do style change in it own commit, I don't mixing reformating, with fixed an=
d new
feature in one patch will create much interest in your set from the DT
maintainers. So please break this into at least 3 patches.

> These changes ensure that both MT8188 and MT8189 are correctly supported
> with the necessary 34-bit iova address-space (16GB), while maintaining
> compatibility with their shared architecture.
>=20
> Extensive internal review and testing have been conducted to validate
> these changes and ensure compliance with DT binding standards.

This last paragraph does not seem relevant as a commit message. Consider re=
ading
this message in 5 years, would it be useful, and answer is not, since we ca=
n't
see the review and testing process.

>=20
> Signed-off-by: Jianhua Lin <jianhua.lin@mediatek.com>
> ---
> =C2=A0.../bindings/media/mediatek-jpeg-decoder.yaml | 50 ++++++++++++++++=
---
> =C2=A01 file changed, 44 insertions(+), 6 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/media/mediatek-jpeg-decode=
r.yaml b/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
> index a4aacd3eb189..814b53ef46e7 100644
> --- a/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
> @@ -17,13 +17,19 @@ properties:
> =C2=A0=C2=A0=C2=A0=C2=A0 oneOf:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - items:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - enum:
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 - mediatek,mt8173-jpgdec
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 - mediatek,mt2701-jpgdec
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 - mediatek,mt8173-jpgdec

I guess you sorted these, this is the type of style change that makes revie=
wer
unhappy, do this cleanup on it own.

One thing the driver implementation tells me is that mediatek,mt8173-jpgdec=
 is
not different from mediatek,mt2701-jpgdec, so in theory, the DTS should hav=
e
aimed for the second item and an implementation of:

  compatible =3D "mediatek,mt8173-jpgdec", "mediatek,mt2701-jpgdec";

That just shows the screw-up started a while ago, I'm not saying to change =
that
now.

> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - items:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - enum:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 - mediatek,mt8189-jpgdec

That one make no sense, if you want to allow this compatible alone, put it =
the
very first item, its meant for that. Though, considering the chronology, it
would be logical to say that MT8189 is based on MT8188. If we go that way,
MT8188 should get added into the single item choice and the enum/const pair
shoudl be reversed.

> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - items:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - enum:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 - mediatek,mt7623-jpgdec
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 - mediatek,mt8188-jpgdec

This must be kept, its unfortunate, but its in the ABI.

> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: med=
iatek,mt2701-jpgdec
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - items:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - enum:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 - mediatek,mt8188-jpgdec
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: mediatek=
,mt8189-jpgdec

This would be reversed.

On the implementation side, in code, you'd introduce a variants that matche=
s
mediatek,mt8188-jpgdec, this will ensure the driver now works properly with=
 past
DTS.

Then in DTS, which is not my domain here at all, what is appropriate will d=
epend
on what happens if you assume MT8188 is same as MT2701. In my personal opin=
ion,
if that is unusable or worse crash or hang the systems, I'd drop the broken
"mediatek,mt2701-jpgdec" so it won't probe anymore on older drivers. If its
usable / used in some ways, e.g. if it work on 4GB systems, you'll have to =
leave
it this way, since you'd regress some users.

The rest is a bit over my head, I've a simple users of DT like you, but
hopefully these hints are good enough to un-lock the situation. Notice the
chronology logic needs to be applied down below too.

> =C2=A0
> =C2=A0=C2=A0 reg:
> =C2=A0=C2=A0=C2=A0=C2=A0 maxItems: 1
> @@ -32,13 +38,16 @@ properties:
> =C2=A0=C2=A0=C2=A0=C2=A0 maxItems: 1
> =C2=A0
> =C2=A0=C2=A0 clocks:
> +=C2=A0=C2=A0=C2=A0 minItems: 1
> =C2=A0=C2=A0=C2=A0=C2=A0 maxItems: 2
> -=C2=A0=C2=A0=C2=A0 minItems: 2
> =C2=A0
> =C2=A0=C2=A0 clock-names:
> -=C2=A0=C2=A0=C2=A0 items:
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: jpgdec-smi
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: jpgdec

So what happened once the driver on MT8188 tried to enable jpgdec-smi clock=
 ?
This is relevant to what can and cannot be changed, was it completely unusa=
ble ?

regards,
Nicolas

> +=C2=A0=C2=A0=C2=A0 minItems: 1
> +=C2=A0=C2=A0=C2=A0 maxItems: 2
> +
> +=C2=A0 mediatek,larb:
> +=C2=A0=C2=A0=C2=A0 $ref: /schemas/types.yaml#/definitions/phandle
> +=C2=A0=C2=A0=C2=A0 description: a phandle to the smi_larb node.
> =C2=A0
> =C2=A0=C2=A0 power-domains:
> =C2=A0=C2=A0=C2=A0=C2=A0 maxItems: 1
> @@ -51,6 +60,35 @@ properties:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Documentation/devicetree/bindings/io=
mmu/mediatek,iommu.yaml for details.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Ports are according to the HW.
> =C2=A0
> +allOf:
> +=C2=A0 - if:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 properties:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 contains:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enum:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 - mediatek,mt2701-jpgdec
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 - mediatek,mt8173-jpgdec
> +
> +=C2=A0=C2=A0=C2=A0 then:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 properties:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clock-names:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 items:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - con=
st: jpgdec-smi
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - con=
st: jpgdec
> +
> +=C2=A0 - if:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 properties:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 contains:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enum:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 - mediatek,mt8189-jpgdec
> +
> +=C2=A0=C2=A0=C2=A0 then:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 properties:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clock-names:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 items:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - con=
st: jpgdec
> +
> =C2=A0required:
> =C2=A0=C2=A0 - compatible
> =C2=A0=C2=A0 - reg

--=-eEh22EQQUYjPOaWs78RQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaV16iwAKCRDZQZRRKWBy
9IFvAP9gJU9igmAjidakuJKz0akdpOjt4yNcvs8FjB1MMY98fQEA1nsKZhTWxs1n
ad7uFPYE7mdheCU2tU4bBl/ournlIQs=
=cORP
-----END PGP SIGNATURE-----

--=-eEh22EQQUYjPOaWs78RQ--

