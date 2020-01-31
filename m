Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F67414F01F
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2020 16:50:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729258AbgAaPtk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 Jan 2020 10:49:40 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:46770 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729030AbgAaPtk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 Jan 2020 10:49:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=D8g76lNDoGcG7X6HIPAjcen07ac/at+8QH1K72J9fSc=; b=MkGCt7e4GMYbPjfMuRTabgm8b
        5VwrxqKh0/xjD98z2WEeRKuLY5be6flBayBvjfBJDwgTNDiLgMyK+ILeMYkJJbct2o1m+KnWLU4jQ
        R2yAX8cBXFIlTBkvgvqjSfXM1ouippa0+dp3qil4mlHJdhLfr4GvIG45eoNZvWm2U2O6D62XQxA1b
        lMwq/2JrPJoZC793urZW/GIdOctaCMpzsr0bPS2Od+gHzu+PPBcaipN8RtT0BiVa3lQvA4fSh/zs+
        c0Sm9GEy7wFjuHmor7PiBxPZhbmkVcPALJsQfUhxfhyh8Cag/bT6juyjhB2376Pkv/Bv6FeVcO02o
        5LI1VORGA==;
Received: from 177.205.34.89.dynamic.adsl.gvt.net.br ([177.205.34.89] helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1ixYY5-0000PY-Q7; Fri, 31 Jan 2020 15:49:39 +0000
Date:   Fri, 31 Jan 2020 16:49:22 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL for v5.6-rc1] media updates
Message-ID: <20200131164922.7b105df7@kernel.org>
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
dia/v5.6-1

For:
  - New staging driver for Rockship ISPv1 unit;
  - New staging driver for Rockchip MIPI Synopsys DPHY RX0;
  - y2038 fixes at V4L2 API (backward-compatible);
  - A dvb core fix when receiving invalid EIT sections;
  - Some clang-specific warnings got fixed;
  - Added support for touch V4L2 interface at vivid;
  - Several drivers were converted to use the new
    i2c_new_scanned_device() kAPI;
  - Added sm1 support at meson's vdec driver;
  - Several other driver cleanups, fixes and improvements.

Thanks!
Mauro

---

