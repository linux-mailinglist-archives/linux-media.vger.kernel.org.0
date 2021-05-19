Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73810389307
	for <lists+linux-media@lfdr.de>; Wed, 19 May 2021 17:52:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346825AbhESPyJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 May 2021 11:54:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346863AbhESPyD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 May 2021 11:54:03 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91700C061761
        for <linux-media@vger.kernel.org>; Wed, 19 May 2021 08:52:43 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id t11so7564750pjm.0
        for <linux-media@vger.kernel.org>; Wed, 19 May 2021 08:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AjaxYg4bUUARP67WdGinpCbYpxiblugMhlcvL7HjH8s=;
        b=exnK+d2N5ecA63XuVyOCKzjR4/cye2CMBz3pcMSTaRcM9gs5Ic38YZqMewJJFd16MT
         p0x7DhlXbr/+0VixgDfqq+En4zwXPeji2FA+ulvWQVxzmUldfdo2e5AwOMJ/Cw2EV4oY
         x3Y/nGHpsqOaI9GDwedwIJWbklq13gbzEENJgnvabAJquqBHI4IivPX3XPntBMDd1IUb
         bYOXHrIBxfyouKSWEnaeCawybiTYK/murqLNxF+VzIyNbtFHbAJA7cVZBkDQzhKODo+K
         977ADWL9KRjFVmDH4i0jL3MaQi+mjoNfaOItgTT2V8h88glq7/WacRl3u1mclRFsneSH
         we5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AjaxYg4bUUARP67WdGinpCbYpxiblugMhlcvL7HjH8s=;
        b=nqSxRBULWQ+z3gggaqrJmCZ5xjKeamQe9GHgDQUol3h7Gdp6IS6Ih02MJoCoNK6i4Z
         iBXtcHOqOd/zXJQiUGSQc7/sKSe+kwLl2Fvw103SPtClFzp4xsXpHlCEfic20S94pkOW
         0tn6Iv7S7GKvb28FjmDW66VjnXhKKY9Oh7X/SJ55gub24gAHPnT6Cpuv12V1hnCdeYh7
         zup7teM7EFIK5t+Jly1bMji/BiqQ+Y908LOnSWdcb+uQVE5O5qXEeH0emoHcP6xz43rT
         vEyLsCUciNyGbyuomMOhqvMIw6P6R8JEqrLewjQ2+G8AMQzCYv9bUCwdF7Cdk5D9vgT0
         UJ4w==
X-Gm-Message-State: AOAM532vATzJcc554XQD+6yLqUHW4/fInIjNKDyl2Gv+WR2jco0/NVWI
        7JaggBRKhorwm+k6dbhmqMuZxNhns+rbV2jKXepO5A==
X-Google-Smtp-Source: ABdhPJznYOweZXIKYDgZ3nLOZlhjx+oq97Yjw8fXxaWJMMRlfhU/ljaNm1YJbtniMdzPJeCNQ4PYsRKhN4xoAo/Jfkk=
X-Received: by 2002:a17:90a:b38d:: with SMTP id e13mr11507026pjr.222.1621439562957;
 Wed, 19 May 2021 08:52:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210511180728.23781-1-jonathan@marek.ca> <20210511180728.23781-3-jonathan@marek.ca>
In-Reply-To: <20210511180728.23781-3-jonathan@marek.ca>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Wed, 19 May 2021 17:52:31 +0200
Message-ID: <CAG3jFyvx3szAdUFJWyQCe6DndQX6YEY3M=xWM585ujSv1ro6VQ@mail.gmail.com>
Subject: Re: [PATCH 02/17] media: camss: csiphy-3ph: disable interrupts
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     MSM <linux-arm-msm@vger.kernel.org>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Todor Tomov <todor.too@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "open list:QUALCOMM CAMERA SUBSYSTEM DRIVER" 
        <linux-media@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 11 May 2021 at 20:08, Jonathan Marek <jonathan@marek.ca> wrote:
>
> The driver does nothing with the interrupts, so set the irq mask registers
> to zero to avoid wasting CPU time for thing.
>
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  .../qcom/camss/camss-csiphy-3ph-1-0.c         | 35 ++-----------------
>  1 file changed, 3 insertions(+), 32 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index 5948abdcd220..783b65295d20 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> @@ -352,38 +352,9 @@ static void csiphy_lanes_enable(struct csiphy_device *csiphy,
>         else if (csiphy->camss->version == CAMSS_845)
>                 csiphy_gen2_config_lanes(csiphy, settle_cnt);
>
> -       val = 0xff;
> -       writel_relaxed(val, csiphy->base + CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(11));
> -
> -       val = 0xff;
> -       writel_relaxed(val, csiphy->base + CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(12));
> -
> -       val = 0xfb;
> -       writel_relaxed(val, csiphy->base + CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(13));
> -
> -       val = 0xff;
> -       writel_relaxed(val, csiphy->base + CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(14));
> -
> -       val = 0x7f;
> -       writel_relaxed(val, csiphy->base + CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(15));
> -
> -       val = 0xff;
> -       writel_relaxed(val, csiphy->base + CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(16));
> -
> -       val = 0xff;
> -       writel_relaxed(val, csiphy->base + CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(17));
> -
> -       val = 0xef;
> -       writel_relaxed(val, csiphy->base + CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(18));
> -
> -       val = 0xff;
> -       writel_relaxed(val, csiphy->base + CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(19));
> -
> -       val = 0xff;
> -       writel_relaxed(val, csiphy->base + CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(20));
> -
> -       val = 0xff;
> -       writel_relaxed(val, csiphy->base + CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(21));
> +       /* IRQ_MASK registers - disable all interrupts */
> +       for (i = 11; i < 22; i++)
> +               writel_relaxed(0, csiphy->base + CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(i));
>  }
>
>  static void csiphy_lanes_disable(struct csiphy_device *csiphy,

Reviewed-by: Robert Foss <robert.foss@linaro.org>
