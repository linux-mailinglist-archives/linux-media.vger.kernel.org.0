Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4630A36C56C
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 13:39:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238136AbhD0LkW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 07:40:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:50768 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235426AbhD0LkV (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 07:40:21 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 61DC6613D8;
        Tue, 27 Apr 2021 11:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619523578;
        bh=VW5HvLA1pODD4mVs5nOSCzdD1wHzQBbypHdRrYtg43I=;
        h=Date:From:To:Cc:Subject:From;
        b=txTNNmjKszlqvo5DLuxZXapz9CLdySixJpw8o53d8zAVb0zzO6TW5K4ut4uZbdF+n
         +yyX0lem98Tk8hvDG71lATcAxg6bOigcq5cRs00PKvXuYseLy6jvXEcpxrRIhI95vH
         Uqa8YWdo6+Dre8riqIuzuCFxtnMgVarD6O5fMBAAD0U8UzJgwGFP84I85sVoW32FpK
         NoY8oIXTeWRyu9fuTSoVeo7t8akz21A0HFJ/KE7XUdyMY8jskRQTL6tPfjysC/I9PI
         M910O9zTkk7t8uGg9HiIAsgwKTtLQQyGQ73xxw8f++2xjlIktfmW4aXVY8VaR5lIm5
         F1JQrXK2t/TaA==
Date:   Tue, 27 Apr 2021 13:39:34 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL for v5.13-rc1] media updates
Message-ID: <20210427133934.476f22ff@coco.lan>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Linus,

Please pull from:
  git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/me=
dia/v5.13-1


For:

- addition of a maintainer's profile for the media subsystem;
- addition of i.MX8 IP support;
- qcom/camss gained support for hardware version Titan 170;
- new RC keymaps;
- Lots of other improvements, cleanups and bug fixes.

Regards,
Mauro

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/me=
dia/v5.13-1

for you to fetch changes up to 0b276e470a4d43e1365d3eb53c608a3d208cabd4:

  media: coda: fix macroblocks count control usage (2021-04-15 13:23:26 +02=
00)

----------------------------------------------------------------
media updates for v5.13-rc1

----------------------------------------------------------------
Aditya Srivastava (1):
      media: atomisp: replace boolean comparison of values with bool variab=
les

Alex Dewar (4):
      media: staging: media: atomisp: Don't abort on error in module exit p=
ath
      media: staging: media: atomisp: Remove unhelpful info message
      media: staging: media: atomisp: Remove unused function
      media: staging: media: atomisp: Remove unnecessary if statement

Andre Przywara (1):
      media: dt-bindings: media: IR: Add H616 IR compatible string

Andrey Konovalov (2):
      media: v4l: common: v4l2_get_link_freq: add printing a warning
      media: camss: use v4l2_get_link_freq() to calculate the relevant cloc=
ks

Andrzej Pietrasiewicz (1):
      media: uapi: Correct doc comment in H264 uAPI

Antti Ker=C3=A4nen (1):
      media: v4l2-mc: fix a warning message

Arnd Bergmann (7):
      media: mtk: fix mtk-smi dependency
      media: atomisp: fix Wvisiblity warning
      media: staging: atomisp: reduce kernel stack usage
      media: dvb-usb-remote: fix dvb_usb_nec_rc_key_to_event type mismatch
      media: rc: remove zte zx ir driver
      media: flexcop: avoid -Wempty-body warning
      media: dvb-usb: avoid -Wempty-body warnings

Bastien Nocera (1):
      media: rc: add keymap for Xbox 360 Universal Media remote

Beatriz Martins de Carvalho (1):
      media: staging: media: omap4iss: align arguments with open parenthesis

Bhaskar Chowdhury (8):
      media: include: media: davinci: Fixed up few trivial spellings in the=
 file isif.h
      media: drivers/media/pci/cx18: Fix a spelling minimze to minimize in =
the file cx18-firmware.c
      media: drivers: media: pci: cx18: Couple of spell fixes in the file c=
x18-av-core.c
      media: drivers: media: pci: cx18: Spelling fix of minimze to minimize=
 in the file cx18-av-audio.c
      media: pci: saa7164: Rudimentary spelling fixes in the file saa7164-t=
ypes.h
      media: atomisp: fix a typo
      media: entity: A typo fix
      media: cx88: Fix a typo

Brad Love (4):
      media: em28xx: Add pid for bulk revision of Hauppauge 461e
      media: em28xx: Add pid for bulk revision of Hauppauge 461eV2
      media: cx23885: add more quirks for reset DMA on some AMD IOMMU
      media: cx23885: Fix various Hauppauge device analog capture inputs

Bryan O'Donoghue (12):
      media: venus: core, venc, vdec: Fix probe dependency error
      media: venus: Update v6 buffer descriptors
      media: venus: core: add sm8250 DT compatible and resource data
      media: venus: core: Add io base variables for each block
      media: venus: hfi,pm,firmware: Convert to block relative addressing
      media: venus: core: Add differentiator IS_V6(core)
      media: venus: core: Add an io base for TZ wrapper regs
      media: venus: core: Add an io base for AON regs
      media: venus: core: Hook to V6 base registers when appropriate
      media: venus: hfi: Read WRAPPER_TZ_CPU_STATUS_V6 on 6xx
      media: venus: hfi, vdec: v6 Add IS_V6() to existing IS_V4() if locati=
ons
      media: venus: pm: Hook 6xx pm ops into 4xx pm ops

Christian Hewitt (2):
      media: rc: add keymap for minix-neo remote
      media: rc: add keymaps for mecool-kii-pro/kiii-pro remotes

Christophe JAILLET (7):
      media: ngene: switch from 'pci_' to 'dma_' API
      media: venus: core: Fix some resource leaks in the error path of 'ven=
us_probe()'
      media: cx25821: switch from 'pci_' to 'dma_' API
      media: mantis: switch from 'pci_' to 'dma_' API
      media: cx23885: switch from 'pci_' to 'dma_' API
      media: tw686x: switch from 'pci_' to 'dma_' API
      media: tw68: switch from 'pci_' to 'dma_' API

Colin Ian King (9):
      media: platform: sti: make a const arrays static, makes object smaller
      media: vivid: fix assignment of dev->fbuf_out_flags
      media: drxj: remove redundant assignments to variable image_to_select
      media: [next] staging: media: atomisp: fix memory leak of object flash
      media: m88rs6000t: avoid potential out-of-bounds reads on arrays
      media: imx-jpeg: Fix spelling mistake "Canot" -> "Cannot"
      media: imx-jpeg: Pass the v4l2_jpeg_header header argument by referen=
ce
      media: dvb-frontends: Remove redundant error check on variable ret
      media: venus: core,pm: fix potential infinite loop

Dafna Hirschfeld (4):
      media: rkisp1: params: remove extra 'if' conditions
      media: rkisp1: rsz: crash fix when setting src format
      media: rkisp1: uapi: document which flags/structs relate to statistic=
s config
      media: rkisp1: params: fix wrong bits settings

Dan Carpenter (1):
      media: atomisp: Fix use after free in atomisp_alloc_css_stat_bufs()

Daniel Almeida (1):
      media: rkvdec: Do not require all controls to be present in every req=
uest

Daniel Niv (1):
      media: media/saa7164: fix saa7164_encoder_register() memory leak bugs

Daniel W. S. Almeida (1):
      media: dvb-frontends: lgdt3306a.c: remove dead code

Daode Huang (1):
      media: rc/ite-cir: replace spin_lock_irqsave by spin_lock in hard IRQ

Davidlohr Bueso (1):
      media: media/siano: kill pointless kmutex definitions

Dikshita Agarwal (16):
      media: v4l2-ctrl: add controls for long term reference.
      media: venus: venc: Add support for Long Term Reference (LTR) controls
      media: venus: hfi: Define block offsets for V6 hardware
      media: venus: hfi: Define additional 6xx registers
      media: venus: hfi: Add a 6xx boot logic
      media: venus: hfi: Add 6xx interrupt support
      media: venus: core,pm: Vote for min clk freq during venus boot
      media: venus: hfi: Add 6xx AXI halt logic
      media: venus: pm: Toggle 6xx wrapper power in vcodec_control
      media: venus: firmware: Do not toggle WRAPPER_A9SS_SW_RESET on 6xx
      media: venus: helpers: Add internal buffer list for v6
      media: venus: helpers, hfi, vdec: Set actual plane constraints to FW
      media: venus: hfi: Increase plat_buf_v6 o/p buffer count.
      media: venus: helper: Decide work mode
      media: venus: Fix internal buffer size calculations for v6.
      media: venus : hfi: add venus image info into smem

Ding Xiang (1):
      media: atomisp: remove redundant NULL check of "params"

Dinghao Liu (2):
      media: platform: sti: Fix runtime PM imbalance in regs_show
      media: sun8i-di: Fix runtime PM imbalance in deinterlace_start_stream=
ing

Dmitry Baryshkov (1):
      media: venus: core: correct firmware name for sm8250

Ezequiel Garcia (10):
      media: uapi: vp8: Remove "header" from symbol names and macros
      media: uapi: vp8: Rename v4l2_vp8_loopfilter to v4l2_vp8_loop_filter
      media: uapi: vp8: Add proper kernel-doc documentation
      media: uapi: Move parsed VP8 pixel format out of staging
      media: uapi: Move the VP8 stateless control type out of staging
      media: controls: Log VP8 stateless control in .std_log
      media: vp8: Rename V4L2 VP8 specific macro to V4L2_VP8_
      media: uapi: move VP8 stateless controls out of staging
      media: uapi: vp8: Fix kernel-doc warnings
      media: hantro: fix kernel-doc warnings and style

