Return-Path: <linux-media+bounces-48492-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B8AAFCB1096
	for <lists+linux-media@lfdr.de>; Tue, 09 Dec 2025 21:43:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A8BE030C5883
	for <lists+linux-media@lfdr.de>; Tue,  9 Dec 2025 20:43:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51D853002B4;
	Tue,  9 Dec 2025 20:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="YdrMvmOa"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F7B23E356
	for <linux-media@vger.kernel.org>; Tue,  9 Dec 2025 20:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765313015; cv=none; b=q5dVBBbLF2cumlc0yHd0lqHCP6cd3X9uBHK71eGTGe+jebmwwayzO5ofj48kR01y9QX49pFWmoh5rYxlwmsKTnvsZe1xJsiiX53cCoMFOSWX5Co3Fzq8fDNutSJCSSRQM1qJsmAEgi8cGvbH4XIez+mZ8F62pW0JH2fFfjhWOy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765313015; c=relaxed/simple;
	bh=JyNfAeoINDbRUNcXV4batX8ndNmt5G0LHmbVwuN1+w8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TvPnH2c+T0bIb6VpbNqTxxoc1FaltWC1dKJkMDMVoNv5IayjGH/s0ifZiYa27KvxfMV5q15umDqsT2Xpbzi84mh+hk6pAbMQMrtS9Ut+tHDySafA549h35lM/6CNC5e+i/5eWTGLj28IIZnavsbzXe/x/lFTM/XE9NTi8fEx090=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=YdrMvmOa; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4ed82e82f0fso53666351cf.1
        for <linux-media@vger.kernel.org>; Tue, 09 Dec 2025 12:43:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1765313012; x=1765917812; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=weneXfNVJ7zOQ6jk7rha+Mva6f5rhafesHIx5rAX4pY=;
        b=YdrMvmOaoKzUsGcOgqMtwhWaSwPzqhZxcTtj7QPhb6gISe80EnFP6+kVE6QZ5XptaL
         YVyVmnuW8dCX4xbiGDrJbJriQKrsp0LQGhyLY4uSNbI04soYMHRMJjFr65F5JqcCzjR8
         z5F0qCzB6hXWchKVWcNIrN6jM7bJThO0E7bJBIq3+VTAG/yw5tGLpu0JH2LYdxMXwEb+
         KFQeRDi3p5lO9yTDfW8idI9noJenHhot+k49th4sKuPHpNHukvNDHWPpUVcw++CwuXKd
         xbxvVmWgSq0bo+6nV6boHyuyFGzrFNgKGM6pk/5VWJFfjFY93pkQdpzuS8jt2dD/zdkl
         Tfyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765313012; x=1765917812;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=weneXfNVJ7zOQ6jk7rha+Mva6f5rhafesHIx5rAX4pY=;
        b=Rp4Dz3ojvh15VzF6o92mE2kVs9qgfx2mZAqMyEcjhMqhbpMR3VJAN2Tif6AGsvI7Mx
         eiM1UrP7bQBvz+TSMiuUPy1/0izCn1ryVDkiX2K35AqVObWyD4RvoKdUCvQ6rOGqB2SI
         vTuUixOiZuRuqm2Z4sUopGI6lunIf9XqBHLrReImgov8lSU/dM/DuIb5jobh7WKMZxW5
         ZSbpLk4AutXr11StGrEHlg8vAsW9vuZGUyqFYXcC5RQuZoGCVy5saFScctvbBPaaXU2y
         VA5MUwX8yNmBAOy4VeVuJ/eyA4RmO+2VLdg5+SD02ypHV8+SyS7P1SZLlEe/sk+UZgPk
         PKgw==
X-Forwarded-Encrypted: i=1; AJvYcCUp7J1gOSuLLz4yD3QpRRVcbICM8qhJ45jnMOHH42U7RX0cdfgJaej9nzNLEEAEnv7LmpurUIhdNHqGJg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxpWqxdeVobhEJ4TnOLk4Wk+AhNy3cFwf5I1mFUP4+Td7yqnbjY
	UScIjEtXX1wTtidykKPY+N6CpYWp2ccpy/mMMhJaJdrdbYPBroSMyHkIURehTXcrb64=
