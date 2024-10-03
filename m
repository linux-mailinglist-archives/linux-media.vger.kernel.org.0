Return-Path: <linux-media+bounces-19072-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A6098F808
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2024 22:24:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 34DE9283161
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2024 20:24:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51DB31AE850;
	Thu,  3 Oct 2024 20:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AN44YwJb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A58A12FB0A;
	Thu,  3 Oct 2024 20:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727987037; cv=none; b=e0x419DquNshcKcYMee+mKQ6ExDezYDohjjk3ZC+7Br27NaI3b8F2BtBHW/v8q16894E/9Am3O9L6InIgrw2R2rEXgZRIrKHnb22bZc63h/i62Bw+Y8ysNBJZlQXb/MV4I9W8xdip8uNo3eG2PH8ij2LYltgTUBSqbBC6gr+Rbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727987037; c=relaxed/simple;
	bh=fHrljC1cbimfaIYZl/aLSQHuG75jaqp+nfpP30V829o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IQCYzRjOyGeq9p/ExKMpw6FjMziaSwUGwTY1ZRI2P+znu3aQROH9f/3NZC/Aoyg9MwXWGa8M+zywaEHaC+1cNrJBkvENekqIxXniG3qJNkJVaWAA75abaePuzymFNQScH0dRd6ZwFKO67IpFXa/cVhHSD9Ro1J7P4MCoFPA1EGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AN44YwJb; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-84ea1042bbeso458867241.0;
        Thu, 03 Oct 2024 13:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727987035; x=1728591835; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W89/XGzlUFbcD2s4YxguSEHbjtXcozAY1LiFzqSlfxw=;
        b=AN44YwJbN5WlOZdyYDoSsZthJAgYIwrfDZnZoDtrXYU3wFU2ZzBjrzQhX72prpLi0U
         i8pbMD5gGDN+x65ILPoRby61bZGxb2VyOgQdpT3w3mvMq73dyrQGpPLxxJVy3oeEAzbU
         9Se318hlCsx6vKm22tmWgYXV49vTG8xw76fotn5nUZXoCch1KITYHMEWHNi6PFWgDkpi
         ybuCI0CUh0uSdPMqwXnBwpt2mOtp9DWLBG1XmCmv9tGM5SpUk51MRP6KQAAjmJcH2Xum
         dMM3/3S+MbwVTdej02CSX6PxKZu9y8EBv+kIgDCSf+SbyDcD+LVPmXlWhayjtB42ynAM
         xskA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727987035; x=1728591835;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W89/XGzlUFbcD2s4YxguSEHbjtXcozAY1LiFzqSlfxw=;
        b=vYlsJ6Hv41le45WO6X5ZvMdDM9fe1K0oOXskjQMvLYsbmdAhlwIqS5kGAb0Kpbjdrt
         Lcb0beeqiy9Frr7ys1NCDDxIgUY5QiuhfOL2h21wzO/LUnT4Ydkyy45Y1B5KFJC04HM+
         cYEBKitgmPI+IdNKcWeo7xVOfZNKQvLSzbcaCcc14htCO9XcXyJFJwwonPKRpnXeM0Qv
         SLHAFDyqIWqaOsq+7oaMn/RN0leZrPRWufr8xLrgJBGJsbOqEfnlDpfV6pFF1DDk/p+k
         nQNh0DTIiqSHfZglyAhKnfmIkvoiCsanhXseJuLAGygs6iJsou0xkPD8Fkoe7mYeZaLb
         AXEA==
X-Forwarded-Encrypted: i=1; AJvYcCUZyYCxx6OE+tJTQOdCXBlwTXqaebMDTPrl13ajT0riyz4KOetUQj4F+KSZKdPo56MDVaYM9/hGV+bRWpo=@vger.kernel.org, AJvYcCWhvD+iXW+9T0+a+pfkgkd/9HOGMWthtjdG2R8SssKctKB+JqTliyeUjJ4QI5zemeZ9owPUyy3ydtm6hU74N708fVQ=@vger.kernel.org, AJvYcCX1kODF6xFaanaWCwO+IssbHifOZB/YBxoy12LFhl0uPtbeHGVHFdNgsghHrTmuvOP+K0RfaTTgSDCgwnM=@vger.kernel.org
X-Gm-Message-State: AOJu0YynWBo0veyWDQbHRvRoyV4svwseNYeM/376UIDUns6VbG6y/CFh
	acMrlVmnmwyJCWJFfaUY4Q5OitY3GWN/g9kh1ZJuMOS23pTx499/l5qquq/a7MN/zJUNZmvkUoH
	4VXsAl3DJc2ASSLDYYI6eHS1hEXc=
