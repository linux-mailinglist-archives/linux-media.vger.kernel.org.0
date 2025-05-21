Return-Path: <linux-media+bounces-33063-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E273ABFE72
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 22:50:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 147469E6DD3
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 20:50:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A810F2BD001;
	Wed, 21 May 2025 20:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=apitzsch.eu header.i=@apitzsch.eu header.b="EzuXmvb+"
X-Original-To: linux-media@vger.kernel.org
Received: from www637.your-server.de (www637.your-server.de [168.119.26.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA07621E082;
	Wed, 21 May 2025 20:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.26.117
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747860445; cv=none; b=mbFbp9uZCJ5W5Uv/tqEQB78wLgD4nubt4+TOwRvWUxmI7VoGwQpm7Nqe4zr8KiU9dUF8J1yXbeuLKbaoDgYZ0WQDAey7741gA9auayEqz6wSqE0+sbMX1ok4Wq+qfiRrnAACjJfk0khNIrriLrO5OkZZYsB8KzSpEe1MY2QmkOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747860445; c=relaxed/simple;
	bh=R5UrvnJSbJbZMQwpQnUujUXpVO4b+CbB3tii1mKba+Q=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KN3YbrzLLIf9CZIRTo2VmEBx0JBqiOdEDptyBkI+/PNis0FbEkUSlgwn1sEykc71OO15rMK7+6ypzLu2sS+QviJG3mEUj6BFetd+86Uz9YwUxfRsDT1QOHSAfKhF0C5iGHnIIPamYSG+GAJ7T1HCgyQ+sQ8Ae/kuO4ISA6+oh9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=apitzsch.eu; spf=pass smtp.mailfrom=apitzsch.eu; dkim=pass (2048-bit key) header.d=apitzsch.eu header.i=@apitzsch.eu header.b=EzuXmvb+; arc=none smtp.client-ip=168.119.26.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=apitzsch.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=apitzsch.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=apitzsch.eu
	; s=default2410; h=MIME-Version:Content-Transfer-Encoding:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=R5UrvnJSbJbZMQwpQnUujUXpVO4b+CbB3tii1mKba+Q=; b=EzuXmvb+oCLBNU2dzGpKU3FikY
	bUgCN1gXpYtI2o5euipuEqyAdvJ1RTzF4K8HB6eXZKMpTm9ZF+ul69S9xYxFmm3bQW6wxZGp7COQi
	aTVC2dlGRZ0qHmBjMXC5rtiLmF22MtK4Xpeuk7XRG6aFf7Ul1rdC2e5oyyO9yt6RCaYRK/uoCQKJb
	CCYy9V/Z0nxjoRADi7zKTixzy+JvzYZxGVhTWRM1D2kSyfDkCv6pOYXElN/KPVOh8WMQmPV0Tajtt
	q9BHHmFHKNX44hxIFLVbE0GANkoD7uQF7aLrQxR3n+WsD1XcLOgnJYP3TeIlS7yDYSrCl+ec64lRG
	hML1XtJA==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www637.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <git@apitzsch.eu>)
	id 1uHqLG-0004fB-26;
	Wed, 21 May 2025 22:47:10 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <git@apitzsch.eu>)
	id 1uHqLG-0000Jl-0v;
	Wed, 21 May 2025 22:47:10 +0200
Message-ID: <3eb4769eac757428d6ff2bd82f16834c46344ac6.camel@apitzsch.eu>
Subject: Re: [PATCH v3 1/2] dt-bindings: media: i2c: Add DW9719 and DW9761
 VCM
From: =?ISO-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Daniel Scally <djrscally@gmail.com>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Wed, 21 May 2025 22:47:08 +0200
In-Reply-To: <Z6nMl7vXPkICysSJ@kekkonen.localdomain>
References: <20250209-dw9761dts-v3-0-14d3f00f0585@apitzsch.eu>
	 <20250209-dw9761dts-v3-1-14d3f00f0585@apitzsch.eu>
	 <Z6nMl7vXPkICysSJ@kekkonen.localdomain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Authenticated-Sender: andre@apitzsch.eu
X-Virus-Scanned: Clear (ClamAV 1.0.7/27644/Wed May 21 10:56:21 2025)

Hi Sakari,

Am Montag, dem 10.02.2025 um 09:53 +0000 schrieb Sakari Ailus:
> Hi Andr=C3=A9,
>=20
> Thanks for the update.
>=20
> On Sun, Feb 09, 2025 at 10:51:57PM +0100, Andr=C3=A9 Apitzsch via B4 Rela=
y
> wrote:
> > From: Andr=C3=A9 Apitzsch <git@apitzsch.eu>
> >=20
> > Document Dongwoon DW9719 and DW9761 VCM devicetree bindings.
> >=20
> > Signed-off-by: Andr=C3=A9 Apitzsch <git@apitzsch.eu>
> > ---
> > =C2=A0.../bindings/media/i2c/dongwoon,dw9719.yaml=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 45
> > ++++++++++++++++++++++
> > =C2=A01 file changed, 45 insertions(+)
> >=20
> > diff --git
> > a/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9719.yaml
> > b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9719.yaml
> > new file mode 100644
> > index
> > 0000000000000000000000000000000000000000..b38d22bf09713a7999e1f9ce6
> > 553de7587dbe5d2
> > --- /dev/null
> > +++
> > b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9719.yaml
> > @@ -0,0 +1,45 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/i2c/dongwoon,dw9719.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Dongwoon Anatech DW9719 Voice Coil Motor (VCM) Controller
> > +
> > +maintainers:
> > +=C2=A0 - devicetree@vger.kernel.org
> > +
> > +description:
> > +=C2=A0 The Dongwoon DW9719 is a 10-bit digital-to-analog (DAC)
> > converter. The DAC
> > +=C2=A0 is controlled via a 2-wire (I2C-compatible) serial interface.
> > +
> > +properties:
> > +=C2=A0 compatible:
> > +=C2=A0=C2=A0=C2=A0 enum:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - dongwoon,dw9719
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - dongwoon,dw9761
> > +
> > +=C2=A0 reg:
> > +=C2=A0=C2=A0=C2=A0 maxItems: 1
> > +
> > +=C2=A0 vdd-supply:
> > +=C2=A0=C2=A0=C2=A0 description: Regulator providing power to the "VDD"=
 pin.
>=20
> The driver uses dongwoon,sac-mode and dongwoon,vcm-freq properties.
> Could you document them as well, please, including the defaults? Are
> the values the same for both chips?
>=20
It is difficult to say, because I couldn't find the datasheet for any
of the chips. Maybe someone could provide them.

Best regards,
Andr=C3=A9

> > +
> > +required:
> > +=C2=A0 - compatible
> > +=C2=A0 - reg
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +=C2=A0 - |
> > +=C2=A0=C2=A0=C2=A0 i2c {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #address-cells =3D <1>;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #size-cells =3D <0>;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 camera-lens@c {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 com=
patible =3D "dongwoon,dw9761";
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg=
 =3D <0x0c>;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vdd=
-supply =3D <&pm8916_l10>;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
> > +=C2=A0=C2=A0=C2=A0 };
> >=20