Fabio Estevam (5):
      media: camera-mx2: Remove unused header file
      media: camera-mx3: Remove unused header file
      media: coda: Remove unneeded of_match_ptr()
      media: rkvdec: Remove of_match_ptr()
      media: imx-pxp: Remove unneeded of_match_ptr()

Fabrizio Castro (4):
      media: MAINTAINERS: Update MAINTAINERS for Renesas DRIF driver
      media: dt-bindings: media: renesas,drif: Convert to json-schema
      media: dt-bindings: media: renesas,drif: Add r8a77990 support
      media: dt-bindings: media: renesas,drif: Add r8a77965 support

Filip Kolev (1):
      media: atomisp: ov2722: remove unnecessary debug print

Gary Yao (1):
      media: staging: media: atomisp: clean up block comment style issues

Geert Uytterhoeven (1):
      media: VIDEO_IMX8_JPEG should depend on ARCH_MXC and not default to m

Hans Verkuil (54):
      media: fix incorrect kernel doc usages
      media: vim2m: initialize the media device earlier
      media: ext-ctrls-codec.rst: clarify V4L2_CID_MPEG_VIDEO_BITRATE
      media: core headers: fix kernel-doc warnings
      media: media/pci: fix kerneldoc issues in two headers
      media: media/i2c: fix kerneldoc issues for media i2c headers
      media: vpbe_osd.h/uvcvideo.h includes: fix trivial kernel-doc warnings
      media: media tuner headers: fix kernel-doc warnings
      media: cec/core/cec-notifier: use IS_REACHABLE(CONFIG_I2C)
      media: media/usb/gspca/w996Xcf.c: /** -> /*
      media: v4l2-dev.c: show which events are requested by poll()
      media: v4l2-ioctl.c: fix timestamp format
      media: gspca/sq905.c: fix uninitialized variable
      media: v4l2-ctrls.c: initialize flags field of p_fwht_params
      media: ext-ctrls-codec.rst: fix typos
      media: media/usb: fix kernel-doc header issues
      media: tegra-video/csi.h: fix kernel-doc mistake
      media: exynos-gsc/exynos4-is: add missing 'struct' to kerneldoc
      media: s5p-jpeg: fix kernel-doc warnings
      media: ti-vpe/cal.h: fix kernel-doc formatting
      media: rcar-vin/rcar-vin.h: fix kernel-doc formatting
      media: media/platform/sti: fix kernel-doc formatting
      media: vsp1/vsp1_drm.h: add missing 'struct' kernel-doc keyword
      media: staging: media: hantro: fix kernel-doc formatting
      media: staging: media: ipu3: add missing kernel-doc 'struct' keywords
      media: staging: media: meson: vdec: fix kernel-doc warning
      media: mtk-jpeg/mtk_jpeg_core.h: fix kernel-doc warnings
      media: mtk-mdp: fix kernel-doc warnings
      media: mtk-vcodec: fix kernel-doc warnings
      media: mtk-vpu/mtk_vpu.h: fix kernel-doc warnings
      media: vidioc-g-ext-ctrls.rst: reformat tables and clarify which vs c=
trl_class
      media: buffer.rst: fix incorrect :c:type
      media: adv7604: writing a one-block EDID failed
      media: allegro-dvt/nal-h264.h: fix kernel-doc: hdr -> hrd
      media: s3c-camif/camif-core.h: fix kernel-doc warnings
      media: s5p-jpeg/jpeg-core.h: fix kernel-doc warnings
      media: exynos-gsc/gsc-core.h: fix kernel-doc warnings
      media: exynos4-is: fix kernel-doc warnings
      media: s5p-mfc/s5p_mfc_common.h: fix kernel-doc warnings
      media: cobalt: fix initial EDID
      media: vivid: update EDID
      media: i2c/ccs: fix kernel-doc header issues
      media: vivid: add read-only int32 control
      media: v4l2-ctrls.c: fix race condition in hdl->requests list
      media: cec/core: clarify rx-arb-lost usage message
      media: adv7604: fix HPD support for adv7611/12
      media: adv7604: support EDIDs up to 4 blocks
      media: adv7511-v4l2: correctly report EDIDs of 1 block
      media: cobalt: drop static for sd_fmt
      media: allegro: change kernel-doc comment blocks to normal comments
      media: adv7842: configure all pads
      media: adv7842: support 1 block EDIDs, fix clearing EDID
      media: gscpa/stv06xx: fix memory leak
      media: v4l2-ctrls: fix reference to freed memory

Hao Fang (1):
      media: rc: ir-hix5hd2: use the correct HiSilicon copyright

Irui Wang (2):
      media: dt-bindings: media: mtk-vcodec: Separating mtk vcodec encoder =
node
      media: mtk-vcodec: Separating mtk encoder driver

Jacopo Mondi (1):
      media: i2c: rdamc21: Fix warning on u8 cast

Jae Hyun Yoo (1):
      media: aspeed: fix clock handling logic

Jernej Skrabec (1):
      media: cedrus: Fix H265 status definitions

Jia-Ju Bai (4):
      media: platform: xilinx: fix error return code of xvip_graph_init()
      media: platform: sunxi: sun6i-csi: fix error return code of sun6i_vid=
eo_start_streaming()
      media: tuners: fix error return code of hybrid_tuner_request_state()
      media: i2c: imx274: fix error return code of imx274_s_frame_interval()

Jiapeng Chong (2):
      media: ti-vpe: Simplify bool comparison
      media: mxl692: remove impossible condition

Jiri Slaby (1):
      media: atomisp: do not free kmalloc memory by vfree

Johan Fjeldtvedt (1):
      media: cec-notifier: also search for HDMI devices on I2C

Jonathan Neusch=C3=A4fer (1):
      media: dvbdev: Switch to new kerneldoc syntax for named variable macr=
o argument

Julia Lawall (2):
      media: use getter/setter functions
      media: flexcop-usb: delete unneeded return

Julian Braha (1):
      media: drivers: media: pci: sta2x11: fix Kconfig dependency on GPIOLIB

Kaixu Xia (2):
      media: atomisp: make atomisp_css_stop() void
      media: atomisp: make atomisp_css_continuous_set_num_raw_frames() void

Krzysztof Kozlowski (2):
      media: atomisp: do not select COMMON_CLK to fix builds
      media: i2c: imx258: add HDR control

Lad Prabhakar (2):
      media: i2c: imx219: Move out locking/unlocking of vflip and hflip con=
trols from imx219_set_stream
      media: i2c: imx219: Balance runtime PM use-count

Laurent Pinchart (84):
      media: imx: Drop dependency on I2C
      media: imx: Move dependency on VIDEO_DEV to common Kconfig symbol
      media: imx: Drop manual dependency on VIDEO_IMX_MEDIA
      media: imx: Compile imx6-media-objs only for CONFIG_VIDEO_IMX_CSI
      media: imx: Set default sizes through macros in all drivers
      media: imx: utils: Add ability to filter pixel formats by mbus code
      media: imx: capture: Use dev_* instead of v4l2_* to log messages
      media: imx: capture: Use device name to construct bus_info
      media: imx: capture: Remove forward declaration of capture_qops
      media: imx: capture: Handle errors from v4l2_fh_open()
      media: imx: capture: Clean up capture_priv structure
      media: imx: capture: Remove capture_priv stop field
      media: imx: capture: Move queue and ctrl handler init to init function
      media: imx: capture: Initialize video_device programmatically
      media: imx: capture: Register the video device after completing init
      media: imx: capture: Store v4l2_pix_format in imx_media_video_dev
      media: imx: capture: Move default format init to a separate function
      media: imx: capture: Rename querycap handler to capture_querycap
      media: imx: capture: Rename ioctl operations with legacy prefix
      media: imx: capture: Add a mechanism to disable control inheritance
      media: imx: capture: Remove unneeded variable in __capture_legacy_try=
_fmt
      media: imx: capture: Pass v4l2_pix_format to __capture_legacy_try_fmt=
()
      media: imx: capture: Return -EPIPE from __capture_legacy_try_fmt()
      media: imx: capture: Extract format lookup from __capture_legacy_try_=
fmt
      media: imx: capture: Simplify capture_validate_fmt() implementation
      media: imx: capture: Simplify __capture_legacy_try_fmt()
      media: imx: capture: Decouple video node from source with MC-centric =
API
      media: imx: capture: Expose V4L2_CAP_IO_MC for the MC-centric API
      media: imx: imx7-media-csi: Disable legacy video node API
      media: imx: capture: Support creating immutable link to capture device
      media: imx: imx7-media-csi: Remove control handler
      media: imx: imx7-media-csi: Move (de)init from link setup to .s_strea=
m()
      media: imx: imx7-media-csi: Create immutable link to capture device
      media: imx: imx7-media-csi: Replace CSICR*_RESET_VAL with values
      media: imx: imx7-media-csi: Tidy up register fields macros
      media: imx: imx7-media-csi: Reorganize code in sections
      media: imx: imx7-media-csi: Validate capture format in .link_validate=
()
      media: imx: imx7-media-csi: Fix source type identification
      media: imx: imx7-media-csi: Don't lock access to is_csi2
      media: imx: imx7-media-csi: Rename imx7_csi_dma_start() to *_setup()
      media: imx: imx7-media-csi: Split imx7_csi_dma_stop()
      media: imx: imx7-media-csi: Move CSI configuration before source start
      media: imx: imx7-media-csi: Merge streaming_start() with csi_enable()
      media: imx: imx7-media-csi: Merge hw_reset() with init_interface()
      media: imx: imx7-media-csi: Set the MIPI data type based on the bus c=
ode
      media: imx: imx7-media-csi: Don't set the buffer stride when disabling
      media: imx: imx7-media-csi: Merge all config in imx7_csi_configure()
      media: imx: imx7-media-csi: Clear all configurable CSICR18 fields
      media: imx: imx7-media-csi: Set RFF burst type in imx7_csi_configure()
      media: imx: imx7-media-csi: Simplify imx7_csi_rx_fifo_clear()
      media: imx: imx7-media-csi: Don't double-enable the CSI
      media: imx: imx7-media-csi: Don't double-enable the RxFIFO
      media: imx: imx7-media-csi: Remove double reflash of DMA controller
      media: imx: imx7-media-csi: Don't enable SOF and EOF interrupts
      media: imx: imx7_media-csi: Add support for additional Bayer patterns
      media: v4l2-mc: Add link flags to v4l2_create_fwnode_links_to_pad()
      media: imx: imx7_media-csi: Create immutable link to source device
      media: imx: imx7_mipi_csis: Acquire reset control without naming it
      media: imx: imx7_mipi_csis: Fix input size alignment
      media: imx: imx7_mipi_csis: Make source .s_power() optional
      media: imx: imx7_mipi_csis: Avoid double get of wrap clock
      media: imx: imx7_mipi_csis: Drop 10-bit YUV support
      media: imx: imx7_mipi_csis: Fix UYVY8 media bus format
      media: imx: imx7_mipi_csis: Inline mipi_csis_set_hsync_settle()
      media: imx: imx7_mipi_csis: Move link setup check out of locked secti=
on
      media: imx: imx7_mipi_csis: Calculate Ths_settle from source lane rate
      media: imx: imx7_mipi_csis: Turn register access macros into functions
      media: imx: imx7_mipi_csis: Fully initialize MIPI_CSIS_DPHYCTRL regis=
ter
      media: imx: imx7_mipi_csis: Define macros for DPHY_BCTRL_L fields
      media: imx: imx7_mipi_csis: Make ISP registers macros take channel ID
      media: imx: imx7_mipi_csis: Rename register macros to match datasheet
      media: imx: imx7_mipi_csis: Use register macros in mipi_csis_dump_reg=
s()
      media: imx: imx7_mipi_csis: Print shadow registers in mipi_csis_dump_=
regs()
      media: ti-vpe: cal: Implement media controller centric API
      media: dt-bindings: media: nxp,imx7-mipi-csi2: Drop the reset-names p=
roperty
      media: dt-bindings: media: nxp,imx7-mipi-csi2: Drop fsl,csis-hs-settl=
e property
      media: dt-bindings: media: nxp,imx7-mipi-csi2: Indent example with 4 =
spaces
      media: dt-bindings: media: nxp,imx7-mipi-csi2: Expand descriptions
      media: imx: imx7_mipi_csis: Runtime suspend in .s_stream() error path
      media: imx: imx7_mipi_csis: Don't take state->lock in .link_setup()
      media: imx: imx7_mipi_csis: Ensure pads are connected
      media: uvcvideo: Fix XU id print in forward scan
      media: uvcvideo: Support devices that report an OT as an entity source
      media: staging: ipu3: uapi: Add "WITH Linux-syscall-note" license

Leonid Kushnir (3):
      media: staging: atomisp: Fixed allignment to match open parenthesis
      media: staging: atomisp: Removed else branch in function
      media: staging: atomisp: Corrected error handling in function

Liu Shixin (1):
      media: anysee: simplify the return expression of anysee_ci_* function

Liu Ying (1):
      media: docs: Fix data organization of MEDIA_BUS_FMT_RGB101010_1X30

Mansur Alisha Shaik (1):
      media: venus: fix hw overload error log condition

Marco Felsch (1):
      media: coda: fix macroblocks count control usage

Mauro Carvalho Chehab (50):
      media: colorspaces-details.rst: drop tabularcolumns
      media: control.rst: use a table for V4L2_CID_POWER_LINE
      media: docs: sliced-vbi: fix V4L2_SLICED_WSS_625 docs
      media: ext-ctrls-codec-stateless.rst: change a FWHT flag description
      media: ext-ctrls-codec.rst: add a missing profile description
      media: ext-ctrls-codec.rst: simplify a few tables
      media: ext-ctrls-jpeg.rst: cleanup V4L2_CID_JPEG_COMPRESSION_QUALITY =
text
      media: docs: pixfmt: use section titles for bayer formats
      media: buffer.rst: fix a PDF output issue
      media: ext-ctrls-codec-stateless.rst: fix an H-264 table format
      media: pixfmt-yuv-planar.rst: fix PDF OUTPUT
      media: docs: uAPI: fix table output in LaTeX/PDF format
      media: dev-overlay.rst: cleanup the xvideo example
      media: vbi_hsync.svg: fix the viewports
      media: v4l docs: move some cross-reference identifiers
      atomisp: don't let it go past pipes array
      media: add a subsystem profile documentation
      media: dvb_frontend: move algo-specific settings to a function
      media: dvb_frontend: don't call dvb_frontend_get_stepsize() twice
      media: dvb_frontend: warn if frontend driver has API issues
      media: camera-sensor.rst: fix a doc build warning
      atomisp: remove a now unused var
      media: camera-sensor.rst: fix c:function build warning
      dt-bindings: iommu: mediatek: update mediatek,iommu.yaml references
      dt-bindings: i3c: update i3c.yaml references
      MAINTAINERS: update adi,ad5758.yaml reference
      MAINTAINERS: update ste,mcde.yaml reference
      MAINTAINERS: update brcm,bcm-v3d.yaml reference
      MAINTAINERS: update fsl,dpaa2-console.yaml reference
      MAINTAINERS: update st,hts221.yaml reference
      MAINTAINERS: update dpot-dac.yaml reference
      MAINTAINERS: update envelope-detector.yaml reference
      MAINTAINERS: update current-sense-amplifier.yaml reference
      MAINTAINERS: update current-sense-shunt.yaml reference
      MAINTAINERS: update voltage-divider.yaml reference
      MAINTAINERS: update invensense,mpu3050.yaml reference
      MAINTAINERS: update mtk-sd.yaml reference
      MAINTAINERS: update atmel,sama5d2-adc.yaml reference
      MAINTAINERS: update pni,rm3100.yaml reference
      MAINTAINERS: update renesas,rcar-gyroadc.yaml reference
      MAINTAINERS: update st,lsm6dsx.yaml reference
      MAINTAINERS: update st,vl53l0x.yaml reference
      MAINTAINERS: update snps,dw-axi-dmac.yaml reference
      MAINTAINERS: update ti,dac7612.yaml reference
      dt-bindings:iio:dac: update microchip,mcp4725.yaml reference
      doc: update rcu_dereference.rst reference
      MAINTAINERS: update imi,rdacm2x-gmsl.yaml reference
      MAINTAINERS: update ovti,ov2680.yaml reference
      media: venus: use NULL instead of zero for pointers
      media: venus: don't de-reference NULL pointers at IRQ time

Mirela Rabulea (8):
      media: v4l: Add packed YUV444 24bpp pixel format
      media: dt-bindings: Add bindings for i.MX8QXP/QM JPEG driver
      media: Add parsing for APP14 data segment in jpeg helpers
      media: Quit parsing stream if doesn't start with SOI
      media: Avoid parsing quantization and huffman tables
      media: imx-jpeg: Add V4L2 driver for i.MX8 JPEG Encoder/Decoder
      media: Add maintainer for IMX jpeg v4l2 driver
      media: imx-jpeg: Fix double free in mxc_jpeg_remove

Muhammad Usama Anjum (2):
      media: em28xx: fix memory leak
      media: staging: media/meson: remove redundant dev_err call

Necip Fazil Yildiran (1):
      media: mantis: remove orphan mantis_core.c

Neil Armstrong (1):
      media: meson-ge2d: fix rotation parameters

Nicolas Dufresne (1):
      media: doc: h264/hevc: Clarify _START_CODE_NONE meaning

Nicolas Stuardo Diaz (1):
      media: media/siano: Fix transmission parameters reporting for ISDB-T

Nikolay Kyx (2):
      media: staging: media: ipu3: code style fix - missing a blank line af=
ter declarations
      media: staging: media: omap4iss: code style - avoid macro argument pr=
ecedence issues

Pavel Skripkin (2):
      media: drivers/media/usb: fix memory leak in zr364xx_probe
      media: dvb-usb: fix memory leak in dvb_usb_adapter_init

Peilin Ye (1):
      media: dvbdev: Fix memory leak in dvb_media_device_free()

Philipp Gerlesberger (10):
      media: atomisp: Convert comments to C99 initializers
      media: atomisp: Fix Block Comments
      media: atomisp: Fix EMBEDDED_FUNCTION_NAME warning
      media: atomisp: Fix OPEN_ENDED_LINE
      media: atomisp: Fix overlong line
      media: atomisp: Fix funciton decleration
      media: atomisp: Delete braces
      media: atomisp: Fix PARENTHESIS_ALIGNMENT
      media: atomisp: Fix BLOCK_COMMENT_STYLE
      media: atomisp: Write function decleration in one line

Qinglang Miao (1):
      media: ngene: simplify the return expression of eeprom_write_ushort()

Ricardo Ribalda (5):
      media: videobuf2: Explicitly state max size of planes
      media: videobuf2: Exit promptly if size =3D 0
      media: staging/intel-ipu3: Fix set_fmt error handling
      media: staging/intel-ipu3: Fix memory leak in imu_fmt
      media: staging/intel-ipu3: Fix race condition during set_fmt

Rikard Falkeborn (1):
      media: usbtv: constify static structs

Robert Foss (19):
      media: camss: Fix vfe_isr_comp_done() documentation
      media: camss: Fix vfe_isr comment typo
      media: camss: Replace trace_printk() with dev_dbg()
      media: camss: Add CAMSS_845 camss version
      media: camss: Make ISPIF subdevice optional
      media: camss: Refactor VFE HW version support
      media: camss: Add support for VFE hardware version Titan 170
      media: camss: Add missing format identifiers
      media: camss: Refactor CSID HW version support
      media: camss: Add support for CSID hardware version Titan 170
      media: camss: Add support for CSIPHY hardware version Titan 170
      media: camss: Refactor VFE power domain toggling
      media: camss: Enable SDM845
      media: dt-bindings: media: camss: Add qcom,msm8916-camss binding
      media: dt-bindings: media: camss: Add qcom,msm8996-camss binding
      media: dt-bindings: media: camss: Add qcom,sdm660-camss binding
      media: dt-bindings: media: camss: Add qcom,sdm845-camss binding
      media: MAINTAINERS: Change CAMSS documentation to use dtschema bindin=
gs
      media: dt-bindings: media: Remove qcom,camss documentation

Sakari Ailus (8):
      media: ccs: Fix sub-device function
      media: ipu3-cio2: Fix pixel-rate derived link frequency
      media: omap3isp: Acquire graph mutex for graph traversal
      media: omap4iss: Acquire graph mutex for graph traversal
      media: entity: Add lockdep check to media graph walk
      media: v4l: fwnode: Rename and make static V4L2 async notifier helper
      media: v4l: fwnode: Rename v4l2_async_register_subdev_sensor_common
      media: staging: ipu3-imgu: No need for kernel-doc comments in driver =
struct

Sean Young (8):
      media: ite-cir: remove unused fields
      media: ite-cir: set parent device
      media: ite-cir: use standard logging and reduce noise
      media: ite-cir: carrier and duty cycle can be set via ioctl
      media: ite-cir: move runtime information into driver data
      media: ite-cir: check for receive overflow
      media: ite-cir: in_use is not needed
      media: ite-cir: probe of ITE8708 on ASUS PN50 fails

Souptick Joarder (1):
      media: atomisp: Fixed error handling path

Stanimir Varbanov (24):
      media: v4l2-ctrl: Make display delay and display enable std controls
      media: venus: vdec: Add support for display delay and delay enable co=
ntrols
      media: s5p-mfc: Use display delay and display enable std controls
      media: docs: Deprecate mfc display delay controls
      media: v4l2-ctrls: Add control for AUD generation
      media: venus: venc: Add support for AUD NALU control
      media: venus: core: Parse firmware-name DT property
      media: v4l2-ctrls: Fix h264 hierarchical coding type menu ctrl
      media: venus: core: Drop second v4l2 device unregister
      media: venus: hfi_parser: Don't initialize parser on v1
      media: venus: hfi_parser: Check for instance after hfi platform get
      media: venus: pm_helpers: Set opp clock name for v1
      media: venus: venc_ctrls: Change default header mode
      media: venus: hfi_cmds: Support plane-actual-info property from v1
      media: v4l2-ctrl: Add decoder conceal color control
      media: venus: vdec: Add support for conceal control
      media: v4l: Add new Colorimetry Class
      media: docs: Document colorimetry class
      media: v4l: Add HDR10 static metadata controls
      media: docs: Document CLL and Mastering display colorimetry controls
      media: venus: venc: Add support for CLL and Mastering display controls
      media: venus: core,pm: Add handling for resets
      media: venus: vdec: Fix decoder cmd STOP issue
      media: venus: core: Fix kerneldoc warnings

Stephen Boyd (1):
      media: venus: Include io.h for memremap()

Sylwester Nawrocki (2):
      media: exynos4-is: Fix kernel-doc entries in fimc-is.h
      media: s5p-mfc: Fix kernel-doc entries in s5p_mfc_common.h

Takashi Iwai (2):
      media: dvb-usb: Fix memory leak at error in dvb_usb_device_init()
      media: dvb-usb: Fix use-after-free access

Tasos Sahanidis (2):
      media: saa7134: use sg_dma_len when building pgtable
      media: saa7146: use sg_dma_len when building pgtable

Tian Tao (1):
      media: cx25821: remove unused including <linux/version.h>

Tom Rix (2):
      media: b2c2: remove trailing semicolon in macro definition
      media: s5k5baf: remove trailing semicolon in macro definition

Tomi Valkeinen (3):
      media: v4l2-subdev.rst: typo fix
      media: ti-vpe: cal: remove unneeded assignment
      media: ti-vpe: cal: fix subdev mbus_code enumeration

Tong Zhang (1):
      media: atomisp: auto-select VIDEO_V4L2_SUBDEV_API

Vikash Garodia (1):
      media: venus: helpers: keep max bandwidth when mbps exceeds the suppo=
rted range

Vladimir Lypak (1):
      media: qcom: camss: Fix overflows in clock rate calculations

Wan Jiabing (2):
      media: cx231xx/cx231xx.h: Remove repeated struct declaration
      media: em28xx/em28xx.h: Remove duplicate struct declaration

Wei Yongjun (3):
      media: m88ds3103: fix return value check in m88ds3103_probe()
      media: imx-jpeg: Fix error return code in mxc_jpeg_probe()
      media: imx-jpeg: Fix return value check in mxc_jpeg_attach_pm_domains=
()

Wolfram Sang (2):
      media: i2c: adv7511: remove open coded version of SMBus block read
      media: i2c: adv7842: remove open coded version of SMBus block write

Xiaofeng Cao (3):
      media: Correct 'so'
      media: radio-si476x: rectify spelling and grammar
      media: drivers/media/pci/bt8xx/bttv-cards: fix typos

Xu Wang (2):
      media: atomisp: Remove redundant NULL check
      media: atomisp: Remove redundant NULL check

Yang Li (6):
      media: solo6x10: Switch to using the new API kobj_to_dev()
      media: exynos4-is: add missing call to of_node_put()
      media: atomisp: remove redundant NULL check
      media: atomisp: remove redundant NULL check
      media: i2c: remove unneeded semicolon
      media: i2c: remove unneeded variable 'ret'

Yang Yingliang (12):
      media: omap4iss: return error code when omap4iss_get() failed
      media: imx-pxp: remove redundant dev_err call in pxp_probe()
      media: ti-vpe: csc: remove redundant dev_err call in csc_create()
      media: ti-vpe: sc: remove redundant dev_err call in sc_create()
      media: camss: csiphy: Remove redundant dev_err call in msm_csiphy_sub=
dev_init()
      media: camss: csid: Remove redundant dev_err call in msm_csid_subdev_=
init()
      media: tc358743: fix possible use-after-free in tc358743_remove()
      media: adv7604: fix possible use-after-free in adv76xx_remove()
      media: i2c: adv7511-v4l2: fix possible use-after-free in adv7511_remo=
ve()
      media: i2c: tda1997: Fix possible use-after-free in tda1997x_remove()
      media: i2c: adv7842: fix possible use-after-free in adv7842_remove()
      media: camss: ispif: Remove redundant dev_err call in msm_ispif_subde=
v_init()

Zhang Yunkai (2):
      media: vidtv: remove duplicate include in vidtv_psi
      media: atomisp: remove duplicate include in sh_css

Zhansaya Bagdauletkyzy (7):
      media: staging: media: zoran: Rename 'HEnd' to 'h_end'
      media: staging: media: zoran: Rename 'VEnd' to 'v_end'
      media: staging: media: zoran: Rename 'DispMode' to 'disp_mode'
      media: staging: media: zoran: Rename 'VidWinWid' to 'vid_win_wid'
      media: staging: media: zoran: Rename 'VidWinHt' to 'vid_win_ht'
      media: staging: media: zoran: Rename 'We' to 'we'
      media: staging: media: zoran: Rename 'He' to 'he'

dingsenjie (2):
      media: media/usb:Remove superfluous "breaks"
      media: media/usb:Remove superfluous "breaks" in the ttusb_dec.c

karthik alapati (1):
      media: staging: media/atomisp: don't compile unused code

zuoqilin (2):
      media: media/i2c: remove unneeded variable: "ret"
      media: media/pci/pt1: Assign value when defining variables

 .../bindings/display/mediatek/mediatek,disp.txt    |    2 +-
 .../devicetree/bindings/i3c/cdns,i3c-master.txt    |    6 +-
 .../devicetree/bindings/i3c/snps,dw-i3c-master.txt |    6 +-
 .../bindings/media/allwinner,sun4i-a10-ir.yaml     |   16 +-
 .../bindings/media/mediatek-jpeg-decoder.txt       |    2 +-
 .../bindings/media/mediatek-jpeg-encoder.txt       |    2 +-
 .../devicetree/bindings/media/mediatek-mdp.txt     |    2 +-
 .../devicetree/bindings/media/mediatek-vcodec.txt  |   57 +-
 .../bindings/media/nxp,imx7-mipi-csi2.yaml         |  108 +-
 .../devicetree/bindings/media/nxp,imx8-jpeg.yaml   |   84 +
 .../devicetree/bindings/media/qcom,camss.txt       |  236 ---
 .../bindings/media/qcom,msm8916-camss.yaml         |  256 +++
 .../bindings/media/qcom,msm8996-camss.yaml         |  387 ++++
 .../bindings/media/qcom,sdm660-camss.yaml          |  398 ++++
 .../bindings/media/qcom,sdm845-camss.yaml          |  371 ++++
 Documentation/devicetree/bindings/media/rc.yaml    |    4 +
 .../devicetree/bindings/media/renesas,drif.txt     |  177 --
 .../devicetree/bindings/media/renesas,drif.yaml    |  279 +++
 .../devicetree/bindings/media/zx-irdec.txt         |   14 -
 Documentation/driver-api/media/camera-sensor.rst   |    3 +-
 Documentation/driver-api/media/index.rst           |    2 +
 .../driver-api/media/maintainer-entry-profile.rst  |  206 ++
 Documentation/driver-api/media/v4l2-subdev.rst     |    4 +-
 .../maintainer/maintainer-entry-profile.rst        |    1 +
 .../media/cec/cec-ioc-adap-g-caps.rst              |    4 +-
 .../media/cec/cec-ioc-adap-g-conn-info.rst         |    6 +-
 .../media/cec/cec-ioc-adap-g-log-addrs.rst         |   12 +-
 .../userspace-api/media/cec/cec-ioc-dqevent.rst    |   10 +-
 .../userspace-api/media/cec/cec-ioc-g-mode.rst     |    4 +-
 .../userspace-api/media/cec/cec-ioc-receive.rst    |    8 +-
 .../userspace-api/media/cec/cec-pin-error-inj.rst  |    2 +-
 .../userspace-api/media/dvb/fe-type-t.rst          |    2 +-
 .../media/mediactl/media-ioc-device-info.rst       |    2 +-
 .../media/mediactl/media-ioc-enum-entities.rst     |    2 +-
 .../media/mediactl/media-ioc-enum-links.rst        |    6 +-
 .../media/mediactl/media-ioc-g-topology.rst        |   12 +-
 .../userspace-api/media/mediactl/media-types.rst   |    4 +-
 Documentation/userspace-api/media/rc/rc-tables.rst |    2 +-
 Documentation/userspace-api/media/v4l/buffer.rst   |   22 +-
 .../media/v4l/colorspaces-details.rst              |   31 -
 Documentation/userspace-api/media/v4l/common.rst   |    1 +
 Documentation/userspace-api/media/v4l/control.rst  |   13 +-
 Documentation/userspace-api/media/v4l/dev-meta.rst |    2 +-
 .../userspace-api/media/v4l/dev-overlay.rst        |    9 +-
 .../userspace-api/media/v4l/dev-raw-vbi.rst        |    4 +-
 Documentation/userspace-api/media/v4l/dev-rds.rst  |    4 +-
 Documentation/userspace-api/media/v4l/dev-sdr.rst  |    2 +-
 .../userspace-api/media/v4l/dev-sliced-vbi.rst     |   50 +-
 .../userspace-api/media/v4l/dev-subdev.rst         |    6 +-
 Documentation/userspace-api/media/v4l/diff-v4l.rst |   10 +-
 .../userspace-api/media/v4l/ext-ctrls-camera.rst   |   14 +-
 .../media/v4l/ext-ctrls-codec-stateless.rst        |  519 ++++-
 .../userspace-api/media/v4l/ext-ctrls-codec.rst    |  672 +++----
 .../media/v4l/ext-ctrls-colorimetry.rst            |   93 +
 .../userspace-api/media/v4l/ext-ctrls-dv.rst       |    2 +-
 .../userspace-api/media/v4l/ext-ctrls-flash.rst    |    7 +-
 .../userspace-api/media/v4l/ext-ctrls-jpeg.rst     |   13 +-
 .../userspace-api/media/v4l/field-order.rst        |    2 +-
 .../userspace-api/media/v4l/pixfmt-compressed.rst  |   27 +-
 .../userspace-api/media/v4l/pixfmt-packed-yuv.rst  |   36 +-
 .../userspace-api/media/v4l/pixfmt-reserved.rst    |   10 +-
 .../userspace-api/media/v4l/pixfmt-rgb.rst         |    9 +-
 .../media/v4l/pixfmt-srggb10-ipu3.rst              |   12 +-
 .../userspace-api/media/v4l/pixfmt-srggb10p.rst    |    2 +-
 .../userspace-api/media/v4l/pixfmt-srggb12p.rst    |    2 +-
 .../userspace-api/media/v4l/pixfmt-srggb14.rst     |    2 +
 .../userspace-api/media/v4l/pixfmt-srggb14p.rst    |    6 +-
 .../userspace-api/media/v4l/pixfmt-srggb16.rst     |    2 +
 .../userspace-api/media/v4l/pixfmt-srggb8.rst      |    3 +-
 .../userspace-api/media/v4l/pixfmt-v4l2-mplane.rst |    4 +-
 .../userspace-api/media/v4l/pixfmt-v4l2.rst        |    4 +-
 .../userspace-api/media/v4l/pixfmt-yuv-luma.rst    |   10 +
 .../userspace-api/media/v4l/pixfmt-yuv-planar.rst  |   34 +-
 .../userspace-api/media/v4l/subdev-formats.rst     |   30 +-
 .../media/v4l/v4l2-selection-flags.rst             |   14 +-
 .../media/v4l/v4l2-selection-targets.rst           |   12 +-
 Documentation/userspace-api/media/v4l/vbi_525.svg  |    4 +-
 Documentation/userspace-api/media/v4l/vbi_625.svg  |    4 +-
 .../userspace-api/media/v4l/vbi_hsync.svg          |    4 +-
 .../userspace-api/media/v4l/vidioc-create-bufs.rst |    2 +-
 .../userspace-api/media/v4l/vidioc-cropcap.rst     |    4 +-
 .../media/v4l/vidioc-dbg-g-chip-info.rst           |    6 +-
 .../media/v4l/vidioc-dbg-g-register.rst            |    4 +-
 .../userspace-api/media/v4l/vidioc-decoder-cmd.rst |    6 +-
 .../userspace-api/media/v4l/vidioc-dqevent.rst     |   21 +-
 .../media/v4l/vidioc-dv-timings-cap.rst            |    6 +-
 .../userspace-api/media/v4l/vidioc-encoder-cmd.rst |    6 +-
 .../media/v4l/vidioc-enum-dv-timings.rst           |    2 +-
 .../userspace-api/media/v4l/vidioc-enum-fmt.rst    |   10 +-
 .../media/v4l/vidioc-enum-frameintervals.rst       |    7 +-
 .../media/v4l/vidioc-enum-framesizes.rst           |    8 +-
 .../media/v4l/vidioc-enum-freq-bands.rst           |    4 +-
 .../userspace-api/media/v4l/vidioc-enuminput.rst   |    8 +-
 .../userspace-api/media/v4l/vidioc-enumoutput.rst  |    6 +-
 .../userspace-api/media/v4l/vidioc-enumstd.rst     |    6 +-
 .../userspace-api/media/v4l/vidioc-expbuf.rst      |    2 +-
 .../userspace-api/media/v4l/vidioc-g-audio.rst     |    6 +-
 .../userspace-api/media/v4l/vidioc-g-audioout.rst  |    2 +-
 .../userspace-api/media/v4l/vidioc-g-crop.rst      |    2 +-
 .../userspace-api/media/v4l/vidioc-g-ctrl.rst      |    2 +-
 .../media/v4l/vidioc-g-dv-timings.rst              |   18 +-
 .../userspace-api/media/v4l/vidioc-g-edid.rst      |    2 +-
 .../userspace-api/media/v4l/vidioc-g-enc-index.rst |    6 +-
 .../userspace-api/media/v4l/vidioc-g-ext-ctrls.rst |   76 +-
 .../userspace-api/media/v4l/vidioc-g-fbuf.rst      |    6 +-
 .../userspace-api/media/v4l/vidioc-g-fmt.rst       |    2 +-
 .../userspace-api/media/v4l/vidioc-g-frequency.rst |    2 +-
 .../userspace-api/media/v4l/vidioc-g-jpegcomp.rst  |    4 +-
 .../userspace-api/media/v4l/vidioc-g-modulator.rst |    5 +-
 .../userspace-api/media/v4l/vidioc-g-parm.rst      |   11 +-
 .../userspace-api/media/v4l/vidioc-g-priority.rst  |    2 +-
 .../userspace-api/media/v4l/vidioc-g-selection.rst |    2 +-
 .../media/v4l/vidioc-g-sliced-vbi-cap.rst          |   29 +-
 .../userspace-api/media/v4l/vidioc-g-tuner.rst     |   10 +-
 .../userspace-api/media/v4l/vidioc-querycap.rst    |    8 +-
 .../userspace-api/media/v4l/vidioc-queryctrl.rst   |   27 +-
 .../userspace-api/media/v4l/vidioc-reqbufs.rst     |   14 +-
 .../media/v4l/vidioc-s-hw-freq-seek.rst            |    2 +-
 .../v4l/vidioc-subdev-enum-frame-interval.rst      |    2 +-
 .../media/v4l/vidioc-subdev-enum-frame-size.rst    |    2 +-
 .../media/v4l/vidioc-subdev-enum-mbus-code.rst     |   12 +-
 .../media/v4l/vidioc-subdev-g-crop.rst             |    2 +-
 .../media/v4l/vidioc-subdev-g-fmt.rst              |    4 +-
 .../media/v4l/vidioc-subdev-g-frame-interval.rst   |    2 +-
 .../media/v4l/vidioc-subdev-g-selection.rst        |    2 +-
 .../media/v4l/vidioc-subdev-querycap.rst           |    4 +-
 .../media/v4l/vidioc-subscribe-event.rst           |    4 +-
 .../userspace-api/media/videodev2.h.rst.exceptions |    3 +
 MAINTAINERS                                        |   56 +-
 drivers/clk/clk-ast2600.c                          |    4 +-
 drivers/media/Kconfig                              |    2 +-
 drivers/media/cec/core/cec-notifier.c              |   33 +-
 drivers/media/cec/core/cec-pin-error-inj.c         |    2 +-
 drivers/media/common/b2c2/flexcop-hw-filter.c      |    2 +-
 drivers/media/common/b2c2/flexcop.h                |    6 +-
 drivers/media/common/saa7146/saa7146_core.c        |    2 +-
 drivers/media/common/saa7146/saa7146_video.c       |    3 +-
 drivers/media/common/siano/smscoreapi.c            |   42 +-
 drivers/media/common/siano/smscoreapi.h            |    5 -
 drivers/media/common/siano/smsdvb-main.c           |   58 +-
 drivers/media/common/videobuf2/frame_vector.c      |    1 -
 drivers/media/common/videobuf2/videobuf2-dma-sg.c  |    2 +-
 drivers/media/dvb-core/dvb_ca_en50221.c            |   32 +-
 drivers/media/dvb-core/dvb_frontend.c              |   93 +-
 drivers/media/dvb-core/dvbdev.c                    |    1 +
 drivers/media/dvb-frontends/drx39xyj/drxj.c        |    2 +-
 drivers/media/dvb-frontends/lgdt3306a.c            |   38 +-
 drivers/media/dvb-frontends/m88ds3103.c            |    4 +-
 drivers/media/dvb-frontends/mxl692.c               |    2 +-
 drivers/media/i2c/adv748x/adv748x.h                |   10 +-
 drivers/media/i2c/adv7511-v4l2.c                   |   72 +-
 drivers/media/i2c/adv7604.c                        |  118 +-
 drivers/media/i2c/adv7842.c                        |  108 +-
 drivers/media/i2c/ccs/ccs-core.c                   |    6 +-
 drivers/media/i2c/ccs/ccs-data.h                   |    2 +-
 drivers/media/i2c/ccs/ccs-quirk.h                  |    4 +-
 drivers/media/i2c/et8ek8/et8ek8_driver.c           |    2 +-
 drivers/media/i2c/hi556.c                          |    2 +-
 drivers/media/i2c/imx214.c                         |    2 +-
 drivers/media/i2c/imx219.c                         |   51 +-
 drivers/media/i2c/imx258.c                         |   30 +-
 drivers/media/i2c/imx274.c                         |   10 +-
 drivers/media/i2c/imx319.c                         |    2 +-
 drivers/media/i2c/imx334.c                         |    2 +-
 drivers/media/i2c/imx355.c                         |    2 +-
 drivers/media/i2c/m5mols/m5mols.h                  |    4 +-
 drivers/media/i2c/max2175.c                        |    3 +-
 drivers/media/i2c/ov02a10.c                        |    2 +-
 drivers/media/i2c/ov13858.c                        |    2 +-
 drivers/media/i2c/ov2740.c                         |    2 +-
 drivers/media/i2c/ov5640.c                         |    2 +-
 drivers/media/i2c/ov5648.c                         |    2 +-
 drivers/media/i2c/ov5670.c                         |    2 +-
 drivers/media/i2c/ov5675.c                         |    2 +-
 drivers/media/i2c/ov5695.c                         |    2 +-
 drivers/media/i2c/ov8856.c                         |    2 +-
 drivers/media/i2c/ov8865.c                         |    5 +-
 drivers/media/i2c/ov9734.c                         |    2 +-
 drivers/media/i2c/rdacm21.c                        |    2 +-
 drivers/media/i2c/s5k5baf.c                        |    2 +-
 drivers/media/i2c/s5k6aa.c                         |    2 +-
 drivers/media/i2c/tc358743.c                       |    2 +-
 drivers/media/i2c/tda1997x.c                       |    2 +-
 drivers/media/i2c/tvp514x_regs.h                   |    6 +-
 drivers/media/mc/mc-entity.c                       |    1 +
 drivers/media/pci/b2c2/flexcop-pci.c               |    6 +-
 drivers/media/pci/bt8xx/bttv-cards.c               |   20 +-
 drivers/media/pci/cobalt/cobalt-driver.c           |   12 +-
 drivers/media/pci/cx18/cx18-av-audio.c             |    2 +-
 drivers/media/pci/cx18/cx18-av-core.c              |    4 +-
 drivers/media/pci/cx18/cx18-firmware.c             |    2 +-
 drivers/media/pci/cx23885/cx23885-alsa.c           |    2 +-
 drivers/media/pci/cx23885/cx23885-cards.c          |   28 +-
 drivers/media/pci/cx23885/cx23885-core.c           |   22 +-
 drivers/media/pci/cx25821/cx25821-alsa.c           |    2 +-
 drivers/media/pci/cx25821/cx25821-core.c           |   10 +-
 drivers/media/pci/cx25821/cx25821.h                |    1 -
 drivers/media/pci/cx88/cx88-cards.c                |    2 +-
 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c      |    2 +-
 drivers/media/pci/ivtv/ivtv-driver.c               |    2 +-
 drivers/media/pci/mantis/mantis_ca.c               |    1 -
 drivers/media/pci/mantis/mantis_core.c             |  200 --
 drivers/media/pci/mantis/mantis_core.h             |    2 -
 drivers/media/pci/mantis/mantis_dma.c              |   20 +-
 drivers/media/pci/mantis/mantis_pci.c              |    2 +-
 drivers/media/pci/ngene/ngene-cards.c              |    6 +-
 drivers/media/pci/ngene/ngene-core.c               |   56 +-
 drivers/media/pci/pt1/pt1.c                        |    6 +-
 drivers/media/pci/saa7134/saa7134-core.c           |    2 +-
 drivers/media/pci/saa7164/saa7164-encoder.c        |   20 +-
 drivers/media/pci/saa7164/saa7164-types.h          |    4 +-
 drivers/media/pci/solo6x10/solo6x10-core.c         |    2 +-
 drivers/media/pci/sta2x11/Kconfig                  |    1 +
 drivers/media/pci/sta2x11/sta2x11_vip.h            |    2 +
 drivers/media/pci/tw68/tw68-core.c                 |    2 +-
 drivers/media/pci/tw68/tw68-risc.c                 |    3 +-
 drivers/media/pci/tw68/tw68-video.c                |    2 +-
 drivers/media/pci/tw686x/tw686x-audio.c            |   13 +-
 drivers/media/pci/tw686x/tw686x-core.c             |    2 +-
 drivers/media/pci/tw686x/tw686x-video.c            |   17 +-
 drivers/media/pci/tw686x/tw686x.h                  |   10 +-
 drivers/media/platform/Kconfig                     |   21 +-
 drivers/media/platform/Makefile                    |    1 +
 drivers/media/platform/allegro-dvt/nal-h264.h      |   10 +-
 drivers/media/platform/allegro-dvt/nal-hevc.h      |    6 +-
 drivers/media/platform/aspeed-video.c              |    9 +-
 drivers/media/platform/coda/coda-common.c          |    6 +-
 drivers/media/platform/exynos-gsc/gsc-core.h       |   21 +-
 drivers/media/platform/exynos4-is/fimc-core.h      |   12 +-
 drivers/media/platform/exynos4-is/fimc-is.h        |   21 +-
 drivers/media/platform/exynos4-is/fimc-isp.h       |   17 +-
 drivers/media/platform/exynos4-is/fimc-lite.h      |    2 +
 drivers/media/platform/exynos4-is/fimc-reg.h       |    1 +
 drivers/media/platform/exynos4-is/media-dev.c      |    6 +-
 drivers/media/platform/exynos4-is/media-dev.h      |    7 +-
 drivers/media/platform/fsl-viu.c                   |    6 +-
 drivers/media/platform/imx-jpeg/Kconfig            |   11 +
 drivers/media/platform/imx-jpeg/Makefile           |    3 +
 drivers/media/platform/imx-jpeg/mxc-jpeg-hw.c      |  168 ++
 drivers/media/platform/imx-jpeg/mxc-jpeg-hw.h      |  140 ++
 drivers/media/platform/imx-jpeg/mxc-jpeg.c         | 2126 ++++++++++++++++=
++++
 drivers/media/platform/imx-jpeg/mxc-jpeg.h         |  180 ++
 drivers/media/platform/imx-pxp.c                   |    9 +-
 drivers/media/platform/meson/ge2d/ge2d.c           |    4 +-
 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h    |   14 +-
 drivers/media/platform/mtk-mdp/mtk_mdp_comp.h      |    1 -
 drivers/media/platform/mtk-mdp/mtk_mdp_core.h      |   10 +-
 drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h |   21 +-
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c |   18 +-
 .../media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c |  108 +-
 .../media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c  |   40 +-
 .../media/platform/mtk-vcodec/vdec/vdec_vp9_if.c   |    4 +-
 drivers/media/platform/mtk-vcodec/vdec_drv_if.h    |    8 +-
 .../media/platform/mtk-vcodec/venc/venc_vp8_if.c   |    4 +-
 drivers/media/platform/mtk-vcodec/venc_ipi_msg.h   |   14 +-
 drivers/media/platform/mtk-vpu/mtk_vpu.c           |    4 +-
 drivers/media/platform/mtk-vpu/mtk_vpu.h           |   18 +-
 drivers/media/platform/omap3isp/isp.c              |   16 +-
 drivers/media/platform/pxa_camera.c                |    4 +-
 drivers/media/platform/qcom/camss/Makefile         |    6 +
 drivers/media/platform/qcom/camss/camss-csid-170.c |  599 ++++++
 drivers/media/platform/qcom/camss/camss-csid-4-1.c |  328 +++
 drivers/media/platform/qcom/camss/camss-csid-4-7.c |  404 ++++
 .../media/platform/qcom/camss/camss-csid-gen1.h    |   27 +
 .../media/platform/qcom/camss/camss-csid-gen2.h    |   39 +
 drivers/media/platform/qcom/camss/camss-csid.c     |  661 +-----
 drivers/media/platform/qcom/camss/camss-csid.h     |  150 +-
 .../platform/qcom/camss/camss-csiphy-2ph-1-0.c     |   22 +-
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     |  197 +-
 drivers/media/platform/qcom/camss/camss-csiphy.c   |  104 +-
 drivers/media/platform/qcom/camss/camss-csiphy.h   |    2 +-
 drivers/media/platform/qcom/camss/camss-ispif.c    |  127 +-
 drivers/media/platform/qcom/camss/camss-ispif.h    |    3 +-
 drivers/media/platform/qcom/camss/camss-vfe-170.c  |  786 ++++++++
 drivers/media/platform/qcom/camss/camss-vfe-4-1.c  |  144 +-
 drivers/media/platform/qcom/camss/camss-vfe-4-7.c  |  277 ++-
 drivers/media/platform/qcom/camss/camss-vfe-4-8.c  | 1195 +++++++++++
 drivers/media/platform/qcom/camss/camss-vfe-gen1.c |  742 +++++++
 drivers/media/platform/qcom/camss/camss-vfe-gen1.h |  117 ++
 drivers/media/platform/qcom/camss/camss-vfe.c      |  847 +-------
 drivers/media/platform/qcom/camss/camss-vfe.h      |  128 +-
 drivers/media/platform/qcom/camss/camss-video.c    |   52 +
 drivers/media/platform/qcom/camss/camss.c          |  435 +++-
 drivers/media/platform/qcom/camss/camss.h          |   19 +-
 drivers/media/platform/qcom/venus/core.c           |  116 +-
 drivers/media/platform/qcom/venus/core.h           |   52 +-
 drivers/media/platform/qcom/venus/firmware.c       |   42 +-
 drivers/media/platform/qcom/venus/helpers.c        |   71 +-
 drivers/media/platform/qcom/venus/helpers.h        |    3 +-
 drivers/media/platform/qcom/venus/hfi_cmds.c       |   59 +-
 drivers/media/platform/qcom/venus/hfi_helper.h     |   39 +-
 drivers/media/platform/qcom/venus/hfi_msgs.c       |   20 +-
 drivers/media/platform/qcom/venus/hfi_parser.c     |   12 +-
 .../media/platform/qcom/venus/hfi_plat_bufs_v6.c   |   32 +-
 .../media/platform/qcom/venus/hfi_platform_v6.c    |  138 +-
 drivers/media/platform/qcom/venus/hfi_venus.c      |  167 +-
 drivers/media/platform/qcom/venus/hfi_venus_io.h   |  118 +-
 drivers/media/platform/qcom/venus/pm_helpers.c     |  143 +-
 drivers/media/platform/qcom/venus/pm_helpers.h     |    7 +-
 drivers/media/platform/qcom/venus/vdec.c           |   36 +-
 drivers/media/platform/qcom/venus/vdec_ctrls.c     |   23 +-
 drivers/media/platform/qcom/venus/venc.c           |   54 +-
 drivers/media/platform/qcom/venus/venc_ctrls.c     |   70 +-
 drivers/media/platform/rcar-vin/rcar-vin.h         |   19 +-
 .../media/platform/rockchip/rkisp1/rkisp1-params.c |  446 ++--
 .../platform/rockchip/rkisp1/rkisp1-resizer.c      |    9 +-
 drivers/media/platform/s3c-camif/camif-core.h      |   16 +-
 drivers/media/platform/s5p-jpeg/jpeg-core.h        |   18 +-
 drivers/media/platform/s5p-mfc/s5p_mfc_common.h    |   51 +-
 drivers/media/platform/s5p-mfc/s5p_mfc_dec.c       |   16 +
 drivers/media/platform/sti/bdisp/bdisp-debug.c     |    2 +-
 drivers/media/platform/sti/bdisp/bdisp-filter.h    |    4 +-
 .../media/platform/sti/c8sectpfe/c8sectpfe-core.c  |    2 +-
 .../platform/sti/c8sectpfe/c8sectpfe-debugfs.h     |    3 +-
 drivers/media/platform/sti/hva/hva-h264.c          |   10 +-
 drivers/media/platform/sti/hva/hva.h               |    2 +-
 .../media/platform/sunxi/sun6i-csi/sun6i_video.c   |    4 +-
 drivers/media/platform/sunxi/sun8i-di/sun8i-di.c   |    2 +-
 drivers/media/platform/ti-vpe/cal-camerarx.c       |    1 +
 drivers/media/platform/ti-vpe/cal-video.c          |  332 ++-
 drivers/media/platform/ti-vpe/cal.c                |   16 +-
 drivers/media/platform/ti-vpe/cal.h                |   21 +-
 drivers/media/platform/ti-vpe/csc.c                |    4 +-
 drivers/media/platform/ti-vpe/sc.c                 |    4 +-
 drivers/media/platform/ti-vpe/vpdma.c              |    3 +-
 drivers/media/platform/vsp1/vsp1_dl.c              |    2 +-
 drivers/media/platform/vsp1/vsp1_drm.h             |    4 +-
 drivers/media/platform/xilinx/xilinx-vipp.c        |    1 +
 drivers/media/radio/radio-maxiradio.c              |    2 +-
 drivers/media/radio/radio-si476x.c                 |    6 +-
 drivers/media/rc/Kconfig                           |   11 -
 drivers/media/rc/Makefile                          |    1 -
 drivers/media/rc/img-ir/img-ir-hw.c                |    2 +-
 drivers/media/rc/ir-hix5hd2.c                      |    2 +-
 drivers/media/rc/ite-cir.c                         |  351 +---
 drivers/media/rc/ite-cir.h                         |   51 +-
 drivers/media/rc/keymaps/Makefile                  |    4 +
 drivers/media/rc/keymaps/rc-mecool-kii-pro.c       |   91 +
 drivers/media/rc/keymaps/rc-mecool-kiii-pro.c      |   88 +
 drivers/media/rc/keymaps/rc-minix-neo.c            |   55 +
 drivers/media/rc/keymaps/rc-xbox-360.c             |   83 +
 drivers/media/rc/zx-irdec.c                        |  181 --
 drivers/media/spi/cxd2880-spi.c                    |    4 +-
 drivers/media/test-drivers/vidtv/vidtv_psi.c       |    1 -
 drivers/media/test-drivers/vim2m.c                 |   14 +-
 drivers/media/test-drivers/vivid/vivid-core.c      |    6 +-
 drivers/media/test-drivers/vivid/vivid-core.h      |    1 +
 drivers/media/test-drivers/vivid/vivid-ctrls.c     |   13 +
 .../media/test-drivers/vivid/vivid-kthread-cap.c   |   10 +-
 drivers/media/test-drivers/vivid/vivid-vid-out.c   |    2 +-
 drivers/media/tuners/it913x.h                      |    2 +-
 drivers/media/tuners/m88rs6000t.c                  |    6 +-
 drivers/media/tuners/mt2063.c                      |    6 +-
 drivers/media/tuners/qt1010.h                      |    8 +-
 drivers/media/tuners/tda827x.h                     |   10 +-
 drivers/media/tuners/tuner-i2c.h                   |    4 +-
 drivers/media/usb/b2c2/flexcop-usb.c               |    9 +-
 drivers/media/usb/cx231xx/cx231xx.h                |    2 -
 drivers/media/usb/dvb-usb-v2/anysee.c              |   21 +-
 drivers/media/usb/dvb-usb-v2/dvb_usb.h             |   34 +-
 drivers/media/usb/dvb-usb/dvb-usb-init.c           |   90 +-
 drivers/media/usb/dvb-usb/dvb-usb.h                |   91 +-
 drivers/media/usb/em28xx/em28xx-cards.c            |    4 +
 drivers/media/usb/em28xx/em28xx-dvb.c              |    1 +
 drivers/media/usb/em28xx/em28xx.h                  |    4 +-
 drivers/media/usb/gspca/gspca.c                    |    2 +
 drivers/media/usb/gspca/gspca.h                    |    1 +
 drivers/media/usb/gspca/sq905.c                    |    2 +-
 drivers/media/usb/gspca/stv06xx/stv06xx.c          |    9 +
 drivers/media/usb/gspca/w996Xcf.c                  |    3 +-
 drivers/media/usb/pwc/pwc-dec23.c                  |    2 +-
 drivers/media/usb/pwc/pwc-if.c                     |    8 -
 drivers/media/usb/ttusb-dec/ttusb_dec.c            |    4 -
 drivers/media/usb/usbtv/usbtv-video.c              |    6 +-
 drivers/media/usb/uvc/uvc_driver.c                 |   34 +-
 drivers/media/usb/zr364xx/zr364xx.c                |   13 +-
 drivers/media/v4l2-core/v4l2-common.c              |    5 +
 drivers/media/v4l2-core/v4l2-ctrls.c               |  307 ++-
 drivers/media/v4l2-core/v4l2-dev.c                 |    5 +-
 drivers/media/v4l2-core/v4l2-fwnode.c              |   31 +-
 drivers/media/v4l2-core/v4l2-ioctl.c               |    3 +-
 drivers/media/v4l2-core/v4l2-jpeg.c                |   59 +-
 drivers/media/v4l2-core/v4l2-mc.c                  |    8 +-
 drivers/staging/media/atomisp/Kconfig              |    3 +-
 drivers/staging/media/atomisp/Makefile             |    5 +-
 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c |   16 +-
 drivers/staging/media/atomisp/i2c/atomisp-lm3554.c |   38 +-
 drivers/staging/media/atomisp/i2c/atomisp-ov2722.c |    2 -
 drivers/staging/media/atomisp/i2c/gc2235.h         |    2 +-
 drivers/staging/media/atomisp/pci/atomisp_cmd.c    |  105 +-
 drivers/staging/media/atomisp/pci/atomisp_cmd.h    |    2 +-
 drivers/staging/media/atomisp/pci/atomisp_compat.h |   10 +-
 .../media/atomisp/pci/atomisp_compat_css20.c       |   14 +-
 drivers/staging/media/atomisp/pci/atomisp_fops.c   |    3 +
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c  |    8 +-
 drivers/staging/media/atomisp/pci/hmm/hmm_bo.c     |   13 +-
 .../staging/media/atomisp/pci/ia_css_firmware.h    |    2 +
 drivers/staging/media/atomisp/pci/ia_css_mipi.h    |   17 -
 .../isp/kernels/sdis/sdis_1.0/ia_css_sdis.host.c   |    3 +-
 .../atomisp/pci/isp/modes/interface/isp_types.h    |   41 +-
 .../atomisp/pci/runtime/isp_param/src/isp_param.c  |    3 +-
 .../atomisp/pci/runtime/isys/src/virtual_isys.c    |   12 +-
 .../media/atomisp/pci/runtime/queue/src/queue.c    |   44 +-
 .../media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c |   41 +-
 .../media/atomisp/pci/runtime/spctrl/src/spctrl.c  |    7 +-
 .../media/atomisp/pci/runtime/timer/src/timer.c    |    7 +-
 drivers/staging/media/atomisp/pci/sh_css.c         |   15 +-
 .../staging/media/atomisp/pci/sh_css_firmware.c    |    2 +-
 drivers/staging/media/atomisp/pci/sh_css_mipi.c    |   11 -
 drivers/staging/media/atomisp/pci/sh_css_params.c  |   10 +-
 drivers/staging/media/hantro/hantro.h              |    3 +-
 drivers/staging/media/hantro/hantro_drv.c          |    2 +-
 drivers/staging/media/hantro/hantro_g1_vp8_dec.c   |   55 +-
 drivers/staging/media/hantro/hantro_hw.h           |   16 +-
 drivers/staging/media/hantro/hantro_vp8.c          |   10 +-
 .../staging/media/hantro/rk3399_vpu_hw_vp8_dec.c   |   55 +-
 drivers/staging/media/imx/Kconfig                  |    9 +-
 drivers/staging/media/imx/Makefile                 |    6 +-
 drivers/staging/media/imx/TODO                     |    9 +-
 drivers/staging/media/imx/imx-ic-prp.c             |    4 +-
 drivers/staging/media/imx/imx-ic-prpencvf.c        |   24 +-
 drivers/staging/media/imx/imx-media-capture.c      |  687 ++++---
 drivers/staging/media/imx/imx-media-csc-scaler.c   |    2 +-
 drivers/staging/media/imx/imx-media-csi.c          |   33 +-
 drivers/staging/media/imx/imx-media-dev-common.c   |    4 +
 drivers/staging/media/imx/imx-media-utils.c        |   23 +-
 drivers/staging/media/imx/imx-media-vdic.c         |    7 +-
 drivers/staging/media/imx/imx-media.h              |   12 +-
 drivers/staging/media/imx/imx6-mipi-csi2.c         |    6 +-
 drivers/staging/media/imx/imx7-media-csi.c         | 1014 +++++-----
 drivers/staging/media/imx/imx7-mipi-csis.c         |  419 ++--
 drivers/staging/media/ipu3/include/intel-ipu3.h    |    2 +-
 drivers/staging/media/ipu3/ipu3-css-fw.h           |    1 +
 drivers/staging/media/ipu3/ipu3-css-pool.h         |    4 +-
 drivers/staging/media/ipu3/ipu3-v4l2.c             |   36 +-
 drivers/staging/media/ipu3/ipu3.h                  |    5 -
 .../staging/media/meson/vdec/codec_hevc_common.h   |    4 +-
 drivers/staging/media/meson/vdec/vdec.c            |    8 +-
 drivers/staging/media/omap4iss/iss.c               |   11 +-
 drivers/staging/media/omap4iss/iss_regs.h          |   16 +-
 drivers/staging/media/omap4iss/iss_video.c         |    3 +
 drivers/staging/media/rkvdec/rkvdec.c              |   50 +-
 drivers/staging/media/rkvdec/rkvdec.h              |    1 -
 drivers/staging/media/sunxi/cedrus/cedrus.c        |    2 +-
 drivers/staging/media/sunxi/cedrus/cedrus.h        |    2 +-
 drivers/staging/media/sunxi/cedrus/cedrus_dec.c    |    2 +-
 drivers/staging/media/sunxi/cedrus/cedrus_regs.h   |   17 +-
 drivers/staging/media/sunxi/cedrus/cedrus_vp8.c    |  113 +-
 drivers/staging/media/tegra-video/csi.h            |    2 +-
 drivers/staging/media/zoran/zoran_device.c         |   48 +-
 include/linux/iio/dac/mcp4725.h                    |    2 +-
 include/linux/platform_data/media/camera-mx2.h     |   31 -
 include/linux/platform_data/media/camera-mx3.h     |   43 -
 include/media/cec.h                                |    2 +-
 include/media/davinci/isif.h                       |    8 +-
 include/media/davinci/vpbe_osd.h                   |    6 +-
 include/media/dvbdev.h                             |    2 +-
 include/media/i2c/adv7343.h                        |    2 +-
 include/media/i2c/mt9t112.h                        |    2 +-
 include/media/i2c/noon010pc30.h                    |    1 +
 include/media/i2c/ov772x.h                         |    2 +-
 include/media/i2c/s5c73m3.h                        |    1 +
 include/media/i2c/s5k4ecgx.h                       |    6 +-
 include/media/i2c/s5k6aa.h                         |    1 +
 include/media/i2c/tvp514x.h                        |   11 +-
 include/media/i2c/tw9910.h                         |    8 +-
 include/media/media-entity.h                       |    7 +-
 include/media/rc-map.h                             |    4 +
 include/media/v4l2-async.h                         |   12 +-
 include/media/v4l2-ctrls.h                         |   21 +-
 include/media/v4l2-fwnode.h                        |   21 -
 include/media/v4l2-h264.h                          |    6 +-
 include/media/v4l2-jpeg.h                          |   22 +
 include/media/v4l2-mc.h                            |    8 +-
 include/media/videobuf2-core.h                     |    6 +-
 include/media/vp8-ctrls.h                          |  114 --
 include/uapi/linux/cec.h                           |    3 +-
 include/uapi/linux/rkisp1-config.h                 |   16 +-
 include/uapi/linux/uvcvideo.h                      |   10 +-
 include/uapi/linux/v4l2-controls.h                 |  241 ++-
 include/uapi/linux/v4l2-subdev.h                   |   12 +-
 include/uapi/linux/videodev2.h                     |   23 +-
 tools/memory-model/Documentation/glossary.txt      |    2 +-
 483 files changed, 16988 insertions(+), 7421 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/nxp,imx8-jpeg.y=
aml
 delete mode 100644 Documentation/devicetree/bindings/media/qcom,camss.txt
 create mode 100644 Documentation/devicetree/bindings/media/qcom,msm8916-ca=
mss.yaml
 create mode 100644 Documentation/devicetree/bindings/media/qcom,msm8996-ca=
mss.yaml
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sdm660-cam=
ss.yaml
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sdm845-cam=
ss.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/renesas,drif.txt
 create mode 100644 Documentation/devicetree/bindings/media/renesas,drif.ya=
ml
 delete mode 100644 Documentation/devicetree/bindings/media/zx-irdec.txt
 create mode 100644 Documentation/driver-api/media/maintainer-entry-profile=
.rst
 create mode 100644 Documentation/userspace-api/media/v4l/ext-ctrls-colorim=
etry.rst
 delete mode 100644 drivers/media/pci/mantis/mantis_core.c
 create mode 100644 drivers/media/platform/imx-jpeg/Kconfig
 create mode 100644 drivers/media/platform/imx-jpeg/Makefile
 create mode 100644 drivers/media/platform/imx-jpeg/mxc-jpeg-hw.c
 create mode 100644 drivers/media/platform/imx-jpeg/mxc-jpeg-hw.h
 create mode 100644 drivers/media/platform/imx-jpeg/mxc-jpeg.c
 create mode 100644 drivers/media/platform/imx-jpeg/mxc-jpeg.h
 create mode 100644 drivers/media/platform/qcom/camss/camss-csid-170.c
 create mode 100644 drivers/media/platform/qcom/camss/camss-csid-4-1.c
 create mode 100644 drivers/media/platform/qcom/camss/camss-csid-4-7.c
 create mode 100644 drivers/media/platform/qcom/camss/camss-csid-gen1.h
 create mode 100644 drivers/media/platform/qcom/camss/camss-csid-gen2.h
 create mode 100644 drivers/media/platform/qcom/camss/camss-vfe-170.c
 create mode 100644 drivers/media/platform/qcom/camss/camss-vfe-4-8.c
 create mode 100644 drivers/media/platform/qcom/camss/camss-vfe-gen1.c
 create mode 100644 drivers/media/platform/qcom/camss/camss-vfe-gen1.h
 create mode 100644 drivers/media/rc/keymaps/rc-mecool-kii-pro.c
 create mode 100644 drivers/media/rc/keymaps/rc-mecool-kiii-pro.c
 create mode 100644 drivers/media/rc/keymaps/rc-minix-neo.c
 create mode 100644 drivers/media/rc/keymaps/rc-xbox-360.c
 delete mode 100644 drivers/media/rc/zx-irdec.c
 delete mode 100644 include/linux/platform_data/media/camera-mx2.h
 delete mode 100644 include/linux/platform_data/media/camera-mx3.h
 delete mode 100644 include/media/vp8-ctrls.h

