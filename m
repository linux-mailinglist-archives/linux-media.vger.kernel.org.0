Return-Path: <linux-media+bounces-33201-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8E7AC1482
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 21:15:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 802AA1C00533
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 19:15:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD65329B8F6;
	Thu, 22 May 2025 19:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="2lEjZDcL"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E03E288C1B
	for <linux-media@vger.kernel.org>; Thu, 22 May 2025 19:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747940765; cv=none; b=czZnejxukT+K9aRP2qOTp/5iVyce2Rxx5A5cZXMCeeqSU6SAQEQzo4Ei2WDGgxGew0W7vB5MkUYBfaas6yhlOP8xRS7OqWYSaAhCDZ0DwgVywS0z0Mr1hPy1a9L2xj5+xXVFNZBPr1jhe8X6Wy3Cm8sThr7HwgYwj3t+VGZAoMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747940765; c=relaxed/simple;
	bh=fFa+XHgjPqFLyF5EjVk/o8grCR8OeDIEJejOPFDEFq4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LYIe0TMz1tWXJNcu3Wv9hFpYa3Gz0RQBQgjBs+oAmjXBAs9z6vEyiVQLipgEObdrnVwUA5oWArhx3NT3vVUd0rxCm/7aCe73MD7V6VaZtSIAr8xmd02Y72DgJK1i1K2qaOOZUAOqOfg1QLRCU5x3mHbe3+Np1Jz0NDtTPaCTB88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=2lEjZDcL; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6f8a70fe146so130997666d6.0
        for <linux-media@vger.kernel.org>; Thu, 22 May 2025 12:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1747940762; x=1748545562; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uAfLd2+eW+OIWxtnxvjxahlHfrrw/biV9Jvjs+l5fkc=;
        b=2lEjZDcLkiLKhRiFUnSvh3+Dl98+uNd/w2q6wNNLa7iO9w6TeTe9ogaM3jt9voEjVB
         JDZxApy/mj/nQEJ+BH7v6ELSD1XMi1rGcLgqP9KlF0O0tCwZ7/f39N+QwBHLoIc4FczP
         AyGEx71RoL5u4f0oQoDPM8CffylA/d8Df6KyssmNtQAXty1THMX1N73UXWJu8Nt2uA6W
         0sTOmO/BEeDZXz8VXp3r3sFDetqsU3cuO8RbFQuRWAwoCkOHaeg7hI/+UJJHUmgD9c6P
         cEnGWcmVuoF0RGLOuO1+vKMxLRMkcg2bpQ87c9rFC3yV/COEe4idjoZhly7jZB0s4xuf
         otqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747940762; x=1748545562;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uAfLd2+eW+OIWxtnxvjxahlHfrrw/biV9Jvjs+l5fkc=;
        b=fkVuaWQRjBEW7/7DlgRSSHBruoiL2qitOma4PnmGrTLFeO0TlsTvHBckhFYQYDY14T
         7/dDghsRu/aibYfRCJGkHUxP+MTcNZWKdW/YU4DBTDRdRU1plSK5YVMHNZbh5i5xmM/R
         hUVkb5EFby7NWYpa5UqoXtTldGWt7RbD801EH25/uA1AGez8bM/yScXWk4rTBzUKDcWV
         Y2NeYtow2jqTAz/I7tqb9CziG1g4ZG8ugIFjYtG7OEMnaMRZtskv3QR8HQ/wBadolwn2
         aJ2HYy+EYTdkT7JGIpa2R2Lbi6/YSkGsCT9h9DsN3IRT8Duwwa70Rv/X3L0i8jMoN3Ep
         8JYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdR5NF8cxQ62oD7WxWsgNf13DXUb6xJeE07cLVpZfbVRhQa76wi9S2DBinytLU9WlQ6EFY56UW75VmIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwpdxFe7+UTurtTOCDZvKOAzMpB4qB5jM5W8VTPJPrLz4S2SRaU
	1EOuw2T7q6OwT2s6+2sApuVusrXjnT001qKqcVwAJotVSyAaxudmPAyC5FfkcSatXgU=
X-Gm-Gg: ASbGnctroYop4cu2NO+4dR1Lsqnzz3Tlft6qtTeAMGgNtCc3BGgjjoXe0TFahcY485+
	jAaXHhuhjeGGyTI+rWz9V9W0zkvl49/FXsKR4AKFpnXn+CdsggttssqCESrl2edgxcKlTyi6Oui
	8nz6eryRo6vFgt/kMkKwIgpP8YOSHMGzz4o3aZA6klNE8oURTeTjedszuxu8osb2lW043Cv2qxa
	J+o/sCpzv50APUap515rln+p96l2C/7SwFuISaRX6cInpfacdc5O6dYWm60JIFFEt2nla8GBTso
	HSxxyHSc0KDPgm9CjULi5FFOV9OluV+0xUGpkl+Si/Ll7kwWcNtU6Bxv
