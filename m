Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE60117F4D
	for <lists+linux-media@lfdr.de>; Wed,  8 May 2019 19:46:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726681AbfEHRqF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 May 2019 13:46:05 -0400
Received: from casper.infradead.org ([85.118.1.10]:44884 "EHLO
        casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726163AbfEHRqF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 May 2019 13:46:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=Q2hZuwco/Y7+ArtDdDPl8yY2a6zF7E8KpFBHTmNjESo=; b=Az8lw6tfkz+lQY9X5K8fVGDY+P
        SY+v2lTktf7mluQl5j/EjxZ4ub0h9F/SAXeS3xne1Fbeu2PHxQR5ieVvB3q7uxfmEd4yPY0bz8n5y
        kTogr49Yi4jNspKotffggHlnlFc4dDzc+hEc03f+p1z0LxP4+poSbPV1wSNcR8vm8opymFtDP9GAR
        8adrNdcmq2luafvTKxM5L1WYGOKMGsSHGUntHurrjLVNkxQ8x090rvr92EvtPtvtnvMJkyQp7rFsg
        RLF1x66SSfFBU2XGJ875vdw+geyAxi+KLXJ/VrcrQYXSgdZfIaTRyrqpLxXPdYTtCtGJhdhMLIxyG
        F4dJ484g==;
Received: from [177.157.75.203] (helo=coco.lan)
        by casper.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hOQdl-0007nZ-Dl; Wed, 08 May 2019 17:46:02 +0000
Date:   Wed, 8 May 2019 14:45:56 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL for v5.2-rc1] media updates
Message-ID: <20190508144509.1cc8c7d5@coco.lan>
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
dia/v5.1-2

For:

- Removal of the deprecated Zoran driver from staging;
- New I2C driver: ST MIPID02 CSI-2 camera bridge;
- New platform driver: Amlogic Meson AO CEC G12A Controller;
- Added support for USB audio via the media controller;
- au0828 driver is now supported via the media controller on
  both on media and on usbaudio;
- New kernel test for the media device allocator;
- Add support for stateless decoder at vicodec driver;
- Lots of other driver improvements fixes and cleanups.

You may expect a minor conflict with the staging tree due to
Zoran driver removal. The fix is simple: just remove the
driver :-)

Thanks!
Mauro

-

