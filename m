Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1919D2C0092
	for <lists+linux-media@lfdr.de>; Mon, 23 Nov 2020 08:23:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727889AbgKWHWC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Nov 2020 02:22:02 -0500
Received: from relay11.mail.gandi.net ([217.70.178.231]:42341 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726302AbgKWHWC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Nov 2020 02:22:02 -0500
Received: from bootlin.com (atoulouse-258-1-33-168.w90-55.abo.wanadoo.fr [90.55.104.168])
        (Authenticated sender: maxime.chevallier@bootlin.com)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 4592F100009;
        Mon, 23 Nov 2020 07:21:24 +0000 (UTC)
Date:   Mon, 23 Nov 2020 08:21:22 +0100
From:   Maxime Chevallier <maxime.chevallier@bootlin.com>
To:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Helen Koike <helen.koike@collabora.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media <linux-media@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v3 2/3] media: rockchip: Introduce driver for Rockhip's
 camera interface
Message-ID: <20201123082122.49a08ebb@bootlin.com>
In-Reply-To: <CAAEAJfCcPRnyjPozXG9rjovO+cJ6ZZBadShs_X9DQCrjSj7mUw@mail.gmail.com>
References: <20200922165535.1356622-1-maxime.chevallier@bootlin.com>
        <20200922165535.1356622-3-maxime.chevallier@bootlin.com>
        <CAAEAJfCcPRnyjPozXG9rjovO+cJ6ZZBadShs_X9DQCrjSj7mUw@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ezequiel, and thanks a lot for the review !

On Fri, 2 Oct 2020 14:35:28 -0300
Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> wrote:

> Hi Maxime,
>
>Thanks to Dafna, I found the patch ^_^
>
>The driver looks real good. Just a few comments below.
>
>Is the driver passing latest v4l2-compliance tests?

I'll post them along with the next iteration of the series.

>> +config VIDEO_ROCKCHIP_VIP
>> +       tristate "Rockchip VIP (Video InPut) Camera Interface"
>> +       depends on VIDEO_DEV && VIDEO_V4L2
>> +       depends on ARCH_ROCKCHIP || COMPILE_TEST
>> +       select VIDEOBUF2_DMA_SG
>> +       select VIDEOBUF2_DMA_CONTIG
>> +       select V4L2_FWNODE
>> +       select V4L2_MEM2MEM_DEV
>> +       help
>> +         This is a v4l2 driver for Rockchip SOC Camera interface.
>> +
>> +         To compile this driver as a module choose m here.
>> +  
>
>Please add ... "the module will be called {the name}".

Sure, I will do !

[...]

>> +#define VIP_REQ_BUFS_MIN       1  
>
>I think you might want to have more than 1 buffer
>as minimum. How about 3? Two for the ping and pong,
>and one more in the queue.

Yes you're correct, 3 should be the strict minimum required buffers
here, I didn't update that after adding the dual-buffering mode.

