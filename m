Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1AEF1109FE2
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2019 15:06:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728237AbfKZOGn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Nov 2019 09:06:43 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:56744 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727568AbfKZOGn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Nov 2019 09:06:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=PvdG4JdJMkn4aiB8XFwQxB/RHl6yO077GsuggOmt/W0=; b=If6wmuftdgEHb6mPxoQrhQ0fX
        6b5JHO52peOQjiwR2i1+WJbULrRcRhmGGNQkdZVoEIy+s5AORPDZtwY/mTRd/kxjOgejN0L8NRI+5
        KeXvBj/FygNUe07MJ8M8iJgIZOLGfpIFI9u0FWz0vZ+997TyUEix+wiweIc+0dqiBgjYAXGY1PkJu
        dJ4TCUHUFNKPJl0hIWjynK4VYMorot7UZZ5+xSx1xwq3lRXi4fBgWDlmoLPZgfPjB2g+3cb7ZgQtf
        ereJqdeb2fN83CInufS27BkchRGowm2yPtwzI5ZHQF/a2ym3N3zR12HxLadBOoYZTVXv0yTEdw/Pb
        9odlN1JDA==;
Received: from [80.156.29.194] (helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1iZbUG-0004yG-PI; Tue, 26 Nov 2019 14:06:41 +0000
Date:   Tue, 26 Nov 2019 15:06:35 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL for v5.5-rc1] media updates
Message-ID: <20191126150635.18ef45a9@kernel.org>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Linus,

Please pull from:

  git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/me=
dia/v5.5-1

For:

- uAPI documentation for statelesss decoders;
- Added a new CEC ioctl together with its documentation;
- Improved IPU3 documentation;
- New i2c drivers: hi556 and imx290;
- Added support on Vivid driver for meta streams;
- Added de-interlace support for sunxi subdriver;
- Added a few new remote controler keymaps;
- Added H.265 support for Sunxi Cedrus driver;
- Another round of random driver cleanups, fixes and improvements.

Thanks!
Mauro

--

