Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7906E634D1
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2019 13:17:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726483AbfGILRn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Jul 2019 07:17:43 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:49600 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725947AbfGILRm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 9 Jul 2019 07:17:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=lCP87DTRfyDA3afGMeQwuJvgFbnAey8P2uQkgiaKiAw=; b=BQFx4ouOgBEdnNi8pQTIRWWZl
        J8z1JJwSPWfbKr1YuGNJ+fvPdwZdxOXStyZnPwuPqwkBlrtHVorLgW6TCDmlBkGb6el/m3hBDLbIC
        eiyTtAssaRdRFP6Lc8UbCpSSbGLRITp53fHCfFOENDeM23jZh2p3eTorGagFwOQfrJAZC69H9/B8y
        GvzLx3vLVeqWpKLelq+IfpVNTI48k80oW6517tsAQ1jwQBl8DgHH5mn83CwgJ0zQyHSz2+Cer0EyO
        nV95SzgOhpZBIXyb8tRqrmBIX+Ew+oPYqWs1PmwSDk/cqn3GIsFIzZDXUPW+uPIceqlr/BNvtNXIc
        ZKebOTiLQ==;
Received: from 177.43.30.58.dynamic.adsl.gvt.net.br ([177.43.30.58] helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hko7v-00086i-LB; Tue, 09 Jul 2019 11:17:40 +0000
Date:   Tue, 9 Jul 2019 08:17:35 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL for v5.3-rc1] media updates
Message-ID: <20190709081735.3d642186@coco.lan>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
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
dia/v5.3-1

For:
  - new Atmel microship ISC driver;
  - coda has gained support for mpeg2 and mpeg4;
  - cxusb gained support for analog TV;
  - rockchip staging driver was split into two separate staging drivers;
  - added a new staging driver for Allegro DVT video IP core;
  - added a new staging driver for Amlogic Meson video decoder;
  - lots of improvements and cleanups.

Regards,
Mauro

