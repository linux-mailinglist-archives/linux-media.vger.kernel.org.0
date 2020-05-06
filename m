Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 397A71C743F
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2020 17:22:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729570AbgEFPWc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 May 2020 11:22:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729408AbgEFPWb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 May 2020 11:22:31 -0400
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com [IPv6:2607:f8b0:4864:20::743])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19B0BC061A0F;
        Wed,  6 May 2020 08:22:31 -0700 (PDT)
Received: by mail-qk1-x743.google.com with SMTP id b188so2300896qkd.9;
        Wed, 06 May 2020 08:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UTLapDh6d6sa8JwxWOzYsk+xzBhP38ZyiktZuaXRCHI=;
        b=U4pPQvxDSFslfW9caqLL2iEZJPKAkK07gBRE9swSmx0eoxQPVz7uvid/DnJKkfomyj
         Qku3qbx38HEbSOfJ/7i1rK5VqUxEEibBDynvO2JtYd8jsPBuOJSqRmf9xKjBERGYKZ/c
         GwVO3uJ4W5YsQBhphnG0UlxOfdAiZY7MMHh26coLua4rQMY57/bVZgjbvxIjci01AlO0
         ewa6+hKVqoH/lycs4MtAmlJ7rV8I6a8g+DuNUjC4k+8dyl5ql2VwKPagDk4SP6AXwoEm
         8Z9eD0tLqSjlyEQl7gwggn3e8qjA6oVWT0Y0XI689Qu2uoxVdNMYqB78Auf/W78dQsFR
         AQDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UTLapDh6d6sa8JwxWOzYsk+xzBhP38ZyiktZuaXRCHI=;
        b=rgzrYk9Scp4Td9oizt3XIr0dLm0dndAzaMwO7+HPSEAOkfokZTrxmEHtFHhqV1qW3x
         RaHTI3CAr3/hmcZg4bQg/1BswXK+h31iUQJUS5MUsMefCDjlap1HqQDYMWLFuGIEsmoY
         WCJgloHBvKdgaw5NQKfylC3opLEu5QYNsUpdbCm2N8eNVEhhgpQcsjocL017bLSHt60L
         1fqNsCDyVyekVbmcUGxxrIO+mW5ENDRbs+Xl0dCyOyupmAiNaO+QZTH5v92UkbMwYXf2
         OnmkmOvRmCWqkHe6pwPBmyveEi63AXs96JAhwDPJKt5fIwIMEkaQm9ZIVlBV5HTEUwo8
         mM6Q==
X-Gm-Message-State: AGi0PuZ4EFC6XPHYdtoECMzHfiwXWv8DscfSp8CXaETUJpT1cRs5/7kc
        fIlmy7IXpr3D2kp3L3t/fqroCjx9UIORBVAbjVA=
X-Google-Smtp-Source: APiQypKsxvWF4y74GYdGypVDcJfTSzmgBGHkfDV88Yy1EbC8OSn5BNhqQrbQzK/PTVwD9mD+DIxmTIufp9t3uVKQClE=
X-Received: by 2002:a37:a7d6:: with SMTP id q205mr6564216qke.85.1588778550313;
 Wed, 06 May 2020 08:22:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200506054920.109738-1-eizan@chromium.org> <20200506154832.v2.2.If340fa06d86053aaea25841b36741fe69c3126dd@changeid>
In-Reply-To: <20200506154832.v2.2.If340fa06d86053aaea25841b36741fe69c3126dd@changeid>
From:   Enric Balletbo Serra <eballetbo@gmail.com>
Date:   Wed, 6 May 2020 17:22:19 +0200
Message-ID: <CAFqH_53hZMxwR=Wk8YY485v_uAgPDh1MRs2ksv-BkfJ7TJGT6g@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] [media] mtk-mdp: handle vb2_dma_contig_set_max_seg_size
 errors during probe
To:     Eizan Miyamoto <eizan@chromium.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        Houlong Wei <houlong.wei@mediatek.com>,
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

Missatge de Eizan Miyamoto <eizan@chromium.org> del dia dc., 6 de maig
2020 a les 7:51:
>
> This is a cleanup to better handle errors during MDP probe.
>
> Signed-off-by: eizan@chromium.org

As I commented on the first patch you should drop the above line.

> Signed-off-by: Eizan Miyamoto <eizan@chromium.org>

Other than that:

Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

> ---
>
> Changes in v1:
> - remove unnecessary error handling labels in favor of err_m2m_register
>
>  drivers/media/platform/mtk-mdp/mtk_mdp_core.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> index aeaed2cf4458..9b24b8d46eb7 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> @@ -193,7 +193,11 @@ static int mtk_mdp_probe(struct platform_device *pdev)
>
>         platform_set_drvdata(pdev, mdp);
>
> -       vb2_dma_contig_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
> +       ret = vb2_dma_contig_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
> +       if (ret) {
> +               dev_err(&pdev->dev, "Failed to set vb2 dma mag seg size\n");
> +               goto err_m2m_register;
> +       }
>
>         pm_runtime_enable(dev);
>         dev_dbg(dev, "mdp-%d registered successfully\n", mdp->id);
> --
> 2.26.2.526.g744177e7f7-goog
>
>
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
