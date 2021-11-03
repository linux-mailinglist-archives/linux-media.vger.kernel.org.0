Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 334E644403C
	for <lists+linux-media@lfdr.de>; Wed,  3 Nov 2021 11:59:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230250AbhKCLBm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Nov 2021 07:01:42 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:34459 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229506AbhKCLBl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Nov 2021 07:01:41 -0400
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 31A42240005;
        Wed,  3 Nov 2021 10:59:00 +0000 (UTC)
Date:   Wed, 3 Nov 2021 11:59:52 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Eugen.Hristev@microchip.com
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        laurent.pinchart@ideasonboard.com, sakari.ailus@iki.fi,
        robh+dt@kernel.org, Nicolas.Ferre@microchip.com
Subject: Re: [PATCH 03/21] media: atmel: introduce microchip csi2dc driver
Message-ID: <20211103105952.7qwbig3vygbv5xq2@uno.localdomain>
References: <20211022075247.518880-1-eugen.hristev@microchip.com>
 <20211022075247.518880-4-eugen.hristev@microchip.com>
 <20211102172236.yrmxlhzrn2bwkgop@uno.localdomain>
 <e054a126-eca4-27de-85ff-568c48d9434b@microchip.com>
 <20211103092833.exp5b6ogcku6jacr@uno.localdomain>
 <0437d311-3585-7e0e-0cbe-fa5bd582c2ce@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0437d311-3585-7e0e-0cbe-fa5bd582c2ce@microchip.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Eugen

