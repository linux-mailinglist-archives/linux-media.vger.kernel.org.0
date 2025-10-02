Return-Path: <linux-media+bounces-43524-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 181A0BB2867
	for <lists+linux-media@lfdr.de>; Thu, 02 Oct 2025 07:22:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AF0CE3C699A
	for <lists+linux-media@lfdr.de>; Thu,  2 Oct 2025 05:22:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0902C28505A;
	Thu,  2 Oct 2025 05:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WKGxZJVE"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9025264FB5
	for <linux-media@vger.kernel.org>; Thu,  2 Oct 2025 05:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759382563; cv=none; b=CLtfCBqjfEl0Xd4EDYQwOasHSHhfFXkC2XsP2GaMqgQiZkm8B21SbZ/e/nK1E4NgpkvuWbPCnKZOKG6XxybISnwhLKGR2OOpDnYFgcVSgpZbQs4QasJVvPe5vyvyNiO1AKq40ZjE9VMDmuIyTKy0bk4TbD5QfHQzNr2RLvKYx+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759382563; c=relaxed/simple;
	bh=+UEvtO4ohS3SCkCNVu2PUUuKQQlaqciarVlUS651gmA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rJnB95qRYz1r1hPHmZ6bRiCx9gGR/wjanc35J3AQtzRI/8C/3tp1t8oINgNlcCdSQ0V8QDlQZMoWDKH5d/ptKn6i9cTkNnCGcfeqW6QDGhAgg5D4My363IIgX2NaJZQf+hsKFQa+xg7h94IbtZVfmUakAKFc7vdF287qtoOsOdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WKGxZJVE; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-414f48bd785so328516f8f.1
        for <linux-media@vger.kernel.org>; Wed, 01 Oct 2025 22:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759382559; x=1759987359; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kIoTAVA9sjHnC7mbYGlDJX9XNa4jYRX+mhTFjapnGcE=;
        b=WKGxZJVE9bc9SdJlNJbo6f51KykHP+8ayxVAoueB945lem4+eUB16Iscu5i2SEmc69
         AetrqMXauSPz/IixB1UKxkh5VDFNZdYRXXZj+bzrw2MsWo18aD7PQcgREI+iYYDAr5vZ
         KPEFpPs2JQ3T1P8+86RYn7R/Rtp5/zFvq+LUCXtObyYhdzkjToAS0ulqjpnikjOPs1UO
         q2kMkeSiR7uPHwtLWPhjsH1DA6IXnzPVGoA9V8gRfHiIU5NxB1pBDeG6YBAKSYH0FNnC
         HSjNLCKDdp6GHMzheLmA6vvv2tmWWYCIq7kCTlZ9iL4ll3s63IPYAg77//QIVB8VWX2P
         JRyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759382559; x=1759987359;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kIoTAVA9sjHnC7mbYGlDJX9XNa4jYRX+mhTFjapnGcE=;
        b=R1A1GA2HVgo1N1sdQVeV7nvh0bIDSpa1BV19G+fYHSFKSi7XA/7EzEV37m+yP5D/WJ
         lLL+bm8PhHdwetPkR7gRLifwmkb3IS5DMW8/jHne6b8j4ZzZa+pmjlijVgzgiJaMBnM7
         SNmsz2bMapZIn2W1zwl1ojcKiodKthxSPhao0O/7HJJaTak6Wh3uzMov9m9mKaUgqZbb
         wTgYDrIEKEqKVxKAyXZQuDUstQ6qwkYGP8pLQVQSoinHptHCy6AJooN40L7ArCXmRjHV
         ha4fp0mEvIXgWqTjGTXAP8vGTWBub8lfS4AJ7vkPSL96zfl+ip/UIyakiH/Eg33Qjk2b
         iN8A==
X-Forwarded-Encrypted: i=1; AJvYcCVKWvi2kOQRXGrVQGR4zhlWNxmrrZL53L3my8t1wBe9T7f0LSlD/yCgt2FJQph8bSB6YG0jTyYX2YjZEQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd0adp1ho06U8A617wbYtrrZktbgmBJFNOKB+zqnn2urClHqQT
	3F5IbljrdcXMLuQf9M7mWPlYaFlNNfvO58zk3egGZ9qsqUb+uGUOMQmxCcSey9/qSkRgN79Sivv
	nSHaPqOWkfWo2UxFMaSZ0x/TrCTLcrUs=
