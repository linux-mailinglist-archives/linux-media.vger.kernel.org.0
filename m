Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D7562F484E
	for <lists+linux-media@lfdr.de>; Wed, 13 Jan 2021 11:09:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727390AbhAMKGc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Jan 2021 05:06:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726238AbhAMKGb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Jan 2021 05:06:31 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1128C061794
        for <linux-media@vger.kernel.org>; Wed, 13 Jan 2021 02:05:51 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id b5so872408pjl.0
        for <linux-media@vger.kernel.org>; Wed, 13 Jan 2021 02:05:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NqSp1CS/tG0K0LycFdJLkNTqrqqEN/+/ECtWrdgLYVw=;
        b=JtFYECy6FCsgaTEjjunXpOdA9jNdAI44H1uhMIZZlfofaRtiw9MDGEqdcADlmAlUHS
         2jUII2HZYKKI1pCUuwKR9rYbVTlj412io9rO6/heet4HF7iBaoCGlg0yNLavvqKnFDPA
         awm8/iiUnvvomkq6X0EN1Lpi+WrDUMVzTwFMJWQ3/m8B2j/qB0wJQHe5DT8VfnsWYZLV
         +cwqqWC0fCGB+0mgnVnO0lufn9PI4XXTpkJsGf0h3sGvX+5y6aR7NFP+hcM/216nkl81
         SUVQGLAuDdoHPl+kQKa5+u1PZOYa9dsIAaIW55I2n1eTQK8yC5MmOW6EhWqV6bm6Mxau
         BxKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NqSp1CS/tG0K0LycFdJLkNTqrqqEN/+/ECtWrdgLYVw=;
        b=HUDneV3LMVnermheKNiAoaLRv03VFMZLG8CDiTPXvxdOHII3/esvahzGZm0FxrnWy5
         aHJxIcfC6AOdTfFh/vHw+NotUX0iJGmnRaAZ9Lj3deLqxQ6JFKfN+J5n/mPAiQEBGFGe
         n67ADnsCBfJzdtc1vBeehVu40bNw6MSDyeng6y8OUiGCypG8bwICAPMcR+9LLp8wr6VP
         Kxbx0DJaug/Mu/eXnP1VkeQNzS5PmXkbsJBkOxM2PotDgrrGRJWzDs8RrcIWIH1s6/rB
         deWvQzuEdrpSBtvXwJ+KrjMZZy4Czs1xMIt8vQJVTLSiJv5Z34ojNfDS4/TQ+0IRQc3Z
         o4RA==
X-Gm-Message-State: AOAM533BBzPYCn3UO131AakySFDlvg0+RHVcqlLrHOP0rldI2BWFiWK1
        /F/mkNv+Ag5mLT59ChJO2tkezuH2TOymYIQOSwJ0Yw==
X-Google-Smtp-Source: ABdhPJy30/24xh0ZjTuGG9Ozw/mTLYWg+XGxVN/wykYvTg2cIoVBMd6aMXveyvl+2yBjWVbOXsuhppIny0pJJAb6XCY=
X-Received: by 2002:a17:90a:e604:: with SMTP id j4mr1548690pjy.19.1610532351366;
 Wed, 13 Jan 2021 02:05:51 -0800 (PST)
MIME-Version: 1.0
References: <20210108120429.895046-1-robert.foss@linaro.org>
 <20210108120429.895046-3-robert.foss@linaro.org> <X/ipyY7o+Grx+lkL@builder.lan>
In-Reply-To: <X/ipyY7o+Grx+lkL@builder.lan>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Wed, 13 Jan 2021 11:04:45 +0100
Message-ID: <CAG3jFyt8VdNZFMfM+Ugjo-6v=hVvRdm0LGvzV1ACGTq78aj11Q@mail.gmail.com>
Subject: Re: [PATCH v1 02/17] media: camss: Fix vfe_isr comment typo
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, catalin.marinas@arm.com,
        will@kernel.org, shawnguo@kernel.org, leoyang.li@nxp.com,
        geert+renesas@glider.be, arnd@arndb.de, Anson.Huang@nxp.com,
        michael@walle.cc, agx@sigxcpu.org, max.oss.09@gmail.com,
        linux-arm-msm@vger.kernel.org,
        linux-media <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thanks!

On Fri, 8 Jan 2021 at 19:51, Bjorn Andersson <bjorn.andersson@linaro.org> wrote:
>
> On Fri 08 Jan 06:04 CST 2021, Robert Foss wrote:
>
> > Comment refers to ISPIF, but this is incorrect. Only
> > the VFE interrupts are handled by this function.
> >
> > Signed-off-by: Robert Foss <robert.foss@linaro.org>
>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>
> Regards,
> Bjorn
>
> > ---
> >  drivers/media/platform/qcom/camss/camss-vfe-4-1.c | 2 +-
> >  drivers/media/platform/qcom/camss/camss-vfe-4-7.c | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/media/platform/qcom/camss/camss-vfe-4-1.c b/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
> > index 174a36be6f5d..a1b56b89130d 100644
> > --- a/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
> > +++ b/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
> > @@ -922,7 +922,7 @@ static void vfe_violation_read(struct vfe_device *vfe)
> >  }
> >
> >  /*
> > - * vfe_isr - ISPIF module interrupt handler
> > + * vfe_isr - VFE module interrupt handler
> >   * @irq: Interrupt line
> >   * @dev: VFE device
> >   *
> > diff --git a/drivers/media/platform/qcom/camss/camss-vfe-4-7.c b/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
> > index b5704a2f119b..84c33b8f9fe3 100644
> > --- a/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
> > +++ b/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
> > @@ -1055,7 +1055,7 @@ static void vfe_violation_read(struct vfe_device *vfe)
> >  }
> >
> >  /*
> > - * vfe_isr - ISPIF module interrupt handler
> > + * vfe_isr - VFE module interrupt handler
> >   * @irq: Interrupt line
> >   * @dev: VFE device
> >   *
> > --
> > 2.27.0
> >
