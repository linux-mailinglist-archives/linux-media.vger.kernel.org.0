Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF8C43D4AD0
	for <lists+linux-media@lfdr.de>; Sun, 25 Jul 2021 03:07:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229853AbhGYA02 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 24 Jul 2021 20:26:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:54020 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229588AbhGYA01 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 24 Jul 2021 20:26:27 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 86ADB60E97;
        Sun, 25 Jul 2021 01:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627175218;
        bh=fNYWeoGfkrEGlvRqsBvaFqjKbW0GSDtz2uJ+0X2ZLNQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=IKRL4nsfkZVJmfWBs2rrm/oD9WD6XGm8hE63Ym9PN2d0NtcSl+q1x99sxIDPDKxLS
         IE7YfQPqu/zx7KaxicY7GIwdtci9f0X75eaNR4sByC4pzb+IT2jtb/NTltLlASXCV2
         QG4fkjXc7M2lDGpyfK5+TwRaJv6SJAPV6Lg83YHdKtJkc4oRYDWU+ngADRCR4L82VY
         AxfUCLkKjqbzqN7V7hyg+MJqnwpLADnbc5SX55BL4i6RTvxVpXujkmTYVJNMHRfvm2
         piip+prrpTX4cOY7VUg+Ujt7mJCivflk2klL0IJHGMPwX9vmjJMzS3y4WVwlB05/xk
         fnmQQ4Bs248qw==
Received: by mail-ej1-f46.google.com with SMTP id nd39so9727991ejc.5;
        Sat, 24 Jul 2021 18:06:58 -0700 (PDT)
X-Gm-Message-State: AOAM531XagkkHKqoKWckr8WeFketFPyXF+BKPq4fkOfysZXJfxpLkk4d
        iqsiuw5f49/HsdA6b0vjR/jR/eHYDqZHAOVhHA==
X-Google-Smtp-Source: ABdhPJyPYHzSGay9THXQjirtuR1vbT6gpP0ZOf8MYFpyr9Lk72uYtT6mEHeVmQsK5gQHFu7lpbUg6j/2CxF8zHvBlss=
X-Received: by 2002:a17:906:4745:: with SMTP id j5mr10861869ejs.75.1627175217149;
 Sat, 24 Jul 2021 18:06:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210719074640.25058-1-moudy.ho@mediatek.com> <20210719074640.25058-4-moudy.ho@mediatek.com>
In-Reply-To: <20210719074640.25058-4-moudy.ho@mediatek.com>
From:   Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date:   Sun, 25 Jul 2021 09:06:45 +0800
X-Gmail-Original-Message-ID: <CAAOTY__2pejCKPkSKu-RqEzakHPjHi2ehbMQM5H3pGnXEa24qw@mail.gmail.com>
Message-ID: <CAAOTY__2pejCKPkSKu-RqEzakHPjHi2ehbMQM5H3pGnXEa24qw@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] media: platform: mtk-mdp3: Add Mediatek MDP3 driver
To:     Moudy Ho <moudy.ho@mediatek.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Maoguang Meng <maoguang.meng@mediatek.com>,
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
        srv_heupstream <srv_heupstream@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

,  Hi, Moudy

Moudy Ho <moudy.ho@mediatek.com> =E6=96=BC 2021=E5=B9=B47=E6=9C=8819=E6=97=
=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=884:19=E5=AF=AB=E9=81=93=EF=BC=9A
>
> This patch adds driver for Media Data Path 3 (MDP3).
> Each modules' related operation control is sited in mtk-mdp3-comp.c
> Each modules' register table is defined in file with "mdp_reg_"
> and "mmsys_" prefix
> GCE related API, operation control  sited in mtk-mdp3-cmdq.c
> V4L2 m2m device functions are implemented in mtk-mdp3-m2m.c
> Probe, power, suspend/resume, system level functions are defined in
> mtk-mdp3-core.c
>
> Signed-off-by: Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
> Signed-off-by: daoyuan huang <daoyuan.huang@mediatek.com>
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> ---
> Depend on:
>    [1] https://patchwork.kernel.org/project/linux-mediatek/patch/20190906=
115513.159705-9-acourbot@chromium.org/
>    [2] https://patchwork.kernel.org/project/linux-mediatek/patch/20190906=
115513.159705-10-acourbot@chromium.org/
> ---

