Return-Path: <linux-media+bounces-32499-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F6BAB6FA1
	for <lists+linux-media@lfdr.de>; Wed, 14 May 2025 17:25:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 85DB57B9CEF
	for <lists+linux-media@lfdr.de>; Wed, 14 May 2025 15:20:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73EF827FB3A;
	Wed, 14 May 2025 15:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b="Oed3cHqH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D6527F73A
	for <linux-media@vger.kernel.org>; Wed, 14 May 2025 15:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747235921; cv=none; b=Gkey/kIxRz6NDdTKaWJqcq/zcZktWPVTb0+URYCHJ2QIJaTJRQyF4jQhZQeSI+EpSWLJOjRxjq6h7TgnuCIX4pmJ2GFCCZwOqzp3+2oJJ1Gf5MNm3Uwf/Z7/tD+bj5fNEiVtqop6XTyp9RPxCLxAQ8tZ2392fgY+lCeB4SsgZm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747235921; c=relaxed/simple;
	bh=4p4yBRAV9n0bO6FOEyepDAGQnT67fuJbplvwg/3gGmY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=shBNIkQ7jowdhyAYQ4Ei1lAmTLQsIL8QGoHQNnlVV0H52V3USZcsgwMyd36Oq4Sh2vQWmbjnoRr9Q9lGkJg/4wU5fA/ogvQTJlWyWh3MM8cZLAmtdl31xbAsEXOHyQ8Nkcrl1FnCbX63LVx+MvgMrP5UENQooFZoNyEKVNAI4HI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net; spf=pass smtp.mailfrom=tomeuvizoso.net; dkim=pass (2048-bit key) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b=Oed3cHqH; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tomeuvizoso.net
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e731a56e111so6970616276.1
        for <linux-media@vger.kernel.org>; Wed, 14 May 2025 08:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tomeuvizoso-net.20230601.gappssmtp.com; s=20230601; t=1747235917; x=1747840717; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hDddi59QfQosyfazvmWzWcoS6I1hEYTqzvGT0OXdo3s=;
        b=Oed3cHqHD1jVShB/pQHBsHZi0dUgJYgozUqgCo3lTkMWKyvBvAz6ml2LUKIT8p0Q62
         iQU6m9oL6caXHLrTqpvNjSvlsUurB4PiLLLbkSRxJ/65D1Qy8202tZkNSy9/3oblkxJ9
         UiiVzEOv3oXP1S4Kxdy1qtOP9N1I5VEqSFy+mhqUmSQH5wo07hkLE/e0RUY84Nje9fpe
         YPKrfEdk+/SkLW+nQh0FYhPJQ7pnSi/vySlsAPz7ywY2M7R5nlHHsSE8D1mNte1RGnvx
         UwhQW5QCg65sgnE+JHL1zxeAs/aBJ8RnmSwtZEpEdYUMOUrFlQHxg0Ton1I16P2gQ7Xa
         MhIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747235917; x=1747840717;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hDddi59QfQosyfazvmWzWcoS6I1hEYTqzvGT0OXdo3s=;
        b=olPxqBUIrOnYwYY+0UrTZ9HMyvS5dBOj8KcvvNevnx/zdbrucZvkJbpHouH1bsFT28
         A1/dOUyBcXD/t8+4AjVOC2JeCFZhDSedt7WATze8Xl2L1eOhCoKai4hhJPR+1+7+zNFV
         /hbD7+GHBko+ZWIofZnwfKjyNn3TkLkUgoHHh3XJ7xUVkXXN619jcACwgm8m8ozJGkLq
         cSUvjS7OoLkCT7BQMLXUM2XAh/CndqVgMMazLEp/bctFf3UO8bBqsMV0Ag/Da5vCT/vi
         o1QKdPW1sG4Mm5kouC4c5+w/hIrX8QMnQxKuj2hdun1Wb6AjiTxSBsKvPZFfaYwcJ4ys
         XGDg==
X-Forwarded-Encrypted: i=1; AJvYcCWLpH7svycHOSC4aGCtyphSct3zHCsAZ2RQ1C2VRiWS+BKx6c+5X1ZAaSjhXSVaixDO1GTa8tPx6QQ9HA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyHtzYmdI7pDZ+DfE+JeUVnL90arqCvsmKvJFLKmPBdLxmyPlHc
	5hez6NbKw8t/y+3mwaEpxYlCHf36QoYrk+2e7CrZOTqYQqSafVZCw/nsGssL0z8=
