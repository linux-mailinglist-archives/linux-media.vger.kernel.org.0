Return-Path: <linux-media+bounces-1658-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D89E805373
	for <lists+linux-media@lfdr.de>; Tue,  5 Dec 2023 12:49:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 770FEB20C81
	for <lists+linux-media@lfdr.de>; Tue,  5 Dec 2023 11:49:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE36959B5F;
	Tue,  5 Dec 2023 11:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mFFwe97a"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60FF8197;
	Tue,  5 Dec 2023 03:49:42 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-2866e4ac34bso3018067a91.1;
        Tue, 05 Dec 2023 03:49:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701776982; x=1702381782; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AZT8TEnCg17hGz9D9aoXrHaxFJW7dZSsSL0dlLW7alA=;
        b=mFFwe97aq+ILQKLPguySsTxa42fQPgD+JLNTuYiJBCZ6iNIXP6FGQ6zTXiiFX8vNAZ
         14gBvXhNXodxkGavFwycVFP29RbVG+vMSLX1LDlaweIQQoexi+UYkbEjUzIIFf230Y26
         A76FKUXhH2RCsrihsF6JJt6etSE9oJ0WJRiXi1L7eMjGWO4qMxDao5nuJ+rMM4C+Giz7
         llmIP51ILndpuWl7Gz0EfhWKVpgpEOQ+qhocIzTehZMHJ2fXcCo6/Ash7YV06MFKrfek
         qt97ORB0Kg7oZ08mXm7M5O6/JZUdvC+0S8qsLFx/Huzz6lHhkq+rFZON0dVv4P6vw0Wq
         Lg/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701776982; x=1702381782;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AZT8TEnCg17hGz9D9aoXrHaxFJW7dZSsSL0dlLW7alA=;
        b=EN9AGwhtYb1WrcIl42OlvaidqwOkHmsP2K86ChRbDpa7/kZavo2B6bJhK9XFyztpyv
         6SpQ83fOrwegtiIZj5XrDiwoErqnm//X9qNmljHb99jCpb20lnyHlNWy/xf+fagEonEq
         fii5cIIkj1fhB3AKH5P3lbQXUtQe767n6H4JNpDnj9FOwetECjPc6XZHm3ynN6EtxHc8
         W7UsIkJXD9MGI0DbQgM8dow0gydU6NZIF1Y7Mh50tdH9pKQcbwoJHcp0fEoShocj46bX
         /foMu9k3oeg2tDLg+dempSbW1P9bDV6ZIu2opad1gWh0a6+tv+VjqIaX4rHY9R12cqNr
         iwhA==
X-Gm-Message-State: AOJu0Yyr0nIReDhWzCr9i/CtAcW2vgm8X+PQrY/LwFO0Q+pbB++gSx7e
	iUBaGyethzByVpexsZIESi4imGbTW2H2qyKFC8Y=
X-Google-Smtp-Source: AGHT+IG903dRK3fpmzorknhqflxmGtrEN3N6ciA43936wmipN8Wx0WOb2f34obKGBajrjmRKTcYOuA9io5J79XOeZ40=
X-Received: by 2002:a17:90b:3912:b0:285:fc67:6164 with SMTP id
 ob18-20020a17090b391200b00285fc676164mr1032342pjb.5.1701776981534; Tue, 05
 Dec 2023 03:49:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231205-rkisp-irq-fix-v1-0-f4045c74ba45@ideasonboard.com>
 <20231205-rkisp-irq-fix-v1-3-f4045c74ba45@ideasonboard.com>
 <20231205082016.GA17394@pendragon.ideasonboard.com> <9b28dcf7-c9a0-4d68-9197-cdcdd9f0393b@ideasonboard.com>
In-Reply-To: <9b28dcf7-c9a0-4d68-9197-cdcdd9f0393b@ideasonboard.com>
From: Adam Ford <aford173@gmail.com>
Date: Tue, 5 Dec 2023 05:49:30 -0600
Message-ID: <CAHCN7xKdCixYtFE=NrfLiLNjZrV5Xrg27fMMTrdA_7-Tg9Ujfg@mail.gmail.com>
Subject: Re: [PATCH 3/4] media: rkisp1: Fix IRQ handling due to shared interrupts
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Dafna Hirschfeld <dafna@fastmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Paul Elder <paul.elder@ideasonboard.com>, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, kieran.bingham@ideasonboard.com, 
	umang.jain@ideasonboard.com, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 5, 2023 at 2:27=E2=80=AFAM Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
>
> On 05/12/2023 10:20, Laurent Pinchart wrote:
> > Hi Tomi,
> >
> > Thank you for the patch.
> >
> > On Tue, Dec 05, 2023 at 10:09:34AM +0200, Tomi Valkeinen wrote:
> >> The driver requests the interrupts as IRQF_SHARED, so the interrupt
> >> handlers can be called at any time. If such a call happens while the I=
SP
> >> is powered down, the SoC will hang as the driver tries to access the
> >> ISP registers.
> >
> > Is IRQF_SHARED actually needed ?
>
> I don't have any answer to that, but it seems to have always been there.
> Dropping it would simplify the code, but we can only do that if we are
> sure all the platforms the ISP is used on or will be used on won't share
> the interrupt.

