Return-Path: <linux-media+bounces-37523-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A4BB02110
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 18:02:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3F9441CC0B22
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 16:03:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6B032EE98A;
	Fri, 11 Jul 2025 16:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b="HUp5x5Tb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3BCE1A08DB
	for <linux-media@vger.kernel.org>; Fri, 11 Jul 2025 16:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752249767; cv=none; b=bFczBpZnZ6nkGzWT+tgAHWzbl4yivlRyglSCb9qH+M9sZO/Usmvcizmf/qeepK6PsxSj2IgJtIVxv3T2WZYFh6snzwGb6mX9pxFhTyqzHq9tCtBMuUjkUKQolzPHogLXdZ2Xbxk8Yb9GgGATOv4FSwuMz3laLCkza8T5Xys50wI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752249767; c=relaxed/simple;
	bh=PX0a3K+EvOehkeH1GTvmdAFdOZZPbJv22oHcHDDDx2U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YJqfyVMjoGoAK9huUKQq88WFFSKRc3w1hCNzplqs4jwfxWa6lhdgeqpNls4iJ4gIgkfRFehZJz0c+EK/DGlofLpsKN+HufhBBHO+0xntvY5LkQLgGqLMh+bWFX3v28zJL7McHPspR10FsO4WE+PtNt5oZwEnS4hmHxGhh0Y1OAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net; spf=pass smtp.mailfrom=tomeuvizoso.net; dkim=pass (2048-bit key) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b=HUp5x5Tb; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tomeuvizoso.net
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-711756ae8c9so17287777b3.3
        for <linux-media@vger.kernel.org>; Fri, 11 Jul 2025 09:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tomeuvizoso-net.20230601.gappssmtp.com; s=20230601; t=1752249764; x=1752854564; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KH5AFNkQfuVWbiRBmKTQngI4D6xLZ6iRLprTVywV+pY=;
        b=HUp5x5TbrFrI+N6SK55QJB6gLYBmxTqaFOE78VogiAj0fTnar+mNFSMtdP2pCoJC4O
         YH4NOUoA17GYQrwLVzIzk6OCXsm+Fq1+sbvjOhV+Y+Bz146q7UVhFigitfc2MqnnBQi9
         JlsD6chwYcD4E2g3kSH25sS515i/SeUkWoOIE9YCMtaHRCXEsRqbXigraKzcuiojKd4d
         8VEtPeyGJd1QG8xhieciuPhK527aPjO8iibZ1HQZYu9//Ti/k/AXR7oOczbLMhftKeqO
         N7ygvBOBMAB4vtgBFFBacZ4tz0ZfBaxCMOlQraLg+0oZ8Txyq79xNS+RhAGckqgYkoyA
         zy+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752249764; x=1752854564;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KH5AFNkQfuVWbiRBmKTQngI4D6xLZ6iRLprTVywV+pY=;
        b=K64jx0VZ1w6rizagDO9DiNHM6StjHthTHIIUUCT11DvRNEluxKA6yzug4bbMoLdBNY
         8LzRXK2Woy95CxRVqBlARcT767av/L0ltz0ec4GEaJ4865Fu5lCagUV6SRNOcvSkWhGk
         v0b6jlyoxYZExYQiXFCE55UMNpsIH1sk1ZFQi3+1jRjv++nroLgHxldQf9+AVV/zigXS
         wPieSqw96p0ig0xjCXxccXIwqBq+aTz8Elu1OaDMeKB//PfHEMgDqyW+qULNO+n1dycV
         lf7XSyf4ETa2t4psi4++ip9d0HTwAHnn3F8mmtUAOLqkhLbmpcqyaFNUoWtyB3zeTsja
         T5PA==
X-Forwarded-Encrypted: i=1; AJvYcCWsUSeRF5rkPGS4W7zEfj+CxUNNLrZ9DFS0U/GTZIwL+Ty7SOTT6YzzRvD/ONqFm7UI8Cryd6Wtm3YQ3w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyADKJifwsHji7rs+0WuFIBAAol7/VD9JoemjDzo1WufHWo/6j6
	en/fPVAG5tHlCQrBHF1n/N/Kvl/1iaR0o5v7WVYtulVepMvrnqWueOHpqrzGjigDfJw=
X-Gm-Gg: ASbGncvX31OmpuK7cUD9UzE4ky/qSBCJhVP99TLOZ9v+1XgrBbwzg6pxTiPdanas6dr
	TRstCF/OA4rCXBirh3smbTluVKDnP/0GmfJfvDK+UjMhWkg56Kvn4+CcxL4hrkaghqR5YAqiWfM
	MnTE7gy55h5PEkB40OZdfIH5wdh93gDsoN3MQGM0vJZwiNZc8KhWrr5WupShNsbu/j3/eeEVUtD
	WkjppgJBRKrWKG8HGxe+hIuYgKa2N+NC2mfM0aeq7J82xwmpy3IyWv363KyZceuNKOnThQaE6iP
	Mr1MLaIO30cnIlisQgbg2kb5vXCeugshI3N9SNMGw/YNWqA1SuzIDubqj9Qb7THSsGxBlp57BFk
	L3dPBPofsBxBP9wrsIRxPIZNvnsssVn7wVfehtUKVm+bgiXbq+Or1Kq47StkfzbM9w2NcFyO783
	ft
