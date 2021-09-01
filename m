Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB72F3FD4B4
	for <lists+linux-media@lfdr.de>; Wed,  1 Sep 2021 09:44:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242765AbhIAHpb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Sep 2021 03:45:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:37160 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242622AbhIAHpa (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 1 Sep 2021 03:45:30 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id ECD9F61056;
        Wed,  1 Sep 2021 07:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630482274;
        bh=7d9gWqwM14m/0JxOAiw1axYJJx9/YDJNio8YZ+eKHzc=;
        h=Date:From:To:Cc:Subject:From;
        b=hHJEcnQVcWx0fNJazz4bWilpjwp33nOHMERleofzgbMX1YR/j390wUtWy7eefnDRs
         bgcTUOXz1GutEZASaMPGrj4VUYfMVAJ14x6EruFuTllM+V/8OPtO2m6m+WILLf269i
         CKWFTfgKzJQdugXCKLjFMbkHUZfhH4r7+IDVfV3aK7SkCpemFbV7uxdmm5zshus3ji
         6Wpm1Ofn+crzFEDDJN78acj7yRfqqDCpwFB77aatoK05NQNySS484WfheTBhTlFfSK
         46fiCl9MaTrXMviR9O0C6AL+NmFzxh2unQuLb8DddCYYig+7BbFbJJbCOuo7UEHAGA
         xwx8Ap4rjfsXw==
Date:   Wed, 1 Sep 2021 09:44:28 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL for v5.15-rc1] media updates
Message-ID: <20210901094428.441b12c5@coco.lan>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Linus,

Please pull from:
  git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/me=
dia/v5.15-1

For:

  - new sensor drivers: imx335, imx412, ov9282;
  - New IR transmitter driver: meson-ir-tx;
  - handro driver gained support for H.264 for Rockchip VDPU2;
  - imx gained support for i.MX8MQ;
  - ti-vpe has gained support for other SoC variants;
  - lots of cleanups, fixes, board additions and doc improvements.

Regards,
Mauro

---

