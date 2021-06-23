Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B0E53B1832
	for <lists+linux-media@lfdr.de>; Wed, 23 Jun 2021 12:41:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230037AbhFWKnt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Jun 2021 06:43:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:54330 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229833AbhFWKnr (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Jun 2021 06:43:47 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8121E611CE;
        Wed, 23 Jun 2021 10:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624444890;
        bh=SfXOgGuAgO7vhYwOC+JWO72WGhlYb92qO1wdzr6JfjY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Jehgj2UonYKDScnD8sbwVPx4GPv5iK62nD1TFX2M/7zKn0Umj/aaoS6tOsa3DrINW
         Tu6wp60Yk+lmoG/gvt+55a0wLHYAPk5/TF4ptXcmJ7pUNxdDE2n+atf9qLutW6lwmd
         URrsLiGi+05a0Wv6vDxv9F2Pzs/vYX6RSt4VWRNwqUsYJZMiFPIGc8TDvSQIQEGMp2
         GbsNNY17Qrnb6A2cPTkjcuD9+sdBCQSlN964HhYbFYC5Dmp4BrVz3RaPiUvLHTE+jx
         HV4w0jbfyaAPk+8dm29o/HbHDastI0N94VPJIKgme37Vd3wYQK565XeN32MsKCZ3KA
         sBQzwXPw9wraw==
Received: by mail-ed1-f44.google.com with SMTP id h2so2795064edt.3;
        Wed, 23 Jun 2021 03:41:30 -0700 (PDT)
X-Gm-Message-State: AOAM530k4ab0OI2pmI9sBCWVVq0x3g+g7CSyoO1a6QC7Jx0nnXvBxCsN
        0Dg1Yu3Mli67chcpMQUlIJ4CLrd9LPchxN+j7w==
X-Google-Smtp-Source: ABdhPJwOOBSZ371QrvZL98gwzM7omrKAK7M04wdMFnvogwkefUJzh8wJIMDIyi8edPUHRmaxCXzfHELNYL4NBeuR0Yk=
X-Received: by 2002:a05:6402:1777:: with SMTP id da23mr11259427edb.72.1624444888919;
 Wed, 23 Jun 2021 03:41:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210623073549.24170-1-moudy.ho@mediatek.com>
In-Reply-To: <20210623073549.24170-1-moudy.ho@mediatek.com>
From:   Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date:   Wed, 23 Jun 2021 18:41:18 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9dhqYutP3EfNe8tPZ0GTPU04s5zGfyT-As74wLE6Zyrg@mail.gmail.com>
Message-ID: <CAAOTY_9dhqYutP3EfNe8tPZ0GTPU04s5zGfyT-As74wLE6Zyrg@mail.gmail.com>
Subject: Re: [RFC PATCH V0 01/10] media: mtk-mdp3: Add Mediatek MDP Driver
To:     Moudy Ho <moudy.ho@mediatek.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Maoguang Meng <maoguang.meng@mediatek.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        daoyuan huang <daoyuan.huang@mediatek.com>,
        Ping-Hsun Wu <ping-hsun.wu@mediatek.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Landley <rob@landley.net>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, DTML <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Nicolas Boichat <drinkcat@chromium.org>, acourbot@chromium.org,
        Pi-Hsun Shih <pihsun@chromium.org>, menghui.lin@mediatek.com,
        =?UTF-8?B?U2ogSHVhbmcgKOm7g+S/oeeSiyk=?= <sj.huang@mediatek.com>,
        ben.lok@mediatek.com, randy.wu@mediatek.com,
        srv_heupstream <srv_heupstream@mediatek.com>,
        =?UTF-8?B?RnJlZGVyaWMgQ2hlbiAo6Zmz5L+K5YWDKQ==?= 
        <frederic.chen@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi, Moudy:

Moudy Ho <moudy.ho@mediatek.com> =E6=96=BC 2021=E5=B9=B46=E6=9C=8823=E6=97=
=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=883:46=E5=AF=AB=E9=81=93=EF=BC=9A
>
> From: mtk18742 <moudy.ho@mediatek.com>
>
> Add MDP driver for MT8183
>
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> ---

[snip]

> +
> +#endif  // __MMSYS_CONFIG_H__
> diff --git a/drivers/media/platform/mtk-mdp3/mmsys_mutex.h b/drivers/medi=
a/platform/mtk-mdp3/mmsys_mutex.h
> new file mode 100644
> index 000000000000..fb8c179f11af
> --- /dev/null
> +++ b/drivers/media/platform/mtk-mdp3/mmsys_mutex.h
> @@ -0,0 +1,35 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2019 MediaTek Inc.
> + * Author: Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
> + */
> +
> +#ifndef __MMSYS_MUTEX_H__
> +#define __MMSYS_MUTEX_H__
> +
> +#include "mmsys_reg_base.h"
> +#include "mdp-platform.h"
> +
> +#define MM_MUTEX_INTEN              0x00
> +#define MM_MUTEX_INTSTA             0x04
> +#define MM_MUTEX_CFG                0x08
> +
> +#define MM_MUTEX_EN                 (0x20 + mutex_id * 0x20)
> +#define MM_MUTEX_GET                (0x24 + mutex_id * 0x20)
> +#define MM_MUTEX_RST                (0x28 + mutex_id * 0x20)
> +#define MM_MUTEX_MOD                (MM_MUTEX_MOD_OFFSET + mutex_id * 0x=
20)
> +#define MM_MUTEX_SOF                (MM_MUTEX_SOF_OFFSET + mutex_id * 0x=
20)