The following changes since commit 54ecb8f7028c5eb3d740bb82b0f1d90f2df63c5c:

  Linux 5.4-rc1 (2019-09-30 10:35:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/me=
dia/v5.5-2

for you to fetch changes up to dca6b3733a4a46e63603496f544ece8ace541fde:

  media: Revert "media: mtk-vcodec: Remove extra area allocation in an inpu=
t buffer on encoding" (2019-11-10 18:10:11 +0100)

----------------------------------------------------------------
media updates for v5.5-rc1

----------------------------------------------------------------
A Sun (1):
      media: mceusb: fix out of bounds read in MCE receiver buffer

Akihiro Tsukada (4):
      media: dvb-usb-v2/gl861: remove device-specific i2c algo
      media: dvb-usb-v2/gl861: remove an un-used header file
      media: dvb-frontends/tc90522: extend i2c algo to support some devices
      media: dvb-usb-gl861: support I2C read from tuner via demod

Alan Stern (2):
      media: usbvision: Fix invalid accesses after device disconnect
      media: usbvision: Fix races among open, close, and disconnect

Alexander Popov (1):
      media: vivid: Fix wrong locking that causes race conditions on stream=
ing stop

Alexandre Courbot (4):
      media: mtk-vcodec: vdec: set VPI IPI handler in one place
      media: mtk-vcodec: vdec: clean up vidioc_vdec_s_fmt a bit
      media: docs-rst: Document m2m stateless video decoder interface
      media: Documentation: v4l: fix section depth

Amol Grover (1):
      media: staging: media: imx: Fix alignment to match open parenthesis

Andrei Koshkosh (1):
      media: dvbsky: use a single mutex and state buffers for all R/W ops

Andy Shevchenko (1):
      media: bt819: Reduce amount of F* words in the world

Aniket Masule (2):
      media: venus: Add codec data table
      media: venus: Update clock scaling

Antti Palosaari (1):
      media: gl861: re-implement I2C adapter logic

Arnd Bergmann (1):
      media: venus: remove invalid compat_ioctl32 handler

Arthur Moraes do Lago (1):
      media: vimc: Implement debayer control for mean window size

Benoit Parrot (42):
      media: am437x-vpfe: Fix missing first line
      media: am437x-vpfe: Rework ISR routine for clarity
      media: am437x-vpfe: Wait for end of frame before tear-down
      media: am437x-vpfe: fix start streaming error path
      media: am437x-vpfe: Streamlined vb2 buffer cleanup
      media: am437x-vpfe: Setting STD to current value is not an error
      media: am437x-vpfe: Use a per instance format array instead of a stat=
ic one
      media: am437x-vpfe: fix function trace debug log
      media: am437x-vpfe: TRY_FMT ioctl is not really trying anything
      media: am437x-vpfe: Remove per bus width static data
      media: am437x-vpfe: Switch to SPDX Licensing
      media: i2c: ov2659: Fix for image wrap-around in lower resolution
      media: i2c: ov2659: Fix sensor detection to actually fail when device=
 is not present
      media: i2c: ov2659: Cleanup include file list
      media: i2c: ov2659: fix s_stream return value
      media: dt-bindings: ov2659: add powerdown/reset-gpios optional proper=
ty
      media: i2c: ov2659: Add powerdown/reset gpio handling
      media: i2c: ov2659: Fix missing 720p register config
      media: i2c: ov2659: Switch to SPDX Licensing
      media: ti-vpe: Fix a parallel build issue
      media: ti-vpe: vpe: Fix Motion Vector vpdma stride
      media: ti-vpe: vpe: Add missing null pointer checks
      media: ti-vpe: vpe: Remove unnecessary use of container_of
      media: ti-vpe: vpe: fix a v4l2-compliance failure causing a kernel pa=
nic
      media: ti-vpe: vpe: fix a v4l2-compliance warning about invalid pixel=
 format
      media: ti-vpe: vpe: Make sure YUYV is set as default format
      media: ti-vpe: vpe: fix a v4l2-compliance failure about invalid sizei=
mage
      media: ti-vpe: vpe: fix a v4l2-compliance failure about frame sequenc=
e number
      media: ti-vpe: vpe: ensure buffers are cleaned up properly in abort c=
ases
      media: ti-vpe: vpdma: Use fixed type for address in descriptor
      media: ti-vpe: Set the DMA mask and coherent mask
      media: ti-vpe: vpe: use standard struct instead of duplicating fields
      media: ti-vpe: vpe: fix v4l2_compliance issue related to xfer_func
      media: ti-vpe: csc: rgb-to-yuv HD full range coeff are wrong
      media: v4l2-common: add pixel encoding support
      media: v4l2-common: add RGB565 and RGB55 to v4l2_format_info
      media: ti-vpe: vpe: don't rely on colorspace member for conversion
      media: ov5640: add PIXEL_RATE control
      media: ov5640: Fix 1920x1080 mode to remove extra enable/disable
      media: ov5640: Make 2592x1944 mode only available at 15 fps
      media: dt-bindings: media: ti-vpe: Document VPE driver
      media: ti-vpe: vpe: fix compatible to match bindings

Biju Das (4):
      media: dt-bindings: rcar-vin: Add R8A774B1 support
      media: dt-bindings: rcar-csi2: Add R8A774B1 support
      media: rcar-vin: Enable support for R8A774B1
      media: rcar-csi2: Enable support for R8A774B1

Bingbu Cao (3):
      media: doc-rst: add more info for resolution change blocks in ipu3
      media: doc-rst: ipu3: clarification on data type conversion of IEFD CU
      media: staging/intel-ipu3: remove the unnecessary compiler flags

Boris Brezillon (3):
      media: hantro: h264: Fix a comment in b1_ref_list_cmp()
      media: hantro: h264: Rename POC_CMP() into HANTRO_CMP()
      media: hantro: h264: Fix the frame_num wraparound case

Chris Paterson (1):
      media: MAINTAINERS: Update MAX2175 & R-Car DRIF driver maintainer ema=
il

Christian Hewitt (1):
      media: rc: add keymap for Tronsmart Vega S95/S96 remote

Christophe JAILLET (5):
      media: seco-cec: Add a missing 'release_region()' in an error handlin=
g path
      media: v4l: cadence: Fix how unsued lanes are handled in 'csi2rx_star=
t()'
      media: cx88: Fix some error handling path in 'cx8800_initdev()'
      media: uvcvideo: Fix a typo in UVC_METATADA_BUF_SIZE
      media: i2c: adv7842: make array cri static and const, makes object sm=
aller

Chuhong Yuan (3):
      media: st-mipid02: add a check for devm_gpiod_get_optional
      media: imx7-mipi-csis: Add a check for devm_regulator_get
      media: si470x-i2c: add missed operations in remove

Cl=C3=A9ment P=C3=A9ron (2):
      media: rc: add keymap for Beelink GS1 remote control
      media: arm64: dts: allwinner: beelink-gs1: Add rc-beelink-gs1 keymap

Colin Ian King (16):
      media: i2c: mt9m001: make array init_regs static, makes object smaller
      media: s3c-camif: make array 'registers' static const, makes object s=
maller
      media: em28xx: make various arrays static const, makes object smaller
      media: cxd2820r: make arrays tab static const, makes object smaller
      media: drxj: remove redundant assignment to variable rc
      media: cx18: make array mapping static, makes object smaller
      media: gspca: make array st6422_bridge_init static, makes object smal=
ler
      media: ti-vpe: vpe: use r2y instead of y2r, copy-paste error
      media: gspca: remove redundant assignment to variable ret
      media: lm3646: remove redundant assignment to variable rval
      media: cx231xx: remove redundant assignment to variable status
      media: imx7-mipi-csis: make array 'registers' static const, makes obj=
ect smaller
      media: vpx3220: make array input_vals static, makes object smaller
      media: siano: fix spelling mistake "ENBALE" -> "ENABLE"
      media: flexcop-usb: ensure -EIO is returned on error condition
      media: zr364xx: remove redundant assigmnent to idx, clean up code

Cristiane Naves (1):
      media: staging: media: allegro-dvt: remove bool comparison

Dafna Hirschfeld (12):
      media: vimc: initialize vim entity pointers to NULL
      media: vimc: cleanup code that assigns entity in entities array
      media: vimc: sen: register subdevice only after initialization
      media: vimc: move media_entity_cleanup to release callbacks
      media: vimc: remove the helper function vimc_ent_sd_unregister
      media: vimc: remove EXPORT_SYMBOL_GPL declarations
      media: vimc: common: remove unused function 'vimc_pipeline_s_stream'
      media: vimc: remove unused struct declaration vimc_platform_data
      media: vimc: embed the pads of entities in the entities' structs
      media: vimc: move the dev field of each entity to vimc_ent_dev
      media: vimc: sen: remove unused kthread_sen field
      media: vimc: upon streaming, check that the pipeline starts with a so=
urce entity

Dan Carpenter (1):
      media: smiapp: unlock on error in smiapp_start_streaming()

Daniel Gonzalez Cabanelas (1):
      media: cx88: Add support for NotOnlyTV LV3H card

Dariusz Marcinkiewicz (2):
      media: cec: expose the new connector info API
      media: cec: document CEC_ADAP_G_CONNECTOR_INFO and capability

Dave Gerlach (1):
      media: am437x-vpfe: Fix suspend path to always handle pinctrl config

Dominik Danelski (1):
      media: em28xx: Add support for Magix Wideowandler 2

Dongchun Zhu (1):
      media: i2c: ov5695: Modify the function of async register subdev rela=
ted devices

Ezequiel Garcia (3):
      media: hantro: Simplify macroblock macros
      media: hantro: Simplify buffer helpers
      media: hantro: Fix s_fmt for dynamic resolution changes

Fabio Estevam (6):
      media: adv7180: Only print 'chip found' message on successful probe
      media: imx.rst: Specify the sabreauto variant
      media: imx.rst: Provide a real example for the output format
      media: imx.rst: Provide instructions for the i.MX6DL sabreauto
      media: imx.rst: Pass the v4l2-ctl configuration
      media: staging/imx: Use a shorter name for driver

Flavius Georgescu (1):
      media: rc: Add support for another iMON 0xffdc device

Francois Buergisser (2):
      media: hantro: Fix motion vectors usage condition
      media: hantro: Fix picture order count table enable

Geert Uytterhoeven (3):
      media: i2c: Use div64_ul() for u64-by-unsigned-long divide
      media: fdp1: Fix R-Car M3-N naming in debug message
      media: dt-bindings: rcar_vin: Document RZ/G1 per-board settings

Gon Solo (2):
      media: si2157: Add option for not downloading firmware.
      media: af9035: add support for Logilink VG0022A.

Hans Verkuil (35):
      media: cedrus: fill in bus_info for media device
      media: cedrus: choose default pixelformat in try_fmt
      media: cedrus: fix various format-related compliance issues
      media: ext-ctrls-flash.rst: fix typo
      media: v4l2-dv-timings.c: fix format string
      media: vidioc-g-fbuf.rst: remove duplicate 'struct'
      media: uapi/linux/cec.h: add defines for the CEC UI Command Operand
      media: cec/cec-adap.c: use new UI_CMD defines
      media: cec.h: CEC_OP_REC_FLAG_ values were swapped
      media: cec-gpio: add notifier support
      media: cx231xx: convert to the vb2 framework
      media: cec-funcs.h: add status_req checks
      media: cec-funcs.h: use new CEC_OP_UI_CMD defines
      media: vb2: add V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF
      media: v4l2-mem2mem: support held capture buffers
      media: videodev2.h: add V4L2_DEC_CMD_FLUSH
      media: v4l2-mem2mem: add new_frame detection
      media: v4l2-dev: simplify the SDR checks
      media: v4l2-dev: fix is_tch checks
      media: v4l2-dev: disable frequency and tuner ioctls for touch
      media: cec-pin: add 'received' callback
      media: vivid: media_device_cleanup was called too early
      media: am437x: fix smatch warning
      media: mtk-vpu: fix two smatch warnings
      media: rc/ite-cir: fix smatch warning
      media: em28xx: fix two smatch warnings
      media: ti-vpe: fix smatch error
      media: ov6650: fix smatch warning
      media: mantis: fix two smatch errors
      media: vivid: add vivid_create_queue() helper
      media: v4l2-device.h: fix typo: putss -> puts
      media: v4l2-ioctl.c: zero reserved fields for S/TRY_FMT
      media: vim2m: media_device_cleanup was called too early
      media: vicodec: media_device_cleanup was called too early
      media: Revert "media: mtk-vcodec: Remove extra area allocation in an =
input buffer on encoding"

Hariprasad Kelam (1):
      media: staging: media: Make use of devm_platform_ioremap_resource

Hirokazu Honda (1):
      media: mtk-vcodec: Remove extra area allocation in an input buffer on=
 encoding

Jae Hyun Yoo (3):
      media: aspeed: refine hsync/vsync polarity setting logic
      media: aspeed: set hsync and vsync polarities to normal before starti=
ng mode detection
      media: aspeed: clear garbage interrupts

Jan Pieter van Woerkom (1):
      media: dvbsky: remove unused code

Janusz Krzysztofik (16):
      media: ov6650: Fix MODULE_DESCRIPTION
      media: ov6650: Fix control handler not freed on init error
      media: ov6650: Fix crop rectangle alignment not passed back
      media: ov6650: Fix incorrect use of JPEG colorspace
      media: ov6650: Fix some format attributes not under control
      media: ov6650: Fix .get_fmt() V4L2_SUBDEV_FORMAT_TRY support
      media: ov6650: Fix default format not applied on device probe
      media: ov6650: Fix stored frame format not in sync with hardware
      media: ov6650: Fix stored crop rectangle not in sync with hardware
      media: ov6650: Fix stored frame interval not in sync with hardware
      media: ov6650: Drop obsolete .pclk_limit attribute
      media: ov6650: Simplify clock divisor calculation
      media: ov6650: Don't reapply pixel clock divisor on format change
      media: ov6650: Drop unused .pclk_max field
      media: ov6650: Fix arbitrary selection of master clock rate
      media: v4l2-subdev: Don't use __u32 internally

Jeeeun Evans (1):
      media: staging: media: imx: Use devm_platform_ioremap_resource().

Jernej Skrabec (11):
      media: vim2m: Fix abort issue
      media: v4l2-mem2mem: add stateless_(try_)decoder_cmd ioctl helpers
      media: cedrus: h264: Support multiple slices per frame
      media: dt-bindings: media: Add Allwinner H3 Deinterlace binding
      media: sun4i: Add H3 deinterlace driver
      media: cedrus: Fix decoding for some H264 videos
      media: cedrus: Use helpers to access capture queue
      media: v4l2-mem2mem: Fix hold buf flag checks
      media: cedrus: Properly signal size in mode register
      media: cedrus: Fix H264 4k support
      media: cedrus: Increase maximum supported size

Jisheng Zhang (1):
      media: rc-map: Sort rc map name MACROs

Johan Hovold (2):
      media: bdisp: fix memleak on release
      media: radio: wl1273: fix interrupt masking on release

Jonas Karlman (9):
      media: uapi: h264: clarify expected scaling_list_4x4/8x8 order
      media: cedrus: Use correct H264 8x8 scaling list
      media: hantro: Do not reorder H264 scaling list
      media: hantro: Fix H264 max frmsize supported on RK3288
      media: hantro: Fix H264 motion vector buffer offset
      media: hantro: Reduce H264 extra space for motion vectors
      media: hantro: Use output buffer width and height for H264 decoding
      media: hantro: Remove now unused H264 pic_size
      media: hantro: Set H264 FIELDPIC_FLAG_E flag correctly

Kangjie Lu (1):
      media: rcar_drif: fix a memory disclosure

Kefeng Wang (1):
      media: vim2m: Fix BUG_ON in vim2m_device_release()

Laurent Pinchart (1):
      media: uvcvideo: Fix error path in control parsing failure

Loic Poulain (1):
      media: venus: core: Fix msm8996 frequency table

Lucas Stach (1):
      media: coda: request to skip kernel mapping for decoded buffers

Manivannan Sadhasivam (2):
      media: dt-bindings: media: i2c: Add IMX290 CMOS sensor binding
      media: i2c: Add IMX290 CMOS image sensor driver

Markus Elfring (2):
      media: rc: Use devm_platform_ioremap_resource() in tango_ir_probe()
      media: platform: Use devm_platform_ioremap_resource() in two functions

Mauro Carvalho Chehab (5):
      media: venus: fix build on 32bit environments
      media: si2168: use bits instead of bool for flags
      media: af9035: add the formula used for the I2C speed
      media: mb86a20s: make the bit rate estimation function more generic
      media: cxd2841er: avoid too many status inquires

Mike Isely (1):
      media: pvrusb2: Fix oops on tear-down when radio support is not prese=
nt

Nachammai Karuppiah (1):
      media: staging: media: omap4iss: Replace NULL comparison.

Navid Emamdoost (5):
      media: rc: prevent memory leak in cx23888_ir_probe
      media: gspca: null check create_singlethread_workqueue
      media: usb: null check create_singlethread_workqueue
      media: usb: fix memory leak in af9005_identify_state
      media: aspeed-video: Fix memory leaks in aspeed_video_probe

Neil Armstrong (1):
      media: MAINTAINERS: ao-cec: Update path for yaml bindings

Nikhil Devshatwar (2):
      media: ti-vpe: Add support for SEQ_BT
      media: ti-vpe: Add support for NV21 format

Niklas S=C3=B6derlund (11):
      media: rcar-vin: Fix incorrect return statement in rvin_try_format()
      media: rcar-vin: Make use of V4L2_FIELD_IS_INTERLACED() macro
      media: rcar-vin: Rename rectangle holding the video source information
      media: rcar-vin: Do not reset the crop and compose rectangles in s_fmt
      media: rcar-vin: Add support for V4L2_FIELD_ALTERNATE
      media: rcar-vin: Rename wrongly named rectangle
      media: rcar-vin: Create compose rectangle where it is used
      media: rcar-vin: Use bytes per line instead of width for UV offset
      media: rcar-vin: Do not enumerate unsupported pixel formats
      media: rcar-vin: Define which hardware supports NV12
      media: rcar-vin: Add support for outputting NV12

Nishad Kamdar (6):
      media: rc: Use the correct style for SPDX License Identifier
      media: usb: tm6000: Use the correct style for SPDX License Identifier
      media: tuners: Use the correct style for SPDX License Identifier
      media: xilinx: Use the correct style for SPDX License Identifier
      media: siano: Use the correct style for SPDX License Identifier
      media: i2c: Use the correct style for SPDX License Identifier

N=C3=ADcolas F. R. A. Prado (1):
      media: vimc: Make capture devices and subdevices use different link_v=
alidates

Oliver Neukum (1):
      media: b2c2-flexcop-usb: add sanity checking

Paul Kocialkowski (5):
      media: cedrus: Fix undefined shift with a SHIFT_AND_MASK_BITS macro
      media: cedrus: Remove unnecessary parenthesis around DIV_ROUND_UP
      media: v4l: Add definitions for HEVC stateless decoding
      media: pixfmt: Document the HEVC slice pixel format
      media: cedrus: Add HEVC/H.265 decoding support

Philipp Zabel (10):
      media: hantro: streamline open, reuse error path
      media: uapi: h264: clarify dec_ref_pic_marking_bit_size fields
      media: uapi: h264: clarify V4L2_PIX_FMT_H264_SLICE format
      media: uapi: h264: clarify num_ref_idx_l[01]_(default_)active fields
      media: imx: enable V4L2_PIX_FMT_XBGR32, _BGRX32, and _RGBX32
      media: coda: fix deadlock between decoder picture run and start comma=
nd
      media: s5p-jpeg: drop unused components from s5p_jpeg_q_data
      media: coda: drop unused irqlock
      media: coda: disable encoder compose selections
      media: coda: disable decoder crop selections

Pi-Hsun Shih (1):
      media: v4l2-ctrl: Lock main_hdl on operations of requests_queued.

Pragnesh Patel (1):
      media: dt-bindings: Fix building error for dt_binding_check

Ram Prasad (1):
      media: ti-vpe: Set MAX height supported to 2048 pixels

Ricardo Ribalda Delgado (21):
      media: v4l2-core: Implement v4l2_ctrl_new_std_compound
      media: Documentation: v4l2_ctrl_new_std_compound
      media: add V4L2_CTRL_TYPE_AREA control type
      media: Documentation: media: Document V4L2_CTRL_TYPE_AREA
      media: add V4L2_CID_UNIT_CELL_SIZE control
      media: Documentation: media: Describe V4L2_CID_UNIT_CELL_SIZE
      media: v4l2-ctrl: Add new helper v4l2_ctrl_ptr_create
      media: imx214: Add new control with V4L2_CID_UNIT_CELL_SIZE
      media: ad5820: Define entity function
      media: ad5820: DT new optional field enable-gpios
      media: ad5820: Add support for enable pin
      media: ad5820: Add support for of-autoload
      media: ad5820: DT new compatible devices
      media: ad5820: Add support for ad5821 and ad5823
      media: v4l2_ctrl: Add p_def to v4l2_ctrl_config
      media: v4l2_ctrl: Add const pointer to ctrl_ptr
      media: vivid: Add an area control
      media: v4l2_core: Add p_area to struct v4l2_ext_control
      media: Documentation: v42l_core: v4l2_ext_control
      media: v4l2-ctrl: Use p_const when possible
      media: Documentation: media: *_DEFAULT targets for subdevs

Sakari Ailus (16):
      media: v4l: Put camera sensor, lens and flash drivers under MEDIA_CAM=
ERA_SUPPORT
      media: v4l: fwnode: Make v4l2_fwnode_endpoint_free() safer
      media: smiapp: Use the BIT macro where appropriate, remove useless de=
finition
      media: smiapp: Fix error handling at NVM reading
      media: smiapp: Refactor reading NVM page
      media: smiapp: Add definitions for data transfer if capability bits
      media: smiapp: Don't poll for NVM ready on devices that don't need it
      media: smiapp: Support probing NVM size
      media: dt-bindings: smia: Remove documentation of nokia,nvm-size
      media: smiapp: Destroy sensor's mutex
      media: smiapp: Don't get binning limits dynamically
      media: smiapp: Move binning configuration to streaming start
      media: smiapp: Don't update sensor configuration during power-on init
      media: smiapp: Use non-binned and binned limits correctly
      media: smiapp: Register sensor after enabling runtime PM on the device
      media: smiapp: Rename update_mode as pll_blanking_update

Sean Young (8):
      media: saa7164: use debugfs rather than procfs for debugging file
      media: delete unused proc_fs.h include
      media: rc: mark input device as pointing stick
      media: rc: increase rc-mm tolerance and add debug message
      media: rtl28xxu: set keymap for Astrometa DVB-T2
      media: rtl28xxu: fix idle handling
      media: imon_raw: simplify loop
      media: imon: invalid dereference in imon_touch_event

Sebastian Andrzej Siewior (1):
      media: cec-gpio: Use CONFIG_PREEMPTION

Seung-Woo Kim (2):
      media: exynos4-is: Fix recursive locking in isp_video_release()
      media: exynos4-is: fix wrong mdev and v4l2 dev order in error path

Shawn Tu (1):
      media: hi556: Add support for Hi-556 sensor

Shuah Khan (5):
      media: vimc: Collapse component structure into a single monolithic dr=
iver
      media: vimc: Fix gpf in rmmod path when stream is active
      media: vimc: move duplicated IS_SRC and IS_SINK to common header
      media: doc: media: vimc: Update module parameter usage information
      media: MAINTAINERS: Add reviewer to vimc driver

Simon Horman (1):
      media: dt-bindings: sh-mobile-ceu: Remove now unimplemented bindings =
documentation

Stanimir Varbanov (2):
      media: venus: Use on-chip interconnect API
      media: venus: Fix occasionally failures to suspend

Steve Longerbeam (2):
      media: imx: Move capture device init to registered
      media: imx: Move pads init to probe

Thomas Voegtle (1):
      media: dvbsky: add support for eyeTV Geniatech T2 lite

Vandana BN (7):
      media: vivid: Set vid_cap_streaming and vid_out_streaming to true
      media: v4l2-core: correctly validate video and metadata ioctls
      media: vivid: Add metadata capture support
      media: Documentation:media:v4l2:Add vivid metadata doc
      media: v4l2-core: Add new metadata format
      media: vivid: Add metadata output support
      media: v4l2-core: fix touch support in v4l_g_fmt

Vito Caputo (1):
      media: cxusb: detect cxusb_ctrl_msg error in query

Wei Yongjun (1):
      media: vimc: Fix error return code in vimc_register_devices()

Yang Yingliang (1):
      media: flexcop-usb: fix NULL-ptr deref in flexcop_usb_transfer_init()

Yizhuo (1):
      media: media/pci/ivtv: Variable vbi.type could be uninitialized if ma=
cro v4l2_subdev_call set __result an error code

YueHaibing (4):
      media: max2175: Fix build error without CONFIG_REGMAP_I2C
      media: cx231xx: remove duplicated include from cx231xx-417.c
      media: i2c: ov5695: Fix randbuild error
      media: staging: media: cedrus: use devm_platform_ioremap_resource() t=
o simplify code

Yunfei Dong (1):
      media: mtk-vcodec: vdec: fix incorrect pointer dereference

zhengbin (1):
      media: mc-device.c: fix memleak in media_device_register_entity

zhong jiang (4):
      media: dvb-frontends: Use DIV_ROUND_CLOSEST directly to make it reada=
ble
      media: tuners/qm1d1c0042: Use DIV_ROUND_CLOSEST directly to make it r=
eadable
      media: v4l2-dv-timings: Use DIV_ROUND_CLOSEST directly to make it rea=
dable
      media: v4l2: Use FIELD_SIZEOF directly

 .../bindings/media/allwinner,sun4i-a10-csi.yaml    |    2 +-
 .../media/allwinner,sun8i-h3-deinterlace.yaml      |   76 ++
 .../devicetree/bindings/media/i2c/ad5820.txt       |   11 +-
 .../devicetree/bindings/media/i2c/imx290.txt       |   57 +
 .../devicetree/bindings/media/i2c/nokia,smia.txt   |    2 -
 .../devicetree/bindings/media/i2c/ov2659.txt       |    9 +
 Documentation/devicetree/bindings/media/rc.yaml    |    1 +
 .../devicetree/bindings/media/renesas,csi2.txt     |    1 +
 .../devicetree/bindings/media/renesas,vin.txt      |    5 +-
 .../devicetree/bindings/media/sh_mobile_ceu.txt    |   17 -
 .../devicetree/bindings/media/ti,vpe.yaml          |   64 ++
 Documentation/media/cec.h.rst.exceptions           |   89 ++
 Documentation/media/kapi/v4l2-controls.rst         |    9 +
 Documentation/media/uapi/cec/cec-funcs.rst         |    1 +
 .../media/uapi/cec/cec-ioc-adap-g-caps.rst         |    6 +-
 .../media/uapi/cec/cec-ioc-adap-g-conn-info.rst    |  105 ++
 Documentation/media/uapi/cec/cec-ioc-dqevent.rst   |    8 +
 Documentation/media/uapi/mediactl/request-api.rst  |    4 +-
 Documentation/media/uapi/v4l/biblio.rst            |    9 +
 Documentation/media/uapi/v4l/buffer.rst            |   13 +
 Documentation/media/uapi/v4l/dev-mem2mem.rst       |    1 +
 .../media/uapi/v4l/dev-stateless-decoder.rst       |  424 +++++++
 Documentation/media/uapi/v4l/ext-ctrls-codec.rst   |  569 +++++++++-
 Documentation/media/uapi/v4l/ext-ctrls-flash.rst   |    2 +-
 .../media/uapi/v4l/ext-ctrls-image-source.rst      |   10 +
 Documentation/media/uapi/v4l/meta-formats.rst      |    1 +
 Documentation/media/uapi/v4l/pixfmt-compressed.rst |   35 +-
 Documentation/media/uapi/v4l/pixfmt-meta-vivid.rst |   60 +
 .../media/uapi/v4l/v4l2-selection-targets.rst      |    4 +-
 .../media/uapi/v4l/vidioc-decoder-cmd.rst          |   10 +-
 .../media/uapi/v4l/vidioc-g-ext-ctrls.rst          |    5 +
 Documentation/media/uapi/v4l/vidioc-g-fbuf.rst     |    2 +-
 Documentation/media/uapi/v4l/vidioc-queryctrl.rst  |   24 +
 Documentation/media/uapi/v4l/vidioc-reqbufs.rst    |    6 +
 Documentation/media/v4l-drivers/imx.rst            |   75 +-
 Documentation/media/v4l-drivers/ipu3.rst           |   53 +-
 Documentation/media/v4l-drivers/ipu3_rcb.svg       |  331 ++++++
 Documentation/media/v4l-drivers/vimc.rst           |   16 +-
 Documentation/media/videodev2.h.rst.exceptions     |    5 +
 MAINTAINERS                                        |   32 +-
 .../boot/dts/allwinner/sun50i-h6-beelink-gs1.dts   |    1 +
 drivers/media/cec/cec-adap.c                       |   12 +-
 drivers/media/cec/cec-api.c                        |   20 +
 drivers/media/cec/cec-core.c                       |    5 -
 drivers/media/cec/cec-pin.c                        |   10 +
 drivers/media/common/siano/smscoreapi.c            |    4 +-
 drivers/media/common/siano/smscoreapi.h            |    4 +-
 drivers/media/common/siano/smsir.h                 |    2 +-
 drivers/media/common/videobuf2/videobuf2-v4l2.c    |   12 +-
 drivers/media/dvb-frontends/cxd2820r_c.c           |    2 +-
 drivers/media/dvb-frontends/cxd2820r_t.c           |    2 +-
 drivers/media/dvb-frontends/cxd2820r_t2.c          |    2 +-
 drivers/media/dvb-frontends/cxd2841er.c            |   12 +-
 drivers/media/dvb-frontends/drx39xyj/drxj.c        |    2 +-
 drivers/media/dvb-frontends/mb86a20s.c             |   54 +-
 drivers/media/dvb-frontends/mt312.c                |   13 +-
 drivers/media/dvb-frontends/si2168.h               |   47 +-
 drivers/media/dvb-frontends/si2168_priv.h          |   10 +-
 drivers/media/dvb-frontends/tc90522.c              |   27 +-
 drivers/media/dvb-frontends/tc90522.h              |    3 +
 drivers/media/i2c/Kconfig                          |   80 +-
 drivers/media/i2c/Makefile                         |    2 +
 drivers/media/i2c/ad5820.c                         |   35 +-
 drivers/media/i2c/adv7180.c                        |    6 +-
 drivers/media/i2c/adv7842.c                        |    4 +-
 drivers/media/i2c/bt819.c                          |    2 +-
 drivers/media/i2c/hi556.c                          | 1200 ++++++++++++++++=
++++
 drivers/media/i2c/imx214.c                         |    9 +
 drivers/media/i2c/imx290.c                         |  884 ++++++++++++++
 drivers/media/i2c/lm3646.c                         |    2 +-
 drivers/media/i2c/max2175.c                        |    4 +-
 drivers/media/i2c/max2175.h                        |    4 +-
 drivers/media/i2c/mt9m001.c                        |    2 +-
 drivers/media/i2c/ov2659.c                         |  139 ++-
 drivers/media/i2c/ov5640.c                         |   33 +-
 drivers/media/i2c/ov5695.c                         |    2 +-
 drivers/media/i2c/ov6650.c                         |  266 +++--
 drivers/media/i2c/saa711x_regs.h                   |    2 +-
 drivers/media/i2c/smiapp/smiapp-core.c             |  326 +++---
 drivers/media/i2c/smiapp/smiapp-reg.h              |   36 +-
 drivers/media/i2c/smiapp/smiapp.h                  |    3 -
 drivers/media/i2c/st-mipid02.c                     |    5 +
 drivers/media/i2c/tda1997x_regs.h                  |    2 +-
 drivers/media/i2c/tvp5150_reg.h                    |    2 +-
 drivers/media/i2c/vpx3220.c                        |    2 +-
 drivers/media/mc/mc-device.c                       |   65 +-
 drivers/media/pci/cx18/cx18-ioctl.c                |    2 +-
 drivers/media/pci/cx23885/cx23888-ir.c             |    5 +-
 drivers/media/pci/cx88/cx88-cards.c                |   43 +
 drivers/media/pci/cx88/cx88-dvb.c                  |    1 +
 drivers/media/pci/cx88/cx88-video.c                |   11 +-
 drivers/media/pci/cx88/cx88.h                      |    1 +
 drivers/media/pci/dm1105/dm1105.c                  |    1 -
 drivers/media/pci/ivtv/ivtv-vbi.c                  |    2 +-
 drivers/media/pci/mantis/hopper_cards.c            |    4 +-
 drivers/media/pci/mantis/mantis_cards.c            |    4 +-
 drivers/media/pci/saa7164/saa7164-core.c           |  166 ++-
 drivers/media/pci/smipcie/smipcie.h                |    1 -
 drivers/media/platform/Kconfig                     |   17 +-
 drivers/media/platform/Makefile                    |    4 +-
 drivers/media/platform/am437x/am437x-vpfe.c        |  861 ++++++--------
 drivers/media/platform/am437x/am437x-vpfe.h        |   43 +-
 drivers/media/platform/am437x/am437x-vpfe_regs.h   |   10 +-
 drivers/media/platform/aspeed-video.c              |   58 +-
 drivers/media/platform/cadence/cdns-csi2rx.c       |    2 +-
 drivers/media/platform/cec-gpio/cec-gpio.c         |   41 +-
 drivers/media/platform/coda/coda-common.c          |   13 +-
 drivers/media/platform/coda/coda.h                 |    1 -
 drivers/media/platform/exynos4-is/fimc-isp-video.c |    2 +-
 drivers/media/platform/exynos4-is/media-dev.c      |    7 +-
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c |   20 +-
 .../media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c |    8 +-
 .../media/platform/mtk-vcodec/vdec/vdec_h264_if.c  |    1 -
 .../media/platform/mtk-vcodec/vdec/vdec_vp8_if.c   |    1 -
 .../media/platform/mtk-vcodec/vdec/vdec_vp9_if.c   |    1 -
 drivers/media/platform/mtk-vcodec/vdec_vpu_if.c    |    9 +-
 drivers/media/platform/mtk-vcodec/vdec_vpu_if.h    |    9 -
 drivers/media/platform/mtk-vpu/mtk_vpu.c           |    4 +-
 drivers/media/platform/qcom/venus/core.c           |   56 +-
 drivers/media/platform/qcom/venus/core.h           |   30 +
 drivers/media/platform/qcom/venus/helpers.c        |  247 +++-
 drivers/media/platform/qcom/venus/helpers.h        |    3 +-
 drivers/media/platform/qcom/venus/hfi_venus.c      |    6 +
 drivers/media/platform/qcom/venus/vdec.c           |   11 +-
 drivers/media/platform/qcom/venus/venc.c           |    7 +-
 drivers/media/platform/rcar-vin/rcar-core.c        |   17 +-
 drivers/media/platform/rcar-vin/rcar-csi2.c        |    4 +
 drivers/media/platform/rcar-vin/rcar-dma.c         |   63 +-
 drivers/media/platform/rcar-vin/rcar-v4l2.c        |  156 ++-
 drivers/media/platform/rcar-vin/rcar-vin.h         |    6 +-
 drivers/media/platform/rcar_drif.c                 |    1 +
 drivers/media/platform/rcar_fdp1.c                 |    2 +-
 drivers/media/platform/s3c-camif/camif-regs.c      |    2 +-
 drivers/media/platform/s5p-jpeg/jpeg-core.c        |    1 -
 drivers/media/platform/s5p-jpeg/jpeg-core.h        |    2 -
 drivers/media/platform/seco-cec/seco-cec.c         |    1 +
 drivers/media/platform/sti/bdisp/bdisp-v4l2.c      |    3 +-
 drivers/media/platform/sunxi/Makefile              |    1 +
 drivers/media/platform/sunxi/sun8i-di/Makefile     |    2 +
 drivers/media/platform/sunxi/sun8i-di/sun8i-di.c   | 1028 +++++++++++++++++
 drivers/media/platform/sunxi/sun8i-di/sun8i-di.h   |  237 ++++
 drivers/media/platform/ti-vpe/csc.c                |  254 +++--
 drivers/media/platform/ti-vpe/csc.h                |    4 +-
 drivers/media/platform/ti-vpe/vpdma.c              |   13 +-
 drivers/media/platform/ti-vpe/vpdma.h              |    2 +
 drivers/media/platform/ti-vpe/vpdma_priv.h         |    5 +-
 drivers/media/platform/ti-vpe/vpe.c                |  396 ++++---
 drivers/media/platform/vicodec/vicodec-core.c      |    4 +-
 drivers/media/platform/vim2m.c                     |    8 +-
 drivers/media/platform/vimc/Makefile               |    7 +-
 drivers/media/platform/vimc/vimc-capture.c         |  107 +-
 drivers/media/platform/vimc/vimc-common.c          |  171 +--
 drivers/media/platform/vimc/vimc-common.h          |  120 +-
 drivers/media/platform/vimc/vimc-core.c            |  215 ++--
 drivers/media/platform/vimc/vimc-debayer.c         |  182 +--
 drivers/media/platform/vimc/vimc-scaler.c          |  102 +-
 drivers/media/platform/vimc/vimc-sensor.c          |  109 +-
 drivers/media/platform/vimc/vimc-streamer.c        |   19 +-
 drivers/media/platform/vivid/Makefile              |    2 +-
 drivers/media/platform/vivid/vivid-cec.c           |    7 +-
 drivers/media/platform/vivid/vivid-core.c          |  368 ++++--
 drivers/media/platform/vivid/vivid-core.h          |   25 +
 drivers/media/platform/vivid/vivid-ctrls.c         |   89 ++
 drivers/media/platform/vivid/vivid-kthread-cap.c   |   62 +-
 drivers/media/platform/vivid/vivid-kthread-out.c   |   57 +-
 drivers/media/platform/vivid/vivid-meta-cap.c      |  201 ++++
 drivers/media/platform/vivid/vivid-meta-cap.h      |   29 +
 drivers/media/platform/vivid/vivid-meta-out.c      |  174 +++
 drivers/media/platform/vivid/vivid-meta-out.h      |   25 +
 drivers/media/platform/vivid/vivid-sdr-cap.c       |    8 +-
 drivers/media/platform/vivid/vivid-vid-cap.c       |    8 +-
 drivers/media/platform/vivid/vivid-vid-out.c       |    8 +-
 drivers/media/platform/xilinx/xilinx-dma.h         |    2 +-
 drivers/media/platform/xilinx/xilinx-vip.h         |    2 +-
 drivers/media/platform/xilinx/xilinx-vipp.h        |    2 +-
 drivers/media/platform/xilinx/xilinx-vtc.h         |    2 +-
 drivers/media/radio/radio-wl1273.c                 |    3 +-
 drivers/media/radio/si470x/radio-si470x-i2c.c      |    2 +
 drivers/media/rc/imon.c                            |   64 +-
 drivers/media/rc/imon_raw.c                        |   22 +-
 drivers/media/rc/ir-rcmm-decoder.c                 |    6 +-
 drivers/media/rc/ite-cir.c                         |    2 +-
 drivers/media/rc/keymaps/Makefile                  |    2 +
 drivers/media/rc/keymaps/rc-beelink-gs1.c          |   84 ++
 drivers/media/rc/keymaps/rc-vega-s9x.c             |   54 +
 drivers/media/rc/mceusb.c                          |  141 ++-
 drivers/media/rc/rc-core-priv.h                    |    2 +-
 drivers/media/rc/rc-main.c                         |    1 +
 drivers/media/rc/tango-ir.c                        |   14 +-
 drivers/media/tuners/qm1d1c0042.c                  |    2 +-
 drivers/media/tuners/si2157.c                      |    6 +
 drivers/media/tuners/si2157.h                      |   33 +-
 drivers/media/tuners/si2157_priv.h                 |    5 +-
 drivers/media/tuners/tuner-xc2028-types.h          |    2 +-
 drivers/media/tuners/tuner-xc2028.h                |    2 +-
 drivers/media/usb/b2c2/flexcop-usb.c               |   13 +-
 drivers/media/usb/cx231xx/Kconfig                  |    2 +-
 drivers/media/usb/cx231xx/cx231xx-417.c            |  508 +++------
 drivers/media/usb/cx231xx/cx231xx-audio.c          |    1 -
 drivers/media/usb/cx231xx/cx231xx-avcore.c         |    2 +-
 drivers/media/usb/cx231xx/cx231xx-cards.c          |    6 +-
 drivers/media/usb/cx231xx/cx231xx-vbi.c            |  172 ++-
 drivers/media/usb/cx231xx/cx231xx-vbi.h            |    2 +-
 drivers/media/usb/cx231xx/cx231xx-video.c          |  795 +++----------
 drivers/media/usb/cx231xx/cx231xx.h                |   30 +-
 drivers/media/usb/dvb-usb-v2/af9035.c              |   37 +-
 drivers/media/usb/dvb-usb-v2/dvb_usb.h             |    2 +
 drivers/media/usb/dvb-usb-v2/dvb_usb_core.c        |    1 +
 drivers/media/usb/dvb-usb-v2/dvbsky.c              |   28 +-
 drivers/media/usb/dvb-usb-v2/gl861.c               |  391 +++----
 drivers/media/usb/dvb-usb-v2/gl861.h               |   14 -
 drivers/media/usb/dvb-usb-v2/rtl28xxu.c            |    6 +-
 drivers/media/usb/dvb-usb/af9005.c                 |    5 +-
 drivers/media/usb/dvb-usb/cxusb.c                  |    3 +-
 drivers/media/usb/em28xx/em28xx-audio.c            |    1 -
 drivers/media/usb/em28xx/em28xx-cards.c            |   20 +
 drivers/media/usb/em28xx/em28xx-dvb.c              |   30 +-
 drivers/media/usb/em28xx/em28xx-i2c.c              |    4 +-
 drivers/media/usb/em28xx/em28xx.h                  |    1 +
 drivers/media/usb/gspca/sq905.c                    |    3 +
 drivers/media/usb/gspca/sq905c.c                   |    3 +
 drivers/media/usb/gspca/stv0680.c                  |    2 +-
 drivers/media/usb/gspca/stv06xx/stv06xx_st6422.c   |    2 +-
 drivers/media/usb/pvrusb2/pvrusb2-v4l2.c           |    9 +-
 drivers/media/usb/tm6000/tm6000-regs.h             |    2 +-
 drivers/media/usb/tm6000/tm6000-usb-isoc.h         |    2 +-
 drivers/media/usb/tm6000/tm6000.h                  |    2 +-
 drivers/media/usb/usbvision/usbvision-video.c      |   29 +-
 drivers/media/usb/uvc/uvc_driver.c                 |   28 +-
 drivers/media/usb/uvc/uvc_metadata.c               |    4 +-
 drivers/media/usb/uvc/uvc_queue.c                  |    2 +-
 drivers/media/usb/uvc/uvcvideo.h                   |    2 +-
 drivers/media/usb/zr364xx/zr364xx.c                |    7 +-
 drivers/media/v4l2-core/v4l2-common.c              |  128 ++-
 drivers/media/v4l2-core/v4l2-ctrls.c               |  199 +++-
 drivers/media/v4l2-core/v4l2-dev.c                 |  112 +-
 drivers/media/v4l2-core/v4l2-dv-timings.c          |    4 +-
 drivers/media/v4l2-core/v4l2-fwnode.c              |    1 +
 drivers/media/v4l2-core/v4l2-ioctl.c               |   77 +-
 drivers/media/v4l2-core/v4l2-mem2mem.c             |  190 +++-
 drivers/media/v4l2-core/v4l2-subdev.c              |    6 +-
 drivers/staging/media/allegro-dvt/nal-h264.c       |    2 +-
 drivers/staging/media/hantro/hantro.h              |   20 +-
 drivers/staging/media/hantro/hantro_drv.c          |   16 +-
 drivers/staging/media/hantro/hantro_g1_h264_dec.c  |   52 +-
 drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c |   11 +-
 drivers/staging/media/hantro/hantro_g1_vp8_dec.c   |   11 +-
 drivers/staging/media/hantro/hantro_h1_jpeg_enc.c  |    4 +-
 drivers/staging/media/hantro/hantro_h264.c         |  120 +-
 drivers/staging/media/hantro/hantro_hw.h           |    7 +-
 drivers/staging/media/hantro/hantro_v4l2.c         |   48 +-
 drivers/staging/media/hantro/rk3288_vpu_hw.c       |   20 +-
 drivers/staging/media/hantro/rk3399_vpu_hw.c       |   12 +-
 .../staging/media/hantro/rk3399_vpu_hw_jpeg_enc.c  |    4 +-
 .../staging/media/hantro/rk3399_vpu_hw_mpeg2_dec.c |   11 +-
 .../staging/media/hantro/rk3399_vpu_hw_vp8_dec.c   |   12 +-
 drivers/staging/media/imx/imx-ic-prp.c             |   25 +-
 drivers/staging/media/imx/imx-ic-prpencvf.c        |   51 +-
 drivers/staging/media/imx/imx-media-capture.c      |   21 +-
 drivers/staging/media/imx/imx-media-csi.c          |   41 +-
 drivers/staging/media/imx/imx-media-utils.c        |   10 +-
 drivers/staging/media/imx/imx-media-vdic.c         |   27 +-
 drivers/staging/media/imx/imx6-mipi-csi2.c         |   27 +-
 drivers/staging/media/imx/imx7-media-csi.c         |   38 +-
 drivers/staging/media/imx/imx7-mipi-csis.c         |   36 +-
 drivers/staging/media/ipu3/Makefile                |    6 -
 drivers/staging/media/ipu3/TODO                    |    5 -
 drivers/staging/media/ipu3/include/intel-ipu3.h    |    5 +
 drivers/staging/media/omap4iss/iss.c               |    6 +-
 drivers/staging/media/omap4iss/iss_video.c         |    4 +-
 drivers/staging/media/sunxi/cedrus/Makefile        |    2 +-
 drivers/staging/media/sunxi/cedrus/cedrus.c        |   64 +-
 drivers/staging/media/sunxi/cedrus/cedrus.h        |   33 +-
 drivers/staging/media/sunxi/cedrus/cedrus_dec.c    |    9 +
 drivers/staging/media/sunxi/cedrus/cedrus_h264.c   |  147 ++-
 drivers/staging/media/sunxi/cedrus/cedrus_h265.c   |  616 ++++++++++
 drivers/staging/media/sunxi/cedrus/cedrus_hw.c     |   33 +-
 drivers/staging/media/sunxi/cedrus/cedrus_hw.h     |    2 +-
 drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c  |    2 +-
 drivers/staging/media/sunxi/cedrus/cedrus_regs.h   |  318 +++++-
 drivers/staging/media/sunxi/cedrus/cedrus_video.c  |  102 +-
 drivers/staging/media/sunxi/cedrus/cedrus_video.h  |    1 +
 include/media/cec-pin.h                            |   10 +-
 include/media/cec.h                                |   31 -
 include/media/dvb-usb-ids.h                        |    1 +
 include/media/hevc-ctrls.h                         |  212 ++++
 include/media/i2c/smiapp.h                         |    1 -
 include/media/rc-map.h                             |   24 +-
 include/media/v4l2-common.h                        |   33 +-
 include/media/v4l2-ctrls.h                         |   87 ++
 include/media/v4l2-device.h                        |    2 +-
 include/media/v4l2-mem2mem.h                       |   44 +-
 include/media/videobuf2-core.h                     |    3 +
 include/media/videobuf2-v4l2.h                     |    5 +
 include/uapi/linux/cec-funcs.h                     |   34 +-
 include/uapi/linux/cec.h                           |  133 ++-
 include/uapi/linux/v4l2-controls.h                 |    1 +
 include/uapi/linux/videodev2.h                     |   22 +-
 298 files changed, 12814 insertions(+), 4688 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/allwinner,sun8i=
-h3-deinterlace.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/imx290.txt
 delete mode 100644 Documentation/devicetree/bindings/media/sh_mobile_ceu.t=
xt
 create mode 100644 Documentation/devicetree/bindings/media/ti,vpe.yaml
 create mode 100644 Documentation/media/uapi/cec/cec-ioc-adap-g-conn-info.r=
st
 create mode 100644 Documentation/media/uapi/v4l/dev-stateless-decoder.rst
 create mode 100644 Documentation/media/uapi/v4l/pixfmt-meta-vivid.rst
 create mode 100644 Documentation/media/v4l-drivers/ipu3_rcb.svg
 create mode 100644 drivers/media/i2c/hi556.c
 create mode 100644 drivers/media/i2c/imx290.c
 create mode 100644 drivers/media/platform/sunxi/sun8i-di/Makefile
 create mode 100644 drivers/media/platform/sunxi/sun8i-di/sun8i-di.c
 create mode 100644 drivers/media/platform/sunxi/sun8i-di/sun8i-di.h
 create mode 100644 drivers/media/platform/vivid/vivid-meta-cap.c
 create mode 100644 drivers/media/platform/vivid/vivid-meta-cap.h
 create mode 100644 drivers/media/platform/vivid/vivid-meta-out.c
 create mode 100644 drivers/media/platform/vivid/vivid-meta-out.h
 create mode 100644 drivers/media/rc/keymaps/rc-beelink-gs1.c
 create mode 100644 drivers/media/rc/keymaps/rc-vega-s9x.c
 delete mode 100644 drivers/media/usb/dvb-usb-v2/gl861.h
 create mode 100644 drivers/staging/media/sunxi/cedrus/cedrus_h265.c
 create mode 100644 include/media/hevc-ctrls.h