X-Google-Smtp-Source: AGHT+IEIlAGQiFPo2w9JDgxfuRMfkJj9MwovLNf78q0pz5r7659J53Ie+sYVMqPNovV8a1HN4woQo5ax8LlWw3nAe1o=
X-Received: by 2002:a05:6122:3119:b0:50a:c6f5:e672 with SMTP id
 71dfb90a1353d-50c855b1cf1mr558621e0c.13.1727987034816; Thu, 03 Oct 2024
 13:23:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241001140919.206139-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20241001140919.206139-18-prabhakar.mahadev-lad.rj@bp.renesas.com> <20241003143653.GB5484@pendragon.ideasonboard.com>
In-Reply-To: <20241003143653.GB5484@pendragon.ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 3 Oct 2024 21:23:29 +0100
Message-ID: <CA+V-a8vNs22ittNMha5uv0ybw5eusqSVsFQ3qPCwF=D6RcktNg@mail.gmail.com>
Subject: Re: [PATCH v3 17/17] media: rzg2l-cru: Move register definitions to a
 separate file
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Laurent,

Thank you for the review.

On Thu, Oct 3, 2024 at 3:36=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Prabhakar,
>
> Thank you for the patch.
>
> On Tue, Oct 01, 2024 at 03:09:19PM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Move the RZ/G2L CRU register definitions from `rzg2l-video.c` to a
> > dedicated header file, `rzg2l-cru-regs.h`. Separating these definitions
> > into their own file improves the readability of the code.
> >
> > Suggested-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.c=
om>
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v2->v3
> > - New patch
> > ---
> >  .../renesas/rzg2l-cru/rzg2l-cru-regs.h        | 79 +++++++++++++++++++
> >  .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 69 +---------------
> >  2 files changed, 80 insertions(+), 68 deletions(-)
> >  create mode 100644 drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-=
regs.h
> >
> > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h =
b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h
> > new file mode 100644
> > index 000000000000..458f7452e5d3
> > --- /dev/null
> > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h
> > @@ -0,0 +1,79 @@
> > +/* SPDX-License-Identifier: GPL-2.0+ */
> > +/*
> > + * rzg2l-cru-regs.h--RZ/G2L (and alike SoCs) CRU Registers Definitions
> > + *
> > + * Copyright (C) 2024 Renesas Electronics Corp.
> > + */
> > +
> > +#ifndef __RZG2L_CRU_REGS_H__
> > +#define __RZG2L_CRU_REGS_H__
> > +
> > +/* HW CRU Registers Definition */
> > +
> > +/* CRU Control Register */
> > +#define CRUnCTRL                     0x0
> > +#define CRUnCTRL_VINSEL(x)           ((x) << 0)
> > +
> > +/* CRU Interrupt Enable Register */
> > +#define CRUnIE                               0x4
> > +#define CRUnIE_EFE                   BIT(17)
> > +
> > +/* CRU Interrupt Status Register */
> > +#define CRUnINTS                     0x8
> > +#define CRUnINTS_SFS                 BIT(16)
> > +
> > +/* CRU Reset Register */
> > +#define CRUnRST                              0xc
> > +#define CRUnRST_VRESETN                      BIT(0)
> > +
> > +/* Memory Bank Base Address (Lower) Register for CRU Image Data */
> > +#define AMnMBxADDRL(x)                       (0x100 + ((x) * 8))
> > +
> > +/* Memory Bank Base Address (Higher) Register for CRU Image Data */
> > +#define AMnMBxADDRH(x)                       (0x104 + ((x) * 8))
> > +
> > +/* Memory Bank Enable Register for CRU Image Data */
> > +#define AMnMBVALID                   0x148
> > +#define AMnMBVALID_MBVALID(x)                GENMASK(x, 0)
> > +
> > +/* Memory Bank Status Register for CRU Image Data */
> > +#define AMnMBS                               0x14c
> > +#define AMnMBS_MBSTS                 0x7
> > +
> > +/* AXI Master Transfer Setting Register for CRU Image Data */
> > +#define AMnAXIATTR                   0x158
> > +#define AMnAXIATTR_AXILEN_MASK               GENMASK(3, 0)
> > +#define AMnAXIATTR_AXILEN            (0xf)
> > +
> > +/* AXI Master FIFO Pointer Register for CRU Image Data */
> > +#define AMnFIFOPNTR                  0x168
> > +#define AMnFIFOPNTR_FIFOWPNTR                GENMASK(7, 0)
> > +#define AMnFIFOPNTR_FIFORPNTR_Y              GENMASK(23, 16)
> > +
> > +/* AXI Master Transfer Stop Register for CRU Image Data */
> > +#define AMnAXISTP                    0x174
> > +#define AMnAXISTP_AXI_STOP           BIT(0)
> > +
> > +/* AXI Master Transfer Stop Status Register for CRU Image Data */
> > +#define AMnAXISTPACK                 0x178
> > +#define AMnAXISTPACK_AXI_STOP_ACK    BIT(0)
> > +
> > +/* CRU Image Processing Enable Register */
> > +#define ICnEN                                0x200
> > +#define ICnEN_ICEN                   BIT(0)
> > +
> > +/* CRU Image Processing Main Control Register */
> > +#define ICnMC                                0x208
> > +#define ICnMC_CSCTHR                 BIT(5)
> > +#define ICnMC_INF(x)                 ((x) << 16)
> > +#define ICnMC_VCSEL(x)                       ((x) << 22)
> > +#define ICnMC_INF_MASK                       GENMASK(21, 16)
> > +
> > +/* CRU Module Status Register */
> > +#define ICnMS                                0x254
> > +#define ICnMS_IA                     BIT(2)
> > +
> > +/* CRU Data Output Mode Register */
> > +#define ICnDMR                               0x26c
>
> The ICnDMR_YCMODE_UYVY macro from
> drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h should also be
> moved here. With that,
>
Agreed, I'll move ICnDMR_YCMODE_UYVY macro here.

