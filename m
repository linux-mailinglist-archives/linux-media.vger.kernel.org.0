Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74EFE1C747D
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2020 17:25:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729966AbgEFPZJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 May 2020 11:25:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729059AbgEFPZH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 May 2020 11:25:07 -0400
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com [IPv6:2607:f8b0:4864:20::743])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C3CFC061A0F;
        Wed,  6 May 2020 08:25:07 -0700 (PDT)
Received: by mail-qk1-x743.google.com with SMTP id t3so2359308qkg.1;
        Wed, 06 May 2020 08:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2rKUJoVCstS8j+217iqzpL0arUK/6LFCBfMeZ1DLw34=;
        b=k1r4mxpeI+EmP8nUVlONZx45dwe25zNrS7sa/tPEShURitcx+P1p2e9KLZOugr4Dmn
         LFSdKpg6yKHiXk3XWmkdLRd71m7BeSD0HQHpmGjEk/0IRVrFkIHMJ9ucnyih7SJgpfnf
         6hGB0lTi6BzYjHtv+ByIqvryFbllvlshoWpqVDaoPnF6l0hNRwPT5yqdSfj4n4XW/nio
         L7e2gguZj/8WBw9++jwHEZXh/nui9vo9UbwLjsDIsuPEZPcfpVnEkGEjHxBklXOIEt1s
         8zN9jL2f1PFcF67Bijq6NXSHeL24FVl2bxBxPG8D4U1AcywcVLCjl94k40aYI5wE0ylE
         60hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2rKUJoVCstS8j+217iqzpL0arUK/6LFCBfMeZ1DLw34=;
        b=LFPtLfkyslSXy2yY1scU1WwfX+RXOPHSizvPp9e4LRBhKQYxhtNkdnkeMBw3aOzS1P
         fHWqoEjc7hlVUJniFXhU6Q7soHvIq4RwFXRccqlkH9b8wOgQFE19cgygh6aRzAuD6Bqt
         8p0/acgRv3LW30OpS/fEWjDi1T+7aPOixbef7K/+Sn/t1yvWgNI68QWgmd2ew3tJB8mT
         aQ59LiFMlUjsc1KkBdX+JpRwGPgR32Q//wxKrGfCTQ27JOE17wji5x5LwQehdQB1DhWt
         ng+78d6G1la+igJKJgj2H8goP4yOCUYlD+rZtZvBKxqDL6eginBhjgjRurGr6cdPoAwH
         MN0Q==
X-Gm-Message-State: AGi0PuahUM/aV7kmmESMkcPDzhEnP8ksYCPxXEBRskDXRqRrK0NUAs2f
        DB5MtKZV5meFsBEVEhB1HNYA2QBZ8umRSOV0/gM=
X-Google-Smtp-Source: APiQypLN8pqWxzhOjoSavD/Blq7jrlAhL4/SdXZMluNjCSenj8jZiR8ivhrWbzxp8MtF270/m2d7r/XhrXZQ+gkQYrk=
X-Received: by 2002:a37:6c81:: with SMTP id h123mr9142170qkc.290.1588778706429;
 Wed, 06 May 2020 08:25:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200506054920.109738-1-eizan@chromium.org> <20200506154832.v2.3.Ia8efd7905e2fcfc81f547e27a51f06373624b3da@changeid>
In-Reply-To: <20200506154832.v2.3.Ia8efd7905e2fcfc81f547e27a51f06373624b3da@changeid>
From:   Enric Balletbo Serra <eballetbo@gmail.com>
Date:   Wed, 6 May 2020 17:24:55 +0200
Message-ID: <CAFqH_531xmZDTCdF2=rHP7fu5=9w_CiOafHQKpcmjNwYBK+gnA@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] [media] mtk-mdp: handle vpu_wdt_reg_handler()
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

ditto, remove the above line.

> Signed-off-by: Eizan Miyamoto <eizan@chromium.org>
> ---

Other than that:

Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

>
> Changes in v1:
> - remove unnecessary error handling labels in favor of err_m2m_register
>
>  drivers/media/platform/mtk-mdp/mtk_mdp_core.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> index 9b24b8d46eb7..17d155219ba2 100644
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
> +               goto err_m2m_register;
> +       }
>
>         platform_set_drvdata(pdev, mdp);
>
> --
> 2.26.2.526.g744177e7f7-goog
>
>
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
