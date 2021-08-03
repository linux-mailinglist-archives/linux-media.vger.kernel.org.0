Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C7AE3DEAD3
	for <lists+linux-media@lfdr.de>; Tue,  3 Aug 2021 12:27:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234813AbhHCK10 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Aug 2021 06:27:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235221AbhHCK1Y (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Aug 2021 06:27:24 -0400
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com [IPv6:2607:f8b0:4864:20::c2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4E33C061796;
        Tue,  3 Aug 2021 03:27:13 -0700 (PDT)
Received: by mail-oo1-xc2f.google.com with SMTP id t1-20020a4a54010000b02902638ef0f883so5076211ooa.11;
        Tue, 03 Aug 2021 03:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=GRFKaGDDzMyo5FENE0nPEO3nGCw6W5UyNE/tU+fycpY=;
        b=WQ+DhPxXleISyLN7XIIx4tNNAQgrHqsvzwIqN3Hv/RZF/pp4yVJNMtq2EYBvgCQ7/4
         S1iEvICoDUaHZH+vyUQYawV1zkPyWkj77uqB7pUve9XFqzXgq7zASadcLrhEJ6QTt0Ud
         VWKxRrAYYimX97o7hskjx8Ak7UXJyXmJtowZX4CQzLW8rXgpBN5OKpcR2MgQ2XKQ3Sr4
         diEOl7QgULRPHRIQ1sCvBq+0WjUIgvSPV6Im1Q7iRMM4FcAOtzCivKHpSuwPHcLkM2Yz
         RsYF7K4L25WnjNRT+4dI4F13T2ETmaTJLpQvyuD5hPTHGZCAQY+4XFIhOBUSKEY+knS9
         Ot7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=GRFKaGDDzMyo5FENE0nPEO3nGCw6W5UyNE/tU+fycpY=;
        b=btaSG8OUKMyfOwK59DeM48MBo4x7QVZkhY9hUH7Xpw0qdJqT5hwkPPLynUKbXCKSp7
         8RdPnczwfpBikljPjUpUjMzeGuPQkaSiyITSY5qYFH1SpO8oPP8jpPcZcQZjP9pHCJvR
         QZLeNmkPwRIbjhnevPXuLEpRNpkzoIPLJgHZLHAd81Cv882ugpLWYjM8wwYv4XNtDWIR
         cBrRkv32+YY/t/qtGjln1u4uO5ZXJqqzqNalAEs+/ps0q3nxxCbWdwKqPzmxyr5VhK2f
         H6AT08cyOZfeLTOT9Tax7xlVvMp71Do8NCQ4xGGqmtJP8sfji1eHNtrrBrYAh39ekceu
         gehw==
X-Gm-Message-State: AOAM5332+EH9mS/UNGD2eikZzAGQVHjuAmgVbimjFA6Oibs163errXki
        ElZM0UAd+ksWZ6LatD9rR8s1dFz+hSjtXZ6Eqyo=
X-Google-Smtp-Source: ABdhPJyT0lXgKmuJnraYklcHZ3996pZZcY7VWQBgCKW3OWvfjE1A1GD403OoLs5rxSO95JM6jDM33uA/LyEBOIRRXSs=
X-Received: by 2002:a4a:5850:: with SMTP id f77mr13857820oob.15.1627986433170;
 Tue, 03 Aug 2021 03:27:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210802121215.703023-1-eizan@chromium.org> <20210802220943.v6.1.I9db0d408ef79d300672ec0311a6bee9556801631@changeid>
In-Reply-To: <20210802220943.v6.1.I9db0d408ef79d300672ec0311a6bee9556801631@changeid>
From:   Enric Balletbo Serra <eballetbo@gmail.com>
Date:   Tue, 3 Aug 2021 12:26:59 +0200
Message-ID: <CAFqH_53NWzhrSWqf-1qYqN7d7TRzh5g4u1+Z_3VnzoS=_CGzqg@mail.gmail.com>
Subject: Re: [PATCH v6 1/9] mtk-mdp: propagate errors from clock_on
To:     Eizan Miyamoto <eizan@chromium.org>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        Chen-Yu Tsai <wenst@chromium.org>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Yong Wu <yong.wu@mediatek.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        devicetree <devicetree@vger.kernel.org>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Eizan,

Thank you for your patch.

Missatge de Eizan Miyamoto <eizan@chromium.org> del dia dl., 2 d=E2=80=99ag=
.
2021 a les 14:13:
>
> Up until this change, many errors were logged but ignored when powering
> on clocks inside mtk_mdp_core. This change tries to do a better job at
> propagating errors back to the power management framework.
>
> Signed-off-by: Eizan Miyamoto <eizan@chromium.org>

Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

> ---
>
> (no changes since v1)
>
>  drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 25 ++++++++++++-----
>  drivers/media/platform/mtk-mdp/mtk_mdp_comp.h |  2 +-
>  drivers/media/platform/mtk-mdp/mtk_mdp_core.c | 27 ++++++++++++++-----
>  3 files changed, 39 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c b/drivers/medi=
a/platform/mtk-mdp/mtk_mdp_comp.c
> index b3426a551bea..76e295c8d9bc 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> @@ -13,10 +13,9 @@
>
>  #include "mtk_mdp_comp.h"
>
> -
> -void mtk_mdp_comp_clock_on(struct device *dev, struct mtk_mdp_comp *comp=
)
> +int mtk_mdp_comp_clock_on(struct device *dev, struct mtk_mdp_comp *comp)
>  {
> -       int i, err;
> +       int i, err, status;
>
>         if (comp->larb_dev) {
>                 err =3D mtk_smi_larb_get(comp->larb_dev);
> @@ -30,11 +29,23 @@ void mtk_mdp_comp_clock_on(struct device *dev, struct=
 mtk_mdp_comp *comp)
>                 if (IS_ERR(comp->clk[i]))
>                         continue;
>                 err =3D clk_prepare_enable(comp->clk[i]);
> -               if (err)
> -                       dev_err(dev,
> -                       "failed to enable clock, err %d. type:%d i:%d\n",
> -                               err, comp->type, i);
> +               if (err) {
> +                       status =3D err;
> +                       dev_err(dev, "failed to enable clock, err %d. i:%=
d\n", err, i);
> +                       goto err_clk_prepare_enable;
> +               }
> +       }
> +
> +       return 0;
> +
> +err_clk_prepare_enable:
> +       for (--i; i >=3D 0; i--) {
> +               if (IS_ERR(comp->clk[i]))
> +                       continue;
> +               clk_disable_unprepare(comp->clk[i]);

nit: We could use bulk functions here, but that's probably a follow-up patc=
h.




>         }
> +
> +       return status;
>  }
>
>  void mtk_mdp_comp_clock_off(struct device *dev, struct mtk_mdp_comp *com=
p)
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h b/drivers/medi=
a/platform/mtk-mdp/mtk_mdp_comp.h
> index 7897766c96bb..92ab5249bcad 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
> @@ -41,7 +41,7 @@ int mtk_mdp_comp_init(struct device *dev, struct device=
_node *node,
>                       struct mtk_mdp_comp *comp,
>                       enum mtk_mdp_comp_type comp_type);
>  void mtk_mdp_comp_deinit(struct device *dev, struct mtk_mdp_comp *comp);
> -void mtk_mdp_comp_clock_on(struct device *dev, struct mtk_mdp_comp *comp=
);
> +int mtk_mdp_comp_clock_on(struct device *dev, struct mtk_mdp_comp *comp)=
;
>  void mtk_mdp_comp_clock_off(struct device *dev, struct mtk_mdp_comp *com=
p);
>
>
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c b/drivers/medi=
a/platform/mtk-mdp/mtk_mdp_core.c
> index 976aa1f4829b..412bbec0f735 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> @@ -52,13 +52,28 @@ static const struct of_device_id mtk_mdp_of_ids[] =3D=
 {
>  };
>  MODULE_DEVICE_TABLE(of, mtk_mdp_of_ids);
>
> -static void mtk_mdp_clock_on(struct mtk_mdp_dev *mdp)
> +static int mtk_mdp_clock_on(struct mtk_mdp_dev *mdp)
>  {
> -       struct device *dev =3D &mdp->pdev->dev;
>         struct mtk_mdp_comp *comp_node;
> +       int status;
> +       struct device *dev =3D &mdp->pdev->dev;
> +       int err;
>
> -       list_for_each_entry(comp_node, &mdp->comp_list, node)
> -               mtk_mdp_comp_clock_on(dev, comp_node);
> +       list_for_each_entry(comp_node, &mdp->comp_list, node) {
> +               err =3D mtk_mdp_comp_clock_on(dev, comp_node);
> +               if (err) {
> +                       status =3D err;
> +                       goto err_mtk_mdp_comp_clock_on;
> +               }
> +       }
> +
> +       return 0;
> +
> +err_mtk_mdp_comp_clock_on:
> +       list_for_each_entry_continue_reverse(comp_node, &mdp->comp_list, =
node)
> +               mtk_mdp_comp_clock_off(dev, comp_node);
> +
> +       return status;
>  }
>
>  static void mtk_mdp_clock_off(struct mtk_mdp_dev *mdp)
> @@ -274,9 +289,7 @@ static int __maybe_unused mtk_mdp_pm_resume(struct de=
vice *dev)
>  {
>         struct mtk_mdp_dev *mdp =3D dev_get_drvdata(dev);
>
> -       mtk_mdp_clock_on(mdp);
> -
> -       return 0;
> +       return mtk_mdp_clock_on(mdp);
>  }
>
>  static int __maybe_unused mtk_mdp_suspend(struct device *dev)
> --
> 2.32.0.554.ge1b32706d8-goog
>
