Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 940693DEADF
	for <lists+linux-media@lfdr.de>; Tue,  3 Aug 2021 12:27:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235300AbhHCK1y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Aug 2021 06:27:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235306AbhHCK1r (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Aug 2021 06:27:47 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8C32C06175F;
        Tue,  3 Aug 2021 03:27:35 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id h63-20020a9d14450000b02904ce97efee36so9569386oth.7;
        Tue, 03 Aug 2021 03:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=RJAjOyAh19SP1Ix7/MKH3LkSUFdLMkQa6ATb2Y1qi4U=;
        b=Cd0qqpK58mxj51BHyt2eKmFcavbOyoBJ6oj2vG4qQ0uMHpoVjfYJb8rAqHsW8eLgIW
         FZI+eOn64x5eJG/x84cBapAI0sv9a4mIG3MbUd5TkfQpM9vaCw+SUcmfQ8YrHJY5MKDF
         wfZg6Fd+7kGICrMP8HTTdU9rwMDR5Y2kfHM4mlyQTMmPocwL+KKpCXwGPH5Ff/n2FHVm
         LTTlqHvwNnNAQDrGOREdf3c1cSmkq862P69WMQNga9qar2T+Z8gcj3tCYbuMzQcgPcv0
         O/ZLWZ7BIEzM8jB4eoLYWZvvD6HUCJU+JZnsQo5zNP1t3cKS/Xk1DNnxNfG/9XUsNJkM
         wPLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=RJAjOyAh19SP1Ix7/MKH3LkSUFdLMkQa6ATb2Y1qi4U=;
        b=mc1rG0MBiztPWv6mbMRrysstYeFjrlV8B1b7rVCSUt8EQIE5Skf7sYElgiZJTqGpvh
         HomlaZP3ZZDNnRQ1UEr5pEhLH32aD/FIEsjMALFZJ9yN+/MhT5Pfnvk6QTOq73IQEUXC
         f3k/05T/hZDcDxhCJpPcwHjaPswAuiUFQPxHcwjfbFfDP4VwnCYf9SzkE9QczgB/il/v
         3Yok5aWuANvt5Y7shihD/rcjhZJG1Jm708PQ9QI+1SdFDvwGdW8vPa01io9SWuesDa11
         X739Yt/vCySfUN5a00gSCDJBpZ0bmeBRiK7yniYTTG4x0glupN12r/fTsCKRRamYbBR/
         q+PA==
X-Gm-Message-State: AOAM532lHPrAdDioZDWHRksWLgUodvN+QcDcMz0jHof5lc3ES987QE65
        54xpQgP9D+Vl5MuFVRRMb+ilBVc9Tp2O2l0d9P4=
X-Google-Smtp-Source: ABdhPJzKnLzGq6sHRrNssYpt7odgWCVCMvvPta/G9lfrIc2jwiNf6k2x/K2tBI13P4PlaScvvFI8fkPk1MRByfJRaGw=
X-Received: by 2002:a9d:6490:: with SMTP id g16mr14923290otl.184.1627986454960;
 Tue, 03 Aug 2021 03:27:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210802121215.703023-1-eizan@chromium.org> <20210802220943.v6.5.Iedb6b4f47788548b0cf7bfffae85cac917344c2f@changeid>
In-Reply-To: <20210802220943.v6.5.Iedb6b4f47788548b0cf7bfffae85cac917344c2f@changeid>
From:   Enric Balletbo Serra <eballetbo@gmail.com>
Date:   Tue, 3 Aug 2021 12:27:21 +0200
Message-ID: <CAFqH_52pZ-7HtnVYtDQf-1Y000Tz-Omzs+eQuYV7Zm_K7sBxJQ@mail.gmail.com>
Subject: Re: [PATCH v6 5/9] mtk-mdp: make mdp driver to be loadable by platform_device_register*()
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
> Rather than hanging the MDP master component driver off of the rdma0
> device, make it possible too create a "virtual" device by registering
> it with platform_device_register_*() to be probed by the mtk_mdp_core
> driver.
>
> Broadly, three interdependent things are done by this change:
> - Make it is possible to search for MDP devices in the device tree
>   through the grandparent device's of_node.
> - v4l-related setup is moved into from the mtk_mdp_core driver to the
>   mtk_mdp_comp driver.
> - Presence of a mediatek,vpu property in an MDP component device node
>   is used to determine what device to use when dispatching DMA ops from
>   the relevant ioctl, and also do V4L2 initialization in this case.
>
> Signed-off-by: Eizan Miyamoto <eizan@chromium.org>
> ---
>
> Changes in v6:
> - Don't propagate errors from clock_on/off as an afterthought.
> - Split apart modifying mdp driver to be loadable from mmsys from
>   actually loading it from mmsys into two changs to make review easier.
> - Update devicetree bindings to reflect no longer needing the
>   mediatek,vpu property in the mdp_rdma0 device node.
> - Some stylistic cleanups.
>
> Changes in v5:
> - rebase and test on 5.13-next @ e2f74b13dbe6
>
> Changes in v4:
> - rebase and test on 5.13
> - don't depend on https://patchwork.kernel.org/project/linux-mediatek/lis=
t/?series=3D464873
>
> Changes in v3:
> - get mdp master from aliases instead of strcmp against of_node->name
>
> Changes in v2:
> - rebased onto Linux 5.12
> - 100 char line length allowance was utilized in a few places
> - Removal of a redundant dev_err() print at the end of
>   mtk_mdp_comp_init()
> - Instead of printing errors and ignoring them, I've added a patch to
>   correctly propagate them.
> - Use of C style comments.
> - Three additional patches were added to eliminate dependency on the
>   mediatek,vpu property inside the mdp_rdma0 device node.
>
>  drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 51 ++++++++++-----
>  drivers/media/platform/mtk-mdp/mtk_mdp_core.c | 62 ++++++-------------
>  drivers/media/platform/mtk-mdp/mtk_mdp_core.h |  2 +
>  drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c  |  4 +-
>  4 files changed, 60 insertions(+), 59 deletions(-)
>
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c b/drivers/medi=
a/platform/mtk-mdp/mtk_mdp_comp.c
> index 7b6c8a3f3455..85ef274841a3 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> @@ -155,8 +155,45 @@ static int mtk_mdp_comp_bind(struct device *dev, str=
uct device *master, void *da
>  {
>         struct mtk_mdp_comp *comp =3D dev_get_drvdata(dev);
>         struct mtk_mdp_dev *mdp =3D data;
> +       struct device_node *vpu_node;
>
>         mtk_mdp_register_component(mdp, comp);
> +
> +       /*
> +        * If this component has a "mediatek-vpu" property, it is respons=
ible for
> +        * notifying the mdp master driver about it so it can be further =
initialized
> +        * later.
> +        */
> +       vpu_node =3D of_parse_phandle(dev->of_node, "mediatek,vpu", 0);
> +       if (vpu_node) {
> +               int ret;
> +
> +               mdp->vpu_dev =3D of_find_device_by_node(vpu_node);
> +               if (WARN_ON(!mdp->vpu_dev)) {

This looks a bit excessive IMO, but on the other hand looks like this
is a transitional patch as all this will be removed after some rework
on the latest patch.

> +                       dev_err(dev, "vpu pdev failed\n");

You already did a WARN_ON, this print is not needed. But again, all
this seems to be transitional and is removed later. So it doesn't
really bothers me

Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>


> +                       of_node_put(vpu_node);
> +               }
> +
> +               ret =3D v4l2_device_register(dev, &mdp->v4l2_dev);
> +               if (ret) {
> +                       dev_err(dev, "Failed to register v4l2 device\n");
> +                       return -EINVAL;
> +               }
> +
> +               ret =3D vb2_dma_contig_set_max_seg_size(dev, DMA_BIT_MASK=
(32));
> +               if (ret) {
> +                       dev_err(dev, "Failed to set vb2 dma mag seg size\=
n");
> +                       return -EINVAL;
> +               }
> +
> +               /*
> +                * presence of the "mediatek,vpu" property in a device no=
de
> +                * indicates that it is the primary MDP rdma device and M=
DP DMA
> +                * ops should be handled by its DMA callbacks.
> +                */
> +               mdp->rdma_dev =3D dev;
> +       }
> +
>         pm_runtime_enable(dev);
>
>         return 0;
> @@ -237,23 +274,9 @@ int mtk_mdp_comp_init(struct mtk_mdp_comp *comp, str=
uct device *dev)
>  static int mtk_mdp_comp_probe(struct platform_device *pdev)
>  {
>         struct device *dev =3D &pdev->dev;
> -       struct device_node *vpu_node;
>         int status;
>         struct mtk_mdp_comp *comp;
>
> -       vpu_node =3D of_parse_phandle(dev->of_node, "mediatek,vpu", 0);
> -       if (vpu_node) {
> -               of_node_put(vpu_node);
> -               /*
> -                * The device tree node with a mediatek,vpu property is d=
eemed
> -                * the MDP "master" device, we don't want to add a compon=
ent
> -                * for it in this function because the initialization for=
 the
> -                * master is done elsewhere.
> -                */
> -               dev_info(dev, "vpu node found, not probing\n");
> -               return -ENODEV;
> -       }
> -
>         comp =3D devm_kzalloc(dev, sizeof(*comp), GFP_KERNEL);
>         if (!comp)
>                 return -ENOMEM;
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c b/drivers/medi=
a/platform/mtk-mdp/mtk_mdp_core.c
> index a72a9ba41ea6..50eafcc9993d 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> @@ -159,6 +159,17 @@ static int mtk_mdp_master_bind(struct device *dev)
>                 goto err_component_bind_all;
>         }
>
> +       if (mdp->vpu_dev) {
> +               int ret =3D vpu_wdt_reg_handler(mdp->vpu_dev, mtk_mdp_res=
et_handler, mdp,
> +                                         VPU_RST_MDP);
> +               if (ret) {
> +                       dev_err(dev, "Failed to register reset handler\n"=
);
> +                       goto err_wdt_reg;
> +               }
> +       } else {
> +               dev_err(dev, "no vpu_dev found\n");
> +       }
> +
>         status =3D mtk_mdp_register_m2m_device(mdp);
>         if (status) {
>                 dev_err(dev, "Failed to register m2m device: %d\n", statu=
s);
> @@ -170,6 +181,8 @@ static int mtk_mdp_master_bind(struct device *dev)
>         return 0;
>
>  err_mtk_mdp_register_m2m_device:
> +
> +err_wdt_reg:
>         component_unbind_all(dev, mdp);
>
>  err_component_bind_all:
> @@ -228,8 +241,13 @@ static int mtk_mdp_probe(struct platform_device *pde=
v)
>                 of_node_put(node);
>                 parent =3D dev->of_node;
>                 dev_warn(dev, "device tree is out of date\n");
> -       } else {
> +       } else if (dev->of_node) {
>                 parent =3D dev->of_node->parent;
> +       } else if (dev->parent) {
> +               /* maybe we were created from a call to platform_device_r=
egister_data() */
> +               parent =3D dev->parent->parent->of_node;
> +       } else {
> +               return -ENODEV;
>         }
>
>         /* Iterate over sibling MDP function blocks */
> @@ -262,16 +280,6 @@ static int mtk_mdp_probe(struct platform_device *pde=
v)
>                 }
>         }
>
> -       /*
> -        * Create a component for myself so that clocks can be toggled in
> -        * clock_on().
> -        */
> -       ret =3D mtk_mdp_comp_init(&mdp->comp_self, dev);
> -       if (ret) {
> -               dev_err(dev, "Failed to initialize component\n");
> -               goto err_comp;
> -       }
> -
>         mdp->job_wq =3D create_singlethread_workqueue(MTK_MDP_MODULE_NAME=
);
>         if (!mdp->job_wq) {
>                 dev_err(&pdev->dev, "unable to alloc job workqueue\n");
> @@ -287,29 +295,8 @@ static int mtk_mdp_probe(struct platform_device *pde=
v)
>         }
>         INIT_WORK(&mdp->wdt_work, mtk_mdp_wdt_worker);
>
> -       ret =3D v4l2_device_register(dev, &mdp->v4l2_dev);
> -       if (ret) {
> -               dev_err(&pdev->dev, "Failed to register v4l2 device\n");
> -               ret =3D -EINVAL;
> -               goto err_dev_register;
> -       }
> -
> -       mdp->vpu_dev =3D vpu_get_plat_device(pdev);
> -       ret =3D vpu_wdt_reg_handler(mdp->vpu_dev, mtk_mdp_reset_handler, =
mdp,
> -                                 VPU_RST_MDP);
> -       if (ret) {
> -               dev_err(&pdev->dev, "Failed to register reset handler\n")=
;
> -               goto err_wdt_reg;
> -       }
> -
>         platform_set_drvdata(pdev, mdp);
>
> -       ret =3D vb2_dma_contig_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(=
32));
> -       if (ret) {
> -               dev_err(&pdev->dev, "Failed to set vb2 dma mag seg size\n=
");
> -               goto err_set_max_seg_size;
> -       }
> -
>         ret =3D component_master_add_with_match(dev, &mtk_mdp_com_ops, ma=
tch);
>         if (ret) {
>                 dev_err(dev, "Component master add failed\n");
> @@ -321,22 +308,12 @@ static int mtk_mdp_probe(struct platform_device *pd=
ev)
>         return 0;
>
>  err_component_master_add:
> -       vb2_dma_contig_clear_max_seg_size(&pdev->dev);
> -
> -err_set_max_seg_size:
> -
> -err_wdt_reg:
> -       v4l2_device_unregister(&mdp->v4l2_dev);
> -
> -err_dev_register:
>         destroy_workqueue(mdp->wdt_wq);
>
>  err_alloc_wdt_wq:
>         destroy_workqueue(mdp->job_wq);
>
>  err_alloc_job_wq:
> -
> -err_comp:
>         dev_dbg(dev, "err %d\n", ret);
>         return ret;
>  }
> @@ -404,7 +381,6 @@ static struct platform_driver mtk_mdp_driver =3D {
>         .driver =3D {
>                 .name   =3D MTK_MDP_MODULE_NAME,
>                 .pm     =3D &mtk_mdp_pm_ops,
> -               .of_match_table =3D mtk_mdp_of_ids,
>         }
>  };
>
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_core.h b/drivers/medi=
a/platform/mtk-mdp/mtk_mdp_core.h
> index 8a52539b15d4..9fcd8b8e7c25 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_core.h
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_core.h
> @@ -133,6 +133,7 @@ struct mtk_mdp_variant {
>   * struct mtk_mdp_dev - abstraction for image processor entity
>   * @lock:      the mutex protecting this data structure
>   * @vpulock:   the mutex protecting the communication with VPU
> + * @rdma_dev:  device pointer to rdma device for MDP
>   * @pdev:      pointer to the image processor platform device
>   * @variant:   the IP variant information
>   * @id:                image processor device index (0..MTK_MDP_MAX_DEVS=
)
> @@ -151,6 +152,7 @@ struct mtk_mdp_variant {
>  struct mtk_mdp_dev {
>         struct mutex                    lock;
>         struct mutex                    vpulock;
> +       struct device                   *rdma_dev;
>         struct platform_device          *pdev;
>         struct mtk_mdp_variant          *variant;
>         u16                             id;
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c b/drivers/media=
/platform/mtk-mdp/mtk_mdp_m2m.c
> index f14779e7596e..9834d3bbe851 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c
> @@ -929,7 +929,7 @@ static int mtk_mdp_m2m_queue_init(void *priv, struct =
vb2_queue *src_vq,
>         src_vq->mem_ops =3D &vb2_dma_contig_memops;
>         src_vq->buf_struct_size =3D sizeof(struct v4l2_m2m_buffer);
>         src_vq->timestamp_flags =3D V4L2_BUF_FLAG_TIMESTAMP_COPY;
> -       src_vq->dev =3D &ctx->mdp_dev->pdev->dev;
> +       src_vq->dev =3D ctx->mdp_dev->rdma_dev;
>         src_vq->lock =3D &ctx->mdp_dev->lock;
>
>         ret =3D vb2_queue_init(src_vq);
> @@ -944,7 +944,7 @@ static int mtk_mdp_m2m_queue_init(void *priv, struct =
vb2_queue *src_vq,
>         dst_vq->mem_ops =3D &vb2_dma_contig_memops;
>         dst_vq->buf_struct_size =3D sizeof(struct v4l2_m2m_buffer);
>         dst_vq->timestamp_flags =3D V4L2_BUF_FLAG_TIMESTAMP_COPY;
> -       dst_vq->dev =3D &ctx->mdp_dev->pdev->dev;
> +       dst_vq->dev =3D ctx->mdp_dev->rdma_dev;
>         dst_vq->lock =3D &ctx->mdp_dev->lock;
>
>         return vb2_queue_init(dst_vq);
> --
> 2.32.0.554.ge1b32706d8-goog
>