X-Gm-Gg: ASbGnctLu6YXWNUfYtHYvC/Zh2z2pLJMKlNr2O5rq848iDlcCuvaG5iXXtHjflKc1Ox
	jpesYkpBOpg/yRxn0qZ1AD8yBmobVYsZG7Rbb+DDT+94/bGwbVCiUzfC2jgotH2MiJVjnuPCNGX
	C/m+8m/BK8IgPbLa1z4WPr63GIWQxueog2jA0ELo4MO6qZIANXttMzK5GtlKDD31gKAYZb9k3f2
	O07xFP+snYVpKUT0BpuBc5yufcDVt5DoZ+cH6IOLsItx+hMHqDWmPHlu9YQ3YxPF5M4iPRPMCtu
	4vkEHZDRzgGk8doIGf8bSdmRgqZvT72BGxuGQFJ+gyTTLHHUXsgFr8dl1VnaDafQSRfDlTFkTG3
	kyb7YHh0b+gvZuhVBzmiX52mPhYqEyelH1DH1NSWunIhWPts57Cv0269nYAcWdoV4avSQmUrdhV
	HImSTkei3u6eBHu7Qg
X-Google-Smtp-Source: AGHT+IF7CIbPoUT7TqfUIErNLH26jeQ7FGydXS4DlUaPIqfS18IW9X1btJxpQzdxCkmmR6rIS+bzFA==
X-Received: by 2002:ac8:580d:0:b0:4ee:1ef0:9474 with SMTP id d75a77b69052e-4f1b1a535a5mr185021cf.21.1765313012364;
        Tue, 09 Dec 2025 12:43:32 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::c41? ([2606:6d00:17:7b4b::c41])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f0276dd360sm109568801cf.15.2025.12.09.12.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 12:43:31 -0800 (PST)
Message-ID: <836bcbc3e35c267abd93a4d2174a3e570ca9e181.camel@ndufresne.ca>
Subject: Re: [PATCH v2 2/2] media: mediatek: amend vpu_get_plat_device()
 documentation
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Johan Hovold <johan@kernel.org>, Minghsiu Tsai
 <minghsiu.tsai@mediatek.com>,  Houlong Wei <houlong.wei@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
	 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	 <angelogioacchino.delregno@collabora.com>, Tiffany Lin
	 <tiffany.lin@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, 
	linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Tue, 09 Dec 2025 15:43:30 -0500
In-Reply-To: <20251028100454.4086-3-johan@kernel.org>
References: <20251028100454.4086-1-johan@kernel.org>
	 <20251028100454.4086-3-johan@kernel.org>
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
	protocol="application/pgp-signature"; boundary="=-0QYF48HqKzMye6sfDXbi"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-0QYF48HqKzMye6sfDXbi
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mardi 28 octobre 2025 =C3=A0 11:04 +0100, Johan Hovold a =C3=A9crit=C2=
=A0:
> Add a comment to the vpu_get_plat_device() documentation to make it
> clear that the VPU platform device is returned with an incremented
> reference count (which needs to be dropped after use).
>=20
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---
> =C2=A0drivers/media/platform/mediatek/vpu/mtk_vpu.h | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/mediatek/vpu/mtk_vpu.h b/drivers/medi=
a/platform/mediatek/vpu/mtk_vpu.h
> index da05f3e74081..5808311d2b15 100644
> --- a/drivers/media/platform/mediatek/vpu/mtk_vpu.h
> +++ b/drivers/media/platform/mediatek/vpu/mtk_vpu.h
> @@ -120,7 +120,7 @@ int vpu_ipi_send(struct platform_device *pdev,
> =C2=A0 *		device for using VPU API.
> =C2=A0 *
> =C2=A0 * Return: Return NULL if it is failed.
> - * otherwise it is VPU's platform device
> + * otherwise it is VPU's platform device with incremented reference coun=
t

I picked this patch but rewrote with what felt like better and dense.

- * Return: Return NULL if it is failed.
- * otherwise it is VPU's platform device
+ * Return: a reference to the VPU's platform device, or NULL on failure.

hope its ok with you,

cheers,
Nicolas

> =C2=A0 **/
> =C2=A0struct platform_device *vpu_get_plat_device(struct platform_device =
*pdev);
> =C2=A0

--=-0QYF48HqKzMye6sfDXbi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaTiJ8gAKCRDZQZRRKWBy
9FX9AQC0h7x2rUbHRnE6hDsHx9XZJHXL4R1c0FJ/hKVfBhBq2QEAmXZqS+V45vbE
9v8cAJQrroNT5li42FVpIGMWy7P+Cw8=
=7pPC
-----END PGP SIGNATURE-----

--=-0QYF48HqKzMye6sfDXbi--