mtk_mutex driver is in drivers/soc/mediatek/mtk-mutex.c, so the
mtk_mutex control should be placed there.

> +
> +// MASK
> +#define MM_MUTEX_INTEN_MASK         0x0fff
> +#define MM_MUTEX_INTSTA_MASK        0x0fff
> +#define MM_MUTEX_DEBUG_OUT_SEL_MASK 0x03
> +#define MM_MUTEX_CFG_MASK           0x01
> +
> +#define MM_MUTEX_EN_MASK            0x01
> +#define MM_MUTEX_GET_MASK           0x03
> +#define MM_MUTEX_RST_MASK           0x01
> +#define MM_MUTEX_MOD_MASK           0x07ffffff
> +#define MM_MUTEX_SOF_MASK           0x0f
> +

[snip]

> +int mdp_cmdq_send(struct mdp_dev *mdp, struct mdp_cmdq_param *param)
> +{
> +       struct mdp_cmd cmd;
> +       struct mdp_path path;
> +       int i, ret;
> +
> +       if (atomic_read(&mdp->suspended))
> +               return -ECANCELED;
> +
> +       atomic_inc(&mdp->job_count);
> +
> +       cmd.pkt =3D cmdq_pkt_create(mdp->cmdq_clt, SZ_16K);
> +       if (IS_ERR(cmd.pkt)) {
> +               atomic_dec(&mdp->job_count);
> +               wake_up(&mdp->callback_wq);
> +               return PTR_ERR(cmd.pkt);
> +       }
> +       cmd.event =3D &mdp->event[0];
> +
> +       path.mdp_dev =3D mdp;
> +       path.config =3D param->config;
> +       path.param =3D param->param;
> +       for (i =3D 0; i < param->param->num_outputs; i++) {
> +               path.bounds[i].left =3D 0;
> +               path.bounds[i].top =3D 0;
> +               path.bounds[i].width =3D
> +                       param->param->outputs[i].buffer.format.width;
> +               path.bounds[i].height =3D
> +                       param->param->outputs[i].buffer.format.height;
> +               path.composes[i] =3D param->composes[i] ?
> +                       param->composes[i] : &path.bounds[i];
> +       }
> +       ret =3D mdp_path_config(mdp, &cmd, &path);
> +       if (ret) {
> +               atomic_dec(&mdp->job_count);
> +               wake_up(&mdp->callback_wq);
> +               return ret;
> +       }
> +
> +       // TODO: engine conflict dispatch
> +       for (i =3D 0; i < param->config->num_components; i++)
> +               mdp_comp_clock_on(&mdp->pdev->dev, path.comps[i].comp);
> +
> +       if (param->wait) {
> +               ret =3D cmdq_pkt_flush(cmd.pkt);

cmdq_pkt_flush() is removed in latest kernel, please rebase this
series onto latest kernel before you send patches.

Regards,
Chun-Kuang.

> +#ifdef MDP_DEBUG
> +               if (ret) {
> +                       struct mdp_func_struct *p_func =3D mdp_get_func()=
;
> +
> +                       p_func->mdp_dump_mmsys_config();
> +                       mdp_dump_info(~0, 1);
> +               }
> +#endif
> +               if (param->mdp_ctx)
> +                       mdp_m2m_job_finish(param->mdp_ctx);
> +               cmdq_pkt_destroy(cmd.pkt);
> +               for (i =3D 0; i < param->config->num_components; i++)
> +                       mdp_comp_clock_off(&mdp->pdev->dev, path.comps[i]=
.comp);
> +
> +               atomic_dec(&mdp->job_count);
> +               wake_up(&mdp->callback_wq);
> +       } else {
> +               struct mdp_cmdq_cb_param *cb_param;
> +               struct mdp_comp *comps;
> +
> +               cb_param =3D kzalloc(sizeof(*cb_param), GFP_KERNEL);
> +               if (!cb_param)
> +                       return -ENOMEM;
> +               comps =3D kcalloc(param->config->num_components, sizeof(*=
comps),
> +                               GFP_KERNEL);
> +               if (!comps) {
> +                       kfree(cb_param);
> +                       mdp_err("%s:comps alloc fail!\n", __func__);
> +                       return -ENOMEM;
> +               }
> +
> +               for (i =3D 0; i < param->config->num_components; i++)
> +                       memcpy(&comps[i], path.comps[i].comp,
> +                              sizeof(struct mdp_comp));
> +               cb_param->mdp =3D mdp;
> +               cb_param->user_cmdq_cb =3D param->cmdq_cb;
> +               cb_param->user_cb_data =3D param->cb_data;
> +               cb_param->pkt =3D cmd.pkt;
> +               cb_param->comps =3D comps;
> +               cb_param->num_comps =3D param->config->num_components;
> +               cb_param->mdp_ctx =3D param->mdp_ctx;
> +
> +               ret =3D cmdq_pkt_flush_async(cmd.pkt,
> +                                          mdp_handle_cmdq_callback,
> +                                          (void *)cb_param);
> +               if (ret) {
> +                       mdp_err("%s:cmdq_pkt_flush_async fail!\n", __func=
__);
> +                       kfree(cb_param);
> +                       kfree(comps);
> +               }
> +       }
> +       return ret;
> +}
> +

> --
> 2.18.0
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
