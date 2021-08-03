Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF8DE3DEAD5
	for <lists+linux-media@lfdr.de>; Tue,  3 Aug 2021 12:27:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234904AbhHCK13 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Aug 2021 06:27:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234863AbhHCK12 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Aug 2021 06:27:28 -0400
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1009C06175F;
        Tue,  3 Aug 2021 03:27:17 -0700 (PDT)
Received: by mail-ot1-x32b.google.com with SMTP id 19-20020a9d08930000b02904b98d90c82cso20253572otf.5;
        Tue, 03 Aug 2021 03:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=vojC88TgxjBveGcu8x5atA5B9jUzzwB1FA0JEJeV7P8=;
        b=gndUX5YfHTJ+vASCZjkoCAm/XVUU8n1APqah/tmzQbjzTu588GTph6Sdm3fyFUvERQ
         G/Qwa05sJFKRPVY7wqCV95qKtYkOR7QnaTMGwH+92lyqiKUd8qyDAmdYFTQROlIoP9Cu
         MJeVSuv289YVjI0e1FnTwm/AtlKaWLN2Yo9+ByS3s+kTry6ACdOR+8Z1Gvq7mvT8hhDl
         yLr1Oj0YnCtz+mXLs1QRIfwsGupXxO8hHl/pddkPulxwIeSFoiyXkbbwAjXWOr5O8gpK
         HtVf7+RZ09RDSV3CbYfcRo4QkMlUhO8c5Vf30prhOb8NSTy6Beqw5U5LVI5Fca1TkKW2
         WQ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=vojC88TgxjBveGcu8x5atA5B9jUzzwB1FA0JEJeV7P8=;
        b=a3Wg45m+G79jkviwl47fG+o8vtaLHxaVDYWw8kh29BA8/JF2w9g8RxRpeO5ox1yy1E
         EhiX6SEA1yz/lyY7GgC9ndeOCe/IPbzpYq1EYBLNRDoX7PMQ0Iz1A25PoaJwMDCNasMp
         fbRXXDS4s4Y3QwB63AnWbgLC5jHXqXRJAwqHS+u+qr6FuJ1RjbdZPSCE4JkBqQ2eiNbY
         1wu/kAamgEhCw8XstHVMQquYOXS/jK+geCDwXhVlF6V/sa/A6PdO0tkszvDvhaveLWTf
         C2X+YcR8xhxh/69Ml57fEuo1frmPYaGnX3jTPQi/1f9W6jCJx3nivGf3xEn78Z+ZtFDD
         YWKg==
X-Gm-Message-State: AOAM530eYJX1eNsKqPRdA0ar60uMZKTW7rCNtd+T87cFNk6UZh25BgHy
        vB5c+6b6r8bdK+LeZBQl3XUYWE5hMdkBZM18y/w=
X-Google-Smtp-Source: ABdhPJy6qKtKDtw3q1Lsd3P3w9GFeuiPQtMJyNKYbOQa3aBUAk8yeHo+BZyEzjSAtmSRuH4ODdWMnoQ+bsN7wylm2eE=
X-Received: by 2002:a9d:27a4:: with SMTP id c33mr15298194otb.281.1627986437246;
 Tue, 03 Aug 2021 03:27:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210802121215.703023-1-eizan@chromium.org> <20210802220943.v6.4.Ifd87681955689a08cce4c65e72ee5e8c6d09af95@changeid>
