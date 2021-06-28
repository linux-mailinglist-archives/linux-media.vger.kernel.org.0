Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 810033B5EE4
	for <lists+linux-media@lfdr.de>; Mon, 28 Jun 2021 15:30:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230033AbhF1Nch (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Jun 2021 09:32:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:60006 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229778AbhF1Nch (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Jun 2021 09:32:37 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7B94361C3D;
        Mon, 28 Jun 2021 13:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624887011;
        bh=lQq4U4uSiFxzLr5o42at2vYWidY6gColoH2FqcIqkps=;
        h=Date:From:To:Cc:Subject:From;
        b=o8k6aVhDIF9PfJ+6XnmB1esXylMUPn5Kj6iUAaTGlhdzn1dq1KVHxvz9BxZ/QFdGc
         5EA252+j/KfIb8pIxwGWvxe+6nFg7aWCn580UsQN648y/mRs5i1/zTQGVWfMsOXdv1
         yXHB8pzVz12wkheNN71u/RvLrZH1MmZxvnqMuz0w/nZuQOfXrhiZuxdLzhXCS9reGP
         Enzv4K4S/f/ClYd22KjnMwR9PLiUrNzCEBtrzE4H+py3/yQV9wvbTXR31tpy7sPriY
         FBO5ywpYUaul5Nw6b3GRID09ieFavqmcyCQZ4eAD8qzp3ZeWagnchsAyrXdvnu/OLR
         nFwO6E6XmaQyA==
Date:   Mon, 28 Jun 2021 15:30:05 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL for v5.14-rc1] media updates
Message-ID: <20210628153005.1416aadf@coco.lan>
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
dia/v5.14-1


For:
  - V4L2 core control API was split into separate files;
  - New RC maps: tango and tc-90405;
  - Hantro driver got support for G2/HEVC decoder;
  - av7710 is moving to staging, together with some legacy APIs;
  - several cleanups related to compat_ioctl32 code;
  - Move the MPEG-2 stateless control type out of staging;
  - Address several issues with RPM get logic on media drivers;
  - Lots of cleanups, bug fixes and improvements.

Regards,
Mauro

---

The following changes since commit 8124c8a6b35386f73523d27eacb71b5364a68c4c:

  Linux 5.13-rc4 (2021-05-30 11:58:25 -1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/me=
dia/v5.14-1

for you to fetch changes up to 61c6f04a988e420a1fc5e8e81cf9aebf142a7bd6:

  media: s5p-mfc: Fix display delay control creation (2021-06-28 15:17:42 +=
0200)

----------------------------------------------------------------
media updates for v5.14-rc1

----------------------------------------------------------------
Alex Bee (6):
      media: dt-bindings: media: rockchip-vpu: add new compatibles
      media: dt-bindings: media: rockchip-vdec: add RK3228 compatible
      media: hantro: reorder variants
      media: hantro: merge Rockchip platform drivers
      media: hantro: add support for Rockchip RK3066
      media: hantro: add support for Rockchip RK3036

Alexander Voronov (1):
      media: rc: add keymap for Toshiba CT-90405 remote

Alexandre Courbot (1):
      media: mtk-vcodec: venc: remove redundant code

Aline Santana Cordeiro (13):
      media: staging: media: hantro: Align line break to the open parenthes=
is in file hantro_hw.h
      media: staging: media: hantro: Align line break to the open parenthes=
is in file hantro_mpeg2.c
      media: staging: media: omap4iss: Align line break to the open parenth=
esis in file iss_video.c
      media: staging: media: omap4iss: Remove unused macro function
      media: staging: media: atomisp: pci: Correct identation in block of c=
onditional statements in file atomisp_v4l2.c
      media: staging: media: atomisp: pci: Correct identation in block of c=
onditional statements in file atomisp_acc.c
      media: staging: media: atomisp: pci: Format comments according to cod=
ing-style in file atomisp_acc.c
      media: staging: media: atomisp: pci: Format comments according to cod=
ing-style in file atomisp_cmd.h
      media: staging: media: atomisp: pci: Balance braces around conditiona=
l statements in file atomisp_cmd.c
      media: staging: media: atomisp: pci: Balance braces around conditiona=
l statements in file atomisp_compat_css20.c
      media: staging: media: atomisp: pci: Balance braces around conditiona=
l statements in file atomisp_subdev.c
      media: staging: media: atomisp: pci: Balance braces around conditiona=
l statements in file atomisp_v4l2.c
      media: staging: media: tegra-video: Align line break to match with th=
e open parenthesis in file vi.c

Andrzej Pietrasiewicz (2):
      media: hantro: Fix .buf_prepare
      media: cedrus: Fix .buf_prepare

Andy Shevchenko (1):
      media: ipu3-cio2: Fix reference counting when looping over ACPI devic=
es

Anirudh Rayabharam (1):
      media: pvrusb2: fix warning in pvr2_i2c_core_done

Arnd Bergmann (9):
      media: rc: remove tango ir driver and keymap
      media: rc: clean up Kconfig dependencies
      media: v4l2-core: ignore native time32 ioctls on 64-bit
      media: v4l2-core: explicitly clear ioctl input data
      media: v4l2-core: fix whitespace damage in video_get_user()
      media: subdev: remove VIDIOC_DQEVENT_TIME32 handling
      media: v4l2-core: return -ENODEV from ioctl when not registered
      media: atomisp: remove compat_ioctl32 code
      media: subdev: disallow ioctl for saa6588/davinci

Beatriz Martins de Carvalho (1):
      media: staging: media: atomisp: i2c: align line break to match with o=
pen parenthesis

Benjamin Drung (1):
      media: uvcvideo: Fix pixel format change for Elgato Cam Link 4K

Benjamin Gaignard (9):
      media: hevc: Add fields and flags for hevc PPS
      media: hevc: Add decode params control
      media: hantro: change hantro_codec_ops run prototype to return errors
      media: hantro: Define HEVC codec profiles and supported features
      media: hantro: Only use postproc when post processed formats are defi=
ned
      media: uapi: Add a control for HANTRO driver
      media: hantro: handle V4L2_PIX_FMT_HEVC_SLICE control
      media: hantro: Introduce G2/HEVC decoder
      media: hantro: IMX8M: add variant for G2/HEVC codec

Bernhard Wimmer (2):
      media: Documentation: ccs: Fix the op_pll_multiplier address
      media: ccs: Fix the op_pll_multiplier address

Christophe JAILLET (6):
      media: rc: i2c: Fix an error message
      media: i2c: ov2659: Fix an error message
      media: i2c: ov9650: Fix an error message
      media: ttpci: switch from 'pci_' to 'dma_' API
      media: cxd2880-spi: Fix some error messages
      media: pci: cx88: switch from 'pci_' to 'dma_' API

Colin Ian King (3):
      media: s2255drv: remove redundant assignment to variable field
      media: meson: vdec: remove redundant initialization of variable reg_c=
ur
      media: mxl692: make a const array static, makes object smaller

Corentin Labbe (5):
      media: staging: media: zoran: remove detect_guest_activity
      media: staging: media: zoran: multiple assignments should be avoided
      media: staging: media: zoran: remove blank line
      media: staging: media: zoran: fix kzalloc style
      media: staging: media: zoran: change asm header

Dafna Hirschfeld (1):
      media: mtk-vpu: on suspend, read/write regs only if vpu is running

Dan Carpenter (3):
      media: lmedm04: delete lme2510_get_adapter_count()
      media: au0828: fix a NULL vs IS_ERR() check
      media: hantro: test the correct variable in probe()

Deepak R Varma (6):
      media: staging: media: atomisp: balance braces around if...else block
      media: staging: media: atomisp: remove unnecessary braces
      media: staging: media: atomisp: reformat code comment blocks
      media: staging: media: atomisp: fix CamelCase variable naming
      media: staging: media: atomisp: replace raw pr_*() by dev_dbg()
      media: staging: media: atomisp: remove unnecessary pr_info calls

Dikshita Agarwal (1):
      media: venus: Enable low power setting for encoder

Dillon Min (2):
      media: i2c: ov2659: Use clk_{prepare_enable,disable_unprepare}() to s=
et xvclk on/off
      media: s5p-g2d: Fix a memory leak on ctx->fh.m2m_ctx

Ding Senjie (1):
      media: mtk-vpu: Use devm_platform_ioremap_resource_byname

Dongliang Mu (1):
      media: dvd_usb: memory leak in cinergyt2_fe_attach

Emil Velikov (9):
      media: hantro: use G1_REG_INTERRUPT directly for the mpeg2
      media: hantro: imx: reuse MB_DIM define
      media: hantro: imx: remove duplicate dec_base init
      media: hantro: imx: remove unused include
      media: hantro: introduce hantro_g1.c for common API
      media: hantro: add fallback handling for single irq/clk
      media: dt-bindings: Document SAMA5D4 VDEC bindings
      media: hantro: add initial SAMA5D4 support
      media: ARM: dts: sama5d4: enable Hantro G1 VDEC

Eugen Hristev (33):
      media: atmel: atmel-isc: specialize gamma table into product specific
      media: atmel: atmel-isc: specialize driver name constant
      media: atmel: atmel-isc: add checks for limiting frame sizes
      media: atmel: atmel-isc: specialize max width and max height
      media: atmel: atmel-isc: specialize dma cfg
      media: atmel: atmel-isc: extract CSC submodule config into separate f=
unction
      media: atmel: atmel-isc-base: add id to clock debug message
      media: atmel: atmel-isc: create register offsets struct
      media: atmel: atmel-isc: extract CBC submodule config into separate f=
unction
      media: atmel: atmel-isc: add CBC to the reg offsets struct
      media: atmel: atmel-isc: add SUB422 and SUB420 to register offsets
      media: atmel: atmel-isc: add RLP to register offsets
      media: atmel: atmel-isc: add HIS to register offsets
      media: atmel: atmel-isc: add DMA to register offsets
      media: atmel: atmel-isc: add support for version register
      media: atmel: atmel-isc: add his_entry to register offsets
      media: atmel: atmel-isc: add register description for additional modu=
les
      media: atmel: atmel-isc: extend pipeline with extra modules
      media: atmel: atmel-isc: add CC initialization function
      media: atmel: atmel-isc: create product specific v4l2 controls config
      media: atmel: atmel-isc: create callback for DPC submodule product sp=
ecific
      media: atmel: atmel-isc: create callback for GAM submodule product sp=
ecific
      media: atmel: atmel-isc: create callback for RLP submodule product sp=
ecific
      media: atmel: atmel-isc: move the formats list into product specific =
code
      media: atmel: atmel-isc: create an adapt pipeline callback for produc=
t specific
      media: atmel: atmel-isc-regs: add additional fields for sama7g5 type =
pipeline
      media: atmel: atmel-isc-base: add support for more formats and additi=
onal pipeline modules
      media: atmel: atmel-isc-sama5d2: remove duplicate define
      media: dt-bindings: media: atmel-isc: convert to yaml
      media: dt-bindings: media: add microchip,xisc device bindings
      media: atmel: atmel-isc: add microchip-xisc driver
      media: MAINTAINERS: update ISC driver bindings file
      media: MAINTAINERS: add xisc files to isc driver entry

Evgeny Novikov (5):
      media: v4l: cadence: Handle errors of clk_prepare_enable()
      media: v4l: cadence: Handle errors of clk_prepare_enable()
      media: st-hva: Fix potential NULL pointer dereferences
      media: st_rc: Handle errors of clk_prepare_enable()
      media: marvell-ccic: set error code in probe

Ezequiel Garcia (11):
      media: uapi: mpeg2: Rename "quantization" to "quantisation"
      media: uapi: mpeg2: rework quantisation matrices semantics
      media: uapi: mpeg2: Cleanup flags
      media: uapi: mpeg2: Split sequence and picture parameters
      media: uapi: mpeg2: Move reference buffer fields
      media: hantro/cedrus: Remove unneeded slice size and slice offset
      media: uapi: mpeg2: Remove V4L2_CID_MPEG_VIDEO_MPEG2_SLICE_PARAMS
      media: uapi: Move the MPEG-2 stateless control type out of staging
      media: controls: Log MPEG-2 stateless control in .std_log
      media: uapi: move MPEG-2 stateless controls out of staging
      media: rkvdec: Fix .buf_prepare

Guenter Roeck (1):
      media: media/test_drivers: Drop unnecessary NULL check after containe=
r_of

Gustavo A. R. Silva (3):
      media: venus: hfi_cmds.h: Replace one-element array with flexible-arr=
ay member
      media: venus: hfi_cmds: Fix packet size calculation
      media: venus: hfi_msgs.h: Replace one-element arrays with flexible-ar=
ray members

Hans Verkuil (9):
      media: rtl2832_sdr/vivid/airspy/hackrf/msi2500: drop memset of fmt.sd=
r.reserved
      media: cobalt: fix race condition in setting HPD
      media: v4l2-ctrls: always copy the controls on completion
      media: v4l2-ctrls: split up into four source files
      media: mc-request.c: allow object_bind in QUEUED state
      media: adv7842: support EDIDs up to 4 blocks
      media: uapi/linux/cec-funcs.h: set delay to 1 if unnused
      media: adv7842: remove spurious & and fix vga_edid size
      media: mtk-vcodec: fix kerneldoc warnings

Herman (3):
      media: drivers/media/usb/em28xx/em28xx-cards.c : fix typo issues
      media: drivers/media/platform/Rcar_jpu.c : fix typo issues
      media: drivers/media/usb/gspca/cpia1.c : fix spelling typo

Igor Matheus Andrade Torrente (1):
      media: em28xx: Fix possible memory leak of em28xx struct

Irui Wang (5):
      media: dt-bindings: media: mtk-vcodec: Add dma-ranges property
      media: mtk-vcodec: Support 34bits dma address for venc
      media: dt-bindings: media: mtk-vcodec: Add binding for MT8192 VENC
      media: mtk-vcodec: Add MT8192 H264 venc driver
      media: mtk-vcodec: Support MT8192 H264 4K encoding

Jacopo Mondi (15):
      media: i2c: max9286: Adjust parameters indent
      media: i2c: max9286: Rename reverse_channel_mv
      media: i2c: max9286: Cache channel amplitude
      media: i2c: max9286: Define high channel amplitude
      media: i2c: max9286: Rework comments in .bound()
      media: i2c: max9271: Check max9271_write() return
      media: i2c: max9271: Introduce wake_up() function
      media: i2c: rdacm21: Add delay after OV490 reset
      media: i2c: rdacm21: Fix OV10640 powerup
      media: i2c: rdacm21: Power up OV10640 before OV490
      media: i2c: rdacm20: Embed 'serializer' field
      media: i2c: rdacm20: Enable noise immunity
      media: i2c: rdacm20: Report camera module name
      media: i2c: rdacm20: Check return values
      media: i2c: rdacm20: Re-work ov10635 reset

Jernej Skrabec (1):
      media: hevc: Fix dependent slice segment flags

Jiapeng Chong (2):
      media: atmel: atmel-isc: Remove redundant assignment to i
      media: st-delta: Remove redundant assignment to ret

Joe Richey (1):
      media: vicodec: Use _BITUL() macro in UAPI headers

Johan Hovold (5):
      media: dtv5100: fix control-request directions
      media: gspca/sq905: fix control-request direction
      media: gspca/gl860: fix zero-length control requests
      media: gspca/sunplus: fix zero-length control requests
      media: rtl28xxu: fix zero-length control request

John Cox (1):
      media: hevc: Add sps_max_sub_layers_minus1 to v4l2_ctrl_hevc_sps

Laurent Pinchart (25):
      media: imx: imx7_mipi_csis: Fix logging of only error event counters
      media: imx: imx7_mipi_csis: Count the CSI-2 debug interrupts
      media: imx: imx7_mipi_csis: Update ISP_CONFIG macros for quad pixel m=
ode
      media: imx: imx7_mipi_csis: Move static data to top of mipi_csis_dump=
_regs()
      media: imx: imx7_mipi_csis: Minimize locking in get/set format
      media: imx: imx7_mipi_csis: Don't set subdev data
      media: imx: imx7_mipi_csis: Reorganize code in sections
      media: imx: imx7_mipi_csis: Set the CLKSETTLE register field
      media: imx: imx7_mipi_csis: Drop unused csis_hw_reset structure
      media: imx: imx7_mipi_csis: Store CSI-2 data type in format structure
      media: imx: imx7_mipi_csis: Drop csi_state phy field
      media: imx: imx7_mipi_csis: Rename mipi_sd to sd
      media: imx: imx7_mipi_csis: Rename csi_state flag field to state
      media: imx: imx7_mipi_csis: Turn csi_state irq field into local varia=
ble
      media: imx: imx7_mipi_csis: Don't pass pdev to mipi_csis_parse_dt()
      media: imx: imx7_mipi_csis: Pass csi_state to mipi_csis_subdev_init()
      media: imx: imx7_mipi_csis: Drop csi_state pdev field
      media: imx: imx7_mipi_csis: Make csi_state num_clocks field unsigned
      media: imx: imx7_mipi_csis: Reorganize csi_state structure
      media: imx: imx7_mipi_csis: Reorganize mipi_csis_probe()
      media: imx: imx7_mipi_csis: Reject invalid data-lanes settings
      media: imx: imx7_mipi_csis: Move PHY control to dedicated functions
      media: dt-bindings: media: nxp,imx7-mipi-csi2: Add i.MX8MM support
      media: imx: imx7_mipi_csis: Add i.MX8MM support
      media: imx: imx7_mipi_csis: Update MAINTAINERS

Lv Yunlong (2):
      media: exynos4-is: Fix a use after free in isp_video_release
      media: v4l2-core: Avoid the dangling pointer in v4l2_fh_release

Marek Szyprowski (1):
      media: s5p-mfc: Fix display delay control creation

Martiros Shakhzadyan (11):
      media: staging: media: atomisp: Removed a superfluous else clause
      media: staging: media: atomisp: Minor code style changes
      media: staging: media: atomisp: Fix sh_css.c brace coding style issues
      media: staging: media: atomisp: Remove redundant assertions in sh_css=
.c
      media: staging: media: atomisp: Fix the rest of sh_css.c brace issues
      media: staging: media: atomisp: Remove all redundant assertions in sh=
_css.c
      media: staging: media: atomisp: Remove a superfluous else clause in s=
h_css.c
      media: staging: media: atomisp: Replace if else clause with a ternary
      media: staging: media: atomisp: Fix alignment and line length issues
      media: staging: media: atomisp: Refactor ia_css_stream_load()
      media: staging: media: atomisp: Fix line split style issues

Mauro Carvalho Chehab (115):
      staging: media: rkvdec: fix pm_runtime_get_sync() usage count
      media: venus: Rework error fail recover logic
      media: s5p_cec: decrement usage count if disabled
      media: i2c: ccs-core: return the right error code at suspend
      media: i2c: ccs-core: fix pm_runtime_get_sync() usage count
      media: i2c: imx334: fix the pm runtime get logic
      media: exynos-gsc: don't resume at remove time
      media: atmel: properly get pm_runtime
      media: hantro: do a PM resume earlier
      media: marvel-ccic: fix some issues when getting pm_runtime
      media: mdk-mdp: fix pm_runtime_get_sync() usage count
      media: rcar_fdp1: simplify error check logic at fdp_open()
      media: rcar_fdp1: fix pm_runtime_get_sync() usage count
      media: renesas-ceu: Properly check for PM errors
      media: s5p: fix pm_runtime_get_sync() usage count
      media: am437x: fix pm_runtime_get_sync() usage count
      media: sh_vou: fix pm_runtime_get_sync() usage count
      media: mtk-vcodec: fix PM runtime get logic
      media: s5p-jpeg: fix pm_runtime_get_sync() usage count
      media: sti/delta: use pm_runtime_resume_and_get()
      media: sunxi: fix pm_runtime_get_sync() usage count
      media: sti/bdisp: fix pm_runtime_get_sync() usage count
      media: exynos4-is: fix pm_runtime_get_sync() usage count
      media: exynos-gsc: fix pm_runtime_get_sync() usage count
      media: exynos4-is: remove a now unused integer
      media: sti: fix obj-$(config) targets
      media: i2c: ak7375: use pm_runtime_resume_and_get()
      media: i2c: dw9714: use pm_runtime_resume_and_get()
      media: i2c: dw9768: use pm_runtime_resume_and_get()
      media: i2c: dw9807-vcm: use pm_runtime_resume_and_get()
      media: i2c: hi556: use pm_runtime_resume_and_get()
      media: i2c: imx214: use pm_runtime_resume_and_get()
      media: i2c: imx219: use pm_runtime_resume_and_get()
      media: i2c: imx258: use pm_runtime_resume_and_get()
      media: i2c: imx274: use pm_runtime_resume_and_get()
      media: i2c: imx290: use pm_runtime_resume_and_get()
      media: i2c: imx319: use pm_runtime_resume_and_get()
      media: i2c: imx355: use pm_runtime_resume_and_get()
      media: i2c: mt9m001: use pm_runtime_resume_and_get()
      media: i2c: ov02a10: use pm_runtime_resume_and_get()
      media: i2c: ov13858: use pm_runtime_resume_and_get()
      media: i2c: ov2659: use pm_runtime_resume_and_get()
      media: i2c: ov2685: use pm_runtime_resume_and_get()
      media: i2c: ov2740: use pm_runtime_resume_and_get()
      media: i2c: ov5647: use pm_runtime_resume_and_get()
      media: i2c: ov5648: use pm_runtime_resume_and_get()
      media: i2c: ov5670: use pm_runtime_resume_and_get()
      media: i2c: ov5675: use pm_runtime_resume_and_get()
      media: i2c: ov5695: use pm_runtime_resume_and_get()
      media: i2c: ov7740: use pm_runtime_resume_and_get()
      media: i2c: ov8856: use pm_runtime_resume_and_get()
      media: i2c: ov8865: use pm_runtime_resume_and_get()
      media: i2c: ov9734: use pm_runtime_resume_and_get()
      media: i2c: tvp5150: use pm_runtime_resume_and_get()
      media: i2c: video-i2c: use pm_runtime_resume_and_get()
      media: i2c: ccs-core: use pm_runtime_resume_and_get()
      staging: media: imx7-mipi-csis: use pm_runtime_resume_and_get()
      staging: media: atomisp: use pm_runtime_resume_and_get()
      staging: media: ipu3: use pm_runtime_resume_and_get()
      staging: media: cedrus_video: use pm_runtime_resume_and_get()
      staging: media: tegra-vde: use pm_runtime_resume_and_get()
      staging: media: tegra-video: use pm_runtime_resume_and_get()
      media: rockchip/rga: use pm_runtime_resume_and_get()
      media: sti/hva: use pm_runtime_resume_and_get()
      media: ipu3: use pm_runtime_resume_and_get()
      media: coda: use pm_runtime_resume_and_get()
      media: mtk-jpeg: use pm_runtime_resume_and_get()
      media: camss: use pm_runtime_resume_and_get()
      media: venus: core: use pm_runtime_resume_and_get()
      media: venus: vdec: use pm_runtime_resume_and_get()
      media: venus: venc: use pm_runtime_resume_and_get()
      media: rcar-fcp: use pm_runtime_resume_and_get()
      media: rkisp1: use pm_runtime_resume_and_get()
      media: s3c-camif: use pm_runtime_resume_and_get()
      media: s5p-mfc: use pm_runtime_resume_and_get()
      media: stm32: use pm_runtime_resume_and_get()
      media: sunxi: use pm_runtime_resume_and_get()
      media: ti-vpe: use pm_runtime_resume_and_get()
      media: vsp1: use pm_runtime_resume_and_get()
      media: rcar-vin: use pm_runtime_resume_and_get()
      media: hantro: use pm_runtime_resume_and_get()
      media: davinci: fix two kernel-doc comments
      Merge tag 'v5.13-rc4' into media_tree
      media: move ttpci-eeprom to common
      media: av7110: move driver to staging
      media: sp8870: move it to staging
      docs: admin-guide: media: ipu3.rst: replace some characters
      docs: driver-api: media: zoran: replace SOFT HYPHEN character
      docs: userspace-api: media: fdl-appendix.rst: replace some characters
      docs: userspace-api: media: v4l: replace some characters
      docs: userspace-api: media: dvb: replace some characters
      media: ivtv: get rid of DVB deprecated ioctls
      media: dvb header files: move some headers to staging
      media: docs: move DVB audio/video docs to staging
      media: gspca: ov519: replace RIGHT SINGLE QUOTATION MARK
      media: rtl28xxu: replace a NO-BREAK SPACE character
      media: allegro-dvt: avoid EN DASH char
      media: saa7134: drop a NO-BREAK SPACE
      media: rc: ite-cir: replace some an EN DASH
      media: pci: tw5864: avoid usage of some characters
      media: dmxdev: change the check for problems allocing secfeed
      media: docs: */media/index.rst: don't use ReST doc:`foo`
      media: userspace-api: avoid using ReST :doc:`foo` markup
      media: driver-api: drivers: avoid using ReST :doc:`foo` markup
      media: admin-guide: avoid using ReST :doc:`foo` markup
      media: dvb_ca_en50221: avoid speculation from CA slot
      media: dvb_net: avoid speculation from net slot
      media: dvbdev: fix error logic at dvb_register_device()
      media: sun6i-csi: add a missing return code
      media: saa7134: use more meaninful goto labels
      media: saa7134: fix saa7134_initdev error handling logic
      media: siano: fix device register error path
      media: ttusb-dec: cleanup an error handling logic
      media: dvb-core: frontend: make GET/SET safer
      media: xilinx: simplify get fourcc logic

Mitali Borkar (5):
      media: staging: media: intel-ipu3: remove unnecessary blank line
      media: staging: media: intel-ipu3: reduce length of line
      media: staging: media: intel-ipu3: remove space before tabs
      media: staging: media: intel-ipu3: line should not end with '['
      media: staging: media: zoran: add spaces around '<<' operator

Niklas S=C3=B6derlund (7):
      media: dt-bindings: media: renesas,isp: Add bindings for ISP Channel =
Selector
      media: dt-bindings: media: renesas,vin: Add r8a779a0 support
      media: dt-bindings: media: renesas,vin: Add r8a77961 support
      media: dt-bindings: media: renesas,csi2: Add r8a77961 support
      media: rcar-vin: Enable support for r8a77961
      media: rcar-csi2: Enable support for r8a77961
      media: rcar-csi2: Add support for Y10 and Y8

Paul Cercueil (1):
      media: dt-bindings: media: Document RDA5807 FM radio bindings

Paul Kocialkowski (1):
      media: i2c: ov8865: remove unnecessary NULL check

Pavel Skripkin (3):
      media: cpia2: fix memory leak in cpia2_usb_probe
      media: dvb-usb: fix wrong definition
      media: zr364xx: fix memory leak in zr364xx_start_readpipe

Philipp Zabel (1):
      media: video-mux: Skip dangling endpoints

Piyush Thange (1):
      media: usb: cpia2: Fixed Coding Style issues

Randy Dunlap (1):
      media: I2C: change 'RST' to "RSET" to fix multiple build errors

Rikard Falkeborn (3):
      media: radio: si4713: constify static struct v4l2_ioctl_ops
      media: imx-jpeg: Constify static struct v4l2_m2m_ops
      media: imx-jpeg: Constify static struct mxc_jpeg_fmt

Sakari Ailus (3):
      media: v4l: async, fwnode: Improve module organisation
      media: staging: ipu3-imgu: Move the UAPI header from include under in=
clude/uapi
      media: staging: ipu3-imgu: Document pages field

Sean Young (2):
      media: lirc: remove out of date comment
      media: cinergyt2: make properties const

Sebastian Fricke (3):
      media: mc: mc-entity.c: Fix typo
      media: rkisp1: rksip1-capture.c: Improve comments and fix typos
      media: rkisp1: rkisp1-params.c: Fix typos

Shawn Tu (3):
      media: ov8856: Add support for 2 data lanes
      media: ov8856: add vflip/hflip control support
      media: imx208: Add imx208 camera sensor driver

Shuah Khan (1):
      media: Fix Media Controller API config checks

Stanimir Varbanov (1):
      media: venus: hfi_cmds: Fix conceal color property

Steve Longerbeam (1):
      media: imx-csi: Skip first few frames from a BT.656 source

Tian Tao (1):
      media: camss: move to use request_irq by IRQF_NO_AUTOEN flag

Tomi Valkeinen (4):
      media: videobuf2-v4l2.c: add vb2_queue_change_type() helper
      media: vivid: remove stream_sliced_vbi_cap field
      media: vivid: use vb2_queue_change_type
      media: v4l2-subdev: add subdev-wide state struct

Tong Zhang (1):
      media: bt878: do not schedule tasklet when it is not setup

Wang Qing (1):
      media: staging: media: zoran: fix some formatting issues

Wei Yongjun (1):
      media: imx: imx7_mipi_csis: Fix error return code in mipi_csis_async_=
register()

Wolfram Sang (1):
      media: coda: set debugfs blobs to read only

Yang Yingliang (3):
      media: saa7134: Remove unnecessary INIT_LIST_HEAD()
      media: bdisp: remove redundant dev_err call in bdisp_probe()
      media: staging: media: tegra-vde: add missing error return code in te=
gra_vde_probe()

Yangtao Li (1):
      media: venus: Convert to use resource-managed OPP API

Ye Bin (1):
      media: siano: use DEFINE_MUTEX() for mutex lock and LIST_HEAD for lis=
t head

Zhen Lei (3):
      media: venus: helpers: Delete an unneeded bool conversion
      media: tc358743: Fix error return code in tc358743_probe_of()
      media: imon: use DEVICE_ATTR_RW() helper macro

Zheyu Ma (1):
      media: bt8xx: Fix a missing check bug in bt878_probe

dingsenjie (1):
      media: qcom/camss: Use devm_platform_ioremap_resource_byname

lijian (3):
      media: v4l2-dev.c: Modified the macro SET_VALID_IOCTL
      media: videobuf-dma-sg: void function return statements are not gener=
ally useful
      media: v4l2-event: Modified variable type 'unsigned' to 'unsigned int'

wengjianfeng (1):
      media: dvb-frontends: remove redundant words and fix several typos

 Documentation/admin-guide/media/bt8xx.rst          |   15 +-
 Documentation/admin-guide/media/bttv.rst           |   21 +-
 Documentation/admin-guide/media/index.rst          |   12 +-
 Documentation/admin-guide/media/ipu3.rst           |   35 +-
 Documentation/admin-guide/media/saa7134.rst        |    3 +-
 .../devicetree/bindings/media/atmel,isc.yaml       |  114 +
 .../devicetree/bindings/media/atmel-isc.txt        |   65 -
 .../devicetree/bindings/media/i2c/rda,rda5807.yaml |   67 +
 .../devicetree/bindings/media/mediatek-vcodec.txt  |    2 +
 .../bindings/media/microchip,sama5d4-vdec.yaml     |   47 +
 .../devicetree/bindings/media/microchip,xisc.yaml  |  129 +
 .../bindings/media/nxp,imx7-mipi-csi2.yaml         |  109 +-
 Documentation/devicetree/bindings/media/rc.yaml    |    2 +-
 .../devicetree/bindings/media/renesas,csi2.yaml    |    1 +
 .../devicetree/bindings/media/renesas,isp.yaml     |  196 +
 .../devicetree/bindings/media/renesas,vin.yaml     |   27 +-
 .../devicetree/bindings/media/rockchip,vdec.yaml   |   10 +-
 .../devicetree/bindings/media/rockchip-vpu.yaml    |   33 +-
 .../devicetree/bindings/media/tango-ir.txt         |   21 -
 .../driver-api/media/drivers/bttv-devel.rst        |    2 +-
 .../driver-api/media/drivers/ccs/ccs-regs.asc      |    2 +-
 .../driver-api/media/drivers/ccs/mk-ccs-regs       |    5 +-
 Documentation/driver-api/media/drivers/zoran.rst   |    2 +-
 Documentation/driver-api/media/index.rst           |   10 +-
 Documentation/userspace-api/media/Makefile         |   10 +-
 .../userspace-api/media/audio.h.rst.exceptions     |   19 -
 .../userspace-api/media/drivers/hantro.rst         |   19 +
 .../userspace-api/media/drivers/index.rst          |    1 +
 .../userspace-api/media/dvb/dmx-fopen.rst          |    2 +-
 .../userspace-api/media/dvb/dmx-fread.rst          |    2 +-
 .../userspace-api/media/dvb/dmx-set-filter.rst     |    2 +-
 Documentation/userspace-api/media/dvb/headers.rst  |    7 -
 Documentation/userspace-api/media/dvb/intro.rst    |    6 +-
 .../userspace-api/media/dvb/legacy_dvb_apis.rst    |    7 -
 Documentation/userspace-api/media/fdl-appendix.rst |   64 +-
 Documentation/userspace-api/media/glossary.rst     |    2 +-
 Documentation/userspace-api/media/index.rst        |   12 +-
 Documentation/userspace-api/media/v4l/biblio.rst   |    8 +-
 .../userspace-api/media/v4l/dev-decoder.rst        |    6 +-
 .../media/v4l/ext-ctrls-codec-stateless.rst        |  214 +
 .../userspace-api/media/v4l/ext-ctrls-codec.rst    |  333 +-
 .../userspace-api/media/v4l/pixfmt-compressed.rst  |   11 +-
 .../media/v4l/pixfmt-meta-intel-ipu3.rst           |    2 +-
 .../userspace-api/media/v4l/vidioc-g-ext-ctrls.rst |   12 +
 .../userspace-api/media/v4l/vidioc-queryctrl.rst   |   24 +-
 .../userspace-api/media/video.h.rst.exceptions     |   39 -
 .../userspace-api/media/videodev2.h.rst.exceptions |    5 +-
 MAINTAINERS                                        |   13 +-
 arch/arm/boot/dts/sama5d4.dtsi                     |    7 +
 drivers/media/cec/platform/s5p/s5p_cec.c           |    7 +-
 drivers/media/common/Kconfig                       |    4 +
 drivers/media/common/Makefile                      |    1 +
 drivers/media/common/siano/smsdvb-main.c           |   11 +-
 drivers/media/{pci/ttpci =3D> common}/ttpci-eeprom.c |    0
 drivers/media/{pci/ttpci =3D> common}/ttpci-eeprom.h |    0
 drivers/media/common/videobuf2/videobuf2-v4l2.c    |   14 +
 drivers/media/dvb-core/dmxdev.c                    |    2 +-
 drivers/media/dvb-core/dvb_ca_en50221.c            |    1 +
 drivers/media/dvb-core/dvb_frontend.c              |  222 +-
 drivers/media/dvb-core/dvb_net.c                   |   25 +-
 drivers/media/dvb-core/dvbdev.c                    |    3 +
 drivers/media/dvb-frontends/Kconfig                |   12 -
 drivers/media/dvb-frontends/Makefile               |    1 -
 drivers/media/dvb-frontends/drx39xyj/drxj.h        |   35 +-
 drivers/media/dvb-frontends/mxl692.c               |    4 +-
 drivers/media/dvb-frontends/rtl2832_sdr.c          |    4 -
 drivers/media/i2c/Kconfig                          |   22 +
 drivers/media/i2c/Makefile                         |    1 +
 drivers/media/i2c/adv7170.c                        |    6 +-
 drivers/media/i2c/adv7175.c                        |    6 +-
 drivers/media/i2c/adv7180.c                        |   18 +-
 drivers/media/i2c/adv7183.c                        |    8 +-
 drivers/media/i2c/adv748x/adv748x-afe.c            |   13 +-
 drivers/media/i2c/adv748x/adv748x-csi2.c           |   14 +-
 drivers/media/i2c/adv748x/adv748x-hdmi.c           |   13 +-
 drivers/media/i2c/adv7511-v4l2.c                   |   10 +-
 drivers/media/i2c/adv7604.c                        |   12 +-
 drivers/media/i2c/adv7842.c                        |   53 +-
 drivers/media/i2c/ak7375.c                         |   10 +-
 drivers/media/i2c/ak881x.c                         |    6 +-
 drivers/media/i2c/ccs/ccs-core.c                   |  125 +-
 drivers/media/i2c/ccs/ccs-limits.c                 |    4 +
 drivers/media/i2c/ccs/ccs-limits.h                 |    4 +
 drivers/media/i2c/ccs/ccs-regs.h                   |    6 +-
 drivers/media/i2c/cx25840/cx25840-core.c           |    2 +-
 drivers/media/i2c/dw9714.c                         |   10 +-
 drivers/media/i2c/dw9768.c                         |   10 +-
 drivers/media/i2c/dw9807-vcm.c                     |   10 +-
 drivers/media/i2c/et8ek8/et8ek8_driver.c           |   23 +-
 drivers/media/i2c/hi556.c                          |   18 +-
 drivers/media/i2c/imx208.c                         | 1088 +++++
 drivers/media/i2c/imx214.c                         |   43 +-
 drivers/media/i2c/imx219.c                         |   36 +-
 drivers/media/i2c/imx258.c                         |   25 +-
 drivers/media/i2c/imx274.c                         |   41 +-
 drivers/media/i2c/imx290.c                         |   26 +-
 drivers/media/i2c/imx319.c                         |   24 +-
 drivers/media/i2c/imx334.c                         |   35 +-
 drivers/media/i2c/imx355.c                         |   24 +-
 drivers/media/i2c/ir-kbd-i2c.c                     |    4 +-
 drivers/media/i2c/m5mols/m5mols_core.c             |   21 +-
 drivers/media/i2c/max9271.c                        |   42 +-
 drivers/media/i2c/max9271.h                        |    9 +
 drivers/media/i2c/max9286.c                        |   58 +-
 drivers/media/i2c/ml86v7667.c                      |    4 +-
 drivers/media/i2c/mt9m001.c                        |   27 +-
 drivers/media/i2c/mt9m032.c                        |   38 +-
 drivers/media/i2c/mt9m111.c                        |   18 +-
 drivers/media/i2c/mt9p031.c                        |   45 +-
 drivers/media/i2c/mt9t001.c                        |   44 +-
 drivers/media/i2c/mt9t112.c                        |   14 +-
 drivers/media/i2c/mt9v011.c                        |    6 +-
 drivers/media/i2c/mt9v032.c                        |   44 +-
 drivers/media/i2c/mt9v111.c                        |   25 +-
 drivers/media/i2c/noon010pc30.c                    |   19 +-
 drivers/media/i2c/ov02a10.c                        |   23 +-
 drivers/media/i2c/ov13858.c                        |   24 +-
 drivers/media/i2c/ov2640.c                         |   16 +-
 drivers/media/i2c/ov2659.c                         |   47 +-
 drivers/media/i2c/ov2680.c                         |   23 +-
 drivers/media/i2c/ov2685.c                         |   17 +-
 drivers/media/i2c/ov2740.c                         |   21 +-
 drivers/media/i2c/ov5640.c                         |   14 +-
 drivers/media/i2c/ov5645.c                         |   38 +-
 drivers/media/i2c/ov5647.c                         |   35 +-
 drivers/media/i2c/ov5648.c                         |   20 +-
 drivers/media/i2c/ov5670.c                         |   25 +-
 drivers/media/i2c/ov5675.c                         |   18 +-
 drivers/media/i2c/ov5695.c                         |   21 +-
 drivers/media/i2c/ov6650.c                         |   28 +-
 drivers/media/i2c/ov7251.c                         |   39 +-
 drivers/media/i2c/ov7670.c                         |   17 +-
 drivers/media/i2c/ov772x.c                         |   12 +-
 drivers/media/i2c/ov7740.c                         |   23 +-
 drivers/media/i2c/ov8856.c                         | 2467 ++++++----
 drivers/media/i2c/ov8865.c                         |   22 +-
 drivers/media/i2c/ov9640.c                         |    8 +-
 drivers/media/i2c/ov9650.c                         |   21 +-
 drivers/media/i2c/ov9734.c                         |   18 +-
 drivers/media/i2c/rdacm20.c                        |   88 +-
 drivers/media/i2c/rdacm21.c                        |   71 +-
 drivers/media/i2c/rj54n1cb0c.c                     |   12 +-
 drivers/media/i2c/s5c73m3/s5c73m3-core.c           |   61 +-
 drivers/media/i2c/s5c73m3/s5c73m3.h                |    2 +-
 drivers/media/i2c/s5k4ecgx.c                       |   32 +-
 drivers/media/i2c/s5k5baf.c                        |   55 +-
 drivers/media/i2c/s5k6a3.c                         |   19 +-
 drivers/media/i2c/s5k6aa.c                         |   49 +-
 drivers/media/i2c/saa6588.c                        |    4 +-
 drivers/media/i2c/saa6752hs.c                      |    6 +-
 drivers/media/i2c/saa7115.c                        |    2 +-
 drivers/media/i2c/saa717x.c                        |    2 +-
 drivers/media/i2c/sr030pc30.c                      |    8 +-
 drivers/media/i2c/st-mipid02.c                     |   21 +-
 drivers/media/i2c/tc358743.c                       |    9 +-
 drivers/media/i2c/tda1997x.c                       |   14 +-
 drivers/media/i2c/tvp514x.c                        |   12 +-
 drivers/media/i2c/tvp5150.c                        |   36 +-
 drivers/media/i2c/tvp7002.c                        |   11 +-
 drivers/media/i2c/tw9910.c                         |   10 +-
 drivers/media/i2c/video-i2c.c                      |   12 +-
 drivers/media/i2c/vs6624.c                         |    8 +-
 drivers/media/mc/Makefile                          |    2 +-
 drivers/media/mc/mc-entity.c                       |    2 +-
 drivers/media/mc/mc-request.c                      |    3 +-
 drivers/media/pci/bt8xx/bt878.c                    |    6 +-
 drivers/media/pci/bt8xx/bttv-driver.c              |    6 +-
 drivers/media/pci/cobalt/cobalt-driver.c           |    1 +
 drivers/media/pci/cobalt/cobalt-driver.h           |    7 +-
 drivers/media/pci/cx18/cx18-av-core.c              |    2 +-
 drivers/media/pci/cx88/cx88-alsa.c                 |    6 +-
 drivers/media/pci/cx88/cx88-blackbird.c            |    3 +-
 drivers/media/pci/cx88/cx88-core.c                 |    6 +-
 drivers/media/pci/cx88/cx88-dvb.c                  |    3 +-
 drivers/media/pci/cx88/cx88-mpeg.c                 |    6 +-
 drivers/media/pci/cx88/cx88-vbi.c                  |    3 +-
 drivers/media/pci/cx88/cx88-video.c                |    5 +-
 drivers/media/pci/intel/ipu3/cio2-bridge.c         |   10 +-
 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c      |   20 +-
 drivers/media/pci/ivtv/Kconfig                     |   12 -
 drivers/media/pci/ivtv/ivtv-driver.h               |    2 -
 drivers/media/pci/ivtv/ivtv-ioctl.c                |  221 -
 drivers/media/pci/saa7134/saa7134-core.c           |   40 +-
 drivers/media/pci/saa7134/saa7134-empress.c        |    5 +-
 drivers/media/pci/saa7134/saa7134-tvaudio.c        |    2 +-
 drivers/media/pci/saa7134/saa7134-video.c          |    6 +-
 drivers/media/pci/ttpci/Kconfig                    |   74 -
 drivers/media/pci/ttpci/Makefile                   |   11 +-
 drivers/media/pci/ttpci/budget-core.c              |    3 +-
 drivers/media/pci/ttpci/budget.h                   |    2 +-
 drivers/media/pci/tw5864/tw5864-reg.h              |   62 +-
 drivers/media/platform/Makefile                    |    1 +
 drivers/media/platform/allegro-dvt/nal-h264.c      |    2 +-
 drivers/media/platform/allegro-dvt/nal-hevc.c      |    2 +-
 drivers/media/platform/am437x/am437x-vpfe.c        |   15 +-
 drivers/media/platform/atmel/Kconfig               |   11 +
 drivers/media/platform/atmel/Makefile              |    2 +
 drivers/media/platform/atmel/atmel-isc-base.c      |  427 +-
 drivers/media/platform/atmel/atmel-isc-regs.h      |  133 +-
 drivers/media/platform/atmel/atmel-isc.h           |  122 +-
 drivers/media/platform/atmel/atmel-isi.c           |   38 +-
 drivers/media/platform/atmel/atmel-sama5d2-isc.c   |  300 +-
 drivers/media/platform/atmel/atmel-sama7g5-isc.c   |  630 +++
 drivers/media/platform/cadence/cdns-csi2rx.c       |    8 +-
 drivers/media/platform/cadence/cdns-csi2tx.c       |   22 +-
 drivers/media/platform/coda/coda-common.c          |   11 +-
 drivers/media/platform/davinci/vpbe_display.c      |    2 +-
 drivers/media/platform/davinci/vpbe_venc.c         |    6 +-
 drivers/media/platform/davinci/vpif_capture.c      |    2 +-
 drivers/media/platform/davinci/vpif_display.c      |    2 +-
 drivers/media/platform/exynos-gsc/gsc-core.c       |   11 +-
 drivers/media/platform/exynos-gsc/gsc-m2m.c        |    4 +-
 drivers/media/platform/exynos4-is/fimc-capture.c   |   28 +-
 drivers/media/platform/exynos4-is/fimc-is.c        |    4 +-
 drivers/media/platform/exynos4-is/fimc-isp-video.c |   10 +-
 drivers/media/platform/exynos4-is/fimc-isp.c       |   44 +-
 drivers/media/platform/exynos4-is/fimc-lite.c      |   44 +-
 drivers/media/platform/exynos4-is/fimc-m2m.c       |    5 +-
 drivers/media/platform/exynos4-is/media-dev.c      |   10 +-
 drivers/media/platform/exynos4-is/mipi-csis.c      |   27 +-
 drivers/media/platform/imx-jpeg/mxc-jpeg.c         |   18 +-
 drivers/media/platform/imx-jpeg/mxc-jpeg.h         |   18 +-
 drivers/media/platform/marvell-ccic/cafe-driver.c  |   12 +-
 drivers/media/platform/marvell-ccic/mcam-core.c    |   14 +-
 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c    |    4 +-
 drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c       |    6 +-
 .../media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c |    4 +-
 .../media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c  |    8 +-
 .../media/platform/mtk-vcodec/mtk_vcodec_dec_pm.h  |    2 +-
 drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h |   26 +-
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c |   92 +-
 .../media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c |   17 +
 drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h   |    2 +-
 .../media/platform/mtk-vcodec/venc/venc_h264_if.c  |    4 +
 drivers/media/platform/mtk-vcodec/venc_ipi_msg.h   |    4 +-
 drivers/media/platform/mtk-vpu/mtk_vpu.c           |   12 +-
 drivers/media/platform/omap3isp/ispccdc.c          |   85 +-
 drivers/media/platform/omap3isp/ispccp2.c          |   49 +-
 drivers/media/platform/omap3isp/ispcsi2.c          |   41 +-
 drivers/media/platform/omap3isp/isppreview.c       |   69 +-
 drivers/media/platform/omap3isp/ispresizer.c       |   70 +-
 drivers/media/platform/pxa_camera.c                |    5 +-
 drivers/media/platform/qcom/camss/camss-csid.c     |   49 +-
 drivers/media/platform/qcom/camss/camss-csiphy.c   |   59 +-
 drivers/media/platform/qcom/camss/camss-ispif.c    |   48 +-
 drivers/media/platform/qcom/camss/camss-vfe.c      |   92 +-
 drivers/media/platform/qcom/venus/core.c           |   60 +-
 drivers/media/platform/qcom/venus/core.h           |    7 +-
 drivers/media/platform/qcom/venus/helpers.c        |    5 +-
 drivers/media/platform/qcom/venus/hfi_cmds.c       |   31 +-
 drivers/media/platform/qcom/venus/hfi_cmds.h       |    2 +-
 drivers/media/platform/qcom/venus/hfi_helper.h     |   10 +-
 drivers/media/platform/qcom/venus/hfi_msgs.c       |   16 +-
 drivers/media/platform/qcom/venus/hfi_msgs.h       |    6 +-
 drivers/media/platform/qcom/venus/hfi_platform.c   |   16 +
 drivers/media/platform/qcom/venus/hfi_platform.h   |    4 +
 .../media/platform/qcom/venus/hfi_platform_v4.c    |   28 +-
 .../media/platform/qcom/venus/hfi_platform_v6.c    |   28 +-
 drivers/media/platform/qcom/venus/pm_helpers.c     |  153 +-
 drivers/media/platform/qcom/venus/vdec.c           |    6 +-
 drivers/media/platform/qcom/venus/venc.c           |    5 +-
 drivers/media/platform/rcar-fcp.c                  |   10 +-
 drivers/media/platform/rcar-vin/rcar-core.c        |    4 +
 drivers/media/platform/rcar-vin/rcar-csi2.c        |   34 +-
 drivers/media/platform/rcar-vin/rcar-dma.c         |    6 +-
 drivers/media/platform/rcar-vin/rcar-v4l2.c        |   16 +-
 drivers/media/platform/rcar_fdp1.c                 |   28 +-
 drivers/media/platform/rcar_jpu.c                  |    6 +-
 drivers/media/platform/renesas-ceu.c               |   11 +-
 drivers/media/platform/rockchip/rga/rga-buf.c      |    3 +-
 drivers/media/platform/rockchip/rga/rga.c          |    4 +-
 .../platform/rockchip/rkisp1/rkisp1-capture.c      |   19 +-
 .../media/platform/rockchip/rkisp1/rkisp1-isp.c    |  112 +-
 .../media/platform/rockchip/rkisp1/rkisp1-params.c |    5 +-
 .../platform/rockchip/rkisp1/rkisp1-resizer.c      |   95 +-
 drivers/media/platform/s3c-camif/camif-capture.c   |   20 +-
 drivers/media/platform/s3c-camif/camif-core.c      |    5 +-
 drivers/media/platform/s5p-g2d/g2d.c               |    3 +
 drivers/media/platform/s5p-jpeg/jpeg-core.c        |    5 +-
 drivers/media/platform/s5p-mfc/s5p_mfc_dec.c       |    1 +
 drivers/media/platform/s5p-mfc/s5p_mfc_pm.c        |    6 +-
 drivers/media/platform/sh_vou.c                    |    6 +-
 drivers/media/platform/sti/bdisp/Makefile          |    2 +-
 drivers/media/platform/sti/bdisp/bdisp-v4l2.c      |    8 +-
 drivers/media/platform/sti/delta/Makefile          |    2 +-
 drivers/media/platform/sti/delta/delta-v4l2.c      |    9 +-
 drivers/media/platform/sti/hva/Makefile            |    2 +-
 drivers/media/platform/sti/hva/hva-hw.c            |   20 +-
 drivers/media/platform/stm32/stm32-dcmi.c          |   19 +-
 .../media/platform/sunxi/sun4i-csi/sun4i_v4l2.c    |   22 +-
 .../media/platform/sunxi/sun6i-csi/sun6i_video.c   |    4 +-
 .../platform/sunxi/sun8i-rotate/sun8i_rotate.c     |    2 +-
 drivers/media/platform/ti-vpe/cal-camerarx.c       |   35 +-
 drivers/media/platform/ti-vpe/cal-video.c          |    4 +-
 drivers/media/platform/ti-vpe/cal.c                |    8 +-
 drivers/media/platform/ti-vpe/vpe.c                |    8 +-
 drivers/media/platform/via-camera.c                |    5 +-
 drivers/media/platform/video-mux.c                 |   32 +-
 drivers/media/platform/vsp1/vsp1_brx.c             |   34 +-
 drivers/media/platform/vsp1/vsp1_clu.c             |   13 +-
 drivers/media/platform/vsp1/vsp1_drv.c             |   10 +-
 drivers/media/platform/vsp1/vsp1_entity.c          |   59 +-
 drivers/media/platform/vsp1/vsp1_entity.h          |   20 +-
 drivers/media/platform/vsp1/vsp1_histo.c           |   51 +-
 drivers/media/platform/vsp1/vsp1_hsit.c            |   14 +-
 drivers/media/platform/vsp1/vsp1_lif.c             |   13 +-
 drivers/media/platform/vsp1/vsp1_lut.c             |   13 +-
 drivers/media/platform/vsp1/vsp1_rwpf.c            |   32 +-
 drivers/media/platform/vsp1/vsp1_rwpf.h            |    2 +-
 drivers/media/platform/vsp1/vsp1_sru.c             |   22 +-
 drivers/media/platform/vsp1/vsp1_uds.c             |   22 +-
 drivers/media/platform/vsp1/vsp1_uif.c             |   27 +-
 drivers/media/platform/xilinx/xilinx-csi2rxss.c    |   26 +-
 drivers/media/platform/xilinx/xilinx-dma.c         |    5 +-
 drivers/media/platform/xilinx/xilinx-tpg.c         |   25 +-
 drivers/media/platform/xilinx/xilinx-vip.c         |   18 +-
 drivers/media/platform/xilinx/xilinx-vip.h         |    4 +-
 drivers/media/radio/si4713/radio-platform-si4713.c |    2 +-
 drivers/media/rc/Kconfig                           |   83 +-
 drivers/media/rc/Makefile                          |    1 -
 drivers/media/rc/imon.c                            |   15 +-
 drivers/media/rc/ite-cir.h                         |    2 +-
 drivers/media/rc/keymaps/Makefile                  |    2 +-
 drivers/media/rc/keymaps/rc-ct-90405.c             |   86 +
 drivers/media/rc/keymaps/rc-tango.c                |   89 -
 drivers/media/rc/st_rc.c                           |   22 +-
 drivers/media/rc/tango-ir.c                        |  267 --
 drivers/media/spi/cxd2880-spi.c                    |   12 +-
 drivers/media/test-drivers/vim2m.c                 |    5 -
 drivers/media/test-drivers/vimc/vimc-debayer.c     |   20 +-
 drivers/media/test-drivers/vimc/vimc-scaler.c      |   36 +-
 drivers/media/test-drivers/vimc/vimc-sensor.c      |   16 +-
 drivers/media/test-drivers/vivid/vivid-core.c      |   44 +-
 drivers/media/test-drivers/vivid/vivid-core.h      |    1 -
 .../media/test-drivers/vivid/vivid-kthread-cap.c   |    2 +-
 drivers/media/test-drivers/vivid/vivid-sdr-cap.c   |    3 -
 drivers/media/test-drivers/vivid/vivid-vbi-cap.c   |    8 +-
 drivers/media/usb/Kconfig                          |    5 -
 drivers/media/usb/airspy/airspy.c                  |    3 -
 drivers/media/usb/au0828/au0828-core.c             |    4 +-
 drivers/media/usb/cpia2/cpia2.h                    |    1 +
 drivers/media/usb/cpia2/cpia2_core.c               |   12 +
 drivers/media/usb/cpia2/cpia2_usb.c                |   13 +-
 drivers/media/usb/cpia2/cpia2_v4l.c                |  149 +-
 drivers/media/usb/dvb-usb-v2/lmedm04.c             |    9 +-
 drivers/media/usb/dvb-usb-v2/rtl28xxu.c            |    5 +-
 drivers/media/usb/dvb-usb/Makefile                 |    2 +-
 drivers/media/usb/dvb-usb/cinergyT2-core.c         |   13 +-
 drivers/media/usb/dvb-usb/cxusb.c                  |    2 +-
 drivers/media/usb/dvb-usb/dtv5100.c                |    7 +-
 drivers/media/usb/em28xx/em28xx-cards.c            |    6 +-
 drivers/media/usb/em28xx/em28xx-input.c            |    8 +-
 drivers/media/usb/go7007/s2250-board.c             |    2 +-
 drivers/media/usb/gspca/cpia1.c                    |    5 +-
 drivers/media/usb/gspca/gl860/gl860.c              |    4 +-
 drivers/media/usb/gspca/ov519.c                    |    2 +-
 drivers/media/usb/gspca/sq905.c                    |    2 +-
 drivers/media/usb/gspca/sunplus.c                  |    8 +-
 drivers/media/usb/hackrf/hackrf.c                  |    3 -
 drivers/media/usb/msi2500/msi2500.c                |    3 -
 drivers/media/usb/pvrusb2/pvrusb2-hdw.c            |    4 +-
 drivers/media/usb/s2255/s2255drv.c                 |    2 -
 drivers/media/usb/ttusb-dec/ttusb_dec.c            |   23 +-
 drivers/media/usb/uvc/uvc_video.c                  |   27 +
 drivers/media/usb/zr364xx/zr364xx.c                |    1 +
 drivers/media/v4l2-core/Kconfig                    |    5 +
 drivers/media/v4l2-core/Makefile                   |    8 +-
 drivers/media/v4l2-core/v4l2-async.c               |   23 +-
 drivers/media/v4l2-core/v4l2-compat-ioctl32.c      |    3 +
 drivers/media/v4l2-core/v4l2-ctrls-api.c           | 1225 +++++
 drivers/media/v4l2-core/v4l2-ctrls-core.c          | 1946 ++++++++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c          | 1579 ++++++
 drivers/media/v4l2-core/v4l2-ctrls-priv.h          |   96 +
 drivers/media/v4l2-core/v4l2-ctrls-request.c       |  496 ++
 drivers/media/v4l2-core/v4l2-ctrls.c               | 5035 ----------------=
----
 drivers/media/v4l2-core/v4l2-dev.c                 |   10 +-
 drivers/media/v4l2-core/v4l2-event.c               |    6 +-
 drivers/media/v4l2-core/v4l2-fh.c                  |    1 +
 drivers/media/v4l2-core/v4l2-ioctl.c               |   38 +-
 drivers/media/v4l2-core/v4l2-subdev.c              |  166 +-
 drivers/media/v4l2-core/videobuf-dma-sg.c          |    1 -
 drivers/staging/media/Kconfig                      |    2 +
 drivers/staging/media/Makefile                     |    1 +
 drivers/staging/media/atomisp/Makefile             |    1 -
 drivers/staging/media/atomisp/TODO                 |    5 +
 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c |   57 +-
 drivers/staging/media/atomisp/i2c/atomisp-gc2235.c |   37 +-
 .../media/atomisp/i2c/atomisp-libmsrlisthelper.c   |    6 +-
 .../staging/media/atomisp/i2c/atomisp-mt9m114.c    |  120 +-
 drivers/staging/media/atomisp/i2c/atomisp-ov2680.c |   36 +-
 drivers/staging/media/atomisp/i2c/atomisp-ov2722.c |   28 +-
 drivers/staging/media/atomisp/i2c/mt9m114.h        |    6 +-
 drivers/staging/media/atomisp/i2c/ov2680.h         |   10 +-
 .../media/atomisp/i2c/ov5693/atomisp-ov5693.c      |   10 +-
 drivers/staging/media/atomisp/pci/atomisp_acc.c    |   12 +-
 drivers/staging/media/atomisp/pci/atomisp_cmd.c    |   52 +-
 drivers/staging/media/atomisp/pci/atomisp_cmd.h    |  161 +-
 .../media/atomisp/pci/atomisp_compat_css20.c       |    4 +-
 .../media/atomisp/pci/atomisp_compat_ioctl32.c     | 1202 -----
 drivers/staging/media/atomisp/pci/atomisp_csi2.c   |   28 +-
 drivers/staging/media/atomisp/pci/atomisp_csi2.h   |    2 +-
 drivers/staging/media/atomisp/pci/atomisp_file.c   |   14 +-
 drivers/staging/media/atomisp/pci/atomisp_fops.c   |   18 +-
 drivers/staging/media/atomisp/pci/atomisp_subdev.c |   68 +-
 drivers/staging/media/atomisp/pci/atomisp_subdev.h |    9 +-
 drivers/staging/media/atomisp/pci/atomisp_tpg.c    |   12 +-
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c   |    6 +-
 drivers/staging/media/atomisp/pci/sh_css.c         | 2089 ++++----
 drivers/staging/media/av7110/Kconfig               |   94 +
 drivers/staging/media/av7110/Makefile              |   22 +
 drivers/staging/media/av7110/TODO                  |    3 +
 .../av7110}/audio-bilingual-channel-select.rst     |    0
 .../staging/media/av7110}/audio-channel-select.rst |    0
 .../staging/media/av7110}/audio-clear-buffer.rst   |    0
 .../staging/media/av7110}/audio-continue.rst       |    0
 .../staging/media/av7110}/audio-fclose.rst         |    0
 .../staging/media/av7110}/audio-fopen.rst          |    0
 .../staging/media/av7110}/audio-fwrite.rst         |    0
 .../media/av7110}/audio-get-capabilities.rst       |    0
 .../staging/media/av7110}/audio-get-status.rst     |    0
 .../staging/media/av7110}/audio-pause.rst          |    0
 .../staging/media/av7110}/audio-play.rst           |    0
 .../staging/media/av7110}/audio-select-source.rst  |    0
 .../staging/media/av7110}/audio-set-av-sync.rst    |    0
 .../media/av7110}/audio-set-bypass-mode.rst        |    2 +-
 .../staging/media/av7110}/audio-set-id.rst         |    0
 .../staging/media/av7110}/audio-set-mixer.rst      |    0
 .../staging/media/av7110}/audio-set-mute.rst       |    0
 .../staging/media/av7110}/audio-set-streamtype.rst |    0
 .../staging/media/av7110}/audio-stop.rst           |    0
 .../dvb =3D> drivers/staging/media/av7110}/audio.h   |    0
 .../dvb =3D> drivers/staging/media/av7110}/audio.rst |    2 +-
 .../staging/media/av7110}/audio_data_types.rst     |    0
 .../staging/media/av7110}/audio_function_calls.rst |    0
 .../pci/ttpci =3D> staging/media/av7110}/av7110.c    |    0
 .../pci/ttpci =3D> staging/media/av7110}/av7110.h    |    7 +-
 .../pci/ttpci =3D> staging/media/av7110}/av7110_av.c |    0
 .../pci/ttpci =3D> staging/media/av7110}/av7110_av.h |    0
 .../pci/ttpci =3D> staging/media/av7110}/av7110_ca.c |    0
 .../pci/ttpci =3D> staging/media/av7110}/av7110_ca.h |    0
 .../pci/ttpci =3D> staging/media/av7110}/av7110_hw.c |    0
 .../pci/ttpci =3D> staging/media/av7110}/av7110_hw.h |    0
 .../ttpci =3D> staging/media/av7110}/av7110_ipack.c  |    0
 .../ttpci =3D> staging/media/av7110}/av7110_ipack.h  |    0
 .../pci/ttpci =3D> staging/media/av7110}/av7110_ir.c |    0
 .../ttpci =3D> staging/media/av7110}/av7110_v4l.c    |    0
 .../ttpci =3D> staging/media/av7110}/budget-patch.c  |    0
 .../ttpci =3D> staging/media/av7110}/dvb_filter.c    |    0
 .../ttpci =3D> staging/media/av7110}/dvb_filter.h    |    0
 .../dvb =3D> drivers/staging/media/av7110}/osd.h     |    0
 .../media/av7110}/sp8870.c                         |    0
 .../media/av7110}/sp8870.h                         |    0
 .../staging/media/av7110}/video-clear-buffer.rst   |    0
 .../staging/media/av7110}/video-command.rst        |    0
 .../staging/media/av7110}/video-continue.rst       |    0
 .../staging/media/av7110}/video-fast-forward.rst   |    0
 .../staging/media/av7110}/video-fclose.rst         |    0
 .../staging/media/av7110}/video-fopen.rst          |    0
 .../staging/media/av7110}/video-freeze.rst         |    0
 .../staging/media/av7110}/video-fwrite.rst         |    0
 .../media/av7110}/video-get-capabilities.rst       |    0
 .../staging/media/av7110}/video-get-event.rst      |    0
 .../media/av7110}/video-get-frame-count.rst        |    0
 .../staging/media/av7110}/video-get-pts.rst        |    0
 .../staging/media/av7110}/video-get-size.rst       |    0
 .../staging/media/av7110}/video-get-status.rst     |    0
 .../staging/media/av7110}/video-play.rst           |    0
 .../staging/media/av7110}/video-select-source.rst  |    0
 .../staging/media/av7110}/video-set-blank.rst      |    0
 .../media/av7110}/video-set-display-format.rst     |    0
 .../staging/media/av7110}/video-set-format.rst     |    0
 .../staging/media/av7110}/video-set-streamtype.rst |    0
 .../staging/media/av7110}/video-slowmotion.rst     |    0
 .../staging/media/av7110}/video-stillpicture.rst   |    0
 .../staging/media/av7110}/video-stop.rst           |    0
 .../staging/media/av7110}/video-try-command.rst    |    0
 .../dvb =3D> drivers/staging/media/av7110}/video.h   |    0
 .../dvb =3D> drivers/staging/media/av7110}/video.rst |    2 +-
 .../staging/media/av7110}/video_function_calls.rst |    0
 .../staging/media/av7110}/video_types.rst          |    0
 drivers/staging/media/hantro/Kconfig               |   10 +-
 drivers/staging/media/hantro/Makefile              |   15 +-
 drivers/staging/media/hantro/hantro.h              |   13 +-
 drivers/staging/media/hantro/hantro_drv.c          |  185 +-
 drivers/staging/media/hantro/hantro_g1.c           |   39 +
 drivers/staging/media/hantro/hantro_g1_h264_dec.c  |   10 +-
 drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c |  119 +-
 drivers/staging/media/hantro/hantro_g1_vp8_dec.c   |    6 +-
 drivers/staging/media/hantro/hantro_g2_hevc_dec.c  |  586 +++
 drivers/staging/media/hantro/hantro_g2_regs.h      |  198 +
 drivers/staging/media/hantro/hantro_h1_jpeg_enc.c  |    4 +-
 drivers/staging/media/hantro/hantro_hevc.c         |  333 ++
 drivers/staging/media/hantro/hantro_hw.h           |  101 +-
 drivers/staging/media/hantro/hantro_mpeg2.c        |    2 +-
 drivers/staging/media/hantro/hantro_postproc.c     |   14 +
 drivers/staging/media/hantro/hantro_v4l2.c         |   14 +-
 drivers/staging/media/hantro/imx8m_vpu_hw.c        |   79 +-
 drivers/staging/media/hantro/rk3288_vpu_hw.c       |  236 -
 drivers/staging/media/hantro/rk3399_vpu_hw.c       |  222 -
 ...u_hw_jpeg_enc.c =3D> rockchip_vpu2_hw_jpeg_enc.c} |   32 +-
 ...hw_mpeg2_dec.c =3D> rockchip_vpu2_hw_mpeg2_dec.c} |  123 +-
 ...vpu_hw_vp8_dec.c =3D> rockchip_vpu2_hw_vp8_dec.c} |    6 +-
 .../{rk3399_vpu_regs.h =3D> rockchip_vpu2_regs.h}    |    6 +-
 drivers/staging/media/hantro/rockchip_vpu_hw.c     |  526 ++
 drivers/staging/media/hantro/sama5d4_vdec_hw.c     |  117 +
 drivers/staging/media/imx/imx-ic-prp.c             |   19 +-
 drivers/staging/media/imx/imx-ic-prpencvf.c        |   31 +-
 drivers/staging/media/imx/imx-media-csi.c          |   96 +-
 drivers/staging/media/imx/imx-media-utils.c        |    4 +-
 drivers/staging/media/imx/imx-media-vdic.c         |   24 +-
 drivers/staging/media/imx/imx-media.h              |    2 +-
 drivers/staging/media/imx/imx6-mipi-csi2.c         |   12 +-
 drivers/staging/media/imx/imx7-media-csi.c         |   33 +-
 drivers/staging/media/imx/imx7-mipi-csis.c         | 1042 ++--
 .../media/ipu3/include/{ =3D> uapi}/intel-ipu3.h     |   13 +-
 drivers/staging/media/ipu3/ipu3-abi.h              |    2 +-
 drivers/staging/media/ipu3/ipu3-css-pool.h         |    1 +
 drivers/staging/media/ipu3/ipu3-v4l2.c             |   26 +-
 drivers/staging/media/ipu3/ipu3.c                  |    3 +-
 drivers/staging/media/meson/vdec/vdec_helpers.c    |    2 +-
 drivers/staging/media/omap4iss/iss.h               |    3 -
 drivers/staging/media/omap4iss/iss_csi2.c          |   37 +-
 drivers/staging/media/omap4iss/iss_ipipe.c         |   37 +-
 drivers/staging/media/omap4iss/iss_ipipeif.c       |   47 +-
 drivers/staging/media/omap4iss/iss_resizer.c       |   39 +-
 drivers/staging/media/omap4iss/iss_video.c         |    4 +-
 drivers/staging/media/rkvdec/rkvdec.c              |   12 +-
 drivers/staging/media/sunxi/cedrus/cedrus.c        |   16 +-
 drivers/staging/media/sunxi/cedrus/cedrus.h        |    6 +-
 drivers/staging/media/sunxi/cedrus/cedrus_dec.c    |   12 +-
 drivers/staging/media/sunxi/cedrus/cedrus_h265.c   |   16 +-
 drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c  |   97 +-
 drivers/staging/media/sunxi/cedrus/cedrus_video.c  |   14 +-
 drivers/staging/media/tegra-vde/vde.c              |   22 +-
 drivers/staging/media/tegra-video/csi.c            |   13 +-
 drivers/staging/media/tegra-video/vi.c             |   31 +-
 drivers/staging/media/zoran/zoran.h                |    1 -
 drivers/staging/media/zoran/zoran_card.c           |    7 +-
 drivers/staging/media/zoran/zoran_device.c         |   65 -
 drivers/staging/media/zoran/zoran_device.h         |    2 -
 drivers/staging/media/zoran/zoran_driver.c         |    6 +-
 drivers/staging/media/zoran/zr36016.c              |    3 +-
 drivers/staging/media/zoran/zr36050.c              |    5 +-
 drivers/staging/media/zoran/zr36057.h              |   14 +-
 drivers/staging/media/zoran/zr36060.c              |    3 +-
 include/media/hevc-ctrls.h                         |   52 +-
 include/media/media-dev-allocator.h                |    2 +-
 include/media/mpeg2-ctrls.h                        |   82 -
 include/media/rc-map.h                             |    2 +-
 include/media/v4l2-ctrls.h                         |   11 +-
 include/media/v4l2-subdev.h                        |   78 +-
 include/media/videobuf2-v4l2.h                     |   16 +
 include/uapi/linux/cec-funcs.h                     |    2 +-
 include/uapi/linux/lirc.h                          |    1 -
 include/uapi/linux/v4l2-controls.h                 |  135 +-
 include/uapi/linux/videodev2.h                     |    7 +
 556 files changed, 18934 insertions(+), 14519 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/atmel,isc.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/atmel-isc.txt
 create mode 100644 Documentation/devicetree/bindings/media/i2c/rda,rda5807=
