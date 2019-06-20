Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 166E64C64F
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2019 06:47:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725877AbfFTEr3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Jun 2019 00:47:29 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:37912 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725871AbfFTEr3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Jun 2019 00:47:29 -0400
Received: by mail-ot1-f67.google.com with SMTP id d17so1447940oth.5
        for <linux-media@vger.kernel.org>; Wed, 19 Jun 2019 21:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pWLNaK8re53/vekH1GTT2J5q4r8y2iwnpsLYVOWebKc=;
        b=jeyPPQr9W1Cq4oWdrz1iYQ+tQtsF+PcqiVQJNgOZwWtQGZZPHweeXXRhpQ9xEPlnN5
         CRqAeoitu5FaZXJAxlPUWL+WWHFvq4jrhaYcLiG2IFMlMUSGh+fYRSk5K/GPL9LMWrf3
         7VSG9x3VvCLijcedT2+/rn/kRodc6UEggrRxs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pWLNaK8re53/vekH1GTT2J5q4r8y2iwnpsLYVOWebKc=;
        b=DLQ0EuWr3tpI9JUgynN7K47L6/VAZs/Vx6V0XQ+WF5jJn9cd52eQhgGoHaGZHwp7az
         QA19Ubuj/g14xXiY4VoECgHppeE1ZzEUl8UM92dZF19F2lXVhnWsz1syV8fQjVBZ1taY
         /lB5GH4ozQLPTqqswbmt56IkYu7eILPEYhL5vNtEnS5LQ/QiIlwC3/9FO4Wx2mU08A0V
         Gv1hVEcUvLc0MmdUDHSpsXbfy8W22cKWsdkRaw50acAJJaCkS6e8QPFX6O6hAjeBe6gH
         Ff3qK3Ybgx/m3ErobFoAxg7XHGpWZvYuc/257HcBgBHgK42fnQi2ifKBMOTbTuwkxykX
         /ljQ==
X-Gm-Message-State: APjAAAUZJUxq2LgeMCd7VbR3f7FOEihqSasPvLlMfUuYsxnS9q4J8zsr
        skM2sU/e63Bm/wb38gWtkk+I6RYzgPg=
X-Google-Smtp-Source: APXvYqyfdErWZqBk4J4OU1lVhFwXkJUQ/056myu2zkwRYibVWqYQ9pivtA8IqOKkwad85FjQyNxZZw==
X-Received: by 2002:a05:6830:10d3:: with SMTP id z19mr2094350oto.196.1561006045614;
        Wed, 19 Jun 2019 21:47:25 -0700 (PDT)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com. [209.85.167.173])
        by smtp.gmail.com with ESMTPSA id q5sm7567786oih.2.2019.06.19.21.47.23
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Wed, 19 Jun 2019 21:47:24 -0700 (PDT)
Received: by mail-oi1-f173.google.com with SMTP id s184so1149370oie.9
        for <linux-media@vger.kernel.org>; Wed, 19 Jun 2019 21:47:23 -0700 (PDT)
X-Received: by 2002:aca:3c1:: with SMTP id 184mr5142936oid.170.1561006042616;
 Wed, 19 Jun 2019 21:47:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190516032332.56844-1-daoyuan.huang@mediatek.com> <20190516032332.56844-5-daoyuan.huang@mediatek.com>
In-Reply-To: <20190516032332.56844-5-daoyuan.huang@mediatek.com>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Thu, 20 Jun 2019 13:47:10 +0900
X-Gmail-Original-Message-ID: <CAPBb6MW5E2RRT7i4_xSsn4kGyUVn+v7zBitaEJS44-04XWGoOA@mail.gmail.com>
Message-ID: <CAPBb6MW5E2RRT7i4_xSsn4kGyUVn+v7zBitaEJS44-04XWGoOA@mail.gmail.com>
Subject: Re: [RFC v2 4/4] media: platform: mtk-mdp3: Add Mediatek MDP3 driver
To:     Daoyuan Huang <daoyuan.huang@mediatek.com>
Cc:     Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Tomasz Figa <tfiga@chromium.org>, matthias.bgg@gmail.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        yuzhao@chromium.org, zwisler@chromium.org,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, Sean.Cheng@mediatek.com,
        Sj Huang <sj.huang@mediatek.com>, christie.yu@mediatek.com,
        holmes.chiou@mediatek.com, frederic.chen@mediatek.com,
        Jerry-ch.Chen@mediatek.com, jungo.lin@mediatek.com,
        Rynn.Wu@mediatek.com,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        srv_heupstream@mediatek.com, devicetree@vger.kernel.org,
        Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Daoyuan, sorry for having been so long to come back to this!

I know you have another version prepared, but here are a few extra
things that may need attention.

On Thu, May 16, 2019 at 12:25 PM Daoyuan Huang
<daoyuan.huang@mediatek.com> wrote:
>
> From: daoyuan huang <daoyuan.huang@mediatek.com>
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

[snip]