The following changes since commit c79f46a282390e0f5b306007bf7b11a46d529538:

  Linux 5.5-rc5 (2020-01-05 14:23:27 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/me=
dia/v5.6-1

for you to fetch changes up to 1697d98124819aab09b86602978bd4f50e101e2d:

  media: staging/intel-ipu3: remove TODO item about acronyms (2020-01-23 15=
:50:53 +0100)

----------------------------------------------------------------
media updates for v5.6-rc1

----------------------------------------------------------------
Adam Ford (2):
      media: ov5640: Put max framerate into table and simplify check
      media: ov5640: Fix check for PLL1 exceeding max allowed rate

Aditya Pakki (3):
      media: cx231xx: replace BUG_ON with recovery code
      media: saa7146: Avoid using BUG_ON as an assertion
      media: davinci/vpfe_capture.c: Avoid BUG_ON for register failure

Alexandre Courbot (1):
      media: mtk-vcodec: use v4l2_m2m_buffer where appropriate

Arnd Bergmann (9):
      media: documentation: fix video_event description
      media: v4l2: abstract timeval handling in v4l2_buffer
      media: v4l2-core: compat: ignore native command codes
      media: v4l2-core: split out data copy from video_usercopy
      media: v4l2-core: fix VIDIOC_DQEVENT for time64 ABI
      media: v4l2-core: fix v4l2_buffer handling for time64 ABI
      media: v4l2-core: fix compat VIDIOC_DQEVENT for time64 ABI
      media: v4l2-core: fix compat v4l2_buffer handling for time64 ABI
      media: v4l2-core: only zero-out ioctl-read buffers

Benoit Parrot (20):
      media: dt-bindings: media: cal: update binding to use syscon
      media: dt-bindings: media: cal: update binding example
      media: ti-vpe: cal: switch BIT_MASK to BIT
      media: ti-vpe: cal: Add per platform data support
      media: ti-vpe: cal: Enable DMABUF export
      media: dt-bindings: media: cal: update binding to add PHY LDO errata =
support
      media: ti-vpe: cal: add CSI2 PHY LDO errata support
      media: ti-vpe: cal: Fix ths_term/ths_settle parameters
      media: ti-vpe: cal: Fix pixel processing parameters
      media: ti-vpe: cal: Align DPHY init sequence with docs
      media: dt-bindings: media: cal: update binding to add DRA76x support
      media: ti-vpe: cal: Add DRA76x support
      media: dt-bindings: media: cal: update binding to add AM654 support
      media: ti-vpe: cal: Add AM654 support
      media: ti-vpe: cal: Add subdev s_power hooks
      media: ti-vpe: cal: Properly calculate max resolution boundary
      media: ti-vpe: cal: Fix a WARN issued when start streaming fails
      media: ti-vpe: cal: fix enum_mbus_code/frame_size subdev arguments
      media: dt-bindings: media: cal: convert binding to yaml
      media: ti-vpe: csc: fix single vs multiplanar format handling

Bingbu Cao (4):
      media: staging/intel-ipu3: set the main output as mandatory
      media: staging/intel-ipu3: make imgu use fixed running mode
      media: Revert "media: staging/intel-ipu3: make imgu use fixed running=
 mode"
      media: staging/intel-ipu3: remove TODO item about acronyms

Bodo Eggert (1):
      media: serial_ir: change "ignoring spike" to debug level

Chen-Yu Tsai (6):
      media: dt-bindings: media: sun4i-csi: Add compatible for CSI1 on A10/=
A20
      media: dt-bindings: media: sun4i-csi: Add compatible for CSI0 on R40
      media: sun4i-csi: Fix data sampling polarity handling
      media: sun4i-csi: Fix [HV]sync polarity handling
      media: sun4i-csi: Deal with DRAM offset
      media: sun4i-csi: Add support for A10 CSI1 camera sensor interface

Chuhong Yuan (5):
      media: bdisp: add missed destroy_workqueue in remove and probe failure
      media: platform: mtk-mdp: add missed destroy_workqueue in remove
      media: usb: go7007: s2250-board: add missed i2c_unregister_device
      media: pxa_camera: add missed tasklet_kill
      media: go7007: fix a miss of snd_card_free

Colin Ian King (2):
      media: meson: add missing allocation failure check on new_buf
      media: v4l2-core: fix uninitialized structure fields being returned t=
o userspace

Dan Carpenter (1):
      media: hantro: remove a pointless NULL check

Daniel Gomez (2):
      media: v4l2: Fix fourcc names for BAYER12P
      media: v4l2: Fix fourcc names for 12b and 14b packed bayer

Daniel W. S. Almeida (8):
      media: dvb_dummy_fe: place EXPORT_SYMBOL below corresponding function
      media: dvb_dummy_fe: Add blank line after declaration
      media: dvb_dummy_fe: Fix ERROR: POINTER_LOCATION, AVOID_EXTERN and lo=
ng lines
      media: dvb_dummy_fe: Add blank line after declaration
      media: dvb_dummy_fe: change printk to pr_warn
      media: as102: improve formatting
      media: Documentation: media: dtv-frontend.rst: fix a few minor typos
      media: au8522: improve formatting

David J. Fiddes (1):
      media: rtl28xxu: Add support for PROlectrix DV107669 DVB-T dongle

Dmitry Osipenko (3):
      media: staging: tegra-vde: Select IOVA unconditionally in Kconfig
      media: staging: tegra-vde: Sort headers alphabetically
      media: staging: tegra-vde: Use __maybe_unused attribute instead of if=
def

Dragos Bogdan (1):
      media: adv7604: extend deep color mode to ADV7611

Eugen Hristev (9):
      media: atmel: atmel-isc-base: allow 8 bit direct dump
      media: atmel: atmel-isc-base: add support for Y10 format
      media: atmel: atmel-isc-base: properly initialize pad_cfg
      media: atmel: atmel-isc-base: fix enum calls default format
      media: atmel: atmel-isc-base: initialize the try_crop for the pads in=
 try_fmt
      media: atmel: atmel-isi: add support for mono sensors, GRAY and Y16
      media: atmel: atmel-isi: properly initialize pad_cfg
      media: atmel: atmel-isi: initialize the try_crop for the pads in try_=
fmt
      media: i2c: mt9v032: fix enum mbus codes and frame sizes

Ezequiel Garcia (5):
      media: vidioc-enum-fmt.rst: clarify format preference
      media: hantro: Cleanup format negotiation helpers
      media: hantro: Rename {prepare,finish}_run to {start,end}_prepare_run
      media: hantro: Support color conversion via post-processing
      media: staging: phy-rockchip-dphy-rx0: add Rockchip MIPI Synopsys DPH=
Y RX0 driver

Forest Crossman (1):
      media: cx23885: Add support for AVerMedia CE310B

Guilherme Alcarde Gallo (1):
      media: vimc: Implement get/set selection in sink

Gustavo A. R. Silva (1):
      media: i2c: adv748x: Fix unsafe macros

Hans Verkuil (25):
      media: cec: CEC 2.0-only bcast messages were ignored
      media: cec: avoid decrementing transmit_queue_sz if it is 0
      media: cec: check 'transmit_in_progress', not 'transmitting'
      media: pulse8-cec: fix lost cec_transmit_attempt_done() call
      media: gspca: zero usb_buf
      media: dvb-usb/dvb-usb-urb.c: initialize actlen to 0
      media: vidioc-g-dv-timings.rst: fix wrong porch
      media: ivtv/cx18: remove ivtvdriver.org references
      media: cec-ioc-g-mode.rst: remove trailing 'i'
      media: pixfmt-tch-td16/tu16.rst: document that this is little endian
      media: pulse8-cec: improve debugging
      media: pulse8-cec: reorganize function order
      media: pulse8-cec: locking improvements
      media: pulse8-cec: add 2nd debug level
      media: pulse8-cec: set tx_done_status for transmit_done status
      media: pulse8-cec: move the transmit to a workqueue
      media: pulse8-cec: queue received messages in an array
      media: pulse8-cec: use adap_free callback
      media: pulse8-cec: schedule next ping after current ping finished
      media: pulse8-cec: log when a CEC message is received
      media: vivid: set field to NONE for touch
      media: v4l2-ioctl.c: allow multiplanar for touch
      media: vivid: support multiplanar touch devices
      media: Revert "media: v4l2: Fix fourcc names for BAYER12P"
      media: cec: remove unused functions

Helen Koike (7):
      media: v4l2-rect.h: fix v4l2_rect_map_inside() top/left adjustments
      media: staging: dt-bindings: add Rockchip ISP1 yaml bindings
      media: staging: dt-bindings: add Rockchip MIPI RX D-PHY RX0 yaml bind=
ings
      media: staging: rkisp1: add Rockchip ISP1 base driver
      media: staging: rkisp1: add streaming paths
      media: staging: rkisp1: add TODO file for staging
      media: MAINTAINERS: add entry for Rockchip ISP1 driver

Hirokazu Honda (1):
      media: mtk-vcodec: Remove extra area allocation in an input buffer on=
 encoding

Jacob Chen (3):
      media: staging: rkisp1: add capture device for statistics
      media: staging: rkisp1: add output device for parameters
      media: staging: rkisp1: add document for rkisp1 meta buffer format

James Hogan (1):
      media: MAINTAINERS: Orphan img-ir driver

Jeffy Chen (1):
      media: staging: rkisp1: add user space ABI definitions

Jernej Skrabec (2):
      media: cedrus: Fix decoding for some HEVC videos
      media: cedrus: hevc: Add luma bit depth

Jia-Ju Bai (1):
      media: sti: bdisp: fix a possible sleep-in-atomic-context bug in bdis=
p_device_run()

Johan Hovold (1):
      media: iguanair: fix endpoint sanity check

Johann Friedrichs (1):
      media: dvb-core: Fix receiving invalid EIT-sections

Jonas Karlman (1):
      media: hantro: fix post-processing NULL pointer dereference

Jules Irenge (1):
      media: staging: ipu3: replace 0 with false

Julia Lawall (1):
      media: mt9v111: constify copied structure

Ma Feng (1):
      media: pvrusb2: Remove unneeded semicolon and add newline

Maoguang Meng (1):
      media: platform: VIDEO_MEDIATEK_JPEG can also depend on MTK_IOMMU

Mauro Carvalho Chehab (1):
      Merge tag 'v5.5-rc5' into patchwork

Maxime Jourdan (1):
      media: meson: vdec: add g12a platform

Nathan Chancellor (1):
      media: v4l2-device.h: Explicitly compare grp{id,mask} to zero in v4l2=
_device macros

Neil Armstrong (4):
      media: dt-bindings: media: amlogic,vdec: convert to yaml
      media: dt-bindings: media: amlogic,gx-vdec: add bindings for G12A fam=
ily
      media: dt-bindings: media: amlogic,gx-vdec: add bindings for SM1 fami=
ly
      media: meson: vdec: add sm1 platform

Nikhil Devshatwar (1):
      media: ti-vpe: cal: Restrict DMA to avoid memory corruption

Niklas S=C3=B6derlund (3):
      media: dt-bindings: rcar-vin: Remove paragraph about aliases
      media: dt-bindings: rcar-vin: Document compatibility string for R8A77=
470
      media: rcar-vin: Use correct pixel format when aligning format

Philipp Zabel (6):
      media: coda: do not skip finish_run if aborting
      media: coda: jpeg: merge Huffman table bits and values
      media: coda: jpeg: add JPEG register definitions for CODA960
      media: coda: jpeg: add CODA960 JPEG encoder support
      media: coda: remove redundant platform_get_irq error message
      media: coda: avoid hardware lockups with more than 13 capture buffers

Rui Miguel Silva (1):
      media: imx7-mipi-csis: remove subdev_notifier

Sakari Ailus (5):
      media: omap3isp: Ignore failure of stopping streaming on external sub=
dev
      media: omap3isp: Don't restart CCDC if we're about to stop
      media: smiapp: Avoid maintaining power state information
      media: smiapp: Put the device again if starting streaming fails
      media: v4l2-fwnode: Print the node name while parsing endpoints

Sean Young (9):
      media: digitv: don't continue if remote control state can't be read
      media: af9005: uninitialized variable printked
      media: vp7045: do not read uninitialized values if usb transfer fails
      media: cxusb: use dev_dbg() rather than hand-rolled debug
      media: rc: ensure lirc is initialized before registering input device
      media: dib7000m: incorrect format specifier detected by clang
      media: dib7000p: incorrect format specifier detected by clang
      media: dib0070: incorrect format specifiers detected by clang
      media: dib0090: incorrect format specifier detected by clang

Sergey Zakharchenko (1):
      media: uvcvideo: Add a quirk to force GEO GC6500 Camera bits-per-pixe=
l value

Shawn Guo (2):
      media: dt-bindings: media: add "hisilicon,hi3796cv300-ir" compatible
      media: rc: ir-hix5hd2: add hi3796cv300-ir support

Takashi Iwai (14):
      media: solo6x10: Use managed buffer allocation
      media: tw686x: Use managed buffer allocation
      media: usbtv: Use managed buffer allocation
      media: cobalt: Clean up ALSA PCM API usages
      media: cx18: Clean up ALSA PCM API usages
      media: ivtv: Clean up ALSA PCM API usages
      media: cs231xx: Clean up ALSA PCM API usages
      media: em28xx: Clean up ALSA PCM API usages
      media: go7007: Clean up ALSA PCM API usages
      media: tm6000: Clean up ALSA PCM API usages
      media: cobalt: Drop superfluous ioctl PCM ops
      media: cx18: Drop superfluous ioctl PCM ops
      media: ivtv: Drop superfluous ioctl PCM ops
      media: Drop superfluous ioctl PCM ops

Tomasz Maciej Nowak (1):
      media: dvb: add support for TerraTec TC2 Stick (193534)

Vandana BN (1):
      media: vivid: Add touch support

Wei Yongjun (1):
      media: sun8i: Remove redundant dev_err call in deinterlace_probe()

Will Deacon (1):
      media: uvcvideo: Avoid cyclic entity chains due to malformed USB desc=
riptors

Wolfram Sang (21):
      media: v4l2-subdev: remove wrong @cond from kdocs
      media: pci: cx23885: convert to i2c_new_scanned_device
      media: pci: cx88: convert to i2c_new_scanned_device
      media: pci: bt8xx: convert to i2c_new_scanned_device
      media: pci: cx18: convert to i2c_new_scanned_device
      media: pci: ivtv: convert to i2c_new_scanned_device
      media: dvb-core: dvbdev: convert to use i2c_new_client_device()
      media: dvb-frontends: cxd2820r_core: convert to use i2c_new_client_de=
vice()
      media: dvb-frontends: lgdt330x: convert to use i2c_new_client_device()
      media: dvb-frontends: m88ds3103: convert to use i2c_new_client_device=
()
      media: dvb-frontends: ts2020: convert to use i2c_new_client_device()
      media: pci: cx23885: cx23885-dvb: convert to use i2c_new_client_devic=
e()
      media: pci: saa7164: saa7164-dvb: convert to use i2c_new_client_devic=
e()
      media: pci: smipcie: smipcie-main: convert to use i2c_new_client_devi=
ce()
      media: platform: sti: c8sectpfe: c8sectpfe-dvb: convert to use i2c_ne=
w_client_device()
      media: usb: dvb-usb-v2: af9035: convert to use i2c_new_client_device()
      media: usb: dvb-usb-v2: anysee: convert to use i2c_new_client_device()
      media: usb: dvb-usb-v2: rtl28xxu: convert to use i2c_new_client_devic=
e()
      media: usb: dvb-usb-v2: zd1301: convert to use i2c_new_client_device()
      media: usb: dvb-usb: dib0700_devices: convert to use i2c_new_client_d=
evice()
      media: usb: dvb-usb: dw2102: convert to use i2c_new_client_device()

 .../bindings/media/allwinner,sun4i-a10-csi.yaml    |   14 +-
 .../devicetree/bindings/media/amlogic,gx-vdec.yaml |  141 ++
 .../devicetree/bindings/media/amlogic,vdec.txt     |   72 -
 .../devicetree/bindings/media/hix5hd2-ir.txt       |    3 +-
 .../devicetree/bindings/media/renesas,vin.txt      |    4 +-
 .../devicetree/bindings/media/ti,cal.yaml          |  202 +++
 Documentation/devicetree/bindings/media/ti-cal.txt |   72 -
 Documentation/media/kapi/dtv-frontend.rst          |   16 +-
 Documentation/media/uapi/cec/cec-ioc-g-mode.rst    |    2 +-
 Documentation/media/uapi/dvb/video-get-event.rst   |    2 +-
 Documentation/media/uapi/dvb/video_types.rst       |    2 +-
 Documentation/media/uapi/v4l/pixfmt-reserved.rst   |    3 +-
 Documentation/media/uapi/v4l/pixfmt-srggb12p.rst   |    2 +-
 Documentation/media/uapi/v4l/pixfmt-srggb14p.rst   |    2 +-
 Documentation/media/uapi/v4l/pixfmt-tch-td16.rst   |   34 +-
 Documentation/media/uapi/v4l/pixfmt-tch-tu16.rst   |   34 +-
 Documentation/media/uapi/v4l/vidioc-enum-fmt.rst   |    4 +-
 .../media/uapi/v4l/vidioc-g-dv-timings.rst         |    2 +-
 Documentation/media/v4l-drivers/cx18.rst           |   39 -
 Documentation/media/v4l-drivers/index.rst          |    1 -
 MAINTAINERS                                        |   16 +-
 drivers/media/cec/cec-core.c                       |   21 +-
 drivers/media/cec/cec-notifier.c                   |   37 +-
 drivers/media/cec/cec-priv.h                       |    2 +-
 drivers/media/common/saa7146/saa7146_video.c       |    6 +-
 drivers/media/common/videobuf2/videobuf2-v4l2.c    |    4 +-
 drivers/media/dvb-core/dvb_demux.c                 |    1 +
 drivers/media/dvb-core/dvbdev.c                    |    4 +-
 drivers/media/dvb-frontends/as102_fe.c             |    3 +-
 drivers/media/dvb-frontends/au8522_decoder.c       |    2 +-
 drivers/media/dvb-frontends/cxd2820r_core.c        |    4 +-
 drivers/media/dvb-frontends/dib0070.c              |   23 +-
 drivers/media/dvb-frontends/dib0090.c              |    3 +-
 drivers/media/dvb-frontends/dib7000m.c             |    2 +-
 drivers/media/dvb-frontends/dib7000p.c             |    2 +-
 drivers/media/dvb-frontends/dvb_dummy_fe.c         |   91 +-
 drivers/media/dvb-frontends/dvb_dummy_fe.h         |   12 +-
 drivers/media/dvb-frontends/lgdt330x.c             |    4 +-
 drivers/media/dvb-frontends/m88ds3103.c            |    4 +-
 drivers/media/dvb-frontends/ts2020.c               |    4 +-
 drivers/media/i2c/adv748x/adv748x.h                |    8 +-
 drivers/media/i2c/adv7604.c                        |   32 +-
 drivers/media/i2c/mt9v032.c                        |   10 +-
 drivers/media/i2c/mt9v111.c                        |    2 +-
 drivers/media/i2c/ov5640.c                         |   41 +-
 drivers/media/i2c/smiapp/smiapp-core.c             |  198 ++-
 drivers/media/i2c/smiapp/smiapp-regs.c             |    3 -
 drivers/media/i2c/smiapp/smiapp.h                  |    1 -
 drivers/media/pci/bt8xx/bttv-input.c               |    6 +-
 drivers/media/pci/cobalt/cobalt-alsa-pcm.c         |   69 +-
 drivers/media/pci/cx18/cx18-alsa-pcm.c             |   75 +-
 drivers/media/pci/cx18/cx18-cards.c                |    8 +-
 drivers/media/pci/cx18/cx18-driver.c               |    2 +-
 drivers/media/pci/cx18/cx18-i2c.c                  |    2 +-
 drivers/media/pci/cx23885/cx23885-alsa.c           |    1 -
 drivers/media/pci/cx23885/cx23885-cards.c          |   24 +
 drivers/media/pci/cx23885/cx23885-dvb.c            |  114 +-
 drivers/media/pci/cx23885/cx23885-i2c.c            |    4 +-
 drivers/media/pci/cx23885/cx23885-video.c          |    3 +-
 drivers/media/pci/cx23885/cx23885.h                |    1 +
 drivers/media/pci/cx25821/cx25821-alsa.c           |    1 -
 drivers/media/pci/cx88/cx88-alsa.c                 |    1 -
 drivers/media/pci/cx88/cx88-input.c                |    2 +-
 drivers/media/pci/ivtv/Kconfig                     |    5 +-
 drivers/media/pci/ivtv/ivtv-alsa-pcm.c             |   76 +-
 drivers/media/pci/ivtv/ivtv-driver.c               |    3 +-
 drivers/media/pci/ivtv/ivtv-driver.h               |    1 -
 drivers/media/pci/ivtv/ivtv-i2c.c                  |    6 +-
 drivers/media/pci/ivtv/ivtv-i2c.h                  |    2 +-
 drivers/media/pci/meye/meye.c                      |    4 +-
 drivers/media/pci/saa7134/saa7134-alsa.c           |    1 -
 drivers/media/pci/saa7164/saa7164-dvb.c            |   24 +-
 drivers/media/pci/smipcie/smipcie-main.c           |    4 +-
 drivers/media/pci/solo6x10/solo6x10-g723.c         |   24 +-
 drivers/media/pci/tw686x/tw686x-audio.c            |   16 +-
 drivers/media/platform/Kconfig                     |    4 +-
 drivers/media/platform/atmel/atmel-isc-base.c      |   94 +-
 drivers/media/platform/atmel/atmel-isi.c           |   42 +-
 drivers/media/platform/atmel/atmel-isi.h           |    2 +
 drivers/media/platform/coda/coda-bit.c             |   29 +-
 drivers/media/platform/coda/coda-common.c          |   45 +-
 drivers/media/platform/coda/coda-jpeg.c            |  746 ++++++++-
 drivers/media/platform/coda/coda.h                 |    3 +
 drivers/media/platform/coda/coda_regs.h            |   83 +
 drivers/media/platform/coda/trace.h                |   10 +
 drivers/media/platform/davinci/vpfe_capture.c      |   31 +-
 drivers/media/platform/mtk-mdp/mtk_mdp_core.c      |    3 +
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c |   66 +-
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h |    7 +-
 .../media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c |    2 +-
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c |   23 +-
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.h |    8 +-
 drivers/media/platform/omap3isp/isp.c              |    8 +-
 drivers/media/platform/omap3isp/ispccdc.c          |   12 +-
 drivers/media/platform/pxa_camera.c                |    2 +
 drivers/media/platform/rcar-vin/rcar-v4l2.c        |    2 +-
 drivers/media/platform/sti/bdisp/bdisp-hw.c        |    6 +-
 drivers/media/platform/sti/bdisp/bdisp-v4l2.c      |   13 +-
 .../media/platform/sti/c8sectpfe/c8sectpfe-dvb.c   |    5 +-
 drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c |   57 +-
 drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.h |    6 +-
 drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c |   20 +-
 drivers/media/platform/sunxi/sun8i-di/sun8i-di.c   |    5 +-
 drivers/media/platform/ti-vpe/cal.c                |  773 ++++++++--
 drivers/media/platform/ti-vpe/cal_regs.h           |  221 +--
 drivers/media/platform/ti-vpe/csc.c                |   32 +-
 drivers/media/platform/vimc/vimc-scaler.c          |  166 +-
 drivers/media/platform/vivid/Makefile              |    3 +-
 drivers/media/platform/vivid/vivid-core.c          |  203 ++-
 drivers/media/platform/vivid/vivid-core.h          |   20 +
 drivers/media/platform/vivid/vivid-ctrls.c         |   11 +
 drivers/media/platform/vivid/vivid-kthread-touch.c |  181 +++
 drivers/media/platform/vivid/vivid-kthread-touch.h |   13 +
 drivers/media/platform/vivid/vivid-touch-cap.c     |  341 ++++
 drivers/media/platform/vivid/vivid-touch-cap.h     |   39 +
 drivers/media/platform/vivid/vivid-vid-common.c    |    2 +-
 drivers/media/rc/iguanair.c                        |    2 +-
 drivers/media/rc/ir-hix5hd2.c                      |   79 +-
 drivers/media/rc/rc-main.c                         |   27 +-
 drivers/media/rc/serial_ir.c                       |    2 +-
 drivers/media/usb/cpia2/cpia2_v4l.c                |    4 +-
 drivers/media/usb/cx231xx/cx231xx-audio.c          |   79 +-
 drivers/media/usb/cx231xx/cx231xx-i2c.c            |    3 +-
 drivers/media/usb/dvb-usb-v2/af9035.c              |   19 +-
 drivers/media/usb/dvb-usb-v2/anysee.c              |    4 +-
 drivers/media/usb/dvb-usb-v2/rtl28xxu.c            |   42 +-
 drivers/media/usb/dvb-usb-v2/zd1301.c              |    4 +-
 drivers/media/usb/dvb-usb/af9005.c                 |    2 +-
 drivers/media/usb/dvb-usb/cxusb.c                  |   33 +-
 drivers/media/usb/dvb-usb/dib0700_devices.c        |    8 +-
 drivers/media/usb/dvb-usb/digitv.c                 |   10 +-
 drivers/media/usb/dvb-usb/dvb-usb-urb.c            |    2 +-
 drivers/media/usb/dvb-usb/dw2102.c                 |    8 +-
 drivers/media/usb/dvb-usb/vp7045.c                 |   21 +-
 drivers/media/usb/em28xx/em28xx-audio.c            |   87 +-
 drivers/media/usb/go7007/s2250-board.c             |    1 +
 drivers/media/usb/go7007/snd-go7007.c              |   60 +-
 drivers/media/usb/gspca/gspca.c                    |    2 +-
 drivers/media/usb/pulse8-cec/pulse8-cec.c          |  769 +++++----
 drivers/media/usb/pvrusb2/pvrusb2-encoder.c        |    4 +-
 drivers/media/usb/stkwebcam/stk-webcam.c           |    2 +-
 drivers/media/usb/tm6000/tm6000-alsa.c             |   82 +-
 drivers/media/usb/usbtv/usbtv-audio.c              |   29 +-
 drivers/media/usb/usbvision/usbvision-video.c      |    4 +-
 drivers/media/usb/uvc/uvc_driver.c                 |   37 +
 drivers/media/usb/uvc/uvcvideo.h                   |    1 +
 drivers/media/v4l2-core/v4l2-compat-ioctl32.c      |  476 +++++-
 drivers/media/v4l2-core/v4l2-event.c               |    5 +-
 drivers/media/v4l2-core/v4l2-fwnode.c              |    6 +-
 drivers/media/v4l2-core/v4l2-ioctl.c               |  213 ++-
 drivers/media/v4l2-core/v4l2-subdev.c              |   26 +-
 drivers/media/v4l2-core/videobuf-core.c            |    5 +-
 drivers/staging/media/Kconfig                      |    4 +
 drivers/staging/media/Makefile                     |    2 +
 drivers/staging/media/hantro/Makefile              |    1 +
 drivers/staging/media/hantro/hantro.h              |   66 +-
 drivers/staging/media/hantro/hantro_drv.c          |   11 +-
 drivers/staging/media/hantro/hantro_g1_h264_dec.c  |    4 +-
 drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c |    6 +-
 drivers/staging/media/hantro/hantro_g1_regs.h      |   53 +
 drivers/staging/media/hantro/hantro_g1_vp8_dec.c   |    6 +-
 drivers/staging/media/hantro/hantro_h1_jpeg_enc.c  |    4 +-
 drivers/staging/media/hantro/hantro_h264.c         |    2 +-
 drivers/staging/media/hantro/hantro_hw.h           |   17 +-
 drivers/staging/media/hantro/hantro_postproc.c     |  148 ++
 drivers/staging/media/hantro/hantro_v4l2.c         |  109 +-
 drivers/staging/media/hantro/rk3288_vpu_hw.c       |   10 +
 .../staging/media/hantro/rk3399_vpu_hw_jpeg_enc.c  |    4 +-
 .../staging/media/hantro/rk3399_vpu_hw_mpeg2_dec.c |    4 +-
 .../staging/media/hantro/rk3399_vpu_hw_vp8_dec.c   |    4 +-
 drivers/staging/media/imx/imx7-mipi-csis.c         |    3 -
 drivers/staging/media/ipu3/TODO                    |    6 -
 drivers/staging/media/ipu3/ipu3-css.c              |    2 +-
 drivers/staging/media/ipu3/ipu3-v4l2.c             |    5 +
 drivers/staging/media/meson/vdec/vdec.c            |   18 +-
 drivers/staging/media/meson/vdec/vdec.h            |    1 +
 drivers/staging/media/meson/vdec/vdec_1.c          |   29 +-
 drivers/staging/media/meson/vdec/vdec_platform.c   |   60 +
 drivers/staging/media/meson/vdec/vdec_platform.h   |    4 +
 .../bindings/phy/rockchip-mipi-dphy-rx0.yaml       |   76 +
 .../staging/media/phy-rockchip-dphy-rx0/Kconfig    |   13 +
 .../staging/media/phy-rockchip-dphy-rx0/Makefile   |    2 +
 drivers/staging/media/phy-rockchip-dphy-rx0/TODO   |    6 +
 .../phy-rockchip-dphy-rx0/phy-rockchip-dphy-rx0.c  |  388 +++++
 .../devicetree/bindings/media/rockchip-isp1.yaml   |  192 +++
 .../media/uapi/v4l/pixfmt-meta-rkisp1-params.rst   |   23 +
 .../media/uapi/v4l/pixfmt-meta-rkisp1-stat.rst     |   22 +
 drivers/staging/media/rkisp1/Kconfig               |   17 +
 drivers/staging/media/rkisp1/Makefile              |    8 +
 drivers/staging/media/rkisp1/TODO                  |   23 +
 drivers/staging/media/rkisp1/rkisp1-capture.c      | 1437 +++++++++++++++++
 drivers/staging/media/rkisp1/rkisp1-common.c       |   37 +
 drivers/staging/media/rkisp1/rkisp1-common.h       |  337 ++++
 drivers/staging/media/rkisp1/rkisp1-dev.c          |  574 +++++++
 drivers/staging/media/rkisp1/rkisp1-isp.c          | 1164 ++++++++++++++
 drivers/staging/media/rkisp1/rkisp1-params.c       | 1630 ++++++++++++++++=
++++
 drivers/staging/media/rkisp1/rkisp1-regs.h         | 1264 +++++++++++++++
 drivers/staging/media/rkisp1/rkisp1-resizer.c      |  775 ++++++++++
 drivers/staging/media/rkisp1/rkisp1-stats.c        |  530 +++++++
 drivers/staging/media/rkisp1/uapi/rkisp1-config.h  |  819 ++++++++++
 drivers/staging/media/sunxi/cedrus/cedrus_h265.c   |   26 +-
 drivers/staging/media/sunxi/cedrus/cedrus_regs.h   |    1 +
 drivers/staging/media/tegra-vde/Kconfig            |    2 +-
 drivers/staging/media/tegra-vde/vde.c              |    6 +-
 drivers/staging/media/tegra-vde/vde.h              |    2 +-
 include/media/cec-notifier.h                       |   27 -
 include/media/cec.h                                |   46 -
 include/media/dvb-usb-ids.h                        |    2 +
 include/media/v4l2-common.h                        |   21 +
 include/media/v4l2-device.h                        |   12 +-
 include/media/v4l2-ioctl.h                         |   55 +
 include/media/v4l2-rect.h                          |    8 +-
 include/media/v4l2-subdev.h                        |    2 +-
 include/trace/events/v4l2.h                        |    2 +-
 include/uapi/linux/videodev2.h                     |   29 +
 215 files changed, 14973 insertions(+), 2355 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/amlogic,gx-vdec=
.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/amlogic,vdec.txt
 create mode 100644 Documentation/devicetree/bindings/media/ti,cal.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/ti-cal.txt
 delete mode 100644 Documentation/media/v4l-drivers/cx18.rst
 create mode 100644 drivers/media/platform/vivid/vivid-kthread-touch.c
 create mode 100644 drivers/media/platform/vivid/vivid-kthread-touch.h
 create mode 100644 drivers/media/platform/vivid/vivid-touch-cap.c
 create mode 100644 drivers/media/platform/vivid/vivid-touch-cap.h
 create mode 100644 drivers/staging/media/hantro/hantro_postproc.c
 create mode 100644 drivers/staging/media/phy-rockchip-dphy-rx0/Documentati=
on/devicetree/bindings/phy/rockchip-mipi-dphy-rx0.yaml
 create mode 100644 drivers/staging/media/phy-rockchip-dphy-rx0/Kconfig
 create mode 100644 drivers/staging/media/phy-rockchip-dphy-rx0/Makefile
 create mode 100644 drivers/staging/media/phy-rockchip-dphy-rx0/TODO
 create mode 100644 drivers/staging/media/phy-rockchip-dphy-rx0/phy-rockchi=
p-dphy-rx0.c
 create mode 100644 drivers/staging/media/rkisp1/Documentation/devicetree/b=
indings/media/rockchip-isp1.yaml
 create mode 100644 drivers/staging/media/rkisp1/Documentation/media/uapi/v=
4l/pixfmt-meta-rkisp1-params.rst
 create mode 100644 drivers/staging/media/rkisp1/Documentation/media/uapi/v=
4l/pixfmt-meta-rkisp1-stat.rst
 create mode 100644 drivers/staging/media/rkisp1/Kconfig
 create mode 100644 drivers/staging/media/rkisp1/Makefile
 create mode 100644 drivers/staging/media/rkisp1/TODO
 create mode 100644 drivers/staging/media/rkisp1/rkisp1-capture.c
 create mode 100644 drivers/staging/media/rkisp1/rkisp1-common.c
 create mode 100644 drivers/staging/media/rkisp1/rkisp1-common.h
 create mode 100644 drivers/staging/media/rkisp1/rkisp1-dev.c
 create mode 100644 drivers/staging/media/rkisp1/rkisp1-isp.c
 create mode 100644 drivers/staging/media/rkisp1/rkisp1-params.c
 create mode 100644 drivers/staging/media/rkisp1/rkisp1-regs.h
 create mode 100644 drivers/staging/media/rkisp1/rkisp1-resizer.c
 create mode 100644 drivers/staging/media/rkisp1/rkisp1-stats.c
 create mode 100644 drivers/staging/media/rkisp1/uapi/rkisp1-config.h