PS.: You'll get some trivial merge conflicts due to SPDX changes, between
those two patches, due to SPDX changes and different conventions for GPLv2
at SPDX spec:

	77512baaea9a ("treewide: Replace GPLv2 boilerplate/reference with SPDX - r=
ule 237")
	513dbd35b5d9 ("media: add SPDX headers to some files")

one adds the SPDX tag from the time Documentation/process/license-rules.rst
was written - "GPL-2.0" (with is now deprecated[1]) - while other adds the=
=20
current SPDX tag ("GPL-2.0-only"[2]).

=46rom my side, I don't have any preference. Feel free to solve it the way
you prefer.

[1] https://spdx.org/licenses/GPL-2.0.html
[2] https://spdx.org/licenses/GPL-2.0-only.html

The following changes since commit 9e0babf2c06c73cda2c0cd37a1653d823adb40ec:

  Linux 5.2-rc5 (2019-06-16 08:49:45 -1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/me=
dia/v5.3-1

for you to fetch changes up to f81cbfc4f82a75ca0a2dc181a9c93b88f0e6509d:

  media: allegro: use new v4l2_m2m_ioctl_try_encoder_cmd funcs (2019-06-27 =
07:36:06 -0400)

----------------------------------------------------------------
media updates for v5.3-rc1

----------------------------------------------------------------
A Sun (1):
      media: mceusb: disable "nonsensical irdata" messages

Akinobu Mita (6):
      media: ov7740: fix unbalanced pm_runtime_get/put
      media: ov7740: avoid invalid framesize setting
      media: ov7740: fix vertical flip control
      media: ov7740: remove redundant V4L2_CTRL_FLAG_VOLATILE set
      media: vivid: remove unnecessary min and max timeperframe constants
      media: video-i2c: use V4L2_FRACT_COMPARE

Alexandre Courbot (5):
      media: venus: core: fix max load for msm8996 and sdm845
      media: mtk-vcodec: replace GPLv2 with SPDX
      media: mtk-vcodec: constify formats
      media: mtk-vcodec: avoid unneeded pointer-to-long conversions
      media: mtk-vcodec: remove unneeded proxy functions

Aliasgar Surti (1):
      media: staging: media: fix style problem

Anders Roxell (3):
      media: drivers: media: i2c: don't enable if CONFIG_DRM_I2C_ADV7511=3Dn
      media: drivers: media: coda: fix warning same module names
      media: i2c: fix warning same module names

Andrew F. Davis (1):
      media: videobuf-dma-contig: Use size of buffer in mmap not vma size

Andrey Konovalov (1):
      media: pvrusb2: use a different format for warnings

Andr=C3=A9 Almeida (6):
      media: vimc: Remove or modify stream checks
      media: vimc: debayer: Fix typos
      media: vimc: Makefile: file cleanup
      media: vimc: stream: add missing function documentation
      media: docs: create vimc documentation
      media: vimc: cap: check v4l2_fill_pixfmt return value

Arnd Bergmann (1):
      media: dvb_frontend: split dvb_frontend_handle_ioctl function

Arushi Singhal (1):
      media: staging: media: davinci_vpfe: Replace a bit shift

Arvind Yadav (1):
      media: omap3isp: constify platform_device_id

Bartlomiej Zolnierkiewicz (1):
      media: remove redundant 'default n' from Kconfig-s

Bastien Nocera (2):
      media: rc: Prefer KEY_NUMERIC_* for number buttons on remotes
      media: doc-rst: Fix typos

Bingbu Cao (1):
      media: staging/intel-ipu3: update minimal GDC envelope size to 4

Boris Brezillon (13):
      media: rockchip/vpu: Remove a useless test
      media: v4l2: Initialize mpeg slice controls
      media: v4l2-common: Fix v4l2_fill_pixfmt[_mp]() prototypes
      media: v4l2-common: Add an helper to apply frmsize constraints
      media: rockchip/vpu: Use v4l2_apply_frmsize_constraints() where appro=
priate
      media: rockchip/vpu: Rename rockchip_vpu_common.h into rockchip_vpu_v=
4l2.h
      media: rockchip/vpu: Move encoder logic to a common place
      media: rockchip/vpu: Provide a helper to reset both src and dst forma=
ts
      media: rockchip/vpu: Prepare things to support decoders
      media: v4l2: Make sure all drivers set _MPLANE caps in vdev->device_c=
aps
      media: v4l2: Get rid of ->vidioc_enum_fmt_vid_{cap, out}_mplane
      media: v4l2: Fix the _MPLANE format check in v4l_enum_fmt()
      media: v4l2: Test type instead of cfg->type in v4l2_ctrl_new_custom()

Brad Love (6):
      media: si2168: add frequency data to frontend info
      media: si2157: add detection of si2177 tuner
      media: pvrusb2: Add multiple dvb frontend support
      media: pvrusb2: Add i2c client demod/tuner support
      media: pvrusb2: Add Hauppauge HVR1955/1975 devices
      media: cx231xx-cards: Add Hauppauge 955Q variant

Chen-Yu Tsai (2):
      media: dt-bindings: media: sun6i-csi: Add compatible string for A83T =
variant
      media: sun6i: Support A83T variant

Christophe JAILLET (1):
      media: Staging: media: Release the correct resource in an error handl=
ing path

Colin Ian King (5):
      media: cx23885: remove redundant assignment to err
      media: vivid: fix incorrect assignment operation when setting video m=
ode
      media: stv090x: fix double free on state object
      media: staging: davinci: fix memory leaks and check for allocation fa=
ilure
      media: staging: media: meson: remove redundant initialization of mpeg=
12

Dan Carpenter (2):
      media: staging/imx: fix two NULL vs IS_ERR() bugs
      media: hantro: remove an unnecessary NULL check

Daniel Gomez (1):
      media: spi: IR LED: add missing of table registration

Dariusz Marcinkiewicz (1):
      media: cec: add struct cec_connector_info support

Ding Xiang (1):
      media: rc: remove redundant dev_err message

Diwakar Sharma (1):
      media: staging: media: davinci_vpfe: use __func__ for function names

Dmitry Osipenko (4):
      media: staging: media: tegra-vde: Remove BIT() macro from UAPI header
      media: staging: media: tegra-vde: Manually pack UAPI structures
      media: staging: media: tegra-vde: Add IOMMU support
      media: staging: media: tegra-vde: Defer dmabuf's unmapping

Eugen Hristev (7):
      media: atmel: atmel-isc: reworked white balance feature
      media: v4l2-ctrl: fix flags for DO_WHITE_BALANCE
      media: atmel: atmel-isc: add support for DO_WHITE_BALANCE
      media: atmel: atmel-isc: make try_fmt error less verbose
      media: atmel: atmel-isc: split driver into driver base and isc
      media: atmel: atmel-isc: fix and cleanup potential bugs
      media: atmel: atmel-isc: fix i386 build error

Ezequiel Garcia (19):
      media: rockchip/vpu: Use pixel format helpers
      media: rockchip/vpu: Use v4l2_m2m_buf_copy_metadata
      media: rockchip/vpu: Cleanup macroblock alignment
      media: rockchip/vpu: Cleanup JPEG bounce buffer management
      media: coda: Print a nicer device registered message
      media: coda: Remove unbalanced and unneeded mutex unlock
      media: coda: Replace the threaded interrupt with a hard interrupt
      media: coda: Clear the interrupt reason
      media: rockchip/vpu: Open-code media controller register
      media: rockchip/vpu: Support the Request API
      media: rockchip/vpu: Add decoder boilerplate
      media: rockchip/vpu: Add support for non-standard controls
      media: v4l2-ctrl: Initialize _BUTTON and _CTRL_CLASS
      media: vb2: Introduce a vb2_get_buffer accessor
      media: mtk-jpeg: Use vb2_get_buffer
      media: mtk-vcodec: Use vb2_get_buffer
      media: sti: Use vb2_get_buffer
      media: hantro: Use vb2_get_buffer
      media: v4l2-ctrl: Move compound control initialization

Fabien Dessenne (1):
      media: stm32-dcmi: fix irq =3D 0 case

Fabio Estevam (16):
      media: imx7-media-csi: Acquire a single clock
      media: imx7-media-csi: Use devm_platform_ioremap_resource()
      media: imx7-media-csi: Propagate the correct error for platform_get_i=
rq()
      media: imx7-media-csi: Propagate the correct error for devm_request_i=
rq()
      media: imx7-media-csi: Remove unneeded break
      media: imx7-media-csi: Check the return value from clk_prepare_enable=
()
      media: imx7-media-csi: Change imx7_csi_enable() to void
      media: imx7-mipi-csis: Propagate the error if clock enabling fails
      media: imx7-mipi-csis: Remove unneeded 'ret' initialization
      media: imx7-mipi-csis: Remove extra blank line
      media: imx7-media-csi: Use functions instead of macros
      media: imx7-media-csi: Use u32 for storing register reads
      media: imx7-media-csi: Remove unneeded error message
      media: Revert "media: staging/imx: Allow driver to build if COMPILE_T=
EST is enabled"
      media: dt-bindings: imx7-csi: Document a single CSI clock
      media: coda: Use devm_platform_ioremap_resource()

Hans Verkuil (45):
      media: cec: mark devnode as registered before actually registering it
      media: cec-gpio: use disable/enable_irq
      media: cec: cec_transmit_msg_fh: do sanity checks first
      media: cec: move check from cec_transmit to cec_transmit_msg_fh
      media: cec: add CEC_MSG_FL_RAW flag and msg_is_raw helper function
      media: cec-ioc-receive.rst: document CEC_MSG_FL_RAW
      media: cec: support CEC_MSG_FL_RAW
      media: cec: allow any initiator for Ping and Image/Text View On
      media: cec-ioc-g-mode.rst: be more specific when EPERM is returned
      media: coda/venus/s5p_mfc: fix control typo
      media: move drivers/media/media-* to drivers/media/mc/mc-*
      media: vicodec: correctly support unbinding of the driver
      media: v4l2-pci-skeleton.c: fix doc warning
      media: videobuf2-v4l2: set last_buffer_dequeued in dqbuf
      media: videobuf2-vmalloc: get_userptr: buffers are always writable
      media: allegro-dvt: fix build failure
      media: media-ioc-enum-links.rst: fix incorrect reserved field documen=
tation
      media: mc-device.c: don't memset __user pointer contents
      media: cec-adap: fix regression in ping sanity check
      media: dvb-usb/cxusb-analog.c: fix coccinelle warning, use ktime.h
      media: media/radio: set device_caps in struct video_device
      media: media/usb: set device_caps in struct video_device
      media: rtl2832_sdr: set device_caps in struct video_device
      media: usb/gadget/f_uvc: set device_caps in struct video_device
      media: vc04_services/bcm2835-camera: set device_caps in struct video_=
device
      media: staging/media: set device_caps in struct video_device
      media: v4l2-mem2mem: add try_en/decoder_cmd ioctl helpers
      media: vicodec: use new v4l2_m2m_ioctl_try_en/decoder_cmd funcs
      media: cxusb: Revert "media: cxusb: add raw mode support for, Medion =
MD95700"
      media: Documentation: update email address
      media: MAINTAINERS: update email address
      media: vicodec: move v4l2_ctrl_request_complete after spin_unlock
      media: vicodec: always return a valid format.
      media: vicodec: fix initial stateless sizeimage value
      media: vicodec: pass on enc output format to capture side
      media: vicodec: add V4L2_CID_MIN_BUFFERS_FOR_OUTPUT
      media: vicodec: set KEY/PFRAME flag when decoding
      media: vicodec: use correct sizeimage value when draining
      media: vicodec: stateless codecs do not have EOS and SOURCE_CHANGE ev=
ents
      media: vicodec: improve handling of ENC_CMD_STOP/START
      media: touchscreen/sur40: set device_caps in struct video_device
      media: media/pci: set device_caps in struct video_device
      media: hdpvr: fix locking and a missing msleep
      media: cec-notifier: rename variables, check kstrdup and n->conn_name
      media: cec-notifier: add new notifier functions

Hariprasad Kelam (1):
      media: staging: media: imx: fix Unneeded variable: "ret". Return "0"

Helen Koike (1):
      media: vimc: fix component match compare

Hugues Fruchet (4):
      media: st-mipid02: add support of V4L2_CID_LINK_FREQ
      media: st-mipid02: add support of RGB565
      media: st-mipid02: add support of YUYV8 and UYVY8
      media: st-mipid02: add support of JPEG

Jae Hyun Yoo (10):
      media: aspeed: fix a kernel warning on clk control
      media: aspeed: refine clock control logic
      media: aspeed: change irq to threaded irq
      media: aspeed: remove IRQF_SHARED flag
      media: aspeed: reduce noisy log printing outs
      media: aspeed: remove checking of VE_INTERRUPT_CAPTURE_COMPLETE
      media: aspeed: refine interrupt handling logic
      media: aspeed: remove source buffer allocation before mode detection
      media: aspeed: use different delays for triggering VE H/W reset
      media: aspeed: add a workaround to fix a silicon bug

Janusz Krzysztofik (4):
      media: ov6650: Fix device node exposed without proper locking
      media: v4l2-subdev: Verify arguments in v4l2_subdev_call()
      media: v4l2-subdev: Verify v4l2_subdev_call() pointer arguments
      media: v4l2-subdev: Verify v4l2_subdev_call() pad config argument

Javier Martinez Canillas (1):
      media: staging/imx: Allow driver to build if COMPILE_TEST is enabled

Jernej Skrabec (1):
      media: cedrus: Allow different mod clock rates

Johan Korsnes (9):
      media: vivid: make input dv_timings per-input
      media: vivid: make input std_signal per-input
      media: vivid: add display present control
      media: vivid: add number of HDMI ports to device state
      media: vivid: add HDMI (dis)connect TX emulation
      media: vivid: add HDMI (dis)connect RX emulation
      media: vivid: reorder CEC allocation and control set-up
      media: vivid: add CEC support to display present ctrl
      media: vivid.rst: describe display present control

Jonas Karlman (3):
      media: rockchip/vpu: Add infra to support MPEG-2 decoding
      media: rockchip/vpu: Add MPEG2 decoding support to RK3399
      media: rockchip/vpu: Add support for MPEG-2 decoding on RK3288

Jungo Lin (1):
      media: media_device_enum_links32: clean a reserved field

Kangjie Lu (1):
      media: vpss: fix a potential NULL pointer dereference

Kefeng Wang (4):
      media: vim2m: fix two double-free issues
      media: saa7164: fix remove_proc_entry warning
      media: wl128x: Fix some error handling in fm_v4l2_init_video_device()
      media: pvrusb2: fix null-ptr-deref in class_unregister()

Kelvin Lawson (1):
      media: venus: Add support for H265 controls

Kieran Bingham (1):
      media: fdp1: Support M3N and E3 platforms

Krzysztof Kozlowski (1):
      media: exynos4-is: Add missing of_node_put to fix reference leaks

Lubomir Rintel (12):
      media: dt-bindings: marvell,mmp2-ccic: Add Marvell MMP2 camera
      media: marvell-ccic: fix DMA s/g desc number calculation
      media: marvell-ccic: don't generate EOF on parallel bus
      media: Revert "[media] marvell-ccic: reset ccic phy when stop streami=
ng for stability"
      media: marvell-ccic: drop unused stuff
      media: marvell-ccic/mmp: enable clock before accessing registers
      media: marvell-ccic: rename the clocks
      media: marvell-ccic/mmp: add devicetree support
      media: marvell-ccic: use async notifier to get the sensor
      media: marvell-ccic: provide a clock for the sensor
      media: marvell-ccic: only calculate the DPHY registers when needed
      media: marvell-ccic: mmp: don't chicken out w/o pdata

Luca Ceresoli (9):
      media: docs: v4l2-controls: remove repeated ioctl names
      media: docs: v4l2-controls: fix indentation
      media: docs: v4l2-controls: add links to structs
      media: docs: v4l2-controls: rearrange control initialization sequence
      media: docs: v4l2-controls: add links to functions
      media: docs: v4l2-controls: convert code blocks to C
      media: docs: v4l2-controls: document file to include
      media: docs: v4l2-controls: remove outdated paragraph
      media: docs: v4l2-controls: fix sentence rendered in a nonsense way

Luke Nowakowski-Krijger (1):
      media: radio-raremono: change devm_k*alloc to k*alloc

Maciej S. Szmigiero (8):
      media: cx25840: don't open-code cx25840_reset() inside cx25840_load_f=
w()
      media: cx25840: g_std operation really implements querystd operation
      media: cx25840: implement g_std operation
      media: cx25840: add pin to pad mapping and output format configuration
      media: cx25840: set_fmt operation should clamp out-of-range picture s=
izes
      media: cxusb: implement Medion MD95700 digital / analog coexistence
      media: cxusb: add analog mode support for Medion MD95700
      media: cxusb: add raw mode support for Medion MD95700

Marc Gonzalez (1):
      media: docs: fix minor typos

Marco Felsch (2):
      media: coda: fix last buffer handling in V4L2_ENC_CMD_STOP
      media: coda: fix V4L2_DEC_CMD_STOP when all buffers are already consu=
med

Marek Szyprowski (2):
      media: s5p-mfc: fix reading min scratch buffer size on MFC v6/v7
      media: s5p-mfc: Make additional clocks optional

Masahiro Yamada (2):
      media: coda: remove -I$(src) header search path
      media: do not use C++ style comments in uapi headers

Masanari Iida (1):
      media: imx214: Fix typo in module description of imx214

Mauro Carvalho Chehab (12):
      media: rc-main: clean-up two warnings
      Merge tag 'v5.2-rc2' into patchwork
      media: staging: allegro: cleanup two warnings
      media: cxusb-analog: Fix some coding style issues
      media: cxusb: fix several coding style issues
      media: cx25840: Address several coding style issues
      media: dvb: tag deprecated DVB APIs as such
      Merge tag 'v5.2-rc4' into media/master
      media: add SPDX headers to some files
      Merge tag 'v5.2-rc5' into patchwork
      media: cafe-driver: mark an static var as such
      media: stv0297: fix frequency range limit

Maxime Jourdan (4):
      media: dt-bindings: media: add Amlogic Video Decoder Bindings
      media: meson: add v4l2 m2m video decoder driver
      media: MAINTAINERS: Add meson video decoder
      media: MAINTAINERS: fix linux-media mailing list for meson drivers

Maxime Ripard (4):
      media: pixfmt: Add H264 Slice format
      media: pixfmt: Add H264_SLICE_RAW format documentation
      media: cedrus: Add H264 decoding support
      media: dt-bindings: Fix vendor-prefixes YAML

Michael Tretter (6):
      media: dt-bindings: media: document allegro-dvt bindings
      media: dt-bindings: media: Add vendor prefix for allegro
      media: allegro: add Allegro DVT video IP core driver
      media: allegro: add SPS/PPS nal unit writer
      media: coda: implement CMD_START to restart decoding
      media: allegro: use new v4l2_m2m_ioctl_try_encoder_cmd funcs

Mukesh Ojha (1):
      media: vpss: fix the order of resource clean up

Neil Armstrong (3):
      media: rc: meson-ir: update with SPDX Licence identifier
      media: platform: ao-cec-g12a: disable regmap fast_io for cec bus regm=
ap
      media: platform: ao-cec-g12a: remove spin_lock_irqsave() locking in m=
eson_ao_cec_g12a_read/write

Nicholas Mc Guire (1):
      media: smiapp: core: add small range to usleep_range

Niklas S=C3=B6derlund (10):
      media: rcar-csi2: Fix coccinelle warning for PTR_ERR_OR_ZERO()
      media: vimc: Remove unneeded return statement in vimc_sen_s_stream()
      media: rcar-vin: Do not call pm_runtime_{resume,suspend}()
      media: rcar-vin: Remove unneeded calls to pm_runtime_{enable, disable}
      media: rcar-vin: Allow interrupting lock when trying to open the vide=
o device
      media: rcar-vin: Do not sync subdevice format when opening the video =
device
      media: rcar-vin: Move pm_runtime_{get,put} out of helpers
      media: rcar-vin: Merge helpers dealing with powering the parallel sub=
device
      media: rcar-vin: Fold rvin_initialize_device() into rvin_open()
      media: rcar-vin: Merge Gen2 and Gen3 file operations

Oliver Neukum (4):
      media: dvb: usb: fix use after free in dvb_usb_device_exit
      media: cpia2_usb: first wake up, then free in disconnect
      media: pwc: convert to BIT macro
      media: uvcvideo: Fix access to uninitialized fields on probe error

Pawel Osciak (1):
      media: uapi: Add H264 low-level decoder API compound controls.

Philipp Zabel (44):
      media: coda: move register debugging to coda_debug level 3
      media: coda: move job ready message to coda_debug level 2
      media: coda: add coda_frame_type_char helper
      media: coda: improve decoder job finished debug message
      media: coda: demote s_ctrl debug messages to level 2
      media: coda: add menu strings to s_ctrl debug output
      media: coda: update profile and level controls after sequence initial=
ization
      media: coda: add decoder MPEG-4 profile and level controls
      media: v4l2-ctrl: add MPEG-2 profile and level controls
      media: coda: add decoder MPEG-2 profile and level controls
      media: coda: add lockdep asserts
      media: coda: use v4l2_m2m_buf_copy_metadata
      media: rockchip/vpu: rename from rockchip to hantro
      media: hantro: print video device name in addition to device node
      media: hantro: add PM runtime resume callback
      media: hantro: make irq names configurable
      media: hantro: add support for named register ranges
      media: hantro: add support for separate control block
      media: hantro: allow arbitrary number of clocks
      media: coda: use mem2mem try_en/decoder_cmd helpers
      media: coda: fix mpeg2 sequence number handling
      media: coda: add coda_wake_up_capture_queue
      media: coda: split decoder sequence initialization out of start decod=
ing
      media: coda: add sequence initialization work
      media: coda: implement decoder source change event
      media: coda: integrate internal frame metadata into a structure
      media: coda: make coda_bitstream_queue more versatile
      media: coda: pad first buffer with repeated MPEG headers to fix seque=
nce init
      media: coda: do not enforce 512-byte initial bitstream payload on COD=
A960
      media: coda: flush bitstream ring buffer on decoder restart
      media: coda: increment sequence offset for the last returned frame
      media: coda: allow flagging last output buffer internally
      media: coda: mark the last output buffer on decoder stop command
      media: coda: only set the stream end flags if there are no more pendi=
ng output buffers
      media: coda: mark the last output buffer on encoder stop command
      media: coda: retire coda_buf_is_end_of_stream
      media: coda: only wake up capture queue if no pending buffers to enco=
de
      media: coda: flag the last encoded buffer
      media: coda: lock capture queue wakeup against encoder stop command
      media: coda: mark last pending buffer or last meta on decoder stop co=
mmand
      media: coda: mark last returned frame
      media: coda: store device pointer in driver structure instead of pdev
      media: coda: add coda_slice_mode() function
      media: coda: encoder parameter change support

Puranjay Mohan (1):
      media: pci: cx88: Change the type of 'missed' to u64

Robert Jarzmik (2):
      media: mt9m111: add regulator support
      media: mt9m111: fix fw-node refactoring

Rui Miguel Silva (2):
      media: imx7_mipi_csis: fix racy entity pads init
      media: imx7-media-csi: get csi upstream endpoint

Sakari Ailus (15):
      media: v4l: fwnode: C-PHY has no clock lane
      media: videobuf2-core: Prevent size alignment wrapping buffer size to=
 0
      media: videobuf2-dma-sg: Prevent size from overflowing
      media: videobuf2-core.h: Document the alloc memop size argument as pa=
ge aligned
      media: staging: imgu: Address a compiler warning on alignment
      media: staging: imgu: Remove redundant checks
      media: staging: imgu: Address compiler / checker warnings in MMU code
      media: staging: imgu: Drop support for other page sizes
      media: omap3isp: Don't rely on devm for memory resource management
      media: omap3isp: Call video_unregister_device() unconditionally
      media: v4l2-fwnode: Avoid using PTR_ERR(NULL)
      media: ov9640: Don't check for NULL on devm_gpiod_get return values
      media: mt9m111: No need to check for the regulator
      media: mt9m111: Fix error handling in mt9m111_power_on
      media: MAINTAINERS: Add maintainers for Media Controller

Sean Young (6):
      media: au0828: fix null dereference in error path
      media: em28xx: give RC device proper name
      media: em28xx: use common code for decoding nec scancodes
      media: em28xx: use usb_to_input_id() rather than handrolling it
      media: ttpci: use rc-core for the IR receiver
      media: rc: IR signal for Panasonic air conditioner too long

Shailendra Verma (1):
      media: staging: media: davinci_vpfe: - Fix for memory leak if decoder=
 initialization fails.

Shawn Tu (1):
      media: ov8856: modify register to fix test pattern

Shobhit Kukreti (2):
      media: platform: Fix Warning of Unneeded Semicolon reported by coccic=
heck
      media: i2c: Fix Unnecessary Semicolon Warning Reported by coccicheck

Shuah Khan (2):
      media: media.h: Fix shifting signed 32-bit value by 31 bits problem
      media: videodev2.h: Fix shifting signed 32-bit value by 31 bits probl=
em

Stanimir Varbanov (3):
      media: venus: hfi_cmds: add more not-implemented properties
      media: venus: helpers: fix dynamic buffer mode for v4
      media: media/doc: Allow sizeimage to be set by v4l clients

Stefan Agner (1):
      media: Kconfig: allow to select drivers if EMBEDDED

Stefan Br=C3=BCns (3):
      media: dvb-usb-v2: Report error on all error paths
      media: dvbsky: Remove duplicate error reporting for dvbsky_usb_generi=
c_rw
      media: af9035: Remove duplicate error reporting for dvbsky_usb_generi=
c_rw

Steve Longerbeam (10):
      media: docs-rst: Clarify older field vs. first transmitted field
      media: Revert "media: staging/imx: add media device to capture regist=
er"
      media: staging/imx: Switch to sync registration for IPU subdevs
      media: staging/imx: Pass device to alloc/free_dma_buf
      media: staging/imx: Move add_video_device into capture_device_register
      media: Revert "media: imx: Set capture compose rectangle in capture_d=
evice_set_format"
      media: staging/imx: Remove capture_device_set_format
      media: staging/imx: Re-organize modules
      media: staging/imx: Improve pipeline searching
      media: staging/imx: Don't set driver data for v4l2_dev

Tobias Klausmann (2):
      media: stv6110x: Implement probe/remove for stv6110x
      media: stv090x: Implement probe/remove for stv090x

Tomasz Figa (2):
      media: MAINTAINERS: media: Add Tomasz Figa as a videobuf2 reviewer
      media: Clarify the meaning of file descriptors in VIDIOC_DQBUF

Torleiv Sundre (1):
      media: uvcvideo: Include streaming interface number in debugfs dir na=
me

Vandana BN (1):
      media: usb:zr364xx:Fix KASAN:null-ptr-deref Read in zr364xx_vidioc_qu=
erycap

Wen Yang (3):
      media: venus: firmware: fix leaked of_node references
      media: mtk-vpu: fix leaked of_node references
      media: mtk-vcodec: fix leaked of_node references

Wolfram Sang (9):
      media: i2c: mt9p031: simplify getting the adapter of a client
      media: i2c: ak881x: simplify getting the adapter of a client
      media: i2c: mt9m001: simplify getting the adapter of a client
      media: i2c: mt9m111: simplify getting the adapter of a client
      media: i2c: ov2640: simplify getting the adapter of a client
      media: i2c: tw9910: simplify getting the adapter of a client
      media: staging: media: soc_camera: imx074: simplify getting the adapt=
er of a client
      media: staging: media: soc_camera: mt9t031: simplify getting the adap=
ter of a client
      media: staging: media: soc_camera: soc_mt9v022: simplify getting the =
adapter of a client

Young Xiao (2):
      media: cx231xx-dvb: fix memory leak in dvb_fini()
      media: davinci: vpif_capture: fix memory leak in vpif_probe()

YueHaibing (3):
      media: meson: vdec: Add missing kthread.h
      media: ttpci: Fix build error without RC_CORE
      media: meye: Fix build COMPILE_TEST error

Yunfei Dong (1):
      media: mtk-vcodec: support single-buffer frames

sumitg (1):
      media: v4l2-core: fix use-after-free error

 Documentation/ABI/testing/debugfs-cec-error-inj    |    2 +-
 .../devicetree/bindings/media/allegro.txt          |   43 +
 .../devicetree/bindings/media/amlogic,vdec.txt     |   71 +
 .../devicetree/bindings/media/imx7-csi.txt         |    9 +-
 .../bindings/media/marvell,mmp2-ccic.txt           |   50 +
 .../devicetree/bindings/media/sun6i-csi.txt        |    1 +
 .../devicetree/bindings/vendor-prefixes.yaml       |    2 +
 Documentation/media/kapi/dtv-core.rst              |    6 +-
 Documentation/media/kapi/v4l2-controls.rst         |  206 +-
 Documentation/media/uapi/cec/cec-api.rst           |    2 +-
 Documentation/media/uapi/cec/cec-ioc-g-mode.rst    |    3 +-
 Documentation/media/uapi/cec/cec-ioc-receive.rst   |   15 +-
 .../media/uapi/mediactl/media-ioc-enum-links.rst   |    7 +-
 Documentation/media/uapi/rc/rc-tables.rst          |   30 +-
 Documentation/media/uapi/v4l/biblio.rst            |    9 +
 Documentation/media/uapi/v4l/ext-ctrls-codec.rst   |  625 ++++
 Documentation/media/uapi/v4l/extended-controls.rst |   15 +-
 Documentation/media/uapi/v4l/field-order.rst       |   17 +-
 Documentation/media/uapi/v4l/pixfmt-compressed.rst |   25 +
 .../media/uapi/v4l/pixfmt-v4l2-mplane.rst          |   15 +-
 Documentation/media/uapi/v4l/pixfmt-v4l2.rst       |   13 +-
 Documentation/media/uapi/v4l/vidioc-qbuf.rst       |    8 +
 Documentation/media/uapi/v4l/vidioc-queryctrl.rst  |   30 +
 Documentation/media/v4l-drivers/index.rst          |    1 +
 Documentation/media/v4l-drivers/vimc.dot           |   22 +
 Documentation/media/v4l-drivers/vimc.rst           |   98 +
 Documentation/media/v4l-drivers/vivid.rst          |    5 +
 Documentation/media/videodev2.h.rst.exceptions     |    5 +
 MAINTAINERS                                        |   57 +-
 drivers/input/touchscreen/sur40.c                  |    6 +-
 drivers/media/Kconfig                              |   37 +-
 drivers/media/Makefile                             |   13 +-
 drivers/media/cec/cec-adap.c                       |  141 +-
 drivers/media/cec/cec-api.c                        |    8 -
 drivers/media/cec/cec-core.c                       |    8 +-
 drivers/media/cec/cec-notifier.c                   |  112 +-
 drivers/media/cec/cec-priv.h                       |    5 +
 drivers/media/common/saa7146/saa7146_fops.c        |    9 +
 drivers/media/common/saa7146/saa7146_video.c       |   18 +-
 drivers/media/common/videobuf2/videobuf2-core.c    |    5 +
 .../media/common/videobuf2/videobuf2-dma-contig.c  |    3 +-
 drivers/media/common/videobuf2/videobuf2-dma-sg.c  |    5 +-
 drivers/media/common/videobuf2/videobuf2-memops.c  |    9 +-
 drivers/media/common/videobuf2/videobuf2-v4l2.c    |   10 +-
 drivers/media/common/videobuf2/videobuf2-vmalloc.c |    3 +-
 drivers/media/dvb-core/Kconfig                     |    3 -
 drivers/media/dvb-core/dvb_frontend.c              |  140 +-
 drivers/media/dvb-frontends/Kconfig                |    3 +-
 drivers/media/dvb-frontends/rtl2832_sdr.c          |    5 +-
 drivers/media/dvb-frontends/si2168.c               |    7 +-
 drivers/media/dvb-frontends/stv0297.c              |    2 +-
 drivers/media/dvb-frontends/stv090x.c              |  197 +-
 drivers/media/dvb-frontends/stv090x.h              |    3 +
 drivers/media/dvb-frontends/stv090x_priv.h         |    2 +-
 drivers/media/dvb-frontends/stv6110x.c             |  135 +-
 drivers/media/dvb-frontends/stv6110x.h             |    3 +
 drivers/media/dvb-frontends/stv6110x_priv.h        |    3 +-
 drivers/media/i2c/Kconfig                          |    5 +-
 drivers/media/i2c/Makefile                         |    2 +-
 drivers/media/i2c/{adv7511.c =3D> adv7511-v4l2.c}    |    5 +
 drivers/media/i2c/ak881x.c                         |    2 +-
 drivers/media/i2c/cx25840/cx25840-core.c           | 1409 ++++++---
 drivers/media/i2c/cx25840/cx25840-core.h           |   30 +-
 drivers/media/i2c/cx25840/cx25840-vbi.c            |    4 +
 drivers/media/i2c/imx214.c                         |    2 +-
 drivers/media/i2c/mt9m001.c                        |    2 +-
 drivers/media/i2c/mt9m111.c                        |   40 +-
 drivers/media/i2c/mt9p031.c                        |    2 +-
 drivers/media/i2c/ov13858.c                        |    4 +-
 drivers/media/i2c/ov2640.c                         |    2 +-
 drivers/media/i2c/ov2685.c                         |    2 +-
 drivers/media/i2c/ov5695.c                         |    2 +-
 drivers/media/i2c/ov6650.c                         |    1 -
 drivers/media/i2c/ov7740.c                         |   24 +-
 drivers/media/i2c/ov8856.c                         |   12 +-
 drivers/media/i2c/ov9640.c                         |    4 +-
 drivers/media/i2c/smiapp/smiapp-quirk.c            |    2 +-
 drivers/media/i2c/st-mipid02.c                     |   60 +-
 drivers/media/i2c/tda7432.c                        |    3 +-
 drivers/media/i2c/tw9910.c                         |    3 +-
 drivers/media/i2c/video-i2c.c                      |    8 +-
 drivers/media/mc/Kconfig                           |   33 +
 drivers/media/mc/Makefile                          |   10 +
 .../mc-dev-allocator.c}                            |    0
 drivers/media/{media-device.c =3D> mc/mc-device.c}   |   10 +-
 drivers/media/{media-devnode.c =3D> mc/mc-devnode.c} |    0
 drivers/media/{media-entity.c =3D> mc/mc-entity.c}   |    0
 drivers/media/{media-request.c =3D> mc/mc-request.c} |    0
 drivers/media/pci/bt8xx/bttv-audio-hook.c          |    2 +-
 drivers/media/pci/bt8xx/bttv-audio-hook.h          |    2 +
 drivers/media/pci/bt8xx/bttv-driver.c              |   50 +-
 drivers/media/pci/cobalt/Kconfig                   |    2 +-
 drivers/media/pci/cobalt/cobalt-v4l2.c             |   14 +-
 drivers/media/pci/cx18/cx18-ioctl.c                |    5 +-
 drivers/media/pci/cx18/cx18-streams.c              |    1 +
 drivers/media/pci/cx23885/cx23885-417.c            |   13 +-
 drivers/media/pci/cx23885/cx23885-dvb.c            |    2 -
 drivers/media/pci/cx23885/cx23885-video.c          |   22 +-
 drivers/media/pci/cx25821/cx25821-video.c          |   14 +-
 drivers/media/pci/cx88/cx88-alsa.c                 |    2 +-
 drivers/media/pci/cx88/cx88-blackbird.c            |    6 +-
 drivers/media/pci/cx88/cx88-core.c                 |    2 +-
 drivers/media/pci/cx88/cx88-i2c.c                  |    1 -
 drivers/media/pci/cx88/cx88-input.c                |    4 +-
 drivers/media/pci/cx88/cx88-video.c                |   34 +-
 drivers/media/pci/ddbridge/Kconfig                 |    1 -
 drivers/media/pci/dt3155/Kconfig                   |    1 -
 drivers/media/pci/dt3155/dt3155.c                  |    5 +-
 drivers/media/pci/intel/ipu3/ipu3-cio2.c           |    2 +-
 drivers/media/pci/ivtv/Kconfig                     |    2 -
 drivers/media/pci/ivtv/ivtv-cards.h                |    3 +-
 drivers/media/pci/ivtv/ivtv-ioctl.c                |    7 -
 drivers/media/pci/ivtv/ivtv-streams.c              |   14 +-
 drivers/media/pci/ivtv/ivtvfb.c                    |   10 +
 drivers/media/pci/meye/Kconfig                     |    3 +-
 drivers/media/pci/meye/meye.c                      |    6 +-
 drivers/media/pci/saa7134/saa7134-core.c           |   15 +
 drivers/media/pci/saa7134/saa7134-empress.c        |    4 +
 drivers/media/pci/saa7134/saa7134-video.c          |   46 +-
 drivers/media/pci/saa7164/saa7164-core.c           |   33 +-
 drivers/media/pci/saa7164/saa7164-encoder.c        |   15 +-
 drivers/media/pci/saa7164/saa7164-vbi.c            |   15 +-
 drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c     |    5 +-
 drivers/media/pci/solo6x10/solo6x10-v4l2.c         |    5 +-
 drivers/media/pci/sta2x11/sta2x11_vip.c            |    6 +-
 drivers/media/pci/ttpci/Kconfig                    |    3 +-
 drivers/media/pci/ttpci/av7110.c                   |   14 +-
 drivers/media/pci/ttpci/av7110.h                   |   21 +-
 drivers/media/pci/ttpci/av7110_ir.c                |  423 +--
 drivers/media/pci/tw68/tw68-video.c                |    8 +-
 drivers/media/pci/tw686x/tw686x-video.c            |    5 +-
 drivers/media/platform/Kconfig                     |   12 -
 drivers/media/platform/aspeed-video.c              |  156 +-
 drivers/media/platform/atmel/Makefile              |    4 +-
 .../atmel/{atmel-isc.c =3D> atmel-isc-base.c}        |  783 ++---
 drivers/media/platform/atmel/atmel-isc-regs.h      |    6 +-
 drivers/media/platform/atmel/atmel-isc.h           |  245 ++
 drivers/media/platform/atmel/atmel-sama5d2-isc.c   |  348 +++
 drivers/media/platform/cec-gpio/cec-gpio.c         |   28 +-
 drivers/media/platform/coda/Makefile               |    5 +-
 drivers/media/platform/coda/coda-bit.c             |  452 ++-
 drivers/media/platform/coda/coda-common.c          |  392 ++-
 drivers/media/platform/coda/coda-h264.c            |    3 +-
 drivers/media/platform/coda/coda-mpeg2.c           |   87 +
 drivers/media/platform/coda/coda-mpeg4.c           |   87 +
 drivers/media/platform/coda/coda.h                 |   47 +-
 drivers/media/platform/coda/coda_regs.h            |   20 +-
 drivers/media/platform/coda/trace.h                |    2 +-
 drivers/media/platform/davinci/vpif_capture.c      |   16 +-
 drivers/media/platform/davinci/vpss.c              |    7 +-
 drivers/media/platform/exynos-gsc/gsc-core.c       |    2 +-
 drivers/media/platform/exynos-gsc/gsc-core.h       |    2 +-
 drivers/media/platform/exynos-gsc/gsc-m2m.c        |   14 +-
 drivers/media/platform/exynos4-is/common.c         |    5 +-
 drivers/media/platform/exynos4-is/common.h         |    3 +-
 drivers/media/platform/exynos4-is/fimc-capture.c   |   10 +-
 drivers/media/platform/exynos4-is/fimc-isp-video.c |    9 +-
 drivers/media/platform/exynos4-is/fimc-lite.c      |   10 +-
 drivers/media/platform/exynos4-is/fimc-m2m.c       |   12 +-
 drivers/media/platform/exynos4-is/media-dev.c      |    6 +-
 drivers/media/platform/marvell-ccic/Kconfig        |    2 +
 drivers/media/platform/marvell-ccic/cafe-driver.c  |   58 +-
 drivers/media/platform/marvell-ccic/mcam-core.c    |  348 ++-
 drivers/media/platform/marvell-ccic/mcam-core.h    |   12 +-
 drivers/media/platform/marvell-ccic/mmp-driver.c   |  238 +-
 drivers/media/platform/meson/ao-cec-g12a.c         |   21 +-
 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c    |    6 +-
 drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c       |   18 +-
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c |   44 +-
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h |    2 +-
 .../media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c |    2 +-
 .../media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c  |    4 +-
 .../media/platform/mtk-vcodec/mtk_vcodec_dec_pm.h  |    2 +-
 drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h |    6 +-
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c |   47 +-
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.h |    2 +-
 .../media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c |    2 +-
 .../media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c  |    2 +-
 .../media/platform/mtk-vcodec/mtk_vcodec_enc_pm.h  |    2 +-
 .../media/platform/mtk-vcodec/mtk_vcodec_intr.c    |    2 +-
 .../media/platform/mtk-vcodec/mtk_vcodec_intr.h    |    2 +-
 .../media/platform/mtk-vcodec/mtk_vcodec_util.c    |    2 +-
 .../media/platform/mtk-vcodec/mtk_vcodec_util.h    |    2 +-
 .../media/platform/mtk-vcodec/vdec/vdec_h264_if.c  |   23 +-
 .../media/platform/mtk-vcodec/vdec/vdec_vp8_if.c   |   23 +-
 .../media/platform/mtk-vcodec/vdec/vdec_vp9_if.c   |   25 +-
 drivers/media/platform/mtk-vcodec/vdec_drv_base.h  |   10 +-
 drivers/media/platform/mtk-vcodec/vdec_drv_if.c    |   22 +-
 drivers/media/platform/mtk-vcodec/vdec_drv_if.h    |    6 +-
 drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h   |    2 +-
 drivers/media/platform/mtk-vcodec/vdec_vpu_if.c    |    2 +-
 drivers/media/platform/mtk-vcodec/vdec_vpu_if.h    |    2 +-
 .../media/platform/mtk-vcodec/venc/venc_h264_if.c  |   21 +-
 .../media/platform/mtk-vcodec/venc/venc_vp8_if.c   |   21 +-
 drivers/media/platform/mtk-vcodec/venc_drv_base.h  |   10 +-
 drivers/media/platform/mtk-vcodec/venc_drv_if.c    |   15 +-
 drivers/media/platform/mtk-vcodec/venc_drv_if.h    |    5 +-
 drivers/media/platform/mtk-vcodec/venc_ipi_msg.h   |    2 +-
 drivers/media/platform/mtk-vcodec/venc_vpu_if.c    |    2 +-
 drivers/media/platform/mtk-vcodec/venc_vpu_if.h    |    2 +-
 drivers/media/platform/mtk-vpu/mtk_vpu.c           |    2 +-
 drivers/media/platform/omap/Kconfig                |    1 -
 drivers/media/platform/omap3isp/isp.c              |   18 +-
 drivers/media/platform/omap3isp/isph3a_aewb.c      |   24 +-
 drivers/media/platform/omap3isp/isph3a_af.c        |   24 +-
 drivers/media/platform/omap3isp/isphist.c          |   11 +-
 drivers/media/platform/omap3isp/ispstat.c          |    4 +-
 drivers/media/platform/omap3isp/ispvideo.c         |    3 +-
 drivers/media/platform/pxa_camera.c                |    2 +-
 drivers/media/platform/qcom/camss/camss-video.c    |    2 +-
 drivers/media/platform/qcom/venus/core.c           |    4 +-
 drivers/media/platform/qcom/venus/firmware.c       |    6 +-
 drivers/media/platform/qcom/venus/helpers.c        |    7 +
 drivers/media/platform/qcom/venus/hfi_cmds.c       |    2 +
 drivers/media/platform/qcom/venus/vdec.c           |    4 +-
 drivers/media/platform/qcom/venus/vdec_ctrls.c     |    2 +-
 drivers/media/platform/qcom/venus/venc.c           |    4 +-
 drivers/media/platform/qcom/venus/venc_ctrls.c     |   23 +-
 drivers/media/platform/rcar-vin/rcar-csi2.c        |    4 +-
 drivers/media/platform/rcar-vin/rcar-v4l2.c        |  190 +-
 drivers/media/platform/rcar_fdp1.c                 |   12 +-
 drivers/media/platform/rcar_jpu.c                  |   10 +-
 drivers/media/platform/renesas-ceu.c               |    2 +-
 drivers/media/platform/s5p-mfc/s5p_mfc.c           |    5 +-
 drivers/media/platform/s5p-mfc/s5p_mfc_dec.c       |   19 +-
 drivers/media/platform/s5p-mfc/s5p_mfc_enc.c       |   21 +-
 drivers/media/platform/s5p-mfc/s5p_mfc_opr_v5.c    |    4 +-
 drivers/media/platform/s5p-mfc/s5p_mfc_opr_v6.c    |    8 +-
 drivers/media/platform/s5p-mfc/s5p_mfc_pm.c        |    5 +
 drivers/media/platform/seco-cec/seco-cec.c         |    2 +-
 .../media/platform/sti/c8sectpfe/c8sectpfe-dvb.c   |    4 +-
 drivers/media/platform/sti/hva/hva-v4l2.c          |    4 +-
 drivers/media/platform/stm32/stm32-dcmi.c          |    2 +-
 drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c |    1 +
 drivers/media/platform/ti-vpe/vpe.c                |    7 +-
 drivers/media/platform/vicodec/Kconfig             |    1 -
 drivers/media/platform/vicodec/vicodec-core.c      |  313 +-
 drivers/media/platform/vim2m.c                     |    6 +-
 drivers/media/platform/vimc/Kconfig                |    1 -
 drivers/media/platform/vimc/Makefile               |   12 +-
 drivers/media/platform/vimc/vimc-capture.c         |    5 +-
 drivers/media/platform/vimc/vimc-common.c          |    4 -
 drivers/media/platform/vimc/vimc-core.c            |    7 +-
 drivers/media/platform/vimc/vimc-debayer.c         |   11 +-
 drivers/media/platform/vimc/vimc-scaler.c          |    7 +-
 drivers/media/platform/vimc/vimc-sensor.c          |    7 +-
 drivers/media/platform/vimc/vimc-streamer.c        |   26 +-
 drivers/media/platform/vivid/Kconfig               |    1 -
 drivers/media/platform/vivid/vivid-core.c          |  126 +-
 drivers/media/platform/vivid/vivid-core.h          |   44 +-
 drivers/media/platform/vivid/vivid-ctrls.c         |  108 +-
 drivers/media/platform/vivid/vivid-kthread-cap.c   |    8 +-
 drivers/media/platform/vivid/vivid-osd.c           |    2 +-
 drivers/media/platform/vivid/vivid-vbi-cap.c       |   16 +-
 drivers/media/platform/vivid/vivid-vid-cap.c       |  142 +-
 drivers/media/platform/vivid/vivid-vid-common.c    |   28 +-
 drivers/media/platform/vivid/vivid-vid-common.h    |    2 -
 drivers/media/platform/vivid/vivid-vid-out.c       |    6 +
 drivers/media/radio/Kconfig                        |    1 -
 drivers/media/radio/dsbr100.c                      |    3 +-
 drivers/media/radio/radio-cadet.c                  |    5 +-
 drivers/media/radio/radio-isa.c                    |    4 +-
 drivers/media/radio/radio-keene.c                  |    3 +-
 drivers/media/radio/radio-ma901.c                  |    3 +-
 drivers/media/radio/radio-miropcm20.c              |    4 +-
 drivers/media/radio/radio-mr800.c                  |    5 +-
 drivers/media/radio/radio-raremono.c               |   33 +-
 drivers/media/radio/radio-sf16fmi.c                |    3 +-
 drivers/media/radio/radio-si476x.c                 |   21 +-
 drivers/media/radio/radio-tea5764.c                |    3 +-
 drivers/media/radio/radio-tea5777.c                |    5 +-
 drivers/media/radio/radio-timb.c                   |    3 +-
 drivers/media/radio/radio-wl1273.c                 |   12 +-
 drivers/media/radio/si470x/radio-si470x-i2c.c      |    7 +-
 drivers/media/radio/si470x/radio-si470x-usb.c      |    6 +-
 drivers/media/radio/si4713/radio-platform-si4713.c |    4 +-
 drivers/media/radio/si4713/radio-usb-si4713.c      |    4 +-
 drivers/media/radio/tea575x.c                      |    7 +-
 drivers/media/radio/wl128x/fmdrv_v4l2.c            |   13 +-
 drivers/media/rc/ir-spi.c                          |    1 +
 drivers/media/rc/keymaps/rc-adstech-dvb-t-pci.c    |   20 +-
 drivers/media/rc/keymaps/rc-alink-dtu-m.c          |   20 +-
 drivers/media/rc/keymaps/rc-anysee.c               |   20 +-
 drivers/media/rc/keymaps/rc-apac-viewcomp.c        |   20 +-
 drivers/media/rc/keymaps/rc-astrometa-t2hybrid.c   |   20 +-
 drivers/media/rc/keymaps/rc-asus-pc39.c            |   20 +-
 drivers/media/rc/keymaps/rc-asus-ps3-100.c         |   20 +-
 drivers/media/rc/keymaps/rc-ati-x10.c              |   20 +-
 drivers/media/rc/keymaps/rc-avermedia-a16d.c       |   20 +-
 drivers/media/rc/keymaps/rc-avermedia-cardbus.c    |   20 +-
 drivers/media/rc/keymaps/rc-avermedia-dvbt.c       |   20 +-
 drivers/media/rc/keymaps/rc-avermedia-m135a.c      |   40 +-
 .../media/rc/keymaps/rc-avermedia-m733a-rm-k6.c    |   20 +-
 drivers/media/rc/keymaps/rc-avermedia-rm-ks.c      |   20 +-
 drivers/media/rc/keymaps/rc-avermedia.c            |   20 +-
 drivers/media/rc/keymaps/rc-avertv-303.c           |   20 +-
 drivers/media/rc/keymaps/rc-azurewave-ad-tu700.c   |   20 +-
 drivers/media/rc/keymaps/rc-behold-columbus.c      |   20 +-
 drivers/media/rc/keymaps/rc-behold.c               |   20 +-
 drivers/media/rc/keymaps/rc-budget-ci-old.c        |   20 +-
 drivers/media/rc/keymaps/rc-cinergy-1400.c         |   20 +-
 drivers/media/rc/keymaps/rc-cinergy.c              |   20 +-
 drivers/media/rc/keymaps/rc-d680-dmb.c             |   20 +-
 drivers/media/rc/keymaps/rc-delock-61959.c         |   20 +-
 drivers/media/rc/keymaps/rc-dib0700-nec.c          |   40 +-
 drivers/media/rc/keymaps/rc-dib0700-rc5.c          |  100 +-
 drivers/media/rc/keymaps/rc-digitalnow-tinytwin.c  |   20 +-
 drivers/media/rc/keymaps/rc-digittrade.c           |   20 +-
 drivers/media/rc/keymaps/rc-dm1105-nec.c           |   20 +-
 drivers/media/rc/keymaps/rc-dntv-live-dvb-t.c      |   20 +-
 drivers/media/rc/keymaps/rc-dntv-live-dvbt-pro.c   |   20 +-
 drivers/media/rc/keymaps/rc-dtt200u.c              |   20 +-
 drivers/media/rc/keymaps/rc-dvbsky.c               |   20 +-
 drivers/media/rc/keymaps/rc-dvico-mce.c            |   20 +-
 drivers/media/rc/keymaps/rc-dvico-portable.c       |   20 +-
 drivers/media/rc/keymaps/rc-em-terratec.c          |   20 +-
 drivers/media/rc/keymaps/rc-encore-enltv-fm53.c    |   20 +-
 drivers/media/rc/keymaps/rc-encore-enltv.c         |   20 +-
 drivers/media/rc/keymaps/rc-encore-enltv2.c        |   20 +-
 drivers/media/rc/keymaps/rc-eztv.c                 |   20 +-
 drivers/media/rc/keymaps/rc-flydvb.c               |   20 +-
 drivers/media/rc/keymaps/rc-flyvideo.c             |   20 +-
 drivers/media/rc/keymaps/rc-fusionhdtv-mce.c       |   20 +-
 drivers/media/rc/keymaps/rc-gadmei-rm008z.c        |   20 +-
 drivers/media/rc/keymaps/rc-genius-tvgo-a11mce.c   |   20 +-
 drivers/media/rc/keymaps/rc-gotview7135.c          |   20 +-
 drivers/media/rc/keymaps/rc-hauppauge.c            |  101 +-
 drivers/media/rc/keymaps/rc-hisi-poplar.c          |   20 +-
 drivers/media/rc/keymaps/rc-hisi-tv-demo.c         |   20 +-
 drivers/media/rc/keymaps/rc-iodata-bctv7e.c        |   20 +-
 drivers/media/rc/keymaps/rc-it913x-v1.c            |   40 +-
 drivers/media/rc/keymaps/rc-it913x-v2.c            |   40 +-
 drivers/media/rc/keymaps/rc-kaiomy.c               |   20 +-
 drivers/media/rc/keymaps/rc-kworld-315u.c          |   20 +-
 drivers/media/rc/keymaps/rc-kworld-pc150u.c        |   20 +-
 .../media/rc/keymaps/rc-kworld-plus-tv-analog.c    |   24 +-
 drivers/media/rc/keymaps/rc-leadtek-y04g0051.c     |   20 +-
 drivers/media/rc/keymaps/rc-lme2510.c              |   60 +-
 drivers/media/rc/keymaps/rc-manli.c                |   20 +-
 .../media/rc/keymaps/rc-medion-x10-digitainer.c    |   20 +-
 drivers/media/rc/keymaps/rc-medion-x10-or2x.c      |   20 +-
 drivers/media/rc/keymaps/rc-medion-x10.c           |   20 +-
 drivers/media/rc/keymaps/rc-msi-digivox-ii.c       |   20 +-
 drivers/media/rc/keymaps/rc-msi-digivox-iii.c      |   20 +-
 drivers/media/rc/keymaps/rc-msi-tvanywhere-plus.c  |   20 +-
 drivers/media/rc/keymaps/rc-msi-tvanywhere.c       |   20 +-
 drivers/media/rc/keymaps/rc-nebula.c               |   20 +-
 .../media/rc/keymaps/rc-nec-terratec-cinergy-xs.c  |   40 +-
 drivers/media/rc/keymaps/rc-norwood.c              |   20 +-
 drivers/media/rc/keymaps/rc-npgtech.c              |   20 +-
 drivers/media/rc/keymaps/rc-pctv-sedna.c           |   20 +-
 drivers/media/rc/keymaps/rc-pinnacle-color.c       |   20 +-
 drivers/media/rc/keymaps/rc-pinnacle-grey.c        |   20 +-
 drivers/media/rc/keymaps/rc-pinnacle-pctv-hd.c     |   20 +-
 drivers/media/rc/keymaps/rc-pixelview-002t.c       |   20 +-
 drivers/media/rc/keymaps/rc-pixelview-mk12.c       |   20 +-
 drivers/media/rc/keymaps/rc-pixelview-new.c        |   20 +-
 drivers/media/rc/keymaps/rc-pixelview.c            |   20 +-
 .../media/rc/keymaps/rc-powercolor-real-angel.c    |   20 +-
 drivers/media/rc/keymaps/rc-proteus-2309.c         |   20 +-
 drivers/media/rc/keymaps/rc-purpletv.c             |   20 +-
 drivers/media/rc/keymaps/rc-pv951.c                |   20 +-
 .../media/rc/keymaps/rc-real-audio-220-32-keys.c   |   20 +-
 drivers/media/rc/keymaps/rc-reddo.c                |   20 +-
 drivers/media/rc/keymaps/rc-snapstream-firefly.c   |   20 +-
 drivers/media/rc/keymaps/rc-su3000.c               |   20 +-
 drivers/media/rc/keymaps/rc-tango.c                |   20 +-
 drivers/media/rc/keymaps/rc-tbs-nec.c              |   20 +-
 drivers/media/rc/keymaps/rc-technisat-ts35.c       |   20 +-
 drivers/media/rc/keymaps/rc-technisat-usb2.c       |   20 +-
 .../media/rc/keymaps/rc-terratec-cinergy-c-pci.c   |   20 +-
 .../media/rc/keymaps/rc-terratec-cinergy-s2-hd.c   |   20 +-
 drivers/media/rc/keymaps/rc-terratec-cinergy-xs.c  |   20 +-
 drivers/media/rc/keymaps/rc-terratec-slim-2.c      |   20 +-
 drivers/media/rc/keymaps/rc-terratec-slim.c        |   20 +-
 drivers/media/rc/keymaps/rc-tevii-nec.c            |   20 +-
 .../media/rc/keymaps/rc-total-media-in-hand-02.c   |   20 +-
 drivers/media/rc/keymaps/rc-total-media-in-hand.c  |   20 +-
 drivers/media/rc/keymaps/rc-trekstor.c             |   20 +-
 drivers/media/rc/keymaps/rc-tt-1500.c              |   20 +-
 drivers/media/rc/keymaps/rc-twinhan-dtv-cab-ci.c   |   20 +-
 drivers/media/rc/keymaps/rc-twinhan1027.c          |   20 +-
 drivers/media/rc/keymaps/rc-videomate-m1f.c        |   20 +-
 drivers/media/rc/keymaps/rc-videomate-s350.c       |   20 +-
 drivers/media/rc/keymaps/rc-videomate-tv-pvr.c     |   20 +-
 drivers/media/rc/keymaps/rc-winfast-usbii-deluxe.c |   20 +-
 drivers/media/rc/keymaps/rc-winfast.c              |   20 +-
 drivers/media/rc/keymaps/rc-xbox-dvd.c             |   20 +-
 drivers/media/rc/keymaps/rc-zx-irdec.c             |   20 +-
 drivers/media/rc/lirc_dev.c                        |    2 +-
 drivers/media/rc/mceusb.c                          |    4 +-
 drivers/media/rc/meson-ir.c                        |    6 +-
 drivers/media/rc/mtk-cir.c                         |    4 +-
 drivers/media/rc/rc-main.c                         |    6 +-
 drivers/media/rc/sunxi-cir.c                       |    1 -
 drivers/media/spi/Kconfig                          |    2 +-
 drivers/media/tuners/Kconfig                       |    2 +-
 drivers/media/tuners/si2157.c                      |    6 +
 drivers/media/tuners/si2157_priv.h                 |    3 +-
 drivers/media/usb/airspy/airspy.c                  |    6 +-
 drivers/media/usb/au0828/au0828-core.c             |   12 +-
 drivers/media/usb/au0828/au0828-video.c            |   21 +-
 drivers/media/usb/cpia2/cpia2_usb.c                |    3 +-
 drivers/media/usb/cpia2/cpia2_v4l.c                |    9 +-
 drivers/media/usb/cx231xx/cx231xx-cards.c          |    2 +
 drivers/media/usb/cx231xx/cx231xx-dvb.c            |    1 +
 drivers/media/usb/cx231xx/cx231xx-video.c          |   28 +-
 drivers/media/usb/dvb-usb-v2/af9035.c              |    2 -
 drivers/media/usb/dvb-usb-v2/dvb_usb_urb.c         |   15 +-
 drivers/media/usb/dvb-usb-v2/dvbsky.c              |   11 -
 drivers/media/usb/dvb-usb/Kconfig                  |   16 +-
 drivers/media/usb/dvb-usb/Makefile                 |    3 +
 drivers/media/usb/dvb-usb/cxusb-analog.c           | 1845 ++++++++++++
 drivers/media/usb/dvb-usb/cxusb.c                  |  796 ++++--
 drivers/media/usb/dvb-usb/cxusb.h                  |  158 +-
 drivers/media/usb/dvb-usb/dvb-usb-dvb.c            |    5 +-
 drivers/media/usb/dvb-usb/dvb-usb-init.c           |   20 +-
 drivers/media/usb/dvb-usb/dvb-usb.h                |   10 +
 drivers/media/usb/em28xx/em28xx-input.c            |   35 +-
 drivers/media/usb/em28xx/em28xx-video.c            |   32 +-
 drivers/media/usb/go7007/go7007-v4l2.c             |   15 +-
 drivers/media/usb/gspca/gspca.c                    |    6 +-
 drivers/media/usb/hackrf/hackrf.c                  |   14 +-
 drivers/media/usb/hdpvr/hdpvr-video.c              |   22 +-
 drivers/media/usb/msi2500/msi2500.c                |    5 +-
 drivers/media/usb/pvrusb2/Kconfig                  |    2 +
 drivers/media/usb/pvrusb2/pvrusb2-cx2584x-v4l.c    |   25 +
 drivers/media/usb/pvrusb2/pvrusb2-devattr.c        |  212 +-
 drivers/media/usb/pvrusb2/pvrusb2-devattr.h        |    1 +
 drivers/media/usb/pvrusb2/pvrusb2-dvb.c            |   88 +-
 drivers/media/usb/pvrusb2/pvrusb2-dvb.h            |    5 +-
 drivers/media/usb/pvrusb2/pvrusb2-fx2-cmd.h        |    4 +
 drivers/media/usb/pvrusb2/pvrusb2-hdw.c            |   40 +-
 drivers/media/usb/pvrusb2/pvrusb2-i2c-core.c       |    6 +-
 drivers/media/usb/pvrusb2/pvrusb2-std.c            |    2 +-
 drivers/media/usb/pvrusb2/pvrusb2-sysfs.c          |    3 +-
 drivers/media/usb/pvrusb2/pvrusb2-v4l2.c           |   17 +-
 drivers/media/usb/pwc/pwc-if.c                     |    2 +
 drivers/media/usb/pwc/pwc-v4l.c                    |    3 -
 drivers/media/usb/pwc/pwc.h                        |   18 +-
 drivers/media/usb/s2255/Kconfig                    |    1 -
 drivers/media/usb/s2255/s2255drv.c                 |    5 +-
 drivers/media/usb/stk1160/stk1160-v4l.c            |    7 +-
 drivers/media/usb/stkwebcam/stk-webcam.c           |    6 +-
 drivers/media/usb/tm6000/tm6000-video.c            |   20 +-
 drivers/media/usb/usbtv/usbtv-video.c              |    5 +-
 drivers/media/usb/usbvision/usbvision-video.c      |   20 +-
 drivers/media/usb/uvc/uvc_ctrl.c                   |    4 +-
 drivers/media/usb/uvc/uvc_debugfs.c                |    5 +-
 drivers/media/usb/zr364xx/zr364xx.c                |   10 +-
 drivers/media/v4l2-core/Kconfig                    |    2 -
 drivers/media/v4l2-core/v4l2-common.c              |   32 +-
 drivers/media/v4l2-core/v4l2-ctrls.c               |  126 +-
 drivers/media/v4l2-core/v4l2-dev.c                 |    2 -
 drivers/media/v4l2-core/v4l2-fwnode.c              |   10 +-
 drivers/media/v4l2-core/v4l2-ioctl.c               |   27 +-
 drivers/media/v4l2-core/v4l2-mem2mem.c             |   29 +
 drivers/media/v4l2-core/v4l2-subdev.c              |  268 +-
 drivers/media/v4l2-core/videobuf-core.c            |    5 +-
 drivers/media/v4l2-core/videobuf-dma-contig.c      |    9 +-
 drivers/media/v4l2-core/videobuf-dma-sg.c          |    5 +-
 drivers/media/v4l2-core/videobuf-vmalloc.c         |    7 +-
 drivers/staging/media/Kconfig                      |    8 +-
 drivers/staging/media/Makefile                     |    4 +-
 drivers/staging/media/allegro-dvt/Kconfig          |   16 +
 drivers/staging/media/allegro-dvt/Makefile         |    5 +
 drivers/staging/media/allegro-dvt/TODO             |    4 +
 drivers/staging/media/allegro-dvt/allegro-core.c   | 3014 ++++++++++++++++=
++++
 drivers/staging/media/allegro-dvt/nal-h264.c       | 1001 +++++++
 drivers/staging/media/allegro-dvt/nal-h264.h       |  208 ++
 drivers/staging/media/bcm2048/radio-bcm2048.c      |    7 +-
 drivers/staging/media/davinci_vpfe/dm365_ipipe.c   |   25 +-
 drivers/staging/media/davinci_vpfe/dm365_isif.c    |    8 +-
 .../staging/media/davinci_vpfe/vpfe_mc_capture.c   |    8 +-
 drivers/staging/media/davinci_vpfe/vpfe_video.c    |   12 +-
 drivers/staging/media/hantro/Kconfig               |   23 +
 drivers/staging/media/hantro/Makefile              |   15 +
 .../staging/media/{rockchip/vpu =3D> hantro}/TODO    |    0
 drivers/staging/media/hantro/hantro.h              |  351 +++
 drivers/staging/media/hantro/hantro_drv.c          |  876 ++++++
 drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c |  260 ++
 drivers/staging/media/hantro/hantro_g1_regs.h      |  301 ++
 drivers/staging/media/hantro/hantro_h1_jpeg_enc.c  |  125 +
 drivers/staging/media/hantro/hantro_h1_regs.h      |  154 +
 drivers/staging/media/hantro/hantro_hw.h           |  102 +
 .../rockchip_vpu_jpeg.c =3D> hantro/hantro_jpeg.c}   |   41 +-
 drivers/staging/media/hantro/hantro_jpeg.h         |   13 +
 drivers/staging/media/hantro/hantro_mpeg2.c        |   61 +
 drivers/staging/media/hantro/hantro_v4l2.c         |  686 +++++
 drivers/staging/media/hantro/hantro_v4l2.h         |   26 +
 drivers/staging/media/hantro/rk3288_vpu_hw.c       |  187 ++
 drivers/staging/media/hantro/rk3399_vpu_hw.c       |  186 ++
 .../vpu =3D> hantro}/rk3399_vpu_hw_jpeg_enc.c        |   42 +-
 .../staging/media/hantro/rk3399_vpu_hw_mpeg2_dec.c |  266 ++
 .../{rockchip/vpu =3D> hantro}/rk3399_vpu_regs.h     |    2 +-
 drivers/staging/media/imx/Makefile                 |   18 +-
 drivers/staging/media/imx/imx-ic-common.c          |   68 +-
 drivers/staging/media/imx/imx-ic-prp.c             |   36 +-
 drivers/staging/media/imx/imx-ic-prpencvf.c        |   90 +-
 drivers/staging/media/imx/imx-ic.h                 |    6 +-
 drivers/staging/media/imx/imx-media-capture.c      |   97 +-
 drivers/staging/media/imx/imx-media-csi.c          |   51 +-
 drivers/staging/media/imx/imx-media-dev-common.c   |  346 ++-
 drivers/staging/media/imx/imx-media-dev.c          |  449 +--
 drivers/staging/media/imx/imx-media-fim.c          |    9 -
 drivers/staging/media/imx/imx-media-internal-sd.c  |  357 +--
 drivers/staging/media/imx/imx-media-of.c           |   41 +-
 drivers/staging/media/imx/imx-media-utils.c        |  170 +-
 drivers/staging/media/imx/imx-media-vdic.c         |   84 +-
 drivers/staging/media/imx/imx-media.h              |  116 +-
 drivers/staging/media/imx/imx7-media-csi.c         |  169 +-
 drivers/staging/media/imx/imx7-mipi-csis.c         |   41 +-
 drivers/staging/media/ipu3/include/intel-ipu3.h    |    2 +-
 drivers/staging/media/ipu3/ipu3-css-fw.c           |    6 +-
 drivers/staging/media/ipu3/ipu3-css.c              |   14 +-
 drivers/staging/media/ipu3/ipu3-dmamap.c           |   15 +-
 drivers/staging/media/ipu3/ipu3-mmu.c              |  125 +-
 drivers/staging/media/ipu3/ipu3-mmu.h              |    5 +-
 drivers/staging/media/ipu3/ipu3-v4l2.c             |    4 +-
 drivers/staging/media/meson/vdec/Kconfig           |   11 +
 drivers/staging/media/meson/vdec/Makefile          |    8 +
 drivers/staging/media/meson/vdec/TODO              |    8 +
 drivers/staging/media/meson/vdec/codec_mpeg12.c    |  210 ++
 drivers/staging/media/meson/vdec/codec_mpeg12.h    |   14 +
 drivers/staging/media/meson/vdec/dos_regs.h        |   98 +
 drivers/staging/media/meson/vdec/esparser.c        |  324 +++
 drivers/staging/media/meson/vdec/esparser.h        |   32 +
 drivers/staging/media/meson/vdec/vdec.c            | 1099 +++++++
 drivers/staging/media/meson/vdec/vdec.h            |  267 ++
 drivers/staging/media/meson/vdec/vdec_1.c          |  230 ++
 drivers/staging/media/meson/vdec/vdec_1.h          |   14 +
 drivers/staging/media/meson/vdec/vdec_helpers.c    |  449 +++
 drivers/staging/media/meson/vdec/vdec_helpers.h    |   83 +
 drivers/staging/media/meson/vdec/vdec_platform.c   |  101 +
 drivers/staging/media/meson/vdec/vdec_platform.h   |   30 +
 drivers/staging/media/omap4iss/iss_video.c         |   11 +-
 drivers/staging/media/rockchip/vpu/Kconfig         |   13 -
 drivers/staging/media/rockchip/vpu/Makefile        |   11 -
 drivers/staging/media/rockchip/vpu/rk3288_vpu_hw.c |  118 -
 .../media/rockchip/vpu/rk3288_vpu_hw_jpeg_enc.c    |  125 -
 .../staging/media/rockchip/vpu/rk3288_vpu_regs.h   |  442 ---
 drivers/staging/media/rockchip/vpu/rk3399_vpu_hw.c |  118 -
 drivers/staging/media/rockchip/vpu/rockchip_vpu.h  |  232 --
 .../media/rockchip/vpu/rockchip_vpu_common.h       |   29 -
 .../staging/media/rockchip/vpu/rockchip_vpu_drv.c  |  542 ----
 .../staging/media/rockchip/vpu/rockchip_vpu_enc.c  |  671 -----
 .../staging/media/rockchip/vpu/rockchip_vpu_hw.h   |   58 -
 .../staging/media/rockchip/vpu/rockchip_vpu_jpeg.h |   14 -
 drivers/staging/media/soc_camera/imx074.c          |    2 +-
 drivers/staging/media/soc_camera/mt9t031.c         |    2 +-
 drivers/staging/media/soc_camera/soc_mt9v022.c     |    2 +-
 drivers/staging/media/soc_camera/soc_ov5642.c      |    6 +-
 drivers/staging/media/sunxi/cedrus/Makefile        |    3 +-
 drivers/staging/media/sunxi/cedrus/cedrus.c        |   42 +-
 drivers/staging/media/sunxi/cedrus/cedrus.h        |   39 +-
 drivers/staging/media/sunxi/cedrus/cedrus_dec.c    |   13 +
 drivers/staging/media/sunxi/cedrus/cedrus_h264.c   |  576 ++++
 drivers/staging/media/sunxi/cedrus/cedrus_hw.c     |    6 +-
 drivers/staging/media/sunxi/cedrus/cedrus_hw.h     |    2 -
 drivers/staging/media/sunxi/cedrus/cedrus_regs.h   |   91 +
 drivers/staging/media/sunxi/cedrus/cedrus_video.c  |    9 +
 drivers/staging/media/tegra-vde/Kconfig            |    1 +
 drivers/staging/media/tegra-vde/Makefile           |    1 +
 drivers/staging/media/tegra-vde/dmabuf-cache.c     |  226 ++
 drivers/staging/media/tegra-vde/iommu.c            |  157 +
 drivers/staging/media/tegra-vde/trace.h            |    2 +
 drivers/staging/media/tegra-vde/uapi.h             |   48 +-
 .../staging/media/tegra-vde/{tegra-vde.c =3D> vde.c} |  212 +-
 drivers/staging/media/tegra-vde/vde.h              |  107 +
 .../vc04_services/bcm2835-camera/bcm2835-camera.c  |    6 +-
 drivers/usb/gadget/function/f_uvc.c                |    1 +
 drivers/usb/gadget/function/uvc_v4l2.c             |    4 -
 include/linux/platform_data/media/mmp-camera.h     |    4 -
 include/media/cec-notifier.h                       |  105 +-
 include/media/cec.h                                |   98 +-
 include/media/drv-intf/cx25840.h                   |  138 +-
 include/media/dvbdev.h                             |    4 +-
 include/media/h264-ctrls.h                         |  197 ++
 include/media/v4l2-common.h                        |   10 +-
 include/media/v4l2-ctrls.h                         |   13 +-
 include/media/v4l2-ioctl.h                         |   14 +-
 include/media/v4l2-mem2mem.h                       |    4 +
 include/media/v4l2-subdev.h                        |    6 +
 include/media/videobuf2-core.h                     |   21 +-
 include/media/videobuf2-memops.h                   |    3 +-
 include/uapi/linux/cec.h                           |    1 +
 include/uapi/linux/dvb/audio.h                     |    6 +-
 include/uapi/linux/dvb/osd.h                       |  174 +-
 include/uapi/linux/dvb/video.h                     |    4 +-
 include/uapi/linux/media.h                         |    2 +-
 include/uapi/linux/v4l2-controls.h                 |   23 +
 include/uapi/linux/videodev2.h                     |    2 +-
 samples/v4l/v4l2-pci-skeleton.c                    |    1 +
 593 files changed, 25444 insertions(+), 9394 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/allegro.txt
 create mode 100644 Documentation/devicetree/bindings/media/amlogic,vdec.txt
 create mode 100644 Documentation/devicetree/bindings/media/marvell,mmp2-cc=