.yaml
 create mode 100644 Documentation/devicetree/bindings/media/microchip,sama5=
d4-vdec.yaml
 create mode 100644 Documentation/devicetree/bindings/media/microchip,xisc.=
yaml
 create mode 100644 Documentation/devicetree/bindings/media/renesas,isp.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/tango-ir.txt
 delete mode 100644 Documentation/userspace-api/media/audio.h.rst.exceptions
 create mode 100644 Documentation/userspace-api/media/drivers/hantro.rst
 delete mode 100644 Documentation/userspace-api/media/video.h.rst.exceptions
 rename drivers/media/{pci/ttpci =3D> common}/ttpci-eeprom.c (100%)
 rename drivers/media/{pci/ttpci =3D> common}/ttpci-eeprom.h (100%)
 create mode 100644 drivers/media/i2c/imx208.c
 create mode 100644 drivers/media/platform/atmel/atmel-sama7g5-isc.c
 create mode 100644 drivers/media/rc/keymaps/rc-ct-90405.c
 delete mode 100644 drivers/media/rc/keymaps/rc-tango.c
 delete mode 100644 drivers/media/rc/tango-ir.c
 create mode 100644 drivers/media/v4l2-core/v4l2-ctrls-api.c
 create mode 100644 drivers/media/v4l2-core/v4l2-ctrls-core.c
 create mode 100644 drivers/media/v4l2-core/v4l2-ctrls-defs.c
 create mode 100644 drivers/media/v4l2-core/v4l2-ctrls-priv.h
 create mode 100644 drivers/media/v4l2-core/v4l2-ctrls-request.c
 delete mode 100644 drivers/media/v4l2-core/v4l2-ctrls.c
 delete mode 100644 drivers/staging/media/atomisp/pci/atomisp_compat_ioctl3=
