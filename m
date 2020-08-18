Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9DF8248067
	for <lists+linux-media@lfdr.de>; Tue, 18 Aug 2020 10:19:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726648AbgHRITq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Aug 2020 04:19:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726357AbgHRITl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Aug 2020 04:19:41 -0400
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com [IPv6:2607:f8b0:4864:20::e41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23772C061389
        for <linux-media@vger.kernel.org>; Tue, 18 Aug 2020 01:19:41 -0700 (PDT)
Received: by mail-vs1-xe41.google.com with SMTP id k25so9660914vsm.11
        for <linux-media@vger.kernel.org>; Tue, 18 Aug 2020 01:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7qc0PHRmHyAV4s08h+mPSQ2AKSM82PMkMzXSGAIjIyU=;
        b=DGV+F2+cb52Nj0BMWEB9lOedhoMtfTPFWPkhPnUA07d4XhpQRQncJtBjzy9Qd4fQvO
         wKMC5NqMbgse/bTlW2J66+51iNFlL5zsDgzZ+IHpo/YO18KOA7/VLYohfqy1geb6Hv2T
         6AamAPl7j4a62C9ohOa3SKrwZwXb5kf0R/790=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7qc0PHRmHyAV4s08h+mPSQ2AKSM82PMkMzXSGAIjIyU=;
        b=ELFVwM0lYH94ayFroVdgoNO3KDauVXMSpDv/EpfIDPWxHmTts0twWuxqumKgo2x6vr
         ckRrMv4SVZMbkLzBAN/wzV7MzYk5OM9ZOysqVMZeOnru/XfvqnDLCkyr8DsK4kz1QuUH
         csTs6pAtyrWruMxFuCFHU8k0+PhnoZbm7hzBel5Omyezx3J3E9ql+aG0LvgKgVodSVLi
         s2+3d5lwgaBACrgnf5QVQjd5YokTBXBF9ku1pTOWqifJe6svi1ItS8maap8YAEx3gFgL
         XI5SzlF9apX11+DDZJHY5Lr/E3OsLFzxKhgifQDOi6mRHcmq8ONZrjZvRRq5OnMhm1qK
         o3DQ==
X-Gm-Message-State: AOAM531oYch1/LS3+8COqxHZJoj7vy8X+wpJ7FKQ/CYAiOW8XGDv6vJV
        zw27molZKVsAOTCTjXqFOMAmktMSrX75kKy4Eces8w==
X-Google-Smtp-Source: ABdhPJzreYfi0fbtitn2tr3QZ68MpwlV8vAMN6ra3gV3OoMTaqXKSc8vnlwpvhOn3Pco3m2Op2M0MAJHaVOIWKWSBNM=
X-Received: by 2002:a67:68d2:: with SMTP id d201mr10537283vsc.186.1597738780361;
 Tue, 18 Aug 2020 01:19:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200710144747.RESEND.1.Ifae7abaacb81af1cdc6475986cc788d71de8a13c@changeid>
In-Reply-To: <20200710144747.RESEND.1.Ifae7abaacb81af1cdc6475986cc788d71de8a13c@changeid>
From:   Nicolas Boichat <drinkcat@chromium.org>
Date:   Tue, 18 Aug 2020 16:19:29 +0800
Message-ID: <CANMq1KAe5o8oxzTyVMNsoZXBuopVFQqFdKassu67Fssx0xk8Ww@mail.gmail.com>
Subject: Re: [RESEND PATCH] media: camss: vfe: Use trace_printk for debugging only
To:     Andy Gross <agross@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        linux-arm-msm@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jul 10, 2020 at 2:48 PM Nicolas Boichat <drinkcat@chromium.org> wrote:
>
> trace_printk should not be used in production code. Since
> tracing interrupts is presumably latency sensitive, pr_dbg is
> not appropriate, so guard the call with a preprocessor symbol
> that can be defined for debugging purpose.
>
> Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> ---
> Sent this before as part of a series (whose 4th patch was a
> change that allows to detect such trace_printk), but maybe it's
> easier to get individual maintainer attention by splitting it.

Mauro, can I get your attention on this patch? This still applies on
the latest 5.9-rc1/linux-next.

Thanks!


>
>  drivers/media/platform/qcom/camss/camss-vfe-4-1.c | 2 ++
>  drivers/media/platform/qcom/camss/camss-vfe-4-7.c | 2 ++
>  2 files changed, 4 insertions(+)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-4-1.c b/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
> index 174a36be6f5d866..0c57171fae4f9e9 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
> @@ -936,8 +936,10 @@ static irqreturn_t vfe_isr(int irq, void *dev)
>
>         vfe->ops->isr_read(vfe, &value0, &value1);
>
> +#ifdef CAMSS_VFE_TRACE_IRQ
>         trace_printk("VFE: status0 = 0x%08x, status1 = 0x%08x\n",
>                      value0, value1);
> +#endif
>
>         if (value0 & VFE_0_IRQ_STATUS_0_RESET_ACK)
>                 vfe->isr_ops.reset_ack(vfe);
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-4-7.c b/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
> index 0dca8bf9281e774..307675925e5c779 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
> @@ -1058,8 +1058,10 @@ static irqreturn_t vfe_isr(int irq, void *dev)
>
>         vfe->ops->isr_read(vfe, &value0, &value1);
>
> +#ifdef CAMSS_VFE_TRACE_IRQ
>         trace_printk("VFE: status0 = 0x%08x, status1 = 0x%08x\n",
>                      value0, value1);
> +#endif
>
>         if (value0 & VFE_0_IRQ_STATUS_0_RESET_ACK)
>                 vfe->isr_ops.reset_ack(vfe);
> --
> 2.27.0.383.g050319c2ae-goog
>
