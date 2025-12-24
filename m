Return-Path: <linux-media+bounces-49510-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E612CDD144
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 22:46:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 393D33018F42
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 21:46:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62EE9270EC3;
	Wed, 24 Dec 2025 21:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bz7UF/2b"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F1B819992C
	for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 21:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766612776; cv=none; b=oeCdroIRm+wQEV1T0ZdqSzpKXPlxXJgZul3PveHBe8BxV3B/8KQVYxcx934+6jgNiK/9ibuBahXDUzBA1WsAiVlyoYYo3h7YWjyXfv4Pb8KpNNPuxnTlilJAPwpSrH4Nf2DcGHQsSlopQiBqpZf6k+N+Q+6lg0Jy9ziQOCoob0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766612776; c=relaxed/simple;
	bh=6Ge/K+shMKL5tSmcSlAVJgWOfH5+fYNv+iVFzBP3Kqk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=upNTF9baaNRQkaQGXByqnpRVpy2+heiNLA0nf5Fw4JtB+9qVRsqcYCWF5epKyvlNTdXRjHuWZLU+XRoEWQO+I6eqEtRPPB9B+Q4M4jwucysPyYYdIvXKAs3RFVUN5fD77cXRs09chHq+GsiAu0q+9Zz6KMJByIlCuet1QoWluNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bz7UF/2b; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-93f542917eeso1618333241.2
        for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 13:46:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766612774; x=1767217574; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oNUEoncZiRgf3jQewMIbcXaVWf0xg5zWH0JdNJ2Mm60=;
        b=Bz7UF/2bUoBz8tOsT3k/YkfkEUvHAPg28QpmN1TVaBMhbYstuVWPeEfwIyNTGpS5F2
         lvwrHqAOytAMzTP7orX6v7UongKkhU4q2AlKUv87xjNhpahOTilpKke7MQUdNv0usJzj
         eAi1OkpdxKbu4dBMBYupmjzYOXR32oY1crYI9g0UujaiVo1WM19gYQSXzVveNe/r0WtI
         agsGxAvoEjJ801yoQZDG594F42qP43H11plM4CEEzIxQsbYwqiCoDJsbPlyS1p/MJXRs
         3aBIfendTlQS8ixwHNpdPdHyeQRHuGyTd1W7ufj5HKF9x179CYUsO7b3X0UHK76IYJ3M
         iokA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766612774; x=1767217574;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oNUEoncZiRgf3jQewMIbcXaVWf0xg5zWH0JdNJ2Mm60=;
        b=KJ8VCPe2Z1rPYtF228XHTTTcreT1tJBlJMpoBaEii62/SmMOaCAbAdQvqHu5bmiaP8
         Uq9tVc7je5HJjZSgZuBqTkMNhJhldDzcBGxxHmXbIzx923Ehl0O/oLHDtwZhCwxijqLT
         1kGiq16lsKikIATDUMJACTkYx3XCWvH5qayx5nC73W98Qw1Bfde9dC6DwWbMl7K/BNHX
         bkLvQ4ZER+17629/Mq1KqaMT8ySo5QqXirrwt4WS5Akpovx6fxYf1J9D/hV4wxfmRPyL
         4aSkafdBJFV+txknEoNehTrchujZWlbpAY2I4wGBoVd2IIp+UME9pJPvUSu7kUVEj054
         5q8A==
X-Forwarded-Encrypted: i=1; AJvYcCX0LiqzLTs1CtvGN6itzb1Tws1FQ4mO0490+xYFoKaSfwyZ3SSo0pxvR2iCnFjF/VEGrRJgL8nWny7ypg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzvTDuzTU7fm1etdcOc45f0kk+tP4peHWQiEm6IoUg+bu3ybsMZ
	ATBHL8l7tE9GVRnhWvVlNpRjqWJ5EgbijPJlk4DZxHIIDjLkEqWN+XsmBQseLWhCwVxE8TdICyS
	PffaeluzvvzzejK1hg1+I6MTvWOG/qDw=
