Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 787262D941A
	for <lists+linux-media@lfdr.de>; Mon, 14 Dec 2020 09:23:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439172AbgLNIWd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Dec 2020 03:22:33 -0500
Received: from mail.kernel.org ([198.145.29.99]:41172 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726241AbgLNIWU (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Dec 2020 03:22:20 -0500
Date:   Mon, 14 Dec 2020 09:21:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607934097;
        bh=WSKvFeh3tF1RYRiQme2lhKVYGJJEEFnWPhPgW0PwmAs=;
        h=From:To:Cc:Subject:From;
        b=bazCOO+Xf3bTGGbT2YIy9Bnc3XwDlxmF4avNKwpQov/TbrcSFxUAcR1nhz3EOn4Sm
         nGASfVBA2aYFW83e58PQFBY6wh+ptORBTHDsTjcJI5tr2/xVAwb46s+KO2hl2EXiZy
         P7ZK+fzkla1reobdV783RWkls8uwB8QWtKUFJ0ZNjKdTx4fC2CtnlFpUsJ98ppX7zi
         vfqXeSm58RkpwYLuUZP92xtCOU5yWFgRpkktUi9sGGI7RysxVo3BNmvYui+a1Uu2Gy
         hDF3kVM4dQzZ2lN7LCEdCB1ULo4lSO102NQnKRpEbGx8/bygl+cHBzPLoysv+KOXrR
         w8AB9BUb/WfJA==
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL for v5.11-rc1] media updates
Message-ID: <20201214092132.63215862@coco.lan>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Linus,

Please pull from:
  git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/me=
dia/v5.11-1

For media updates for Kernel 5.11, containing:

   - some rework at the uAPI pixel format docs;
   - the smiapp driver has started to gain support for MIPI CSS camera
     sensors and was renamed;
   - Two new sensor drivers: ov02a10 and ov9734;
   - Meson gained a driver for the 2D acceleration unit;
   - Rockchip rkisp1 driver was promoted from staging;
   - Cedrus driver gained support for VP8;
   - Two new remote controller keymaps were added;
   - An usual set of fixes cleanups and driver improvements.

Regards,
Mauro

The following changes since commit b65054597872ce3aefbc6a666385eabdf9e288da:

  Linux 5.10-rc6 (2020-11-29 15:50:50 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/me=
dia/v5.11-1

for you to fetch changes up to 7ea4d23293300ca2f225595849a4fe444fb80ea4:

  media: ccs: Add support for obtaining C-PHY configuration from firmware (=
2020-12-07 17:05:16 +0100)

----------------------------------------------------------------
media updates for v5.11-rc1

----------------------------------------------------------------
Alain Volmat (1):
      media: stm32-dcmi: add 8-bit Bayer formats support

Alan Stern (1):
      media: gspca: Fix memory leak in probe

Alexander A. Klimov (1):
      media: Replace HTTP links with HTTPS ones: SI2165 MEDIA DRIVER

Alexandre Courbot (1):
      media: venus: vdec: return parsed crop information from stream

Andrey Konovalov (2):
      media: Revert "media: camss: Make use of V4L2_CAP_IO_MC"
      media: camss: Make use of V4L2_CAP_IO_MC

Andy Shevchenko (1):
      media: ipu3-cio2: Use macros from mm.h

AngeloGioacchino Del Regno (7):
      media: camss: ispif: Correctly reset based on the VFE ID
      media: camss: vfe-4-7: Rename get_ub_size, set_qos, set_ds, wm_enable
      media: camss: vfe: Add support for VFE 4.8
      media: dt-bindings: media: qcom,camss: Add bindings for SDM660 camss
      media: camss: Add support for SDM630/636/660 camera subsystem
      media: camss: csiphy-3ph: Add support for SDM630/660
      media: camss: csiphy: Set rate on csiX_phy clock on SDM630/660

Antti Palosaari (1):
      media: msi2500: assign SPI bus number dynamically

Arnd Bergmann (10):
      media: v4l2: prepare compat-ioctl rework
      media: v4l2: remove unneeded compat ioctl handlers
      media: v4l2: move v4l2_ext_controls conversion
      media: v4l2: move compat handling for v4l2_buffer
      media: v4l2: allocate v4l2_clip objects early
      media: v4l2: convert v4l2_format compat ioctls
      media: v4l2: remaining compat handlers
      media: v4l2: remove remaining compat_ioctl
      media: i2c: fix an uninitialized error code
      media: ccs: avoid printing an uninitialized variable

Baskov Evgeniy (1):
      media: s5p-jpeg: handle error condition in s5p_jpeg_probe

Bingbu Cao (4):
      media: ov2740: change the minimal exposure value to 4
      media: ov2740: only do OTP data read on demand from user
      media: ov2740: allow OTP data access during streaming
      media: ov9734: hold lock to check streaming state

Bixuan Cui (1):
      media: tuners: reduce stack usage in mxl5005s_reconfigure

Christian Hewitt (2):
      media: rc: add keymap for KHAMSIN remote
      media: meson: vdec: add G12/SM1 to module description

Christophe JAILLET (7):
      media: b2c2: switch from 'pci_' to 'dma_' API
      media: bt8xx: switch from 'pci_' to 'dma_' API
      media: bt8xx: avoid a useless memset
      media: dm1105: switch from 'pci_' to 'dma_' API
      media: solo6x10: switch from 'pci_' to 'dma_' API
      media: ttpci: switch from 'pci_' to 'dma_' API
      media: saa7146: switch from 'pci_' to 'dma_' API

Colin Ian King (5):
      media: zoran: fix spelling mistake and make error message more meanin=
gful
      media: tm6000: Fix sizeof() mismatches
      media: staging: rkisp1: rsz: make const array static, makes object sm=
aller
      media: mantis: remove redundant assignment to variable err
      media: ov2740: fix dereference before null check on pointer nvm

Dafna Hirschfeld (11):
      media: staging: rkisp1: remove TODO item to document quantization han=
dling
      media: staging: rkisp1: validate links before powering and streaming
      media: staging: rkisp1: params: in stop_streaming, use list_splice_in=
it to move the buffers
      media: staging: rkisp1: initialize buffer lists only on probe
      media: staging: rkisp1: remove the 'is_streaming' field from stats an=
d params
      media: staging: rkisp1: params: remove unnecessary "!!"
      media: staging: rkisp1: params: remove unnecessary parentheses
      media: staging: rkisp1: uapi: add "WITH Linux-syscall-note"
      media: staging: rkisp1: capture: set default quantization on 'set_fmt'
      media: uapi: add MEDIA_BUS_FMT_METADATA_FIXED media bus format.
      media: staging: rkisp1: isp: set metadata pads to MEDIA_BUS_FMT_METAD=
ATA_FIXED

Dan Carpenter (5):
      media: rc: validate that "rc_proto" is reasonable
      media: c8sectpfe: clean up some indenting
      media: max2175: fix max2175_set_csm_mode() error code
      media: saa7146: fix array overflow in vidioc_s_audio()
      media: rockchip: rkisp1: remove useless debugfs checks

Daniel Gomez (1):
      media: imx214: Fix stop streaming

Daniel Lee Kruse (1):
      media: cx23885: add more quirks for reset DMA on some AMD IOMMU

Dave Stevenson (1):
      media: i2c: imx219: Declare that the driver can create events

Deepak R Varma (2):
      media: staging: media: imx: remove commented code
      media: staging: media: imx: remove unnecessary variable use

Dikshita Agarwal (1):
      media: v4l2-ctrls: allow V4L2_CTRL_TYPE_BUTTON with request api

Dinghao Liu (1):
      media: dvbdev: Fix memleak in dvb_register_device

Dongchun Zhu (2):
      media: dt-bindings: media: i2c: document OV02A10 DT bindings
      media: i2c: add OV02A10 image sensor driver

Emmanuel Gil Peyrot (2):
      media: uapi: Expose VP8 probability lengths as defines
      media: hantro: Use VP8 lengths defined in uapi

Etienne Carriere (1):
      media: stm32-dcmi: don't print an error on probe deferral

Eugen Hristev (2):
      media: imx274: remove binning enum
      media: imx274: add support for sensor mode6, 1280x540

Evgeny Novikov (2):
      media: zr364xx: propagate errors from zr364xx_start_readpipe()
      media: isif: reset global state

Ezequiel Garcia (20):
      media: uapi: h264: Add documentation to the interface header
      media: coda: Remove redundant ctx->initialized setting
      media: coda: Simplify H.264 small buffer padding logic
      media: coda: Clarify device registered log
      media: coda: Clarify interrupt registered name
      media: coda: coda_buffer_meta housekeeping fix
      media: coda: Add a V4L2 user for control error macroblocks count
      media: controls: Add VP8 stateless type initialization
      media: controls: Add validate failure debug message
      media: cedrus: h264: Support profile controls
      media: Rename stateful codec control macros
      media: Clean stateless control includes
      media: controls: Validate H264 stateless controls
      media: controls: Add the stateless codec control class
      media: uapi: Move parsed H264 pixel format out of staging
      media: doc: Replace symbol for V4L2_CTRL_TYPE_H264_PRED_WEIGHTS
      media: uapi: Move the H264 stateless control types out of staging
      media: controls: Log H264 stateless controls in .std_log
      media: uapi: move H264 stateless controls out of staging
      media: docs: Move the H264 stateless codec uAPI

Fabio Estevam (3):
      media: coda: Convert the driver to DT-only
      media: fsl-viu: Use the ioread/write32be() accessors
      media: staging/imx: Increase IMX_MEDIA_EOF_TIMEOUT

Geert Uytterhoeven (1):
      media: Remove superfluous dependency for MEDIA_SUPPORT_FILTER

Gustavo A. R. Silva (1):
      media: pxa_camera: Use fallthrough pseudo-keyword

Hans Verkuil (16):
      media: Fix V4L2_COLORSPACE_470_SYSTEM_BG description
      media: vivid: fix (partially) timing issues
      media: cec-core.rst/cec-ioc-g-mode.rst: fix typos in monitor-all desc=
ription
      media: cec-core: first mark device unregistered, then wake up fhs
      media: saa7134: improve f->fmt.win.clips NULL check
      media: v4l2-compat-ioctl32.c: add missing #ifdef CONFIG_COMPAT_32BIT_=
TIMEs
      media: i2c: imx219: Selection compliance fixes
      media: vidioc-g-ext-ctrls.rst: document V4L2_CTRL_CLASS_DETECT
      media: ext-ctrls-image-source.rst: document v4l2_area
      media: vicodec: add V4L2_ prefix before FWHT_VERSION and FWHT_FL_*
      media: vicodec: mark the stateless FWHT API as stable
      media: ext-ctrls-codec.rst: move FWHT docs to ext-ctrls-codec-statele=
ss.rst
      media: pixfmt-compressed.rst: fix 'bullet' formatting
      media: vidioc-g-ext-ctrls.rst: add missing 'struct' before the types
      media: userspace-api/media: finalize stateless FWHT codec docs
      media: vivid: fix 'disconnect' error injection

Helen Koike (9):
      media: staging: rkisp1: cap: refactor enable/disable stream to allow =
multistreaming
      media: staging: dt-bindings: rkisp1: add missing required nodes
      media: staging: dt-bindings: rkisp1: drop i2c unit address
      media: staging: dt-bindings: rkisp1: re-order properties
      media: staging: dt-bindings: rkisp1: drop parent unit address
      media: staging: rkisp1: remove unecessary clocks
      media: staging: rkisp1: cap: fix timeout when stopping the stream
      media: rockchip: rkisp1: destage Rockchip ISP1 driver
      media: admin-guide/pixfmt-meta-rkisp1.rst: pixfmt reference conformin=
g with macro

Hsin-Yi Wang (1):
      media: mtk-vcodec: remove allocated dma_parms

Hugues Fruchet (5):
      media: ov5640: add support of 160x120 resolution
      media: stm32-dcmi: remove deprecated dmaengine_terminate_all()
      media: ov5640: fix support of BT656 bus mode
      media: dt-bindings: media: st,stm32-dcmi: add support of BT656 bus
      media: stm32-dcmi: add support of BT656 bus

Irui Wang (2):
      media: mtk-vpu: VPU should be in idle state before system is suspended
      media: mtk-vpu: dump VPU status when IPI times out

Jacopo Mondi (9):
      media: dt-bindings: media: mt9v111: Convert to json-schema
      media: dt-bindings: media: imx214: Convert to json-schema
      media: dt-bindings: media: ov772x: Convert to json-schema
      media: dt-bindings: media: ov772x: Make bus-type mandatory
      media: dt-bindings: media: ov772x: Document endpoint props
      media: max9271: Fix GPIO enable/disable
      media: rdacm20: Enable GPIO1 explicitly
      media: rcar-vin: Remove unused macro
      media: rcar-vin: Mask VNCSI_IFMD register

Jernej Skrabec (4):
      media: dt-bindings: media: allwinner,sun4i-a10-video-engine: Add R40 =
compatible
      media: cedrus: Add support for R40
      media: cedrus: Add support for VP8 decoding
      media: cedrus: Make VP8 codec as capability

Jia-Ju Bai (1):
      media: usb: msi2500: Fix a possible null-pointer dereference in msi25=
00_stop_streaming()

Jonas Karlman (2):
      media: rkvdec: h264: Support profile and level controls
      media: rc: add keymap for pine64 remote

Jonathan Corbet (1):
      media: stop pretending to maintain cafe and ov7670

Julia Lawall (19):
      media: coda: use semicolons rather than commas to separate statements
      media: em28xx-audio: use semicolons rather than commas to separate st=
atements
      media: rtl28xxu: use semicolons rather than commas to separate statem=
ents
      media: saa7134: use semicolons rather than commas to separate stateme=
nts
      media: m88ds3103: use semicolons rather than commas to separate state=
ments
      media: gspca: ov534-ov772x: use semicolons rather than commas to sepa=
rate statements
      media: s3c-camif: use semicolons rather than commas to separate state=
ments
      media: sun4i-csi: use semicolons rather than commas to separate state=
ments
      media: pvrusb2: use semicolons rather than commas to separate stateme=
nts
      media: ts2020: use semicolons rather than commas to separate statemen=
ts
      media: msp3400: use semicolons rather than commas to separate stateme=
nts
      media: radio-sf16fmr2: use semicolons rather than commas to separate =
statements
      media: mt2060: use semicolons rather than commas to separate statemen=
ts
      media: au0828: use semicolons rather than commas to separate statemen=
ts
      media: dvbsky: use semicolons rather than commas to separate statemen=
ts
      media: dib0700: use semicolons rather than commas to separate stateme=
nts
      media: rtl2832: use semicolons rather than commas to separate stateme=
nts
      media: exynos4-is: use semicolons rather than commas to separate stat=
ements
      media: bttv: use semicolons rather than commas to separate statements

Kai Muenz (1):
      media: dvb-usb: Add Hauppauge MAX S2's USB-IDs

Keita Suzuki (1):
      media: siano: fix memory leak of debugfs members in smsdvb_hotplug

Kieran Bingham (1):
      media: v4l2-async: Fix trivial documentation typo

Krzysztof Kozlowski (24):
      media: i2c: imx219: simplify getting state container
      media: i2c: imx290: simplify getting state container
      media: i2c: imx319: simplify getting state container
      media: i2c: imx319: silence unused acpi_device_id warning
      media: i2c: imx355: simplify getting state container
      media: i2c: imx355: silence unused acpi_device_id warning
      media: i2c: ad5820: simplify getting state container
      media: i2c: adp1653: simplify getting state container
      media: i2c: adv7180: simplify getting state container
      media: i2c: ak7375: simplify getting state container
      media: i2c: dw9768: simplify getting state container
      media: i2c: et8ek8: simplify getting state container
      media: i2c: hi556: simplify getting state container
      media: i2c: ov13858: simplify getting state container
      media: i2c: ov2680: simplify getting state container
      media: i2c: ov2685: simplify getting state container
      media: i2c: ov2740: simplify getting state container
      media: i2c: ov5670: simplify getting state container
      media: i2c: ov5675: simplify getting state container
      media: i2c: ov5695: simplify getting state container
      media: i2c: ov7740: simplify getting state container
      media: i2c: ov8856: simplify getting state container
      media: i2c: smiapp: simplify getting state container
      media: i2c: tvp5150: simplify getting state container

Lad Prabhakar (4):
      media: v4l2-fwnode: Return -EINVAL for invalid bus-type
      media: i2c: ov772x: Parse endpoint properties
      media: i2c: ov772x: Add support for BT.656 mode
      media: i2c: ov772x: Add test pattern control

Laurent Pinchart (16):
      media: videodev2.h: Remove unneeded comment about 4CC value
      media: videodev2.h: Move HI240 format to vendor-specific section
      media: videodev2.h: Move HM12 format to YUV semi-planar section
      media: doc: pixfmt-rgb: Remove layout table for packed RGB formats
      media: doc: pixfmt-rgb: Add title for deprecated formats
      media: doc: pixfmt-rgb: Clarify naming scheme for RGB formats
      media: doc: pixfmt-rgb: Make 8 bits per component table more compact
      media: doc: pixfmt-rgb: Replace '-' with 'X' to denote padding
      media: doc: pixfmt-yuv: Document subsampling in more details
      media: doc: pixfmt-yuv: Move all packed YUV formats to common file
      media: doc: pixfmt-packed-yuv: Fill padding bits with 'X'
      media: doc: pixfmt-packed-yuv: Express 4:4:4 formats in a more compac=
t way
      media: doc: pixfmt-packed-yuv: Clarify naming scheme for 4:4:4 formats
      media: doc: pixfmt-yuv: Move all luma-only YUV formats to common file
      media: doc: pixfmt-yuv: Move all semi-planar YUV formats to common fi=
le
      media: doc: pixfmt-yuv: Move all planar YUV formats to common file

Liu Shixin (2):
      media: saa7164: convert to use DEFINE_SEQ_ATTRIBUTE macro
      media: media/pci: simplify the return expression of verify_window_lock

Lukas Bulwahn (1):
      media: MAINTAINERS: rectify ZR36067 VIDEO FOR LINUX DRIVER section

Mansur Alisha Shaik (8):
      media: venus: core: change clk enable and disable order in resume and=
 suspend
      media: venus: core: vote for video-mem path
      media: venus: core: vote with average bandwidth and peak bandwidth as=
 zero
      media: venus: put dummy vote on video-mem path after last session rel=
ease
      media: venus: fix calculating mbps in calculate_inst_freq()
      media: venus: core: handle race condititon for core ops
      media: venus: handle use after free for iommu_map/iommu_unmap
      media: venus: core: add shutdown callback for venus

Marek Szyprowski (1):
      media: platform: exynos4-is: remove all references to physical addres=
ses

Martin Cerveny (3):
      media: cedrus: Register all codecs as capability
      media: dt-bindings: media: cedrus: Add V3s compatible
      media: cedrus: Add support for V3s

Mauro Carvalho Chehab (6):
      media: fix kernel-doc markups
      media: docs: uAPI: rc: dual-license the docs with GPL v2
      media: rc: improve LIRC documentation
      media: gp8psk: initialize stats at power control logic
      Merge tag 'v5.10-rc6' into patchwork
      media: pixfmt-meta-rkisp1.rst: fix two build warnings

Neil Armstrong (3):
      media: dt-bindings: media: Add bindings for the Amlogic GE2D Accelera=
tor Unit
      media: meson: Add M2M driver for the Amlogic GE2D Accelerator Unit
      media: MAINTAINERS: Add myself as maintainer of the Amlogic GE2D driv=
er

Nigel Christian (1):
      media: ipu3-cio2: fix trivial style warning

Niklas S=C3=B6derlund (20):
      media: rcar-vin: Remove redundant compatible values
      media: rcar-vin: Use scratch buffer when not in running state
      media: rcar-vin: Remove handling of user-space buffers when stopping
      media: rcar-vin: Cache the CSI-2 channel selection value
      media: rcar-vin: Break out hardware start and stop to new methods
      media: rcar-vin: Add support for suspend and resume
      media: dt-bindings: adv7604: Fix documentation for hpd-gpios
      media: dt-bindings: adv7604: Convert bindings to json-schema
      media: MAINTAINERS: Add ADV7604 bindings documentation
      media: rcar-csi2: Switch to using fwnode instead of OF
      media: rcar-csi2: Set bus type when parsing fwnode
      media: rcar-vin: Only dynamically allocate v4l2_async_subdev
      media: rcar-vin: Rework parallel firmware parsing
      media: rcar-vin: Use v4l2_async_subdev instead of fwnode_handle to ma=
tch subdevices
      media: rcar-vin: Rework CSI-2 firmware parsing
      media: v4l2-fwnode: Remove v4l2_async_notifier_parse_fwnode_endpoints=
_by_port()
      media: adv748x: Only set i2c addresses once during probe
      media: adv748x: afe: Select input port when device is reset
      media: adv748x: csi2: Set virtual channel when device is reset
      media: adv748x: Configure device when resuming from sleep

Nishka Dasgupta (1):
      media: platform: sti: c8sectpfe: core: Add of_node_put() at goto

Peilin Ye (1):
      media: rockchip: rkisp1: Fix typos in comments and macro definitions

Philipp Zabel (1):
      media: dt-bindings: convert CODA VPU bindings to yaml

Qinglang Miao (2):
      media: usb: dvb-usb-v2: zd1301: fix missing platform_device_unregiste=
r()
      media: solo6x10: fix missing snd_card_free in error handling case

Randy Dunlap (15):
      media: Documentation: userspace-api/media: dvb/ca: drop doubled word
      media: Documentation: userspace-api/media: dvb/demux: drop doubled wo=
rd
      media: Documentation: userspace-api/media: dvb/dmx-qbuf: drop doubled=
 word
      media: Documentation: userspace-api/media: dvb/video: drop doubled wo=
rd
      media: Documentation: userspace-api/media: v4l/vidioc-qbuf: drop doub=
led word
      media: Documentation: userspace-api/media: v4l/vidioc-g-output: drop =
doubled word
      media: Documentation: userspace-api/media: v4l/vidioc-g-ext-ctrls: dr=
op doubled word
      media: Documentation: userspace-api/media: v4l/selection-api-config: =
drop doubled word
      media: Documentation: userspace-api/media: dvb/audio: drop doubled wo=
rd
      media: Documentation: userspace-api/media: dvb/net: drop doubled word
      media: Documentation: userspace-api/media: dvb/audio: drop doubled wo=
rd
      media: Documentation/driver-api: media/cec-core: drop doubled word
      media: Documentation/driver-api: media/v4l2-controls: drop doubled wo=
rds
      media: Documentation/driver-api: media/v4l2-dev: drop doubled word
      media: Documentation/driver-api: media/dtv-frontend: drop doubled word

Rikard Falkeborn (1):
      media: rockchip: rkisp1: Constify static structs

Rob Herring (2):
      media: dt-bindings: media: Use OF graph schema
      media: dt-bindings: schema indentation fixes

Robert Foss (1):
      media: MAINTAINERS: camss: Add Robert Foss as co-maintainer

Rui Miguel Silva (3):
      media: dt-bindings: ov2680: convert bindings to yaml
      media: dt-bindings: imx7-csi: convert bindings to yaml
      media: dt-bindings: imx7-mipi-csi2: convert bindings to yaml

Sakari Ailus (123):
      media: adv748x: Zero entire struct v4l2_fwnode_endpoint
      media: v4l2-fwnode: v4l2_fwnode_endpoint_parse caller must init vep a=
rgument
      media: v4l2-fwnode: Don't zero parts of struct v4l2_fwnode_endpoint a=
nymore
      media: v4l2-fwnode: Rework v4l2_fwnode_endpoint_parse documentation
      media: v4l2-fwnode: Say it's fine to use v4l2_fwnode_endpoint_parse
      media: v4l: subdev: Improve link format validation debug messages
      media: ipu3-cio2: Return actual subdev format
      media: ipu3-cio2: Serialise access to pad format
      media: ipu3-cio2: Validate mbus format in setting subdev format
      media: ipu3-cio2: Make the field on subdev format V4L2_FIELD_NONE
      media: ipu3-cio2: Use unsigned values where appropriate
      media: ipu3-cio2: Remove explicit type from frame size checks
      media: ipu3-cio2: Rename CIO2_IMAGE_MAX_LENGTH as CIO2_IMAGE_MAX_HEIG=
HT
      media: ipu3-cio2: Remove traces of returned buffers
      media: ipu3-cio2: Check receved the size against payload size, not bu=
ffer size
      media: Documentation: v4l: Fix language
      media: Documentation: v4l: Document required controls on camera senso=
rs
      media: v4l: Add a helper for obtaining the link frequency
      media: ipu3-cio2: Use v4l2_get_link_freq helper
      media: imx258: Remove Jason Chen's e-mail
      media: vim2m: Register video device after setting up internals
      media: ccs: Add the generator for CCS register definitions and limits
      media: Documentation: ccs: Add CCS driver documentation
      media: smiapp: Import CCS definitions
      media: smiapp: Use CCS register flags
      media: smiapp: Calculate CCS limit offsets and limit buffer size
      media: smiapp: Remove macros for defining registers, merge definitions
      media: smiapp: Add macros for accessing CCS registers
      media: smiapp: Use MIPI CCS version and manufacturer ID information
      media: smiapp: Read CCS limit values
      media: smiapp: Switch to CCS limits
      media: smiapp: Obtain frame descriptor from CCS limits
      media: smiapp: Use CCS limits in reading data format descriptors
      media: smiapp: Use CCS limits in reading binning capabilities
      media: smiapp: Use CCS registers
      media: smiapp: Remove quirk function for writing a single 8-bit regis=
ter
      media: smiapp: Rename register access functions
      media: smiapp: Internal rename to CCS
      media: smiapp: Differentiate CCS sensors from SMIA in subdev naming
      media: smiapp: Rename as "ccs"
      media: ccs: Remove profile concept
      media: ccs: Give all subdevs a function
      media: dt-bindings: nokia,smia: Fix link-frequencies documentation
      media: dt-bindings: nokia,smia: Make vana-supply optional
      media: dt-bindings: nokia,smia: Remove nokia,nvm-size property
      media: dt-bindings: nokia,smia: Convert to YAML
      media: dt-bindings: nokia,smia: Use better active polarity for reset
      media: dt-bindings: nokia,smia: Amend SMIA bindings with MIPI CCS sup=
port
      media: dt-bindings: mipi-ccs: Add bus-type for C-PHY support
      media: ccs: Request for "reset" GPIO
      media: v4l: subdev: Set sd->devnode before registering the subdev
      media: Documentation: ccs: Rename ccs-regs.txt as ccs-regs.asc
      media: Documentation: ccs: Reorder SPDX and copyright notice lines
      media: ccs: Add MIPI CCS compatible strings
      media: ccs: Add device compatible identifiers for telling SMIA and CC=
S apart
      media: ccs: Add CCS ACPI device ID
      media: ccs: Remove the I=C2=B2C ID table
      media: ccs: Remove remaining support for platform data
      media: ccs: Make hwcfg part of the device specific struct
      media: ccs: Fix obtaining bus information from firmware
      media: ccs: Add CCS static data parser library
      media: ccs: Combine revision number major and minor into one
      media: ccs: Read CCS static data from firmware binaries
      media: ccs: Stop reading arrays after the first zero
      media: ccs: The functions to get compose or crop rectangle never retu=
rn NULL
      media: ccs: Replace somewhat harsh internal checks based on BUG with =
WARN_ON
      media: ccs: Refactor register reading a little
      media: ccs: Make real to integer number conversion optional
      media: ccs: Move limit value real to integer conversion from read to =
access time
      media: ccs: Read ireal numbers correctly
      media: smiapp-pll: Rename as ccs-pll
      media: ccs-pll: Fix MODULE_LICENSE
      media: ccs: Change my e-mail address
      media: ccs: Allow range in between I=C2=B2C retries
      media: ccs: Add support for manufacturer regs from sensor and module =
files
      media: ccs: Use static data read-only registers
      media: ccs: Clean up runtime PM usage
      media: ccs: Wrap long lines, unwrap short ones
      media: ccs: Use longer pre-I=C2=B2C sleep for CCS compliant devices
      media: ccs: Remove unnecessary delays from power-up sequence
      media: dt-bindings: mipi,ccs: Don't mention vana voltage
      media: dt-bindings: mipi,ccs: Add vcore and vio supplies
      media: ccs: Use all regulators
      media: Revert "media: dt-bindings: media: Use OF graph schema"
      media: ccs: Fix return value from probe
      media: ccs-pll: Don't use div_u64 to divide a 32-bit number
      media: ccs-pll: Split limits and PLL configuration into front and bac=
k parts
      media: ccs-pll: Use correct VT divisor for calculating VT SYS divisor
      media: ccs-pll: End search if there are no better values available
      media: ccs-pll: Remove parallel bus support
      media: ccs-pll: Differentiate between CSI-2 D-PHY and C-PHY
      media: ccs-pll: Move the flags field down, away from 8-bit fields
      media: ccs-pll: Document the structs in the header as well as the fun=
ction
      media: ccs-pll: Use the BIT macro
      media: ccs-pll: Begin calculation from OP system clock frequency
      media: ccs-pll: Fix condition for pre-PLL divider lower bound
      media: ccs-pll: Avoid overflow in pre-PLL divisor lower bound search
      media: ccs-pll: Fix comment on check against maximum PLL multiplier
      media: ccs-pll: Fix check for PLL multiplier upper bound
      media: ccs-pll: Use explicit 32-bit unsigned type
      media: ccs-pll: Add support for lane speed model
      media: ccs: Add support for lane speed model
      media: ccs-pll: Add support for decoupled OP domain calculation
      media: ccs-pll: Add support for extended input PLL clock divider
      media: ccs-pll: Support two cycles per pixel on OP domain
      media: ccs-pll: Add support flexible OP PLL pixel clock divider
      media: ccs-pll: Add sanity checks
      media: ccs-pll: Add C-PHY support
      media: ccs-pll: Split off VT subtree calculation
      media: ccs-pll: Check for derating and overrating, support non-derati=
ng sensors
      media: ccs-pll: Better separate OP and VT sub-tree calculation
      media: ccs-pll: Print relevant information on PLL tree
      media: ccs-pll: Rework bounds checks
      media: ccs-pll: Make VT divisors 16-bit
      media: ccs-pll: Fix VT post-PLL divisor calculation
      media: ccs-pll: Separate VT divisor limit calculation from the rest
      media: ccs-pll: Add trivial dual PLL support
      media: ccs: Dual PLL support
      media: ccs-pll: Add support for DDR OP system and pixel clocks
      media: ccs: Add support for DDR OP SYS and OP PIX clocks
      media: ccs: Print written register values
      media: ccs-pll: Print pixel rates
      media: ccs: Add support for obtaining C-PHY configuration from firmwa=
re

Sameer Puri (1):
      media: i2c: imx219: remove redundant writes

Sean Young (4):
      media: sunxi-cir: ensure IR is handled when it is continuous
      media: sunxi-cir: allow timeout to be set at runtime
      media: lirc: ensure RC_PROTO_MAX has documentation
      media: lirc: fix lirc.h documentation generation

Sergey Senozhatsky (1):
      media: ov2740: select regmap

Shunqian Zheng (1):
      media: videodev2.h, v4l2-ioctl: add rkisp1 meta buffer format

Sowjanya Komatineni (3):
      media: i2c: imx274: Fix Y_OUT_SIZE register setting
      media: i2c: imx274: Remove stop stream i2c writes during remove
      media: i2c: imx274: Add IMX274 power on and off sequence

Stanimir Varbanov (1):
      media: venus: venc: Fix default capture format

Thomas Gleixner (4):
      media: Bulk remove BUG_ON(in_interrupt())
      media: au0828: Consolidate dmesg output
      media: cx231xx: Consolidate dmesg output
      media: omap3isp: Remove misleading comment

Tianshu Qiu (1):
      media: i2c: Add ov9734 image sensor driver

Tom Rix (3):
      media: remove unneeded break
      media: ov7670: do not aggregate returns
      media: si4713: remove trailing semicolon in macro definition

Vaibhav Gupta (1):
      media: bttv: use generic power management

Xu Wang (2):
      media: i2c: mt9p031: Remove redundant null check before clk_disable_u=
nprepare
      media: cx88: use ARRAY_SIZE

Yu Kuai (6):
      media: platform: add missing put_device() call in mtk_jpeg_clk_init()
      media: mtk-vcodec: add missing put_device() call in mtk_vcodec_init_d=
ec_pm()
      media: mtk-vcodec: add missing put_device() call in mtk_vcodec_releas=
e_dec_pm()
      media: mtk-vcodec: add missing put_device() call in mtk_vcodec_init_e=
nc_pm()
      media: mtk-vcodec: add missing put_device() call in mtk_vcodec_releas=
e_enc_pm()
      media: platform: add missing put_device() call in mtk_jpeg_probe() an=
d mtk_jpeg_remove()

YueHaibing (2):
      media: marvell-ccic: Fix -Wunused-function warnings
      media: rkvdec: Remove redundant platform_get_irq error message

Zebediah Figura (1):
      media: cx231xx: Use snd_card_free_when_closed() instead of snd_card_f=
ree().

Zhang Qilong (2):
      media: staging: rkisp1: cap: fix runtime PM imbalance on error
      media: cedrus: fix reference leak in cedrus_start_streaming

Zhang Xiaoxu (1):
      media: tvp5150: Fix wrong return value of tvp5150_parse_dt()

zhong jiang (1):
      media: uvcvideo: Use DIV_ROUND_CLOSEST directly to make it readable

 Documentation/admin-guide/media/rkisp1.rst         |    4 +-
 .../media/allwinner,sun4i-a10-video-engine.yaml    |    2 +
 .../bindings/media/amlogic,axg-ge2d.yaml           |   47 +
 Documentation/devicetree/bindings/media/coda.txt   |   31 -
 Documentation/devicetree/bindings/media/coda.yaml  |  108 +
 .../devicetree/bindings/media/i2c/adv7604.txt      |   88 -
 .../devicetree/bindings/media/i2c/adv7604.yaml     |  178 +
 .../bindings/media/i2c/aptina,mt9v111.txt          |   46 -
 .../bindings/media/i2c/aptina,mt9v111.yaml         |   75 +
 .../devicetree/bindings/media/i2c/mipi-ccs.yaml    |  135 +
 .../devicetree/bindings/media/i2c/nokia,smia.txt   |   66 -
 .../devicetree/bindings/media/i2c/ov2680.txt       |   46 -
 .../devicetree/bindings/media/i2c/ov772x.txt       |   40 -
 .../bindings/media/i2c/ovti,ov02a10.yaml           |  159 +
 .../devicetree/bindings/media/i2c/ovti,ov2680.yaml |   99 +
 .../devicetree/bindings/media/i2c/ovti,ov772x.yaml |  134 +
 .../devicetree/bindings/media/i2c/sony,imx214.txt  |   53 -
 .../devicetree/bindings/media/i2c/sony,imx214.yaml |  133 +
 .../devicetree/bindings/media/imx7-csi.txt         |   42 -
 .../devicetree/bindings/media/imx7-mipi-csi2.txt   |   90 -
 .../devicetree/bindings/media/nxp,imx7-csi.yaml    |   71 +
 .../bindings/media/nxp,imx7-mipi-csi2.yaml         |  173 +
 .../devicetree/bindings/media/qcom,camss.txt       |    7 +
 Documentation/devicetree/bindings/media/rc.yaml    |    2 +
 .../devicetree/bindings/media/rockchip-isp1.yaml   |   81 +-
 .../devicetree/bindings/media/st,stm32-dcmi.yaml   |   38 +
 Documentation/driver-api/media/camera-sensor.rst   |   13 +
 Documentation/driver-api/media/cec-core.rst        |    4 +-
 Documentation/driver-api/media/csi2.rst            |    7 +-
 .../driver-api/media/drivers/ccs/ccs-regs.asc      | 1041 ++++++
 Documentation/driver-api/media/drivers/ccs/ccs.rst |   82 +
 .../driver-api/media/drivers/ccs/mk-ccs-regs       |  433 +++
 Documentation/driver-api/media/drivers/index.rst   |    1 +
 Documentation/driver-api/media/dtv-frontend.rst    |    6 +-
 Documentation/driver-api/media/v4l2-controls.rst   |    4 +-
 Documentation/driver-api/media/v4l2-dev.rst        |    2 +-
 .../userspace-api/media/cec/cec-ioc-g-mode.rst     |    2 +-
 Documentation/userspace-api/media/dvb/audio.rst    |    2 +-
 Documentation/userspace-api/media/dvb/ca.rst       |    2 +-
 Documentation/userspace-api/media/dvb/demux.rst    |    2 +-
 Documentation/userspace-api/media/dvb/dmx-qbuf.rst |    2 +-
 Documentation/userspace-api/media/dvb/net.rst      |    2 +-
 Documentation/userspace-api/media/dvb/video.rst    |    2 +-
 .../userspace-api/media/lirc.h.rst.exceptions      |    1 +
 .../userspace-api/media/rc/keytable.c.rst          |    2 +-
 .../userspace-api/media/rc/lirc-dev-intro.rst      |   13 +-
 Documentation/userspace-api/media/rc/lirc-dev.rst  |    2 +-
 Documentation/userspace-api/media/rc/lirc-func.rst |    2 +-
 .../userspace-api/media/rc/lirc-get-features.rst   |    2 +-
 .../userspace-api/media/rc/lirc-get-rec-mode.rst   |    2 +-
 .../media/rc/lirc-get-rec-resolution.rst           |    2 +-
 .../userspace-api/media/rc/lirc-get-send-mode.rst  |    2 +-
 .../userspace-api/media/rc/lirc-get-timeout.rst    |    2 +-
 .../userspace-api/media/rc/lirc-header.rst         |    2 +-
 Documentation/userspace-api/media/rc/lirc-read.rst |    2 +-
 .../media/rc/lirc-set-measure-carrier-mode.rst     |    2 +-
 .../media/rc/lirc-set-rec-carrier-range.rst        |    2 +-
 .../media/rc/lirc-set-rec-carrier.rst              |    2 +-
 .../media/rc/lirc-set-rec-timeout-reports.rst      |    2 +-
 .../media/rc/lirc-set-rec-timeout.rst              |    2 +-
 .../media/rc/lirc-set-send-carrier.rst             |    2 +-
 .../media/rc/lirc-set-send-duty-cycle.rst          |    2 +-
 .../media/rc/lirc-set-transmitter-mask.rst         |    2 +-
 .../media/rc/lirc-set-wideband-receiver.rst        |    2 +-
 .../userspace-api/media/rc/lirc-write.rst          |    2 +-
 Documentation/userspace-api/media/rc/rc-intro.rst  |    2 +-
 Documentation/userspace-api/media/rc/rc-protos.rst |    2 +-
 .../userspace-api/media/rc/rc-sysfs-nodes.rst      |    2 +-
 .../userspace-api/media/rc/rc-table-change.rst     |    2 +-
 Documentation/userspace-api/media/rc/rc-tables.rst |    2 +-
 .../userspace-api/media/rc/remote_controllers.rst  |    2 +-
 Documentation/userspace-api/media/v4l/biblio.rst   |   12 +-
 Documentation/userspace-api/media/v4l/buffer.rst   |    2 +-
 .../media/v4l/colorspaces-details.rst              |    5 +-
 Documentation/userspace-api/media/v4l/common.rst   |    1 +
 .../userspace-api/media/v4l/dev-mem2mem.rst        |    2 +-
 .../media/v4l/ext-ctrls-codec-stateless.rst        |  793 +++++
 .../userspace-api/media/v4l/ext-ctrls-codec.rst    |  817 +----
 .../media/v4l/ext-ctrls-image-source.rst           |   14 +
 .../userspace-api/media/v4l/extended-controls.rst  |    8 +-
 .../userspace-api/media/v4l/pixfmt-compressed.rst  |   37 +-
 .../userspace-api/media/v4l/pixfmt-grey.rst        |   44 -
 .../userspace-api/media/v4l/pixfmt-m420.rst        |   59 +-
 .../userspace-api/media/v4l/pixfmt-meta-rkisp1.rst |    7 +-
 .../userspace-api/media/v4l/pixfmt-nv12.rst        |  129 -
 .../userspace-api/media/v4l/pixfmt-nv12m.rst       |  144 -
 .../userspace-api/media/v4l/pixfmt-nv12mt.rst      |   60 -
 .../userspace-api/media/v4l/pixfmt-nv16.rst        |  153 -
 .../userspace-api/media/v4l/pixfmt-nv16m.rst       |  157 -
 .../userspace-api/media/v4l/pixfmt-nv24.rst        |   95 -
 .../userspace-api/media/v4l/pixfmt-packed-yuv.rst  |  412 ++-
 .../userspace-api/media/v4l/pixfmt-rgb.rst         |  671 ++--
 .../userspace-api/media/v4l/pixfmt-uyvy.rst        |  110 -
 .../userspace-api/media/v4l/pixfmt-vyuy.rst        |  108 -
 .../userspace-api/media/v4l/pixfmt-y10.rst         |   65 -
 .../userspace-api/media/v4l/pixfmt-y10b.rst        |   33 -
 .../userspace-api/media/v4l/pixfmt-y10p.rst        |   43 -
 .../userspace-api/media/v4l/pixfmt-y12.rst         |   65 -
 .../userspace-api/media/v4l/pixfmt-y14.rst         |   65 -
 .../userspace-api/media/v4l/pixfmt-y16-be.rst      |   69 -
 .../userspace-api/media/v4l/pixfmt-y16.rst         |   69 -
 .../userspace-api/media/v4l/pixfmt-y41p.rst        |  151 -
 .../userspace-api/media/v4l/pixfmt-yuv-luma.rst    |  126 +
 .../userspace-api/media/v4l/pixfmt-yuv-planar.rst  |  950 ++++++
 .../userspace-api/media/v4l/pixfmt-yuv410.rst      |  127 -
 .../userspace-api/media/v4l/pixfmt-yuv411p.rst     |  115 -
 .../userspace-api/media/v4l/pixfmt-yuv420.rst      |  143 -
 .../userspace-api/media/v4l/pixfmt-yuv420m.rst     |  152 -
 .../userspace-api/media/v4l/pixfmt-yuv422m.rst     |  141 -
 .../userspace-api/media/v4l/pixfmt-yuv422p.rst     |  129 -
 .../userspace-api/media/v4l/pixfmt-yuv444m.rst     |  141 -
 .../userspace-api/media/v4l/pixfmt-yuyv.rst        |  118 -
 .../userspace-api/media/v4l/pixfmt-yvyu.rst        |  108 -
 .../media/v4l/selection-api-configuration.rst      |    2 +-
 .../userspace-api/media/v4l/subdev-formats.rst     |   27 +
 .../userspace-api/media/v4l/vidioc-g-ext-ctrls.rst |   46 +-
 .../userspace-api/media/v4l/vidioc-g-output.rst    |    2 +-
 .../userspace-api/media/v4l/vidioc-qbuf.rst        |    2 +-
 .../userspace-api/media/v4l/vidioc-queryctrl.rst   |    6 +
 .../userspace-api/media/v4l/yuv-formats.rst        |  278 +-
 .../userspace-api/media/videodev2.h.rst.exceptions |    2 +
 MAINTAINERS                                        |   87 +-
 drivers/media/Kconfig                              |    1 -
 drivers/media/cec/core/cec-core.c                  |    4 +-
 drivers/media/common/cx2341x.c                     |    4 +-
 drivers/media/common/saa7146/saa7146_core.c        |   39 +-
 drivers/media/common/saa7146/saa7146_fops.c        |    9 +-
 drivers/media/common/saa7146/saa7146_vbi.c         |    6 +-
 drivers/media/common/saa7146/saa7146_video.c       |    6 +-
 drivers/media/common/siano/smsdvb-main.c           |    5 +-
 drivers/media/dvb-core/dvbdev.c                    |    3 +
 drivers/media/dvb-frontends/ascot2e.h              |    2 +-
 drivers/media/dvb-frontends/cxd2820r.h             |    2 +-
 drivers/media/dvb-frontends/drx39xyj/drxj.c        |    7 -
 drivers/media/dvb-frontends/drxd_hard.c            |    1 -
 drivers/media/dvb-frontends/drxk.h                 |    2 +-
 drivers/media/dvb-frontends/dvb-pll.h              |    2 +-
 drivers/media/dvb-frontends/helene.h               |    4 +-
 drivers/media/dvb-frontends/horus3a.h              |    2 +-
 drivers/media/dvb-frontends/ix2505v.h              |    4 +-
 drivers/media/dvb-frontends/m88ds3103.c            |    6 +-
 drivers/media/dvb-frontends/m88ds3103.h            |    2 +-
 drivers/media/dvb-frontends/mb86a20s.h             |    2 +-
 drivers/media/dvb-frontends/nxt200x.c              |   16 -
 drivers/media/dvb-frontends/rtl2832.c              |   14 +-
 drivers/media/dvb-frontends/si2165.c               |    2 +-
 drivers/media/dvb-frontends/si2165.h               |    2 +-
 drivers/media/dvb-frontends/si21xx.c               |    2 -
 drivers/media/dvb-frontends/stb6000.h              |    2 +-
 drivers/media/dvb-frontends/tda826x.h              |    2 +-
 drivers/media/dvb-frontends/ts2020.c               |   10 +-
 drivers/media/dvb-frontends/zl10036.h              |    4 +-
 drivers/media/i2c/Kconfig                          |   32 +-
 drivers/media/i2c/Makefile                         |    6 +-
 drivers/media/i2c/ad5820.c                         |    6 +-
 drivers/media/i2c/adp1653.c                        |    6 +-
 drivers/media/i2c/adv7180.c                        |    6 +-
 drivers/media/i2c/adv748x/adv748x-afe.c            |    6 +-
 drivers/media/i2c/adv748x/adv748x-core.c           |   34 +-
 drivers/media/i2c/adv748x/adv748x-csi2.c           |    6 +-
 drivers/media/i2c/adv748x/adv748x.h                |    2 +
 drivers/media/i2c/ak7375.c                         |    7 +-
 drivers/media/i2c/ccs-pll.c                        |  886 +++++
 drivers/media/i2c/ccs-pll.h                        |  214 ++
 drivers/media/i2c/ccs/Kconfig                      |   11 +
 drivers/media/i2c/ccs/Makefile                     |    6 +
 drivers/media/i2c/ccs/ccs-core.c                   | 3479 ++++++++++++++++=
++++
 drivers/media/i2c/ccs/ccs-data-defs.h              |  221 ++
 drivers/media/i2c/ccs/ccs-data.c                   |  953 ++++++
 drivers/media/i2c/ccs/ccs-data.h                   |  228 ++
 drivers/media/i2c/ccs/ccs-limits.c                 |  239 ++
 drivers/media/i2c/ccs/ccs-limits.h                 |  259 ++
 .../i2c/{smiapp/smiapp-quirk.c =3D> ccs/ccs-quirk.c} |  105 +-
 .../i2c/{smiapp/smiapp-quirk.h =3D> ccs/ccs-quirk.h} |   54 +-
 drivers/media/i2c/ccs/ccs-reg-access.c             |  409 +++
 drivers/media/i2c/ccs/ccs-reg-access.h             |   42 +
 drivers/media/i2c/ccs/ccs-regs.h                   |  954 ++++++
 drivers/media/i2c/{smiapp/smiapp.h =3D> ccs/ccs.h}   |  184 +-
 drivers/media/i2c/ccs/smiapp-reg-defs.h            |  580 ++++
 drivers/media/i2c/dw9768.c                         |    6 +-
 drivers/media/i2c/et8ek8/et8ek8_driver.c           |    8 +-
 drivers/media/i2c/hi556.c                          |    6 +-
 drivers/media/i2c/imx214.c                         |    2 +-
 drivers/media/i2c/imx219.c                         |   38 +-
 drivers/media/i2c/imx258.c                         |    2 +-
 drivers/media/i2c/imx274.c                         |  280 +-
 drivers/media/i2c/imx290.c                         |   10 +-
 drivers/media/i2c/imx319.c                         |    8 +-
 drivers/media/i2c/imx355.c                         |    8 +-
 drivers/media/i2c/max2175.c                        |    2 +-
 drivers/media/i2c/max9271.c                        |    8 +-
 drivers/media/i2c/msp3400-kthreads.c               |   12 +-
 drivers/media/i2c/mt9p031.c                        |    3 +-
 drivers/media/i2c/ov02a10.c                        | 1015 ++++++
 drivers/media/i2c/ov13858.c                        |    6 +-
 drivers/media/i2c/ov2680.c                         |    6 +-
 drivers/media/i2c/ov2685.c                         |    6 +-
 drivers/media/i2c/ov2740.c                         |  214 +-
 drivers/media/i2c/ov5640.c                         |  108 +-
 drivers/media/i2c/ov5670.c                         |    6 +-
 drivers/media/i2c/ov5675.c                         |    6 +-
 drivers/media/i2c/ov5695.c                         |    6 +-
 drivers/media/i2c/ov7670.c                         |   96 +-
 drivers/media/i2c/ov772x.c                         |   71 +-
 drivers/media/i2c/ov7740.c                         |    6 +-
 drivers/media/i2c/ov8856.c                         |    6 +-
 drivers/media/i2c/ov9734.c                         | 1020 ++++++
 drivers/media/i2c/rdacm20.c                        |   13 +-
 drivers/media/i2c/smiapp-pll.c                     |  482 ---
 drivers/media/i2c/smiapp-pll.h                     |   99 -
 drivers/media/i2c/smiapp/Kconfig                   |   10 -
 drivers/media/i2c/smiapp/Makefile                  |    6 -
 drivers/media/i2c/smiapp/smiapp-core.c             | 3175 ----------------=
--
 drivers/media/i2c/smiapp/smiapp-limits.c           |  118 -
 drivers/media/i2c/smiapp/smiapp-limits.h           |  114 -
 drivers/media/i2c/smiapp/smiapp-reg-defs.h         |  489 ---
 drivers/media/i2c/smiapp/smiapp-reg.h              |  116 -
 drivers/media/i2c/smiapp/smiapp-regs.c             |  261 --
 drivers/media/i2c/smiapp/smiapp-regs.h             |   36 -
 drivers/media/i2c/tvp5150.c                        |    7 +-
 drivers/media/pci/b2c2/flexcop-dma.c               |    6 +-
 drivers/media/pci/bt8xx/bt878.c                    |   16 +-
 drivers/media/pci/bt8xx/btcx-risc.c                |    5 +-
 drivers/media/pci/bt8xx/bttv-cards.c               |    6 +-
 drivers/media/pci/bt8xx/bttv-driver.c              |   78 +-
 drivers/media/pci/bt8xx/bttv-risc.c                |    1 -
 drivers/media/pci/cx23885/cx23885-core.c           |    5 +-
 drivers/media/pci/cx25821/cx25821-core.c           |    1 -
 drivers/media/pci/cx88/cx88-mpeg.c                 |    3 +-
 drivers/media/pci/dm1105/dm1105.c                  |   14 +-
 drivers/media/pci/intel/ipu3/ipu3-cio2.c           |  119 +-
 drivers/media/pci/intel/ipu3/ipu3-cio2.h           |  157 +-
 drivers/media/pci/mantis/hopper_vp3028.c           |    2 +-
 drivers/media/pci/saa7134/saa7134-video.c          |   30 +-
 drivers/media/pci/saa7146/mxb.c                    |   19 +-
 drivers/media/pci/saa7164/saa7164-core.c           |   17 +-
 drivers/media/pci/solo6x10/solo6x10-g723.c         |   13 +-
 drivers/media/pci/solo6x10/solo6x10-p2m.c          |   10 +-
 drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c     |   35 +-
 drivers/media/pci/ttpci/av7110.c                   |   13 +-
 drivers/media/platform/Kconfig                     |   33 +-
 drivers/media/platform/Makefile                    |    3 +
 drivers/media/platform/coda/coda-bit.c             |   73 +-
 drivers/media/platform/coda/coda-common.c          |   62 +-
 drivers/media/platform/coda/coda.h                 |   11 +
 drivers/media/platform/davinci/isif.c              |   11 +-
 drivers/media/platform/exynos4-is/fimc-capture.c   |    6 +-
 drivers/media/platform/exynos4-is/fimc-core.c      |   34 +-
 drivers/media/platform/exynos4-is/fimc-core.h      |   18 +-
 drivers/media/platform/exynos4-is/fimc-is.c        |   20 +-
 drivers/media/platform/exynos4-is/fimc-is.h        |    6 +-
 drivers/media/platform/exynos4-is/fimc-lite-reg.c  |    4 +-
 drivers/media/platform/exynos4-is/fimc-lite.c      |    2 +-
 drivers/media/platform/exynos4-is/fimc-lite.h      |    4 +-
 drivers/media/platform/exynos4-is/fimc-m2m.c       |    8 +-
 drivers/media/platform/exynos4-is/fimc-reg.c       |   18 +-
 drivers/media/platform/exynos4-is/fimc-reg.h       |    4 +-
 drivers/media/platform/fsl-viu.c                   |  121 +-
 drivers/media/platform/marvell-ccic/mmp-driver.c   |    6 +-
 drivers/media/platform/meson/ge2d/Makefile         |    3 +
 drivers/media/platform/meson/ge2d/ge2d-regs.h      |  360 ++
 drivers/media/platform/meson/ge2d/ge2d.c           | 1067 ++++++
 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c    |    9 +
 .../media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c |    9 +-
 .../media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c  |   19 +-
 .../media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c |    9 +-
 .../media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c  |   28 +-
 drivers/media/platform/mtk-vpu/mtk_vpu.c           |  101 +-
 drivers/media/platform/omap3isp/ispccdc.c          |    5 +-
 drivers/media/platform/pxa_camera.c                |    4 +-
 drivers/media/platform/qcom/camss/camss-csid.c     |    9 +-
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     |    7 +-
 drivers/media/platform/qcom/camss/camss-csiphy.c   |   25 +-
 drivers/media/platform/qcom/camss/camss-csiphy.h   |    1 +
 drivers/media/platform/qcom/camss/camss-ispif.c    |  100 +-
 drivers/media/platform/qcom/camss/camss-ispif.h    |    2 +-
 drivers/media/platform/qcom/camss/camss-vfe-4-7.c  |  131 +-
 drivers/media/platform/qcom/camss/camss-vfe.c      |   19 +-
 drivers/media/platform/qcom/camss/camss-vfe.h      |    1 +
 drivers/media/platform/qcom/camss/camss-video.c    |   90 +-
 drivers/media/platform/qcom/camss/camss.c          |  206 +-
 drivers/media/platform/qcom/camss/camss.h          |    1 +
 drivers/media/platform/qcom/venus/core.c           |   41 +-
 drivers/media/platform/qcom/venus/core.h           |    1 +
 drivers/media/platform/qcom/venus/firmware.c       |   17 +-
 drivers/media/platform/qcom/venus/hfi.c            |   12 +
 drivers/media/platform/qcom/venus/pm_helpers.c     |   12 +-
 drivers/media/platform/qcom/venus/vdec.c           |   32 +-
 drivers/media/platform/qcom/venus/venc.c           |    2 +-
 drivers/media/platform/rcar-vin/rcar-core.c        |  221 +-
 drivers/media/platform/rcar-vin/rcar-csi2.c        |   18 +-
 drivers/media/platform/rcar-vin/rcar-dma.c         |  171 +-
 drivers/media/platform/rcar-vin/rcar-v4l2.c        |   12 +-
 drivers/media/platform/rcar-vin/rcar-vin.h         |   23 +-
 .../platform/rockchip}/rkisp1/Makefile             |    0
 .../platform/rockchip}/rkisp1/rkisp1-capture.c     |  252 +-
 .../platform/rockchip}/rkisp1/rkisp1-common.c      |    0
 .../platform/rockchip}/rkisp1/rkisp1-common.h      |   16 +-
 .../platform/rockchip}/rkisp1/rkisp1-dev.c         |   15 +-
 .../platform/rockchip}/rkisp1/rkisp1-isp.c         |    9 +-
 .../platform/rockchip}/rkisp1/rkisp1-params.c      |  177 +-
 .../platform/rockchip}/rkisp1/rkisp1-regs.h        |    4 +-
 .../platform/rockchip}/rkisp1/rkisp1-resizer.c     |   10 +-
 .../platform/rockchip}/rkisp1/rkisp1-stats.c       |   21 -
 drivers/media/platform/s3c-camif/camif-core.c      |    6 +-
 drivers/media/platform/s5p-jpeg/jpeg-core.c        |    2 +
 drivers/media/platform/s5p-mfc/s5p_mfc_dec.c       |    2 +-
 drivers/media/platform/s5p-mfc/s5p_mfc_enc.c       |    2 +-
 .../media/platform/sti/c8sectpfe/c8sectpfe-core.c  |   23 +-
 drivers/media/platform/stm32/stm32-dcmi.c          |   63 +-
 .../media/platform/sunxi/sun4i-csi/sun4i_v4l2.c    |    2 +-
 drivers/media/radio/radio-sf16fmr2.c               |    2 +-
 drivers/media/radio/si4713/si4713.c                |    2 +-
 drivers/media/rc/keymaps/Makefile                  |    2 +
 drivers/media/rc/keymaps/rc-khamsin.c              |   75 +
 drivers/media/rc/keymaps/rc-pine64.c               |   65 +
 drivers/media/rc/lirc_dev.c                        |    3 +-
 drivers/media/rc/sunxi-cir.c                       |   50 +-
 drivers/media/test-drivers/vicodec/codec-fwht.c    |   13 +-
 drivers/media/test-drivers/vicodec/codec-fwht.h    |   32 -
 .../media/test-drivers/vicodec/codec-v4l2-fwht.c   |   88 +-
 drivers/media/test-drivers/vicodec/vicodec-core.c  |   46 +-
 drivers/media/test-drivers/vim2m.c                 |   20 +-
 drivers/media/test-drivers/vivid/vivid-core.c      |   66 +-
 drivers/media/test-drivers/vivid/vivid-core.h      |    1 +
 drivers/media/test-drivers/vivid/vivid-ctrls.c     |   29 +-
 .../media/test-drivers/vivid/vivid-kthread-cap.c   |    6 +-
 .../media/test-drivers/vivid/vivid-kthread-out.c   |    6 +-
 .../media/test-drivers/vivid/vivid-kthread-touch.c |    6 +-
 drivers/media/test-drivers/vivid/vivid-sdr-cap.c   |    6 +-
 drivers/media/test-drivers/vivid/vivid-vid-cap.c   |   18 +-
 drivers/media/test-drivers/vivid/vivid-vid-out.c   |   18 +-
 drivers/media/tuners/mt2060.c                      |    2 +-
 drivers/media/tuners/mt2063.c                      |    1 -
 drivers/media/tuners/mxl5005s.c                    |   20 +-
 drivers/media/usb/au0828/au0828-video.c            |    7 +-
 drivers/media/usb/cx231xx/cx231xx-audio.c          |    2 +-
 drivers/media/usb/cx231xx/cx231xx-core.c           |   10 +-
 drivers/media/usb/cx231xx/cx231xx-vbi.c            |    5 +-
 drivers/media/usb/dvb-usb-v2/dvbsky.c              |   22 +-
 drivers/media/usb/dvb-usb-v2/rtl28xxu.c            |    4 +-
 drivers/media/usb/dvb-usb-v2/zd1301.c              |    2 +-
 drivers/media/usb/dvb-usb/dib0700_devices.c        |    4 +-
 drivers/media/usb/dvb-usb/dw2102.c                 |    8 +-
 drivers/media/usb/dvb-usb/gp8psk.c                 |    2 +-
 drivers/media/usb/em28xx/em28xx-audio.c            |   14 +-
 drivers/media/usb/gspca/gspca.c                    |    1 +
 drivers/media/usb/gspca/ov534.c                    |   12 +-
 drivers/media/usb/msi2500/msi2500.c                |    4 +-
 drivers/media/usb/pvrusb2/pvrusb2-devattr.c        |    2 +-
 drivers/media/usb/tm6000/tm6000-video.c            |    7 +-
 drivers/media/usb/uvc/uvc_ctrl.c                   |    4 +-
 drivers/media/usb/zr364xx/zr364xx.c                |   33 +-
 drivers/media/v4l2-core/v4l2-common.c              |   33 +
 drivers/media/v4l2-core/v4l2-compat-ioctl32.c      | 1793 ++++------
 drivers/media/v4l2-core/v4l2-ctrls.c               |  235 +-
 drivers/media/v4l2-core/v4l2-device.c              |    3 +-
 drivers/media/v4l2-core/v4l2-fwnode.c              |   32 +-
 drivers/media/v4l2-core/v4l2-ioctl.c               |  184 +-
 drivers/media/v4l2-core/v4l2-subdev.c              |   48 +-
 drivers/staging/media/Kconfig                      |    2 -
 drivers/staging/media/Makefile                     |    1 -
 drivers/staging/media/hantro/hantro_drv.c          |   26 +-
 drivers/staging/media/hantro/hantro_h264.c         |    8 +-
 drivers/staging/media/hantro/hantro_hw.h           |    4 +-
 drivers/staging/media/hantro/hantro_vp8.c          |    4 +-
 drivers/staging/media/imx/imx-media-csi.c          |   10 +-
 drivers/staging/media/imx/imx-media.h              |    2 +-
 drivers/staging/media/ipu3/include/intel-ipu3.h    |    8 +-
 drivers/staging/media/meson/vdec/vdec.c            |    2 +-
 drivers/staging/media/rkisp1/Kconfig               |   19 -
 drivers/staging/media/rkisp1/TODO                  |   13 -
 drivers/staging/media/rkvdec/rkvdec-h264.c         |    8 +-
 drivers/staging/media/rkvdec/rkvdec.c              |   43 +-
 drivers/staging/media/sunxi/cedrus/Makefile        |    3 +-
 drivers/staging/media/sunxi/cedrus/cedrus.c        |  107 +-
 drivers/staging/media/sunxi/cedrus/cedrus.h        |   27 +
 drivers/staging/media/sunxi/cedrus/cedrus_dec.c    |   17 +-
 drivers/staging/media/sunxi/cedrus/cedrus_hw.c     |    2 +
 drivers/staging/media/sunxi/cedrus/cedrus_regs.h   |   80 +
 drivers/staging/media/sunxi/cedrus/cedrus_video.c  |   16 +-
 drivers/staging/media/sunxi/cedrus/cedrus_vp8.c    |  907 +++++
 drivers/staging/media/zoran/zoran_driver.c         |    2 +-
 include/linux/platform_data/media/coda.h           |   14 -
 include/media/dvbdev.h                             |    2 +-
 include/media/fwht-ctrls.h                         |   31 -
 include/media/h264-ctrls.h                         |  231 --
 include/media/hevc-ctrls.h                         |   10 +-
 include/media/mpeg2-ctrls.h                        |    4 +-
 include/media/rc-map.h                             |    2 +
 include/media/v4l2-async.h                         |    2 +-
 include/media/v4l2-common.h                        |   21 +
 include/media/v4l2-ctrls.h                         |    4 +-
 include/media/v4l2-dev.h                           |    4 +-
 include/media/v4l2-device.h                        |    2 +-
 include/media/v4l2-dv-timings.h                    |    2 +-
 include/media/v4l2-fwnode.h                        |  129 +-
 include/media/v4l2-h264.h                          |    2 +-
 include/media/v4l2-ioctl.h                         |   10 +
 include/media/v4l2-mediabus.h                      |    8 +-
 include/media/v4l2-subdev.h                        |    2 +-
 include/media/videobuf2-core.h                     |    2 +-
 include/media/vp8-ctrls.h                          |    8 +-
 include/uapi/linux/lirc.h                          |    4 +-
 include/uapi/linux/media-bus-format.h              |    8 +
 .../uapi =3D> include/uapi/linux}/rkisp1-config.h    |    6 +-
 include/uapi/linux/v4l2-controls.h                 |  873 +++--
 include/uapi/linux/videodev2.h                     |   41 +-
 408 files changed, 23940 insertions(+), 13923 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/amlogic,axg-ge2=
