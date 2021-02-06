Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3B82311AFF
	for <lists+linux-media@lfdr.de>; Sat,  6 Feb 2021 05:41:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230229AbhBFEj6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Feb 2021 23:39:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231311AbhBFEjc (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Feb 2021 23:39:32 -0500
Received: from mail-ua1-x930.google.com (mail-ua1-x930.google.com [IPv6:2607:f8b0:4864:20::930])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04ABFC061756
        for <linux-media@vger.kernel.org>; Fri,  5 Feb 2021 20:38:51 -0800 (PST)
Received: by mail-ua1-x930.google.com with SMTP id i3so2847501uai.3
        for <linux-media@vger.kernel.org>; Fri, 05 Feb 2021 20:38:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7tNqLsfYX9gzibf9LwB4HQxkaRZ+2tGUkdroBxSOk2A=;
        b=jeSp4ZWDa+2AdP7dQ54QhQ4gHYklqrtRaIc6KBcRn6T9e2cVRq02Ci0Ua4KWN2Dig+
         QXUR9aNriY9noKbl1c0FLmhZCNjx41o0W9Km6L8+l3H28qzvTIXR/Vt+VfQmlLdIF1l4
         AglCrYVfTUI88jvaJHN5Ali1/jP5vX9C4P8oQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7tNqLsfYX9gzibf9LwB4HQxkaRZ+2tGUkdroBxSOk2A=;
        b=eFfA/V2eNPSAGVfFmnsLZZ8jEMJNnXPnnIbGK46URcUxqYHaA8Jz/wRxPuerNhI9KB
         EL18YsfQROX6ayTg4KWBvBf5B+h46a23EKdkkLvFAFkmfEAidm65oSYpofvsbaP7DJG/
         peO1zgxdjFH6+uV0J+fQGth53r5sBMJgjTWple52dMIQq3EVBdbz8biwQHf1AEOkS6HG
         ZHPtOU68UMjQJ1bMaGosY/Dv0dqZyEuOtifl4sYWrXKRs6IJALjZJJ9Y2u+BFzPOwKDM
         2O3CWdqxmLIbIGh/wA/ZH39UzBVumccOilqXurqdE8NKezxNpnCMg8AX+MJAISnMhkhu
         S1ng==
X-Gm-Message-State: AOAM5323GgTs53eE22FyjpamSdordSqRfrdzVnP3s0CkaNkBhZ7UB+7K
        v7U4ZoFg3VfIe9QzKnv/1XRLGcUojNabOBGciuL58g==
X-Google-Smtp-Source: ABdhPJxSHD2bpO8QMNrO1PfovadiW1b4ieesCYcbVLPKGrkZ6vddV0zbMaKl8blR8MYOamb7kehPbnr1ttSffkVpJlY=
X-Received: by 2002:ab0:3043:: with SMTP id x3mr5342812ual.88.1612586330175;
 Fri, 05 Feb 2021 20:38:50 -0800 (PST)
MIME-Version: 1.0
References: <20210205104414.299732-1-robert.foss@linaro.org> <20210205104414.299732-4-robert.foss@linaro.org>
In-Reply-To: <20210205104414.299732-4-robert.foss@linaro.org>
From:   Nicolas Boichat <drinkcat@chromium.org>
Date:   Sat, 6 Feb 2021 12:38:39 +0800
Message-ID: <CANMq1KDN8TLhUPH2i_S3gCQAU0nM9b_aYnNs-o3rETYgp5-pHw@mail.gmail.com>
Subject: Re: [PATCH v4 03/22] media: camss: Replace trace_printk() with dev_dbg()
To:     Robert Foss <robert.foss@linaro.org>
Cc:     Todor Tomov <todor.too@gmail.com>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        angelogioacchino.delregno@somainline.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Devicetree List <devicetree@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jonathan Marek <jonathan@marek.ca>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Feb 5, 2021 at 6:44 PM Robert Foss <robert.foss@linaro.org> wrote:
>
> trace_printk() should not be used in production code,
> since extra memory is used for special buffers whenever
> trace_puts() is used.
>
> Replace it with dev_dbg() which provides all of the desired
> debugging functionality.
>
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> Suggested-by: Nicolas Boichat <drinkcat@chromium.org>

Thanks!

Reviewed-by: Nicolas Boichat <drinkcat@chromium.org>

> ---
>
> Changes since v3:
>  - Nicolas: Create this patch
>
>
>  drivers/media/platform/qcom/camss/camss-vfe-4-1.c | 5 +++--
>  drivers/media/platform/qcom/camss/camss-vfe-4-7.c | 5 +++--
>  2 files changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-4-1.c b/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
> index a1b56b89130d..85b9bcbc7321 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
> @@ -12,6 +12,7 @@
>  #include <linux/io.h>
>  #include <linux/iopoll.h>
>
> +#include "camss.h"
>  #include "camss-vfe.h"
>
>  #define VFE_0_HW_VERSION               0x000
> @@ -936,8 +937,8 @@ static irqreturn_t vfe_isr(int irq, void *dev)
>
>         vfe->ops->isr_read(vfe, &value0, &value1);
>
> -       trace_printk("VFE: status0 = 0x%08x, status1 = 0x%08x\n",
> -                    value0, value1);
> +       dev_dbg(vfe->camss->dev, "VFE: status0 = 0x%08x, status1 = 0x%08x\n",
> +               value0, value1);
>
>         if (value0 & VFE_0_IRQ_STATUS_0_RESET_ACK)
>                 vfe->isr_ops.reset_ack(vfe);
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-4-7.c b/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
> index 84c33b8f9fe3..f7e00a2de393 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
> @@ -12,6 +12,7 @@
>  #include <linux/io.h>
>  #include <linux/iopoll.h>
>
> +#include "camss.h"
>  #include "camss-vfe.h"
>
>  #define VFE_0_HW_VERSION               0x000
> @@ -1069,8 +1070,8 @@ static irqreturn_t vfe_isr(int irq, void *dev)
>
>         vfe->ops->isr_read(vfe, &value0, &value1);
>
> -       trace_printk("VFE: status0 = 0x%08x, status1 = 0x%08x\n",
> -                    value0, value1);
> +       dev_dbg(vfe->camss->dev, "VFE: status0 = 0x%08x, status1 = 0x%08x\n",
> +               value0, value1);
>
>         if (value0 & VFE_0_IRQ_STATUS_0_RESET_ACK)
>                 vfe->isr_ops.reset_ack(vfe);
> --
> 2.27.0
>
