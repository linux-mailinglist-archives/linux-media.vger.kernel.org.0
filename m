Return-Path: <linux-media+bounces-16034-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0603B94CAC8
	for <lists+linux-media@lfdr.de>; Fri,  9 Aug 2024 08:48:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B54C1C21CB4
	for <lists+linux-media@lfdr.de>; Fri,  9 Aug 2024 06:48:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3194816D4C4;
	Fri,  9 Aug 2024 06:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IdUfph/w"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D98251B964;
	Fri,  9 Aug 2024 06:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723186113; cv=none; b=GqLFmzYo7CcE1G1TsIPo9BDGzsXOLEenykh7n1V4J/a5EiujmFAGCR89ntmYBCHIQaPXhZrUkS23yUX6lgMC0I1XXq3sZoM27WLFaKCLU56purtOL9X8/pAGn6QQ0vAja5OMPpWbv0lYK7vvezzUJWxLIp3Trdk5oocCvANseUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723186113; c=relaxed/simple;
	bh=oS2XMmjoa+VE/v+mAQNByyB+Ulxv9ZDsqIDdlNb8qhc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cqjeguSGvUYVKLB6E76v86PGCKb+NyubqH3K8enOd6t9KmYT03RpjOLgsusbyOYgn7Fj6Tfo2ISy3CDUWDolgO0FU53I2sG9qiD+FscvyQSNmqlADlMqYud6xhHoAFzBiUpGnJh6xOAZcZCIJ7eu4sMHuL/VRSX/b1ox6gnPsho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IdUfph/w; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-52f01afa11cso2085349e87.0;
        Thu, 08 Aug 2024 23:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723186110; x=1723790910; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=awMllGHlNTMUHiAzNhHBD3WsHP+5NhEuahbeF4CxRz0=;
        b=IdUfph/wIa/0CCO3YOqM9uGtUA7Q4Hu1NlrYggd0lsDfK3O1cTbhGqtcW32wO6q8Bs
         3v4K3Hu1xuXX2RZshQcMukP3RFC6+0xMjP+rM4QUZasA1JMPjNh+N/BmyJuwZn2hwnr2
         Mgl1ErTQTjTegqP93ylye/Ig1kP+RNfd4zJPE/sbiFNDpVMoamvzCSoVubG4/5Da2fXS
         smpdjP6YVIRViGaNl8IeMT1DaObLTZQ/ALuUp7u+i+uG8PgF9//IAn6s11jUtbV0Z1b4
         TyYLRWFvAsDwySYnDG56ssZIIpLa59EGyK6RP3JlWMDbnTB8i6OzEcQ+XhwDpqXxXLbS
         oDdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723186110; x=1723790910;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=awMllGHlNTMUHiAzNhHBD3WsHP+5NhEuahbeF4CxRz0=;
        b=YoRY6Jp6SG7Zn6L++Nepp6RZI3MKWdK8t1qH2KrneOnVY4qIPBUrFqOnfl4fu6PKNQ
         ufmxGouEhk5eH3nvoubVZe975wYQKewge5/Ry4OS7ySGpxOFuMgbuopTUb7R4GU8qpqe
         BMp/j47QqRg2SlQqO1QzGlqrSUyNQzhZAyJUzo/jsSIyooQGiq2VEnejR4+igiefVcn/
         Udr6/kdOaEErpoM695iwX+wTBVRDE7AB4CJzRiZx2JeahnY3KqZ+7bWMrSnEYHYtfSCy
         8VnY/+it4xVR9K+NbypMiONKM6qS4YmO0lefEQGbJ5ASc0NIW2VWbNJLDng+rRJ9c6wz
         uXjw==
X-Forwarded-Encrypted: i=1; AJvYcCWwOKMN46Bipx77BbzOtHXq0CrfltYmkMutyk7qit1xbfjZYsjxvOPOP00oS+wi0YEjzZBPBWcsFeweWtW+@vger.kernel.org, AJvYcCXXYlv2VH8boxM+XxsOUltKMbiJb2GnHt1dak7zXQMsFz9QWOZKH6+aGU+IYYvIJ1IXGA6uoxdfqrtK@vger.kernel.org, AJvYcCXoGVOcM7V/yNXEl3uor5oVWlr3GfQeFiPFoZGHA4gG3CrdiQaACJQEF6eQ26cqsOTy+eZvDcwTSsbi/L8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3a2aiZTv2eC2Hx/WVFlJLPhxepBi9Cdoc6NFf7oFnUAKhzgqK
	JTetXTEY4G1gemtmEfqmlSqxItMV38Hh2Na1Nm2aG/5nBn6quTckG8VF0zZLFP0UDK+PcbW6VfA
	zxf4QQrFb7Y+EEGdu/EwlZ/0+p84=