d.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/coda.txt
 create mode 100644 Documentation/devicetree/bindings/media/coda.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/adv7604.txt
 create mode 100644 Documentation/devicetree/bindings/media/i2c/adv7604.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/aptina,mt9v=
111.txt
 create mode 100644 Documentation/devicetree/bindings/media/i2c/aptina,mt9v=
111.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/mipi-ccs.ya=
ml
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/nokia,smia.=
txt
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/ov2680.txt
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/ov772x.txt
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov02a1=
0.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov2680=
.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov772x=
.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx214=
.txt
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx214=
.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/imx7-csi.txt
 delete mode 100644 Documentation/devicetree/bindings/media/imx7-mipi-csi2.=
txt
 create mode 100644 Documentation/devicetree/bindings/media/nxp,imx7-csi.ya=
ml
 create mode 100644 Documentation/devicetree/bindings/media/nxp,imx7-mipi-c=
si2.yaml
 rename {drivers/staging/media/rkisp1/Documentation =3D> Documentation}/dev=
icetree/bindings/media/rockchip-isp1.yaml (81%)
 create mode 100644 Documentation/driver-api/media/drivers/ccs/ccs-regs.asc
 create mode 100644 Documentation/driver-api/media/drivers/ccs/ccs.rst
 create mode 100755 Documentation/driver-api/media/drivers/ccs/mk-ccs-regs
 create mode 100644 Documentation/userspace-api/media/v4l/ext-ctrls-codec-s=
