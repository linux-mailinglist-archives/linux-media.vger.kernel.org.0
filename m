Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E36BB3FFD59
	for <lists+linux-media@lfdr.de>; Fri,  3 Sep 2021 11:42:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348920AbhICJmL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Sep 2021 05:42:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348916AbhICJmK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Sep 2021 05:42:10 -0400
Received: from lb2-smtp-cloud8.xs4all.net (lb2-smtp-cloud8.xs4all.net [IPv6:2001:888:0:108::2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B001FC061757;
        Fri,  3 Sep 2021 02:41:09 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id M5h0mN4diy7WyM5h2m9z4D; Fri, 03 Sep 2021 11:41:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1630662066; bh=5SAWFtPgjAOtPhls/YRrgq722XuKuLlWDmMJK/7RYLU=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=atJUOfFM0pe4iHgx5XhjsFmY3wOHrtoCWH81R1yPnHvRz76r1Nw73HtnPl/PRTvQl
         58NYNFw/qEkBTsxkgHDs8ndqdinmr2N0E6PwQJ3wijngn35h6hUzk914WG846MKofX
         1gNZtcwO84yYL+pkfgxplj1Bk5t02L8RIQvMsQ0bEqxo8MsGXAbTOamgOCj9/XI0Bl
         rPTLB9tNYg/0L8OiMen4HYluk2XJK/mJKJJa7INXyDgDqhvdIrA9n2OzYmbujUHXAw
         0wNO/S4k7NfVOLo0rUccu5FF90KxF81cZ6xv8C4UAVfbnJ8k2TUdmF25pOfQb82T/O
         zKZ2kEyQHeWrw==
Subject: Re: [PATCH v7 5/5] media: platform: mtk-mdp3: Add Mediatek MDP3
 driver
To:     Moudy Ho <moudy.ho@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>
Cc:     Maoguang Meng <maoguang.meng@mediatek.com>,
        daoyuan huang <daoyuan.huang@mediatek.com>,
        Ping-Hsun Wu <ping-hsun.wu@mediatek.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Landley <rob@landley.net>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org, drinkcat@chromium.org, acourbot@chromium.org,
        pihsun@chromium.org, menghui.lin@mediatek.com,
        sj.huang@mediatek.com, ben.lok@mediatek.com, randy.wu@mediatek.com,
        srv_heupstream@mediatek.com, hsinyi@google.com
References: <20210824100027.25989-1-moudy.ho@mediatek.com>
 <20210824100027.25989-6-moudy.ho@mediatek.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <a69b484a-72db-48d7-364d-11a4019e9aab@xs4all.nl>
Date:   Fri, 3 Sep 2021 11:41:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210824100027.25989-6-moudy.ho@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfIvDZkvpOndnRsIt6TgZMq6MZfIDsuW6qg0THJrujWb6LnqJj80jcxshPs40+RBm6HBpM3XJWQBB/MX5zdHRBVcBI8UqNW9UjPJjBe1l4m9KPjOr+Q1j
 CHrKgfVbz8Nwhtu1eIJZk3cgs0WK9ZIj7XJqmjmCv08rLBxuETPS+r29qtFyInyXzN85v8mgWtOvPSasPrpo7Vx4Gczx6XaFo+CiBqDn4MZRo3GNnSIJ21uH
 oa+a/aozB3GCaeZLYvFE4tMTKMXrapNI/I4w87bSjn9txjawfNIaJ5hz4KvN5RgLEdzPbmE03m+3wcans7JlCHswzERvsmbwb3ewiydQgd8VPRkAXWdePwOd
 GrWCHZ0pj/U9L4qnEOzBgH1Q5FDMfPn/D+Q/HkaIEHgrIQOvTOV7oAnLPY20gFuS2UL9o6a2tmYfoP8EJAU8sb6TvgqPqfUOMTycSWVE69dtmZ5NGgb//Inw
 wNbaBk3y1ctpHJUb8jFNR3MnZxMO+cMGBJ/BtKx/PS/QJC3SYtvZZJEVjyx4KWvBVXZIKegxhasmmxOEo+zUsOYpHdBs6rzrL/w8rdaTq3C8Ce5VyjaDwr29
 SGqB7MkE07FMl6soEULdiTCO7Gm/K/k9uXL95sG/5HXJZE2QZXhmQDGjm3WevpEsbGChUCEU6Nbwj29Aj5+MbJLmBheF0N8fIc0smK+4q/6G0IFfdMIN/zK4
 t6GtbvjfiVUekF4hEnKQ4vFK5j2xTEV/P6Ks/IpHfwMOtPTPFP+6zdCv1HLeb0N86XNM87ba6Clly8mb2MBuEkzTfsxczQFRogQa8WPe9s6c7+iTFHth4NyA
 UQvGF+LttdnZefr3uCpcfeWUv0jMGpVuAymiXw+Nuth7lf9cON1a/4YUZmkdRCC7TCk8uE6xlScdNuPXu2MEYo6bIxayECUH0ueNg7Q6gufOPBp0knuq7iiH
 sFrUyQ+zgfWuVXfR2Hx3P24u0xtQJi/hmVhnYQqH8jpAzqufl9aOqZ864brT4prVUEFFdZUadwNj1r+dvdEXHJA7HytTCEK6KbHxXzQPd4jajA2XMtdBOV2e
 fFdKzyf1Vq8H+OrJoGrXjKYEFGzeR9FQ5yNF2AieKitQ7zaoLMBJH/8pzZ/Bb4IfsGb/Jh96LyoOvHKoXjvKbyO5tWHQ8Uhf8gaZCcrcU7/Lt3WM9VQfkIeQ
 d9zOBwqRRlGfMfvEuQ0l5A==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Moudy,

Some review comments below:

On 24/08/2021 12:00, Moudy Ho wrote:
> This patch adds driver for Mediatek's Media Data Path ver.3 (MDP3).
> It provides the following functions:
>   color transform, format conversion, resize, crop, rotate, flip
>   and additional image quality enhancement.
> 
> The MDP3 driver is mainly used for Google Chromebook products to
> import the new architecture to set the HW settings as shown below:
>   User -> V4L2 framework
>     -> MDP3 driver -> SCP (setting calculations)
>       -> MDP3 driver -> CMDQ (GCE driver) -> HW
> 
> Each modules' related operation control is sited in mtk-mdp3-comp.c
> Each modules' register table is defined in file with "mdp_reg_" prefix
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
>    [1] https://patchwork.kernel.org/project/linux-mediatek/patch/20190906115513.159705-9-acourbot@chromium.org/
>    [2] https://patchwork.kernel.org/project/linux-mediatek/patch/20190906115513.159705-10-acourbot@chromium.org/

Just add these two patches in this patch series. It's easier to merge if they
are included in this series.

> ---
>  drivers/media/platform/Kconfig                |   19 +
>  drivers/media/platform/Makefile               |    2 +
>  drivers/media/platform/mtk-mdp3/Makefile      |    6 +
>  .../media/platform/mtk-mdp3/mdp_reg_ccorr.h   |   19 +
>  drivers/media/platform/mtk-mdp3/mdp_reg_isp.h |   27 +
>  .../media/platform/mtk-mdp3/mdp_reg_rdma.h    |   65 +
>  drivers/media/platform/mtk-mdp3/mdp_reg_rsz.h |   39 +
>  .../media/platform/mtk-mdp3/mdp_reg_wdma.h    |   47 +
>  .../media/platform/mtk-mdp3/mdp_reg_wrot.h    |   55 +
>  drivers/media/platform/mtk-mdp3/mtk-img-ipi.h |  280 ++++
>  .../media/platform/mtk-mdp3/mtk-mdp3-cmdq.c   |  507 +++++++
>  .../media/platform/mtk-mdp3/mtk-mdp3-cmdq.h   |   46 +
>  .../media/platform/mtk-mdp3/mtk-mdp3-comp.c   | 1307 +++++++++++++++++
>  .../media/platform/mtk-mdp3/mtk-mdp3-comp.h   |  147 ++
>  .../media/platform/mtk-mdp3/mtk-mdp3-core.c   |  329 +++++
>  .../media/platform/mtk-mdp3/mtk-mdp3-core.h   |   75 +
>  .../media/platform/mtk-mdp3/mtk-mdp3-m2m.c    |  801 ++++++++++
>  .../media/platform/mtk-mdp3/mtk-mdp3-m2m.h    |   41 +
>  .../media/platform/mtk-mdp3/mtk-mdp3-regs.c   |  746 ++++++++++
>  .../media/platform/mtk-mdp3/mtk-mdp3-regs.h   |  372 +++++
>  .../media/platform/mtk-mdp3/mtk-mdp3-vpu.c    |  312 ++++
>  .../media/platform/mtk-mdp3/mtk-mdp3-vpu.h    |   78 +
>  22 files changed, 5320 insertions(+)
>  create mode 100644 drivers/media/platform/mtk-mdp3/Makefile
>  create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_ccorr.h
>  create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_isp.h
>  create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_rdma.h
>  create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_rsz.h
>  create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_wdma.h
>  create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_wrot.h
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
> diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
> index 157c924686e4..b7f331dbe1b5 100644
> --- a/drivers/media/platform/Kconfig
> +++ b/drivers/media/platform/Kconfig
> @@ -299,6 +299,25 @@ config VIDEO_MEDIATEK_MDP
>  	    To compile this driver as a module, choose M here: the
>  	    module will be called mtk-mdp.
>  
> +config VIDEO_MEDIATEK_MDP3
> +	tristate "Mediatek MDP v3 driver"
> +	depends on MTK_IOMMU
> +	depends on VIDEO_DEV && VIDEO_V4L2
> +	depends on ARCH_MEDIATEK || COMPILE_TEST
> +	depends on HAS_DMA
> +	select VIDEOBUF2_DMA_CONTIG
> +	select V4L2_MEM2MEM_DEV
> +	select VIDEO_MEDIATEK_VPU
> +	select MTK_CMDQ
> +	select MTK_SCP
> +	default n
> +	help
> +	    It is a v4l2 driver and present in Mediatek MT8183 SoC.
> +	    The driver supports for scaling and color space conversion.
> +
> +	    To compile this driver as a module, choose M here: the
> +	    module will be called mtk-mdp3.
> +
>  config VIDEO_MEDIATEK_VCODEC
>  	tristate "Mediatek Video Codec driver"
>  	depends on MTK_IOMMU || COMPILE_TEST
> diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/Makefile
> index 73ce083c2fc6..5e10a38ae5ca 100644
> --- a/drivers/media/platform/Makefile
> +++ b/drivers/media/platform/Makefile
> @@ -77,6 +77,8 @@ obj-$(CONFIG_VIDEO_MEDIATEK_VCODEC)	+= mtk-vcodec/
>  
>  obj-$(CONFIG_VIDEO_MEDIATEK_MDP)	+= mtk-mdp/
>  
> +obj-$(CONFIG_VIDEO_MEDIATEK_MDP3)	+= mtk-mdp3/
> +
>  obj-$(CONFIG_VIDEO_MEDIATEK_JPEG)	+= mtk-jpeg/
>  
>  obj-$(CONFIG_VIDEO_QCOM_CAMSS)		+= qcom/camss/
> diff --git a/drivers/media/platform/mtk-mdp3/Makefile b/drivers/media/platform/mtk-mdp3/Makefile
> new file mode 100644
> index 000000000000..8772f5ac2867
> --- /dev/null
> +++ b/drivers/media/platform/mtk-mdp3/Makefile
> @@ -0,0 +1,6 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +mtk-mdp3-y += mtk-mdp3-core.o mtk-mdp3-vpu.o mtk-mdp3-regs.o
> +mtk-mdp3-y += mtk-mdp3-m2m.o
> +mtk-mdp3-y += mtk-mdp3-comp.o mtk-mdp3-cmdq.o
> +
> +obj-$(CONFIG_VIDEO_MEDIATEK_MDP3) += mtk-mdp3.o
> \ No newline at end of file
> diff --git a/drivers/media/platform/mtk-mdp3/mdp_reg_ccorr.h b/drivers/media/platform/mtk-mdp3/mdp_reg_ccorr.h
> new file mode 100644
> index 000000000000..46804d97db1f
> --- /dev/null
> +++ b/drivers/media/platform/mtk-mdp3/mdp_reg_ccorr.h
> @@ -0,0 +1,19 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2021 MediaTek Inc.
> + * Author: Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
> + */
> +
> +#ifndef __MDP_REG_CCORR_H__
> +#define __MDP_REG_CCORR_H__
> +
> +#define MDP_CCORR_EN                0x000
> +#define MDP_CCORR_CFG               0x020
> +#define MDP_CCORR_SIZE              0x030
> +
> +/* MASK */
> +#define MDP_CCORR_EN_MASK           0x00000001
> +#define MDP_CCORR_CFG_MASK          0x70001317
> +#define MDP_CCORR_SIZE_MASK         0x1fff1fff
> +
> +#endif  // __MDP_REG_CCORR_H__
> diff --git a/drivers/media/platform/mtk-mdp3/mdp_reg_isp.h b/drivers/media/platform/mtk-mdp3/mdp_reg_isp.h
> new file mode 100644
> index 000000000000..5334cd932b55
> --- /dev/null
> +++ b/drivers/media/platform/mtk-mdp3/mdp_reg_isp.h
> @@ -0,0 +1,27 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2021 MediaTek Inc.
> + * Author: Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
> + */
> +
> +#ifndef __ISP_REG_H__
> +#define __ISP_REG_H__
> +
> +enum isp_dip_cq {
> +	ISP_DRV_DIP_CQ_THRE0 = 0,
> +	ISP_DRV_DIP_CQ_THRE1,
> +	ISP_DRV_DIP_CQ_THRE2,
> +	ISP_DRV_DIP_CQ_THRE3,
> +	ISP_DRV_DIP_CQ_THRE4,
> +	ISP_DRV_DIP_CQ_THRE5,
> +	ISP_DRV_DIP_CQ_THRE6,
> +	ISP_DRV_DIP_CQ_THRE7,
> +	ISP_DRV_DIP_CQ_THRE8,
> +	ISP_DRV_DIP_CQ_THRE9,
> +	ISP_DRV_DIP_CQ_THRE10,
> +	ISP_DRV_DIP_CQ_THRE11,
> +	ISP_DRV_DIP_CQ_NUM,
> +	ISP_DRV_DIP_CQ_NONE,
> +};
> +
> +#endif  // __ISP_REG_H__
> diff --git a/drivers/media/platform/mtk-mdp3/mdp_reg_rdma.h b/drivers/media/platform/mtk-mdp3/mdp_reg_rdma.h
> new file mode 100644
> index 000000000000..59d9aae40be6
> --- /dev/null
> +++ b/drivers/media/platform/mtk-mdp3/mdp_reg_rdma.h
> @@ -0,0 +1,65 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2021 MediaTek Inc.
> + * Author: Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
> + */
> +
> +#ifndef __MDP_REG_RDMA_H__
> +#define __MDP_REG_RDMA_H__
> +
> +#define MDP_RDMA_EN                     0x000
> +#define MDP_RDMA_RESET                  0x008
> +#define MDP_RDMA_CON                    0x020
> +#define MDP_RDMA_GMCIF_CON              0x028
> +#define MDP_RDMA_SRC_CON                0x030
> +#define MDP_RDMA_MF_BKGD_SIZE_IN_BYTE   0x060
> +#define MDP_RDMA_MF_BKGD_SIZE_IN_PXL    0x068
> +#define MDP_RDMA_MF_SRC_SIZE            0x070
> +#define MDP_RDMA_MF_CLIP_SIZE           0x078
> +#define MDP_RDMA_MF_OFFSET_1            0x080
> +#define MDP_RDMA_SF_BKGD_SIZE_IN_BYTE   0x090
> +#define MDP_RDMA_SRC_END_0              0x100
> +#define MDP_RDMA_SRC_END_1              0x108
> +#define MDP_RDMA_SRC_END_2              0x110
> +#define MDP_RDMA_SRC_OFFSET_0           0x118
> +#define MDP_RDMA_SRC_OFFSET_1           0x120
> +#define MDP_RDMA_SRC_OFFSET_2           0x128
> +#define MDP_RDMA_SRC_OFFSET_0_P         0x148
> +#define MDP_RDMA_TRANSFORM_0            0x200
> +#define MDP_RDMA_RESV_DUMMY_0           0x2a0
> +#define MDP_RDMA_MON_STA_1              0x408
> +#define MDP_RDMA_SRC_BASE_0             0xf00
> +#define MDP_RDMA_SRC_BASE_1             0xf08
> +#define MDP_RDMA_SRC_BASE_2             0xf10
> +#define MDP_RDMA_UFO_DEC_LENGTH_BASE_Y  0xf20
> +#define MDP_RDMA_UFO_DEC_LENGTH_BASE_C  0xf28
> +
> +/* MASK */
> +#define MDP_RDMA_EN_MASK                    0x00000001
> +#define MDP_RDMA_RESET_MASK                 0x00000001
> +#define MDP_RDMA_CON_MASK                   0x00001110
> +#define MDP_RDMA_GMCIF_CON_MASK             0xfffb3771
> +#define MDP_RDMA_SRC_CON_MASK               0xf3ffffff
> +#define MDP_RDMA_MF_BKGD_SIZE_IN_BYTE_MASK  0x001fffff
> +#define MDP_RDMA_MF_BKGD_SIZE_IN_PXL_MASK   0x001fffff
> +#define MDP_RDMA_MF_SRC_SIZE_MASK           0x1fff1fff
> +#define MDP_RDMA_MF_CLIP_SIZE_MASK          0x1fff1fff
> +#define MDP_RDMA_MF_OFFSET_1_MASK           0x003f001f
> +#define MDP_RDMA_SF_BKGD_SIZE_IN_BYTE_MASK  0x001fffff
> +#define MDP_RDMA_SRC_END_0_MASK             0xffffffff
> +#define MDP_RDMA_SRC_END_1_MASK             0xffffffff
> +#define MDP_RDMA_SRC_END_2_MASK             0xffffffff
> +#define MDP_RDMA_SRC_OFFSET_0_MASK          0xffffffff
> +#define MDP_RDMA_SRC_OFFSET_1_MASK          0xffffffff
> +#define MDP_RDMA_SRC_OFFSET_2_MASK          0xffffffff
> +#define MDP_RDMA_SRC_OFFSET_0_P_MASK        0xffffffff
> +#define MDP_RDMA_TRANSFORM_0_MASK           0xff110777
> +#define MDP_RDMA_RESV_DUMMY_0_MASK          0xffffffff
> +#define MDP_RDMA_MON_STA_1_MASK             0xffffffff
> +#define MDP_RDMA_SRC_BASE_0_MASK            0xffffffff
> +#define MDP_RDMA_SRC_BASE_1_MASK            0xffffffff
> +#define MDP_RDMA_SRC_BASE_2_MASK            0xffffffff
> +#define MDP_RDMA_UFO_DEC_LENGTH_BASE_Y_MASK 0xffffffff
> +#define MDP_RDMA_UFO_DEC_LENGTH_BASE_C_MASK 0xffffffff
> +
> +#endif  // __MDP_REG_RDMA_H__
> diff --git a/drivers/media/platform/mtk-mdp3/mdp_reg_rsz.h b/drivers/media/platform/mtk-mdp3/mdp_reg_rsz.h
> new file mode 100644
> index 000000000000..051fdb020741
> --- /dev/null
> +++ b/drivers/media/platform/mtk-mdp3/mdp_reg_rsz.h
> @@ -0,0 +1,39 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2021 MediaTek Inc.
> + * Author: Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
> + */
> +
> +#ifndef __MDP_REG_RSZ_H__
> +#define __MDP_REG_RSZ_H__
> +
> +#define PRZ_ENABLE                                        0x000
> +#define PRZ_CONTROL_1                                     0x004
> +#define PRZ_CONTROL_2                                     0x008
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
> +
> +/* MASK */
> +#define PRZ_ENABLE_MASK                                   0x00010001
> +#define PRZ_CONTROL_1_MASK                                0xfffffff3
> +#define PRZ_CONTROL_2_MASK                                0x0ffffaff
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
> +
> +#endif // __MDP_REG_RSZ_H__
> diff --git a/drivers/media/platform/mtk-mdp3/mdp_reg_wdma.h b/drivers/media/platform/mtk-mdp3/mdp_reg_wdma.h
> new file mode 100644
> index 000000000000..4dc540f1fb5f
> --- /dev/null
> +++ b/drivers/media/platform/mtk-mdp3/mdp_reg_wdma.h
> @@ -0,0 +1,47 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2021 MediaTek Inc.
> + * Author: Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
> + */
> +
> +#ifndef __MDP_REG_WDMA_H__
> +#define __MDP_REG_WDMA_H__
> +
> +#define WDMA_EN                 0x008
> +#define WDMA_RST                0x00c
> +#define WDMA_CFG                0x014
> +#define WDMA_SRC_SIZE           0x018
> +#define WDMA_CLIP_SIZE          0x01c
> +#define WDMA_CLIP_COORD         0x020
> +#define WDMA_DST_W_IN_BYTE      0x028
> +#define WDMA_ALPHA              0x02c
> +#define WDMA_BUF_CON2           0x03c
> +#define WDMA_DST_UV_PITCH       0x078
> +#define WDMA_DST_ADDR_OFFSET    0x080
> +#define WDMA_DST_U_ADDR_OFFSET  0x084
> +#define WDMA_DST_V_ADDR_OFFSET  0x088
> +#define WDMA_FLOW_CTRL_DBG      0x0a0
> +#define WDMA_DST_ADDR           0xf00
> +#define WDMA_DST_U_ADDR         0xf04
> +#define WDMA_DST_V_ADDR         0xf08
> +
> +/* MASK */
> +#define WDMA_EN_MASK                0x00000001
> +#define WDMA_RST_MASK               0x00000001
> +#define WDMA_CFG_MASK               0xff03bff0
> +#define WDMA_SRC_SIZE_MASK          0x3fff3fff
> +#define WDMA_CLIP_SIZE_MASK         0x3fff3fff
> +#define WDMA_CLIP_COORD_MASK        0x3fff3fff
> +#define WDMA_DST_W_IN_BYTE_MASK     0x0000ffff
> +#define WDMA_ALPHA_MASK             0x800000ff
> +#define WDMA_BUF_CON2_MASK          0xffffffff
> +#define WDMA_DST_UV_PITCH_MASK      0x0000ffff
> +#define WDMA_DST_ADDR_OFFSET_MASK   0x0fffffff
> +#define WDMA_DST_U_ADDR_OFFSET_MASK 0x0fffffff
> +#define WDMA_DST_V_ADDR_OFFSET_MASK 0x0fffffff
> +#define WDMA_FLOW_CTRL_DBG_MASK     0x0000f3ff
> +#define WDMA_DST_ADDR_MASK          0xffffffff
> +#define WDMA_DST_U_ADDR_MASK        0xffffffff
> +#define WDMA_DST_V_ADDR_MASK        0xffffffff
> +
> +#endif  // __MDP_REG_WDMA_H__
> diff --git a/drivers/media/platform/mtk-mdp3/mdp_reg_wrot.h b/drivers/media/platform/mtk-mdp3/mdp_reg_wrot.h
> new file mode 100644
> index 000000000000..39b8785f89eb
> --- /dev/null
> +++ b/drivers/media/platform/mtk-mdp3/mdp_reg_wrot.h
> @@ -0,0 +1,55 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2021 MediaTek Inc.
> + * Author: Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
> + */
> +
> +#ifndef __MDP_REG_WROT_H__
> +#define __MDP_REG_WROT_H__
> +
> +#define VIDO_CTRL                   0x000
> +#define VIDO_MAIN_BUF_SIZE          0x008
> +#define VIDO_SOFT_RST               0x010
> +#define VIDO_SOFT_RST_STAT          0x014
> +#define VIDO_CROP_OFST              0x020
> +#define VIDO_TAR_SIZE               0x024
> +#define VIDO_OFST_ADDR              0x02c
> +#define VIDO_STRIDE                 0x030
> +#define VIDO_OFST_ADDR_C            0x038
> +#define VIDO_STRIDE_C               0x03c
> +#define VIDO_DITHER                 0x054
> +#define VIDO_STRIDE_V               0x06c
> +#define VIDO_OFST_ADDR_V            0x068
> +#define VIDO_RSV_1                  0x070
> +#define VIDO_IN_SIZE                0x078
> +#define VIDO_ROT_EN                 0x07c
> +#define VIDO_FIFO_TEST              0x080
> +#define VIDO_MAT_CTRL               0x084
> +#define VIDO_BASE_ADDR              0xf00
> +#define VIDO_BASE_ADDR_C            0xf04
> +#define VIDO_BASE_ADDR_V            0xf08
> +
> +/* MASK */
> +#define VIDO_CTRL_MASK                  0xf530711f
> +#define VIDO_MAIN_BUF_SIZE_MASK         0x1fff7f77
> +#define VIDO_SOFT_RST_MASK              0x00000001
> +#define VIDO_SOFT_RST_STAT_MASK         0x00000001
> +#define VIDO_TAR_SIZE_MASK              0x1fff1fff
> +#define VIDO_CROP_OFST_MASK             0x1fff1fff
> +#define VIDO_OFST_ADDR_MASK             0x0fffffff
> +#define VIDO_STRIDE_MASK                0x0000ffff
> +#define VIDO_OFST_ADDR_C_MASK           0x0fffffff
> +#define VIDO_STRIDE_C_MASK              0x0000ffff
> +#define VIDO_DITHER_MASK                0xff000001
> +#define VIDO_STRIDE_V_MASK              0x0000ffff
> +#define VIDO_OFST_ADDR_V_MASK           0x0fffffff
> +#define VIDO_RSV_1_MASK                 0xffffffff
> +#define VIDO_IN_SIZE_MASK               0x1fff1fff
> +#define VIDO_ROT_EN_MASK                0x00000001
> +#define VIDO_FIFO_TEST_MASK             0x00000fff
> +#define VIDO_MAT_CTRL_MASK              0x000000f3
> +#define VIDO_BASE_ADDR_MASK             0xffffffff
> +#define VIDO_BASE_ADDR_C_MASK           0xffffffff
> +#define VIDO_BASE_ADDR_V_MASK           0xffffffff
> +
> +#endif  // __MDP_REG_WROT_H__
> diff --git a/drivers/media/platform/mtk-mdp3/mtk-img-ipi.h b/drivers/media/platform/mtk-mdp3/mtk-img-ipi.h
> new file mode 100644
> index 000000000000..f8560dad87da
> --- /dev/null
> +++ b/drivers/media/platform/mtk-mdp3/mtk-img-ipi.h
> @@ -0,0 +1,280 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2021 MediaTek Inc.
> + * Author: Holmes Chiou <holmes.chiou@mediatek.com>
> + *         Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
> + */
> +
> +#ifndef __MTK_IMG_IPI_H__
> +#define __MTK_IMG_IPI_H__
> +
> +#include <linux/types.h>
> +
> +/* ISP-MDP generic input information */
> +
> +#define IMG_MAX_HW_INPUTS	3
> +
> +#define IMG_MAX_HW_OUTPUTS	4
> +
> +#define IMG_MAX_PLANES		3
> +
> +#define IMG_IPI_INIT    1
> +#define IMG_IPI_DEINIT  2
> +#define IMG_IPI_FRAME   3
> +#define IMG_IPI_DEBUG   4
> +
> +struct img_addr {
> +	u64 va; /* Used for Linux OS access */
> +	u32 pa; /* Used for CM4 access */
> +	u32 iova; /* Used for IOMMU HW access */
> +} __packed;
> +
> +struct tuning_addr {
> +	u64	present;
> +	u32	pa;	/* Used for CM4 access */
> +	u32	iova;	/* Used for IOMMU HW access */
> +} __packed;
> +
> +struct img_sw_addr {
> +	u64 va; /* Used for APMCU access */
> +	u32 pa; /* Used for CM4 access */
> +} __packed;
> +
> +struct img_plane_format {
> +	u32 size;
> +	u16 stride;
> +} __packed;
> +
> +struct img_pix_format {
> +	u16 width;
> +	u16 height;
> +	u32 colorformat; /* enum mdp_color */
> +	u16 ycbcr_prof; /* enum mdp_ycbcr_profile */
> +	struct img_plane_format plane_fmt[IMG_MAX_PLANES];
> +} __packed;
> +
> +struct img_image_buffer {
> +	struct img_pix_format format;
> +	u32 iova[IMG_MAX_PLANES];
> +	/* enum mdp_buffer_usage, FD or advanced ISP usages */
> +	u32 usage;
> +} __packed;
> +
> +#define IMG_SUBPIXEL_SHIFT	20
> +
> +struct img_crop {
> +	s16 left;
> +	s16 top;
> +	u16 width;
> +	u16 height;
> +	u32 left_subpix;
> +	u32 top_subpix;
> +	u32 width_subpix;
> +	u32 height_subpix;
> +} __packed;
> +
> +#define IMG_CTRL_FLAG_HFLIP	BIT(0)
> +#define IMG_CTRL_FLAG_DITHER	BIT(1)
> +#define IMG_CTRL_FLAG_SHARPNESS	BIT(4)
> +#define IMG_CTRL_FLAG_HDR	BIT(5)
> +#define IMG_CTRL_FLAG_DRE	BIT(6)
> +
> +struct img_input {
> +	struct img_image_buffer buffer;
> +	u16 flags; /* HDR, DRE, dither */
> +} __packed;
> +
> +struct img_output {
> +	struct img_image_buffer buffer;
> +	struct img_crop crop;
> +	s16 rotation;
> +	u16 flags; /* H-flip, sharpness, dither */
> +} __packed;
> +
> +struct img_ipi_frameparam {
> +	u32 index;
> +	u32 frame_no;
> +	u64 timestamp;
> +	u8 type; /* enum mdp_stream_type */
> +	u8 state;
> +	u8 num_inputs;
> +	u8 num_outputs;
> +	u64 drv_data;
> +	struct img_input inputs[IMG_MAX_HW_INPUTS];
> +	struct img_output outputs[IMG_MAX_HW_OUTPUTS];
> +	struct tuning_addr tuning_data;
> +	struct img_addr subfrm_data;
> +	struct img_sw_addr config_data;
> +	struct img_sw_addr self_data;
> +} __packed;
> +
> +struct img_sw_buffer {
> +	u64	handle;		/* Used for APMCU access */
> +	u32	scp_addr;	/* Used for CM4 access */
> +} __packed;
> +
> +struct img_ipi_param {
> +	u8 usage;
> +	struct img_sw_buffer frm_param;
> +} __packed;
> +
> +struct img_frameparam {
> +	struct list_head list_entry;
> +	struct img_ipi_frameparam frameparam;
> +};
> +
> +/* ISP-MDP generic output information */
> +
> +struct img_comp_frame {
> +	u32 output_disable:1;
> +	u32 bypass:1;
> +	u16 in_width;
> +	u16 in_height;
> +	u16 out_width;
> +	u16 out_height;
> +	struct img_crop crop;
> +	u16 in_total_width;
> +	u16 out_total_width;
> +} __packed;
> +
> +struct img_region {
> +	s16 left;
> +	s16 right;
> +	s16 top;
> +	s16 bottom;
> +} __packed;
> +
> +struct img_offset {
> +	s16 left;
> +	s16 top;
> +	u32 left_subpix;
> +	u32 top_subpix;
> +} __packed;
> +
> +struct img_comp_subfrm {
> +	u32 tile_disable:1;
> +	struct img_region in;
> +	struct img_region out;
> +	struct img_offset luma;
> +	struct img_offset chroma;
> +	s16 out_vertical; /* Output vertical index */
> +	s16 out_horizontal; /* Output horizontal index */
> +} __packed;
> +
> +#define IMG_MAX_SUBFRAMES	14
> +
> +struct mdp_rdma_subfrm {
> +	u32 offset[IMG_MAX_PLANES];
> +	u32 offset_0_p;
> +	u32 src;
> +	u32 clip;
> +	u32 clip_ofst;
> +} __packed;
> +
> +struct mdp_rdma_data {
> +	u32 src_ctrl;
> +	u32 control;
> +	u32 iova[IMG_MAX_PLANES];
> +	u32 iova_end[IMG_MAX_PLANES];
> +	u32 mf_bkgd;
> +	u32 mf_bkgd_in_pxl;
> +	u32 sf_bkgd;
> +	u32 ufo_dec_y;
> +	u32 ufo_dec_c;
> +	u32 transform;
> +	struct mdp_rdma_subfrm subfrms[IMG_MAX_SUBFRAMES];
> +} __packed;
> +
> +struct mdp_rsz_subfrm {
> +	u32 control2;
> +	u32 src;
> +	u32 clip;
> +} __packed;
> +
> +struct mdp_rsz_data {
> +	u32 coeff_step_x;
> +	u32 coeff_step_y;
> +	u32 control1;
> +	u32 control2;
> +	struct mdp_rsz_subfrm subfrms[IMG_MAX_SUBFRAMES];
> +} __packed;
> +
> +struct mdp_wrot_subfrm {
> +	u32 offset[IMG_MAX_PLANES];
> +	u32 src;
> +	u32 clip;
> +	u32 clip_ofst;
> +	u32 main_buf;
> +} __packed;
> +
> +struct mdp_wrot_data {
> +	u32 iova[IMG_MAX_PLANES];
> +	u32 control;
> +	u32 stride[IMG_MAX_PLANES];
> +	u32 mat_ctrl;
> +	u32 fifo_test;
> +	u32 filter;
> +	struct mdp_wrot_subfrm subfrms[IMG_MAX_SUBFRAMES];
> +} __packed;
> +
> +struct mdp_wdma_subfrm {
> +	u32 offset[IMG_MAX_PLANES];
> +	u32 src;
> +	u32 clip;
> +	u32 clip_ofst;
> +} __packed;
> +
> +struct mdp_wdma_data {
> +	u32 wdma_cfg;
> +	u32 iova[IMG_MAX_PLANES];
> +	u32 w_in_byte;
> +	u32 uv_stride;
> +	struct mdp_wdma_subfrm subfrms[IMG_MAX_SUBFRAMES];
> +} __packed;
> +
> +struct isp_data {
> +	u64 dl_flags; /* 1 << (enum mdp_comp_type) */
> +	u32 smxi_iova[4];
> +	u32 cq_idx;
> +	u32 cq_iova;
> +	u32 tpipe_iova[IMG_MAX_SUBFRAMES];
> +} __packed;
> +
> +struct img_compparam {
> +	u16 type; /* enum mdp_comp_type */
> +	u16 id; /* enum mtk_mdp_comp_id */
> +	u32 input;
> +	u32 outputs[IMG_MAX_HW_OUTPUTS];
> +	u32 num_outputs;
> +	struct img_comp_frame frame;
> +	struct img_comp_subfrm subfrms[IMG_MAX_SUBFRAMES];
> +	u32 num_subfrms;
> +	union {
> +		struct mdp_rdma_data rdma;
> +		struct mdp_rsz_data rsz;
> +		struct mdp_wrot_data wrot;
> +		struct mdp_wdma_data wdma;
> +		struct isp_data isp;
> +	};
> +} __packed;
> +
> +#define IMG_MAX_COMPONENTS	20
> +
> +struct img_mux {
> +	u32 reg;
> +	u32 value;
> +};
> +
> +struct img_mmsys_ctrl {
> +	struct img_mux sets[IMG_MAX_COMPONENTS * 2];
> +	u32 num_sets;
> +};
> +
> +struct img_config {
> +	struct img_compparam components[IMG_MAX_COMPONENTS];
> +	u32 num_components;
> +	struct img_mmsys_ctrl ctrls[IMG_MAX_SUBFRAMES];
> +	u32 num_subfrms;
> +} __packed;
> +
> +#endif  /* __MTK_IMG_IPI_H__ */
> diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c b/drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c
> new file mode 100644
> index 000000000000..1636b60251ce
> --- /dev/null
> +++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c
> @@ -0,0 +1,507 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2021 MediaTek Inc.
> + * Author: Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
> + */
> +
> +#include <linux/platform_device.h>
> +#include "mtk-mdp3-cmdq.h"
> +#include "mtk-mdp3-comp.h"
> +#include "mtk-mdp3-core.h"
> +#include "mtk-mdp3-m2m.h"
> +
> +#define MDP_PATH_MAX_COMPS	IMG_MAX_COMPONENTS
> +
> +struct mdp_path {
> +	struct mdp_dev		*mdp_dev;
> +	struct mdp_comp_ctx	comps[MDP_PATH_MAX_COMPS];
> +	u32			num_comps;
> +	const struct img_config	*config;
> +	const struct img_ipi_frameparam *param;
> +	const struct v4l2_rect	*composes[IMG_MAX_HW_OUTPUTS];
> +	struct v4l2_rect	bounds[IMG_MAX_HW_OUTPUTS];
> +};
> +
> +#define has_op(ctx, op) \
> +	((ctx)->comp->ops && (ctx)->comp->ops->op)
> +#define call_op(ctx, op, ...) \
> +	(has_op(ctx, op) ? (ctx)->comp->ops->op(ctx, ##__VA_ARGS__) : 0)
> +
> +struct mdp_path_subfrm {
> +	s32	mutex_id;
> +	u32	mutex_mod;
> +	s32	sofs[MDP_PATH_MAX_COMPS];
> +	u32	num_sofs;
> +};
> +
> +static bool is_output_disable(const struct img_compparam *param, u32 count)
> +{
> +	return (count < param->num_subfrms) ?
> +		(param->frame.output_disable ||
> +		param->subfrms[count].tile_disable) :
> +		true;
> +}
> +
> +static int mdp_path_subfrm_require(struct mdp_path_subfrm *subfrm,
> +				   const struct mdp_path *path,
> +				   struct mmsys_cmdq_cmd *cmd, u32 count)
> +{
> +	const struct img_config *config = path->config;
> +	const struct mdp_comp_ctx *ctx;
> +	struct device *dev = &path->mdp_dev->pdev->dev;
> +	struct mtk_mutex **mutex = path->mdp_dev->mdp_mutex;
> +	s32 mutex_id = -1;
> +	int index;
> +
> +	/* Default value */
> +	memset(subfrm, 0, sizeof(*subfrm));
> +
> +	for (index = 0; index < config->num_components; index++) {
> +		ctx = &path->comps[index];
> +		if (is_output_disable(ctx->param, count))
> +			continue;
> +		switch (ctx->comp->id) {
> +		/**********************************************
> +		 * Name            MSB LSB
> +		 * DISP_MUTEX_MOD   23   0
> +		 *
> +		 * Specifies which modules are in this mutex.
> +		 * Every bit denotes a module. Bit definition:
> +		 *  2 mdp_rdma0
> +		 *  4 mdp_rsz0
> +		 *  5 mdp_rsz1
> +		 *  6 mdp_tdshp
> +		 *  7 mdp_wrot0
> +		 *  8 mdp_wdma
> +		 *  13 mdp_color
> +		 *  23 mdp_aal
> +		 *  24 mdp_ccorr
> +		 **********************************************/
> +		case MDP_COMP_AAL0:
> +			subfrm->mutex_mod |= 1 << 23;
> +			break;
> +		case MDP_COMP_CCORR0:
> +			subfrm->mutex_mod |= 1 << 24;
> +			break;
> +		case MDP_COMP_WDMA:
> +			subfrm->mutex_mod |= 1 << 8;
> +			subfrm->sofs[subfrm->num_sofs++] = MDP_COMP_WDMA;
> +			break;
> +		case MDP_COMP_WROT0:
> +			subfrm->mutex_mod |= 1 << 7;
> +			subfrm->sofs[subfrm->num_sofs++] = MDP_COMP_WROT0;
> +			break;
> +		case MDP_COMP_TDSHP0:
> +			subfrm->mutex_mod |= 1 << 6;
> +			subfrm->sofs[subfrm->num_sofs++] = MDP_COMP_TDSHP0;
> +			break;
> +		case MDP_COMP_RSZ1:
> +			subfrm->mutex_mod |= 1 << 5;
> +			subfrm->sofs[subfrm->num_sofs++] = MDP_COMP_RSZ1;
> +			break;
> +		case MDP_COMP_RSZ0:
> +			subfrm->mutex_mod |= 1 << 4;
> +			subfrm->sofs[subfrm->num_sofs++] = MDP_COMP_RSZ0;
> +			break;
> +		case MDP_COMP_RDMA0:
> +			mutex_id = MDP_PIPE_RDMA0;
> +			subfrm->mutex_mod |= 1 << 2;
> +			subfrm->sofs[subfrm->num_sofs++] = MDP_COMP_RDMA0;
> +			break;
> +		case MDP_COMP_ISP_IMGI:
> +			mutex_id = MDP_PIPE_IMGI;
> +			break;
> +		case MDP_COMP_WPEI:
> +			mutex_id = MDP_PIPE_WPEI;
> +			break;
> +		case MDP_COMP_WPEI2:
> +			mutex_id = MDP_PIPE_WPEI2;
> +			break;
> +		default:
> +			break;
> +		}
> +	}
> +
> +	subfrm->mutex_id = mutex_id;
> +	if (-1 == mutex_id) {
> +		dev_err(dev, "No mutex assigned");
> +		return -EINVAL;
> +	}
> +
> +	/* Set mutex modules */
> +	if (subfrm->mutex_mod)
> +		mtk_mutex_add_mdp_mod(mutex[mutex_id], subfrm->mutex_mod, cmd);
> +
> +	return 0;
> +}
> +
> +static int mdp_path_subfrm_run(const struct mdp_path_subfrm *subfrm,
> +			       const struct mdp_path *path,
> +			       struct mmsys_cmdq_cmd *cmd)
> +{
> +	struct device *dev = &path->mdp_dev->pdev->dev;
> +	struct mtk_mutex **mutex = path->mdp_dev->mdp_mutex;
> +	s32 mutex_id = subfrm->mutex_id;
> +
> +	if (-1 == mutex_id) {
> +		dev_err(dev, "Incorrect mutex id");
> +		return -EINVAL;
> +	}
> +
> +	if (subfrm->mutex_mod) {
> +		int index;
> +
> +		/* Wait WROT SRAM shared to DISP RDMA */
> +		/* Clear SOF event for each engine */
> +		for (index = 0; index < subfrm->num_sofs; index++) {
> +			switch (subfrm->sofs[index]) {
> +			case MDP_COMP_RDMA0:
> +				MM_REG_CLEAR(cmd, RDMA0_SOF);
> +				break;
> +			case MDP_COMP_TDSHP0:
> +				MM_REG_CLEAR(cmd, TDSHP0_SOF);
> +				break;
> +			case MDP_COMP_RSZ0:
> +				MM_REG_CLEAR(cmd, RSZ0_SOF);
> +				break;
> +			case MDP_COMP_RSZ1:
> +				MM_REG_CLEAR(cmd, RSZ1_SOF);
> +				break;
> +			case MDP_COMP_WDMA:
> +				MM_REG_CLEAR(cmd, WDMA0_SOF);
> +				break;
> +			case MDP_COMP_WROT0:
> +				MM_REG_CLEAR(cmd, WROT0_SOF);
> +				break;
> +			default:
> +				break;
> +			}
> +		}
> +
> +		/* Enable the mutex */
> +		mtk_mutex_enable_by_cmdq(mutex[mutex_id], cmd);
> +
> +		/* Wait SOF events and clear mutex modules (optional) */
> +		for (index = 0; index < subfrm->num_sofs; index++) {
> +			switch (subfrm->sofs[index]) {
> +			case MDP_COMP_RDMA0:
> +				MM_REG_WAIT(cmd, RDMA0_SOF);
> +				break;
> +			case MDP_COMP_TDSHP0:
> +				MM_REG_WAIT(cmd, TDSHP0_SOF);
> +				break;
> +			case MDP_COMP_RSZ0:
> +				MM_REG_WAIT(cmd, RSZ0_SOF);
> +				break;
> +			case MDP_COMP_RSZ1:
> +				MM_REG_WAIT(cmd, RSZ1_SOF);
> +				break;
> +			case MDP_COMP_WDMA:
> +				MM_REG_WAIT(cmd, WDMA0_SOF);
> +				break;
> +			case MDP_COMP_WROT0:
> +				MM_REG_WAIT(cmd, WROT0_SOF);
> +				break;
> +			default:
> +				break;
> +			}
> +		}
> +	}
> +	return 0;
> +}
> +
> +static int mdp_path_ctx_init(struct mdp_dev *mdp, struct mdp_path *path)
> +{
> +	const struct img_config *config = path->config;
> +	int index, ret;
> +
> +	if (config->num_components < 1)
> +		return -EINVAL;
> +
> +	for (index = 0; index < config->num_components; index++) {
> +		ret = mdp_comp_ctx_init(mdp, &path->comps[index],
> +					&config->components[index],
> +					path->param);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int mdp_path_config_subfrm(struct mmsys_cmdq_cmd *cmd,
> +				  struct mdp_path *path, u32 count)
> +{
> +	struct mdp_path_subfrm subfrm;
> +	const struct img_config *config = path->config;
> +	struct device *mmsys_dev = path->mdp_dev->mdp_mmsys;
> +	struct mdp_comp_ctx *ctx;
> +	int index, ret;
> +
> +	/* Acquire components */
> +	ret = mdp_path_subfrm_require(&subfrm, path, cmd, count);
> +	if (ret)
> +		return ret;
> +	/* Enable mux settings */
> +	for (index = 0; index < (config->num_components - 1); index++)
> +		mtk_mmsys_mdp_connect(mmsys_dev, cmd,
> +				      path->comps[index].comp->id,
> +				      path->comps[index + 1].comp->id);
> +	/* Config sub-frame information */
> +	for (index = (config->num_components - 1); index >= 0; index--) {
> +		ctx = &path->comps[index];
> +		if (is_output_disable(ctx->param, count))
> +			continue;
> +		ret = call_op(ctx, config_subfrm, cmd, count);
> +		if (ret)
> +			return ret;
> +	}
> +	/* Run components */
> +	ret = mdp_path_subfrm_run(&subfrm, path, cmd);
> +	if (ret)
> +		return ret;
> +	/* Wait components done */
> +	for (index = 0; index < config->num_components; index++) {
> +		ctx = &path->comps[index];
> +		if (is_output_disable(ctx->param, count))
> +			continue;
> +		ret = call_op(ctx, wait_comp_event, cmd);
> +		if (ret)
> +			return ret;
> +	}
> +	/* Advance to the next sub-frame */
> +	for (index = 0; index < config->num_components; index++) {
> +		ctx = &path->comps[index];
> +		ret = call_op(ctx, advance_subfrm, cmd, count);
> +		if (ret)
> +			return ret;
> +	}
> +	/* Disable mux settings */
> +	for (index = 0; index < (config->num_components - 1); index++)
> +		mtk_mmsys_mdp_disconnect(mmsys_dev, cmd,
> +					 path->comps[index].comp->id,
> +					 path->comps[index + 1].comp->id);
> +	return 0;
> +}
> +
> +static int mdp_path_config(struct mdp_dev *mdp, struct mmsys_cmdq_cmd *cmd,
> +			   struct mdp_path *path)
> +{
> +	const struct img_config *config = path->config;
> +	struct mdp_comp_ctx *ctx;
> +	int index, count, ret;
> +
> +	/* Config path frame */
> +	/* Reset components */
> +	for (index = 0; index < config->num_components; index++) {
> +		ctx = &path->comps[index];
> +		ret = call_op(ctx, init_comp, cmd);
> +		if (ret)
> +			return ret;
> +	}
> +	/* Config frame mode */
> +	for (index = 0; index < config->num_components; index++) {
> +		const struct v4l2_rect *compose =
> +			path->composes[ctx->param->outputs[0]];
> +
> +		ctx = &path->comps[index];
> +		ret = call_op(ctx, config_frame, cmd, compose);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	/* Config path sub-frames */
> +	for (count = 0; count < config->num_subfrms; count++) {
> +		ret = mdp_path_config_subfrm(cmd, path, count);
> +		if (ret)
> +			return ret;
> +	}
> +	/* Post processing information */
> +	for (index = 0; index < config->num_components; index++) {
> +		ctx = &path->comps[index];
> +		ret = call_op(ctx, post_process, cmd);
> +		if (ret)
> +			return ret;
> +	}
> +	return 0;
> +}
> +
> +static void mdp_auto_release_work(struct work_struct *work)
> +{
> +	struct mdp_cmdq_cb_param *cb_param;
> +	struct mdp_dev *mdp;
> +
> +	cb_param = container_of(work, struct mdp_cmdq_cb_param,
> +				auto_release_work);
> +	mdp = cb_param->mdp;
> +
> +	mtk_mutex_unprepare(mdp->mdp_mutex[MDP_PIPE_RDMA0]);
> +	mdp_comp_clocks_off(&mdp->pdev->dev, cb_param->comps,
> +			    cb_param->num_comps);
> +
> +	kfree(cb_param->comps);
> +	kfree(cb_param);
> +
> +	atomic_dec(&mdp->job_count);
> +	wake_up(&mdp->callback_wq);
> +}
> +
> +static void mdp_handle_cmdq_callback(struct cmdq_cb_data data)
> +{
> +	struct mdp_cmdq_cb_param *cb_param;
> +	struct mdp_dev *mdp;
> +	struct device *dev;
> +
> +	if (!data.data) {
> +		pr_info("%s:no callback data\n", __func__);
> +		return;
> +	}
> +
> +	cb_param = (struct mdp_cmdq_cb_param *)data.data;
> +	mdp = cb_param->mdp;
> +	dev = &mdp->pdev->dev;
> +
> +	if (cb_param->mdp_ctx)
> +		mdp_m2m_job_finish(cb_param->mdp_ctx);
> +
> +	if (cb_param->user_cmdq_cb) {
> +		struct cmdq_cb_data user_cb_data;
> +
> +		user_cb_data.sta = data.sta;
> +		user_cb_data.data = cb_param->user_cb_data;
> +		cb_param->user_cmdq_cb(user_cb_data);
> +	}
> +
> +	cmdq_pkt_destroy(cb_param->pkt);
> +	INIT_WORK(&cb_param->auto_release_work, mdp_auto_release_work);
> +	if (!queue_work(mdp->clock_wq, &cb_param->auto_release_work)) {
> +		dev_err(dev, "%s:queue_work fail!\n", __func__);
> +		mtk_mutex_unprepare(mdp->mdp_mutex[MDP_PIPE_RDMA0]);
> +		mdp_comp_clocks_off(&mdp->pdev->dev, cb_param->comps,
> +				    cb_param->num_comps);
> +
> +		kfree(cb_param->comps);
> +		kfree(cb_param);
> +
> +		atomic_dec(&mdp->job_count);
> +		wake_up(&mdp->callback_wq);
> +	}
> +}
> +
> +int mdp_cmdq_send(struct mdp_dev *mdp, struct mdp_cmdq_param *param)
> +{
> +	struct mmsys_cmdq_cmd cmd;
> +	struct mdp_path path;
> +	struct mdp_cmdq_cb_param *cb_param = NULL;
> +	struct mdp_comp *comps = NULL;
> +	struct device *dev = &mdp->pdev->dev;
> +	int i, ret;
> +
> +	if (atomic_read(&mdp->suspended))
> +		return -ECANCELED;
> +
> +	atomic_inc(&mdp->job_count);
> +
> +	cmd.pkt = cmdq_pkt_create(mdp->cmdq_clt, SZ_16K);
> +	if (IS_ERR(cmd.pkt)) {
> +		atomic_dec(&mdp->job_count);
> +		wake_up(&mdp->callback_wq);
> +		return PTR_ERR(cmd.pkt);
> +	}
> +	cmd.event = &mdp->event[0];
> +
> +	path.mdp_dev = mdp;
> +	path.config = param->config;
> +	path.param = param->param;
> +	for (i = 0; i < param->param->num_outputs; i++) {
> +		path.bounds[i].left = 0;
> +		path.bounds[i].top = 0;
> +		path.bounds[i].width =
> +			param->param->outputs[i].buffer.format.width;
> +		path.bounds[i].height =
> +			param->param->outputs[i].buffer.format.height;
> +		path.composes[i] = param->composes[i] ?
> +			param->composes[i] : &path.bounds[i];
> +	}
> +
> +	ret = mdp_path_ctx_init(mdp, &path);
> +	if (ret) {
> +		pr_info("%s mdp_path_ctx_init error\n", __func__);
> +		goto err_destroy_pkt;
> +	}
> +
> +	mtk_mutex_prepare(mdp->mdp_mutex[MDP_PIPE_RDMA0]);
> +	for (i = 0; i < param->config->num_components; i++)
> +		mdp_comp_clock_on(&mdp->pdev->dev, path.comps[i].comp);
> +
> +	ret = mdp_path_config(mdp, &cmd, &path);
> +	if (ret) {
> +		pr_info("%s mdp_path_config error\n", __func__);
> +		goto err_destroy_pkt;
> +	}
> +
> +	cb_param = kzalloc(sizeof(*cb_param), GFP_KERNEL);
> +	if (!cb_param) {
> +		ret = -ENOMEM;
> +		goto err_destroy_pkt;
> +	}
> +
> +	comps = kcalloc(param->config->num_components, sizeof(*comps),
> +			GFP_KERNEL);
> +	if (!comps) {
> +		ret = -ENOMEM;
> +		goto err_destroy_pkt;
> +	}
> +
> +	for (i = 0; i < param->config->num_components; i++)
> +		memcpy(&comps[i], path.comps[i].comp,
> +		       sizeof(struct mdp_comp));
> +	cb_param->mdp = mdp;
> +	cb_param->user_cmdq_cb = param->cmdq_cb;
> +	cb_param->user_cb_data = param->cb_data;
> +	cb_param->pkt = cmd.pkt;
> +	cb_param->comps = comps;
> +	cb_param->num_comps = param->config->num_components;
> +	cb_param->mdp_ctx = param->mdp_ctx;
> +
> +	cmdq_pkt_finalize(cmd.pkt);
> +	ret = cmdq_pkt_flush_async(cmd.pkt,
> +				   mdp_handle_cmdq_callback,
> +				   (void *)cb_param);
> +	if (ret) {
> +		dev_err(dev, "cmdq_pkt_flush_async fail!\n");
> +		goto err_clock_off;
> +	}
> +	return 0;
> +
> +err_clock_off:
> +	mtk_mutex_unprepare(mdp->mdp_mutex[MDP_PIPE_RDMA0]);
> +	mdp_comp_clocks_off(&mdp->pdev->dev, cb_param->comps,
> +			    cb_param->num_comps);
> +err_destroy_pkt:
> +	cmdq_pkt_destroy(cmd.pkt);
> +	atomic_dec(&mdp->job_count);
> +	wake_up(&mdp->callback_wq);
> +	kfree(comps);
> +	kfree(cb_param);
> +
> +	return ret;
> +}
> +
> +int mdp_cmdq_sendtask(struct platform_device *pdev, struct img_config *config,
> +		      struct img_ipi_frameparam *param,
> +		      struct v4l2_rect *compose,
> +		      void (*cmdq_cb)(struct cmdq_cb_data data), void *cb_data)
> +{
> +	struct mdp_dev *mdp = platform_get_drvdata(pdev);
> +	struct mdp_cmdq_param task = {
> +		.config = config,
> +		.param = param,
> +		.composes[0] = compose,
> +		.cmdq_cb = cmdq_cb,
> +		.cb_data = cb_data,
> +	};
> +
> +	return mdp_cmdq_send(mdp, &task);
> +}
> +EXPORT_SYMBOL_GPL(mdp_cmdq_sendtask);
> diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.h b/drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.h
> new file mode 100644
> index 000000000000..16933507333b
> --- /dev/null
> +++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.h
> @@ -0,0 +1,46 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2021 MediaTek Inc.
> + * Author: Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
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
> +
> +int mdp_cmdq_sendtask(struct platform_device *pdev, struct img_config *config,
> +		      struct img_ipi_frameparam *param, struct v4l2_rect *compose,
> +		      void (*cmdq_cb)(struct cmdq_cb_data data), void *cb_data);
> +
> +struct mdp_cmdq_param {
> +	struct img_config *config;
> +	struct img_ipi_frameparam *param;
> +	const struct v4l2_rect *composes[IMG_MAX_HW_OUTPUTS];
> +
> +	void (*cmdq_cb)(struct cmdq_cb_data data);
> +	void *cb_data;
> +	void *mdp_ctx;
> +};
> +
> +struct mdp_cmdq_cb_param {
> +	struct work_struct auto_release_work;
> +	struct mdp_dev *mdp;
> +	void (*user_cmdq_cb)(struct cmdq_cb_data data);
> +	void *user_cb_data;
> +	struct cmdq_pkt *pkt;
> +	struct mdp_comp *comps;
> +	u8 num_comps;
> +	void *mdp_ctx;
> +};
> +
> +struct mdp_dev;
> +
> +int mdp_cmdq_send(struct mdp_dev *mdp, struct mdp_cmdq_param *param);
> +
> +#endif  /* __MTK_MDP3_CMDQ_H__ */
> diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c b/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c
> new file mode 100644
> index 000000000000..27c70289cc90
> --- /dev/null
> +++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c
> @@ -0,0 +1,1307 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2021 MediaTek Inc.
> + * Author: Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/of_platform.h>
> +#include <linux/of_address.h>
> +#include <linux/pm_runtime.h>
> +#include "mtk-mdp3-comp.h"
> +#include "mtk-mdp3-core.h"
> +#include "mtk-mdp3-regs.h"
> +
> +#include "mdp_reg_rdma.h"
> +#include "mdp_reg_ccorr.h"
> +#include "mdp_reg_rsz.h"
> +#include "mdp_reg_wrot.h"
> +#include "mdp_reg_wdma.h"
> +#include "mdp_reg_isp.h"
> +
> +static const struct mdp_platform_config *__get_plat_cfg(const struct mdp_comp_ctx *ctx)
> +{
> +	if (!ctx)
> +		return NULL;
> +
> +	return ctx->comp->mdp_dev->mdp_data->mdp_cfg;
> +}
> +
> +static s64 get_comp_flag(const struct mdp_comp_ctx *ctx)
> +{
> +	const struct mdp_platform_config *mdp_cfg = __get_plat_cfg(ctx);
> +
> +	if (mdp_cfg && mdp_cfg->rdma_rsz1_sram_sharing)
> +		if (ctx->comp->id == MDP_COMP_RDMA0)
> +			return (1 << MDP_COMP_RDMA0) | (1 << MDP_COMP_RSZ1);
> +
> +	return 1 << ctx->comp->id;
> +}
> +
> +static int init_rdma(struct mdp_comp_ctx *ctx, struct mmsys_cmdq_cmd *cmd)
> +{
> +	const struct mdp_platform_config *mdp_cfg = __get_plat_cfg(ctx);
> +	phys_addr_t base = ctx->comp->reg_base;
> +	u8 subsys_id = ctx->comp->subsys_id;
> +
> +	if (mdp_cfg && mdp_cfg->rdma_support_10bit) {
> +		struct mdp_comp *prz1 = ctx->comp->mdp_dev->comp[MDP_COMP_RSZ1];
> +
> +		/* Disable RSZ1 */
> +		if (ctx->comp->id == MDP_COMP_RDMA0 && prz1)
> +			MM_REG_WRITE(cmd, subsys_id, prz1->reg_base, PRZ_ENABLE,
> +				     0x00000000, 0x00000001);
> +	}
> +
> +	/* Reset RDMA */
> +	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_RESET, 0x00000001,
> +		     0x00000001);
> +	MM_REG_POLL(cmd, subsys_id, base, MDP_RDMA_MON_STA_1, 0x00000100,
> +		    0x00000100);
> +	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_RESET, 0x00000000,
> +		     0x00000001);
> +	return 0;
> +}
> +
> +static int config_rdma_frame(struct mdp_comp_ctx *ctx,
> +			     struct mmsys_cmdq_cmd *cmd,
> +			     const struct v4l2_rect *compose)
> +{
> +	const struct mdp_rdma_data *rdma = &ctx->param->rdma;
> +	const struct mdp_platform_config *mdp_cfg = __get_plat_cfg(ctx);
> +	u32 colorformat = ctx->input->buffer.format.colorformat;
> +	bool block10bit = MDP_COLOR_IS_10BIT_PACKED(colorformat);
> +	bool en_ufo = MDP_COLOR_IS_UFP(colorformat);
> +	phys_addr_t base = ctx->comp->reg_base;
> +	u8 subsys_id = ctx->comp->subsys_id;
> +
> +	if (mdp_cfg && mdp_cfg->rdma_support_10bit) {
> +		if (block10bit)
> +			MM_REG_WRITE(cmd, subsys_id, base,
> +				     MDP_RDMA_RESV_DUMMY_0,
> +				     0x00000007, 0x00000007);
> +		else
> +			MM_REG_WRITE(cmd, subsys_id, base,
> +				     MDP_RDMA_RESV_DUMMY_0,
> +				     0x00000000, 0x00000007);
> +	}
> +
> +	/* Setup smi control */
> +	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_GMCIF_CON,
> +		     (1 <<  0) +
> +		     (7 <<  4) + //burst type to 8
> +		     (1 << 16),  //enable pre-ultra
> +		     0x00030071);
> +
> +	/* Setup source frame info */
> +	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_SRC_CON, rdma->src_ctrl,
> +		     0x03C8FE0F);
> +
> +	if (mdp_cfg)
> +		if (mdp_cfg->rdma_support_10bit && en_ufo) {
> +			/* Setup source buffer base */
> +			MM_REG_WRITE(cmd, subsys_id,
> +				     base, MDP_RDMA_UFO_DEC_LENGTH_BASE_Y,
> +				     rdma->ufo_dec_y, 0xFFFFFFFF);
> +			MM_REG_WRITE(cmd, subsys_id,
> +				     base, MDP_RDMA_UFO_DEC_LENGTH_BASE_C,
> +				     rdma->ufo_dec_c, 0xFFFFFFFF);
> +			/* Set 10bit source frame pitch */
> +			if (block10bit)
> +				MM_REG_WRITE(cmd, subsys_id,
> +					     base, MDP_RDMA_MF_BKGD_SIZE_IN_PXL,
> +					     rdma->mf_bkgd_in_pxl, 0x001FFFFF);
> +		}
> +
> +	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_CON, rdma->control,
> +		     0x00001110);
> +	/* Setup source buffer base */
> +	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_SRC_BASE_0, rdma->iova[0],
> +		     0xFFFFFFFF);
> +	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_SRC_BASE_1, rdma->iova[1],
> +		     0xFFFFFFFF);
> +	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_SRC_BASE_2, rdma->iova[2],
> +		     0xFFFFFFFF);
> +	/* Setup source buffer end */
> +	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_SRC_END_0,
> +		     rdma->iova_end[0], 0xFFFFFFFF);
> +	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_SRC_END_1,
> +		     rdma->iova_end[1], 0xFFFFFFFF);
> +	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_SRC_END_2,
> +		     rdma->iova_end[2], 0xFFFFFFFF);
> +	/* Setup source frame pitch */
> +	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_MF_BKGD_SIZE_IN_BYTE,
> +		     rdma->mf_bkgd, 0x001FFFFF);
> +	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_SF_BKGD_SIZE_IN_BYTE,
> +		     rdma->sf_bkgd, 0x001FFFFF);
> +	/* Setup color transform */
> +	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_TRANSFORM_0,
> +		     rdma->transform, 0x0F110000);
> +
> +	return 0;
> +}
> +
> +static int config_rdma_subfrm(struct mdp_comp_ctx *ctx,
> +			      struct mmsys_cmdq_cmd *cmd, u32 index)
> +{
> +	const struct mdp_rdma_subfrm *subfrm = &ctx->param->rdma.subfrms[index];
> +	const struct img_comp_subfrm *csf = &ctx->param->subfrms[index];
> +	const struct mdp_platform_config *mdp_cfg = __get_plat_cfg(ctx);
> +	u32 colorformat = ctx->input->buffer.format.colorformat;
> +	bool block10bit = MDP_COLOR_IS_10BIT_PACKED(colorformat);
> +	bool en_ufo = MDP_COLOR_IS_UFP(colorformat);
> +	phys_addr_t base = ctx->comp->reg_base;
> +	u8 subsys_id = ctx->comp->subsys_id;
> +
> +	/* Enable RDMA */
> +	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_EN, 0x00000001,
> +		     0x00000001);
> +
> +	/* Set Y pixel offset */
> +	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_SRC_OFFSET_0,
> +		     subfrm->offset[0], 0xFFFFFFFF);
> +
> +	/* Set 10bit UFO mode */
> +	if (mdp_cfg)
> +		if (mdp_cfg->rdma_support_10bit && block10bit && en_ufo)
> +			MM_REG_WRITE(cmd, subsys_id, base,
> +				     MDP_RDMA_SRC_OFFSET_0_P,
> +				     subfrm->offset_0_p, 0xFFFFFFFF);
> +
> +	/* Set U pixel offset */
> +	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_SRC_OFFSET_1,
> +		     subfrm->offset[1], 0xFFFFFFFF);
> +	/* Set V pixel offset */
> +	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_SRC_OFFSET_2,
> +		     subfrm->offset[2], 0xFFFFFFFF);
> +	/* Set source size */
> +	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_MF_SRC_SIZE, subfrm->src,
> +		     0x1FFF1FFF);
> +	/* Set target size */
> +	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_MF_CLIP_SIZE,
> +		     subfrm->clip, 0x1FFF1FFF);
> +	/* Set crop offset */
> +	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_MF_OFFSET_1,
> +		     subfrm->clip_ofst, 0x003F001F);
> +
> +	if (mdp_cfg && mdp_cfg->rdma_upsample_repeat_only)
> +		if ((csf->in.right - csf->in.left + 1) > 320)
> +			MM_REG_WRITE(cmd, subsys_id, base,
> +				     MDP_RDMA_RESV_DUMMY_0,
> +				     0x00000004, 0x00000004);
> +
> +	return 0;
> +}
> +
> +static int wait_rdma_event(struct mdp_comp_ctx *ctx, struct mmsys_cmdq_cmd *cmd)
> +{
> +	phys_addr_t base = ctx->comp->reg_base;
> +	u8 subsys_id = ctx->comp->subsys_id;
> +
> +	if (ctx->comp->alias_id == 0)
> +		MM_REG_WAIT(cmd, RDMA0_DONE);
> +	else
> +		pr_err("Do not support RDMA1_DONE event\n");
> +
> +	/* Disable RDMA */
> +	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_EN, 0x00000000,
> +		     0x00000001);
> +	return 0;
> +}
> +
> +static const struct mdp_comp_ops rdma_ops = {
> +	.get_comp_flag = get_comp_flag,
> +	.init_comp = init_rdma,
> +	.config_frame = config_rdma_frame,
> +	.config_subfrm = config_rdma_subfrm,
> +	/* .reconfig_frame = reconfig_rdma_frame, */
> +	/* .reconfig_subfrms = reconfig_rdma_subfrms, */

Why are these commented out lines here? It's better to deleted them.

Ditto for the other files that have the same issue.

> +	.wait_comp_event = wait_rdma_event,
> +	.advance_subfrm = NULL,
> +	.post_process = NULL,

You can drop these last two lines as well since they will always be NULL.

Ditto for the other files that have the same issue.

> +};
> +
> +static int init_rsz(struct mdp_comp_ctx *ctx, struct mmsys_cmdq_cmd *cmd)
> +{
> +	phys_addr_t base = ctx->comp->reg_base;
> +	u8 subsys_id = ctx->comp->subsys_id;
> +
> +	/* Reset RSZ */
> +	MM_REG_WRITE(cmd, subsys_id, base, PRZ_ENABLE, 0x00010000,
> +		     0x00010000);
> +	MM_REG_WRITE(cmd, subsys_id, base, PRZ_ENABLE, 0x00000000,
> +		     0x00010000);
> +	/* Enable RSZ */
> +	MM_REG_WRITE(cmd, subsys_id, base, PRZ_ENABLE, 0x00000001,
> +		     0x00000001);
> +	return 0;
> +}
> +
> +static int config_rsz_frame(struct mdp_comp_ctx *ctx,
> +			    struct mmsys_cmdq_cmd *cmd,
> +			    const struct v4l2_rect *compose)
> +{
> +	const struct mdp_rsz_data *rsz = &ctx->param->rsz;
> +	phys_addr_t base = ctx->comp->reg_base;
> +	u8 subsys_id = ctx->comp->subsys_id;
> +
> +	if (ctx->param->frame.bypass) {
> +		/* Disable RSZ */
> +		MM_REG_WRITE(cmd, subsys_id, base, PRZ_ENABLE, 0x00000000,
> +			     0x00000001);
> +
> +		return 0;
> +	}
> +
> +	MM_REG_WRITE(cmd, subsys_id, base, PRZ_CONTROL_1, rsz->control1,
> +		     0x03FFFDF3);
> +	MM_REG_WRITE(cmd, subsys_id, base, PRZ_CONTROL_2, rsz->control2,
> +		     0x0FFFC290);
> +	MM_REG_WRITE(cmd, subsys_id, base, PRZ_HORIZONTAL_COEFF_STEP,
> +		     rsz->coeff_step_x, 0x007FFFFF);
> +	MM_REG_WRITE(cmd, subsys_id, base, PRZ_VERTICAL_COEFF_STEP,
> +		     rsz->coeff_step_y, 0x007FFFFF);
> +	return 0;
> +}
> +
> +static int config_rsz_subfrm(struct mdp_comp_ctx *ctx,
> +			     struct mmsys_cmdq_cmd *cmd, u32 index)
> +{
> +	const struct mdp_rsz_subfrm *subfrm = &ctx->param->rsz.subfrms[index];
> +	const struct img_comp_subfrm *csf = &ctx->param->subfrms[index];
> +	const struct mdp_platform_config *mdp_cfg = __get_plat_cfg(ctx);
> +	phys_addr_t base = ctx->comp->reg_base;
> +	u8 subsys_id = ctx->comp->subsys_id;
> +
> +	MM_REG_WRITE(cmd, subsys_id, base, PRZ_CONTROL_2, subfrm->control2,
> +		     0x00003800);
> +	MM_REG_WRITE(cmd, subsys_id, base, PRZ_INPUT_IMAGE, subfrm->src,
> +		     0xFFFFFFFF);
> +
> +	if (mdp_cfg && mdp_cfg->rsz_disable_dcm_small_sample)
> +		if ((csf->in.right - csf->in.left + 1) <= 16)
> +			MM_REG_WRITE(cmd, subsys_id, base, PRZ_CONTROL_1,
> +				     1 << 27, 1 << 27);
> +
> +	MM_REG_WRITE(cmd, subsys_id, base, PRZ_LUMA_HORIZONTAL_INTEGER_OFFSET,
> +		     csf->luma.left, 0x0000FFFF);
> +	MM_REG_WRITE(cmd, subsys_id,
> +		     base, PRZ_LUMA_HORIZONTAL_SUBPIXEL_OFFSET,
> +		     csf->luma.left_subpix, 0x001FFFFF);
> +	MM_REG_WRITE(cmd, subsys_id, base, PRZ_LUMA_VERTICAL_INTEGER_OFFSET,
> +		     csf->luma.top, 0x0000FFFF);
> +	MM_REG_WRITE(cmd, subsys_id, base, PRZ_LUMA_VERTICAL_SUBPIXEL_OFFSET,
> +		     csf->luma.top_subpix, 0x001FFFFF);
> +	MM_REG_WRITE(cmd, subsys_id,
> +		     base, PRZ_CHROMA_HORIZONTAL_INTEGER_OFFSET,
> +		     csf->chroma.left, 0x0000FFFF);
> +	MM_REG_WRITE(cmd, subsys_id,
> +		     base, PRZ_CHROMA_HORIZONTAL_SUBPIXEL_OFFSET,
> +		     csf->chroma.left_subpix, 0x001FFFFF);
> +
> +	MM_REG_WRITE(cmd, subsys_id, base, PRZ_OUTPUT_IMAGE, subfrm->clip,
> +		     0xFFFFFFFF);
> +
> +	return 0;
> +}
> +
> +static int advance_rsz_subfrm(struct mdp_comp_ctx *ctx,
> +			      struct mmsys_cmdq_cmd *cmd, u32 index)
> +{
> +	const struct mdp_platform_config *mdp_cfg = __get_plat_cfg(ctx);
> +
> +	if (mdp_cfg && mdp_cfg->rsz_disable_dcm_small_sample) {
> +		const struct img_comp_subfrm *csf = &ctx->param->subfrms[index];
> +		phys_addr_t base = ctx->comp->reg_base;
> +		u8 subsys_id = ctx->comp->subsys_id;
> +
> +		if ((csf->in.right - csf->in.left + 1) <= 16)
> +			MM_REG_WRITE(cmd, subsys_id, base, PRZ_CONTROL_1, 0,
> +				     1 << 27);
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct mdp_comp_ops rsz_ops = {
> +	.get_comp_flag = get_comp_flag,
> +	.init_comp = init_rsz,
> +	.config_frame = config_rsz_frame,
> +	.config_subfrm = config_rsz_subfrm,
> +	/* .reconfig_frame = NULL, */
> +	/* .reconfig_subfrms = NULL, */
> +	.wait_comp_event = NULL,
> +	.advance_subfrm = advance_rsz_subfrm,
> +	.post_process = NULL,
> +};
> +
> +static int init_wrot(struct mdp_comp_ctx *ctx, struct mmsys_cmdq_cmd *cmd)
> +{
> +	phys_addr_t base = ctx->comp->reg_base;
> +	u8 subsys_id = ctx->comp->subsys_id;
> +
> +	/* Reset WROT */
> +	MM_REG_WRITE(cmd, subsys_id, base, VIDO_SOFT_RST, 0x01, 0x00000001);
> +	MM_REG_POLL(cmd, subsys_id, base, VIDO_SOFT_RST_STAT, 0x01,
> +		    0x00000001);
> +	MM_REG_WRITE(cmd, subsys_id, base, VIDO_SOFT_RST, 0x00, 0x00000001);
> +	MM_REG_POLL(cmd, subsys_id, base, VIDO_SOFT_RST_STAT, 0x00,
> +		    0x00000001);
> +	return 0;
> +}
> +
> +static int config_wrot_frame(struct mdp_comp_ctx *ctx,
> +			     struct mmsys_cmdq_cmd *cmd,
> +			     const struct v4l2_rect *compose)
> +{
> +	const struct mdp_wrot_data *wrot = &ctx->param->wrot;
> +	const struct mdp_platform_config *mdp_cfg = __get_plat_cfg(ctx);
> +	phys_addr_t base = ctx->comp->reg_base;
> +	u8 subsys_id = ctx->comp->subsys_id;
> +
> +	/* Write frame base address */
> +	MM_REG_WRITE(cmd, subsys_id, base, VIDO_BASE_ADDR, wrot->iova[0],
> +		     0xFFFFFFFF);
> +	MM_REG_WRITE(cmd, subsys_id, base, VIDO_BASE_ADDR_C, wrot->iova[1],
> +		     0xFFFFFFFF);
> +	MM_REG_WRITE(cmd, subsys_id, base, VIDO_BASE_ADDR_V, wrot->iova[2],
> +		     0xFFFFFFFF);
> +	/* Write frame related registers */
> +	MM_REG_WRITE(cmd, subsys_id, base, VIDO_CTRL, wrot->control,
> +		     0xF131510F);
> +	/* Write frame Y pitch */
> +	MM_REG_WRITE(cmd, subsys_id, base, VIDO_STRIDE, wrot->stride[0],
> +		     0x0000FFFF);
> +	/* Write frame UV pitch */
> +	MM_REG_WRITE(cmd, subsys_id, base, VIDO_STRIDE_C, wrot->stride[1],
> +		     0x0000FFFF);
> +	MM_REG_WRITE(cmd, subsys_id, base, VIDO_STRIDE_V, wrot->stride[2],
> +		     0x0000FFFF);
> +	/* Write matrix control */
> +	MM_REG_WRITE(cmd, subsys_id, base, VIDO_MAT_CTRL, wrot->mat_ctrl,
> +		     0x000000F3);
> +
> +	/* Set the fixed ALPHA as 0xFF */
> +	MM_REG_WRITE(cmd, subsys_id, base, VIDO_DITHER, 0xFF000000,
> +		     0xFF000000);
> +	/* Set VIDO_EOL_SEL */
> +	MM_REG_WRITE(cmd, subsys_id, base, VIDO_RSV_1, 0x80000000,
> +		     0x80000000);
> +	/* Set VIDO_FIFO_TEST */
> +	if (wrot->fifo_test != 0)
> +		MM_REG_WRITE(cmd, subsys_id, base, VIDO_FIFO_TEST,
> +			     wrot->fifo_test, 0x00000FFF);
> +	/* Filter enable */
> +	if (mdp_cfg && mdp_cfg->wrot_filter_constraint)
> +		MM_REG_WRITE(cmd, subsys_id, base, VIDO_MAIN_BUF_SIZE,
> +			     wrot->filter, 0x00000077);
> +
> +	return 0;
> +}
> +
> +static int config_wrot_subfrm(struct mdp_comp_ctx *ctx,
> +			      struct mmsys_cmdq_cmd *cmd, u32 index)
> +{
> +	const struct mdp_wrot_subfrm *subfrm = &ctx->param->wrot.subfrms[index];
> +	phys_addr_t base = ctx->comp->reg_base;
> +	u8 subsys_id = ctx->comp->subsys_id;
> +
> +	/* Write Y pixel offset */
> +	MM_REG_WRITE(cmd, subsys_id, base, VIDO_OFST_ADDR,
> +		     subfrm->offset[0], 0x0FFFFFFF);
> +	/* Write U pixel offset */
> +	MM_REG_WRITE(cmd, subsys_id, base, VIDO_OFST_ADDR_C,
> +		     subfrm->offset[1], 0x0FFFFFFF);
> +	/* Write V pixel offset */
> +	MM_REG_WRITE(cmd, subsys_id, base, VIDO_OFST_ADDR_V,
> +		     subfrm->offset[2], 0x0FFFFFFF);
> +	/* Write source size */
> +	MM_REG_WRITE(cmd, subsys_id, base, VIDO_IN_SIZE, subfrm->src,
> +		     0x1FFF1FFF);
> +	/* Write target size */
> +	MM_REG_WRITE(cmd, subsys_id, base, VIDO_TAR_SIZE, subfrm->clip,
> +		     0x1FFF1FFF);
> +	MM_REG_WRITE(cmd, subsys_id, base, VIDO_CROP_OFST, subfrm->clip_ofst,
> +		     0x1FFF1FFF);
> +
> +	MM_REG_WRITE(cmd, subsys_id, base, VIDO_MAIN_BUF_SIZE,
> +		     subfrm->main_buf, 0x1FFF7F00);
> +
> +	/* Enable WROT */
> +	MM_REG_WRITE(cmd, subsys_id, base, VIDO_ROT_EN, 0x01, 0x00000001);
> +
> +	return 0;
> +}
> +
> +static int wait_wrot_event(struct mdp_comp_ctx *ctx, struct mmsys_cmdq_cmd *cmd)
> +{
> +	const struct mdp_platform_config *mdp_cfg = __get_plat_cfg(ctx);
> +	phys_addr_t base = ctx->comp->reg_base;
> +	u8 subsys_id = ctx->comp->subsys_id;
> +
> +	if (ctx->comp->alias_id == 0)
> +		MM_REG_WAIT(cmd, WROT0_DONE);
> +	else
> +		pr_err("Do not support WROT1_DONE event\n");
> +
> +	if (mdp_cfg && mdp_cfg->wrot_filter_constraint)
> +		MM_REG_WRITE(cmd, subsys_id, base, VIDO_MAIN_BUF_SIZE, 0,
> +			     0x00000077);
> +
> +	/* Disable WROT */
> +	MM_REG_WRITE(cmd, subsys_id, base, VIDO_ROT_EN, 0x00, 0x00000001);
> +
> +	return 0;
> +}
> +
> +static const struct mdp_comp_ops wrot_ops = {
> +	.get_comp_flag = get_comp_flag,
> +	.init_comp = init_wrot,
> +	.config_frame = config_wrot_frame,
> +	.config_subfrm = config_wrot_subfrm,
> +	/* .reconfig_frame = reconfig_wrot_frame, */
> +	/* .reconfig_subfrms = reconfig_wrot_subfrms, */
> +	.wait_comp_event = wait_wrot_event,
> +	.advance_subfrm = NULL,
> +	.post_process = NULL,
> +};
> +
> +static int init_wdma(struct mdp_comp_ctx *ctx, struct mmsys_cmdq_cmd *cmd)
> +{
> +	phys_addr_t base = ctx->comp->reg_base;
> +	u8 subsys_id = ctx->comp->subsys_id;
> +
> +	/* Reset WDMA */
> +	MM_REG_WRITE(cmd, subsys_id, base, WDMA_RST, 0x1, 0x00000001);
> +	MM_REG_POLL(cmd, subsys_id, base, WDMA_FLOW_CTRL_DBG, 0x01,
> +		    0x00000001);
> +	MM_REG_WRITE(cmd, subsys_id, base, WDMA_RST, 0x0, 0x00000001);
> +	return 0;
> +}
> +
> +static int config_wdma_frame(struct mdp_comp_ctx *ctx,
> +			     struct mmsys_cmdq_cmd *cmd,
> +			     const struct v4l2_rect *compose)
> +{
> +	const struct mdp_wdma_data *wdma = &ctx->param->wdma;
> +	phys_addr_t base = ctx->comp->reg_base;
> +	u8 subsys_id = ctx->comp->subsys_id;
> +
> +	MM_REG_WRITE(cmd, subsys_id, base, WDMA_BUF_CON2, 0x10101050,
> +		     0xFFFFFFFF);
> +
> +	/* Setup frame information */
> +	MM_REG_WRITE(cmd, subsys_id, base, WDMA_CFG, wdma->wdma_cfg,
> +		     0x0F01B8F0);
> +	/* Setup frame base address */
> +	MM_REG_WRITE(cmd, subsys_id, base, WDMA_DST_ADDR,   wdma->iova[0],
> +		     0xFFFFFFFF);
> +	MM_REG_WRITE(cmd, subsys_id, base, WDMA_DST_U_ADDR, wdma->iova[1],
> +		     0xFFFFFFFF);
> +	MM_REG_WRITE(cmd, subsys_id, base, WDMA_DST_V_ADDR, wdma->iova[2],
> +		     0xFFFFFFFF);
> +	/* Setup Y pitch */
> +	MM_REG_WRITE(cmd, subsys_id, base, WDMA_DST_W_IN_BYTE,
> +		     wdma->w_in_byte, 0x0000FFFF);
> +	/* Setup UV pitch */
> +	MM_REG_WRITE(cmd, subsys_id, base, WDMA_DST_UV_PITCH,
> +		     wdma->uv_stride, 0x0000FFFF);
> +	/* Set the fixed ALPHA as 0xFF */
> +	MM_REG_WRITE(cmd, subsys_id, base, WDMA_ALPHA, 0x800000FF,
> +		     0x800000FF);
> +
> +	return 0;
> +}
> +
> +static int config_wdma_subfrm(struct mdp_comp_ctx *ctx,
> +			      struct mmsys_cmdq_cmd *cmd, u32 index)
> +{
> +	const struct mdp_wdma_subfrm *subfrm = &ctx->param->wdma.subfrms[index];
> +	phys_addr_t base = ctx->comp->reg_base;
> +	u8 subsys_id = ctx->comp->subsys_id;
> +
> +	/* Write Y pixel offset */
> +	MM_REG_WRITE(cmd, subsys_id, base, WDMA_DST_ADDR_OFFSET,
> +		     subfrm->offset[0], 0x0FFFFFFF);
> +	/* Write U pixel offset */
> +	MM_REG_WRITE(cmd, subsys_id, base, WDMA_DST_U_ADDR_OFFSET,
> +		     subfrm->offset[1], 0x0FFFFFFF);
> +	/* Write V pixel offset */
> +	MM_REG_WRITE(cmd, subsys_id, base, WDMA_DST_V_ADDR_OFFSET,
> +		     subfrm->offset[2], 0x0FFFFFFF);
> +	/* Write source size */
> +	MM_REG_WRITE(cmd, subsys_id, base, WDMA_SRC_SIZE, subfrm->src,
> +		     0x3FFF3FFF);
> +	/* Write target size */
> +	MM_REG_WRITE(cmd, subsys_id, base, WDMA_CLIP_SIZE, subfrm->clip,
> +		     0x3FFF3FFF);
> +	/* Write clip offset */
> +	MM_REG_WRITE(cmd, subsys_id, base, WDMA_CLIP_COORD, subfrm->clip_ofst,
> +		     0x3FFF3FFF);
> +
> +	/* Enable WDMA */
> +	MM_REG_WRITE(cmd, subsys_id, base, WDMA_EN, 0x01, 0x00000001);
> +
> +	return 0;
> +}
> +
> +static int wait_wdma_event(struct mdp_comp_ctx *ctx, struct mmsys_cmdq_cmd *cmd)
> +{
> +	phys_addr_t base = ctx->comp->reg_base;
> +	u8 subsys_id = ctx->comp->subsys_id;
> +
> +	MM_REG_WAIT(cmd, WDMA0_DONE);
> +	/* Disable WDMA */
> +	MM_REG_WRITE(cmd, subsys_id, base, WDMA_EN, 0x00, 0x00000001);
> +	return 0;
> +}
> +
> +static const struct mdp_comp_ops wdma_ops = {
> +	.get_comp_flag = get_comp_flag,
> +	.init_comp = init_wdma,
> +	.config_frame = config_wdma_frame,
> +	.config_subfrm = config_wdma_subfrm,
> +	.wait_comp_event = wait_wdma_event,
> +	.advance_subfrm = NULL,
> +	.post_process = NULL,
> +};
> +
> +static int init_ccorr(struct mdp_comp_ctx *ctx, struct mmsys_cmdq_cmd *cmd)
> +{
> +	phys_addr_t base = ctx->comp->reg_base;
> +	u8 subsys_id = ctx->comp->subsys_id;
> +
> +	/* CCORR enable */
> +	MM_REG_WRITE(cmd, subsys_id, base, MDP_CCORR_EN, 0x1, 0x1);
> +	/* Relay mode */
> +	MM_REG_WRITE(cmd, subsys_id, base, MDP_CCORR_CFG, 0x1, 0x1);
> +	return 0;
> +}
> +
> +static int config_ccorr_frame(struct mdp_comp_ctx *ctx,
> +			      struct mmsys_cmdq_cmd *cmd,
> +			      const struct v4l2_rect *compose)
> +{
> +	/* Disabled function */

Odd comment. Wouldn't /* Nothing to do */ be a better comment?
'Disabled' suggests that this 'function' is actually present, just not
implemented. In which case that should be described instead.

> +	return 0;
> +}
> +
> +static int config_ccorr_subfrm(struct mdp_comp_ctx *ctx,
> +			       struct mmsys_cmdq_cmd *cmd, u32 index)
> +{
> +	const struct img_comp_subfrm *csf = &ctx->param->subfrms[index];
> +	phys_addr_t base = ctx->comp->reg_base;
> +	u8 subsys_id = ctx->comp->subsys_id;
> +	u32 hsize, vsize;
> +
> +	hsize = csf->in.right - csf->in.left + 1;
> +	vsize = csf->in.bottom - csf->in.top + 1;
> +	MM_REG_WRITE(cmd, subsys_id, base, MDP_CCORR_SIZE,
> +		     (hsize << 16) + (vsize <<  0), 0x1FFF1FFF);
> +	return 0;
> +}
> +
> +static const struct mdp_comp_ops ccorr_ops = {
> +	.get_comp_flag = get_comp_flag,
> +	.init_comp = init_ccorr,
> +	.config_frame = config_ccorr_frame,
> +	.config_subfrm = config_ccorr_subfrm,
> +	/* .reconfig_frame = NULL, */
> +	/* .reconfig_subfrms = NULL, */
> +	.wait_comp_event = NULL,
> +	.advance_subfrm = NULL,
> +	.post_process = NULL,
> +};
> +
> +static int init_isp(struct mdp_comp_ctx *ctx, struct mmsys_cmdq_cmd *cmd)
> +{
> +	struct device *dev = ctx->comp->mdp_dev->mdp_mmsys;
> +	const struct isp_data *isp = &ctx->param->isp;
> +
> +	/* Direct link */
> +	if (isp->dl_flags & (1 << MDP_COMP_CAMIN)) {
> +		dev_info(dev, "SW_RST ASYNC");
> +		mtk_mmsys_mdp_isp_ctrl(dev, cmd, MDP_COMP_CAMIN);
> +	}
> +
> +	if (isp->dl_flags & (1 << MDP_COMP_CAMIN2)) {
> +		dev_info(dev, "SW_RST ASYNC2");
> +		mtk_mmsys_mdp_isp_ctrl(dev, cmd, MDP_COMP_CAMIN2);
> +	}
> +
> +	return 0;
> +}
> +
> +static int config_isp_frame(struct mdp_comp_ctx *ctx,
> +			    struct mmsys_cmdq_cmd *cmd,
> +			    const struct v4l2_rect *compose)
> +{
> +	struct device *dev = &ctx->comp->mdp_dev->pdev->dev;
> +	const struct isp_data *isp = &ctx->param->isp;
> +	phys_addr_t base = ctx->comp->reg_base;
> +	u8 subsys_id = ctx->comp->subsys_id;
> +
> +	/* DIP_X_SMX1I_BASE_ADDR, DIP_X_SMX1O_BASE_ADDR */
> +	MM_REG_WRITE_MASK(cmd, subsys_id, base, 0x2890, isp->smxi_iova[0],
> +			  0xFFFFFFFF);
> +	MM_REG_WRITE_MASK(cmd, subsys_id, base, 0x27D0, isp->smxi_iova[0],
> +			  0xFFFFFFFF);
> +	/* DIP_X_SMX2I_BASE_ADDR, DIP_X_SMX2O_BASE_ADDR */
> +	MM_REG_WRITE_MASK(cmd, subsys_id, base, 0x28C0, isp->smxi_iova[1],
> +			  0xFFFFFFFF);
> +	MM_REG_WRITE_MASK(cmd, subsys_id, base, 0x2800, isp->smxi_iova[1],
> +			  0xFFFFFFFF);
> +	/* DIP_X_SMX3I_BASE_ADDR, DIP_X_SMX3O_BASE_ADDR */
> +	MM_REG_WRITE_MASK(cmd, subsys_id, base, 0x28F0, isp->smxi_iova[2],
> +			  0xFFFFFFFF);
> +	MM_REG_WRITE_MASK(cmd, subsys_id, base, 0x2830, isp->smxi_iova[2],
> +			  0xFFFFFFFF);
> +	/* DIP_X_SMX4I_BASE_ADDR, DIP_X_SMX4O_BASE_ADDR */
> +	MM_REG_WRITE_MASK(cmd, subsys_id, base, 0x2920, isp->smxi_iova[3],
> +			  0xFFFFFFFF);
> +	MM_REG_WRITE_MASK(cmd, subsys_id, base, 0x2860, isp->smxi_iova[3],
> +			  0xFFFFFFFF);
> +
> +	switch (isp->cq_idx) {
> +	case ISP_DRV_DIP_CQ_THRE0:
> +		MM_REG_WRITE_MASK(cmd, subsys_id, base, 0x2208,
> +				  isp->cq_iova, 0xFFFFFFFF);
> +		break;
> +	case ISP_DRV_DIP_CQ_THRE1:
> +		MM_REG_WRITE_MASK(cmd, subsys_id, base, 0x2214,
> +				  isp->cq_iova, 0xFFFFFFFF);
> +		break;
> +	case ISP_DRV_DIP_CQ_THRE2:
> +		MM_REG_WRITE_MASK(cmd, subsys_id, base, 0x2220,
> +				  isp->cq_iova, 0xFFFFFFFF);
> +		break;
> +	case ISP_DRV_DIP_CQ_THRE3:
> +		MM_REG_WRITE_MASK(cmd, subsys_id, base, 0x222C,
> +				  isp->cq_iova, 0xFFFFFFFF);
> +		break;
> +	case ISP_DRV_DIP_CQ_THRE4:
> +		MM_REG_WRITE_MASK(cmd, subsys_id, base, 0x2238,
> +				  isp->cq_iova, 0xFFFFFFFF);
> +		break;
> +	case ISP_DRV_DIP_CQ_THRE5:
> +		MM_REG_WRITE_MASK(cmd, subsys_id, base, 0x2244,
> +				  isp->cq_iova, 0xFFFFFFFF);
> +		break;
> +	case ISP_DRV_DIP_CQ_THRE6:
> +		MM_REG_WRITE_MASK(cmd, subsys_id, base, 0x2250,
> +				  isp->cq_iova, 0xFFFFFFFF);
> +		break;
> +	case ISP_DRV_DIP_CQ_THRE7:
> +		MM_REG_WRITE_MASK(cmd, subsys_id, base, 0x225C,
> +				  isp->cq_iova, 0xFFFFFFFF);
> +		break;
> +	case ISP_DRV_DIP_CQ_THRE8:
> +		MM_REG_WRITE_MASK(cmd, subsys_id, base, 0x2268,
> +				  isp->cq_iova, 0xFFFFFFFF);
> +		break;
> +	case ISP_DRV_DIP_CQ_THRE9:
> +		MM_REG_WRITE_MASK(cmd, subsys_id, base, 0x2274,
> +				  isp->cq_iova, 0xFFFFFFFF);
> +		break;
> +	case ISP_DRV_DIP_CQ_THRE10:
> +		MM_REG_WRITE_MASK(cmd, subsys_id, base, 0x2280,
> +				  isp->cq_iova, 0xFFFFFFFF);
> +		break;
> +	case ISP_DRV_DIP_CQ_THRE11:
> +		MM_REG_WRITE_MASK(cmd, subsys_id, base, 0x228C,
> +				  isp->cq_iova, 0xFFFFFFFF);
> +		break;
> +	default:
> +		dev_err(dev, "Do not support this cq (%d)", isp->cq_idx);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int config_isp_subfrm(struct mdp_comp_ctx *ctx,
> +			     struct mmsys_cmdq_cmd *cmd, u32 index)
> +{
> +	phys_addr_t base = ctx->comp->reg_base;
> +	u8 subsys_id = ctx->comp->subsys_id;
> +
> +	MM_REG_WRITE_MASK(cmd, subsys_id, base, 0x2304,
> +			  ctx->param->isp.tpipe_iova[index], 0xFFFFFFFF);
> +	return 0;
> +}
> +
> +static int wait_isp_event(struct mdp_comp_ctx *ctx, struct mmsys_cmdq_cmd *cmd)
> +{
> +	const struct isp_data *isp = &ctx->param->isp;
> +	struct device *dev = &ctx->comp->mdp_dev->pdev->dev;
> +	phys_addr_t base = ctx->comp->reg_base;
> +	u8 subsys_id = ctx->comp->subsys_id;
> +
> +	/* MDP_DL_SEL: select MDP_CROP */
> +	if (isp->dl_flags & (1 << MDP_COMP_CAMIN))
> +		MM_REG_WRITE_MASK(cmd, subsys_id, base, 0x0030, 0x00000000,
> +				  0x00000200);
> +	/* MDP2_DL_SEL: select MDP_CROP2 */
> +	if (isp->dl_flags & (1 << MDP_COMP_CAMIN2))
> +		MM_REG_WRITE_MASK(cmd, subsys_id, base, 0x0030, 0x00000000,
> +				  0x00000C00);
> +
> +	switch (isp->cq_idx) {
> +	case ISP_DRV_DIP_CQ_THRE0:
> +		MM_REG_WRITE_MASK(cmd, subsys_id, base, 0x2000, 0x0001,
> +				  0x00000001);
> +		MM_REG_WAIT(cmd, ISP_P2_0_DONE);
> +		break;
> +	case ISP_DRV_DIP_CQ_THRE1:
> +		MM_REG_WRITE_MASK(cmd, subsys_id, base, 0x2000, 0x0002,
> +				  0x00000002);
> +		MM_REG_WAIT(cmd, ISP_P2_1_DONE);
> +		break;
> +	case ISP_DRV_DIP_CQ_THRE2:
> +		MM_REG_WRITE_MASK(cmd, subsys_id, base, 0x2000, 0x0004,
> +				  0x00000004);
> +		MM_REG_WAIT(cmd, ISP_P2_2_DONE);
> +		break;
> +	case ISP_DRV_DIP_CQ_THRE3:
> +		MM_REG_WRITE_MASK(cmd, subsys_id, base, 0x2000, 0x0008,
> +				  0x00000008);
> +		MM_REG_WAIT(cmd, ISP_P2_3_DONE);
> +		break;
> +	case ISP_DRV_DIP_CQ_THRE4:
> +		MM_REG_WRITE_MASK(cmd, subsys_id, base, 0x2000, 0x0010,
> +				  0x00000010);
> +		MM_REG_WAIT(cmd, ISP_P2_4_DONE);
> +		break;
> +	case ISP_DRV_DIP_CQ_THRE5:
> +		MM_REG_WRITE_MASK(cmd, subsys_id, base, 0x2000, 0x0020,
> +				  0x00000020);
> +		MM_REG_WAIT(cmd, ISP_P2_5_DONE);
> +		break;
> +	case ISP_DRV_DIP_CQ_THRE6:
> +		MM_REG_WRITE_MASK(cmd, subsys_id, base, 0x2000, 0x0040,
> +				  0x00000040);
> +		MM_REG_WAIT(cmd, ISP_P2_6_DONE);
> +		break;
> +	case ISP_DRV_DIP_CQ_THRE7:
> +		MM_REG_WRITE_MASK(cmd, subsys_id, base, 0x2000, 0x0080,
> +				  0x00000080);
> +		MM_REG_WAIT(cmd, ISP_P2_7_DONE);
> +		break;
> +	case ISP_DRV_DIP_CQ_THRE8:
> +		MM_REG_WRITE_MASK(cmd, subsys_id, base, 0x2000, 0x0100,
> +				  0x00000100);
> +		MM_REG_WAIT(cmd, ISP_P2_8_DONE);
> +		break;
> +	case ISP_DRV_DIP_CQ_THRE9:
> +		MM_REG_WRITE_MASK(cmd, subsys_id, base, 0x2000, 0x0200,
> +				  0x00000200);
> +		MM_REG_WAIT(cmd, ISP_P2_9_DONE);
> +		break;
> +	case ISP_DRV_DIP_CQ_THRE10:
> +		MM_REG_WRITE_MASK(cmd, subsys_id, base, 0x2000, 0x0400,
> +				  0x00000400);
> +		MM_REG_WAIT(cmd, ISP_P2_10_DONE);
> +		break;
> +	case ISP_DRV_DIP_CQ_THRE11:
> +		MM_REG_WRITE_MASK(cmd, subsys_id, base, 0x2000, 0x0800,
> +				  0x00000800);
> +		MM_REG_WAIT(cmd, ISP_P2_11_DONE);
> +		break;
> +	default:
> +		dev_err(dev, "Do not support this cq (%d)", isp->cq_idx);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct mdp_comp_ops imgi_ops = {
> +	.get_comp_flag = get_comp_flag,
> +	.init_comp = init_isp,
> +	.config_frame = config_isp_frame,
> +	.config_subfrm = config_isp_subfrm,
> +	/* .reconfig_frame = reconfig_isp_frame, */
> +	/* .reconfig_subfrms = reconfig_isp_subfrms, */
> +	.wait_comp_event = wait_isp_event,
> +	.advance_subfrm = NULL,
> +	.post_process = NULL,
> +};
> +
> +static int config_camin_subfrm(struct mdp_comp_ctx *ctx,
> +			       struct mmsys_cmdq_cmd *cmd, u32 index)
> +{
> +	const struct img_comp_subfrm *csf = &ctx->param->subfrms[index];
> +	struct device *dev = ctx->comp->mdp_dev->mdp_mmsys;
> +	u32 camin_w, camin_h;
> +
> +	camin_w = csf->in.right - csf->in.left + 1;
> +	camin_h = csf->in.bottom - csf->in.top + 1;
> +
> +	/* Config for direct link */
> +	if (ctx->comp->alias_id == 0)
> +		mtk_mmsys_mdp_camin_ctrl(dev, cmd, MDP_COMP_CAMIN,
> +					 camin_w, camin_h);
> +	if (ctx->comp->alias_id == 1)
> +		mtk_mmsys_mdp_camin_ctrl(dev, cmd, MDP_COMP_CAMIN2,
> +					 camin_w, camin_h);
> +
> +	return 0;
> +}
> +
> +static const struct mdp_comp_ops camin_ops = {
> +	.get_comp_flag = get_comp_flag,
> +	.init_comp = NULL,
> +	.config_frame = NULL,
> +	.config_subfrm = config_camin_subfrm,
> +	/* .reconfig_frame = NULL, */
> +	/* .reconfig_subfrms = NULL, */
> +	.wait_comp_event = NULL,
> +	.advance_subfrm = NULL,
> +	.post_process = NULL,
> +};
> +
> +static const struct mdp_comp_ops *mdp_comp_ops[MDP_COMP_TYPE_COUNT] = {
> +	[MDP_COMP_TYPE_RDMA] =		&rdma_ops,
> +	[MDP_COMP_TYPE_RSZ] =		&rsz_ops,
> +	[MDP_COMP_TYPE_WROT] =		&wrot_ops,
> +	[MDP_COMP_TYPE_WDMA] =		&wdma_ops,
> +	[MDP_COMP_TYPE_PATH1] =		NULL,
> +	[MDP_COMP_TYPE_PATH2] =		NULL,
> +	[MDP_COMP_TYPE_CCORR] =		&ccorr_ops,
> +	[MDP_COMP_TYPE_IMGI] =		&imgi_ops,
> +	[MDP_COMP_TYPE_EXTO] =		NULL,
> +	[MDP_COMP_TYPE_DL_PATH1] =	&camin_ops,
> +	[MDP_COMP_TYPE_DL_PATH2] =	&camin_ops,
> +};
> +
> +struct mdp_comp_match {
> +	enum mdp_comp_type	type;
> +	u32			alias_id;
> +};
> +
> +static const struct mdp_comp_match mdp_comp_matches[MDP_MAX_COMP_COUNT] = {
> +	[MDP_COMP_WPEI] =	{ MDP_COMP_TYPE_WPEI, 0 },
> +	[MDP_COMP_WPEO] =	{ MDP_COMP_TYPE_EXTO, 2 },
> +	[MDP_COMP_WPEI2] =	{ MDP_COMP_TYPE_WPEI, 1 },
> +	[MDP_COMP_WPEO2] =	{ MDP_COMP_TYPE_EXTO, 3 },
> +	[MDP_COMP_ISP_IMGI] =	{ MDP_COMP_TYPE_IMGI, 0 },
> +	[MDP_COMP_ISP_IMGO] =	{ MDP_COMP_TYPE_EXTO, 0 },
> +	[MDP_COMP_ISP_IMG2O] =	{ MDP_COMP_TYPE_EXTO, 1 },
> +
> +	[MDP_COMP_CAMIN] =	{ MDP_COMP_TYPE_DL_PATH1, 0 },
> +	[MDP_COMP_CAMIN2] =	{ MDP_COMP_TYPE_DL_PATH2, 1 },
> +	[MDP_COMP_RDMA0] =	{ MDP_COMP_TYPE_RDMA, 0 },
> +	[MDP_COMP_CCORR0] =	{ MDP_COMP_TYPE_CCORR, 0 },
> +	[MDP_COMP_RSZ0] =	{ MDP_COMP_TYPE_RSZ, 0 },
> +	[MDP_COMP_RSZ1] =	{ MDP_COMP_TYPE_RSZ, 1 },
> +	[MDP_COMP_PATH0_SOUT] =	{ MDP_COMP_TYPE_PATH1, 0 },
> +	[MDP_COMP_PATH1_SOUT] =	{ MDP_COMP_TYPE_PATH2, 1 },
> +	[MDP_COMP_WROT0] =	{ MDP_COMP_TYPE_WROT, 0 },
> +	[MDP_COMP_WDMA] =	{ MDP_COMP_TYPE_WDMA, 0 },
> +};
> +
> +static const struct of_device_id mdp_comp_dt_ids[] = {
> +	{
> +		.compatible = "mediatek,mt8183-mdp3-rdma",
> +		.data = (void *)MDP_COMP_TYPE_RDMA,
> +	}, {
> +		.compatible = "mediatek,mt8183-mdp3-ccorr",
> +		.data = (void *)MDP_COMP_TYPE_CCORR,
> +	}, {
> +		.compatible = "mediatek,mt8183-mdp3-rsz",
> +		.data = (void *)MDP_COMP_TYPE_RSZ,
> +	}, {
> +		.compatible = "mediatek,mt8183-mdp3-wrot",
> +		.data = (void *)MDP_COMP_TYPE_WROT,
> +	}, {
> +		.compatible = "mediatek,mt8183-mdp3-wdma",
> +		.data = (void *)MDP_COMP_TYPE_WDMA,
> +	},
> +	{}
> +};
> +
> +static const struct of_device_id mdp_sub_comp_dt_ids[] = {
> +	{
> +		.compatible = "mediatek,mt8183-mdp3-path1",
> +		.data = (void *)MDP_COMP_TYPE_PATH1,
> +	}, {
> +		.compatible = "mediatek,mt8183-mdp3-path2",
> +		.data = (void *)MDP_COMP_TYPE_PATH2,
> +	}, {
> +		.compatible = "mediatek,mt8183-mdp3-imgi",
> +		.data = (void *)MDP_COMP_TYPE_IMGI,
> +	}, {
> +		.compatible = "mediatek,mt8183-mdp3-exto",
> +		.data = (void *)MDP_COMP_TYPE_EXTO,
> +	}, {
> +		.compatible = "mediatek,mt8183-mdp3-dl1",
> +		.data = (void *)MDP_COMP_TYPE_DL_PATH1,
> +	}, {
> +		.compatible = "mediatek,mt8183-mdp3-dl2",
> +		.data = (void *)MDP_COMP_TYPE_DL_PATH2,
> +	},
> +	{}
> +};
> +
> +/* Used to describe the item order in MDP property */
> +struct mdp_comp_info {
> +	u32	clk_num;
> +	u32	clk_ofst;
> +	u32	dts_reg_ofst;
> +};
> +
> +static const struct mdp_comp_info mdp_comp_dt_info[MDP_COMP_TYPE_COUNT] = {
> +	[MDP_COMP_TYPE_RDMA]		= {2, 0, 0},
> +	[MDP_COMP_TYPE_RSZ]		= {1, 0, 0},
> +	[MDP_COMP_TYPE_WROT]		= {1, 0, 0},
> +	[MDP_COMP_TYPE_WDMA]		= {1, 0, 0},
> +	[MDP_COMP_TYPE_PATH1]		= {0, 0, 2},
> +	[MDP_COMP_TYPE_PATH2]		= {0, 0, 3},
> +	[MDP_COMP_TYPE_CCORR]		= {1, 0, 0},
> +	[MDP_COMP_TYPE_IMGI]		= {0, 0, 4},
> +	[MDP_COMP_TYPE_EXTO]		= {0, 0, 4},
> +	[MDP_COMP_TYPE_DL_PATH1]	= {2, 2, 1},
> +	[MDP_COMP_TYPE_DL_PATH2]	= {2, 4, 1},
> +};
> +
> +static int mdp_comp_get_id(enum mdp_comp_type type, u32 alias_id)
> +{
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(mdp_comp_matches); i++)
> +		if (mdp_comp_matches[i].type == type &&
> +		    mdp_comp_matches[i].alias_id == alias_id)
> +			return i;
> +	return -ENODEV;
> +}
> +
> +void mdp_comp_clock_on(struct device *dev, struct mdp_comp *comp)
> +{
> +	int i, err;
> +
> +	if (comp->comp_dev) {
> +		err = pm_runtime_get_sync(comp->comp_dev);
> +		if (err < 0)
> +			dev_err(dev,
> +				"Failed to get power, err %d. type:%d id:%d\n",
> +				err, comp->type, comp->id);
> +	}
> +
> +	for (i = 0; i < ARRAY_SIZE(comp->clks); i++) {
> +		if (IS_ERR(comp->clks[i]))
> +			break;
> +		err = clk_prepare_enable(comp->clks[i]);
> +		if (err)
> +			dev_err(dev,
> +				"Failed to enable clk %d. type:%d id:%d\n",
> +				i, comp->type, comp->id);
> +	}
> +}
> +
> +void mdp_comp_clock_off(struct device *dev, struct mdp_comp *comp)
> +{
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(comp->clks); i++) {
> +		if (IS_ERR(comp->clks[i]))
> +			break;
> +		clk_disable_unprepare(comp->clks[i]);
> +	}
> +
> +	if (comp->comp_dev)
> +		pm_runtime_put(comp->comp_dev);
> +}
> +
> +void mdp_comp_clocks_on(struct device *dev, struct mdp_comp *comps, int num)
> +{
> +	int i;
> +
> +	for (i = 0; i < num; i++)
> +		mdp_comp_clock_on(dev, &comps[i]);
> +}
> +
> +void mdp_comp_clocks_off(struct device *dev, struct mdp_comp *comps, int num)
> +{
> +	int i;
> +
> +	for (i = 0; i < num; i++)
> +		mdp_comp_clock_off(dev, &comps[i]);
> +}
> +
> +static int mdp_get_subsys_id(struct device *dev, struct device_node *node,
> +			     struct mdp_comp *comp)
> +{
> +	struct platform_device *comp_pdev;
> +	struct cmdq_client_reg  cmdq_reg;
> +	int ret = 0;
> +	int index = 0;
> +
> +	if (!dev || !node || !comp)
> +		return -EINVAL;
> +
> +	comp_pdev = of_find_device_by_node(node);
> +
> +	if (!comp_pdev) {
> +		dev_err(dev, "get comp_pdev fail! comp id=%d type=%d\n",
> +			comp->id, comp->type);
> +		return -ENODEV;
> +	}
> +
> +	index = mdp_comp_dt_info[comp->type].dts_reg_ofst;
> +	ret = cmdq_dev_get_client_reg(&comp_pdev->dev, &cmdq_reg, index);
> +	if (ret != 0) {
> +		dev_err(&comp_pdev->dev, "cmdq_dev_get_subsys fail!\n");
> +		return -EINVAL;
> +	}
> +
> +	comp->subsys_id = cmdq_reg.subsys;
> +	dev_info(&comp_pdev->dev, "subsys id=%d\n", cmdq_reg.subsys);
> +
> +	return 0;
> +}
> +
> +static void __mdp_comp_init(struct mdp_dev *mdp, struct device_node *node,
> +			    struct mdp_comp *comp)
> +{
> +	struct resource res;
> +	phys_addr_t base;
> +	int index = mdp_comp_dt_info[comp->type].dts_reg_ofst;
> +
> +	if (of_address_to_resource(node, index, &res) < 0)
> +		base = 0L;
> +	else
> +		base = res.start;
> +
> +	comp->mdp_dev = mdp;
> +	comp->regs = of_iomap(node, 0);
> +	comp->reg_base = base;
> +}
> +
> +static int mdp_comp_init(struct mdp_dev *mdp, struct device_node *node,
> +			 struct mdp_comp *comp, enum mtk_mdp_comp_id id)
> +{
> +	struct device *dev = &mdp->pdev->dev;
> +	int clk_num;
> +	int clk_ofst;
> +	int i;
> +
> +	if (id < 0 || id >= MDP_MAX_COMP_COUNT) {
> +		dev_err(dev, "Invalid component id %d\n", id);
> +		return -EINVAL;
> +	}
> +
> +	comp->type = mdp_comp_matches[id].type;
> +	comp->id = id;
> +	comp->alias_id = mdp_comp_matches[id].alias_id;
> +	comp->ops = mdp_comp_ops[comp->type];
> +	__mdp_comp_init(mdp, node, comp);
> +
> +	clk_num = mdp_comp_dt_info[comp->type].clk_num;
> +	clk_ofst = mdp_comp_dt_info[comp->type].clk_ofst;
> +
> +	for (i = 0; i < clk_num; i++) {
> +		comp->clks[i] = of_clk_get(node, i + clk_ofst);
> +		if (IS_ERR(comp->clks[i]))
> +			break;
> +	}
> +
> +	mdp_get_subsys_id(dev, node, comp);
> +
> +	return 0;
> +}
> +
> +static struct mdp_comp *mdp_comp_create(struct mdp_dev *mdp,
> +					struct device_node *node,
> +					enum mtk_mdp_comp_id id)
> +{
> +	struct device *dev = &mdp->pdev->dev;
> +	struct mdp_comp *comp;
> +	int ret;
> +
> +	if (mdp->comp[id])
> +		return ERR_PTR(-EEXIST);
> +
> +	comp = devm_kzalloc(dev, sizeof(*comp), GFP_KERNEL);
> +	if (!comp)
> +		return ERR_PTR(-ENOMEM);
> +
> +	ret = mdp_comp_init(mdp, node, comp, id);
> +	if (ret) {
> +		kfree(comp);
> +		return ERR_PTR(ret);
> +	}
> +	mdp->comp[id] = comp;
> +	mdp->comp[id]->mdp_dev = mdp;
> +
> +	dev_info(dev, "%s type:%d alias:%d id:%d base:%#x regs:%p\n",
> +		 dev->of_node->name, comp->type, comp->alias_id, id,
> +		 (u32)comp->reg_base, comp->regs);
> +	return comp;
> +}
> +
> +static int mdp_sub_comps_create(struct mdp_dev *mdp, struct device_node *node)
> +{
> +	struct device *dev = &mdp->pdev->dev;
> +	struct property *prop;
> +	const char *name;
> +	int index = 0;
> +
> +	of_property_for_each_string(node, "mdp3-comps", prop, name) {
> +		const struct of_device_id *matches = mdp_sub_comp_dt_ids;
> +		enum mdp_comp_type type = MDP_COMP_NONE;
> +		u32 alias_id;
> +		int id, ret;
> +		struct mdp_comp *comp;
> +
> +		for (; matches->compatible[0]; matches++) {
> +			if (of_compat_cmp(name, matches->compatible,
> +					  strlen(matches->compatible)) == 0) {
> +				type = (enum mdp_comp_type)matches->data;
> +				break;
> +			}
> +		}
> +
> +		ret = of_property_read_u32_index(node, "mdp3-comp-ids",
> +						 index, &alias_id);
> +		if (ret) {
> +			dev_warn(dev, "Skipping unknown component %s\n", name);
> +			return ret;
> +		}
> +
> +		id = mdp_comp_get_id(type, alias_id);
> +		if (id < 0) {
> +			dev_err(dev, "Failed to get comp id: %s (%d, %d)\n",
> +				name, type, alias_id);
> +			return -ENODEV;
> +		}
> +
> +		comp = mdp_comp_create(mdp, node, id);
> +		if (IS_ERR(comp))
> +			return PTR_ERR(comp);
> +
> +		index++;
> +	}
> +	return 0;
> +}
> +
> +static void mdp_comp_deinit(struct mdp_comp *comp)
> +{
> +	if (!comp)
> +		return;
> +
> +	if (comp->regs)
> +		iounmap(comp->regs);
> +}
> +
> +void mdp_component_deinit(struct mdp_dev *mdp)
> +{
> +	int i;
> +
> +	for (i = 0; i < MDP_PIPE_MAX; i++)
> +		mtk_mutex_put(mdp->mdp_mutex[i]);
> +
> +	for (i = 0; i < ARRAY_SIZE(mdp->comp); i++) {
> +		if (mdp->comp[i]) {
> +			mdp_comp_deinit(mdp->comp[i]);
> +			kfree(mdp->comp[i]);
> +		}
> +	}
> +}
> +
> +int mdp_component_init(struct mdp_dev *mdp)
> +{
> +	struct device *dev = &mdp->pdev->dev;
> +	struct device_node *node, *parent;
> +	struct platform_device *pdev;
> +	u32 alias_id;
> +	int i, ret;
> +
> +	parent = dev->of_node->parent;
> +	/* Iterate over sibling MDP function blocks */
> +	for_each_child_of_node(parent, node) {
> +		const struct of_device_id *of_id;
> +		enum mdp_comp_type type;
> +		int id;
> +		struct mdp_comp *comp;
> +
> +		of_id = of_match_node(mdp_comp_dt_ids, node);
> +		if (!of_id)
> +			continue;
> +
> +		if (!of_device_is_available(node)) {
> +			dev_info(dev, "Skipping disabled component %pOF\n",
> +				 node);
> +			continue;
> +		}
> +
> +		type = (enum mdp_comp_type)of_id->data;
> +		ret = of_property_read_u32(node, "mediatek,mdp3-id", &alias_id);
> +		if (ret) {
> +			dev_warn(dev, "Skipping unknown component %pOF\n",
> +				 node);
> +			continue;
> +		}
> +		id = mdp_comp_get_id(type, alias_id);
> +		if (id < 0) {
> +			dev_err(dev,
> +				"Fail to get component id: type %d alias %d\n",
> +				type, alias_id);
> +			continue;
> +		}
> +
> +		comp = mdp_comp_create(mdp, node, id);
> +		if (IS_ERR(comp))
> +			goto err_init_comps;
> +
> +		ret = mdp_sub_comps_create(mdp, node);
> +		if (ret)
> +			goto err_init_comps;
> +
> +		/* Only DMA capable components need the pm control */
> +		comp->comp_dev = NULL;
> +		if (comp->type != MDP_COMP_TYPE_RDMA &&
> +		    comp->type != MDP_COMP_TYPE_WROT &&
> +			comp->type != MDP_COMP_TYPE_WDMA)
> +			continue;
> +
> +		pdev = of_find_device_by_node(node);
> +		if (!pdev) {
> +			dev_warn(dev, "can't find platform device of node:%s\n",
> +				 node->name);
> +			return -ENODEV;
> +		}
> +
> +		comp->comp_dev = &pdev->dev;
> +		pm_runtime_enable(comp->comp_dev);
> +	}
> +	return 0;
> +
> +err_init_comps:
> +	mdp_component_deinit(mdp);
> +	return ret;
> +}
> +
> +int mdp_comp_ctx_init(struct mdp_dev *mdp, struct mdp_comp_ctx *ctx,
> +		      const struct img_compparam *param,
> +	const struct img_ipi_frameparam *frame)
> +{
> +	struct device *dev = &mdp->pdev->dev;
> +	int i;
> +
> +	if (param->type < 0 || param->type >= MDP_MAX_COMP_COUNT) {
> +		dev_err(dev, "Invalid component id %d", param->type);
> +		return -EINVAL;
> +	}
> +
> +	ctx->comp = mdp->comp[param->type];
> +	if (!ctx->comp) {
> +		dev_err(dev, "Uninit component id %d", param->type);
> +		return -EINVAL;
> +	}
> +
> +	ctx->param = param;
> +	ctx->input = &frame->inputs[param->input];
> +	for (i = 0; i < param->num_outputs; i++)
> +		ctx->outputs[i] = &frame->outputs[param->outputs[i]];
> +	return 0;
> +}
> diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h b/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h
> new file mode 100644
> index 000000000000..7b34f9c42410
> --- /dev/null
> +++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h
> @@ -0,0 +1,147 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2021 MediaTek Inc.
> + * Author: Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
> + */
> +
> +#ifndef __MTK_MDP3_COMP_H__
> +#define __MTK_MDP3_COMP_H__
> +
> +#include <linux/soc/mediatek/mtk-mmsys.h>
> +#include "mtk-mdp3-cmdq.h"
> +
> +#define MM_REG_WRITE_MASK(cmd, id, base, ofst, val, mask, ...) \
> +	cmdq_pkt_write_mask((cmd)->pkt, id, \
> +		(base) + (ofst), (val), (mask), ##__VA_ARGS__)
> +#define MM_REG_WRITE(cmd, id, base, ofst, val, mask, ...) \
> +	MM_REG_WRITE_MASK(cmd, id, base, ofst, val, \
> +		(((mask) & (ofst##_MASK)) == (ofst##_MASK)) ? \
> +			(0xffffffff) : (mask), ##__VA_ARGS__)
> +
> +#define MM_REG_WAIT(cmd, evt) \
> +	cmdq_pkt_wfe((cmd)->pkt, (cmd)->event[(evt)], true)
> +
> +#define MM_REG_WAIT_NO_CLEAR(cmd, evt) \
> +	cmdq_pkt_wfe((cmd)->pkt, (cmd)->event[(evt)], false)
> +
> +#define MM_REG_CLEAR(cmd, evt) \
> +	cmdq_pkt_clear_event((cmd)->pkt, (cmd)->event[(evt)])
> +
> +#define MM_REG_SET_EVENT(cmd, evt) \
> +	cmdq_pkt_set_event((cmd)->pkt, (cmd)->event[(evt)])
> +
> +#define MM_REG_POLL_MASK(cmd, id, base, ofst, val, mask, ...) \
> +	cmdq_pkt_poll_mask((cmd)->pkt, id, \
> +		(base) + (ofst), (val), (mask), ##__VA_ARGS__)
> +#define MM_REG_POLL(cmd, id, base, ofst, val, mask, ...) \
> +	MM_REG_POLL_MASK((cmd), id, base, ofst, val, \
> +		(((mask) & (ofst##_MASK)) == (ofst##_MASK)) ? \
> +			(0xffffffff) : (mask), ##__VA_ARGS__)
> +
> +enum mdp_comp_type {
> +	MDP_COMP_TYPE_INVALID = 0,
> +
> +	MDP_COMP_TYPE_RDMA,
> +	MDP_COMP_TYPE_RSZ,
> +	MDP_COMP_TYPE_WROT,
> +	MDP_COMP_TYPE_WDMA,
> +	MDP_COMP_TYPE_PATH1,
> +	MDP_COMP_TYPE_PATH2,
> +
> +	MDP_COMP_TYPE_TDSHP,
> +	MDP_COMP_TYPE_COLOR,
> +	MDP_COMP_TYPE_DRE,
> +	MDP_COMP_TYPE_CCORR,
> +	MDP_COMP_TYPE_HDR,
> +
> +	MDP_COMP_TYPE_IMGI,
> +	MDP_COMP_TYPE_WPEI,
> +	MDP_COMP_TYPE_EXTO,	/* External path */
> +	MDP_COMP_TYPE_DL_PATH1, /* Direct-link path1 */
> +	MDP_COMP_TYPE_DL_PATH2, /* Direct-link path2 */
> +
> +	MDP_COMP_TYPE_COUNT	/* ALWAYS keep at the end */
> +};
> +
> +enum mdp_comp_event {
> +	RDMA0_SOF,
> +	RDMA0_DONE,
> +	RSZ0_SOF,
> +	RSZ1_SOF,
> +	TDSHP0_SOF,
> +	WROT0_SOF,
> +	WROT0_DONE,
> +	WDMA0_SOF,
> +	WDMA0_DONE,
> +
> +	ISP_P2_0_DONE,
> +	ISP_P2_1_DONE,
> +	ISP_P2_2_DONE,
> +	ISP_P2_3_DONE,
> +	ISP_P2_4_DONE,
> +	ISP_P2_5_DONE,
> +	ISP_P2_6_DONE,
> +	ISP_P2_7_DONE,
> +	ISP_P2_8_DONE,
> +	ISP_P2_9_DONE,
> +	ISP_P2_10_DONE,
> +	ISP_P2_11_DONE,
> +	ISP_P2_12_DONE,
> +	ISP_P2_13_DONE,
> +	ISP_P2_14_DONE,
> +
> +	WPE_DONE,
> +	WPE_B_DONE,
> +
> +	MDP_MAX_EVENT_COUNT	/* ALWAYS keep at the end */
> +};
> +
> +struct mdp_comp_ops;
> +
> +struct mdp_comp {
> +	struct mdp_dev			*mdp_dev;
> +	void __iomem			*regs;
> +	phys_addr_t			reg_base;
> +	u8				subsys_id;
> +	struct clk			*clks[6];
> +	struct device			*comp_dev;
> +	enum mdp_comp_type		type;
> +	enum mtk_mdp_comp_id		id;
> +	u32				alias_id;
> +	const struct mdp_comp_ops	*ops;
> +};
> +
> +struct mdp_comp_ctx {
> +	struct mdp_comp			*comp;
> +	const struct img_compparam	*param;
> +	const struct img_input		*input;
> +	const struct img_output		*outputs[IMG_MAX_HW_OUTPUTS];
> +};
> +
> +struct mdp_comp_ops {
> +	s64 (*get_comp_flag)(const struct mdp_comp_ctx *ctx);
> +	int (*init_comp)(struct mdp_comp_ctx *ctx, struct mmsys_cmdq_cmd *cmd);
> +	int (*config_frame)(struct mdp_comp_ctx *ctx, struct mmsys_cmdq_cmd *cmd,
> +			    const struct v4l2_rect *compose);
> +	int (*config_subfrm)(struct mdp_comp_ctx *ctx,
> +			     struct mmsys_cmdq_cmd *cmd, u32 index);
> +	int (*wait_comp_event)(struct mdp_comp_ctx *ctx,
> +			       struct mmsys_cmdq_cmd *cmd);
> +	int (*advance_subfrm)(struct mdp_comp_ctx *ctx,
> +			      struct mmsys_cmdq_cmd *cmd, u32 index);
> +	int (*post_process)(struct mdp_comp_ctx *ctx, struct mmsys_cmdq_cmd *cmd);
> +};
> +
> +struct mdp_dev;
> +
> +int mdp_component_init(struct mdp_dev *mdp);
> +void mdp_component_deinit(struct mdp_dev *mdp);
> +void mdp_comp_clock_on(struct device *dev, struct mdp_comp *comp);
> +void mdp_comp_clock_off(struct device *dev, struct mdp_comp *comp);
> +void mdp_comp_clocks_on(struct device *dev, struct mdp_comp *comps, int num);
> +void mdp_comp_clocks_off(struct device *dev, struct mdp_comp *comps, int num);
> +int mdp_comp_ctx_init(struct mdp_dev *mdp, struct mdp_comp_ctx *ctx,
> +		      const struct img_compparam *param,
> +	const struct img_ipi_frameparam *frame);
> +
> +#endif  /* __MTK_MDP3_COMP_H__ */
> diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c b/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c
> new file mode 100644
> index 000000000000..8459b0afa84c
> --- /dev/null
> +++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c
> @@ -0,0 +1,329 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2021 MediaTek Inc.
> + * Author: Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/module.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/remoteproc.h>
> +#include <linux/remoteproc/mtk_scp.h>
> +#include <media/videobuf2-dma-contig.h>
> +#include "mtk-mdp3-core.h"
> +#include "mtk-mdp3-m2m.h"
> +
> +/* MDP debug log level (0-3). 3 shows all the logs. */
> +
> +static const struct mdp_platform_config mt8183_plat_cfg = {
> +	.rdma_support_10bit		= true,
> +	.rdma_rsz1_sram_sharing		= true,
> +	.rdma_upsample_repeat_only	= true,
> +	.rsz_disable_dcm_small_sample	= false,
> +	.wrot_filter_constraint		= false,
> +	.gce_event_offset		= 0,
> +};
> +
> +static const struct mtk_mdp_driver_data mt8183_mdp_driver_data = {
> +	.mdp_cfg = &mt8183_plat_cfg,
> +};
> +
> +static const struct of_device_id mdp_of_ids[] = {
> +	{ .compatible = "mediatek,mt8183-mdp3",
> +	  .data = &mt8183_mdp_driver_data,
> +	},
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, mdp_of_ids);
> +
> +static struct platform_device *__get_pdev_by_name(struct platform_device *pdev,
> +						  char *ref_name)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct device_node *mdp_node;
> +	struct platform_device *mdp_pdev;
> +
> +	mdp_node = of_parse_phandle(dev->of_node, ref_name, 0);
> +	if (!mdp_node) {
> +		dev_err(dev, "can't get node %s\n", ref_name);
> +		return NULL;
> +	}
> +
> +	mdp_pdev = of_find_device_by_node(mdp_node);
> +	of_node_put(mdp_node);
> +	if (WARN_ON(!mdp_pdev)) {
> +		dev_err(dev, "find %s pdev failed\n", ref_name);
> +		return NULL;
> +	}
> +
> +	return mdp_pdev;
> +}
> +
> +struct platform_device *mdp_get_plat_device(struct platform_device *pdev)
> +{
> +	if (!pdev)
> +		return NULL;
> +
> +	return __get_pdev_by_name(pdev, "mediatek,mdp3");
> +}
> +EXPORT_SYMBOL_GPL(mdp_get_plat_device);
> +
> +int mdp_vpu_get_locked(struct mdp_dev *mdp)
> +{
> +	int ret = 0;
> +
> +	if (mdp->vpu_count++ == 0) {
> +		ret = rproc_boot(mdp->rproc_handle);
> +		if (ret) {
> +			dev_err(&mdp->pdev->dev,
> +				"vpu_load_firmware failed %d\n", ret);
> +			goto err_load_vpu;
> +		}
> +		ret = mdp_vpu_register(mdp);
> +		if (ret) {
> +			dev_err(&mdp->pdev->dev,
> +				"mdp_vpu register failed %d\n", ret);
> +			goto err_reg_vpu;
> +		}
> +		ret = mdp_vpu_dev_init(&mdp->vpu, mdp->scp, &mdp->vpu_lock);
> +		if (ret) {
> +			dev_err(&mdp->pdev->dev,
> +				"mdp_vpu device init failed %d\n", ret);
> +			goto err_init_vpu;
> +		}
> +	}
> +	return 0;
> +
> +err_init_vpu:
> +	mdp_vpu_unregister(mdp);
> +err_reg_vpu:
> +err_load_vpu:
> +	mdp->vpu_count--;
> +	return ret;
> +}
> +
> +void mdp_vpu_put_locked(struct mdp_dev *mdp)
> +{
> +	if (--mdp->vpu_count == 0) {
> +		mdp_vpu_dev_deinit(&mdp->vpu);
> +		mdp_vpu_unregister(mdp);
> +	}
> +}
> +
> +static int mdp_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct mdp_dev *mdp;
> +	struct device_node *mdp_node;
> +	struct platform_device *mm_pdev;
> +	u32 i, event_ofst;
> +	int ret;
> +
> +	mdp = devm_kzalloc(dev, sizeof(*mdp), GFP_KERNEL);

It's a bad idea to use devm_kzalloc: if the device is forcibly unbound
then the memory also disappears. It's better to use kzalloc and free it
when the video_device release() callback is called: that's when the last
user of the video device closes its filehandle and everything can be
safely freed.

> +	if (!mdp) {
> +		ret = -ENOMEM;
> +		goto err_return;
> +	}
> +
> +	mdp->pdev = pdev;
> +	mdp->mdp_data = of_device_get_match_data(&pdev->dev);
> +	mm_pdev = __get_pdev_by_name(pdev, "mediatek,mmsys");
> +	if (!mm_pdev) {
> +		ret = -ENODEV;
> +		goto err_return;
> +	}
> +	mdp->mdp_mmsys = &mm_pdev->dev;
> +
> +	mdp_node = of_parse_phandle(pdev->dev.of_node, "mediatek,mm-mutex", 0);
> +	if (!mdp_node) {
> +		ret = -ENODEV;
> +		goto err_return;
> +	}
> +
> +	event_ofst = mdp->mdp_data->mdp_cfg->gce_event_offset;
> +	for (i = RDMA0_SOF; i < MDP_MAX_EVENT_COUNT; i++) {
> +		s32 event_id;
> +
> +		if (!dev)
> +			return -EINVAL;
> +
> +		if (of_property_read_u32_index(mdp_node,
> +					       "mediatek,gce-events",
> +					       i + event_ofst, &event_id)) {
> +			dev_err(dev, "can't parse gce-events property");
> +
> +			return -ENODEV;
> +		}
> +		mdp->event[i] = (event_id < 0) ? -i : event_id;
> +		dev_info(dev, "Get event id:%d\n", mdp->event[i]);
> +	}
> +
> +	mm_pdev = of_find_device_by_node(mdp_node);
> +	of_node_put(mdp_node);
> +	if (WARN_ON(!mm_pdev)) {
> +		ret = -ENODEV;
> +		goto err_return;
> +	}
> +
> +	for (i = 0; i < MDP_PIPE_MAX; i++) {
> +		mdp->mdp_mutex[i] = mtk_mutex_mdp_get(&mm_pdev->dev, i);
> +		if (!mdp->mdp_mutex[i]) {
> +			ret = -ENODEV;
> +			goto err_return;
> +		}
> +	}
> +
> +	ret = mdp_component_init(mdp);
> +	if (ret) {
> +		dev_err(dev, "Failed to initialize mdp components\n");
> +		goto err_return;
> +	}
> +
> +	mdp->job_wq = alloc_workqueue(MDP_MODULE_NAME, WQ_FREEZABLE, 0);
> +	if (!mdp->job_wq) {
> +		dev_err(dev, "Unable to create job workqueue\n");
> +		ret = -ENOMEM;
> +		goto err_deinit_comp;
> +	}
> +
> +	mdp->clock_wq = alloc_workqueue(MDP_MODULE_NAME "-clock", WQ_FREEZABLE,
> +					0);
> +	if (!mdp->clock_wq) {
> +		dev_err(dev, "Unable to create clock workqueue\n");
> +		ret = -ENOMEM;
> +		goto err_destroy_job_wq;
> +	}
> +
> +	mdp->scp = scp_get(pdev);
> +	if (!mdp->scp) {
> +		dev_err(&pdev->dev, "Could not get scp device\n");
> +		ret = -ENODEV;
> +		goto err_destroy_clock_wq;
> +	}
> +
> +	mdp->rproc_handle = scp_get_rproc(mdp->scp);
> +	dev_info(&pdev->dev, "MDP rproc_handle: %pK", mdp->rproc_handle);
> +
> +	mutex_init(&mdp->vpu_lock);
> +	mutex_init(&mdp->m2m_lock);
> +
> +	mdp->cmdq_clt = cmdq_mbox_create(dev, 0);
> +	if (IS_ERR(mdp->cmdq_clt)) {
> +		ret = PTR_ERR(mdp->cmdq_clt);
> +		goto err_put_scp;
> +	}
> +
> +	init_waitqueue_head(&mdp->callback_wq);
> +	ida_init(&mdp->mdp_ida);
> +	platform_set_drvdata(pdev, mdp);
> +
> +	vb2_dma_contig_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
> +
> +	ret = v4l2_device_register(dev, &mdp->v4l2_dev);
> +	if (ret) {
> +		dev_err(dev, "Failed to register v4l2 device\n");
> +		ret = -EINVAL;
> +		goto err_mbox_destroy;
> +	}
> +
> +	ret = mdp_m2m_device_register(mdp);
> +	if (ret) {
> +		v4l2_err(&mdp->v4l2_dev, "Failed to register m2m device\n");
> +		goto err_unregister_device;
> +	}
> +
> +	dev_dbg(dev, "mdp-%d registered successfully\n", pdev->id);
> +	return 0;
> +
> +err_unregister_device:
> +	v4l2_device_unregister(&mdp->v4l2_dev);
> +err_mbox_destroy:
> +	cmdq_mbox_destroy(mdp->cmdq_clt);
> +err_put_scp:
> +	scp_put(mdp->scp);
> +err_destroy_clock_wq:
> +	destroy_workqueue(mdp->clock_wq);
> +err_destroy_job_wq:
> +	destroy_workqueue(mdp->job_wq);
> +err_deinit_comp:
> +	mdp_component_deinit(mdp);
> +err_return:
> +	dev_dbg(dev, "Errno %d\n", ret);
> +	return ret;
> +}
> +
> +static int mdp_remove(struct platform_device *pdev)
> +{
> +	struct mdp_dev *mdp = platform_get_drvdata(pdev);
> +
> +	mdp_m2m_device_unregister(mdp);

Everything that follows below should be moved to the video_device release
function. That's when it is safe to clean up.

> +	v4l2_device_unregister(&mdp->v4l2_dev);
> +
> +	scp_put(mdp->scp);
> +
> +	destroy_workqueue(mdp->job_wq);
> +	destroy_workqueue(mdp->clock_wq);
> +
> +	pm_runtime_disable(&pdev->dev);
> +
> +	vb2_dma_contig_clear_max_seg_size(&pdev->dev);
> +	mdp_component_deinit(mdp);
> +
> +	mdp_vpu_shared_mem_free(&mdp->vpu);
> +
> +	dev_dbg(&pdev->dev, "%s driver unloaded\n", pdev->name);
> +	return 0;
> +}
> +
> +static int __maybe_unused mdp_suspend(struct device *dev)
> +{
> +	struct mdp_dev *mdp = dev_get_drvdata(dev);
> +	int ret;
> +
> +	atomic_set(&mdp->suspended, 1);
> +
> +	if (atomic_read(&mdp->job_count)) {
> +		ret = wait_event_timeout(mdp->callback_wq,
> +					 !atomic_read(&mdp->job_count),
> +					 2 * HZ);
> +		if (ret == 0) {
> +			dev_err(dev,
> +				"%s:flushed cmdq task incomplete, count=%d\n",
> +				__func__, atomic_read(&mdp->job_count));
> +			return -EBUSY;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused mdp_resume(struct device *dev)
> +{
> +	struct mdp_dev *mdp = dev_get_drvdata(dev);
> +
> +	atomic_set(&mdp->suspended, 0);
> +
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops mdp_pm_ops = {
> +	SET_SYSTEM_SLEEP_PM_OPS(mdp_suspend, mdp_resume)
> +};
> +
> +static struct platform_driver mdp_driver = {
> +	.probe		= mdp_probe,
> +	.remove		= mdp_remove,
> +	.driver = {
> +		.name	= MDP_MODULE_NAME,
> +		.pm	= &mdp_pm_ops,
> +		.of_match_table = of_match_ptr(mdp_of_ids),
> +	},
> +};
> +
> +module_platform_driver(mdp_driver);
> +
> +MODULE_AUTHOR("Ping-Hsun Wu <ping-hsun.wu@mediatek.com>");
> +MODULE_DESCRIPTION("Mediatek image processor 3 driver");
> +MODULE_LICENSE("GPL v2");
> diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h b/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h
> new file mode 100644
> index 000000000000..d996d9e71356
> --- /dev/null
> +++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h
> @@ -0,0 +1,75 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2021 MediaTek Inc.
> + * Author: Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
> + */
> +
> +#ifndef __MTK_MDP3_CORE_H__
> +#define __MTK_MDP3_CORE_H__
> +
> +#include <media/v4l2-device.h>
> +#include <media/v4l2-mem2mem.h>
> +#include <linux/soc/mediatek/mtk-mmsys.h>
> +#include <linux/soc/mediatek/mtk-mutex.h>
> +#include "mtk-mdp3-comp.h"
> +#include "mtk-mdp3-vpu.h"
> +
> +#define MDP_MODULE_NAME	"mtk-mdp3"
> +
> +enum mdp_buffer_usage {
> +	MDP_BUFFER_USAGE_HW_READ,
> +	MDP_BUFFER_USAGE_MDP,
> +	MDP_BUFFER_USAGE_MDP2,
> +	MDP_BUFFER_USAGE_ISP,
> +	MDP_BUFFER_USAGE_WPE,
> +};
> +
> +struct mdp_platform_config {
> +	bool	rdma_support_10bit;
> +	bool	rdma_rsz1_sram_sharing;
> +	bool	rdma_upsample_repeat_only;
> +	bool	rsz_disable_dcm_small_sample;
> +	bool	wrot_filter_constraint;
> +	u32	gce_event_offset;
> +};
> +
> +struct mtk_mdp_driver_data {
> +	const struct mdp_platform_config *mdp_cfg;
> +};
> +
> +struct mdp_dev {
> +	struct platform_device			*pdev;
> +	struct device				*mdp_mmsys;
> +	struct mtk_mutex			*mdp_mutex[MDP_PIPE_MAX];
> +	struct mdp_comp				*comp[MDP_MAX_COMP_COUNT];
> +	const struct mtk_mdp_driver_data	*mdp_data;
> +	s32					event[MDP_MAX_EVENT_COUNT];
> +
> +	struct workqueue_struct			*job_wq;
> +	struct workqueue_struct			*clock_wq;
> +	struct mdp_vpu_dev			vpu;
> +	struct mtk_scp				*scp;
> +	struct rproc				*rproc_handle;
> +	/* synchronization protect for accessing vpu working buffer info */
> +	struct mutex				vpu_lock;
> +	s32					vpu_count;
> +	u32					id_count;
> +	struct ida				mdp_ida;
> +	struct cmdq_client			*cmdq_clt;
> +	wait_queue_head_t			callback_wq;
> +
> +	struct v4l2_device			v4l2_dev;
> +	struct video_device			*m2m_vdev;
> +	struct v4l2_m2m_dev			*m2m_dev;
> +	/* synchronization protect for m2m device operation */
> +	struct mutex				m2m_lock;
> +	atomic_t				suspended;
> +	atomic_t				job_count;
> +};
> +
> +int mdp_vpu_get_locked(struct mdp_dev *mdp);
> +void mdp_vpu_put_locked(struct mdp_dev *mdp);
> +int mdp_vpu_register(struct mdp_dev *mdp);
> +void mdp_vpu_unregister(struct mdp_dev *mdp);
> +
> +#endif  /* __MTK_MDP3_CORE_H__ */
> diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-m2m.c b/drivers/media/platform/mtk-mdp3/mtk-mdp3-m2m.c
> new file mode 100644
> index 000000000000..584804ef7bc4
> --- /dev/null
> +++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-m2m.c
> @@ -0,0 +1,801 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2021 MediaTek Inc.
> + * Author: Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
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
> +	return container_of(fh, struct mdp_m2m_ctx, fh);
> +}
> +
> +static inline struct mdp_m2m_ctx *ctrl_to_ctx(struct v4l2_ctrl *ctrl)
> +{
> +	return container_of(ctrl->handler, struct mdp_m2m_ctx, ctrl_handler);
> +}
> +
> +static inline struct mdp_frame *ctx_get_frame(struct mdp_m2m_ctx *ctx,
> +					      enum v4l2_buf_type type)
> +{
> +	if (V4L2_TYPE_IS_OUTPUT(type))
> +		return &ctx->curr_param.output;
> +	else
> +		return &ctx->curr_param.captures[0];
> +}
> +
> +static void mdp_m2m_ctx_set_state(struct mdp_m2m_ctx *ctx, u32 state)
> +{
> +	mutex_lock(&ctx->curr_param.state_lock);
> +	ctx->curr_param.state |= state;
> +	mutex_unlock(&ctx->curr_param.state_lock);
> +}
> +
> +static bool mdp_m2m_ctx_is_state_set(struct mdp_m2m_ctx *ctx, u32 mask)
> +{
> +	bool ret;
> +
> +	mutex_lock(&ctx->curr_param.state_lock);
> +	ret = (ctx->curr_param.state & mask) == mask;
> +	mutex_unlock(&ctx->curr_param.state_lock);
> +	return ret;
> +}
> +
> +static void mdp_m2m_ctx_lock(struct vb2_queue *q)
> +{
> +	struct mdp_m2m_ctx *ctx = vb2_get_drv_priv(q);
> +
> +	mutex_lock(&ctx->mdp_dev->m2m_lock);
> +}
> +
> +static void mdp_m2m_ctx_unlock(struct vb2_queue *q)
> +{
> +	struct mdp_m2m_ctx *ctx = vb2_get_drv_priv(q);
> +
> +	mutex_unlock(&ctx->mdp_dev->m2m_lock);
> +}

Please use vb2_ops_wait_prepare/finish instead of providing these functions.
The lock field of vb2_queue can be set to this mutex.

> +
> +static void mdp_m2m_job_abort(void *priv)
> +{
> +}
> +
> +static void mdp_m2m_process_done(void *priv, int vb_state)
> +{
> +	struct mdp_m2m_ctx *ctx = priv;
> +	struct vb2_v4l2_buffer *src_vbuf, *dst_vbuf;
> +	u32 valid_output_flags = V4L2_BUF_FLAG_TIMECODE |
> +				 V4L2_BUF_FLAG_TSTAMP_SRC_MASK |
> +				 V4L2_BUF_FLAG_KEYFRAME |
> +				 V4L2_BUF_FLAG_PFRAME | V4L2_BUF_FLAG_BFRAME;
> +
> +	src_vbuf = (struct vb2_v4l2_buffer *)
> +			v4l2_m2m_src_buf_remove(ctx->m2m_ctx);
> +	dst_vbuf = (struct vb2_v4l2_buffer *)
> +			v4l2_m2m_dst_buf_remove(ctx->m2m_ctx);
> +
> +	src_vbuf->sequence = ctx->frame_count;
> +	dst_vbuf->sequence = src_vbuf->sequence;

Sequence counters are independent for each queue. See e.g. how vim2m.c does this.

> +	dst_vbuf->timecode = src_vbuf->timecode;
> +	dst_vbuf->flags &= ~valid_output_flags;
> +	dst_vbuf->flags |= src_vbuf->flags & valid_output_flags;

Just drop these last three lines, use v4l2_m2m_buf_copy_metadata() instead.

> +
> +	v4l2_m2m_buf_done(src_vbuf, vb_state);
> +	v4l2_m2m_buf_done(dst_vbuf, vb_state);
> +	v4l2_m2m_job_finish(ctx->mdp_dev->m2m_dev, ctx->m2m_ctx);
> +
> +	ctx->curr_param.frame_no = ctx->frame_count++;
> +}
> +
> +static void mdp_m2m_worker(struct work_struct *work)
> +{
> +	struct mdp_m2m_ctx *ctx = container_of(work, struct mdp_m2m_ctx, work);
> +	struct mdp_frame *frame;
> +	struct vb2_v4l2_buffer *src_vb, *dst_vb;
> +	struct img_ipi_frameparam param = {0};
> +	struct mdp_cmdq_param task = {0};
> +	enum vb2_buffer_state vb_state = VB2_BUF_STATE_ERROR;
> +	int ret;
> +
> +	if (mdp_m2m_ctx_is_state_set(ctx, MDP_M2M_CTX_ERROR)) {
> +		dev_err(&ctx->mdp_dev->pdev->dev,
> +			"mdp_m2m_ctx is in error state\n");
> +		goto worker_end;
> +	}
> +
> +	param.frame_no = ctx->curr_param.frame_no;
> +	param.type = ctx->curr_param.type;
> +	param.num_inputs = 1;
> +	param.num_outputs = 1;
> +
> +	frame = ctx_get_frame(ctx, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
> +	src_vb = v4l2_m2m_next_src_buf(ctx->m2m_ctx);
> +	mdp_set_src_config(&param.inputs[0], frame, &src_vb->vb2_buf);
> +
> +	frame = ctx_get_frame(ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
> +	dst_vb = v4l2_m2m_next_dst_buf(ctx->m2m_ctx);
> +	mdp_set_dst_config(&param.outputs[0], frame, &dst_vb->vb2_buf);
> +
> +	dst_vb->vb2_buf.timestamp = src_vb->vb2_buf.timestamp;

This can be dropped (done by v4l2_m2m_buf_copy_metadata()).

> +	param.timestamp = src_vb->vb2_buf.timestamp;
> +
> +	ret = mdp_vpu_process(&ctx->vpu, &param);
> +	if (ret) {
> +		dev_err(&ctx->mdp_dev->pdev->dev,
> +			"VPU MDP process failed: %d\n", ret);
> +		goto worker_end;
> +	}
> +
> +	task.config = ctx->vpu.config;
> +	task.param = &param;
> +	task.composes[0] = &frame->compose;
> +	task.cmdq_cb = NULL;
> +	task.cb_data = NULL;
> +	task.mdp_ctx = ctx;
> +
> +	ret = mdp_cmdq_send(ctx->mdp_dev, &task);
> +	if (ret) {
> +		dev_err(&ctx->mdp_dev->pdev->dev,
> +			"CMDQ sendtask failed: %d\n", ret);
> +		goto worker_end;
> +	}
> +
> +	return;
> +
> +worker_end:
> +	mdp_m2m_process_done(ctx, vb_state);
> +}
> +
> +static void mdp_m2m_device_run(void *priv)
> +{
> +	struct mdp_m2m_ctx *ctx = priv;
> +
> +	queue_work(ctx->mdp_dev->job_wq, &ctx->work);
> +}
> +
> +static int mdp_m2m_start_streaming(struct vb2_queue *q, unsigned int count)
> +{
> +	struct mdp_m2m_ctx *ctx = vb2_get_drv_priv(q);
> +
> +	ctx->frame_count = 0;
> +
> +	return 0;
> +}
> +
> +static struct vb2_v4l2_buffer *mdp_m2m_buf_remove(struct mdp_m2m_ctx *ctx,
> +						  unsigned int type)
> +{
> +	if (V4L2_TYPE_IS_OUTPUT(type))
> +		return (struct vb2_v4l2_buffer *)
> +			v4l2_m2m_src_buf_remove(ctx->m2m_ctx);
> +	else
> +		return (struct vb2_v4l2_buffer *)
> +			v4l2_m2m_dst_buf_remove(ctx->m2m_ctx);
> +}
> +
> +static void mdp_m2m_stop_streaming(struct vb2_queue *q)
> +{
> +	struct mdp_m2m_ctx *ctx = vb2_get_drv_priv(q);
> +	struct vb2_v4l2_buffer *vb;
> +
> +	vb = mdp_m2m_buf_remove(ctx, q->type);
> +	while (vb) {
> +		v4l2_m2m_buf_done(vb, VB2_BUF_STATE_ERROR);
> +		vb = mdp_m2m_buf_remove(ctx, q->type);
> +	}
> +}
> +
> +static int mdp_m2m_queue_setup(struct vb2_queue *q,
> +			       unsigned int *num_buffers,
> +			       unsigned int *num_planes, unsigned int sizes[],
> +			       struct device *alloc_devs[])
> +{
> +	struct mdp_m2m_ctx *ctx = vb2_get_drv_priv(q);
> +	struct v4l2_pix_format_mplane *pix_mp;
> +	struct device *dev = &ctx->mdp_dev->pdev->dev;
> +	u32 i;
> +
> +	pix_mp = &ctx_get_frame(ctx, q->type)->format.fmt.pix_mp;
> +
> +	/* from VIDIOC_CREATE_BUFS */
> +	if (*num_planes) {
> +		if (*num_planes != pix_mp->num_planes)
> +			return -EINVAL;
> +		for (i = 0; i < pix_mp->num_planes; ++i)
> +			if (sizes[i] < pix_mp->plane_fmt[i].sizeimage)
> +				return -EINVAL;
> +	} else {/* from VIDIOC_REQBUFS */
> +		*num_planes = pix_mp->num_planes;
> +		for (i = 0; i < pix_mp->num_planes; ++i)
> +			sizes[i] = pix_mp->plane_fmt[i].sizeimage;
> +	}
> +
> +	dev_info(dev, "[%d] type:%d, planes:%u, buffers:%u, size:%u,%u,%u",
> +		ctx->id, q->type, *num_planes, *num_buffers,
> +		sizes[0], sizes[1], sizes[2]);
> +	return 0;
> +}
> +
> +static int mdp_m2m_buf_prepare(struct vb2_buffer *vb)
> +{
> +	struct mdp_m2m_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
> +	struct v4l2_pix_format_mplane *pix_mp;
> +	struct vb2_v4l2_buffer *v4l2_buf = to_vb2_v4l2_buffer(vb);
> +	u32 i;
> +
> +	v4l2_buf->field = V4L2_FIELD_NONE;
> +
> +	if (!V4L2_TYPE_IS_OUTPUT(vb->type)) {
> +		pix_mp = &ctx_get_frame(ctx, vb->type)->format.fmt.pix_mp;
> +		for (i = 0; i < pix_mp->num_planes; ++i) {
> +			vb2_set_plane_payload(vb, i,
> +					      pix_mp->plane_fmt[i].sizeimage);
> +		}
> +	}
> +	return 0;
> +}
> +
> +static int mdp_m2m_buf_out_validate(struct vb2_buffer *vb)
> +{
> +	struct vb2_v4l2_buffer *v4l2_buf = to_vb2_v4l2_buffer(vb);
> +
> +	v4l2_buf->field = V4L2_FIELD_NONE;
> +
> +	return 0;
> +}
> +
> +static void mdp_m2m_buf_queue(struct vb2_buffer *vb)
> +{
> +	struct mdp_m2m_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
> +	struct vb2_v4l2_buffer *v4l2_buf = to_vb2_v4l2_buffer(vb);
> +
> +	v4l2_buf->field = V4L2_FIELD_NONE;
> +
> +	v4l2_m2m_buf_queue(ctx->m2m_ctx, to_vb2_v4l2_buffer(vb));
> +}
> +
> +static const struct vb2_ops mdp_m2m_qops = {
> +	.queue_setup	= mdp_m2m_queue_setup,
> +	.wait_prepare	= mdp_m2m_ctx_unlock,
> +	.wait_finish	= mdp_m2m_ctx_lock,

Use vb2_ops_wait_prepare/finish instead of rolling your own.

> +	.buf_prepare	= mdp_m2m_buf_prepare,
> +	.start_streaming = mdp_m2m_start_streaming,
> +	.stop_streaming	= mdp_m2m_stop_streaming,
> +	.buf_queue	= mdp_m2m_buf_queue,
> +	.buf_out_validate = mdp_m2m_buf_out_validate,
> +};
> +
> +static int mdp_m2m_querycap(struct file *file, void *fh,
> +			    struct v4l2_capability *cap)
> +{
> +	struct mdp_m2m_ctx *ctx = fh_to_ctx(fh);
> +
> +	strscpy(cap->driver, MDP_MODULE_NAME, sizeof(cap->driver));
> +	strscpy(cap->card, ctx->mdp_dev->pdev->name, sizeof(cap->card));
> +	strscpy(cap->bus_info, "platform:mtk-mdp3", sizeof(cap->bus_info));
> +	cap->capabilities = V4L2_CAP_VIDEO_M2M_MPLANE | V4L2_CAP_STREAMING |
> +			V4L2_CAP_DEVICE_CAPS; /* | V4L2_CAP_META_OUTPUT */
> +	cap->device_caps = V4L2_CAP_VIDEO_M2M_MPLANE | V4L2_CAP_STREAMING;

Drop these two assignments. Instead just set device_caps of struct video_device.

> +	return 0;
> +}
> +
> +static int mdp_m2m_enum_fmt_mplane(struct file *file, void *fh,
> +				   struct v4l2_fmtdesc *f)
> +{
> +	return mdp_enum_fmt_mplane(f);
> +}
> +
> +static int mdp_m2m_g_fmt_mplane(struct file *file, void *fh,
> +				struct v4l2_format *f)
> +{
> +	struct mdp_m2m_ctx *ctx = fh_to_ctx(fh);
> +	struct mdp_frame *frame;
> +	struct v4l2_pix_format_mplane *pix_mp;
> +	struct device *dev = &ctx->mdp_dev->pdev->dev;
> +
> +	frame = ctx_get_frame(ctx, f->type);
> +	*f = frame->format;
> +	pix_mp = &f->fmt.pix_mp;
> +	pix_mp->colorspace = ctx->curr_param.colorspace;
> +	pix_mp->xfer_func = ctx->curr_param.xfer_func;
> +	pix_mp->ycbcr_enc = ctx->curr_param.ycbcr_enc;
> +	pix_mp->quantization = ctx->curr_param.quant;
> +
> +	dev_info(dev, "[%d] type:%d, frame:%ux%u colorspace=%d", ctx->id, f->type,
> +		 f->fmt.pix_mp.width, f->fmt.pix_mp.height,
> +		 f->fmt.pix_mp.colorspace);
> +	return 0;
> +}
> +
> +static int mdp_m2m_s_fmt_mplane(struct file *file, void *fh,
> +				struct v4l2_format *f)
> +{
> +	struct mdp_m2m_ctx *ctx = fh_to_ctx(fh);
> +	struct mdp_frame *frame = ctx_get_frame(ctx, f->type);
> +	struct mdp_frame *capture;
> +	const struct mdp_format *fmt;
> +	struct vb2_queue *vq;
> +	struct device *dev = &ctx->mdp_dev->pdev->dev;
> +
> +	dev_info(dev, "[%d] type:%d", ctx->id, f->type);
> +
> +	fmt = mdp_try_fmt_mplane(f, &ctx->curr_param, ctx->id);
> +	if (!fmt) {
> +		dev_info(dev, "[%d] try_fmt failed, type:%d", ctx->id, f->type);
> +		return -EINVAL;
> +	}
> +
> +	vq = v4l2_m2m_get_vq(ctx->m2m_ctx, f->type);
> +	if (vb2_is_streaming(vq)) {
> +		dev_info(&ctx->mdp_dev->pdev->dev, "Queue %d busy\n", f->type);
> +		return -EBUSY;
> +	}
> +
> +	frame->format = *f;
> +	frame->mdp_fmt = fmt;
> +	frame->ycbcr_prof = mdp_map_ycbcr_prof_mplane(f, fmt->mdp_color);
> +	frame->usage = V4L2_TYPE_IS_OUTPUT(f->type) ?
> +		MDP_BUFFER_USAGE_HW_READ : MDP_BUFFER_USAGE_MDP;
> +
> +	capture = ctx_get_frame(ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
> +	if (V4L2_TYPE_IS_OUTPUT(f->type)) {
> +		capture->crop.c.left = 0;
> +		capture->crop.c.top = 0;
> +		capture->crop.c.width = f->fmt.pix_mp.width;
> +		capture->crop.c.height = f->fmt.pix_mp.height;
> +		ctx->curr_param.colorspace = f->fmt.pix_mp.colorspace;
> +		ctx->curr_param.ycbcr_enc = f->fmt.pix_mp.ycbcr_enc;
> +		ctx->curr_param.quant = f->fmt.pix_mp.quantization;
> +		ctx->curr_param.xfer_func = f->fmt.pix_mp.xfer_func;
> +	} else {
> +		capture->compose.left = 0;
> +		capture->compose.top = 0;
> +		capture->compose.width = f->fmt.pix_mp.width;
> +		capture->compose.height = f->fmt.pix_mp.height;
> +	}
> +
> +	ctx->frame_count = 0;
> +
> +	dev_info(dev, "[%d] type:%d, frame:%ux%u", ctx->id, f->type,
> +		 f->fmt.pix_mp.width, f->fmt.pix_mp.height);
> +	return 0;
> +}
> +
> +static int mdp_m2m_try_fmt_mplane(struct file *file, void *fh,
> +				  struct v4l2_format *f)
> +{
> +	struct mdp_m2m_ctx *ctx = fh_to_ctx(fh);
> +
> +	if (!mdp_try_fmt_mplane(f, &ctx->curr_param, ctx->id))
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +static int mdp_m2m_reqbufs(struct file *file, void *fh,
> +			   struct v4l2_requestbuffers *reqbufs)
> +{
> +	struct mdp_m2m_ctx *ctx = fh_to_ctx(fh);
> +
> +	return v4l2_m2m_reqbufs(file, ctx->m2m_ctx, reqbufs);
> +}

Why not use v4l2_m2m_ioctl_reqbufs()?

> +
> +static int mdp_m2m_streamon(struct file *file, void *fh,
> +			    enum v4l2_buf_type type)
> +{
> +	struct mdp_m2m_ctx *ctx = fh_to_ctx(fh);
> +	struct mdp_frame *capture;
> +	int ret;
> +	bool out_streaming, cap_streaming;
> +
> +	capture = ctx_get_frame(ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
> +	out_streaming = ctx->m2m_ctx->out_q_ctx.q.streaming;
> +	cap_streaming = ctx->m2m_ctx->cap_q_ctx.q.streaming;
> +
> +	/* Check to see if scaling ratio is within supported range */
> +	if ((V4L2_TYPE_IS_OUTPUT(type) && cap_streaming) ||
> +	    (!V4L2_TYPE_IS_OUTPUT(type) && out_streaming)) {
> +		ret = mdp_check_scaling_ratio(&capture->crop.c,
> +					      &capture->compose,
> +					      capture->rotation,
> +					      ctx->curr_param.limit);
> +		if (ret) {
> +			dev_info(&ctx->mdp_dev->pdev->dev,
> +				 "Out of scaling range\n");
> +			return ret;
> +		}
> +	}
> +
> +	if (!mdp_m2m_ctx_is_state_set(ctx, MDP_VPU_INIT)) {
> +		ret = mdp_vpu_get_locked(ctx->mdp_dev);
> +		if (ret)
> +			return ret;
> +
> +		ret = mdp_vpu_ctx_init(&ctx->vpu, &ctx->mdp_dev->vpu,
> +				       MDP_DEV_M2M);
> +		if (ret) {
> +			dev_err(&ctx->mdp_dev->pdev->dev,
> +				"VPU init failed %d\n", ret);
> +			return -EINVAL;
> +		}
> +		mdp_m2m_ctx_set_state(ctx, MDP_VPU_INIT);
> +	}
> +
> +	return v4l2_m2m_streamon(file, ctx->m2m_ctx, type);
> +}
> +
> +static int mdp_m2m_g_selection(struct file *file, void *fh,
> +			       struct v4l2_selection *s)
> +{
> +	struct mdp_m2m_ctx *ctx = fh_to_ctx(fh);
> +	struct mdp_frame *frame;
> +	struct device *dev = &ctx->mdp_dev->pdev->dev;
> +	bool valid = false;
> +
> +	if (s->type <= V4L2_BUF_TYPE_META_OUTPUT) {

Huh? Please do a proper test for a valid type field. This test would
allow e.g. V4L2_BUF_TYPE_SLICED_VBI_CAPTURE as well, and that can't
be right.

> +		if (V4L2_TYPE_IS_OUTPUT(s->type))
> +			valid = mdp_target_is_crop(s->target);
> +		else
> +			valid = mdp_target_is_compose(s->target);
> +	}
> +
> +	if (!valid) {
> +		dev_info(dev, "[%d] invalid type:%u target:%u", ctx->id, s->type,
> +			 s->target);
> +		return -EINVAL;
> +	}
> +
> +	switch (s->target) {
> +	case V4L2_SEL_TGT_CROP:
> +		frame = ctx_get_frame(ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
> +		s->r = frame->crop.c;
> +		return 0;
> +	case V4L2_SEL_TGT_COMPOSE:

The CROP and COMPOSE targets should return -EINVAL for any type other than
V4L2_BUF_TYPE_VIDEO_CAPTURE.

Note that the v4l2 core will map CAPTURE/OUTPUT_MPLANE type values to
CAPTURE/OUTPUT, so in the driver you only need to check against the non-mplane
variants. See the Note in 7.39.4 here:

https://hverkuil.home.xs4all.nl/spec/userspace-api/v4l/vidioc-g-selection.html

> +		frame = ctx_get_frame(ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
> +		s->r = frame->compose;
> +		return 0;
> +	case V4L2_SEL_TGT_CROP_DEFAULT:
> +	case V4L2_SEL_TGT_CROP_BOUNDS:
> +	case V4L2_SEL_TGT_COMPOSE_DEFAULT:
> +	case V4L2_SEL_TGT_COMPOSE_BOUNDS:

So both capture and output can do both cropping and composing?
That can't be right.

> +		frame = ctx_get_frame(ctx, s->type);
> +		s->r.left = 0;
> +		s->r.top = 0;
> +		s->r.width = frame->format.fmt.pix_mp.width;
> +		s->r.height = frame->format.fmt.pix_mp.height;
> +		return 0;
> +	}
> +	return -EINVAL;
> +}
> +
> +static int mdp_m2m_s_selection(struct file *file, void *fh,
> +			       struct v4l2_selection *s)
> +{
> +	struct mdp_m2m_ctx *ctx = fh_to_ctx(fh);
> +	struct mdp_frame *frame = ctx_get_frame(ctx, s->type);
> +	struct mdp_frame *capture;
> +	struct v4l2_rect r;
> +	struct device *dev = &ctx->mdp_dev->pdev->dev;
> +	bool valid = false;
> +	int ret;
> +
> +	if (s->type <= V4L2_BUF_TYPE_META_OUTPUT) {
> +		if (V4L2_TYPE_IS_OUTPUT(s->type))
> +			valid = (s->target == V4L2_SEL_TGT_CROP);
> +		else
> +			valid = (s->target == V4L2_SEL_TGT_COMPOSE);
> +	}

Similar issues as described in g_selection are present here as well.

> +	if (!valid) {
> +		dev_err(dev, "[%d] invalid type:%u target:%u", ctx->id, s->type,
> +			s->target);
> +		return -EINVAL;
> +	}
> +
> +	ret = mdp_try_crop(&r, s, frame, ctx->id);
> +	if (ret)
> +		return ret;
> +	capture = ctx_get_frame(ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
> +
> +	if (mdp_target_is_crop(s->target))
> +		capture->crop.c = r;
> +	else
> +		capture->compose = r;
> +
> +	s->r = r;
> +	memset(s->reserved, 0, sizeof(s->reserved));
> +
> +	ctx->frame_count = 0;
> +	return 0;
> +}
> +
> +static const struct v4l2_ioctl_ops mdp_m2m_ioctl_ops = {
> +	.vidioc_querycap		= mdp_m2m_querycap,
> +	.vidioc_enum_fmt_vid_cap	= mdp_m2m_enum_fmt_mplane,
> +	.vidioc_enum_fmt_vid_out	= mdp_m2m_enum_fmt_mplane,
> +	.vidioc_g_fmt_vid_cap_mplane	= mdp_m2m_g_fmt_mplane,
> +	.vidioc_g_fmt_vid_out_mplane	= mdp_m2m_g_fmt_mplane,
> +	.vidioc_s_fmt_vid_cap_mplane	= mdp_m2m_s_fmt_mplane,
> +	.vidioc_s_fmt_vid_out_mplane	= mdp_m2m_s_fmt_mplane,
> +	.vidioc_try_fmt_vid_cap_mplane	= mdp_m2m_try_fmt_mplane,
> +	.vidioc_try_fmt_vid_out_mplane	= mdp_m2m_try_fmt_mplane,
> +	.vidioc_reqbufs			= mdp_m2m_reqbufs,
> +	.vidioc_querybuf		= v4l2_m2m_ioctl_querybuf,
> +	.vidioc_qbuf			= v4l2_m2m_ioctl_qbuf,
> +	.vidioc_expbuf			= v4l2_m2m_ioctl_expbuf,
> +	.vidioc_dqbuf			= v4l2_m2m_ioctl_dqbuf,
> +	.vidioc_create_bufs		= v4l2_m2m_ioctl_create_bufs,
> +	.vidioc_streamon		= mdp_m2m_streamon,
> +	.vidioc_streamoff		= v4l2_m2m_ioctl_streamoff,
> +	.vidioc_g_selection		= mdp_m2m_g_selection,
> +	.vidioc_s_selection		= mdp_m2m_s_selection,
> +	.vidioc_subscribe_event		= v4l2_ctrl_subscribe_event,
> +	.vidioc_unsubscribe_event	= v4l2_event_unsubscribe,
> +};
> +
> +static int mdp_m2m_queue_init(void *priv,
> +			      struct vb2_queue *src_vq,
> +			      struct vb2_queue *dst_vq)
> +{
> +	struct mdp_m2m_ctx *ctx = priv;
> +	int ret;
> +
> +	src_vq->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
> +	src_vq->io_modes = VB2_MMAP | VB2_DMABUF;
> +	src_vq->ops = &mdp_m2m_qops;
> +	src_vq->mem_ops = &vb2_dma_contig_memops;
> +	src_vq->drv_priv = ctx;
> +	src_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
> +	src_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
> +	src_vq->dev = &ctx->mdp_dev->pdev->dev;

You want to set the lock field as well.

> +
> +	ret = vb2_queue_init(src_vq);
> +	if (ret)
> +		return ret;
> +
> +	dst_vq->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
> +	dst_vq->io_modes = VB2_MMAP | VB2_DMABUF;
> +	dst_vq->ops = &mdp_m2m_qops;
> +	dst_vq->mem_ops = &vb2_dma_contig_memops;
> +	dst_vq->drv_priv = ctx;
> +	dst_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
> +	dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
> +	dst_vq->dev = &ctx->mdp_dev->pdev->dev;

Ditto.

> +
> +	return vb2_queue_init(dst_vq);
> +}
> +
> +static int mdp_m2m_s_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct mdp_m2m_ctx *ctx = ctrl_to_ctx(ctrl);
> +	struct mdp_frame *capture;
> +
> +	if (ctrl->flags & V4L2_CTRL_FLAG_INACTIVE)
> +		return 0;
> +
> +	capture = ctx_get_frame(ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
> +	switch (ctrl->id) {
> +	case V4L2_CID_HFLIP:
> +		capture->hflip = ctrl->val;
> +		break;
> +	case V4L2_CID_VFLIP:
> +		capture->vflip = ctrl->val;
> +		break;
> +	case V4L2_CID_ROTATE:
> +		capture->rotation = ctrl->val;
> +		break;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct v4l2_ctrl_ops mdp_m2m_ctrl_ops = {
> +	.s_ctrl	= mdp_m2m_s_ctrl,
> +};
> +
> +static int mdp_m2m_ctrls_create(struct mdp_m2m_ctx *ctx)
> +{
> +	v4l2_ctrl_handler_init(&ctx->ctrl_handler, MDP_MAX_CTRLS);
> +	ctx->ctrls.hflip = v4l2_ctrl_new_std(&ctx->ctrl_handler,
> +					     &mdp_m2m_ctrl_ops, V4L2_CID_HFLIP,
> +					     0, 1, 1, 0);
> +	ctx->ctrls.vflip = v4l2_ctrl_new_std(&ctx->ctrl_handler,
> +					     &mdp_m2m_ctrl_ops, V4L2_CID_VFLIP,
> +					     0, 1, 1, 0);
> +	ctx->ctrls.rotate = v4l2_ctrl_new_std(&ctx->ctrl_handler,
> +					      &mdp_m2m_ctrl_ops,
> +					      V4L2_CID_ROTATE, 0, 270, 90, 0);
> +
> +	if (ctx->ctrl_handler.error) {
> +		int err = ctx->ctrl_handler.error;
> +
> +		v4l2_ctrl_handler_free(&ctx->ctrl_handler);
> +		dev_err(&ctx->mdp_dev->pdev->dev,
> +			"Failed to register controls\n");
> +		return err;
> +	}
> +	return 0;
> +}
> +
> +static int mdp_m2m_open(struct file *file)
> +{
> +	struct video_device *vdev = video_devdata(file);
> +	struct mdp_dev *mdp = video_get_drvdata(vdev);
> +	struct mdp_m2m_ctx *ctx;
> +	struct device *dev = &mdp->pdev->dev;
> +	int ret;
> +	struct v4l2_format default_format;
> +
> +	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
> +	if (!ctx)
> +		return -ENOMEM;
> +
> +	if (mutex_lock_interruptible(&mdp->m2m_lock)) {
> +		ret = -ERESTARTSYS;
> +		goto err_free_ctx;
> +	}
> +
> +	ctx->id = ida_alloc(&mdp->mdp_ida, GFP_KERNEL);
> +	ctx->mdp_dev = mdp;
> +
> +	v4l2_fh_init(&ctx->fh, vdev);
> +	vdev->device_caps = V4L2_CAP_VIDEO_M2M_MPLANE | V4L2_CAP_STREAMING;
> +	file->private_data = &ctx->fh;
> +	ret = mdp_m2m_ctrls_create(ctx);
> +	if (ret)
> +		goto err_exit_fh;
> +
> +	/* Use separate control handler per file handle */
> +	ctx->fh.ctrl_handler = &ctx->ctrl_handler;
> +	v4l2_fh_add(&ctx->fh);
> +
> +	ctx->m2m_ctx = v4l2_m2m_ctx_init(mdp->m2m_dev, ctx, mdp_m2m_queue_init);
> +	if (IS_ERR(ctx->m2m_ctx)) {
> +		dev_err(dev, "Failed to initialize m2m context\n");
> +		ret = PTR_ERR(ctx->m2m_ctx);
> +		goto err_release_handler;
> +	}
> +	ctx->fh.m2m_ctx = ctx->m2m_ctx;
> +
> +	INIT_WORK(&ctx->work, mdp_m2m_worker);
> +
> +	ret = mdp_frameparam_init(&ctx->curr_param);
> +	if (ret) {
> +		dev_err(dev, "Failed to initialize mdp parameter\n");
> +		goto err_release_m2m_ctx;
> +	}
> +
> +	mutex_unlock(&mdp->m2m_lock);
> +
> +	/* Default format */
> +	memset(&default_format, 0, sizeof(default_format));
> +	default_format.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
> +	default_format.fmt.pix_mp.width = 32;
> +	default_format.fmt.pix_mp.height = 32;
> +	default_format.fmt.pix_mp.pixelformat = V4L2_PIX_FMT_YUV420M;
> +	mdp_m2m_s_fmt_mplane(file, &ctx->fh, &default_format);
> +	default_format.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
> +	mdp_m2m_s_fmt_mplane(file, &ctx->fh, &default_format);
> +
> +	dev_dbg(dev, "%s:[%d]", __func__, ctx->id);
> +
> +	return 0;
> +
> +err_release_m2m_ctx:
> +	v4l2_m2m_ctx_release(ctx->m2m_ctx);
> +err_release_handler:
> +	v4l2_ctrl_handler_free(&ctx->ctrl_handler);
> +	v4l2_fh_del(&ctx->fh);
> +err_exit_fh:
> +	v4l2_fh_exit(&ctx->fh);
> +	mutex_unlock(&mdp->m2m_lock);
> +err_free_ctx:
> +	kfree(ctx);
> +
> +	return ret;
> +}
> +
> +static int mdp_m2m_release(struct file *file)
> +{
> +	struct mdp_m2m_ctx *ctx = fh_to_ctx(file->private_data);
> +	struct mdp_dev *mdp = video_drvdata(file);
> +	struct device *dev = &mdp->pdev->dev;
> +
> +	mutex_lock(&mdp->m2m_lock);
> +	v4l2_m2m_ctx_release(ctx->m2m_ctx);
> +	if (mdp_m2m_ctx_is_state_set(ctx, MDP_VPU_INIT)) {
> +		mdp_vpu_ctx_deinit(&ctx->vpu);
> +		mdp_vpu_put_locked(mdp);
> +	}
> +
> +	v4l2_ctrl_handler_free(&ctx->ctrl_handler);
> +	v4l2_fh_del(&ctx->fh);
> +	v4l2_fh_exit(&ctx->fh);
> +	ida_free(&mdp->mdp_ida, ctx->id);
> +	mutex_unlock(&mdp->m2m_lock);
> +
> +	dev_info(dev, "%s:[%d]", __func__, ctx->id);
> +	kfree(ctx);
> +
> +	return 0;
> +}
> +
> +static const struct v4l2_file_operations mdp_m2m_fops = {
> +	.owner		= THIS_MODULE,
> +	.poll		= v4l2_m2m_fop_poll,
> +	.unlocked_ioctl	= video_ioctl2,
> +	.mmap		= v4l2_m2m_fop_mmap,
> +	.open		= mdp_m2m_open,
> +	.release	= mdp_m2m_release,
> +};
> +
> +static const struct v4l2_m2m_ops mdp_m2m_ops = {
> +	.device_run	= mdp_m2m_device_run,
> +	.job_abort	= mdp_m2m_job_abort,
> +};
> +
> +int mdp_m2m_device_register(struct mdp_dev *mdp)
> +{
> +	struct device *dev = &mdp->pdev->dev;
> +	int ret = 0;
> +
> +	mdp->m2m_vdev = video_device_alloc();
> +	if (!mdp->m2m_vdev) {
> +		dev_err(dev, "Failed to allocate video device\n");
> +		ret = -ENOMEM;
> +		goto err_video_alloc;
> +	}
> +	mdp->m2m_vdev->device_caps = V4L2_CAP_VIDEO_M2M_MPLANE |
> +		V4L2_CAP_STREAMING;
> +	mdp->m2m_vdev->fops = &mdp_m2m_fops;
> +	mdp->m2m_vdev->ioctl_ops = &mdp_m2m_ioctl_ops;
> +	mdp->m2m_vdev->release = video_device_release;
> +	mdp->m2m_vdev->lock = &mdp->m2m_lock;
> +	mdp->m2m_vdev->vfl_dir = VFL_DIR_M2M;
> +	mdp->m2m_vdev->v4l2_dev = &mdp->v4l2_dev;
> +	snprintf(mdp->m2m_vdev->name, sizeof(mdp->m2m_vdev->name), "%s:m2m",
> +		 MDP_MODULE_NAME);
> +	video_set_drvdata(mdp->m2m_vdev, mdp);
> +
> +	mdp->m2m_dev = v4l2_m2m_init(&mdp_m2m_ops);
> +	if (IS_ERR(mdp->m2m_dev)) {
> +		dev_err(dev, "Failed to initialize v4l2-m2m device\n");
> +		ret = PTR_ERR(mdp->m2m_dev);
> +		goto err_m2m_init;
> +	}
> +
> +	ret = video_register_device(mdp->m2m_vdev, VFL_TYPE_VIDEO, 2);
> +	if (ret) {
> +		dev_err(dev, "Failed to register video device\n");
> +		goto err_video_register;
> +	}
> +
> +	v4l2_info(&mdp->v4l2_dev, "Driver registered as /dev/video%d",
> +		  mdp->m2m_vdev->num);
> +	return 0;
> +
> +err_video_register:
> +	v4l2_m2m_release(mdp->m2m_dev);
> +err_m2m_init:
> +	video_device_release(mdp->m2m_vdev);
> +err_video_alloc:
> +
> +	return ret;
> +}
> +
> +void mdp_m2m_device_unregister(struct mdp_dev *mdp)
> +{
> +	video_unregister_device(mdp->m2m_vdev);
> +	video_device_release(mdp->m2m_vdev);

Drop this line. video_unregister_device() already calls this in the final
cleanup.

> +	v4l2_m2m_release(mdp->m2m_dev);

This belongs in the video_device release() callback function.

> +}
> +
> +void mdp_m2m_job_finish(struct mdp_m2m_ctx *ctx)
> +{
> +	enum vb2_buffer_state vb_state = VB2_BUF_STATE_DONE;
> +
> +	mdp_m2m_process_done(ctx, vb_state);
> +}
> diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-m2m.h b/drivers/media/platform/mtk-mdp3/mtk-mdp3-m2m.h
> new file mode 100644
> index 000000000000..0b48b65a3b01
> --- /dev/null
> +++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-m2m.h
> @@ -0,0 +1,41 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2021 MediaTek Inc.
> + * Author: Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
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
> +#define MDP_MAX_CTRLS	10
> +
> +struct mdp_m2m_ctrls {
> +	struct v4l2_ctrl	*hflip;
> +	struct v4l2_ctrl	*vflip;
> +	struct v4l2_ctrl	*rotate;
> +};
> +
> +struct mdp_m2m_ctx {
> +	u32				id;
> +	struct mdp_dev			*mdp_dev;
> +	struct v4l2_fh			fh;
> +	struct v4l2_ctrl_handler	ctrl_handler;
> +	struct mdp_m2m_ctrls		ctrls;
> +	struct v4l2_m2m_ctx		*m2m_ctx;
> +	struct mdp_vpu_ctx		vpu;
> +	struct work_struct		work;
> +	u32				frame_count;
> +
> +	struct mdp_frameparam		curr_param;
> +};
> +
> +int mdp_m2m_device_register(struct mdp_dev *mdp);
> +void mdp_m2m_device_unregister(struct mdp_dev *mdp);
> +void mdp_m2m_job_finish(struct mdp_m2m_ctx *ctx);
> +
> +#endif  /* __MTK_MDP3_M2M_H__ */
> diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.c b/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.c
> new file mode 100644
> index 000000000000..a6caefb097be
> --- /dev/null
> +++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.c
> @@ -0,0 +1,746 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2021 MediaTek Inc.
> + * Author: Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
> + */
> +
> +#include <media/v4l2-common.h>
> +#include <media/videobuf2-v4l2.h>
> +#include <media/videobuf2-dma-contig.h>
> +#include "mtk-mdp3-core.h"
> +#include "mtk-mdp3-regs.h"
> +
> +static const struct mdp_format mdp_formats[] = {
> +	{
> +		.pixelformat	= V4L2_PIX_FMT_GREY,
> +		.mdp_color	= MDP_COLOR_GREY,
> +		.depth		= { 8 },
> +		.row_depth	= { 8 },
> +		.num_planes	= 1,
> +		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
> +	}, {
> +		.pixelformat	= V4L2_PIX_FMT_RGB565X,
> +		.mdp_color	= MDP_COLOR_RGB565,
> +		.depth		= { 16 },
> +		.row_depth	= { 16 },
> +		.num_planes	= 1,
> +		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
> +	}, {
> +		.pixelformat	= V4L2_PIX_FMT_RGB565,
> +		.mdp_color	= MDP_COLOR_BGR565,
> +		.depth		= { 16 },
> +		.row_depth	= { 16 },
> +		.num_planes	= 1,
> +		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
> +	}, {
> +		.pixelformat	= V4L2_PIX_FMT_RGB24,
> +		.mdp_color	= MDP_COLOR_RGB888,
> +		.depth		= { 24 },
> +		.row_depth	= { 24 },
> +		.num_planes	= 1,
> +		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
> +	}, {
> +		.pixelformat	= V4L2_PIX_FMT_BGR24,
> +		.mdp_color	= MDP_COLOR_BGR888,
> +		.depth		= { 24 },
> +		.row_depth	= { 24 },
> +		.num_planes	= 1,
> +		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
> +	}, {
> +		.pixelformat	= V4L2_PIX_FMT_ABGR32,
> +		.mdp_color	= MDP_COLOR_BGRA8888,
> +		.depth		= { 32 },
> +		.row_depth	= { 32 },
> +		.num_planes	= 1,
> +		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
> +	}, {
> +		.pixelformat	= V4L2_PIX_FMT_ARGB32,
> +		.mdp_color	= MDP_COLOR_ARGB8888,
> +		.depth		= { 32 },
> +		.row_depth	= { 32 },
> +		.num_planes	= 1,
> +		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
> +	}, {
> +		.pixelformat	= V4L2_PIX_FMT_UYVY,
> +		.mdp_color	= MDP_COLOR_UYVY,
> +		.depth		= { 16 },
> +		.row_depth	= { 16 },
> +		.num_planes	= 1,
> +		.walign		= 1,
> +		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
> +	}, {
> +		.pixelformat	= V4L2_PIX_FMT_VYUY,
> +		.mdp_color	= MDP_COLOR_VYUY,
> +		.depth		= { 16 },
> +		.row_depth	= { 16 },
> +		.num_planes	= 1,
> +		.walign		= 1,
> +		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
> +	}, {
> +		.pixelformat	= V4L2_PIX_FMT_YUYV,
> +		.mdp_color	= MDP_COLOR_YUYV,
> +		.depth		= { 16 },
> +		.row_depth	= { 16 },
> +		.num_planes	= 1,
> +		.walign		= 1,
> +		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
> +	}, {
> +		.pixelformat	= V4L2_PIX_FMT_YVYU,
> +		.mdp_color	= MDP_COLOR_YVYU,
> +		.depth		= { 16 },
> +		.row_depth	= { 16 },
> +		.num_planes	= 1,
> +		.walign		= 1,
> +		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
> +	}, {
> +		.pixelformat	= V4L2_PIX_FMT_YUV420,
> +		.mdp_color	= MDP_COLOR_I420,
> +		.depth		= { 12 },
> +		.row_depth	= { 8 },
> +		.num_planes	= 1,
> +		.walign		= 1,
> +		.halign		= 1,
> +		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
> +	}, {
> +		.pixelformat	= V4L2_PIX_FMT_YVU420,
> +		.mdp_color	= MDP_COLOR_YV12,
> +		.depth		= { 12 },
> +		.row_depth	= { 8 },
> +		.num_planes	= 1,
> +		.walign		= 1,
> +		.halign		= 1,
> +		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
> +	}, {
> +		.pixelformat	= V4L2_PIX_FMT_NV12,
> +		.mdp_color	= MDP_COLOR_NV12,
> +		.depth		= { 12 },
> +		.row_depth	= { 8 },
> +		.num_planes	= 1,
> +		.walign		= 1,
> +		.halign		= 1,
> +		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
> +	}, {
> +		.pixelformat	= V4L2_PIX_FMT_NV21,
> +		.mdp_color	= MDP_COLOR_NV21,
> +		.depth		= { 12 },
> +		.row_depth	= { 8 },
> +		.num_planes	= 1,
> +		.walign		= 1,
> +		.halign		= 1,
> +		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
> +	}, {
> +		.pixelformat	= V4L2_PIX_FMT_NV16,
> +		.mdp_color	= MDP_COLOR_NV16,
> +		.depth		= { 16 },
> +		.row_depth	= { 8 },
> +		.num_planes	= 1,
> +		.walign		= 1,
> +		.flags		= MDP_FMT_FLAG_OUTPUT,
> +	}, {
> +		.pixelformat	= V4L2_PIX_FMT_NV61,
> +		.mdp_color	= MDP_COLOR_NV61,
> +		.depth		= { 16 },
> +		.row_depth	= { 8 },
> +		.num_planes	= 1,
> +		.walign		= 1,
> +		.flags		= MDP_FMT_FLAG_OUTPUT,
> +	}, {
> +		.pixelformat	= V4L2_PIX_FMT_NV24,
> +		.mdp_color	= MDP_COLOR_NV24,
> +		.depth		= { 24 },
> +		.row_depth	= { 8 },
> +		.num_planes	= 1,
> +		.flags		= MDP_FMT_FLAG_OUTPUT,
> +	}, {
> +		.pixelformat	= V4L2_PIX_FMT_NV42,
> +		.mdp_color	= MDP_COLOR_NV42,
> +		.depth		= { 24 },
> +		.row_depth	= { 8 },
> +		.num_planes	= 1,
> +		.flags		= MDP_FMT_FLAG_OUTPUT,
> +	}, {
> +		.pixelformat	= V4L2_PIX_FMT_MT21C,
> +		.mdp_color	= MDP_COLOR_420_BLK_UFO,
> +		.depth		= { 8, 4 },
> +		.row_depth	= { 8, 8 },
> +		.num_planes	= 2,
> +		.walign		= 4,
> +		.halign		= 5,
> +		.flags		= MDP_FMT_FLAG_OUTPUT,
> +	}, {
> +		.pixelformat	= V4L2_PIX_FMT_MM21,
> +		.mdp_color	= MDP_COLOR_420_BLK,
> +		.depth		= { 8, 4 },
> +		.row_depth	= { 8, 8 },
> +		.num_planes	= 2,
> +		.walign		= 4,
> +		.halign		= 5,
> +		.flags		= MDP_FMT_FLAG_OUTPUT,
> +	}, {
> +		.pixelformat	= V4L2_PIX_FMT_NV12M,
> +		.mdp_color	= MDP_COLOR_NV12,
> +		.depth		= { 8, 4 },
> +		.row_depth	= { 8, 8 },
> +		.num_planes	= 2,
> +		.walign		= 1,
> +		.halign		= 1,
> +		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
> +	}, {
> +		.pixelformat	= V4L2_PIX_FMT_NV21M,
> +		.mdp_color	= MDP_COLOR_NV21,
> +		.depth		= { 8, 4 },
> +		.row_depth	= { 8, 8 },
> +		.num_planes	= 2,
> +		.walign		= 1,
> +		.halign		= 1,
> +		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
> +	}, {
> +		.pixelformat	= V4L2_PIX_FMT_NV16M,
> +		.mdp_color	= MDP_COLOR_NV16,
> +		.depth		= { 8, 8 },
> +		.row_depth	= { 8, 8 },
> +		.num_planes	= 2,
> +		.walign		= 1,
> +		.flags		= MDP_FMT_FLAG_OUTPUT,
> +	}, {
> +		.pixelformat	= V4L2_PIX_FMT_NV61M,
> +		.mdp_color	= MDP_COLOR_NV61,
> +		.depth		= { 8, 8 },
> +		.row_depth	= { 8, 8 },
> +		.num_planes	= 2,
> +		.walign		= 1,
> +		.flags		= MDP_FMT_FLAG_OUTPUT,
> +	}, {
> +		.pixelformat	= V4L2_PIX_FMT_YUV420M,
> +		.mdp_color	= MDP_COLOR_I420,
> +		.depth		= { 8, 2, 2 },
> +		.row_depth	= { 8, 4, 4 },
> +		.num_planes	= 3,
> +		.walign		= 1,
> +		.halign		= 1,
> +		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
> +	}, {
> +		.pixelformat	= V4L2_PIX_FMT_YVU420M,
> +		.mdp_color	= MDP_COLOR_YV12,
> +		.depth		= { 8, 2, 2 },
> +		.row_depth	= { 8, 4, 4 },
> +		.num_planes	= 3,
> +		.walign		= 1,
> +		.halign		= 1,
> +		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
> +	}
> +};
> +
> +static const struct mdp_limit mdp_def_limit = {
> +	.out_limit = {
> +		.wmin	= 16,
> +		.hmin	= 16,
> +		.wmax	= 8176,
> +		.hmax	= 8176,
> +	},
> +	.cap_limit = {
> +		.wmin	= 2,
> +		.hmin	= 2,
> +		.wmax	= 8176,
> +		.hmax	= 8176,
> +	},
> +	.h_scale_up_max = 32,
> +	.v_scale_up_max = 32,
> +	.h_scale_down_max = 20,
> +	.v_scale_down_max = 128,
> +};
> +
> +static const struct mdp_format *mdp_find_fmt(u32 pixelformat, u32 type)
> +{
> +	u32 i, flag;
> +
> +	flag = V4L2_TYPE_IS_OUTPUT(type) ? MDP_FMT_FLAG_OUTPUT :
> +					MDP_FMT_FLAG_CAPTURE;
> +	for (i = 0; i < ARRAY_SIZE(mdp_formats); ++i) {
> +		if (!(mdp_formats[i].flags & flag))
> +			continue;
> +		if (mdp_formats[i].pixelformat == pixelformat)
> +			return &mdp_formats[i];
> +	}
> +	return NULL;
> +}
> +
> +static const struct mdp_format *mdp_find_fmt_by_index(u32 index, u32 type)
> +{
> +	u32 i, flag, num = 0;
> +
> +	flag = V4L2_TYPE_IS_OUTPUT(type) ? MDP_FMT_FLAG_OUTPUT :
> +					MDP_FMT_FLAG_CAPTURE;
> +	for (i = 0; i < ARRAY_SIZE(mdp_formats); ++i) {
> +		if (!(mdp_formats[i].flags & flag))
> +			continue;
> +		if (index == num)
> +			return &mdp_formats[i];
> +		num++;
> +	}
> +	return NULL;
> +}
> +
> +enum mdp_ycbcr_profile mdp_map_ycbcr_prof_mplane(struct v4l2_format *f,
> +						 u32 mdp_color)
> +{
> +	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
> +
> +	if (MDP_COLOR_IS_RGB(mdp_color))
> +		return MDP_YCBCR_PROFILE_FULL_BT601;
> +
> +	switch (pix_mp->colorspace) {
> +	case V4L2_COLORSPACE_JPEG:
> +		return MDP_YCBCR_PROFILE_JPEG;
> +	case V4L2_COLORSPACE_REC709:
> +	case V4L2_COLORSPACE_DCI_P3:
> +		if (pix_mp->quantization == V4L2_QUANTIZATION_FULL_RANGE)
> +			return MDP_YCBCR_PROFILE_FULL_BT709;
> +		return MDP_YCBCR_PROFILE_BT709;
> +	case V4L2_COLORSPACE_BT2020:
> +		if (pix_mp->quantization == V4L2_QUANTIZATION_FULL_RANGE)
> +			return MDP_YCBCR_PROFILE_FULL_BT2020;
> +		return MDP_YCBCR_PROFILE_BT2020;
> +	default:
> +		if (pix_mp->quantization == V4L2_QUANTIZATION_FULL_RANGE)
> +			return MDP_YCBCR_PROFILE_FULL_BT601;
> +		return MDP_YCBCR_PROFILE_BT601;
> +	}
> +}
> +
> +static void mdp_bound_align_image(u32 *w, unsigned int wmin, unsigned int wmax,
> +				  unsigned int walign,
> +				  u32 *h, unsigned int hmin, unsigned int hmax,
> +				  unsigned int halign, unsigned int salign)
> +{
> +	unsigned int org_w, org_h, wstep, hstep;
> +
> +	org_w = *w;
> +	org_h = *h;
> +	v4l_bound_align_image(w, wmin, wmax, walign, h, hmin, hmax, halign,
> +			      salign);
> +
> +	wstep = 1 << walign;
> +	hstep = 1 << halign;
> +	if (*w < org_w && (*w + wstep) <= wmax)
> +		*w += wstep;
> +	if (*h < org_h && (*h + hstep) <= hmax)
> +		*h += hstep;
> +}
> +
> +static int mdp_clamp_align(s32 *x, int min, int max, unsigned int align)
> +{
> +	unsigned int mask;
> +
> +	if (min < 0 || max < 0)
> +		return -ERANGE;
> +
> +	/* Bits that must be zero to be aligned */
> +	mask = ~((1 << align) - 1);
> +
> +	min = 0 ? 0 : ((min + ~mask) & mask);
> +	max = max & mask;
> +	if ((unsigned int)min > (unsigned int)max)
> +		return -ERANGE;
> +
> +	/* Clamp to aligned min and max */
> +	*x = clamp(*x, min, max);
> +
> +	/* Round to nearest aligned value */
> +	if (align)
> +		*x = (*x + (1 << (align - 1))) & mask;
> +	return 0;
> +}
> +
> +int mdp_enum_fmt_mplane(struct v4l2_fmtdesc *f)
> +{
> +	const struct mdp_format *fmt;
> +
> +	if (!V4L2_TYPE_IS_MULTIPLANAR(f->type))
> +		return -EINVAL;

This check can be dropped: it can never be anything else.

> +
> +	fmt = mdp_find_fmt_by_index(f->index, f->type);
> +	if (!fmt)
> +		return -EINVAL;
> +
> +	/* f->description */

Drop this comment.

> +	f->pixelformat = fmt->pixelformat;
> +	return 0;
> +}
> +
> +const struct mdp_format *mdp_try_fmt_mplane(struct v4l2_format *f,
> +					    struct mdp_frameparam *param,
> +					    u32 ctx_id)
> +{
> +	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
> +	const struct mdp_format *fmt;
> +	const struct mdp_pix_limit *pix_limit;
> +	u32 wmin, wmax, hmin, hmax, org_w, org_h;
> +	unsigned int i;
> +
> +	if (!V4L2_TYPE_IS_MULTIPLANAR(f->type))
> +		return NULL;

This check can be dropped.

> +
> +	fmt = mdp_find_fmt(pix_mp->pixelformat, f->type);
> +	if (!fmt)
> +		fmt = mdp_find_fmt_by_index(0, f->type);
> +	if (!fmt) {
> +		pr_err("[%s:%d] pixelformat %c%c%c%c invalid", __func__, ctx_id,

dev_err is very much preferred over pr_err.

> +		       (pix_mp->pixelformat & 0xff),
> +		       (pix_mp->pixelformat >>  8) & 0xff,
> +		       (pix_mp->pixelformat >> 16) & 0xff,
> +		       (pix_mp->pixelformat >> 24) & 0xff);
> +		return NULL;
> +	}
> +
> +	pix_mp->field = V4L2_FIELD_NONE;
> +	pix_mp->flags = 0;
> +	pix_mp->pixelformat = fmt->pixelformat;
> +	if (!V4L2_TYPE_IS_OUTPUT(f->type)) {
> +		pix_mp->colorspace = param->colorspace;
> +		pix_mp->xfer_func = param->xfer_func;
> +		pix_mp->ycbcr_enc = param->ycbcr_enc;
> +		pix_mp->quantization = param->quant;
> +	}
> +	memset(pix_mp->reserved, 0, sizeof(pix_mp->reserved));

Shouldn't be necessary, it's cleared for you in v4l_try_fmt in v4l2-ioctl.c.

> +
> +	pix_limit = V4L2_TYPE_IS_OUTPUT(f->type) ? &param->limit->out_limit :
> +		&param->limit->cap_limit;
> +	wmin = pix_limit->wmin;
> +	wmax = pix_limit->wmax;
> +	hmin = pix_limit->hmin;
> +	hmax = pix_limit->hmax;
> +	org_w = pix_mp->width;
> +	org_h = pix_mp->height;
> +
> +	mdp_bound_align_image(&pix_mp->width, wmin, wmax, fmt->walign,
> +			      &pix_mp->height, hmin, hmax, fmt->halign,
> +			      fmt->salign);
> +	if (org_w != pix_mp->width || org_h != pix_mp->height)
> +		pr_err("[%s:%d] size change: %ux%u to %ux%u", __func__, ctx_id,
> +		       org_w, org_h, pix_mp->width, pix_mp->height);
> +
> +	if (pix_mp->num_planes && pix_mp->num_planes != fmt->num_planes)
> +		pr_err("[%s:%d] num of planes change: %u to %u", __func__,
> +		       ctx_id, pix_mp->num_planes, fmt->num_planes);
> +	pix_mp->num_planes = fmt->num_planes;
> +
> +	for (i = 0; i < pix_mp->num_planes; ++i) {
> +		u32 min_bpl = (pix_mp->width * fmt->row_depth[i]) / 8;
> +		u32 bpl = pix_mp->plane_fmt[i].bytesperline;
> +		u32 si;
> +
> +		if (bpl < min_bpl)
> +			bpl = min_bpl;
> +		si = (bpl * pix_mp->height * fmt->depth[i]) / fmt->row_depth[i];
> +
> +		pix_mp->plane_fmt[i].bytesperline = bpl;
> +		if (pix_mp->plane_fmt[i].sizeimage < si)
> +			pix_mp->plane_fmt[i].sizeimage = si;
> +		memset(pix_mp->plane_fmt[i].reserved, 0,
> +		       sizeof(pix_mp->plane_fmt[i].reserved));

Ditto.

> +		pr_info("[%s:%d] p%u, bpl:%u (%u), sizeimage:%u (%u)", __func__,
> +			ctx_id, i, bpl, min_bpl, pix_mp->plane_fmt[i].sizeimage,
> +			si);
> +	}
> +
> +	return fmt;
> +}
> +
> +static int mdp_clamp_start(s32 *x, int min, int max, unsigned int align,
> +			   u32 flags)
> +{
> +	if (flags & V4L2_SEL_FLAG_GE)
> +		max = *x;
> +	if (flags & V4L2_SEL_FLAG_LE)
> +		min = *x;
> +	return mdp_clamp_align(x, min, max, align);
> +}
> +
> +static int mdp_clamp_end(s32 *x, int min, int max, unsigned int align,
> +			 u32 flags)
> +{
> +	if (flags & V4L2_SEL_FLAG_GE)
> +		min = *x;
> +	if (flags & V4L2_SEL_FLAG_LE)
> +		max = *x;
> +	return mdp_clamp_align(x, min, max, align);
> +}
> +
> +int mdp_try_crop(struct v4l2_rect *r, const struct v4l2_selection *s,
> +		 struct mdp_frame *frame, u32 ctx_id)
> +{
> +	s32 left, top, right, bottom;
> +	u32 framew, frameh, walign, halign;
> +	int ret;
> +
> +	pr_info("[%s:%d] target:%d, set:(%d,%d) %ux%u", __func__, ctx_id,
> +		s->target, s->r.left, s->r.top, s->r.width, s->r.height);
> +
> +	left = s->r.left;
> +	top = s->r.top;
> +	right = s->r.left + s->r.width;
> +	bottom = s->r.top + s->r.height;
> +	framew = frame->format.fmt.pix_mp.width;
> +	frameh = frame->format.fmt.pix_mp.height;
> +
> +	if (mdp_target_is_crop(s->target)) {
> +		walign = 1;
> +		halign = 1;
> +	} else {
> +		walign = frame->mdp_fmt->walign;
> +		halign = frame->mdp_fmt->halign;
> +	}
> +
> +	pr_info("[%s:%d] align:%u,%u, bound:%ux%u", __func__, ctx_id,
> +		walign, halign, framew, frameh);
> +
> +	ret = mdp_clamp_start(&left, 0, right, walign, s->flags);
> +	if (ret)
> +		return ret;
> +	ret = mdp_clamp_start(&top, 0, bottom, halign, s->flags);
> +	if (ret)
> +		return ret;
> +	ret = mdp_clamp_end(&right, left, framew, walign, s->flags);
> +	if (ret)
> +		return ret;
> +	ret = mdp_clamp_end(&bottom, top, frameh, halign, s->flags);
> +	if (ret)
> +		return ret;
> +
> +	r->left = left;
> +	r->top = top;
> +	r->width = right - left;
> +	r->height = bottom - top;
> +
> +	pr_info("[%s:%d] crop:(%d,%d) %ux%u", __func__, ctx_id,
> +		r->left, r->top, r->width, r->height);
> +	return 0;
> +}
> +
> +int mdp_check_scaling_ratio(const struct v4l2_rect *crop,
> +			    const struct v4l2_rect *compose, s32 rotation,
> +	const struct mdp_limit *limit)
> +{
> +	u32 crop_w, crop_h, comp_w, comp_h;
> +
> +	crop_w = crop->width;
> +	crop_h = crop->height;
> +	if (90 == rotation || 270 == rotation) {
> +		comp_w = compose->height;
> +		comp_h = compose->width;
> +	} else {
> +		comp_w = compose->width;
> +		comp_h = compose->height;
> +	}
> +
> +	if ((crop_w / comp_w) > limit->h_scale_down_max ||
> +	    (crop_h / comp_h) > limit->v_scale_down_max ||
> +	    (comp_w / crop_w) > limit->h_scale_up_max ||
> +	    (comp_h / crop_h) > limit->v_scale_up_max)
> +		return -ERANGE;
> +	return 0;
> +}
> +
> +/* Stride that is accepted by MDP HW */
> +static u32 mdp_fmt_get_stride(const struct mdp_format *fmt,
> +			      u32 bytesperline, unsigned int plane)
> +{
> +	enum mdp_color c = fmt->mdp_color;
> +	u32 stride;
> +
> +	stride = (bytesperline * MDP_COLOR_BITS_PER_PIXEL(c))
> +		/ fmt->row_depth[0];
> +	if (plane == 0)
> +		return stride;
> +	if (plane < MDP_COLOR_GET_PLANE_COUNT(c)) {
> +		if (MDP_COLOR_IS_BLOCK_MODE(c))
> +			stride = stride / 2;
> +		return stride;
> +	}
> +	return 0;
> +}
> +
> +/* Stride that is accepted by MDP HW of format with contiguous planes */
> +static u32 mdp_fmt_get_stride_contig(const struct mdp_format *fmt,
> +				     u32 pix_stride, unsigned int plane)
> +{
> +	enum mdp_color c = fmt->mdp_color;
> +	u32 stride = pix_stride;
> +
> +	if (plane == 0)
> +		return stride;
> +	if (plane < MDP_COLOR_GET_PLANE_COUNT(c)) {
> +		stride = stride >> MDP_COLOR_GET_H_SUBSAMPLE(c);
> +		if (MDP_COLOR_IS_UV_COPLANE(c) && !MDP_COLOR_IS_BLOCK_MODE(c))
> +			stride = stride * 2;
> +		return stride;
> +	}
> +	return 0;
> +}
> +
> +/* Plane size that is accepted by MDP HW */
> +static u32 mdp_fmt_get_plane_size(const struct mdp_format *fmt,
> +				  u32 stride, u32 height, unsigned int plane)
> +{
> +	enum mdp_color c = fmt->mdp_color;
> +	u32 bytesperline;
> +
> +	bytesperline = (stride * fmt->row_depth[0])
> +		/ MDP_COLOR_BITS_PER_PIXEL(c);
> +	if (plane == 0)
> +		return bytesperline * height;
> +	if (plane < MDP_COLOR_GET_PLANE_COUNT(c)) {
> +		height = height >> MDP_COLOR_GET_V_SUBSAMPLE(c);
> +		if (MDP_COLOR_IS_BLOCK_MODE(c))
> +			bytesperline = bytesperline * 2;
> +		return bytesperline * height;
> +	}
> +	return 0;
> +}
> +
> +static void mdp_prepare_buffer(struct img_image_buffer *b,
> +			       struct mdp_frame *frame, struct vb2_buffer *vb)
> +{
> +	struct v4l2_pix_format_mplane *pix_mp = &frame->format.fmt.pix_mp;
> +	unsigned int i;
> +
> +	b->format.colorformat = frame->mdp_fmt->mdp_color;
> +	b->format.ycbcr_prof = frame->ycbcr_prof;
> +	for (i = 0; i < pix_mp->num_planes; ++i) {
> +		u32 stride = mdp_fmt_get_stride(frame->mdp_fmt,
> +			pix_mp->plane_fmt[i].bytesperline, i);
> +
> +		b->format.plane_fmt[i].stride = stride;
> +		/*
> +		 * TODO : The way to pass an offset within a DMA-buf
> +		 * is not defined in V4L2 specification, so we abuse
> +		 * data_offset for now. Fix it when we have the right interface,
> +		 * including any necessary validation and potential alignment
> +		 * issues.
> +		 */
> +		b->format.plane_fmt[i].size =
> +			mdp_fmt_get_plane_size(frame->mdp_fmt, stride,
> +					       pix_mp->height, i) -
> +					       vb->planes[i].data_offset;
> +		b->iova[i] = vb2_dma_contig_plane_dma_addr(vb, i) +
> +			     vb->planes[i].data_offset;
> +	}
> +	for (; i < MDP_COLOR_GET_PLANE_COUNT(b->format.colorformat); ++i) {
> +		u32 stride = mdp_fmt_get_stride_contig(frame->mdp_fmt,
> +			b->format.plane_fmt[0].stride, i);
> +
> +		b->format.plane_fmt[i].stride = stride;
> +		b->format.plane_fmt[i].size =
> +			mdp_fmt_get_plane_size(frame->mdp_fmt, stride,
> +					       pix_mp->height, i);
> +		b->iova[i] = b->iova[i - 1] + b->format.plane_fmt[i - 1].size;
> +	}
> +	b->usage = frame->usage;
> +}
> +
> +void mdp_set_src_config(struct img_input *in,
> +			struct mdp_frame *frame, struct vb2_buffer *vb)
> +{
> +	in->buffer.format.width = frame->format.fmt.pix_mp.width;
> +	in->buffer.format.height = frame->format.fmt.pix_mp.height;
> +	mdp_prepare_buffer(&in->buffer, frame, vb);
> +}
> +
> +static u32 mdp_to_fixed(u32 *r, struct v4l2_fract *f)
> +{
> +	u32 q;
> +
> +	if (f->denominator == 0) {
> +		*r = 0;
> +		return 0;
> +	}
> +
> +	q = f->numerator / f->denominator;
> +	*r = div_u64(((u64)f->numerator - q * f->denominator) <<
> +		     IMG_SUBPIXEL_SHIFT, f->denominator);
> +	return q;
> +}
> +
> +static void mdp_set_src_crop(struct img_crop *c, struct mdp_crop *crop)
> +{
> +	c->left = crop->c.left
> +		+ mdp_to_fixed(&c->left_subpix, &crop->left_subpix);
> +	c->top = crop->c.top
> +		+ mdp_to_fixed(&c->top_subpix, &crop->top_subpix);
> +	c->width = crop->c.width
> +		+ mdp_to_fixed(&c->width_subpix, &crop->width_subpix);
> +	c->height = crop->c.height
> +		+ mdp_to_fixed(&c->height_subpix, &crop->height_subpix);
> +}
> +
> +static void mdp_set_orientation(struct img_output *out,
> +				s32 rotation, bool hflip, bool vflip)
> +{
> +	u8 flip = 0;
> +
> +	if (hflip)
> +		flip ^= 1;
> +	if (vflip) {
> +		/*
> +		 * A vertical flip is equivalent to
> +		 * a 180-degree rotation with a horizontal flip
> +		 */
> +		rotation += 180;
> +		flip ^= 1;
> +	}
> +
> +	out->rotation = rotation % 360;
> +	if (flip != 0)
> +		out->flags |= IMG_CTRL_FLAG_HFLIP;
> +	else
> +		out->flags &= ~IMG_CTRL_FLAG_HFLIP;
> +}
> +
> +void mdp_set_dst_config(struct img_output *out,
> +			struct mdp_frame *frame, struct vb2_buffer *vb)
> +{
> +	out->buffer.format.width = frame->compose.width;
> +	out->buffer.format.height = frame->compose.height;
> +	mdp_prepare_buffer(&out->buffer, frame, vb);
> +	mdp_set_src_crop(&out->crop, &frame->crop);
> +	mdp_set_orientation(out, frame->rotation, frame->hflip, frame->vflip);
> +
> +	/* out->flags |= ; */	/* sharpness, dither */
> +}
> +
> +int mdp_frameparam_init(struct mdp_frameparam *param)
> +{
> +	struct mdp_frame *frame;
> +
> +	if (!param)
> +		return -EINVAL;
> +
> +	INIT_LIST_HEAD(&param->list);
> +	mutex_init(&param->state_lock);
> +	param->limit = &mdp_def_limit;
> +	param->type = MDP_STREAM_TYPE_BITBLT;
> +
> +	frame = &param->output;
> +	frame->format.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
> +	frame->mdp_fmt = mdp_try_fmt_mplane(&frame->format, param, 0);
> +	frame->ycbcr_prof =
> +		mdp_map_ycbcr_prof_mplane(&frame->format,
> +					  frame->mdp_fmt->mdp_color);
> +	frame->usage = MDP_BUFFER_USAGE_HW_READ;
> +
> +	param->num_captures = 1;
> +	frame = &param->captures[0];
> +	frame->format.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
> +	frame->mdp_fmt = mdp_try_fmt_mplane(&frame->format, param, 0);
> +	frame->ycbcr_prof =
> +		mdp_map_ycbcr_prof_mplane(&frame->format,
> +					  frame->mdp_fmt->mdp_color);
> +	frame->usage = MDP_BUFFER_USAGE_MDP;
> +	frame->crop.c.width = param->output.format.fmt.pix_mp.width;
> +	frame->crop.c.height = param->output.format.fmt.pix_mp.height;
> +	frame->compose.width = frame->format.fmt.pix_mp.width;
> +	frame->compose.height = frame->format.fmt.pix_mp.height;
> +
> +	return 0;
> +}
> diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.h b/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.h
> new file mode 100644
> index 000000000000..b3aaef8eb7eb
> --- /dev/null
> +++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.h
> @@ -0,0 +1,372 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2021 MediaTek Inc.
> + * Author: Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
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
> +	(((PACKED) << 27) | ((LOOSE) << 26) | ((VIDEO) << 23) |\
> +	 ((PLANE) << 21) | ((HF) << 19) | ((VF) << 18) | ((BITS) << 8) |\
> +	 ((GROUP) << 6) | ((SWAP) << 5) | ((ID) << 0))
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
> +#define MDP_COLOR_IS_RGB(c)		(MDP_COLOR_GET_GROUP(c) == 0)
> +#define MDP_COLOR_IS_YUV(c)		(MDP_COLOR_GET_GROUP(c) == 1)
> +#define MDP_COLOR_IS_UV_COPLANE(c)	((MDP_COLOR_GET_PLANE_COUNT(c) == 2) &&\
> +					 MDP_COLOR_IS_YUV(c))
> +
> +enum mdp_color {
> +	MDP_COLOR_UNKNOWN	= 0,
> +
> +	//MDP_COLOR_FULLG8,
> +	MDP_COLOR_FULLG8_RGGB	= MDP_COLOR(0, 0, 0, 1, 0, 0,  8, 2,  0, 21),
> +	MDP_COLOR_FULLG8_GRBG	= MDP_COLOR(0, 0, 0, 1, 0, 1,  8, 2,  0, 21),
> +	MDP_COLOR_FULLG8_GBRG	= MDP_COLOR(0, 0, 0, 1, 1, 0,  8, 2,  0, 21),
> +	MDP_COLOR_FULLG8_BGGR	= MDP_COLOR(0, 0, 0, 1, 1, 1,  8, 2,  0, 21),
> +	MDP_COLOR_FULLG8	= MDP_COLOR_FULLG8_BGGR,
> +
> +	//MDP_COLOR_FULLG10,
> +	MDP_COLOR_FULLG10_RGGB	= MDP_COLOR(0, 0, 0, 1, 0, 0, 10, 2,  0, 21),
> +	MDP_COLOR_FULLG10_GRBG	= MDP_COLOR(0, 0, 0, 1, 0, 1, 10, 2,  0, 21),
> +	MDP_COLOR_FULLG10_GBRG	= MDP_COLOR(0, 0, 0, 1, 1, 0, 10, 2,  0, 21),
> +	MDP_COLOR_FULLG10_BGGR	= MDP_COLOR(0, 0, 0, 1, 1, 1, 10, 2,  0, 21),
> +	MDP_COLOR_FULLG10	= MDP_COLOR_FULLG10_BGGR,
> +
> +	//MDP_COLOR_FULLG12,
> +	MDP_COLOR_FULLG12_RGGB	= MDP_COLOR(0, 0, 0, 1, 0, 0, 12, 2,  0, 21),
> +	MDP_COLOR_FULLG12_GRBG	= MDP_COLOR(0, 0, 0, 1, 0, 1, 12, 2,  0, 21),
> +	MDP_COLOR_FULLG12_GBRG	= MDP_COLOR(0, 0, 0, 1, 1, 0, 12, 2,  0, 21),
> +	MDP_COLOR_FULLG12_BGGR	= MDP_COLOR(0, 0, 0, 1, 1, 1, 12, 2,  0, 21),
> +	MDP_COLOR_FULLG12	= MDP_COLOR_FULLG12_BGGR,
> +
> +	//MDP_COLOR_FULLG14,
> +	MDP_COLOR_FULLG14_RGGB	= MDP_COLOR(0, 0, 0, 1, 0, 0, 14, 2,  0, 21),
> +	MDP_COLOR_FULLG14_GRBG	= MDP_COLOR(0, 0, 0, 1, 0, 1, 14, 2,  0, 21),
> +	MDP_COLOR_FULLG14_GBRG	= MDP_COLOR(0, 0, 0, 1, 1, 0, 14, 2,  0, 21),
> +	MDP_COLOR_FULLG14_BGGR	= MDP_COLOR(0, 0, 0, 1, 1, 1, 14, 2,  0, 21),
> +	MDP_COLOR_FULLG14	= MDP_COLOR_FULLG14_BGGR,
> +
> +	MDP_COLOR_UFO10		= MDP_COLOR(0, 0, 0, 1, 0, 0, 10, 2,  0, 24),
> +
> +	//MDP_COLOR_BAYER8,
> +	MDP_COLOR_BAYER8_RGGB	= MDP_COLOR(0, 0, 0, 1, 0, 0,  8, 2,  0, 20),
> +	MDP_COLOR_BAYER8_GRBG	= MDP_COLOR(0, 0, 0, 1, 0, 1,  8, 2,  0, 20),
> +	MDP_COLOR_BAYER8_GBRG	= MDP_COLOR(0, 0, 0, 1, 1, 0,  8, 2,  0, 20),
> +	MDP_COLOR_BAYER8_BGGR	= MDP_COLOR(0, 0, 0, 1, 1, 1,  8, 2,  0, 20),
> +	MDP_COLOR_BAYER8	= MDP_COLOR_BAYER8_BGGR,
> +
> +	//MDP_COLOR_BAYER10,
> +	MDP_COLOR_BAYER10_RGGB	= MDP_COLOR(0, 0, 0, 1, 0, 0, 10, 2,  0, 20),
> +	MDP_COLOR_BAYER10_GRBG	= MDP_COLOR(0, 0, 0, 1, 0, 1, 10, 2,  0, 20),
> +	MDP_COLOR_BAYER10_GBRG	= MDP_COLOR(0, 0, 0, 1, 1, 0, 10, 2,  0, 20),
> +	MDP_COLOR_BAYER10_BGGR	= MDP_COLOR(0, 0, 0, 1, 1, 1, 10, 2,  0, 20),
> +	MDP_COLOR_BAYER10	= MDP_COLOR_BAYER10_BGGR,
> +
> +	//MDP_COLOR_BAYER12,
> +	MDP_COLOR_BAYER12_RGGB	= MDP_COLOR(0, 0, 0, 1, 0, 0, 12, 2,  0, 20),
> +	MDP_COLOR_BAYER12_GRBG	= MDP_COLOR(0, 0, 0, 1, 0, 1, 12, 2,  0, 20),
> +	MDP_COLOR_BAYER12_GBRG	= MDP_COLOR(0, 0, 0, 1, 1, 0, 12, 2,  0, 20),
> +	MDP_COLOR_BAYER12_BGGR	= MDP_COLOR(0, 0, 0, 1, 1, 1, 12, 2,  0, 20),
> +	MDP_COLOR_BAYER12	= MDP_COLOR_BAYER12_BGGR,
> +
> +	//MDP_COLOR_BAYER14,
> +	MDP_COLOR_BAYER14_RGGB	= MDP_COLOR(0, 0, 0, 1, 0, 0, 14, 2,  0, 20),
> +	MDP_COLOR_BAYER14_GRBG	= MDP_COLOR(0, 0, 0, 1, 0, 1, 14, 2,  0, 20),
> +	MDP_COLOR_BAYER14_GBRG	= MDP_COLOR(0, 0, 0, 1, 1, 0, 14, 2,  0, 20),
> +	MDP_COLOR_BAYER14_BGGR	= MDP_COLOR(0, 0, 0, 1, 1, 1, 14, 2,  0, 20),
> +	MDP_COLOR_BAYER14	= MDP_COLOR_BAYER14_BGGR,
> +
> +	MDP_COLOR_RGB48		= MDP_COLOR(0, 0, 0, 1, 0, 0, 48, 0,  0, 23),
> +	/* For bayer+mono raw-16 */
> +	MDP_COLOR_RGB565_RAW	= MDP_COLOR(0, 0, 0, 1, 0, 0, 16, 2,  0, 0),
> +
> +	MDP_COLOR_BAYER8_UNPAK	= MDP_COLOR(0, 0, 0, 1, 0, 0,  8, 2,  0, 22),
> +	MDP_COLOR_BAYER10_UNPAK	= MDP_COLOR(0, 0, 0, 1, 0, 0, 10, 2,  0, 22),
> +	MDP_COLOR_BAYER12_UNPAK	= MDP_COLOR(0, 0, 0, 1, 0, 0, 12, 2,  0, 22),
> +	MDP_COLOR_BAYER14_UNPAK	= MDP_COLOR(0, 0, 0, 1, 0, 0, 14, 2,  0, 22),
> +
> +	/* Unified formats */
> +	MDP_COLOR_GREY		= MDP_COLOR(0, 0, 0, 1, 0, 0,  8, 1,  0, 7),
> +
> +	MDP_COLOR_RGB565	= MDP_COLOR(0, 0, 0, 1, 0, 0, 16, 0,  0, 0),
> +	MDP_COLOR_BGR565	= MDP_COLOR(0, 0, 0, 1, 0, 0, 16, 0,  1, 0),
> +	MDP_COLOR_RGB888	= MDP_COLOR(0, 0, 0, 1, 0, 0, 24, 0,  1, 1),
> +	MDP_COLOR_BGR888	= MDP_COLOR(0, 0, 0, 1, 0, 0, 24, 0,  0, 1),
> +	MDP_COLOR_RGBA8888	= MDP_COLOR(0, 0, 0, 1, 0, 0, 32, 0,  1, 2),
> +	MDP_COLOR_BGRA8888	= MDP_COLOR(0, 0, 0, 1, 0, 0, 32, 0,  0, 2),
> +	MDP_COLOR_ARGB8888	= MDP_COLOR(0, 0, 0, 1, 0, 0, 32, 0,  1, 3),
> +	MDP_COLOR_ABGR8888	= MDP_COLOR(0, 0, 0, 1, 0, 0, 32, 0,  0, 3),
> +
> +	MDP_COLOR_UYVY		= MDP_COLOR(0, 0, 0, 1, 1, 0, 16, 1,  0, 4),
> +	MDP_COLOR_VYUY		= MDP_COLOR(0, 0, 0, 1, 1, 0, 16, 1,  1, 4),
> +	MDP_COLOR_YUYV		= MDP_COLOR(0, 0, 0, 1, 1, 0, 16, 1,  0, 5),
> +	MDP_COLOR_YVYU		= MDP_COLOR(0, 0, 0, 1, 1, 0, 16, 1,  1, 5),
> +
> +	MDP_COLOR_I420		= MDP_COLOR(0, 0, 0, 3, 1, 1,  8, 1,  0, 8),
> +	MDP_COLOR_YV12		= MDP_COLOR(0, 0, 0, 3, 1, 1,  8, 1,  1, 8),
> +	MDP_COLOR_I422		= MDP_COLOR(0, 0, 0, 3, 1, 0,  8, 1,  0, 9),
> +	MDP_COLOR_YV16		= MDP_COLOR(0, 0, 0, 3, 1, 0,  8, 1,  1, 9),
> +	MDP_COLOR_I444		= MDP_COLOR(0, 0, 0, 3, 0, 0,  8, 1,  0, 10),
> +	MDP_COLOR_YV24		= MDP_COLOR(0, 0, 0, 3, 0, 0,  8, 1,  1, 10),
> +
> +	MDP_COLOR_NV12		= MDP_COLOR(0, 0, 0, 2, 1, 1,  8, 1,  0, 12),
> +	MDP_COLOR_NV21		= MDP_COLOR(0, 0, 0, 2, 1, 1,  8, 1,  1, 12),
> +	MDP_COLOR_NV16		= MDP_COLOR(0, 0, 0, 2, 1, 0,  8, 1,  0, 13),
> +	MDP_COLOR_NV61		= MDP_COLOR(0, 0, 0, 2, 1, 0,  8, 1,  1, 13),
> +	MDP_COLOR_NV24		= MDP_COLOR(0, 0, 0, 2, 0, 0,  8, 1,  0, 14),
> +	MDP_COLOR_NV42		= MDP_COLOR(0, 0, 0, 2, 0, 0,  8, 1,  1, 14),
> +
> +	/* Mediatek proprietary formats */
> +	/* UFO encoded block mode */
> +	MDP_COLOR_420_BLK_UFO	= MDP_COLOR(0, 0, 5, 2, 1, 1, 256, 1, 0, 12),
> +	/* Block mode */
> +	MDP_COLOR_420_BLK	= MDP_COLOR(0, 0, 1, 2, 1, 1, 256, 1, 0, 12),
> +	/* Block mode + field mode */
> +	MDP_COLOR_420_BLKI	= MDP_COLOR(0, 0, 3, 2, 1, 1, 256, 1, 0, 12),
> +	/* Block mode */
> +	MDP_COLOR_422_BLK	= MDP_COLOR(0, 0, 1, 1, 1, 0, 512, 1, 0, 4),
> +
> +	MDP_COLOR_IYU2		= MDP_COLOR(0, 0, 0, 1, 0, 0, 24,  1, 0, 25),
> +	MDP_COLOR_YUV444	= MDP_COLOR(0, 0, 0, 1, 0, 0, 24,  1, 0, 30),
> +
> +	/* Packed 10-bit formats */
> +	MDP_COLOR_RGBA1010102	= MDP_COLOR(1, 0, 0, 1, 0, 0, 32,  0, 1, 2),
> +	MDP_COLOR_BGRA1010102	= MDP_COLOR(1, 0, 0, 1, 0, 0, 32,  0, 0, 2),
> +	/* Packed 10-bit UYVY */
> +	MDP_COLOR_UYVY_10P	= MDP_COLOR(1, 0, 0, 1, 1, 0, 20,  1, 0, 4),
> +	/* Packed 10-bit NV21 */
> +	MDP_COLOR_NV21_10P	= MDP_COLOR(1, 0, 0, 2, 1, 1, 10,  1, 1, 12),
> +	/* 10-bit block mode */
> +	MDP_COLOR_420_BLK_10_H	= MDP_COLOR(1, 0, 1, 2, 1, 1, 320, 1, 0, 12),
> +	/* 10-bit HEVC tile mode */
> +	MDP_COLOR_420_BLK_10_V	= MDP_COLOR(1, 1, 1, 2, 1, 1, 320, 1, 0, 12),
> +	/* UFO encoded 10-bit block mode */
> +	MDP_COLOR_420_BLK_U10_H	= MDP_COLOR(1, 0, 5, 2, 1, 1, 320, 1, 0, 12),
> +	/* UFO encoded 10-bit HEVC tile mode */
> +	MDP_COLOR_420_BLK_U10_V	= MDP_COLOR(1, 1, 5, 2, 1, 1, 320, 1, 0, 12),
> +
> +	/* Loose 10-bit formats */
> +	MDP_COLOR_UYVY_10L	= MDP_COLOR(0, 1, 0, 1, 1, 0, 20,  1, 0, 4),
> +	MDP_COLOR_VYUY_10L	= MDP_COLOR(0, 1, 0, 1, 1, 0, 20,  1, 1, 4),
> +	MDP_COLOR_YUYV_10L	= MDP_COLOR(0, 1, 0, 1, 1, 0, 20,  1, 0, 5),
> +	MDP_COLOR_YVYU_10L	= MDP_COLOR(0, 1, 0, 1, 1, 0, 20,  1, 1, 5),
> +	MDP_COLOR_NV12_10L	= MDP_COLOR(0, 1, 0, 2, 1, 1, 10,  1, 0, 12),
> +	MDP_COLOR_NV21_10L	= MDP_COLOR(0, 1, 0, 2, 1, 1, 10,  1, 1, 12),
> +	MDP_COLOR_NV16_10L	= MDP_COLOR(0, 1, 0, 2, 1, 0, 10,  1, 0, 13),
> +	MDP_COLOR_NV61_10L	= MDP_COLOR(0, 1, 0, 2, 1, 0, 10,  1, 1, 13),
> +	MDP_COLOR_YV12_10L	= MDP_COLOR(0, 1, 0, 3, 1, 1, 10,  1, 1, 8),
> +	MDP_COLOR_I420_10L	= MDP_COLOR(0, 1, 0, 3, 1, 1, 10,  1, 0, 8),
> +};
> +
> +/* Minimum Y stride that is accepted by MDP HW */
> +static inline u32 mdp_color_get_min_y_stride(enum mdp_color c, u32 width)
> +{
> +	return ((MDP_COLOR_BITS_PER_PIXEL(c) * width) + 4) >> 3;
> +}
> +
> +/* Minimum UV stride that is accepted by MDP HW */
> +static inline u32 mdp_color_get_min_uv_stride(enum mdp_color c, u32 width)
> +{
> +	u32 min_stride;
> +
> +	if (MDP_COLOR_GET_PLANE_COUNT(c) == 1)
> +		return 0;
> +	min_stride = mdp_color_get_min_y_stride(c, width)
> +		>> MDP_COLOR_GET_H_SUBSAMPLE(c);
> +	if (MDP_COLOR_IS_UV_COPLANE(c) && !MDP_COLOR_IS_BLOCK_MODE(c))
> +		min_stride = min_stride * 2;
> +	return min_stride;
> +}
> +
> +/* Minimum Y plane size that is necessary in buffer */
> +static inline u32 mdp_color_get_min_y_size(enum mdp_color c,
> +					   u32 width, u32 height)
> +{
> +	if (MDP_COLOR_IS_BLOCK_MODE(c))
> +		return ((MDP_COLOR_BITS_PER_PIXEL(c) * width) >> 8) * height;
> +	return mdp_color_get_min_y_stride(c, width) * height;
> +}
> +
> +/* Minimum UV plane size that is necessary in buffer */
> +static inline u32 mdp_color_get_min_uv_size(enum mdp_color c,
> +					    u32 width, u32 height)
> +{
> +	height = height >> MDP_COLOR_GET_V_SUBSAMPLE(c);
> +	if (MDP_COLOR_IS_BLOCK_MODE(c) && (MDP_COLOR_GET_PLANE_COUNT(c) > 1))
> +		return ((MDP_COLOR_BITS_PER_PIXEL(c) * width) >> 8) * height;
> +	return mdp_color_get_min_uv_stride(c, width) * height;
> +}
> +
> +/* Combine colorspace, xfer_func, ycbcr_encoding, and quantization */
> +enum mdp_ycbcr_profile {
> +	/* V4L2_YCBCR_ENC_601 and V4L2_QUANTIZATION_LIM_RANGE */
> +	MDP_YCBCR_PROFILE_BT601,
> +	/* V4L2_YCBCR_ENC_709 and V4L2_QUANTIZATION_LIM_RANGE */
> +	MDP_YCBCR_PROFILE_BT709,
> +	/* V4L2_YCBCR_ENC_601 and V4L2_QUANTIZATION_FULL_RANGE */
> +	MDP_YCBCR_PROFILE_JPEG,
> +	MDP_YCBCR_PROFILE_FULL_BT601 = MDP_YCBCR_PROFILE_JPEG,
> +
> +	/* Colorspaces not support for capture */
> +	/* V4L2_YCBCR_ENC_BT2020 and V4L2_QUANTIZATION_LIM_RANGE */
> +	MDP_YCBCR_PROFILE_BT2020,
> +	/* V4L2_YCBCR_ENC_709 and V4L2_QUANTIZATION_FULL_RANGE */
> +	MDP_YCBCR_PROFILE_FULL_BT709,
> +	/* V4L2_YCBCR_ENC_BT2020 and V4L2_QUANTIZATION_FULL_RANGE */
> +	MDP_YCBCR_PROFILE_FULL_BT2020,
> +};
> +
> +#define MDP_FMT_FLAG_OUTPUT	BIT(0)
> +#define MDP_FMT_FLAG_CAPTURE	BIT(1)
> +
> +struct mdp_format {
> +	u32	pixelformat;
> +	u32	mdp_color;
> +	u8	depth[VIDEO_MAX_PLANES];
> +	u8	row_depth[VIDEO_MAX_PLANES];
> +	u8	num_planes;
> +	u8	walign;
> +	u8	halign;
> +	u8	salign;
> +	u32	flags;
> +};
> +
> +struct mdp_pix_limit {
> +	u32	wmin;
> +	u32	hmin;
> +	u32	wmax;
> +	u32	hmax;
> +};
> +
> +struct mdp_limit {
> +	struct mdp_pix_limit	out_limit;
> +	struct mdp_pix_limit	cap_limit;
> +	u32			h_scale_up_max;
> +	u32			v_scale_up_max;
> +	u32			h_scale_down_max;
> +	u32			v_scale_down_max;
> +};
> +
> +enum mdp_stream_type {
> +	MDP_STREAM_TYPE_UNKNOWN,
> +	MDP_STREAM_TYPE_BITBLT,
> +	MDP_STREAM_TYPE_GPU_BITBLT,
> +	MDP_STREAM_TYPE_DUAL_BITBLT,
> +	MDP_STREAM_TYPE_2ND_BITBLT,
> +	MDP_STREAM_TYPE_ISP_IC,
> +	MDP_STREAM_TYPE_ISP_VR,
> +	MDP_STREAM_TYPE_ISP_ZSD,
> +	MDP_STREAM_TYPE_ISP_IP,
> +	MDP_STREAM_TYPE_ISP_VSS,
> +	MDP_STREAM_TYPE_ISP_ZSD_SLOW,
> +	MDP_STREAM_TYPE_WPE,
> +	MDP_STREAM_TYPE_WPE2,
> +};
> +
> +struct mdp_crop {
> +	struct v4l2_rect	c;
> +	struct v4l2_fract	left_subpix;
> +	struct v4l2_fract	top_subpix;
> +	struct v4l2_fract	width_subpix;
> +	struct v4l2_fract	height_subpix;
> +};
> +
> +struct mdp_frame {
> +	struct v4l2_format	format;
> +	const struct mdp_format	*mdp_fmt;
> +	u32			ycbcr_prof;	/* enum mdp_ycbcr_profile */
> +	u32			usage;		/* enum mdp_buffer_usage */
> +	struct mdp_crop		crop;
> +	struct v4l2_rect	compose;
> +	s32			rotation;
> +	u32			hflip:1;
> +	u32			vflip:1;
> +	u32			hdr:1;
> +	u32			dre:1;
> +	u32			sharpness:1;
> +	u32			dither:1;
> +};
> +
> +static inline bool mdp_target_is_crop(u32 target)
> +{
> +	return (target == V4L2_SEL_TGT_CROP) ||
> +		(target == V4L2_SEL_TGT_CROP_DEFAULT) ||
> +		(target == V4L2_SEL_TGT_CROP_BOUNDS);
> +}
> +
> +static inline bool mdp_target_is_compose(u32 target)
> +{
> +	return (target == V4L2_SEL_TGT_COMPOSE) ||
> +		(target == V4L2_SEL_TGT_COMPOSE_DEFAULT) ||
> +		(target == V4L2_SEL_TGT_COMPOSE_BOUNDS);
> +}
> +
> +#define MDP_MAX_CAPTURES	IMG_MAX_HW_OUTPUTS
> +
> +#define MDP_VPU_INIT		BIT(0)
> +#define MDP_M2M_CTX_ERROR	BIT(1)
> +
> +struct mdp_frameparam {
> +	struct list_head	list;
> +	/* synchronization protect for m2m context state */
> +	struct mutex		state_lock;
> +	u32			state;
> +	const struct mdp_limit	*limit;
> +	u32			type;	/* enum mdp_stream_type */
> +	u32			frame_no;
> +	struct mdp_frame	output;
> +	struct mdp_frame	captures[MDP_MAX_CAPTURES];
> +	u32			num_captures;
> +	enum v4l2_colorspace		colorspace;
> +	enum v4l2_ycbcr_encoding	ycbcr_enc;
> +	enum v4l2_xfer_func		xfer_func;
> +	enum v4l2_quantization		quant;
> +};
> +
> +int mdp_enum_fmt_mplane(struct v4l2_fmtdesc *f);
> +const struct mdp_format *mdp_try_fmt_mplane(struct v4l2_format *f,
> +					    struct mdp_frameparam *param,
> +					    u32 ctx_id);
> +enum mdp_ycbcr_profile mdp_map_ycbcr_prof_mplane(struct v4l2_format *f,
> +						 u32 mdp_color);
> +int mdp_try_crop(struct v4l2_rect *r, const struct v4l2_selection *s,
> +		 struct mdp_frame *frame, u32 ctx_id);
> +int mdp_check_scaling_ratio(const struct v4l2_rect *crop,
> +			    const struct v4l2_rect *compose, s32 rotation,
> +	const struct mdp_limit *limit);
> +void mdp_set_src_config(struct img_input *in,
> +			struct mdp_frame *frame, struct vb2_buffer *vb);
> +void mdp_set_dst_config(struct img_output *out,
> +			struct mdp_frame *frame, struct vb2_buffer *vb);
> +
> +int mdp_frameparam_init(struct mdp_frameparam *param);
> +
> +#endif  /* __MTK_MDP3_REGS_H__ */
> diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-vpu.c b/drivers/media/platform/mtk-mdp3/mtk-mdp3-vpu.c
> new file mode 100644
> index 000000000000..f91d817ea379
> --- /dev/null
> +++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-vpu.c
> @@ -0,0 +1,312 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2021 MediaTek Inc.
> + * Author: Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
> + */
> +
> +#include <linux/remoteproc.h>
> +#include <linux/remoteproc/mtk_scp.h>
> +#include "mtk-mdp3-vpu.h"
> +#include "mtk-mdp3-core.h"
> +
> +#define MDP_VPU_MESSAGE_TIMEOUT 500U
> +#define vpu_alloc_size		0x600000
> +
> +static inline struct mdp_dev *vpu_to_mdp(struct mdp_vpu_dev *vpu)
> +{
> +	return container_of(vpu, struct mdp_dev, vpu);
> +}
> +
> +static int mdp_vpu_shared_mem_alloc(struct mdp_vpu_dev *vpu)
> +{
> +	if (vpu->work && vpu->work_addr)
> +		return 0;
> +
> +	vpu->work = dma_alloc_coherent(scp_get_device(vpu->scp), vpu_alloc_size,
> +				       &vpu->work_addr, GFP_KERNEL);
> +
> +	if (!vpu->work)
> +		return -ENOMEM;
> +	else
> +		return 0;
> +}
> +
> +void mdp_vpu_shared_mem_free(struct mdp_vpu_dev *vpu)
> +{
> +	if (vpu->work && vpu->work_addr)
> +		dma_free_coherent(scp_get_device(vpu->scp), vpu_alloc_size,
> +				  vpu->work, vpu->work_addr);
> +}
> +
> +static void mdp_vpu_ipi_handle_init_ack(void *data, unsigned int len,
> +					void *priv)
> +{
> +	struct mdp_ipi_init_msg *msg = (struct mdp_ipi_init_msg *)data;
> +	struct mdp_vpu_dev *vpu =
> +		(struct mdp_vpu_dev *)(unsigned long)msg->drv_data;
> +
> +	if (!vpu->work_size)
> +		vpu->work_size = msg->work_size;
> +
> +	vpu->status = msg->status;
> +	complete(&vpu->ipi_acked);
> +}
> +
> +static void mdp_vpu_ipi_handle_deinit_ack(void *data, unsigned int len,
> +					  void *priv)
> +{
> +	struct mdp_ipi_deinit_msg *msg = (struct mdp_ipi_deinit_msg *)data;
> +	struct mdp_vpu_dev *vpu =
> +		(struct mdp_vpu_dev *)(unsigned long)msg->drv_data;
> +
> +	vpu->status = msg->status;
> +	complete(&vpu->ipi_acked);
> +}
> +
> +static void mdp_vpu_ipi_handle_frame_ack(void *data, unsigned int len,
> +					 void *priv)
> +{
> +	struct img_sw_addr *addr = (struct img_sw_addr *)data;
> +	struct img_ipi_frameparam *param =
> +		(struct img_ipi_frameparam *)(unsigned long)addr->va;
> +	struct mdp_vpu_ctx *ctx =
> +		(struct mdp_vpu_ctx *)(unsigned long)param->drv_data;
> +
> +	if (param->state) {
> +		struct mdp_dev *mdp = vpu_to_mdp(ctx->vpu_dev);
> +
> +		dev_info(&mdp->pdev->dev, "VPU MDP failure:%d\n", param->state);
> +	}
> +	complete(&ctx->vpu_dev->ipi_acked);
> +}
> +
> +int mdp_vpu_register(struct mdp_dev *mdp)
> +{
> +	int err;
> +	struct mtk_scp *scp = mdp->scp;
> +	struct device *dev = &mdp->pdev->dev;
> +
> +	err = scp_ipi_register(scp, SCP_IPI_MDP_INIT,
> +			       mdp_vpu_ipi_handle_init_ack, NULL);
> +	if (err) {
> +		dev_err(dev, "scp_ipi_register failed %d\n", err);
> +		goto err_ipi_init;
> +	}
> +	err = scp_ipi_register(scp, SCP_IPI_MDP_DEINIT,
> +			       mdp_vpu_ipi_handle_deinit_ack, NULL);
> +	if (err) {
> +		dev_err(dev, "scp_ipi_register failed %d\n", err);
> +		goto err_ipi_deinit;
> +	}
> +	err = scp_ipi_register(scp, SCP_IPI_MDP_FRAME,
> +			       mdp_vpu_ipi_handle_frame_ack, NULL);
> +	if (err) {
> +		dev_err(dev, "scp_ipi_register failed %d\n", err);
> +		goto err_ipi_frame;
> +	}
> +	return 0;
> +
> +err_ipi_frame:
> +	scp_ipi_unregister(scp, SCP_IPI_MDP_DEINIT);
> +err_ipi_deinit:
> +	scp_ipi_unregister(scp, SCP_IPI_MDP_INIT);
> +err_ipi_init:
> +
> +	return err;
> +}
> +
> +void mdp_vpu_unregister(struct mdp_dev *mdp)
> +{
> +	scp_ipi_unregister(mdp->scp, SCP_IPI_MDP_INIT);
> +	scp_ipi_unregister(mdp->scp, SCP_IPI_MDP_DEINIT);
> +	scp_ipi_unregister(mdp->scp, SCP_IPI_MDP_FRAME);
> +}
> +
> +static int mdp_vpu_sendmsg(struct mdp_vpu_dev *vpu, enum scp_ipi_id id,
> +			   void *buf, unsigned int len)
> +{
> +	struct mdp_dev *mdp = vpu_to_mdp(vpu);
> +	unsigned int t = MDP_VPU_MESSAGE_TIMEOUT;
> +	int ret;
> +
> +	if (!vpu->scp) {
> +		dev_dbg(&mdp->pdev->dev, "vpu scp is NULL");
> +		return -EINVAL;
> +	}
> +	ret = scp_ipi_send(vpu->scp, id, buf, len, 2000);
> +
> +	if (ret) {
> +		dev_err(&mdp->pdev->dev, "scp_ipi_send failed %d\n", ret);
> +		return -EPERM;
> +	}
> +	ret = wait_for_completion_timeout(&vpu->ipi_acked, msecs_to_jiffies(t));
> +	if (!ret)
> +		ret = -ETIME;
> +	else if (vpu->status)
> +		ret = -EINVAL;
> +	else
> +		ret = 0;
> +	return ret;
> +}
> +
> +int mdp_vpu_dev_init(struct mdp_vpu_dev *vpu, struct mtk_scp *scp,
> +		     struct mutex *lock)
> +{
> +	struct mdp_ipi_init_msg msg = {
> +		.drv_data = (unsigned long)vpu,
> +	};
> +	size_t mem_size;
> +	phys_addr_t pool;
> +	const size_t pool_size = sizeof(struct mdp_config_pool);
> +	struct mdp_dev *mdp = vpu_to_mdp(vpu);
> +	int err;
> +
> +	init_completion(&vpu->ipi_acked);
> +	vpu->scp = scp;
> +	vpu->lock = lock;
> +	vpu->work_size = 0;
> +	err = mdp_vpu_sendmsg(vpu, SCP_IPI_MDP_INIT, &msg, sizeof(msg));
> +	if (err)
> +		goto err_work_size;
> +	/* vpu work_size was set in mdp_vpu_ipi_handle_init_ack */
> +
> +	mem_size = vpu_alloc_size;
> +	if (mdp_vpu_shared_mem_alloc(vpu)) {
> +		dev_err(&mdp->pdev->dev, "VPU memory alloc fail!");
> +		goto err_mem_alloc;
> +	}
> +
> +	pool = ALIGN((phys_addr_t)vpu->work + vpu->work_size, 8);
> +	if (pool + pool_size - (phys_addr_t)vpu->work > mem_size) {
> +		dev_err(&mdp->pdev->dev,
> +			"VPU memory insufficient: %zx + %zx > %zx",
> +			vpu->work_size, pool_size, mem_size);
> +		err = -ENOMEM;
> +		goto err_mem_size;
> +	}
> +
> +	dev_dbg(&mdp->pdev->dev,
> +		"VPU work:%pK pa:%pad sz:%zx pool:%pa sz:%zx (mem sz:%zx)",
> +		vpu->work, &vpu->work_addr, vpu->work_size,
> +		&pool, pool_size, mem_size);
> +	vpu->pool = (struct mdp_config_pool *)pool;
> +	msg.work_addr = vpu->work_addr;
> +	msg.work_size = vpu->work_size;
> +	err = mdp_vpu_sendmsg(vpu, SCP_IPI_MDP_INIT, &msg, sizeof(msg));
> +	if (err)
> +		goto err_work_size;
> +
> +	memset(vpu->pool, 0, sizeof(*vpu->pool));
> +	return 0;
> +
> +err_work_size:
> +	switch (vpu->status) {
> +	case -MDP_IPI_EBUSY:
> +		err = -EBUSY;
> +		break;
> +	case -MDP_IPI_ENOMEM:
> +		err = -ENOSPC;	/* -ENOMEM */
> +		break;
> +	}
> +	return err;
> +err_mem_size:
> +err_mem_alloc:
> +	return err;
> +}
> +
> +int mdp_vpu_dev_deinit(struct mdp_vpu_dev *vpu)
> +{
> +	struct mdp_ipi_deinit_msg msg = {
> +		.drv_data = (unsigned long)vpu,
> +		.work_addr = vpu->work_addr,
> +	};
> +
> +	return mdp_vpu_sendmsg(vpu, SCP_IPI_MDP_DEINIT, &msg, sizeof(msg));
> +}
> +
> +static struct img_config *mdp_config_get(struct mdp_vpu_dev *vpu,
> +					 enum mdp_config_id id, uint32_t *addr)
> +{
> +	struct img_config *config;
> +
> +	if (id < 0 || id >= MDP_CONFIG_POOL_SIZE)
> +		return ERR_PTR(-EINVAL);
> +
> +	mutex_lock(vpu->lock);
> +	vpu->pool->cfg_count[id]++;
> +	config = &vpu->pool->configs[id];
> +	*addr = vpu->work_addr +
> +		((unsigned long)config - (phys_addr_t)vpu->work);
> +	mutex_unlock(vpu->lock);
> +
> +	return config;
> +}
> +
> +static int mdp_config_put(struct mdp_vpu_dev *vpu,
> +			  enum mdp_config_id id,
> +			  const struct img_config *config)
> +{
> +	int err = 0;
> +
> +	if (id < 0 || id >= MDP_CONFIG_POOL_SIZE)
> +		return -EINVAL;
> +	if (vpu->lock)
> +		mutex_lock(vpu->lock);
> +	if (!vpu->pool->cfg_count[id] || config != &vpu->pool->configs[id])
> +		err = -EINVAL;
> +	else
> +		vpu->pool->cfg_count[id]--;
> +	if (vpu->lock)
> +		mutex_unlock(vpu->lock);
> +	return err;
> +}
> +
> +int mdp_vpu_ctx_init(struct mdp_vpu_ctx *ctx, struct mdp_vpu_dev *vpu,
> +		     enum mdp_config_id id)
> +{
> +	ctx->config = mdp_config_get(vpu, id, &ctx->inst_addr);
> +	if (IS_ERR(ctx->config)) {
> +		int err = PTR_ERR(ctx->config);
> +
> +		ctx->config = NULL;
> +		return err;
> +	}
> +	ctx->config_id = id;
> +	ctx->vpu_dev = vpu;
> +	return 0;
> +}
> +
> +int mdp_vpu_ctx_deinit(struct mdp_vpu_ctx *ctx)
> +{
> +	int err = mdp_config_put(ctx->vpu_dev, ctx->config_id, ctx->config);
> +
> +	ctx->config_id = 0;
> +	ctx->config = NULL;
> +	ctx->inst_addr = 0;
> +	return err;
> +}
> +
> +int mdp_vpu_process(struct mdp_vpu_ctx *ctx, struct img_ipi_frameparam *param)
> +{
> +	struct mdp_vpu_dev *vpu = ctx->vpu_dev;
> +	struct mdp_dev *mdp = vpu_to_mdp(vpu);
> +	struct img_sw_addr addr;
> +
> +	if (!ctx->vpu_dev->work || !ctx->vpu_dev->work_addr) {
> +		if (mdp_vpu_shared_mem_alloc(vpu)) {
> +			dev_err(&mdp->pdev->dev, "VPU memory alloc fail!");
> +			return -ENOMEM;
> +		}
> +	}
> +	memset((void *)ctx->vpu_dev->work, 0, ctx->vpu_dev->work_size);
> +	memset(ctx->config, 0, sizeof(*ctx->config));
> +	param->config_data.va = (unsigned long)ctx->config;
> +	param->config_data.pa = ctx->inst_addr;
> +	param->drv_data = (unsigned long)ctx;
> +
> +	memcpy((void *)ctx->vpu_dev->work, param, sizeof(*param));
> +	addr.pa = ctx->vpu_dev->work_addr;
> +	addr.va = (phys_addr_t)ctx->vpu_dev->work;
> +	return mdp_vpu_sendmsg(ctx->vpu_dev, SCP_IPI_MDP_FRAME,
> +		&addr, sizeof(addr));
> +}
> diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-vpu.h b/drivers/media/platform/mtk-mdp3/mtk-mdp3-vpu.h
> new file mode 100644
> index 000000000000..e831070b44d0
> --- /dev/null
> +++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-vpu.h
> @@ -0,0 +1,78 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2021 MediaTek Inc.
> + * Author: Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
> + */
> +
> +#ifndef __MTK_MDP3_VPU_H__
> +#define __MTK_MDP3_VPU_H__
> +
> +#include <linux/platform_device.h>
> +#include "mtk-img-ipi.h"
> +
> +enum mdp_ipi_result {
> +	MDP_IPI_SUCCESS	= 0,
> +	MDP_IPI_ENOMEM	= 12,
> +	MDP_IPI_EBUSY	= 16,
> +	MDP_IPI_EINVAL	= 22,
> +	MDP_IPI_EMINST	= 24,
> +	MDP_IPI_ERANGE	= 34,
> +	MDP_IPI_NR_ERRNO,
> +
> +	MDP_IPI_EOTHER	= MDP_IPI_NR_ERRNO,
> +	MDP_IPI_PATH_CANT_MERGE,
> +	MDP_IPI_OP_FAIL,
> +};
> +
> +struct mdp_ipi_init_msg {
> +	u32	status;
> +	u64	drv_data;
> +	u32	work_addr;	/* [in] working buffer address */
> +	u32	work_size;	/* [in] working buffer size */
> +} __packed;
> +
> +struct mdp_ipi_deinit_msg {
> +	u32	status;
> +	u64	drv_data;
> +	u32	work_addr;
> +} __packed;
> +
> +enum mdp_config_id {
> +	MDP_DEV_M2M = 0,
> +	MDP_CONFIG_POOL_SIZE	/* ALWAYS keep at the end */
> +};
> +
> +struct mdp_config_pool {
> +	u64			cfg_count[MDP_CONFIG_POOL_SIZE];
> +	struct img_config	configs[MDP_CONFIG_POOL_SIZE];
> +};
> +
> +struct mdp_vpu_dev {
> +	/* synchronization protect for accessing vpu working buffer info */
> +	struct mutex		*lock;
> +	struct mtk_scp		*scp;
> +	struct completion	ipi_acked;
> +	void			*work;
> +	dma_addr_t		work_addr;
> +	size_t			work_size;
> +	struct mdp_config_pool	*pool;
> +	u32			status;
> +};
> +
> +struct mdp_vpu_ctx {
> +	struct mdp_vpu_dev	*vpu_dev;
> +	u32			config_id;
> +	struct img_config	*config;
> +	u32			inst_addr;
> +};
> +
> +void mdp_vpu_shared_mem_free(struct mdp_vpu_dev *vpu);
> +int mdp_vpu_dev_init(struct mdp_vpu_dev *vpu, struct mtk_scp *scp,
> +		     struct mutex *lock /* for sync */);
> +int mdp_vpu_dev_deinit(struct mdp_vpu_dev *vpu);
> +int mdp_vpu_ctx_init(struct mdp_vpu_ctx *ctx, struct mdp_vpu_dev *vpu,
> +		     enum mdp_config_id id);
> +int mdp_vpu_ctx_deinit(struct mdp_vpu_ctx *ctx);
> +int mdp_vpu_process(struct mdp_vpu_ctx *vpu, struct img_ipi_frameparam *param);
> +
> +#endif  /* __MTK_MDP3_VPU_H__ */
> 

Regards,

	Hans
