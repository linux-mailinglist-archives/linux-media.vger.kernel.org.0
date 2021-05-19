Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56A5F388ABA
	for <lists+linux-media@lfdr.de>; Wed, 19 May 2021 11:33:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345729AbhESJe6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 May 2021 05:34:58 -0400
Received: from comms.puri.sm ([159.203.221.185]:51574 "EHLO comms.puri.sm"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1345707AbhESJex (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 May 2021 05:34:53 -0400
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id 62812E0E31;
        Wed, 19 May 2021 02:33:30 -0700 (PDT)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id D5z-x0j9msCZ; Wed, 19 May 2021 02:33:27 -0700 (PDT)
Message-ID: <58f381131ba6c2b892971eb023d319723800205d.camel@puri.sm>
Subject: Re: [PATCH 00/23] media: imx: imx7-mipi-csis: Add i.MX8MM support /
 imx8mq support
From:   Martin Kepplinger <martin.kepplinger@puri.sm>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     devicetree@vger.kernel.org, festevam@gmail.com,
        kernel@pengutronix.de, linux-imx@nxp.com,
        linux-media@vger.kernel.org, marex@denx.de, p.zabel@pengutronix.de,
        rmfrfs@gmail.com, robh@kernel.org, slongerbeam@gmail.com
Date:   Wed, 19 May 2021 11:33:21 +0200
In-Reply-To: <YKRmhSn65fiqshsp@pendragon.ideasonboard.com>
References: <20210413023014.28797-1-laurent.pinchart@ideasonboard.com>
         <20210504155939.1194369-1-martin.kepplinger@puri.sm>
         <YKBRXesDsXk9K15J@pendragon.ideasonboard.com>
         <1da3de6c879474b814f4d820ca5eb5ba07174a26.camel@puri.sm>
         <YKRmhSn65fiqshsp@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am Mittwoch, dem 19.05.2021 um 04:14 +0300 schrieb Laurent Pinchart:
> Hi Martin,
> 
> On Tue, May 18, 2021 at 04:39:00PM +0200, Martin Kepplinger wrote:
> > Am Sonntag, dem 16.05.2021 um 01:55 +0300 schrieb Laurent Pinchart:
> > > On Tue, May 04, 2021 at 05:59:39PM +0200, Martin Kepplinger
> > > wrote:
> > > > hi Laurent, again thanks a lot for posting this series! I can't
> > > > fully test
> > > > it, but base my work for imx8mq on it now. imx8mq includes
> > > > yet another mipi phy version than this and below is some very
> > > > rough testing
> > > > code. it's not at all something I sign-off on but my following
> > > > problem is based on it.
> > > 
> > > Unless I'm mistaken, the CSI-2 receiver in the i.MX8MQ is a
> > > completely
> > > different device. I wouldn't try to support it in the imx7-mipi-
> > > csis
> > > driver, but in a separate driver.
> > > 
> > > >  * configured to use both staging csi drivers
> > > >  * the csi bridge driver at least streams frames together with
> > > > the
> > > > nxp "yav" mipi driver
> > > > 
> > > > media-ctl -p now says the output below, so one link from mipi
> > > > to
> > > > csi is missing.
> > > > 
> > > > Note that
> > > > 
> > > > media-ctl --set-v4l2 "'csi':0 [fmt:SBGGR10/640x480]"
> > > > works in that it changes the configured format below, but
> > > > 
> > > > media-ctl -l "'imx7-mipi-csis.0':1" -> "'csi':0[1]"
> > > > doesn't create said missing link.
> > > 
> > > media-ctl can't create links, it can only enable or disable them.
> > > Link
> > > creation is the prerogative of drivers.
> > > 
> > > > Do I maybe use that wrongly? If now, does anything come to mind
> > > > that would
> > > > be missing specifically?
> > > 
> > > The link should be created by the call to media_create_pad_link()
> > > in
> > > imx_media_capture_device_register(). You'll need to figure out if
> > > the
> > > function is called and returns an error early, or if it doesn't
> > > get
> > > called at all, and why.
> > > 
> > > > When trying to stream anyway (if that makes sense), I get the
> > > > following:
> > > > 
> > > > [ 2008.377470] capture_start_streaming: starting
> > > > [ 2008.381883] capture_find_format: calling
> > > > imx_media_find_mbus_format with code 0x2006
> > > > [ 2008.389671] imx7-csi 30a90000.csi1_bridge:
> > > > capture_validate_fmt: capture_find_format err
> > > > [ 2008.397794] imx7-csi 30a90000.csi1_bridge:
> > > > capture_validate_fmt: capture_find_format found colorspace 0x1
> > > > != 0x0
> > > > [ 2008.407999] imx7-csi 30a90000.csi1_bridge: capture format
> > > > not valid: -32
> > > > 
> > > > and if I ignore that (because I'm not yet sure whether that is
> > > > specific to
> > > > platforms including an IPU), I get a WARN_ON from
> > > > vb2_start_streaming()
> > > 
> > > That I have a fix for, I'll post it as part of an imx7-media-csi
> > > series.
> > 
> > Hi Laurent,
> > 
> > You haven't posted that fix you're talking about, right?
> 
> Correct. It's now fixed (see "[PATCH] media: imx: imx7-media-csi: Fix
> buffer return upon stream start failure", I've CC'ed you).
> 
> > The below
> > driver (attached; I'll send it as patches after I successfully
> > tested
> > myself, and cleanup and fixes obviously)
> 
> Don't forget the DT bindings at that point :-)

I won't forget it and try to avoid them after testing some
functionality.

> 
> > results in the same situation I described above:
> > 
> > * missing link from mipi (entity 10) -> csi (entity 1):
> 
> The link is supposed to be created by
> v4l2_create_fwnode_links_to_pad(),
> called from imx7_csi_notify_bound(). Could you trace the calls and
> figure out what goes wrong ?

will do.

> 
> > ------------------------------------------------------
> > 
> > Device topology
> > - entity 1: csi (2 pads, 1 link)
> >             type V4L2 subdev subtype Unknown flags 0
> >             device node name /dev/v4l-subdev0
> >         pad0: Sink
> >                 [fmt:UYVY8_2X8/640x480 field:none colorspace:srgb
> > xfer:srgb ycbcr:601 quantization:lim-range]
> >         pad1: Source
> >                 [fmt:UYVY8_2X8/640x480 field:none colorspace:srgb
> > xfer:srgb ycbcr:601 quantization:lim-range]
> >                 -> "csi capture":0 [ENABLED,IMMUTABLE]
> > 
> > - entity 4: csi capture (1 pad, 1 link)
> >             type Node subtype V4L flags 0
> >             device node name /dev/video0
> >         pad0: Sink
> >                 <- "csi":1 [ENABLED,IMMUTABLE]
> > 
> > - entity 10: imx8mq-mipi-csis.0 (2 pads, 1 link)
> >              type V4L2 subdev subtype Unknown flags 0
> >              device node name /dev/v4l-subdev1
> >         pad0: Sink
> >                 <- "hi846 2-0020":0 []
> >         pad1: Source
> > 
> > - entity 13: hi846 2-0020 (1 pad, 1 link)
> >              type V4L2 subdev subtype Sensor flags 0
> >              device node name /dev/v4l-subdev2
> >         pad0: Source
> >                 [fmt:SGBRG10_1X10/640x480 field:none
> > colorspace:raw]
> >                 -> "imx8mq-mipi-csis.0":0 []
> > 
> > 
> > * and the mentioned vb2 WARN_ON:
> > --------------------------------
> > 
> > [   56.120834] imx7-csi 30a90000.csi1_bridge: begin graph walk at
> > 'csi capture'
> > [   56.120859] imx7-csi 30a90000.csi1_bridge: walk: pushing 'csi'
> > on stack
> > [   56.120865] imx7-csi 30a90000.csi1_bridge: walk: skipping entity
> > 'csi capture' (already seen)
> > [   56.120871] imx7-csi 30a90000.csi1_bridge: walk: returning
> > entity 'csi'
> > [   56.120877] imx7-csi 30a90000.csi1_bridge: walk: returning
> > entity 'csi capture'
> > [   56.127415] vb2_common_vm_open: 000000006622b5ef, refcount: 1,
> > vma: ffffabe0b000-ffffabea1000
> > [   56.127438] vb2_dc_mmap: mapped dma addr 0xe8100000 at
> > 0xffffabe0b000, size 614400
> > [   56.127480] vb2_common_vm_open: 00000000e689fd4f, refcount: 1,
> > vma: ffffabd75000-ffffabe0b000
> > [   56.127488] vb2_dc_mmap: mapped dma addr 0xe8200000 at
> > 0xffffabd75000, size 614400
> > [   56.127501] vb2_common_vm_open: 00000000485fa30a, refcount: 1,
> > vma: ffffabcdf000-ffffabd75000
> > [   56.127509] vb2_dc_mmap: mapped dma addr 0xe8300000 at
> > 0xffffabcdf000, size 614400
> > [   56.127522] vb2_common_vm_open: 0000000092607c6a, refcount: 1,
> > vma: ffffabc49000-ffffabcdf000
> > [   56.127529] vb2_dc_mmap: mapped dma addr 0xe8400000 at
> > 0xffffabc49000, size 614400
> > [   56.127579] imx7-csi 30a90000.csi1_bridge: begin graph walk at
> > 'csi'
> > [   56.127587] imx7-csi 30a90000.csi1_bridge: walk: pushing 'csi
> > capture' on stack
> > [   56.127593] imx7-csi 30a90000.csi1_bridge: walk: skipping entity
> > 'csi' (already seen)
> > [   56.127599] imx7-csi 30a90000.csi1_bridge: walk: returning
> > entity 'csi capture'
> > [   56.127604] imx7-csi 30a90000.csi1_bridge: walk: returning
> > entity 'csi'
> > [   56.128102] imx7-csi 30a90000.csi1_bridge: begin graph walk at
> > 'csi'
> > [   56.128111] imx7-csi 30a90000.csi1_bridge: walk: pushing 'csi
> > capture' on stack
> > [   56.128117] imx7-csi 30a90000.csi1_bridge: walk: skipping entity
> > 'csi' (already seen)
> > [   56.128122] imx7-csi 30a90000.csi1_bridge: walk: returning
> > entity 'csi capture'
> > [   56.128127] imx7-csi 30a90000.csi1_bridge: walk: returning
> > entity 'csi'
> > [   56.128133] imx7-csi 30a90000.csi1_bridge: pipeline start failed
> > with -19
> > [   56.135091] ------------[ cut here ]------------
> > [   56.135102] WARNING: CPU: 3 PID: 1984 at
> > drivers/media/common/videobuf2/videobuf2-core.c:1568
> > vb2_start_streaming+0xe4/0x160 [videobuf2_common]
> > [   56.135151] Modules linked in: aes_ce_ccm exfat rfcomm
> > algif_hash algif_skcipher af_alg bnep qmi_wwan cdc_wdm option
> > usbnet usb_wwan usbserial mii ofpart mousedev spi_nor caam_jr mtd
> > caamhash_desc caamalg_desc crypto_engine uas redpine_sdio
> > usb_storage redpine_91x bluetooth mac80211 aes_ce_blk crypto_simd
> > crct10dif_ce ghash_ce cfg80211 sha2_ce sha1_ce st_lsm6dsx_spi
> > bq25890_charger pwm_vibra snd_soc_gtm601 snd_soc_simple_card
> > snd_soc_simple_card_utils hi846 s5k3l6xx edt_ft5x06 snd_soc_wm8962
> > mx6s_capture imx7_media_csi(C) imx_media_common(C)
> > videobuf2_dma_contig imx8mq_mipi_csis(C) mxc_mipi_csi2_yav
> > videobuf2_memops videobuf2_v4l2 tps6598x videobuf2_common vcnl4000
> > v4l2_fwnode typec industrialio_triggered_buffer leds_lm3560
> > videodev mc st_lsm6dsx_i2c st_lsm6dsx kfifo_buf gnss_mtk
> > gnss_serial gnss snd_soc_fsl_sai imx_sdma snvs_pwrkey imx_pcm_dma
> > virt_dma snd_soc_core imx2_wdt watchdog snd_pcm_dmaengine snd_pcm
> > snd_timer snd caam soundcore error rfkill_hks rfkill ledtrig_timer
> > usb_f_acm
> > [   56.135494]  u_serial usb_f_rndis g_multi usb_f_mass_storage
> > u_ether libcomposite ledtrig_pattern fuse ip_tables x_tables ipv6
> > xhci_plat_hcd xhci_hcd usbcore imx_dcss clk_bd718x7 cdns_mhdp_imx
> > cdns_mhdp_drmcore dwc3 ulpi udc_core roles phy_fsl_imx8mq_usb
> > usb_common
> > [   56.135596] CPU: 3 PID: 1984 Comm: v4l2-ctl Tainted: G        
> > C   5.12.2-librem5-00049-g99f86eccfeae #335
> > [   56.135607] Hardware name: Purism Librem 5r4 (DT)
> > [   56.135613] pstate: 80000005 (Nzcv daif -PAN -UAO -TCO BTYPE=--)
> > [   56.135623] pc : vb2_start_streaming+0xe4/0x160
> > [videobuf2_common]
> > [   56.135653] lr : vb2_start_streaming+0x74/0x160
> > [videobuf2_common]
> > [   56.135682] sp : ffff8000148bbba0
> > [   56.135686] x29: ffff8000148bbba0 x28: ffff00001e833f00 
> > [   56.135700] x27: 0000000040045612 x26: ffff800008f406a0 
> > [   56.135713] x25: 0000000000000000 x24: ffff8000148bbd58 
> > [   56.135725] x23: ffff0000be730138 x22: ffff00000230ab00 
> > [   56.135738] x21: ffff0000be730330 x20: ffff0000be730348 
> > [   56.135751] x19: 00000000ffffffed x18: 0000000000000000 
> > [   56.135763] x17: 0000000000000000 x16: 0000000000000000 
> > [   56.135776] x15: 0000000000000030 x14: ffffffffffffffff 
> > [   56.135788] x13: ffff8000948bb737 x12: ffff8000148bb73f 
> > [   56.135801] x11: ffff80001152a7a0 x10: 00000000ffffe000 
> > [   56.135813] x9 : ffff800008f3c900 x8 : ffff80001147a7a0 
> > [   56.135826] x7 : ffff80001152a7a0 x6 : 0000000000000000 
> > [   56.135838] x5 : 0000000000000000 x4 : 0000000000000000 
> > [   56.135850] x3 : ffff0000be730344 x2 : 0000000000000000 
> > [   56.135863] x1 : ffff800008fe4000 x0 : ffff0000253d29f0 
> > [   56.135877] Call trace:
> > [   56.135882]  vb2_start_streaming+0xe4/0x160 [videobuf2_common]
> > [   56.135912]  vb2_core_streamon+0x9c/0x1a0 [videobuf2_common]
> > [   56.135940]  vb2_ioctl_streamon+0x68/0xbc [videobuf2_v4l2]
> > [   56.135964]  v4l_streamon+0x30/0x40 [videodev]
> > [   56.136063]  __video_do_ioctl+0x194/0x3f4 [videodev]
> > [   56.136145]  video_usercopy+0x1a4/0x770 [videodev]
> > [   56.136226]  video_ioctl2+0x24/0x40 [videodev]
> > [   56.136305]  v4l2_ioctl+0x4c/0x70 [videodev]
> > [   56.136385]  __arm64_sys_ioctl+0xb4/0xfc
> > [   56.136401]  el0_svc_common.constprop.0+0x68/0x130
> > [   56.136416]  do_el0_svc+0x28/0x34
> > [   56.136426]  el0_svc+0x2c/0x54
> > [   56.136438]  el0_sync_handler+0x1a4/0x1b0
> > [   56.136449]  el0_sync+0x174/0x180
> > [   56.136459] ---[ end trace 122c8abc5f14e4e5 ]---
> 
> Hopefully the patch mentioned above will fix this.

it does. no WARN_ON after "pipeline start failed with -19"

thank you!

> 
> > // SPDX-License-Identifier: GPL-2.0
> > /*
> >  * Freescale i.MX8MQ SoC series MIPI-CSI receiver driver
> >  *
> >  * Copyright (C) 2021 Purism SPC
> >  * Copyright (C) 2019 Linaro Ltd
> >  * Copyright (C) 2015-2016 Freescale Semiconductor, Inc. All Rights
> > Reserved.
> >  * Copyright (C) 2011 - 2013 Samsung Electronics Co., Ltd.
> >  *
> >  */
> > 
> > #include <linux/clk.h>
> > #include <linux/debugfs.h>
> > #include <linux/delay.h>
> > #include <linux/errno.h>
> > #include <linux/interrupt.h>
> > #include <linux/io.h>
> > #include <linux/kernel.h>
> > #include <linux/module.h>
> > #include <linux/mutex.h>
> > #include <linux/of.h>
> > #include <linux/of_device.h>
> > #include <linux/platform_device.h>
> > #include <linux/pm_runtime.h>
> > #include <linux/regmap.h>
> > #include <linux/mfd/syscon.h>
> > #include <linux/regulator/consumer.h>
> > #include <linux/reset.h>
> > #include <linux/spinlock.h>
> > 
> > #include <media/v4l2-common.h>
> > #include <media/v4l2-device.h>
> > #include <media/v4l2-fwnode.h>
> > #include <media/v4l2-mc.h>
> > #include <media/v4l2-subdev.h>
> > 
> > #define CSIS_DRIVER_NAME                        "imx8mq-mipi-csis"
> > #define CSIS_SUBDEV_NAME                        CSIS_DRIVER_NAME
> > 
> > #define CSIS_PAD_SINK                           0
> > #define CSIS_PAD_SOURCE                         1
> > #define CSIS_PADS_NUM                           2
> > 
> > #define MIPI_CSIS_DEF_PIX_WIDTH                 640
> > #define MIPI_CSIS_DEF_PIX_HEIGHT                480
> > 
> > /* Register map definition */
> > 
> > /* i.MX8MQ CSI-2 controller CSR */
> > /* TODO 0x100, to dts? */
> > #define CSI2RX_CFG_NUM_LANES                    0x100
> > #define CSI2RX_CFG_DISABLE_DATA_LANES           0x104
> > #define CSI2RX_BIT_ERR                          0x108
> > #define CSI2RX_IRQ_STATUS                       0x10C
> > #define CSI2RX_IRQ_MASK                         0x110
> > #define CSI2RX_ULPS_STATUS                      0x114
> > #define CSI2RX_PPI_ERRSOT_HS                    0x118
> > #define CSI2RX_PPI_ERRSOTSYNC_HS                0x11C
> > #define CSI2RX_PPI_ERRESC                       0x120
> > #define CSI2RX_PPI_ERRSYNCESC                   0x124
> > #define CSI2RX_PPI_ERRCONTROL                   0x128
> > #define CSI2RX_CFG_DISABLE_PAYLOAD_0            0x12C
> > #define CSI2RX_CFG_DISABLE_PAYLOAD_1            0x130
> > 
> > enum {
> >         ST_POWERED      = 1,
> >         ST_STREAMING    = 2,
> >         ST_SUSPENDED    = 4,
> > };
> > 
> > static const char * const mipi_csis_clk_id[] = {
> >         "clk_core",
> >         "clk_esc",
> >         "clk_pxl",
> >         "clk_clko2",
> > };
> > 
> > struct csis_imx8mq_hw_reset {
> >         struct regmap *src;
> >         u8 req_src;
> >         u8 rst_val;
> > };
> > 
> > struct csis_imx8mq_phy_gpr {
> >         struct regmap *gpr;
> >         u8 req_src;
> > };
> > 
> > #define GPR_CSI2_1_RX_ENABLE            BIT(13)
> > #define GPR_CSI2_1_VID_INTFC_ENB        BIT(12)
> > #define GPR_CSI2_1_HSEL                 BIT(10)
> > #define GPR_CSI2_1_CONT_CLK_MODE        BIT(8)
> > #define GPR_CSI2_1_S_PRG_RXHS_SETTLE(x) (((x) & 0x3F) << 2)
> > /*
> >  * rxhs_settle[0] ... <720x480
> >  * rxhs_settle[1] ... >720*480
> >  *
> >  * 
> > https://community.nxp.com/t5/i-MX-Processors/Explenation-for-HS-SETTLE-parameter-in-MIPI-CSI-D-PHY-registers/m-p/764275/highlight/true#M118744
> >  */
> > static u8 rxhs_settle[2] = { 0x14, 0x9 };
> > 
> > struct csi_state {
> >         struct device *dev;
> >         void __iomem *regs;
> >         struct clk_bulk_data *clks;
> >         struct reset_control *mrst;
> >         struct regulator *mipi_phy_regulator;
> >         u8 index;
> > 
> >         struct v4l2_subdev sd;
> >         struct media_pad pads[CSIS_PADS_NUM];
> >         struct v4l2_async_notifier notifier;
> >         struct v4l2_subdev *src_sd;
> > 
> >         struct v4l2_fwnode_bus_mipi_csi2 bus;
> >         u32 hs_settle;
> >         u32 clk_settle;
> > 
> >         struct mutex lock;      /* Protect csis_fmt, format_mbus
> > and state */
> >         u32 state;
> > 
> >         struct dentry *debugfs_root;
> >         bool debug;
> > 
> >         struct csis_imx8mq_hw_reset hw_reset;
> >         struct csis_imx8mq_phy_gpr phy_gpr;
> >         u32 send_level;
> > };
> > 
> > /* ----------------------------------------------------------------
> > -------------
> >  * Format helpers
> >  */
> > 
> > /* ----------------------------------------------------------------
> > -------------
> >  * Hardware configuration
> >  */
> > 
> > static inline u32 mipi_csis_read(struct csi_state *state, u32 reg)
> > {
> >         return readl(state->regs + reg);
> > }
> > 
> > static inline void mipi_csis_write(struct csi_state *state, u32
> > reg, u32 val)
> > {
> >         writel(val, state->regs + reg);
> > }
> > 
> > static void mipi_csis_enable_interrupts(struct csi_state *state,
> > bool on)
> > {
> >         return;
> > }
> > 
> > static void mipi_csis_sw_reset(struct csi_state *state)
> > {
> >         /* TODO yav: mxc_mipi_csi1_phy_reset */
> > 
> >         struct device *dev = state->dev;
> >         struct device_node *np = dev->of_node;
> >         struct device_node *node;
> >         phandle phandle;
> >         u32 out_val[3];
> >         int ret;
> > 
> >         dev_dbg(dev, "%s: starting\n", __func__);
> > 
> >         ret = of_property_read_u32_array(np, "csis-phy-reset",
> > out_val, 3);
> >         if (ret) {
> >                 dev_info(dev, "no csis-hw-reset property found:
> > %d\n", ret);
> >                 return;
> >         }
> > 
> >         phandle = *out_val;
> > 
> >         node = of_find_node_by_phandle(phandle);
> >         if (!node) {
> >                 ret = PTR_ERR(node);
> >                 dev_dbg(dev, "not find src node by phandle: %d\n",
> > ret);
> >         }
> >         state->hw_reset.src = syscon_node_to_regmap(node);
> >         if (IS_ERR(state->hw_reset.src)) {
> >                 ret = PTR_ERR(state->hw_reset.src);
> >                 dev_err(dev, "failed to get src regmap: %d\n",
> > ret);
> >         }
> >         of_node_put(node);
> >         if (ret < 0)
> >                 return;
> > 
> >         state->hw_reset.req_src = out_val[1];
> >         state->hw_reset.rst_val = out_val[2];
> > 
> >         /* reset imx8mq mipi phy */
> >         regmap_update_bits(state->hw_reset.src,
> >                            state->hw_reset.req_src,
> >                            state->hw_reset.rst_val,
> >                            state->hw_reset.rst_val);
> >         msleep(20);
> > 
> >         dev_dbg(dev, "%s: done\n", __func__);
> > 
> >         return;
> > }
> > 
> > static void mipi_csis_system_enable(struct csi_state *state, int
> > on)
> > {
> >         struct device *dev = state->dev;
> >         struct device_node *np = dev->of_node;
> >         struct device_node *node;
> >         phandle phandle;
> >         u32 out_val[2];
> >         int ret;
> > 
> >         if (!on) {
> >                 /* Disable Data lanes */
> >                 mipi_csis_write(state,
> > CSI2RX_CFG_DISABLE_DATA_LANES, 0xf);
> >                 return;
> >         }
> > 
> >         ret = of_property_read_u32_array(np, "phy-gpr", out_val,
> > 2);
> >         if (ret) {
> >                 dev_info(dev, "no phy-gpr property found\n");
> >                 return;
> >         }
> > 
> >         phandle = *out_val;
> > 
> >         node = of_find_node_by_phandle(phandle);
> >         if (!node) {
> >                 dev_dbg(dev, "not find gpr node by phandle\n");
> >                 ret = PTR_ERR(node);
> >         }
> >         state->phy_gpr.gpr = syscon_node_to_regmap(node);
> >         if (IS_ERR(state->phy_gpr.gpr)) {
> >                 dev_err(dev, "failed to get gpr regmap\n");
> >                 ret = PTR_ERR(state->phy_gpr.gpr);
> >         }
> >         of_node_put(node);
> >         if (ret < 0)
> >                 return;
> > 
> >         state->phy_gpr.req_src = out_val[1];
> > 
> >         regmap_update_bits(state->phy_gpr.gpr,
> >                            state->phy_gpr.req_src,
> >                            0x3FFF,
> >                            GPR_CSI2_1_RX_ENABLE |
> >                            GPR_CSI2_1_VID_INTFC_ENB |
> >                            GPR_CSI2_1_HSEL |
> >                            GPR_CSI2_1_CONT_CLK_MODE |
> >                            GPR_CSI2_1_S_PRG_RXHS_SETTLE(state->
> >                                                         hs_settle))
> > ;
> > 
> >         dev_dbg(dev, "%s: hs_settle: 0x%X\n", __func__, state-
> > >hs_settle);
> > 
> >         return;
> > }
> > 
> > static int mipi_csis_calculate_params(struct csi_state *state)
> > {
> >         s64 link_freq;
> >         u32 lane_rate;
> > 
> >         state->hs_settle = rxhs_settle[0];
> > #if 0
> >         /* Calculate the line rate from the pixel rate. */
> >         link_freq = v4l2_get_link_freq(state->src_sd->ctrl_handler,
> >                                        state->csis_fmt->width,
> >                                        state->bus.num_data_lanes *
> > 2);
> >         if (link_freq < 0) {
> >                 dev_err(state->dev, "Unable to obtain link
> > frequency: %d\n",
> >                         (int)link_freq);
> >                 return link_freq;
> >         }
> > 
> >         lane_rate = link_freq * 2;
> > 
> >         if (lane_rate < 80000000 || lane_rate > 1500000000) {
> >                 dev_dbg(state->dev, "Out-of-bound lane rate %u\n",
> > lane_rate);
> >                 return -EINVAL;
> >         }
> > 
> >         /*
> >          * The HSSETTLE counter value is document in a table, but
> > can also
> >          * easily be calculated. Hardcode the CLKSETTLE value to 0
> > for now
> >          * (which is documented as corresponding to CSI-2 v0.87 to
> > v1.00) until
> >          * we figure out how to compute it correctly.
> >          */
> >         state->hs_settle = (lane_rate - 5000000) / 45000000;
> >         state->clk_settle = 0;
> > 
> >         dev_dbg(state->dev, "lane rate %u, Tclk_settle %u,
> > Ths_settle %u\n",
> >                 lane_rate, state->clk_settle, state->hs_settle);
> > #endif
> >         return 0;
> > }
> > 
> > static void mipi_csis_set_params(struct csi_state *state)
> > {
> >         int lanes = state->bus.num_data_lanes;
> >         u32 val = 0;
> >         int i;
> > 
> >         /* Lanes */
> >         mipi_csis_write(state, CSI2RX_CFG_NUM_LANES, lanes - 1);
> > 
> > dev_err(state->dev, "imx8mq: %d lanes\n", lanes);
> > 
> >         for (i = 0; i < lanes; i++)
> >                 val |= (1 << i);
> > 
> >         val = 0xF & ~val;
> >         mipi_csis_write(state, CSI2RX_CFG_DISABLE_DATA_LANES, val);
> > 
> > dev_err(state->dev, "imx8mq: CSI2RX_CFG_DISABLE_DATA_LANES:
> > 0x%X\n", val);
> > 
> >         /* Mask interrupt */
> >         // Don't let ULPS (ultra-low power status) interrupts flood
> >         mipi_csis_write(state, CSI2RX_IRQ_MASK, 0x1ff);
> > 
> >         mipi_csis_write(state, 0x180, 1);
> >         /* vid_vc */
> >         mipi_csis_write(state, 0x184, 1);
> >         mipi_csis_write(state, 0x188, state->send_level);
> > }
> > 
> > static int mipi_csis_clk_enable(struct csi_state *state)
> > {
> >         return
> > clk_bulk_prepare_enable(ARRAY_SIZE(mipi_csis_clk_id), state->clks);
> > }
> > 
> > static void mipi_csis_clk_disable(struct csi_state *state)
> > {
> >         clk_bulk_disable_unprepare(ARRAY_SIZE(mipi_csis_clk_id),
> > state->clks);
> > }
> > 
> > static int mipi_csis_clk_get(struct csi_state *state)
> > {
> >         unsigned int i;
> >         int ret;
> > 
> >         state->clks = devm_kcalloc(state->dev,
> > ARRAY_SIZE(mipi_csis_clk_id),
> >                                    sizeof(*state->clks),
> > GFP_KERNEL);
> > 
> >         if (!state->clks)
> >                 return -ENOMEM;
> > 
> >         for (i = 0; i < ARRAY_SIZE(mipi_csis_clk_id); i++)
> >                 state->clks[i].id = mipi_csis_clk_id[i];
> > 
> >         ret = devm_clk_bulk_get(state->dev,
> > ARRAY_SIZE(mipi_csis_clk_id),
> >                                 state->clks);
> >         return ret;
> > }
> > 
> > static void mipi_csis_start_stream(struct csi_state *state)
> > {
> >         mipi_csis_sw_reset(state);
> >         mipi_csis_set_params(state);
> >         mipi_csis_system_enable(state, true);
> >         mipi_csis_enable_interrupts(state, true);
> > }
> > 
> > static void mipi_csis_stop_stream(struct csi_state *state)
> > {
> >         mipi_csis_enable_interrupts(state, false);
> >         mipi_csis_system_enable(state, false);
> > }
> > 
> > /* ----------------------------------------------------------------
> > -------------
> >  * PHY regulator and reset
> >  */
> > 
> > static int mipi_csis_phy_enable(struct csi_state *state)
> > {
> >         return 0;
> > }
> > 
> > static int mipi_csis_phy_disable(struct csi_state *state)
> > {
> >         return 0;
> > }
> > 
> > static void mipi_csis_phy_reset(struct csi_state *state)
> > {
> >         return;
> > }
> > 
> > static int mipi_csis_phy_init(struct csi_state *state)
> > {
> >         return 0;
> > }
> > 
> > /* ----------------------------------------------------------------
> > -------------
> >  * Debug
> >  */
> > 
> > static void mipi_csis_clear_counters(struct csi_state *state)
> > {
> >         return;
> > }
> > 
> > static void mipi_csis_log_counters(struct csi_state *state, bool
> > non_errors)
> > {
> >         return;
> > }
> > 
> > static int mipi_csis_dump_regs(struct csi_state *state)
> > {
> >         return 0;
> > }
> > 
> > static int mipi_csis_dump_regs_show(struct seq_file *m, void
> > *private)
> > {
> >         struct csi_state *state = m->private;
> > 
> >         return mipi_csis_dump_regs(state);
> > }
> > DEFINE_SHOW_ATTRIBUTE(mipi_csis_dump_regs);
> > 
> > static void mipi_csis_debugfs_init(struct csi_state *state)
> > {
> >         state->debugfs_root = debugfs_create_dir(dev_name(state-
> > >dev), NULL);
> > 
> >         debugfs_create_bool("debug_enable", 0600, state-
> > >debugfs_root,
> >                             &state->debug);
> >         debugfs_create_file("dump_regs", 0600, state->debugfs_root,
> > state,
> >                             &mipi_csis_dump_regs_fops);
> > }
> > 
> > static void mipi_csis_debugfs_exit(struct csi_state *state)
> > {
> >         debugfs_remove_recursive(state->debugfs_root);
> > }
> > 
> > /* ----------------------------------------------------------------
> > -------------
> >  * V4L2 subdev operations
> >  */
> > 
> > static struct csi_state *mipi_sd_to_csis_state(struct v4l2_subdev
> > *sdev)
> > {
> >         return container_of(sdev, struct csi_state, sd);
> > }
> > 
> > static int mipi_csis_s_stream(struct v4l2_subdev *sd, int enable)
> > {
> >         struct csi_state *state = mipi_sd_to_csis_state(sd);
> >         int ret;
> > 
> >         mipi_csis_write(state, CSI2RX_IRQ_MASK, 0x008);
> > 
> >         dev_dbg(state->dev, "%s: enable: %d\n", __func__, enable);
> > 
> >         if (enable) {
> >                 ret = mipi_csis_calculate_params(state);
> >                 if (ret < 0)
> >                         return ret;
> > 
> >                 mipi_csis_clear_counters(state);
> > 
> >                 ret = pm_runtime_get_sync(state->dev);
> >                 if (ret < 0) {
> >                         pm_runtime_put_noidle(state->dev);
> >                         return ret;
> >                 }
> >                 ret = v4l2_subdev_call(state->src_sd, core,
> > s_power, 1);
> >                 if (ret < 0 && ret != -ENOIOCTLCMD)
> >                         goto done;
> >         }
> > 
> >         mutex_lock(&state->lock);
> > 
> >         if (enable) {
> >                 if (state->state & ST_SUSPENDED) {
> >                         ret = -EBUSY;
> >                         goto unlock;
> >                 }
> > 
> >                 mipi_csis_start_stream(state);
> >                 ret = v4l2_subdev_call(state->src_sd, video,
> > s_stream, 1);
> >                 if (ret < 0)
> >                         goto unlock;
> > 
> >                 mipi_csis_log_counters(state, true);
> > 
> >                 state->state |= ST_STREAMING;
> >         } else {
> >                 v4l2_subdev_call(state->src_sd, video, s_stream,
> > 0);
> >                 ret = v4l2_subdev_call(state->src_sd, core,
> > s_power, 0);
> >                 if (ret == -ENOIOCTLCMD)
> >                         ret = 0;
> >                 mipi_csis_stop_stream(state);
> >                 state->state &= ~ST_STREAMING;
> >                 if (state->debug)
> >                         mipi_csis_log_counters(state, true);
> >         }
> > 
> > unlock:
> >         mutex_unlock(&state->lock);
> > 
> > done:
> >         if (!enable || ret < 0)
> >                 pm_runtime_put(state->dev);
> > 
> >         return ret;
> > }
> > 
> > static int mipi_csis_get_fmt(struct v4l2_subdev *sd,
> >                              struct v4l2_subdev_pad_config *cfg,
> >                              struct v4l2_subdev_format *sdformat)
> > {
> >         struct csi_state *state = mipi_sd_to_csis_state(sd);
> > 
> >         return v4l2_subdev_call(state->src_sd, pad, get_fmt, NULL,
> > sdformat);
> > }
> > 
> > static int mipi_csis_enum_mbus_code(struct v4l2_subdev *sd,
> >                                     struct v4l2_subdev_pad_config
> > *cfg,
> >                                     struct
> > v4l2_subdev_mbus_code_enum *code)
> > {
> >         struct csi_state *state = mipi_sd_to_csis_state(sd);
> > 
> >         return v4l2_subdev_call(state->src_sd, pad, enum_mbus_code,
> > NULL, code);
> > }
> > 
> > static int mipi_csis_set_fmt(struct v4l2_subdev *sd,
> >                              struct v4l2_subdev_pad_config *cfg,
> >                              struct v4l2_subdev_format *sdformat)
> > {
> >         struct csi_state *state = mipi_sd_to_csis_state(sd);
> > 
> >         /*
> >          * The CSIS can't transcode in any way, the source format
> > can't be
> >          * modified.
> >          */
> >         if (sdformat->pad == CSIS_PAD_SOURCE)
> >                 return mipi_csis_get_fmt(sd, cfg, sdformat);
> > 
> >         if (sdformat->pad != CSIS_PAD_SINK)
> >                 return -EINVAL;
> > 
> >         if (sdformat->format.width * sdformat->format.height > 720
> > * 480) {
> >                 state->hs_settle = rxhs_settle[1];
> >         } else {
> >                 state->hs_settle = rxhs_settle[0];
> >         }
> >         state->send_level = 64;
> > 
> >         dev_dbg(state->dev,
> >                 "%s: format %dx%d send_level %d hs_settle 0x%X\n",
> > __func__,
> >                 sdformat->format.width, sdformat->format.height,
> >                 state->send_level, state->hs_settle);
> > 
> >         return v4l2_subdev_call(state->src_sd, pad, set_fmt, NULL,
> > sdformat);
> > }
> > 
> > static int mipi_csis_log_status(struct v4l2_subdev *sd)
> > {
> >         struct csi_state *state = mipi_sd_to_csis_state(sd);
> > 
> >         mutex_lock(&state->lock);
> >         mipi_csis_log_counters(state, true);
> >         if (state->debug && (state->state & ST_POWERED))
> >                 mipi_csis_dump_regs(state);
> >         mutex_unlock(&state->lock);
> > 
> >         return 0;
> > }
> > 
> > static const struct v4l2_subdev_core_ops mipi_csis_core_ops = {
> >         .log_status     = mipi_csis_log_status,
> > };
> > 
> > static const struct v4l2_subdev_video_ops mipi_csis_video_ops = {
> >         .s_stream       = mipi_csis_s_stream,
> > };
> > 
> > static const struct v4l2_subdev_pad_ops mipi_csis_pad_ops = {
> >         .enum_mbus_code         = mipi_csis_enum_mbus_code,
> >         .get_fmt                = mipi_csis_get_fmt,
> >         .set_fmt                = mipi_csis_set_fmt,
> > };
> > 
> > static const struct v4l2_subdev_ops mipi_csis_subdev_ops = {
> >         .core   = &mipi_csis_core_ops,
> >         .video  = &mipi_csis_video_ops,
> >         .pad    = &mipi_csis_pad_ops,
> > };
> > 
> > /* ----------------------------------------------------------------
> > -------------
> >  * Media entity operations
> >  */
> > 
> > static int mipi_csis_link_setup(struct media_entity *entity,
> >                                 const struct media_pad *local_pad,
> >                                 const struct media_pad *remote_pad,
> > u32 flags)
> > {
> >         struct v4l2_subdev *sd =
> > media_entity_to_v4l2_subdev(entity);
> >         struct csi_state *state = mipi_sd_to_csis_state(sd);
> >         struct v4l2_subdev *remote_sd;
> > 
> >         dev_dbg(state->dev, "link setup %s -> %s", remote_pad-
> > >entity->name,
> >                 local_pad->entity->name);
> > 
> >         /* We only care about the link to the source. */
> >         if (!(local_pad->flags & MEDIA_PAD_FL_SINK))
> >                 return 0;
> > 
> >         remote_sd = media_entity_to_v4l2_subdev(remote_pad-
> > >entity);
> > 
> >         if (flags & MEDIA_LNK_FL_ENABLED) {
> >                 if (state->src_sd)
> >                         return -EBUSY;
> > 
> >                 state->src_sd = remote_sd;
> >         } else {
> >                 state->src_sd = NULL;
> >         }
> > 
> >         return 0;
> > }
> > 
> > static const struct media_entity_operations mipi_csis_entity_ops =
> > {
> >         .link_setup     = mipi_csis_link_setup,
> >         .link_validate  = v4l2_subdev_link_validate,
> >         .get_fwnode_pad = v4l2_subdev_get_fwnode_pad_1_to_1,
> > };
> > 
> > /* ----------------------------------------------------------------
> > -------------
> >  * Async subdev notifier
> >  */
> > 
> > static struct csi_state *
> > mipi_notifier_to_csis_state(struct v4l2_async_notifier *n)
> > {
> >         return container_of(n, struct csi_state, notifier);
> > }
> > 
> > static int mipi_csis_notify_bound(struct v4l2_async_notifier
> > *notifier,
> >                                   struct v4l2_subdev *sd,
> >                                   struct v4l2_async_subdev *asd)
> > {
> >         struct csi_state *state =
> > mipi_notifier_to_csis_state(notifier);
> >         struct media_pad *sink = &state-
> > >sd.entity.pads[CSIS_PAD_SINK];
> > 
> >         return v4l2_create_fwnode_links_to_pad(sd, sink, 0);
> > }
> > 
> > static const struct v4l2_async_notifier_operations
> > mipi_csis_notify_ops = {
> >         .bound = mipi_csis_notify_bound,
> > };
> > 
> > static int mipi_csis_async_register(struct csi_state *state)
> > {
> >         struct v4l2_fwnode_endpoint vep = {
> >                 .bus_type = V4L2_MBUS_CSI2_DPHY,
> >         };
> >         struct v4l2_async_subdev *asd;
> >         struct fwnode_handle *ep;
> >         unsigned int i;
> >         int ret;
> > 
> >         v4l2_async_notifier_init(&state->notifier);
> > 
> >         ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(state-
> > >dev), 0, 0,
> >                                             
> > FWNODE_GRAPH_ENDPOINT_NEXT);
> >         if (!ep)
> >                 return -ENOTCONN;
> > 
> >         ret = v4l2_fwnode_endpoint_parse(ep, &vep);
> >         if (ret)
> >                 goto err_parse;
> > 
> >         for (i = 0; i < vep.bus.mipi_csi2.num_data_lanes; ++i) {
> >                 if (vep.bus.mipi_csi2.data_lanes[i] != i + 1) {
> >                         dev_err(state->dev,
> >                                 "data lanes reordering is not
> > supported");
> >                         goto err_parse;
> >                 }
> >         }
> > 
> >         state->bus = vep.bus.mipi_csi2;
> > 
> >         dev_dbg(state->dev, "data lanes: %d\n", state-
> > >bus.num_data_lanes);
> >         dev_dbg(state->dev, "flags: 0x%08x\n", state->bus.flags);
> > 
> >         asd = v4l2_async_notifier_add_fwnode_remote_subdev(
> >                 &state->notifier, ep, struct v4l2_async_subdev);
> >         if (IS_ERR(asd)) {
> >                 ret = PTR_ERR(asd);
> >                 goto err_parse;
> >         }
> > 
> >         fwnode_handle_put(ep);
> > 
> >         state->notifier.ops = &mipi_csis_notify_ops;
> > 
> >         ret = v4l2_async_subdev_notifier_register(&state->sd,
> > &state->notifier);
> >         if (ret)
> >                 return ret;
> > 
> >         return v4l2_async_register_subdev(&state->sd);
> > 
> > err_parse:
> >         fwnode_handle_put(ep);
> > 
> >         return ret;
> > }
> > 
> > /* ----------------------------------------------------------------
> > -------------
> >  * Suspend/resume
> >  */
> > 
> > static int mipi_csis_pm_suspend(struct device *dev, bool runtime)
> > {
> >         struct v4l2_subdev *sd = dev_get_drvdata(dev);
> >         struct csi_state *state = mipi_sd_to_csis_state(sd);
> >         int ret = 0;
> > 
> >         mutex_lock(&state->lock);
> >         if (state->state & ST_POWERED) {
> >                 mipi_csis_stop_stream(state);
> >                 ret = mipi_csis_phy_disable(state);
> >                 if (ret)
> >                         goto unlock;
> >                 mipi_csis_clk_disable(state);
> >                 state->state &= ~ST_POWERED;
> >                 if (!runtime)
> >                         state->state |= ST_SUSPENDED;
> >         }
> > 
> > unlock:
> >         mutex_unlock(&state->lock);
> > 
> >         return ret ? -EAGAIN : 0;
> > }
> > 
> > static int mipi_csis_pm_resume(struct device *dev, bool runtime)
> > {
> >         struct v4l2_subdev *sd = dev_get_drvdata(dev);
> >         struct csi_state *state = mipi_sd_to_csis_state(sd);
> >         int ret = 0;
> > 
> >         mutex_lock(&state->lock);
> >         if (!runtime && !(state->state & ST_SUSPENDED))
> >                 goto unlock;
> > 
> >         if (!(state->state & ST_POWERED)) {
> >                 ret = mipi_csis_phy_enable(state);
> >                 if (ret)
> >                         goto unlock;
> > 
> >                 state->state |= ST_POWERED;
> >                 mipi_csis_clk_enable(state);
> >         }
> >         if (state->state & ST_STREAMING)
> >                 mipi_csis_start_stream(state);
> > 
> >         state->state &= ~ST_SUSPENDED;
> > 
> > unlock:
> >         mutex_unlock(&state->lock);
> > 
> >         return ret ? -EAGAIN : 0;
> > }
> > 
> > static int __maybe_unused mipi_csis_suspend(struct device *dev)
> > {
> >         return mipi_csis_pm_suspend(dev, false);
> > }
> > 
> > static int __maybe_unused mipi_csis_resume(struct device *dev)
> > {
> >         return mipi_csis_pm_resume(dev, false);
> > }
> > 
> > static int __maybe_unused mipi_csis_runtime_suspend(struct device
> > *dev)
> > {
> >         return mipi_csis_pm_suspend(dev, true);
> > }
> > 
> > static int __maybe_unused mipi_csis_runtime_resume(struct device
> > *dev)
> > {
> >         return mipi_csis_pm_resume(dev, true);
> > }
> > 
> > static const struct dev_pm_ops mipi_csis_pm_ops = {
> >         SET_RUNTIME_PM_OPS(mipi_csis_runtime_suspend,
> > mipi_csis_runtime_resume,
> >                            NULL)
> >         SET_SYSTEM_SLEEP_PM_OPS(mipi_csis_suspend,
> > mipi_csis_resume)
> > };
> > 
> > /* ----------------------------------------------------------------
> > -------------
> >  * Probe/remove & platform driver
> >  */
> > 
> > static int mipi_csis_subdev_init(struct csi_state *state)
> > {
> >         struct v4l2_subdev *sd = &state->sd;
> > 
> >         v4l2_subdev_init(sd, &mipi_csis_subdev_ops);
> >         sd->owner = THIS_MODULE;
> >         snprintf(sd->name, sizeof(sd->name), "%s.%d",
> >                  CSIS_SUBDEV_NAME, state->index);
> > 
> >         sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> >         sd->ctrl_handler = NULL;
> > 
> >         sd->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
> >         sd->entity.ops = &mipi_csis_entity_ops;
> > 
> >         sd->dev = state->dev;
> > 
> >         state->pads[CSIS_PAD_SINK].flags = MEDIA_PAD_FL_SINK
> >                                          |
> > MEDIA_PAD_FL_MUST_CONNECT;
> >         state->pads[CSIS_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE
> >                                            |
> > MEDIA_PAD_FL_MUST_CONNECT;
> >         return media_entity_pads_init(&sd->entity, CSIS_PADS_NUM,
> >                                       state->pads);
> > }
> > 
> > static int mipi_csis_parse_dt(struct csi_state *state)
> > {
> >         struct device_node *node = state->dev->of_node;
> > 
> >         return 0;
> > }
> > 
> > static int mipi_csis_probe(struct platform_device *pdev)
> > {
> >         struct device *dev = &pdev->dev;
> >         struct csi_state *state;
> >         int ret;
> > 
> >         state = devm_kzalloc(dev, sizeof(*state), GFP_KERNEL);
> >         if (!state)
> >                 return -ENOMEM;
> > 
> >         mutex_init(&state->lock);
> > 
> >         state->dev = dev;
> > 
> >         /* Parse DT properties. */
> >         ret = mipi_csis_parse_dt(state);
> >         if (ret < 0) {
> >                 dev_err(dev, "Failed to parse device tree: %d\n",
> > ret);
> >                 return ret;
> >         }
> > 
> >         /* Acquire resources. */
> >         state->regs = devm_platform_ioremap_resource(pdev, 0);
> >         if (IS_ERR(state->regs))
> >                 return PTR_ERR(state->regs);
> > 
> >         ret = mipi_csis_phy_init(state);
> >         if (ret < 0)
> >                 return ret;
> > 
> >         ret = mipi_csis_clk_get(state);
> >         if (ret < 0)
> >                 return ret;
> > 
> >         /* Reset PHY and enable the clocks. */
> >         mipi_csis_phy_reset(state);
> > 
> >         ret = mipi_csis_clk_enable(state);
> >         if (ret < 0) {
> >                 dev_err(state->dev, "failed to enable clocks:
> > %d\n", ret);
> >                 return ret;
> >         }
> > 
> >         /* Initialize and register the subdev. */
> >         ret = mipi_csis_subdev_init(state);
> >         if (ret < 0)
> >                 goto disable_clock;
> > 
> >         platform_set_drvdata(pdev, &state->sd);
> > 
> >         ret = mipi_csis_async_register(state);
> >         if (ret < 0) {
> >                 dev_err(dev, "async register failed: %d\n", ret);
> >                 goto cleanup;
> >         }
> > 
> >         /* Initialize debugfs. */
> >         mipi_csis_debugfs_init(state);
> > 
> >         /* Enable runtime PM. */
> >         pm_runtime_enable(dev);
> >         if (!pm_runtime_enabled(dev)) {
> >                 ret = mipi_csis_pm_resume(dev, true);
> >                 if (ret < 0)
> >                         goto unregister_all;
> >         }
> > 
> >         dev_info(dev, "lanes: %d\n",
> >                  state->bus.num_data_lanes);
> > 
> >         return 0;
> > 
> > unregister_all:
> >         mipi_csis_debugfs_exit(state);
> > cleanup:
> >         media_entity_cleanup(&state->sd.entity);
> >         v4l2_async_notifier_unregister(&state->notifier);
> >         v4l2_async_notifier_cleanup(&state->notifier);
> >         v4l2_async_unregister_subdev(&state->sd);
> > disable_clock:
> >         mipi_csis_clk_disable(state);
> >         mutex_destroy(&state->lock);
> > 
> >         return ret;
> > }
> > 
> > static int mipi_csis_remove(struct platform_device *pdev)
> > {
> >         struct v4l2_subdev *sd = platform_get_drvdata(pdev);
> >         struct csi_state *state = mipi_sd_to_csis_state(sd);
> > 
> >         mipi_csis_debugfs_exit(state);
> >         v4l2_async_notifier_unregister(&state->notifier);
> >         v4l2_async_notifier_cleanup(&state->notifier);
> >         v4l2_async_unregister_subdev(&state->sd);
> > 
> >         pm_runtime_disable(&pdev->dev);
> >         mipi_csis_pm_suspend(&pdev->dev, true);
> >         mipi_csis_clk_disable(state);
> >         media_entity_cleanup(&state->sd.entity);
> >         mutex_destroy(&state->lock);
> >         pm_runtime_set_suspended(&pdev->dev);
> > 
> >         return 0;
> > }
> > 
> > static const struct of_device_id mipi_csis_of_match[] = {
> >         { .compatible = "fsl,imx8mq-mipi-csi2",},
> >         { /* sentinel */ },
> > };
> > MODULE_DEVICE_TABLE(of, mipi_csis_of_match);
> > 
> > static struct platform_driver mipi_csis_driver = {
> >         .probe          = mipi_csis_probe,
> >         .remove         = mipi_csis_remove,
> >         .driver         = {
> >                 .of_match_table = mipi_csis_of_match,
> >                 .name           = CSIS_DRIVER_NAME,
> >                 .pm             = &mipi_csis_pm_ops,
> >         },
> > };
> > 
> > module_platform_driver(mipi_csis_driver);
> > 
> > MODULE_DESCRIPTION("i.MX8MQ MIPI CSI-2 receiver driver");
> > MODULE_LICENSE("GPL v2");
> > MODULE_ALIAS("platform:imx8mq-mipi-csi2");
> 