I can't speak for the Rockchip, but from what I can see, the imx8mp
has multiple causes for Interrupt 74 and  75, but they all appear to
be ISP1 and ISP2 related.

adam
>
>   Tomi
>
> >> Fix this by adding a new field, 'irqs_enabled', which is used to bail
> >> out from the interrupt handler when the ISP is not operational.
> >>
> >> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> >> ---
> >>   .../media/platform/rockchip/rkisp1/rkisp1-capture.c |  3 +++
> >>   .../media/platform/rockchip/rkisp1/rkisp1-common.h  |  2 ++
> >>   drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c |  3 +++
> >>   drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c | 21 +++++++++++=
++++++++++
> >>   drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c |  3 +++
> >>   5 files changed, 32 insertions(+)
> >>
> >> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b=
/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> >> index b50b044d22af..e92067897f28 100644
> >> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> >> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> >> @@ -779,6 +779,9 @@ irqreturn_t rkisp1_capture_isr(int irq, void *ctx)
> >>      unsigned int i;
> >>      u32 status;
> >>
> >> +    if (!rkisp1->irqs_enabled)
> >> +            return IRQ_NONE;
> >> +
> >>      status =3D rkisp1_read(rkisp1, RKISP1_CIF_MI_MIS);
> >>      if (!status)
> >>              return IRQ_NONE;
> >> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/=
drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> >> index ec28907d978e..7f97fdf6e24c 100644
> >> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> >> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> >> @@ -465,6 +465,7 @@ struct rkisp1_debug {
> >>    * @debug:    debug params to be exposed on debugfs
> >>    * @info:     version-specific ISP information
> >>    * @irqs:          IRQ line numbers
> >> + * @irqs_enabled:  the hardware is enabled and can cause interrupts
> >>    */
> >>   struct rkisp1_device {
> >>      void __iomem *base_addr;
> >> @@ -488,6 +489,7 @@ struct rkisp1_device {
> >>      struct rkisp1_debug debug;
> >>      const struct rkisp1_info *info;
> >>      int irqs[RKISP1_NUM_IRQS];
> >> +    bool irqs_enabled;
> >>   };
> >>
> >>   /*
> >> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c b/dri=
vers/media/platform/rockchip/rkisp1/rkisp1-csi.c
> >> index 47f4353a1784..f6b54654b435 100644
> >> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
> >> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
> >> @@ -184,6 +184,9 @@ irqreturn_t rkisp1_csi_isr(int irq, void *ctx)
> >>      struct rkisp1_device *rkisp1 =3D dev_get_drvdata(dev);
> >>      u32 val, status;
> >>
> >> +    if (!rkisp1->irqs_enabled)
> >> +            return IRQ_NONE;
> >> +
> >>      status =3D rkisp1_read(rkisp1, RKISP1_CIF_MIPI_MIS);
> >>      if (!status)
> >>              return IRQ_NONE;
> >> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/dri=
vers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> >> index 1d60f4b8bd09..fbe03f7864e3 100644
> >> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> >> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> >> @@ -306,6 +306,23 @@ static int __maybe_unused rkisp1_runtime_suspend(=
struct device *dev)
> >>   {
> >>      struct rkisp1_device *rkisp1 =3D dev_get_drvdata(dev);
> >>
> >> +    rkisp1->irqs_enabled =3D false;
> >> +    /* Make sure the IRQ handler will see the above */
> >> +    mb();
> >> +
> >> +    /*
> >> +     * Wait until any running IRQ handler has returned. The IRQ handl=
er
> >> +     * may get called even after this (as it's a shared interrupt lin=
e)
> >> +     * but the 'irqs_enabled' flag will make the handler return immed=
iately.
> >> +     */
> >> +    for (unsigned int i =3D 0; i < RKISP1_NUM_IRQS; ++i) {
> >> +            if (rkisp1->irqs[i] =3D=3D -1)
> >> +                    continue;
> >> +
> >> +            if (i =3D=3D 0 || rkisp1->irqs[i - 1] !=3D rkisp1->irqs[i=
])
> >> +                    synchronize_irq(rkisp1->irqs[i]);
> >> +    }
> >> +
> >>      clk_bulk_disable_unprepare(rkisp1->clk_size, rkisp1->clks);
> >>      return pinctrl_pm_select_sleep_state(dev);
> >>   }
> >> @@ -322,6 +339,10 @@ static int __maybe_unused rkisp1_runtime_resume(s=
truct device *dev)
> >>      if (ret)
> >>              return ret;
> >>
> >> +    rkisp1->irqs_enabled =3D true;
> >> +    /* Make sure the IRQ handler will see the above */
> >> +    mb();
> >> +
> >>      return 0;
> >>   }
> >>
> >> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/dri=
vers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> >> index dafbfd230542..d6b8786661ad 100644
> >> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> >> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> >> @@ -1082,6 +1082,9 @@ irqreturn_t rkisp1_isp_isr(int irq, void *ctx)
> >>      struct rkisp1_device *rkisp1 =3D dev_get_drvdata(dev);
> >>      u32 status, isp_err;
> >>
> >> +    if (!rkisp1->irqs_enabled)
> >> +            return IRQ_NONE;
> >> +
> >>      status =3D rkisp1_read(rkisp1, RKISP1_CIF_ISP_MIS);
> >>      if (!status)
> >>              return IRQ_NONE;
> >
>