[snip]

> +
> +static int mdp_path_subfrm_require(struct mdp_path_subfrm *subfrm,
> +                                  const struct mdp_path *path,
> +                                  struct mdp_cmd *cmd, u32 count)
> +{
> +       const struct img_config *config =3D path->config;
> +       const struct mdp_comp_ctx *ctx;
> +       phys_addr_t mm_mutex =3D path->mdp_dev->mm_mutex.reg_base;
> +       s32 mutex_id =3D -1;
> +       u32 mutex_sof =3D 0;
> +       int mdp_color =3D 0;
> +       int index;
> +       u8 subsys_id =3D path->mdp_dev->mm_mutex.subsys_id;
> +
> +       /* Default value */
> +       memset(subfrm, 0, sizeof(*subfrm));
> +
> +       for (index =3D 0; index < config->num_components; index++) {
> +               ctx =3D &path->comps[index];
> +               if (is_output_disable(ctx->param, count))
> +                       continue;
> +               switch (ctx->comp->id) {
> +               /**********************************************
> +                * Name            MSB LSB
> +                * DISP_MUTEX_MOD   23   0
> +                *
> +                * Specifies which modules are in this mutex.
> +                * Every bit denotes a module. Bit definition:
> +                *  2 mdp_rdma0
> +                *  4 mdp_rsz0
> +                *  5 mdp_rsz1
> +                *  6 mdp_tdshp
> +                *  7 mdp_wrot0
> +                *  8 mdp_wdma
> +                *  13 mdp_color
> +                *  23 mdp_aal
> +                *  24 mdp_ccorr
> +                **********************************************/
> +               case MDP_AAL0:
> +                       subfrm->mutex_mod |=3D 1 << 23;
> +                       break;
> +               case MDP_CCORR0:
> +                       subfrm->mutex_mod |=3D 1 << 24;
> +                       break;
> +               case MDP_COLOR0:
> +                       if (mdp_color)
> +                               subfrm->mutex_mod |=3D 1 << 13;
> +                       break;
> +               case MDP_WDMA:
> +                       subfrm->mutex_mod |=3D 1 << 8;
> +                       subfrm->sofs[subfrm->num_sofs++] =3D MDP_WDMA;
> +                       break;
> +               case MDP_WROT0:
> +                       subfrm->mutex_mod |=3D 1 << 7;
> +                       subfrm->sofs[subfrm->num_sofs++] =3D MDP_WROT0;
> +                       break;
> +               case MDP_TDSHP0:
> +                       subfrm->mutex_mod |=3D 1 << 6;
> +                       subfrm->sofs[subfrm->num_sofs++] =3D MDP_TDSHP0;
> +                       break;
> +               case MDP_SCL1:
> +                       subfrm->mutex_mod |=3D 1 << 5;
> +                       subfrm->sofs[subfrm->num_sofs++] =3D MDP_SCL1;
> +                       break;
> +               case MDP_SCL0:
> +                       subfrm->mutex_mod |=3D 1 << 4;
> +                       subfrm->sofs[subfrm->num_sofs++] =3D MDP_SCL0;
> +                       break;
> +               case MDP_RDMA0:
> +                       mutex_id =3D DISP_MUTEX_MDP_FIRST + 1;
> +                       subfrm->mutex_mod |=3D 1 << 2;
> +                       subfrm->sofs[subfrm->num_sofs++] =3D MDP_RDMA0;
> +                       break;
> +               case MDP_IMGI:
> +                       mutex_id =3D DISP_MUTEX_MDP_FIRST;
> +                       break;
> +               case MDP_WPEI:
> +                       mutex_id =3D DISP_MUTEX_MDP_FIRST + 3;
> +                       break;
> +               case MDP_WPEI2:
> +                       mutex_id =3D DISP_MUTEX_MDP_FIRST + 4;
> +                       break;
> +               default:
> +                       break;
> +               }
> +       }
> +
> +       subfrm->mutex_id =3D mutex_id;
> +       if (-1 =3D=3D mutex_id) {
> +               mdp_err("No mutex assigned");
> +               return -EINVAL;
> +       }
> +
> +       if (subfrm->mutex_mod) {
> +               /* Set mutex modules */
> +               MM_REG_WRITE(cmd, subsys_id, mm_mutex, MM_MUTEX_MOD,
> +                            subfrm->mutex_mod, 0x07FFFFFF);
> +               MM_REG_WRITE(cmd, subsys_id, mm_mutex, MM_MUTEX_SOF,
> +                            mutex_sof, 0x00000007);

Move mutex register setting to drivers/soc/mediatek/mtk-mutex.c, and
let mtk-mutex driver provide interface for mdp driver to use.

> +       }
> +       return 0;
> +}
> +