2.c
 create mode 100644 drivers/staging/media/av7110/Kconfig
 create mode 100644 drivers/staging/media/av7110/Makefile
 create mode 100644 drivers/staging/media/av7110/TODO
 rename {Documentation/userspace-api/media/dvb =3D> drivers/staging/media/a=
v7110}/audio-bilingual-channel-select.rst (100%)
 rename {Documentation/userspace-api/media/dvb =3D> drivers/staging/media/a=
v7110}/audio-channel-select.rst (100%)
 rename {Documentation/userspace-api/media/dvb =3D> drivers/staging/media/a=
v7110}/audio-clear-buffer.rst (100%)
 rename {Documentation/userspace-api/media/dvb =3D> drivers/staging/media/a=
v7110}/audio-continue.rst (100%)
 rename {Documentation/userspace-api/media/dvb =3D> drivers/staging/media/a=
v7110}/audio-fclose.rst (100%)
 rename {Documentation/userspace-api/media/dvb =3D> drivers/staging/media/a=
v7110}/audio-fopen.rst (100%)
 rename {Documentation/userspace-api/media/dvb =3D> drivers/staging/media/a=
v7110}/audio-fwrite.rst (100%)
 rename {Documentation/userspace-api/media/dvb =3D> drivers/staging/media/a=
v7110}/audio-get-capabilities.rst (100%)
 rename {Documentation/userspace-api/media/dvb =3D> drivers/staging/media/a=
v7110}/audio-get-status.rst (100%)
 rename {Documentation/userspace-api/media/dvb =3D> drivers/staging/media/a=
v7110}/audio-pause.rst (100%)
 rename {Documentation/userspace-api/media/dvb =3D> drivers/staging/media/a=
v7110}/audio-play.rst (100%)
 rename {Documentation/userspace-api/media/dvb =3D> drivers/staging/media/a=
v7110}/audio-select-source.rst (100%)
 rename {Documentation/userspace-api/media/dvb =3D> drivers/staging/media/a=
v7110}/audio-set-av-sync.rst (100%)
 rename {Documentation/userspace-api/media/dvb =3D> drivers/staging/media/a=
v7110}/audio-set-bypass-mode.rst (94%)
 rename {Documentation/userspace-api/media/dvb =3D> drivers/staging/media/a=
v7110}/audio-set-id.rst (100%)
 rename {Documentation/userspace-api/media/dvb =3D> drivers/staging/media/a=
v7110}/audio-set-mixer.rst (100%)
 rename {Documentation/userspace-api/media/dvb =3D> drivers/staging/media/a=
v7110}/audio-set-mute.rst (100%)
 rename {Documentation/userspace-api/media/dvb =3D> drivers/staging/media/a=
v7110}/audio-set-streamtype.rst (100%)
 rename {Documentation/userspace-api/media/dvb =3D> drivers/staging/media/a=
v7110}/audio-stop.rst (100%)
 rename {include/uapi/linux/dvb =3D> drivers/staging/media/av7110}/audio.h =
