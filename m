Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8C601C6356
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2020 23:46:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729387AbgEEVqI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 May 2020 17:46:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729159AbgEEVqH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 5 May 2020 17:46:07 -0400
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com [IPv6:2607:f8b0:4864:20::741])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CF4BC061A0F;
        Tue,  5 May 2020 14:46:07 -0700 (PDT)
Received: by mail-qk1-x741.google.com with SMTP id c64so1114923qkf.12;
        Tue, 05 May 2020 14:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yY5CDBYB4eHRZ9ErTc6b0SkaS/OJJ2b1ZKbdsNo0pT4=;
        b=ChcfEYXUe9roSVSWajlOhpmztl7YKm60X1+gY7oEZg0f7sORT7pae3eHx9w8dkA1/8
         E+qENU19aKpaOaDhNYIDGXXj5MVA7itKVVAQqsuqbp2Zn+5+yaXwq0mthtTx/BwV8pjX
         urCv232AUz09ISOJzNnxd1BBSvnH+9LEcuktuDuB8MSFK/QpFYRjDgvk8ILh/KWTGHti
         kOYI0vgI+mEZddO90ansfJ8PPAqfpnLKdwNwOyXNEbm5my4/ObKUAJA4C8HAxypaPnC0
         4LdhclAJ2+9c0ir0d4YTHGqvkgH8dDv4dATu12+L+mPnlbCQZJ2FzarVND2acznW6k2t
         pNBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yY5CDBYB4eHRZ9ErTc6b0SkaS/OJJ2b1ZKbdsNo0pT4=;
        b=rH8xz/q2Zzo49LM9noVBz8KiEBw14KDK4XfRzA0Ww5gAA4yQW38pbo+QvpEM8/Du5H
         8zLEEzdXleRYrJ4OcetWWbMl9S6fzQoFO9CTBcX7FO0e/bp+rgfFAel4rMKhooxsrTBR
         wi/Lje3tSZ+cI6Q37jrPKm5dGww0Spr2Sc0QkLdRHjBdjGVAxkBCKeDFrngwBatD2Z2S
         p+uYOosOLV3h7nGvdadyOLO+6ooY6xV3P4Vm6d/d5qNp+FnYFzSJ04hGzdNSEyBPExSN
         VqLXgnvmXtbsEnYASI9vSB7LTmg49KMqZz5zTtyVeG+L43Q0/pa875xDKQGmRYoMlTiB
         DhVA==
X-Gm-Message-State: AGi0PubdbFuXwcCKop5XLjzEDGwfY64TW2JC4IpR9svDZPGbujnMpThx
        VSkQ6kjpjZdgO1wtsgiiFH8RKtt9zSJ1vFZsl18=
X-Google-Smtp-Source: APiQypLp62p8qck0yZBTWbwsB0xYvmFH9XnCtp6KS+iL/UnhU941uE0+Ky6q/g+57tAZFefpKbpzcn5QzR0MiZegMu4=
X-Received: by 2002:a37:6c81:: with SMTP id h123mr5559600qkc.290.1588715166575;
 Tue, 05 May 2020 14:46:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200505040048.132493-1-eizan@google.com> <20200505125042.v1.4.I7bbf54189e21badc5cc251dae85f2993b7c4ab69@changeid>
In-Reply-To: <20200505125042.v1.4.I7bbf54189e21badc5cc251dae85f2993b7c4ab69@changeid>
From:   Enric Balletbo Serra <eballetbo@gmail.com>
Date:   Tue, 5 May 2020 23:45:55 +0200
Message-ID: <CAFqH_51+M4npv+aKag-CKimf+B8CUnjVxj59Xb6C03fRKmO+Zg@mail.gmail.com>
Subject: Re: [PATCH v1 4/5] [media] mtk-mdp: convert mtk_mdp_dev.comp array to list
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
2020 a les 6:02:
>
> The functions mtk_mdp_register/unregister_component have been created to
> add / remove items from the list of components.
>
> This will eventually enable us to specify a list of components in the
> device tree instead of hardcoding them into this driver.
>
> The list is modified by a single thread at driver probe time, and will
> not be traversed by another thread until the call to pm_runtime_enable
> at the end of probing.
>
> Signed-off-by: eizan@chromium.org
> Signed-off-by: Eizan Miyamoto <eizan@google.com>

Ditto. Other than that.

Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>