tateless.rst
 delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-grey.rst
 delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-nv12.rst
 delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-nv12m.rst
 delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-nv12mt.rst
 delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-nv16.rst
 delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-nv16m.rst
 delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-nv24.rst
 delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-uyvy.rst
 delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-vyuy.rst
 delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-y10.rst
 delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-y10b.rst
 delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-y10p.rst
 delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-y12.rst
 delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-y14.rst
 delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-y16-be.rst
 delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-y16.rst
 delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-y41p.rst
 create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.r=
st
 create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-yuv-planar=
.rst
 delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-yuv410.rst
 delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-yuv411p.rst
 delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-yuv420.rst
 delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-yuv420m.rst
 delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-yuv422m.rst
 delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-yuv422p.rst
 delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-yuv444m.rst
 delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-yuyv.rst
 delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-yvyu.rst
 create mode 100644 drivers/media/i2c/ccs-pll.c
 create mode 100644 drivers/media/i2c/ccs-pll.h
 create mode 100644 drivers/media/i2c/ccs/Kconfig
 create mode 100644 drivers/media/i2c/ccs/Makefile
 create mode 100644 drivers/media/i2c/ccs/ccs-core.c
 create mode 100644 drivers/media/i2c/ccs/ccs-data-defs.h
 create mode 100644 drivers/media/i2c/ccs/ccs-data.c
 create mode 100644 drivers/media/i2c/ccs/ccs-data.h
 create mode 100644 drivers/media/i2c/ccs/ccs-limits.c
 create mode 100644 drivers/media/i2c/ccs/ccs-limits.h
 rename drivers/media/i2c/{smiapp/smiapp-quirk.c =3D> ccs/ccs-quirk.c} (63%)
 rename drivers/media/i2c/{smiapp/smiapp-quirk.h =3D> ccs/ccs-quirk.h} (53%)
 create mode 100644 drivers/media/i2c/ccs/ccs-reg-access.c
 create mode 100644 drivers/media/i2c/ccs/ccs-reg-access.h
 create mode 100644 drivers/media/i2c/ccs/ccs-regs.h
 rename drivers/media/i2c/{smiapp/smiapp.h =3D> ccs/ccs.h} (52%)
 create mode 100644 drivers/media/i2c/ccs/smiapp-reg-defs.h
 create mode 100644 drivers/media/i2c/ov02a10.c
 create mode 100644 drivers/media/i2c/ov9734.c
 delete mode 100644 drivers/media/i2c/smiapp-pll.c
 delete mode 100644 drivers/media/i2c/smiapp-pll.h
 delete mode 100644 drivers/media/i2c/smiapp/Kconfig
 delete mode 100644 drivers/media/i2c/smiapp/Makefile
 delete mode 100644 drivers/media/i2c/smiapp/smiapp-core.c
 delete mode 100644 drivers/media/i2c/smiapp/smiapp-limits.c
 delete mode 100644 drivers/media/i2c/smiapp/smiapp-limits.h
 delete mode 100644 drivers/media/i2c/smiapp/smiapp-reg-defs.h
 delete mode 100644 drivers/media/i2c/smiapp/smiapp-reg.h
 delete mode 100644 drivers/media/i2c/smiapp/smiapp-regs.c
 delete mode 100644 drivers/media/i2c/smiapp/smiapp-regs.h
 create mode 100644 drivers/media/platform/meson/ge2d/Makefile
 create mode 100644 drivers/media/platform/meson/ge2d/ge2d-regs.h
 create mode 100644 drivers/media/platform/meson/ge2d/ge2d.c
 rename drivers/{staging/media =3D> media/platform/rockchip}/rkisp1/Makefil=