(100%)
 rename {Documentation/userspace-api/media/dvb =3D> drivers/staging/media/a=
v7110}/audio.rst (90%)
 rename {Documentation/userspace-api/media/dvb =3D> drivers/staging/media/a=
v7110}/audio_data_types.rst (100%)
 rename {Documentation/userspace-api/media/dvb =3D> drivers/staging/media/a=
v7110}/audio_function_calls.rst (100%)
 rename drivers/{media/pci/ttpci =3D> staging/media/av7110}/av7110.c (100%)
 rename drivers/{media/pci/ttpci =3D> staging/media/av7110}/av7110.h (98%)
 rename drivers/{media/pci/ttpci =3D> staging/media/av7110}/av7110_av.c (10=
0%)
 rename drivers/{media/pci/ttpci =3D> staging/media/av7110}/av7110_av.h (10=
0%)
 rename drivers/{media/pci/ttpci =3D> staging/media/av7110}/av7110_ca.c (10=
0%)
 rename drivers/{media/pci/ttpci =3D> staging/media/av7110}/av7110_ca.h (10=
0%)
 rename drivers/{media/pci/ttpci =3D> staging/media/av7110}/av7110_hw.c (10=
0%)
 rename drivers/{media/pci/ttpci =3D> staging/media/av7110}/av7110_hw.h (10=
0%)
 rename drivers/{media/pci/ttpci =3D> staging/media/av7110}/av7110_ipack.c =