>> +#define VIP_MIN_WIDTH          64
>> +#define VIP_MIN_HEIGHT         64
>> +#define VIP_MAX_WIDTH          8192
>> +#define VIP_MAX_HEIGHT         8192
>> +
>> +#define RK_VIP_PLANE_Y                 0
>> +#define RK_VIP_PLANE_CBCR              1
>> +
>> +#define VIP_FETCH_Y_LAST_LINE(VAL) ((VAL) & 0x1fff)
>> +/* Check if swap y and c in bt1120 mode */
>> +#define VIP_FETCH_IS_Y_FIRST(VAL) ((VAL) & 0xf)
>> +
>> +/* Get xsubs and ysubs for fourcc formats
>> + *
>> + * @xsubs: horizontal color samples in a 4*4 matrix, for yuv
>> + * @ysubs: vertical color samples in a 4*4 matrix, for yuv
>> + */
>> +static int fcc_xysubs(u32 fcc, u32 *xsubs, u32 *ysubs)  
>
>See below, you should be using v4l2_fill_pixfmt_mp.
>
>> +{
>> +       switch (fcc) {
>> +       case V4L2_PIX_FMT_NV16:
>> +       case V4L2_PIX_FMT_NV61:
>> +               *xsubs = 2;
>> +               *ysubs = 1;
>> +               break;
>> +       case V4L2_PIX_FMT_NV21:
>> +       case V4L2_PIX_FMT_NV12:
>> +               *xsubs = 2;
>> +               *ysubs = 2;
>> +               break;
>> +       default:
>> +               return -EINVAL;
>> +       }
>> +
>> +       return 0;
>> +}
>> +
>> +static const struct vip_output_fmt out_fmts[] = {
>> +       {
>> +               .fourcc = V4L2_PIX_FMT_NV16,
>> +               .cplanes = 2,  
>
>From what I can see, you are only using this
>information to calculate bytesperline and sizeimage,
>so you should be using the v4l2_fill_pixfmt_mp() helper.

You're correct, it indeed makes things much easier and allowed to
removed a lot of redundant info here !


>> +static void rk_vip_set_fmt(struct rk_vip_stream *stream,
>> +                          struct v4l2_pix_format_mplane *pixm,
>> +                          bool try)
>> +{
>> +       struct rk_vip_device *dev = stream->vipdev;
>> +       struct v4l2_subdev_format sd_fmt;
>> +       const struct vip_output_fmt *fmt;
>> +       struct v4l2_rect input_rect;
>> +       unsigned int planes, imagesize = 0;
>> +       u32 xsubs = 1, ysubs = 1;
>> +       int i;
>> +  
>
>I was expecting to see some is_busy or is_streaming check
>here, have you tested what happens if you change the format
>while streaming, or after buffers are queued?

Yes correct. I used the stream->state private flag here, but I it was
also brought to my attention that there also exists a vb2_is_busy()
helper, but I'm unsure if it would be correct to use it here.


>> +
>> +static int rk_vip_g_input(struct file *file, void *fh, unsigned int *i)
>> +{
>> +       *i = 0;
>> +       return 0;
>> +}
>> +
>> +static int rk_vip_s_input(struct file *file, void *fh, unsigned int i)
>> +{  
>
>Only one input, why do you need to support this ioctl at all?

I actually saw a fair amount of existing drivers implementing these
callbacks even for only one input, so I don't really know if I should
remove it or not ?

[...]

>> +
>> +static void rk_vip_vb_done(struct rk_vip_stream *stream,
>> +                          struct vb2_v4l2_buffer *vb_done)
>> +{
>> +       vb2_set_plane_payload(&vb_done->vb2_buf, 0,
>> +                             stream->pixm.plane_fmt[0].sizeimage);
>> +       vb_done->vb2_buf.timestamp = ktime_get_ns();  
>
>vb_done->vb2_buf.sequence = stream->frame_idx; ?

Good catch, thanks !

>> +       vb2_buffer_done(&vb_done->vb2_buf, VB2_BUF_STATE_DONE);
>> +}
>> +

[...]

>> diff --git a/drivers/media/platform/rockchip/vip/dev.c b/drivers/media/platform/rockchip/vip/dev.c
>> new file mode 100644
>> index 000000000000..d9b64f088c37
>> --- /dev/null
>> +++ b/drivers/media/platform/rockchip/vip/dev.c
>> @@ -0,0 +1,408 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Rockchip VIP Camera Interface Driver
>> + *
>> + * Copyright (C) 2018 Rockchip Electronics Co., Ltd.
>> + * Copyright (C) 2020 Maxime Chevallier <maxime.chevallier@bootlin.com>
>> + */
>> +
>> +#include <linux/clk.h>
>> +#include <linux/delay.h>
>> +#include <linux/interrupt.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/of_graph.h>
>> +#include <linux/of_platform.h>
>> +#include <linux/of_reserved_mem.h>
>> +#include <linux/reset.h>
>> +#include <linux/pm_runtime.h>
>> +#include <linux/pinctrl/consumer.h>
>> +#include <media/v4l2-fwnode.h>
>> +
>> +#include "dev.h"
>> +#include "regs.h"
>> +
>> +#define RK_VIP_VERNO_LEN               10
>> +

[...]

>> +static const char * const px30_vip_clks[] = {
>> +       "aclk_vip",
>> +       "hclk_vip",
>> +       "pclk_vip",
>> +       "vip_out",  
>
>These clock names don't seem to match with the devicetree.
>I wonder how have you been testing this, to be honest ^_^  ?
>
>Isn't probe failing with mismatching clock names?

Aw you're correct, the change was in my tree but wasn't commited, my
bad. Sorry about that.

>> +};
>> +
>> +static const char * const px30_vip_rsts[] = {
>> +       "rst_vip_a",
>> +       "rst_vip_h",
>> +       "rst_vip_pclkin",
>> +};
>> +
>> +static const struct vip_match_data px30_vip_match_data = {
>> +       .chip_id = CHIP_PX30_VIP,
>> +       .clks = px30_vip_clks,
>> +       .clks_num = ARRAY_SIZE(px30_vip_clks),
>> +       .rsts = px30_vip_rsts,
>> +       .rsts_num = ARRAY_SIZE(px30_vip_rsts),
>> +};
>> +
>> +static const struct of_device_id rk_vip_plat_of_match[] = {
>> +       {
>> +               .compatible = "rockchip,px30-vip",
>> +               .data = &px30_vip_match_data,
>> +       },
>> +       {},
>> +};
>> +
>> +static irqreturn_t rk_vip_irq_handler(int irq, void *ctx)
>> +{
>> +       struct device *dev = ctx;
>> +       struct rk_vip_device *vip_dev = dev_get_drvdata(dev);
>> +
>> +       rk_vip_irq_pingpong(vip_dev);
>> +  
>
>Why not just making rk_vip_irq_pingpong the interrupt handler?

You're also correct, this is a remaining piece of code from when both
single-buffer and double-buffer'd acquisition were coexisting.

>> +       return IRQ_HANDLED;
>> +}
>> +
>> +static void rk_vip_disable_sys_clk(struct rk_vip_device *vip_dev)
>> +{
>> +       int i;
>> +
>> +       for (i = vip_dev->clk_size - 1; i >= 0; i--)
>> +               clk_disable_unprepare(vip_dev->clks[i]);  
>
>Please use clk_bulk_disable_unprepare.
>> +}
>> +
>> +static int rk_vip_enable_sys_clk(struct rk_vip_device *vip_dev)
>> +{
>> +       int i, ret = -EINVAL;
>> +
>> +       for (i = 0; i < vip_dev->clk_size; i++) {
>> +               ret = clk_prepare_enable(vip_dev->clks[i]);
>> +  
>
>Please use clk_bulk_prepare_enable.

I'll switch to that, thanks

[...]

>> +       ret = of_reserved_mem_device_init(dev);
>> +       if (ret)
>> +               v4l2_warn(v4l2_dev, "No reserved memory region assign to VIP\n");
>> +  
>
>How about
>
>        ret = of_reserved_mem_device_init(dev);
>        if (ret && ret != -ENODEV)
>                return ret;
>
>instead?
>
>Also, it seems you are missing a of_reserved_mem_device_release
>on the error paths and plat_remove.

You're correct, I'll add that.

Thanks again for the thourough review !

Maxime

>Thanks,
>Ezequiel