X-Google-Smtp-Source: AGHT+IFMHoWCgYSKrp77j14dN4ezA6lfoJ+4Q+N0FgBs+1y4jyW6o9IHP3m48s9bZ43HqbDB/3wpZw==
X-Received: by 2002:a05:6214:402:b0:6f2:c7b0:3b16 with SMTP id 6a1803df08f44-6f8b2c32addmr375505626d6.6.1747940762274;
        Thu, 22 May 2025 12:06:02 -0700 (PDT)
Received: from ?IPv6:2606:6d00:17:b2fc::5ac? ([2606:6d00:17:b2fc::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f8b096dda9sm102909986d6.71.2025.05.22.12.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 12:06:01 -0700 (PDT)
Message-ID: <8b18533170e7ba395c574de69768dcc27f718767.camel@ndufresne.ca>
Subject: Re: [PATCH 1/1] dt-bindings: media: convert fsl-vdoa.txt to yaml
 format
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Frank Li <Frank.li@nxp.com>, "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Shawn Guo	 <shawnguo@kernel.org>, Fabio Estevam
 <festevam@gmail.com>, Krzysztof Kozlowski	 <krzk+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, 
	devicetree@vger.kernel.org
Date: Thu, 22 May 2025 15:06:01 -0400
In-Reply-To: <b97c254c5169acb32b9f65f71b363a3eb1cfc8a2.camel@ndufresne.ca>
References: <20250411213601.3273670-1-Frank.Li@nxp.com>
		 <174448105342.1415739.9619142538994119426.robh@kernel.org>
		 <aC9xv08a5k5Pz1t+@lizhi-Precision-Tower-5810>
	 <b97c254c5169acb32b9f65f71b363a3eb1cfc8a2.camel@ndufresne.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 (3.56.1-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi again,

Le jeudi 22 mai 2025 =C3=A0 14:57 -0400, Nicolas Dufresne a =C3=A9crit=C2=
=A0:
> Hi Frank,
>=20
> Le jeudi 22 mai 2025 =C3=A0 14:49 -0400, Frank Li a =C3=A9crit=C2=A0:
> > On Sat, Apr 12, 2025 at 01:04:14PM -0500, Rob Herring (Arm) wrote:
> > >=20
> > > On Fri, 11 Apr 2025 17:36:00 -0400, Frank Li wrote:
> > > > Convert fsl-vdoa.txt to yaml format.
> > > >=20
> > > > Additional changes:
> > > > - Add irq.h and imx6qdl-clock.h in example.
> > > >=20
> > > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > > ---
> > > > =C2=A0.../bindings/media/fsl,imx6q-vdoa.yaml=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 42 +++++++++++++++++++
> > > > =C2=A0.../devicetree/bindings/media/fsl-vdoa.txt=C2=A0=C2=A0=C2=A0 =
| 21 ----------
> > > > =C2=A02 files changed, 42 insertions(+), 21 deletions(-)
> > > > =C2=A0create mode 100644 Documentation/devicetree/bindings/media/fs=
l,imx6q-vdoa.yaml
> > > > =C2=A0delete mode 100644 Documentation/devicetree/bindings/media/fs=
l-vdoa.txt
> > > >=20
> > >=20
> > > Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> >=20
> > All:
> > 	Anyone pick this patch?
>=20
> Thanks for the highlight, this is stuff from before my time and I had not=
 associated it
> with CODA initially. I've picked it now.

Actually, before I do so, any of the following warnings should be addressed=
 ? I effectively don't
see a clear entry for that bindings, but could have miss-read and there is =
a second warning,
which based on having Rb is likely false positive ?

---
[[ATTACHMENT|junit/./0001-dt-bindings-media-convert-fsl-vdoa.txt-to-yaml-fo=
rma.patch checkpatch.err.txt]]
WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
#21:=20
new file mode 100644

WARNING: DT binding docs and includes should be a separate patch. See: Docu=
mentation/devicetree/bindings/submitting-
patches.rst

total: 0 errors, 2 warnings, 0 checks, 42 lines checked
---

Nicolas

>=20
> regards,
> Nicolas
>=20
> >=20
> > Frank
> > >=20

