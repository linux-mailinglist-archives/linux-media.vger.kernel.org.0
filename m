Return-Path: <linux-media+bounces-35809-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FCBFAE6CC2
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 18:47:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B3B61C2206F
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 16:47:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F151D2E7F15;
	Tue, 24 Jun 2025 16:45:58 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 961122E7632;
	Tue, 24 Jun 2025 16:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750783558; cv=none; b=Ib+Zy+mss8kJysoFZirX7ISmtW2m3shgM/ETntG4/iKuUcR6/2utWEnet8yglUehEW02wl4Ck3OuT7Mssy0vs4tZzVUXceXpWMuTB7omH6Hz6dUeheahiK4/6oKKcn/zkpY1Tmgh6hTvapxcKaD9q0rv74xOSXJiQePfYVPRgjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750783558; c=relaxed/simple;
	bh=QrbtW5TGMUVnqvrKoBCUYz/oCNP1PdFA9txT+OYVSd4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L2D1t8keWucfuCUM+Bhx/BisHczUSpgtT+XPZtGks5yr5/u46MHLIB2HOslA5aQbwN0eGNm3+DVZOjJuQGOYeaxQMEqZSZ9Os8T1ECaOYqQGTAv6E/KpL5WBHehcSj1pECTCgcBybK81/t3tAQIVcasBsalHwNAJA8IC0zjU3oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5316a5e4c6cso187616e0c.1;
        Tue, 24 Jun 2025 09:45:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750783554; x=1751388354;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E/7SYfxrw1wRG0i1u99YXPQjyYLvHC1mIoHvaxvkaig=;
        b=YPFaKTd0r8wU+NmbBrcJOKDGkb6IB/WzEbCE+/TLkkanOXm8KwEc5n1RHtG2mPXvPm
         UXy9njQI2QtZ5FIuSL4Q7rMkFl2Rld57nZRc83tWejW/DpogBnsoK3yQl1W7BCwrzTFz
         Hv6WtvoUN+zVzTUMIwwblcM0C4qrQdjB2VG+ysUhrfHc0f+WQboqr/6Itc89VRliHOud
         IE18Tlvd1aA0wc5TUC/xPtmkfTQ75aZ5X6/Dyzfn/0CC2m34axLTq/6LduWYHLG9QdEd
         jh0LAziLa7Cu5KRcsq3ok5wOlRxy1+Gu9QVB8DtzWSc+tFus5nT6r2skxLUJk3Y1q8UI
         nOPg==
X-Forwarded-Encrypted: i=1; AJvYcCVNphc+JTweYtukWwPLbLnfh1P6DHs7dcr1J+LZ4RRapk8mXiFywuKlcyRQeiJzAS1AmIKk+HUVMJ53@vger.kernel.org, AJvYcCWqArDo6/nKI8htNhbADRox6EA0nd+Fy/iJ90O+4BXmwqb1yy4TsJwAVpSngw2Nj2Z7fDsiyEEIySRTxxz5UvX5WqQ=@vger.kernel.org, AJvYcCWw8Fu79MI4u7CvkbMODMcFhITVXqLs9nuK1jWcVwDdTGYByZPSdY9JA5q29TGS20myl3XDtfUl1IdSEuo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLAaHAaN163/N1UGHvN6z4FypToUlZUxeIneWDEJ/hA3t7v9O8
	7T7yDkxzUUFXAnbGXFUHquhiXht9rhiuEC8HL9kTnTKIhPWM1e19bMgXM9K8cWC/
X-Gm-Gg: ASbGncvHo+lQ8Cx37KkV5oKI6neogmdxLoXTVJ6ltCcXBXEBhE3ypYpq/2S6rMTdfTG
	wqx+WZYlvI1/2/TRhblssDdk+dMommFqxOKC9uON0pbBAwh4RjWBxGhst4WE2YuuJBzx0aMZrW+
	4jCOVoww936IenKNVaTW9B+d80F32ud90iTo2eyQbOyEbKJME1P+1htSFWu7bnXg2IK9PHKPysp
	fhWY5vTmTRmr+77Ve+toIci5s/pc5nXc54iwFFL1uTUft53EKH4xlHL+3RrmaMTVBArcoSX97FC
	L3zW2vVfqvedscCckDoktLgTsHU35IJymaA30cniTjqtcqemgbSChUlVDh2m2JYL3hLbQlOOaIt
	8VQnBLrKOlUEH7/wSN0ww6glB