The following changes since commit 9e98c678c2d6ae3a17cb2de55d17f69dddaa231b:

  Linux 5.1-rc1 (2019-03-17 14:22:26 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/me=
dia/v5.1-2

for you to fetch changes up to 0d672fffb447aa1699d76fdacd90dc31eeb66d97:

  media: dt-bindings: aspeed-video: Add missing memory-region property (201=
9-04-30 13:53:12 -0400)

----------------------------------------------------------------
media updates for v5.1-rc1

----------------------------------------------------------------
Akinobu Mita (5):
      media: ov7670: restore default settings after power-up
      media: ov7670: don't access registers when the device is powered off
      media: ov7740: enable to get exposure control in autoexposure mode
      media: ov2659: make S_FMT succeed even if requested format doesn't ma=
tch
      media: ov2659: fix unbalanced mutex_lock/unlock

Alexander Potapenko (1):
      media: vivid: use vfree() instead of kfree() for dev->bitmap_cap

Alexandre Courbot (3):
      media: mtk-vcodec: fix access to vb2_v4l2_buffer struct
      media: mtk-vcodec: fix access to incorrect planes member
      media: mtk-vcodec: remove ready_to_display

Andreas Kemnade (1):
      media: dvb: init i2c already in it930x_frontend_attach

Arnd Bergmann (12):
      media: saa7146: avoid high stack usage with clang
      media: go7007: avoid clang frame overflow warning with KASAN
      media: vicodec: avoid clang frame size warning
      media: i2c: adv748x: select V4L2_FWNODE
      media: staging: davinci_vpfe: disallow building with COMPILE_TEST
      media: staging/intel-ipu3-v4l: reduce kernel stack usage
      media: staging/intel-ipu3: mark PM function as __maybe_unused
      media: staging/intel-ipu3: reduce kernel stack usage
      media: staging: media: davinci_vpfe: fix large stack usage with clang
      media: staging: media: imx7-mipi-csis: fix debugfs compilation
      media: davinci-isif: avoid uninitialized variable use
      media: seco-cec: fix building with RC_CORE=3Dm

Biju Das (4):
      media: dt-bindings: media: rcar-csi2: Add r8a774a1 support
      media: rcar-csi2: Enable support for r8a774a1
      media: dt-bindings: media: rcar_vin: Add r8a774a1 support
      media: rcar-vin: Enable support for r8a774a1

Bingbu Cao (1):
      media: staging/intel-ipu3: parameter buffer refactoring

Colin Ian King (2):
      media: em28xx-input: make const array addr_list static
      media: dvb: clean up redundant break statements

Dafna Hirschfeld (20):
      media: vicodec: selection api should only check single buffer types
      media: vicodec: upon release, call m2m release before freeing ctrl ha=
ndler
      media: v4l2-ctrl: v4l2_ctrl_request_setup returns with error upon fai=
lure
      media: vicodec: change variable name for the return value of v4l2_fwh=
t_encode
      media: vicodec: bugfix - call v4l2_m2m_buf_copy_metadata also if deco=
ding fails
      media: vicodec: bugfix: free compressed_frame upon device release
      media: vicodec: Move raw frame preparation code to a function
      media: vicodec: add field 'buf' to fwht_raw_frame
      media: vicodec: keep the ref frame according to the format in decoder
      media: vicodec: Validate version dependent header values in a separat=
e function
      media: vicodec: rename v4l2_fwht_default_fmt to v4l2_fwht_find_nth_fmt
      media: vicodec: Handle the case that the reference buffer is NULL
      media: vicodec: add struct for encoder/decoder instance
      media: vicodec: add documentation to V4L2_CID_FWHT_I/P_FRAME_QP
      media: vicodec: add documentation to V4L2_CID_MPEG_VIDEO_FWHT_PARAMS
      media: vicodec: add documentation to V4L2_PIX_FMT_FWHT_STATELESS
      media: vicodec: Introducing stateless fwht defs and structs
      media: vicodec: Register another node for stateless decoder
      media: vicodec: Add support for stateless decoder.
      media: vicodec: set pixelformat to V4L2_PIX_FMT_FWHT_STATELESS for st=
ateless decoder

Dan Carpenter (8):
      media: staging/imx7: Fix an error code in mipi_csis_clk_get()
      media: ivtv: update *pos correctly in ivtv_read_pos()
      media: cx18: update *pos correctly in cx18_read_pos()
      media: wl128x: Fix an error code in fm_download_firmware()
      media: v4l2-ctrl: potential shift wrapping bugs
      media: wl128x: prevent two potential buffer overflows
      media: wl128x: Fix some error handling in fmc_prepare()
      media: pvrusb2: Prevent a buffer overflow

Eddie James (3):
      media: platform: Aspeed: Remove use of reset line
      media: platform: Aspeed: Make reserved memory optional
      media: dt-bindings: aspeed-video: Add missing memory-region property

Eugen Hristev (2):
      media: atmel: atmel-isc: reworked driver and formats
      media: atmel: atmel-isc: removed ARGB32 added ABGR32 and XBGR32

Ezequiel Garcia (4):
      media: gspca: Kill URBs on USB device disconnect
      media: vb2: Minor function naming fix
      media: rockchip/vpu: Rename pixel format helpers
      media: Introduce helpers to fill pixel format structs

Fabien Dessenne (1):
      media: stm32-dcmi: return appropriate error codes during probe

Fish Lin (1):
      media: v4l: add I / P frame min max QP definitions

Geert Uytterhoeven (1):
      media: rcar_drif: Remove devm_ioremap_resource() error printing

Hans Petter Selasky (1):
      media: strscpy() returns a negative value on failure unlike strlcpy().

Hans Verkuil (32):
      media: cec: fill in cec chardev kobject to ease debugging
      media: media-devnode: fill in media chardev kobject to ease debugging
      media: vivid: use vzalloc for dev->bitmap_out
      media: vim2m: replace devm_kzalloc by kzalloc
      media: v4l2-subdev: add release() internal op
      media: v4l2-subdev: handle module refcounting here
      media: vimc: zero the media_device on probe
      media: vimc: free vimc_cap_device when the last user disappears
      media: vimc: use new release op
      media: imx7: fix smatch error
      media: cobalt: replace VB2_BUF_STATE_REQUEUEING by _ERROR
      media: vb2: drop VB2_BUF_STATE_REQUEUEING
      media: gspca: do not resubmit URBs when streaming has stopped
      media: vicodec: remove WARN_ON(1) from get_q_data()
      media: vicodec: reset last_src/dst_buf based on the IS_OUTPUT
      media: vb2: add requires_requests bit for stateless codecs
      media: cedrus: set requires_requests
      media: media requests: return EBADR instead of EACCES
      media: vicodec: fix g_selection: either handle crop or compose
      media: v4l2-ioctl.c: add V4L2_PIX_FMT_FWHT_STATELESS to v4l_fill_fmtd=
esc
      media: v4l2-ctrls.h: remove spurious text
      media: au0828: stop video streaming only when last user stops
      media: videobuf2-v4l2.c: move up STATE_DEQUEUED check
      media: vb2: add waiting_in_dqbuf flag
      media: cec-notifier: add cec_notifier_parse_hdmi_phandle helper
      media: meson: ao-cec: use new cec_notifier_parse_hdmi_phandle helper
      media: s5p_cec: use new cec_notifier_parse_hdmi_phandle helper
      media: stih_cec: use new cec_notifier_parse_hdmi_phandle helper
      media: tegra_cec: use new cec_notifier_parse_hdmi_phandle helper
      media: seco-cec: decrement HDMI device refcount
      media: cros-ec-cec: decrement HDMI device refcount
      media: zoran: remove deprecated driver

Helen Fornazier (8):
      media: vimc: deb: fix default sink bayer format
      media: vimc: stream: fix thread state before sleep
      media: vimc: cap: fix step width/height in enum framesize
      media: vimc: stream: cleanup frame field from struct vimc_stream
      media: vimc: stream: add docs to struct vimc_stream
      media: vimc: stream: init/terminate the first entity
      media: v4l2-common: add bayer formats in v4l2_format_info
      media: vimc: propagate pixel format in the stream

Hugues Fruchet (5):
      media: stm32-dcmi: fix check of pm_runtime_get_sync return value
      media: stm32-dcmi: fix DMA corruption when stopping streaming
      media: stm32-dcmi: fix error messages
      media: stm32-dcmi: do not emit error trace in case of few overrun
      media: stm32-dcmi: fix crash when subdev do not expose any formats

James Hutchinson (1):
      media: m88ds3103: serialize reset messages in m88ds3103_set_frontend

Janusz Krzysztofik (3):
      media: ov6650: Fix sensor possibly not detected on probe
      media: ov6650: Move v4l2_clk_get() to ov6650_video_probe() helper
      media: ov6650: Register with asynchronous subdevice framework

Jernej Skrabec (4):
      media: dt-bindings: media: cedrus: Add H6 compatible
      media: cedrus: Add a quirk for not setting DMA offset
      media: cedrus: Add support for H6
      media: cedrus: Fix initialization order

Jose Alberto Reguero (1):
      media: dvb: Add support for the Avermedia TD310

Kangjie Lu (3):
      media: si2165: fix a missing check of return value
      media: video-mux: fix null pointer dereferences
      media: usbvision: fix a potential NULL pointer dereference

Ken Sloat (1):
      media: atmel-isc: Add support for BT656 with CRC decoding

Koen Vandeputte (1):
      media: i2c: tda1997x: select V4L2_FWNODE

Laurent Pinchart (7):
      media: v4l: rcar_fdp1: Fix indentation oddities
      media: v4l: Add definitions for missing 32-bit RGB formats
      media: v4l: Add definitions for missing 16-bit RGB4444 formats
      media: v4l: Add definitions for missing 16-bit RGB555 formats
      media: vsp1: Add support for missing 32-bit RGB formats
      media: vsp1: Add support for missing 16-bit RGB444 formats
      media: vsp1: Add support for missing 16-bit RGB555 formats

Lucas Leonardo Ciancaglini (1):
      media: staging/imx: Fix inconsistent long line breaks

Mao Wenan (1):
      media: staging: davinci: drop pointless static qualifier in vpfe_resi=
zer_init()

Maoguang Meng (1):
      media: mtk-vcodec: fix vp9 content playback error with show exist fra=
me

Matthias Reichl (1):
      media: rc: xbox_remote: add protocol and set timeout

Mauro Carvalho Chehab (15):
      media: Kconfig files: use the right help coding style
      media: imx214: don't de-reference a NULL pointer
      media: cx2341x: replace badly designed macros
      media: pwc-ctl: pChoose can't be NULL
      media: sti/delta: remove uneeded check
      media: rcar-dma: p_set can't be NULL
      media: hfi_parser: don't trick gcc with a wrong expected size
      media: dvbdev: remove double-unlock
      media: vim2m: Fix RGB 565 BE/LE support
      media: replace strncpy() by strscpy()
      media: bt8xx: avoid a needless u8 to char conversion
      media: staging: use strscpy() instead of strlcpy()
      media: pixfmt-packed-yuv.rst: fix PDF output
      media: pdf docs: adjust several tables for better display
      media: index.rst: exclude Indexes section from latex/pdf output

Mickael Guene (3):
      media: uapi: Add MEDIA_BUS_FMT_BGR888_3X8 media bus format
      media: dt-bindings: Document MIPID02 bindings
      media: st-mipid02: MIPID02 CSI-2 to PARALLEL bridge driver

Neil Armstrong (3):
      media: dt-bindings: media: meson-ao-cec: Add G12A AO-CEC-B Compatible
      media: platform: meson: Add Amlogic Meson G12A AO CEC Controller driv=
er
      media: MAINTAINERS: Update AO CEC with ao-cec-g12a driver

Nicholas Mc Guire (1):
      media: cx23885: check allocation return

Niklas S=C3=B6derlund (6):
      media: rcar-vin: Fix lockdep warning at stream on
      media: dt-bindings: rcar-csi2: List resets as a mandatory property
      media: rcar-csi2: Use standby mode instead of resetting
      media: rcar-csi2: Update V3M and E3 start procedure
      media: rcar-csi2: Update start procedure for H3 ES2
      media: rcar-csi2: Move setting of Field Detection Control Register

Philipp Zabel (8):
      media: coda: set codec earlier
      media: coda: remove mask from decoder h.264 level control
      media: coda: clear error return value before picture run
      media: coda: add min number of buffers controls
      media: coda: disable encoder command on decoder and vice versa
      media: coda: implement encoder frame size enumeration
      media: coda: allow encoder to set colorimetry on the output queue
      media: coda: throw error on create_bufs with too small size

Rui Miguel Silva (1):
      media: imx7-media-csi: don't store a floating pointer

Sakari Ailus (10):
      media: v4l2-fwnode: Defaults may not override endpoint configuration =
in firmware
      media: v4l2-fwnode: The first default data lane is 0 on C-PHY
      media: pxa-camera: Match with device node, not the port node
      media: ti-vpe: Parse local endpoint for properties, not the remote one
      media: v4l: i2c: Regroup lens drivers under their own section
      media: ipu3-cio2: Set CSI-2 receiver sub-device entity function
      media: v4l2-fwnode: Add a deprecation note in the old ACPI parsing ex=
ample
      media: MAINTAINERS: Fix files for obsolete SoC camera framework
      media: soc_camera: Remove leftover files, add TODO
      media: ipu3-imgu: Use %u for formatting unsigned values (not %d)

Sergei Shtylyov (1):
      media: dt-bindings: media: Renesas R-Car IMR bindings

Shaobo He (1):
      media: platform/sh_veu.c: remove redundant NULL pointer checks

Shuah Khan (10):
      media: replace WARN_ON in __media_pipeline_start()
      media: au0828: minor fix to a misleading comment in _close()
      media: Media Device Allocator API
      media: change au0828 to use Media Device Allocator API
      media: media.h: Enable ALSA MEDIA_INTF_T* interface types
      media: sound/usb: Use Media Controller API to share media resources
      media: au0828: fix enable and disable source audio and video inconsis=
tencies
      media: selftests: media_dev_allocator api test
      media: au0828: Fix NULL pointer dereference in au0828_analog_stream_e=
nable()
      media: Clear devnode->media_dev holding media_devnode_lock

Souptick Joarder (1):
      media: videobuf2: Return error after allocation failure

Stefan Br=C3=BCns (1):
      media: dvbsky: Avoid leaking dvb frontend

Steve Longerbeam (6):
      media: imx: vdic: Restore default case to prepare_vdi_in_buffers()
      media: imx: csi: Allow unknown nearest upstream entities
      media: imx: Clear fwnode link struct for each endpoint iteration
      media: imx: Rename functions that add IPU-internal subdevs
      media: imx: Don't register IPU subdevs/links if CSI port missing
      media: imx: vdic: Fix wrong CSI group ID

Wolfram Sang (1):
      media: staging: media: imx: imx7-mipi-csis: simplify getting .driver_=
data

Yannick Fertre (1):
      media: platform: stm32: wait end of transmission

Yizhuo (1):
      media: ts2020: Variable "utmp" in function ts2020_set_tuner_rf() coul=
d be uninitialized

YueHaibing (6):
      media: cpia2: Fix use-after-free in cpia2_exit
      media: rockchip-vpu: Remove duplicated include from rockchip_vpu_drv.c
      media: rc: remove unused including <linux/version.h>
      media: serial_ir: Fix use-after-free in serial_ir_init_module
      media: tw5864: Fix possible NULL pointer dereference in tw5864_handle=
_frame
      media: si2165: fix platform_no_drv_owner.cocci warnings

Yunfei Dong (1):
      media: mtk-vcodec: enlarge struct vdec_pic_info fields

claudiojpaz (1):
      media: staging: media: zoran: Fixes a checkpatch.pl error in videocod=
ec.c

 .../devicetree/bindings/media/aspeed-video.txt     |    6 +
 Documentation/devicetree/bindings/media/cedrus.txt |    1 +
 .../bindings/media/i2c/st,st-mipid02.txt           |   82 +
 .../devicetree/bindings/media/meson-ao-cec.txt     |   13 +-
 .../devicetree/bindings/media/rcar_imr.txt         |   31 +
 .../devicetree/bindings/media/rcar_vin.txt         |    1 +
 .../bindings/media/renesas,rcar-csi2.txt           |    4 +-
 Documentation/media/index.rst                      |    2 +-
 Documentation/media/kapi/mc-core.rst               |   41 +
 Documentation/media/lirc.h.rst.exceptions          |    1 +
 Documentation/media/uapi/mediactl/request-api.rst  |    2 +-
 Documentation/media/uapi/v4l/buffer.rst            |   21 +-
 Documentation/media/uapi/v4l/colorspaces-defs.rst  |    4 +-
 Documentation/media/uapi/v4l/colorspaces.rst       |    4 +-
 Documentation/media/uapi/v4l/dev-raw-vbi.rst       |    4 +-
 Documentation/media/uapi/v4l/dev-rds.rst           |    2 +-
 Documentation/media/uapi/v4l/dev-sliced-vbi.rst    |   22 +-
 Documentation/media/uapi/v4l/dev-subdev.rst        |   82 +-
 Documentation/media/uapi/v4l/ext-ctrls-camera.rst  |   17 +-
 Documentation/media/uapi/v4l/ext-ctrls-codec.rst   |  235 +-
 Documentation/media/uapi/v4l/ext-ctrls-detect.rst  |    2 +-
 Documentation/media/uapi/v4l/ext-ctrls-dv.rst      |    2 +-
 Documentation/media/uapi/v4l/ext-ctrls-flash.rst   |    4 +-
 Documentation/media/uapi/v4l/ext-ctrls-jpeg.rst    |    2 +-
 Documentation/media/uapi/v4l/field-order.rst       |    4 +-
 Documentation/media/uapi/v4l/pixfmt-compressed.rst |    6 +
 Documentation/media/uapi/v4l/pixfmt-meta-d4xx.rst  |    9 +-
 .../media/uapi/v4l/pixfmt-meta-vsp1-hgt.rst        |    9 +
 Documentation/media/uapi/v4l/pixfmt-packed-hsv.rst |    2 +-
 Documentation/media/uapi/v4l/pixfmt-packed-rgb.rst |  440 ++-
 Documentation/media/uapi/v4l/pixfmt-packed-yuv.rst |   23 +-
 Documentation/media/uapi/v4l/pixfmt-srggb10p.rst   |    2 +-
 Documentation/media/uapi/v4l/pixfmt-srggb12p.rst   |    3 +-
 Documentation/media/uapi/v4l/pixfmt-srggb14p.rst   |   24 +-
 .../media/uapi/v4l/pixfmt-v4l2-mplane.rst          |   17 +-
 Documentation/media/uapi/v4l/pixfmt-y10p.rst       |   10 +
 Documentation/media/uapi/v4l/subdev-formats.rst    |  113 +-
 Documentation/media/uapi/v4l/vidioc-qbuf.rst       |   10 +-
 Documentation/media/v4l-drivers/index.rst          |    1 -
 Documentation/media/v4l-drivers/zoran.rst          |  583 ----
 MAINTAINERS                                        |   14 +-
 drivers/media/Kconfig                              |   20 +-
 drivers/media/Makefile                             |    6 +
 drivers/media/cec/Kconfig                          |    4 +-
 drivers/media/cec/cec-core.c                       |    1 +
 drivers/media/cec/cec-notifier.c                   |   30 +
 drivers/media/common/cx2341x.c                     |  151 +-
 drivers/media/common/siano/Kconfig                 |    4 +-
 drivers/media/common/videobuf2/videobuf2-core.c    |   46 +-
 drivers/media/common/videobuf2/videobuf2-v4l2.c    |   24 +-
 drivers/media/common/videobuf2/videobuf2-vmalloc.c |   10 +-
 drivers/media/dvb-core/dvbdev.c                    |    1 -
 drivers/media/dvb-frontends/as102_fe.c             |    2 +-
 drivers/media/dvb-frontends/dib7000p.c             |    3 +-
 drivers/media/dvb-frontends/dib8000.c              |    4 +-
 drivers/media/dvb-frontends/dib9000.c              |    6 +-
 drivers/media/dvb-frontends/drxd_hard.c            |   30 +-
 drivers/media/dvb-frontends/dvb-pll.c              |    2 +-
 drivers/media/dvb-frontends/m88ds3103.c            |   11 +-
 drivers/media/dvb-frontends/si2165.c               |    9 +-
 drivers/media/dvb-frontends/ts2020.c               |    3 +
 drivers/media/i2c/Kconfig                          |  271 +-
 drivers/media/i2c/Makefile                         |    1 +
 drivers/media/i2c/cx25840/Kconfig                  |    2 +-
 drivers/media/i2c/et8ek8/Kconfig                   |    2 +-
 drivers/media/i2c/imx214.c                         |   10 +-
 drivers/media/i2c/m5mols/Kconfig                   |    2 +-
 drivers/media/i2c/ov2659.c                         |    8 +-
 drivers/media/i2c/ov6650.c                         |   43 +-
 drivers/media/i2c/ov7670.c                         |   32 +-
 drivers/media/i2c/ov7740.c                         |   28 +-
 drivers/media/i2c/smiapp/Kconfig                   |    2 +-
 drivers/media/i2c/st-mipid02.c                     | 1033 +++++++
 drivers/media/media-dev-allocator.c                |  135 +
 drivers/media/media-devnode.c                      |    4 +-
 drivers/media/media-entity.c                       |   33 +-
 drivers/media/media-request.c                      |    4 +-
 drivers/media/mmc/siano/Kconfig                    |    2 +-
 drivers/media/pci/bt8xx/Kconfig                    |    2 +-
 drivers/media/pci/bt8xx/dst.c                      |    3 +-
 drivers/media/pci/bt8xx/dst_common.h               |    2 +-
 drivers/media/pci/cobalt/Kconfig                   |    2 +-
 drivers/media/pci/cobalt/cobalt-irq.c              |    2 +-
 drivers/media/pci/cx18/Kconfig                     |    4 +-
 drivers/media/pci/cx18/cx18-fileops.c              |    2 +-
 drivers/media/pci/cx23885/Kconfig                  |    4 +-
 drivers/media/pci/cx23885/cx23885-dvb.c            |    5 +-
 drivers/media/pci/cx25821/Kconfig                  |    4 +-
 drivers/media/pci/cx88/Kconfig                     |   10 +-
 drivers/media/pci/ddbridge/Kconfig                 |    4 +-
 drivers/media/pci/dt3155/Kconfig                   |    2 +-
 drivers/media/pci/intel/ipu3/Kconfig               |    2 +-
 drivers/media/pci/intel/ipu3/ipu3-cio2.c           |    1 +
 drivers/media/pci/ivtv/Kconfig                     |   10 +-
 drivers/media/pci/ivtv/ivtv-fileops.c              |    2 +-
 drivers/media/pci/mantis/mantis_i2c.c              |    2 +-
 drivers/media/pci/meye/Kconfig                     |    2 +-
 drivers/media/pci/netup_unidvb/Kconfig             |    2 +-
 drivers/media/pci/ngene/Kconfig                    |    2 +-
 drivers/media/pci/saa7134/Kconfig                  |   10 +-
 drivers/media/pci/saa7134/saa7134-go7007.c         |    2 +-
 drivers/media/pci/saa7146/Kconfig                  |    6 +-
 drivers/media/pci/saa7146/hexium_gemini.c          |    5 +-
 drivers/media/pci/saa7146/hexium_orion.c           |    5 +-
 drivers/media/pci/saa7164/Kconfig                  |    2 +-
 drivers/media/pci/solo6x10/Kconfig                 |    2 +-
 drivers/media/pci/tw5864/Kconfig                   |    2 +-
 drivers/media/pci/tw5864/tw5864-video.c            |    4 +-
 drivers/media/pci/tw68/Kconfig                     |    2 +-
 drivers/media/platform/Kconfig                     |   90 +-
 drivers/media/platform/am437x/am437x-vpfe.c        |    2 +-
 drivers/media/platform/aspeed-video.c              |   33 +-
 drivers/media/platform/atmel/Kconfig               |    2 +-
 drivers/media/platform/atmel/atmel-isc-regs.h      |    2 +
 drivers/media/platform/atmel/atmel-isc.c           |  906 ++++---
 drivers/media/platform/coda/coda-bit.c             |    3 +
 drivers/media/platform/coda/coda-common.c          |  120 +-
 drivers/media/platform/cros-ec-cec/cros-ec-cec.c   |    1 +
 drivers/media/platform/davinci/isif.c              |    9 -
 drivers/media/platform/davinci/vpfe_capture.c      |    2 +-
 drivers/media/platform/davinci/vpif_capture.c      |    3 +-
 drivers/media/platform/davinci/vpif_display.c      |    4 +-
 drivers/media/platform/exynos4-is/fimc-capture.c   |    2 +-
 drivers/media/platform/exynos4-is/fimc-m2m.c       |    2 +-
 drivers/media/platform/imx-pxp.c                   |    4 +-
 drivers/media/platform/marvell-ccic/Kconfig        |    4 +-
 drivers/media/platform/meson/Makefile              |    1 +
 drivers/media/platform/meson/ao-cec-g12a.c         |  779 ++++++
 drivers/media/platform/meson/ao-cec.c              |   16 +-
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c |   75 +-
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h |    2 -
 drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h |   16 +-
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c |   10 +-
 .../media/platform/mtk-vcodec/vdec/vdec_h264_if.c  |    4 +-
 .../media/platform/mtk-vcodec/vdec/vdec_vp8_if.c   |    4 +-
 .../media/platform/mtk-vcodec/vdec/vdec_vp9_if.c   |   27 +-
 drivers/media/platform/mtk-vpu/mtk_vpu.c           |    2 +-
 drivers/media/platform/mx2_emmaprp.c               |    4 +-
 drivers/media/platform/omap/Kconfig                |    2 +-
 drivers/media/platform/pxa_camera.c                |    2 +-
 drivers/media/platform/qcom/venus/hfi_helper.h     |    4 +-
 drivers/media/platform/rcar-vin/Kconfig            |    3 +-
 drivers/media/platform/rcar-vin/rcar-core.c        |   47 +-
 drivers/media/platform/rcar-vin/rcar-csi2.c        |  120 +-
 drivers/media/platform/rcar-vin/rcar-dma.c         |    2 +-
 drivers/media/platform/rcar_drif.c                 |    8 +-
 drivers/media/platform/rcar_fdp1.c                 |   28 +-
 drivers/media/platform/s5p-cec/s5p_cec.c           |   16 +-
 drivers/media/platform/s5p-g2d/g2d.c               |    6 +-
 drivers/media/platform/seco-cec/seco-cec.c         |    1 +
 drivers/media/platform/sh_veu.c                    |    6 -
 drivers/media/platform/sti/c8sectpfe/Kconfig       |    2 +-
 drivers/media/platform/sti/cec/stih-cec.c          |   21 +-
 drivers/media/platform/sti/delta/delta-ipc.c       |    6 +-
 drivers/media/platform/stm32/stm32-cec.c           |   11 +
 drivers/media/platform/stm32/stm32-dcmi.c          |   60 +-
 .../media/platform/sunxi/sun6i-csi/sun6i_video.c   |    4 +-
 drivers/media/platform/tegra-cec/tegra_cec.c       |   14 +-
 drivers/media/platform/ti-vpe/cal.c                |   12 +-
 drivers/media/platform/ti-vpe/vpe.c                |    6 +-
 drivers/media/platform/vicodec/codec-fwht.c        |  121 +-
 drivers/media/platform/vicodec/codec-fwht.h        |   12 +-
 drivers/media/platform/vicodec/codec-v4l2-fwht.c   |  431 +--
 drivers/media/platform/vicodec/codec-v4l2-fwht.h   |    7 +-
 drivers/media/platform/vicodec/vicodec-core.c      |  762 ++++--
 drivers/media/platform/video-mux.c                 |    5 +
 drivers/media/platform/vim2m.c                     |   69 +-
 drivers/media/platform/vimc/Kconfig                |    2 +-
 drivers/media/platform/vimc/vimc-capture.c         |   93 +-
 drivers/media/platform/vimc/vimc-common.c          |  313 +--
 drivers/media/platform/vimc/vimc-common.h          |   60 +-
 drivers/media/platform/vimc/vimc-core.c            |    2 +
 drivers/media/platform/vimc/vimc-debayer.c         |   98 +-
 drivers/media/platform/vimc/vimc-scaler.c          |   78 +-
 drivers/media/platform/vimc/vimc-sensor.c          |   70 +-
 drivers/media/platform/vimc/vimc-streamer.c        |   40 +-
 drivers/media/platform/vimc/vimc-streamer.h        |   22 +-
 drivers/media/platform/vivid/Kconfig               |    6 +-
 drivers/media/platform/vivid/vivid-core.c          |    2 +-
 drivers/media/platform/vivid/vivid-vid-cap.c       |    2 +-
 drivers/media/platform/vivid/vivid-vid-out.c       |   14 +-
 drivers/media/platform/vsp1/vsp1_pipe.c            |   62 +
 drivers/media/platform/xilinx/Kconfig              |    6 +-
 drivers/media/radio/Kconfig                        |   54 +-
 drivers/media/radio/si470x/Kconfig                 |    6 +-
 drivers/media/radio/si4713/Kconfig                 |    6 +-
 drivers/media/radio/si4713/si4713.c                |    2 +-
 drivers/media/radio/wl128x/fmdrv_common.c          |   14 +-
 drivers/media/rc/Kconfig                           |   80 +-
 drivers/media/rc/ir-rcmm-decoder.c                 |    1 -
 drivers/media/rc/keymaps/Kconfig                   |    2 +-
 drivers/media/rc/keymaps/rc-xbox-dvd.c             |    2 +-
 drivers/media/rc/rc-main.c                         |    2 +
 drivers/media/rc/serial_ir.c                       |    9 +-
 drivers/media/rc/xbox_remote.c                     |    6 +-
 drivers/media/spi/Kconfig                          |    2 +-
 drivers/media/usb/airspy/Kconfig                   |    2 +-
 drivers/media/usb/au0828/Kconfig                   |    8 +-
 drivers/media/usb/au0828/au0828-core.c             |  196 +-
 drivers/media/usb/au0828/au0828-video.c            |   20 +-
 drivers/media/usb/au0828/au0828.h                  |    6 +-
 drivers/media/usb/cpia2/Kconfig                    |    2 +-
 drivers/media/usb/cpia2/cpia2_v4l.c                |    3 +-
 drivers/media/usb/cx231xx/Kconfig                  |    8 +-
 drivers/media/usb/dvb-usb-v2/af9035.c              |  104 +-
 drivers/media/usb/dvb-usb-v2/af9035.h              |   12 +
 drivers/media/usb/dvb-usb-v2/dvbsky.c              |   18 +-
 drivers/media/usb/em28xx/Kconfig                   |    8 +-
 drivers/media/usb/em28xx/em28xx-input.c            |    2 +-
 drivers/media/usb/go7007/Kconfig                   |    8 +-
 drivers/media/usb/go7007/go7007-fw.c               |    4 +-
 drivers/media/usb/go7007/go7007-usb.c              |   16 +-
 drivers/media/usb/go7007/go7007-v4l2.c             |    2 +-
 drivers/media/usb/gspca/Kconfig                    |    2 +-
 drivers/media/usb/gspca/gspca.c                    |   12 +-
 drivers/media/usb/hackrf/Kconfig                   |    2 +-
 drivers/media/usb/hdpvr/Kconfig                    |    2 +-
 drivers/media/usb/hdpvr/hdpvr-video.c              |   10 +-
 drivers/media/usb/pulse8-cec/Kconfig               |    2 +-
 drivers/media/usb/pulse8-cec/pulse8-cec.c          |    4 +-
 drivers/media/usb/pvrusb2/Kconfig                  |    8 +-
 drivers/media/usb/pvrusb2/pvrusb2-hdw.c            |    7 +-
 drivers/media/usb/pvrusb2/pvrusb2-hdw.h            |    1 +
 drivers/media/usb/pvrusb2/pvrusb2-v4l2.c           |    4 +-
 drivers/media/usb/pwc/Kconfig                      |    4 +-
 drivers/media/usb/pwc/pwc-ctrl.c                   |   17 +-
 drivers/media/usb/rainshadow-cec/Kconfig           |    2 +-
 drivers/media/usb/siano/Kconfig                    |    2 +-
 drivers/media/usb/stk1160/Kconfig                  |    2 +-
 drivers/media/usb/stkwebcam/Kconfig                |    2 +-
 drivers/media/usb/tm6000/Kconfig                   |    4 +-
 drivers/media/usb/usbtv/Kconfig                    |    2 +-
 drivers/media/usb/usbvision/Kconfig                |    2 +-
 drivers/media/usb/usbvision/usbvision-core.c       |    3 +
 drivers/media/usb/uvc/Kconfig                      |    4 +-
 drivers/media/usb/zr364xx/Kconfig                  |    2 +-
 drivers/media/v4l2-core/Kconfig                    |    8 +-
 drivers/media/v4l2-core/v4l2-common.c              |  186 ++
 drivers/media/v4l2-core/v4l2-ctrls.c               |   38 +-
 drivers/media/v4l2-core/v4l2-device.c              |   19 +-
 drivers/media/v4l2-core/v4l2-fwnode.c              |   17 +-
 drivers/media/v4l2-core/v4l2-ioctl.c               |    3 +-
 drivers/media/v4l2-core/v4l2-subdev.c              |   22 +-
 drivers/staging/media/Kconfig                      |    4 +-
 drivers/staging/media/Makefile                     |    1 -
 drivers/staging/media/bcm2048/Kconfig              |    2 +-
 drivers/staging/media/bcm2048/radio-bcm2048.c      |    4 +-
 drivers/staging/media/davinci_vpfe/Kconfig         |    2 +-
 drivers/staging/media/davinci_vpfe/dm365_isif.c    |   20 +-
 drivers/staging/media/davinci_vpfe/dm365_resizer.c |    2 +-
 drivers/staging/media/imx/Kconfig                  |    4 +-
 drivers/staging/media/imx/imx-ic-common.c          |    4 +-
 drivers/staging/media/imx/imx-media-csi.c          |   18 +-
 drivers/staging/media/imx/imx-media-dev-common.c   |    4 +-
 drivers/staging/media/imx/imx-media-dev.c          |   28 +-
 drivers/staging/media/imx/imx-media-internal-sd.c  |   32 +-
 drivers/staging/media/imx/imx-media-of.c           |   73 +-
 drivers/staging/media/imx/imx-media-vdic.c         |   12 +-
 drivers/staging/media/imx/imx-media.h              |    7 +-
 drivers/staging/media/imx/imx7-media-csi.c         |    6 +-
 drivers/staging/media/imx/imx7-mipi-csis.c         |   26 +-
 drivers/staging/media/ipu3/Kconfig                 |    2 +-
 drivers/staging/media/ipu3/ipu3-css.c              |   40 +-
 drivers/staging/media/ipu3/ipu3-v4l2.c             |  126 +-
 drivers/staging/media/ipu3/ipu3.c                  |   32 +-
 drivers/staging/media/mt9t031/Kconfig              |    5 -
 drivers/staging/media/mt9t031/Makefile             |    1 -
 drivers/staging/media/mt9t031/TODO                 |    5 -
 drivers/staging/media/omap4iss/Kconfig             |    2 +-
 .../staging/media/rockchip/vpu/rockchip_vpu_drv.c  |    3 +-
 .../staging/media/rockchip/vpu/rockchip_vpu_enc.c  |   12 +-
 drivers/staging/media/soc_camera/TODO              |    4 +
 drivers/staging/media/sunxi/cedrus/cedrus.c        |   33 +-
 drivers/staging/media/sunxi/cedrus/cedrus.h        |    3 +
 drivers/staging/media/sunxi/cedrus/cedrus_hw.c     |    3 +-
 drivers/staging/media/sunxi/cedrus/cedrus_video.c  |    1 +
 drivers/staging/media/zoran/Kconfig                |   75 -
 drivers/staging/media/zoran/Makefile               |    7 -
 drivers/staging/media/zoran/TODO                   |    4 -
 drivers/staging/media/zoran/videocodec.c           |  391 ---
 drivers/staging/media/zoran/videocodec.h           |  349 ---
 drivers/staging/media/zoran/zoran.h                |  402 ---
 drivers/staging/media/zoran/zoran_card.c           | 1524 -----------
 drivers/staging/media/zoran/zoran_card.h           |   50 -
 drivers/staging/media/zoran/zoran_device.c         | 1619 -----------
 drivers/staging/media/zoran/zoran_device.h         |   91 -
 drivers/staging/media/zoran/zoran_driver.c         | 2850 ----------------=
----
 drivers/staging/media/zoran/zoran_procfs.c         |  221 --
 drivers/staging/media/zoran/zoran_procfs.h         |   32 -
 drivers/staging/media/zoran/zr36016.c              |  516 ----
 drivers/staging/media/zoran/zr36016.h              |  107 -
 drivers/staging/media/zoran/zr36050.c              |  896 ------
 drivers/staging/media/zoran/zr36050.h              |  179 --
 drivers/staging/media/zoran/zr36057.h              |  164 --
 drivers/staging/media/zoran/zr36060.c              | 1006 -------
 drivers/staging/media/zoran/zr36060.h              |  216 --
 include/media/cec-notifier.h                       |   19 +-
 include/media/dvb-usb-ids.h                        |    1 +
 include/media/fwht-ctrls.h                         |   31 +
 include/media/media-dev-allocator.h                |   63 +
 include/media/media-entity.h                       |   24 -
 include/media/media-request.h                      |    4 +-
 include/media/rc-map.h                             |    4 +-
 include/media/v4l2-common.h                        |   33 +
 include/media/v4l2-ctrls.h                         |   11 +-
 include/media/v4l2-subdev.h                        |   15 +-
 include/media/videobuf2-core.h                     |   25 +-
 include/uapi/linux/lirc.h                          |    2 +
 include/uapi/linux/media-bus-format.h              |    3 +-
 include/uapi/linux/media.h                         |   25 +-
 include/uapi/linux/v4l2-controls.h                 |    8 +
 include/uapi/linux/videodev2.h                     |   17 +
 sound/usb/Kconfig                                  |    4 +
 sound/usb/Makefile                                 |    2 +
 sound/usb/card.c                                   |   14 +
 sound/usb/card.h                                   |    3 +
 sound/usb/media.c                                  |  327 +++
 sound/usb/media.h                                  |   74 +
 sound/usb/mixer.h                                  |    3 +
 sound/usb/pcm.c                                    |   29 +-
 sound/usb/quirks-table.h                           |    1 +
 sound/usb/stream.c                                 |    2 +
 sound/usb/usbaudio.h                               |    6 +
 .../selftests/media_tests/media_dev_allocator.sh   |   85 +
 324 files changed, 7625 insertions(+), 14158 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/st,st-mipid=
02.txt
 create mode 100644 Documentation/devicetree/bindings/media/rcar_imr.txt
 delete mode 100644 Documentation/media/v4l-drivers/zoran.rst
 create mode 100644 drivers/media/i2c/st-mipid02.c
 create mode 100644 drivers/media/media-dev-allocator.c
 create mode 100644 drivers/media/platform/meson/ao-cec-g12a.c
 delete mode 100644 drivers/staging/media/mt9t031/Kconfig
 delete mode 100644 drivers/staging/media/mt9t031/Makefile
 delete mode 100644 drivers/staging/media/mt9t031/TODO
 create mode 100644 drivers/staging/media/soc_camera/TODO
 delete mode 100644 drivers/staging/media/zoran/Kconfig
 delete mode 100644 drivers/staging/media/zoran/Makefile
 delete mode 100644 drivers/staging/media/zoran/TODO
 delete mode 100644 drivers/staging/media/zoran/videocodec.c
 delete mode 100644 drivers/staging/media/zoran/videocodec.h
 delete mode 100644 drivers/staging/media/zoran/zoran.h
 delete mode 100644 drivers/staging/media/zoran/zoran_card.c
 delete mode 100644 drivers/staging/media/zoran/zoran_card.h
 delete mode 100644 drivers/staging/media/zoran/zoran_device.c
 delete mode 100644 drivers/staging/media/zoran/zoran_device.h
 delete mode 100644 drivers/staging/media/zoran/zoran_driver.c
 delete mode 100644 drivers/staging/media/zoran/zoran_procfs.c
 delete mode 100644 drivers/staging/media/zoran/zoran_procfs.h
 delete mode 100644 drivers/staging/media/zoran/zr36016.c
 delete mode 100644 drivers/staging/media/zoran/zr36016.h
 delete mode 100644 drivers/staging/media/zoran/zr36050.c
 delete mode 100644 drivers/staging/media/zoran/zr36050.h
 delete mode 100644 drivers/staging/media/zoran/zr36057.h
 delete mode 100644 drivers/staging/media/zoran/zr36060.c
 delete mode 100644 drivers/staging/media/zoran/zr36060.h
 create mode 100644 include/media/fwht-ctrls.h
 create mode 100644 include/media/media-dev-allocator.h
 create mode 100644 sound/usb/media.c
 create mode 100644 sound/usb/media.h
 create mode 100755 tools/testing/selftests/media_tests/media_dev_allocator=
.sh

