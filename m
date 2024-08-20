Return-Path: <linux-media+bounces-16527-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 05384957FE6
	for <lists+linux-media@lfdr.de>; Tue, 20 Aug 2024 09:36:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 863301F22E91
	for <lists+linux-media@lfdr.de>; Tue, 20 Aug 2024 07:36:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E25181898E1;
	Tue, 20 Aug 2024 07:35:13 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB301667ED;
	Tue, 20 Aug 2024 07:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724139313; cv=none; b=hfl03DmLr3dY80cCtInMlHBleoZKU7hHN5wJjlE6U5929MtRTN91dBly7CqbjK0ezodUgdKpkdvlBkJTtBy+MiBnDR9tFVfZ0xmDmkZx4xbD2BZS444aqOqTyzW0wEF36t7TUzbDoKJ4kV30kJ2nZCL7b7bbRNewyVs+RrkTPOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724139313; c=relaxed/simple;
	bh=n2dSc7kV2NynpTEG/oh56PHjqjhQv+rOsObLY+KgHY4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CFb/soQ0toQ1alvC3KR++5vWCdlxdMDI35c0wpm2Ff3FqjAqj8S+DWm09Ct8em2kMY8NpT9AtQNIt124Pqc7oAqQrUuz+ZmtzdprykeulHKxSZSHJ1ALQZpauMzBNNc493VaJTLfVK2aUXXMeZ63Hns7te7d73VmIi2kwDoaF6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e116d2f5f7fso3584602276.1;
        Tue, 20 Aug 2024 00:35:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724139310; x=1724744110;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P0RS+DfOTdHedfK4BwC9kmKzZ20XxIqiVeJBqXxrrwI=;
        b=oYTc4BPOSISM5tHJlEoa7dDgOGd94dvwbyMRujk4dgq8E/BeR3Pj4Q/b80S2zr3YdD
         bcu+RR0UZ9wSr49zKY5pCpxLgARbYnKkzmAeIYs9/JYxWBVxtKWLFKAjXw/pCOlpxY93
         4QKHQ8Ug+MT9DfKqgPG9o0nVvPiAwRGq+uQk/Kiu9RcXUoqF++S9hq/bnrAimX6D2b8v
         huklzo0MFtH5LoKpyucRG4llxALeDMlJBk48f6Ev27gp+83MnsWY5+4K9TJkDZJxuS2J
         R2dsbqNIR0x41MO6olzOojPO4jWJ2cLFO4JOJ6Ci+/o7iazRNz5DUhXljSOGqajIV0Zq
         NFcQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRwus1dTXd8Hfp5jN7RDj/eYP+fesYTh0rqfTvDomxkaidX8nwbpKRIdP9F7dHLLVE3GCSFaN3OIGk6zg=@vger.kernel.org, AJvYcCX1ICIVoD868SMFRdNsF2X/ZZTPooWQj+CNxnCjxH3P5S/scPAWcIQVd8xiPAIjU90yJGXliA54cGoo@vger.kernel.org, AJvYcCXe+b9uvGNHEXraLEl6pnGl8h+QojhSOA5mWRWUur8KkOmCgMAKvtRRV5T3eFN0t6IJsRmGUy4SOk4A3ZMki2rWpUg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4AGfe7QVpZKpyfc/DUMHFEcMvjsN1R1EVNSCva3RCK3sjbndG
	6hszzIjqyEzwySNNFaJqdl2o6urkDA2OgODfZlS+JxIdzZpr+x0vIaTJY8HbOVw=
X-Google-Smtp-Source: AGHT+IGBZGAQ97xIOBr2P9lJbEYA8ideM2g5FbXRRhVmUbAVpMJCaUyCg9VTC6c/yn4P0Uk5xvU/lg==
X-Received: by 2002:a05:6902:2206:b0:e11:446b:d43b with SMTP id 3f1490d57ef6-e164a97e8ccmr1692348276.16.1724139309721;
        Tue, 20 Aug 2024 00:35:09 -0700 (PDT)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e1171e709e1sm2486423276.34.2024.08.20.00.35.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Aug 2024 00:35:09 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6bada443ffeso12086477b3.0;
        Tue, 20 Aug 2024 00:35:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVgMy/Co/I8hskvouhk7UDVs4lSBBjmRnh4aCtdem6+xi9tIaoO71HtOJz98nbWLZlazhft4hqsrGVZ@vger.kernel.org, AJvYcCX9smN99uE44DIJ+FbE8OMiSICoNxRLkUsZNy2vwOR74lyp4/xWPzJ5kDnDa2mBRGg56J04PCKAWn8Xxq8XJQT5Rmc=@vger.kernel.org, AJvYcCXO5uqXNSrvWrJ5DbUXw4s/sdTNivBWdIZfOEM5cB/NHgHLimHLB7isTz01Fcm9hCuMR6x5CZ88C9VmCXU=@vger.kernel.org