Cheers,
Prabhakar

> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>
> > +
> > +#endif /* __RZG2L_CRU_REGS_H__ */
> > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/d=
rivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > index c3d10b001b7c..d7c82c7b9044 100644
> > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > @@ -20,74 +20,7 @@
> >  #include <media/videobuf2-dma-contig.h>
> >
> >  #include "rzg2l-cru.h"
> > -
> > -/* HW CRU Registers Definition */
> > -
> > -/* CRU Control Register */
> > -#define CRUnCTRL                     0x0
> > -#define CRUnCTRL_VINSEL(x)           ((x) << 0)
> > -
> > -/* CRU Interrupt Enable Register */
> > -#define CRUnIE                               0x4
> > -#define CRUnIE_EFE                   BIT(17)
> > -
> > -/* CRU Interrupt Status Register */
> > -#define CRUnINTS                     0x8
> > -#define CRUnINTS_SFS                 BIT(16)
> > -
> > -/* CRU Reset Register */
> > -#define CRUnRST                              0xc
> > -#define CRUnRST_VRESETN                      BIT(0)
> > -
> > -/* Memory Bank Base Address (Lower) Register for CRU Image Data */
> > -#define AMnMBxADDRL(x)                       (0x100 + ((x) * 8))
> > -
> > -/* Memory Bank Base Address (Higher) Register for CRU Image Data */
> > -#define AMnMBxADDRH(x)                       (0x104 + ((x) * 8))
> > -
> > -/* Memory Bank Enable Register for CRU Image Data */
> > -#define AMnMBVALID                   0x148
> > -#define AMnMBVALID_MBVALID(x)                GENMASK(x, 0)
> > -
> > -/* Memory Bank Status Register for CRU Image Data */
> > -#define AMnMBS                               0x14c
> > -#define AMnMBS_MBSTS                 0x7
> > -
> > -/* AXI Master Transfer Setting Register for CRU Image Data */
> > -#define AMnAXIATTR                   0x158
> > -#define AMnAXIATTR_AXILEN_MASK               GENMASK(3, 0)
> > -#define AMnAXIATTR_AXILEN            (0xf)
> > -
> > -/* AXI Master FIFO Pointer Register for CRU Image Data */
> > -#define AMnFIFOPNTR                  0x168
> > -#define AMnFIFOPNTR_FIFOWPNTR                GENMASK(7, 0)
> > -#define AMnFIFOPNTR_FIFORPNTR_Y              GENMASK(23, 16)
> > -
> > -/* AXI Master Transfer Stop Register for CRU Image Data */
> > -#define AMnAXISTP                    0x174
> > -#define AMnAXISTP_AXI_STOP           BIT(0)
> > -
> > -/* AXI Master Transfer Stop Status Register for CRU Image Data */
> > -#define AMnAXISTPACK                 0x178
> > -#define AMnAXISTPACK_AXI_STOP_ACK    BIT(0)
> > -
> > -/* CRU Image Processing Enable Register */
> > -#define ICnEN                                0x200
> > -#define ICnEN_ICEN                   BIT(0)
> > -
> > -/* CRU Image Processing Main Control Register */
> > -#define ICnMC                                0x208
> > -#define ICnMC_CSCTHR                 BIT(5)
> > -#define ICnMC_INF(x)                 ((x) << 16)
> > -#define ICnMC_VCSEL(x)                       ((x) << 22)
> > -#define ICnMC_INF_MASK                       GENMASK(21, 16)
> > -
> > -/* CRU Module Status Register */
> > -#define ICnMS                                0x254
> > -#define ICnMS_IA                     BIT(2)
> > -
> > -/* CRU Data Output Mode Register */
> > -#define ICnDMR                               0x26c
> > +#include "rzg2l-cru-regs.h"
> >
> >  #define RZG2L_TIMEOUT_MS             100
> >  #define RZG2L_RETRIES                        10
>
> --
> Regards,
>
> Laurent Pinchart