(100%)
 rename drivers/{media/pci/ttpci =3D> staging/media/av7110}/av7110_ipack.h =
(100%)
 rename drivers/{media/pci/ttpci =3D> staging/media/av7110}/av7110_ir.c (10=
0%)
 rename drivers/{media/pci/ttpci =3D> staging/media/av7110}/av7110_v4l.c (1=
00%)
 rename drivers/{media/pci/ttpci =3D> staging/media/av7110}/budget-patch.c =
(100%)
 rename drivers/{media/pci/ttpci =3D> staging/media/av7110}/dvb_filter.c (1=
00%)
 rename drivers/{media/pci/ttpci =3D> staging/media/av7110}/dvb_filter.h (1=
00%)
 rename {include/uapi/linux/dvb =3D> drivers/staging/media/av7110}/osd.h (1=
00%)
 rename drivers/{media/dvb-frontends =3D> staging/media/av7110}/sp8870.c (1=
00%)
 rename drivers/{media/dvb-frontends =3D> staging/media/av7110}/sp8870.h (1=
00%)
 rename {Documentation/userspace-api/media/dvb =3D> drivers/staging/media/a=
v7110}/video-clear-buffer.rst (100%)
 rename {Documentation/userspace-api/media/dvb =3D> drivers/staging/media/a=
v7110}/video-command.rst (100%)
 rename {Documentation/userspace-api/media/dvb =3D> drivers/staging/media/a=
v7110}/video-continue.rst (100%)
 rename {Documentation/userspace-api/media/dvb =3D> drivers/staging/media/a=
v7110}/video-fast-forward.rst (100%)
 rename {Documentation/userspace-api/media/dvb =3D> drivers/staging/media/a=
v7110}/video-fclose.rst (100%)
 rename {Documentation/userspace-api/media/dvb =3D> drivers/staging/media/a=
v7110}/video-fopen.rst (100%)
 rename {Documentation/userspace-api/media/dvb =3D> drivers/staging/media/a=
v7110}/video-freeze.rst (100%)
 rename {Documentation/userspace-api/media/dvb =3D> drivers/staging/media/a=
v7110}/video-fwrite.rst (100%)
 rename {Documentation/userspace-api/media/dvb =3D> drivers/staging/media/a=
v7110}/video-get-capabilities.rst (100%)
 rename {Documentation/userspace-api/media/dvb =3D> drivers/staging/media/a=
v7110}/video-get-event.rst (100%)
 rename {Documentation/userspace-api/media/dvb =3D> drivers/staging/media/a=
v7110}/video-get-frame-count.rst (100%)
 rename {Documentation/userspace-api/media/dvb =3D> drivers/staging/media/a=
v7110}/video-get-pts.rst (100%)
 rename {Documentation/userspace-api/media/dvb =3D> drivers/staging/media/a=
v7110}/video-get-size.rst (100%)
 rename {Documentation/userspace-api/media/dvb =3D> drivers/staging/media/a=
v7110}/video-get-status.rst (100%)
 rename {Documentation/userspace-api/media/dvb =3D> drivers/staging/media/a=
v7110}/video-play.rst (100%)
 rename {Documentation/userspace-api/media/dvb =3D> drivers/staging/media/a=
v7110}/video-select-source.rst (100%)
 rename {Documentation/userspace-api/media/dvb =3D> drivers/staging/media/a=
v7110}/video-set-blank.rst (100%)
 rename {Documentation/userspace-api/media/dvb =3D> drivers/staging/media/a=
v7110}/video-set-display-format.rst (100%)
 rename {Documentation/userspace-api/media/dvb =3D> drivers/staging/media/a=
v7110}/video-set-format.rst (100%)
 rename {Documentation/userspace-api/media/dvb =3D> drivers/staging/media/a=
v7110}/video-set-streamtype.rst (100%)
 rename {Documentation/userspace-api/media/dvb =3D> drivers/staging/media/a=
v7110}/video-slowmotion.rst (100%)
 rename {Documentation/userspace-api/media/dvb =3D> drivers/staging/media/a=
v7110}/video-stillpicture.rst (100%)
 rename {Documentation/userspace-api/media/dvb =3D> drivers/staging/media/a=
v7110}/video-stop.rst (100%)
 rename {Documentation/userspace-api/media/dvb =3D> drivers/staging/media/a=
v7110}/video-try-command.rst (100%)
 rename {include/uapi/linux/dvb =3D> drivers/staging/media/av7110}/video.h =