X-Gm-Gg: ASbGnctRMyfT2obTH6NEUJM/7qSrCZywGbXcpzWxNbH+PFi9Nng2tHtPt5eBBF/HZjh
	oVSbaZbsU8lUsZuAdjjUgVDDGr73TMjwUddrVLXxfUDF9zCyONpGjw2Gp04/Td9waYuEzfO/YQQ
	RfasTio6LYPkppsHQp8w0H1xpyQ0Le1Y4kduwelN0gI1oLAf6AAHqs13u8TN9iLKOJH/MNBv4en
	Dc7hnvPs1J1IQ8pIDXutOo3XYjK2Kbx
X-Google-Smtp-Source: AGHT+IG0e+DFVcA7EGV4f6gb3cVHuiVS4JYjGsGK6v4oRblkAeW4rQLj6q0R0ldwH/G+/sN3B7OHJYVi23raS5THltw=
X-Received: by 2002:a5d:5f52:0:b0:3ff:d5c5:6b03 with SMTP id
 ffacd0b85a97d-4255781466fmr4232925f8f.35.1759382558942; Wed, 01 Oct 2025
 22:22:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250925152806.80386-1-clamor95@gmail.com> <20250925152806.80386-2-clamor95@gmail.com>
 <20251002015554.GA2880078-robh@kernel.org>
In-Reply-To: <20251002015554.GA2880078-robh@kernel.org>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 2 Oct 2025 08:22:27 +0300
X-Gm-Features: AS18NWCy4o_ayBLITcbOWaJzzbRVpQSybS31RCoaoa8CEb7E1WnQEhadEGX4bl0
Message-ID: <CAPVz0n150FGUvgmxM8tLyQanWjhsmi4j=DaSa-JW2JSjCM4=tw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: media: i2c: document Sony IMX111 CMOS sensor
To: Rob Herring <robh@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Hans Verkuil <hverkuil@xs4all.nl>, Hans de Goede <hansg@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Dongcheng Yan <dongcheng.yan@intel.com>, =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, Jingjing Xiong <jingjing.xiong@intel.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 2 =D0=B6=D0=BE=D0=B2=D1=82. 2025=E2=80=AF=D1=80. =D0=BE 04:55=
 Rob Herring <robh@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Thu, Sep 25, 2025 at 06:28:05PM +0300, Svyatoslav Ryhel wrote:
> > Add bindings for Sony IMX111 CMOS Digital Image Sensor found in LG
> > Optimus 4X (P880) and Optimus Vu (P895) smartphones.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  .../bindings/media/i2c/sony,imx111.yaml       | 112 ++++++++++++++++++
> >  1 file changed, 112 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,im=
x111.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx111.ya=
ml b/Documentation/devicetree/bindings/media/i2c/sony,imx111.yaml
> > new file mode 100644
> > index 000000000000..a70017588891
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx111.yaml
> > @@ -0,0 +1,112 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/i2c/sony,imx111.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Sony IMX111 8MP CMOS Digital Image Sensor
> > +
> > +maintainers:
> > +  - Svyatoslav Ryhel <clamor95@gmail.com>
> > +
> > +description:
> > +  IMX111 sensor is a Sony CMOS active pixel digital image sensor with =
an active
> > +  array size of 2464H x 3280V. It is programmable through I2C interfac=
e. Image
> > +  data is sent through MIPI CSI-2, through 1 or 2 lanes.
> > +
> > +allOf:
> > +  - $ref: /schemas/media/video-interface-devices.yaml#
> > +  - $ref: /schemas/nvmem/nvmem-consumer.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: sony,imx111
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    description: EXTCLK with possible frequency from 6 to 54 MHz
> > +    maxItems: 1
> > +
> > +  reset-gpios:
> > +    maxItems: 1
> > +
> > +  iovdd-supply:
> > +    description: Digital IO power supply (1.8V)
> > +
> > +  dvdd-supply:
> > +    description: Digital power supply (1.2V)
> > +
> > +  avdd-supply:
> > +    description: Analog power supply (2.7V)
> > +
> > +  port:
> > +    additionalProperties: false
> > +    $ref: /schemas/graph.yaml#/$defs/port-base
> > +
> > +    properties:
> > +      endpoint:
> > +        $ref: /schemas/media/video-interfaces.yaml#
> > +        unevaluatedProperties: false
> > +
> > +        properties:
> > +          data-lanes: true
> > +          bus-type: true
>
> I assume not *bus* types are supported, so this should constrain it to
> valid ones. If it is only 1 type, you shouldn't really need the type in
> DT.
>

Better, properties can be dropped and only required left with
data-lanes and link-frequencies. Thank you for a hint

> Rob
>

