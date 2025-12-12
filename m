Return-Path: <linux-media+bounces-48711-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CA332CB8ECB
	for <lists+linux-media@lfdr.de>; Fri, 12 Dec 2025 14:51:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2495B30131C6
	for <lists+linux-media@lfdr.de>; Fri, 12 Dec 2025 13:51:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB2BA26A08A;
	Fri, 12 Dec 2025 13:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="fWp5+4Qk"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FAEF1D6188
	for <linux-media@vger.kernel.org>; Fri, 12 Dec 2025 13:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765547500; cv=none; b=XZbr9vmAyxWQrNbSh7KZY5zswD8SAWPhTl1byDYv2rV1fUVChwVpfRwsUozOoHZ0n5wzMqFbzqjnjqQU9R3iGU1/1vBBb0QHHfaWeYa2ytbF98QCKXqLLLCxDLNOVmDBkdzB9dDd6Mdr6CwWQDW5b7CuuX0EHahQtVolQRl4DW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765547500; c=relaxed/simple;
	bh=pyeG1aaBmjIsbSJSGnDiC/7VWBoOGFG2ysO80tTCQDY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FQ/EsoigJQ6qR0uLYmLloK7UD0LPScg/n6SmISvUT6sAYAnj222vEfrflGnICmhajFAM0GGcY6b9TzaeLvT/OuHYuV4YBV82iemdGBZdwyObUz1jYsG9TclVmVrIfzGwbqSSxW4SEIsRr5Wnn+ucop6MTrf9vb077l+e+X9T60k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=fWp5+4Qk; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4ee2293e6a2so10104621cf.0
        for <linux-media@vger.kernel.org>; Fri, 12 Dec 2025 05:51:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1765547497; x=1766152297; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pyeG1aaBmjIsbSJSGnDiC/7VWBoOGFG2ysO80tTCQDY=;
        b=fWp5+4QkS7R8xnyaU/h5tm1Mmqa0/NM/sMVIqCc1iH4rovSxa8766U3UyNdqeRdIob
         vXOEBXOLAJfaRBJh/ymUuOJgZSi0KBqo8EBfsLCXpt38Pc/9DoCB/Jph2dj0TfASdz0j
         Odic4G/0gS5PcHR2IjW8CCrWLUaewdlpEYwjo1Q0m31jWfgx5txSoOCbnlRiPHPjSuEJ
         6V2U8+UC3wVB2MCda06DWK6G1VdL1//acJ4aYw1bvkYkZUG6JQ437qTO1BJZcFw7Doyb
         T6uiom7s17Mcw+UEIQQVIr28aEuR3UfszHOwuk5Kgog+jVDEyPlfKnsWGtNcpl3b7a2l
         ZiUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765547497; x=1766152297;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pyeG1aaBmjIsbSJSGnDiC/7VWBoOGFG2ysO80tTCQDY=;
        b=noypPcZRNeUVe8u3N9swreIm8QJfo/m+uSXQSIX08NuNw/AfM4S1EG33Pz15JKnto1
         A1/18VI02FWT8chRKwnCkYttuuLmIE8QHWzj+iuKb0YRfX6rZMI+ZdkJJVa+G4xurNir
         iJZp4OLSjyfylhYDrWh6zrrReW/c2O1VcL9P5VbGiqkQ4SFwlpm2MxqHskhgAvswSmbY
         9JDKsWMBBdVip+gnnfdmUbDIY7mSP6/7sNAXBtLnkqvpDeLBpsa5w3R/iNL9VGq0HBVC
         jx8zKrNbzzAF50ewcoD0ruhADModAnhgibNFLz3xVxRhkxfdWNZSlF8dkLlg0IkN2RXr
         Wvwg==
X-Gm-Message-State: AOJu0Yy5lq7bbb7y6Le6uQEKAsHqMZqgoc5gPC923bvy35o+SqjyqwPN
	mqT7j7IKXYZFOw56GdHG/j/+26ctmH7TIkBnzh5VAqSkKfZqe8thMhFOlE6a1yvD04A=