X-Google-Smtp-Source: AGHT+IEOeSyc83XdKOEPETowTpod2U65ZAsN4ATARVRD5El7FjoJRyHs/spVQURmBrJuC8W1lmT/Hg==
X-Received: by 2002:a05:6122:2a46:b0:530:6e61:d1e1 with SMTP id 71dfb90a1353d-531ad5ac01emr10713904e0c.4.1750783553525;
        Tue, 24 Jun 2025 09:45:53 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-531bf2a470csm1066957e0c.11.2025.06.24.09.45.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 09:45:53 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-87f0efa51c0so217260241.1;
        Tue, 24 Jun 2025 09:45:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV9NITVyqc4IJcsZ2karV37JgGlyIHqXDlbvwC7Tc/ezVtmRyLs+DsFo1kW4U5+/3e2EPN4VQvXO9qd0K0=@vger.kernel.org, AJvYcCVzLE3rbyHk5p6BXgLMFPkhT2Lf8lU5dQlG7Q6T0BsblkfV92fkz4m4vwWmVxcu5OsOPj1s7N7TvXeY@vger.kernel.org, AJvYcCW/+O7jFZcYxqsIwX4GP7Vyu45d4duU25WjwyA04DCloD7CxZRRgezKKHLj71Eaa2Hdb3aqBN4tHKneMLPWL6kb4lw=@vger.kernel.org
X-Received: by 2002:a05:6102:26d3:b0:4e4:5ed0:19b2 with SMTP id
 ada2fe7eead31-4e9c2ccd513mr10695969137.9.1750783552778; Tue, 24 Jun 2025
 09:45:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624-ivc-v2-0-e4ecdddb0a96@ideasonboard.com>
 <20250624-ivc-v2-1-e4ecdddb0a96@ideasonboard.com> <cfc25ba6-753e-41bd-8cb6-f31ba57593a8@kernel.org>
 <c2ab887c-398d-49c4-9ae6-1d0986c32781@ideasonboard.com>
In-Reply-To: <c2ab887c-398d-49c4-9ae6-1d0986c32781@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 24 Jun 2025 18:45:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV-aAyZWU1KMRdQ_F3+LXWGf=6Ci7uEmVe5jdn-O4ZG2A@mail.gmail.com>
X-Gm-Features: Ac12FXwg0Lj2SBGd1rPpVV21mDq5qin3im7qmwhylZZSNh7Ek6TdUIFwJQ3EcKc
Message-ID: <CAMuHMdV-aAyZWU1KMRdQ_F3+LXWGf=6Ci7uEmVe5jdn-O4ZG2A@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: media: Add bindings for the RZ/V2H
 IVC block
To: Dan Scally <dan.scally@ideasonboard.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	jacopo.mondi@ideasonboard.com, biju.das.jz@bp.renesas.com
Content-Type: text/plain; charset="UTF-8"

Hi Dan,

On Tue, 24 Jun 2025 at 16:17, Dan Scally <dan.scally@ideasonboard.com> wrote:
> On 24/06/2025 14:16, Krzysztof Kozlowski wrote:
> > On 24/06/2025 14:35, Daniel Scally wrote:
> >> The RZ/V2H SoC has a block called the Input Video Control block which
> >> feeds image data into the Image Signal Processor. Add dt bindings to
> >> describe the IVC.
> >>
> >> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> >> ---
> >> Changes in v2:
> >>
> >>      - compatible matches filename
> > This is not what I asked.
>
> Ah, you meant the other way round. Ok.
>
> >
> >>      - Added power-domains
> >>      - Aligned clock and reset entries on opening "<"
> >>      - Removed status = "okay"; from example
> >> ---
> >>   .../bindings/media/renesas,rzv2h-ivc.yaml          | 103 +++++++++++++++++++++
> >>   1 file changed, 103 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/media/renesas,rzv2h-ivc.yaml b/Documentation/devicetree/bindings/media/renesas,rzv2h-ivc.yaml
> >> new file mode 100644
> >> index 0000000000000000000000000000000000000000..ee0849eeeaba840cf43c81d69449c631ad1c6a6a
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/media/renesas,rzv2h-ivc.yaml
> >> @@ -0,0 +1,103 @@
> >> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/media/renesas,rzv2h-ivc.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: Renesas RZ/V2H Input Video Control Block
> >> +
> >> +maintainers:
> >> +  - Daniel Scally <dan.scally@ideasonboard.com>
> >> +
> >> +description:
> >> +  The IVC block is a module that takes video frames from memory and feeds them
> >> +  to the Image Signal Processor for processing.
> >> +
> >> +properties:
> >> +  compatible:
> >> +    const: renesas,rzv2h-ivc
> > No, you cannot use generic compatibles. See writing bindings (or
> > basically every review from DT maintainers).
>
>
> OK...to throw a spanner into this, I think there's actually two soc codes with the IP; r9a09g057h44
> and r9a09g057h48. renesas,rzg2l-cru.yaml and renesas,rzg2l-csi2.yaml seem to use the 'generic' code
> in a way that suggests this:

Do you need to distinguish between r9a09g057h44 and r9a09g057h48 for
the IVC block? Isn't renesas,r9a09g057-ivc good enough?

https://elixir.bootlin.com/linux/v6.15.3/source/Documentation/devicetree/bindings/soc/renesas/renesas.yaml#L554

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

