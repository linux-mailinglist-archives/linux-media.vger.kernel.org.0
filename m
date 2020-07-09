Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E77D219A16
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2020 09:36:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726196AbgGIHgK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Jul 2020 03:36:10 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:57703 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726183AbgGIHgJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Jul 2020 03:36:09 -0400
Received: from bootlin.com (abordeaux-654-1-227-58.w90-55.abo.wanadoo.fr [90.55.126.58])
        (Authenticated sender: maxime.chevallier@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 0782C24000B;
        Thu,  9 Jul 2020 07:35:52 +0000 (UTC)
Date:   Thu, 9 Jul 2020 09:35:46 +0200
From:   Maxime Chevallier <maxime.chevallier@bootlin.com>
To:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-media <linux-media@vger.kernel.org>
Subject: Re: [PATCH v2 2/3] media: rockchip: Introduce driver for Rockhip's
 camera interface
Message-ID: <20200709093546.0f3d5d24@bootlin.com>
In-Reply-To: <CAAEAJfBWM1sdJFijsCrSVg-rGa9=hjszaSyv+E6evfK2dOJzmw@mail.gmail.com>
References: <20200529130405.929429-1-maxime.chevallier@bootlin.com>
        <20200529130405.929429-3-maxime.chevallier@bootlin.com>
        <CAAEAJfBWM1sdJFijsCrSVg-rGa9=hjszaSyv+E6evfK2dOJzmw@mail.gmail.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ezequiel,

Sorry for the late reply, some answers to your very useful comments
below :)

On Sun, 31 May 2020 10:40:14 -0300
Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> wrote:

>Hi Maxime,
>
>Thanks for posting this patch. I think you can still improve it,
>but it's a neat first try! :-)
>
>On Fri, 29 May 2020 at 10:05, Maxime Chevallier
><maxime.chevallier@bootlin.com> wrote:
>>
>> Introduce a driver for the camera interface on some Rockchip platforms.
>>
>> This controller supports CSI2, Parallel and BT656 interfaces, but for
>> now only the parallel interface could be tested, hence it's the only one
>> that's supported in the first version of this driver.
>>  
>
>I'm confused, you mention parallel as the only tested interface,
>but the cover letters mentions PAL. Doesn't PAL mean BT.656
>or am I completely lost?

No you are correct, this is a misunderstanding on my part about the
various formats and naming schemes.

The main point I wanted to outline is that the hardware supports a CSI2
interface, which this version of the driver doesn't implement.

>(I am not super familiar with parallel sensors).
>
>> This controller can be fond on PX30, RK1808, RK3128, RK3288 and RK3288,
>> but for now it's only be tested on PX30.
>>  
>
>My RK3288 and RK3326 (i.e. PX30) refer to this IP block as "Video
>Input interface".
>I am wondering if it won't be clearer for developers / users if we
>rename the driver
>to rockchip-vip (and of course s/cif/vip and s/CIF/VIP).

After looking into the datasheets for these SoCs, it's clear that the
denomination should indeed be "VIP" and not "CIF", thanks !

>> Most of this driver was written follwing the BSP driver from rockchip,
>> removing the parts that either didn't fit correctly the guidelines, or
>> that couldn't be tested.
>>
>> This basic version doesn't support cropping nor scaling, and is only
>> designed with one sensor being attached to it a any time.
>>
>> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
>> ---
>>
>> Changes since V1 :
>>
>>  - Convert to the bulk APIs for clocks and resets  
>
>Note that the bulk API clock conversion was not
>properly done.
>
>>  - remove useless references to priv data
>>  - Move around some init functions at probe time
>>  - Upate some helpers to more suitable ones
>>
>> Here is the output from v4l2-compliance. There are no fails in the final
>> summary, but there is one in the output that I didn't catch previously.
>>
>> Still, here's the V2 in the meantime, if you have any further reviews
>> ompliance SHA: not available, 64 bits
>>
>> Compliance test for rkcif device /dev/video0:
>>
>> Driver Info:
>>         Driver name      : rkcif
>>         Card type        : rkcif
>>         Bus info         : platform:ff490000.cif
>>         Driver version   : 5.7.0
>>         Capabilities     : 0x84201000
>>                 Video Capture Multiplanar
>>                 Streaming
>>                 Extended Pix Format
>>                 Device Capabilities
>>         Device Caps      : 0x04201000
>>                 Video Capture Multiplanar
>>                 Streaming
>>                 Extended Pix Format
>> Media Driver Info:
>>         Driver name      : rkcif
>>         Model            : rkcif
>>         Serial           :
>>         Bus info         :
>>         Media version    : 5.7.0
>>         Hardware revision: 0x00000000 (0)
>>         Driver version   : 5.7.0
>> Interface Info:
>>         ID               : 0x03000002
>>         Type             : V4L Video
>> Entity Info:
>>         ID               : 0x00000001 (1)
>>         Name             : video_rkcif
>>         Function         : V4L2 I/O
>>         Pad 0x01000004   : 0: Sink
>>           Link 0x02000007: from remote pad 0x1000006 of entity 'tw9900 2-0044': Data, Enabled
>>
>> Required ioctls:
>>         test MC information (see 'Media Driver Info' above): OK
>>         test VIDIOC_QUERYCAP: OK
>>
>> Allow for multiple opens:
>>         test second /dev/video0 open: OK
>>         test VIDIOC_QUERYCAP: OK
>>         test VIDIOC_G/S_PRIORITY: OK
>>         test for unlimited opens: OK
>>
>> Debug ioctls:
>>         test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>>         test VIDIOC_LOG_STATUS: OK (Not Supported)
>>
>> Input ioctls:
>>         test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>         test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>         test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>         test VIDIOC_G/S/ENUMINPUT: OK
>>         test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>         Inputs: 1 Audio Inputs: 0 Tuners: 0
>>
>> Output ioctls:
>>         test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>         test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>         test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>         test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>         Outputs: 0 Audio Outputs: 0 Modulators: 0
>>
>> Input/Output configuration ioctls:
>>         test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>         test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>         test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>         test VIDIOC_G/S_EDID: OK (Not Supported)
>>
>> Control ioctls (Input 0):
>>         test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>>         test VIDIOC_QUERYCTRL: OK
>>         test VIDIOC_G/S_CTRL: OK
>>         test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>>         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>>         test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>         Standard Controls: 0 Private Controls: 0
>>
>> Format ioctls (Input 0):
>>         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>>         test VIDIOC_G/S_PARM: OK (Not Supported)
>>         test VIDIOC_G_FBUF: OK (Not Supported)
>>         test VIDIOC_G_FMT: OK
>>         test VIDIOC_TRY_FMT: OK
>>         test VIDIOC_S_FMT: OK
>>         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>         test Cropping: OK (Not Supported)
>>         test Composing: OK (Not Supported)
>>                 fail: v4l2-test-formats.cpp(1772): node->can_scale && node->frmsizes_count[v4l_format_g_pixelformat(&cur)]
>>         test Scaling: OK
>>
>> Codec ioctls (Input 0):
>>         test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>         test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>
>> Buffer ioctls (Input 0):
>>         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>>         test VIDIOC_EXPBUF: OK
>>         test Requests: OK (Not Supported)
>>
>> Total for rkcif device /dev/video0: 45, Succeeded: 45, Failed: 0, Warnings: 0
>>
>>  drivers/media/platform/Kconfig                |   13 +
>>  drivers/media/platform/Makefile               |    1 +
>>  drivers/media/platform/rockchip/cif/Makefile  |    3 +
>>  drivers/media/platform/rockchip/cif/capture.c | 1170 +++++++++++++++++
>>  drivers/media/platform/rockchip/cif/dev.c     |  358 +++++
>>  drivers/media/platform/rockchip/cif/dev.h     |  213 +++
>>  drivers/media/platform/rockchip/cif/regs.h    |  256 ++++
>>  7 files changed, 2014 insertions(+)
>>  create mode 100644 drivers/media/platform/rockchip/cif/Makefile
>>  create mode 100644 drivers/media/platform/rockchip/cif/capture.c
>>  create mode 100644 drivers/media/platform/rockchip/cif/dev.c
>>  create mode 100644 drivers/media/platform/rockchip/cif/dev.h
>>  create mode 100644 drivers/media/platform/rockchip/cif/regs.h
>>
>> diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
>> index e01bbb9dd1c1..d4ec5e36bca7 100644
>> --- a/drivers/media/platform/Kconfig
>> +++ b/drivers/media/platform/Kconfig
>> @@ -460,6 +460,19 @@ config VIDEO_ROCKCHIP_RGA
>>
>>           To compile this driver as a module choose m here.
>>
>> +config VIDEO_ROCKCHIP_CIF
>> +       tristate "Rockchip Camera Interface"
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
>>  config VIDEO_TI_VPE
>>         tristate "TI VPE (Video Processing Engine) driver"
>>         depends on VIDEO_DEV && VIDEO_V4L2
>> diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/Makefile
>> index d13db96e3015..67e7ac034be1 100644
>> --- a/drivers/media/platform/Makefile
>> +++ b/drivers/media/platform/Makefile
>> @@ -68,6 +68,7 @@ obj-$(CONFIG_VIDEO_RENESAS_JPU)               += rcar_jpu.o
>>  obj-$(CONFIG_VIDEO_RENESAS_VSP1)       += vsp1/
>>
>>  obj-$(CONFIG_VIDEO_ROCKCHIP_RGA)       += rockchip/rga/
>> +obj-$(CONFIG_VIDEO_ROCKCHIP_CIF)       += rockchip/cif/
>>
>>  obj-y  += omap/
>>
>> diff --git a/drivers/media/platform/rockchip/cif/Makefile b/drivers/media/platform/rockchip/cif/Makefile
>> new file mode 100644
>> index 000000000000..727990824316
>> --- /dev/null
>> +++ b/drivers/media/platform/rockchip/cif/Makefile
>> @@ -0,0 +1,3 @@
>> +# SPDX-License-Identifier: GPL-2.0
>> +obj-$(CONFIG_VIDEO_ROCKCHIP_CIF) += video_rkcif.o
>> +video_rkcif-objs += dev.o capture.o
>> diff --git a/drivers/media/platform/rockchip/cif/capture.c b/drivers/media/platform/rockchip/cif/capture.c
>> new file mode 100644
>> index 000000000000..adab6704129f
>> --- /dev/null
>> +++ b/drivers/media/platform/rockchip/cif/capture.c
>> @@ -0,0 +1,1170 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Rockchip CIF Driver
>> + *
>> + * Copyright (C) 2018 Rockchip Electronics Co., Ltd.
>> + * Copyright (C) 2020 Maxime Chevallier <maxime.chevallier@bootlin.com>
>> + */
>> +
>> +#include <linux/delay.h>
>> +#include <linux/pm_runtime.h>
>> +#include <linux/reset.h>
>> +#include <media/v4l2-common.h>
>> +#include <media/v4l2-event.h>
>> +#include <media/v4l2-fh.h>
>> +#include <media/v4l2-fwnode.h>
>> +#include <media/v4l2-ioctl.h>
>> +#include <media/v4l2-mc.h>
>> +#include <media/v4l2-subdev.h>
>> +#include <media/videobuf2-dma-contig.h>
>> +
>> +#include "dev.h"
>> +#include "regs.h"
>> +
>> +#define CIF_REQ_BUFS_MIN       1
>> +#define CIF_MIN_WIDTH          64
>> +#define CIF_MIN_HEIGHT         64
>> +#define CIF_MAX_WIDTH          8192
>> +#define CIF_MAX_HEIGHT         8192
>> +
>> +#define RKCIF_PLANE_Y                  0
>> +#define RKCIF_PLANE_CBCR               1
>> +
>> +#define CIF_FETCH_Y_LAST_LINE(VAL) ((VAL) & 0x1fff)
>> +/* Check if swap y and c in bt1120 mode */
>> +#define CIF_FETCH_IS_Y_FIRST(VAL) ((VAL) & 0xf)
>> +
>> +/* Get xsubs and ysubs for fourcc formats
>> + *
>> + * @xsubs: horizontal color samples in a 4*4 matrix, for yuv
>> + * @ysubs: vertical color samples in a 4*4 matrix, for yuv
>> + */
>> +static int fcc_xysubs(u32 fcc, u32 *xsubs, u32 *ysubs)  
>
>You should avoid doing this math in the driver,
>and instead use the nice core helpers
>v4l2_fill_pixfmt_mp and v4l2_fill_pixfmt.

