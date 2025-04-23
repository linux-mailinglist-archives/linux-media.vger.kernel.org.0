Return-Path: <linux-media+bounces-30791-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 338F2A98875
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 13:24:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC0F13B804D
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 11:24:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95AB326F475;
	Wed, 23 Apr 2025 11:24:43 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A6191FF5E3;
	Wed, 23 Apr 2025 11:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745407483; cv=none; b=qHBX7GiVCcdOLE6i37BQ/xubUq0fKmem8NqCnyG6L9pecMzczbXEPpmkjARw/DchQaSs2wCS5CLUpk56JJ8bNSk6PmxLnv6dcMP/vHw98asX+intDB1VTF6fpraqSUuLnVnckJ0V4j7nT1PYbtvGInBxf7PNg2Hq0uQSw1poyEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745407483; c=relaxed/simple;
	bh=8aEZyewUXfrnmqhvKqZ0K7+fHWQclNvbr7lhUzdXxp0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J00Gf9jUUvl+NwYOk0++ax65kCOwGkYIqVDrb7X1KrEQHZQyZy3yKPrzB/JdcIIer7XE9NqYEZ1/68jbsgYJ/QjdlegbvIvS934/MFpecKFubtaXSeZ8luD51zdUtWwBFwA5V3aozWCVPGsKOi5uHJpfYlGqB36aMjpqHu0J0vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-523f670ca99so2255677e0c.1;
        Wed, 23 Apr 2025 04:24:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745407479; x=1746012279;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4maj1pzgGpxC7pMxTXMAwmFvdy2FueKzcza9CY+FFpw=;
        b=QYOUgw1RAjUaEgmMuupzwcVFHMY9j5QLApjNbG7KafH0zsvUs/sczR0Uw8ab7Myvex
         +2RolciM3kXbpsdpo91KRDDx6aixcFhBoWkVfeF2nTZG1M9+Xz/py4O9mb3XTF8ws4H/
         qqxcNrcORW+GeVjcEQ6+lcx2tlEbhH0i1A/vzMeNs2qEzdJ4191npf2L8lwUPI+6Ux+m
         BXzXSh7gkQxMRcI5hLG/amqjGuWatofFw2gZJahcPsoH4HzH1V/PCDU/KX6b0rNWoWOM
         /KU0mlZx65rhzEkJI8LVa2XkEH6W5WkH/dQSfNDhfdOTCTvkJZjE1XKeCISDlyl34tE4
         Q6nA==
X-Forwarded-Encrypted: i=1; AJvYcCUEkA01MVvaZzWdEKGxtkuqbfAlkArhuj6sSsRUpDhZJbi+3I8s7ayKReN9375iXHqEqcer+XyNCkDLCUE=@vger.kernel.org, AJvYcCVnEsJwGysnKS4lxZjWbvInCfymdCpoRSn8tJF8o/+h4H0AZUQydSHDlTa41RbDzwbQAgFVOwePSw67uRJd2TgCOoQ=@vger.kernel.org, AJvYcCVtgVFvSPIgxMX+oFvJ2w1aA5GB8KoMMc55X9Xwd6TaJRYcXSx7B4tdobyhH2xeHhWfapbFIYOxQbCk@vger.kernel.org
X-Gm-Message-State: AOJu0YyFB49q5O8I4qpgCOg3CpwKu4YfgyvWFFUzgiFHhfaEx52/e66C
	98Auu+i6Ye6hq/6h977BK8HMzu0L5dokQLPkjgVZoKIEaQ1e+m24FMtYQIDCYSU=
X-Gm-Gg: ASbGncvymRREE5igVr94ygnBmKgZW+S1O4jKxC11NjYuznXxY/6Ff2cQpB49n4EDyhz
	XU+/of3yOCnA66UOnHvK58sgDtkKCLykPdZuOBrHf8WxPprIhy2afgd2N4Pd44j9WwK2wC8qVaw
	oCyPPUnwwFM/vclomVH6NIWg/eRVBn9uvmrct3N+jd9a5k+AgTGJGjZDdoaOWCWAkI9zk6EeHam
	0YJZBPnbDV4wX6CX5vcehowPiTrf9e7FDx+hL5lyilVoPQGfm0CcEehJIgXrI3x753ecODV5Fe+
	1Vp2nmfzGEEHTRfZ9el8TQE7127uknvN0h7s3rDHm36n0fZAuPIjPRPDkLPRzi0k7LqnuA21LTF
	jwdE=