(100%)
 rename {Documentation/userspace-api/media/dvb =3D> drivers/staging/media/a=
v7110}/video.rst (93%)
 rename {Documentation/userspace-api/media/dvb =3D> drivers/staging/media/a=
v7110}/video_function_calls.rst (100%)
 rename {Documentation/userspace-api/media/dvb =3D> drivers/staging/media/a=
v7110}/video_types.rst (100%)
 create mode 100644 drivers/staging/media/hantro/hantro_g1.c
 create mode 100644 drivers/staging/media/hantro/hantro_g2_hevc_dec.c
 create mode 100644 drivers/staging/media/hantro/hantro_g2_regs.h
 create mode 100644 drivers/staging/media/hantro/hantro_hevc.c
 delete mode 100644 drivers/staging/media/hantro/rk3288_vpu_hw.c
 delete mode 100644 drivers/staging/media/hantro/rk3399_vpu_hw.c
 rename drivers/staging/media/hantro/{rk3399_vpu_hw_jpeg_enc.c =3D> rockchi=
p_vpu2_hw_jpeg_enc.c} (87%)
 rename drivers/staging/media/hantro/{rk3399_vpu_hw_mpeg2_dec.c =3D> rockch=
ip_vpu2_hw_mpeg2_dec.c} (66%)
 rename drivers/staging/media/hantro/{rk3399_vpu_hw_vp8_dec.c =3D> rockchip=
_vpu2_hw_vp8_dec.c} (99%)
 rename drivers/staging/media/hantro/{rk3399_vpu_regs.h =3D> rockchip_vpu2_=
regs.h} (99%)
 create mode 100644 drivers/staging/media/hantro/rockchip_vpu_hw.c
 create mode 100644 drivers/staging/media/hantro/sama5d4_vdec_hw.c
 rename drivers/staging/media/ipu3/include/{ =3D> uapi}/intel-ipu3.h (99%)
 delete mode 100644 include/media/mpeg2-ctrls.h