Thanks for the pointer, I didn't know about this helper. I'll add that !

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
>> +static const struct cif_output_fmt out_fmts[] = {
>> +       {
>> +               .fourcc = V4L2_PIX_FMT_NV16,
>> +               .cplanes = 2,
>> +               .mplanes = 1,  
>
>Only mplanes = 1 formats are supported, please
>drop it here, and drop any handling due to mplanes > 1.

Yes you're correct, I'll drop that for now.

>> +               .fmt_val = YUV_OUTPUT_422 | UV_STORAGE_ORDER_UVUV,
>> +               .bpp = { 8, 16 },
>> +       }, {
>> +               .fourcc = V4L2_PIX_FMT_NV61,
>> +               .fmt_val = YUV_OUTPUT_422 | UV_STORAGE_ORDER_VUVU,
>> +               .cplanes = 2,
>> +               .mplanes = 1,
>> +               .bpp = { 8, 16 },
>> +       },
>> +       {
>> +               .fourcc = V4L2_PIX_FMT_NV12,
>> +               .fmt_val = YUV_OUTPUT_420 | UV_STORAGE_ORDER_UVUV,
>> +               .cplanes = 2,
>> +               .mplanes = 1,
>> +               .bpp = { 8, 16 },
>> +               .mbus = MEDIA_BUS_FMT_UYVY8_2X8,
>> +       },
>> +       {
>> +               .fourcc = V4L2_PIX_FMT_NV21,
>> +               .fmt_val = YUV_OUTPUT_420 | UV_STORAGE_ORDER_VUVU,
>> +               .cplanes = 2,
>> +               .mplanes = 1,
>> +               .bpp = { 8, 16 },
>> +       }, {
>> +               .fourcc = V4L2_PIX_FMT_RGB24,
>> +               .cplanes = 1,
>> +               .mplanes = 1,
>> +               .bpp = { 24 },
>> +       }, {
>> +               .fourcc = V4L2_PIX_FMT_RGB565,
>> +               .cplanes = 1,
>> +               .mplanes = 1,
>> +               .bpp = { 16 },
>> +       }, {
>> +               .fourcc = V4L2_PIX_FMT_BGR666,
>> +               .cplanes = 1,
>> +               .mplanes = 1,
>> +               .bpp = { 18 },
>> +       }, {
>> +               .fourcc = V4L2_PIX_FMT_SRGGB8,
>> +               .cplanes = 1,
>> +               .mplanes = 1,
>> +               .bpp = { 8 },
>> +       }, {
>> +               .fourcc = V4L2_PIX_FMT_SGRBG8,  
>
>That is odd: how does the driver distinguish
>V4L2_PIX_FMT_SGRBG8 from V4L2_PIX_FMT_SRGGB8?

Hmm I don't really know TBH, I'm not super familiar yet with all the
specific formats, and this was taken maybe a bit too "raw" from the
original BSP driver this is based on...

>> +               .cplanes = 1,
>> +               .mplanes = 1,
>> +               .bpp = { 8 },
>> +       }, {
>> +               .fourcc = V4L2_PIX_FMT_SGBRG8,
>> +               .cplanes = 1,
>> +               .mplanes = 1,
>> +               .bpp = { 8 },
>> +       }, {
>> +               .fourcc = V4L2_PIX_FMT_SBGGR8,
>> +               .cplanes = 1,
>> +               .mplanes = 1,
>> +               .bpp = { 8 },
>> +       }, {
>> +               .fourcc = V4L2_PIX_FMT_SRGGB10,
>> +               .cplanes = 1,
>> +               .mplanes = 1,
>> +               .bpp = { 16 },
>> +       }, {
>> +               .fourcc = V4L2_PIX_FMT_SGRBG10,
>> +               .cplanes = 1,
>> +               .mplanes = 1,
>> +               .bpp = { 16 },
>> +       }, {
>> +               .fourcc = V4L2_PIX_FMT_SGBRG10,
>> +               .cplanes = 1,
>> +               .mplanes = 1,
>> +               .bpp = { 16 },
>> +       }, {
>> +               .fourcc = V4L2_PIX_FMT_SBGGR10,
>> +               .cplanes = 1,
>> +               .mplanes = 1,
>> +               .bpp = { 16 },
>> +       }, {
>> +               .fourcc = V4L2_PIX_FMT_SRGGB12,
>> +               .cplanes = 1,
>> +               .mplanes = 1,
>> +               .bpp = { 16 },
>> +       }, {
>> +               .fourcc = V4L2_PIX_FMT_SGRBG12,
>> +               .cplanes = 1,
>> +               .mplanes = 1,
>> +               .bpp = { 16 },
>> +       }, {
>> +               .fourcc = V4L2_PIX_FMT_SGBRG12,
>> +               .cplanes = 1,
>> +               .mplanes = 1,
>> +               .bpp = { 16 },
>> +       }, {
>> +               .fourcc = V4L2_PIX_FMT_SBGGR12,
>> +               .cplanes = 1,
>> +               .mplanes = 1,
>> +               .bpp = { 16 },
>> +       }, {
>> +               .fourcc = V4L2_PIX_FMT_SBGGR16,
>> +               .cplanes = 1,
>> +               .mplanes = 1,
>> +               .bpp = { 16 },
>> +       }, {
>> +               .fourcc = V4L2_PIX_FMT_Y16,
>> +               .cplanes = 1,
>> +               .mplanes = 1,
>> +               .bpp = { 16 },
>> +       }
>> +};
>> +
>> +static const struct cif_input_fmt in_fmts[] = {
>> +       {
>> +               .mbus_code      = MEDIA_BUS_FMT_YUYV8_2X8,
>> +               .dvp_fmt_val    = YUV_INPUT_422 | YUV_INPUT_ORDER_YUYV,
>> +               .csi_fmt_val    = CSI_WRDDR_TYPE_YUV422,
>> +               .fmt_type       = CIF_FMT_TYPE_YUV,
>> +               .field          = V4L2_FIELD_NONE,
>> +       }, {
>> +               .mbus_code      = MEDIA_BUS_FMT_YUYV8_2X8,
>> +               .dvp_fmt_val    = YUV_INPUT_422 | YUV_INPUT_ORDER_YUYV,
>> +               .csi_fmt_val    = CSI_WRDDR_TYPE_YUV422,
>> +               .fmt_type       = CIF_FMT_TYPE_YUV,
>> +               .field          = V4L2_FIELD_INTERLACED,
>> +       }, {
>> +               .mbus_code      = MEDIA_BUS_FMT_YVYU8_2X8,
>> +               .dvp_fmt_val    = YUV_INPUT_422 | YUV_INPUT_ORDER_YVYU,
>> +               .csi_fmt_val    = CSI_WRDDR_TYPE_YUV422,
>> +               .fmt_type       = CIF_FMT_TYPE_YUV,
>> +               .field          = V4L2_FIELD_NONE,
>> +       }, {
>> +               .mbus_code      = MEDIA_BUS_FMT_YVYU8_2X8,
>> +               .dvp_fmt_val    = YUV_INPUT_422 | YUV_INPUT_ORDER_YVYU,
>> +               .csi_fmt_val    = CSI_WRDDR_TYPE_YUV422,
>> +               .fmt_type       = CIF_FMT_TYPE_YUV,
>> +               .field          = V4L2_FIELD_INTERLACED,
>> +       }, {
>> +               .mbus_code      = MEDIA_BUS_FMT_UYVY8_2X8,
>> +               .dvp_fmt_val    = YUV_INPUT_422 | YUV_INPUT_ORDER_UYVY,
>> +               .csi_fmt_val    = CSI_WRDDR_TYPE_YUV422,
>> +               .fmt_type       = CIF_FMT_TYPE_YUV,
>> +               .field          = V4L2_FIELD_NONE,
>> +       }, {
>> +               .mbus_code      = MEDIA_BUS_FMT_UYVY8_2X8,
>> +               .dvp_fmt_val    = YUV_INPUT_422 | YUV_INPUT_ORDER_UYVY,
>> +               .csi_fmt_val    = CSI_WRDDR_TYPE_YUV422,
>> +               .fmt_type       = CIF_FMT_TYPE_YUV,
>> +               .field          = V4L2_FIELD_INTERLACED,
>> +       }, {
>> +               .mbus_code      = MEDIA_BUS_FMT_VYUY8_2X8,
>> +               .dvp_fmt_val    = YUV_INPUT_422 | YUV_INPUT_ORDER_VYUY,
>> +               .csi_fmt_val    = CSI_WRDDR_TYPE_YUV422,
>> +               .fmt_type       = CIF_FMT_TYPE_YUV,
>> +               .field          = V4L2_FIELD_NONE,
>> +       }, {
>> +               .mbus_code      = MEDIA_BUS_FMT_VYUY8_2X8,
>> +               .dvp_fmt_val    = YUV_INPUT_422 | YUV_INPUT_ORDER_VYUY,
>> +               .csi_fmt_val    = CSI_WRDDR_TYPE_YUV422,
>> +               .fmt_type       = CIF_FMT_TYPE_YUV,
>> +               .field          = V4L2_FIELD_INTERLACED,
>> +       }, {
>> +               .mbus_code      = MEDIA_BUS_FMT_SBGGR8_1X8,
>> +               .dvp_fmt_val    = INPUT_MODE_RAW | RAW_DATA_WIDTH_8,
>> +               .csi_fmt_val    = CSI_WRDDR_TYPE_RAW8,
>> +               .fmt_type       = CIF_FMT_TYPE_RAW,
>> +               .field          = V4L2_FIELD_NONE,
>> +       }, {
>> +               .mbus_code      = MEDIA_BUS_FMT_SGBRG8_1X8,
>> +               .dvp_fmt_val    = INPUT_MODE_RAW | RAW_DATA_WIDTH_8,
>> +               .csi_fmt_val    = CSI_WRDDR_TYPE_RAW8,
>> +               .fmt_type       = CIF_FMT_TYPE_RAW,
>> +               .field          = V4L2_FIELD_NONE,
>> +       }, {
>> +               .mbus_code      = MEDIA_BUS_FMT_SGRBG8_1X8,
>> +               .dvp_fmt_val    = INPUT_MODE_RAW | RAW_DATA_WIDTH_8,
>> +               .csi_fmt_val    = CSI_WRDDR_TYPE_RAW8,
>> +               .fmt_type       = CIF_FMT_TYPE_RAW,
>> +               .field          = V4L2_FIELD_NONE,
>> +       }, {
>> +               .mbus_code      = MEDIA_BUS_FMT_SRGGB8_1X8,
>> +               .dvp_fmt_val    = INPUT_MODE_RAW | RAW_DATA_WIDTH_8,
>> +               .csi_fmt_val    = CSI_WRDDR_TYPE_RAW8,
>> +               .fmt_type       = CIF_FMT_TYPE_RAW,
>> +               .field          = V4L2_FIELD_NONE,
>> +       }, {
>> +               .mbus_code      = MEDIA_BUS_FMT_SBGGR10_1X10,
>> +               .dvp_fmt_val    = INPUT_MODE_RAW | RAW_DATA_WIDTH_10,
>> +               .csi_fmt_val    = CSI_WRDDR_TYPE_RAW10,
>> +               .fmt_type       = CIF_FMT_TYPE_RAW,
>> +               .field          = V4L2_FIELD_NONE,
>> +       }, {
>> +               .mbus_code      = MEDIA_BUS_FMT_SGBRG10_1X10,
>> +               .dvp_fmt_val    = INPUT_MODE_RAW | RAW_DATA_WIDTH_10,
>> +               .csi_fmt_val    = CSI_WRDDR_TYPE_RAW10,
>> +               .fmt_type       = CIF_FMT_TYPE_RAW,
>> +               .field          = V4L2_FIELD_NONE,
>> +       }, {
>> +               .mbus_code      = MEDIA_BUS_FMT_SGRBG10_1X10,
>> +               .dvp_fmt_val    = INPUT_MODE_RAW | RAW_DATA_WIDTH_10,
>> +               .csi_fmt_val    = CSI_WRDDR_TYPE_RAW10,
>> +               .fmt_type       = CIF_FMT_TYPE_RAW,
>> +               .field          = V4L2_FIELD_NONE,
>> +       }, {
>> +               .mbus_code      = MEDIA_BUS_FMT_SRGGB10_1X10,
>> +               .dvp_fmt_val    = INPUT_MODE_RAW | RAW_DATA_WIDTH_10,
>> +               .csi_fmt_val    = CSI_WRDDR_TYPE_RAW10,
>> +               .fmt_type       = CIF_FMT_TYPE_RAW,
>> +               .field          = V4L2_FIELD_NONE,
>> +       }, {
>> +               .mbus_code      = MEDIA_BUS_FMT_SBGGR12_1X12,
>> +               .dvp_fmt_val    = INPUT_MODE_RAW | RAW_DATA_WIDTH_12,
>> +               .csi_fmt_val    = CSI_WRDDR_TYPE_RAW12,
>> +               .fmt_type       = CIF_FMT_TYPE_RAW,
>> +               .field          = V4L2_FIELD_NONE,
>> +       }, {
>> +               .mbus_code      = MEDIA_BUS_FMT_SGBRG12_1X12,
>> +               .dvp_fmt_val    = INPUT_MODE_RAW | RAW_DATA_WIDTH_12,
>> +               .csi_fmt_val    = CSI_WRDDR_TYPE_RAW12,
>> +               .fmt_type       = CIF_FMT_TYPE_RAW,
>> +               .field          = V4L2_FIELD_NONE,
>> +       }, {
>> +               .mbus_code      = MEDIA_BUS_FMT_SGRBG12_1X12,
>> +               .dvp_fmt_val    = INPUT_MODE_RAW | RAW_DATA_WIDTH_12,
>> +               .csi_fmt_val    = CSI_WRDDR_TYPE_RAW12,
>> +               .fmt_type       = CIF_FMT_TYPE_RAW,
>> +               .field          = V4L2_FIELD_NONE,
>> +       }, {
>> +               .mbus_code      = MEDIA_BUS_FMT_SRGGB12_1X12,
>> +               .dvp_fmt_val    = INPUT_MODE_RAW | RAW_DATA_WIDTH_12,
>> +               .csi_fmt_val    = CSI_WRDDR_TYPE_RAW12,
>> +               .fmt_type       = CIF_FMT_TYPE_RAW,
>> +               .field          = V4L2_FIELD_NONE,
>> +       }, {
>> +               .mbus_code      = MEDIA_BUS_FMT_RGB888_1X24,
>> +               .csi_fmt_val    = CSI_WRDDR_TYPE_RGB888,
>> +               .field          = V4L2_FIELD_NONE,
>> +       }, {
>> +               .mbus_code      = MEDIA_BUS_FMT_Y8_1X8,
>> +               .dvp_fmt_val    = INPUT_MODE_RAW | RAW_DATA_WIDTH_8,
>> +               .csi_fmt_val    = CSI_WRDDR_TYPE_RAW8,
>> +               .fmt_type       = CIF_FMT_TYPE_RAW,
>> +               .field          = V4L2_FIELD_NONE,
>> +       }, {
>> +               .mbus_code      = MEDIA_BUS_FMT_Y10_1X10,
>> +               .dvp_fmt_val    = INPUT_MODE_RAW | RAW_DATA_WIDTH_10,
>> +               .csi_fmt_val    = CSI_WRDDR_TYPE_RAW10,
>> +               .fmt_type       = CIF_FMT_TYPE_RAW,
>> +               .field          = V4L2_FIELD_NONE,
>> +       }, {
>> +               .mbus_code      = MEDIA_BUS_FMT_Y12_1X12,
>> +               .dvp_fmt_val    = INPUT_MODE_RAW | RAW_DATA_WIDTH_12,
>> +               .csi_fmt_val    = CSI_WRDDR_TYPE_RAW12,
>> +               .fmt_type       = CIF_FMT_TYPE_RAW,
>> +               .field          = V4L2_FIELD_NONE,
>> +       }
>> +};
>> +
>> +static const struct
>> +cif_input_fmt *get_input_fmt(struct v4l2_subdev *sd)
>> +{
>> +       struct v4l2_subdev_format fmt;
>> +       int ret;
>> +       u32 i;
>> +
>> +       fmt.which = V4L2_SUBDEV_FORMAT_ACTIVE;
>> +       fmt.pad = 0;
>> +       ret = v4l2_subdev_call(sd, pad, get_fmt, NULL, &fmt);
>> +       if (ret < 0) {
>> +               v4l2_warn(sd->v4l2_dev,
>> +                         "sensor fmt invalid, set to default size\n");
>> +               goto set_default;
>> +       }
>> +
>> +       for (i = 0; i < ARRAY_SIZE(in_fmts); i++)
>> +               if (fmt.format.code == in_fmts[i].mbus_code &&
>> +                   fmt.format.field == in_fmts[i].field)
>> +                       return &in_fmts[i];
>> +
>> +       v4l2_err(sd->v4l2_dev, "remote sensor mbus code not supported\n");
>> +
>> +set_default:
>> +       return NULL;
>> +}
>> +
>> +       static const struct  
>
>Tab is off. Note that Hans already mentioned this on v1.
>
>> +cif_output_fmt *find_output_fmt(struct rkcif_stream *stream, u32 pixelfmt)
>> +{
>> +       const struct cif_output_fmt *fmt;
>> +       u32 i;
>> +
>> +       for (i = 0; i < ARRAY_SIZE(out_fmts); i++) {
>> +               fmt = &out_fmts[i];
>> +               if (fmt->fourcc == pixelfmt)
>> +                       return fmt;
>> +       }
>> +
>> +       return NULL;
>> +}
>> +
>> +/***************************** stream operations ******************************/
>> +static void rkcif_assign_new_buffer_oneframe(struct rkcif_stream *stream)
>> +{
>> +       struct rkcif_dummy_buffer *dummy_buf = &stream->dummy_buf;
>> +       struct rkcif_device *dev = stream->cifdev;
>> +       void __iomem *base = dev->base_addr;
>> +
>> +       /* Set up an empty buffer for the next frame */
>> +       spin_lock(&stream->vbq_lock);
>> +       if (!list_empty(&stream->buf_head)) {
>> +               stream->curr_buf = list_first_entry(&stream->buf_head,
>> +                                       struct rkcif_buffer, queue);
>> +               list_del(&stream->curr_buf->queue);
>> +       } else {
>> +               stream->curr_buf = NULL;
>> +       }
>> +       spin_unlock(&stream->vbq_lock);
>> +
>> +       if (stream->curr_buf) {
>> +               write_cif_reg(base, CIF_FRM0_ADDR_Y,
>> +                             stream->curr_buf->buff_addr[RKCIF_PLANE_Y]);
>> +               write_cif_reg(base, CIF_FRM0_ADDR_UV,
>> +                             stream->curr_buf->buff_addr[RKCIF_PLANE_CBCR]);
>> +               write_cif_reg(base, CIF_FRM1_ADDR_Y,
>> +                             stream->curr_buf->buff_addr[RKCIF_PLANE_Y]);
>> +               write_cif_reg(base, CIF_FRM1_ADDR_UV,
>> +                             stream->curr_buf->buff_addr[RKCIF_PLANE_CBCR]);
>> +       } else {
>> +               write_cif_reg(base, CIF_FRM0_ADDR_Y, dummy_buf->dma_addr);
>> +               write_cif_reg(base, CIF_FRM0_ADDR_UV, dummy_buf->dma_addr);
>> +               write_cif_reg(base, CIF_FRM1_ADDR_Y, dummy_buf->dma_addr);
>> +               write_cif_reg(base, CIF_FRM1_ADDR_UV, dummy_buf->dma_addr);  
>
>Frame 0 and 1 would seem to indicate you can do better
>by implementing some double buffering. Have you tried that?

Yes actually, since this last revision, I've been workign on having the
double-buffering working, which gives some nice perf improvements, so
I'll probably include that in the next round for this series !

>
>> +       }
>> +}
>> +
>> +static void rkcif_stream_stop(struct rkcif_stream *stream)
>> +{
>> +       struct rkcif_device *cif_dev = stream->cifdev;
>> +       void __iomem *base = cif_dev->base_addr;
>> +       u32 val;
>> +
>> +       val = read_cif_reg(base, CIF_CTRL);
>> +       write_cif_reg(base, CIF_CTRL, val & (~ENABLE_CAPTURE));
>> +       write_cif_reg(base, CIF_INTEN, 0x0);
>> +       write_cif_reg(base, CIF_INTSTAT, 0x3ff);
>> +       write_cif_reg(base, CIF_FRAME_STATUS, 0x0);
>> +
>> +       stream->state = RKCIF_STATE_READY;
>> +}
>> +
>> +static int rkcif_queue_setup(struct vb2_queue *queue,
>> +                            unsigned int *num_buffers,
>> +                            unsigned int *num_planes,
>> +                            unsigned int sizes[],
>> +                            struct device *alloc_devs[])
>> +{
>> +       struct rkcif_stream *stream = queue->drv_priv;
>> +       const struct v4l2_pix_format_mplane *pixm;
>> +       const struct cif_output_fmt *cif_fmt;
>> +       u32 i;
>> +  
>
>Better to use u32 for variables that really need a fixed width,
>and so use e.g. unsigned int here.

Ah yes, thanks !

>> +       pixm = &stream->pixm;
>> +       cif_fmt = stream->cif_fmt_out;
>> +
>> +       if (*num_planes) {
>> +               if (*num_planes != cif_fmt->mplanes)
>> +                       return -EINVAL;
>> +
>> +               for (i = 0; i < cif_fmt->mplanes; i++)
>> +                       if (sizes[i] < pixm->plane_fmt[i].sizeimage)
>> +                               return -EINVAL;
>> +               return 0;
>> +       }
>> +
>> +       *num_planes = cif_fmt->mplanes;
>> +
>> +       for (i = 0; i < cif_fmt->mplanes; i++) {
>> +               const struct v4l2_plane_pix_format *plane_fmt;
>> +
>> +               plane_fmt = &pixm->plane_fmt[i];
>> +               sizes[i] = plane_fmt->sizeimage;
>> +       }
>> +
>> +       return 0;
>> +}
>> +
>> +/*
>> + * The vb2_buffer are stored in rkcif_buffer, in order to unify
>> + * mplane buffer and none-mplane buffer.
>> + */
>> +static void rkcif_buf_queue(struct vb2_buffer *vb)
>> +{
>> +       struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
>> +       struct rkcif_buffer *cifbuf = to_rkcif_buffer(vbuf);
>> +       struct vb2_queue *queue = vb->vb2_queue;
>> +       struct rkcif_stream *stream = queue->drv_priv;
>> +       struct v4l2_pix_format_mplane *pixm = &stream->pixm;
>> +       const struct cif_output_fmt *fmt = stream->cif_fmt_out;
>> +       unsigned long lock_flags = 0;
>> +       int i;
>> +
>> +       memset(cifbuf->buff_addr, 0, sizeof(cifbuf->buff_addr));
>> +       /* If mplanes > 1, every c-plane has its own m-plane,
>> +        * otherwise, multiple c-planes are in the same m-plane
>> +        */
>> +       for (i = 0; i < fmt->mplanes; i++)
>> +               cifbuf->buff_addr[i] = vb2_dma_contig_plane_dma_addr(vb, i);
>> +
>> +       if (fmt->mplanes == 1) {
>> +               for (i = 0; i < fmt->cplanes - 1; i++)
>> +                       cifbuf->buff_addr[i + 1] = cifbuf->buff_addr[i] +
>> +                               pixm->plane_fmt[i].bytesperline * pixm->height;
>> +       }
>> +
>> +       spin_lock_irqsave(&stream->vbq_lock, lock_flags);
>> +       list_add_tail(&cifbuf->queue, &stream->buf_head);
>> +       spin_unlock_irqrestore(&stream->vbq_lock, lock_flags);
>> +}
>> +
>> +static int rkcif_create_dummy_buf(struct rkcif_stream *stream)
>> +{  
>
>As Hans pointed out, dummy buffer needs some explanation
>and details.

Yes I'll be commenting on that, basically the goal is that when the
queue is empty and we don't have any buffer available, we use that
dummy buffer as a destination buffer for the controller.

I'm not very familiar with how other drivers implement such scenarios,
and if this practise is very common... sorry if it's not the case.

>> +       struct rkcif_dummy_buffer *dummy_buf = &stream->dummy_buf;
>> +       struct rkcif_device *dev = stream->cifdev;
>> +
>> +       /* get a maximum plane size */
>> +       dummy_buf->size = max3(stream->pixm.plane_fmt[0].bytesperline *
>> +               stream->pixm.height,
>> +               stream->pixm.plane_fmt[1].sizeimage,
>> +               stream->pixm.plane_fmt[2].sizeimage);
>> +
>> +       dummy_buf->vaddr = dma_alloc_coherent(dev->dev, dummy_buf->size,
>> +                                             &dummy_buf->dma_addr,
>> +                                             GFP_KERNEL);
>> +       if (!dummy_buf->vaddr) {
>> +               v4l2_err(&dev->v4l2_dev,
>> +                        "Failed to allocate the memory for dummy buffer\n");
>> +               return -ENOMEM;
>> +       }
>> +
>> +       v4l2_info(&dev->v4l2_dev, "Allocate dummy buffer, size: 0x%08x\n",
>> +                 dummy_buf->size);
>> +  
>
>Drop this v4l2_info.
>
>> +       return 0;
>> +}
>> +
>> +static void rkcif_destroy_dummy_buf(struct rkcif_stream *stream)
>> +{
>> +       struct rkcif_dummy_buffer *dummy_buf = &stream->dummy_buf;
>> +       struct rkcif_device *dev = stream->cifdev;
>> +
>> +       dma_free_coherent(dev->dev, dummy_buf->size,
>> +                         dummy_buf->vaddr, dummy_buf->dma_addr);
>> +}
>> +
>> +static void rkcif_stop_streaming(struct vb2_queue *queue)
>> +{
>> +       struct rkcif_stream *stream = queue->drv_priv;
>> +       struct rkcif_device *dev = stream->cifdev;
>> +       struct rkcif_buffer *buf;
>> +       struct v4l2_subdev *sd;
>> +       int ret;
>> +
>> +       stream->stopping = true;
>> +       ret = wait_event_timeout(stream->wq_stopped,
>> +                                stream->state != RKCIF_STATE_STREAMING,
>> +                                msecs_to_jiffies(1000));
>> +       if (!ret) {
>> +               rkcif_stream_stop(stream);
>> +               stream->stopping = false;
>> +       }
>> +       pm_runtime_put(dev->dev);
>> +
>> +       /* stop the sub device*/
>> +       sd = dev->sensor.sd;
>> +       v4l2_subdev_call(sd, video, s_stream, 0);
>> +       v4l2_subdev_call(sd, core, s_power, 0);
>> +
>> +       /* release buffers */
>> +       if (stream->curr_buf) {
>> +               list_add_tail(&stream->curr_buf->queue, &stream->buf_head);
>> +               stream->curr_buf = NULL;
>> +       }
>> +       if (stream->next_buf) {  
>
>Next buffer would seem to indicate some attempt at double-buffering,
>but it's not really used.
>
>> +               list_add_tail(&stream->next_buf->queue, &stream->buf_head);
>> +               stream->next_buf = NULL;
>> +       }
>> +
>> +       while (!list_empty(&stream->buf_head)) {
>> +               buf = list_first_entry(&stream->buf_head,
>> +                                      struct rkcif_buffer, queue);
>> +               list_del(&buf->queue);
>> +               vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
>> +       }
>> +
>> +       rkcif_destroy_dummy_buf(stream);
>> +}
>> +
>> +static u32 rkcif_determine_input_mode(struct rkcif_device *dev)
>> +{
>> +       struct rkcif_sensor_info *sensor_info = &dev->sensor;
>> +       struct rkcif_stream *stream = &dev->stream;
>> +       v4l2_std_id std;
>> +       u32 mode = INPUT_MODE_YUV;
>> +       int ret;
>> +
>> +       ret = v4l2_subdev_call(sensor_info->sd, video, querystd, &std);
>> +       if (ret == 0) {
>> +               /* retrieve std from sensor if exist */
>> +               switch (std) {
>> +               case V4L2_STD_NTSC:
>> +                       mode = INPUT_MODE_NTSC;
>> +                       break;
>> +               case V4L2_STD_PAL:
>> +                       mode = INPUT_MODE_PAL;
>> +                       break;
>> +               case V4L2_STD_ATSC:
>> +                       mode = INPUT_MODE_BT1120;
>> +                       break;
>> +               default:
>> +                       v4l2_err(&dev->v4l2_dev,
>> +                                "std: %lld is not supported", std);
>> +               }
>> +       } else {
>> +               /* determine input mode by mbus_code (fmt_type) */
>> +               switch (stream->cif_fmt_in->fmt_type) {
>> +               case CIF_FMT_TYPE_YUV:
>> +                       mode = INPUT_MODE_YUV;
>> +                       break;
>> +               case CIF_FMT_TYPE_RAW:
>> +                       mode = INPUT_MODE_RAW;
>> +                       break;
>> +               }
>> +       }
>> +
>> +       return mode;
>> +}
>> +
>> +static inline u32 rkcif_scl_ctl(struct rkcif_stream *stream)
>> +{
>> +       u32 fmt_type = stream->cif_fmt_in->fmt_type;
>> +
>> +       return (fmt_type == CIF_FMT_TYPE_YUV) ?
>> +               ENABLE_YUV_16BIT_BYPASS : ENABLE_RAW_16BIT_BYPASS;
>> +}
>> +
>> +static int rkcif_stream_start(struct rkcif_stream *stream)
>> +{
>> +       u32 val, mbus_flags, href_pol, vsync_pol,
>> +           xfer_mode = 0, yc_swap = 0, skip_top = 0;  
>
>Tab is off here.
>
>> +       struct rkcif_device *dev = stream->cifdev;
>> +       struct rkcif_sensor_info *sensor_info;
>> +       void __iomem *base = dev->base_addr;
>> +
>> +       sensor_info = &dev->sensor;
>> +       stream->frame_idx = 0;
>> +
>> +       mbus_flags = sensor_info->mbus.flags;
>> +       href_pol = (mbus_flags & V4L2_MBUS_HSYNC_ACTIVE_HIGH) ?
>> +                       HSY_HIGH_ACTIVE : HSY_LOW_ACTIVE;
>> +       vsync_pol = (mbus_flags & V4L2_MBUS_VSYNC_ACTIVE_HIGH) ?
>> +                       VSY_HIGH_ACTIVE : VSY_LOW_ACTIVE;
>> +
>> +       if (rkcif_determine_input_mode(dev) == INPUT_MODE_BT1120) {
>> +               if (stream->cif_fmt_in->field == V4L2_FIELD_NONE)
>> +                       xfer_mode = BT1120_TRANSMIT_PROGRESS;
>> +               else
>> +                       xfer_mode = BT1120_TRANSMIT_INTERFACE;
>> +               if (!CIF_FETCH_IS_Y_FIRST(stream->cif_fmt_in->dvp_fmt_val))
>> +                       yc_swap = BT1120_YC_SWAP;
>> +       }
>> +
>> +       val = vsync_pol | href_pol | rkcif_determine_input_mode(dev) |
>> +             stream->cif_fmt_out->fmt_val | stream->cif_fmt_in->dvp_fmt_val |
>> +             xfer_mode | yc_swap;
>> +       write_cif_reg(base, CIF_FOR, val);
>> +       val = stream->pixm.width;
>> +       if (stream->cif_fmt_in->fmt_type == CIF_FMT_TYPE_RAW)
>> +               val = stream->pixm.width * 2;
>> +       write_cif_reg(base, CIF_VIR_LINE_WIDTH, val);
>> +       write_cif_reg(base, CIF_SET_SIZE,
>> +                     stream->pixm.width | (stream->pixm.height << 16));
>> +
>> +       v4l2_subdev_call(sensor_info->sd, sensor, g_skip_top_lines, &skip_top);
>> +
>> +       write_cif_reg(base, CIF_CROP, skip_top << CIF_CROP_Y_SHIFT);
>> +       write_cif_reg(base, CIF_FRAME_STATUS, FRAME_STAT_CLS);
>> +       write_cif_reg(base, CIF_INTSTAT, INTSTAT_CLS);
>> +       write_cif_reg(base, CIF_SCL_CTRL, rkcif_scl_ctl(stream));
>> +
>> +       rkcif_assign_new_buffer_oneframe(stream);
>> +
>> +       write_cif_reg(base, CIF_INTEN, FRAME_END_EN | LINE_ERR_EN |
>> +                           PST_INF_FRAME_END);
>> +
>> +       if (dev->data->chip_id == CHIP_RK1808_CIF &&
>> +           rkcif_determine_input_mode(dev) == INPUT_MODE_BT1120)
>> +               write_cif_reg(base, CIF_CTRL,
>> +                             AXI_BURST_16 | MODE_PINGPONG | ENABLE_CAPTURE);
>> +       else
>> +               write_cif_reg(base, CIF_CTRL,
>> +                             AXI_BURST_16 | MODE_ONEFRAME | ENABLE_CAPTURE);
>> +
>> +       stream->state = RKCIF_STATE_STREAMING;
>> +
>> +       return 0;
>> +}
>> +
>> +static int rkcif_start_streaming(struct vb2_queue *queue, unsigned int count)
>> +{
>> +       struct rkcif_stream *stream = queue->drv_priv;
>> +       struct rkcif_device *dev = stream->cifdev;
>> +       struct v4l2_device *v4l2_dev = &dev->v4l2_dev;
>> +       struct v4l2_subdev *sd;
>> +       int ret;
>> +
>> +       if (WARN_ON(stream->state != RKCIF_STATE_READY)) {  
>
>This check should not be needed.
>
>> +               ret = -EBUSY;
>> +               v4l2_err(v4l2_dev, "stream in busy state\n");
>> +               goto destroy_buf;
>> +       }
>> +
>> +       stream->cif_fmt_in = get_input_fmt(dev->sensor.sd);
>> +
>> +       ret = rkcif_create_dummy_buf(stream);
>> +       if (ret < 0) {
>> +               v4l2_err(v4l2_dev, "Failed to create dummy_buf, %d\n", ret);
>> +               goto destroy_buf;
>> +       }
>> +
>> +       ret = pm_runtime_get_sync(dev->dev);
>> +       if (ret < 0) {
>> +               v4l2_err(v4l2_dev, "Failed to get runtime pm, %d\n", ret);
>> +               goto destroy_dummy_buf;
>> +       }
>> +
>> +       /* start sub-devices */
>> +       sd = dev->sensor.sd;
>> +       ret = v4l2_subdev_call(sd, core, s_power, 1);
>> +       if (ret < 0 && ret != -ENOIOCTLCMD)
>> +               goto runtime_put;
>> +       ret = v4l2_subdev_call(sd, video, s_stream, 1);
>> +       if (ret < 0)
>> +               goto subdev_poweroff;
>> +
>> +       ret = rkcif_stream_start(stream);
>> +       if (ret < 0)
>> +               goto stop_stream;
>> +
>> +       return 0;
>> +
>> +stop_stream:
>> +       rkcif_stream_stop(stream);
>> +subdev_poweroff:
>> +       v4l2_subdev_call(sd, core, s_power, 0);
>> +runtime_put:
>> +       pm_runtime_put(dev->dev);
>> +destroy_dummy_buf:
>> +       rkcif_destroy_dummy_buf(stream);
>> +destroy_buf:
>> +       while (!list_empty(&stream->buf_head)) {  
>
>Move this to a helper?

Yes, this will be cleaner :)

>> +               struct rkcif_buffer *buf;
>> +
>> +               buf = list_first_entry(&stream->buf_head,
>> +                                      struct rkcif_buffer, queue);
>> +               list_del(&buf->queue);
>> +               vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_QUEUED);
>> +       }
>> +
>> +       return ret;
>> +}
>> +
>> +static struct vb2_ops rkcif_vb2_ops = {
>> +       .queue_setup = rkcif_queue_setup,
>> +       .buf_queue = rkcif_buf_queue,
>> +       .wait_prepare = vb2_ops_wait_prepare,
>> +       .wait_finish = vb2_ops_wait_finish,
>> +       .stop_streaming = rkcif_stop_streaming,
>> +       .start_streaming = rkcif_start_streaming,
>> +};
>> +
>> +static int rkcif_init_vb2_queue(struct vb2_queue *q,
>> +                               struct rkcif_stream *stream,
>> +                               enum v4l2_buf_type buf_type)
>> +{
>> +       q->type = buf_type;
>> +       q->io_modes = VB2_MMAP | VB2_DMABUF;
>> +       q->drv_priv = stream;
>> +       q->ops = &rkcif_vb2_ops;
>> +       q->mem_ops = &vb2_dma_contig_memops;  
>
>I can't find any CPU mapping, so maybe you'll want to
>have q->dma_attrs = DMA_ATTR_NO_KERNEL_MAPPING.

Ok nice catch, I'll try that

>> +       q->buf_struct_size = sizeof(struct rkcif_buffer);
>> +       q->min_buffers_needed = CIF_REQ_BUFS_MIN;
>> +       q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
>> +       q->lock = &stream->vlock;
>> +       q->dev = stream->cifdev->dev;
>> +
>> +       return vb2_queue_init(q);
>> +}
>> +
>> +static void rkcif_set_fmt(struct rkcif_stream *stream,
>> +                         struct v4l2_pix_format_mplane *pixm,
>> +                         bool try)
>> +{
>> +       const struct cif_output_fmt *fmt;
>> +       struct v4l2_rect input_rect;
>> +       unsigned int imagesize = 0, planes;
>> +       u32 xsubs = 1, ysubs = 1, i;
>> +
>> +       fmt = find_output_fmt(stream, pixm->pixelformat);
>> +       if (!fmt)
>> +               fmt = &out_fmts[0];
>> +
>> +       input_rect.width = CIF_MAX_WIDTH;
>> +       input_rect.height = CIF_MAX_HEIGHT;
>> +
>> +       pixm->width = clamp_t(u32, pixm->width,
>> +                               CIF_MIN_WIDTH, input_rect.width);
>> +       pixm->height = clamp_t(u32, pixm->height,
>> +                               CIF_MIN_HEIGHT, input_rect.height);
>> +
>> +       pixm->num_planes = fmt->mplanes;
>> +       pixm->quantization = V4L2_QUANTIZATION_DEFAULT;
>> +       pixm->colorspace = V4L2_COLORSPACE_SRGB;
>> +  
>
>See Hans' comment on v1.
>
>> +       pixm->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(pixm->colorspace);
>> +       pixm->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(pixm->colorspace);
>> +
>> +       pixm->pixelformat = fmt->fourcc;
>> +       pixm->field = V4L2_FIELD_NONE;
>> +
>> +       /* calculate plane size and image size */
>> +       fcc_xysubs(fmt->fourcc, &xsubs, &ysubs);
>> +
>> +       planes = fmt->cplanes ? fmt->cplanes : fmt->mplanes;
>> +
>> +       for (i = 0; i < planes; i++) {
>> +               struct v4l2_plane_pix_format *plane_fmt;
>> +               int width, height, bpl, size;
>> +
>> +               if (i == 0) {
>> +                       width = pixm->width;
>> +                       height = pixm->height;
>> +               } else {
>> +                       width = pixm->width / xsubs;
>> +                       height = pixm->height / ysubs;
>> +               }
>> +
>> +               bpl = width * fmt->bpp[i] / 8;
>> +               size = bpl * height;
>> +               imagesize += size;
>> +
>> +               if (fmt->mplanes > i) {
>> +                       /* Set bpl and size for each mplane */
>> +                       plane_fmt = pixm->plane_fmt + i;
>> +                       plane_fmt->bytesperline = bpl;
>> +                       plane_fmt->sizeimage = size;
>> +               }
>> +       }
>> +
>> +       /* convert to non-MPLANE format.
>> +        * It's important since we want to unify non-MPLANE  
>
>I suggest to only support MPLANE API and make your life simpler.

Yes definitely, this will be simplified

>> +        * and MPLANE.
>> +        */
>> +       if (fmt->mplanes == 1)
>> +               pixm->plane_fmt[0].sizeimage = imagesize;
>> +
>> +       if (!try) {
>> +               stream->cif_fmt_out = fmt;
>> +               stream->pixm = *pixm;
>> +       }
>> +}
>> +
>> +void rkcif_stream_init(struct rkcif_device *dev)
>> +{
>> +       struct rkcif_stream *stream = &dev->stream;
>> +       struct v4l2_pix_format_mplane pixm;
>> +
>> +       memset(stream, 0, sizeof(*stream));
>> +       memset(&pixm, 0, sizeof(pixm));
>> +       stream->cifdev = dev;
>> +
>> +       INIT_LIST_HEAD(&stream->buf_head);
>> +       spin_lock_init(&stream->vbq_lock);
>> +       stream->state = RKCIF_STATE_READY;
>> +       init_waitqueue_head(&stream->wq_stopped);
>> +
>> +       /* Set default format */
>> +       pixm.pixelformat = V4L2_PIX_FMT_NV12;
>> +       pixm.width = RKCIF_DEFAULT_WIDTH;
>> +       pixm.height = RKCIF_DEFAULT_HEIGHT;
>> +       rkcif_set_fmt(stream, &pixm, false);
>> +
>> +       stream->crop.left = 0;
>> +       stream->crop.top = 0;
>> +       stream->crop.width = 10;
>> +       stream->crop.height = 10;  
>
>As already mentioned by Hans on the v1, please drop.
>
>> +}
>> +
>> +static int rkcif_fh_open(struct file *filp)
>> +{
>> +       struct video_device *vdev = video_devdata(filp);
>> +       struct rkcif_stream *stream = to_rkcif_stream(vdev);
>> +       struct rkcif_device *cifdev = stream->cifdev;
>> +
>> +       rkcif_soft_reset(cifdev);
>> +  
>
>As already mentioned by Hans, looks problematic.
>
>> +       return v4l2_fh_open(filp);
>> +}
>> +
>> +static const struct v4l2_file_operations rkcif_fops = {
>> +       .open = rkcif_fh_open,
>> +       .release = vb2_fop_release,
>> +       .unlocked_ioctl = video_ioctl2,
>> +       .poll = vb2_fop_poll,
>> +       .mmap = vb2_fop_mmap,
>> +};
>> +
>> +static int rkcif_enum_input(struct file *file, void *priv,
>> +                           struct v4l2_input *input)  
>
>Why supporting the Input ioctls?
>
>> +{
>> +       if (input->index > 0)
>> +               return -EINVAL;
>> +
>> +       input->type = V4L2_INPUT_TYPE_CAMERA;
>> +       strlcpy(input->name, "Camera", sizeof(input->name));
>> +
>> +       return 0;
>> +}
>> +
>> +static int rkcif_try_fmt_vid_cap_mplane(struct file *file, void *fh,
>> +                                       struct v4l2_format *f)
>> +{
>> +       struct rkcif_stream *stream = video_drvdata(file);
>> +
>> +       rkcif_set_fmt(stream, &f->fmt.pix_mp, true);
>> +
>> +       return 0;
>> +}
>> +
>> +static int rkcif_enum_fmt_vid_cap(struct file *file, void *priv,
>> +                                        struct v4l2_fmtdesc *f)
>> +{
>> +       const struct cif_output_fmt *fmt = NULL;
>> +
>> +       if (f->index >= ARRAY_SIZE(out_fmts))
>> +               return -EINVAL;
>> +
>> +       fmt = &out_fmts[f->index];
>> +       f->pixelformat = fmt->fourcc;
>> +
>> +       return 0;
>> +}
>> +
>> +static int rkcif_s_fmt_vid_cap_mplane(struct file *file,
>> +                                     void *priv, struct v4l2_format *f)
>> +{
>> +       struct rkcif_stream *stream = video_drvdata(file);
>> +
>> +       rkcif_set_fmt(stream, &f->fmt.pix_mp, false);
>> +
>> +       return 0;
>> +}
>> +
>> +static int rkcif_g_fmt_vid_cap_mplane(struct file *file, void *fh,
>> +                                     struct v4l2_format *f)
>> +{
>> +       struct rkcif_stream *stream = video_drvdata(file);
>> +
>> +       f->fmt.pix_mp = stream->pixm;
>> +
>> +       return 0;
>> +}
>> +
>> +static int rkcif_querycap(struct file *file, void *priv,
>> +                         struct v4l2_capability *cap)
>> +{
>> +       struct rkcif_stream *stream = video_drvdata(file);
>> +       struct device *dev = stream->cifdev->dev;
>> +
>> +       strlcpy(cap->driver, dev->driver->name, sizeof(cap->driver));
>> +       strlcpy(cap->card, dev->driver->name, sizeof(cap->card));
>> +       snprintf(cap->bus_info, sizeof(cap->bus_info),
>> +                "platform:%s", dev_name(dev));
>> +
>> +       return 0;
>> +}
>> +
>> +static int rkcif_enum_framesizes(struct file *file, void *fh,
>> +                                struct v4l2_frmsizeenum *fsize)
>> +{
>> +       struct rkcif_stream *stream = video_drvdata(file);
>> +       struct rkcif_device *dev = stream->cifdev;
>> +       struct v4l2_subdev_frame_size_enum fse = {
>> +               .index = fsize->index,
>> +               .which = V4L2_SUBDEV_FORMAT_ACTIVE,
>> +       };
>> +       const struct cif_output_fmt *fmt;
>> +       int ret;
>> +
>> +       if (!dev->sensor.sd)
>> +               return -EINVAL;
>> +
>> +       fmt = find_output_fmt(stream, fsize->pixel_format);
>> +       if (!fmt)
>> +               return -EINVAL;
>> +
>> +       fse.code = fmt->mbus;
>> +
>> +       ret = v4l2_subdev_call(dev->sensor.sd, pad, enum_frame_size,
>> +                              NULL, &fse);
>> +       if (ret)
>> +               return ret;
>> +
>> +       fsize->type = V4L2_FRMSIZE_TYPE_DISCRETE;
>> +       fsize->discrete.width = fse.max_width;
>> +       fsize->discrete.height = fse.max_height;
>> +
>> +       return 0;
>> +}
>> +
>> +static int rkcif_g_input(struct file *file, void *fh, unsigned int *i)
>> +{
>> +       *i = 0;
>> +       return 0;
>> +}
>> +
>> +static int rkcif_s_input(struct file *file, void *fh, unsigned int i)
>> +{
>> +       if (i)
>> +               return -EINVAL;
>> +
>> +       return 0;
>> +}
>> +
>> +static const struct v4l2_ioctl_ops rkcif_v4l2_ioctl_ops = {
>> +       .vidioc_reqbufs = vb2_ioctl_reqbufs,
>> +       .vidioc_querybuf = vb2_ioctl_querybuf,
>> +       .vidioc_create_bufs = vb2_ioctl_create_bufs,
>> +       .vidioc_qbuf = vb2_ioctl_qbuf,
>> +       .vidioc_expbuf = vb2_ioctl_expbuf,
>> +       .vidioc_dqbuf = vb2_ioctl_dqbuf,
>> +       .vidioc_prepare_buf = vb2_ioctl_prepare_buf,
>> +       .vidioc_streamon = vb2_ioctl_streamon,
>> +       .vidioc_streamoff = vb2_ioctl_streamoff,
>> +
>> +       .vidioc_enum_fmt_vid_cap = rkcif_enum_fmt_vid_cap,
>> +       .vidioc_try_fmt_vid_cap_mplane = rkcif_try_fmt_vid_cap_mplane,
>> +       .vidioc_s_fmt_vid_cap_mplane = rkcif_s_fmt_vid_cap_mplane,
>> +       .vidioc_g_fmt_vid_cap_mplane = rkcif_g_fmt_vid_cap_mplane,
>> +       .vidioc_querycap = rkcif_querycap,
>> +       .vidioc_enum_framesizes = rkcif_enum_framesizes,
>> +
>> +       .vidioc_enum_input = rkcif_enum_input,
>> +       .vidioc_g_input = rkcif_g_input,
>> +       .vidioc_s_input = rkcif_s_input,
>> +};
>> +
>> +void rkcif_unregister_stream_vdev(struct rkcif_device *dev)
>> +{
>> +       struct rkcif_stream *stream = &dev->stream;
>> +
>> +       media_entity_cleanup(&stream->vdev.entity);
>> +       video_unregister_device(&stream->vdev);
>> +}
>> +
>> +int rkcif_register_stream_vdev(struct rkcif_device *dev)
>> +{
>> +       struct rkcif_stream *stream = &dev->stream;
>> +       struct v4l2_device *v4l2_dev = &dev->v4l2_dev;
>> +       struct video_device *vdev = &stream->vdev;
>> +       int ret;
>> +
>> +       strlcpy(vdev->name, CIF_VIDEODEVICE_NAME, sizeof(vdev->name));
>> +       mutex_init(&stream->vlock);
>> +
>> +       vdev->ioctl_ops = &rkcif_v4l2_ioctl_ops;
>> +       vdev->release = video_device_release_empty;
>> +       vdev->fops = &rkcif_fops;
>> +       vdev->minor = -1;
>> +       vdev->v4l2_dev = v4l2_dev;
>> +       vdev->lock = &stream->vlock;
>> +       vdev->device_caps = V4L2_CAP_VIDEO_CAPTURE_MPLANE |
>> +                           V4L2_CAP_STREAMING;
>> +       video_set_drvdata(vdev, stream);
>> +       vdev->vfl_dir = VFL_DIR_RX;
>> +       stream->pad.flags = MEDIA_PAD_FL_SINK;
>> +
>> +       rkcif_init_vb2_queue(&stream->buf_queue, stream,
>> +                       V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE |
>> +                       V4L2_BUF_TYPE_VIDEO_CAPTURE);  
>
>As suggested, drop V4L2_BUF_TYPE_VIDEO_CAPTURE.
>
>> +       vdev->queue = &stream->buf_queue;
>> +       strscpy(vdev->name, KBUILD_MODNAME, sizeof(vdev->name));
>> +
>> +       ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
>> +       if (ret < 0) {
>> +               v4l2_err(v4l2_dev,
>> +                        "video_register_device failed with error %d\n", ret);
>> +               return ret;
>> +       }
>> +
>> +       ret = media_entity_pads_init(&vdev->entity, 1, &stream->pad);
>> +       if (ret < 0)
>> +               goto unreg;
>> +
>> +       return 0;
>> +unreg:
>> +       video_unregister_device(vdev);
>> +       return ret;
>> +}
>> +
>> +static void rkcif_vb_done_oneframe(struct rkcif_stream *stream,  
>
>Why this "oneframe" naming? Is there some other mode planned?
>
>> +                                  struct vb2_v4l2_buffer *vb_done)
>> +{
>> +       const struct cif_output_fmt *fmt = stream->cif_fmt_out;
>> +       u32 i;
>> +
>> +       /* Dequeue a filled buffer */
>> +       for (i = 0; i < fmt->mplanes; i++) {
>> +               vb2_set_plane_payload(&vb_done->vb2_buf, i,
>> +                       stream->pixm.plane_fmt[i].sizeimage);
>> +       }
>> +       vb_done->vb2_buf.timestamp = ktime_get_ns();  
>
>vb_done->vb2_buf.sequence needs to be set.
>Also, you can use it to mark drop buffers. See below.
>
>> +       vb2_buffer_done(&vb_done->vb2_buf, VB2_BUF_STATE_DONE);
>> +}
>> +
>> +void rkcif_irq_oneframe(struct rkcif_device *cif_dev)
>> +{
>> +       struct rkcif_stream *stream = &cif_dev->stream;
>> +       u32 lastline, lastpix, ctl, cif_frmst, intstat;
>> +       void __iomem *base = cif_dev->base_addr;
>> +
>> +       intstat = read_cif_reg(base, CIF_INTSTAT);
>> +       cif_frmst = read_cif_reg(base, CIF_FRAME_STATUS);
>> +       lastline = CIF_FETCH_Y_LAST_LINE(read_cif_reg(base, CIF_LAST_LINE));
>> +       lastpix = read_cif_reg(base, CIF_LAST_PIX);
>> +       ctl = read_cif_reg(base, CIF_CTRL);
>> +
>> +       /* There are two irqs enabled:
>> +        *  - PST_INF_FRAME_END: cif FIFO is ready, this is prior to FRAME_END
>> +        *  -         FRAME_END: cif has saved frame to memory, a frame ready
>> +        */
>> +
>> +       if ((intstat & PST_INF_FRAME_END)) {
>> +               write_cif_reg(base, CIF_INTSTAT, PST_INF_FRAME_END_CLR);
>> +
>> +               if (stream->stopping)
>> +                       /* To stop CIF ASAP, before FRAME_END irq */
>> +                       write_cif_reg(base, CIF_CTRL, ctl & (~ENABLE_CAPTURE));
>> +       }
>> +
>> +       if ((intstat & LINE_ERR)) {
>> +               write_cif_reg(base, CIF_INTSTAT, LINE_ERR_CLR);
>> +
>> +               if (stream->stopping) {
>> +                       rkcif_stream_stop(stream);
>> +                       stream->stopping = false;
>> +                       wake_up(&stream->wq_stopped);
>> +                       return;
>> +               }
>> +
>> +               v4l2_err(&cif_dev->v4l2_dev,
>> +                        "Bad frame, irq:0x%x frmst:0x%x size:%dx%d\n",
>> +                        intstat, cif_frmst, lastline, lastpix);
>> +               /* Clear status to receive into the same buffer */
>> +               write_cif_reg(base, CIF_FRAME_STATUS, FRM0_STAT_CLS);
>> +               return;
>> +       }
>> +
>> +
>> +       if ((intstat & FRAME_END)) {
>> +               struct vb2_v4l2_buffer *vb_done = NULL;
>> +
>> +               write_cif_reg(base, CIF_INTSTAT, FRAME_END_CLR);
>> +
>> +               if (stream->stopping) {
>> +                       rkcif_stream_stop(stream);
>> +                       stream->stopping = false;
>> +                       wake_up(&stream->wq_stopped);
>> +                       return;
>> +               }
>> +
>> +               if (lastline != stream->pixm.height ||
>> +                   !(cif_frmst & CIF_F0_READY)) {
>> +                       v4l2_err(&cif_dev->v4l2_dev,
>> +                                "Bad frame, irq:0x%x frmst:0x%x size:%dx%d\n",
>> +                                intstat, cif_frmst, lastline, lastpix);
>> +                       /* Clear status to receive into the same buffer */
>> +                       write_cif_reg(base, CIF_FRAME_STATUS, FRM0_STAT_CLS);
>> +                       return;
>> +               }
>> +
>> +               if (stream->curr_buf)
>> +                       vb_done = &stream->curr_buf->vb;
>> +               rkcif_assign_new_buffer_oneframe(stream);
>> +
>> +               /* In one-frame mode, must clear status manually to enable
>> +                * the next frame end irq
>> +                */
>> +               write_cif_reg(base, CIF_FRAME_STATUS, FRM0_STAT_CLS);
>> +
>> +               if (vb_done)
>> +                       rkcif_vb_done_oneframe(stream, vb_done);
>> +
>> +               stream->frame_idx++;  
>
>Although it's currently unused, frame_idx will be useful to set the sequence.
>Now, it would be interesting to keep track of captures to the dummy buffer
>(i.e. dropped buffers) vs. captures to real buffers (captured frames).
>
>Skipping dropped buffers from the sequence would allow userspace
>applications to detect that something is going wrong.
>
>You could also expose this captured/dropped counters in debugfs.

Yup good idea !  I'm currently debugging issues with some frames
getting lost, so I'll be implementing something very similar to what
you suggest !

>> +       }
>> +}
>> diff --git a/drivers/media/platform/rockchip/cif/dev.c b/drivers/media/platform/rockchip/cif/dev.c
>> new file mode 100644
>> index 000000000000..dbd5fdbd1cef
>> --- /dev/null
>> +++ b/drivers/media/platform/rockchip/cif/dev.c
>> @@ -0,0 +1,358 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Rockchip CIF Driver
>> + *
>> + * Copyright (C) 2018 Rockchip Electronics Co., Ltd.
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
>> +#define RKCIF_VERNO_LEN                10
>> +
>> +static int rkcif_create_links(struct rkcif_device *dev)
>> +{
>> +       struct v4l2_subdev *sd = dev->sensor.sd;
>> +       int ret;
>> +
>> +       ret = media_entity_get_fwnode_pad(&sd->entity, sd->fwnode,
>> +                                         MEDIA_PAD_FL_SOURCE);
>> +       if (ret)
>> +               return ret;
>> +
>> +       ret = media_create_pad_link(&sd->entity, 0,
>> +                                   &dev->stream.vdev.entity, 0,
>> +                                   MEDIA_LNK_FL_ENABLED);
>> +       if (ret) {
>> +               dev_err(dev->dev, "failed to create link");
>> +               return ret;
>> +       }
>> +
>> +       return 0;
>> +}
>> +
>> +static int subdev_notifier_complete(struct v4l2_async_notifier *notifier)
>> +{
>> +       struct rkcif_device *dev;
>> +       int ret;
>> +
>> +       dev = container_of(notifier, struct rkcif_device, notifier);
>> +
>> +       mutex_lock(&dev->media_dev.graph_mutex);
>> +
>> +       ret = rkcif_create_links(dev);
>> +       if (ret < 0)
>> +               goto unlock;
>> +
>> +       ret = v4l2_device_register_subdev_nodes(&dev->v4l2_dev);
>> +       if (ret < 0)
>> +               goto unlock;
>> +
>> +unlock:
>> +       mutex_unlock(&dev->media_dev.graph_mutex);
>> +       return ret;
>> +}
>> +
>> +static int subdev_notifier_bound(struct v4l2_async_notifier *notifier,
>> +                                struct v4l2_subdev *subdev,
>> +                                struct v4l2_async_subdev *asd)
>> +{
>> +       struct rkcif_device *cif_dev = container_of(notifier,
>> +                                       struct rkcif_device, notifier);
>> +
>> +       int pad;
>> +
>> +       cif_dev->sensor.sd = subdev;
>> +       pad = media_entity_get_fwnode_pad(&subdev->entity, subdev->fwnode,
>> +                                         MEDIA_PAD_FL_SOURCE);
>> +       if (pad < 0)
>> +               return pad;
>> +
>> +       cif_dev->sensor.pad = pad;
>> +
>> +       return 0;
>> +}
>> +
>> +static const struct v4l2_async_notifier_operations subdev_notifier_ops = {
>> +       .bound = subdev_notifier_bound,
>> +       .complete = subdev_notifier_complete,
>> +};
>> +
>> +static int cif_subdev_notifier(struct rkcif_device *cif_dev)
>> +{
>> +       struct v4l2_async_notifier *ntf = &cif_dev->notifier;
>> +       struct device *dev = cif_dev->dev;
>> +       struct v4l2_fwnode_endpoint vep = {
>> +               .bus_type = V4L2_MBUS_PARALLEL,
>> +       };
>> +       struct fwnode_handle *ep;
>> +       int ret;
>> +
>> +       v4l2_async_notifier_init(ntf);
>> +
>> +       ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 0, 0,
>> +                       FWNODE_GRAPH_ENDPOINT_NEXT);
>> +       if (!ep)
>> +               return -EINVAL;
>> +
>> +       ret = v4l2_fwnode_endpoint_parse(ep, &vep);
>> +       if (ret)
>> +               return ret;
>> +
>> +       ret = v4l2_async_notifier_add_fwnode_remote_subdev(ntf, ep,
>> +                                                          &cif_dev->asd);
>> +       if (ret)
>> +               return ret;
>> +
>> +       ntf->ops = &subdev_notifier_ops;
>> +
>> +       fwnode_handle_put(ep);
>> +
>> +       ret = v4l2_async_notifier_register(&cif_dev->v4l2_dev, ntf);
>> +       return ret;
>> +}
>> +
>> +static int rkcif_register_platform_subdevs(struct rkcif_device *cif_dev)
>> +{
>> +       int ret;
>> +
>> +       ret = rkcif_register_stream_vdev(cif_dev);
>> +       if (ret < 0)
>> +               return ret;
>> +
>> +       ret = cif_subdev_notifier(cif_dev);
>> +       if (ret < 0) {
>> +               v4l2_err(&cif_dev->v4l2_dev,
>> +                        "Failed to register subdev notifier(%d)\n", ret);
>> +               rkcif_unregister_stream_vdev(cif_dev);
>> +       }
>> +
>> +       return 0;
>> +}  
>
>> +
>> +static struct clk_bulk_data px30_cif_clks[] = {
>> +       { .id = "aclk" },
>> +       { .id = "hclk" },
>> +       { .id = "pclkin" },
>> +};
>> +
>> +static const struct cif_match_data px30_cif_match_data = {
>> +       .chip_id = CHIP_PX30_CIF,
>> +       .clks = px30_cif_clks,
>> +       .clks_num = ARRAY_SIZE(px30_cif_clks),
>> +};
>> +
>> +static const struct of_device_id rkcif_plat_of_match[] = {
>> +       {
>> +               .compatible = "rockchip,px30-cif",
>> +               .data = &px30_cif_match_data,
>> +       },
>> +       {},
>> +};
>> +
>> +static irqreturn_t rkcif_irq_handler(int irq, void *ctx)
>> +{
>> +       struct device *dev = ctx;
>> +       struct rkcif_device *cif_dev = dev_get_drvdata(dev);
>> +
>> +       rkcif_irq_oneframe(cif_dev);
>> +
>> +       return IRQ_HANDLED;
>> +}
>> +
>> +static void rkcif_disable_sys_clk(struct rkcif_device *cif_dev)
>> +{
>> +       int i;
>> +
>> +       for (i = cif_dev->data->clks_num - 1; i >= 0; i--)
>> +               clk_disable_unprepare(cif_dev->clks[i]);  
>
>clk_bulk_disable_unprepare
>
>> +}
>> +
>> +static int rkcif_enable_sys_clk(struct rkcif_device *cif_dev)
>> +{
>> +       int i, ret = -EINVAL;
>> +
>> +       for (i = 0; i < cif_dev->data->clks_num; i++) {
>> +               ret = clk_prepare_enable(cif_dev->clks[i]);
>> +  
>
>clk_bulk_enable_prepare
>
>> +               if (ret < 0)
>> +                       goto err;
>> +       }
>> +
>> +       return 0;
>> +
>> +err:
>> +       for (--i; i >= 0; --i)
>> +               clk_disable_unprepare(cif_dev->clks[i]);
>> +
>> +       return ret;
>> +}
>> +
>> +void rkcif_soft_reset(struct rkcif_device *cif_dev)
>> +{
>> +       reset_control_assert(cif_dev->cif_rst);
>> +
>> +       udelay(5);
>> +
>> +       reset_control_deassert(cif_dev->cif_rst);
>> +}
>> +
>> +static int rkcif_plat_probe(struct platform_device *pdev)
>> +{
>> +       struct device *dev = &pdev->dev;
>> +       struct v4l2_device *v4l2_dev;
>> +       struct rkcif_device *cif_dev;
>> +       const struct cif_match_data *data;
>> +       int ret, irq;
>> +
>> +       cif_dev = devm_kzalloc(dev, sizeof(*cif_dev), GFP_KERNEL);
>> +       if (!cif_dev)
>> +               return -ENOMEM;
>> +
>> +       dev_set_drvdata(dev, cif_dev);
>> +       cif_dev->dev = dev;
>> +
>> +       data = of_device_get_match_data(&pdev->dev);
>> +       if (!data)
>> +               return -EINVAL;
>> +
>> +       cif_dev->data = data;
>> +
>> +       irq = platform_get_irq(pdev, 0);
>> +       if (irq < 0)
>> +               return irq;
>> +
>> +       ret = devm_request_irq(dev, irq, rkcif_irq_handler, IRQF_SHARED,  
>
>I guess it's shared with the IOMMU, or is this a mistake?

Hmm you might be right, I'll need to check that.

>Note that you seem to always handle the interrupt.
>
>> +                              dev_driver_string(dev), dev);
>> +       if (ret < 0) {
>> +               dev_err(dev, "request irq failed: %d\n", ret);
>> +               return ret;
>> +       }
>> +
>> +       cif_dev->irq = irq;
>> +
>> +       cif_dev->base_addr = devm_platform_ioremap_resource(pdev, 0);
>> +       if (IS_ERR(cif_dev->base_addr))
>> +               return PTR_ERR(cif_dev->base_addr);
>> +
>> +       ret = of_reserved_mem_device_init(dev);  
>
>Can't find any mention to this reserved memory in the bindings documentation.
>Perhaps you can add an example and/or add some comments for this?

yes this should be added in the binding, you're correct.

>> +       if (ret)
>> +               v4l2_info(v4l2_dev, "No reserved memory region assign to CIF\n");
>> +
>> +       ret = devm_clk_bulk_get(dev, data->clks_num, data->clks);
>> +       if (ret)
>> +               return ret;
>> +
>> +       cif_dev->cif_rst = devm_reset_control_array_get(dev, false, false);
>> +       if (IS_ERR(cif_dev->cif_rst))
>> +               return PTR_ERR(cif_dev->cif_rst);
>> +
>> +       /* Initialize the stream */
>> +       rkcif_stream_init(cif_dev);
>> +
>> +       strlcpy(cif_dev->media_dev.model, "rkcif",
>> +               sizeof(cif_dev->media_dev.model));
>> +       cif_dev->media_dev.dev = &pdev->dev;
>> +       v4l2_dev = &cif_dev->v4l2_dev;
>> +       v4l2_dev->mdev = &cif_dev->media_dev;
>> +       strlcpy(v4l2_dev->name, "rkcif", sizeof(v4l2_dev->name));
>> +       v4l2_ctrl_handler_init(&cif_dev->ctrl_handler, 8);
>> +       v4l2_dev->ctrl_handler = &cif_dev->ctrl_handler;
>> +
>> +       ret = v4l2_device_register(cif_dev->dev, &cif_dev->v4l2_dev);
>> +       if (ret < 0)
>> +               return ret;
>> +
>> +       media_device_init(&cif_dev->media_dev);
>> +
>> +       ret = media_device_register(&cif_dev->media_dev);
>> +       if (ret < 0) {
>> +               v4l2_err(v4l2_dev, "Failed to register media device: %d\n",
>> +                        ret);
>> +               goto err_unreg_v4l2_dev;
>> +       }
>> +
>> +       /* create & register platefom subdev (from of_node) */
>> +       ret = rkcif_register_platform_subdevs(cif_dev);
>> +       if (ret < 0)
>> +               goto err_unreg_media_dev;
>> +
>> +       pm_runtime_enable(&pdev->dev);
>> +  
>
>Off the top of my head, I believe enabling PM runtime
>after registering the device to the world could be problematic.

Ah OK, I didn't know that.

>> +       return 0;
>> +
>> +err_unreg_media_dev:
>> +       media_device_unregister(&cif_dev->media_dev);
>> +err_unreg_v4l2_dev:
>> +       v4l2_device_unregister(&cif_dev->v4l2_dev);
>> +       return ret;
>> +}
>> +
>> +static int rkcif_plat_remove(struct platform_device *pdev)
>> +{
>> +       struct rkcif_device *cif_dev = platform_get_drvdata(pdev);
>> +
>> +       pm_runtime_disable(&pdev->dev);
>> +
>> +       media_device_unregister(&cif_dev->media_dev);
>> +       v4l2_device_unregister(&cif_dev->v4l2_dev);
>> +       rkcif_unregister_stream_vdev(cif_dev);
>> +
>> +       return 0;
>> +}
>> +
>> +static int __maybe_unused rkcif_runtime_suspend(struct device *dev)
>> +{
>> +       struct rkcif_device *cif_dev = dev_get_drvdata(dev);
>> +
>> +       rkcif_disable_sys_clk(cif_dev);
>> +
>> +       return pinctrl_pm_select_sleep_state(dev);
>> +}
>> +
>> +static int __maybe_unused rkcif_runtime_resume(struct device *dev)
>> +{
>> +       struct rkcif_device *cif_dev = dev_get_drvdata(dev);
>> +       int ret;
>> +
>> +       ret = pinctrl_pm_select_default_state(dev);
>> +       if (ret < 0)
>> +               return ret;
>> +       rkcif_enable_sys_clk(cif_dev);
>> +  
>
>Just move the clock handling here and avoid defining rkcif_enable_sys_clk ?

Yup, I'll do that too

>> +       return 0;
>> +}
>> +
>> +static const struct dev_pm_ops rkcif_plat_pm_ops = {
>> +       SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
>> +                               pm_runtime_force_resume)
>> +       SET_RUNTIME_PM_OPS(rkcif_runtime_suspend, rkcif_runtime_resume, NULL)
>> +};
>> +
>> +static struct platform_driver rkcif_plat_drv = {
>> +       .driver = {
>> +                  .name = CIF_DRIVER_NAME,
>> +                  .of_match_table = of_match_ptr(rkcif_plat_of_match),
>> +                  .pm = &rkcif_plat_pm_ops,
>> +       },
>> +       .probe = rkcif_plat_probe,
>> +       .remove = rkcif_plat_remove,
>> +};
>> +
>> +module_platform_driver(rkcif_plat_drv);
>> +MODULE_AUTHOR("Rockchip Camera/ISP team");  
>
>MODULE_AUTHOR goes to the module's metadata,
>e.g. for users to query driver's authors.
>
>I've had to upstream drivers originally written by other
>people, and I've wondered what's the value of
>putting a team as author.
>
>> +MODULE_DESCRIPTION("Rockchip CIF platform driver");
>> +MODULE_LICENSE("GPL");  
>
>Thanks for the hard work,

And thanks for the thourough review !! This helps a lot !

Maxime

>Ezequiel



-- 
Maxime Chevallier, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
