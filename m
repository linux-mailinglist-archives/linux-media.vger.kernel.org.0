Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A80301977FC
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2020 11:48:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727874AbgC3Jsc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Mar 2020 05:48:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:35912 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727255AbgC3Jsb (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Mar 2020 05:48:31 -0400
Received: from coco.lan (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 477C220714;
        Mon, 30 Mar 2020 09:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585561708;
        bh=36O75ah44VAHhifDsi6xOhQfmhomU/fD0idCIuxmOvQ=;
        h=Date:From:To:Cc:Subject:From;
        b=OJ51lbagYl2FajY3p01/Ex9BhlosqwaYoXl3hvT3l9ht/S0+3usEOR6KnIAb/LNLj
         j5xH+rDyJJKl6yP/YZ8e+DwrZSwzPvQfR10H7AqhBvbcERcaDUYIAkaR2xbbtJT1p0
         kA0kXnPbB86w53pg4LpH4pku7UzZfpXQvcpn6qSc=
Date:   Mon, 30 Mar 2020 11:48:24 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL for v5.7-rc1] media updates
Message-ID: <20200330114824.46773eee@coco.lan>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
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
dia/v5.7-1

For:

- New sensor driver: imx219;
- Support for some new pixelformats;
- Support for Sun8i SoC;
- Added more codecs to meson vdec driver;
- Prepare for removing the legacy usbvision driver by moving it to
  staging. This driver has issues and use legacy core APIs.
  If nobody steps up to address those, it is time for its retirement.
- Several cleanups and improvements on drivers, with the addition
  of new supported boards.

Regards,
Mauro

-

The following changes since commit d171c45da874e3858a83e6377e00280a507fe2f2:

  media: hantro: Fix broken media controller links (2020-02-24 15:10:39 +01=
00)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/me=
dia/v5.7-1

for you to fetch changes up to 2632e7b618a7730969f9782593c29ca53553aa22:

  media: venus: firmware: Ignore secure call error on first resume (2020-03=
-30 11:28:18 +0200)

----------------------------------------------------------------
media updates for v5.7-rc1

----------------------------------------------------------------
Aditya Pakki (1):
      media: media/saa7146: fix incorrect assertion in saa7146_buffer_finish

Alexandre Courbot (1):
      media: videobuf2-core: fix dprintk level

Andrey Konovalov (1):
      media: dt-bindings: media: i2c: Add IMX219 CMOS sensor binding

Andrzej Pietrasiewicz (4):
      media: hantro: Read be32 words starting at every fourth byte
      media: hantro: Use standard luma quantization table
      media: hantro: Write the quantization tables in proper order
      media: hantro: Write quantization table registers in increasing addre=
sses order

Andy Shevchenko (2):
      media: venus: firmware: Use %pR to print IO resource
      media: MAINTAINERS: Sort entries in database for TI VPE/CAL

Aniket Masule (2):
      media: venus: introduce core selection
      media: venus: vdec: handle 10bit bitstreams

Benoit Parrot (2):
      media: ti-vpe: cal: fix disable_irqs to only the intended target
      media: ti-vpe: cal: fix a kernel oops when unloading module

Bingbu Cao (2):
      media: ipu3.rst: add imgu pipe config tool link
      media: staging: imgu: make imgu work on low frequency for low input

Brad Love (3):
      media: m88ds3103: Add support for ds3103b demod
      media: em28xx: Enable Hauppauge 461e rev2
      media: dw2102: probe for demodulator i2c address

Cengiz Can (1):
      media: davinci: fix incorrect pix_fmt assignment

Changming Liu (1):
      media: am437x-vpfe: exclude illegal values for enum when validing par=
ams from user space

Chuhong Yuan (2):
      media: exynos4-is: add missed clk_disable_unprepare in remove
      media: allegro: add missed checks in allegro_open()

Colin Ian King (5):
      media: drxj: remove redundant assignments to variable rc
      media: allegro: fix spelling mistake "to" -> "too"
      media: rc: fix spelling mistake "to" -> "too"
      media: tda10071: fix unsigned sign extension overflow
      media: lmedm04: remove redundant assignment to variable gate

Dafna Hirschfeld (15):
      media: vimc: streamer: fix memory leak in vimc subdevs if kthread_run=
 fails
      media: vimc: streamer: if kthread_stop fails, ignore the error
      media: staging: rkisp1: don't lock media's graph_mutex when calling r=
kisp1_create_links
      media: staging: rkisp1: fix test of return value of media_entity_get_=
fwnode_pad
      media: staging: rkisp1: improve inner documentation in rkisp1-isp.c
      media: staging: rkisp1: change function to return void instead of int
      media: staging: rkisp1: isp: check for dphy bus before initialization=
s in s_stream
      media: staging: rkisp1: add serialization to the isp subdev ops
      media: staging: rkisp1: add serialization to the resizer subdev ops
      media: staging: rkisp1: remove serialization item in the TODO file
      media: staging: rkisp1: capture: remove support to userptr memory
      media: vimc: replace vimc->pdev.dev with vimc->mdev.dev
      media: vimc: allocate vimc_device dynamically
      media: vimc: use-after-free fix - release vimc in the v4l_device rele=
ase
      media: v4l2-core: fix a use-after-free bug of sd->devnode

Dan Carpenter (1):
      media: staging/imx: Missing assignment in imx_media_capture_device_re=
gister()

Daniel Gl=C3=B6ckner (2):
      media: v4l: Add 14-bit raw greyscale pixel format
      media: v4l: Add 1X14 14-bit greyscale media bus code definition

Dave Stevenson (1):
      media: i2c: Add driver for Sony IMX219 sensor

Dikshita Agarwal (2):
      media: venus: core: add sc7180 DT compatible and resource struct
      media: dt-bindings: media: venus: Add sc7180 DT schema

Dmitry Osipenko (1):
      media: staging: tegra-vde: Use devm_platform_ioremap_resource_byname()

Dongchun Zhu (1):
      media: i2c: ov5695: Fix power on and off sequences

Etienne Carriere (2):
      media: platform: stm32: defer probe for auxiliary clock
      media: platform: stm32: don't print an error on probe deferral

Eugen Hristev (3):
      media: atmel: atmel-isc-base: expose white balance as v4l2 controls
      media: MAINTAINERS: add atmel-isc-media.h file to ATMEL ISC driver
      media: v4l2-core: fix entity initialization in device_register_subdev

Ezequiel Garcia (3):
      media: hantro: Prevent encoders from using post-processing
      media: Split v4l2_pipeline_pm_use into v4l2_pipeline_pm_{get, put}
      media: hantro: Add linux-rockchip mailing list to MAINTAINERS

Gustavo A. R. Silva (1):
      media: rc: iguanair: Replace zero-length array with flexible-array me=
mber

Hans Verkuil (21):
      media: vidioc-queryctrl.rst: fix error code
      media: rename VFL_TYPE_GRABBER to _VIDEO
      media: gadget: uvc: rename VFL_TYPE_GRABBER to _VIDEO
      media: bcm2835-camera: rename VFL_TYPE_GRABBER to _VIDEO
      media: staging/media: rename VFL_TYPE_GRABBER to _VIDEO
      media: staging/most: rename VFL_TYPE_GRABBER to _VIDEO
      media: media/usb: rename VFL_TYPE_GRABBER to _VIDEO
      media: media/common/saa7146: rename VFL_TYPE_GRABBER to _VIDEO
      media: media/i2c/video-i2c: rename VFL_TYPE_GRABBER to _VIDEO
      media: media/pci: rename VFL_TYPE_GRABBER to _VIDEO
      media: media/platform: rename VFL_TYPE_GRABBER to _VIDEO
      media: v4l2-dev.h: remove VFL_TYPE_GRABBER
      media: mc-entity.c: use WARN_ON, validate link pads
      media: Documentation/media/uapi: more readable unions
      media: usbvision: deprecate driver
      media: videobuf2-dma-contig.c: remove spurious 'b' in message
      media: videobuf2-core.h: improve buf_struct_size documentation
      media: v4l2-ctrls: v4l2_ctrl_request_complete() should always set ref=
->req
      media: cec-notifier: rename conn_name to port_name
      media: cec-notifier: make cec_notifier_get_conn() static
      media: vivid: fix incorrect PA assignment to HDMI outputs

Heikki Krogerus (1):
      device property: Export fwnode_get_name()

Helen Koike (6):
      media: staging: media: rkisp1: make links immutable by default
      media: staging: rkisp1: use consistent bus_info string for media_dev
      media: staging: rkisp1: stats: use consistent bus_info string
      media: staging: rkisp1: rsz: don't ignore set format in bayer mainpath
      media: staging: rkisp1: rsz: return to userspace the crop value in ba=
yer mainpath
      media: staging: rkisp1: isp: do not set invalid mbus code for pad

Hirokazu Honda (1):
      media: hantro: Support H264 profile control

Hsin-Yi Wang (1):
      media: mtk-vpu: avoid unaligned access to DTCM buffer.

Ian Kumlien (1):
      media: Fix build failure due to missing select REGMAP_I2C

Jae Hyun Yoo (2):
      media: Documentation: dt-bindings: media: add AST2600 Video Engine su=
pport
      media: aspeed: add AST2600 support

Javier Martinez Canillas (1):
      media: partial revert of "[media] tvp5150: add HW input connectors su=
pport"

Jean-Baptiste Jouband (1):
      media: staging: media: ipu3: Change 'unsigned long int' to 'unsigned =
long'

Jeffrey Kardatzke (1):
      media: venus: support frame rate control

Jernej Skrabec (4):
      media: dt-bindings: media: Add Allwinner A83T Rotate driver
      media: sun8i: Add Allwinner A83T Rotate driver
      media: dt-bindings: media: Add Allwinner A64 deinterlace compatible
      media: cedrus: h264: Fix 4K decoding on H6

Joel Stanley (3):
      media: aspeed: Rework memory mapping in probe
      media: aspeed: Use runtime configuration
      media: video: aspeed: Update copyright information

Johan Hovold (6):
      media: usbtv: fix control-message timeouts
      media: flexcop-usb: fix endpoint sanity check
      media: dib0700: fix rc endpoint lookup
      media: ov519: add missing endpoint sanity checks
      media: stv06xx: add missing descriptor sanity checks
      media: xirlink_cit: add missing descriptor sanity checks

Jonas Karlman (1):
      media: uapi: h264: Add DPB entry field reference flags

Jonathan Neusch=C3=A4fer (1):
      media: v4l2: Switch to new kerneldoc syntax for named variable macro =
arguments

Julia Lawall (3):
      media: anysee: constify copied structure
      media: isif: constify copied structure
      media: cx231xx: constify copied structure

Justin Swartz (1):
      media: dt-bindings: Add binding for rk3228 rga

Krzysztof Kozlowski (1):
      media: Fix Kconfig indentation

Kuninori Morimoto (1):
      media: vsp1: tidyup VI6_HGT_LBn_H() macro

Lad Prabhakar (4):
      media: i2c: imx219: Fix power sequence
      media: i2c: imx219: Add support for RAW8 bit bayer format
      media: i2c: imx219: Add support for cropped 640x480 resolution
      media: am437x-vpfe: Make use of to_vpfe() to get a pointer to vpfe_de=
vice

Laurent Pinchart (10):
      media: imx: imx7_mipi_csis: Power off the source when stopping stream=
ing
      media: imx: imx7_mipi_csis: Print the RESOL_CH0 register
      media: imx: imx7_mipi_csis: Add greyscale formats support
      media: imx: imx7-mipi-csis: Filter on CSI-2 data type
      media: imx: imx7-media-csi: Remove unneeded register read
      media: imx: imx7-media-csi: Fix video field handling
      media: imx: imx6-media-csi: Replace Y16 with Y10 and Y12
      media: imx: imx6-media-csi: Support clamping Y10 and Y12 to Y8
      media: imx: imx7-media-csi: Add Y10 and Y12 formats support
      media: imx: imx7-media-csi: Support clamping Y10 and Y12 to Y8

Lukas Bulwahn (1):
      media: MAINTAINERS: adjust entry to refactoring smiapp.h

Marco Felsch (19):
      media: dt-bindings: connector: analog: add sdtv standards property
      media: dt-bindings: display: add sdtv-standards defines
      media: v4l: link dt-bindings and uapi
      media: v4l2-fwnode: fix v4l2_fwnode_parse_link handling
      media: v4l2-fwnode: simplify v4l2_fwnode_parse_link
      media: v4l2-fwnode: add endpoint id field to v4l2_fwnode_link
      media: v4l2-fwnode: add v4l2_fwnode_connector
      media: v4l2-fwnode: add initial connector parsing support
      media: tvp5150: add input source selection of_graph support
      media: dt-bindings: tvp5150: Add input port connectors DT bindings
      media: tvp5150: fix set_selection rectangle handling
      media: tvp5150: add FORMAT_TRY support for get/set selection handlers
      media: tvp5150: move irq en-/disable into runtime-pm ops
      media: tvp5150: add v4l2-event support
      media: tvp5150: add subdev open/close callbacks
      media: dt-bindings: tvp5150: cleanup bindings stlye
      media: dt-bindings: tvp5150: add optional sdtv standards documentation
      media: tvp5150: add support to limit sdtv standards
      media: tvp5150: make debug output more readable

Mario Hros (1):
      media: rtl28xxu: add missing sleep before probing slave demod

Matt Ranostay (1):
      media: i2c: video-i2c: fix build errors due to 'imply hwmon'

Matthias Brugger (1):
      media: mtk-mdp: Check return value of of_clk_get

Maxime Jourdan (6):
      media: meson: vdec: bring up to compliance
      media: meson: vdec: add H.264 decoding support
      media: meson: vdec: add helpers for lossless framebuffer compression =
buffers
      media: meson: vdec: add common HEVC decoder support
      media: meson: vdec: add VP9 input support
      media: meson: vdec: add VP9 decoder support

Michael Tretter (20):
      media: tvp5150: initialize subdev before parsing device tree
      media: staging: allegro: fix broken registration of controls
      media: allegro: print message on mcu error
      media: allegro: fail encoding only on actual errors
      media: allegro: fix type of gop_length in channel_create message
      media: allegro: remove unknown39 field from create_channel
      media: allegro: start a GOP with an IDR frame
      media: allegro: fix calculation of CPB size
      media: allegro: fix reset if WAKEUP has not been set properly
      media: allegro: extract mcu and codec address calculation
      media: allegro: warn if response message has an unexpected size
      media: allegro: skip filler data if possible
      media: allegro: make frame rate configurable
      media: allegro: make QP configurable
      media: allegro: read bitrate mode directly from control
      media: allegro: handle dependency of bitrate and bitrate_peak
      media: allegro: verify source and destination buffer in VCU response
      media: allegro: pass buffers through firmware
      media: allegro: move mail definitions to separate file
      media: allegro: create new struct for channel parameters

Mohammad Rasim (3):
      media: rc: add keymap for Videostrong KII Pro
      media: dt-bindings: media: add new kii pro key map
      media: arm64: dts: amlogic: add rc-videostrong-kii-pro keymap

Neil Armstrong (3):
      media: v4l2-mem2mem: handle draining, stopped and next-buf-is-last st=
ates
      media: vicodec: use v4l2-mem2mem draining, stopped and next-buf-is-la=
st states handling
      media: meson: vdec: align stride on 32 bytes

Niklas S=C3=B6derlund (5):
      media: rcar-vin: Handle special pixel formats in a switch
      media: rcar-vin: Limit NV12 availability to supported VIN channels on=
ly
      media: adv7180: Add init_cfg pad operation
      media: rcar-vin: Move hardware buffer tracking to own struct
      media: rcar-vin: Add support for V4L2_FIELD_SEQ_{TB,BT}

Peter Ujfalusi (5):
      media: stm32-dcmi: Use dma_request_chan() instead dma_request_slave_c=
hannel()
      media: pxa_camera: Use dma_request_chan() instead dma_request_slave_c=
hannel()
      media: rcar_drif: Use dma_request_chan() instead dma_request_slave_ch=
annel()
      media: xilinx: Use dma_request_chan() instead dma_request_slave_chann=
el()
      media: rcar_drif: Do not print error in case of EPROBE_DEFER for dma =
channel

Philipp Zabel (4):
      media: hantro: fix extra MV/MC sync space calculation
      media: dt-bindings: Document i.MX8MQ VPU bindings
      media: hantro: add initial i.MX8MQ support
      media: MAINTAINERS: add myself to co-maintain Hantro G1/G2 for i.MX8MQ

Ricardo Ribalda Delgado (1):
      media: imx214: Remove redundant code

Rui Wang (2):
      media: mtk-vcodec: reset segment data then trig decoder
      media: mtk-vpu: load vpu firmware from the new location

Sakari Ailus (9):
      media: omap3isp: Prevent enabling CCDC when stopping streaming
      media: smiapp: Simplify condition for choosing 8-bit access
      media: smiapp: Use unaligned get and put functions
      media: smiapp: Turn limit lookup into a function
      media: smiapp: Move SMIA limit reading up
      media: smiapp: Refactor reading SMIA limits
      media: smiapp: Move definitions under driver directory
      media: mailmap: Add entry for my @iki.fi address
      media: v4l: Add 14-bit raw bayer pixel formats

Sean Young (1):
      media: rc: make scancodes 64 bit

Sebastian Gross (1):
      media: i2c: s5c73m3: Fix number in auto focus cluster

Sergiu Cuciurean (1):
      media: spi: gs1662: Use new structure for SPI transfer delays

Shawn Tu (1):
      media: ov5675: add vflip/hflip control support

Stanimir Varbanov (12):
      media: MAINTAINERS: Add dt-binding files for Venus
      media: venus: venc: blacklist two encoder properties
      media: venus: cache vb payload to be used by clock scaling
      media: venus: redesign clocks and pm domains control
      media: dt-bindings: media: venus: Convert msm8916 to DT schema
      media: dt-bindings: media: venus: Convert msm8996 to DT schema
      media: dt-bindings: media: venus: Convert sdm845 to DT schema
      media: dt-bindings: media: venus: Add sdm845v2 DT schema
      media: venus: core: add sdm845-v2 DT compatible and resource struct
      media: dt-bindings: media: venus: delete old binding document
      media: venus: vdec: Fix forgotten mutex unlock in start streaming
      media: venus: firmware: Ignore secure call error on first resume

Stephan Gerhold (1):
      media: venus: hfi_parser: Ignore HEVC encoding for V1

Steve Longerbeam (1):
      media: imx: Propagate quantization and encoding in CSI

Takashi Iwai (3):
      media: go7007: Fix URB type for interrupt handling
      media: rc: Use scnprintf() for avoiding potential buffer overflow
      media: siano: Use scnprintf() for avoiding potential buffer overflow

Vandana BN (1):
      media: Documentation:media:v4l-drivers: Update vivid documentation.

Wolfram Sang (1):
      media: v4l2-core: v4l2-i2c: convert to new API with ERRPTR

YueHaibing (2):
      media: sun8i: Remove redundant platform_get_irq error message
      media: staging: media: usbvision: Add missing MEDIA_USB_SUPPORT depen=
dency

 .mailmap                                           |    1 +
 .../display/connector/analog-tv-connector.txt      |    6 +
 .../media/allwinner,sun8i-a83t-de2-rotate.yaml     |   70 +
 .../media/allwinner,sun8i-h3-deinterlace.yaml      |    6 +-
 .../devicetree/bindings/media/aspeed-video.txt     |    5 +-
 .../devicetree/bindings/media/i2c/imx219.yaml      |  114 ++
 .../devicetree/bindings/media/i2c/tvp5150.txt      |  146 +-
 .../devicetree/bindings/media/nxp,imx8mq-vpu.yaml  |   77 +
 .../bindings/media/qcom,msm8916-venus.yaml         |  119 ++
 .../bindings/media/qcom,msm8996-venus.yaml         |  172 ++
 .../bindings/media/qcom,sc7180-venus.yaml          |  140 ++
 .../bindings/media/qcom,sdm845-venus-v2.yaml       |  140 ++
 .../bindings/media/qcom,sdm845-venus.yaml          |  156 ++
 .../devicetree/bindings/media/qcom,venus.txt       |  120 --
 Documentation/devicetree/bindings/media/rc.yaml    |    1 +
 .../devicetree/bindings/media/rockchip-rga.txt     |    5 +-
 Documentation/media/kapi/csi2.rst                  |    2 +-
 Documentation/media/kapi/v4l2-dev.rst              |    4 +-
 .../media/uapi/cec/cec-ioc-adap-g-conn-info.rst    |   10 +-
 Documentation/media/uapi/cec/cec-ioc-dqevent.rst   |   20 +-
 .../uapi/mediactl/media-ioc-enum-entities.rst      |   24 +-
 Documentation/media/uapi/v4l/buffer.rst            |   53 +-
 Documentation/media/uapi/v4l/dev-sliced-vbi.rst    |   15 +-
 Documentation/media/uapi/v4l/ext-ctrls-codec.rst   |   16 +
 Documentation/media/uapi/v4l/pixfmt-bayer.rst      |    1 +
 Documentation/media/uapi/v4l/pixfmt-srggb14.rst    |   82 +
 .../media/uapi/v4l/pixfmt-v4l2-mplane.rst          |    6 +-
 Documentation/media/uapi/v4l/pixfmt-v4l2.rst       |    2 -
 Documentation/media/uapi/v4l/pixfmt-y14.rst        |   72 +
 Documentation/media/uapi/v4l/subdev-formats.rst    |   37 +
 .../media/uapi/v4l/vidioc-dbg-g-chip-info.rst      |   12 +-
 .../media/uapi/v4l/vidioc-dbg-g-register.rst       |   12 +-
 .../media/uapi/v4l/vidioc-decoder-cmd.rst          |   26 +-
 Documentation/media/uapi/v4l/vidioc-dqevent.rst    |   55 +-
 .../media/uapi/v4l/vidioc-dv-timings-cap.rst       |   14 +-
 .../media/uapi/v4l/vidioc-enum-frameintervals.rst  |   19 +-
 .../media/uapi/v4l/vidioc-enum-framesizes.rst      |   18 +-
 .../media/uapi/v4l/vidioc-g-dv-timings.rst         |   16 +-
 .../media/uapi/v4l/vidioc-g-ext-ctrls.rst          |   45 +-
 Documentation/media/uapi/v4l/vidioc-g-fmt.rst      |   29 +-
 Documentation/media/uapi/v4l/vidioc-g-parm.rst     |   18 +-
 Documentation/media/uapi/v4l/vidioc-queryctrl.rst  |   21 +-
 Documentation/media/uapi/v4l/yuv-formats.rst       |    1 +
 Documentation/media/v4l-drivers/ipu3.rst           |   11 +-
 Documentation/media/v4l-drivers/vivid.rst          |   63 +-
 .../zh_CN/video4linux/v4l2-framework.txt           |    4 +-
 MAINTAINERS                                        |   32 +-
 arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts |    4 +
 drivers/base/property.c                            |    1 +
 drivers/media/Kconfig                              |    6 +-
 drivers/media/cec/cec-notifier.c                   |   41 +-
 drivers/media/common/saa7146/saa7146_fops.c        |   12 +-
 drivers/media/common/siano/smsdvb-debugfs.c        |  214 +-
 drivers/media/common/videobuf2/videobuf2-core.c    |    4 +-
 .../media/common/videobuf2/videobuf2-dma-contig.c  |    4 +-
 drivers/media/dvb-frontends/drx39xyj/drxj.c        |    4 +-
 drivers/media/dvb-frontends/m88ds3103.c            |  466 ++++-
 drivers/media/dvb-frontends/m88ds3103_priv.h       |   14 +-
 drivers/media/dvb-frontends/tda10071.c             |    9 +-
 drivers/media/i2c/Kconfig                          |   16 +
 drivers/media/i2c/Makefile                         |    1 +
 drivers/media/i2c/adv7180.c                        |   12 +
 drivers/media/i2c/imx214.c                         |    1 -
 drivers/media/i2c/imx219.c                         | 1481 ++++++++++++++
 drivers/media/i2c/ov5675.c                         |   82 +-
 drivers/media/i2c/ov5695.c                         |   49 +-
 drivers/media/i2c/s5c73m3/s5c73m3-ctrls.c          |    2 +-
 drivers/media/i2c/smiapp/smiapp-core.c             |  259 ++-
 drivers/media/i2c/smiapp/smiapp-reg.h              |    4 +
 drivers/media/i2c/smiapp/smiapp-regs.c             |   71 +-
 drivers/media/i2c/smiapp/smiapp.h                  |   44 +-
 drivers/media/i2c/tvp5150.c                        |  802 ++++++--
 drivers/media/i2c/video-i2c.c                      |    4 +-
 drivers/media/mc/mc-entity.c                       |   11 +-
 drivers/media/pci/bt8xx/bttv-driver.c              |    4 +-
 drivers/media/pci/cobalt/cobalt-v4l2.c             |    2 +-
 drivers/media/pci/cx18/cx18-streams.c              |   12 +-
 drivers/media/pci/cx23885/cx23885-417.c            |    2 +-
 drivers/media/pci/cx23885/cx23885-video.c          |    2 +-
 drivers/media/pci/cx25821/cx25821-video.c          |    2 +-
 drivers/media/pci/cx88/cx88-blackbird.c            |    2 +-
 drivers/media/pci/cx88/cx88-video.c                |    2 +-
 drivers/media/pci/dt3155/dt3155.c                  |    2 +-
 drivers/media/pci/intel/ipu3/ipu3-cio2.c           |    2 +-
 drivers/media/pci/ivtv/ivtv-streams.c              |   12 +-
 drivers/media/pci/meye/meye.c                      |    2 +-
 drivers/media/pci/saa7134/saa7134-core.c           |    2 +-
 drivers/media/pci/saa7134/saa7134-empress.c        |    2 +-
 drivers/media/pci/saa7146/hexium_gemini.c          |    2 +-
 drivers/media/pci/saa7146/hexium_orion.c           |    2 +-
 drivers/media/pci/saa7146/mxb.c                    |    2 +-
 drivers/media/pci/saa7164/saa7164-encoder.c        |    2 +-
 drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c     |    2 +-
 drivers/media/pci/solo6x10/solo6x10-v4l2.c         |    2 +-
 drivers/media/pci/sta2x11/sta2x11_vip.c            |    2 +-
 drivers/media/pci/ttpci/av7110_v4l.c               |    2 +-
 drivers/media/pci/ttpci/budget-av.c                |    2 +-
 drivers/media/pci/tw5864/tw5864-video.c            |    2 +-
 drivers/media/pci/tw68/tw68-video.c                |    2 +-
 drivers/media/pci/tw686x/tw686x-video.c            |    2 +-
 drivers/media/platform/Kconfig                     |   86 +-
 drivers/media/platform/am437x/am437x-vpfe.c        |   13 +-
 drivers/media/platform/aspeed-video.c              |   86 +-
 drivers/media/platform/atmel/atmel-isc-base.c      |  224 +-
 drivers/media/platform/atmel/atmel-isc.h           |   23 +-
 drivers/media/platform/atmel/atmel-isi.c           |    2 +-
 drivers/media/platform/coda/coda-common.c          |    2 +-
 drivers/media/platform/davinci/isif.c              |    2 +-
 drivers/media/platform/davinci/vpbe_display.c      |    2 +-
 drivers/media/platform/davinci/vpfe_capture.c      |    4 +-
 drivers/media/platform/davinci/vpif_capture.c      |    2 +-
 drivers/media/platform/davinci/vpif_display.c      |    2 +-
 drivers/media/platform/exynos-gsc/gsc-m2m.c        |    2 +-
 drivers/media/platform/exynos4-is/Kconfig          |    2 +-
 drivers/media/platform/exynos4-is/fimc-capture.c   |    2 +-
 drivers/media/platform/exynos4-is/fimc-isp-video.c |    2 +-
 drivers/media/platform/exynos4-is/fimc-lite.c      |    5 +-
 drivers/media/platform/exynos4-is/fimc-m2m.c       |    2 +-
 drivers/media/platform/fsl-viu.c                   |    2 +-
 drivers/media/platform/imx-pxp.c                   |    2 +-
 drivers/media/platform/m2m-deinterlace.c           |    2 +-
 drivers/media/platform/marvell-ccic/mcam-core.c    |    2 +-
 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c    |    2 +-
 drivers/media/platform/mtk-mdp/mtk_mdp_comp.c      |    6 +
 drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c       |    2 +-
 drivers/media/platform/mtk-mdp/mtk_mdp_vpu.c       |    9 +-
 .../media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c |    2 +-
 .../media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c |    2 +-
 .../media/platform/mtk-vcodec/vdec/vdec_vp9_if.c   |   29 +-
 drivers/media/platform/mtk-vcodec/vdec_vpu_if.c    |    6 +-
 drivers/media/platform/mtk-vcodec/venc_vpu_if.c    |   12 +-
 drivers/media/platform/mtk-vpu/mtk_vpu.c           |   61 +-
 drivers/media/platform/mtk-vpu/mtk_vpu.h           |    2 +-
 drivers/media/platform/mx2_emmaprp.c               |    2 +-
 drivers/media/platform/omap/omap_vout.c            |    2 +-
 drivers/media/platform/omap3isp/ispccdc.c          |    4 +
 drivers/media/platform/omap3isp/ispvideo.c         |    8 +-
 drivers/media/platform/pxa_camera.c                |   22 +-
 drivers/media/platform/qcom/camss/camss-video.c    |    6 +-
 drivers/media/platform/qcom/venus/Makefile         |    2 +-
 drivers/media/platform/qcom/venus/core.c           |  167 +-
 drivers/media/platform/qcom/venus/core.h           |   33 +-
 drivers/media/platform/qcom/venus/firmware.c       |   13 +-
 drivers/media/platform/qcom/venus/helpers.c        |  448 ++--
 drivers/media/platform/qcom/venus/helpers.h        |    4 -
 drivers/media/platform/qcom/venus/hfi_cmds.c       |    2 +
 drivers/media/platform/qcom/venus/hfi_helper.h     |    6 +
 drivers/media/platform/qcom/venus/hfi_parser.c     |    1 +
 drivers/media/platform/qcom/venus/hfi_parser.h     |    5 +
 drivers/media/platform/qcom/venus/pm_helpers.c     |  959 +++++++++
 drivers/media/platform/qcom/venus/pm_helpers.h     |   65 +
 drivers/media/platform/qcom/venus/vdec.c           |   86 +-
 drivers/media/platform/qcom/venus/venc.c           |   81 +-
 drivers/media/platform/qcom/venus/venc_ctrls.c     |    8 +-
 drivers/media/platform/rcar-vin/rcar-dma.c         |   91 +-
 drivers/media/platform/rcar-vin/rcar-v4l2.c        |   34 +-
 drivers/media/platform/rcar-vin/rcar-vin.h         |   28 +-
 drivers/media/platform/rcar_drif.c                 |   12 +-
 drivers/media/platform/rcar_fdp1.c                 |    2 +-
 drivers/media/platform/rcar_jpu.c                  |    4 +-
 drivers/media/platform/renesas-ceu.c               |    2 +-
 drivers/media/platform/rockchip/rga/rga.c          |    2 +-
 drivers/media/platform/s3c-camif/camif-capture.c   |    2 +-
 drivers/media/platform/s5p-g2d/g2d.c               |    2 +-
 drivers/media/platform/s5p-jpeg/jpeg-core.c        |    4 +-
 drivers/media/platform/s5p-mfc/s5p_mfc.c           |    4 +-
 drivers/media/platform/sh_veu.c                    |    2 +-
 drivers/media/platform/sh_vou.c                    |    2 +-
 drivers/media/platform/sti/bdisp/bdisp-v4l2.c      |    2 +-
 drivers/media/platform/sti/delta/delta-v4l2.c      |    2 +-
 drivers/media/platform/sti/hva/hva-v4l2.c          |    2 +-
 drivers/media/platform/stm32/stm32-cec.c           |   10 +-
 drivers/media/platform/stm32/stm32-dcmi.c          |   13 +-
 drivers/media/platform/sunxi/Makefile              |    1 +
 .../media/platform/sunxi/sun4i-csi/sun4i_v4l2.c    |    8 +-
 .../media/platform/sunxi/sun6i-csi/sun6i_video.c   |    8 +-
 drivers/media/platform/sunxi/sun8i-di/sun8i-di.c   |    7 +-
 drivers/media/platform/sunxi/sun8i-rotate/Makefile |    5 +
 .../platform/sunxi/sun8i-rotate/sun8i-formats.h    |   25 +
 .../platform/sunxi/sun8i-rotate/sun8i-rotate.h     |  135 ++
 .../platform/sunxi/sun8i-rotate/sun8i_formats.c    |  273 +++
 .../platform/sunxi/sun8i-rotate/sun8i_rotate.c     |  924 +++++++++
 drivers/media/platform/ti-vpe/cal.c                |   31 +-
 drivers/media/platform/ti-vpe/vpe.c                |    2 +-
 drivers/media/platform/via-camera.c                |    2 +-
 drivers/media/platform/vicodec/vicodec-core.c      |  164 +-
 drivers/media/platform/vim2m.c                     |    2 +-
 drivers/media/platform/vimc/vimc-capture.c         |   20 +-
 drivers/media/platform/vimc/vimc-common.c          |    2 -
 drivers/media/platform/vimc/vimc-common.h          |   27 +-
 drivers/media/platform/vimc/vimc-core.c            |   93 +-
 drivers/media/platform/vimc/vimc-debayer.c         |   21 +-
 drivers/media/platform/vimc/vimc-scaler.c          |   21 +-
 drivers/media/platform/vimc/vimc-sensor.c          |   20 +-
 drivers/media/platform/vimc/vimc-streamer.c        |   17 +-
 drivers/media/platform/vivid/vivid-core.c          |   14 +-
 drivers/media/platform/vsp1/vsp1_histo.c           |    4 +-
 drivers/media/platform/vsp1/vsp1_regs.h            |    2 +-
 drivers/media/platform/vsp1/vsp1_video.c           |    4 +-
 drivers/media/platform/xilinx/xilinx-dma.c         |   15 +-
 drivers/media/radio/si470x/Kconfig                 |    4 +-
 drivers/media/rc/bpf-lirc.c                        |    5 -
 drivers/media/rc/iguanair.c                        |    2 +-
 drivers/media/rc/ir-xmp-decoder.c                  |    2 +-
 drivers/media/rc/keymaps/Makefile                  |    1 +
 drivers/media/rc/keymaps/rc-videostrong-kii-pro.c  |   83 +
 drivers/media/rc/lirc_dev.c                        |    7 +-
 drivers/media/rc/nuvoton-cir.c                     |    4 +-
 drivers/media/rc/rc-main.c                         |   80 +-
 drivers/media/spi/gs1662.c                         |   20 +-
 drivers/media/usb/Kconfig                          |    1 -
 drivers/media/usb/Makefile                         |    1 -
 drivers/media/usb/au0828/au0828-video.c            |    4 +-
 drivers/media/usb/b2c2/flexcop-usb.c               |    6 +-
 drivers/media/usb/cpia2/cpia2_v4l.c                |    2 +-
 drivers/media/usb/cx231xx/cx231xx-417.c            |    2 +-
 drivers/media/usb/cx231xx/cx231xx-dvb.c            |    2 +-
 drivers/media/usb/cx231xx/cx231xx-video.c          |    2 +-
 drivers/media/usb/dvb-usb-v2/anysee.c              |    4 +-
 drivers/media/usb/dvb-usb-v2/lmedm04.c             |    5 +-
 drivers/media/usb/dvb-usb-v2/rtl28xxu.c            |    3 +
 drivers/media/usb/dvb-usb/cxusb-analog.c           |   12 +-
 drivers/media/usb/dvb-usb/dib0700_core.c           |    4 +-
 drivers/media/usb/dvb-usb/dw2102.c                 |   45 +-
 drivers/media/usb/em28xx/em28xx-cards.c            |   18 +
 drivers/media/usb/em28xx/em28xx-dvb.c              |   60 +
 drivers/media/usb/em28xx/em28xx-video.c            |    4 +-
 drivers/media/usb/em28xx/em28xx.h                  |    1 +
 drivers/media/usb/go7007/go7007-usb.c              |    4 +-
 drivers/media/usb/go7007/go7007-v4l2.c             |    2 +-
 drivers/media/usb/gspca/gspca.c                    |    2 +-
 drivers/media/usb/gspca/ov519.c                    |   10 +
 drivers/media/usb/gspca/stv06xx/stv06xx.c          |   19 +-
 drivers/media/usb/gspca/stv06xx/stv06xx_pb0100.c   |    4 +
 drivers/media/usb/gspca/xirlink_cit.c              |   18 +-
 drivers/media/usb/hdpvr/hdpvr-video.c              |    2 +-
 drivers/media/usb/pvrusb2/pvrusb2-v4l2.c           |    4 +-
 drivers/media/usb/pwc/pwc-if.c                     |    2 +-
 drivers/media/usb/s2255/s2255drv.c                 |    4 +-
 drivers/media/usb/stk1160/stk1160-v4l.c            |    2 +-
 drivers/media/usb/stkwebcam/stk-webcam.c           |    2 +-
 drivers/media/usb/tm6000/tm6000-video.c            |    4 +-
 drivers/media/usb/usbtv/usbtv-core.c               |    2 +-
 drivers/media/usb/usbtv/usbtv-video.c              |    7 +-
 drivers/media/usb/uvc/uvc_driver.c                 |    2 +-
 drivers/media/usb/zr364xx/zr364xx.c                |    2 +-
 drivers/media/v4l2-core/v4l2-ctrls.c               |   11 +-
 drivers/media/v4l2-core/v4l2-dev.c                 |   10 +-
 drivers/media/v4l2-core/v4l2-device.c              |    8 +-
 drivers/media/v4l2-core/v4l2-fwnode.c              |  192 +-
 drivers/media/v4l2-core/v4l2-i2c.c                 |   10 +-
 drivers/media/v4l2-core/v4l2-ioctl.c               |    9 +-
 drivers/media/v4l2-core/v4l2-mc.c                  |   18 +-
 drivers/media/v4l2-core/v4l2-mem2mem.c             |  221 +-
 drivers/staging/media/Kconfig                      |    4 +
 drivers/staging/media/Makefile                     |    1 +
 drivers/staging/media/allegro-dvt/Makefile         |    2 +-
 drivers/staging/media/allegro-dvt/allegro-core.c   |  930 +++++----
 drivers/staging/media/allegro-dvt/allegro-mail.c   |   37 +
 drivers/staging/media/allegro-dvt/allegro-mail.h   |  267 +++
 drivers/staging/media/hantro/Kconfig               |   16 +-
 drivers/staging/media/hantro/Makefile              |    3 +
 drivers/staging/media/hantro/hantro.h              |    2 +-
 drivers/staging/media/hantro/hantro_drv.c          |   15 +-
 drivers/staging/media/hantro/hantro_h1_jpeg_enc.c  |   19 +-
 drivers/staging/media/hantro/hantro_hw.h           |    1 +
 drivers/staging/media/hantro/hantro_jpeg.c         |   76 +-
 drivers/staging/media/hantro/hantro_jpeg.h         |    2 +-
 drivers/staging/media/hantro/hantro_v4l2.c         |    2 +-
 drivers/staging/media/hantro/imx8m_vpu_hw.c        |  220 ++
 .../staging/media/hantro/rk3399_vpu_hw_jpeg_enc.c  |   24 +-
 drivers/staging/media/imx/imx-media-capture.c      |    8 +-
 drivers/staging/media/imx/imx-media-csc-scaler.c   |    2 +-
 drivers/staging/media/imx/imx-media-csi.c          |    5 +-
 drivers/staging/media/imx/imx-media-utils.c        |   19 +-
 drivers/staging/media/imx/imx7-media-csi.c         |   24 +-
 drivers/staging/media/imx/imx7-mipi-csis.c         |   16 +-
 drivers/staging/media/ipu3/TODO                    |    2 -
 drivers/staging/media/ipu3/ipu3-css.c              |    6 +-
 drivers/staging/media/ipu3/ipu3-css.h              |    3 +-
 drivers/staging/media/ipu3/ipu3-mmu.c              |    4 +-
 drivers/staging/media/ipu3/ipu3-v4l2.c             |    2 +-
 drivers/staging/media/ipu3/ipu3.c                  |   16 +-
 drivers/staging/media/meson/vdec/Makefile          |    4 +-
 drivers/staging/media/meson/vdec/codec_h264.c      |  485 +++++
 drivers/staging/media/meson/vdec/codec_h264.h      |   14 +
 .../staging/media/meson/vdec/codec_hevc_common.c   |  297 +++
 .../staging/media/meson/vdec/codec_hevc_common.h   |   71 +
 drivers/staging/media/meson/vdec/codec_vp9.c       | 2141 ++++++++++++++++=
++++
 drivers/staging/media/meson/vdec/codec_vp9.h       |   13 +
 drivers/staging/media/meson/vdec/esparser.c        |  200 +-
 drivers/staging/media/meson/vdec/hevc_regs.h       |  218 ++
 drivers/staging/media/meson/vdec/vdec.c            |  107 +-
 drivers/staging/media/meson/vdec/vdec.h            |   14 +-
 drivers/staging/media/meson/vdec/vdec_helpers.c    |  123 +-
 drivers/staging/media/meson/vdec/vdec_helpers.h    |   10 +-
 drivers/staging/media/meson/vdec/vdec_hevc.c       |  231 +++
 drivers/staging/media/meson/vdec/vdec_hevc.h       |   13 +
 drivers/staging/media/meson/vdec/vdec_platform.c   |  109 +
 drivers/staging/media/omap4iss/iss_video.c         |    8 +-
 drivers/staging/media/rkisp1/TODO                  |    1 -
 drivers/staging/media/rkisp1/rkisp1-capture.c      |   13 +-
 drivers/staging/media/rkisp1/rkisp1-common.h       |    3 +
 drivers/staging/media/rkisp1/rkisp1-dev.c          |   20 +-
 drivers/staging/media/rkisp1/rkisp1-isp.c          |   61 +-
 drivers/staging/media/rkisp1/rkisp1-params.c       |    2 +-
 drivers/staging/media/rkisp1/rkisp1-resizer.c      |   27 +-
 drivers/staging/media/rkisp1/rkisp1-stats.c        |    5 +-
 drivers/staging/media/soc_camera/soc_camera.c      |    2 +-
 drivers/staging/media/sunxi/cedrus/cedrus.c        |    2 +-
 drivers/staging/media/sunxi/cedrus/cedrus_h264.c   |    6 +-
 drivers/staging/media/tegra-vde/vde.c              |   55 +-
 .../{media/usb =3D> staging/media}/usbvision/Kconfig |    9 +-
 .../usb =3D> staging/media}/usbvision/Makefile       |    0
 drivers/staging/media/usbvision/TODO               |   11 +
 .../media}/usbvision/usbvision-cards.c             |    0
 .../media}/usbvision/usbvision-cards.h             |    0
 .../media}/usbvision/usbvision-core.c              |    0
 .../media}/usbvision/usbvision-i2c.c               |    0
 .../media}/usbvision/usbvision-video.c             |    2 +-
 .../usb =3D> staging/media}/usbvision/usbvision.h    |    0
 drivers/staging/most/video/video.c                 |    4 +-
 .../vc04_services/bcm2835-camera/bcm2835-camera.c  |    2 +-
 drivers/usb/gadget/function/f_uvc.c                |    2 +-
 include/dt-bindings/display/sdtv-standards.h       |   76 +
 include/dt-bindings/media/tvp5150.h                |    2 -
 include/linux/atmel-isc-media.h                    |   58 +
 include/media/cec-notifier.h                       |   39 +-
 include/media/h264-ctrls.h                         |    2 +
 include/media/i2c/smiapp.h                         |   63 -
 include/media/rc-core.h                            |    8 +-
 include/media/rc-map.h                             |    5 +-
 include/media/v4l2-dev.h                           |    4 +-
 include/media/v4l2-device.h                        |   16 +-
 include/media/v4l2-fwnode.h                        |  143 ++
 include/media/v4l2-mc.h                            |   40 +-
 include/media/v4l2-mem2mem.h                       |  133 ++
 include/media/v4l2-subdev.h                        |    2 +-
 include/media/videobuf2-core.h                     |    7 +-
 include/uapi/linux/media-bus-format.h              |    3 +-
 include/uapi/linux/v4l2-controls.h                 |    6 +
 include/uapi/linux/videodev2.h                     |    9 +
 samples/v4l/v4l2-pci-skeleton.c                    |    2 +-
 343 files changed, 14879 insertions(+), 3012 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/allwinner,sun8i=