X-Gm-Gg: AY/fxX5swkXtQCwLg9eqGdRjgz2ct3sF9FFyPTAqrTRpnAZjTf/YTArr6WJQ7lY2k9q
	PBLybqO6q6dLL5vCrc+t74o9YSEhUi0SrxkOL/d8VqC7zVnkHNkzk94DFhJAxtSpKMeYY/BUIRS
	RE9+QByihBI/eNlTQ355vgyoIXbn7Kg1Xe77siovwLYLbYhKJ2wqw5Rei2kPP4qbn1gyn/XvSQD
	O0NIWinIA6iD7lZpwhFHXaTIPDNnvkJ1u6bH/3b1z1iTc9IOfmJnXaRQRz1cYQpGQqPEszb
X-Google-Smtp-Source: AGHT+IH6CKgJIRM6QmVDLyHQhTTUcOhOCJa1I/zlddJ2l+Bk4MntXBMMFIceYK+UMkdgn0dAeuBpFI5uhObYlA3Pcwo=
X-Received: by 2002:a05:6122:3d03:b0:559:6723:628c with SMTP id
 71dfb90a1353d-5615bee5a59mr5453601e0c.16.1766612773846; Wed, 24 Dec 2025
 13:46:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1766123192.git.alex.t.tran@gmail.com> <3c5a55cc5873e8d16bd25c5968a0d8b36e180325.1766123192.git.alex.t.tran@gmail.com>
 <20251221-futuristic-masked-platypus-dfdac4@quoll>
In-Reply-To: <20251221-futuristic-masked-platypus-dfdac4@quoll>
From: Alex Tran <alex.t.tran@gmail.com>
Date: Wed, 24 Dec 2025 13:46:03 -0800
X-Gm-Features: AQt7F2oQd__b3wg-g2zCdJw9nlL88_M1AqU-boxtTV5R37L5bT3oCC596Q6IHf0
Message-ID: <CA+hkOd7zfi+=4tOr8NPUVWc1sdDgjtRSdEJv_YadMV2ZSh0x4w@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] media: dt-bindings: ti,omap3isp: Convert to DT schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, pavel@kernel.org, sakari.ailus@linux.intel.com, 
	mehdi.djait@linux.intel.com, laurent.pinchart@ideasonboard.com, 
	hverkuil+cisco@kernel.org, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 21, 2025 at 7:08=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Sat, Dec 20, 2025 at 02:03:25PM -0800, Alex Tran wrote:
>
>
> Thank you for your patch. There is something to discuss/improve.
>
>
> > +maintainers:
> > +  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > +  - Sakari Ailus <sakari.ailus@iki.fi>
> > +
> > +description:
> > +  The OMAP 3 ISP is an image signal processor present in OMAP 3 SoCs.
> > +
> > +properties:
> > +  compatible:
> > +    const: ti,omap3-isp
> > +
> > +  reg:
> > +    items:
> > +      - description: Core ISP registers up to the end of the SBL block
> > +      - description: CSI PHYs and receivers registers
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +    description: the ISP interrupt specifier
>
> Drop description, obvious.
>
> > +
> > +  iommus:
> > +    maxItems: 1
> > +    description: phandle and IOMMU specifier for the IOMMU that serves=
 the ISP