On Wed, Nov 03, 2021 at 09:59:35AM +0000, Eugen.Hristev@microchip.com wrote:
> On 11/3/21 11:28 AM, Jacopo Mondi wrote:
> > Hi Eugen
> >
> > On Wed, Nov 03, 2021 at 08:31:36AM +0000, Eugen.Hristev@microchip.com wrote:
> >> On 11/2/21 7:22 PM, Jacopo Mondi wrote:
> >>> Hi Eugen,
> >>>
> >>
> >> Hi,
> >>
> >> Thank you for your review. I will try to understand everything you said
> >> and come up with a new version. I still have some inline questions
> >> though, about some things which are still unclear.
> >>
> >>> On Fri, Oct 22, 2021 at 10:52:29AM +0300, Eugen Hristev wrote:
> >>>> Microchip CSI2DC (CSI2 Demultiplexer Controller) is a misc bridge device
> >>>> that converts a byte stream in IDI Synopsys format (coming from a CSI2HOST)
> >>>> to a pixel stream that can be captured by a sensor controller.
> >>>>
> >>>> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
> >>>> ---
> >>>> Changes in this revision:
> >>>> - addressed comments by Jacopo and Laurent as in this thread:
> >>>> https://www.spinics.net/lists/linux-media/msg181044.html
> >>>>
> >>>> Previous change log :
> >>>> Changes in v5:
> >>>> - only in bindings
> >>>>
> >>>> Changes in v4:
> >>>> - now using get_mbus_config ops to get data from the subdevice, like the
> >>>> virtual channel id, and the clock type.
> >>>> - now having possibility to select any of the RAW10 data modes
> >>>> - at completion time, select which formats are also available in the subdevice,
> >>>> and move to the dynamic list accordingly
> >>>> - changed the pipeline integration, do not advertise subdev ready at probe time.
> >>>> wait until completion is done, and then start a workqueue that will register
> >>>> this device as a subdevice for the next element in pipeline.
> >>>> - moved the s_power code into a different function called now csi2dc_power
> >>>> that is called with CONFIG_PM functions. This is also called at completion,
> >>>> to have the device ready in case CONFIG_PM is not selected on the platform.
> >>>> - merged try_fmt into set_fmt
> >>>> - driver cleanup, wrapped lines over 80 characters
> >>>>
> >>>> Changes in v2:
> >>>> - moved driver to platform/atmel
> >>>> - fixed minor things as per Sakari's review
> >>>> - still some things from v2 review are not yet addressed, to be followed up
> >>>>
> >>>>
> >>>>    drivers/media/platform/atmel/Kconfig          |  15 +
> >>>>    drivers/media/platform/atmel/Makefile         |   1 +
> >>>>    .../media/platform/atmel/microchip-csi2dc.c   | 700 ++++++++++++++++++
> >>>>    3 files changed, 716 insertions(+)
> >>>>    create mode 100644 drivers/media/platform/atmel/microchip-csi2dc.c
> >>>>
> >>>> diff --git a/drivers/media/platform/atmel/Kconfig b/drivers/media/platform/atmel/Kconfig
> >>>> index dda2f27da317..f83bee373d82 100644
> >>>> --- a/drivers/media/platform/atmel/Kconfig
> >>>> +++ b/drivers/media/platform/atmel/Kconfig
> >>>> @@ -40,3 +40,18 @@ config VIDEO_ATMEL_ISI
> >>>>         help
> >>>>           This module makes the ATMEL Image Sensor Interface available
> >>>>           as a v4l2 device.
> >>>> +
> >>>> +config VIDEO_MICROCHIP_CSI2DC
> >>>> +     tristate "Microchip CSI2 Demux Controller"
> >>>> +     depends on VIDEO_V4L2 && COMMON_CLK && OF
> >>>> +     depends on ARCH_AT91 || COMPILE_TEST
> >>>> +     select MEDIA_CONTROLLER
> >>>> +     select VIDEO_V4L2_SUBDEV_API
> >>>> +     select V4L2_FWNODE
> >>>> +     help
> >>>> +       CSI2 Demux Controller driver. CSI2DC is a helper chip
> >>>> +       that converts IDI interface byte stream to a parallel pixel stream.
> >>>> +       It supports various RAW formats as input.
> >>>> +
> >>>> +       To compile this driver as a module, choose M here: the
> >>>> +       module will be called microchip-csi2dc.
> >>>> diff --git a/drivers/media/platform/atmel/Makefile b/drivers/media/platform/atmel/Makefile
> >>>> index 46d264ab7948..39f0a7eba702 100644
> >>>> --- a/drivers/media/platform/atmel/Makefile
> >>>> +++ b/drivers/media/platform/atmel/Makefile
> >>>> @@ -6,3 +6,4 @@ obj-$(CONFIG_VIDEO_ATMEL_ISI) += atmel-isi.o
> >>>>    obj-$(CONFIG_VIDEO_ATMEL_ISC_BASE) += atmel-isc-base.o
> >>>>    obj-$(CONFIG_VIDEO_ATMEL_ISC) += atmel-isc.o
> >>>>    obj-$(CONFIG_VIDEO_ATMEL_XISC) += atmel-xisc.o
> >>>> +obj-$(CONFIG_VIDEO_MICROCHIP_CSI2DC) += microchip-csi2dc.o
> >>>> diff --git a/drivers/media/platform/atmel/microchip-csi2dc.c b/drivers/media/platform/atmel/microchip-csi2dc.c
> >>>> new file mode 100644
> >>>> index 000000000000..277b86988eee
> >>>> --- /dev/null
> >>>> +++ b/drivers/media/platform/atmel/microchip-csi2dc.c
> >>>> @@ -0,0 +1,700 @@
> >>>> +// SPDX-License-Identifier: GPL-2.0-only
> >>>> +/*
> >>>> + * Microchip CSI2 Demux Controller (CSI2DC) driver
> >>>> + *
> >>>> + * Copyright (C) 2018 Microchip Technology, Inc.
> >>>> + *
> >>>> + * Author: Eugen Hristev <eugen.hristev@microchip.com>
> >>>> + *
> >>>> + */
> >>>> +
> >>>> +#include <linux/clk.h>
> >>>> +#include <linux/module.h>
> >>>> +#include <linux/of.h>
> >>>
> >>> Isn't linux/mod_devicetable.h enough ?
> >>>
> >>>> +#include <linux/of_graph.h>
> >>>
> >>> You should probably move to use the fwnode_graph framwork instead of
> >>> of_graph. This driver depends on OF so it shouldn't be an issue but I
> >>> defer this to maintainers
> >>>
> >>>> +#include <linux/platform_device.h>
> >>>> +#include <linux/pm_runtime.h>
> >>>> +#include <linux/videodev2.h>
> >>>> +
> >>>> +#include <media/v4l2-device.h>
> >>>
> >>> Do you need this include ?
> >>>
> >>>> +#include <media/v4l2-fwnode.h>
> >>>> +#include <media/v4l2-subdev.h>
> >>>> +#include <media/videobuf2-dma-contig.h>
> >>>
> >>> Is this one needed as well ?
> >>>
> >>>> +
> >>>> +/* Global configuration register */
> >>>> +#define CSI2DC_GCFG                  0x0
> >>>> +
> >>>> +/* MIPI sensor pixel clock is free running */
> >>>> +#define CSI2DC_GCFG_MIPIFRN          BIT(0)
> >>>> +/* Output waveform inter-line minimum delay */
> >>>> +#define CSI2DC_GCFG_HLC(v)           ((v) << 4)
> >>>> +#define CSI2DC_GCFG_HLC_MASK         GENMASK(7, 4)
> >>>> +/* SAMA7G5 requires a HLC delay of 15 */
> >>>> +#define SAMA7G5_HLC                  (15)
> >>>> +
> >>>> +/* Global control register */
> >>>> +#define CSI2DC_GCTLR                 0x04
> >>>> +#define CSI2DC_GCTLR_SWRST           BIT(0)
> >>>> +
> >>>> +/* Global status register */
> >>>> +#define CSI2DC_GS                    0x08
> >>>> +
> >>>> +/* SSP interrupt status register */
> >>>> +#define CSI2DC_SSPIS                 0x28
> >>>> +/* Pipe update register */
> >>>> +#define CSI2DC_PU                    0xC0
> >>>
> >>> What about using lowercase for hex values (I know there's not strict
> >>> rule, so keep what you like the most, but most drivers use lowercase
> >>>
> >>>> +/* Video pipe attributes update */
> >>>> +#define CSI2DC_PU_VP                 BIT(0)
> >>>> +
> >>>> +/* Pipe update status register */
> >>>> +#define CSI2DC_PUS                   0xC4
> >>>> +
> >>>> +/* Video pipeline enable register */
> >>>> +#define CSI2DC_VPE                   0xF8
> >>>> +#define CSI2DC_VPE_ENABLE            BIT(0)
> >>>> +
> >>>> +/* Video pipeline configuration register */
> >>>> +#define CSI2DC_VPCFG                 0xFC
> >>>> +/* Data type */
> >>>> +#define CSI2DC_VPCFG_DT(v)           ((v) << 0)
> >>>> +#define CSI2DC_VPCFG_DT_MASK         GENMASK(5, 0)
> >>>> +/* Virtual channel identifier */
> >>>> +#define CSI2DC_VPCFG_VC(v)           ((v) << 6)
> >>>> +#define CSI2DC_VPCFG_VC_MASK         GENMASK(7, 6)
> >>>> +/* Decompression enable */
> >>>> +#define CSI2DC_VPCFG_DE                      BIT(8)
> >>>> +/* Decoder mode */
> >>>> +#define CSI2DC_VPCFG_DM(v)           ((v) << 9)
> >>>> +#define CSI2DC_VPCFG_DM_DECODER8TO12 0
> >>>> +/* Decoder predictor 2 selection */
> >>>> +#define CSI2DC_VPCFG_DP2             BIT(12)
> >>>> +/* Recommended memory storage */
> >>>> +#define CSI2DC_VPCFG_RMS             BIT(13)
> >>>> +/* Post adjustment */
> >>>> +#define CSI2DC_VPCFG_PA                      BIT(14)
> >>>> +
> >>>> +/* Video pipeline column register */
> >>>> +#define CSI2DC_VPCOL                 0x100
> >>>> +/* Column number */
> >>>> +#define CSI2DC_VPCOL_COL(v)          ((v) << 0)
> >>>> +#define CSI2DC_VPCOL_COL_MASK                GENMASK(15, 0)
> >>>> +
> >>>> +/* Video pipeline row register */
> >>>> +#define CSI2DC_VPROW                 0x104
> >>>> +/* Row number */
> >>>> +#define CSI2DC_VPROW_ROW(v)          ((v) << 0)
> >>>> +#define CSI2DC_VPROW_ROW_MASK                GENMASK(15, 0)
> >>>> +
> >>>> +/* Version register */
> >>>> +#define CSI2DC_VERSION                       0x1FC
> >>>> +
> >>>> +/* register read/write helpers */
> >>>> +#define csi2dc_readl(st, reg)                readl_relaxed((st)->base + (reg))
> >>>> +#define csi2dc_writel(st, reg, val)  writel_relaxed((val), \
> >>>> +                                     (st)->base + (reg))
> >>>> +
> >>>> +/* supported RAW data types */
> >>>> +#define CSI2DC_DT_RAW6                       0x28
> >>>> +#define CSI2DC_DT_RAW7                       0x29
> >>>> +#define CSI2DC_DT_RAW8                       0x2A
> >>>> +#define CSI2DC_DT_RAW10                      0x2B
> >>>> +#define CSI2DC_DT_RAW12                      0x2C
> >>>> +#define CSI2DC_DT_RAW14                      0x2D
> >>>> +
> >>>> +/*
> >>>> + * struct csi2dc_format - CSI2DC format type struct
> >>>> + * @mbus_code:               Media bus code for the format
> >>>> + * @dt:                      Data type constant for this format
> >>>> + */
> >>>> +struct csi2dc_format {
> >>>> +     u32                             mbus_code;
> >>>> +     u32                             dt;
> >>>> +};
> >>>> +
> >>>> +static const struct csi2dc_format csi2dc_formats[] = {
> >>>> +     {
> >>>> +             .mbus_code =            MEDIA_BUS_FMT_SRGGB10_1X10,
> >>>> +             .dt =                   CSI2DC_DT_RAW10,
> >>>> +     }, {
> >>>> +             .mbus_code =            MEDIA_BUS_FMT_SBGGR10_1X10,
> >>>> +             .dt =                   CSI2DC_DT_RAW10,
> >>>> +     }, {
> >>>> +             .mbus_code =            MEDIA_BUS_FMT_SGRBG10_1X10,
> >>>> +             .dt =                   CSI2DC_DT_RAW10,
> >>>> +     }, {
> >>>> +             .mbus_code =            MEDIA_BUS_FMT_SGBRG10_1X10,
> >>>> +             .dt =                   CSI2DC_DT_RAW10,
> >>>> +     },
> >>>> +};
> >>>
> >>> How unfortunate we don't have this in the core...
> >>>
> >>>> +
> >>>> +enum mipi_csi_pads {
> >>>> +     CSI2DC_PAD_SINK                 = 0,
> >>>> +     CSI2DC_PAD_SOURCE               = 1,
> >>>> +     CSI2DC_PADS_NUM                 = 2,
> >>>> +};
> >>>> +
> >>>> +/*
> >>>> + * struct csi2dc_device - CSI2DC device driver data/config struct
> >>>> + * @base:            Register map base address
> >>>> + * @csi2dc_sd:               v4l2 subdevice for the csi2dc device
> >>>> + *                   This is the subdevice that the csi2dc device itself
> >>>> + *                   registers in v4l2 subsystem
> >>>> + * @dev:             struct device for this csi2dc device
> >>>> + * @pclk:            Peripheral clock reference
> >>>> + *                   Input clock that clocks the hardware block internal
> >>>> + *                   logic
> >>>> + * @scck:            Sensor Controller clock reference
> >>>> + *                   Input clock that is used to generate the pixel clock
> >>>> + * @format:          Current saved format used in g/s fmt
> >>>> + * @cur_fmt:         Current state format
> >>>> + * @try_fmt:         Try format that is being tried
> >>>> + * @pads:            Media entity pads for the csi2dc subdevice
> >>>> + * @clk_gated:               Whether the clock is gated or free running
> >>>> + * @video_pipe:              Whether video pipeline is configured
> >>>> + * @vc:                      Current set virtual channel
> >>>> + * @asd:             Async subdevice for async bound of the underlying subdev
> >>>> + * @notifier:                Async notifier that is used to bound the underlying
> >>>> + *                   subdevice to the csi2dc subdevice
> >>>> + * @input_sd:                Reference to the underlying subdevice bound to the
> >>>> + *                   csi2dc subdevice
> >>>> + * @remote_pad:              Pad number of the underlying subdevice that is linked
> >>>> + *                   to the csi2dc subdevice sink pad.
> >>>> + */
> >>>> +struct csi2dc_device {
> >>>> +     void __iomem                    *base;
> >>>> +     struct v4l2_subdev              csi2dc_sd;
> >>>> +     struct device                   *dev;
> >>>> +     struct clk                      *pclk;
> >>>> +     struct clk                      *scck;
> >>>> +
> >>>> +     struct v4l2_mbus_framefmt        format;
> >>>> +
> >>>> +     const struct csi2dc_format      *cur_fmt;
> >>>> +     const struct csi2dc_format      *try_fmt;
> >>>> +
> >>>> +     struct media_pad                pads[CSI2DC_PADS_NUM];
> >>>> +
> >>>> +     bool                            clk_gated;
> >>>> +     bool                            video_pipe;
> >>>> +     u32                             vc;
> >>>> +
> >>>> +     struct v4l2_async_subdev        *asd;
> >>>> +     struct v4l2_async_notifier      notifier;
> >>>> +
> >>>> +     struct v4l2_subdev              *input_sd;
> >>>> +
> >>>> +     u32                             remote_pad;
> >>>> +};
> >>>> +
> >>>> +static void csi2dc_vp_update(struct csi2dc_device *csi2dc)
> >>>
> >>> Could you move this below closer to the only caller ?
> >>>
> >>>> +{
> >>>> +     u32 vp;
> >>>> +
> >>>> +     if (!csi2dc->cur_fmt) {
> >>>
> >>> You should probably initialize this to a default format
> >>>
> >>>> +             dev_err(csi2dc->dev, "format must be configured first\n");
> >>>> +             return;
> >>>> +     }
> >>>> +
> >>>> +     if (!csi2dc->video_pipe) {
> >>>
> >>> This is only called internally by the driver at s_stream() time, can
> >>> this happen ? Or rather won't you have a streamon call also when the
> >>> data pipe only is available ? In that case you would error out here
> >>
> >> This can happen if the source node is not found in the DT. In that case,
> >> there is no video pipe available, thus this whole function should be a
> >> no-op (csi2dc_vp_update) . If no vp, there is no vp update.
> >> Normall without a vp, there should be a dp (data pipe), but I haven't
> >> tested this and it's not supported in the driver.
> >> It doesn't make any sense to configure the vp registers below if the vp
> >> is not available.
> >> However, I shouldn't return an error since the vp is not mandatory for
> >> the function of the hardware. Just that the dp will be implemented at a
> >> later time (.... or never).
> >>
> >
> > I see, so the data pipe is still work in progress... I understand
> > bindings should allow for that to be later accepted so you cannot
> > mandate port@1 to be there all the times, but should the driver
> > instead refuse to operate if no port@1 is provided ?
> >
>
> It will not refuse to operate, but won't operate anything basically.
> And if I make it refuse to operate, it will violate the bindings, since
> port@1 is not mandatory

I don't think that's a problem. I would say the it would also be fine
to have port@1 mandatory as if it becomes optional in future once the
data-pipe is implemented, old DTS will still be compatible.

However I also think it would be fine for the driver to not support
all the options listed in the bindings. What's importante is that
anything that gets into the bindings does not break
retro-compatibility in case it gets extended.

To make a counter example, if your bindings define port@1 as optional
but you later make it mandatory for some reason, old dts without
port@1 won't work anymore and that's a problem. In this case if you
make it mandatory and later demote it to be optional, old DTS will all
have port@1 and will work in video-pipe mode while new ones can
optionally swtich to data-pipe by not providing port@1.

Anyway, not a big deal, I think what you have here is fine but I won't
bother too much about checking for if (!csi2dc->video_pipe) in the
driver as if I understood you correctly the driver cannot currently
be operated in data-pipe mode.

>
> > Out of curiosity what will the interaction model with the driver be in
> > data pipe mode ? There will be a video device but there won't be an
> > link to it, how is stream start/stop controlled ?
>
> My idea is that on data pipe, the csi2dc should register it's own video
> device and act basically as a dma engine entity that will use an
> external DMA controller to just write data to DRAM.
>
> It is useful if we do not want to convert the MIPI/IDI packets into
> pixels, but rather dump the to DRAM and have a piece of software further
> use them.
>
> However, it's not a clear use case about this functionality at this
> moment. One possibility is to be able to obtain stream meta-data from
> the MIPI / IDI interface, like for example synchronization data, to
> synchronize with an audio capture device.
>
> >
> >>>
> >>>> +             dev_err(csi2dc->dev, "video pipeline unavailable\n");
> >>>> +             return;
> >>>> +     }
> >>>> +
> >>>> +     vp = CSI2DC_VPCFG_DT(csi2dc->cur_fmt->dt) & CSI2DC_VPCFG_DT_MASK;
> >>>> +     vp |= CSI2DC_VPCFG_VC(csi2dc->vc) & CSI2DC_VPCFG_VC_MASK;
> >>>> +     vp &= ~CSI2DC_VPCFG_DE;
> >>>> +     vp |= CSI2DC_VPCFG_DM(CSI2DC_VPCFG_DM_DECODER8TO12);
> >>>> +     vp &= ~CSI2DC_VPCFG_DP2;
> >>>> +     vp &= ~CSI2DC_VPCFG_RMS;
> >>>> +     vp |= CSI2DC_VPCFG_PA;
> >>>> +
> >>>> +     csi2dc_writel(csi2dc, CSI2DC_VPCFG, vp);
> >>>> +     csi2dc_writel(csi2dc, CSI2DC_VPE, CSI2DC_VPE_ENABLE);
> >>>> +     csi2dc_writel(csi2dc, CSI2DC_PU, CSI2DC_PU_VP);
> >>>> +}
> >>>> +
> >>>> +static inline struct csi2dc_device *
> >>>> +csi2dc_sd_to_csi2dc_device(struct v4l2_subdev *csi2dc_sd)
> >>>> +{
> >>>> +     return container_of(csi2dc_sd, struct csi2dc_device, csi2dc_sd);
> >>>> +}
> >>>> +
> >>>> +static int csi2dc_enum_mbus_code(struct v4l2_subdev *csi2dc_sd,
> >>>> +                              struct v4l2_subdev_state *sd_state,
> >>>> +                              struct v4l2_subdev_mbus_code_enum *code)
> >>>> +{
> >>>> +     if (code->index >= ARRAY_SIZE(csi2dc_formats))
> >>>> +             return -EINVAL;
> >>>> +
> >>>> +     code->code = csi2dc_formats[code->index].mbus_code;
> >>>> +
> >>>> +     return 0;
> >>>> +}
> >>>> +
> >>>> +static int csi2dc_get_fmt(struct v4l2_subdev *csi2dc_sd,
> >>>> +                       struct v4l2_subdev_state *sd_state,
> >>>> +                       struct v4l2_subdev_format *format)
> >>>> +{
> >>>> +     struct csi2dc_device *csi2dc = csi2dc_sd_to_csi2dc_device(csi2dc_sd);
> >>>> +
> >>>> +     format->format = csi2dc->format;
> >>>> +
> >>>> +     return 0;
> >>>
> >>> You should support try formats by storing the format in the file
> >>> handle state in s_fmt and return it in case which == TRY
> >>>
> >>> Grep for v4l2_subdev_get_try_format() for usage examples
> >>
> >> I did that initially, but could not find any utility for it in my tests.
> >
> > I understand.. Have you run v4l2-compliance on this sudev ? Doesn't it
> > test try formats support ?
> >
> >> So I removed it.
> >> I will try to bring it back, but I have no idea how to test that the try
> >> format works fine or not
> >>
> >
> > I think also v4l2-ctl supports try formats.
> >
> > --try-subdev-fmt pad=<pad>,width=<w>,height=<h>,code=<code>,field=<f>,colorspace=<c>,
> >
> > I'm not sure if it allows you to read it back, but it's easy to hack
> > it out just to verify it.
> >
>
> Ok, I will try it
>
> >>>
> >>>> +}
> >>>> +
> >>>> +static int csi2dc_set_fmt(struct v4l2_subdev *csi2dc_sd,
> >>>> +                       struct v4l2_subdev_state *sd_state,
> >>>> +                       struct v4l2_subdev_format *req_fmt)
> >>>> +{
> >>>> +     struct csi2dc_device *csi2dc = csi2dc_sd_to_csi2dc_device(csi2dc_sd);
> >>>> +     const struct csi2dc_format *fmt;
> >>>> +     int i;
> >>>
> >>> unsigned
> >>>
> >>>> +
> >>>> +     for (i = 0; i < ARRAY_SIZE(csi2dc_formats);  i++) {
> >>>> +             fmt = &csi2dc_formats[i];
> >>>> +             if (req_fmt->format.code == fmt->mbus_code)
> >>>> +                     csi2dc->try_fmt = fmt;
> >>>
> >>> Shouldn't you break ?
> >>>
> >>>> +             fmt++;
> >>>> +     }
> >>>
> >>> And make this a simpler
> >>>
> >>>           for (i = 0; i < ARRAY_SIZE(csi2dc_formats); i++) {
> >>>                   if (req_fmt->format.code == csi2dc_formats[i].mbus_code)
> >>>                           break;
> >>>           }
> >>>
> >>>           if (i == ARRAY_SIZE(csi2dc_formats)
> >>>                   i = 0;
> >>>
> >>>> +
> >>>> +     /* in case we could not find the desired format, default to something */
> >>>> +     if (!csi2dc->try_fmt  ||
> >>>> +         req_fmt->format.code != csi2dc->try_fmt->mbus_code) {
> >>>> +             csi2dc->try_fmt = &csi2dc_formats[0];
> >>>> +
> >>>> +             dev_dbg(csi2dc->dev,
> >>>> +                     "CSI2DC unsupported format 0x%x, defaulting to 0x%x\n",
> >>>> +                     req_fmt->format.code, csi2dc_formats[0].mbus_code);
> >>>> +
> >>>> +             req_fmt->format.code = csi2dc_formats[0].mbus_code;
> >>>> +     }
> >>>> +
> >>>> +     req_fmt->format.colorspace = V4L2_COLORSPACE_SRGB;
> >>>> +     req_fmt->format.field = V4L2_FIELD_NONE;
> >>>> +
> >>>> +     /* save the format for later requests */
> >>>
> >>> You should support TRY formats
> >>>
> >>>> +     csi2dc->format = req_fmt->format;
> >>>> +
> >>>> +     /* if we are just trying, we are done */
> >>>> +     if (req_fmt->which == V4L2_SUBDEV_FORMAT_TRY)
> >>>> +             return 0;
> >>>> +
> >>>> +     csi2dc->cur_fmt = csi2dc->try_fmt;
> >>>
> >>>           csi2dc->cur_fmt = &csi2dc_format[i];
> >>>
> >>> So you can drop the try_fmt from the driver structure as it seems to
> >>> be used as a temporary variable here only.
> >>>
> >>>> +
> >>>> +     dev_dbg(csi2dc->dev, "new format set: 0x%x\n", req_fmt->format.code);
> >>>> +
> >>>> +     return 0;
> >>>> +}
> >>>> +
> >>>> +static int csi2dc_power(struct csi2dc_device *csi2dc, int on)
> >>>> +{
> >>>> +     int ret = 0;
> >>>> +
> >>>> +     if (on) {
> >>>> +             ret = clk_prepare_enable(csi2dc->pclk);
> >>>> +             if (ret) {
> >>>> +                     dev_err(csi2dc->dev, "failed to enable pclk: %d\n", ret);
> >>>> +                     return ret;
> >>>> +             }
> >>>> +
> >>>> +             ret = clk_prepare_enable(csi2dc->scck);
> >>>> +             if (ret)
> >>>> +                     dev_err(csi2dc->dev,
> >>>> +                             "failed to enable scck: %d\n", ret);
> >>>
> >>> Shouldn't you bail out here ?
> >>
> >> Initially this clock was not mandatory, but you are right, I should bail
> >> out.
> >>
> >>>
> >>>> +
> >>>> +             /* if powering up, deassert reset line */
> >>>> +             csi2dc_writel(csi2dc, CSI2DC_GCTLR, CSI2DC_GCTLR_SWRST);
> >>>> +     } else {
> >>>> +             clk_disable_unprepare(csi2dc->scck);
> >>>> +
> >>>> +             /* if powering down, assert reset line */
> >>>> +             csi2dc_writel(csi2dc, CSI2DC_GCTLR, !CSI2DC_GCTLR_SWRST);
> >>>
> >>> Isn't reverse order of activation better ?
> >>>
> >>>                   csi2dc_writel(..)
> >>>                   clk_disable_unprepare(..)
> >>>                   clk_disable_unprepare(..)
> >>>> +
> >>>> +             clk_disable_unprepare(csi2dc->pclk);
> >>>> +     }
> >>>> +
> >>>> +     return ret;
> >>>> +}
> >>>> +
> >>>> +static int csi2dc_s_stream(struct v4l2_subdev *csi2dc_sd, int enable)
> >>>> +{
> >>>> +     struct csi2dc_device *csi2dc = csi2dc_sd_to_csi2dc_device(csi2dc_sd);
> >>>> +     int ret;
> >>>> +
> >>>> +     if (enable) {
> >>>> +             ret = pm_runtime_resume_and_get(csi2dc->dev);
> >>>> +             if (ret < 0)
> >>>> +                     return ret;
> >>>> +             csi2dc_vp_update(csi2dc);
> >>>> +     } else {
> >>>> +             pm_runtime_put_sync(csi2dc->dev);
> >>>> +     }
> >>>> +
> >>>> +     return v4l2_subdev_call(csi2dc->input_sd, video, s_stream, enable);
> >>>
> >>> Should the remote subdev be started before and stopped after ?
> >>
> >> Do you mean s_power ?
> >>
> >
> > Nope, I meant the operation order.
> >
> >          if (enable) {
> >                  v4l2_subdev_call(...);
> >
> >                  pm_runtime_resume_and_get();
> >                  csi2dc_vp_update();
> >          } else {
> >                  pm_runtime_put_sync();
> >
> >                  v4l2_subdev_call();
> >          }
> >
> > However, my comment is clearly wrong, it should have been the
> > contrary. Sorry about this
> >
> > It's right to configure the interface and power if up -before-
> > starting the remote subdev, but I would stop it before powering it
> > down. Like in:
> >
> >          if (enable) {
> >                  pm_runtime_resume_and_get();
> >                  csi2dc_vp_update();
> >
> >                  v4l2_subdev_call(1);
> >          } else {
> >                  v4l2_subdev_call(0);
> >
> >                  pm_runtime_put_sync();
> >          }
> >
> > What do you think ? Stopping the remote before powering the interface
> > down ensures no data is being put on the bus while the interace is
> > powered off.
> >
>
> In this case it might not work like this. If I start the sensor
> streaming before the vp update , then, there will be frames received on
> video pipe update, which means that the csi2dc will not detect the phy
> STOP state reached, and it will fail initialization.
> I believe the csi2dc has to be started before the sensor's first frame
> such that the interface is prepared for receiving. The PHY must be in
> stop state for a certain amount of time.
> I will try to see if it works the other way around, to double check to
> make sure.
> But if it doesn't , then the VP must be configured while the whole
> pipeline is in stop state.
>

I agree, as I've said my first comment was wrong and the sensor has to
be started after the csi2dc. However in my last comment I was
suggesting to stop it before the csi2dc to avoid having data being
sent on the bus while the csi2dc gets powered down.

> >>>
> >>>> +}
> >>>> +
> >>>> +static const struct v4l2_subdev_pad_ops csi2dc_pad_ops = {
> >>>> +     .enum_mbus_code = csi2dc_enum_mbus_code,
> >>>> +     .set_fmt = csi2dc_set_fmt,
> >>>> +     .get_fmt = csi2dc_get_fmt,
> >>>> +};
> >>>> +
> >>>> +static const struct v4l2_subdev_video_ops csi2dc_video_ops = {
> >>>> +     .s_stream = csi2dc_s_stream,
> >>>> +};
> >>>> +
> >>>> +static const struct v4l2_subdev_ops csi2dc_subdev_ops = {
> >>>> +     .pad = &csi2dc_pad_ops,
> >>>> +     .video = &csi2dc_video_ops,
> >>>> +};
> >>>> +
> >>>> +static int csi2dc_get_mbus_config(struct csi2dc_device *csi2dc)
> >>>> +{
> >>>> +     struct v4l2_mbus_config mbus_config = { 0 };
> >>>> +     int ret;
> >>>> +
> >>>> +     ret = v4l2_subdev_call(csi2dc->input_sd, pad, get_mbus_config,
> >>>> +                            csi2dc->remote_pad, &mbus_config);
> >>>> +     if (ret == -ENOIOCTLCMD) {
> >>>> +             dev_dbg(csi2dc->dev,
> >>>> +                     "no remote mbus configuration available\n");
> >>>> +             goto csi2dc_get_mbus_config_defaults;
> >>>> +     }
> >>>> +
> >>>> +     if (ret) {
> >>>> +             dev_err(csi2dc->dev,
> >>>> +                     "failed to get remote mbus configuration\n");
> >>>> +             goto csi2dc_get_mbus_config_defaults;
> >>>> +     }
> >>>> +
> >>>> +     if (mbus_config.flags & V4L2_MBUS_CSI2_CHANNEL_0)
> >>>> +             csi2dc->vc = 0;
> >>>> +     else if (mbus_config.flags & V4L2_MBUS_CSI2_CHANNEL_1)
> >>>> +             csi2dc->vc = 1;
> >>>> +     else if (mbus_config.flags & V4L2_MBUS_CSI2_CHANNEL_2)
> >>>> +             csi2dc->vc = 2;
> >>>> +     else if (mbus_config.flags & V4L2_MBUS_CSI2_CHANNEL_3)
> >>>> +             csi2dc->vc = 3;
> >>>> +
> >>>> +     dev_dbg(csi2dc->dev, "subdev sending on channel %d\n", csi2dc->vc);
> >>>> +
> >>>> +     csi2dc->clk_gated = mbus_config.flags &
> >>>> +                             V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK;
> >>>
> >>> This should come from the default clock-noncontinuous property in the
> >>> endpoint. It is available in the mbus_configuration only to support
> >>> subdevs that can change it at runtime, and if that's the case it's ok,
> >>> but I think it should be in the endpoint.
> >>
> >> I do not completely understand your point. In a previous version which
> >> you reviewed, I had this as a DT property (so in the endpoint ?), and
> >> now I converted it to a get_mbus_config flag get operation.
> >
> > I re-read the conversation and I think you're right.
> >
> >> It's not the right way to do it ?
> >> How should it be specified in the endpoint ?
> >>
> >
> > There's a default property 'clock-noncontinuous' which gets parsed by
> > v4l2_fwnode_endpoint_parse() and reported to drivers through the
> > V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK and V4L2_MBUS_CSI2_CONTINUOUS_CLOCK
> > flags. In your case, as you fetch it at run time it's not required if
> > not to initialize a default according to the property presence in DT.
> >
> > Up to you, what you have here it's fine!
> >
>
> Speaking of this, I have a parallel sensor that does not implement
> get_mbus_config .
>
> I tried to implement this in the sensor driver, to see if the csi2dc
> receives correct information from the sensor subdev (to see if it's
> parallel or serial). And it works fine.
> I sent a patch for this, but Sakari says that the csi2dc can obtain all
> this information from DT, and I guess he is right. What would be the
> correct way to do it then ?

Good question, and probably Sakari is in a better position than me to
set a direction.

My take is that get_mbus_config should be used to retrieve from the remote
subdevice configuration parameters that can change at runtime, or to
express properties that cannot be defined in bindings as they're not
strictly media bus configuration parameters (like the CSI-2 VC, as
you're doing here). To give you another example, I used
get_mbus_config to retrieve at run-time the number of CSI-2 data lanes
currently in use, as I have a transmitter that if configured to output
low resolution data needs to reduce the number of data lanes to stay
in the D-PHY defined clock frequency lower bound (I think that's the
use case that lead to resurect get_mbus_config() as a pad operation,
as in the past there was a g_mbus_config() video operation that got
deprecated along with the soc_camera framework).

The noncontinuous clock option cannot be changed at runtime afaict and
it's indeed an mbus configuration parameter for which a standard
DT-property is defined so it makes sense to have it in DTS. The clear
win is that your receiver driver can operate with sensor drivers not
instrumented with get_mbus_config() as it will get the info from DTS.

In your case you require get_mbus_config() for VC handling, something
everyone hopes is temporary as long as the in-development multiplexed
stream support has not landed, but if the operation is not implemented
you fallback to a default which is indeed the best option for VC, but
for clock-continuous you could avoid that by using the standard DTS
mechanism and retain compatibility with subdevices that do not
implement get_mbus_config.

I know in v3 you have been suggested to use get_mbus_config and I'm
sorry if it drove you off-road, but I think the best option here is:

- get the clock continuous property from DTS
- as you need get_mbus_config() for VC, inspect if the remote
  reports an option for clock continuous and use it if that's the case
- In case the subdev does not implement get_mbus_config() or does not
  report clock information use the value parsed from DTS instead of an
  arbitrary default

This should allow you to operate with sensor drivers not instrumented
with get_mbus_config() (as long as they send data on the VC you use as
a defaul fallback :)

>
> Could you comment on this patch please :
>
> https://lore.kernel.org/linux-media/YYJDcIiBXo%2FXlKCX@paasikivi.fi.intel.com/T/#m990b903ed6d56c3c34232c54c251490ad33e92c9
>

Afaict all the mbus configuration for a parallel bus can be fully
described in DTS, and for the above reasons of being compatible with
most subdev drivers I would fetch it from there.

>
> Thanks again for reviewing !
>

You're welcome!

> >>>
> >>> Speaking of remote subdevs, is there any driver available for IDI
> >>> transmitters ?
> >>
> >> I am not aware of any at the moment
> >>>
> >>>> +
> >>>> +     dev_dbg(csi2dc->dev, "%s clock\n",
> >>>> +             csi2dc->clk_gated ? "gated" : "free running");
> >>>> +
> >>>> +     return 0;
> >>>> +
> >>>> +csi2dc_get_mbus_config_defaults:
> >>>> +     csi2dc->vc = 0; /* Virtual ID 0 by default */
> >>>> +     csi2dc->clk_gated = false; /* Free running clock by default */
> >>>> +
> >>>> +     return 0;
> >>>> +}
> >>>> +
> >>>> +static int csi2dc_async_bound(struct v4l2_async_notifier *notifier,
> >>>> +                           struct v4l2_subdev *subdev,
> >>>> +                           struct v4l2_async_subdev *asd)
> >>>> +{
> >>>> +     struct csi2dc_device *csi2dc = container_of(notifier,
> >>>> +                                             struct csi2dc_device, notifier);
> >>>> +     int pad;
> >>>> +     int ret;
> >>>> +
> >>>> +     csi2dc->input_sd = subdev;
> >>>> +
> >>>> +     pad = media_entity_get_fwnode_pad(&subdev->entity,
> >>>
> >>> You can use 'ret'
> >>
> >> I can, but it is weird to do remote_pad = ret ...
> >>
> >> May bring confusion, don't you agree ?
> >>
> >
> > Up to you, it's a small detail :)
> >
> > Thanks!
> >     j
> >
> >>>
> >>>> +                                       asd->match.fwnode,
> >>>> +                                       MEDIA_PAD_FL_SOURCE);
> >>>> +     if (pad < 0) {
> >>>> +             dev_err(csi2dc->dev, "Failed to find pad for %s\n",
> >>>> +                     subdev->name);
> >>>> +             return pad;
> >>>> +     }
> >>>> +
> >>>> +     csi2dc->remote_pad = pad;
> >>>> +
> >>>> +     csi2dc_get_mbus_config(csi2dc);
> >>>
> >>> Ideally, as this is not fatal, you could move this at s_stream time to
> >>> fetch the most up-to-date configuration
> >>>
> >>>> +
> >>>> +     ret = media_create_pad_link(&csi2dc->input_sd->entity,
> >>>> +                                 csi2dc->remote_pad,
> >>>> +                                 &csi2dc->csi2dc_sd.entity, 0,
> >>>> +                                 MEDIA_LNK_FL_ENABLED);
> >>>> +     if (ret < 0) {
> >>>
> >>>           if (ret)
> >>>
> >>>> +             dev_err(csi2dc->dev,
> >>>> +                     "Failed to create pad link: %s to %s\n",
> >>>> +                     csi2dc->input_sd->entity.name,
> >>>> +                     csi2dc->csi2dc_sd.entity.name);
> >>>> +             return ret;
> >>>> +     }
> >>>> +
> >>>> +     dev_dbg(csi2dc->dev, "link with %s pad: %d\n",
> >>>> +             csi2dc->input_sd->name, csi2dc->remote_pad);
> >>>> +
> >>>> +     ret = pm_runtime_resume_and_get(csi2dc->dev);
> >>>> +     if (ret < 0)
> >>>> +             return ret;
> >>>> +
> >>>> +     csi2dc_writel(csi2dc, CSI2DC_GCFG,
> >>>> +                   (SAMA7G5_HLC & CSI2DC_GCFG_HLC_MASK) |
> >>>> +                   (csi2dc->clk_gated ? 0 : CSI2DC_GCFG_MIPIFRN));
> >>>> +
> >>>> +     csi2dc_writel(csi2dc, CSI2DC_VPCOL,
> >>>> +                   CSI2DC_VPCOL_COL(0xFFF) & CSI2DC_VPCOL_COL_MASK);
> >>>> +     csi2dc_writel(csi2dc, CSI2DC_VPROW,
> >>>> +                   CSI2DC_VPROW_ROW(0xFFF) & CSI2DC_VPROW_ROW_MASK);
> >>>> +
> >>>> +     pm_runtime_put_sync(csi2dc->dev);
> >>>
> >>> I would really move access to the HW to s_stream time if possible
> >>>
> >>>> +
> >>>> +     return ret;
> >>>> +}
> >>>> +
> >>>> +static const struct v4l2_async_notifier_operations csi2dc_async_ops = {
> >>>> +     .bound = csi2dc_async_bound,
> >>>> +};
> >>>> +
> >>>> +static void csi2dc_cleanup_notifier(struct csi2dc_device *csi2dc)
> >>>> +{
> >>>> +     v4l2_async_notifier_unregister(&csi2dc->notifier);
> >>>> +     v4l2_async_notifier_cleanup(&csi2dc->notifier);
> >>>> +}
> >>>> +
> >>>> +static int csi2dc_prepare_notifier(struct csi2dc_device *csi2dc,
> >>>> +                                struct device_node *input_node)
> >>>> +{
> >>>> +     int ret = 0;
> >>>> +
> >>>> +     v4l2_async_notifier_init(&csi2dc->notifier);
> >>>> +
> >>>> +     csi2dc->asd = v4l2_async_notifier_add_fwnode_remote_subdev
> >>>
> >>> do you need asd in the driver structure ?
> >>>
> >>>> +                     (&csi2dc->notifier, of_fwnode_handle(input_node),
> >>>> +                     struct v4l2_async_subdev);
> >>>> +
> >>>> +     of_node_put(input_node);
> >>>> +
> >>>> +     if (IS_ERR(csi2dc->asd)) {
> >>>> +             ret = PTR_ERR(csi2dc->asd);
> >>>> +             dev_err(csi2dc->dev,
> >>>> +                     "failed to add async notifier for node %pOF: %d\n",
> >>>> +                     input_node, ret);
> >>>> +             v4l2_async_notifier_cleanup(&csi2dc->notifier);
> >>>> +             return ret;
> >>>> +     }
> >>>> +
> >>>> +     csi2dc->notifier.ops = &csi2dc_async_ops;
> >>>> +
> >>>> +     ret = v4l2_async_subdev_notifier_register(&csi2dc->csi2dc_sd,
> >>>> +                                               &csi2dc->notifier);
> >>>> +
> >>>> +     if (ret) {
> >>>> +             dev_err(csi2dc->dev, "fail to register async notifier: %d\n",
> >>>> +                     ret);
> >>>> +             v4l2_async_notifier_cleanup(&csi2dc->notifier);
> >>>> +     }
> >>>> +
> >>>> +     return ret;
> >>>> +}
> >>>> +
> >>>> +static int csi2dc_of_parse(struct csi2dc_device *csi2dc,
> >>>> +                        struct device_node *of_node)
> >>>> +{
> >>>> +     struct device_node *input_node, *output_node;
> >>>> +     struct v4l2_fwnode_endpoint input_endpoint = { 0 },
> >>>> +                                 output_endpoint = { 0 };
> >>>> +     int ret;
> >>>> +
> >>>> +     output_endpoint.bus_type = V4L2_MBUS_PARALLEL;
> >>>> +
> >>>> +     input_node = of_graph_get_next_endpoint(of_node, NULL);
> >>>> +
> >>>> +     if (!input_node) {
> >>>> +             dev_err(csi2dc->dev,
> >>>> +                     "missing port node at %pOF, input node is mandatory.\n",
> >>>> +                     of_node);
> >>>> +             return -EINVAL;
> >>>> +     }
> >>>> +
> >>>> +     ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(input_node),
> >>>> +                                      &input_endpoint);
> >>>> +
> >>>> +     if (ret) {
> >>>                   of_node_put(input_node);
> >>>
> >>>> +             dev_err(csi2dc->dev, "endpoint not defined at %pOF\n", of_node);
> >>>> +             return ret;
> >>>> +     }
> >>>> +
> >>>> +     output_node = of_graph_get_next_endpoint(of_node, input_node);
> >>>> +
> >>>> +     if (output_node)
> >>>> +             ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(output_node),
> >>>> +                                              &output_endpoint);
> >>>
> >>>           of_node_put(output_node);
> >>>> +
> >>>> +     if (!output_node || ret) {
> >>>> +             dev_info(csi2dc->dev,
> >>>> +                      "missing output node at %pOF, data pipe available only.\n",
> >>>> +                      of_node);
> >>>> +     } else {
> >>>> +             csi2dc->video_pipe = true;
> >>>> +
> >>>> +             dev_dbg(csi2dc->dev, "block %pOF %d.%d->%d.%d video pipeline\n",
> >>>> +                     of_node, input_endpoint.base.port,
> >>>> +                     input_endpoint.base.id, output_endpoint.base.port,
> >>>> +                     output_endpoint.base.id);
> >>>> +     }
> >>>> +
> >>>> +     of_node_put(output_node);
> >>>
> >>> Drop this if you put it above
> >>>
> >>>> +     of_node_put(input_node);
> >>>
> >>> Should you put input_node before passing it to the function ?
> >>>> +
> >>>> +     /* prepare async notifier for subdevice completion */
> >>>> +     return csi2dc_prepare_notifier(csi2dc, input_node);
> >>>> +}
> >>>> +
> >>>> +static int csi2dc_probe(struct platform_device *pdev)
> >>>> +{
> >>>> +     struct device *dev = &pdev->dev;
> >>>> +     struct csi2dc_device *csi2dc;
> >>>> +     struct resource *res = NULL;
> >>>> +     int ret = 0;
> >>>> +     u32 ver;
> >>>> +
> >>>> +     csi2dc = devm_kzalloc(dev, sizeof(*csi2dc), GFP_KERNEL);
> >>>> +     if (!csi2dc)
> >>>> +             return -ENOMEM;
> >>>> +
> >>>> +     csi2dc->dev = dev;
> >>>> +
> >>>> +     res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> >>>> +
> >>>> +     csi2dc->base = devm_ioremap_resource(dev, res);
> >>>
> >>> Should devm_platform_ioremap_resource(pdev, 0) be used here ?
> >>>
> >>>> +     if (IS_ERR(csi2dc->base)) {
> >>>> +             dev_err(dev, "base address not set\n");
> >>>> +             return PTR_ERR(csi2dc->base);
> >>>> +     }
> >>>> +
> >>>> +     csi2dc->pclk = devm_clk_get(dev, "pclk");
> >>>> +     if (IS_ERR(csi2dc->pclk)) {
> >>>> +             ret = PTR_ERR(csi2dc->pclk);
> >>>> +             dev_err(dev, "failed to get pclk: %d\n", ret);
> >>>> +             return ret;
> >>>> +     }
> >>>> +
> >>>> +     csi2dc->scck = devm_clk_get(dev, "scck");
> >>>> +     if (IS_ERR(csi2dc->scck)) {
> >>>> +             ret = PTR_ERR(csi2dc->scck);
> >>>> +             dev_err(dev, "failed to get scck: %d\n", ret);
> >>>> +             return ret;
> >>>> +     }
> >>>> +
> >>>> +     v4l2_subdev_init(&csi2dc->csi2dc_sd, &csi2dc_subdev_ops);
> >>>> +
> >>>> +     csi2dc->csi2dc_sd.owner = THIS_MODULE;
> >>>> +     csi2dc->csi2dc_sd.dev = dev;
> >>>> +     snprintf(csi2dc->csi2dc_sd.name, sizeof(csi2dc->csi2dc_sd.name),
> >>>> +              "csi2dc");
> >>>> +
> >>>> +     csi2dc->csi2dc_sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> >>>> +     csi2dc->csi2dc_sd.entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
> >>>> +     v4l2_set_subdevdata(&csi2dc->csi2dc_sd, pdev);
> >>>
> >>> Not used it seems
> >>>
> >>>> +
> >>>> +     platform_set_drvdata(pdev, csi2dc);
> >>>> +
> >>>> +     ret = csi2dc_of_parse(csi2dc, dev->of_node);
> >>>> +     if (ret)
> >>>> +             goto csi2dc_probe_cleanup_entity;
> >>>> +
> >>>> +     csi2dc->pads[CSI2DC_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
> >>>> +     if (csi2dc->video_pipe)
> >>>> +             csi2dc->pads[CSI2DC_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
> >>>> +
> >>>> +     ret = media_entity_pads_init(&csi2dc->csi2dc_sd.entity,
> >>>> +                                  csi2dc->video_pipe ? CSI2DC_PADS_NUM : 1,
> >>>> +                                  csi2dc->pads);
> >>>> +     if (ret < 0) {
> >>>> +             dev_err(dev, "media entity init failed\n");
> >>>> +             goto csi2dc_probe_cleanup_entity;
> >>>
> >>> Should you also clean up the notifier in the error path ?
> >>>
> >>>> +     }
> >>>> +
> >>>> +     /* turn power on to validate capabilities */
> >>>> +     ret = csi2dc_power(csi2dc, true);
> >>>> +     if (ret < 0)
> >>>> +             goto csi2dc_probe_cleanup_entity;
> >>>> +
> >>>> +     pm_runtime_set_active(dev);
> >>>> +     pm_runtime_enable(dev);
> >>>> +     ver = csi2dc_readl(csi2dc, CSI2DC_VERSION);
> >>>> +     pm_request_idle(dev);
> >>>> +
> >>>> +     /*
> >>>> +      * we must register the subdev after PM runtime has been requested,
> >>>> +      * otherwise we might bound immediately and request pm_runtime_resume
> >>>> +      * before runtime_enable.
> >>>> +      */
> >>>> +     ret = v4l2_async_register_subdev(&csi2dc->csi2dc_sd);
> >>>> +     if (ret) {
> >>>> +             dev_err(csi2dc->dev, "failed to register the subdevice\n");
> >>>> +             goto csi2dc_probe_cleanup_entity;
> >>>> +     }
> >>>> +
> >>>> +     dev_info(dev, "Microchip CSI2DC version %x\n", ver);
> >>>> +
> >>>> +     return 0;
> >>>> +
> >>>> +csi2dc_probe_cleanup_entity:
> >>>> +     media_entity_cleanup(&csi2dc->csi2dc_sd.entity);
> >>>> +
> >>>> +     return ret;
> >>>> +}
> >>>> +
> >>>> +static int csi2dc_remove(struct platform_device *pdev)
> >>>> +{
> >>>> +     struct csi2dc_device *csi2dc = platform_get_drvdata(pdev);
> >>>> +
> >>>> +     pm_runtime_disable(&pdev->dev);
> >>>> +
> >>>> +     v4l2_async_unregister_subdev(&csi2dc->csi2dc_sd);
> >>>> +     csi2dc_cleanup_notifier(csi2dc);
> >>>> +     media_entity_cleanup(&csi2dc->csi2dc_sd.entity);
> >>>> +
> >>>> +     return 0;
> >>>> +}
> >>>> +
> >>>> +static int __maybe_unused csi2dc_runtime_suspend(struct device *dev)
> >>>> +{
> >>>> +     struct csi2dc_device *csi2dc = dev_get_drvdata(dev);
> >>>> +
> >>>> +     return csi2dc_power(csi2dc, false);
> >>>> +}
> >>>> +
> >>>> +static int __maybe_unused csi2dc_runtime_resume(struct device *dev)
> >>>> +{
> >>>> +     struct csi2dc_device *csi2dc = dev_get_drvdata(dev);
> >>>> +
> >>>> +     return csi2dc_power(csi2dc, true);
> >>>> +}
> >>>> +
> >>>> +static const struct dev_pm_ops csi2dc_dev_pm_ops = {
> >>>> +     SET_RUNTIME_PM_OPS(csi2dc_runtime_suspend, csi2dc_runtime_resume, NULL)
> >>>> +};
> >>>> +
> >>>> +static const struct of_device_id csi2dc_of_match[] = {
> >>>> +     { .compatible = "microchip,sama7g5-csi2dc" },
> >>>> +     { }
> >>>> +};
> >>>> +
> >>>> +MODULE_DEVICE_TABLE(of, csi2dc_of_match);
> >>>> +
> >>>> +static struct platform_driver csi2dc_driver = {
> >>>> +     .probe  = csi2dc_probe,
> >>>> +     .remove = csi2dc_remove,
> >>>> +     .driver = {
> >>>> +             .name =                 "microchip-csi2dc",
> >>>> +             .pm =                   &csi2dc_dev_pm_ops,
> >>>> +             .of_match_table =       of_match_ptr(csi2dc_of_match),
> >>>> +     },
> >>>> +};
> >>>> +
> >>>> +module_platform_driver(csi2dc_driver);
> >>>> +
> >>>> +MODULE_AUTHOR("Eugen Hristev <eugen.hristev@microchip.com>");
> >>>> +MODULE_DESCRIPTION("Microchip CSI2 Demux Controller driver");
> >>>> +MODULE_LICENSE("GPL v2");
> >>>> --
> >>>> 2.25.1
> >>>>
> >>
>