The following changes since commit c500bee1c5b2f1d59b1081ac879d73268ab0ff17:

  Linux 5.14-rc4 (2021-08-01 17:04:17 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/me=
dia/v5.15-1

for you to fetch changes up to 9c3a0f285248899dfa81585bc5d5bc9ebdb8fead:

  Merge tag 'v5.14-rc4' into media_tree (2021-08-05 16:28:43 +0200)

----------------------------------------------------------------
media updates for v5.15-rc1

----------------------------------------------------------------
Andy Shevchenko (8):
      media: atomisp: Remove unused declarations
      media: atomisp: Annotate a couple of definitions with __maybe_unused
      media: atomisp: Remove unused port_enabled variable
      media: atomisp: Move MIPI_PORT_LANES to the only user
      media: atomisp: Remove unused declarations
      media: atomisp: Annotate a couple of definitions with __maybe_unused
      media: atomisp: Remove unused port_enabled variable
      media: atomisp: Move MIPI_PORT_LANES to the only user

Aniket Bhattacharyea (2):
      media: atomisp: Fix whitespace at the beginning of line
      media: atomisp: Fix whitespace at the beginning of line

Baokun Li (1):
      media: atomisp: use list_splice_init in atomisp_compat_css20.c

Bhaskar Chowdhury (1):
      media: atomisp-ov2680: A trivial typo fix

Bingbu Cao (3):
      media: ov2740: use group write for digital gain
      media: ov9734: use group write for digital gain
      media: ov8856: ignore gpio and regulator for ov8856 with ACPI

Christophe JAILLET (2):
      media: saa7134: switch from 'pci_' to 'dma_' API
      media: cxd2880-spi: Fix an error handling path

Colin Ian King (3):
      media: atomisp: remove redundant initialization of variable ret
      media: saa7164: remove redundant continue statement
      media: venus: venc: Fix potential null pointer dereference on pointer=
 fmt

Dafna Hirschfeld (2):
      media: rkisp1: remove field 'vaddr' from 'rkisp1_buffer'
      media: rkisp1: cap: initialize dma buf address in 'buf_init' cb

Dan Carpenter (2):
      media: v4l2-subdev: fix some NULL vs IS_ERR() checks
      media: rockchip/rga: fix error handling in probe

Deborah Brouwer (1):
      media: cec-pin: rename timer overrun variables

Deepak R Varma (2):
      media: atomisp: pci: reposition braces as per coding style
      media: atomisp: pci: reposition braces as per coding style

Dinghao Liu (1):
      media: atomisp: Fix runtime PM imbalance in atomisp_pci_probe

Dmitrii Wolf (1):
      media: atomisp: pci: fixed a curly bracket coding style issue.

Dongliang Mu (4):
      media: dvb-usb: fix uninit-value in dvb_usb_adapter_dvb_init
      media: dvb-usb: fix uninit-value in vp702x_read_mac_addr
      media: dvb-usb: Fix error handling in dvb_usb_i2c_init
      media: em28xx-input: fix refcount bug in em28xx_usb_disconnect

Eugen Hristev (1):
      media: atmel: atmel-sama5d2-isc: fix YUYV format

Evgeny Novikov (2):
      media: platform: stm32: unprepare clocks at handling errors in probe
      media: tegra-cec: Handle errors of clk_prepare_enable()

Ezequiel Garcia (7):
      media: gspca: Drop default m
      media: hantro: vp8: Move noisy WARN_ON to vpu_debug
      media: hantro: Make struct hantro_variant.init() optional
      media: hantro: Avoid redundant hantro_get_{dst,src}_buf() calls
      media: hantro: h264: Move DPB valid and long-term bitmaps
      media: hantro: h264: Move reference picture number to a helper
      media: hantro: Enable H.264 on Rockchip VDPU2

Fabio Estevam (3):
      media: dt-bindings: adv7180: Introduce the 'reset-gpios' property
      media: i2c: adv7180: Print the chip ID on probe
      media: dt-bindings: adv7180: Introduce 'adv,force-bt656-4' property

Fabio M. De Francesco (4):
      media: atomisp: pci: Remove checks before kfree/kvfree
      media: atomisp: pci: Remove unnecessary (void *) cast
      media: atomisp: pci: Remove checks before kfree/kvfree
      media: atomisp: pci: Remove unnecessary (void *) cast

Frieder Schrempf (1):
      media: adv7180: Add optional reset GPIO

Hans Verkuil (4):
      media: include/uapi/linux/cec.h: typo: SATERDAY -> SATURDAY
      media: vivid: increase max number of allowed
      media: media/cec-core.rst: update adap_enable doc
      media: v4l2-dv-timings.c: fix wrong condition in two for-loops

Herman (5):
      media: drivers/media/pci/tw5864/Tw5864-reg.h: fix typo issues
      media: drivers/media/usb/gspca: fix typo Fliker -> Flicker
      media: drivers/media/platform/davinci/vpfe_capture.c : fix typo Proab=
ably > Probably
      media: drivers/media/platform/s5p-mfc/s5p_mfc_opr_v5.c : fix typo 'in=
 deed imporant' > 'indeed important'
      media: drivers/media/platform/marvell-ccic/mcam-core.c : fix typo 'ge=
ttig' > 'getting'

Jernej Skrabec (2):
      media: hevc: Add segment address field
      media: cedrus: hevc: Add support for multiple slices

Jiabing Wan (2):
      media: atomisp: Align block comments
      media: atomisp: Align block comments

Jonas Karlman (1):
      media: hantro: Add H.264 support for Rockchip VDPU2

J=C3=A1n =C4=8C=C3=A1ni (1):
      media: dvbsky: add support for MyGica T230C2_LITE and T230A

Kees Cook (2):
      media: atomisp: Perform a single memset() for union
      media: atomisp: Perform a single memset() for union

Krzysztof Ha=C5=82asa (4):
      media: TDA1997x: enable EDID support
      media: Fix cosmetic error in TDA1997x driver
      media: TDA1997x: fix tda1997x_query_dv_timings() return value
      media: TDA1997x: report -ENOLINK after disconnecting HDMI source

Laurent Pinchart (5):
      media: imx258: Rectify mismatch of VTS value
      media: dt-bindings: media: nxp,imx7-csi: Add i.MX8MM support
      media: imx: imx7-media-csi: Set TWO_8BIT_SENSOR for >=3D 10-bit forma=
ts
      media: imx: imx7-media-csi: Don't set PIXEL_BIT in CSICR1
      media: imx: imx7-media-csi: Fix buffer return upon stream start failu=
re

Mansur Alisha Shaik (2):
      media: venus: helper: do not set constrained parameters for UBWC
      media: venus: venc: add support for V4L2_CID_MPEG_VIDEO_H264_8X8_TRAN=
SFORM control

Martin Kepplinger (2):
      media: dt-bindings: media: document the nxp,imx8mq-mipi-csi2 receiver=
 phy and controller
      media: imx: add a driver for i.MX8MQ mipi csi rx phy and controller

Martina Krasteva (6):
      media: dt-bindings: media: Add bindings for imx335
      media: i2c: Add imx335 camera sensor driver
      media: dt-bindings: media: Add bindings for imx412
      media: i2c: Add imx412 camera sensor driver
      media: dt-bindings: media: Add bindings for ov9282
      media: i2c: Add ov9282 camera sensor driver

Martiros Shakhzadyan (10):
      media: atomisp: Resolve goto style issue in sh_css.c
      media: atomisp: Remove unnecessary parens in sh_css.c
      media: atomisp: Use kcalloc instead of kzalloc with multiply in sh_cs=
s.c
      media: atomisp: Fix line continuation style issue in sh_css.c
      media: atomisp: i2c: Remove a superfluous else clause in atomisp-mt9m=
114.c
      media: atomisp: Resolve goto style issue in sh_css.c
      media: atomisp: Remove unnecessary parens in sh_css.c
      media: atomisp: Use kcalloc instead of kzalloc with multiply in sh_cs=
s.c
      media: atomisp: Fix line continuation style issue in sh_css.c
      media: atomisp: i2c: Remove a superfluous else clause in atomisp-mt9m=
114.c

Matthew Michilot (1):
      media: i2c: adv7180: fix adv7280 BT.656-4 compatibility

Mauro Carvalho Chehab (6):
      media: dib8000: rewrite the init prbs logic
      media: sti: don't copy past the size
      media: uvc: don't do DMA on stack
      media: ivtv: prevent going past the hw arrays
      Merge commit 'c3cdc019a6bf' into media_tree
      Merge tag 'v5.14-rc4' into media_tree

Nguyen Dinh Phi (2):
      media: atomisp: Use sysfs_emit() instead of sprintf() where appropria=
te
      media: atomisp: Use sysfs_emit() instead of sprintf() where appropria=
te

Paul Kocialkowski (3):
      media: hantro: Add support for the Rockchip PX30
      media: dt-bindings: media: rockchip-vpu: Add PX30 compatible
      media: v4l2-subdev: Fix documentation of the subdev_notifier member

Pavel Skripkin (6):
      media: go7007: fix memory leak in go7007_usb_probe
      media: go7007: remove redundant initialization
      media: stkwebcam: fix memory leak in stk_camera_probe
      media: atomisp: remove useless breaks
      media: atomisp: remove dublicate code
      media: atomisp: remove useless returns

Philipp Zabel (1):
      media: coda: fix frame_mem_ctrl for YUV420 and YVU420 formats

Ricardo Ribalda (1):
      media: atomisp: Fix typo "accesible"

Sakari Ailus (9):
      media: Documentation: media: Improve camera sensor documentation
      media: Documentation: media: Fix v4l2-async kerneldoc syntax
      media: Documentation: v4l: Fix V4L2_CID_PIXEL_RATE documentation
      media: Documentation: v4l: Improve frame rate configuration documenta=
tion
      media: Documentation: v4l: Rework LP-11 documentation, add callbacks
      media: v4l: subdev: Add pre_streamon and post_streamoff callbacks
      media: ccs: Implement support for manual LP control
      media: v4l2-flash: Add sanity checks for flash and indicator controls
      media: v4l2-flash: Check whether setting LED brightness succeeded

Sean Young (5):
      media: rc-loopback: return number of emitters rather than error
      media: rc-loopback: use dev_dbg() rather than handrolled debug
      media: rc-loopback: send carrier reports
      media: rc-loopback: max_timeout of UINT_MAX does not work
      media: rc: rename s_learning_mode() to s_wideband_receiver()

Shaokun Zhang (2):
      media: atomisp: remove the repeated declaration
      media: atomisp: remove the repeated declaration

Stanimir Varbanov (3):
      media: docs: ext-ctrls-codec: Document cyclic intra-refresh zero cont=
rol value
      media: v4l2-ctrls: Add intra-refresh period control
      media: venus: venc: Add support for intra-refresh period

Tom Rix (4):
      media: ti-vpe: cal: fix indexing of cal->ctx[] in cal_probe()
      media: atomisp: improve error handling in gc2235_detect()
      media: atomisp: improve error handling in gc2235_detect()
      media: imx: imx7_mipi_csis: convert some switch cases to the default

Tomi Valkeinen (35):
      media: ti-vpe: cal: add g/s_parm for legacy API
      media: ti-vpe: cal: fix error handling in cal_camerarx_create
      media: ti-vpe: cal: remove unused cal_camerarx->dev field
      media: ti-vpe: cal: rename "sensor" to "source"
      media: ti-vpe: cal: move global config from cal_ctx_wr_dma_config to =
runtime resume
      media: ti-vpe: cal: use v4l2_get_link_freq
      media: ti-vpe: cal: add cal_ctx_prepare/unprepare
      media: ti-vpe: cal: change index and cport to u8
      media: ti-vpe: cal: Add CSI2 context
      media: ti-vpe: cal: Add pixel processing context
      media: ti-vpe: cal: rename cal_ctx->index to dma_ctx
      media: ti-vpe: cal: rename CAL_HL_IRQ_MASK
      media: ti-vpe: cal: clean up CAL_CSI2_VC_IRQ_* macros
      media: ti-vpe: cal: catch VC errors
      media: ti-vpe: cal: remove wait when stopping camerarx
      media: ti-vpe: cal: disable csi2 ctx and pix proc at ctx_stop
      media: ti-vpe: cal: allocate pix proc dynamically
      media: ti-vpe: cal: add 'use_pix_proc' field
      media: ti-vpe: cal: add cal_ctx_wr_dma_enable and fix a race
      media: ti-vpe: cal: add vc and datatype fields to cal_ctx
      media: ti-vpe: cal: handle cal_ctx_v4l2_register error
      media: ti-vpe: cal: set field always to V4L2_FIELD_NONE
      media: ti-vpe: cal: fix typo in a comment
      media: ti-vpe: cal: add mbus_code support to cal_mc_enum_fmt_vid_cap
      media: ti-vpe: cal: rename non-MC funcs to cal_legacy_*
      media: ti-vpe: cal: init ctx->v_fmt correctly in MC mode
      media: ti-vpe: cal: remove cal_camerarx->fmtinfo
      media: ti-vpe: cal: support 8 DMA contexts
      media: ti-vpe: cal: cleanup phy iteration in cal_remove
      media: ti-vpe: cal: fix ctx uninitialization
      media: ti-vpe: cal: fix queuing of the initial buffer
      media: ti-vpe: cal: add camerarx locking
      media: ti-vpe: cal: add camerarx enable/disable refcounting
      media: ti-vpe: cal: allow more than 1 source pads
      media: ti-vpe: cal: add embedded data support

Umang Jain (1):
      media: imx258: Limit the max analogue gain to 480

Uwe Kleine-K=C3=B6nig (2):
      media: usb: dvb-usb-v2: af9035: report if i2c client isn't bound
      media: usb: dvb-usb-v2: af9035: let subdrv autoselect enable si2168 a=
nd si2157

Viktor Prutyanov (2):
      media: rc: meson-ir-tx: document device tree bindings
      media: rc: introduce Meson IR TX driver

Wei Yongjun (1):
      media: omap3isp: Fix missing unlock in isp_subdev_notifier_complete()

Xavier Roumegue (1):
      media: ov5640: Complement yuv mbus formats with their 1X16 versions

Yang Yingliang (3):
      media: saa7134: convert list_for_each to entry variant
      media: atomisp: pci: fix error return code in atomisp_pci_probe()
      media: atomisp: pci: fix error return code in atomisp_pci_probe()

Yizhuo (2):
      media: atomisp: fix the uninitialized use and rename "retvalue"
      media: atomisp: fix the uninitialized use and rename "retvalue"

Zhen Lei (5):
      media: mc-device.c: use DEVICE_ATTR_RO() helper macro
      media: i2c: et8ek8: use DEVICE_ATTR_RO() helper macro
      media: i2c: use DEVICE_ATTR_RO() helper macro
      media: exynos4-is: use DEVICE_ATTR_RW() helper macro
      media: venus: hfi: fix return value check in sys_get_prop_image_versi=
on()

lijian (5):
      media: i2c: tvp5150: deleted the repeated word
      media: rc: streamzap: Removed unnecessary 'return'
      media: rc: redrat3: Fix a typo
      media: rc: rc-main.c: deleted the repeated word
      media: dvb-frontends: cx24117: Delete 'break' after 'goto'

 .../bindings/media/amlogic,meson-ir-tx.yaml        |   60 +
 .../devicetree/bindings/media/i2c/adv7180.yaml     |    8 +
 .../devicetree/bindings/media/i2c/ovti,ov9282.yaml |   91 ++
 .../devicetree/bindings/media/i2c/sony,imx335.yaml |   91 ++
 .../devicetree/bindings/media/i2c/sony,imx412.yaml |   91 ++
 .../devicetree/bindings/media/nxp,imx7-csi.yaml    |   12 +-
 .../bindings/media/nxp,imx8mq-mipi-csi2.yaml       |  174 +++
 .../devicetree/bindings/media/rockchip-vpu.yaml    |    1 +
 Documentation/driver-api/media/camera-sensor.rst   |   45 +-
 Documentation/driver-api/media/cec-core.rst        |    9 +-
 Documentation/driver-api/media/csi2.rst            |   94 --
 Documentation/driver-api/media/index.rst           |    2 +-
 Documentation/driver-api/media/tx-rx.rst           |  133 ++
 .../userspace-api/media/cec.h.rst.exceptions       |    2 +-
 .../userspace-api/media/v4l/ext-ctrls-codec.rst    |   22 +-
 .../media/v4l/ext-ctrls-image-process.rst          |   29 +-
 MAINTAINERS                                        |   27 +
 drivers/media/cec/core/cec-pin-priv.h              |    4 +-
 drivers/media/cec/core/cec-pin.c                   |   20 +-
 drivers/media/cec/platform/stm32/stm32-cec.c       |   26 +-
 drivers/media/cec/platform/tegra/tegra_cec.c       |   10 +-
 drivers/media/dvb-frontends/cx24117.c              |    1 -
 drivers/media/dvb-frontends/dib8000.c              |   58 +-
 drivers/media/i2c/Kconfig                          |   42 +
 drivers/media/i2c/Makefile                         |    4 +-
 drivers/media/i2c/adv7180.c                        |   66 +-
 drivers/media/i2c/ccs/ccs-core.c                   |   58 +-
 drivers/media/i2c/et8ek8/et8ek8_driver.c           |    5 +-
 drivers/media/i2c/imx258.c                         |    4 +-
 drivers/media/i2c/imx335.c                         | 1129 +++++++++++++++++
 drivers/media/i2c/imx412.c                         | 1272 ++++++++++++++++=
++++
 drivers/media/i2c/ov2740.c                         |   26 +-
 drivers/media/i2c/ov5640.c                         |    4 +
 drivers/media/i2c/ov8856.c                         |   27 +-
 drivers/media/i2c/ov9282.c                         | 1137 +++++++++++++++++
 drivers/media/i2c/ov9734.c                         |   24 +-
 drivers/media/i2c/tda1997x.c                       |   11 +-
 drivers/media/i2c/tvp5150.c                        |    2 +-
 drivers/media/mc/mc-device.c                       |    4 +-
 drivers/media/pci/ivtv/ivtv-cards.h                |   68 +-
 drivers/media/pci/ivtv/ivtv-i2c.c                  |   16 +-
 drivers/media/pci/saa7134/saa7134-alsa.c           |    4 +-
 drivers/media/pci/saa7134/saa7134-core.c           |    7 +-
 drivers/media/pci/saa7164/saa7164-cmd.c            |    3 -
 drivers/media/pci/tw5864/tw5864-reg.h              |    2 +-
 drivers/media/platform/atmel/atmel-sama5d2-isc.c   |   17 +
 drivers/media/platform/coda/coda-bit.c             |   18 +-
 drivers/media/platform/davinci/vpfe_capture.c      |    2 +-
 drivers/media/platform/exynos4-is/media-dev.c      |   13 +-
 drivers/media/platform/marvell-ccic/mcam-core.c    |    2 +-
 drivers/media/platform/omap3isp/isp.c              |    4 +-
 drivers/media/platform/qcom/venus/core.h           |    2 +
 drivers/media/platform/qcom/venus/helpers.c        |    3 +
 drivers/media/platform/qcom/venus/hfi_cmds.c       |    8 +
 drivers/media/platform/qcom/venus/hfi_helper.h     |    5 +
 drivers/media/platform/qcom/venus/hfi_msgs.c       |    2 +-
 drivers/media/platform/qcom/venus/venc.c           |   40 +
 drivers/media/platform/qcom/venus/venc_ctrls.c     |   38 +-
 drivers/media/platform/rcar-vin/rcar-v4l2.c        |    4 +-
 drivers/media/platform/rockchip/rga/rga.c          |   27 +-
 .../platform/rockchip/rkisp1/rkisp1-capture.c      |   12 +-
 .../media/platform/rockchip/rkisp1/rkisp1-common.h |    6 +-
 .../media/platform/rockchip/rkisp1/rkisp1-params.c |    3 +-
 .../media/platform/rockchip/rkisp1/rkisp1-stats.c  |    6 +-
 drivers/media/platform/s5p-mfc/s5p_mfc_opr_v5.c    |    2 +-
 drivers/media/platform/sti/delta/delta-ipc.c       |    3 +-
 drivers/media/platform/ti-vpe/cal-camerarx.c       |  247 ++--
 drivers/media/platform/ti-vpe/cal-video.c          |  176 ++-
 drivers/media/platform/ti-vpe/cal.c                |  278 +++--
 drivers/media/platform/ti-vpe/cal.h                |   66 +-
 drivers/media/platform/ti-vpe/cal_regs.h           |   53 +-
 drivers/media/platform/vsp1/vsp1_entity.c          |    4 +-
 drivers/media/rc/Kconfig                           |   10 +
 drivers/media/rc/Makefile                          |    1 +
 drivers/media/rc/ene_ir.c                          |    2 +-
 drivers/media/rc/lirc_dev.c                        |    6 +-
 drivers/media/rc/mceusb.c                          |    2 +-
 drivers/media/rc/meson-ir-tx.c                     |  407 +++++++
 drivers/media/rc/rc-loopback.c                     |   82 +-
 drivers/media/rc/rc-main.c                         |    2 +-
 drivers/media/rc/redrat3.c                         |    2 +-
 drivers/media/rc/streamzap.c                       |    2 -
 drivers/media/spi/cxd2880-spi.c                    |    7 +-
 drivers/media/test-drivers/vivid/vivid-cec.c       |    2 +-
 drivers/media/usb/dvb-usb-v2/Kconfig               |    2 +
 drivers/media/usb/dvb-usb-v2/af9035.c              |    1 +
 drivers/media/usb/dvb-usb-v2/dvbsky.c              |   37 +-
 drivers/media/usb/dvb-usb/dvb-usb-i2c.c            |    9 +-
 drivers/media/usb/dvb-usb/dvb-usb-init.c           |    2 +-
 drivers/media/usb/dvb-usb/nova-t-usb2.c            |    6 +-
 drivers/media/usb/dvb-usb/vp702x.c                 |   12 +-
 drivers/media/usb/em28xx/em28xx-input.c            |    1 -
 drivers/media/usb/go7007/go7007-driver.c           |   26 -
 drivers/media/usb/go7007/go7007-usb.c              |    2 +-
 drivers/media/usb/gspca/Kconfig                    |    1 -
 drivers/media/usb/gspca/vc032x.c                   |    6 +-
 drivers/media/usb/gspca/zc3xx.c                    |  134 +--
 drivers/media/usb/stkwebcam/stk-webcam.c           |    6 +-
 drivers/media/usb/uvc/uvc_v4l2.c                   |   34 +-
 drivers/media/v4l2-core/v4l2-ctrls-defs.c          |    2 +
 drivers/media/v4l2-core/v4l2-dv-timings.c          |    4 +-
 drivers/media/v4l2-core/v4l2-flash-led-class.c     |   80 +-
 drivers/staging/media/atomisp/i2c/atomisp-gc2235.c |   13 +-
 .../staging/media/atomisp/i2c/atomisp-mt9m114.c    |   22 +-
 drivers/staging/media/atomisp/i2c/ov2680.h         |    2 +-
 .../media/atomisp/i2c/ov5693/atomisp-ov5693.c      |    2 +-
 drivers/staging/media/atomisp/pci/atomisp_compat.h |    2 -
 .../media/atomisp/pci/atomisp_compat_css20.c       |   38 +-
 drivers/staging/media/atomisp/pci/atomisp_csi2.c   |    3 +-
 drivers/staging/media/atomisp/pci/atomisp_drvfs.c  |    6 +-
 .../media/atomisp/pci/atomisp_gmin_platform.c      |    8 +-
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c   |    4 +-
 .../pci/hive_isp_css_common/host/input_system.c    |   62 -
 .../media/atomisp/pci/input_system_ctrl_defs.h     |    2 +-
 .../pci/isp/kernels/anr/anr_1.0/ia_css_anr_types.h |    4 +-
 .../media/atomisp/pci/isp2400_input_system_local.h |   32 +-
 .../media/atomisp/pci/isp_acquisition_defs.h       |    2 +-
 .../staging/media/atomisp/pci/isp_capture_defs.h   |    2 +-
 .../media/atomisp/pci/runtime/isys/src/rx.c        |   14 +-
 drivers/staging/media/atomisp/pci/sh_css.c         |   47 +-
 .../staging/media/atomisp/pci/sh_css_firmware.c    |    6 +-
 drivers/staging/media/atomisp/pci/sh_css_mipi.c    |   69 +-
 drivers/staging/media/atomisp/pci/sh_css_params.c  |  171 ++-
 drivers/staging/media/atomisp/pci/sh_css_sp.c      |  108 +-
 drivers/staging/media/atomisp/pci/sh_css_version.c |    3 +-
 drivers/staging/media/hantro/Makefile              |    1 +
 drivers/staging/media/hantro/hantro.h              |    4 +-
 drivers/staging/media/hantro/hantro_drv.c          |   11 +-
 drivers/staging/media/hantro/hantro_g1_h264_dec.c  |   48 +-
 drivers/staging/media/hantro/hantro_g1_vp8_dec.c   |   31 +-
 drivers/staging/media/hantro/hantro_h264.c         |   24 +
 drivers/staging/media/hantro/hantro_hw.h           |    8 +
 .../media/hantro/rockchip_vpu2_hw_h264_dec.c       |  491 ++++++++
 .../media/hantro/rockchip_vpu2_hw_vp8_dec.c        |   32 +-
 drivers/staging/media/hantro/rockchip_vpu_hw.c     |   43 +-
 drivers/staging/media/hantro/sama5d4_vdec_hw.c     |    6 -
 drivers/staging/media/imx/Makefile                 |    1 +
 drivers/staging/media/imx/imx7-media-csi.c         |   36 +-
 drivers/staging/media/imx/imx7-mipi-csis.c         |    6 +-
 drivers/staging/media/imx/imx8mq-mipi-csi2.c       |  991 +++++++++++++++
 drivers/staging/media/sunxi/cedrus/cedrus_h265.c   |   26 +-
 drivers/staging/media/sunxi/cedrus/cedrus_video.c  |    1 +
 drivers/staging/media/tegra-video/vi.c             |    4 +-
 include/media/dvb-usb-ids.h                        |    2 +
 include/media/hevc-ctrls.h                         |    3 +-
 include/media/rc-core.h                            |    5 +-
 include/media/v4l2-async.h                         |   30 +-
 include/media/v4l2-subdev.h                        |   27 +-
 include/uapi/linux/cec.h                           |    2 +-
 include/uapi/linux/v4l2-controls.h                 |    1 +
 150 files changed, 7973 insertions(+), 1339 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/amlogic,meson-i=
r-tx.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov9282=
.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx335=
.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx412=
.yaml
 create mode 100644 Documentation/devicetree/bindings/media/nxp,imx8mq-mipi=
-csi2.yaml
 delete mode 100644 Documentation/driver-api/media/csi2.rst
 create mode 100644 Documentation/driver-api/media/tx-rx.rst
 create mode 100644 drivers/media/i2c/imx335.c
 create mode 100644 drivers/media/i2c/imx412.c
 create mode 100644 drivers/media/i2c/ov9282.c
 create mode 100644 drivers/media/rc/meson-ir-tx.c
 create mode 100644 drivers/staging/media/hantro/rockchip_vpu2_hw_h264_dec.c
 create mode 100644 drivers/staging/media/imx/imx8mq-mipi-csi2.c