> ---
>
>  drivers/media/platform/mtk-mdp/mtk_mdp_comp.c |  1 +
>  drivers/media/platform/mtk-mdp/mtk_mdp_comp.h |  2 +
>  drivers/media/platform/mtk-mdp/mtk_mdp_core.c | 46 +++++++++++++------
>  drivers/media/platform/mtk-mdp/mtk_mdp_core.h | 10 +++-
>  4 files changed, 43 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> index facc6104b91f..d4afed1363d5 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> @@ -103,6 +103,7 @@ int mtk_mdp_comp_init(struct device *dev, struct device_node *node,
>                 return -EINVAL;
>         }
>
> +       INIT_LIST_HEAD(&comp->node);
>         comp->dev_node = of_node_get(node);
>         comp->id = comp_id;
>         comp->type = mtk_mdp_matches[comp_id].type;
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
> index 3b83bd6e0d8b..1f745891c6c3 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
> @@ -36,6 +36,7 @@ enum mtk_mdp_comp_id {
>
>  /**
>   * struct mtk_mdp_comp - the MDP's function component data
> + * @node:      list node to track sibing MDP components
>   * @dev_node:  component device node
>   * @clk:       clocks required for component
>   * @larb_dev:  SMI device required for component
> @@ -43,6 +44,7 @@ enum mtk_mdp_comp_id {
>   * @id:                component ID
>   */
>  struct mtk_mdp_comp {
> +       struct list_head        node;
>         struct device_node      *dev_node;
>         struct clk              *clk[2];
>         struct device           *larb_dev;
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> index f974242663dc..e6e702d9cb69 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> @@ -55,19 +55,19 @@ MODULE_DEVICE_TABLE(of, mtk_mdp_of_ids);
>  static void mtk_mdp_clock_on(struct mtk_mdp_dev *mdp)
>  {
>         struct device *dev = &mdp->pdev->dev;
> -       int i;
> +       struct mtk_mdp_comp *comp_node;
>
> -       for (i = 0; i < ARRAY_SIZE(mdp->comp); i++)
> -               mtk_mdp_comp_clock_on(dev, mdp->comp[i]);
> +       list_for_each_entry(comp_node, &mdp->comp_list, node)
> +               mtk_mdp_comp_clock_on(dev, comp_node);
>  }
>
>  static void mtk_mdp_clock_off(struct mtk_mdp_dev *mdp)
>  {
>         struct device *dev = &mdp->pdev->dev;
> -       int i;
> +       struct mtk_mdp_comp *comp_node;
>
> -       for (i = 0; i < ARRAY_SIZE(mdp->comp); i++)
> -               mtk_mdp_comp_clock_off(dev, mdp->comp[i]);
> +       list_for_each_entry(comp_node, &mdp->comp_list, node)
> +               mtk_mdp_comp_clock_off(dev, comp_node);
>  }
>
>  static void mtk_mdp_wdt_worker(struct work_struct *work)
> @@ -91,12 +91,25 @@ static void mtk_mdp_reset_handler(void *priv)
>         queue_work(mdp->wdt_wq, &mdp->wdt_work);
>  }
>
> +void mtk_mdp_register_component(struct mtk_mdp_dev *mdp,
> +                               struct mtk_mdp_comp *comp)
> +{
> +       list_add(&mdp->comp_list, &comp->node);
> +}
> +
> +void mtk_mdp_unregister_component(struct mtk_mdp_dev *mdp,
> +                                 struct mtk_mdp_comp *comp)
> +{
> +       list_del(&comp->node);
> +}
> +
>  static int mtk_mdp_probe(struct platform_device *pdev)
>  {
>         struct mtk_mdp_dev *mdp;
>         struct device *dev = &pdev->dev;
>         struct device_node *node, *parent;
> -       int i, ret = 0;
> +       struct mtk_mdp_comp *comp, *comp_temp;
> +       int ret = 0;
>
>         mdp = devm_kzalloc(dev, sizeof(*mdp), GFP_KERNEL);
>         if (!mdp)
> @@ -104,6 +117,7 @@ static int mtk_mdp_probe(struct platform_device *pdev)
>
>         mdp->id = pdev->id;
>         mdp->pdev = pdev;
> +       INIT_LIST_HEAD(&mdp->comp_list);
>         INIT_LIST_HEAD(&mdp->ctx_list);
>
>         mutex_init(&mdp->lock);
> @@ -124,7 +138,6 @@ static int mtk_mdp_probe(struct platform_device *pdev)
>                 const struct of_device_id *of_id;
>                 enum mtk_mdp_comp_type comp_type;
>                 int comp_id;
> -               struct mtk_mdp_comp *comp;
>
>                 of_id = of_match_node(mtk_mdp_comp_dt_ids, node);
>                 if (!of_id)
> @@ -150,13 +163,14 @@ static int mtk_mdp_probe(struct platform_device *pdev)
>                         of_node_put(node);
>                         goto err_comp;
>                 }
> -               mdp->comp[comp_id] = comp;
>
>                 ret = mtk_mdp_comp_init(dev, node, comp, comp_id);
>                 if (ret) {
>                         of_node_put(node);
>                         goto err_comp;
>                 }
> +
> +               mtk_mdp_register_component(mdp, comp);
>         }
>
>         mdp->job_wq = create_singlethread_workqueue(MTK_MDP_MODULE_NAME);
> @@ -224,8 +238,10 @@ static int mtk_mdp_probe(struct platform_device *pdev)
>  err_alloc_job_wq:
>
>  err_comp:
> -       for (i = 0; i < ARRAY_SIZE(mdp->comp); i++)
> -               mtk_mdp_comp_deinit(dev, mdp->comp[i]);
> +       list_for_each_entry_safe(comp, comp_temp, &mdp->comp_list, node) {
> +               mtk_mdp_unregister_component(mdp, comp);
> +               mtk_mdp_comp_deinit(dev, comp);
> +       }
>
>         dev_dbg(dev, "err %d\n", ret);
>         return ret;
> @@ -234,7 +250,7 @@ static int mtk_mdp_probe(struct platform_device *pdev)
>  static int mtk_mdp_remove(struct platform_device *pdev)
>  {
>         struct mtk_mdp_dev *mdp = platform_get_drvdata(pdev);
> -       int i;
> +       struct mtk_mdp_comp *comp, *comp_temp;
>
>         pm_runtime_disable(&pdev->dev);
>         vb2_dma_contig_clear_max_seg_size(&pdev->dev);
> @@ -247,8 +263,10 @@ static int mtk_mdp_remove(struct platform_device *pdev)
>         flush_workqueue(mdp->job_wq);
>         destroy_workqueue(mdp->job_wq);
>
> -       for (i = 0; i < ARRAY_SIZE(mdp->comp); i++)
> -               mtk_mdp_comp_deinit(&pdev->dev, mdp->comp[i]);
> +       list_for_each_entry_safe(comp, comp_temp, &mdp->comp_list, node) {
> +               mtk_mdp_unregister_component(mdp, comp);
> +               mtk_mdp_comp_deinit(&pdev->dev, comp);
> +       }
>
>         dev_dbg(&pdev->dev, "%s driver unloaded\n", pdev->name);
>         return 0;
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_core.h b/drivers/media/platform/mtk-mdp/mtk_mdp_core.h
> index dd130cc218c9..a7da14b97077 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_core.h
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_core.h
> @@ -136,7 +136,7 @@ struct mtk_mdp_variant {
>   * @pdev:      pointer to the image processor platform device
>   * @variant:   the IP variant information
>   * @id:                image processor device index (0..MTK_MDP_MAX_DEVS)
> - * @comp:      MDP function components
> + * @comp_list: list of MDP function components
>   * @m2m_dev:   v4l2 memory-to-memory device data
>   * @ctx_list:  list of struct mtk_mdp_ctx
>   * @vdev:      video device for image processor driver
> @@ -154,7 +154,7 @@ struct mtk_mdp_dev {
>         struct platform_device          *pdev;
>         struct mtk_mdp_variant          *variant;
>         u16                             id;
> -       struct mtk_mdp_comp             *comp[MTK_MDP_COMP_ID_MAX];
> +       struct list_head                comp_list;
>         struct v4l2_m2m_dev             *m2m_dev;
>         struct list_head                ctx_list;
>         struct video_device             *vdev;
> @@ -221,6 +221,12 @@ struct mtk_mdp_ctx {
>
>  extern int mtk_mdp_dbg_level;
>
> +void mtk_mdp_register_component(struct mtk_mdp_dev *mdp,
> +                               struct mtk_mdp_comp *comp);
> +
> +void mtk_mdp_unregister_component(struct mtk_mdp_dev *mdp,
> +                                 struct mtk_mdp_comp *comp);
> +
>  #if defined(DEBUG)
>
>  #define mtk_mdp_dbg(level, fmt, args...)                                \
> --
> 2.26.2.526.g744177e7f7-goog
>
>
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
