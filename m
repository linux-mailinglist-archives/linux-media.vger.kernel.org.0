Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D58043DEAE2
	for <lists+linux-media@lfdr.de>; Tue,  3 Aug 2021 12:27:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235418AbhHCK1z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Aug 2021 06:27:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235385AbhHCK1t (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Aug 2021 06:27:49 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D718DC061796;
        Tue,  3 Aug 2021 03:27:38 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id o2-20020a9d22020000b0290462f0ab0800so20218103ota.11;
        Tue, 03 Aug 2021 03:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=c2dWDh4qz5shxMaI1v8BLUSw4NsbRWOk0Fbsat4Rxj4=;
        b=RoFyMpupNoDPEzLg2DKdP+au/RS5CuuGDUHXtGu1RkcYxW6GFlCRRKzUL7zhwDxiZ+
         kI/c+CKnoO72HDaasytFAnoA+Rr3zprlcTf3w6BaXMXKI+DYOX8PpPV+s/e099fsFvjy
         LMy4vLYBOYgUu0ttk9mw5NlysnLm3B9bv/3dNnom6ITW7Y7WaGhLRPjFP9aYRd5QaZN2
         lmzNI/TGQA5ydxvLtIhCW3jyihqtrcoy1voO2N+Q7nKIiJ2hQqQ8BS650lVOwAdHqWR2
         D/7094ZSod7RCNq5C52ctnTteseqzpbnVYtTzy2ieql3XW4pk+ws3ijHPt277VI0CEpF
         6GOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=c2dWDh4qz5shxMaI1v8BLUSw4NsbRWOk0Fbsat4Rxj4=;
        b=MqiAgO+pFDoxnQBGAM+Q8iY7CD1IN3/HPahesVBAUBJsnpiz0ILOOt0DhAuxY8T30F
         eMBrXGUXcnm7lG84GRjGhLY7t3s9LsTqKbr9jtzIREGu34cmYcgRHbzLG6elx/DDNU4S
         naGPQrg6KCM36wqi/8XvZ/z1y421+g0kUpNdwZcJMoU8jIOUPUs8zUugw9TeVl+oEd3Y
         QBteJ1EdQ2lZnMtua9TDL26rjEqhU9rL6Rsc//dCP6BNB2owMGv13c2GYkETkO/aHIZa
         CmgxXqlMtuVrhn75l0JhBElXs/ZvHqGWe1vcMsDvfBNN5qd3IF4SU6hr7aEZD19bPp7m
         LsVA==
X-Gm-Message-State: AOAM5308dDzJa6Saxg1KGfjqjCGKKNZNLyABAZessH9b12pflf8764gD
        ThaumOkD6lg939uI3TB+OQJascB53ld1m8ZpY5o=
X-Google-Smtp-Source: ABdhPJxyCw7GErMEHcrHo3IkI06W10/FjV9+tC5KWit6K9LxuXzZQeQjC3r+ppbNL1d9vOz0oYMaXrmkuhWDSYYa1yU=
X-Received: by 2002:a9d:d86:: with SMTP id 6mr1355705ots.362.1627986458256;
 Tue, 03 Aug 2021 03:27:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210802121215.703023-1-eizan@chromium.org> <20210802220943.v6.7.I2049e180dca12e0d1b3178bfc7292dcf9e05ac28@changeid>
In-Reply-To: <20210802220943.v6.7.I2049e180dca12e0d1b3178bfc7292dcf9e05ac28@changeid>
From:   Enric Balletbo Serra <eballetbo@gmail.com>
Date:   Tue, 3 Aug 2021 12:27:26 +0200
Message-ID: <CAFqH_527RL56P=zEg7yTaeeqTvFOjT3ThxpX-Qumk25dR6+-bA@mail.gmail.com>
Subject: Re: [PATCH v6 7/9] media: mtk-mdp: use mdp-rdma0 alias to point to
 MDP master
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
2021 a les 14:14:
>
> ... Instead of depending on the presence of a mediatek,vpu property in

Looks like there is something missing in the commit message?

> the device node.
>
> That property was originally added to link to the vpu node so that the
> mtk_mdp_core driver could pass the right device to
> vpu_wdt_reg_handler(). However in a previous patch in this series,
> the driver has been modified to search the device tree for that node
> instead.
>
> That property was also used to indicate the primary MDP device, so that
> it can be passed to the V4L2 subsystem as well as register it to be
> used when setting up queues in the open() callback for the filesystem
> device node that is created. In this case, assuming that the primary
> MDP device is the one with a specific alias seems useable because the
> alternative is to add a property to the device tree which doesn't
> actually represent any facet of hardware (i.e., this being the primary
> MDP device is a software decision). In other words, this solution is
> equally as arbitrary, but at least it doesn't add a property to a
> device node where said property is unrelated to the hardware present.
>
> Signed-off-by: Eizan Miyamoto <eizan@chromium.org>

Other than the above,

Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>



> ---
>
> (no changes since v1)
>
>  drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 56 +++++++++++++------
>  drivers/media/platform/mtk-mdp/mtk_mdp_core.c | 36 ++++++++----
>  2 files changed, 64 insertions(+), 28 deletions(-)
>
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c b/drivers/medi=
a/platform/mtk-mdp/mtk_mdp_comp.c
> index 85ef274841a3..9527649de98e 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> @@ -151,29 +151,50 @@ void mtk_mdp_comp_clock_off(struct mtk_mdp_comp *co=
mp)
>                 mtk_smi_larb_put(comp->larb_dev);
>  }
>
> -static int mtk_mdp_comp_bind(struct device *dev, struct device *master, =
void *data)
> +/*
> + * The MDP master device node is identified by the device tree alias
> + * "mdp-rdma0".
> + */
> +static bool is_mdp_master(struct device *dev)
> +{
> +       struct device_node *aliases, *mdp_rdma0_node;
> +       const char *mdp_rdma0_path;
> +
> +       if (!dev->of_node)
> +               return false;
> +
> +       aliases =3D of_find_node_by_path("/aliases");
> +       if (!aliases) {
> +               dev_err(dev, "no aliases found for mdp-rdma0");
> +               return false;
> +       }
> +
> +       mdp_rdma0_path =3D of_get_property(aliases, "mdp-rdma0", NULL);
> +       if (!mdp_rdma0_path) {
> +               dev_err(dev, "get mdp-rdma0 property of /aliases failed")=
;
> +               return false;
> +       }
> +
> +       mdp_rdma0_node =3D of_find_node_by_path(mdp_rdma0_path);
> +       if (!mdp_rdma0_node) {
> +               dev_err(dev, "path resolution failed for %s", mdp_rdma0_p=
ath);
> +               return false;
> +       }
> +
> +       return dev->of_node =3D=3D mdp_rdma0_node;
> +}
> +
> +static int mtk_mdp_comp_bind(struct device *dev, struct device *master,
> +                       void *data)
>  {
>         struct mtk_mdp_comp *comp =3D dev_get_drvdata(dev);
>         struct mtk_mdp_dev *mdp =3D data;
> -       struct device_node *vpu_node;
>
>         mtk_mdp_register_component(mdp, comp);
>
> -       /*
> -        * If this component has a "mediatek-vpu" property, it is respons=
ible for
> -        * notifying the mdp master driver about it so it can be further =
initialized
> -        * later.
> -        */
> -       vpu_node =3D of_parse_phandle(dev->of_node, "mediatek,vpu", 0);
> -       if (vpu_node) {
> +       if (is_mdp_master(dev)) {
>                 int ret;
>
> -               mdp->vpu_dev =3D of_find_device_by_node(vpu_node);
> -               if (WARN_ON(!mdp->vpu_dev)) {
> -                       dev_err(dev, "vpu pdev failed\n");
> -                       of_node_put(vpu_node);
> -               }
> -
>                 ret =3D v4l2_device_register(dev, &mdp->v4l2_dev);
>                 if (ret) {
>                         dev_err(dev, "Failed to register v4l2 device\n");
> @@ -187,9 +208,8 @@ static int mtk_mdp_comp_bind(struct device *dev, stru=
ct device *master, void *da
>                 }
>
>                 /*
> -                * presence of the "mediatek,vpu" property in a device no=
de
> -                * indicates that it is the primary MDP rdma device and M=
DP DMA
> -                * ops should be handled by its DMA callbacks.
> +                * MDP DMA ops will be handled by the DMA callbacks assoc=
iated with this
> +                * device;
>                  */
>                 mdp->rdma_dev =3D dev;
>         }
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c b/drivers/medi=
a/platform/mtk-mdp/mtk_mdp_core.c
> index 50eafcc9993d..6a775463399c 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> @@ -150,8 +150,9 @@ static void release_of(struct device *dev, void *data=
)
>
>  static int mtk_mdp_master_bind(struct device *dev)
>  {
> -       int status;
>         struct mtk_mdp_dev *mdp =3D dev_get_drvdata(dev);
> +       struct device_node *vpu_node;
> +       int status;
>
>         status =3D component_bind_all(dev, mdp);
>         if (status) {
> @@ -159,15 +160,30 @@ static int mtk_mdp_master_bind(struct device *dev)
>                 goto err_component_bind_all;
>         }
>
> -       if (mdp->vpu_dev) {
> -               int ret =3D vpu_wdt_reg_handler(mdp->vpu_dev, mtk_mdp_res=
et_handler, mdp,
> -                                         VPU_RST_MDP);
> -               if (ret) {
> -                       dev_err(dev, "Failed to register reset handler\n"=
);
> -                       goto err_wdt_reg;
> -               }
> -       } else {
> -               dev_err(dev, "no vpu_dev found\n");
> +       if (mdp->rdma_dev =3D=3D NULL) {
> +               dev_err(dev, "Primary MDP device not found");
> +               status =3D -ENODEV;
> +               goto err_component_bind_all;
> +       }
> +
> +       vpu_node =3D of_find_node_by_name(NULL, "vpu");
> +       if (!vpu_node) {
> +               dev_err(dev, "unable to find vpu node");
> +               status =3D -ENODEV;
> +               goto err_wdt_reg;
> +       }
> +
> +       mdp->vpu_dev =3D of_find_device_by_node(vpu_node);
> +       if (!mdp->vpu_dev) {
> +               dev_err(dev, "unable to find vpu device");
> +               status =3D -ENODEV;
> +               goto err_wdt_reg;
> +       }
> +
> +       status =3D vpu_wdt_reg_handler(mdp->vpu_dev, mtk_mdp_reset_handle=
r, mdp, VPU_RST_MDP);
> +       if (status) {
> +               dev_err(dev, "Failed to register reset handler\n");
> +               goto err_wdt_reg;
>         }
>
>         status =3D mtk_mdp_register_m2m_device(mdp);
> --
> 2.32.0.554.ge1b32706d8-goog
>