In-Reply-To: <20210802220943.v6.4.Ifd87681955689a08cce4c65e72ee5e8c6d09af95@changeid>
From:   Enric Balletbo Serra <eballetbo@gmail.com>
Date:   Tue, 3 Aug 2021 12:27:03 +0200
Message-ID: <CAFqH_50or=_pb7UDCvoPEoA7s1r6qNTNnMuo4pPuFfGqj4d50w@mail.gmail.com>
Subject: Re: [PATCH v6 4/9] media: mtk-mdp: don't pm_run_time_get/put for
 master comp in clock_on
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
> The original intent of commit 86698b9505bbc ("media: mtk-mdp: convert
> mtk_mdp_dev.comp array to list") was to create a list to track all the
> MDP components that needed to have their clocks enabled/disabled when
> calling mtk_mdp_comp_clock_on/off. However, there was a bug inside
> mtk_mdp_register_component where the args to a call to list_add were
> swapped. The result is that only one component was added to
> mtk_mdp_dev.comp_list because comp_list was instead being
> repeatedly added to the single element lists headed by each
> mtk_mdp_comp.
>
> The order of the args to list_add in mtk_mdp_register_component was
> fixed in https://patchwork.kernel.org/patch/11742895/ (Fix Null pointer
> dereference when calling list_add).
>
> Then, as a result of https://patchwork.kernel.org/patch/11530769/
> (mtk-mdp: use pm_runtime in MDP component driver) if all the components
> are added to the component list, the mdp "master" / rdma0 component
> ends up having pm_runtime_get_sync() called on it twice recursively:
>
>     rpm_resume+0x694/0x8f8
>     __pm_runtime_resume+0x7c/0xa0 ***NOTE***
>     mtk_mdp_comp_clock_on+0x48/0x104 [mtk_mdp]
>     mtk_mdp_pm_resume+0x2c/0x44 [mtk_mdp]
>     pm_generic_runtime_resume+0x34/0x48
>     __genpd_runtime_resume+0x6c/0x80
>     genpd_runtime_resume+0x104/0x1ac
>     __rpm_callback+0x120/0x238
>     rpm_callback+0x34/0x8c
>     rpm_resume+0x7a0/0x8f8
>     __pm_runtime_resume+0x7c/0xa0 ***NOTE***
>     mtk_mdp_m2m_start_streaming+0x2c/0x3c [mtk_mdp]
>
> (The calls to pm_runtime_get_sync are inlined and correspond to the
> calls to __pm_runtime_resume). It is not correct to have
> pm_runtime_get_sync called recursively and the second call will block
> indefinitely.
>
> As a result of all that, this change factors mtk_mdp_comp_clock_on/off
> into mtk_mdp_comp_power_on/off and moves the calls to
> pm_runtime_get/put into the power_on/off functions.
>
> This change then special-cases the master/rdma0 MDP component and does
> these things:
> - the master/rdma0 component is not added to mtk_mdp_dev.comp_list
> - the master/rdma0 component has its clocks (*but not power*) toggled
>   by mtk_mpd_comp_clock_on/off inside mtk_mdp_clock_on/off.
> - the other components have their clocks *and* power toggled with
>   mtk_mdp_comp_power_on/off.
>
> This change introduces the assumption that mtk_mdp_pm_resume will
> always be called though a callback from pm_runtime_get_sync made on the
> master / rdma0 component.
>
> Signed-off-by: Eizan Miyamoto <eizan@chromium.org>
> ---
>
> (no changes since v1)
>
>  drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 57 ++++++++++++++---
>  drivers/media/platform/mtk-mdp/mtk_mdp_comp.h |  5 +-
>  drivers/media/platform/mtk-mdp/mtk_mdp_core.c | 62 ++++++++++++++-----
>  3 files changed, 98 insertions(+), 26 deletions(-)
>
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c b/drivers/medi=
a/platform/mtk-mdp/mtk_mdp_comp.c
> index 472c261b01e8..7b6c8a3f3455 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> @@ -51,9 +51,9 @@ static const struct of_device_id mtk_mdp_comp_driver_dt=
_match[] =3D {
>  };
>  MODULE_DEVICE_TABLE(of, mtk_mdp_comp_driver_dt_match);
>
> -int mtk_mdp_comp_clock_on(struct mtk_mdp_comp *comp)
> +int mtk_mdp_comp_power_on(struct mtk_mdp_comp *comp)
>  {
> -       int i, err, status;
> +       int status, err;
>
>         if (comp->larb_dev) {
>                 err =3D mtk_smi_larb_get(comp->larb_dev);
> @@ -63,12 +63,54 @@ int mtk_mdp_comp_clock_on(struct mtk_mdp_comp *comp)
>
>         err =3D pm_runtime_get_sync(comp->dev);
>         if (err < 0) {
> -               dev_err(comp->dev,
> -                       "failed to runtime get, err %d.\n",
> -                       err);
> +               dev_err(comp->dev, "failed to runtime get, err %d.\n", er=
r);
>                 return err;
>         }
>
> +       err =3D mtk_mdp_comp_clock_on(comp);
> +       if (err) {
> +               dev_err(comp->dev, "failed to turn on clock. err=3D%d", e=
rr);
> +               status =3D err;
> +               goto err_mtk_mdp_comp_clock_on;
> +       }
> +
> +       return 0;
> +
> +err_mtk_mdp_comp_clock_on:
> +       err =3D pm_runtime_put_sync(comp->dev);
> +       if (err)
> +               dev_err(comp->dev, "failed to runtime put in cleanup. err=
=3D%d", err);
> +
> +       return status;
> +}
> +
> +int mtk_mdp_comp_power_off(struct mtk_mdp_comp *comp)
> +{
> +       int status, err;
> +
> +       mtk_mdp_comp_clock_off(comp);
> +
> +       err =3D pm_runtime_put_sync(comp->dev);
> +       if (err < 0) {
> +               dev_err(comp->dev, "failed to runtime put, err %d.\n", er=
r);
> +               status =3D err;
> +               goto err_pm_runtime_put_sync;
> +       }
> +
> +       return 0;
> +
> +err_pm_runtime_put_sync:
> +       err =3D mtk_mdp_comp_clock_on(comp);
> +       if (err)
> +               dev_err(comp->dev, "failed to turn on clock in cleanup. e=
rr=3D%d", err);
> +
> +       return status;
> +}
> +
> +int mtk_mdp_comp_clock_on(struct mtk_mdp_comp *comp)
> +{
> +       int i, err, status;
> +
>         for (i =3D 0; i < ARRAY_SIZE(comp->clk); i++) {
>                 if (IS_ERR(comp->clk[i]))
>                         continue;
> @@ -94,7 +136,8 @@ int mtk_mdp_comp_clock_on(struct mtk_mdp_comp *comp)
>         return status;
>  }
>
> -int mtk_mdp_comp_clock_off(struct mtk_mdp_comp *comp)
> +
> +void mtk_mdp_comp_clock_off(struct mtk_mdp_comp *comp)
>  {
>         int i;
>
> @@ -106,8 +149,6 @@ int mtk_mdp_comp_clock_off(struct mtk_mdp_comp *comp)
>
>         if (comp->larb_dev)
>                 mtk_smi_larb_put(comp->larb_dev);
> -
> -       return pm_runtime_put_sync(comp->dev);
>  }
>
>  static int mtk_mdp_comp_bind(struct device *dev, struct device *master, =
void *data)
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h b/drivers/medi=
a/platform/mtk-mdp/mtk_mdp_comp.h
> index f2e22e7e7c45..e3d6aef52869 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
> @@ -23,8 +23,11 @@ struct mtk_mdp_comp {
>
>  int mtk_mdp_comp_init(struct mtk_mdp_comp *comp, struct device *dev);
>
> +int mtk_mdp_comp_power_on(struct mtk_mdp_comp *comp);
> +int mtk_mdp_comp_power_off(struct mtk_mdp_comp *comp);
> +
>  int mtk_mdp_comp_clock_on(struct mtk_mdp_comp *comp);
> -int mtk_mdp_comp_clock_off(struct mtk_mdp_comp *comp);
> +void mtk_mdp_comp_clock_off(struct mtk_mdp_comp *comp);
>
>  extern struct platform_driver mtk_mdp_component_driver;
>
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c b/drivers/medi=
a/platform/mtk-mdp/mtk_mdp_core.c
> index 714154450981..a72a9ba41ea6 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> @@ -57,29 +57,64 @@ static int mtk_mdp_clock_on(struct mtk_mdp_dev *mdp)
>         struct device *dev =3D &mdp->pdev->dev;
>         int err;
>
> +       /*
> +        * The master / rdma0 component will have pm_runtime_get_sync cal=
led
> +        * on it through mtk_mdp_m2m_start_streaming, making it unnecessa=
ry to
> +        * have mtk_mdp_comp_power_on called on it.
> +        */
> +       err =3D mtk_mdp_comp_clock_on(&mdp->comp_self);
> +       if (err)
> +               return err;
> +
>         list_for_each_entry(comp_node, &mdp->comp_list, node) {
> -               err =3D mtk_mdp_comp_clock_on(comp_node);
> +               err =3D mtk_mdp_comp_power_on(comp_node);
>                 if (err) {
>                         status =3D err;
> -                       goto err_mtk_mdp_comp_clock_on;
> +                       goto err_mtk_mdp_comp_power_on;
>                 }
>         }
>
>         return 0;
>
> -err_mtk_mdp_comp_clock_on:
> -       list_for_each_entry_continue_reverse(comp_node, &mdp->comp_list, =
node)
> -               mtk_mdp_comp_clock_off(comp_node);
> -
> +err_mtk_mdp_comp_power_on:
> +       list_for_each_entry_continue_reverse(comp_node, &mdp->comp_list, =
node) {
> +               err =3D mtk_mdp_comp_power_off(comp_node);
> +               if (err)
> +                       dev_err(&mdp->pdev->dev, "failed to power off aft=
er error. err=3D%d", err);
> +       }
>         return status;
>  }
>
> -static void mtk_mdp_clock_off(struct mtk_mdp_dev *mdp)
> +static int mtk_mdp_clock_off(struct mtk_mdp_dev *mdp)
>  {
>         struct mtk_mdp_comp *comp_node;
> +       int status, err;
> +
> +       list_for_each_entry(comp_node, &mdp->comp_list, node) {
> +               err =3D mtk_mdp_comp_power_off(comp_node);
> +               if (err) {
> +                       status =3D err;
> +                       goto err_mtk_mdp_comp_power_off;
> +               }
> +       }
>
> -       list_for_each_entry(comp_node, &mdp->comp_list, node)
> -               mtk_mdp_comp_clock_off(comp_node);
> +       /*
> +        * The master / rdma0 component will have pm_runtime_put called
> +        * on it through mtk_mdp_m2m_stop_streaming, making it unnecessar=
y to
> +        * have mtk_mdp_comp_power_off called on it.
> +        */
> +       mtk_mdp_comp_clock_off(&mdp->comp_self);
> +
> +       return 0;
> +
> +err_mtk_mdp_comp_power_off:
> +       list_for_each_entry_continue_reverse(comp_node, &mdp->comp_list, =
node) {
> +               err =3D mtk_mdp_comp_power_on(comp_node);
> +               if (err)
> +                       dev_err(&mdp->pdev->dev, "failed to power on afte=
r error. err=3D%d", err);
> +       }
> +
> +       return status;
>  }
>
>  static void mtk_mdp_wdt_worker(struct work_struct *work)
> @@ -118,8 +153,6 @@ static int mtk_mdp_master_bind(struct device *dev)
>         int status;
>         struct mtk_mdp_dev *mdp =3D dev_get_drvdata(dev);
>
> -       mtk_mdp_register_component(mdp, &mdp->comp_self);
> -
>         status =3D component_bind_all(dev, mdp);
>         if (status) {
>                 dev_err(dev, "Failed to bind all components: %d\n", statu=
s);
> @@ -140,8 +173,6 @@ static int mtk_mdp_master_bind(struct device *dev)
>         component_unbind_all(dev, mdp);
>
>  err_component_bind_all:
> -       mtk_mdp_unregister_component(mdp, &mdp->comp_self);
> -
>         return status;
>  }
>
> @@ -152,7 +183,6 @@ static void mtk_mdp_master_unbind(struct device *dev)
>         pm_runtime_disable(dev);
>         mtk_mdp_unregister_m2m_device(mdp);
>         component_unbind_all(dev, mdp);
> -       mtk_mdp_unregister_component(mdp, &mdp->comp_self);
>  }
>
>  static const struct component_master_ops mtk_mdp_com_ops =3D {
> @@ -337,9 +367,7 @@ static int __maybe_unused mtk_mdp_pm_suspend(struct d=
evice *dev)
>  {
>         struct mtk_mdp_dev *mdp =3D dev_get_drvdata(dev);
>
> -       mtk_mdp_clock_off(mdp);
> -
> -       return 0;
> +       return mtk_mdp_clock_off(mdp);
>  }
>
>  static int __maybe_unused mtk_mdp_pm_resume(struct device *dev)
> --
> 2.32.0.554.ge1b32706d8-goog
>