[snip]

> +
> +static int mdp_path_config_subfrm(struct mdp_cmd *cmd, struct mdp_path *=
path,
> +                                 u32 count)
> +{
> +       struct mdp_path_subfrm subfrm;
> +       const struct img_config *config =3D path->config;
> +       const struct img_mmsys_ctrl *ctrl =3D &config->ctrls[count];
> +       const struct img_mux *set;
> +       struct mdp_comp_ctx *ctx;
> +       phys_addr_t mmsys =3D path->mdp_dev->mmsys.reg_base;
> +       int index, ret;
> +       u8 subsys_id =3D path->mdp_dev->mmsys.subsys_id;
> +
> +       /* Acquire components */
> +       ret =3D mdp_path_subfrm_require(&subfrm, path, cmd, count);
> +       if (ret)
> +               return ret;
> +       /* Enable mux settings */
> +       for (index =3D 0; index < ctrl->num_sets; index++) {
> +               set =3D &ctrl->sets[index];
> +               MM_REG_WRITE_MASK(cmd, subsys_id, mmsys, set->reg, set->v=
alue,
> +                                 0xFFFFFFFF);

Move mmsys register setting to drivers/soc/mediatek/mtk-mmsys.c, and
let mtk-mmsys driver provide interface for mdp to use.

Regards,
Chun-Kuang.

> +       }
> +       /* Config sub-frame information */
> +       for (index =3D (config->num_components - 1); index >=3D 0; index-=
-) {
> +               ctx =3D &path->comps[index];
> +               if (is_output_disable(ctx->param, count))
> +                       continue;
> +               ret =3D call_op(ctx, config_subfrm, cmd, count);
> +               if (ret)
> +                       return ret;
> +       }
> +       /* Run components */
> +       ret =3D mdp_path_subfrm_run(&subfrm, path, cmd);
> +       if (ret)
> +               return ret;
> +       /* Wait components done */
> +       for (index =3D 0; index < config->num_components; index++) {
> +               ctx =3D &path->comps[index];
> +               if (is_output_disable(ctx->param, count))
> +                       continue;
> +               ret =3D call_op(ctx, wait_comp_event, cmd);
> +               if (ret)
> +                       return ret;
> +       }
> +       /* Advance to the next sub-frame */
> +       for (index =3D 0; index < config->num_components; index++) {
> +               ctx =3D &path->comps[index];
> +               ret =3D call_op(ctx, advance_subfrm, cmd, count);
> +               if (ret)
> +                       return ret;
> +       }
> +       /* Disable mux settings */
> +       for (index =3D 0; index < ctrl->num_sets; index++) {
> +               set =3D &ctrl->sets[index];
> +               MM_REG_WRITE_MASK(cmd, subsys_id, mmsys, set->reg, 0,
> +                                 0xFFFFFFFF);
> +       }
> +       return 0;
> +}
> +
