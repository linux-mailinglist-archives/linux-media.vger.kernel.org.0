Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2B801C6354
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2020 23:46:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729348AbgEEVqD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 May 2020 17:46:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729284AbgEEVqC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 5 May 2020 17:46:02 -0400
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com [IPv6:2607:f8b0:4864:20::f41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C5E4C061A0F;
        Tue,  5 May 2020 14:46:02 -0700 (PDT)
Received: by mail-qv1-xf41.google.com with SMTP id dn1so61300qvb.3;
        Tue, 05 May 2020 14:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=R8NCAiVQGf1RfOegGjvzJMziYyDzp2bsCSV1MaN4Voo=;
        b=ZIoXJJraEJVdnimMK50llvgOXi7em9HScaaU0nSq0RkeBqNWbeZeE9X/srcFx5jieX
         qQl4234YJtVcJNFfaHC8xj6U0z+l2yZ8R1rCmZcg7w+E2X2wmfEaZVWHPdfyqdgwLnxt
         rYV+cfrjp5X3UvK8pjx2n/AAfKT0Gg8JQLWs35P01KX67S/rY/Kgh4qh1j+3391E53Mg
         o1ukd6V1kR6sjIlXVhCQHwhLYyVXjg8I9nGLRwn04GU+DGHf4k3QYo5hHx/DwE9nEyE2
         tGkgEMN4ZUb3A2ScVWZtB8f2uKK4xj3hRc7ZoKy+xi34Rwv1rn2pxYkseY2QUOUCsyeB
         gfXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=R8NCAiVQGf1RfOegGjvzJMziYyDzp2bsCSV1MaN4Voo=;
        b=DgPPMpGE+e9Wb7Zsu9Rpt45zNcOIZ2hVlsMtLwRa39JZNuSD0F1FIDvQkoqC+o7Sdp
         uTSLY+QCJ8xodhmNezLqoT6hvp5wXsUB2GrIZuqhjOGLXSFIsBuTJP3ZEwi5GIKV3D++
         hQkI/e40TooBz3U4vllMh7H6FjRBUHbN5UNBqBnyPH/BdxH3744pMohnrQ/ACzCExwAe
         S4eFPu+65We481V14aAAkVjAPGu3cxM+aJ1kAqREvJbxy4sDycrqkaVR4azu66w/n/3b
         JwxIJ47SKZIwYI/+OTlgJh7DqR9OWab2TCJPHScgRXTBrFkMiTvPoLLypc+wDOFVkPrH
         uK1Q==
X-Gm-Message-State: AGi0PuYUpiFuESTlp8IfVWyN0ggeFGXUnSViXhtum3iJkO2EmlcOnmOa
        V/0oMPgSBcvnhb3qtC4cec9BEGpQ1sK90luYDJE=
X-Google-Smtp-Source: APiQypIgezGzc28P28ECC0K35WZq6bKt5h1gPnuYe/Qlr/SsV0rJJZPPlQSFwztMV/9sQnHqEoH0ghXBgjTBUwXil6M=
X-Received: by 2002:a0c:ec44:: with SMTP id n4mr4828893qvq.237.1588715161652;
 Tue, 05 May 2020 14:46:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200505040048.132493-1-eizan@google.com> <20200505125042.v1.3.Ieebc5dcb6dcc116119a570f14786ba47c9007ec8@changeid>
In-Reply-To: <20200505125042.v1.3.Ieebc5dcb6dcc116119a570f14786ba47c9007ec8@changeid>
From:   Enric Balletbo Serra <eballetbo@gmail.com>
Date:   Tue, 5 May 2020 23:45:50 +0200
Message-ID: <CAFqH_50YZacJPRv9Wcr6h0U7q5BSNTjCsTuaLhUXNMGe=-nYHA@mail.gmail.com>
Subject: Re: [PATCH v1 3/5] [media] mtk-mdp: handle vpu_wdt_reg_handler()
 errors during probe
To:     Eizan Miyamoto <eizan@chromium.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Eizan Miyamoto <eizan@google.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Eizan,

Thank you for your patch.

Missatge de Eizan Miyamoto <eizan@chromium.org> del dia dt., 5 de maig
2020 a les 6:01:
>
> This is a cleanup to better handle errors during MDP probe.
>
> Signed-off-by: eizan@chromium.org
> Signed-off-by: Eizan Miyamoto <eizan@google.com>

Ditto

> ---
>
>  drivers/media/platform/mtk-mdp/mtk_mdp_core.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> index c20ac7681c6f..f974242663dc 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> @@ -188,8 +188,12 @@ static int mtk_mdp_probe(struct platform_device *pdev)
>         }
>
>         mdp->vpu_dev = vpu_get_plat_device(pdev);
> -       vpu_wdt_reg_handler(mdp->vpu_dev, mtk_mdp_reset_handler, mdp,
> -                           VPU_RST_MDP);
> +       ret = vpu_wdt_reg_handler(mdp->vpu_dev, mtk_mdp_reset_handler, mdp,
> +                                 VPU_RST_MDP);
> +       if (ret) {
> +               dev_err(&pdev->dev, "Failed to register reset handler\n");
> +               goto err_wdt_reg;

No need to introduce a new label, just goto err_m2m_register


> +       }
>
>         platform_set_drvdata(pdev, mdp);
>
> @@ -206,6 +210,8 @@ static int mtk_mdp_probe(struct platform_device *pdev)
>
>  err_set_max_seg_size:
>
> +err_wdt_reg:
> +
>  err_m2m_register:
>         v4l2_device_unregister(&mdp->v4l2_dev);
>
> --
> 2.26.2.526.g744177e7f7-goog
>
>
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