>
> Ditto
>
> > +
> > +  syscon:
> > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > +    items:
> > +      - items:
> > +          - description: phandle to System Control Module
> > +          - description: register offset to Complex I/O or CSI-PHY reg=
ister
> > +    description:
> > +      Phandle and register offset to the Complex I/O or CSI-PHY regist=
er
> > +
> > +  ti,phy-type:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    enum: [0, 1]
> > +    description:
> > +      0 - OMAP3ISP_PHY_TYPE_COMPLEX_IO (e.g. OMAP 3430)
> > +      1 - OMAP3ISP_PHY_TYPE_CSIPHY (e.g. OMAP 3630)
> > +
> > +  '#clock-cells':
> > +    const: 1
> > +    description:
> > +      The ISP provides two external clocks, cam_xclka and cam_xclkb,
> > +      at indices 0 and 1 respectively.
> > +
> > +  vdd-csiphy1-supply:
> > +    description: Voltage supply of the CSI-2 PHY 1
> > +
> > +  vdd-csiphy2-supply:
> > +    description: Voltage supply of the CSI-2 PHY 2
> > +
> > +  ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +
> > +    properties:
> > +      port@0:
> > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > +        unevaluatedProperties: false
> > +        description: Parallel (CCDC) interface
> > +
> > +        properties:
> > +          endpoint:
> > +            $ref: /schemas/media/video-interfaces.yaml#
> > +            unevaluatedProperties: false
> > +
> > +      port@1:
> > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > +        unevaluatedProperties: false
> > +        description: |
> > +          CSIPHY1 interface:
> > +            OMAP 3630: CSI2C / CCP2B
> > +            OMAP 3430: CSI1 (CSIb)
> > +
> > +        properties:
> > +          endpoint:
> > +            $ref: /schemas/media/video-interfaces.yaml#
> > +            unevaluatedProperties: false
> > +
> > +            properties:
> > +              lane-polarities:
> > +                description: |
> > +                  The lane polarity (required on CSI-2):
> > +                    0 - not inverted
> > +                    1 - inverted
>
> You do not need to describe standard properties. Are the values
> different than what video-interfaces define?
>
> Same everywhere else. Look at other bindings how these properties should
> be defined/written.
>
> > +                minItems: 2
> > +                maxItems: 3
> > +                items:
> > +                  enum: [0, 1]
> > +
> > +              data-lanes:
> > +                description: Data lanes (required on CSI-2)
> > +                minItems: 1
> > +                maxItems: 2
> > +                items:
> > +                  minimum: 1
> > +                  maximum: 3
> > +
> > +              clock-lanes:
> > +                description: The clock lane (required on CSI-2)
> > +                maxItems: 1
> > +                items:
> > +                  minimum: 1
> > +                  maximum: 3
> > +
> > +      port@2:
> > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > +        unevaluatedProperties: false
> > +        description: |
> > +          CSIPHY2 interface:
> > +            OMAP 3630: CSI2A / CCP2B
> > +            OMAP 3430: CSI2 (CSIa)
> > +
> > +        properties:
> > +          endpoint:
> > +            $ref: /schemas/media/video-interfaces.yaml#
> > +            unevaluatedProperties: false
> > +
> > +            properties:
> > +              lane-polarities:
> > +                description: |
> > +                  The lane polarity (required on CSI-2):
> > +                    0 - not inverted
> > +                    1 - inverted
> > +                minItems: 2
> > +                maxItems: 3
> > +                items:
> > +                  enum: [0, 1]
> > +
> > +              data-lanes:
> > +                description: Data lanes (required on CSI-2)
> > +                minItems: 1
> > +                maxItems: 2
> > +                items:
> > +                  minimum: 1
> > +                  maximum: 3
> > +
> > +              clock-lanes:
> > +                description: The clock lane (required on CSI-2)
> > +                maxItems: 1
> > +                items:
> > +                  minimum: 1
> > +                  maximum: 3
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - iommus
> > +  - syscon
> > +  - ti,phy-type
> > +  - '#clock-cells'
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/media/omap3-isp.h>
> > +
> > +    isp@480bc000 {
> > +        compatible =3D "ti,omap3-isp";
> > +        reg =3D <0x480bc000 0x12fc>,
> > +              <0x480bd800 0x0600>;
> > +        interrupts =3D <24>;
> > +        iommus =3D <&mmu_isp>;
> > +        syscon =3D <&scm_conf 0x2f0>;
> > +        ti,phy-type =3D <OMAP3ISP_PHY_TYPE_CSIPHY>;
> > +        #clock-cells =3D <1>;
> > +
> > +        ports {
> > +            #address-cells =3D <1>;
> > +            #size-cells =3D <0>;
>
> Make example complete, please.
>
>
> Best regards,
> Krzysztof
>

Thanks for the review. I'll address these in v2. Also the check patch
script seems to be giving false positive warnings about DT binding
docs and includes should be a separate patch. This patch series does
not touch any files under the include/dt-bindings directory at all.

--=20
Yours,
Alex Tran

