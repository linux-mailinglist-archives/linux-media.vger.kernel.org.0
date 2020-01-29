Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0013014CF9E
	for <lists+linux-media@lfdr.de>; Wed, 29 Jan 2020 18:27:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727198AbgA2R1a (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Jan 2020 12:27:30 -0500
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:7099 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726679AbgA2R13 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Jan 2020 12:27:29 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e31c0440000>; Wed, 29 Jan 2020 09:26:28 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Wed, 29 Jan 2020 09:27:19 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Wed, 29 Jan 2020 09:27:19 -0800
Received: from [10.2.164.115] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 29 Jan
 2020 17:27:19 +0000
Subject: Re: [RFC PATCH v1 4/5] media: tegra: Add Tegra Video input driver for
 Tegra210
To:     "Hans Verkuil (hansverk)" <hansverk@cisco.com>,
        "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        "jonathanh@nvidia.com" <jonathanh@nvidia.com>,
        "frankc@nvidia.com" <frankc@nvidia.com>
CC:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <1580235801-4129-1-git-send-email-skomatineni@nvidia.com>
 <1580235801-4129-5-git-send-email-skomatineni@nvidia.com>
 <3cec464f-730f-97be-0000-05b6c04f346f@cisco.com>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <0867e6bc-a42d-93cd-f3da-e46b250739c9@nvidia.com>
Date:   Wed, 29 Jan 2020 09:27:18 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <3cec464f-730f-97be-0000-05b6c04f346f@cisco.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1580318789; bh=VdjBfgl/npcPlAKXiSee+PHG9mWRmVFcAYJ6tDu71Us=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=SchGA0b5AuuZqH6kfc5qLHxIOLP+VOLUO0pk2Mh1Es9AtEDBj4Z+TCc5vsxHdQbfc
         SeAIPM0wwysBIyOHUpEF7/U6VT/CAucYaouROAFQ5QwCVBXj/SB4Je0uM8jhGV3fPg
         Z4vP4CP+f+QNBA+gSOt1f+TgCbBEI2ZXc+CvQHse0F637lmtSl0HGh9LQzDBzduQYe
         NVAwYTqtT/VQfhPQC38NfcpX+IlFdL1PdVlVzYGEybtaGvGVBndGI/EY7HVt7QfVuK
         yM8B3acBYUkv/wEKEtoxRKe1Tl4Ehb2oDkUXezndF+MEiKfB7xg3XHPc2kAYYpgZbN
         OqSlxqXCBu0QA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thanks Hans. Will fix in v2 based on below feedback.

On 1/29/20 6:16 AM, Hans Verkuil (hansverk) wrote:
> External email: Use caution opening links or attachments
>
>
> Hi Sowjanya,
>
> Thank you very much for working on this! Much appreciated.
>
> On 1/28/20 7:23 PM, Sowjanya Komatineni wrote:
>> Tegra210 contains a powerful Video Input (VI) hardware controller
>> which can support up to 6 MIPI CSI camera sensors.
>>
>> Each Tegra CSI port can be one-to-one mapped to VI channel and can
>> capture from an external camera sensor connected to CSI or from
>> built-in test pattern generator.
>>
>> Tegra210 supports built-in test pattern generator from CSI to VI.
>>
>> This patch adds a V4L2 media controller and capture driver support
>> for Tegra210 built-in CSI to VI test pattern generator.
>>
>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>> ---
>>   drivers/staging/media/Kconfig               |   2 +
>>   drivers/staging/media/Makefile              |   1 +
>>   drivers/staging/media/tegra/Kconfig         |  12 +
>>   drivers/staging/media/tegra/Makefile        |  11 +
>>   drivers/staging/media/tegra/TODO            |  10 +
>>   drivers/staging/media/tegra/csi.h           | 111 +++++
>>   drivers/staging/media/tegra/csi2_fops.c     | 335 +++++++++++++++
>>   drivers/staging/media/tegra/csi2_fops.h     |  15 +
> These three files...
>
>>   drivers/staging/media/tegra/host1x-video.c  | 120 ++++++
>>   drivers/staging/media/tegra/host1x-video.h  |  33 ++
>>   drivers/staging/media/tegra/mc_common.h     | 131 ++++++
> ...and this one are a bit too generic. It is good practice to prefix headers
> with something unique, e.g. tegra-csi.h etc.
>
> For example, sunxi has sun6i_csi.h and sun4i_csi.h.
>
>>   drivers/staging/media/tegra/tegra-channel.c | 628 ++++++++++++++++++++++++++++
>>   drivers/staging/media/tegra/tegra-core.c    | 111 +++++
>>   drivers/staging/media/tegra/tegra-core.h    | 125 ++++++
>>   drivers/staging/media/tegra/tegra-csi.c     | 380 +++++++++++++++++
>>   drivers/staging/media/tegra/tegra-vi.c      | 351 ++++++++++++++++
>>   drivers/staging/media/tegra/tegra-vi.h      | 101 +++++
>>   drivers/staging/media/tegra/vi2_fops.c      | 364 ++++++++++++++++
>>   drivers/staging/media/tegra/vi2_fops.h      |  15 +
>>   drivers/staging/media/tegra/vi2_formats.h   | 119 ++++++
>>   drivers/staging/media/tegra/vi2_registers.h | 194 +++++++++
>>   21 files changed, 3169 insertions(+)
>>   create mode 100644 drivers/staging/media/tegra/Kconfig
>>   create mode 100644 drivers/staging/media/tegra/Makefile
>>   create mode 100644 drivers/staging/media/tegra/TODO
>>   create mode 100644 drivers/staging/media/tegra/csi.h
>>   create mode 100644 drivers/staging/media/tegra/csi2_fops.c
>>   create mode 100644 drivers/staging/media/tegra/csi2_fops.h
>>   create mode 100644 drivers/staging/media/tegra/host1x-video.c
>>   create mode 100644 drivers/staging/media/tegra/host1x-video.h
>>   create mode 100644 drivers/staging/media/tegra/mc_common.h
>>   create mode 100644 drivers/staging/media/tegra/tegra-channel.c
>>   create mode 100644 drivers/staging/media/tegra/tegra-core.c
>>   create mode 100644 drivers/staging/media/tegra/tegra-core.h
>>   create mode 100644 drivers/staging/media/tegra/tegra-csi.c
>>   create mode 100644 drivers/staging/media/tegra/tegra-vi.c
>>   create mode 100644 drivers/staging/media/tegra/tegra-vi.h
>>   create mode 100644 drivers/staging/media/tegra/vi2_fops.c
>>   create mode 100644 drivers/staging/media/tegra/vi2_fops.h
>>   create mode 100644 drivers/staging/media/tegra/vi2_formats.h
>>   create mode 100644 drivers/staging/media/tegra/vi2_registers.h
>>
>> diff --git a/drivers/staging/media/Kconfig b/drivers/staging/media/Kconfig
>> index c394abffea86..e367030d4407 100644
>> --- a/drivers/staging/media/Kconfig
>> +++ b/drivers/staging/media/Kconfig
>> @@ -34,6 +34,8 @@ source "drivers/staging/media/sunxi/Kconfig"
>>
>>   source "drivers/staging/media/tegra-vde/Kconfig"
>>
>> +source "drivers/staging/media/tegra/Kconfig"
>> +
>>   source "drivers/staging/media/ipu3/Kconfig"
>>
>>   source "drivers/staging/media/soc_camera/Kconfig"
>> diff --git a/drivers/staging/media/Makefile b/drivers/staging/media/Makefile
>> index ea9fce8014bb..67a22ac709e8 100644
>> --- a/drivers/staging/media/Makefile
>> +++ b/drivers/staging/media/Makefile
>> @@ -10,3 +10,4 @@ obj-$(CONFIG_VIDEO_IPU3_IMGU)       += ipu3/
>>   obj-$(CONFIG_SOC_CAMERA)     += soc_camera/
>>   obj-$(CONFIG_PHY_ROCKCHIP_DPHY_RX0)  += phy-rockchip-dphy-rx0/
>>   obj-$(CONFIG_VIDEO_ROCKCHIP_ISP1)    += rkisp1/
>> +obj-$(CONFIG_VIDEO_TEGRA)    += tegra/
>> diff --git a/drivers/staging/media/tegra/Kconfig b/drivers/staging/media/tegra/Kconfig
>> new file mode 100644
>> index 000000000000..443b99f2e2c9
>> --- /dev/null
>> +++ b/drivers/staging/media/tegra/Kconfig
>> @@ -0,0 +1,12 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +config VIDEO_TEGRA
>> +     tristate "NVIDIA Tegra VI driver"
>> +     depends on ARCH_TEGRA || (ARM && COMPILE_TEST)
>> +     depends on COMMON_CLK
>> +     depends on VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
>> +     depends on MEDIA_CONTROLLER
>> +     select TEGRA_HOST1X
>> +     select VIDEOBUF2_DMA_CONTIG
>> +     select V4L2_FWNODE
>> +     help
>> +       Say yes here to enable support for Tegra video input hardware
>> diff --git a/drivers/staging/media/tegra/Makefile b/drivers/staging/media/tegra/Makefile
>> new file mode 100644
>> index 000000000000..003d23444d49
>> --- /dev/null
>> +++ b/drivers/staging/media/tegra/Makefile
>> @@ -0,0 +1,11 @@
>> +# SPDX-License-Identifier: GPL-2.0
>> +tegra-video-y := \
>> +             host1x-video.o \
>> +             tegra-channel.o \
>> +             tegra-core.o \
>> +             csi2_fops.o \
>> +             vi2_fops.o \
>> +             tegra-vi.o \
>> +             tegra-csi.o
>> +
>> +obj-$(CONFIG_VIDEO_TEGRA) += tegra-video.o
>> diff --git a/drivers/staging/media/tegra/TODO b/drivers/staging/media/tegra/TODO
>> new file mode 100644
>> index 000000000000..d7d64b13535e
>> --- /dev/null
>> +++ b/drivers/staging/media/tegra/TODO
>> @@ -0,0 +1,10 @@
>> +TODO list
>> +* Currently driver supports Tegra build-in TPG Only with direct media links from CSI to VI.
>> +  Update the driver to do TPG Vs Sensor media links based on the kernel config CONFIG_VIDEO_TEGRA_TPG.
>> +* Add real camera sensor capture support
>> +* Add RAW10 packed video format support to Tegra210 video formats
>> +* Add Tegra CSI MIPI pads calibration
>> +* Add MIPI clock Settle time computation based on the data rate
>> +* Add support for Ganged mode
>> +* Make sure v4l2-compliance tests pass with all of the above implementations.
>> +* Add SMMU support for VI to avoid cma_alloc failures with higher resolutions of some video formats.
>> diff --git a/drivers/staging/media/tegra/csi.h b/drivers/staging/media/tegra/csi.h
>> new file mode 100644
>> index 000000000000..81cdda4b6bdd
>> --- /dev/null
>> +++ b/drivers/staging/media/tegra/csi.h
>> @@ -0,0 +1,111 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (C) 2020 NVIDIA CORPORATION.  All rights reserved.
>> + */
>> +
>> +#ifndef __CSI_H_
>> +#define __CSI_H_
>> +
>> +#include <media/media-device.h>
>> +#include <media/media-entity.h>
>> +#include <media/v4l2-async.h>
>> +#include <media/v4l2-ctrls.h>
>> +#include <media/v4l2-device.h>
>> +#include <media/v4l2-dev.h>
>> +#include <media/videobuf2-v4l2.h>
>> +
>> +/*
>> + * Each CSI brick supports max of 4 lanes that can be used as either
>> + * one x4 port using both CILA and CILB partitions of a CSI brick or can
>> + * be used as two x2 ports with one x2 from CILA and the other x2 from
>> + * CILB.
>> + */
>> +#define CSI_LANES_PER_BRICK  4
>> +#define CSI_PORTS_PER_BRICK  2
>> +
>> +/* each CSI channel can have one sink and one source pads */
>> +#define TEGRA_CSI_PADS_NUM   2
>> +
>> +enum tegra_csi_cil_port {
>> +     PORT_A = 0,
>> +     PORT_B,
>> +};
>> +
>> +enum tegra_csi_block {
>> +     CSI_CIL_AB = 0,
>> +     CSI_CIL_CD,
>> +     CSI_CIL_EF,
>> +};
>> +
>> +struct tegra_csi_device;
>> +
>> +struct tegra_csi_port {
>> +     void __iomem *pixel_parser;
>> +     void __iomem *cila;
>> +     void __iomem *cilb;
>> +     void __iomem *tpg;
>> +
>> +     /* one pair of sink/source pad has one format */
>> +     struct v4l2_mbus_framefmt format;
>> +     unsigned int lanes;
>> +};
>> +
>> +struct tegra_csi_channel {
>> +     struct list_head list;
>> +     struct v4l2_subdev subdev;
>> +     struct media_pad pads[TEGRA_CSI_PADS_NUM];
>> +     struct device_node *of_node;
>> +     struct tegra_csi_device *csi;
>> +     struct tegra_csi_port *ports;
>> +     unsigned int numlanes;
>> +     unsigned int numpads;
>> +     u8 csi_port_num;
>> +
>> +     /* protects csi channel ports format fields */
>> +     struct mutex format_lock;
>> +};
>> +
>> +struct tegra_csi_soc_data {
>> +     const struct tegra_csi_fops *csi_fops;
>> +     unsigned int cil_max_clk_hz;
>> +     unsigned int num_tpg_channels;
>> +};
>> +
>> +/**
>> + * struct tegra_csi_device - NVIDIA Tegra CSI device structure
>> + * @dev: device struct
>> + * @client: host1x_client struct
>> + *
>> + * @iomem: register base
>> + * @csi_clk: clock for CSI
>> + * @cilab_clk: clock for CIL AB
>> + * @cilcd_clk: clock for CIL CD
>> + * @cilef_clk: clock for CIL EF
>> + * @tpg_clk: clock for internal CSI TPG logic
>> + *
>> + * @soc_data: pointer to SoC data structure
>> + * @fops: csi operations
>> + *
>> + * @channels: list of CSI channels
>> + */
>> +struct tegra_csi_device {
>> +     struct device *dev;
>> +     struct host1x_client client;
>> +
>> +     void __iomem *iomem;
>> +     struct clk *csi_clk;
>> +     struct clk *cilab_clk;
>> +     struct clk *cilcd_clk;
>> +     struct clk *cilef_clk;
>> +     struct clk *tpg_clk;
>> +     atomic_t clk_refcnt;
>> +
>> +     const struct tegra_csi_soc_data *soc_data;
>> +     const struct tegra_csi_fops *fops;
>> +
>> +     struct list_head csi_chans;
>> +};
>> +
>> +void tegra_csi_error_status(struct v4l2_subdev *subdev);
>> +
>> +#endif
>> diff --git a/drivers/staging/media/tegra/csi2_fops.c b/drivers/staging/media/tegra/csi2_fops.c
>> new file mode 100644
>> index 000000000000..5f2f7bd3ae50
>> --- /dev/null
>> +++ b/drivers/staging/media/tegra/csi2_fops.c
>> @@ -0,0 +1,335 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (C) 2020 NVIDIA CORPORATION.  All rights reserved.
>> + */
>> +
>> +#include <linux/clk.h>
>> +#include <linux/clk/tegra.h>
>> +#include <linux/delay.h>
>> +
>> +#include "vi2_registers.h"
>> +#include "mc_common.h"
>> +#include "csi2_fops.h"
>> +#include "csi.h"
>> +
>> +/* CSI block registers offset */
>> +#define TEGRA210_CSI_PORT_OFFSET             0x34
>> +/* CSI CIL parition registers offset */
>> +#define TEGRA210_CSI_CIL_OFFSET                      0x0f4
>> +/* CSI TPG registers offset */
>> +#define TEGRA210_CSI_TPG_OFFSET                      0x18c
>> +
>> +#define CSI_PP_OFFSET(block) ((block) * 0x800)
>> +
>> +static void csi_write(struct tegra_csi_channel *chan, u8 block,
>> +                   unsigned int addr, u32 val)
>> +{
>> +     void __iomem *csi_pp_base;
>> +
>> +     csi_pp_base = chan->csi->iomem + CSI_PP_OFFSET(block);
>> +     writel(val, csi_pp_base + addr);
>> +}
>> +
>> +/* Pixel parser registers accessors */
>> +static void pp_write(struct tegra_csi_port *port, u32 addr, u32 val)
>> +{
>> +     writel(val, port->pixel_parser + addr);
>> +}
>> +
>> +static u32 pp_read(struct tegra_csi_port *port, u32 addr)
>> +{
>> +     return readl(port->pixel_parser + addr);
>> +}
>> +
>> +/* CSI CIL A/B port registers accessors */
>> +static void cil_write(struct tegra_csi_port *port, u8 port_id,
>> +                   u32 addr, u32 val)
>> +{
>> +     if (port_id & PORT_B)
>> +             writel(val, port->cilb + addr);
>> +     else
>> +             writel(val, port->cila + addr);
>> +}
>> +
>> +static u32 cil_read(struct tegra_csi_port *port, u8 port_id,
>> +                 u32 addr)
>> +{
>> +     if (port_id & PORT_B)
>> +             return readl(port->cilb + addr);
>> +     else
>> +             return readl(port->cila + addr);
>> +}
>> +
>> +/* Test pattern generator registers accessor */
>> +static void tpg_write(struct tegra_csi_port *port, unsigned int addr, u32 val)
>> +{
>> +     writel(val, port->tpg + addr);
>> +}
>> +
>> +static void csi2_error_status(struct tegra_csi_channel *csi_chan)
>> +{
>> +     struct tegra_csi_device *csi = csi_chan->csi;
>> +     unsigned int port_num = csi_chan->csi_port_num;
>> +     struct tegra_csi_port *port = csi_chan->ports;
>> +     u32 val;
>> +
>> +     val = pp_read(port, TEGRA_CSI_PIXEL_PARSER_STATUS);
>> +     dev_err(csi->dev, "TEGRA_CSI_PIXEL_PARSER_STATUS 0x%08x\n", val);
>> +
>> +     val = cil_read(port, port_num, TEGRA_CSI_CIL_STATUS);
>> +     dev_err(csi->dev, "TEGRA_CSI_CIL_STATUS 0x%08x\n", val);
>> +
>> +     val = cil_read(port, port_num, TEGRA_CSI_CILX_STATUS);
>> +     dev_err(csi->dev, "TEGRA_CSI_CILX_STATUS 0x%08x\n", val);
>> +}
>> +
>> +static int csi2_start_streaming(struct tegra_csi_channel *csi_chan,
>> +                             u8 pg_mode, int enable)
>> +{
>> +     struct tegra_csi_device *csi = csi_chan->csi;
>> +     unsigned int port_num = csi_chan->csi_port_num;
>> +     unsigned int block = port_num >> 1;
>> +     struct tegra_csi_port *port = csi_chan->ports;
>> +     unsigned int cil_max_freq = csi->soc_data->cil_max_clk_hz;
>> +     struct clk *cil_clk;
>> +     int ret;
>> +
>> +     if (block == CSI_CIL_AB)
>> +             cil_clk = csi->cilab_clk;
>> +     else if (block == CSI_CIL_CD)
>> +             cil_clk = csi->cilcd_clk;
>> +     else
>> +             cil_clk = csi->cilef_clk;
>> +
>> +     if (enable) {
>> +             ret = clk_set_rate(cil_clk, cil_max_freq);
>> +             if (ret)
>> +                     dev_err(csi->dev,
>> +                             "failed to set cil clk rate, err: %d\n", ret);
>> +
>> +             /* enable CIL clock on first open */
>> +             if (atomic_add_return(1, &csi->clk_refcnt) == 1) {
>> +                     ret = clk_prepare_enable(cil_clk);
>> +                     if (ret) {
>> +                             dev_err(csi->dev,
>> +                                     "failed to enable cil clk, err: %d\n",
>> +                                     ret);
>> +                             return ret;
>> +                     }
>> +             }
>> +
>> +             /*
>> +              * On Tegra210, TPG internal logic uses PLLD out along with
>> +              * the CIL clock.
>> +              * So, enable TPG clock during TPG mode streaming.
>> +              */
>> +             if (pg_mode) {
>> +                     ret = clk_set_rate(csi->tpg_clk, TEGRA210_TPG_CLOCK);
>> +                     if (ret)
>> +                             dev_err(csi->dev,
>> +                                     "failed to set tpg clk rate\n");
>> +
>> +                     ret = clk_prepare_enable(csi->tpg_clk);
>> +                     if (ret) {
>> +                             dev_err(csi->dev,
>> +                                     "failed to enable tpg clk, err: %d\n",
>> +                                     ret);
>> +                             return ret;
>> +                     }
>> +             }
>> +
>> +             csi_write(csi_chan, block, TEGRA_CSI_CLKEN_OVERRIDE, 0);
>> +
>> +             /* clean up status */
>> +             pp_write(port, TEGRA_CSI_PIXEL_PARSER_STATUS, 0xFFFFFFFF);
>> +             cil_write(port, port_num, TEGRA_CSI_CIL_STATUS, 0xFFFFFFFF);
>> +             cil_write(port, port_num, TEGRA_CSI_CILX_STATUS, 0xFFFFFFFF);
>> +             cil_write(port, port_num, TEGRA_CSI_CIL_INTERRUPT_MASK, 0x0);
>> +
>> +             /* CIL PHY registers setup */
>> +             cil_write(port, port_num, TEGRA_CSI_CIL_PAD_CONFIG0, 0x0);
>> +             cil_write(port, port_num, TEGRA_CSI_CIL_PHY_CONTROL, 0xA);
>> +
>> +             /*
>> +              * The CSI unit provides for connection of up to six cameras in
>> +              * the system and is organized as three identical instances of
>> +              * two MIPI support blocks, each with a separate 4-lane
>> +              * interface that can be configured as a single camera with 4
>> +              * lanes or as a dual camera with 2 lanes available for each
>> +              * camera.
>> +              */
>> +             if (port->lanes == 4) {
>> +                     cil_write(port, port_num, TEGRA_CSI_CIL_PAD_CONFIG0,
>> +                               BRICK_CLOCK_A_4X);
>> +
>> +                     cil_write(port, (port_num + 1),
>> +                               TEGRA_CSI_CIL_PAD_CONFIG0, 0x0);
>> +
>> +                     cil_write(port, (port_num + 1),
>> +                               TEGRA_CSI_CIL_INTERRUPT_MASK, 0x0);
>> +
>> +                     cil_write(port, (port_num + 1),
>> +                               TEGRA_CSI_CIL_PHY_CONTROL, 0xA);
>> +
>> +                     csi_write(csi_chan, block, TEGRA_CSI_PHY_CIL_COMMAND,
>> +                               CSI_A_PHY_CIL_ENABLE | CSI_B_PHY_CIL_ENABLE);
>> +             } else {
>> +                     u32 val = ((port_num & 1) == PORT_A) ?
>> +                               CSI_A_PHY_CIL_ENABLE | CSI_B_PHY_CIL_NOP :
>> +                               CSI_B_PHY_CIL_ENABLE | CSI_A_PHY_CIL_NOP;
>> +                     csi_write(csi_chan, block, TEGRA_CSI_PHY_CIL_COMMAND,
>> +                               val);
>> +             }
>> +
>> +             /* CSI pixel parser registers setup */
>> +             pp_write(port, TEGRA_CSI_PIXEL_STREAM_PP_COMMAND,
>> +                      (0xF << CSI_PP_START_MARKER_FRAME_MAX_OFFSET) |
>> +                      CSI_PP_SINGLE_SHOT_ENABLE | CSI_PP_RST);
>> +             pp_write(port, TEGRA_CSI_PIXEL_PARSER_INTERRUPT_MASK, 0x0);
>> +             pp_write(port, TEGRA_CSI_PIXEL_STREAM_CONTROL0,
>> +                      CSI_PP_PACKET_HEADER_SENT |
>> +                      CSI_PP_DATA_IDENTIFIER_ENABLE |
>> +                      CSI_PP_WORD_COUNT_SELECT_HEADER |
>> +                      CSI_PP_CRC_CHECK_ENABLE |  CSI_PP_WC_CHECK |
>> +                      CSI_PP_OUTPUT_FORMAT_STORE |
>> +                      CSI_PP_HEADER_EC_DISABLE | CSI_PPA_PAD_FRAME_NOPAD |
>> +                      (port_num & 1));
>> +             pp_write(port, TEGRA_CSI_PIXEL_STREAM_CONTROL1,
>> +                      (0x1 << CSI_PP_TOP_FIELD_FRAME_OFFSET) |
>> +                      (0x1 << CSI_PP_TOP_FIELD_FRAME_MASK_OFFSET));
>> +             pp_write(port, TEGRA_CSI_PIXEL_STREAM_GAP,
>> +                      0x14 << PP_FRAME_MIN_GAP_OFFSET);
>> +             pp_write(port, TEGRA_CSI_PIXEL_STREAM_EXPECTED_FRAME, 0x0);
>> +             pp_write(port, TEGRA_CSI_INPUT_STREAM_CONTROL,
>> +                      (0x3f << CSI_SKIP_PACKET_THRESHOLD_OFFSET) |
>> +                      (port->lanes - 1));
>> +
>> +             /* TPG setup */
>> +             if (pg_mode) {
>> +                     tpg_write(port, TEGRA_CSI_PATTERN_GENERATOR_CTRL,
>> +                               ((pg_mode - 1) << PG_MODE_OFFSET) |
>> +                               PG_ENABLE);
>> +                     tpg_write(port, TEGRA_CSI_PG_PHASE, 0x0);
>> +                     tpg_write(port, TEGRA_CSI_PG_RED_FREQ,
>> +                               (0x10 << PG_RED_VERT_INIT_FREQ_OFFSET) |
>> +                               (0x10 << PG_RED_HOR_INIT_FREQ_OFFSET));
>> +                     tpg_write(port, TEGRA_CSI_PG_RED_FREQ_RATE, 0x0);
>> +                     tpg_write(port, TEGRA_CSI_PG_GREEN_FREQ,
>> +                               (0x10 << PG_GREEN_VERT_INIT_FREQ_OFFSET) |
>> +                               (0x10 << PG_GREEN_HOR_INIT_FREQ_OFFSET));
>> +                     tpg_write(port, TEGRA_CSI_PG_GREEN_FREQ_RATE, 0x0);
>> +                     tpg_write(port, TEGRA_CSI_PG_BLUE_FREQ,
>> +                               (0x10 << PG_BLUE_VERT_INIT_FREQ_OFFSET) |
>> +                               (0x10 << PG_BLUE_HOR_INIT_FREQ_OFFSET));
>> +                     tpg_write(port, TEGRA_CSI_PG_BLUE_FREQ_RATE, 0x0);
>> +             }
>> +
>> +             pp_write(port, TEGRA_CSI_PIXEL_STREAM_PP_COMMAND,
>> +                      (0xF << CSI_PP_START_MARKER_FRAME_MAX_OFFSET) |
>> +                      CSI_PP_SINGLE_SHOT_ENABLE | CSI_PP_ENABLE);
>> +     } else {
>> +             u32 val = pp_read(port, TEGRA_CSI_PIXEL_PARSER_STATUS);
>> +
>> +             dev_dbg(csi->dev, "TEGRA_CSI_PIXEL_PARSER_STATUS 0x%08x\n",
>> +                     val);
>> +
>> +             val = cil_read(port, port_num, TEGRA_CSI_CIL_STATUS);
>> +             dev_dbg(csi->dev, "TEGRA_CSI_CIL_STATUS 0x%08x\n", val);
>> +
>> +             val = cil_read(port, port_num, TEGRA_CSI_CILX_STATUS);
>> +             dev_dbg(csi->dev, "TEGRA_CSI_CILX_STATUS 0x%08x\n", val);
>> +
>> +             pp_write(port, TEGRA_CSI_PIXEL_STREAM_PP_COMMAND,
>> +                      (0xF << CSI_PP_START_MARKER_FRAME_MAX_OFFSET) |
>> +                      CSI_PP_DISABLE);
>> +
>> +             if (pg_mode) {
>> +                     tpg_write(port, TEGRA_CSI_PATTERN_GENERATOR_CTRL,
>> +                               ((pg_mode - 1) << PG_MODE_OFFSET) |
>> +                               PG_DISABLE);
>> +                     clk_disable_unprepare(csi->tpg_clk);
>> +             }
>> +
>> +             if (port->lanes == 4) {
>> +                     csi_write(csi_chan, block, TEGRA_CSI_PHY_CIL_COMMAND,
>> +                               CSI_A_PHY_CIL_DISABLE |
>> +                               CSI_B_PHY_CIL_DISABLE);
>> +
>> +             } else {
>> +                     u32 val = ((port_num & 1) == PORT_A) ?
>> +                               CSI_A_PHY_CIL_DISABLE | CSI_B_PHY_CIL_NOP :
>> +                               CSI_B_PHY_CIL_DISABLE | CSI_A_PHY_CIL_NOP;
>> +                     csi_write(csi_chan, block, TEGRA_CSI_PHY_CIL_COMMAND,
>> +                               val);
>> +             }
>> +     }
>> +
>> +     return 0;
>> +}
>> +
>> +static int csi2_hw_init(struct tegra_csi_device *csi)
>> +{
>> +     struct tegra_csi_channel *csi_chan;
>> +     struct tegra_csi_port *port;
>> +     u8 portno;
>> +     int ret;
>> +
>> +     csi->cilab_clk = devm_clk_get(csi->dev, "cilab");
>> +     if (IS_ERR(csi->cilab_clk)) {
>> +             dev_err(csi->dev, "Failed to get cilab clock\n");
>> +             return PTR_ERR(csi->cilab_clk);
>> +     }
>> +
>> +     csi->cilcd_clk = devm_clk_get(csi->dev, "cilcd");
>> +     if (IS_ERR(csi->cilcd_clk)) {
>> +             dev_err(csi->dev, "Failed to get cilcd clock\n");
>> +             return PTR_ERR(csi->cilcd_clk);
>> +     }
>> +
>> +     csi->cilef_clk = devm_clk_get(csi->dev, "cile");
>> +     if (IS_ERR(csi->cilef_clk)) {
>> +             dev_err(csi->dev, "Failed to get cile clock\n");
>> +             return PTR_ERR(csi->cilef_clk);
>> +     }
>> +
>> +     csi->tpg_clk = devm_clk_get(csi->dev, "csi_tpg");
>> +     if (IS_ERR(csi->tpg_clk)) {
>> +             dev_err(csi->dev, "Failed to get csi_tpg clock\n");
>> +             return PTR_ERR(csi->tpg_clk);
>> +     }
>> +
>> +     csi->csi_clk = devm_clk_get(csi->dev, "csi");
>> +     if (IS_ERR(csi->csi_clk)) {
>> +             dev_err(csi->dev, "Failed to get csi clock\n");
>> +             return PTR_ERR(csi->csi_clk);
>> +     }
>> +
>> +     ret = clk_prepare_enable(csi->csi_clk);
>> +     if (ret) {
>> +             dev_err(csi->dev, "Failed to enable csi clk, err: %d\n", ret);
>> +             return ret;
>> +     }
>> +
>> +     list_for_each_entry(csi_chan, &csi->csi_chans, list) {
>> +             void __iomem *csi_pp_base;
>> +
>> +             port = csi_chan->ports;
>> +             portno = csi_chan->csi_port_num;
>> +             csi_pp_base = csi->iomem + CSI_PP_OFFSET(portno >> 1);
>> +             port->pixel_parser = csi_pp_base +
>> +                                  (portno % CSI_PORTS_PER_BRICK) *
>> +                                  TEGRA210_CSI_PORT_OFFSET;
>> +             port->cila = csi_pp_base + TEGRA210_CSI_CIL_OFFSET;
>> +             port->cilb = port->cila + TEGRA210_CSI_PORT_OFFSET;
>> +             port->tpg = port->pixel_parser + TEGRA210_CSI_TPG_OFFSET;
>> +     }
>> +
>> +     return 0;
>> +}
>> +
>> +const struct tegra_csi_fops csi2_fops = {
>> +     .hw_init = csi2_hw_init,
>> +     .csi_start_streaming = csi2_start_streaming,
>> +     .csi_err_status = csi2_error_status,
>> +};
>> +EXPORT_SYMBOL(csi2_fops);
>> diff --git a/drivers/staging/media/tegra/csi2_fops.h b/drivers/staging/media/tegra/csi2_fops.h
>> new file mode 100644
>> index 000000000000..cf22a28ceb1f
>> --- /dev/null
>> +++ b/drivers/staging/media/tegra/csi2_fops.h
>> @@ -0,0 +1,15 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (C) 2020 NVIDIA CORPORATION.  All rights reserved.
>> + */
>> +
>> +#ifndef __CSI2_H__
>> +#define __CSI2_H__
>> +
>> +#define      TEGRA210_TPG_CLOCK              594000000
>> +#define      TEGRA210_CSI_CIL_CLK_MAX        102000000
>> +#define TEGRA210_CSI_BRICKS_MAX              3
>> +
>> +extern const struct tegra_csi_fops csi2_fops;
>> +
>> +#endif
>> diff --git a/drivers/staging/media/tegra/host1x-video.c b/drivers/staging/media/tegra/host1x-video.c
>> new file mode 100644
>> index 000000000000..740806121e6b
>> --- /dev/null
>> +++ b/drivers/staging/media/tegra/host1x-video.c
>> @@ -0,0 +1,120 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (C) 2020 NVIDIA CORPORATION.  All rights reserved.
>> + */
>> +
>> +#include <linux/host1x.h>
>> +#include <linux/module.h>
>> +#include <linux/platform_device.h>
>> +
>> +#include "host1x-video.h"
>> +
>> +static int host1x_video_probe(struct host1x_device *dev)
>> +{
>> +     struct tegra_camera *cam;
>> +     int ret;
>> +
>> +     cam = devm_kzalloc(&dev->dev, sizeof(*cam), GFP_KERNEL);
>> +     if (!cam)
>> +             return -ENOMEM;
>> +
>> +     cam->dev = get_device(&dev->dev);
>> +     cam->media_dev.dev = cam->dev;
>> +     strscpy(cam->media_dev.model, "NVIDIA Tegra Video Input Device",
>> +             sizeof(cam->media_dev.model));
>> +     cam->media_dev.hw_revision = 3;
>> +
>> +     media_device_init(&cam->media_dev);
>> +     ret = media_device_register(&cam->media_dev);
>> +     if (ret < 0) {
>> +             dev_err(cam->dev, "failed to register media device: %d\n", ret);
>> +             return ret;
>> +     }
>> +
>> +     cam->v4l2_dev.mdev = &cam->media_dev;
>> +     ret = v4l2_device_register(cam->dev, &cam->v4l2_dev);
>> +     if (ret < 0) {
>> +             dev_err(cam->dev, "V4L2 device registration failed: %d\n", ret);
>> +             goto register_error;
>> +     }
>> +
>> +     dev_set_drvdata(&dev->dev, cam);
>> +
>> +     ret = host1x_device_init(dev);
>> +     if (ret < 0)
>> +             goto dev_exit;
>> +
>> +     return 0;
>> +
>> +dev_exit:
>> +     host1x_device_exit(dev);
>> +     v4l2_device_unregister(&cam->v4l2_dev);
>> +register_error:
>> +     media_device_unregister(&cam->media_dev);
>> +     media_device_cleanup(&cam->media_dev);
>> +
>> +     return ret;
>> +}
>> +
>> +static int host1x_video_remove(struct host1x_device *dev)
>> +{
>> +     struct tegra_camera *cam = dev_get_drvdata(&dev->dev);
>> +
>> +     host1x_device_exit(dev);
>> +     v4l2_device_unregister(&cam->v4l2_dev);
>> +     media_device_unregister(&cam->media_dev);
>> +     media_device_cleanup(&cam->media_dev);
>> +
>> +     return 0;
>> +}
>> +
>> +static const struct of_device_id host1x_video_subdevs[] = {
>> +     { .compatible = "nvidia,tegra210-csi", },
>> +     { .compatible = "nvidia,tegra210-vi", },
>> +     { }
>> +};
>> +
>> +static struct host1x_driver host1x_video_driver = {
>> +     .driver = {
>> +             .name = "host1x_video",
>> +     },
>> +     .probe = host1x_video_probe,
>> +     .remove = host1x_video_remove,
>> +     .subdevs = host1x_video_subdevs,
>> +};
>> +
>> +static struct platform_driver * const drivers[] = {
>> +     &tegra_csi_driver,
>> +     &tegra_vi_driver,
>> +};
>> +
>> +static int __init host1x_video_init(void)
>> +{
>> +     int err;
>> +
>> +     err = host1x_driver_register(&host1x_video_driver);
>> +     if (err < 0)
>> +             return err;
>> +
>> +     err = platform_register_drivers(drivers, ARRAY_SIZE(drivers));
>> +     if (err < 0)
>> +             goto unregister_host1x;
>> +
>> +     return 0;
>> +
>> +unregister_host1x:
>> +     host1x_driver_unregister(&host1x_video_driver);
>> +     return err;
>> +}
>> +module_init(host1x_video_init);
>> +
>> +static void __exit host1x_video_exit(void)
>> +{
>> +     platform_unregister_drivers(drivers, ARRAY_SIZE(drivers));
>> +     host1x_driver_unregister(&host1x_video_driver);
>> +}
>> +module_exit(host1x_video_exit);
>> +
>> +MODULE_AUTHOR("Sowjanya Komatineni <skomatineni@nvidia.com>");
>> +MODULE_DESCRIPTION("NVIDIA Tegra Host1x Video driver");
>> +MODULE_LICENSE("GPL v2");
>> diff --git a/drivers/staging/media/tegra/host1x-video.h b/drivers/staging/media/tegra/host1x-video.h
>> new file mode 100644
>> index 000000000000..84d28e6f4362
>> --- /dev/null
>> +++ b/drivers/staging/media/tegra/host1x-video.h
>> @@ -0,0 +1,33 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (C) 2020 NVIDIA CORPORATION.  All rights reserved.
>> + */
>> +
>> +#ifndef HOST1X_VIDEO_H
>> +#define HOST1X_VIDEO_H 1
>> +
>> +#include <linux/host1x.h>
>> +
>> +#include <media/media-device.h>
>> +#include <media/media-entity.h>
>> +#include <media/v4l2-async.h>
>> +#include <media/v4l2-ctrls.h>
>> +#include <media/v4l2-device.h>
>> +#include <media/v4l2-dev.h>
>> +#include <media/videobuf2-v4l2.h>
>> +
>> +#include "tegra-vi.h"
>> +#include "csi.h"
>> +
>> +struct tegra_camera {
>> +     struct v4l2_device v4l2_dev;
>> +     struct media_device media_dev;
>> +     struct device *dev;
>> +     struct tegra_vi *vi;
>> +     struct tegra_csi_device *csi;
>> +};
>> +
>> +extern struct platform_driver tegra_vi_driver;
>> +extern struct platform_driver tegra_csi_driver;
>> +
>> +#endif /* HOST1X_VIDEO_H */
>> diff --git a/drivers/staging/media/tegra/mc_common.h b/drivers/staging/media/tegra/mc_common.h
>> new file mode 100644
>> index 000000000000..9e88f3295ef4
>> --- /dev/null
>> +++ b/drivers/staging/media/tegra/mc_common.h
>> @@ -0,0 +1,131 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (C) 2020 NVIDIA CORPORATION.  All rights reserved.
>> + */
>> +
>> +#ifndef __MC_COMMON_H_
>> +#define __MC_COMMON_H_
>> +
>> +#include <linux/host1x.h>
>> +#include <linux/mutex.h>
>> +#include <linux/spinlock.h>
>> +
>> +#include <media/media-device.h>
>> +#include <media/media-entity.h>
>> +#include <media/v4l2-async.h>
>> +#include <media/v4l2-ctrls.h>
>> +#include <media/v4l2-device.h>
>> +#include <media/v4l2-dev.h>
>> +#include <media/videobuf2-v4l2.h>
>> +
>> +#include "tegra-core.h"
>> +#include "tegra-vi.h"
>> +#include "csi.h"
>> +
>> +#define MAX_FORMAT_NUM       64
>> +
>> +struct tegra_csi_fops {
>> +     int (*hw_init)(struct tegra_csi_device *csi);
>> +     int (*csi_start_streaming)(struct tegra_csi_channel *csi_chan,
>> +                                u8 pg_mode, int enable);
>> +     void (*csi_err_status)(struct tegra_csi_channel *csi_chan);
>> +};
>> +
>> +/**
>> + * struct tegra_channel - Tegra video channel
>> + * @list: list entry in a composite device dmas list
>> + * @video: V4L2 video device associated with the video channel
>> + * @video_lock: protects the @format and @queue fields
>> + * @pad: media pad for the video device entity
>> + *
>> + * @vi: composite device DT node port number for the channel
>> + *
>> + * @sp: host1x syncpoint pointer
>> + *
>> + * @kthread_capture_start: capture start kthread of this video channel
>> + * @start_wait: wait queue used by capture start kthread
>> + * @kthread_capture_done: capture done kthread of this video channel
>> + * @done_wait: wait queue used by capture done kthread
>> + *
>> + * @format: active V4L2 pixel format
>> + * @fmtinfo: format information corresponding to the active @format
>> + * @video_formats: supported video formats
>> + * @nformats: supported number of video formats
>> + *
>> + * @queue: vb2 buffers queue
>> + * @sequence: V4L2 buffers sequence number
>> + *
>> + * @capture: list of queued buffers for capture
>> + * @start_lock: protects the capture queued list
>> + * @done: list of capture done queued buffers
>> + * @done_lock: protects the capture done queue list
>> + *
>> + * @stride_align: channel buffer stride alignment
>> + * @width_align: channel buffer width alignment
>> + * @height_align: channel buffer height alignment
>> + * @size_align: channel buffer size alignment
>> +
>> + * @port: CSI port of this video channel
>> + *
>> + * @ctrl_handler: V4L2 control handler of this video channel
>> + * @tpg_fmts_bitmap: a bitmap for supported TPG formats
>> + */
>> +struct tegra_channel {
>> +     struct list_head list;
>> +     struct video_device video;
>> +     /* protects the @format and @queue fields */
>> +     struct mutex video_lock;
>> +     struct media_pad pad;
>> +
>> +     struct tegra_vi *vi;
>> +     struct host1x_syncpt *sp;
>> +
>> +     struct task_struct *kthread_capture_start;
>> +     wait_queue_head_t start_wait;
>> +     struct task_struct *kthread_capture_done;
>> +     wait_queue_head_t done_wait;
>> +
>> +     struct v4l2_pix_format format;
>> +     const struct tegra_video_format *fmtinfo;
>> +     const struct tegra_video_format *video_formats;
>> +     unsigned int nformats;
>> +     struct vb2_queue queue;
>> +     u32 sequence;
>> +
>> +     struct list_head capture;
>> +     /* protects the capture queued list */
>> +     spinlock_t start_lock;
>> +     struct list_head done;
>> +     /* protects the capture done queue list */
>> +     spinlock_t done_lock;
>> +
>> +     unsigned int stride_align;
>> +     unsigned int width_align;
>> +     unsigned int height_align;
>> +     unsigned int size_align;
>> +     unsigned char port;
>> +
>> +     struct v4l2_ctrl_handler ctrl_handler;
>> +     DECLARE_BITMAP(tpg_fmts_bitmap, MAX_FORMAT_NUM);
>> +};
>> +
>> +#define to_tegra_channel(vdev) \
>> +     container_of(vdev, struct tegra_channel, video)
>> +
>> +const struct tegra_video_format *tegra_core_get_default_format(void);
>> +u32 tegra_core_get_fourcc_by_idx(struct tegra_channel *chan,
>> +                              unsigned int index);
>> +int tegra_core_get_idx_by_code(struct tegra_channel *chan, unsigned int code,
>> +                            unsigned int offset);
>> +const struct tegra_video_format *
>> +tegra_core_get_format_by_fourcc(struct tegra_channel *chan, u32 fourcc);
>> +
>> +int tegra_channel_init(struct tegra_channel *chan);
>> +int tegra_channel_setup_ctrl_handler(struct tegra_channel *chan);
>> +int tegra_channel_cleanup(struct tegra_channel *chan);
>> +int tegra_channel_set_stream(struct tegra_channel *chan, bool on);
>> +void tegra_channel_queued_buf_done(struct tegra_channel *chan,
>> +                                enum vb2_buffer_state state);
>> +int tegra_channel_csi_error_status(struct tegra_channel *chan);
>> +
>> +#endif
>> diff --git a/drivers/staging/media/tegra/tegra-channel.c b/drivers/staging/media/tegra/tegra-channel.c
>> new file mode 100644
>> index 000000000000..7561f6fb8748
>> --- /dev/null
>> +++ b/drivers/staging/media/tegra/tegra-channel.c
>> @@ -0,0 +1,628 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (C) 2020 NVIDIA CORPORATION.  All rights reserved.
>> + */
>> +
>> +#include <linux/atomic.h>
>> +#include <linux/bitmap.h>
>> +#include <linux/clk.h>
>> +#include <linux/host1x.h>
>> +#include <linux/kthread.h>
>> +#include <linux/lcm.h>
>> +#include <linux/list.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/sched.h>
>> +#include <linux/slab.h>
>> +
>> +#include <media/v4l2-event.h>
>> +#include <media/v4l2-fh.h>
>> +#include <media/v4l2-ioctl.h>
>> +#include <media/videobuf2-dma-contig.h>
>> +
>> +#include <soc/tegra/pmc.h>
>> +
>> +#include "mc_common.h"
>> +#include "tegra-vi.h"
>> +#include "host1x-video.h"
>> +
>> +#define MAX_CID_CONTROLS             1
>> +
>> +static const char *const vi_pattern_strings[] = {
>> +     "Black/White Direct Mode",
>> +     "Color Patch Mode",
>> +};
>> +
>> +static int vi_s_ctrl(struct v4l2_ctrl *ctrl)
>> +{
>> +     struct tegra_channel *chan = container_of(ctrl->handler,
>> +                                               struct tegra_channel,
>> +                                               ctrl_handler);
>> +
>> +     switch (ctrl->id) {
>> +     case V4L2_CID_TEST_PATTERN:
>> +             chan->vi->pg_mode = ctrl->val + 1;
>> +             dev_info(chan->vi->dev, "TPG mode is set to %s\n",
>> +                      vi_pattern_strings[ctrl->val]);
> There is no need to spam the log with this message.
>
>> +             break;
>> +
>> +     default:
>> +             dev_err(chan->vi->dev, "Invalid Tegra video control\n");
> This can be dropped as well. Actually, this should never happen since the
> control framework will call this function for valid controls only.
>
>> +             return -EINVAL;
> Traditionally the 'default: return -EINVAL;' is kept, just in case we ever
> hit this through some regression.
>
>> +     }
>> +
>> +     return 0;
>> +}
>> +
>> +static const struct v4l2_ctrl_ops vi_ctrl_ops = {
>> +     .s_ctrl = vi_s_ctrl,
>> +};
>> +
>> +/*
>> + * videobuf2 queue operations
>> + */
>> +static int tegra_channel_queue_setup(struct vb2_queue *vq,
>> +                                  unsigned int *nbuffers,
>> +                                  unsigned int *nplanes,
>> +                                  unsigned int sizes[],
>> +                                  struct device *alloc_devs[])
>> +{
>> +     struct tegra_channel *chan = vb2_get_drv_priv(vq);
>> +     unsigned int count = *nbuffers;
>> +
>> +     if (*nplanes)
>> +             return sizes[0] < chan->format.sizeimage ? -EINVAL : 0;
>> +
>> +     *nplanes = 1;
>> +     sizes[0] = chan->format.sizeimage;
>> +     alloc_devs[0] = chan->vi->dev;
>> +
>> +     return 0;
>> +}
>> +
>> +static int tegra_channel_buffer_prepare(struct vb2_buffer *vb)
>> +{
>> +     struct tegra_channel *chan = vb2_get_drv_priv(vb->vb2_queue);
>> +     struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
>> +     struct tegra_channel_buffer *buf = to_tegra_channel_buffer(vbuf);
>> +     unsigned long size = chan->format.sizeimage;
>> +
>> +     if (vb2_plane_size(vb, 0) < size) {
>> +             v4l2_err(chan->video.v4l2_dev, "buffer too small (%lu < %lu)\n",
>> +                      vb2_plane_size(vb, 0), size);
>> +             return -EINVAL;
>> +     }
>> +
>> +     vb2_set_plane_payload(vb, 0, size);
>> +     buf->chan = chan;
>> +     buf->addr = vb2_dma_contig_plane_dma_addr(vb, 0);
>> +
>> +     return 0;
>> +}
>> +
>> +static void tegra_channel_buffer_queue(struct vb2_buffer *vb)
>> +{
>> +     struct tegra_channel *chan = vb2_get_drv_priv(vb->vb2_queue);
>> +     struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
>> +     struct tegra_channel_buffer *buf = to_tegra_channel_buffer(vbuf);
>> +
>> +     /* put buffer into the capture queue */
>> +     spin_lock(&chan->start_lock);
>> +     list_add_tail(&buf->queue, &chan->capture);
>> +     spin_unlock(&chan->start_lock);
>> +
>> +     /* wait up kthread for capture */
>> +     wake_up_interruptible(&chan->start_wait);
>> +}
>> +
>> +int tegra_channel_csi_error_status(struct tegra_channel *chan)
>> +{
>> +     struct media_entity *entity;
>> +     struct media_pad *pad;
>> +     struct v4l2_subdev *subdev;
>> +
>> +     pad = media_entity_remote_pad(&chan->pad);
>> +     if (!pad)
>> +             return -ENODEV;
>> +
>> +     entity = pad->entity;
>> +     subdev = media_entity_to_v4l2_subdev(entity);
>> +
>> +     tegra_csi_error_status(subdev);
>> +
>> +     return 0;
>> +}
>> +
>> +static struct v4l2_subdev *
>> +tegra_channel_get_remote_subdev(struct tegra_channel *chan)
>> +{
>> +     struct media_pad *pad;
>> +     struct v4l2_subdev *subdev;
>> +     struct media_entity *entity;
>> +
>> +     pad = media_entity_remote_pad(&chan->pad);
>> +     entity = pad->entity;
>> +     subdev = media_entity_to_v4l2_subdev(entity);
>> +
>> +     return subdev;
>> +}
>> +
>> +int tegra_channel_set_stream(struct tegra_channel *chan, bool on)
>> +{
>> +     struct v4l2_subdev *subdev;
>> +     int ret;
>> +
>> +     /* stream CSI */
>> +     subdev = tegra_channel_get_remote_subdev(chan);
>> +     v4l2_set_subdev_hostdata(subdev, chan);
>> +     ret = v4l2_subdev_call(subdev, video, s_stream, on);
>> +     if (on && ret < 0 && ret != -ENOIOCTLCMD)
>> +             return ret;
>> +
>> +     return 0;
>> +}
>> +
>> +void tegra_channel_queued_buf_done(struct tegra_channel *chan,
>> +                                enum vb2_buffer_state state)
>> +{
>> +     struct tegra_channel_buffer *buf, *nbuf;
>> +
>> +     spin_lock(&chan->start_lock);
>> +     list_for_each_entry_safe(buf, nbuf, &chan->capture, queue) {
>> +             vb2_buffer_done(&buf->buf.vb2_buf, state);
>> +             list_del(&buf->queue);
>> +     }
>> +
>> +     spin_unlock(&chan->start_lock);
>> +}
>> +
>> +static int tegra_channel_start_streaming(struct vb2_queue *vq, u32 count)
>> +{
>> +     struct tegra_channel *chan = vb2_get_drv_priv(vq);
>> +
>> +     if (chan->vi->fops->vi_start_streaming)
>> +             return chan->vi->fops->vi_start_streaming(vq, count);
>> +
>> +     return 0;
>> +}
>> +
>> +static void tegra_channel_stop_streaming(struct vb2_queue *vq)
>> +{
>> +     struct tegra_channel *chan = vb2_get_drv_priv(vq);
>> +
>> +     if (chan->vi->fops->vi_start_streaming)
>> +             chan->vi->fops->vi_stop_streaming(vq);
>> +}
>> +
>> +static const struct vb2_ops tegra_channel_queue_qops = {
>> +     .queue_setup = tegra_channel_queue_setup,
>> +     .buf_prepare = tegra_channel_buffer_prepare,
>> +     .buf_queue = tegra_channel_buffer_queue,
>> +     .wait_prepare = vb2_ops_wait_prepare,
>> +     .wait_finish = vb2_ops_wait_finish,
>> +     .start_streaming = tegra_channel_start_streaming,
>> +     .stop_streaming = tegra_channel_stop_streaming,
>> +};
>> +
>> +/*
>> + * V4L2 ioctls
>> + */
>> +static int tegra_channel_querycap(struct file *file, void *fh,
>> +                               struct v4l2_capability *cap)
>> +{
>> +     struct v4l2_fh *vfh = file->private_data;
>> +     struct tegra_channel *chan = to_tegra_channel(vfh->vdev);
>> +
>> +     cap->device_caps = chan->video.device_caps;
>> +     cap->capabilities = cap->device_caps | V4L2_CAP_DEVICE_CAPS;
> Just drop these two lines. You already set device_caps in struct video_device,
> and that's sufficient. The v4l2 core will set these two fields for you
> based on the video_device.
>
>> +     strscpy(cap->driver, "tegra-video", sizeof(cap->driver));
>> +     strscpy(cap->card, chan->video.name, sizeof(cap->card));
>> +     snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:%s:%u",
>> +              dev_name(chan->vi->dev), chan->port);
>> +
>> +     return 0;
>> +}
>> +
>> +static int tegra_channel_enum_format(struct file *file, void *fh,
>> +                                  struct v4l2_fmtdesc *f)
>> +{
>> +     struct v4l2_fh *vfh = file->private_data;
>> +     struct tegra_channel *chan = to_tegra_channel(vfh->vdev);
>> +     unsigned int index = 0, i;
>> +     unsigned long *fmts_bitmap = chan->tpg_fmts_bitmap;
>> +
>> +     if (f->index >= bitmap_weight(fmts_bitmap, MAX_FORMAT_NUM))
>> +             return -EINVAL;
>> +
>> +     for (i = 0; i < f->index + 1; i++, index++)
>> +             index = find_next_bit(fmts_bitmap, MAX_FORMAT_NUM, index);
>> +
>> +     f->pixelformat = tegra_core_get_fourcc_by_idx(chan, index - 1);
>> +
>> +     return 0;
>> +}
>> +
>> +static void
>> +tegra_channel_fmt_align(struct tegra_channel *chan,
>> +                     const struct tegra_frac *bpp,
>> +                     u32 *width, u32 *height, u32 *bytesperline)
>> +{
>> +     unsigned int min_width, max_width;
>> +     unsigned int min_bpl, max_bpl, bpl;
>> +     unsigned int align, fmt_align;
>> +     unsigned int temp_width, temp_bpl;
>> +     unsigned int numerator, denominator;
>> +
>> +     denominator = (!bpp->denominator) ? 1 : bpp->denominator;
>> +     numerator = (!bpp->numerator) ? 1 : bpp->numerator;
>> +     fmt_align = (denominator == 1) ? numerator : 1;
>> +     align = lcm(chan->width_align, fmt_align);
>> +     bpl = (*width * numerator) / denominator;
>> +
>> +     if (chan->vi->fops->vi_stride_align)
>> +             chan->vi->fops->vi_stride_align(&bpl);
>> +
>> +     if (!*bytesperline)
>> +             *bytesperline = bpl;
>> +
>> +     /*
>> +      * The transfer alignment requirements are expressed in bytes. Compute
>> +      * the minimum and maximum values, clamp the requested width and convert
>> +      * it back to pixels.
>> +      * use bytesperline to adjust width for applicaton related requriements.
>> +      */
>> +     min_width = roundup(TEGRA_MIN_WIDTH, align);
>> +     max_width = rounddown(TEGRA_MAX_WIDTH, align);
>> +     temp_width = roundup(bpl, align);
>> +     *width = (clamp(temp_width, min_width, max_width) * denominator) /
>> +                     numerator;
>> +     *height = clamp(*height, TEGRA_MIN_HEIGHT, TEGRA_MAX_HEIGHT);
>> +
>> +     /*
>> +      * Clamp the requested bytes per line value. If the maximum bytes per
>> +      * line value is zero, the module doesn't support user configurable line
>> +      * sizes. Override the requested value with the minimum in that case.
>> +      */
>> +     min_bpl = bpl;
>> +     max_bpl = rounddown(TEGRA_MAX_WIDTH, chan->stride_align);
>> +     temp_bpl = roundup(*bytesperline, chan->stride_align);
>> +     *bytesperline = clamp(temp_bpl, min_bpl, max_bpl);
>> +}
>> +
>> +static void tegra_channel_update_format(struct tegra_channel *chan, u32 width,
>> +                                     u32 height, u32 fourcc,
>> +                                     const struct tegra_frac *bpp,
>> +                                     u32 preferred_stride)
>> +{
>> +     u32 denominator = (!bpp->denominator) ? 1 : bpp->denominator;
>> +     u32 numerator = (!bpp->numerator) ? 1 : bpp->numerator;
>> +     u32 bytesperline = (width * numerator / denominator);
>> +     u32 sizeimage, height_aligned;
>> +
>> +     chan->format.width = width;
>> +     chan->format.height = height;
>> +     chan->format.pixelformat = fourcc;
>> +     chan->format.bytesperline = preferred_stride ?: bytesperline;
>> +
>> +     tegra_channel_fmt_align(chan, bpp,
>> +                             &chan->format.width,
>> +                             &chan->format.height,
>> +                             &chan->format.bytesperline);
>> +
>> +     /* calculate the sizeimage per plane */
>> +     height_aligned = roundup(chan->format.height, chan->height_align);
>> +     sizeimage = chan->format.bytesperline * height_aligned;
>> +     chan->format.sizeimage = roundup(sizeimage, chan->size_align);
>> +}
>> +
>> +static int tegra_channel_get_format(struct file *file, void *fh,
>> +                                 struct v4l2_format *format)
>> +{
>> +     struct v4l2_fh *vfh = file->private_data;
>> +     struct tegra_channel *chan = to_tegra_channel(vfh->vdev);
>> +
>> +     format->fmt.pix = chan->format;
>> +
>> +     return 0;
>> +}
>> +
>> +static int __tegra_channel_try_format(struct tegra_channel *chan,
>> +                                   struct v4l2_pix_format *pix,
>> +                                   const struct tegra_video_format **vfmt)
>> +{
>> +     const struct tegra_video_format *fmt_info;
>> +     struct v4l2_subdev *subdev;
>> +     struct v4l2_subdev_format fmt;
>> +     struct v4l2_subdev_pad_config *pad_cfg;
>> +
>> +     subdev = tegra_channel_get_remote_subdev(chan);
>> +     pad_cfg = v4l2_subdev_alloc_pad_config(subdev);
>> +     if (!pad_cfg)
>> +             return -ENOMEM;
>> +
>> +     /*
>> +      * Retrieve format information and select the default format if the
>> +      * requested format isn't supported.
>> +      */
>> +     fmt_info = tegra_core_get_format_by_fourcc(chan, pix->pixelformat);
>> +     if (!fmt_info) {
>> +             pix->pixelformat = chan->format.pixelformat;
>> +             pix->colorspace = chan->format.colorspace;
>> +             fmt_info = tegra_core_get_format_by_fourcc(chan,
>> +                                                        pix->pixelformat);
>> +     }
>> +
>> +     /* Change this when start adding interlace format support */
>> +     pix->field = V4L2_FIELD_NONE;
>> +     fmt.which = V4L2_SUBDEV_FORMAT_TRY;
>> +     fmt.pad = 0;
>> +     v4l2_fill_mbus_format(&fmt.format, pix, fmt_info->code);
>> +     v4l2_subdev_call(subdev, pad, set_fmt, pad_cfg, &fmt);
>> +
>> +     v4l2_fill_pix_format(pix, &fmt.format);
>> +     tegra_channel_fmt_align(chan, &fmt_info->bpp, &pix->width, &pix->height,
>> +                             &pix->bytesperline);
>> +     pix->sizeimage = pix->bytesperline * pix->height;
>> +
>> +     if (vfmt)
>> +             *vfmt = fmt_info;
>> +
>> +     v4l2_subdev_free_pad_config(pad_cfg);
>> +
>> +     return 0;
>> +}
>> +
>> +static int tegra_channel_try_format(struct file *file, void *fh,
>> +                                 struct v4l2_format *format)
>> +{
>> +     struct v4l2_fh *vfh = file->private_data;
>> +     struct tegra_channel *chan = to_tegra_channel(vfh->vdev);
>> +
>> +     return __tegra_channel_try_format(chan, &format->fmt.pix, NULL);
>> +}
>> +
>> +static int tegra_channel_set_format(struct file *file, void *fh,
>> +                                 struct v4l2_format *format)
>> +{
>> +     struct v4l2_fh *vfh = file->private_data;
>> +     struct tegra_channel *chan = to_tegra_channel(vfh->vdev);
>> +     const struct tegra_video_format *info;
>> +     int ret;
>> +     struct v4l2_subdev_format fmt;
>> +     struct v4l2_subdev *subdev;
>> +     struct v4l2_pix_format *pix = &format->fmt.pix;
>> +
>> +     if (vb2_is_busy(&chan->queue))
>> +             return -EBUSY;
>> +
>> +     /* get supported format by try_fmt */
>> +     ret = __tegra_channel_try_format(chan, pix, &info);
>> +     if (ret)
>> +             return ret;
>> +
>> +     subdev = tegra_channel_get_remote_subdev(chan);
>> +
>> +     fmt.which = V4L2_SUBDEV_FORMAT_ACTIVE;
>> +     fmt.pad = 0;
>> +     v4l2_fill_mbus_format(&fmt.format, pix, info->code);
>> +     v4l2_subdev_call(subdev, pad, set_fmt, NULL, &fmt);
>> +
>> +     v4l2_fill_pix_format(pix, &fmt.format);
>> +     chan->format = *pix;
>> +     chan->fmtinfo = info;
>> +     tegra_channel_update_format(chan, pix->width,
>> +                                 pix->height, info->fourcc,
>> +                                 &info->bpp,
>> +                                 pix->bytesperline);
>> +     *pix = chan->format;
>> +
>> +     return 0;
>> +}
>> +
>> +static int tegra_channel_enum_input(struct file *file, void *fh,
>> +                                 struct v4l2_input *inp)
>> +{
>> +     /* Currently driver supports internal TPG only */
>> +     if (inp->index != 0)
>> +             return -EINVAL;
>> +
>> +     inp->type = V4L2_INPUT_TYPE_CAMERA;
>> +     strscpy(inp->name, "Tegra TPG", sizeof(inp->name));
>> +
>> +     return 0;
>> +}
>> +
>> +static int tegra_channel_g_input(struct file *file, void *priv,
>> +                              unsigned int *i)
>> +{
>> +     *i = 0;
>> +     return 0;
>> +}
>> +
>> +static int tegra_channel_s_input(struct file *file, void *priv,
>> +                              unsigned int input)
>> +{
>> +     if (input > 0)
>> +             return -EINVAL;
>> +
>> +     return 0;
>> +}
>> +
>> +static const struct v4l2_ioctl_ops tegra_channel_ioctl_ops = {
>> +     .vidioc_querycap                = tegra_channel_querycap,
>> +     .vidioc_enum_fmt_vid_cap        = tegra_channel_enum_format,
>> +     .vidioc_g_fmt_vid_cap           = tegra_channel_get_format,
>> +     .vidioc_s_fmt_vid_cap           = tegra_channel_set_format,
>> +     .vidioc_try_fmt_vid_cap         = tegra_channel_try_format,
>> +     .vidioc_enum_input              = tegra_channel_enum_input,
>> +     .vidioc_g_input                 = tegra_channel_g_input,
>> +     .vidioc_s_input                 = tegra_channel_s_input,
>> +     .vidioc_reqbufs                 = vb2_ioctl_reqbufs,
>> +     .vidioc_prepare_buf             = vb2_ioctl_prepare_buf,
>> +     .vidioc_querybuf                = vb2_ioctl_querybuf,
>> +     .vidioc_qbuf                    = vb2_ioctl_qbuf,
>> +     .vidioc_dqbuf                   = vb2_ioctl_dqbuf,
>> +     .vidioc_create_bufs             = vb2_ioctl_create_bufs,
>> +     .vidioc_expbuf                  = vb2_ioctl_expbuf,
>> +     .vidioc_streamon                = vb2_ioctl_streamon,
>> +     .vidioc_streamoff               = vb2_ioctl_streamoff,
>> +     .vidioc_subscribe_event         = v4l2_ctrl_subscribe_event,
>> +     .vidioc_unsubscribe_event       = v4l2_event_unsubscribe,
>> +};
>> +
>> +/*
>> + * V4L2 file operations
>> + */
>> +static const struct v4l2_file_operations tegra_channel_fops = {
>> +     .owner          = THIS_MODULE,
>> +     .unlocked_ioctl = video_ioctl2,
>> +     .open           = v4l2_fh_open,
>> +     .release        = vb2_fop_release,
>> +     .read           = vb2_fop_read,
>> +     .poll           = vb2_fop_poll,
>> +     .mmap           = vb2_fop_mmap,
>> +};
>> +
>> +int tegra_channel_setup_ctrl_handler(struct tegra_channel *chan)
>> +{
>> +     int ret;
>> +
>> +     /* Add test pattern control handler to v4l2 device */
>> +     v4l2_ctrl_new_std_menu_items(&chan->ctrl_handler, &vi_ctrl_ops,
>> +                                  V4L2_CID_TEST_PATTERN,
>> +                                  ARRAY_SIZE(vi_pattern_strings) - 1,
>> +                                  0, 0, vi_pattern_strings);
>> +     if (chan->ctrl_handler.error) {
>> +             dev_err(chan->vi->dev, "failed to add TPG ctrl handler\n");
>> +             v4l2_ctrl_handler_free(&chan->ctrl_handler);
>> +             return chan->ctrl_handler.error;
>> +     }
>> +
>> +     /* setup the controls */
>> +     ret = v4l2_ctrl_handler_setup(&chan->ctrl_handler);
>> +     if (ret < 0) {
>> +             dev_err(chan->vi->dev, "failed to setup v4l2 ctrl handler\n");
>> +             goto free_hdl;
>> +     }
>> +
>> +     return 0;
>> +
>> +free_hdl:
>> +     v4l2_ctrl_handler_free(&chan->ctrl_handler);
>> +     return ret;
>> +}
>> +
>> +int tegra_channel_init(struct tegra_channel *chan)
>> +{
>> +     struct tegra_vi *vi = chan->vi;
>> +     struct tegra_camera *cam = dev_get_drvdata(vi->client.host);
>> +     int ret;
>> +
>> +     mutex_init(&chan->video_lock);
>> +     INIT_LIST_HEAD(&chan->capture);
>> +     INIT_LIST_HEAD(&chan->done);
>> +     spin_lock_init(&chan->start_lock);
>> +     spin_lock_init(&chan->done_lock);
>> +     init_waitqueue_head(&chan->start_wait);
>> +     init_waitqueue_head(&chan->done_wait);
>> +
>> +     /* Default alignments */
>> +     chan->width_align = TEGRA_WIDTH_ALIGNMENT;
>> +     chan->stride_align = TEGRA_STRIDE_ALIGNMENT;
>> +     chan->height_align = TEGRA_HEIGHT_ALIGNMENT;
>> +     chan->size_align = TEGRA_SIZE_ALIGNMENT;
>> +
>> +     /* initialize the video format */
>> +     chan->fmtinfo = tegra_core_get_default_format();
>> +     chan->format.colorspace = V4L2_COLORSPACE_SRGB;
>> +     chan->format.field = V4L2_FIELD_NONE;
>> +     tegra_channel_update_format(chan, TEGRA_DEF_WIDTH, TEGRA_DEF_HEIGHT,
>> +                                 chan->fmtinfo->fourcc,
>> +                                 &chan->fmtinfo->bpp, 0);
>> +
>> +     /* initialize the media entity */
>> +     chan->pad.flags = MEDIA_PAD_FL_SINK;
>> +     ret = media_entity_pads_init(&chan->video.entity, 1, &chan->pad);
>> +     if (ret < 0)
>> +             return ret;
>> +
>> +     ret = v4l2_ctrl_handler_init(&chan->ctrl_handler, MAX_CID_CONTROLS);
>> +     if (chan->ctrl_handler.error) {
>> +             dev_err(vi->dev,
>> +                     "V4L2 controls handler init failed: %d\n", ret);
>> +             goto ctrl_init_error;
>> +     }
>> +
>> +     /* initialize the video_device */
>> +     chan->video.fops = &tegra_channel_fops;
>> +     chan->video.v4l2_dev = &cam->v4l2_dev;
>> +     chan->video.queue = &chan->queue;
>> +     snprintf(chan->video.name, sizeof(chan->video.name), "%s-%s-%u",
>> +              dev_name(vi->dev), "output", chan->port);
>> +     chan->video.vfl_type = VFL_TYPE_GRABBER;
>> +     chan->video.vfl_dir = VFL_DIR_RX;
>> +     chan->video.release = video_device_release_empty;
>> +     chan->video.ioctl_ops = &tegra_channel_ioctl_ops;
>> +     chan->video.ctrl_handler = &chan->ctrl_handler;
>> +     chan->video.lock = &chan->video_lock;
>> +     chan->video.device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING |
>> +                               V4L2_CAP_READWRITE;
>> +
>> +     video_set_drvdata(&chan->video, chan);
>> +     chan->sp = host1x_syncpt_request(&vi->client, HOST1X_SYNCPT_HAS_BASE);
>> +     if (!chan->sp) {
>> +             dev_err(vi->dev, "failed to request syncpoint\n");
>> +             ret = -ENOMEM;
>> +             goto host1x_sp_error;
>> +     }
>> +
>> +     chan->queue.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
>> +     chan->queue.io_modes = VB2_MMAP | VB2_DMABUF | VB2_READ;
>> +     chan->queue.lock = &chan->video_lock;
>> +     chan->queue.drv_priv = chan;
>> +     chan->queue.buf_struct_size = sizeof(struct tegra_channel_buffer);
>> +     chan->queue.ops = &tegra_channel_queue_qops;
>> +     chan->queue.mem_ops = &vb2_dma_contig_memops;
>> +     chan->queue.timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC
>> +                                | V4L2_BUF_FLAG_TSTAMP_SRC_EOF;
> Just drop V4L2_BUF_FLAG_TSTAMP_SRC_EOF, it's 0 anyway. It's not common practice
> to set this.
>
>> +     chan->queue.dev = vi->dev;
>> +     ret = vb2_queue_init(&chan->queue);
>> +     if (ret < 0) {
>> +             dev_err(vi->dev,
>> +                     "failed to initialize VB2 queue, err: %d\n", ret);
>> +             goto vb2_init_error;
>> +     }
>> +
>> +     ret = video_register_device(&chan->video, VFL_TYPE_GRABBER, -1);
>> +     if (ret < 0) {
>> +             dev_err(&chan->video.dev,
>> +                     "failed to register video device, err: %d\n", ret);
>> +             goto video_register_error;
>> +     }
>> +
>> +     return 0;
>> +
>> +video_register_error:
>> +     vb2_queue_release(&chan->queue);
>> +vb2_init_error:
>> +     host1x_syncpt_free(chan->sp);
>> +host1x_sp_error:
>> +     v4l2_ctrl_handler_free(&chan->ctrl_handler);
>> +ctrl_init_error:
>> +     media_entity_cleanup(&chan->video.entity);
>> +     return ret;
>> +}
>> +
>> +int tegra_channel_cleanup(struct tegra_channel *chan)
>> +{
>> +     if (video_is_registered(&chan->video)) {
>> +             video_unregister_device(&chan->video);
>> +             vb2_queue_release(&chan->queue);
>> +             media_entity_cleanup(&chan->video.entity);
>> +     }
>> +
>> +     host1x_syncpt_free(chan->sp);
>> +     v4l2_ctrl_handler_free(&chan->ctrl_handler);
>> +
>> +     return 0;
>> +}
>> diff --git a/drivers/staging/media/tegra/tegra-core.c b/drivers/staging/media/tegra/tegra-core.c
>> new file mode 100644
>> index 000000000000..80ede3ad7266
>> --- /dev/null
>> +++ b/drivers/staging/media/tegra/tegra-core.c
>> @@ -0,0 +1,111 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (C) 2020 NVIDIA CORPORATION.  All rights reserved.
>> + */
>> +
>> +#include <linux/export.h>
>> +#include <linux/kernel.h>
>> +#include <linux/of.h>
>> +#include <linux/platform_device.h>
>> +
>> +#include "mc_common.h"
>> +#include "tegra-core.h"
>> +
>> +static const struct tegra_video_format tegra_default_format = {
>> +     /* RAW 10 */
>> +     TEGRA_VF_RAW10,
>> +     10,
>> +     MEDIA_BUS_FMT_SRGGB10_1X10,
>> +     {2, 1},
>> +     TEGRA_IMAGE_FORMAT_DEF,
>> +     TEGRA_IMAGE_DT_RAW10,
>> +     V4L2_PIX_FMT_SRGGB10,
>> +     "RGRG.. GBGB..",
> Is this string used anywhere? The v4l2 core automatically sets the pixelformat
> description for you in VIDIOC_ENUMFMT these days.
>
>> +};
>> +
>> +/*
>> + * Helper functions
>> + */
>> +
>> +/**
>> + * tegra_core_get_default_format - Get default format
>> + *
>> + * Return: pointer to the format where the default format needs
>> + * to be filled in.
>> + */
>> +const struct tegra_video_format *tegra_core_get_default_format(void)
>> +{
>> +     return &tegra_default_format;
>> +}
>> +
>> +/**
>> + * tegra_core_get_fourcc_by_idx - get fourcc of a tegra_video format
>> + * @index: array index of the tegra_video_formats
>> + *
>> + * Return: fourcc code
>> + */
>> +u32 tegra_core_get_fourcc_by_idx(struct tegra_channel *chan,
>> +                              unsigned int index)
>> +{
>> +     if (index >= chan->nformats)
>> +             return -EINVAL;
>> +
>> +     return chan->video_formats[index].fourcc;
>> +}
>> +
>> +/**
>> + * tegra_core_get_word_count - Calculate word count
>> + * @frame_width: number of pixels per line
>> + * @fmt: Tegra Video format struct which has BPP information
>> + *
>> + * Return: word count number
>> + */
>> +u32 tegra_core_get_word_count(unsigned int frame_width,
>> +                           const struct tegra_video_format *fmt)
>> +{
>> +     return frame_width * fmt->width / 8;
>> +}
>> +
>> +/**
>> + * tegra_core_get_idx_by_code - Retrieve index for a media bus code
>> + * @chan: tegra_channel
>> + * @code: the format media bus code
>> + * @offset: offset in video formats from where to start the search
>> + *
>> + * Return: a index to the format information structure corresponding to the
>> + * given V4L2 media bus format @code, or -1 if no corresponding format can
>> + * be found.
>> + */
>> +int tegra_core_get_idx_by_code(struct tegra_channel *chan, unsigned int code,
>> +                            unsigned int offset)
>> +{
>> +     unsigned int i;
>> +
>> +     for (i = offset; i < chan->nformats; ++i) {
>> +             if (chan->video_formats[i].code == code)
>> +                     return i;
>> +     }
>> +
>> +     return -1;
>> +}
>> +
>> +/**
>> + * tegra_core_get_format_by_fourcc - Retrieve format information for a 4CC
>> + * @fourcc: the format 4CC
>> + *
>> + * Return: a pointer to the format information structure corresponding to the
>> + * given V4L2 format @fourcc, or NULL if no corresponding format can be
>> + * found.
>> + */
>> +const struct tegra_video_format *
>> +tegra_core_get_format_by_fourcc(struct tegra_channel *chan, u32 fourcc)
>> +{
>> +     unsigned int i;
>> +
>> +     for (i = 0; i < chan->nformats; ++i) {
>> +             if (chan->video_formats[i].fourcc == fourcc)
>> +                     return &chan->video_formats[i];
>> +     }
>> +
>> +     return NULL;
>> +}
>> diff --git a/drivers/staging/media/tegra/tegra-core.h b/drivers/staging/media/tegra/tegra-core.h
>> new file mode 100644
>> index 000000000000..193065d20a95
>> --- /dev/null
>> +++ b/drivers/staging/media/tegra/tegra-core.h
>> @@ -0,0 +1,125 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (C) 2020 NVIDIA CORPORATION.  All rights reserved.
>> + */
>> +
>> +#ifndef __TEGRA_CORE_H__
>> +#define __TEGRA_CORE_H__
>> +
>> +#include <media/v4l2-subdev.h>
>> +
>> +/* Minimum and maximum width and height common to Tegra video input device. */
>> +#define TEGRA_MIN_WIDTH              32U
>> +#define TEGRA_MAX_WIDTH              32768U
>> +#define TEGRA_MIN_HEIGHT     32U
>> +#define TEGRA_MAX_HEIGHT     32768U
>> +
>> +/* Width alignment */
>> +#define TEGRA_WIDTH_ALIGNMENT        1
>> +/* Stride alignment */
>> +#define TEGRA_STRIDE_ALIGNMENT       1
>> +/* Height alignment */
>> +#define TEGRA_HEIGHT_ALIGNMENT       1
>> +/* Size alignment */
>> +#define TEGRA_SIZE_ALIGNMENT 1
>> +
>> +/* 1080p resolution as default resolution for test pattern generator */
>> +#define TEGRA_DEF_WIDTH              1920
>> +#define TEGRA_DEF_HEIGHT     1080
>> +
>> +#define TEGRA_VF_DEF         MEDIA_BUS_FMT_SRGGB10_1X10
>> +#define TEGRA_IMAGE_FORMAT_DEF       32
>> +
>> +/*
>> + * These go into the TEGRA_VI_CSI_n_CSI_IMAGE_DT registers bits 7:0
>> + * Input data type of VI channel.
>> + */
>> +enum tegra_image_dt {
>> +     TEGRA_IMAGE_DT_YUV420_8 = 24,
>> +     TEGRA_IMAGE_DT_YUV420_10,
>> +
>> +     TEGRA_IMAGE_DT_YUV420CSPS_8 = 28,
>> +     TEGRA_IMAGE_DT_YUV420CSPS_10,
>> +     TEGRA_IMAGE_DT_YUV422_8,
>> +     TEGRA_IMAGE_DT_YUV422_10,
>> +     TEGRA_IMAGE_DT_RGB444,
>> +     TEGRA_IMAGE_DT_RGB555,
>> +     TEGRA_IMAGE_DT_RGB565,
>> +     TEGRA_IMAGE_DT_RGB666,
>> +     TEGRA_IMAGE_DT_RGB888,
>> +
>> +     TEGRA_IMAGE_DT_RAW6 = 40,
>> +     TEGRA_IMAGE_DT_RAW7,
>> +     TEGRA_IMAGE_DT_RAW8,
>> +     TEGRA_IMAGE_DT_RAW10,
>> +     TEGRA_IMAGE_DT_RAW12,
>> +     TEGRA_IMAGE_DT_RAW14,
>> +};
>> +
>> +/* Supported CSI to VI Data Formats */
>> +enum tegra_vf_code {
>> +     TEGRA_VF_RAW6 = 0,
>> +     TEGRA_VF_RAW7,
>> +     TEGRA_VF_RAW8,
>> +     TEGRA_VF_RAW10,
>> +     TEGRA_VF_RAW12,
>> +     TEGRA_VF_RAW14,
>> +     TEGRA_VF_EMBEDDED8,
>> +     TEGRA_VF_RGB565,
>> +     TEGRA_VF_RGB555,
>> +     TEGRA_VF_RGB888,
>> +     TEGRA_VF_RGB444,
>> +     TEGRA_VF_RGB666,
>> +     TEGRA_VF_YUV422,
>> +     TEGRA_VF_YUV420,
>> +     TEGRA_VF_YUV420_CSPS,
>> +};
>> +
>> +/**
>> + * struct tegra_frac
>> + * @numerator: numerator of the fraction
>> + * @denominator: denominator of the fraction
>> + */
>> +struct tegra_frac {
>> +     unsigned int numerator;
>> +     unsigned int denominator;
>> +};
>> +
>> +/**
>> + * struct tegra_video_format - Tegra video format description
>> + * @vf_code: video format code
>> + * @width: format width in bits per component
>> + * @code: media bus format code
>> + * @bpp: bytes per pixel (when stored in memory)
>> + * @img_fmt: image format
>> + * @img_dt: image data type
>> + * @fourcc: V4L2 pixel format FCC identifier
>> + * @description: format description, suitable for userspace
> As mentioned above: this is almost certainly no longer needed.
>
>> + */
>> +struct tegra_video_format {
>> +     enum tegra_vf_code vf_code;
>> +     unsigned int width;
>> +     unsigned int code;
>> +     struct tegra_frac bpp;
>> +     u32 img_fmt;
>> +     enum tegra_image_dt img_dt;
>> +     u32 fourcc;
>> +     __u8 description[32];
>> +};
>> +
>> +#define      TEGRA_VIDEO_FORMAT(VF_CODE, BPP, MBUS_CODE, FRAC_BPP_NUM,       \
>> +     FRAC_BPP_DEN, FORMAT, DATA_TYPE, FOURCC, DESCRIPTION)           \
>> +{                                                                    \
>> +     TEGRA_VF_##VF_CODE,                                             \
>> +     BPP,                                                            \
>> +     MEDIA_BUS_FMT_##MBUS_CODE,                                      \
>> +     {FRAC_BPP_NUM, FRAC_BPP_DEN},                                   \
>> +     TEGRA_IMAGE_FORMAT_##FORMAT,                                    \
>> +     TEGRA_IMAGE_DT_##DATA_TYPE,                                     \
>> +     V4L2_PIX_FMT_##FOURCC,                                          \
>> +     DESCRIPTION,                                                    \
>> +}
>> +
>> +u32 tegra_core_get_word_count(unsigned int frame_width,
>> +                           const struct tegra_video_format *fmt);
>> +#endif
>> diff --git a/drivers/staging/media/tegra/tegra-csi.c b/drivers/staging/media/tegra/tegra-csi.c
>> new file mode 100644
>> index 000000000000..f6153acd60cb
>> --- /dev/null
>> +++ b/drivers/staging/media/tegra/tegra-csi.c
>> @@ -0,0 +1,380 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (C) 2020 NVIDIA CORPORATION.  All rights reserved.
>> + */
>> +
>> +#include <linux/clk.h>
>> +#include <linux/clk/tegra.h>
>> +#include <linux/device.h>
>> +#include <linux/gpio/consumer.h>
>> +#include <linux/host1x.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/of_graph.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/of_platform.h>
>> +
>> +#include "csi.h"
>> +#include "mc_common.h"
>> +#include "csi2_fops.h"
>> +#include "host1x-video.h"
>> +#include "vi2_registers.h"
>> +
>> +static inline struct tegra_csi_device *
>> +host1x_client_to_csi(struct host1x_client *client)
>> +{
>> +     return container_of(client, struct tegra_csi_device, client);
>> +}
>> +
>> +static inline struct tegra_csi_channel *to_csi_chan(struct v4l2_subdev *subdev)
>> +{
>> +     return container_of(subdev, struct tegra_csi_channel, subdev);
>> +}
>> +
>> +/*
>> + * V4L2 Subdevice Video Operations
>> + */
>> +static int tegra_csi_s_stream(struct v4l2_subdev *subdev, int enable)
>> +{
>> +     struct tegra_csi_channel *csi_chan = to_csi_chan(subdev);
>> +     struct tegra_csi_device *csi = csi_chan->csi;
>> +     struct tegra_channel *chan = subdev->host_priv;
>> +     u8 pg_mode = chan->vi->pg_mode;
>> +
>> +     return csi->fops->csi_start_streaming(csi_chan, pg_mode, enable);
>> +}
>> +
>> +/*
>> + * Only use this subdevice media bus ops for test pattern generator,
>> + * because CSI device is an separated subdevice which has 6 source
>> + * pads to generate test pattern.
>> + */
>> +static struct v4l2_mbus_framefmt tegra_csi_tpg_fmts[] = {
>> +     {
>> +             TEGRA_DEF_WIDTH,
>> +             TEGRA_DEF_HEIGHT,
>> +             MEDIA_BUS_FMT_SRGGB10_1X10,
>> +             V4L2_FIELD_NONE,
>> +             V4L2_COLORSPACE_SRGB
>> +     },
>> +     {
>> +             TEGRA_DEF_WIDTH,
>> +             TEGRA_DEF_HEIGHT,
>> +             MEDIA_BUS_FMT_RGB888_1X32_PADHI,
>> +             V4L2_FIELD_NONE,
>> +             V4L2_COLORSPACE_SRGB
>> +     }
>> +
>> +};
>> +
>> +static struct v4l2_frmsize_discrete tegra_csi_tpg_sizes[] = {
>> +     {1280, 720},
>> +     {1920, 1080},
>> +     {3840, 2160},
>> +};
>> +
>> +/*
>> + * V4L2 Subdevice Pad Operations
>> + */
>> +static int tegra_csi_get_format(struct v4l2_subdev *subdev,
>> +                             struct v4l2_subdev_pad_config *cfg,
>> +                             struct v4l2_subdev_format *fmt)
>> +{
>> +     struct tegra_csi_channel *csi_chan = to_csi_chan(subdev);
>> +
>> +     mutex_lock(&csi_chan->format_lock);
>> +     memcpy(fmt, &csi_chan->ports->format,
>> +            sizeof(struct v4l2_mbus_framefmt));
>> +     mutex_unlock(&csi_chan->format_lock);
>> +
>> +     return 0;
>> +}
>> +
>> +static void tegra_csi_try_mbus_fmt(struct v4l2_subdev *subdev,
>> +                                struct v4l2_mbus_framefmt *mfmt)
>> +{
>> +     struct tegra_csi_channel *csi_chan = to_csi_chan(subdev);
>> +     struct tegra_csi_device *csi = csi_chan->csi;
>> +     const struct v4l2_frmsize_discrete *sizes;
>> +     int i, j;
>> +
>> +     for (i = 0; i < ARRAY_SIZE(tegra_csi_tpg_fmts); i++) {
>> +             struct v4l2_mbus_framefmt *mbus_fmt = &tegra_csi_tpg_fmts[i];
>> +
>> +             if (mfmt->code == mbus_fmt->code) {
>> +                     for (j = 0; j < ARRAY_SIZE(tegra_csi_tpg_sizes); j++) {
>> +                             sizes = &tegra_csi_tpg_sizes[j];
>> +                             if (mfmt->width == sizes->width &&
>> +                                 mfmt->height == sizes->height) {
>> +                                     return;
>> +                             }
>> +                     }
>> +             }
>> +
>> +             dev_info(csi->dev, "using Tegra default RAW10 video format\n");
>> +     }
>> +
>> +     dev_info(csi->dev, "using Tegra default WIDTH X HEIGHT (1920x1080)\n");
>> +     memcpy(mfmt, tegra_csi_tpg_fmts, sizeof(struct v4l2_mbus_framefmt));
>> +}
>> +
>> +static int tegra_csi_set_format(struct v4l2_subdev *subdev,
>> +                             struct v4l2_subdev_pad_config *cfg,
>> +                             struct v4l2_subdev_format *fmt)
>> +{
>> +     struct tegra_csi_channel *csi_chan = to_csi_chan(subdev);
>> +     struct v4l2_mbus_framefmt *format = &fmt->format;
>> +
>> +     tegra_csi_try_mbus_fmt(subdev, format);
>> +
>> +     if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
>> +             return 0;
>> +
>> +     mutex_lock(&csi_chan->format_lock);
>> +     memcpy(&csi_chan->ports->format, format,
>> +            sizeof(struct v4l2_mbus_framefmt));
> Just do: csi_chan->ports->format = *format;
>
>> +     mutex_unlock(&csi_chan->format_lock);
>> +
>> +     return 0;
>> +}
>> +
>> +/*
>> + * V4L2 Subdevice Operations
>> + */
>> +static struct v4l2_subdev_video_ops tegra_csi_video_ops = {
>> +     .s_stream = tegra_csi_s_stream,
>> +};
>> +
>> +static struct v4l2_subdev_pad_ops tegra_csi_pad_ops = {
>> +     .get_fmt                = tegra_csi_get_format,
>> +     .set_fmt                = tegra_csi_set_format,
>> +};
>> +
>> +static struct v4l2_subdev_ops tegra_csi_ops = {
>> +     .video  = &tegra_csi_video_ops,
>> +     .pad    = &tegra_csi_pad_ops,
>> +};
>> +
>> +/*
>> + * Media Operations
>> + */
>> +static const struct media_entity_operations tegra_csi_media_ops = {
>> +     .link_validate = v4l2_subdev_link_validate,
>> +};
>> +
>> +static int tegra_csi_tpg_channels_alloc(struct tegra_csi_device *csi)
>> +{
>> +     struct device_node *node = csi->dev->of_node;
>> +     unsigned int port_num;
>> +     int ret;
>> +     struct tegra_csi_channel *item;
>> +     unsigned int tpg_channels = csi->soc_data->num_tpg_channels;
>> +
>> +     /* allocate CSI channel for each CSI x2 ports */
>> +     for (port_num = 0; port_num < tpg_channels; port_num++) {
>> +             item = devm_kzalloc(csi->dev, sizeof(*item), GFP_KERNEL);
>> +             if (!item) {
>> +                     ret = -ENOMEM;
>> +                     goto error;
>> +             }
>> +
>> +             list_add_tail(&item->list, &csi->csi_chans);
>> +             item->csi = csi;
>> +             item->csi_port_num = port_num;
>> +             item->numlanes = 2;
>> +             item->of_node = node;
>> +             item->numpads = 1;
>> +             item->pads[0].flags = MEDIA_PAD_FL_SOURCE;
>> +     }
>> +
>> +     return 0;
>> +
>> +error:
>> +     list_for_each_entry(item, &csi->csi_chans, list)
>> +             list_del(&item->list);
>> +
>> +     return ret;
>> +}
>> +
>> +static int tegra_csi_channel_init(struct tegra_csi_channel *chan)
>> +{
>> +     struct tegra_csi_device *csi = chan->csi;
>> +     struct v4l2_subdev *subdev;
>> +     int ret;
>> +
>> +     chan->ports = devm_kzalloc(csi->dev, sizeof(struct tegra_csi_port),
>> +                                GFP_KERNEL);
>> +     if (!chan->ports)
>> +             return -ENOMEM;
>> +
>> +     mutex_init(&chan->format_lock);
>> +
>> +     /* initialize the default format */
>> +     chan->ports->format.code = TEGRA_VF_DEF;
>> +     chan->ports->format.field = V4L2_FIELD_NONE;
>> +     chan->ports->format.colorspace = V4L2_COLORSPACE_SRGB;
>> +     chan->ports->format.width = TEGRA_DEF_WIDTH;
>> +     chan->ports->format.height = TEGRA_DEF_HEIGHT;
>> +     chan->ports->lanes = chan->numlanes;
>> +
>> +     /* initialize V4L2 subdevice and media entity */
>> +     subdev = &chan->subdev;
>> +     v4l2_subdev_init(subdev, &tegra_csi_ops);
>> +     subdev->dev = csi->dev;
>> +     snprintf(subdev->name, V4L2_SUBDEV_NAME_SIZE, "%s-%d", "tpg",
>> +              chan->csi_port_num);
>> +
>> +     v4l2_set_subdevdata(subdev, chan);
>> +     subdev->fwnode = of_fwnode_handle(chan->of_node);
>> +     subdev->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
>> +     subdev->entity.ops = &tegra_csi_media_ops;
>> +
>> +     /* initialize media entity pads */
>> +     ret = media_entity_pads_init(&subdev->entity, chan->numpads,
>> +                                  chan->pads);
>> +     if (ret < 0)
>> +             return ret;
>> +
>> +     ret = v4l2_async_register_subdev(subdev);
>> +     if (ret < 0) {
>> +             dev_err(csi->dev, "failed to register subdev\n");
>> +             media_entity_cleanup(&subdev->entity);
>> +     }
>> +
>> +     return ret;
>> +}
>> +
>> +void tegra_csi_error_status(struct v4l2_subdev *subdev)
>> +{
>> +     struct tegra_csi_channel *csi_chan = to_csi_chan(subdev);
>> +     struct tegra_csi_device *csi = csi_chan->csi;
>> +
>> +     csi->fops->csi_err_status(csi_chan);
>> +}
>> +EXPORT_SYMBOL(tegra_csi_error_status);
>> +
>> +static int tegra_csi_init(struct host1x_client *client)
>> +{
>> +     struct tegra_csi_device *csi = host1x_client_to_csi(client);
>> +     struct tegra_camera *cam = dev_get_drvdata(client->host);
>> +     struct tegra_csi_channel *item;
>> +     int ret;
>> +
>> +     cam->csi = csi;
>> +
>> +     INIT_LIST_HEAD(&csi->csi_chans);
>> +
>> +     ret = tegra_csi_tpg_channels_alloc(csi);
>> +     if (ret < 0)
>> +             return ret;
>> +
>> +     list_for_each_entry(item, &csi->csi_chans, list) {
>> +             ret = tegra_csi_channel_init(item);
>> +             if (ret)
>> +                     return ret;
>> +     }
>> +
>> +     ret = csi->fops->hw_init(csi);
>> +     if (ret)
>> +             return ret;
>> +
>> +     return 0;
>> +}
>> +
>> +static int tegra_csi_exit(struct host1x_client *client)
>> +{
>> +     struct tegra_camera *cam = dev_get_drvdata(client->host);
>> +     struct v4l2_subdev *subdev;
>> +     struct tegra_csi_channel *chan;
>> +
>> +     if (!cam->csi)
>> +             return 0;
>> +
>> +     list_for_each_entry(chan, &cam->csi->csi_chans, list) {
>> +             mutex_destroy(&chan->format_lock);
>> +             subdev = &chan->subdev;
>> +             media_entity_cleanup(&subdev->entity);
>> +             v4l2_async_unregister_subdev(subdev);
>> +     }
>> +
>> +     return 0;
>> +}
>> +
>> +static const struct host1x_client_ops csi_client_ops = {
>> +     .init = tegra_csi_init,
>> +     .exit = tegra_csi_exit,
>> +};
>> +
>> +static int tegra_csi_probe(struct platform_device *pdev)
>> +{
>> +     struct tegra_csi_device *csi;
>> +     struct resource *res;
>> +     int ret;
>> +
>> +     csi = devm_kzalloc(&pdev->dev, sizeof(*csi), GFP_KERNEL);
>> +     if (!csi)
>> +             return -ENOMEM;
>> +
>> +     res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +     csi->iomem = devm_ioremap_resource(&pdev->dev, res);
>> +     if (IS_ERR(csi->iomem))
>> +             return PTR_ERR(csi->iomem);
>> +
>> +     csi->soc_data = of_device_get_match_data(&pdev->dev);
>> +     if (!csi->soc_data) {
>> +             dev_info(&pdev->dev, "No platform data\n\n");
>> +             return -ENODATA;
>> +     }
>> +
>> +     csi->dev = &pdev->dev;
>> +     csi->fops = csi->soc_data->csi_fops;
>> +     platform_set_drvdata(pdev, csi);
>> +
>> +     /* initialize host1x interface */
>> +     INIT_LIST_HEAD(&csi->client.list);
>> +     csi->client.ops = &csi_client_ops;
>> +     csi->client.dev = &pdev->dev;
>> +
>> +     ret = host1x_client_register(&csi->client);
>> +     if (ret < 0) {
>> +             dev_err(csi->dev, "failed to register host1x client: %d\n",
>> +                     ret);
>> +             return -ENODEV;
>> +     }
>> +
>> +     return 0;
>> +}
>> +
>> +static int tegra_csi_remove(struct platform_device *pdev)
>> +{
>> +     struct tegra_csi_device *csi = platform_get_drvdata(pdev);
>> +
>> +     host1x_client_unregister(&csi->client);
>> +
>> +     return 0;
>> +}
>> +
>> +static struct tegra_csi_soc_data tegra210_csi_data = {
>> +     .csi_fops = &csi2_fops,
>> +     .cil_max_clk_hz = TEGRA210_CSI_CIL_CLK_MAX,
>> +     .num_tpg_channels = TEGRA210_MAX_CHANNELS,
>> +};
>> +
>> +static const struct of_device_id tegra_csi_of_id_table[] = {
>> +     { .compatible = "nvidia,tegra210-csi", .data = &tegra210_csi_data },
>> +     { }
>> +};
>> +MODULE_DEVICE_TABLE(of, tegra_csi_of_id_table);
>> +
>> +struct platform_driver tegra_csi_driver = {
>> +     .driver = {
>> +             .name           = "tegra-csi",
>> +             .of_match_table = tegra_csi_of_id_table,
>> +     },
>> +     .probe                  = tegra_csi_probe,
>> +     .remove                 = tegra_csi_remove,
>> +};
>> +
>> +MODULE_AUTHOR("Sowjanya Komatineni <skomatineni@nvidia.com>");
>> +MODULE_DESCRIPTION("NVIDIA Tegra CSI Device Driver");
>> +MODULE_LICENSE("GPL v2");
> <snip>
>
> This is just from a quick review. I see a number of areas that I want
> to discuss in more detail, I hope to get to that tomorrow or Friday at
> the latest. I'm currently trying to setup my Jetson TX1 board so I can
> test this series.
>
> Regards,
>
>          Hans
