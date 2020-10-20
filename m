Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC6E829372E
	for <lists+linux-media@lfdr.de>; Tue, 20 Oct 2020 10:53:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389768AbgJTIw6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Oct 2020 04:52:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389722AbgJTIw5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Oct 2020 04:52:57 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55D60C0613D1
        for <linux-media@vger.kernel.org>; Tue, 20 Oct 2020 01:52:56 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id bf6so679695plb.4
        for <linux-media@vger.kernel.org>; Tue, 20 Oct 2020 01:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=D/Gf2EPIdX5qA2A6HlcDWWaVkQkKjG0YsM21d64zQ1U=;
        b=aTeZpAxII2U/rVVZft7oEyyt1XqC7jMP/kkvxEpio0hlobUSyEfH9hY47HwLpIjs8h
         krQXBk3X6kkPJsazPFAMiINeVsoDMYuDJr1s+EOXKEe+k0ewVjXhaFUoELuosxtMVIcl
         w/OrH33T0CmTc5+SkMUXFyud9fgaDN82nYiXOEoLnuk73mguRhm7tSlx6q6Kyo2/kRJD
         1ghEBc+qTxSDi85MU87EHAx8UDgUz6X5knW+7hDhR4ebHk4e+1qamzBjRgGBYj6kzm5B
         BHvYrusFfdVnbO6lzubiRsy891swODyqSQvmnnxl8PRr83KDiSxYzFFvvntB3kbA+EB8
         twWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=D/Gf2EPIdX5qA2A6HlcDWWaVkQkKjG0YsM21d64zQ1U=;
        b=kiwU0qU4X0656PZZteFVqmPQQ0Euay+cXbGbCGqk3n2cBRmB3ygUa01MN1Z1yVFSsa
         UtdnNi8spEQOJ12TuzfDb6Ivbh1lCNzTQJT6+S/LIiOaZCPBgh9NjadXpm9GJXdt+N1l
         3a8OwL6q3KF7TaXaluzEFvgHkaztlKrQkSyjBIUAe7LNO6sRG0lYi0joUMd6KhNQ5EsY
         uoiL4mBsWSClC5CWLVSMzO/QpSoW8uUYPUu2Xp4M/YHKCF1BhQAEW7+m1hwY4P3VX2bv
         AGd/v9KUELWxnCRSlmgRJLFu2/jy3e4nmLOoY1AUB88Km8uI4pso8iq/n7f0Q6mjhLw2
         uzKg==
X-Gm-Message-State: AOAM530wgkQ+h79+uM1lPI9E2V8PSC1IWyvTE+yqBdZhtUfIp/P7SnNq
        G+q/BVl/y4NEpmZd4KxmPqUHNVZ5gw15plqB0JW0AQ==
X-Google-Smtp-Source: ABdhPJzn235Ieb/yA26fp/gsyes8m4Z1IMTMaB5DacVIupjjGmBYpO2cm8jk4usXtX0nqpoze5E6oCDMq43tVzwbLLc=
X-Received: by 2002:a17:90a:160f:: with SMTP id n15mr1877221pja.75.1603183975701;
 Tue, 20 Oct 2020 01:52:55 -0700 (PDT)
MIME-Version: 1.0
References: <20201018125237.16717-1-kholk11@gmail.com> <20201018125237.16717-2-kholk11@gmail.com>
In-Reply-To: <20201018125237.16717-2-kholk11@gmail.com>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Tue, 20 Oct 2020 10:52:44 +0200
Message-ID: <CAG3jFys7mjWmpTjqGm+sR71WKcJcdfGeGwV3hipY+eQ+zb9naA@mail.gmail.com>
Subject: Re: [PATCH 1/6] media: camss: csiphy-3ph: Add support for SDM630/660
To:     kholk11@gmail.com
Cc:     Todor Tomov <todor.too@gmail.com>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, marijns95@gmail.com,
        konradybcio@gmail.com, martin.botka1@gmail.com,
        linux-arm-msm@vger.kernel.org,
        linux-media <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Angelo,

On Sun, 18 Oct 2020 at 14:52, <kholk11@gmail.com> wrote:
>
> From: AngeloGioacchino Del Regno <kholk11@gmail.com>
>
> The CSIPHY on SDM630/660 needs a slightly longer T_HS_CLK_MISS
> configuration on lanes CFG4.
>
> Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
> ---
>  drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index 2e65caf1ecae..97cb9de85031 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> @@ -8,6 +8,7 @@
>   * Copyright (C) 2016-2018 Linaro Ltd.
>   */
>
> +#include "camss.h"
>  #include "camss-csiphy.h"
>
>  #include <linux/delay.h>
> @@ -21,6 +22,7 @@
>  #define CSIPHY_3PH_LNn_CFG3(n)                 (0x008 + 0x100 * (n))
>  #define CSIPHY_3PH_LNn_CFG4(n)                 (0x00c + 0x100 * (n))
>  #define CSIPHY_3PH_LNn_CFG4_T_HS_CLK_MISS      0xa4
> +#define CSIPHY_3PH_LNn_CFG4_T_HS_CLK_MISS_660  0xa5
>  #define CSIPHY_3PH_LNn_CFG5(n)                 (0x010 + 0x100 * (n))
>  #define CSIPHY_3PH_LNn_CFG5_T_HS_DTERM         0x02
>  #define CSIPHY_3PH_LNn_CFG5_HS_REC_EQ_FQ_INT   0x50
> @@ -198,7 +200,10 @@ static void csiphy_lanes_enable(struct csiphy_device *csiphy,
>         val = CSIPHY_3PH_LNn_CFG1_SWI_REC_DLY_PRG;
>         writel_relaxed(val, csiphy->base + CSIPHY_3PH_LNn_CFG1(l));
>
> -       val = CSIPHY_3PH_LNn_CFG4_T_HS_CLK_MISS;
> +       if (csiphy->camss->version == CAMSS_660)

The CAMSS_660 enum is not defined until patch #4, so building fails
here. I expect to see this issue in a few other places, but I'll
refrain from pointing them all out.

> +               val = CSIPHY_3PH_LNn_CFG4_T_HS_CLK_MISS_660;
> +       else
> +               val = CSIPHY_3PH_LNn_CFG4_T_HS_CLK_MISS;
>         writel_relaxed(val, csiphy->base + CSIPHY_3PH_LNn_CFG4(l));
>
>         val = CSIPHY_3PH_LNn_MISC1_IS_CLKLANE;
> --
> 2.28.0
>
