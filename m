Return-Path: <linux-media+bounces-34050-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E3EACD9F6
	for <lists+linux-media@lfdr.de>; Wed,  4 Jun 2025 10:37:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9DCC03A38F7
	for <lists+linux-media@lfdr.de>; Wed,  4 Jun 2025 08:37:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6A4D28C5AA;
	Wed,  4 Jun 2025 08:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b="hP40nAtp"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C0D283130
	for <linux-media@vger.kernel.org>; Wed,  4 Jun 2025 08:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749026220; cv=none; b=bHYuN7Uq9130cM8r6YgMuoZWXFEmv7CAB6nb3xebgUR2Snv+pSBbDnwbicX7MBcxiYHpkY6wMUqOQV3p1c4qRN/bKw2q4xr0gTbVDSw7rQaL8AaMiJD81di07UYhole4Rza7fvWyrobLhBB/p4sLUWa4crbeONPt/nwZL1LiBy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749026220; c=relaxed/simple;
	bh=lZUMVPd+TjXOnbewMrKPKU2D7vXCosD5LXoZwVJJ2Ek=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E1W8ppi6HeaAzL4GJg6+emvXfdDzPi31DZyoutcfHqPp4+6l/JQNw+Cvsmv2RKPwo7LJM+JpwdWQRGP3et8pbcHqFN3u4KxoB5kRkC3iSkVpC4/FLWcrn8XDZ3djIUAhTvj8DdlVshCb3BZue4pEMA8OCmpezGNwRNPZADN4L0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net; spf=pass smtp.mailfrom=tomeuvizoso.net; dkim=pass (2048-bit key) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b=hP40nAtp; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tomeuvizoso.net
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-70f86c9e3e7so64142717b3.1
        for <linux-media@vger.kernel.org>; Wed, 04 Jun 2025 01:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tomeuvizoso-net.20230601.gappssmtp.com; s=20230601; t=1749026215; x=1749631015; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zJmj/95wgXcHpVI6Ou9qJ8Nq5fJR29OVttEikN7mIco=;
        b=hP40nAtpC+FRA1i2/eBrUmPSmU9lS4LBPhlKK35WcwEU7lh8gzXNCnOPQUtgAlFTqq
         9E2NGaiMGQGkpgwc7SDsdN8biceeUpNBYK4Cm8DqOrvaehYuslhMXPVhjLDhY+vRY3Lu
         mU/fVLPM1ZzVmhLLMbGcY+VsjT1gA+dFic7w7gcFVUnUCVspr4k31X3+REWiNvBRRbKH
         VEQ01x4sxUbmY8DJdk+Fsk2Zu24CN0IVOl60bAq7O4u+hAXBaT0m6kCE2zayq7Xwl2YT
         vdGYwnWqWaGNOTHIum4GwW6DFf+/5iUVI5EfLqhKoge7N9bUGE/LqV6gBi6XiZV5NlUK
         Yh0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749026215; x=1749631015;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zJmj/95wgXcHpVI6Ou9qJ8Nq5fJR29OVttEikN7mIco=;
        b=fNTSe2AH9fyoyedDU4bNMLVCkLEVOxEL2atwtg1o1IpL8LywYzL6qQxSo3L0Di7cKg
         fPqsmGVeVOCYFnSZHA+E1BLBdlcuEW9jv9vetja+Ml3LtjIlGlQtNyDGaiAAHydOXI9r
         6FIlfdg3wY8GdRmhQ8CwwMB2dwAkvwtrOw6Bo9gv/hIvVi+YXNKiZWJZeoN3XKqIVAGw
         r9FkifIlGidWm/ggS1KUWE7glG3qhjTd7i9XEQozTGpSbUK3Mfu12V89CpOzFsO2updg
         JxkJ7Thzn4LOii2SsHgBF2KIsWm6e8Ipd4/wXPnvr7aCnm4sHxiM1j9OR99RbFY+Izly
         ojzQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmd0SlS+P91JLCiogSpupjqLltSCH/cjeM0vbpB5ePRnv8MCEEpB8Ki8YnfshQeTu2oML2woZRhzhxWA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyfMBunyMZWQzTFMX2RL68GW35HiDeypFn2J2NNzrEwj4TUN7jR
	8oL8wmvXqF028FqSN0MFnpJ3adVOdzvYIE6PWrOfSFFVfFCgisYGyJsvtfO0oqnCg20=
X-Gm-Gg: ASbGncuR2k4HM7fcoh34saNNWI1WBetNbFijueLrKJxqj23tr+1szrZqq+nyg9Y4Wdt
	4rUrQ+18b0M6vv2SSdvGMyT1CXyHG+tc1KcL3FMvKYtF1nWCDzMTd2orqitWwJqa/lqFGQKEdRG
	Ha23H4RWma41qRxmTvEu5AUxnWGmUxetFk+tYS2aMAvPLM9dgDXc7natnKyvPjA4sWq50h3xgO8
	FpicuwnWwpkbEoRBJVrFhja3x3WkY9by7a12DF5dOk/nQf7rJKiXM0X0SfwqhAKaOnYkqZJw4iv
	YW/ZO/uka8XVXwPhQRWTJwfoeHrs+T/7138n6CBynkTbPm0+jH2B+LfUX6cPIjt+U7XZeJR+z1W
	qCjltR4vPpWkQMALQ9Pk=