ic.txt
 create mode 100644 Documentation/media/v4l-drivers/vimc.dot
 create mode 100644 Documentation/media/v4l-drivers/vimc.rst
 rename drivers/media/i2c/{adv7511.c =3D> adv7511-v4l2.c} (99%)
 create mode 100644 drivers/media/mc/Kconfig
 create mode 100644 drivers/media/mc/Makefile
 rename drivers/media/{media-dev-allocator.c =3D> mc/mc-dev-allocator.c} (1=
00%)
 rename drivers/media/{media-device.c =3D> mc/mc-device.c} (99%)
 rename drivers/media/{media-devnode.c =3D> mc/mc-devnode.c} (100%)
 rename drivers/media/{media-entity.c =3D> mc/mc-entity.c} (100%)
 rename drivers/media/{media-request.c =3D> mc/mc-request.c} (100%)
 rename drivers/media/platform/atmel/{atmel-isc.c =3D> atmel-isc-base.c} (8=
0%)
 create mode 100644 drivers/media/platform/atmel/atmel-isc.h
 create mode 100644 drivers/media/platform/atmel/atmel-sama5d2-isc.c
 create mode 100644 drivers/media/platform/coda/coda-mpeg2.c
 create mode 100644 drivers/media/platform/coda/coda-mpeg4.c
 create mode 100644 drivers/media/usb/dvb-usb/cxusb-analog.c
 create mode 100644 drivers/staging/media/allegro-dvt/Kconfig
 create mode 100644 drivers/staging/media/allegro-dvt/Makefile
 create mode 100644 drivers/staging/media/allegro-dvt/TODO
 create mode 100644 drivers/staging/media/allegro-dvt/allegro-core.c
 create mode 100644 drivers/staging/media/allegro-dvt/nal-h264.c
 create mode 100644 drivers/staging/media/allegro-dvt/nal-h264.h
 create mode 100644 drivers/staging/media/hantro/Kconfig
 create mode 100644 drivers/staging/media/hantro/Makefile
 rename drivers/staging/media/{rockchip/vpu =3D> hantro}/TODO (100%)
 create mode 100644 drivers/staging/media/hantro/hantro.h
 create mode 100644 drivers/staging/media/hantro/hantro_drv.c
 create mode 100644 drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c
 create mode 100644 drivers/staging/media/hantro/hantro_g1_regs.h
 create mode 100644 drivers/staging/media/hantro/hantro_h1_jpeg_enc.c
 create mode 100644 drivers/staging/media/hantro/hantro_h1_regs.h
 create mode 100644 drivers/staging/media/hantro/hantro_hw.h
 rename drivers/staging/media/{rockchip/vpu/rockchip_vpu_jpeg.c =3D> hantro=
/hantro_jpeg.c} (90%)
 create mode 100644 drivers/staging/media/hantro/hantro_jpeg.h
 create mode 100644 drivers/staging/media/hantro/hantro_mpeg2.c
 create mode 100644 drivers/staging/media/hantro/hantro_v4l2.c
 create mode 100644 drivers/staging/media/hantro/hantro_v4l2.h
 create mode 100644 drivers/staging/media/hantro/rk3288_vpu_hw.c
 create mode 100644 drivers/staging/media/hantro/rk3399_vpu_hw.c
 rename drivers/staging/media/{rockchip/vpu =3D> hantro}/rk3399_vpu_hw_jpeg=