-a83t-de2-rotate.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/imx219.yaml
 create mode 100644 Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.=
yaml
 create mode 100644 Documentation/devicetree/bindings/media/qcom,msm8916-ve=
nus.yaml
 create mode 100644 Documentation/devicetree/bindings/media/qcom,msm8996-ve=
nus.yaml
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sc7180-ven=
us.yaml
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sdm845-ven=
us-v2.yaml
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sdm845-ven=
us.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/qcom,venus.txt
 create mode 100644 Documentation/media/uapi/v4l/pixfmt-srggb14.rst
 create mode 100644 Documentation/media/uapi/v4l/pixfmt-y14.rst
 create mode 100644 drivers/media/i2c/imx219.c
 create mode 100644 drivers/media/platform/qcom/venus/pm_helpers.c
 create mode 100644 drivers/media/platform/qcom/venus/pm_helpers.h
 create mode 100644 drivers/media/platform/sunxi/sun8i-rotate/Makefile
 create mode 100644 drivers/media/platform/sunxi/sun8i-rotate/sun8i-formats=
.h
 create mode 100644 drivers/media/platform/sunxi/sun8i-rotate/sun8i-rotate.h
 create mode 100644 drivers/media/platform/sunxi/sun8i-rotate/sun8i_formats=
.c
 create mode 100644 drivers/media/platform/sunxi/sun8i-rotate/sun8i_rotate.c
 create mode 100644 drivers/media/rc/keymaps/rc-videostrong-kii-pro.c
 create mode 100644 drivers/staging/media/allegro-dvt/allegro-mail.c
 create mode 100644 drivers/staging/media/allegro-dvt/allegro-mail.h
 create mode 100644 drivers/staging/media/hantro/imx8m_vpu_hw.c
 create mode 100644 drivers/staging/media/meson/vdec/codec_h264.c
 create mode 100644 drivers/staging/media/meson/vdec/codec_h264.h
 create mode 100644 drivers/staging/media/meson/vdec/codec_hevc_common.c
 create mode 100644 drivers/staging/media/meson/vdec/codec_hevc_common.h
 create mode 100644 drivers/staging/media/meson/vdec/codec_vp9.c
 create mode 100644 drivers/staging/media/meson/vdec/codec_vp9.h
 create mode 100644 drivers/staging/media/meson/vdec/hevc_regs.h
 create mode 100644 drivers/staging/media/meson/vdec/vdec_hevc.c
 create mode 100644 drivers/staging/media/meson/vdec/vdec_hevc.h
 rename drivers/{media/usb =3D> staging/media}/usbvision/Kconfig (51%)
 rename drivers/{media/usb =3D> staging/media}/usbvision/Makefile (100%)
 create mode 100644 drivers/staging/media/usbvision/TODO
 rename drivers/{media/usb =3D> staging/media}/usbvision/usbvision-cards.c =
(100%)
 rename drivers/{media/usb =3D> staging/media}/usbvision/usbvision-cards.h =
(100%)
 rename drivers/{media/usb =3D> staging/media}/usbvision/usbvision-core.c (=
100%)
 rename drivers/{media/usb =3D> staging/media}/usbvision/usbvision-i2c.c (1=
00%)
 rename drivers/{media/usb =3D> staging/media}/usbvision/usbvision-video.c =
(99%)
 rename drivers/{media/usb =3D> staging/media}/usbvision/usbvision.h (100%)
 create mode 100644 include/dt-bindings/display/sdtv-standards.h
 create mode 100644 include/linux/atmel-isc-media.h
 delete mode 100644 include/media/i2c/smiapp.h