X-Google-Smtp-Source: AGHT+IGAtiLPhQPOwsV52/wbwHI6aGaNzcA7rtap+Rcs1v0V8QQ0deHXme2lqVPOqUfKUHS1nKWE4A==
X-Received: by 2002:a05:690c:5b41:b0:70e:7503:1180 with SMTP id 00721157ae682-710d99a37f4mr15471087b3.1.1749026214852;
        Wed, 04 Jun 2025 01:36:54 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-70f8acd51aesm28953687b3.84.2025.06.04.01.36.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 01:36:54 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e7dd151f79eso6290894276.2;
        Wed, 04 Jun 2025 01:36:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCULW+UTfFh+tT0J44z1K6JYbmHlv/wd1MXXy7KKCEtBGCgRyN797NLiJGgErUHzPXOAy1j8TsWLlWFEvLw=@vger.kernel.org, AJvYcCVM/NXB0C5w3H9PDbxdx4ri8kz+r+wR0mHzdoTZllFU2cIVxw7UCYZjGJHgpab0v+R3bmH7+U8Bnwq9@vger.kernel.org, AJvYcCX431fODxXURRvDjMnwc5r0kvbnILTzAMgl36ph0qdgXUQo9BcH8muM4qlc6MQurVWU4qfxZ00XfSf9uohh@vger.kernel.org, AJvYcCXR51l+eC1sz1L0RVb2S89pJmWSbVH8OLrbhdLbrbiuT45xLlBrHwMiWjIlw3kqVx0EY4fXfN8N0Mnd@vger.kernel.org
X-Received: by 2002:a05:6902:2684:b0:e7d:cfd0:957f with SMTP id
 3f1490d57ef6-e8179c4e822mr2337109276.11.1749026214087; Wed, 04 Jun 2025
 01:36:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250604-6-10-rocket-v6-0-237ac75ddb5e@tomeuvizoso.net>
 <20250604-6-10-rocket-v6-1-237ac75ddb5e@tomeuvizoso.net> <2024813.jZfb76A358@diego>
In-Reply-To: <2024813.jZfb76A358@diego>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Wed, 4 Jun 2025 10:36:42 +0200
X-Gmail-Original-Message-ID: <CAAObsKB6UDp-yBE3oNNn0GkiVN0TeYFkL5nzQCroUHaSK47tUA@mail.gmail.com>
X-Gm-Features: AX0GCFvL5nJeCruhYVKFwWz9ImMH3rGz7U0FgI_gqBjbHTrFFbFoGu46LHESGLo
Message-ID: <CAAObsKB6UDp-yBE3oNNn0GkiVN0TeYFkL5nzQCroUHaSK47tUA@mail.gmail.com>
Subject: Re: [PATCH v6 01/10] dt-bindings: npu: rockchip,rknn: Add bindings
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Kever Yang <kever.yang@rock-chips.com>, 
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-doc@vger.kernel.org, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 4, 2025 at 10:25=E2=80=AFAM Heiko St=C3=BCbner <heiko@sntech.de=
> wrote:
>
> Am Mittwoch, 4. Juni 2025, 09:57:14 Mitteleurop=C3=A4ische Sommerzeit sch=
rieb Tomeu Vizoso:
> > Add the bindings for the Neural Processing Unit IP from Rockchip.
> >
> > v2:
> > - Adapt to new node structure (one node per core, each with its own
> >   IOMMU)
> > - Several misc. fixes from Sebastian Reichel
> >
> > v3:
> > - Split register block in its constituent subblocks, and only require
> >   the ones that the kernel would ever use (Nicolas Frattaroli)
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
> >   (Kever Yang)
> > - Mark pclk and npu clocks as required by all clocks (Rob Herring)
> >
> > Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> > Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > ---
> >  .../bindings/npu/rockchip,rk3588-rknn-core.yaml    | 144 +++++++++++++=
++++++++
> >  1 file changed, 144 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn=
-core.yaml b/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-cor=
e.yaml
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..9a5e9e213912d0997da2f6a=
e26189adf044dcc7b
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.y=
aml
> > @@ -0,0 +1,144 @@
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
> > +  will be one core that is special and needs to be powered on before a=
ny of the
> > +  other cores can be used. This special core is called the top core an=
d should
> > +  have the compatible string that corresponds to top cores.
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
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - rockchip,rknn-core-top
>
> should be rockchip,rk3588-rknn-core-top I think
>
> > +    then:
> > +      properties:
> > +        clocks:
> > +          minItems: 4
> > +
> > +        clock-names:
> > +          minItems: 4
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - rockchip,rknn-core
>
> should be rockchip,rk3588-rknn-core

Thanks. Actually, all the addOf section is not needed any more as we
now know that from a resources point of view all cores are the same.

Cheers,

Tomeu

> > +    then:
> > +      properties:
> > +        clocks:
> > +          maxItems: 2
> > +        clock-names:
> > +          maxItems: 2
>
>
> Heiko
>
>