_enc.c (82%)
 create mode 100644 drivers/staging/media/hantro/rk3399_vpu_hw_mpeg2_dec.c
 rename drivers/staging/media/{rockchip/vpu =3D> hantro}/rk3399_vpu_regs.h =
(99%)
 create mode 100644 drivers/staging/media/meson/vdec/Kconfig
 create mode 100644 drivers/staging/media/meson/vdec/Makefile
 create mode 100644 drivers/staging/media/meson/vdec/TODO
 create mode 100644 drivers/staging/media/meson/vdec/codec_mpeg12.c
 create mode 100644 drivers/staging/media/meson/vdec/codec_mpeg12.h
 create mode 100644 drivers/staging/media/meson/vdec/dos_regs.h
 create mode 100644 drivers/staging/media/meson/vdec/esparser.c
 create mode 100644 drivers/staging/media/meson/vdec/esparser.h
 create mode 100644 drivers/staging/media/meson/vdec/vdec.c
 create mode 100644 drivers/staging/media/meson/vdec/vdec.h
 create mode 100644 drivers/staging/media/meson/vdec/vdec_1.c
 create mode 100644 drivers/staging/media/meson/vdec/vdec_1.h
 create mode 100644 drivers/staging/media/meson/vdec/vdec_helpers.c
 create mode 100644 drivers/staging/media/meson/vdec/vdec_helpers.h
 create mode 100644 drivers/staging/media/meson/vdec/vdec_platform.c
 create mode 100644 drivers/staging/media/meson/vdec/vdec_platform.h
 delete mode 100644 drivers/staging/media/rockchip/vpu/Kconfig
 delete mode 100644 drivers/staging/media/rockchip/vpu/Makefile
 delete mode 100644 drivers/staging/media/rockchip/vpu/rk3288_vpu_hw.c
 delete mode 100644 drivers/staging/media/rockchip/vpu/rk3288_vpu_hw_jpeg_e=