X-Google-Smtp-Source: AGHT+IGQ8eJlZAkFtH4sp8+WWj+e/9OZ+apcotabpI+LPBGrb62fWRUl6dC49ZcDGOav+iLDtIT4xNIGPjMag4piiGY=
X-Received: by 2002:a05:6512:6c4:b0:530:b76c:65df with SMTP id
 2adb3069b0e04-530ee99ce52mr332804e87.35.1723186109447; Thu, 08 Aug 2024
 23:48:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240808-loongson1-nand-v8-0-c96dea418b41@gmail.com>
 <20240808-loongson1-nand-v8-1-c96dea418b41@gmail.com> <20240808-backyard-unglue-3cf429ad8da5@spud>
In-Reply-To: <20240808-backyard-unglue-3cf429ad8da5@spud>
From: Keguang Zhang <keguang.zhang@gmail.com>
Date: Fri, 9 Aug 2024 14:47:53 +0800
Message-ID: <CAJhJPsVOTAj9ePzeHkwDX049FKd=9Rs_NjQE2qwQL76GKSC66Q@mail.gmail.com>
Subject: Re: [PATCH v8 1/2] dt-bindings: mtd: Add Loongson-1 NAND Controller
To: Conor Dooley <conor@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 8, 2024 at 11:37=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Thu, Aug 08, 2024 at 07:22:19PM +0800, Keguang Zhang via B4 Relay wrot=
e:
> > From: Keguang Zhang <keguang.zhang@gmail.com>
> >
> > Add devicetree binding document for Loongson-1 NAND Controller.
> >
> > Signed-off-by: Keguang Zhang <keguang.zhang@gmail.com>
> > ---
> > Changes in v8:
> > - Add a description part.
> > - Adjust the compatible because the match data for ls1c-nfc differs fro=
m ls1b-nfc.
> > - Mark 'nand-use-soft-ecc-engine' and 'nand-ecc-algo' as mandatory.
> > - Delete the superfluous blank lines.
> >
> > Changes in v7:
> > - rename the file to loongson,ls1b-nfc.yaml
> >
> > Changes in v6:
> > - A newly added patch
> > ---
> >  .../devicetree/bindings/mtd/loongson,ls1b-nfc.yaml | 75 ++++++++++++++=
++++++++
> >  1 file changed, 75 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/mtd/loongson,ls1b-nfc.ya=
ml b/Documentation/devicetree/bindings/mtd/loongson,ls1b-nfc.yaml
> > new file mode 100644
> > index 000000000000..7ce335324a29
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mtd/loongson,ls1b-nfc.yaml
>
> When I first read "nfc" here I thought it was a copy-paste mistake, as
> "nfc" is a technology of it's own. I think it would make sense to rename
> to "loongson,ls1b-nand-controller" etc to remove that sort of confusion.
> These devices might not implement NFC, but what's to say that a future
> device will not?
>
Sorry for the confusion.
The string "loongson,ls1b-nand-controller" might be too long.
May I rename it to "loongson,ls1b-nand"?

> Cheers,
> Conor.
>
> > @@ -0,0 +1,75 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/mtd/loongson,ls1b-nfc.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Loongson-1 NAND Controller
> > +
> > +maintainers:
> > +  - Keguang Zhang <keguang.zhang@gmail.com>
> > +
> > +description: |
>
> This | is not needed.
>
Will remove |.
Thanks!

> > +  The Loongson-1 NAND controller abstracts all supported operations,
> > +  meaning it does not support low-level access to raw NAND flash chips=
.
> > +  Moreover, the controller is paired with the DMA engine to perform
> > +  READ and PROGRAM functions.
> > +
> > +allOf:
> > +  - $ref: nand-controller.yaml
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - enum:
> > +          - loongson,ls1b-nfc
> > +          - loongson,ls1c-nfc
> > +      - items:
> > +          - enum:
> > +              - loongson,ls1a-nfc
> > +          - const: loongson,ls1b-nfc
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  dmas:
> > +    maxItems: 1
> > +
> > +  dma-names:
> > +    const: rxtx
> > +
> > +patternProperties:
> > +  "^nand@[0-3]$":
> > +    type: object
> > +    $ref: raw-nand-chip.yaml
> > +
> > +    required:
> > +      - nand-use-soft-ecc-engine
> > +      - nand-ecc-algo
> > +
> > +    unevaluatedProperties: false
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - dmas
> > +  - dma-names
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    nand-controller@1fe78000 {
> > +        compatible =3D "loongson,ls1b-nfc";
> > +        reg =3D <0x1fe78000 0x40>;
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +        dmas =3D <&dma 0>;
> > +        dma-names =3D "rxtx";
> > +
> > +        nand@0 {
> > +            reg =3D <0>;
> > +            nand-use-soft-ecc-engine;
> > +            nand-ecc-algo =3D "hamming";
> > +        };
> > +    };
> >
> > --
> > 2.43.0
> >
> >



--
Best regards,

Keguang Zhang

