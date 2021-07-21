Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B4CE3D0D5F
	for <lists+linux-media@lfdr.de>; Wed, 21 Jul 2021 13:24:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238397AbhGUKks (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Jul 2021 06:40:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239702AbhGUKGQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Jul 2021 06:06:16 -0400
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com [IPv6:2607:f8b0:4864:20::c29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72555C0617AA;
        Wed, 21 Jul 2021 03:45:46 -0700 (PDT)
Received: by mail-oo1-xc29.google.com with SMTP id m14-20020a4a240e0000b029025e4d9b0a3dso456624oof.6;
        Wed, 21 Jul 2021 03:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Anh11BZKD6sx/yu2yxpK8TjYphrHyinoQpzCoE8reE8=;
        b=brf8McbLoGFb0wJTwV67Fk9sJvh2CiDkdfNPMmo2+p3HrDG4KRryR6HEqWDjQp0E/p
         enDJK+mHePBNcN6kN5WmtHFvxIuujNFHnm3zjDQIckgAJqsU15id8/YwdeVOCwRmCBZf
         UuxK+jopAoPQ3mC4wgrUBLkFMTS47wAbPBNSt+MtVuc03rcr79TzectCsgQkY9vGytIE
         lUY5L4wUWnm6d5299V9JgwMAEir2dM6nO22iVuHSqEMSKmTJKgAR33peqFeEWu9pc29z
         ubDRrAbTRxLQQJVYucQ4mteHK3Yr09scJFV90L8kNkemGprrwTopG5ThNlxOxrRmtFRO
         JnGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Anh11BZKD6sx/yu2yxpK8TjYphrHyinoQpzCoE8reE8=;
        b=I+w0Mmi53fI02fBc88YxXi188z8R2GEKfwBRy2YUR/gh+SyGpvYOMnTmeNP94kaU/O
         BWHOAW8ViKdVXQWcYf5zPMufHU2UwQSUb9yANc1Mu2B6HubMY8bvZRwX3BHehWBjjIBR
         iQFFMlg5MavD173b7i64R12162d2MpE77s9ouU30+o/k3/l0QOZZOeH5HPUADrIOjWJ4
         o4Wuik/5sgqDSgkmYs1vM3HZxHsNxk8nohfYfhsaTd2g4jaaeieUZ9+23oFDoK0R7d1K
         IzpFtl4hpGxtpAzc+2iQ9o3V5mKd3ITbUA4uvrp7j81R9ODbOKZcCAQWYZ5y4BofSr+m
         1GPg==
X-Gm-Message-State: AOAM530Jg/m6e3HbzF5vA3w1JvAfTZ/fMit4Lj/nEdoEZtlVQ7EOXsK5
        HECHzRhPV+1L5KqNl3gYKm/aOa+0g0KVh8LrCIk=
X-Google-Smtp-Source: ABdhPJy8c4dbPjLsag7ynmornMMpOS6FXyP/LmNci8ZRLSvfLQG9Qyv2VClBg5D5TdoQiYzmrENJBNVIx4L/pUN2rsE=
X-Received: by 2002:a4a:2a05:: with SMTP id k5mr24314285oof.0.1626864345582;
 Wed, 21 Jul 2021 03:45:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210719074640.25058-1-moudy.ho@mediatek.com> <20210719074640.25058-4-moudy.ho@mediatek.com>
In-Reply-To: <20210719074640.25058-4-moudy.ho@mediatek.com>
From:   Enric Balletbo Serra <eballetbo@gmail.com>
Date:   Wed, 21 Jul 2021 12:45:33 +0200
Message-ID: <CAFqH_507u0fqZ3hw1HrTjqMJoO92pREsCb-ohu25UZQXKkFZaA@mail.gmail.com>
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
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Pi-Hsun Shih <pihsun@chromium.org>, menghui.lin@mediatek.com,
        sj.huang@mediatek.com, ben.lok@mediatek.com, randy.wu@mediatek.com,
        srv_heupstream <srv_heupstream@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Moudy Ho,

Thank you for your patch.

Missatge de Moudy Ho <moudy.ho@mediatek.com> del dia dl., 19 de jul.
2021 a les 9:47:
>
> This patch adds driver for Media Data Path 3 (MDP3).

What's Media Data Path? What's this driver for? Is it a ISP? Is for
video-decoding? What are the real capabilities of the MDP HW block?

> Each modules' related operation control is sited in mtk-mdp3-comp.c
> Each modules' register table is defined in file with "mdp_reg_"
> and "mmsys_" prefix
> GCE related API, operation control  sited in mtk-mdp3-cmdq.c
> V4L2 m2m device functions are implemented in mtk-mdp3-m2m.c
> Probe, power, suspend/resume, system level functions are defined in
> mtk-mdp3-core.c
>

That's explaining a bit how is organized but you are not explaining
why. That's the important to explain here. It'd be really nice if you
can explain a bit how do you test this driver and also explain the
general architecture of this driver you have in mind. Why you are
exposing the MDP HW directly as a V4L2 device to userspace,  who needs
that and why.

> Signed-off-by: Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
> Signed-off-by: daoyuan huang <daoyuan.huang@mediatek.com>
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> ---
> Depend on:
>    [1] https://patchwork.kernel.org/project/linux-mediatek/patch/20190906115513.159705-9-acourbot@chromium.org/
>    [2] https://patchwork.kernel.org/project/linux-mediatek/patch/20190906115513.159705-10-acourbot@chromium.org/
> ---
>  drivers/media/platform/Kconfig                |   19 +
>  drivers/media/platform/Makefile               |    2 +
>  drivers/media/platform/mtk-mdp3/Makefile      |    7 +
>  drivers/media/platform/mtk-mdp3/isp_reg.h     |   37 +
>  .../media/platform/mtk-mdp3/mdp-platform.h    |   58 +
>  .../media/platform/mtk-mdp3/mdp_reg_ccorr.h   |   75 +
>  .../media/platform/mtk-mdp3/mdp_reg_rdma.h    |  206 +++
>  drivers/media/platform/mtk-mdp3/mdp_reg_rsz.h |  109 ++
>  .../media/platform/mtk-mdp3/mdp_reg_wdma.h    |  125 ++
>  .../media/platform/mtk-mdp3/mdp_reg_wrot.h    |  115 ++
>  .../media/platform/mtk-mdp3/mmsys_config.h    |  188 +++
>  drivers/media/platform/mtk-mdp3/mmsys_mutex.h |   35 +
>  .../media/platform/mtk-mdp3/mmsys_reg_base.h  |   38 +
>  drivers/media/platform/mtk-mdp3/mtk-img-ipi.h |  282 ++++
>  .../media/platform/mtk-mdp3/mtk-mdp3-cmdq.c   |  524 ++++++
>  .../media/platform/mtk-mdp3/mtk-mdp3-cmdq.h   |   52 +
>  .../media/platform/mtk-mdp3/mtk-mdp3-comp.c   | 1439 +++++++++++++++++
>  .../media/platform/mtk-mdp3/mtk-mdp3-comp.h   |  157 ++
>  .../media/platform/mtk-mdp3/mtk-mdp3-core.c   |  261 +++
>  .../media/platform/mtk-mdp3/mtk-mdp3-core.h   |   86 +
>  .../media/platform/mtk-mdp3/mtk-mdp3-m2m.c    |  797 +++++++++
>  .../media/platform/mtk-mdp3/mtk-mdp3-m2m.h    |   42 +
>  .../media/platform/mtk-mdp3/mtk-mdp3-regs.c   |  746 +++++++++
>  .../media/platform/mtk-mdp3/mtk-mdp3-regs.h   |  373 +++++
>  .../media/platform/mtk-mdp3/mtk-mdp3-vpu.c    |  313 ++++
>  .../media/platform/mtk-mdp3/mtk-mdp3-vpu.h    |   79 +
>  26 files changed, 6165 insertions(+)
>  create mode 100644 drivers/media/platform/mtk-mdp3/Makefile
>  create mode 100644 drivers/media/platform/mtk-mdp3/isp_reg.h
>  create mode 100644 drivers/media/platform/mtk-mdp3/mdp-platform.h
>  create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_ccorr.h
>  create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_rdma.h
>  create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_rsz.h
>  create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_wdma.h
>  create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_wrot.h
>  create mode 100644 drivers/media/platform/mtk-mdp3/mmsys_config.h
>  create mode 100644 drivers/media/platform/mtk-mdp3/mmsys_mutex.h
>  create mode 100644 drivers/media/platform/mtk-mdp3/mmsys_reg_base.h
>  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-img-ipi.h
>  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c
>  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.h
>  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c
>  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h
>  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c
>  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h
>  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-m2m.c
>  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-m2m.h
>  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.c
>  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.h
>  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-vpu.c
>  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-vpu.h
>

Not much warnings/errors, but would be nice if you can  run

scripts/checkpatch.pl -f drivers/media/platform/mtk-mdp3/*

and fix the remaining before submitting the next version.

> diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
> index 157c924686e4..b7f331dbe1b5 100644
> --- a/drivers/media/platform/Kconfig
> +++ b/drivers/media/platform/Kconfig
> @@ -299,6 +299,25 @@ config VIDEO_MEDIATEK_MDP
>             To compile this driver as a module, choose M here: the
>             module will be called mtk-mdp.
>
> +config VIDEO_MEDIATEK_MDP3
> +       tristate "Mediatek MDP v3 driver"
> +       depends on MTK_IOMMU
> +       depends on VIDEO_DEV && VIDEO_V4L2
> +       depends on ARCH_MEDIATEK || COMPILE_TEST
> +       depends on HAS_DMA
> +       select VIDEOBUF2_DMA_CONTIG
> +       select V4L2_MEM2MEM_DEV
> +       select VIDEO_MEDIATEK_VPU
> +       select MTK_CMDQ
> +       select MTK_SCP
> +       default n
> +       help
> +           It is a v4l2 driver and present in Mediatek MT8183 SoC.
> +           The driver supports for scaling and color space conversion.
> +
> +           To compile this driver as a module, choose M here: the
> +           module will be called mtk-mdp3.
> +
>  config VIDEO_MEDIATEK_VCODEC
>         tristate "Mediatek Video Codec driver"
>         depends on MTK_IOMMU || COMPILE_TEST
> diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/Makefile
> index eedc14aafb32..4d65f8fb75f6 100644
> --- a/drivers/media/platform/Makefile
> +++ b/drivers/media/platform/Makefile
> @@ -76,6 +76,8 @@ obj-$(CONFIG_VIDEO_MEDIATEK_VCODEC)   += mtk-vcodec/
>
>  obj-$(CONFIG_VIDEO_MEDIATEK_MDP)       += mtk-mdp/
>
> +obj-$(CONFIG_VIDEO_MEDIATEK_MDP3)      += mtk-mdp3/
> +
>  obj-$(CONFIG_VIDEO_MEDIATEK_JPEG)      += mtk-jpeg/
>
>  obj-$(CONFIG_VIDEO_QCOM_CAMSS)         += qcom/camss/
> diff --git a/drivers/media/platform/mtk-mdp3/Makefile b/drivers/media/platform/mtk-mdp3/Makefile
> new file mode 100644
> index 000000000000..dd7b1ca1633e
> --- /dev/null
> +++ b/drivers/media/platform/mtk-mdp3/Makefile
> @@ -0,0 +1,7 @@
> +# SPDX-License-Identifier: GPL-2.0
> +mtk-mdp3-y += mtk-mdp3-core.o mtk-mdp3-vpu.o mtk-mdp3-regs.o
> +mtk-mdp3-y += mtk-mdp3-m2m.o
> +mtk-mdp3-y += mtk-mdp3-comp.o mtk-mdp3-cmdq.o
> +
> +obj-$(CONFIG_VIDEO_MEDIATEK_MDP3) += mtk-mdp3.o
> +
> diff --git a/drivers/media/platform/mtk-mdp3/isp_reg.h b/drivers/media/platform/mtk-mdp3/isp_reg.h
> new file mode 100644
> index 000000000000..89ba8dc484de
> --- /dev/null
> +++ b/drivers/media/platform/mtk-mdp3/isp_reg.h
> @@ -0,0 +1,37 @@
> +/* SPDX-License-Identifier: GPL-2.0 */

Better make it explicit and use newer SPDX-License-Identifier. In this
case GPL-2.0-only. This comment is valid for the rest of files.

> +/*
> + * Copyright (c) 2019 MediaTek Inc.

Please update the copyright. This comment is valid for the rest of files.

> + * Author: Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
> + */
> +
> +#ifndef __ISP_REG_H__
> +#define __ISP_REG_H__
> +
> +enum ISP_DIP_CQ {

According to the kernel style guide It is preferred lower case for
enum definition.

> +       ISP_DRV_DIP_CQ_THRE0 = 0,
> +       ISP_DRV_DIP_CQ_THRE1,
> +       ISP_DRV_DIP_CQ_THRE2,
> +       ISP_DRV_DIP_CQ_THRE3,
> +       ISP_DRV_DIP_CQ_THRE4,
> +       ISP_DRV_DIP_CQ_THRE5,
> +       ISP_DRV_DIP_CQ_THRE6,
> +       ISP_DRV_DIP_CQ_THRE7,
> +       ISP_DRV_DIP_CQ_THRE8,
> +       ISP_DRV_DIP_CQ_THRE9,
> +       ISP_DRV_DIP_CQ_THRE10,
> +       ISP_DRV_DIP_CQ_THRE11,
> +       ISP_DRV_DIP_CQ_NUM,
> +       ISP_DRV_DIP_CQ_NONE,
> +       /* we only need 12 CQ threads in this chip,

Which chip? mt8183? If we only need these for now just remove the
others if they are not used.

> +        * so we move the following enum behind ISP_DRV_DIP_CQ_NUM
> +        */

> +       ISP_DRV_DIP_CQ_THRE12,
> +       ISP_DRV_DIP_CQ_THRE13,
> +       ISP_DRV_DIP_CQ_THRE14,
> +       ISP_DRV_DIP_CQ_THRE15,  /* CQ_THREAD15 does not connect to GCE */
> +       ISP_DRV_DIP_CQ_THRE16,  /* CQ_THREAD16 does not connect to GCE */
> +       ISP_DRV_DIP_CQ_THRE17,  /* CQ_THREAD17 does not connect to GCE */
> +       ISP_DRV_DIP_CQ_THRE18,  /* CQ_THREAD18 does not connect to GCE */
> +};
> +
> +#endif  // __ISP_REG_H__
> diff --git a/drivers/media/platform/mtk-mdp3/mdp-platform.h b/drivers/media/platform/mtk-mdp3/mdp-platform.h
> new file mode 100644
> index 000000000000..d474580306b7
> --- /dev/null
> +++ b/drivers/media/platform/mtk-mdp3/mdp-platform.h
> @@ -0,0 +1,58 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2018 MediaTek Inc.
> + * Author: Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
> + */
> +
> +#ifndef __MDP_PLATFORM_H__
> +#define __MDP_PLATFORM_H__
> +
> +#include "mtk-mdp3-comp.h"
> +
> +/* CAM */
> +#define MDP_WPEI           MDP_COMP_WPEI
> +#define MDP_WPEO           MDP_COMP_WPEO
> +#define MDP_WPEI2          MDP_COMP_WPEI2
> +#define MDP_WPEO2          MDP_COMP_WPEO2
> +#define MDP_IMGI           MDP_COMP_ISP_IMGI
> +#define MDP_IMGO           MDP_COMP_ISP_IMGO
> +#define MDP_IMG2O          MDP_COMP_ISP_IMG2O
> +
> +/* IPU */
> +#define MDP_IPUI           MDP_COMP_NONE
> +#define MDP_IPUO           MDP_COMP_NONE
> +
> +/* MDP */
> +#define MDP_CAMIN          MDP_COMP_CAMIN
> +#define MDP_CAMIN2         MDP_COMP_CAMIN2
> +#define MDP_RDMA0          MDP_COMP_RDMA0
> +#define MDP_RDMA1          MDP_COMP_NONE
> +#define MDP_AAL0           MDP_COMP_AAL0
> +#define MDP_CCORR0         MDP_COMP_CCORR0
> +#define MDP_SCL0           MDP_COMP_RSZ0
> +#define MDP_SCL1           MDP_COMP_RSZ1
> +#define MDP_SCL2           MDP_COMP_NONE
> +#define MDP_TDSHP0         MDP_COMP_TDSHP0
> +#define MDP_COLOR0         MDP_COMP_COLOR0
> +#define MDP_WROT0          MDP_COMP_WROT0
> +#define MDP_WROT1          MDP_COMP_NONE
> +#define MDP_WDMA           MDP_COMP_WDMA
> +#define MDP_PATH0_SOUT     MDP_COMP_PATH0_SOUT
> +#define MDP_PATH1_SOUT     MDP_COMP_PATH1_SOUT

What's the point of redefine these defines, why not use the MDP_COMP_* form?

> +
> +#define MDP_TOTAL          (MDP_COMP_WDMA + 1)
> +
> +/* Platform options */
> +#define ESL_SETTING                    1
> +#define RDMA_SUPPORT_10BIT             1
> +#define RDMA0_RSZ1_SRAM_SHARING                1
> +#define RDMA_UPSAMPLE_REPEAT_ONLY      1
> +#define RSZ_DISABLE_DCM_SMALL_TILE     0
> +#define WROT_FILTER_CONSTRAINT         0
> +#define WROT0_DISP_SRAM_SHARING                0

All these seem to be compile flags, ESL_SETTING is not used, so you
can remove it. About the others, they seem to be used as preprocessor
conditionals (#ifdef) in .c files (mtk-mdp3-comp.c). Doing so makes
code harder to read and logic harder to follow. It makes no sense this
built-time conditional cases, so just simplify all this by removing
these defines and the corresponding code in .c files.

> +
> +#define MM_MUTEX_MOD_OFFSET    0x30
> +#define MM_MUTEX_SOF_OFFSET    0x2c
> +

These registers seems to be required to write to the mm-mutex space.
There is already a drivers/soc/mediatek/mtk-mutex.c driver, use that
driver instead of writing directly to the MM_MUTEX registers.

> +#endif  /* __MDP_PLATFORM_H__ */

As a sum up, I think you should get rid of this file completely.

> +
> diff --git a/drivers/media/platform/mtk-mdp3/mdp_reg_ccorr.h b/drivers/media/platform/mtk-mdp3/mdp_reg_ccorr.h
> new file mode 100644
> index 000000000000..2e8624446502
> --- /dev/null
> +++ b/drivers/media/platform/mtk-mdp3/mdp_reg_ccorr.h
> @@ -0,0 +1,75 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2019 MediaTek Inc.
> + * Author: Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
> + */
> +
> +#ifndef __MDP_REG_CCORR_H__
> +#define __MDP_REG_CCORR_H__
> +
> +#include "mmsys_reg_base.h"
> +
> +#define MDP_CCORR_EN                0x000
> +#define MDP_CCORR_RESET             0x004
> +#define MDP_CCORR_INTEN             0x008
> +#define MDP_CCORR_INTSTA            0x00c
> +#define MDP_CCORR_STATUS            0x010
> +#define MDP_CCORR_CFG               0x020
> +#define MDP_CCORR_INPUT_COUNT       0x024
> +#define MDP_CCORR_OUTPUT_COUNT      0x028
> +#define MDP_CCORR_CHKSUM            0x02c
> +#define MDP_CCORR_SIZE              0x030
> +#define MDP_CCORR_Y2R_00            0x034
> +#define MDP_CCORR_Y2R_01            0x038
> +#define MDP_CCORR_Y2R_02            0x03c
> +#define MDP_CCORR_Y2R_03            0x040
> +#define MDP_CCORR_Y2R_04            0x044
> +#define MDP_CCORR_Y2R_05            0x048
> +#define MDP_CCORR_R2Y_00            0x04c
> +#define MDP_CCORR_R2Y_01            0x050
> +#define MDP_CCORR_R2Y_02            0x054
> +#define MDP_CCORR_R2Y_03            0x058
> +#define MDP_CCORR_R2Y_04            0x05c
> +#define MDP_CCORR_R2Y_05            0x060
> +#define MDP_CCORR_COEF_0            0x080
> +#define MDP_CCORR_COEF_1            0x084
> +#define MDP_CCORR_COEF_2            0x088
> +#define MDP_CCORR_COEF_3            0x08c
> +#define MDP_CCORR_COEF_4            0x090
> +#define MDP_CCORR_SHADOW            0x0a0
> +#define MDP_CCORR_DUMMY_REG         0x0c0
> +#define MDP_CCORR_ATPG              0x0fc
> +
> +/* MASK */
> +#define MDP_CCORR_EN_MASK           0x00000001
> +#define MDP_CCORR_RESET_MASK        0x00000001
> +#define MDP_CCORR_INTEN_MASK        0x00000003
> +#define MDP_CCORR_INTSTA_MASK       0x00000003
> +#define MDP_CCORR_STATUS_MASK       0xfffffff3
> +#define MDP_CCORR_CFG_MASK          0x70001317
> +#define MDP_CCORR_INPUT_COUNT_MASK  0x1fff1fff
> +#define MDP_CCORR_OUTPUT_COUNT_MASK 0x1fff1fff
> +#define MDP_CCORR_CHKSUM_MASK       0xffffffff
> +#define MDP_CCORR_SIZE_MASK         0x1fff1fff
> +#define MDP_CCORR_Y2R_00_MASK       0x01ff01ff
> +#define MDP_CCORR_Y2R_01_MASK       0x1fff01ff
> +#define MDP_CCORR_Y2R_02_MASK       0x1fff1fff
> +#define MDP_CCORR_Y2R_03_MASK       0x1fff1fff
> +#define MDP_CCORR_Y2R_04_MASK       0x1fff1fff
> +#define MDP_CCORR_Y2R_05_MASK       0x1fff1fff
> +#define MDP_CCORR_R2Y_00_MASK       0x01ff01ff
> +#define MDP_CCORR_R2Y_01_MASK       0x07ff01ff
> +#define MDP_CCORR_R2Y_02_MASK       0x07ff07ff
> +#define MDP_CCORR_R2Y_03_MASK       0x07ff07ff
> +#define MDP_CCORR_R2Y_04_MASK       0x07ff07ff
> +#define MDP_CCORR_R2Y_05_MASK       0x07ff07ff
> +#define MDP_CCORR_COEF_0_MASK       0x1fff1fff
> +#define MDP_CCORR_COEF_1_MASK       0x1fff1fff
> +#define MDP_CCORR_COEF_2_MASK       0x1fff1fff
> +#define MDP_CCORR_COEF_3_MASK       0x1fff1fff
> +#define MDP_CCORR_COEF_4_MASK       0x1fff1fff
> +#define MDP_CCORR_SHADOW_MASK       0x00000007
> +#define MDP_CCORR_DUMMY_REG_MASK    0xffffffff
> +#define MDP_CCORR_ATPG_MASK         0x00000003
> +

There are lots of defines that are not used, please remove them.


> +#endif  // __MDP_REG_CCORR_H__
> diff --git a/drivers/media/platform/mtk-mdp3/mdp_reg_rdma.h b/drivers/media/platform/mtk-mdp3/mdp_reg_rdma.h
> new file mode 100644
> index 000000000000..d7f5d9275d6d
> --- /dev/null
> +++ b/drivers/media/platform/mtk-mdp3/mdp_reg_rdma.h
> @@ -0,0 +1,206 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2019 MediaTek Inc.
> + * Author: Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
> + */
> +
> +#ifndef __MDP_REG_RDMA_H__
> +#define __MDP_REG_RDMA_H__
> +
> +#include "mmsys_reg_base.h"
> +
> +#define MDP_RDMA_EN                     0x000
> +#define MDP_RDMA_RESET                  0x008
> +#define MDP_RDMA_INTERRUPT_ENABLE       0x010
> +#define MDP_RDMA_INTERRUPT_STATUS       0x018
> +#define MDP_RDMA_CON                    0x020
> +#define MDP_RDMA_GMCIF_CON              0x028
> +#define MDP_RDMA_SRC_CON                0x030
> +#define MDP_RDMA_SRC_BASE_0             0xf00
> +#define MDP_RDMA_SRC_BASE_1             0xf08
> +#define MDP_RDMA_SRC_BASE_2             0xf10
> +#define MDP_RDMA_UFO_DEC_LENGTH_BASE_Y  0xf20
> +#define MDP_RDMA_UFO_DEC_LENGTH_BASE_C  0xf28
> +#define MDP_RDMA_MF_BKGD_SIZE_IN_BYTE   0x060
> +#define MDP_RDMA_MF_BKGD_SIZE_IN_PXL    0x068
> +#define MDP_RDMA_MF_SRC_SIZE            0x070
> +#define MDP_RDMA_MF_CLIP_SIZE           0x078
> +#define MDP_RDMA_MF_OFFSET_1            0x080
> +#define MDP_RDMA_MF_PAR                 0x088
> +#define MDP_RDMA_SF_BKGD_SIZE_IN_BYTE   0x090
> +#define MDP_RDMA_SF_PAR                 0x0b8
> +#define MDP_RDMA_MB_DEPTH               0x0c0
> +#define MDP_RDMA_MB_BASE                0x0c8
> +#define MDP_RDMA_MB_CON                 0x0d0
> +#define MDP_RDMA_SB_DEPTH               0x0d8
> +#define MDP_RDMA_SB_BASE                0x0e0
> +#define MDP_RDMA_SB_CON                 0x0e8
> +#define MDP_RDMA_VC1_RANGE              0x0f0
> +#define MDP_RDMA_SRC_END_0              0x100
> +#define MDP_RDMA_SRC_END_1              0x108
> +#define MDP_RDMA_SRC_END_2              0x110
> +#define MDP_RDMA_SRC_OFFSET_0           0x118
> +#define MDP_RDMA_SRC_OFFSET_1           0x120
> +#define MDP_RDMA_SRC_OFFSET_2           0x128
> +#define MDP_RDMA_SRC_OFFSET_W_0         0x130
> +#define MDP_RDMA_SRC_OFFSET_W_1         0x138
> +#define MDP_RDMA_SRC_OFFSET_W_2         0x140
> +#define MDP_RDMA_SRC_OFFSET_0_P         0x148
> +#define MDP_RDMA_TRANSFORM_0            0x200
> +#define MDP_RDMA_TRANSFORM_1            0x208
> +#define MDP_RDMA_TRANSFORM_2            0x210
> +#define MDP_RDMA_TRANSFORM_3            0x218
> +#define MDP_RDMA_TRANSFORM_4            0x220
> +#define MDP_RDMA_TRANSFORM_5            0x228
> +#define MDP_RDMA_TRANSFORM_6            0x230
> +#define MDP_RDMA_TRANSFORM_7            0x238
> +#define MDP_RDMA_DMABUF_CON_0           0x240
> +#define MDP_RDMA_DMAULTRA_CON_0         0x248
> +#define MDP_RDMA_DMABUF_CON_1           0x250
> +#define MDP_RDMA_DMAULTRA_CON_1         0x258
> +#define MDP_RDMA_DMABUF_CON_2           0x260
> +#define MDP_RDMA_DMAULTRA_CON_2         0x268
> +#define MDP_RDMA_DITHER_CON             0x288
> +#define MDP_RDMA_RESV_DUMMY_0           0x2a0
> +#define MDP_RDMA_CHKS_EXTR              0x300
> +#define MDP_RDMA_CHKS_INTW              0x308
> +#define MDP_RDMA_CHKS_INTR              0x310
> +#define MDP_RDMA_CHKS_ROTO              0x318
> +#define MDP_RDMA_CHKS_SRIY              0x320
> +#define MDP_RDMA_CHKS_SRIU              0x328
> +#define MDP_RDMA_CHKS_SRIV              0x330
> +#define MDP_RDMA_CHKS_SROY              0x338
> +#define MDP_RDMA_CHKS_SROU              0x340
> +#define MDP_RDMA_CHKS_SROV              0x348
> +#define MDP_RDMA_CHKS_VUPI              0x350
> +#define MDP_RDMA_CHKS_VUPO              0x358
> +#define MDP_RDMA_DEBUG_CON              0x380
> +#define MDP_RDMA_MON_STA_0              0x400
> +#define MDP_RDMA_MON_STA_1              0x408
> +#define MDP_RDMA_MON_STA_2              0x410
> +#define MDP_RDMA_MON_STA_3              0x418
> +#define MDP_RDMA_MON_STA_4              0x420
> +#define MDP_RDMA_MON_STA_5              0x428
> +#define MDP_RDMA_MON_STA_6              0x430
> +#define MDP_RDMA_MON_STA_7              0x438
> +#define MDP_RDMA_MON_STA_8              0x440
> +#define MDP_RDMA_MON_STA_9              0x448
> +#define MDP_RDMA_MON_STA_10             0x450
> +#define MDP_RDMA_MON_STA_11             0x458
> +#define MDP_RDMA_MON_STA_12             0x460
> +#define MDP_RDMA_MON_STA_13             0x468
> +#define MDP_RDMA_MON_STA_14             0x470
> +#define MDP_RDMA_MON_STA_15             0x478
> +#define MDP_RDMA_MON_STA_16             0x480
> +#define MDP_RDMA_MON_STA_17             0x488
> +#define MDP_RDMA_MON_STA_18             0x490
> +#define MDP_RDMA_MON_STA_19             0x498
> +#define MDP_RDMA_MON_STA_20             0x4a0
> +#define MDP_RDMA_MON_STA_21             0x4a8
> +#define MDP_RDMA_MON_STA_22             0x4b0
> +#define MDP_RDMA_MON_STA_23             0x4b8
> +#define MDP_RDMA_MON_STA_24             0x4c0
> +#define MDP_RDMA_MON_STA_25             0x4c8
> +#define MDP_RDMA_MON_STA_26             0x4d0
> +#define MDP_RDMA_MON_STA_27             0x4d8
> +#define MDP_RDMA_MON_STA_28             0x4e0
> +
> +/* MASK */
> +#define MDP_RDMA_EN_MASK                    0x00000001
> +#define MDP_RDMA_RESET_MASK                 0x00000001
> +#define MDP_RDMA_INTERRUPT_ENABLE_MASK      0x00000007
> +#define MDP_RDMA_INTERRUPT_STATUS_MASK      0x00000007
> +#define MDP_RDMA_CON_MASK                   0x00001110
> +#define MDP_RDMA_GMCIF_CON_MASK             0xfffb3771
> +#define MDP_RDMA_SRC_CON_MASK               0xf3ffffff
> +#define MDP_RDMA_SRC_BASE_0_MASK            0xffffffff
> +#define MDP_RDMA_SRC_BASE_1_MASK            0xffffffff
> +#define MDP_RDMA_SRC_BASE_2_MASK            0xffffffff
> +#define MDP_RDMA_UFO_DEC_LENGTH_BASE_Y_MASK 0xffffffff
> +#define MDP_RDMA_UFO_DEC_LENGTH_BASE_C_MASK 0xffffffff
> +#define MDP_RDMA_MF_BKGD_SIZE_IN_BYTE_MASK  0x001fffff
> +#define MDP_RDMA_MF_BKGD_SIZE_IN_PXL_MASK   0x001fffff
> +#define MDP_RDMA_MF_SRC_SIZE_MASK           0x1fff1fff
> +#define MDP_RDMA_MF_CLIP_SIZE_MASK          0x1fff1fff
> +#define MDP_RDMA_MF_OFFSET_1_MASK           0x003f001f
> +#define MDP_RDMA_MF_PAR_MASK                0x1ffff3ff
> +#define MDP_RDMA_SF_BKGD_SIZE_IN_BYTE_MASK  0x001fffff
> +#define MDP_RDMA_SF_PAR_MASK                0x1ffff3ff
> +#define MDP_RDMA_MB_DEPTH_MASK              0x0000007f
> +#define MDP_RDMA_MB_BASE_MASK               0x0000ffff
> +#define MDP_RDMA_MB_CON_MASK                0x3fff1fff
> +#define MDP_RDMA_SB_DEPTH_MASK              0x0000007f
> +#define MDP_RDMA_SB_BASE_MASK               0x0000ffff
> +#define MDP_RDMA_SB_CON_MASK                0x3fff1fff
> +#define MDP_RDMA_VC1_RANGE_MASK             0x001f1f11
> +#define MDP_RDMA_SRC_END_0_MASK             0xffffffff
> +#define MDP_RDMA_SRC_END_1_MASK             0xffffffff
> +#define MDP_RDMA_SRC_END_2_MASK             0xffffffff
> +#define MDP_RDMA_SRC_OFFSET_0_MASK          0xffffffff
> +#define MDP_RDMA_SRC_OFFSET_1_MASK          0xffffffff
> +#define MDP_RDMA_SRC_OFFSET_2_MASK          0xffffffff
> +#define MDP_RDMA_SRC_OFFSET_W_0_MASK        0x0000ffff
> +#define MDP_RDMA_SRC_OFFSET_W_1_MASK        0x0000ffff
> +#define MDP_RDMA_SRC_OFFSET_W_2_MASK        0x0000ffff
> +#define MDP_RDMA_SRC_OFFSET_0_P_MASK        0xffffffff
> +#define MDP_RDMA_TRANSFORM_0_MASK           0xff110777
> +#define MDP_RDMA_TRANSFORM_1_MASK           0x1ff7fdff
> +#define MDP_RDMA_TRANSFORM_2_MASK           0x1ff7fdff
> +#define MDP_RDMA_TRANSFORM_3_MASK           0x1fff1fff
> +#define MDP_RDMA_TRANSFORM_4_MASK           0x1fff1fff
> +#define MDP_RDMA_TRANSFORM_5_MASK           0x1fff1fff
> +#define MDP_RDMA_TRANSFORM_6_MASK           0x1fff1fff
> +#define MDP_RDMA_TRANSFORM_7_MASK           0x00001fff
> +#define MDP_RDMA_DMABUF_CON_0_MASK          0x077f007f
> +#define MDP_RDMA_DMAULTRA_CON_0_MASK        0x7f7f7f7f
> +#define MDP_RDMA_DMABUF_CON_1_MASK          0x073f003f
> +#define MDP_RDMA_DMAULTRA_CON_1_MASK        0x3f3f3f3f
> +#define MDP_RDMA_DMABUF_CON_2_MASK          0x071f001f
> +#define MDP_RDMA_DMAULTRA_CON_2_MASK        0x1f1f1f1f
> +
> +#define MDP_RDMA_DITHER_CON_MASK            0xffffffff
> +#define MDP_RDMA_RESV_DUMMY_0_MASK          0xffffffff
> +#define MDP_RDMA_CHKS_EXTR_MASK             0xffffff01
> +#define MDP_RDMA_CHKS_INTW_MASK             0xffffff01
> +#define MDP_RDMA_CHKS_INTR_MASK             0xffffff01
> +#define MDP_RDMA_CHKS_ROTO_MASK             0xffffff01
> +#define MDP_RDMA_CHKS_SRIY_MASK             0xffffff01
> +#define MDP_RDMA_CHKS_SRIU_MASK             0xffffff01
> +#define MDP_RDMA_CHKS_SRIV_MASK             0xffffff01
> +#define MDP_RDMA_CHKS_SROY_MASK             0xffffff01
> +#define MDP_RDMA_CHKS_SROU_MASK             0xffffff01
> +#define MDP_RDMA_CHKS_SROV_MASK             0xffffff01
> +#define MDP_RDMA_CHKS_VUPI_MASK             0xffffff01
> +#define MDP_RDMA_CHKS_VUPO_MASK             0xffffff01
> +#define MDP_RDMA_DEBUG_CON_MASK             0x00001f11
> +#define MDP_RDMA_MON_STA_0_MASK             0xffffffff
> +#define MDP_RDMA_MON_STA_1_MASK             0xffffffff
> +#define MDP_RDMA_MON_STA_2_MASK             0xffffffff
> +#define MDP_RDMA_MON_STA_3_MASK             0xffffffff
> +#define MDP_RDMA_MON_STA_4_MASK             0xffffffff
> +#define MDP_RDMA_MON_STA_5_MASK             0xffffffff
> +#define MDP_RDMA_MON_STA_6_MASK             0xffffffff
> +#define MDP_RDMA_MON_STA_7_MASK             0xffffffff
> +#define MDP_RDMA_MON_STA_8_MASK             0xffffffff
> +#define MDP_RDMA_MON_STA_9_MASK             0xffffffff
> +#define MDP_RDMA_MON_STA_10_MASK            0xffffffff
> +#define MDP_RDMA_MON_STA_11_MASK            0xffffffff
> +#define MDP_RDMA_MON_STA_12_MASK            0xffffffff
> +#define MDP_RDMA_MON_STA_13_MASK            0xffffffff
> +#define MDP_RDMA_MON_STA_14_MASK            0xffffffff
> +#define MDP_RDMA_MON_STA_15_MASK            0xffffffff
> +#define MDP_RDMA_MON_STA_16_MASK            0xffffffff
> +#define MDP_RDMA_MON_STA_17_MASK            0xffffffff
> +#define MDP_RDMA_MON_STA_18_MASK            0xffffffff
> +#define MDP_RDMA_MON_STA_19_MASK            0xffffffff
> +#define MDP_RDMA_MON_STA_20_MASK            0xffffffff
> +#define MDP_RDMA_MON_STA_21_MASK            0xffffffff
> +#define MDP_RDMA_MON_STA_22_MASK            0xffffffff
> +#define MDP_RDMA_MON_STA_23_MASK            0xffffffff
> +#define MDP_RDMA_MON_STA_24_MASK            0xffffffff
> +#define MDP_RDMA_MON_STA_25_MASK            0xffffffff
> +#define MDP_RDMA_MON_STA_26_MASK            0xffffffff
> +#define MDP_RDMA_MON_STA_27_MASK            0xffffffff
> +#define MDP_RDMA_MON_STA_28_MASK            0xffffffff
> +

Same here and below. Lots of defines not used. Let's simplify the
driver as much as possible and remove all that is not used by the
driver.

> +#endif  // __MDP_REG_RDMA_H__
> diff --git a/drivers/media/platform/mtk-mdp3/mdp_reg_rsz.h b/drivers/media/platform/mtk-mdp3/mdp_reg_rsz.h
> new file mode 100644
> index 000000000000..7f0683f3c60d
> --- /dev/null
> +++ b/drivers/media/platform/mtk-mdp3/mdp_reg_rsz.h
> @@ -0,0 +1,109 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2019 MediaTek Inc.
> + * Author: Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
> + */
> +
> +#ifndef __MDP_REG_RSZ_H__
> +#define __MDP_REG_RSZ_H__
> +
> +#include "mmsys_reg_base.h"
> +
> +#define PRZ_ENABLE                                        0x000
> +#define PRZ_CONTROL_1                                     0x004
> +#define PRZ_CONTROL_2                                     0x008
> +#define PRZ_INT_FLAG                                      0x00c
> +#define PRZ_INPUT_IMAGE                                   0x010
> +#define PRZ_OUTPUT_IMAGE                                  0x014
> +#define PRZ_HORIZONTAL_COEFF_STEP                         0x018
> +#define PRZ_VERTICAL_COEFF_STEP                           0x01c
> +#define PRZ_LUMA_HORIZONTAL_INTEGER_OFFSET                0x020
> +#define PRZ_LUMA_HORIZONTAL_SUBPIXEL_OFFSET               0x024
> +#define PRZ_LUMA_VERTICAL_INTEGER_OFFSET                  0x028
> +#define PRZ_LUMA_VERTICAL_SUBPIXEL_OFFSET                 0x02c
> +#define PRZ_CHROMA_HORIZONTAL_INTEGER_OFFSET              0x030
> +#define PRZ_CHROMA_HORIZONTAL_SUBPIXEL_OFFSET             0x034
> +#define PRZ_RSV                                           0x040
> +#define PRZ_DEBUG_SEL                                     0x044
> +#define PRZ_DEBUG                                         0x048
> +#define PRZ_TAP_ADAPT                                     0x04c
> +#define PRZ_IBSE_SOFTCLIP                                 0x050
> +#define PRZ_IBSE_YLEVEL_1                                 0x054
> +#define PRZ_IBSE_YLEVEL_2                                 0x058
> +#define PRZ_IBSE_YLEVEL_3                                 0x05c
> +#define PRZ_IBSE_YLEVEL_4                                 0x060
> +#define PRZ_IBSE_YLEVEL_5                                 0x064
> +#define PRZ_IBSE_GAINCONTROL_1                            0x068
> +#define PRZ_IBSE_GAINCONTROL_2                            0x06c
> +#define PRZ_DEMO_IN_HMASK                                 0x070
> +#define PRZ_DEMO_IN_VMASK                                 0x074
> +#define PRZ_DEMO_OUT_HMASK                                0x078
> +#define PRZ_DEMO_OUT_VMASK                                0x07c
> +#define PRZ_ATPG                                          0x0fc
> +#define PRZ_PAT1_GEN_SET                                  0x100
> +#define PRZ_PAT1_GEN_FRM_SIZE                             0x104
> +#define PRZ_PAT1_GEN_COLOR0                               0x108
> +#define PRZ_PAT1_GEN_COLOR1                               0x10c
> +#define PRZ_PAT1_GEN_COLOR2                               0x110
> +#define PRZ_PAT1_GEN_POS                                  0x114
> +#define PRZ_PAT1_GEN_TILE_POS                             0x124
> +#define PRZ_PAT1_GEN_TILE_OV                              0x128
> +#define PRZ_PAT2_GEN_SET                                  0x200
> +#define PRZ_PAT2_GEN_COLOR0                               0x208
> +#define PRZ_PAT2_GEN_COLOR1                               0x20c
> +#define PRZ_PAT2_GEN_POS                                  0x214
> +#define PRZ_PAT2_GEN_CURSOR_RB0                           0x218
> +#define PRZ_PAT2_GEN_CURSOR_RB1                           0x21c
> +#define PRZ_PAT2_GEN_TILE_POS                             0x224
> +#define PRZ_PAT2_GEN_TILE_OV                              0x228
> +
> +/* MASK */
> +#define PRZ_ENABLE_MASK                                   0x00010001
> +#define PRZ_CONTROL_1_MASK                                0xfffffff3
> +#define PRZ_CONTROL_2_MASK                                0x0ffffaff
> +#define PRZ_INT_FLAG_MASK                                 0x00000033
> +#define PRZ_INPUT_IMAGE_MASK                              0xffffffff
> +#define PRZ_OUTPUT_IMAGE_MASK                             0xffffffff
> +#define PRZ_HORIZONTAL_COEFF_STEP_MASK                    0x007fffff
> +#define PRZ_VERTICAL_COEFF_STEP_MASK                      0x007fffff
> +#define PRZ_LUMA_HORIZONTAL_INTEGER_OFFSET_MASK           0x0000ffff
> +#define PRZ_LUMA_HORIZONTAL_SUBPIXEL_OFFSET_MASK          0x001fffff
> +#define PRZ_LUMA_VERTICAL_INTEGER_OFFSET_MASK             0x0000ffff
> +#define PRZ_LUMA_VERTICAL_SUBPIXEL_OFFSET_MASK            0x001fffff
> +#define PRZ_CHROMA_HORIZONTAL_INTEGER_OFFSET_MASK         0x0000ffff
> +#define PRZ_CHROMA_HORIZONTAL_SUBPIXEL_OFFSET_MASK        0x001fffff
> +#define PRZ_RSV_MASK                                      0xffffffff
> +#define PRZ_DEBUG_SEL_MASK                                0x0000000f
> +#define PRZ_DEBUG_MASK                                    0xffffffff
> +#define PRZ_TAP_ADAPT_MASK                                0x03ffffff
> +#define PRZ_IBSE_SOFTCLIP_MASK                            0x000fffff
> +#define PRZ_IBSE_YLEVEL_1_MASK                            0xffffffff
> +#define PRZ_IBSE_YLEVEL_2_MASK                            0xffffffff
> +#define PRZ_IBSE_YLEVEL_3_MASK                            0xffffffff
> +#define PRZ_IBSE_YLEVEL_4_MASK                            0xffffffff
> +#define PRZ_IBSE_YLEVEL_5_MASK                            0x0000ff3f
> +#define PRZ_IBSE_GAINCONTROL_1_MASK                       0xffffffff
> +#define PRZ_IBSE_GAINCONTROL_2_MASK                       0x0fffff0f
> +#define PRZ_DEMO_IN_HMASK_MASK                            0xffffffff
> +#define PRZ_DEMO_IN_VMASK_MASK                            0xffffffff
> +#define PRZ_DEMO_OUT_HMASK_MASK                           0xffffffff
> +#define PRZ_DEMO_OUT_VMASK_MASK                           0xffffffff
> +#define PRZ_ATPG_MASK                                     0x00000003
> +#define PRZ_PAT1_GEN_SET_MASK                             0x00ff00fd
> +#define PRZ_PAT1_GEN_FRM_SIZE_MASK                        0x1fff1fff
> +#define PRZ_PAT1_GEN_COLOR0_MASK                          0x00ff00ff
> +#define PRZ_PAT1_GEN_COLOR1_MASK                          0x00ff00ff
> +#define PRZ_PAT1_GEN_COLOR2_MASK                          0x00ff00ff
> +#define PRZ_PAT1_GEN_POS_MASK                             0x1fff1fff
> +#define PRZ_PAT1_GEN_TILE_POS_MASK                        0x1fff1fff
> +#define PRZ_PAT1_GEN_TILE_OV_MASK                         0x0000ffff
> +#define PRZ_PAT2_GEN_SET_MASK                             0x00ff0003
> +#define PRZ_PAT2_GEN_COLOR0_MASK                          0x00ff00ff
> +#define PRZ_PAT2_GEN_COLOR1_MASK                          0x000000ff
> +#define PRZ_PAT2_GEN_POS_MASK                             0x1fff1fff
> +#define PRZ_PAT2_GEN_CURSOR_RB0_MASK                      0x00ff00ff
> +#define PRZ_PAT2_GEN_CURSOR_RB1_MASK                      0x000000ff
> +#define PRZ_PAT2_GEN_TILE_POS_MASK                        0x1fff1fff
> +#define PRZ_PAT2_GEN_TILE_OV_MASK                         0x0000ffff
> +
> +#endif // __MDP_REG_RSZ_H__
> diff --git a/drivers/media/platform/mtk-mdp3/mdp_reg_wdma.h b/drivers/media/platform/mtk-mdp3/mdp_reg_wdma.h
> new file mode 100644
> index 000000000000..c274b54c1f18
> --- /dev/null
> +++ b/drivers/media/platform/mtk-mdp3/mdp_reg_wdma.h
> @@ -0,0 +1,125 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2019 MediaTek Inc.
> + * Author: Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
> + */
> +
> +#ifndef __MDP_REG_WDMA_H__
> +#define __MDP_REG_WDMA_H__
> +
> +#include "mmsys_reg_base.h"
> +
> +#define WDMA_INTEN              0x000
> +#define WDMA_INTSTA             0x004
> +#define WDMA_EN                 0x008
> +#define WDMA_RST                0x00c
> +#define WDMA_SMI_CON            0x010
> +#define WDMA_CFG                0x014
> +#define WDMA_SRC_SIZE           0x018
> +#define WDMA_CLIP_SIZE          0x01c
> +#define WDMA_CLIP_COORD         0x020
> +#define WDMA_DST_ADDR           0xf00
> +#define WDMA_DST_W_IN_BYTE      0x028
> +#define WDMA_ALPHA              0x02c
> +#define WDMA_BUF_CON1           0x038
> +#define WDMA_BUF_CON2           0x03c
> +#define WDMA_C00                0x040
> +#define WDMA_C02                0x044
> +#define WDMA_C10                0x048
> +#define WDMA_C12                0x04c
> +#define WDMA_C20                0x050
> +#define WDMA_C22                0x054
> +#define WDMA_PRE_ADD0           0x058
> +#define WDMA_PRE_ADD2           0x05c
> +#define WDMA_POST_ADD0          0x060
> +#define WDMA_POST_ADD2          0x064
> +#define WDMA_DST_U_ADDR         0xf04
> +#define WDMA_DST_V_ADDR         0xf08
> +#define WDMA_DST_UV_PITCH       0x078
> +#define WDMA_DST_ADDR_OFFSET    0x080
> +#define WDMA_DST_U_ADDR_OFFSET  0x084
> +#define WDMA_DST_V_ADDR_OFFSET  0x088
> +#define PROC_TRACK_CON_0        0x090
> +#define PROC_TRACK_CON_1        0x094
> +#define PROC_TRACK_CON_2        0x098
> +#define WDMA_FLOW_CTRL_DBG      0x0a0
> +#define WDMA_EXEC_DBG           0x0a4
> +#define WDMA_CT_DBG             0x0a8
> +#define WDMA_SMI_TRAFFIC_DBG    0x0ac
> +#define WDMA_PROC_TRACK_DBG_0   0x0b0
> +#define WDMA_PROC_TRACK_DBG_1   0x0b4
> +#define WDMA_DEBUG              0x0b8
> +#define WDMA_DUMMY              0x100
> +#define WDMA_DITHER_0           0xe00
> +#define WDMA_DITHER_5           0xe14
> +#define WDMA_DITHER_6           0xe18
> +#define WDMA_DITHER_7           0xe1c
> +#define WDMA_DITHER_8           0xe20
> +#define WDMA_DITHER_9           0xe24
> +#define WDMA_DITHER_10          0xe28
> +#define WDMA_DITHER_11          0xe2c
> +#define WDMA_DITHER_12          0xe30
> +#define WDMA_DITHER_13          0xe34
> +#define WDMA_DITHER_14          0xe38
> +#define WDMA_DITHER_15          0xe3c
> +#define WDMA_DITHER_16          0xe40
> +#define WDMA_DITHER_17          0xe44
> +
> +/* MASK */
> +#define WDMA_INTEN_MASK             0x00000003
> +#define WDMA_INTSTA_MASK            0x00000003
> +#define WDMA_EN_MASK                0x00000001
> +#define WDMA_RST_MASK               0x00000001
> +#define WDMA_SMI_CON_MASK           0x0fffffff
> +#define WDMA_CFG_MASK               0xff03bff0
> +#define WDMA_SRC_SIZE_MASK          0x3fff3fff
> +#define WDMA_CLIP_SIZE_MASK         0x3fff3fff
> +#define WDMA_CLIP_COORD_MASK        0x3fff3fff
> +#define WDMA_DST_ADDR_MASK          0xffffffff
> +#define WDMA_DST_W_IN_BYTE_MASK     0x0000ffff
> +#define WDMA_ALPHA_MASK             0x800000ff
> +#define WDMA_BUF_CON1_MASK          0xd1ff01ff
> +#define WDMA_BUF_CON2_MASK          0xffffffff
> +#define WDMA_C00_MASK               0x1fff1fff
> +#define WDMA_C02_MASK               0x00001fff
> +#define WDMA_C10_MASK               0x1fff1fff
> +#define WDMA_C12_MASK               0x00001fff
> +#define WDMA_C20_MASK               0x1fff1fff
> +#define WDMA_C22_MASK               0x00001fff
> +#define WDMA_PRE_ADD0_MASK          0x01ff01ff
> +#define WDMA_PRE_ADD2_MASK          0x000001ff
> +#define WDMA_POST_ADD0_MASK         0x01ff01ff
> +#define WDMA_POST_ADD2_MASK         0x000001ff
> +#define WDMA_DST_U_ADDR_MASK        0xffffffff
> +#define WDMA_DST_V_ADDR_MASK        0xffffffff
> +#define WDMA_DST_UV_PITCH_MASK      0x0000ffff
> +#define WDMA_DST_ADDR_OFFSET_MASK   0x0fffffff
> +#define WDMA_DST_U_ADDR_OFFSET_MASK 0x0fffffff
> +#define WDMA_DST_V_ADDR_OFFSET_MASK 0x0fffffff
> +#define PROC_TRACK_CON_0_MASK       0x70000fff
> +#define PROC_TRACK_CON_1_MASK       0x00ffffff
> +#define PROC_TRACK_CON_2_MASK       0x00ffffff
> +#define WDMA_FLOW_CTRL_DBG_MASK     0x0000f3ff
> +#define WDMA_EXEC_DBG_MASK          0x003f003f
> +#define WDMA_CT_DBG_MASK            0x3fff3fff
> +#define WDMA_SMI_TRAFFIC_DBG_MASK   0xffffffff
> +#define WDMA_PROC_TRACK_DBG_0_MASK  0xffffffff
> +#define WDMA_PROC_TRACK_DBG_1_MASK  0xffffffff
> +#define WDMA_DEBUG_MASK             0xffffffff
> +#define WDMA_DUMMY_MASK             0xffffffff
> +#define WDMA_DITHER_0_MASK          0x0111ff11
> +#define WDMA_DITHER_5_MASK          0x0000ffff
> +#define WDMA_DITHER_6_MASK          0x0001f3ff
> +#define WDMA_DITHER_7_MASK          0x00000333
> +#define WDMA_DITHER_8_MASK          0x03ff0001
> +#define WDMA_DITHER_9_MASK          0x03ff03ff
> +#define WDMA_DITHER_10_MASK         0x00000733
> +#define WDMA_DITHER_11_MASK         0x00003331
> +#define WDMA_DITHER_12_MASK         0xffff0031
> +#define WDMA_DITHER_13_MASK         0x00000777
> +#define WDMA_DITHER_14_MASK         0x00000371
> +#define WDMA_DITHER_15_MASK         0x77770001
> +#define WDMA_DITHER_16_MASK         0x77777777
> +#define WDMA_DITHER_17_MASK         0x0001ffff
> +
> +#endif  // __MDP_REG_WDMA_H__
> diff --git a/drivers/media/platform/mtk-mdp3/mdp_reg_wrot.h b/drivers/media/platform/mtk-mdp3/mdp_reg_wrot.h
> new file mode 100644
> index 000000000000..b757a288267d
> --- /dev/null
> +++ b/drivers/media/platform/mtk-mdp3/mdp_reg_wrot.h
> @@ -0,0 +1,115 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2019 MediaTek Inc.
> + * Author: Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
> + */
> +
> +#ifndef __MDP_REG_WROT_H__
> +#define __MDP_REG_WROT_H__
> +
> +#include "mmsys_reg_base.h"
> +
> +#define VIDO_CTRL                   0x000
> +#define VIDO_DMA_PERF               0x004
> +#define VIDO_MAIN_BUF_SIZE          0x008
> +#define VIDO_SOFT_RST               0x010
> +#define VIDO_SOFT_RST_STAT          0x014
> +#define VIDO_INT_EN                 0x018
> +#define VIDO_INT                    0x01c
> +#define VIDO_CROP_OFST              0x020
> +#define VIDO_TAR_SIZE               0x024
> +#define VIDO_BASE_ADDR              0xf00
> +#define VIDO_OFST_ADDR              0x02c
> +#define VIDO_STRIDE                 0x030
> +#define VIDO_BASE_ADDR_C            0xf04
> +#define VIDO_OFST_ADDR_C            0x038
> +#define VIDO_STRIDE_C               0x03c
> +#define VIDO_DITHER                 0x054
> +#define VIDO_BASE_ADDR_V            0xf08
> +#define VIDO_OFST_ADDR_V            0x068
> +#define VIDO_STRIDE_V               0x06c
> +#define VIDO_RSV_1                  0x070
> +#define VIDO_DMA_PREULTRA           0x074
> +#define VIDO_IN_SIZE                0x078
> +#define VIDO_ROT_EN                 0x07c
> +#define VIDO_FIFO_TEST              0x080
> +#define VIDO_MAT_CTRL               0x084
> +#define VIDO_MAT_RMY                0x088
> +#define VIDO_MAT_RMV                0x08c
> +#define VIDO_MAT_GMY                0x090
> +#define VIDO_MAT_BMY                0x094
> +#define VIDO_MAT_BMV                0x098
> +#define VIDO_MAT_PREADD             0x09c
> +#define VIDO_MAT_POSTADD            0x0a0
> +#define VIDO_DITHER_00              0x0a4
> +#define VIDO_DITHER_02              0x0ac
> +#define VIDO_DITHER_03              0x0b0
> +#define VIDO_DITHER_04              0x0b4
> +#define VIDO_DITHER_05              0x0b8
> +#define VIDO_DITHER_06              0x0bc
> +#define VIDO_DITHER_07              0x0c0
> +#define VIDO_DITHER_08              0x0c4
> +#define VIDO_DITHER_09              0x0c8
> +#define VIDO_DITHER_10              0x0cc
> +#define VIDO_DEBUG                  0x0d0
> +#define VIDO_ARB_SW_CTL             0x0d4
> +#define MDP_WROT_TRACK_CTL          0x0e0
> +#define MDP_WROT_TRACK_WINDOW       0x0e4
> +#define MDP_WROT_TRACK_TARGET       0x0e8
> +#define MDP_WROT_TRACK_STOP         0x0ec
> +#define MDP_WROT_TRACK_PROC_CNT0    0x0f0
> +#define MDP_WROT_TRACK_PROC_CNT1    0x0f4
> +
> +/* MASK */
> +#define VIDO_CTRL_MASK                  0xf530711f
> +#define VIDO_DMA_PERF_MASK              0x3fffffff
> +#define VIDO_MAIN_BUF_SIZE_MASK         0x1fff7f77
> +#define VIDO_SOFT_RST_MASK              0x00000001
> +#define VIDO_SOFT_RST_STAT_MASK         0x00000001
> +#define VIDO_INT_EN_MASK                0x00003f07
> +#define VIDO_INT_MASK                   0x00000007
> +#define VIDO_CROP_OFST_MASK             0x1fff1fff
> +#define VIDO_TAR_SIZE_MASK              0x1fff1fff
> +#define VIDO_BASE_ADDR_MASK             0xffffffff
> +#define VIDO_OFST_ADDR_MASK             0x0fffffff
> +#define VIDO_STRIDE_MASK                0x0000ffff
> +#define VIDO_BASE_ADDR_C_MASK           0xffffffff
> +#define VIDO_OFST_ADDR_C_MASK           0x0fffffff
> +#define VIDO_STRIDE_C_MASK              0x0000ffff
> +#define VIDO_DITHER_MASK                0xff000001
> +#define VIDO_BASE_ADDR_V_MASK           0xffffffff
> +#define VIDO_OFST_ADDR_V_MASK           0x0fffffff
> +#define VIDO_STRIDE_V_MASK              0x0000ffff
> +#define VIDO_RSV_1_MASK                 0xffffffff
> +#define VIDO_DMA_PREULTRA_MASK          0x00ffffff
> +#define VIDO_IN_SIZE_MASK               0x1fff1fff
> +#define VIDO_ROT_EN_MASK                0x00000001
> +#define VIDO_FIFO_TEST_MASK             0x00000fff
> +#define VIDO_MAT_CTRL_MASK              0x000000f3
> +#define VIDO_MAT_RMY_MASK               0x1fff1fff
> +#define VIDO_MAT_RMV_MASK               0x1fff1fff
> +#define VIDO_MAT_GMY_MASK               0x1fff1fff
> +#define VIDO_MAT_BMY_MASK               0x1fff1fff
> +#define VIDO_MAT_BMV_MASK               0x00001fff
> +#define VIDO_MAT_PREADD_MASK            0x1ff7fdff
> +#define VIDO_MAT_POSTADD_MASK           0x1ff7fdff
> +#define VIDO_DITHER_00_MASK             0x0000ff3f
> +#define VIDO_DITHER_02_MASK             0xffff3fff
> +#define VIDO_DITHER_03_MASK             0x0000003f
> +#define VIDO_DITHER_04_MASK             0xbfffffff
> +#define VIDO_DITHER_05_MASK             0xffff7fff
> +#define VIDO_DITHER_06_MASK             0x003ff773
> +#define VIDO_DITHER_07_MASK             0x00007777
> +#define VIDO_DITHER_08_MASK             0x00007777
> +#define VIDO_DITHER_09_MASK             0x00007777
> +#define VIDO_DITHER_10_MASK             0x0001ffff
> +#define VIDO_DEBUG_MASK                 0xffffffff
> +#define VIDO_ARB_SW_CTL_MASK            0x00000007
> +#define MDP_WROT_TRACK_CTL_MASK         0x0000001f
> +#define MDP_WROT_TRACK_WINDOW_MASK      0x00000fff
> +#define MDP_WROT_TRACK_TARGET_MASK      0x00ffffff
> +#define MDP_WROT_TRACK_STOP_MASK        0x00ffffff
> +#define MDP_WROT_TRACK_PROC_CNT0_MASK   0xffffffff
> +#define MDP_WROT_TRACK_PROC_CNT1_MASK   0x00000001
> +
> +#endif  // __MDP_REG_WROT_H__
> diff --git a/drivers/media/platform/mtk-mdp3/mmsys_config.h b/drivers/media/platform/mtk-mdp3/mmsys_config.h
> new file mode 100644
> index 000000000000..5cdfb864dadf
> --- /dev/null
> +++ b/drivers/media/platform/mtk-mdp3/mmsys_config.h
> @@ -0,0 +1,188 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2019 MediaTek Inc.
> + * Author: Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
> + */
> +
> +#ifndef __MMSYS_CONFIG_H__
> +#define __MMSYS_CONFIG_H__
> +
> +#include "mmsys_reg_base.h"
> +

Are all these register SoC specific, or generic? Are all in mmsys
space? Then should be defined in drivers/soc/mediatek/<soc>-mmsys.h or
linux/soc/mediatek/mtk-mmsys.h. And ideally I'd recommend to be a
separate patch to introduce these defines.

> +#define MMSYS_INTEN                   0x000
> +#define MMSYS_INTSTA                  0x004
> +#define MJC_APB_TX_CON                0x00c
> +
> +#define ISP_MOUT_EN                   0xf80
> +#define MDP_RDMA0_MOUT_EN             0xf84
> +#define MDP_RDMA1_MOUT_EN             0xf88
> +#define MDP_PRZ0_MOUT_EN              0xf8c
> +#define MDP_PRZ1_MOUT_EN              0xf90
> +#define MDP_COLOR_MOUT_EN             0xf94
> +#define IPU_MOUT_EN                   0xf98
> +#define DISP_TO_WROT_SOUT_SEL         0xfa0
> +#define MDP_COLOR_IN_SOUT_SEL         0xfa4
> +#define MDP_PATH0_SOUT_SEL            0xfa8
> +#define MDP_PATH1_SOUT_SEL            0xfac
> +#define MDP_TDSHP_SOUT_SEL            0xfb0
> +
> +#define DISP_OVL0_MOUT_EN             0xf00
> +#define DISP_OVL0_2L_MOUT_EN          0xf04
> +#define DISP_OVL1_2L_MOUT_EN          0xf08
> +#define DISP_DITHER0_MOUT_EN          0xf0c
> +#define DISP_RSZ_MOUT_EN              0xf10
> +
> +#define MMSYS_MOUT_RST                0x048
> +#define MDP_PRZ0_SEL_IN               0xfc0
> +#define MDP_PRZ1_SEL_IN               0xfc4
> +#define MDP_TDSHP_SEL_IN              0xfc8
> +#define DISP_WDMA0_SEL_IN             0xfcc
> +#define MDP_WROT0_SEL_IN              0xfd0
> +#define MDP_WDMA_SEL_IN               0xfd4
> +#define MDP_COLOR_OUT_SEL_IN          0xfd8
> +#define MDP_COLOR_SEL_IN              0xfdc
> +#define MDP_PATH0_SEL_IN              0xfe0
> +#define MDP_PATH1_SEL_IN              0xfe4
> +
> +#define DISP_COLOR_OUT_SEL_IN         0xf20
> +#define DISP_PATH0_SEL_IN             0xf24
> +#define DISP_WDMA0_PRE_SEL_IN         0xf28
> +#define DSI0_SEL_IN                   0xf2c
> +#define DSI1_SEL_IN                   0xf30
> +#define DISP_OVL0_SEL_IN              0xf34
> +#define DISP_OVL0_2L_SEL_IN           0xf38
> +#define OVL_TO_RSZ_SEL_IN             0xf3c
> +#define OVL_TO_WDMA_SEL_IN            0xf40
> +#define OVL_TO_WROT_SEL_IN            0xf44
> +#define DISP_RSZ_SEL_IN               0xf48
> +#define DISP_RDMA0_SOUT_SEL_IN        0xf50
> +#define DISP_RDMA1_SOUT_SEL_IN        0xf54
> +#define MDP_TO_DISP0_SOUT_SEL_IN      0xf58
> +#define MDP_TO_DISP1_SOUT_SEL_IN      0xf5c
> +#define DISP_RDMA0_RSZ_IN_SOUT_SEL_IN 0xf60
> +#define DISP_RDMA0_RSZ_OUT_SEL_IN     0xf64
> +#define MDP_AAL_MOUT_EN               0xfe8
> +#define MDP_AAL_SEL_IN                0xfec
> +#define MDP_CCORR_SEL_IN              0xff0
> +#define MDP_CCORR_SOUT_SEL            0xff4
> +
> +#define MMSYS_MISC                    0x0f0
> +#define MMSYS_SMI_LARB_SEL            0x0f4
> +#define MMSYS_SODI_REQ_MASK           0x0f8
> +#define MMSYS_CG_CON0                 0x100
> +#define MMSYS_CG_SET0                 0x104
> +#define MMSYS_CG_CLR0                 0x108
> +#define MMSYS_CG_CON1                 0x110
> +#define MMSYS_CG_SET1                 0x114
> +#define MMSYS_CG_CLR1                 0x118
> +#define MMSYS_HW_DCM_DIS0             0x120
> +#define MMSYS_HW_DCM_DIS_SET0         0x124
> +#define MMSYS_HW_DCM_DIS_CLR0         0x128
> +#define MMSYS_HW_DCM_DIS1             0x130
> +#define MMSYS_HW_DCM_DIS_SET1         0x134
> +#define MMSYS_HW_DCM_DIS_CLR1         0x138
> +#define MMSYS_HW_DCM_EVENT_CTL1       0x13c
> +#define MMSYS_SW0_RST_B               0x140
> +#define MMSYS_SW1_RST_B               0x144
> +#define MMSYS_LCM_RST_B               0x150
> +#define LARB6_AXI_ASIF_CFG_WD         0x180
> +#define LARB6_AXI_ASIF_CFG_RD         0x184
> +#define PROC_TRACK_EMI_BUSY_CON       0x190
> +#define DISP_FAKE_ENG_EN              0x200
> +#define DISP_FAKE_ENG_RST             0x204
> +#define DISP_FAKE_ENG_CON0            0x208
> +#define DISP_FAKE_ENG_CON1            0x20c
> +#define DISP_FAKE_ENG_RD_ADDR         0x210
> +#define DISP_FAKE_ENG_WR_ADDR         0x214
> +#define DISP_FAKE_ENG_STATE           0x218
> +#define DISP_FAKE_ENG2_EN             0x220
> +#define DISP_FAKE_ENG2_RST            0x224
> +#define DISP_FAKE_ENG2_CON0           0x228
> +#define DISP_FAKE_ENG2_CON1           0x22c
> +#define DISP_FAKE_ENG2_RD_ADDR        0x230
> +#define DISP_FAKE_ENG2_WR_ADDR        0x234
> +#define DISP_FAKE_ENG2_STATE          0x238
> +#define MMSYS_MBIST_CON               0x800
> +#define MMSYS_MBIST_DONE              0x804
> +#define MMSYS_MBIST_HOLDB             0x808
> +#define MMSYS_MBIST_MODE              0x80c
> +#define MMSYS_MBIST_FAIL0             0x810
> +#define MMSYS_MBIST_FAIL1             0x814
> +#define MMSYS_MBIST_FAIL2             0x818
> +#define MMSYS_MBIST_DEBUG             0x820
> +#define MMSYS_MBIST_DIAG_SCANOUT      0x824
> +#define MMSYS_MBIST_PRE_FUSE          0x828
> +#define MMSYS_MBIST_BSEL0             0x82c
> +#define MMSYS_MBIST_BSEL1             0x830
> +#define MMSYS_MBIST_BSEL2             0x834
> +#define MMSYS_MBIST_BSEL3             0x838
> +#define MMSYS_MBIST_HDEN              0x83c
> +#define MDP_RDMA0_MEM_DELSEL          0x840
> +#define MDP_RDMA1_MEM_DELSEL          0x844
> +#define MDP_RSZ_MEM_DELSEL            0x848
> +#define MDP_TDSHP_MEM_DELSEL          0x84c
> +#define MDP_AAL_MEM_DELSEL            0x850
> +
> +#define MDP_WROT0_MEM_DELSEL          0x854
> +#define MDP_WDMA_MEM_DELSEL           0x858
> +#define DISP_OVL_MEM_DELSEL           0x85c
> +#define DISP_OVL_2L_MEM_DELSEL        0x860
> +#define DISP_RDMA_MEM_DELSEL          0x864
> +#define DISP_WDMA0_MEM_DELSEL         0x868
> +#define DISP_GAMMA_MEM_DELSEL         0x870
> +#define DSI_MEM_DELSEL                0x874
> +#define DISP_SPLIT_MEM_DELSEL         0x878
> +#define DISP_DSC_MEM_DELSEL           0x87c
> +#define MMSYS_DEBUG_OUT_SEL           0x88c
> +#define MMSYS_MBIST_RP_RST_B          0x890
> +#define MMSYS_MBIST_RP_FAIL0          0x894
> +#define MMSYS_MBIST_RP_FAIL1          0x898
> +#define MMSYS_MBIST_RP_OK0            0x89c
> +#define MMSYS_MBIST_RP_OK1            0x8a0
> +#define MMSYS_DUMMY0                  0x8a4
> +#define MMSYS_DUMMY1                  0x8a8
> +#define MMSYS_DUMMY2                  0x8ac
> +#define MMSYS_DUMMY3                  0x8b0
> +#define DISP_DL_VALID_0               0x8b4
> +#define DISP_DL_VALID_1               0x8b8
> +#define DISP_DL_VALID_2               0x8bc
> +#define DISP_DL_READY_0               0x8c0
> +#define DISP_DL_READY_1               0x8c4
> +#define DISP_DL_READY_2               0x8C8
> +#define MDP_DL_VALID_0                0x8cc
> +#define MDP_DL_VALID_1                0x8d0
> +#define MDP_DL_READY_0                0x8d4
> +#define MDP_DL_READY_1                0x8d8
> +#define SMI_LARB0_GREQ                0x8dc
> +#define DISP_MOUT_MASK                0x8e0
> +#define DISP_MOUT_MASK1               0x8e4
> +#define MDP_MOUT_MASK                 0x8e8
> +#define MMSYS_POWER_READ              0x8ec
> +#define TOP_RELAY_FSM_RD              0x960
> +#define MDP_ASYNC_CFG_WD              0x934
> +#define MDP_ASYNC_CFG_RD              0x938
> +#define MDP_ASYNC_IPU_CFG_WD          0x93C
> +#define MDP_ASYNC_CFG_IPU_RD          0x940
> +#define MDP_ASYNC_CFG_OUT_RD          0x958
> +#define MDP_ASYNC_IPU_CFG_OUT_RD      0x95C
> +#define ISP_RELAY_CFG_WD              0x994
> +#define ISP_RELAY_CNT_RD              0x998
> +#define ISP_RELAY_CNT_LATCH_RD        0x99c
> +#define IPU_RELAY_CFG_WD              0x9a0
> +#define IPU_RELAY_CNT_RD              0x9a4
> +#define IPU_RELAY_CNT_LATCH_RD        0x9a8
> +
> +/* MASK */
> +#define MMSYS_SW0_RST_B_MASK          0xffffffff
> +#define MMSYS_SW1_RST_B_MASK          0xffffffff
> +#define MDP_COLOR_IN_SOUT_SEL_MASK    0x0000000f
> +#define DISP_COLOR_OUT_SEL_IN_MASK    0xffffffff
> +#define MDP_ASYNC_CFG_WD_MASK         0xffffffff
> +#define MDP_ASYNC_IPU_CFG_WD_MASK     0xffffffff
> +#define MMSYS_HW_DCM_DIS0_MASK        0xffffffff
> +#define MMSYS_HW_DCM_DIS1_MASK        0xffffffff
> +#define MDP_ASYNC_CFG_WD_MASK         0xffffffff
> +#define ISP_RELAY_CFG_WD_MASK         0xffffffff
> +#define IPU_RELAY_CFG_WD_MASK         0xffffffff
> +
> +#endif  // __MMSYS_CONFIG_H__
> diff --git a/drivers/media/platform/mtk-mdp3/mmsys_mutex.h b/drivers/media/platform/mtk-mdp3/mmsys_mutex.h
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

Same, I assume these register are in mutex space, so they should go in
linux/soc/mediatek/mtk-mutex.h. Use a separate patch for it.


> +#define MM_MUTEX_EN                 (0x20 + mutex_id * 0x20)
> +#define MM_MUTEX_GET                (0x24 + mutex_id * 0x20)
> +#define MM_MUTEX_RST                (0x28 + mutex_id * 0x20)
> +#define MM_MUTEX_MOD                (MM_MUTEX_MOD_OFFSET + mutex_id * 0x20)
> +#define MM_MUTEX_SOF                (MM_MUTEX_SOF_OFFSET + mutex_id * 0x20)
> +

[snip]

> +
> diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h b/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h
> new file mode 100644
> index 000000000000..19f46da487aa
> --- /dev/null
> +++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h
> @@ -0,0 +1,86 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2018 MediaTek Inc.
> + * Author: Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
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
> +       struct workqueue_struct *clock_wq;
> +       struct mdp_vpu_dev      vpu;
> +       struct mtk_scp          *scp;
> +       struct rproc            *rproc_handle;
> +       /* synchronization protect for accessing vpu working buffer info */
> +       struct mutex            vpu_lock;
> +       s32                     vpu_count;
> +       u32                     id_count;
> +       struct ida              mdp_ida;
> +       struct cmdq_client      *cmdq_clt;
> +       wait_queue_head_t       callback_wq;
> +
> +       struct v4l2_device      v4l2_dev;
> +       struct video_device     *m2m_vdev;
> +       struct v4l2_m2m_dev     *m2m_dev;
> +       /* synchronization protect for m2m device operation */
> +       struct mutex            m2m_lock;
> +       atomic_t                suspended;
> +       atomic_t                job_count;
> +};
> +
> +int mdp_vpu_get_locked(struct mdp_dev *mdp);
> +void mdp_vpu_put_locked(struct mdp_dev *mdp);
> +int mdp_vpu_register(struct mdp_dev *mdp);
> +void mdp_vpu_unregister(struct mdp_dev *mdp);
> +
> +extern int mtk_mdp_debug;
> +
> +#define DEBUG
> +#if defined(DEBUG)
> +
> +#define mdp_dbg(level, fmt, ...)\
> +       do {\
> +               if (mtk_mdp_debug >= (level))\
> +                       pr_info("[MTK-MDP3] %d %s:%d: " fmt,\
> +                               level, __func__, __LINE__, ##__VA_ARGS__);\
> +       } while (0)
> +
> +#define mdp_err(fmt, ...)\
> +       pr_err("[MTK-MDP3][ERR] %s:%d: " fmt, __func__, __LINE__,\
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

There are already functions in the kernel that allow you to enable and
disable debug messages, please use the usual dev_errr/dbg messages and
remove all this.

I stopped to review. Please try to cleanup a bit more the patchset,
try to reduce the amount of unused code that this driver has and
resend again. I'll continue the review then.

Thanks,
   Enric

[snip]