> diff --git a/drivers/media/platform/mtk-mdp3/mtk-img-ipi.h b/drivers/media/platform/mtk-mdp3/mtk-img-ipi.h
> new file mode 100644
> index 000000000000..9fabe7e8b71d
> --- /dev/null
> +++ b/drivers/media/platform/mtk-mdp3/mtk-img-ipi.h
> @@ -0,0 +1,282 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2018 MediaTek Inc.
> + * Author: Holmes Chiou <holmes.chiou@mediatek.com>
> + *         Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#ifndef __MTK_IMG_IPI_H__
> +#define __MTK_IMG_IPI_H__
> +
> +#include <linux/types.h>
> +
> +/* ISP-MDP generic input information */
> +
> +#define IMG_MAX_HW_INPUTS      1
> +
> +#define IMG_MAX_HW_OUTPUTS     4
> +
> +#define IMG_MAX_PLANES         3
> +
> +#define IMG_IPI_INIT    1
> +#define IMG_IPI_DEINIT  2
> +#define IMG_IPI_FRAME   3
> +#define IMG_IPI_DEBUG   4
> +
> +struct img_addr {
> +       u64     va;     /* Used by Linux OS access */
> +       u32     pa;     /* Used by CM4 access */
> +       u32     iova;   /* Used by IOMMU HW access */
> +} __attribute__ ((__packed__));
> +
> +struct img_sw_addr {
> +       u64     va;     /* Used by APMCU access */
> +       u32     pa;     /* Used by CM4 access */
> +} __attribute__ ((__packed__));
> +
> +struct img_plane_format {
> +       u32     size;
> +       u16     stride;
> +} __attribute__ ((__packed__));
> +
> +struct img_pix_format {
> +       u16             width;
> +       u16             height;
> +       u32             colorformat;    /* enum mdp_color */
> +       u16             ycbcr_prof;     /* enum mdp_ycbcr_profile */
> +       struct img_plane_format plane_fmt[IMG_MAX_PLANES];
> +} __attribute__ ((__packed__));
> +
> +struct img_image_buffer {
> +       struct img_pix_format   format;
> +       u32             iova[IMG_MAX_PLANES];
> +       /* enum mdp_buffer_usage, FD or advanced ISP usages */
> +       u32             usage;
> +} __attribute__ ((__packed__));
> +
> +#define IMG_SUBPIXEL_SHIFT     20
> +
> +struct img_crop {
> +       s16             left;
> +       s16             top;

One tab too much here? Looks like there are similar indentation issues
elsewhere as well, please confirm.

> +       u16     width;
> +       u16     height;
> +       u32     left_subpix;
> +       u32     top_subpix;
> +       u32     width_subpix;
> +       u32     height_subpix;
> +} __attribute__ ((__packed__));
> +
> +#define IMG_CTRL_FLAG_HFLIP    BIT(0)
> +#define IMG_CTRL_FLAG_DITHER   BIT(1)
> +#define IMG_CTRL_FLAG_SHARPNESS        BIT(4)
> +#define IMG_CTRL_FLAG_HDR      BIT(5)
> +#define IMG_CTRL_FLAG_DRE      BIT(6)
> +
> +struct img_input {
> +       struct img_image_buffer buffer;
> +       u16             flags;  /* HDR, DRE, dither */
> +} __attribute__ ((__packed__));
> +
> +struct img_output {
> +       struct img_image_buffer buffer;
> +       struct img_crop         crop;
> +       s16                     rotation;
> +       u16             flags;  /* H-flip, sharpness, dither */
> +} __attribute__ ((__packed__));
> +
> +struct img_ipi_frameparam {
> +       u32             index;
> +       u32             frame_no;
> +       u64             timestamp;
> +       u8                      type;   /* enum mdp_stream_type */
> +       u8                      state;
> +       u8                      num_inputs;
> +       u8                      num_outputs;
> +       u64             drv_data;
> +       struct img_input        inputs[IMG_MAX_HW_INPUTS];
> +       struct img_output       outputs[IMG_MAX_HW_OUTPUTS];
> +       struct img_addr         tuning_data;
> +       struct img_addr         subfrm_data;
> +       struct img_sw_addr      config_data;
> +       struct img_sw_addr  self_data;
> +       /* u8           pq_data[]; */
> +} __attribute__ ((__packed__));
> +
> +struct img_ipi_param {
> +       u8      usage;
> +       struct  img_sw_addr frm_param;
> +} __attribute__ ((__packed__));
> +
> +struct img_frameparam {
> +       struct list_head        list_entry;
> +       struct img_ipi_frameparam frameparam;
> +};
> +
> +/* ISP-MDP generic output information */
> +
> +struct img_comp_frame {
> +       u32     output_disable:1;
> +       u32     bypass:1;
> +       u16     in_width;
> +       u16     in_height;
> +       u16     out_width;
> +       u16     out_height;
> +       struct img_crop crop;
> +       u16     in_total_width;
> +       u16     out_total_width;
> +} __attribute__ ((__packed__));
> +
> +struct img_region {
> +       s16     left;
> +       s16     right;
> +       s16     top;
> +       s16     bottom;
> +} __attribute__ ((__packed__));
> +
> +struct img_offset {
> +       s16             left;
> +       s16             top;
> +       u32     left_subpix;
> +       u32     top_subpix;
> +} __attribute__ ((__packed__));
> +
> +struct img_comp_subfrm {
> +       u32             tile_disable:1;
> +       struct img_region       in;
> +       struct img_region       out;
> +       struct img_offset       luma;
> +       struct img_offset       chroma;
> +       s16                     out_vertical;   /* Output vertical index */
> +       s16                     out_horizontal; /* Output horizontal index */
> +} __attribute__ ((__packed__));
> +
> +#define IMG_MAX_SUBFRAMES      12
> +
> +struct mdp_rdma_subfrm {
> +       u32     offset[IMG_MAX_PLANES];
> +       u32     offset_0_p;
> +       u32     src;
> +       u32     clip;
> +       u32     clip_ofst;
> +} __attribute__ ((__packed__));
> +
> +struct mdp_rdma_data {
> +       u32             src_ctrl;
> +       u32             control;
> +       u32             iova[IMG_MAX_PLANES];
> +       u32             iova_end[IMG_MAX_PLANES];
> +       u32             mf_bkgd;
> +       u32             mf_bkgd_in_pxl;
> +       u32             sf_bkgd;
> +       u32             ufo_dec_y;
> +       u32             ufo_dec_c;
> +       u32             transform;
> +       struct mdp_rdma_subfrm  subfrms[IMG_MAX_SUBFRAMES];
> +} __attribute__ ((__packed__));
> +
> +struct mdp_rsz_subfrm {
> +       u32     control2;
> +       u32     src;
> +       u32     clip;
> +} __attribute__ ((__packed__));
> +
> +struct mdp_rsz_data {
> +       u32             coeff_step_x;
> +       u32             coeff_step_y;
> +       u32             control1;
> +       u32             control2;
> +       struct mdp_rsz_subfrm   subfrms[IMG_MAX_SUBFRAMES];
> +} __attribute__ ((__packed__));
> +
> +struct mdp_wrot_subfrm {
> +       u32     offset[IMG_MAX_PLANES];
> +       u32     src;
> +       u32     clip;
> +       u32     clip_ofst;
> +       u32     main_buf;
> +} __attribute__ ((__packed__));
> +
> +struct mdp_wrot_data {
> +       u32             iova[IMG_MAX_PLANES];
> +       u32             control;
> +       u32             stride[IMG_MAX_PLANES];
> +       u32             mat_ctrl;
> +       u32             fifo_test;
> +       u32             filter;
> +       struct mdp_wrot_subfrm  subfrms[IMG_MAX_SUBFRAMES];
> +} __attribute__ ((__packed__));
> +
> +struct mdp_wdma_subfrm {
> +       u32     offset[IMG_MAX_PLANES];
> +       u32     src;
> +       u32     clip;
> +       u32     clip_ofst;
> +} __attribute__ ((__packed__));
> +
> +struct mdp_wdma_data {
> +       u32             wdma_cfg;
> +       u32             iova[IMG_MAX_PLANES];
> +       u32             w_in_byte;
> +       u32             uv_stride;
> +       struct mdp_wdma_subfrm  subfrms[IMG_MAX_SUBFRAMES];
> +} __attribute__ ((__packed__));
> +
> +struct isp_data {
> +       u64     dl_flags;       /* 1 << (enum mdp_comp_type) */
> +       u32     smxi_iova[4];
> +       u32     cq_idx;
> +       u32     cq_iova;
> +       u32     tpipe_iova[IMG_MAX_SUBFRAMES];
> +} __attribute__ ((__packed__));
> +
> +struct img_compparam {
> +       u16             type;   /* enum mdp_comp_type */
> +       u16             id;     /* enum mdp_comp_id */
> +       u32             input;
> +       u32             outputs[IMG_MAX_HW_OUTPUTS];
> +       u32             num_outputs;
> +       struct img_comp_frame   frame;
> +       struct img_comp_subfrm  subfrms[IMG_MAX_SUBFRAMES];
> +       u32             num_subfrms;
> +       union {
> +               struct mdp_rdma_data    rdma;
> +               struct mdp_rsz_data     rsz;
> +               struct mdp_wrot_data    wrot;
> +               struct mdp_wdma_data    wdma;
> +               /* struct mdp_hdr_data  hdr; */
> +               struct isp_data         isp;
> +               /* struct wpe_data      wpe; */
> +       };
> +} __attribute__ ((__packed__));
> +
> +#define IMG_MAX_COMPONENTS     20
> +
> +struct img_mux {
> +       u32     reg;
> +       u32     value;
> +};
> +
> +struct img_mmsys_ctrl {
> +       struct img_mux  sets[IMG_MAX_COMPONENTS * 2];
> +       u32     num_sets;
> +};
> +
> +struct img_config {
> +       struct img_compparam    components[IMG_MAX_COMPONENTS];
> +       u32             num_components;
> +       struct img_mmsys_ctrl   ctrls[IMG_MAX_SUBFRAMES];
> +       u32             num_subfrms;
> +} __attribute__ ((__packed__));
> +
> +#endif  /* __MTK_IMG_IPI_H__ */
> +
> diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c b/drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c
> new file mode 100644
> index 000000000000..562ad8509fc2
> --- /dev/null
> +++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c
> @@ -0,0 +1,442 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2018 MediaTek Inc.
> + * Author: Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <linux/platform_device.h>
> +#include "mtk-mdp3-cmdq.h"
> +#include "mtk-mdp3-comp.h"
> +#include "mtk-mdp3-core.h"
> +
> +#include "mdp-platform.h"
> +#include "mmsys_mutex.h"
> +
> +#define DISP_MUTEX_MDP_FIRST   (5)
> +#define DISP_MUTEX_MDP_COUNT   (5)
> +
> +#define MDP_PATH_MAX_COMPS     IMG_MAX_COMPONENTS
> +
> +struct mdp_path {
> +       struct mdp_dev          *mdp_dev;
> +       struct mdp_comp_ctx     comps[MDP_PATH_MAX_COMPS];
> +       u32                     num_comps;
> +       const struct img_config *config;
> +       const struct img_ipi_frameparam *param;
> +       const struct v4l2_rect  *composes[IMG_MAX_HW_OUTPUTS];
> +       struct v4l2_rect        bounds[IMG_MAX_HW_OUTPUTS];
> +};
> +
> +#define has_op(ctx, op) \
> +       (ctx->comp->ops && ctx->comp->ops->op)
> +#define call_op(ctx, op, ...) \
> +       (has_op(ctx, op) ? ctx->comp->ops->op(ctx, ##__VA_ARGS__) : 0)
> +
> +struct mdp_path_subfrm {
> +       s32     mutex_id;
> +       u32     mutex_mod;
> +       s32     sofs[MDP_PATH_MAX_COMPS];
> +       u32     num_sofs;
> +};
> +
> +bool is_output_disable(const struct img_compparam *param, u32 count)

This function can be static.

> +{
> +       return (count < param->num_subfrms) ?
> +               (param->frame.output_disable ||
> +               param->subfrms[count].tile_disable) :
> +               true;
> +}
> +
> +int mdp_path_subfrm_require(struct mdp_path_subfrm *subfrm,
> +                           const struct mdp_path *path, struct mdp_cmd *cmd,
> +                           u32 count)

This one as well.

> +{
> +       const struct img_config *config = path->config;
> +       const struct mdp_comp_ctx *ctx;
> +       phys_addr_t mm_mutex = path->mdp_dev->mm_mutex.reg_base;
> +       s32 mutex_id = -1;
> +       u32 mutex_sof = 0;
> +       int mdp_color = 0;
> +       int index;
> +       u8 subsys_id = path->mdp_dev->mm_mutex.subsys_id;
> +
> +       /* Default value */
> +       memset(subfrm, 0, sizeof(*subfrm));
> +
> +       for (index = 0; index < config->num_components; index++) {
> +               ctx = &path->comps[index];
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
> +                       subfrm->mutex_mod |= 1 << 23;
> +                       break;
> +               case MDP_CCORR0:
> +                       subfrm->mutex_mod |= 1 << 24;
> +                       break;
> +               case MDP_COLOR0:
> +                       if (mdp_color)
> +                               subfrm->mutex_mod |= 1 << 13;
> +                       break;
> +               case MDP_WDMA:
> +                       subfrm->mutex_mod |= 1 << 8;
> +                       subfrm->sofs[subfrm->num_sofs++] = MDP_WDMA;
> +                       break;
> +               case MDP_WROT0:
> +                       subfrm->mutex_mod |= 1 << 7;
> +                       subfrm->sofs[subfrm->num_sofs++] = MDP_WROT0;
> +                       break;
> +               case MDP_TDSHP0:
> +                       subfrm->mutex_mod |= 1 << 6;
> +                       subfrm->sofs[subfrm->num_sofs++] = MDP_TDSHP0;
> +                       break;
> +               case MDP_SCL1:
> +                       subfrm->mutex_mod |= 1 << 5;
> +                       subfrm->sofs[subfrm->num_sofs++] = MDP_SCL1;
> +                       break;
> +               case MDP_SCL0:
> +                       subfrm->mutex_mod |= 1 << 4;
> +                       subfrm->sofs[subfrm->num_sofs++] = MDP_SCL0;
> +                       break;
> +               case MDP_RDMA0:
> +                       mutex_id = DISP_MUTEX_MDP_FIRST + 1;
> +                       subfrm->mutex_mod |= 1 << 2;
> +                       subfrm->sofs[subfrm->num_sofs++] = MDP_RDMA0;
> +                       break;
> +               case MDP_IMGI:
> +                       mutex_id = DISP_MUTEX_MDP_FIRST;
> +                       break;
> +               case MDP_WPEI:
> +                       mutex_id = DISP_MUTEX_MDP_FIRST + 3;
> +                       break;
> +               case MDP_WPEI2:
> +                       mutex_id = DISP_MUTEX_MDP_FIRST + 4;
> +                       break;
> +               default:
> +                       break;
> +               }
> +       }
> +
> +       subfrm->mutex_id = mutex_id;
> +       if (-1 == mutex_id) {
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
> +       }
> +       return 0;
> +}
> +
> +int mdp_path_subfrm_run(const struct mdp_path_subfrm *subfrm,
> +                       const struct mdp_path *path, struct mdp_cmd *cmd)

And this one.

> +{
> +       phys_addr_t mm_mutex = path->mdp_dev->mm_mutex.reg_base;
> +       s32 mutex_id = subfrm->mutex_id;
> +       u8 subsys_id = path->mdp_dev->mm_mutex.subsys_id;
> +
> +       if (-1 == mutex_id) {
> +               mdp_err("Incorrect mutex id");
> +               return -EINVAL;
> +       }
> +
> +       if (subfrm->mutex_mod) {
> +               int index;
> +
> +               /* Wait WROT SRAM shared to DISP RDMA */
> +               /* Clear SOF event for each engine */
> +               for (index = 0; index < subfrm->num_sofs; index++) {
> +                       switch (subfrm->sofs[index]) {
> +                       case MDP_RDMA0:
> +                               MM_REG_CLEAR(cmd, RDMA0_SOF);
> +                               break;
> +                       case MDP_TDSHP0:
> +                               MM_REG_CLEAR(cmd, TDSHP0_SOF);
> +                               break;
> +                       case MDP_SCL0:
> +                               MM_REG_CLEAR(cmd, RSZ0_SOF);
> +                               break;
> +                       case MDP_SCL1:
> +                               MM_REG_CLEAR(cmd, RSZ1_SOF);
> +                               break;
> +                       case MDP_WDMA:
> +                               MM_REG_CLEAR(cmd, WDMA0_SOF);
> +                               break;
> +                       case MDP_WROT0:
> +#if WROT0_DISP_SRAM_SHARING
> +                               MM_REG_WAIT_NO_CLEAR(cmd, WROT0_SRAM_READY);
> +#endif
> +                               MM_REG_CLEAR(cmd, WROT0_SOF);
> +                               break;
> +                       default:
> +                               break;
> +                       }
> +               }
> +
> +               /* Enable the mutex */
> +               MM_REG_WRITE(cmd, subsys_id, mm_mutex, MM_MUTEX_EN, 0x1,
> +                            0x00000001);
> +
> +               /* Wait SOF events and clear mutex modules (optional) */
> +               for (index = 0; index < subfrm->num_sofs; index++) {
> +                       switch (subfrm->sofs[index]) {
> +                       case MDP_RDMA0:
> +                               MM_REG_WAIT(cmd, RDMA0_SOF);
> +                               break;
> +                       case MDP_TDSHP0:
> +                               MM_REG_WAIT(cmd, TDSHP0_SOF);
> +                               break;
> +                       case MDP_SCL0:
> +                               MM_REG_WAIT(cmd, RSZ0_SOF);
> +                               break;
> +                       case MDP_SCL1:
> +                               MM_REG_WAIT(cmd, RSZ1_SOF);
> +                               break;
> +                       case MDP_WDMA:
> +                               MM_REG_WAIT(cmd, WDMA0_SOF);
> +                               break;
> +                       case MDP_WROT0:
> +                               MM_REG_WAIT(cmd, WROT0_SOF);
> +                               break;
> +                       default:
> +                               break;
> +                       }
> +               }
> +       }
> +       return 0;
> +}
> +
> +static int mdp_path_config_subfrm(struct mdp_cmd *cmd, struct mdp_path *path,
> +                                 u32 count)
> +{
> +       struct mdp_path_subfrm subfrm;
> +       const struct img_config *config = path->config;
> +       const struct img_mmsys_ctrl *ctrl = &config->ctrls[count];
> +       const struct img_mux *set;
> +       struct mdp_comp_ctx *ctx;
> +       phys_addr_t mmsys = path->mdp_dev->mmsys.reg_base;
> +       int index, ret;
> +       u8 subsys_id = path->mdp_dev->mmsys.subsys_id;
> +
> +       /* Acquire components */
> +       ret = mdp_path_subfrm_require(&subfrm, path, cmd, count);
> +       if (ret)
> +               return ret;
> +       /* Enable mux settings */
> +       for (index = 0; index < ctrl->num_sets; index++) {
> +               set = &ctrl->sets[index];
> +               MM_REG_WRITE_MASK(cmd, subsys_id, mmsys, set->reg, set->value,
> +                                 0xFFFFFFFF);
> +       }
> +       /* Config sub-frame information */
> +       for (index = (config->num_components - 1); index >= 0; index--) {
> +               ctx = &path->comps[index];
> +               if (is_output_disable(ctx->param, count))
> +                       continue;
> +               ret = call_op(ctx, config_subfrm, cmd, count);
> +               if (ret)
> +                       return ret;
> +       }
> +       /* Run components */
> +       ret = mdp_path_subfrm_run(&subfrm, path, cmd);
> +       if (ret)
> +               return ret;
> +       /* Wait components done */
> +       for (index = 0; index < config->num_components; index++) {
> +               ctx = &path->comps[index];
> +               if (is_output_disable(ctx->param, count))
> +                       continue;
> +               ret = call_op(ctx, wait_comp_event, cmd);
> +               if (ret)
> +                       return ret;
> +       }
> +       /* Advance to the next sub-frame */
> +       for (index = 0; index < config->num_components; index++) {
> +               ctx = &path->comps[index];
> +               ret = call_op(ctx, advance_subfrm, cmd, count);
> +               if (ret)
> +                       return ret;
> +       }
> +       /* Disable mux settings */
> +       for (index = 0; index < ctrl->num_sets; index++) {
> +               set = &ctrl->sets[index];
> +               MM_REG_WRITE_MASK(cmd, subsys_id, mmsys, set->reg, 0,
> +                                 0xFFFFFFFF);
> +       }
> +       return 0;
> +}
> +
> +static int mdp_path_config(struct mdp_dev *mdp, struct mdp_cmd *cmd,
> +                          struct mdp_path *path)
> +{
> +       const struct img_config *config = path->config;
> +       struct mdp_comp_ctx *ctx;
> +       int index, count, ret;
> +
> +       for (index = 0; index < config->num_components; index++) {
> +               ret = mdp_comp_ctx_init(mdp, &path->comps[index],
> +                                       &config->components[index],
> +                                       path->param);
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       /* Config path frame */
> +       /* Reset components */
> +       for (index = 0; index < config->num_components; index++) {
> +               ctx = &path->comps[index];
> +               ret = call_op(ctx, init_comp, cmd);
> +               if (ret)
> +                       return ret;
> +       }
> +       /* Config frame mode */
> +       for (index = 0; index < config->num_components; index++) {
> +               const struct v4l2_rect *compose =
> +                       path->composes[ctx->param->outputs[0]];
> +
> +               ctx = &path->comps[index];
> +               ret = call_op(ctx, config_frame, cmd, compose);
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       /* Config path sub-frames */
> +       for (count = 0; count < config->num_subfrms; count++) {
> +               ret = mdp_path_config_subfrm(cmd, path, count);
> +               if (ret)
> +                       return ret;
> +       }
> +       /* Post processing information */
> +       for (index = 0; index < config->num_components; index++) {
> +               ctx = &path->comps[index];
> +               ret = call_op(ctx, post_process, cmd);
> +               if (ret)
> +                       return ret;
> +       }
> +       return 0;
> +}
> +
> +void mdp_handle_cmdq_callback(struct cmdq_cb_data data)

This can be static too.

> +{
> +       struct mdp_cmdq_cb_param *cb_param;
> +
> +       if (!data.data) {
> +               mdp_err("%s:no callback data\n", __func__);
> +               return;
> +       }
> +
> +       cb_param = (struct mdp_cmdq_cb_param *)data.data;
> +       if (cb_param->user_cmdq_cb) {
> +               struct cmdq_cb_data user_cb_data;
> +
> +               user_cb_data.sta = data.sta;
> +               user_cb_data.data = cb_param->user_cb_data;
> +               cb_param->user_cmdq_cb(user_cb_data);
> +       }
> +
> +       cmdq_pkt_destroy(cb_param->pkt);
> +       kfree(cb_param);
> +}
> +
> +int mdp_cmdq_send(struct mdp_dev *mdp, struct mdp_cmdq_param *param)
> +{
> +       struct mdp_cmd cmd;
> +       struct mdp_path path;
> +       int i, ret;
> +
> +       cmd.pkt = cmdq_pkt_create(mdp->cmdq_clt, SZ_16K);
> +       if (IS_ERR(cmd.pkt))
> +               return PTR_ERR(cmd.pkt);
> +       cmd.event = &mdp->event[0];
> +
> +       path.mdp_dev = mdp;
> +       path.config = param->config;
> +       path.param = param->param;
> +       for (i = 0; i < param->param->num_outputs; i++) {
> +               path.bounds[i].left = 0;
> +               path.bounds[i].top = 0;
> +               path.bounds[i].width =
> +                       param->param->outputs[i].buffer.format.width;
> +               path.bounds[i].height =
> +                       param->param->outputs[i].buffer.format.height;
> +               path.composes[i] = param->composes[i] ?
> +                       param->composes[i] : &path.bounds[i];
> +       }
> +       ret = mdp_path_config(mdp, &cmd, &path);
> +       if (ret)
> +               return ret;
> +
> +       // TODO: engine conflict dispatch
> +       for (i = 0; i < param->config->num_components; i++)
> +               mdp_comp_clock_on(&mdp->pdev->dev, path.comps[i].comp);
> +
> +       if (param->wait) {
> +               ret = cmdq_pkt_flush(cmd.pkt);
> +               cmdq_pkt_destroy(cmd.pkt);
> +               for (i = 0; i < param->config->num_components; i++)
> +                       mdp_comp_clock_off(&mdp->pdev->dev, path.comps[i].comp);
> +       } else {
> +               struct mdp_cmdq_cb_param *cb_param =
> +               kzalloc(sizeof(struct mdp_cmdq_cb_param), GFP_KERNEL);
> +
> +               cb_param->user_cmdq_cb = param->cmdq_cb;
> +               cb_param->user_cb_data = param->cb_data;
> +               cb_param->pkt = cmd.pkt;
> +
> +               ret = cmdq_pkt_flush_async(cmd.pkt,
> +                                          mdp_handle_cmdq_callback,
> +                                          (void *)cb_param);
> +               // TODO: destroy & clock-off after callback
> +       }
> +       return ret;
> +}
> +
> +int mdp_cmdq_sendtask(struct platform_device *pdev, struct img_config *config,
> +                     struct img_ipi_frameparam *param,
> +                     struct v4l2_rect *compose, unsigned int wait,
> +                     void (*cmdq_cb)(struct cmdq_cb_data data), void *cb_data)
> +{
> +       struct mdp_dev *mdp = platform_get_drvdata(pdev);
> +       struct mdp_cmdq_param task = {
> +               .config = config,
> +               .param = param,
> +               .composes[0] = compose,
> +               .wait = wait,
> +               .cmdq_cb = cmdq_cb,
> +               .cb_data = cb_data,
> +       };
> +
> +       return mdp_cmdq_send(mdp, &task);
> +}
> +EXPORT_SYMBOL_GPL(mdp_cmdq_sendtask);
> +
> diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.h b/drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.h
> new file mode 100644
> index 000000000000..b61ab1ac4325
> --- /dev/null
> +++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.h
> @@ -0,0 +1,57 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2018 MediaTek Inc.
> + * Author: Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#ifndef __MTK_MDP3_CMDQ_H__
> +#define __MTK_MDP3_CMDQ_H__
> +
> +#include <linux/platform_device.h>
> +#include <linux/videodev2.h>
> +#include <linux/soc/mediatek/mtk-cmdq.h>
> +#include "mtk-img-ipi.h"
> +
> +struct platform_device *mdp_get_plat_device(struct platform_device *pdev);

This function is defined in mtk-mdp3-core.c, either its declaration or
its definition should be moved?

> +
> +int mdp_cmdq_sendtask(struct platform_device *pdev, struct img_config *config,
> +                     struct img_ipi_frameparam *param,
> +                     struct v4l2_rect *compose, unsigned int wait,
> +                     void (*cmdq_cb)(struct cmdq_cb_data data), void *cb_data);

This function is defined and exported, but I don't see any call to it
anywhere? Looks like it can just be removed.

> +
> +struct mdp_cmd {
> +       struct cmdq_pkt *pkt;
> +       s32 *event;
> +};
> +
> +struct mdp_cmdq_param {
> +       struct img_config       *config;
> +       struct img_ipi_frameparam *param;
> +       const struct v4l2_rect  *composes[IMG_MAX_HW_OUTPUTS];
> +       unsigned int            wait;
> +
> +       void (*cmdq_cb)(struct cmdq_cb_data data);
> +       void *cb_data;
> +};
> +
> +struct mdp_cmdq_cb_param {
> +       void (*user_cmdq_cb)(struct cmdq_cb_data data);
> +       void *user_cb_data;
> +       struct cmdq_pkt *pkt;
> +};
> +
> +struct mdp_dev;
> +
> +int mdp_cmdq_send(struct mdp_dev *mdp, struct mdp_cmdq_param *param);
> +
> +#endif  /* __MTK_MDP3_CMDQ_H__ */
> +
> diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c b/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c
> new file mode 100644
> index 000000000000..3dc36915a744

[snip]

> +static void mdp_comp_deinit(struct device *dev, struct mdp_comp *comp)
> +{
> +       iounmap(comp->regs);
> +       /* of_node_put(comp->dev_node); */
> +}
> +
> +void mdp_component_deinit(struct device *dev, struct mdp_dev *mdp)
> +{
> +       int i;
> +
> +       mdp_comp_deinit(dev, &mdp->mmsys);
> +       mdp_comp_deinit(dev, &mdp->mm_mutex);
> +       for (i = 0; i < ARRAY_SIZE(mdp->comp); i++) {
> +               if (mdp->comp[i]) {
> +                       mdp_comp_deinit(dev, mdp->comp[i]);
> +                       kfree(mdp->comp[i]);
> +               }
> +       }
> +}
> +
> +int mdp_component_init(struct device *dev, struct mdp_dev *mdp)

dev can be obtained from mdp->pdev->dev, so there is no need to pass
it as argument.

> +{
> +       struct device_node *node, *parent;
> +       int i, ret;
> +
> +       for (i = 0; i < ARRAY_SIZE(gce_event_names); i++) {
> +               s32 event_id;
> +
> +               event_id = cmdq_dev_get_event(dev, gce_event_names[i]);
> +               mdp->event[i] = (event_id < 0) ? -i : event_id;
> +               dev_info(dev, "Get event %s id:%d\n",
> +                        gce_event_names[i], mdp->event[i]);
> +       }
> +
> +       ret = mdp_mm_init(dev, mdp, &mdp->mmsys, "mediatek,mmsys");

Same for mdp_mm_init.

> +       if (ret)
> +               goto err_init_mm;
> +
> +       ret = mdp_mm_init(dev, mdp, &mdp->mm_mutex, "mediatek,mm-mutex");
> +       if (ret)
> +               goto err_init_mm;
> +
> +       parent = dev->of_node->parent;
> +       /* Iterate over sibling MDP function blocks */
> +       for_each_child_of_node(parent, node) {
> +               const struct of_device_id *of_id;
> +               enum mdp_comp_type type;
> +               int id;
> +               struct mdp_comp *comp;
> +
> +               of_id = of_match_node(mdp_comp_dt_ids, node);
> +               if (!of_id)
> +                       continue;
> +
> +               if (!of_device_is_available(node)) {
> +                       dev_err(dev, "Skipping disabled component %pOF\n",
> +                               node);
> +                       continue;
> +               }
> +
> +               type = (enum mdp_comp_type)of_id->data;
> +               id = mdp_comp_get_id(dev, node, type);
> +               if (id < 0) {
> +                       dev_warn(dev, "Skipping unknown component %pOF\n",
> +                                node);
> +                       continue;
> +               }
> +
> +               comp = devm_kzalloc(dev, sizeof(*comp), GFP_KERNEL);
> +               if (!comp) {
> +                       ret = -ENOMEM;
> +                       goto err_init_comps;
> +               }
> +               mdp->comp[id] = comp;
> +
> +               ret = mdp_comp_init(dev, mdp, node, comp, id);
> +               if (ret)
> +                       goto err_init_comps;
> +
> +               dev_info(dev, "%s type:%d alias:%d id:%d base:%#x regs:%p\n",
> +                        of_id->compatible, type, comp->alias_id, id,
> +                       (u32)comp->reg_base, comp->regs);
> +       }
> +       return 0;
> +
> +err_init_comps:
> +       mdp_component_deinit(dev, mdp);
> +err_init_mm:
> +       return ret;
> +}
> +
> +int mdp_comp_ctx_init(struct mdp_dev *mdp, struct mdp_comp_ctx *ctx,
> +                     const struct img_compparam *param,
> +       const struct img_ipi_frameparam *frame)
> +{
> +       int i;
> +
> +       if (param->type < 0 || param->type >= MDP_MAX_COMP_COUNT) {
> +               mdp_err("Invalid component id %d", param->type);
> +               return -EINVAL;
> +       }
> +
> +       ctx->comp = mdp->comp[param->type];
> +       if (!ctx->comp) {
> +               mdp_err("Uninit component id %d", param->type);
> +               return -EINVAL;
> +       }
> +
> +       ctx->param = param;
> +       ctx->input = &frame->inputs[param->input];
> +       for (i = 0; i < param->num_outputs; i++)
> +               ctx->outputs[i] = &frame->outputs[param->outputs[i]];
> +       return 0;
> +}
> +
> diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h b/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h
> new file mode 100644
> index 000000000000..0c65214ef695
> --- /dev/null
> +++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h
> @@ -0,0 +1,177 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2018 MediaTek Inc.
> + * Author: Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.

You already have the SPDX identifier, so please don't also copy the
GPL boilerplate. The SPDX is supposed to replace it. This applies to a
few other files as well.

> + */
> +
> +#ifndef __MTK_MDP3_COMP_H__
> +#define __MTK_MDP3_COMP_H__
> +
> +#include "mtk-mdp3-cmdq.h"
> +
> +enum mdp_comp_type {
> +       MDP_COMP_TYPE_INVALID = 0,
> +
> +       MDP_COMP_TYPE_RDMA,
> +       MDP_COMP_TYPE_RSZ,
> +       MDP_COMP_TYPE_WROT,
> +       MDP_COMP_TYPE_WDMA,
> +       MDP_COMP_TYPE_PATH,
> +
> +       MDP_COMP_TYPE_TDSHP,
> +       MDP_COMP_TYPE_COLOR,
> +       MDP_COMP_TYPE_DRE,
> +       MDP_COMP_TYPE_CCORR,
> +       MDP_COMP_TYPE_HDR,
> +
> +       MDP_COMP_TYPE_IMGI,
> +       MDP_COMP_TYPE_WPEI,
> +       MDP_COMP_TYPE_EXTO,     /* External path */
> +       MDP_COMP_TYPE_DL_PATH,  /* Direct-link path */
> +
> +       MDP_COMP_TYPE_COUNT     /* ALWAYS keep at the end */
> +};
> +
> +enum mdp_comp_id {
> +       MDP_COMP_NONE = -1,     /* Invalid engine */
> +
> +       /* ISP */
> +       MDP_COMP_WPEI = 0,
> +       MDP_COMP_WPEO,          /* 1 */
> +       MDP_COMP_WPEI2,         /* 2 */
> +       MDP_COMP_WPEO2,         /* 3 */
> +       MDP_COMP_ISP_IMGI,      /* 4 */
> +       MDP_COMP_ISP_IMGO,      /* 5 */
> +       MDP_COMP_ISP_IMG2O,     /* 6 */
> +
> +       /* IPU */
> +       MDP_COMP_IPUI,          /* 7 */
> +       MDP_COMP_IPUO,          /* 8 */
> +
> +       /* MDP */
> +       MDP_COMP_CAMIN,         /* 9 */
> +       MDP_COMP_CAMIN2,        /* 10 */
> +       MDP_COMP_RDMA0,         /* 11 */
> +       MDP_COMP_AAL0,          /* 12 */
> +       MDP_COMP_CCORR0,        /* 13 */
> +       MDP_COMP_RSZ0,          /* 14 */
> +       MDP_COMP_RSZ1,          /* 15 */
> +       MDP_COMP_TDSHP0,        /* 16 */
> +       MDP_COMP_COLOR0,        /* 17 */
> +       MDP_COMP_PATH0_SOUT,    /* 18 */
> +       MDP_COMP_PATH1_SOUT,    /* 19 */
> +       MDP_COMP_WROT0,         /* 20 */
> +       MDP_COMP_WDMA,          /* 21 */
> +
> +       /* Dummy Engine */
> +       MDP_COMP_RDMA1,         /* 22 */
> +       MDP_COMP_RSZ2,          /* 23 */
> +       MDP_COMP_TDSHP1,        /* 24 */
> +       MDP_COMP_WROT1,         /* 25 */
> +
> +       MDP_MAX_COMP_COUNT      /* ALWAYS keep at the end */
> +};
> +
> +enum mdp_comp_event {
> +       RDMA0_SOF,
> +       RDMA0_DONE,
> +       RDMA1_SOF,
> +       RDMA1_DONE,
> +       RSZ0_SOF,
> +       RSZ1_SOF,
> +       TDSHP0_SOF,
> +       WROT0_SOF,
> +       WROT0_DONE,
> +       WROT1_SOF,
> +       WROT1_DONE,
> +       WDMA0_SOF,
> +       WDMA0_DONE,
> +       IMG_DL_SOF,
> +
> +       ISP_P2_0_DONE,
> +       ISP_P2_1_DONE,
> +       ISP_P2_2_DONE,
> +       ISP_P2_3_DONE,
> +       ISP_P2_4_DONE,
> +       ISP_P2_5_DONE,
> +       ISP_P2_6_DONE,
> +       ISP_P2_7_DONE,
> +       ISP_P2_8_DONE,
> +       ISP_P2_9_DONE,
> +       ISP_P2_10_DONE,
> +       ISP_P2_11_DONE,
> +       ISP_P2_12_DONE,
> +       ISP_P2_13_DONE,
> +       ISP_P2_14_DONE,
> +
> +       WPE_DONE,
> +       WPE_B_DONE,
> +       WROT0_SRAM_READY,
> +       WROT1_SRAM_READY,
> +
> +       MDP_MAX_EVENT_COUNT     /* ALWAYS keep at the end */
> +};
> +
> +struct mdp_comp_ops;
> +
> +struct mdp_comp {
> +       struct mdp_dev          *mdp_dev;
> +       /* struct device_node   *dev_node; */
> +       void __iomem            *regs;
> +       phys_addr_t             reg_base;
> +       u8                      subsys_id;
> +       struct clk              *clks[2];
> +       struct device           *larb_dev;
> +       enum mdp_comp_type      type;
> +       enum mdp_comp_id        id;
> +       u32                     alias_id;
> +       const struct mdp_comp_ops *ops;
> +};
> +
> +struct mdp_comp_ctx {
> +       struct mdp_comp                 *comp;
> +       const struct img_compparam      *param;
> +       const struct img_input          *input;
> +       const struct img_output         *outputs[IMG_MAX_HW_OUTPUTS];
> +};
> +
> +struct mdp_comp_ops {
> +       s64 (*get_comp_flag)(const struct mdp_comp_ctx *ctx);
> +       /* s64 (*query_feature)(void); */
> +       int (*init_comp)(struct mdp_comp_ctx *ctx, struct mdp_cmd *cmd);
> +       int (*config_frame)(struct mdp_comp_ctx *ctx, struct mdp_cmd *cmd,
> +                           const struct v4l2_rect *compose);
> +       /* int (*config_frame_end)(struct mdp_comp_ctx *ctx,
> +        *      struct mdp_cmd *cmd);
> +        */
> +       int (*config_subfrm)(struct mdp_comp_ctx *ctx,
> +                            struct mdp_cmd *cmd, u32 index);
> +       int (*wait_comp_event)(struct mdp_comp_ctx *ctx,
> +                              struct mdp_cmd *cmd);
> +       int (*advance_subfrm)(struct mdp_comp_ctx *ctx,
> +                             struct mdp_cmd *cmd, u32 index);
> +       int (*post_process)(struct mdp_comp_ctx *ctx, struct mdp_cmd *cmd);
> +       /* void (*release)(struct mdp_comp_ctx *ctx); */
> +};
> +
> +struct mdp_dev;
> +
> +int mdp_component_init(struct device *dev, struct mdp_dev *mdp);
> +void mdp_component_deinit(struct device *dev, struct mdp_dev *mdp);
> +void mdp_comp_clock_on(struct device *dev, struct mdp_comp *comp);
> +void mdp_comp_clock_off(struct device *dev, struct mdp_comp *comp);
> +int mdp_comp_ctx_init(struct mdp_dev *mdp, struct mdp_comp_ctx *ctx,
> +                     const struct img_compparam *param,
> +       const struct img_ipi_frameparam *frame);
> +
> +#endif  /* __MTK_MDP3_COMP_H__ */
> +
> diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c b/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c
> new file mode 100644
> index 000000000000..47b5d87834de
> --- /dev/null
> +++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c
> @@ -0,0 +1,256 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2018 MediaTek Inc.
> + * Author: Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <linux/module.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/remoteproc.h>
> +#include <linux/platform_data/mtk_scp.h>
> +#include <media/videobuf2-dma-contig.h>
> +#include "mtk-mdp3-core.h"
> +#include "mtk-mdp3-m2m.h"
> +
> +/* MDP debug log level (0-3). 3 shows all the logs. */
> +int mtk_mdp_debug;
> +EXPORT_SYMBOL(mtk_mdp_debug);
> +module_param_named(debug, mtk_mdp_debug, int, 0644);
> +
> +static const struct of_device_id mdp_of_ids[] = {
> +       { .compatible = "mediatek,mt8183-mdp3", },
> +       {},
> +};
> +MODULE_DEVICE_TABLE(of, mdp_of_ids);
> +
> +struct platform_device *mdp_get_plat_device(struct platform_device *pdev)
> +{
> +       struct device *dev = &pdev->dev;
> +       struct device_node *mdp_node;
> +       struct platform_device *mdp_pdev;
> +
> +       mdp_node = of_parse_phandle(dev->of_node, "mediatek,mdp3", 0);
> +       if (!mdp_node) {
> +               dev_err(dev, "can't get mdp node\n");
> +               return NULL;
> +       }
> +
> +       mdp_pdev = of_find_device_by_node(mdp_node);
> +       if (WARN_ON(!mdp_pdev)) {
> +               dev_err(dev, "mdp pdev failed\n");
> +               of_node_put(mdp_node);
> +               return NULL;
> +       }
> +
> +       return mdp_pdev;
> +}
> +EXPORT_SYMBOL_GPL(mdp_get_plat_device);
> +
> +int mdp_vpu_get_locked(struct mdp_dev *mdp)
> +{
> +       int ret = 0;
> +
> +       if (mdp->vpu_count++ == 0) {
> +               ret = rproc_boot(mdp->rproc_handle);
> +               if (ret < 0) {
> +                       dev_err(&mdp->pdev->dev,
> +                               "vpu_load_firmware failed %d\n", ret);
> +                       goto err_load_vpu;
> +               }
> +               ret = mdp_vpu_register(mdp->vpu_dev);

With mdp_vpu_unregister doing nothing, isn't it a problem to register
the same callbacks several times? How about moving this into probe?

> +               if (ret < 0) {
> +                       dev_err(&mdp->pdev->dev,
> +                               "mdp_vpu register failed %d\n", ret);
> +                       goto err_reg_vpu;
> +               }
> +               ret = mdp_vpu_dev_init(&mdp->vpu, mdp->vpu_dev, &mdp->vpu_lock);
> +               if (ret) {
> +                       dev_err(&mdp->pdev->dev,
> +                               "mdp_vpu device init failed %d\n", ret);
> +                       goto err_init_vpu;
> +               }
> +       }
> +       return 0;
> +
> +err_init_vpu:
> +       mdp_vpu_unregister(mdp->vpu_dev);
> +err_reg_vpu:
> +err_load_vpu:
> +       mdp->vpu_count--;
> +       return ret;
> +}
> +
> +void mdp_vpu_put_locked(struct mdp_dev *mdp)
> +{
> +       if (--mdp->vpu_count == 0) {
> +               mdp_vpu_dev_deinit(&mdp->vpu);
> +               mdp_vpu_unregister(mdp->vpu_dev);
> +       }
> +}
> +
> +static int mdp_probe(struct platform_device *pdev)
> +{
> +       struct device *dev = &pdev->dev;
> +       struct mdp_dev *mdp;
> +       phandle rproc_phandle;
> +       int ret;
> +
> +       mdp = devm_kzalloc(dev, sizeof(*mdp), GFP_KERNEL);
> +       if (!mdp)
> +               return -ENOMEM;
> +
> +       mdp->pdev = pdev;
> +       ret = mdp_component_init(dev, mdp);
> +       if (ret) {
> +               dev_err(dev, "Failed to initialize mdp components\n");
> +               goto err_init_comp;
> +       }
> +
> +       mdp->job_wq = create_singlethread_workqueue(MDP_MODULE_NAME);
> +       if (!mdp->job_wq) {
> +               dev_err(dev, "Unable to create job workqueue\n");
> +               ret = -ENOMEM;
> +               goto err_create_job_wq;
> +       }
> +
> +       mdp->vpu_dev = scp_get_pdev(pdev);
> +
> +       if (of_property_read_u32(pdev->dev.of_node, "mediatek,scp",
> +                                &rproc_phandle))
> +               dev_err(&pdev->dev, "Could not get scp device\n");
> +       else
> +               dev_info(&pdev->dev, "Find mediatek,scp phandle:%llx\n",
> +                        (unsigned long long)rproc_phandle);
> +
> +       mdp->rproc_handle = rproc_get_by_phandle(rproc_phandle);
> +
> +       dev_info(&pdev->dev, "MDP rproc_handle: %llx",
> +                (unsigned long long)mdp->rproc_handle);
> +
> +       if (!mdp->rproc_handle)
> +               dev_err(&pdev->dev, "Could not get MDP's rproc_handle\n");
> +
> +       /* vpu_wdt_reg_handler(mdp->vpu_dev, mdp_reset_handler, mdp,
> +        *                     VPU_RST_MDP);
> +        */
> +       mutex_init(&mdp->vpu_lock);
> +       mdp->vpu_count = 0;
> +       mdp->id_count = 0;
> +
> +       mdp->cmdq_clt = cmdq_mbox_create(dev, 0, 1200);
> +       if (IS_ERR(mdp->cmdq_clt))
> +               goto err_mbox_create;
> +
> +       ret = v4l2_device_register(dev, &mdp->v4l2_dev);
> +       if (ret) {
> +               dev_err(dev, "Failed to register v4l2 device\n");
> +               ret = -EINVAL;
> +               goto err_v4l2_register;
> +       }
> +
> +       ret = mdp_m2m_device_register(mdp);
> +       if (ret) {
> +               v4l2_err(&mdp->v4l2_dev, "Failed to register m2m device\n");
> +               goto err_m2m_register;
> +       }
> +       mutex_init(&mdp->m2m_lock);
> +
> +       platform_set_drvdata(pdev, mdp);
> +
> +       vb2_dma_contig_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
> +       pm_runtime_enable(dev);
> +       dev_dbg(dev, "mdp-%d registered successfully\n", pdev->id);
> +       return 0;
> +
> +err_m2m_register:
> +       v4l2_device_unregister(&mdp->v4l2_dev);
> +err_v4l2_register:
> +err_mbox_create:
> +       destroy_workqueue(mdp->job_wq);
> +err_create_job_wq:
> +err_init_comp:
> +       kfree(mdp);
> +
> +       dev_dbg(dev, "Errno %d\n", ret);
> +       return ret;
> +}
> +
> +static int mdp_remove(struct platform_device *pdev)
> +{
> +       struct mdp_dev *mdp = platform_get_drvdata(pdev);
> +
> +       pm_runtime_disable(&pdev->dev);
> +       vb2_dma_contig_clear_max_seg_size(&pdev->dev);
> +       mdp_m2m_device_unregister(mdp);
> +       v4l2_device_unregister(&mdp->v4l2_dev);
> +
> +       flush_workqueue(mdp->job_wq);
> +       destroy_workqueue(mdp->job_wq);
> +
> +       mdp_component_deinit(&pdev->dev, mdp);
> +       kfree(mdp);
> +
> +       dev_dbg(&pdev->dev, "%s driver unloaded\n", pdev->name);
> +       return 0;
> +}
> +
> +static int __maybe_unused mdp_pm_suspend(struct device *dev)
> +{
> +       // TODO: mdp clock off
> +       return 0;
> +}
> +
> +static int __maybe_unused mdp_pm_resume(struct device *dev)
> +{
> +       // TODO: mdp clock on
> +       return 0;
> +}
> +
> +static int __maybe_unused mdp_suspend(struct device *dev)
> +{
> +       if (pm_runtime_suspended(dev))
> +               return 0;
> +
> +       return mdp_pm_suspend(dev);
> +}
> +
> +static int __maybe_unused mdp_resume(struct device *dev)
> +{
> +       if (pm_runtime_suspended(dev))
> +               return 0;
> +
> +       return mdp_pm_resume(dev);
> +}
> +
> +static const struct dev_pm_ops mdp_pm_ops = {
> +       SET_SYSTEM_SLEEP_PM_OPS(mdp_suspend, mdp_resume)
> +       SET_RUNTIME_PM_OPS(mdp_pm_suspend, mdp_pm_resume, NULL)
> +};
> +
> +static struct platform_driver mdp_driver = {
> +       .probe          = mdp_probe,
> +       .remove         = mdp_remove,
> +       .driver = {
> +               .name   = MDP_MODULE_NAME,
> +               .pm     = &mdp_pm_ops,
> +               .of_match_table = mdp_of_ids,
> +       },
> +};
> +
> +module_platform_driver(mdp_driver);
> +
> +MODULE_AUTHOR("Ping-Hsun Wu <ping-hsun.wu@mediatek.com>");
> +MODULE_DESCRIPTION("Mediatek image processor 3 driver");
> +MODULE_LICENSE("GPL v2");
> +
> diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h b/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h
> new file mode 100644
> index 000000000000..5ef3199b55e2
> --- /dev/null
> +++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h
> @@ -0,0 +1,88 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2018 MediaTek Inc.
> + * Author: Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#ifndef __MTK_MDP3_CORE_H__
> +#define __MTK_MDP3_CORE_H__
> +
> +#include <media/v4l2-device.h>
> +#include <media/v4l2-mem2mem.h>
> +#include "mtk-mdp3-comp.h"
> +#include "mtk-mdp3-vpu.h"
> +
> +#define MDP_MODULE_NAME        "mtk-mdp3"
> +
> +enum mdp_buffer_usage {
> +       MDP_BUFFER_USAGE_HW_READ,
> +       MDP_BUFFER_USAGE_MDP,
> +       MDP_BUFFER_USAGE_MDP2,
> +       MDP_BUFFER_USAGE_ISP,
> +       MDP_BUFFER_USAGE_WPE,
> +};
> +
> +struct mdp_dev {
> +       struct platform_device  *pdev;
> +       struct mdp_comp         mmsys;
> +       struct mdp_comp         mm_mutex;
> +       struct mdp_comp         *comp[MDP_MAX_COMP_COUNT];
> +       s32                     event[MDP_MAX_EVENT_COUNT];
> +
> +       struct workqueue_struct *job_wq;
> +       struct mdp_vpu_dev      vpu;
> +       struct platform_device  *vpu_dev;
> +       struct rproc *rproc_handle;
> +       /* synchronization protect for image configuration reference count */
> +       struct mutex            vpu_lock;
> +       s32                     vpu_count;
> +       u32                     id_count;
> +       struct cmdq_client      *cmdq_clt;
> +
> +       struct v4l2_device      v4l2_dev;
> +       struct video_device     *m2m_vdev;
> +       struct v4l2_m2m_dev     *m2m_dev;
> +       /* synchronization protect for m2m device operation */
> +       struct mutex            m2m_lock;
> +};
> +
> +int mdp_vpu_get_locked(struct mdp_dev *mdp);
> +void mdp_vpu_put_locked(struct mdp_dev *mdp);
> +
> +extern int mtk_mdp_debug;
> +
> +#define DEBUG
> +#if defined(DEBUG)
> +
> +#define mdp_dbg(level, fmt, ...)\
> +       do {\
> +               if (mtk_mdp_debug >= (level))\
> +                       pr_info("[MTK-MDP3] %d %s:%d: " fmt "\n",\
> +                               level, __func__, __LINE__, ##__VA_ARGS__);\
> +       } while (0)
> +
> +#define mdp_err(fmt, ...)\
> +       pr_err("[MTK-MDP3][ERR] %s:%d: " fmt "\n", __func__, __LINE__,\
> +               ##__VA_ARGS__)
> +
> +#else
> +
> +#define mdp_dbg(level, fmt, ...)       do {} while (0)
> +#define mdp_err(fmt, ...)              do {} while (0)
> +
> +#endif
> +
> +#define mdp_dbg_enter() mdp_dbg(3, "+")
> +#define mdp_dbg_leave() mdp_dbg(3, "-")
> +
> +#endif  /* __MTK_MDP3_CORE_H__ */
> +
> diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-m2m.c b/drivers/media/platform/mtk-mdp3/mtk-mdp3-m2m.c
> new file mode 100644
> index 000000000000..638a854c502c
> --- /dev/null
> +++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-m2m.c
> @@ -0,0 +1,823 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2018 MediaTek Inc.
> + * Author: Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <linux/platform_device.h>
> +#include <media/v4l2-ioctl.h>
> +#include <media/v4l2-event.h>
> +#include <media/videobuf2-dma-contig.h>
> +#include "mtk-mdp3-m2m.h"
> +
> +static inline struct mdp_m2m_ctx *fh_to_ctx(struct v4l2_fh *fh)
> +{
> +       return container_of(fh, struct mdp_m2m_ctx, fh);
> +}
> +
> +static inline struct mdp_m2m_ctx *ctrl_to_ctx(struct v4l2_ctrl *ctrl)
> +{
> +       return container_of(ctrl->handler, struct mdp_m2m_ctx, ctrl_handler);
> +}
> +
> +static inline struct mdp_frame *ctx_get_frame(struct mdp_m2m_ctx *ctx,
> +                                             enum v4l2_buf_type type)
> +{
> +       if (V4L2_TYPE_IS_OUTPUT(type))
> +               return &ctx->curr_param->output;
> +       return &ctx->curr_param->captures[0];

Let's use an else here for symetry.

> +}
> +
> +static void mdp_m2m_ctx_set_state(struct mdp_m2m_ctx *ctx, u32 state)
> +{
> +       mutex_lock(&ctx->curr_param->lock);
> +       ctx->curr_param->state |= state;
> +       mutex_unlock(&ctx->curr_param->lock);
> +}
> +
> +static bool mdp_m2m_ctx_is_state_set(struct mdp_m2m_ctx *ctx, u32 mask)
> +{
> +       bool ret;
> +
> +       mutex_lock(&ctx->curr_param->lock);
> +       ret = (ctx->curr_param->state & mask) == mask;
> +       mutex_unlock(&ctx->curr_param->lock);
> +       return ret;
> +}
> +
> +static void mdp_m2m_ctx_lock(struct vb2_queue *q)
> +{
> +       struct mdp_m2m_ctx *ctx = vb2_get_drv_priv(q);
> +
> +       mutex_lock(&ctx->mdp_dev->m2m_lock);
> +}
> +
> +static void mdp_m2m_ctx_unlock(struct vb2_queue *q)
> +{
> +       struct mdp_m2m_ctx *ctx = vb2_get_drv_priv(q);
> +
> +       mutex_unlock(&ctx->mdp_dev->m2m_lock);
> +}
> +
> +static void mdp_m2m_job_abort(void *priv)
> +{
> +}
> +
> +static void mdp_m2m_process_done(void *priv, int vb_state)
> +{
> +       struct mdp_m2m_ctx *ctx = priv;
> +       struct vb2_buffer *src_vb, *dst_vb;
> +       struct vb2_v4l2_buffer *src_vbuf, *dst_vbuf;
> +       u32 valid_output_flags = V4L2_BUF_FLAG_TIMECODE |
> +                                V4L2_BUF_FLAG_TSTAMP_SRC_MASK |
> +                                V4L2_BUF_FLAG_KEYFRAME |
> +                                V4L2_BUF_FLAG_PFRAME | V4L2_BUF_FLAG_BFRAME;
> +
> +       src_vb = v4l2_m2m_src_buf_remove(ctx->m2m_ctx);

Compiler warning: assignment from incompatible pointer.

> +       src_vbuf = to_vb2_v4l2_buffer(src_vb);
> +       dst_vb = v4l2_m2m_dst_buf_remove(ctx->m2m_ctx);

Here too, as well as in other places of this file where these
functions are called.

> +       dst_vbuf = to_vb2_v4l2_buffer(dst_vb);
> +
> +       src_vbuf->sequence = ctx->frame_count;
> +       dst_vbuf->sequence = src_vbuf->sequence;
> +       dst_vbuf->timecode = src_vbuf->timecode;
> +       dst_vbuf->flags &= ~valid_output_flags;
> +       dst_vbuf->flags |= src_vbuf->flags & valid_output_flags;
> +
> +       v4l2_m2m_buf_done(src_vbuf, vb_state);
> +       v4l2_m2m_buf_done(dst_vbuf, vb_state);
> +       v4l2_m2m_job_finish(ctx->mdp_dev->m2m_dev, ctx->m2m_ctx);
> +
> +       ctx->curr_param->frame_no = ctx->frame_count++;
> +}

[snip]

> diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-m2m.h b/drivers/media/platform/mtk-mdp3/mtk-mdp3-m2m.h
> new file mode 100644
> index 000000000000..1f681b48c2ad
> --- /dev/null
> +++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-m2m.h
> @@ -0,0 +1,52 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2018 MediaTek Inc.
> + * Author: Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#ifndef __MTK_MDP3_M2M_H__
> +#define __MTK_MDP3_M2M_H__
> +
> +#include <media/v4l2-ctrls.h>
> +#include "mtk-mdp3-core.h"
> +#include "mtk-mdp3-vpu.h"
> +#include "mtk-mdp3-regs.h"
> +
> +#define MDP_MAX_CTRLS  10
> +
> +struct mdp_m2m_ctrls {
> +       struct v4l2_ctrl        *hflip;
> +       struct v4l2_ctrl        *vflip;
> +       /* struct v4l2_ctrl     *sharpness; */
> +       struct v4l2_ctrl        *rotate;
> +};

I see the members of this struct assigned in mdp_m2m_ctrls_create(),
but they are then completely untouched. What is their purpose? Looks
like we can just remove them.

> +
> +struct mdp_m2m_ctx {
> +       u32                             id;
> +       struct mdp_dev                  *mdp_dev;
> +       struct v4l2_fh                  fh;
> +       struct v4l2_ctrl_handler        ctrl_handler;
> +       struct mdp_m2m_ctrls            ctrls;
> +       struct v4l2_m2m_ctx             *m2m_ctx;
> +       struct mdp_vpu_ctx              vpu;
> +       struct work_struct              work;
> +       u32                             frame_count;
> +
> +       struct mdp_frameparam           *curr_param;
> +       struct list_head                param_list;
> +};
> +
> +int mdp_m2m_device_register(struct mdp_dev *mdp);
> +void mdp_m2m_device_unregister(struct mdp_dev *mdp);
> +
> +#endif  /* __MTK_MDP3_M2M_H__ */
> +
> diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.c b/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.c
> new file mode 100644
> index 000000000000..b623eda06c7d
> --- /dev/null
> +++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.c
> @@ -0,0 +1,757 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2018 MediaTek Inc.
> + * Author: Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <media/v4l2-common.h>
> +#include <media/videobuf2-v4l2.h>
> +#include <media/videobuf2-dma-contig.h>
> +#include "mtk-mdp3-core.h"
> +#include "mtk-mdp3-regs.h"
> +
> +static const struct mdp_format mdp_formats[] = {
> +       {
> +               .pixelformat    = V4L2_PIX_FMT_GREY,
> +               .mdp_color      = MDP_COLOR_GREY,
> +               .depth          = { 8 },
> +               .row_depth      = { 8 },
> +               .num_planes     = 1,
> +               .flags          = MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
> +       }, {
> +               .pixelformat    = V4L2_PIX_FMT_RGB565X,
> +               .mdp_color      = MDP_COLOR_RGB565,
> +               .depth          = { 16 },
> +               .row_depth      = { 16 },
> +               .num_planes     = 1,
> +               .flags          = MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
> +       }, {
> +               .pixelformat    = V4L2_PIX_FMT_RGB565,
> +               .mdp_color      = MDP_COLOR_BGR565,
> +               .depth          = { 16 },
> +               .row_depth      = { 16 },
> +               .num_planes     = 1,
> +               .flags          = MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
> +       }, {
> +               .pixelformat    = V4L2_PIX_FMT_RGB24,
> +               .mdp_color      = MDP_COLOR_RGB888,
> +               .depth          = { 24 },
> +               .row_depth      = { 24 },
> +               .num_planes     = 1,
> +               .flags          = MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
> +       }, {
> +               .pixelformat    = V4L2_PIX_FMT_BGR24,
> +               .mdp_color      = MDP_COLOR_BGR888,
> +               .depth          = { 24 },
> +               .row_depth      = { 24 },
> +               .num_planes     = 1,
> +               .flags          = MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
> +       }, {
> +               .pixelformat    = V4L2_PIX_FMT_ABGR32,
> +               .mdp_color      = MDP_COLOR_BGRA8888,
> +               .depth          = { 32 },
> +               .row_depth      = { 32 },
> +               .num_planes     = 1,
> +               .flags          = MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
> +       }, {
> +               .pixelformat    = V4L2_PIX_FMT_ARGB32,
> +               .mdp_color      = MDP_COLOR_ARGB8888,
> +               .depth          = { 32 },
> +               .row_depth      = { 32 },
> +               .num_planes     = 1,
> +               .flags          = MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
> +       }, {
> +               .pixelformat    = V4L2_PIX_FMT_UYVY,
> +               .mdp_color      = MDP_COLOR_UYVY,
> +               .depth          = { 16 },
> +               .row_depth      = { 16 },
> +               .num_planes     = 1,
> +               .walign         = 1,
> +               .flags          = MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
> +       }, {
> +               .pixelformat    = V4L2_PIX_FMT_VYUY,
> +               .mdp_color      = MDP_COLOR_VYUY,
> +               .depth          = { 16 },
> +               .row_depth      = { 16 },
> +               .num_planes     = 1,
> +               .walign         = 1,
> +               .flags          = MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
> +       }, {
> +               .pixelformat    = V4L2_PIX_FMT_YUYV,
> +               .mdp_color      = MDP_COLOR_YUYV,
> +               .depth          = { 16 },
> +               .row_depth      = { 16 },
> +               .num_planes     = 1,
> +               .walign         = 1,
> +               .flags          = MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
> +       }, {
> +               .pixelformat    = V4L2_PIX_FMT_YVYU,
> +               .mdp_color      = MDP_COLOR_YVYU,
> +               .depth          = { 16 },
> +               .row_depth      = { 16 },
> +               .num_planes     = 1,
> +               .walign         = 1,
> +               .flags          = MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
> +       }, {
> +               .pixelformat    = V4L2_PIX_FMT_YUV420,
> +               .mdp_color      = MDP_COLOR_I420,
> +               .depth          = { 12 },
> +               .row_depth      = { 8 },
> +               .num_planes     = 1,
> +               .walign         = 1,
> +               .halign         = 1,
> +               .flags          = MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
> +       }, {
> +               .pixelformat    = V4L2_PIX_FMT_YVU420,
> +               .mdp_color      = MDP_COLOR_YV12,
> +               .depth          = { 12 },
> +               .row_depth      = { 8 },
> +               .num_planes     = 1,
> +               .walign         = 1,
> +               .halign         = 1,
> +               .flags          = MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
> +       }, {
> +               .pixelformat    = V4L2_PIX_FMT_NV12,
> +               .mdp_color      = MDP_COLOR_NV12,
> +               .depth          = { 12 },
> +               .row_depth      = { 8 },
> +               .num_planes     = 1,
> +               .walign         = 1,
> +               .halign         = 1,
> +               .flags          = MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
> +       }, {
> +               .pixelformat    = V4L2_PIX_FMT_NV21,
> +               .mdp_color      = MDP_COLOR_NV21,
> +               .depth          = { 12 },
> +               .row_depth      = { 8 },
> +               .num_planes     = 1,
> +               .walign         = 1,
> +               .halign         = 1,
> +               .flags          = MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
> +       }, {
> +               .pixelformat    = V4L2_PIX_FMT_NV16,
> +               .mdp_color      = MDP_COLOR_NV16,
> +               .depth          = { 16 },
> +               .row_depth      = { 8 },
> +               .num_planes     = 1,
> +               .walign         = 1,
> +               .flags          = MDP_FMT_FLAG_OUTPUT,
> +       }, {
> +               .pixelformat    = V4L2_PIX_FMT_NV61,
> +               .mdp_color      = MDP_COLOR_NV61,
> +               .depth          = { 16 },
> +               .row_depth      = { 8 },
> +               .num_planes     = 1,
> +               .walign         = 1,
> +               .flags          = MDP_FMT_FLAG_OUTPUT,
> +       }, {
> +               .pixelformat    = V4L2_PIX_FMT_NV24,
> +               .mdp_color      = MDP_COLOR_NV24,
> +               .depth          = { 24 },
> +               .row_depth      = { 8 },
> +               .num_planes     = 1,
> +               .flags          = MDP_FMT_FLAG_OUTPUT,
> +       }, {
> +               .pixelformat    = V4L2_PIX_FMT_NV42,
> +               .mdp_color      = MDP_COLOR_NV42,
> +               .depth          = { 24 },
> +               .row_depth      = { 8 },
> +               .num_planes     = 1,
> +               .flags          = MDP_FMT_FLAG_OUTPUT,
> +       }, {
> +               .pixelformat    = V4L2_PIX_FMT_MT21C,
> +               .mdp_color      = MDP_COLOR_420_BLK_UFO,
> +               .depth          = { 8, 4 },
> +               .row_depth      = { 8, 8 },
> +               .num_planes     = 2,
> +               .walign         = 4,
> +               .halign         = 5,
> +               .flags          = MDP_FMT_FLAG_OUTPUT,
> +       }, {
> +               .pixelformat    = V4L2_PIX_FMT_NV12MT,
> +               .mdp_color      = MDP_COLOR_420_BLK,
> +               .depth          = { 8, 4 },
> +               .row_depth      = { 8, 8 },
> +               .num_planes     = 2,
> +               .walign         = 4,
> +               .halign         = 5,
> +               .flags          = MDP_FMT_FLAG_OUTPUT,
> +       }, {
> +               .pixelformat    = V4L2_PIX_FMT_NV12M,
> +               .mdp_color      = MDP_COLOR_NV12,
> +               .depth          = { 8, 4 },
> +               .row_depth      = { 8, 8 },
> +               .num_planes     = 2,
> +               .walign         = 1,
> +               .halign         = 1,
> +               .flags          = MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
> +       }, {
> +               .pixelformat    = V4L2_PIX_FMT_NV21M,
> +               .mdp_color      = MDP_COLOR_NV21,
> +               .depth          = { 8, 4 },
> +               .row_depth      = { 8, 8 },
> +               .num_planes     = 2,
> +               .walign         = 1,
> +               .halign         = 1,
> +               .flags          = MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
> +       }, {
> +               .pixelformat    = V4L2_PIX_FMT_NV16M,
> +               .mdp_color      = MDP_COLOR_NV16,
> +               .depth          = { 8, 8 },
> +               .row_depth      = { 8, 8 },
> +               .num_planes     = 2,
> +               .walign         = 1,
> +               .flags          = MDP_FMT_FLAG_OUTPUT,
> +       }, {
> +               .pixelformat    = V4L2_PIX_FMT_NV61M,
> +               .mdp_color      = MDP_COLOR_NV61,
> +               .depth          = { 8, 8 },
> +               .row_depth      = { 8, 8 },
> +               .num_planes     = 2,
> +               .walign         = 1,
> +               .flags          = MDP_FMT_FLAG_OUTPUT,
> +       }, {
> +               .pixelformat    = V4L2_PIX_FMT_YUV420M,
> +               .mdp_color      = MDP_COLOR_I420,
> +               .depth          = { 8, 2, 2 },
> +               .row_depth      = { 8, 4, 4 },
> +               .num_planes     = 3,
> +               .walign         = 1,
> +               .halign         = 1,
> +               .flags          = MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
> +       }, {
> +               .pixelformat    = V4L2_PIX_FMT_YVU420M,
> +               .mdp_color      = MDP_COLOR_YV12,
> +               .depth          = { 8, 2, 2 },
> +               .row_depth      = { 8, 4, 4 },
> +               .num_planes     = 3,
> +               .walign         = 1,
> +               .halign         = 1,
> +               .flags          = MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
> +       }
> +};
> +
> +static const struct mdp_limit mdp_def_limit = {
> +       .out_limit = {
> +               .wmin   = 16,
> +               .hmin   = 16,
> +               .wmax   = 8176,
> +               .hmax   = 8176,
> +       },
> +       .cap_limit = {
> +               .wmin   = 2,
> +               .hmin   = 2,
> +               .wmax   = 8176,
> +               .hmax   = 8176,
> +       },
> +       .h_scale_up_max = 32,
> +       .v_scale_up_max = 32,
> +       .h_scale_down_max = 20,
> +       .v_scale_down_max = 128,
> +};
> +
> +static const struct mdp_format *mdp_find_fmt(u32 pixelformat, u32 type)
> +{
> +       u32 i, flag;
> +
> +       flag = V4L2_TYPE_IS_OUTPUT(type) ? MDP_FMT_FLAG_OUTPUT :
> +                                       MDP_FMT_FLAG_CAPTURE;
> +       for (i = 0; i < ARRAY_SIZE(mdp_formats); ++i) {
> +               if (!(mdp_formats[i].flags & flag))
> +                       continue;
> +               if (mdp_formats[i].pixelformat == pixelformat)
> +                       return &mdp_formats[i];
> +       }
> +       return NULL;
> +}
> +
> +static const struct mdp_format *mdp_find_fmt_by_index(u32 index, u32 type)
> +{
> +       u32 i, flag, num = 0;
> +
> +       flag = V4L2_TYPE_IS_OUTPUT(type) ? MDP_FMT_FLAG_OUTPUT :
> +                                       MDP_FMT_FLAG_CAPTURE;
> +       for (i = 0; i < ARRAY_SIZE(mdp_formats); ++i) {
> +               if (!(mdp_formats[i].flags & flag))
> +                       continue;
> +               if (index == num)
> +                       return &mdp_formats[i];
> +               num++;
> +       }
> +       return NULL;
> +}
> +
> +enum mdp_ycbcr_profile mdp_map_ycbcr_prof_mplane(struct v4l2_format *f,
> +                                                u32 mdp_color)
> +{
> +       struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
> +
> +       if (MDP_COLOR_IS_RGB(mdp_color))
> +               return MDP_YCBCR_PROFILE_FULL_BT601;
> +
> +       switch (pix_mp->colorspace) {
> +       case V4L2_COLORSPACE_JPEG:
> +               return MDP_YCBCR_PROFILE_JPEG;
> +       case V4L2_COLORSPACE_REC709:
> +       case V4L2_COLORSPACE_DCI_P3:
> +               if (pix_mp->quantization == V4L2_QUANTIZATION_FULL_RANGE)
> +                       return MDP_YCBCR_PROFILE_FULL_BT709;
> +               return MDP_YCBCR_PROFILE_BT709;
> +       case V4L2_COLORSPACE_BT2020:
> +               if (pix_mp->quantization == V4L2_QUANTIZATION_FULL_RANGE)
> +                       return MDP_YCBCR_PROFILE_FULL_BT2020;
> +               return MDP_YCBCR_PROFILE_BT2020;
> +       }
> +       /* V4L2_COLORSPACE_SRGB or else */
> +       if (pix_mp->quantization == V4L2_QUANTIZATION_FULL_RANGE)
> +               return MDP_YCBCR_PROFILE_FULL_BT601;
> +       return MDP_YCBCR_PROFILE_BT601;
> +}
> +
> +static void mdp_bound_align_image(u32 *w, unsigned int wmin, unsigned int wmax,
> +                                 unsigned int walign,
> +                               u32 *h, unsigned int hmin, unsigned int hmax,
> +                               unsigned int halign, unsigned int salign)
> +{
> +       unsigned int org_w, org_h, wstep, hstep;
> +
> +       org_w = *w;
> +       org_h = *h;
> +       v4l_bound_align_image(w, wmin, wmax, walign, h, hmin, hmax, halign,
> +                             salign);
> +
> +       wstep = 1 << walign;
> +       hstep = 1 << halign;
> +       if (*w < org_w && (*w + wstep) <= wmax)
> +               *w += wstep;
> +       if (*h < org_h && (*h + hstep) <= hmax)
> +               *h += hstep;
> +}
> +
> +static int mdp_clamp_align(s32 *x, int min, int max, unsigned int align)
> +{
> +       unsigned int mask;
> +
> +       if (min < 0 || max < 0)
> +               return -ERANGE;
> +
> +       /* Bits that must be zero to be aligned */
> +       mask = ~((1 << align) - 1);
> +
> +       min = 0 ? 0 : ((min + ~mask) & mask);
> +       max = max & mask;
> +       if ((unsigned int)min > (unsigned int)max)
> +               return -ERANGE;
> +
> +       /* Clamp to aligned min and max */
> +       *x = clamp(*x, min, max);
> +
> +       /* Round to nearest aligned value */
> +       if (align)
> +               *x = (*x + (1 << (align - 1))) & mask;
> +       return 0;
> +}
> +
> +int mdp_enum_fmt_mplane(struct v4l2_fmtdesc *f)
> +{
> +       const struct mdp_format *fmt;
> +
> +       if (!V4L2_TYPE_IS_MULTIPLANAR(f->type))
> +               return -EINVAL;
> +
> +       fmt = mdp_find_fmt_by_index(f->index, f->type);
> +       if (!fmt)
> +               return -EINVAL;
> +
> +       /* f->description */
> +       f->pixelformat = fmt->pixelformat;
> +       return 0;
> +}
> +
> +const struct mdp_format *mdp_try_fmt_mplane(struct v4l2_format *f,
> +                                           struct mdp_frameparam *param,
> +                                           u32 ctx_id)
> +{
> +       struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
> +       const struct mdp_format *fmt;
> +       const struct mdp_pix_limit *pix_limit;
> +       u32 wmin, wmax, hmin, hmax, org_w, org_h;
> +       unsigned int i;
> +
> +       if (!V4L2_TYPE_IS_MULTIPLANAR(f->type))
> +               return NULL;
> +
> +       fmt = mdp_find_fmt(pix_mp->pixelformat, f->type);
> +       if (!fmt)
> +               fmt = mdp_find_fmt_by_index(0, f->type);
> +       if (!fmt) {
> +               mdp_dbg(0, "[%d] pixelformat %c%c%c%c invalid", ctx_id,
> +                       (pix_mp->pixelformat & 0xff),
> +                       (pix_mp->pixelformat >>  8) & 0xff,
> +                       (pix_mp->pixelformat >> 16) & 0xff,
> +                       (pix_mp->pixelformat >> 24) & 0xff);
> +               return NULL;
> +       }
> +
> +       pix_mp->field = V4L2_FIELD_NONE;
> +       pix_mp->flags = 0;
> +       pix_mp->pixelformat = fmt->pixelformat;
> +       if (!V4L2_TYPE_IS_OUTPUT(f->type)) {
> +               pix_mp->colorspace = param->colorspace;
> +               pix_mp->xfer_func = param->xfer_func;
> +               pix_mp->ycbcr_enc = param->ycbcr_enc;
> +               pix_mp->quantization = param->quant;
> +       }
> +       memset(pix_mp->reserved, 0, sizeof(pix_mp->reserved));
> +
> +       pix_limit = V4L2_TYPE_IS_OUTPUT(f->type) ? &param->limit->out_limit :
> +               &param->limit->cap_limit;
> +       wmin = pix_limit->wmin;
> +       wmax = pix_limit->wmax;
> +       hmin = pix_limit->hmin;
> +       hmax = pix_limit->hmax;
> +       org_w = pix_mp->width;
> +       org_h = pix_mp->height;
> +
> +       mdp_bound_align_image(&pix_mp->width, wmin, wmax, fmt->walign,
> +                             &pix_mp->height, hmin, hmax, fmt->halign,
> +                               fmt->salign);
> +       if (org_w != pix_mp->width || org_h != pix_mp->height)
> +               mdp_dbg(1, "[%d] size change: %ux%u to %ux%u", ctx_id,
> +                       org_w, org_h, pix_mp->width, pix_mp->height);
> +
> +       if (pix_mp->num_planes && pix_mp->num_planes != fmt->num_planes)
> +               mdp_dbg(1, "[%d] num of planes change: %u to %u", ctx_id,
> +                       pix_mp->num_planes, fmt->num_planes);
> +       pix_mp->num_planes = fmt->num_planes;
> +
> +       for (i = 0; i < pix_mp->num_planes; ++i) {
> +               u32 min_bpl = (pix_mp->width * fmt->row_depth[i]) / 8;
> +               u32 bpl = pix_mp->plane_fmt[i].bytesperline;
> +               u32 si;
> +
> +               if (bpl < min_bpl)
> +                       bpl = min_bpl;
> +               si = (bpl * pix_mp->height * fmt->depth[i]) / fmt->row_depth[i];
> +
> +               pix_mp->plane_fmt[i].bytesperline = bpl;
> +               if (pix_mp->plane_fmt[i].sizeimage < si)
> +                       pix_mp->plane_fmt[i].sizeimage = si;
> +               memset(pix_mp->plane_fmt[i].reserved, 0,
> +                      sizeof(pix_mp->plane_fmt[i].reserved));
> +               mdp_dbg(2, "[%d] p%u, bpl:%u (%u), sizeimage:%u (%u)", ctx_id,
> +                       i, bpl, min_bpl, pix_mp->plane_fmt[i].sizeimage, si);
> +       }
> +
> +       return fmt;
> +}
> +
> +static inline int mdp_clamp_start(s32 *x, int min, int max, unsigned int align,
> +                                 u32 flags)

Please remove the inline here, the compiler will decide whether this
needs to be inlined or not.

> +{
> +       if (flags & V4L2_SEL_FLAG_GE)
> +               max = *x;
> +       if (flags & V4L2_SEL_FLAG_LE)
> +               min = *x;
> +       return mdp_clamp_align(x, min, max, align);
> +}
> +
> +static inline int mdp_clamp_end(s32 *x, int min, int max, unsigned int align,
> +                               u32 flags)

Same here.

> +{
> +       if (flags & V4L2_SEL_FLAG_GE)
> +               min = *x;
> +       if (flags & V4L2_SEL_FLAG_LE)
> +               max = *x;
> +       return mdp_clamp_align(x, min, max, align);
> +}

[snip]

> diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.h b/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.h
> new file mode 100644
> index 000000000000..a2b5c31d3d39
> --- /dev/null
> +++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.h
> @@ -0,0 +1,386 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2018 MediaTek Inc.
> + * Author: Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#ifndef __MTK_MDP3_REGS_H__
> +#define __MTK_MDP3_REGS_H__
> +
> +#include <linux/videodev2.h>
> +#include <media/videobuf2-core.h>
> +#include "mtk-img-ipi.h"
> +
> +/*
> + * MDP native color code
> + * Plane count: 1, 2, 3
> + * H-subsample: 0, 1, 2
> + * V-subsample: 0, 1
> + * Color group: 0-RGB, 1-YUV, 2-raw
> + */
> +#define MDP_COLOR(PACKED, LOOSE, VIDEO, PLANE, HF, VF, BITS, GROUP, SWAP, ID)\
> +       (((PACKED) << 27) | ((LOOSE) << 26) | ((VIDEO) << 23) |\
> +        ((PLANE) << 21) | ((HF) << 19) | ((VF) << 18) | ((BITS) << 8) |\
> +        ((GROUP) << 6) | ((SWAP) << 5) | ((ID) << 0))
> +
> +#define MDP_COLOR_IS_10BIT_PACKED(c)    ((0x08000000 & (c)) >> 27)
> +#define MDP_COLOR_IS_10BIT_LOOSE(c)    (((0x0c000000 & (c)) >> 26) == 1)
> +#define MDP_COLOR_IS_10BIT_TILE(c)     (((0x0c000000 & (c)) >> 26) == 3)
> +#define MDP_COLOR_IS_UFP(c)             ((0x02000000 & (c)) >> 25)
> +#define MDP_COLOR_IS_INTERLACED(c)      ((0x01000000 & (c)) >> 24)
> +#define MDP_COLOR_IS_BLOCK_MODE(c)      ((0x00800000 & (c)) >> 23)
> +#define MDP_COLOR_GET_PLANE_COUNT(c)    ((0x00600000 & (c)) >> 21)
> +#define MDP_COLOR_GET_H_SUBSAMPLE(c)    ((0x00180000 & (c)) >> 19)
> +#define MDP_COLOR_GET_V_SUBSAMPLE(c)    ((0x00040000 & (c)) >> 18)
> +#define MDP_COLOR_BITS_PER_PIXEL(c)     ((0x0003ff00 & (c)) >>  8)
> +#define MDP_COLOR_GET_GROUP(c)          ((0x000000c0 & (c)) >>  6)
> +#define MDP_COLOR_IS_SWAPPED(c)         ((0x00000020 & (c)) >>  5)
> +#define MDP_COLOR_GET_UNIQUE_ID(c)      ((0x0000001f & (c)) >>  0)
> +#define MDP_COLOR_GET_HW_FORMAT(c)      ((0x0000001f & (c)) >>  0)
> +
> +#define MDP_COLOR_IS_RGB(c)            (MDP_COLOR_GET_GROUP(c) == 0)
> +#define MDP_COLOR_IS_YUV(c)            (MDP_COLOR_GET_GROUP(c) == 1)
> +#define MDP_COLOR_IS_UV_COPLANE(c)     ((MDP_COLOR_GET_PLANE_COUNT(c) == 2) &&\
> +                                        MDP_COLOR_IS_YUV(c))
> +
> +enum mdp_color {
> +       MDP_COLOR_UNKNOWN       = 0,
> +
> +       //MDP_COLOR_FULLG8,
> +       MDP_COLOR_FULLG8_RGGB   = MDP_COLOR(0, 0, 0, 1, 0, 0,  8, 2,  0, 21),
> +       MDP_COLOR_FULLG8_GRBG   = MDP_COLOR(0, 0, 0, 1, 0, 1,  8, 2,  0, 21),
> +       MDP_COLOR_FULLG8_GBRG   = MDP_COLOR(0, 0, 0, 1, 1, 0,  8, 2,  0, 21),
> +       MDP_COLOR_FULLG8_BGGR   = MDP_COLOR(0, 0, 0, 1, 1, 1,  8, 2,  0, 21),
> +       MDP_COLOR_FULLG8        = MDP_COLOR_FULLG8_BGGR,
> +
> +       //MDP_COLOR_FULLG10,
> +       MDP_COLOR_FULLG10_RGGB  = MDP_COLOR(0, 0, 0, 1, 0, 0, 10, 2,  0, 21),
> +       MDP_COLOR_FULLG10_GRBG  = MDP_COLOR(0, 0, 0, 1, 0, 1, 10, 2,  0, 21),
> +       MDP_COLOR_FULLG10_GBRG  = MDP_COLOR(0, 0, 0, 1, 1, 0, 10, 2,  0, 21),
> +       MDP_COLOR_FULLG10_BGGR  = MDP_COLOR(0, 0, 0, 1, 1, 1, 10, 2,  0, 21),
> +       MDP_COLOR_FULLG10       = MDP_COLOR_FULLG10_BGGR,
> +
> +       //MDP_COLOR_FULLG12,
> +       MDP_COLOR_FULLG12_RGGB  = MDP_COLOR(0, 0, 0, 1, 0, 0, 12, 2,  0, 21),
> +       MDP_COLOR_FULLG12_GRBG  = MDP_COLOR(0, 0, 0, 1, 0, 1, 12, 2,  0, 21),
> +       MDP_COLOR_FULLG12_GBRG  = MDP_COLOR(0, 0, 0, 1, 1, 0, 12, 2,  0, 21),
> +       MDP_COLOR_FULLG12_BGGR  = MDP_COLOR(0, 0, 0, 1, 1, 1, 12, 2,  0, 21),
> +       MDP_COLOR_FULLG12       = MDP_COLOR_FULLG12_BGGR,
> +
> +       //MDP_COLOR_FULLG14,
> +       MDP_COLOR_FULLG14_RGGB  = MDP_COLOR(0, 0, 0, 1, 0, 0, 14, 2,  0, 21),
> +       MDP_COLOR_FULLG14_GRBG  = MDP_COLOR(0, 0, 0, 1, 0, 1, 14, 2,  0, 21),
> +       MDP_COLOR_FULLG14_GBRG  = MDP_COLOR(0, 0, 0, 1, 1, 0, 14, 2,  0, 21),
> +       MDP_COLOR_FULLG14_BGGR  = MDP_COLOR(0, 0, 0, 1, 1, 1, 14, 2,  0, 21),
> +       MDP_COLOR_FULLG14       = MDP_COLOR_FULLG14_BGGR,
> +
> +       MDP_COLOR_UFO10         = MDP_COLOR(0, 0, 0, 1, 0, 0, 10, 2,  0, 24),
> +
> +       //MDP_COLOR_BAYER8,
> +       MDP_COLOR_BAYER8_RGGB   = MDP_COLOR(0, 0, 0, 1, 0, 0,  8, 2,  0, 20),
> +       MDP_COLOR_BAYER8_GRBG   = MDP_COLOR(0, 0, 0, 1, 0, 1,  8, 2,  0, 20),
> +       MDP_COLOR_BAYER8_GBRG   = MDP_COLOR(0, 0, 0, 1, 1, 0,  8, 2,  0, 20),
> +       MDP_COLOR_BAYER8_BGGR   = MDP_COLOR(0, 0, 0, 1, 1, 1,  8, 2,  0, 20),
> +       MDP_COLOR_BAYER8        = MDP_COLOR_BAYER8_BGGR,
> +
> +       //MDP_COLOR_BAYER10,
> +       MDP_COLOR_BAYER10_RGGB  = MDP_COLOR(0, 0, 0, 1, 0, 0, 10, 2,  0, 20),
> +       MDP_COLOR_BAYER10_GRBG  = MDP_COLOR(0, 0, 0, 1, 0, 1, 10, 2,  0, 20),
> +       MDP_COLOR_BAYER10_GBRG  = MDP_COLOR(0, 0, 0, 1, 1, 0, 10, 2,  0, 20),
> +       MDP_COLOR_BAYER10_BGGR  = MDP_COLOR(0, 0, 0, 1, 1, 1, 10, 2,  0, 20),
> +       MDP_COLOR_BAYER10       = MDP_COLOR_BAYER10_BGGR,
> +
> +       //MDP_COLOR_BAYER12,
> +       MDP_COLOR_BAYER12_RGGB  = MDP_COLOR(0, 0, 0, 1, 0, 0, 12, 2,  0, 20),
> +       MDP_COLOR_BAYER12_GRBG  = MDP_COLOR(0, 0, 0, 1, 0, 1, 12, 2,  0, 20),
> +       MDP_COLOR_BAYER12_GBRG  = MDP_COLOR(0, 0, 0, 1, 1, 0, 12, 2,  0, 20),
> +       MDP_COLOR_BAYER12_BGGR  = MDP_COLOR(0, 0, 0, 1, 1, 1, 12, 2,  0, 20),
> +       MDP_COLOR_BAYER12       = MDP_COLOR_BAYER12_BGGR,
> +
> +       MDP_COLOR_RGB48         = MDP_COLOR(0, 0, 0, 1, 0, 0, 48, 0,  0, 23),
> +       /* For bayer+mono raw-16 */
> +       MDP_COLOR_RGB565_RAW    = MDP_COLOR(0, 0, 0, 1, 0, 0, 16, 2,  0, 0),
> +
> +       MDP_COLOR_BAYER8_UNPAK  = MDP_COLOR(0, 0, 0, 1, 0, 0,  8, 2,  0, 22),
> +       MDP_COLOR_BAYER10_UNPAK = MDP_COLOR(0, 0, 0, 1, 0, 0, 10, 2,  0, 22),
> +       MDP_COLOR_BAYER12_UNPAK = MDP_COLOR(0, 0, 0, 1, 0, 0, 12, 2,  0, 22),
> +       MDP_COLOR_BAYER14_UNPAK = MDP_COLOR(0, 0, 0, 1, 0, 0, 14, 2,  0, 22),
> +
> +       /* Unified formats */
> +       MDP_COLOR_GREY          = MDP_COLOR(0, 0, 0, 1, 0, 0,  8, 1,  0, 7),
> +
> +       MDP_COLOR_RGB565        = MDP_COLOR(0, 0, 0, 1, 0, 0, 16, 0,  0, 0),
> +       MDP_COLOR_BGR565        = MDP_COLOR(0, 0, 0, 1, 0, 0, 16, 0,  1, 0),
> +       MDP_COLOR_RGB888        = MDP_COLOR(0, 0, 0, 1, 0, 0, 24, 0,  1, 1),
> +       MDP_COLOR_BGR888        = MDP_COLOR(0, 0, 0, 1, 0, 0, 24, 0,  0, 1),
> +       MDP_COLOR_RGBA8888      = MDP_COLOR(0, 0, 0, 1, 0, 0, 32, 0,  1, 2),
> +       MDP_COLOR_BGRA8888      = MDP_COLOR(0, 0, 0, 1, 0, 0, 32, 0,  0, 2),
> +       MDP_COLOR_ARGB8888      = MDP_COLOR(0, 0, 0, 1, 0, 0, 32, 0,  1, 3),
> +       MDP_COLOR_ABGR8888      = MDP_COLOR(0, 0, 0, 1, 0, 0, 32, 0,  0, 3),
> +
> +       MDP_COLOR_UYVY          = MDP_COLOR(0, 0, 0, 1, 1, 0, 16, 1,  0, 4),
> +       MDP_COLOR_VYUY          = MDP_COLOR(0, 0, 0, 1, 1, 0, 16, 1,  1, 4),
> +       MDP_COLOR_YUYV          = MDP_COLOR(0, 0, 0, 1, 1, 0, 16, 1,  0, 5),
> +       MDP_COLOR_YVYU          = MDP_COLOR(0, 0, 0, 1, 1, 0, 16, 1,  1, 5),
> +
> +       MDP_COLOR_I420          = MDP_COLOR(0, 0, 0, 3, 1, 1,  8, 1,  0, 8),
> +       MDP_COLOR_YV12          = MDP_COLOR(0, 0, 0, 3, 1, 1,  8, 1,  1, 8),
> +       MDP_COLOR_I422          = MDP_COLOR(0, 0, 0, 3, 1, 0,  8, 1,  0, 9),
> +       MDP_COLOR_YV16          = MDP_COLOR(0, 0, 0, 3, 1, 0,  8, 1,  1, 9),
> +       MDP_COLOR_I444          = MDP_COLOR(0, 0, 0, 3, 0, 0,  8, 1,  0, 10),
> +       MDP_COLOR_YV24          = MDP_COLOR(0, 0, 0, 3, 0, 0,  8, 1,  1, 10),
> +
> +       MDP_COLOR_NV12          = MDP_COLOR(0, 0, 0, 2, 1, 1,  8, 1,  0, 12),
> +       MDP_COLOR_NV21          = MDP_COLOR(0, 0, 0, 2, 1, 1,  8, 1,  1, 12),
> +       MDP_COLOR_NV16          = MDP_COLOR(0, 0, 0, 2, 1, 0,  8, 1,  0, 13),
> +       MDP_COLOR_NV61          = MDP_COLOR(0, 0, 0, 2, 1, 0,  8, 1,  1, 13),
> +       MDP_COLOR_NV24          = MDP_COLOR(0, 0, 0, 2, 0, 0,  8, 1,  0, 14),
> +       MDP_COLOR_NV42          = MDP_COLOR(0, 0, 0, 2, 0, 0,  8, 1,  1, 14),
> +
> +       /* Mediatek proprietary formats */
> +       /* UFO encoded block mode */
> +       MDP_COLOR_420_BLK_UFO   = MDP_COLOR(0, 0, 5, 2, 1, 1, 256, 1, 0, 12),
> +       /* Block mode */
> +       MDP_COLOR_420_BLK       = MDP_COLOR(0, 0, 1, 2, 1, 1, 256, 1, 0, 12),
> +       /* Block mode + field mode */
> +       MDP_COLOR_420_BLKI      = MDP_COLOR(0, 0, 3, 2, 1, 1, 256, 1, 0, 12),
> +       /* Block mode */
> +       MDP_COLOR_422_BLK       = MDP_COLOR(0, 0, 1, 1, 1, 0, 512, 1, 0, 4),
> +
> +       MDP_COLOR_IYU2          = MDP_COLOR(0, 0, 0, 1, 0, 0, 24,  1, 0, 25),
> +       MDP_COLOR_YUV444        = MDP_COLOR(0, 0, 0, 1, 0, 0, 24,  1, 0, 30),
> +
> +       /* Packed 10-bit formats */
> +       MDP_COLOR_RGBA1010102   = MDP_COLOR(1, 0, 0, 1, 0, 0, 32,  0, 1, 2),
> +       MDP_COLOR_BGRA1010102   = MDP_COLOR(1, 0, 0, 1, 0, 0, 32,  0, 0, 2),
> +       /* Packed 10-bit UYVY */
> +       MDP_COLOR_UYVY_10P      = MDP_COLOR(1, 0, 0, 1, 1, 0, 20,  1, 0, 4),
> +       /* Packed 10-bit NV21 */
> +       MDP_COLOR_NV21_10P      = MDP_COLOR(1, 0, 0, 2, 1, 1, 10,  1, 1, 12),
> +       /* 10-bit block mode */
> +       MDP_COLOR_420_BLK_10_H  = MDP_COLOR(1, 0, 1, 2, 1, 1, 320, 1, 0, 12),
> +       /* 10-bit HEVC tile mode */
> +       MDP_COLOR_420_BLK_10_V  = MDP_COLOR(1, 1, 1, 2, 1, 1, 320, 1, 0, 12),
> +       /* UFO encoded 10-bit block mode */
> +       MDP_COLOR_420_BLK_U10_H = MDP_COLOR(1, 0, 5, 2, 1, 1, 320, 1, 0, 12),
> +       /* UFO encoded 10-bit HEVC tile mode */
> +       MDP_COLOR_420_BLK_U10_V = MDP_COLOR(1, 1, 5, 2, 1, 1, 320, 1, 0, 12),
> +
> +       /* Loose 10-bit formats */
> +       MDP_COLOR_UYVY_10L      = MDP_COLOR(0, 1, 0, 1, 1, 0, 20,  1, 0, 4),
> +       MDP_COLOR_VYUY_10L      = MDP_COLOR(0, 1, 0, 1, 1, 0, 20,  1, 1, 4),
> +       MDP_COLOR_YUYV_10L      = MDP_COLOR(0, 1, 0, 1, 1, 0, 20,  1, 0, 5),
> +       MDP_COLOR_YVYU_10L      = MDP_COLOR(0, 1, 0, 1, 1, 0, 20,  1, 1, 5),
> +       MDP_COLOR_NV12_10L      = MDP_COLOR(0, 1, 0, 2, 1, 1, 10,  1, 0, 12),
> +       MDP_COLOR_NV21_10L      = MDP_COLOR(0, 1, 0, 2, 1, 1, 10,  1, 1, 12),
> +       MDP_COLOR_NV16_10L      = MDP_COLOR(0, 1, 0, 2, 1, 0, 10,  1, 0, 13),
> +       MDP_COLOR_NV61_10L      = MDP_COLOR(0, 1, 0, 2, 1, 0, 10,  1, 1, 13),
> +       MDP_COLOR_YV12_10L      = MDP_COLOR(0, 1, 0, 3, 1, 1, 10,  1, 1, 8),
> +       MDP_COLOR_I420_10L      = MDP_COLOR(0, 1, 0, 3, 1, 1, 10,  1, 0, 8),
> +};
> +
> +/* Minimum Y stride that is accepted by MDP HW */
> +static inline u32 mdp_color_get_min_y_stride(enum mdp_color c, u32 width)
> +{
> +       return ((MDP_COLOR_BITS_PER_PIXEL(c) * width) + 4) >> 3;
> +}
> +
> +/* Minimum UV stride that is accepted by MDP HW */
> +static inline u32 mdp_color_get_min_uv_stride(enum mdp_color c, u32 width)
> +{
> +       u32 min_stride;
> +
> +       if (MDP_COLOR_GET_PLANE_COUNT(c) == 1)
> +               return 0;
> +       min_stride = mdp_color_get_min_y_stride(c, width)
> +               >> MDP_COLOR_GET_H_SUBSAMPLE(c);
> +       if (MDP_COLOR_IS_UV_COPLANE(c) && !MDP_COLOR_IS_BLOCK_MODE(c))
> +               min_stride = min_stride * 2;
> +       return min_stride;
> +}
> +
> +/* Minimum Y plane size that is necessary in buffer */
> +static inline u32 mdp_color_get_min_y_size(enum mdp_color c,
> +                                          u32 width, u32 height)
> +{
> +       if (MDP_COLOR_IS_BLOCK_MODE(c))
> +               return ((MDP_COLOR_BITS_PER_PIXEL(c) * width) >> 8) * height;
> +       return mdp_color_get_min_y_stride(c, width) * height;
> +}
> +
> +/* Minimum UV plane size that is necessary in buffer */
> +static inline u32 mdp_color_get_min_uv_size(enum mdp_color c,
> +                                           u32 width, u32 height)
> +{
> +       height = height >> MDP_COLOR_GET_V_SUBSAMPLE(c);
> +       if (MDP_COLOR_IS_BLOCK_MODE(c) && (MDP_COLOR_GET_PLANE_COUNT(c) > 1))
> +               return ((MDP_COLOR_BITS_PER_PIXEL(c) * width) >> 8) * height;
> +       return mdp_color_get_min_uv_stride(c, width) * height;
> +}
> +
> +/* Combine colorspace, xfer_func, ycbcr_encoding, and quantization */
> +enum mdp_ycbcr_profile {
> +       /* V4L2_YCBCR_ENC_601 and V4L2_QUANTIZATION_LIM_RANGE */
> +       MDP_YCBCR_PROFILE_BT601,
> +       /* V4L2_YCBCR_ENC_709 and V4L2_QUANTIZATION_LIM_RANGE */
> +       MDP_YCBCR_PROFILE_BT709,
> +       /* V4L2_YCBCR_ENC_601 and V4L2_QUANTIZATION_FULL_RANGE */
> +       MDP_YCBCR_PROFILE_JPEG,
> +       MDP_YCBCR_PROFILE_FULL_BT601 = MDP_YCBCR_PROFILE_JPEG,
> +
> +       /* Colorspaces not support for capture */
> +       /* V4L2_YCBCR_ENC_BT2020 and V4L2_QUANTIZATION_LIM_RANGE */
> +       MDP_YCBCR_PROFILE_BT2020,
> +       /* V4L2_YCBCR_ENC_709 and V4L2_QUANTIZATION_FULL_RANGE */
> +       MDP_YCBCR_PROFILE_FULL_BT709,
> +       /* V4L2_YCBCR_ENC_BT2020 and V4L2_QUANTIZATION_FULL_RANGE */
> +       MDP_YCBCR_PROFILE_FULL_BT2020,
> +};
> +
> +#define MDP_FMT_FLAG_OUTPUT    BIT(0)
> +#define MDP_FMT_FLAG_CAPTURE   BIT(1)
> +
> +struct mdp_format {
> +       u32     pixelformat;
> +       u32     mdp_color;
> +       u8      depth[VIDEO_MAX_PLANES];
> +       u8      row_depth[VIDEO_MAX_PLANES];
> +       u8      num_planes;
> +       u8      walign;
> +       u8      halign;
> +       u8      salign;
> +       u32     flags;
> +};
> +
> +struct mdp_pix_limit {
> +       u32     wmin;
> +       u32     hmin;
> +       u32     wmax;
> +       u32     hmax;
> +};
> +
> +struct mdp_limit {
> +       struct mdp_pix_limit    out_limit;
> +       struct mdp_pix_limit    cap_limit;
> +       u32                     h_scale_up_max;
> +       u32                     v_scale_up_max;
> +       u32                     h_scale_down_max;
> +       u32                     v_scale_down_max;
> +};
> +
> +enum mdp_stream_type {
> +       MDP_STREAM_TYPE_UNKNOWN,
> +
> +       MDP_STREAM_TYPE_BITBLT,
> +       MDP_STREAM_TYPE_GPU_BITBLT,
> +       MDP_STREAM_TYPE_DUAL_BITBLT,
> +       MDP_STREAM_TYPE_2ND_BITBLT,
> +
> +       /* MDP_STREAM_TYPE_FRAG, */
> +       /* MDP_STREAM_TYPE_FRAG_JPEGDEC, */
> +
> +       MDP_STREAM_TYPE_ISP_IC,
> +       MDP_STREAM_TYPE_ISP_VR,
> +       MDP_STREAM_TYPE_ISP_ZSD,
> +       MDP_STREAM_TYPE_ISP_IP,
> +       MDP_STREAM_TYPE_ISP_VSS,
> +       MDP_STREAM_TYPE_ISP_ZSD_SLOW,
> +       /* MDP_STREAM_TYPE_ISP_ZSD_ONE, */
> +
> +       MDP_STREAM_TYPE_WPE,
> +       MDP_STREAM_TYPE_WPE2,
> +};
> +
> +struct mdp_crop {
> +       struct v4l2_rect        c;
> +       struct v4l2_fract       left_subpix;
> +       struct v4l2_fract       top_subpix;
> +       struct v4l2_fract       width_subpix;
> +       struct v4l2_fract       height_subpix;
> +};
> +
> +struct mdp_frame {
> +       struct v4l2_format      format;
> +       const struct mdp_format *mdp_fmt;
> +       u32                     ycbcr_prof;     /* enum mdp_ycbcr_profile */
> +       u32                     usage;          /* enum mdp_buffer_usage */
> +       struct mdp_crop         crop;
> +       struct v4l2_rect        compose;
> +       s32                     rotation;
> +       u32                     hflip:1;
> +       u32                     vflip:1;
> +       u32                     hdr:1;
> +       u32                     dre:1;
> +       u32                     sharpness:1;
> +       u32                     dither:1;
> +};
> +
> +static inline bool mdp_target_is_crop(u32 target)
> +{
> +       return (target == V4L2_SEL_TGT_CROP) ||
> +               (target == V4L2_SEL_TGT_CROP_DEFAULT) ||
> +               (target == V4L2_SEL_TGT_CROP_BOUNDS);
> +}
> +
> +static inline bool mdp_target_is_compose(u32 target)
> +{
> +       return (target == V4L2_SEL_TGT_COMPOSE) ||
> +               (target == V4L2_SEL_TGT_COMPOSE_DEFAULT) ||
> +               (target == V4L2_SEL_TGT_COMPOSE_BOUNDS);
> +}
> +
> +#define MDP_MAX_CAPTURES       IMG_MAX_HW_OUTPUTS
> +
> +#define MDP_VPU_INIT           BIT(0)
> +#define MDP_M2M_SRC_FMT                BIT(1)
> +#define MDP_M2M_DST_FMT                BIT(2)
> +#define MDP_M2M_CTX_ERROR      BIT(5)
> +
> +struct mdp_frameparam {
> +       struct list_head        list;
> +       /* synchronization protect for m2m context state */
> +       struct mutex            lock;

This lock is only used to protect against concurrent accesses to
state. Maybe rename it to state_lock and document this fact?

> +       u32                     state;
> +       const struct mdp_limit  *limit;
> +       u32                     type;   /* enum mdp_stream_type */
> +       u32                     frame_no;
> +       struct mdp_frame        output;
> +       struct mdp_frame        captures[MDP_MAX_CAPTURES];
> +       u32                     num_captures;
> +       /* __u8                 pq_data[]; */
> +       enum v4l2_colorspace            colorspace;
> +       enum v4l2_ycbcr_encoding        ycbcr_enc;
> +       enum v4l2_xfer_func             xfer_func;
> +       enum v4l2_quantization          quant;
> +};
> +
> +int mdp_enum_fmt_mplane(struct v4l2_fmtdesc *f);
> +const struct mdp_format *mdp_try_fmt_mplane(struct v4l2_format *f,
> +                                           struct mdp_frameparam *param,
> +                                           u32 ctx_id);
> +enum mdp_ycbcr_profile mdp_map_ycbcr_prof_mplane(struct v4l2_format *f,
> +                                                u32 mdp_color);
> +int mdp_try_crop(struct v4l2_rect *r, const struct v4l2_selection *s,
> +                struct mdp_frame *frame, u32 ctx_id);
> +int mdp_check_scaling_ratio(const struct v4l2_rect *crop,
> +                           const struct v4l2_rect *compose, s32 rotation,
> +       const struct mdp_limit *limit);
> +void mdp_set_src_config(struct img_input *in,
> +                       struct mdp_frame *frame, struct vb2_buffer *vb);
> +void mdp_set_dst_config(struct img_output *out,
> +                       struct mdp_frame *frame, struct vb2_buffer *vb);
> +
> +struct mdp_frameparam *mdp_frameparam_init(void);
> +void mdp_frameparam_release(struct mdp_frameparam *param);
> +
> +#endif  /* __MTK_MDP3_REGS_H__ */
> +
> diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-vpu.c b/drivers/media/platform/mtk-mdp3/mtk-mdp3-vpu.c
> new file mode 100644
> index 000000000000..0ad443cb52e1
> --- /dev/null
> +++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-vpu.c
> @@ -0,0 +1,277 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2018 MediaTek Inc.
> + * Author: Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <linux/remoteproc.h>
> +#include <linux/platform_data/mtk_scp.h>
> +#include "mtk-mdp3-vpu.h"
> +#include "mtk-mdp3-core.h"
> +
> +#define MDP_VPU_MESSAGE_TIMEOUT 500U
> +
> +static inline struct mdp_dev *vpu_to_mdp(struct mdp_vpu_dev *vpu)
> +{
> +       return container_of(vpu, struct mdp_dev, vpu);
> +}
> +
> +static void mdp_vpu_ipi_handle_init_ack(void *data, unsigned int len,
> +                                       void *priv)
> +{
> +       struct mdp_ipi_init_msg *msg = (struct mdp_ipi_init_msg *)data;
> +       struct mdp_vpu_dev *vpu =
> +               (struct mdp_vpu_dev *)(unsigned long)msg->drv_data;
> +
> +       if (!vpu->work_size)
> +               vpu->work_size = msg->work_size;
> +       else
> +               vpu->status = msg->status;

Why is this in an else statement? Shouldn't we record the status in all cases?

> +       complete(&vpu->ipi_acked);
> +}
> +
> +static void mdp_vpu_ipi_handle_deinit_ack(void *data, unsigned int len,
> +                                         void *priv)
> +{
> +       struct mdp_ipi_deinit_msg *msg = (struct mdp_ipi_deinit_msg *)data;
> +       struct mdp_vpu_dev *vpu =
> +               (struct mdp_vpu_dev *)(unsigned long)msg->drv_data;
> +
> +       vpu->status = msg->status;
> +       complete(&vpu->ipi_acked);
> +}
> +
> +static void mdp_vpu_ipi_handle_frame_ack(void *data, unsigned int len,
> +                                        void *priv)
> +{
> +       struct img_ipi_frameparam *param = (struct img_ipi_frameparam *)data;
> +       struct mdp_vpu_ctx *ctx =
> +               (struct mdp_vpu_ctx *)(unsigned long)param->drv_data;
> +
> +       ctx->failure = param->state;

You don't need mdp_vpu_ctx::failure at all as it is only used in this
function. Remove it from struct mdp_vpu_ctx and work directly on
param->state.

> +       if (ctx->failure) {
> +               struct mdp_dev *mdp = vpu_to_mdp(ctx->vpu_dev);
> +
> +               dev_info(&mdp->pdev->dev, "VPU MDP failure:%d\n", ctx->failure);
> +       }
> +       complete(&ctx->vpu_dev->ipi_acked);
> +}
> +
> +int mdp_vpu_register(struct platform_device *pdev)
> +{
> +       int err;
> +
> +       err = scp_ipi_register(pdev, SCP_IPI_MDP_INIT,
> +                              mdp_vpu_ipi_handle_init_ack, NULL);
> +       if (err) {
> +               dev_err(&pdev->dev, "scp_ipi_register failed %d\n", err);
> +               goto err_ipi_init;
> +       }
> +       err = scp_ipi_register(pdev, SCP_IPI_MDP_DEINIT,
> +                              mdp_vpu_ipi_handle_deinit_ack, NULL);
> +       if (err) {
> +               dev_err(&pdev->dev, "scp_ipi_register failed %d\n", err);
> +               goto err_ipi_deinit;
> +       }
> +       err = scp_ipi_register(pdev, SCP_IPI_MDP_FRAME,
> +                              mdp_vpu_ipi_handle_frame_ack, NULL);
> +       if (err) {
> +               dev_err(&pdev->dev, "scp_ipi_register failed %d\n", err);
> +               goto err_ipi_frame;
> +       }
> +       return 0;
> +
> +err_ipi_frame:
> +       /* vpu_ipi_unregister(IPI_MDP_DEINIT); */
> +err_ipi_deinit:
> +       /* vpu_ipi_unregister(IPI_MDP_INIT); */
> +err_ipi_init:
> +
> +       return err;
> +}
> +
> +void mdp_vpu_unregister(struct platform_device *pdev)
> +{
> +       /* vpu_ipi_unregister(IPI_MDP_INIT); */
> +       /* vpu_ipi_unregister(IPI_MDP_DEINIT); */
> +       /* vpu_ipi_unregister(IPI_MDP_FRAME); */

Isn't this necessary if we, say, unregister the driver?

> +}
> +
> +static int mdp_vpu_sendmsg(struct mdp_vpu_dev *vpu, enum scp_ipi_id id,
> +                          void *buf, unsigned int len)
> +{
> +       int ret;
> +
> +       if (!vpu->pdev) {
> +               struct mdp_dev *mdp = vpu_to_mdp(vpu);
> +
> +               dev_dbg(&mdp->pdev->dev, "vpu pdev is NULL");
> +               return -EINVAL;
> +       }
> +       ret = scp_ipi_send(vpu->pdev, id, buf, len, 2000);
> +
> +       if (ret) {
> +               dev_err(&vpu->pdev->dev, "scp_ipi_send failed %d\n", ret);
> +               return -EPERM;
> +       }
> +       ret =
> +       wait_for_completion_timeout(&vpu->ipi_acked,
> +                                   msecs_to_jiffies(MDP_VPU_MESSAGE_TIMEOUT));
> +       if (!ret)
> +               ret = -ETIME;
> +       else if (vpu->status)
> +               ret = -EINVAL;
> +       else
> +               ret = 0;
> +       return ret;
> +}
> +
> +int mdp_vpu_dev_init(struct mdp_vpu_dev *vpu, struct platform_device *pdev,
> +                    struct mutex *lock)
> +{
> +       struct mdp_ipi_init_msg msg = {
> +               .drv_data = (unsigned long)vpu,
> +       };
> +       phys_addr_t mem_size, pool;
> +       const size_t pool_size = sizeof(struct mdp_config_pool);
> +       struct mdp_dev *mdp = vpu_to_mdp(vpu);
> +       int err;
> +
> +       init_completion(&vpu->ipi_acked);
> +       vpu->pdev = pdev;
> +       vpu->lock = lock;

Is there any reason why the lock must come from the outside? I have
the feeling that we could simplify the code a bit if vpu->lock was
just a lock that we initialize here.

> +       vpu->work_size = 0;
> +       err = mdp_vpu_sendmsg(vpu, SCP_IPI_MDP_INIT, &msg, sizeof(msg));
> +       if (err)
> +               goto err_work_size;
> +       /* vpu work_size was set in mdp_vpu_ipi_handle_init_ack */
> +
> +       vpu->work = scp_get_reserve_mem_virt(SCP_MDP_MEM_ID);
> +       vpu->work_addr = scp_get_reserve_mem_phys(SCP_MDP_MEM_ID);
> +       mem_size = scp_get_reserve_mem_size(SCP_MDP_MEM_ID);
> +       pool = ALIGN(vpu->work + vpu->work_size, 8);
> +       if (pool + pool_size - vpu->work > mem_size) {
> +               dev_err(&mdp->pdev->dev,
> +                       "VPU memory insufficient: %lx + %lx > %llx",
> +                       vpu->work_size, pool_size, mem_size);
> +               err = -ENOMEM;
> +               goto err_mem_size;
> +       }
> +
> +       dev_info(&mdp->pdev->dev,
> +                "VPU work:%llx pa:%llx sz:%lx pool:%llx sz:%lx (mem sz:%llx)",
> +               vpu->work, vpu->work_addr, vpu->work_size,
> +               pool, pool_size, mem_size);
> +       vpu->pool = (struct mdp_config_pool *)pool;
> +       msg.work_addr = vpu->work_addr;
> +       msg.work_size = vpu->work_size;
> +       err = mdp_vpu_sendmsg(vpu, SCP_IPI_MDP_INIT, &msg, sizeof(msg));

Why do we need to invoke SCP_IPI_MDP_INIT twice?

> +       if (err)
> +               goto err_work_size;
> +       memset(vpu->pool, 0, sizeof(*vpu->pool));
> +       return 0;
> +
> +err_work_size:
> +       switch (vpu->status) {
> +       case -MDP_IPI_EBUSY:
> +               err = -EBUSY;
> +               break;
> +       case -MDP_IPI_ENOMEM:
> +               err = -ENOSPC;  /* -ENOMEM */
> +               break;

What if vpu->status is anything else? We need to manage default to set
err to a valid error state, otherwise we will return an undefined
value (likely 0 even though an error occured).

> +       }
> +err_mem_size:
> +       return err;
> +}
> +
> +int mdp_vpu_dev_deinit(struct mdp_vpu_dev *vpu)
> +{
> +       struct mdp_ipi_deinit_msg msg = {
> +               .drv_data = (unsigned long)vpu,
> +               .work_addr = vpu->work_addr,
> +       };
> +
> +       return mdp_vpu_sendmsg(vpu, SCP_IPI_MDP_DEINIT, &msg, sizeof(msg));
> +}
> +
> +static struct img_config *mdp_config_get(struct mdp_vpu_dev *vpu,
> +                                        enum mdp_config_id id, uint32_t *addr)
> +{
> +       struct img_config *config;
> +
> +       if (id < 0 || id >= MDP_CONFIG_POOL_SIZE)
> +               return ERR_PTR(-EINVAL);
> +       if (vpu->lock)

We always call mdp_vpu_dev_init with a lock, so we can drop this conditional.

> +               mutex_lock(vpu->lock);
> +       vpu->pool->cfg_count[id]++;
> +       config = &vpu->pool->configs[id];
> +       *addr = vpu->work_addr + ((unsigned long)config - vpu->work);
> +       if (vpu->lock)
> +               mutex_unlock(vpu->lock);
> +       return config;
> +}
> +
> +static int mdp_config_put(struct mdp_vpu_dev *vpu,
> +                         enum mdp_config_id id,
> +                         const struct img_config *config)
> +{
> +       int err = 0;
> +
> +       if (id < 0 || id >= MDP_CONFIG_POOL_SIZE)
> +               return -EINVAL;
> +       if (vpu->lock)
> +               mutex_lock(vpu->lock);
> +       if (!vpu->pool->cfg_count[id] || config != &vpu->pool->configs[id])
> +               err = -EINVAL;
> +       else
> +               vpu->pool->cfg_count[id]--;
> +       if (vpu->lock)
> +               mutex_unlock(vpu->lock);
> +       return err;
> +}
> +
> +int mdp_vpu_ctx_init(struct mdp_vpu_ctx *ctx, struct mdp_vpu_dev *vpu,
> +                    enum mdp_config_id id)
> +{
> +       ctx->config = mdp_config_get(vpu, id, &ctx->inst_addr);
> +       if (IS_ERR(ctx->config)) {
> +               int err = PTR_ERR(ctx->config);
> +
> +               ctx->config = NULL;
> +               return err;
> +       }
> +       ctx->config_id = id;
> +       ctx->vpu_dev = vpu;
> +       return 0;
> +}
> +
> +int mdp_vpu_ctx_deinit(struct mdp_vpu_ctx *ctx)
> +{
> +       int err = mdp_config_put(ctx->vpu_dev, ctx->config_id, ctx->config);
> +
> +       ctx->config_id = 0;
> +       ctx->config = NULL;
> +       ctx->inst_addr = 0;
> +       return err;
> +}
> +
> +int mdp_vpu_process(struct mdp_vpu_ctx *ctx, struct img_ipi_frameparam *param)
> +{
> +       memset((void *)ctx->vpu_dev->work, 0, ctx->vpu_dev->work_size);
> +       memset(ctx->config, 0, sizeof(*ctx->config));
> +       param->config_data.va = (unsigned long)ctx->config;
> +       param->config_data.pa = ctx->inst_addr;
> +       param->drv_data = (unsigned long)ctx;
> +       return mdp_vpu_sendmsg(ctx->vpu_dev, SCP_IPI_MDP_FRAME,
> +               param, sizeof(*param));
> +}
> +
> diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-vpu.h b/drivers/media/platform/mtk-mdp3/mtk-mdp3-vpu.h
> new file mode 100644
> index 000000000000..09b5b0026e4b
> --- /dev/null
> +++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-vpu.h
> @@ -0,0 +1,90 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2018 MediaTek Inc.
> + * Author: Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#ifndef __MTK_MDP3_VPU_H__
> +#define __MTK_MDP3_VPU_H__
> +
> +#include <linux/platform_device.h>
> +#include "mtk-img-ipi.h"
> +
> +enum mdp_ipi_result {
> +       MDP_IPI_SUCCESS = 0,
> +       MDP_IPI_ENOMEM  = 12,
> +       MDP_IPI_EBUSY   = 16,
> +       MDP_IPI_EINVAL  = 22,
> +       MDP_IPI_EMINST  = 24,
> +       MDP_IPI_ERANGE  = 34,
> +       MDP_IPI_NR_ERRNO,
> +
> +       MDP_IPI_EOTHER  = MDP_IPI_NR_ERRNO,
> +       MDP_IPI_PATH_CANT_MERGE,
> +       MDP_IPI_OP_FAIL,
> +};
> +
> +struct mdp_ipi_init_msg {
> +       u32     status;
> +       u64     drv_data;
> +       u32     work_addr;      /* [in] working buffer address */
> +       u32     work_size;      /* [in] working buffer size */
> +} __attribute__ ((__packed__));
> +
> +struct mdp_ipi_deinit_msg {
> +       u32     status;
> +       u64     drv_data;
> +       u32     work_addr;
> +} __attribute__ ((__packed__));
> +
> +enum mdp_config_id {
> +       MDP_DEV_M2M = 0,
> +       MDP_CONFIG_POOL_SIZE    /* ALWAYS keep at the end */
> +};
> +
> +struct mdp_config_pool {
> +       u64             cfg_count[MDP_CONFIG_POOL_SIZE];
> +       struct img_config       configs[MDP_CONFIG_POOL_SIZE];
> +};
> +
> +struct mdp_vpu_dev {
> +       /* synchronization protect for image configuration reference count */
> +       struct mutex            *lock;
> +       struct platform_device  *pdev;
> +       struct completion       ipi_acked;
> +       phys_addr_t             work;
> +       phys_addr_t             work_addr;
> +       size_t                  work_size;
> +       struct mdp_config_pool  *pool;
> +       u32             status;
> +};
> +
> +struct mdp_vpu_ctx {
> +       struct mdp_vpu_dev      *vpu_dev;
> +       u32             config_id;
> +       struct img_config       *config;
> +       u32             inst_addr;
> +       s32                     failure;

This member is only used in mdp_vpu_ipi_handle_frame_ack(). Therefore
is can be replaced by a local variable and does not need to be defined
in this struct.

> +};
> +
> +int mdp_vpu_register(struct platform_device *pdev);
> +void mdp_vpu_unregister(struct platform_device *pdev);
> +int mdp_vpu_dev_init(struct mdp_vpu_dev *vpu, struct platform_device *pdev,
> +                    struct mutex *lock);
> +int mdp_vpu_dev_deinit(struct mdp_vpu_dev *vpu);
> +int mdp_vpu_ctx_init(struct mdp_vpu_ctx *ctx, struct mdp_vpu_dev *vpu,
> +                    enum mdp_config_id id);
> +int mdp_vpu_ctx_deinit(struct mdp_vpu_ctx *ctx);
> +int mdp_vpu_process(struct mdp_vpu_ctx *vpu, struct img_ipi_frameparam *param);
> +
> +#endif  /* __MTK_MDP3_VPU_H__ */
> +
> --
> 2.18.0