X-Gm-Gg: AY/fxX6VXMn+N+aM98RjhLgP9/G2z1YL95ifRxVjHHRu7JKR8EBoiBhSbHaBipoqVXS
	Kf+z9uFsA8KZRWUaUEmZpYhWlf29GsbGBDJUnKNlBhbGp6KXwU44CAxGvrXdXHj8mKY4YE1A3Of
	i9VIeToxOQrt2/Dl8eQXvHBaJlK49hhgngr7YDgdGjUJR2Ait+turcYf209a1ydetNnnHRK1byC
	iNVpBa+bOjTJ37tczEVflsIQwOL3iUhIHb4mA95dIYxH3O3MaSJDgWpi4aO7PAESzflDURXJMZJ
	TFGUEg4d1W8UlWnDR4ZNYNfcwq4CsfxW2o3zyQcQOcDI4Nnno0mPeIXpD7QpfO8P7OwCl14ZFVu
	w9mVblgl8x0x+qn4Zvm7TcWoV3FwlD2ekWL6Py3tWW2NE78UgPCr/VtdXxkYtrQaph1cw+DsKtO
	6N0bpxqlyG6feuQ4gf7R9/snzNCdY=
X-Google-Smtp-Source: AGHT+IHOkKb+3eSuMU1jIt6RCvyh1vdcJM+w+u1orn//OYXAV7AakHlaboTbBmbDNMSQrgTNuXT/UA==
X-Received: by 2002:a05:622a:1cc8:b0:4ed:1948:a8a2 with SMTP id d75a77b69052e-4f1d05d37e6mr21517091cf.40.1765547497476;
        Fri, 12 Dec 2025 05:51:37 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::5ac? ([2606:6d00:17:7b4b::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8bab566610esm462733885a.16.2025.12.12.05.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 05:51:36 -0800 (PST)
Message-ID: <f9c113914290a0701614c64b5e2167d4b3e21646.camel@ndufresne.ca>
Subject: Re: [PATCH RFC v2 2/3] decoder: Add V4L2 stateless H.264 decoder
 driver
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Zhentao Guo <zhentao.guo@amlogic.com>, Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski	
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Neil Armstrong	
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet	 <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org
Date: Fri, 12 Dec 2025 08:51:34 -0500
In-Reply-To: <12f26bf8-409b-4206-a39b-4bb2a14edec0@amlogic.com>
References: <20251124-b4-s4-vdec-upstream-v2-0-bdbbce3f11a6@amlogic.com>
	 <20251124-b4-s4-vdec-upstream-v2-2-bdbbce3f11a6@amlogic.com>
	 <9b74086ac938475328904960add2c284b81efd4a.camel@ndufresne.ca>
	 <12f26bf8-409b-4206-a39b-4bb2a14edec0@amlogic.com>
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
	protocol="application/pgp-signature"; boundary="=-Wz8tqIBY8tBmEXzhqord"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-Wz8tqIBY8tBmEXzhqord
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le vendredi 12 d=C3=A9cembre 2025 =C3=A0 12:11 +0800, Zhentao Guo a =C3=A9c=
rit=C2=A0:
> > strcpy() would be the preferred helper for this, no need to fill the le=
ading
> > zero liek this, see include/linux/string.h
> Ok, it should be more suitable to use strcpy.

I have to correct myself, I meant to suggest strscpy(dst, src, size). Passi=
ng
the size for safety seems important, and unlike strncpy() it takes care of =
the
leading zero.

Nicolas

--=-Wz8tqIBY8tBmEXzhqord
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaTwd5gAKCRDZQZRRKWBy
9AjFAPwLCuzLrPMc5QeJwBH4HFnPXprZ9Z2Mkw/AdgWhkq6+PgD/XLQZRcEeKq08
r5vbLdvYkFjoVtCPaaat+b1CAdj1bAQ=
=ixRz
-----END PGP SIGNATURE-----

--=-Wz8tqIBY8tBmEXzhqord--