X-Gm-Gg: ASbGncsXfey7pvTGFUUjdIaXgPOobH2Ud5tdkLEa/EZtFZZRhPtBnoeMtqiFN5VyrW6
	yrZNppptHCkBHSv/p6SDyJ8E9OB37QJiQQ5ua4R/W8yw6/8VZbZkVJ20rKbAWihhbPctzHn1joD
	e6swA9V6MWT5r0EhqkNGeox/v4RVn9RSsR24C0r5szzEqnDZX2Zlr5jwpj+HECaj+WMXA9kDEMA
	zpaO316N/OYD4z+CIdl1Wx6bRl79+1VH0Hdj0rV3YhL+X5RrRnpdSi49LboVVROp6gOldOLq/ea
	OcnzXZlHlZkLAM+eOt36HgG8uLFRKhtfEUCWwTGhXHT0YaYPtc4XX6gFJ99WutFOyV+RoBOmK5p
	JxM3thUpPid0SmshkCXQ=
X-Google-Smtp-Source: AGHT+IFc+c8ITHqvSIxzWfU1aeNXQeRTQ4NNpRB/RSnlnXCK7pc2a0rQ7v7kE/mNsylB+TBM/fS4Wg==
X-Received: by 2002:a05:6902:15ca:b0:e7a:b192:e5c2 with SMTP id 3f1490d57ef6-e7b3d501912mr4886924276.19.1747235917439;
        Wed, 14 May 2025 08:18:37 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e78fd4a72f0sm3134110276.20.2025.05.14.08.18.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 May 2025 08:18:36 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e7b391ba6a1so1458886276.2;
        Wed, 14 May 2025 08:18:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUAaQCHwSDKZbz/SyIr9q4gThyldJ/llkKA2UaKJqVYkepgDtFyKGGqttTsK0+Jkzz4B4OOnS+lng1jTgMs@vger.kernel.org, AJvYcCUTfFiSx04mjF8NtaCF4cwYyJU0RQDqIds/JDxw87g2xT+KHMDdIBD6bzl1SPSSzVNl6tLI/jG226UP@vger.kernel.org, AJvYcCVwrX4deKj3W0jVibb59Krm1XQJeXzU0Ru/QfzSFBMhjTA7YrsJpWJv3/IShW+qlSdeqgDvdh/fnTln@vger.kernel.org, AJvYcCWUl4cIMDOaU7FFZBPBRWIEjdQ6UKpJ8dmi9hIhnWP3xaeEZQMTWa4Lh6rk5zCqtHG2J/svmRoBI6/Tato=@vger.kernel.org
X-Received: by 2002:a05:6902:1ac6:b0:e75:b4df:869 with SMTP id
 3f1490d57ef6-e7b3d70dc1dmr4699203276.48.1747235915800; Wed, 14 May 2025
 08:18:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250225-6-10-rocket-v2-0-d4dbcfafc141@tomeuvizoso.net>
 <20250225-6-10-rocket-v2-1-d4dbcfafc141@tomeuvizoso.net> <14333638.uLZWGnKmhe@workhorse>
In-Reply-To: <14333638.uLZWGnKmhe@workhorse>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Wed, 14 May 2025 17:18:22 +0200
X-Gmail-Original-Message-ID: <CAAObsKAkMhgQsi6hLjbfS5wDaUz-hPQiZn7dVvn+6kDv0_jo9Q@mail.gmail.com>
X-Gm-Features: AX0GCFuozUHqFw-Ua1grRU5Zmez8kXjNLPgWkTD1GO7aODfE11uHKf0wUS78uCM
Message-ID: <CAAObsKAkMhgQsi6hLjbfS5wDaUz-hPQiZn7dVvn+6kDv0_jo9Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] dt-bindings: npu: rockchip,rknn: Add bindings
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Oded Gabbay <ogabbay@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, Jeffrey Hugo <quic_jhugo@quicinc.com>, 
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Nicolas,

Thanks for looking at this. Some thoughts below:

On Fri, Apr 25, 2025 at 8:50=E2=80=AFPM Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
>
> On Tuesday, 25 February 2025 08:55:47 Central European Summer Time Tomeu =
Vizoso wrote:
> > Add the bindings for the Neural Processing Unit IP from Rockchip.
> >
> > v2:
> > - Adapt to new node structure (one node per core, each with its own
> >   IOMMU)
> > - Several misc. fixes from Sebastian Reichel
> >
> > Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> > Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> > ---
> >  .../bindings/npu/rockchip,rknn-core.yaml           | 152 +++++++++++++=
++++++++
> >  1 file changed, 152 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/npu/rockchip,rknn-core.y=
aml b/Documentation/devicetree/bindings/npu/rockchip,rknn-core.yaml
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..e8d0afe4a7d1c4f166cf13a=
9f4aa7c1901362a3f
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/npu/rockchip,rknn-core.yaml
> > @@ -0,0 +1,152 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/npu/rockchip,rknn-core.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Neural Processing Unit IP from Rockchip
> > +
> > +maintainers:
> > +  - Tomeu Vizoso <tomeu@tomeuvizoso.net>
> > +
> > +description:
> > +  Rockchip IP for accelerating inference of neural networks, based on =
NVIDIA's
> > +  open source NVDLA IP.
> > +
> > +properties:
> > +  $nodename:
> > +    pattern: '^npu-core@[a-f0-9]+$'
> > +
> > +  compatible:
> > +    oneOf:
> > +      - items:
> > +          - enum:
> > +              - rockchip,rk3588-rknn-core-top
> > +          - const: rockchip,rknn-core-top
> > +      - items:
> > +          - enum:
> > +              - rockchip,rk3588-rknn-core
> > +          - const: rockchip,rknn-core
> > +
> > +  reg:
> > +    maxItems: 1
>
> Hi Tomeu,
>
> as you probably know, RK3576 has quite a similar NPU. This is why I'm cur=
rently
> poking at this patch series. One of the differences I ran into was that t=
he
> IOMMU of each NPU core now sits within the reg address space range of the=
 core
> as described by the single reg item binding and assumed by the driver.

But this is not a difference, right?

> This seemed weird to me at first, since I would've guessed the cores woul=
d be
> exactly the same, but I noticed that they kind of still are; the RK3588's=
 NPU
> also has a "hole" between 0x2000 and 0x2fff on each core, which is where =
RK3576
> put its IOMMU.

So this is the same in both RK3576 and RK3588, right?

> This is some information I gleaned from the RK3588 TRM, specifically sect=
ion
> 36.4.1 "Internal Address Mapping", which shows where each "part" of the N=
PU core
> has its address space.
>
> Right now we just represent this as a single reg item per core. I've play=
ed
> with the idea of splitting this up into the distinct ranges the TRM lists=
 and
> giving each a reg-names entry, but this would require a major rework of t=
he
> driver from what I can tell, including to the auto-generated register hea=
der.
>
> For now, my hack on RK3576 is to just ioremap the range defined by resour=
ce
> start to resource end inside rocket manually if I get -EBUSY trying to io=
remap
> the resource proper. This is quite an ugly hack though, it means the IOMM=
U node
> still has its address overlapping with another node in the DT, and it als=
o means
> we have an unavoidable error message printed into the kernel log. This is=
 also
> what the vendor driver seems to do.
>
> What do you reckon is a reg setup in the binding that is both reasonable =
to
> implement in the driver while accurately describing the hardware?

Guess we could go with some smaller granularity and have 3 register
areas per core, instead of 10:

- CORE: PC+CNA (0x0000 ~ 0x1fff)
- AUX: CORE+DPU+PPU+DDMA+SDMA (0x3000 ~ 0x9fff)
- GLOBAL (0xf000 ~ 0xf004)

So the IOMMU on all the known SoCs can have its own regmap. I have
chosen to call the first one CORE because these are the components
that are absolutely needed in any NPU that is oriented towards
convolutional networks (convolutions, basically). I have named the
second AUX because it contains hardware units that are optional and
are used to implement operations that may be common but that aren't as
computational expensive as convolutions and thus might be skipped in
lower-end versions of the IP.

What do you think?

Regards,

Tomeu

> The RK3568, which uses a similar NPU design has the IOMMU at an offset of=
 0xb000
> from the core's start of PC, so probably after any core specifics but bef=
ore the
> global registers if I hazard a guess.
>
> For those without access to the TRM: splitting this up into multiple reg =
items
> per core precisely the way the TRM does it would result in no less than 1=
0 reg
> items on RK3588, if I count correctly.
>
> Kind regards,
> Nicolas Frattaroli
>
>