X-Google-Smtp-Source: AGHT+IHiHNcRzJKNldpJS8Xc402NVNtMnalympuOabpq6/Q+wiSGiX7CfUhkm8bCNYPL8b+M1lYmng==
X-Received: by 2002:a05:6122:8c26:b0:520:3e1c:500f with SMTP id 71dfb90a1353d-5292549fc45mr13228909e0c.8.1745407479191;
        Wed, 23 Apr 2025 04:24:39 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52922bec16asm2295744e0c.2.2025.04.23.04.24.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 04:24:38 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-8778151ddc5so1230608241.2;
        Wed, 23 Apr 2025 04:24:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUKifQm0RptFhrVTtkeoJ5Xaimm6EIeZaoHNXXsNlAW1bu/Bwgm8/nT97eOVeFlyJXixPhCKHWyDTON3w4RnHYLmik=@vger.kernel.org, AJvYcCWGkleNFaDDpv7EvIMXqBdIYllWRvA15oKrIKBA6tIEL/G2m4bPKet5VeOfvrxXWWFCGZQna1YHbhaSXIE=@vger.kernel.org, AJvYcCWuN+KQpTyJnW/hso+Yu8O/42Rsn5eZ8B7nyloa58D2dB7NfsRTUtRAJkXOkz+hUexi/ikLxEUOlD9j@vger.kernel.org
X-Received: by 2002:a05:6102:6a89:b0:4bb:c490:7d6c with SMTP id
 ada2fe7eead31-4cb8011c06amr10950575137.9.1745407477842; Wed, 23 Apr 2025
 04:24:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250421111240.789510-1-niklas.soderlund+renesas@ragnatech.se> <20250421111240.789510-2-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20250421111240.789510-2-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Apr 2025 13:24:25 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVJ=KaF-sJEga9kLbdFdkhKDGDPkacTOn-D-2E7dQY7dw@mail.gmail.com>
X-Gm-Features: ATxdqUFaZVs59k_xpDrz2f4Zekcm39G8UUdFr3Tbp2NjK3L1IVks92DIncGnbRQ
Message-ID: <CAMuHMdVJ=KaF-sJEga9kLbdFdkhKDGDPkacTOn-D-2E7dQY7dw@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] dt-bindings: media: renesas,isp: Add ISP core
 function block
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hans Verkuil <hverkuil@xs4all.nl>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

On Mon, 21 Apr 2025 at 13:12, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Some R-Car ISP instances have in addition to the channel selector (CS)
> an ISP core (CORE )to perform operations on an image stream. The core
> function is mapped to a different memory region and have a separate
> interrupt then CS, extend the bindings to allow describing this.
>
> On the same SoC different instances of the ISP IP may have, or not have,
> the CORE functionality. The CS function on all instances on the SoC are
> the same and the documentation describes the full ISP (CS + CORE) as a
> single IP block. Where instances not having the CORE function simple
> lacking the functionality to modify the image data. There dependencies
> on the CS functionality while operating the CORE functionality.
>
> In order for the ISP core to function in memory-to-memory mode it needs
> to be feed input data from a Streaming Bridge interface. This interface
> is provided thru the VSP-X device. Add an optional new property
> "renesas,vspx" to provide a phandle to describe this relationship.
>
> While adding mandatory reg-names and interrupt-names breaks existing
> bindings the driver itself remains backward compatible and provides CS
> functionality if a single unnamed reg and interrupt property is present.
> Furthermore all existing users of the bindings are updated in following
> work to add these new mandatory properties.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>
> ---
> * Changes since v1
> - Extend the commit message to make it explicit that different ISP
>   instances on the same SoC (same compatible value) can have, or not
>   have, a CORE function block attached.
> - Update documentation for renesas,vspx property.
> - Update example to cover all new properties.

Thanks for the update!

> --- a/Documentation/devicetree/bindings/media/renesas,isp.yaml
> +++ b/Documentation/devicetree/bindings/media/renesas,isp.yaml

> @@ -119,11 +159,18 @@ examples:
>
>      isp1: isp@fed20000 {
>              compatible =3D "renesas,r8a779a0-isp", "renesas,rcar-gen4-is=
p";
> -            reg =3D <0xfed20000 0x10000>;
> -            interrupts =3D <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
> -            clocks =3D <&cpg CPG_MOD 613>;
> +            reg =3D <0xfed20000 0x10000>, <0xfee00000 0x10000>;

IThe second size should be 0x100000.

> +            reg-names =3D "cs", "core";
> +            interrupts =3D <GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
> +            interrupt-names =3D "cs", "core";
> +            clocks =3D <&cpg CPG_MOD 613>, <&cpg CPG_MOD 17>;
> +            clock-names =3D "cs", "core";
>              power-domains =3D <&sysc R8A779A0_PD_A3ISP01>;

With the above and the wording issues pointed out by Laurent fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