X-Received: by 2002:a05:690c:f:b0:6a9:5953:a659 with SMTP id
 00721157ae682-6bdd09092ddmr14596397b3.18.1724139309116; Tue, 20 Aug 2024
 00:35:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240704161620.1425409-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20240704161620.1425409-1-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Aug 2024 09:34:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUjSquBji5+UVACLaWdMhbq5EEkiUANc9LeR5d_1BvkFw@mail.gmail.com>
Message-ID: <CAMuHMdUjSquBji5+UVACLaWdMhbq5EEkiUANc9LeR5d_1BvkFw@mail.gmail.com>
Subject: Re: [PATCH v5 0/6] rcar-vin: Add support for R-Car V4M
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	helpdesk <helpdesk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 4, 2024 at 6:16=E2=80=AFPM Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> This series adds bindings and support to rcar-vin for R-Car V4M by the
> means of adding a Gen4 family fallback compatible.
>
> Previous versions of this series added V4M support like done for VIN
> since the first Gen3 device, by the use of only a single SoC specific
> compatible value. This was done as in Gen3 almost every new device
> differed from the others and a family fallback was not very useful.
>
> For the Gen4 devices with a video capture pipeline currently documented
> the VIN instances are very similar and a family fallback can be used.
> This however requires updating existing DTS files to add this new family
> fallback. This is done in a backward compatible way and the driver
> retains the compatible values.
>
> See individual patches for changes since previous versions.
>
> Niklas S=C3=B6derlund (6):
>   dt-bindings: media: renesas,vin: Add Gen4 family fallback
>   arm64: dts: renesas: r8a779g0: Add family fallback for VIN IP
>   arm64: dts: renesas: r8a779a0: Add family fallback for VIN IP
>   media: rcar-vin: Add family compatible for R-Car Gen4 family
>   dt-bindings: media: renesas,vin: Add binding for V4M
>   arm64: dts: renesas: r8a779h0: Add family fallback for VIN IP

Any chance the media parts can be accepted, so I can take the DTS
patches through the Renesas tree?

BTW, running b4 seems to add two bogus Acked-by tags from Conor:

$ b4 am 20240704161620.1425409-3-niklas.soderlund+renesas@ragnatech.se
Analyzing 7 messages in the thread
Analyzing 14 code-review messages
Checking attestation on all messages, may take a moment...
---
  =E2=9C=97 [PATCH v5 1/6] dt-bindings: media: renesas,vin: Add Gen4 family=
 fallback
  =E2=9C=97 [PATCH v5 2/6] arm64: dts: renesas: r8a779g0: Add family fallba=
ck for VIN IP
    + Acked-by: Conor Dooley <conor.dooley@microchip.com> (=E2=9C=93 DKIM/k=
ernel.org)
  =E2=9C=97 [PATCH v5 3/6] arm64: dts: renesas: r8a779a0: Add family fallba=
ck for VIN IP
  =E2=9C=97 [PATCH v5 4/6] media: rcar-vin: Add family compatible for R-Car=
 Gen4 family
  =E2=9C=97 [PATCH v5 5/6] dt-bindings: media: renesas,vin: Add binding for=
 V4M
  =E2=9C=97 [PATCH v5 6/6] arm64: dts: renesas: r8a779h0: Add family fallba=
ck for VIN IP
    + Acked-by: Conor Dooley <conor.dooley@microchip.com> (=E2=9C=93 DKIM/k=
ernel.org)

I cannot find these Acks in my inbox or on lore.
What's happening?

Thanks!

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