X-Google-Smtp-Source: AGHT+IGgr8W8+8Ms3TSE3IcvD3M1B9m0MBVDR5OAzl97i53yKd4YvPHzG2EdW88+jdVJTbWJGos5Hg==
X-Received: by 2002:a05:690c:360a:b0:70f:84c8:3134 with SMTP id 00721157ae682-717d5c35527mr63862137b3.3.1752249763445;
        Fri, 11 Jul 2025 09:02:43 -0700 (PDT)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com. [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-717c5d734bfsm7998777b3.37.2025.07.11.09.02.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Jul 2025 09:02:42 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e8187601f85so2047278276.2;
        Fri, 11 Jul 2025 09:02:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUBu8XBIu9F0qnoyfmqja94duFMkvzj6VBYKkIiOoWrCbOyDIhg8AcHpchk5l8Xy+JJWMUGA0jUMd1xpzUq@vger.kernel.org, AJvYcCUfE71DxdKdpnD9485WYN9FCNTYCW7E9nzMMRT4IYH1ZvxR4Lqjt2C3InmO6MLZUo6fF0xy4TluzPHQ@vger.kernel.org, AJvYcCVOJdceH2P4xPVdJTgOR9R9PPNQNa/rHXfDz4Z1Y3+mewIe4N/exMzR39cAAjBP7PMAvrF+Hy0fllKw@vger.kernel.org, AJvYcCXjwdl7/DtqbeA89HJfHldwfSTZOsXX8ETTzxuRFpvI5Qkhnp7CDiDP6RxDrQ0V55LrDNbHPgVedDmAITY=@vger.kernel.org
X-Received: by 2002:a05:690c:b91:b0:6fb:1c5a:80ea with SMTP id
 00721157ae682-717d5f06565mr68541397b3.32.1752249762154; Fri, 11 Jul 2025
 09:02:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250606-6-10-rocket-v7-0-dc16cfe6fe4e@tomeuvizoso.net>
 <20250606-6-10-rocket-v7-6-dc16cfe6fe4e@tomeuvizoso.net> <a8c3df16-a460-49bb-ba4e-1a07135d24e5@arm.com>
In-Reply-To: <a8c3df16-a460-49bb-ba4e-1a07135d24e5@arm.com>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Fri, 11 Jul 2025 18:02:29 +0200
X-Gmail-Original-Message-ID: <CAAObsKCinmbFwRqWTOCB3uoH0YLUm3wkvQ7GUhtESzHnAieGxw@mail.gmail.com>
X-Gm-Features: Ac12FXxOOfjV90DXXXBg685kI3y2UMTJtFOhXoVtyQciGpdKZH7V2bdydsxAp7M
Message-ID: <CAAObsKCinmbFwRqWTOCB3uoH0YLUm3wkvQ7GUhtESzHnAieGxw@mail.gmail.com>
Subject: Re: [PATCH v7 06/10] dt-bindings: npu: rockchip,rknn: Add bindings
To: Robin Murphy <robin.murphy@arm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Oded Gabbay <ogabbay@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Kever Yang <kever.yang@rock-chips.com>, 
	Daniel Stone <daniel@fooishbar.org>, Da Xue <da@libre.computer>, 
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-doc@vger.kernel.org, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2025 at 3:27=E2=80=AFPM Robin Murphy <robin.murphy@arm.com>=
 wrote:
>
> On 2025-06-06 7:28 am, Tomeu Vizoso wrote:
> > Add the bindings for the Neural Processing Unit IP from Rockchip.
> >
> > v2:
> > - Adapt to new node structure (one node per core, each with its own
> >    IOMMU)
> > - Several misc. fixes from Sebastian Reichel
> >
> > v3:
> > - Split register block in its constituent subblocks, and only require
> >    the ones that the kernel would ever use (Nicolas Frattaroli)
> > - Group supplies (Rob Herring)
> > - Explain the way in which the top core is special (Rob Herring)
> >
> > v4:
> > - Change required node name to npu@ (Rob Herring and Krzysztof Kozlowsk=
i)
> > - Remove unneeded items: (Krzysztof Kozlowski)
> > - Fix use of minItems/maxItems (Krzysztof Kozlowski)
> > - Add reg-names to list of required properties (Krzysztof Kozlowski)
> > - Fix example (Krzysztof Kozlowski)
> >
> > v5:
> > - Rename file to rockchip,rk3588-rknn-core.yaml (Krzysztof Kozlowski)
> > - Streamline compatible property (Krzysztof Kozlowski)
> >
> > v6:
> > - Remove mention to NVDLA, as the hardware is only incidentally related
> >    (Kever Yang)
> > - Mark pclk and npu clocks as required by all clocks (Rob Herring)
> >
> > v7:
> > - Remove allOf section, not needed now that all nodes require 4 clocks
> >    (Heiko St=C3=BCbner)
> >
> > Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> > Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > ---
> >   .../bindings/npu/rockchip,rk3588-rknn-core.yaml    | 118 ++++++++++++=
+++++++++
> >   1 file changed, 118 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn=
-core.yaml b/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-cor=
e.yaml
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..0588c085a723a34f4fa30a9=
680ea948d960b092f
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.y=
aml
> > @@ -0,0 +1,118 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Neural Processing Unit IP from Rockchip
> > +
> > +maintainers:
> > +  - Tomeu Vizoso <tomeu@tomeuvizoso.net>
> > +
> > +description:
> > +  Rockchip IP for accelerating inference of neural networks.
> > +
> > +  There is to be a node per each core in the NPU. In Rockchip's design=
 there
> > +  will be one core that is special because it is able to redistribute =
work to
> > +  the other cores by forwarding register writes and sharing data. This=
 special
> > +  core is called the top core and should have the compatible string th=
at
> > +  corresponds to top cores.
>
> Say a future SoC, for scaling reasons, puts down two or more whole NPUs
> rather than just increasing the number of sub-cores in one? How is a DT
> consumer then going to know which "cores" are associated with which "top
> cores"? I think at the very least they want phandles in one direction or
> the other, but if there is a real functional hierarchy then I'd be
> strongly tempted to have the "core" nodes as children of their "top
> core", particularly since "forwarding register writes" sounds absolutely
> like something which could justify being represented as a "bus" in the
> DT sense.

Actually, I experimented with having the three cores as completely
independent units and things just work with how resources are
referenced in the DT nodes.

So I'm just having a top-level node per core with the same compatible.

Thanks,

Tomeu

> Thanks,
> Robin.
>
> > +
> > +properties:
> > +  $nodename:
> > +    pattern: '^npu@[a-f0-9]+$'
> > +
> > +  compatible:
> > +    enum:
> > +      - rockchip,rk3588-rknn-core-top
> > +      - rockchip,rk3588-rknn-core
> > +
> > +  reg:
> > +    maxItems: 3
> > +
> > +  reg-names:
> > +    items:
> > +      - const: pc
> > +      - const: cna
> > +      - const: core
> > +
> > +  clocks:
> > +    maxItems: 4
> > +
> > +  clock-names:
> > +    items:
> > +      - const: aclk
> > +      - const: hclk
> > +      - const: npu
> > +      - const: pclk
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  iommus:
> > +    maxItems: 1
> > +
> > +  npu-supply: true
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  resets:
> > +    maxItems: 2
> > +
> > +  reset-names:
> > +    items:
> > +      - const: srst_a
> > +      - const: srst_h
> > +
> > +  sram-supply: true
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - reg-names
> > +  - clocks
> > +  - clock-names
> > +  - interrupts
> > +  - iommus
> > +  - power-domains
> > +  - resets
> > +  - reset-names
> > +  - npu-supply
> > +  - sram-supply
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/rockchip,rk3588-cru.h>
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/power/rk3588-power.h>
> > +    #include <dt-bindings/reset/rockchip,rk3588-cru.h>
> > +
> > +    bus {
> > +      #address-cells =3D <2>;
> > +      #size-cells =3D <2>;
> > +
> > +      npu@fdab0000 {
> > +        compatible =3D "rockchip,rk3588-rknn-core-top";
> > +        reg =3D <0x0 0xfdab0000 0x0 0x1000>,
> > +              <0x0 0xfdab1000 0x0 0x1000>,
> > +              <0x0 0xfdab3000 0x0 0x1000>;
> > +        reg-names =3D "pc", "cna", "core";
> > +        assigned-clocks =3D <&scmi_clk SCMI_CLK_NPU>;
> > +        assigned-clock-rates =3D <200000000>;
> > +        clocks =3D <&cru ACLK_NPU0>, <&cru HCLK_NPU0>,
> > +                 <&scmi_clk SCMI_CLK_NPU>, <&cru PCLK_NPU_ROOT>;
> > +        clock-names =3D "aclk", "hclk", "npu", "pclk";
> > +        interrupts =3D <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH 0>;
> > +        iommus =3D <&rknn_mmu_top>;
> > +        npu-supply =3D <&vdd_npu_s0>;
> > +        power-domains =3D <&power RK3588_PD_NPUTOP>;
> > +        resets =3D <&cru SRST_A_RKNN0>, <&cru SRST_H_RKNN0>;
> > +        reset-names =3D "srst_a", "srst_h";
> > +        sram-supply =3D <&vdd_npu_mem_s0>;
> > +      };
> > +    };
> > +...
> >
>