e (100%)
 rename drivers/{staging/media =3D> media/platform/rockchip}/rkisp1/rkisp1-=
capture.c (93%)
 rename drivers/{staging/media =3D> media/platform/rockchip}/rkisp1/rkisp1-=
common.c (100%)
 rename drivers/{staging/media =3D> media/platform/rockchip}/rkisp1/rkisp1-=
common.h (97%)
 rename drivers/{staging/media =3D> media/platform/rockchip}/rkisp1/rkisp1-=
dev.c (98%)
 rename drivers/{staging/media =3D> media/platform/rockchip}/rkisp1/rkisp1-=
isp.c (99%)
 rename drivers/{staging/media =3D> media/platform/rockchip}/rkisp1/rkisp1-=
params.c (92%)
 rename drivers/{staging/media =3D> media/platform/rockchip}/rkisp1/rkisp1-=
regs.h (99%)
 rename drivers/{staging/media =3D> media/platform/rockchip}/rkisp1/rkisp1-=
resizer.c (99%)
 rename drivers/{staging/media =3D> media/platform/rockchip}/rkisp1/rkisp1-=
stats.c (96%)
 create mode 100644 drivers/media/rc/keymaps/rc-khamsin.c
 create mode 100644 drivers/media/rc/keymaps/rc-pine64.c
 delete mode 100644 drivers/staging/media/rkisp1/Kconfig
 delete mode 100644 drivers/staging/media/rkisp1/TODO
 create mode 100644 drivers/staging/media/sunxi/cedrus/cedrus_vp8.c
 delete mode 100644 include/linux/platform_data/media/coda.h
 delete mode 100644 include/media/fwht-ctrls.h
 delete mode 100644 include/media/h264-ctrls.h
 rename {drivers/staging/media/rkisp1/uapi =3D> include/uapi/linux}/rkisp1-=
config.h (98%)