nc.c
 delete mode 100644 drivers/staging/media/rockchip/vpu/rk3288_vpu_regs.h
 delete mode 100644 drivers/staging/media/rockchip/vpu/rk3399_vpu_hw.c
 delete mode 100644 drivers/staging/media/rockchip/vpu/rockchip_vpu.h
 delete mode 100644 drivers/staging/media/rockchip/vpu/rockchip_vpu_common.h
 delete mode 100644 drivers/staging/media/rockchip/vpu/rockchip_vpu_drv.c
 delete mode 100644 drivers/staging/media/rockchip/vpu/rockchip_vpu_enc.c
 delete mode 100644 drivers/staging/media/rockchip/vpu/rockchip_vpu_hw.h
 delete mode 100644 drivers/staging/media/rockchip/vpu/rockchip_vpu_jpeg.h
 create mode 100644 drivers/staging/media/sunxi/cedrus/cedrus_h264.c
 create mode 100644 drivers/staging/media/tegra-vde/dmabuf-cache.c
 create mode 100644 drivers/staging/media/tegra-vde/iommu.c
 rename drivers/staging/media/tegra-vde/{tegra-vde.c =3D> vde.c} (88%)
 create mode 100644 drivers/staging/media/tegra-vde/vde.h
 create mode 100644 include/media/h264-ctrls.h

