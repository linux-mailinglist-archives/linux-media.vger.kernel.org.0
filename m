Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0352B3A45
	for <lists+linux-media@lfdr.de>; Mon, 16 Sep 2019 14:25:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732604AbfIPMZ1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Sep 2019 08:25:27 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:53136 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732490AbfIPMZ1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Sep 2019 08:25:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=lnuEOUL2kcfrSmJlhFc3XL61e4DzrXrt/L+UXUjcNr0=; b=nSbfjOTYvz6C/R26nxsXnJbjm
        rvopGA33ZWcRTOaLYtnAYwF8zfTQBETUrMY6d82yJ3AXl8FISTIaJCOxUunzQCL7tOsiJJOUYTDRT
        3syukTUmcIgFXMU1P/Ggacs+XS6E64EdOFqRI2EwW238Um5gWwmBDJiS3emb87Dly0m7lOHb9OY7j
        opR9wvT0xshkmTS7Pm9BF1Q17cl4tgo/Eqfne82hzmFHyRR6FnVKdyiAjZqxFj50PTFU9G3zM1mtu
        sHevUG40YIl8YR7OQnmAmxXPnPUpdEjU2APiSltLQDjBVaN7CBBSFOgblIk7MLOsxLWmFWFjqyBF8
        O5FxZnPXA==;
Received: from [179.162.54.107] (helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.2 #3 (Red Hat Linux))
        id 1i9q4J-00086o-De; Mon, 16 Sep 2019 12:25:24 +0000
Date:   Mon, 16 Sep 2019 09:25:15 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL for v5.4-rc1] media updates
Message-ID: <20190916092515.66549c3b@coco.lan>
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
  git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media media/v=
5.4-1


For:

- a new sensor driver for ov5675;
- A new platform driver for Allwinner A10 sensor interface;
- some new remote controller keymaps;
- some cosmetic changes at V4L2 core in order to avoid #ifdefs and
  to merge two core modules into one;
- Removal of bcm2048 radio driver from staging;
- Removal of davinci_vpfe video driver from staging;
- Regression fix since Kernel 5.1 at the legacy VideoBuffer version 1 core;
- Added some documentation for remote controller protocols;
- pixel format documentation was split on two files;
- Lots of other driver improvements and cleanups.

Thanks!
Mauro

-

The following changes since commit d45331b00ddb179e291766617259261c112db872:

  Linux 5.3-rc4 (2019-08-11 13:26:41 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media media/v=
5.4-1

for you to fetch changes up to 6f51fdfd8229d5358c2d6e272cf73478866e8ddc:

  media: videobuf-core.c: poll_wait needs a non-NULL buf pointer (2019-09-0=
5 06:26:57 -0300)

----------------------------------------------------------------
media updates for v5.4-rc1

----------------------------------------------------------------
A Sun (2):
      media: mceusb: USB reset device following USB clear halt error
      media: mceusb: fix (eliminate) TX IR signal length limit

Alexandre Kroupski (1):
      media: atmel: atmel-isi: fix timeout value for stop streaming

Andr=C3=A9 Almeida (5):
      media: vimc: stream: remove obsolete function doc
      media: vimc: stream: fix style of argument description
      media: vimc: stream: format comments as kernel-doc
      media: vimc.rst: Add a proper alt attribute to vimc.dot
      media: vimc.rst: add vimc-streamer source documentation

Andy Shevchenko (1):
      media: v4l2-fwnode: Switch to use fwnode_property_count_uXX()

Arnd Bergmann (5):
      media: dib0700: fix link error for dibx000_i2c_set_speed
      media: davinci-vpbe: remove obsolete includes
      media: vivid: work around high stack usage with clang
      media: staging: davinci: remove vpfe driver
      media: don't drop front-end reference count for ->detach

Boris Brezillon (7):
      media: hantro: Simplify the controls creation logic
      media: hantro: Constify the control array
      media: hantro: Add hantro_get_{src, dst}_buf() helpers
      media: hantro: Add helpers to prepare/finish a run
      media: uapi: h264: Add the concept of decoding mode
      media: uapi: h264: Get rid of the p0/b0/b1 ref-lists
      media: hantro: Move copy_metadata() before doing a decode operation

Christian Hewitt (7):
      media: rc: add keymap for Amediatech X96-MAX remote
      media: rc: add keymap for Khadas VIM/EDGE remote
      media: rc: add keymap for Tanix TX3 mini remote
      media: rc: add keymap for Tanix TX5 max remote
      media: rc: add keymap for WeTek Hub remote
      media: rc: add keymap for WeTeK Play 2 remote
      media: rc: add keymap for HardKernel ODROID remote

Christophe JAILLET (1):
      media: ov2680: fix a typo in a function name

Chuhong Yuan (2):
      media: pci: Use dev_get_drvdata where possible
      media: staging/intel-ipu3: Use dev_get_drvdata where possible

Cl=C3=A9ment P=C3=A9ron (6):
      media: dt-bindings: media: sunxi-ir: Add A31 compatible
      media: rc: Introduce sunxi_ir_quirks
      media: rc: sunxi: Add A31 compatible
      media: rc: sunxi: Add RXSTA bits definition
      media: dt-bindings: media: sunxi-ir: Add A64 compatible
      media: dt-bindings: media: sunxi-ir: Add H6 compatible

Colin Ian King (6):
      media: vivid: fix potential integer overflow on left shift
      media: cobalt: remove redundant assignment to variable data
      media: saa7134: remove redundant assignment to variable value
      media: stv0900_core: remove redundant assignment to variables mclk, d=
iv and ad_div
      media: vsp1: fix memory leak of dl on error return path
      media: hdpvr: remove redundant assignment to retval

Darius Rad (1):
      media: rc: imon: Allow iMON RC protocol for ffdc 7e device

Denis Efremov (2):
      media: MAINTAINERS: hantro: Fix typo in a filepath
      media: MAINTAINERS: Remove zoran driver

Dmitry Osipenko (1):
      media: dt: bindings: tegra-vde: Document new optional IOMMU property

Ezequiel Garcia (20):
      media: v4l2-ctrl: Move compound control validation
      media: v4l2-ctrl: Validate VP8 stateless decoder controls
      media: v4l: ctrls: Add debug messages
      media: Don't default-enable "ancillary driver autoselect" if EMBEDDED
      media: hantro: Move VP8 common code
      media: v4l2-core: Cleanup Makefile
      media: i2c: ov5645: Fix power sequence
      media: imx: mipi csi-2: Don't fail if initial state times-out
      media: Clarify how menus are hidden by SUBDRV_AUTOSELECT
      media: rockchip/rga: Update maintainership
      media: uapi: h264: Rename pixel format
      media: uapi: h264: Add the concept of start code
      media: cedrus: Cleanup control initialization
      media: cedrus: Specify H264 startcode and decoding mode
      media: v4l2-core: Module re-organization
      media: v4l2-core: move spi helpers out of v4l2-common.c
      media: v4l2-core: move i2c helpers out of v4l2-common.c
      media: v4l2-core: introduce a helper to unregister a spi subdev
      media: v4l2-core: introduce a helper to unregister a i2c subdev
      media: v4l2-core: Remove BUG() from i2c and spi helpers

Fabio Estevam (5):
      media: ov5645: Remove unneeded regulator_set_voltage()
      media: ov5645: Use regulator_bulk() functions
      media: i2c: ov5640: Check for devm_gpiod_get_optional() error
      media: i2c: ov5640: Fix the order for enabling regulators
      media: imx7.rst: Fix the references to the CSI multiplexer

Francois Buergisser (1):
      media: hantro: Set DMA max segment size

Frederick Lawler (1):
      media: cobalt: Prefer pcie_capability_read_word()

Fuqian Huang (6):
      media: pvrusb2: use kzalloc instead of kmalloc and memset
      media: ngene: Remove call to memset after pci_alloc_consistent
      media: exynos4-is: Remove call to memset after dma_alloc_coherent
      media: media/usb: Use kmemdup rather than duplicating its implementat=
ion
      media: media/tuners: Use kmemdup rather than duplicating its implemen=
tation
      media: media/dvb: Use kmemdup rather than duplicating its implementat=
ion

Geert Uytterhoeven (2):
      media: fdp1: Reduce FCP not found message level to debug
      media: Fix various misspellings of disconnected

Guillaume Tucker (1):
      media: vivid: fix device init when no_error_inj=3D1 and fb disabled

Hans Verkuil (65):
      media: v4l2-ioctl: add missing pixelformats
      media: media/usb: don't set description in ENUM_FMT
      media: media/pci: don't set description for ENUM_FMT
      media: drivers/staging/media: don't set description for ENUM_FMT
      media: media/platform: don't set description in ENUM_FMT
      media: am437x/davinci: set device_caps in struct video_device
      media: coda: set device_caps in struct video_device
      media: s3c-camif/s5p-g2d/s5p-jpeg: set device_caps in struct video_de=
vice
      media: fsl-viu: set device_caps in struct video_device
      media: m2m-deinterlace: set device_caps in struct video_device
      media: mx2_emmaprp: set device_caps in struct video_device
      media: marvell-ccic: set device_caps in struct video_device
      media: pxa_camera: don't set caps in querycap
      media: bdisp: set device_caps in struct video_device
      media: via-camera: set device_caps in struct video_device
      media: xilinx: set device_caps in struct video_device
      media: sh_veu/sh_vou: set device_caps in struct video_device
      media: vsp1: set device_caps in struct video_device
      media: omap_vout: set device_caps in struct video_device
      media: ti-vpe: set device_caps in struct video_device
      media: omap3isp: set device_caps in struct video_device
      media: meson/ao-cec: use cec_notifier_cec_adap_(un)register
      media: cros-ec-cec: use cec_notifier_cec_adap_(un)register
      media: seco-cec: use cec_notifier_cec_adap_(un)register
      media: s5p-cec: use cec_notifier_cec_adap_(un)register
      media: stih-cec: use cec_notifier_cec_adap_(un)register
      media: tegra-cec: use cec_notifier_cec_adap_(un)register
      media: v4l2-ioctl: call v4l_pix_format_touch() for TRY_FMT
      media: input/touchscreen/sur40: use COLORSPACE_RAW
      media: drivers/media: don't set pix->priv =3D 0
      media: via-camera: call viafb_pm_unregister in remove()
      media: via-camera: use struct v4l2_fh
      media: ov7670: don't return ENOTTY if SUBDEV_API is not set
      media: via-camera: fix v4l2-compliance fails
      media: media/i2c: don't return ENOTTY if SUBDEV_API is not set
      media: m2m-deinterlace: use struct v4l2_fh
      media: omap_vout: use struct v4l2_fh
      media: mx2_emmaprp: use struct v4l2_fh
      media: v4l2-dev/ioctl: require non-zero device_caps, verify sane quer=
ycap results
      media: sh_veu: convert to struct v4l2_fh
      media: davinci/vpfe_capture.c: drop unused format descriptions
      media: am437x: remove unused struct vpfe_pixel_format
      media: staging/media/bcm2048: remove driver
      media: vivid: fix typo: use -> user
      media: v4l2-dev: fix WARN_ON(!vdev->device_caps)
      media: v4l2-ioctl.c: OR flags in v4l_fill_fmtdesc(), not don't overwr=
ite
      media: videodev2.h.rst.exceptions: tymecode -> timecode
      media: v4l2-tpg: add support for new pixelformats
      media: v4l2-common: add support for new RGB32 pixelformats
      media: vivid: add support for new pixelformats
      media: via-camera: convert to the vb2 framework
      media: vicodec: add support for 4 new RGB32 pixelformats
      media: adv7511/cobalt: rename driver name to adv7511-v4l2
      media: mach-omap2/devices.c: set dma mask
      media: omap_vout: fix various v4l2-compliance failures
      media: omap_vout: convert to vb2
      media: vidioc-queryctrl.rst: fix broken c:type references
      media: radio/si470x: kill urb on error
      media: hdpvr: add terminating 0 at end of string
      media: gspca: zero usb_buf on error
      media: videodev2.h: add V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM
      media: pixfmt-compressed.rst: improve H264/HEVC/MPEG1+2/VP8+9 documen=
tation
      media: cec-adap: return from cec_s_conn_info() if adap is invalid
      media: cec-notifier: clear cec_adap in cec_notifier_unregister
      media: videobuf-core.c: poll_wait needs a non-NULL buf pointer

Hans de Goede (1):
      media: sn9c20x: Add MSI MS-1039 laptop to flip_dmi_table

Hariprasad Kelam (2):
      media: staging/media/davinci_vpfe: Add null check post kmalloc
      media: staging: media: hantro: Remove call to memset after dma_alloc_=
coherent

Helen Koike (2):
      media: Revert "media: vimc: Remove or modify stream checks"
      media: Revert "media: vimc: propagate pixel format in the stream"

Hertz Wong (3):
      media: hantro: Add core bits to support H264 decoding
      media: hantro: Add support for H264 decoding on G1
      media: hantro: Enable H264 decoding on rk3288

Hugues Fruchet (4):
      media: stm32-dcmi: improve sensor subdev naming
      media: stm32-dcmi: trace the supported fourcc/mbus_code
      media: stm32-dcmi: add media controller support
      media: stm32-dcmi: add support of several sub-devices

Jae Hyun Yoo (1):
      media: aspeed: fix an incorrect return code on buffer allocation fail=
ure

Jan Kotas (4):
      media: dt-bindings: Update bindings for Cadence CSI2TX version 2.1
      media: Add lane checks for Cadence CSI2TX
      media: Fix Lane mapping in Cadence CSI2TX
      media: Add support for Cadence CSI2TX 2.1

Jan Pieter van Woerkom (4):
      media: si2168: add support for Mygica T230C v2
      media: dvbsky: add support for Mygica T230C v2
      media: dvb-usb: remove T230 from cxusb
      media: dvb-usb: add T230 to dvbsky

Jeffy Chen (1):
      media: hantro: Support RK3399 VP8 decoding

Jernej Skrabec (2):
      media: cedrus: Remove dst_bufs from context
      media: cedrus: Don't set chroma size for scale & rotation

Joe Perches (3):
      media: m2m-deinterlace: Fix misuse of strscpy
      media: go7007: Fix misuse of strscpy
      media: staging: media: cedrus: Fix misuse of GENMASK macro

Jonas Karlman (3):
      media: dt-bindings: rockchip: Document RK3328 VPU binding
      media: hantro: Add support for MPEG-2 decoding on RK3328
      media: hantro: Enable VP8 decoding on RK3328

Kieran Bingham (7):
      media: i2c: adv748x: Convert to new i2c device probe()
      media: radio: si4713: Convert to new i2c device probe()
      media: radio: si470x: Convert to new i2c device probe()
      media: i2c: smiapp: Convert to new i2c device probe()
      media: i2c: s5c73m3: Convert to new i2c device probe()
      media: i2c: et8ek8: Convert to new i2c device probe()
      media: i2c: Convert to new i2c device probe()

Lubomir Rintel (1):
      media: marvell-ccic: mmp: add MODULE_DEVICE_TABLE

Luca Weiss (1):
      media: ov5640: Add support for flash and lens devices

Lucas Stach (1):
      media: vb2-dc: skip CPU sync in map/unmap dma_buf

Luke Nowakowski-Krijger (2):
      media: hdpvr: Add device num check and handling
      media: dvb_frontend.h: Fix shifting signed 32-bit value problem

Maciej S. Szmigiero (2):
      media: saa7134: keep demod i2c gate closed on Medion 7134
      media: saa7134: fix terminology around saa7134_i2c_eeprom_md7134_gate=
()

Malathi Gottam (1):
      media: venus: venc: amend buffer size for bitstream plane

Marc Gonzalez (1):
      media: si2168: Refactor command setup code

Markus Elfring (2):
      media: em28xx: Fix exception handling in em28xx_alloc_urbs()
      media: stm32-dcmi: Delete an unnecessary of_node_put() call in dcmi_p=
robe()

Masahiro Yamada (1):
      media: rc: add include guard to rc-map.h

Matthias Brugger (1):
      media: mtk-mdp: fix reference count on old device tree

Mauro Carvalho Chehab (11):
      Merge tag 'v5.3-rc1' into patchwork
      media: staging: hantro: avoid future namespace collisions
      Merge tag 'v5.3-rc2' into patchwork
      Merge tag 'v5.3-rc4' into patchwork
      v4l2-core: fix coding style for the two new c files
      media: remove include stdarg.h from some drivers
      media: vicodec: make life easier for static analyzers
      media: aspeed-video: address a protential usage of an unitialized var
      media: ov9650: add a sanity check
      media: use the BIT() macro
      media: don't do a 31 bit shift on a signed int

Maxime Jourdan (4):
      media: videodev2.h: add V4L2_FMT_FLAG_DYN_RESOLUTION
      media: venus: vdec: flag OUTPUT formats with V4L2_FMT_FLAG_DYN_RESOLU=
TION
      media: mtk-vcodec: flag OUTPUT formats with V4L2_FMT_FLAG_DYN_RESOLUT=
ION
      media: vicodec: set flags for vdec/stateful OUTPUT coded formats

Maxime Ripard (6):
      media: dt-bindings: media: Add YAML schemas for the generic RC bindin=
gs
      media: dt-bindings: media: Convert Allwinner A10 IR to a schema
      media: dt-bindings: media: Add Allwinner A10 CSI binding
      media: sunxi: Refactor the Makefile and Kconfig
      media: sunxi: Add A10 CSI driver
      media: sun4i: Make sun4i_csi_formats static

Michael Tretter (2):
      media: vb2: reorder checks in vb2_poll()
      media: v4l2-mem2mem: reorder checks in v4l2_m2m_poll()

Neil Armstrong (2):
      media: dt-bindings: media: meson-ao-cec: add SM1 compatible
      media: platform: meson-ao-cec-g12a: add support for SM1

Niklas S=C3=B6derlund (7):
      media: rcar-vin: Clean up correct notifier in error path
      media: rcar-vin: Centralize black listing of pixel formats
      media: rcar-vin: Rename VNDMR_DTMD_ARGB1555 to VNDMR_DTMD_ARGB
      media: rcar-vin: Add control for alpha component
      media: rcar-vin: Add support for RGB formats with alpha component
      media: rcar-vin: Always setup controls when opening video device
      media: rcar-vin: Report correct image stride

Nishka Dasgupta (6):
      media: platform: mtk-mdp: mtk_mdp_core: Add of_node_put() before goto
      media: i2c: tvp5150: Add of_node_put() before goto
      media: dvb-bt8xx: Make variable dst_config constant
      media: firewire: Make structure fdtv_ca constant
      media: ec168: Make structure ec168_props constant
      media: dvb-frontends/cxd2099: Make en_templ constant

Oliver Neukum (1):
      media: iguanair: add sanity checks

Paul Kocialkowski (1):
      media: v4l2-ctrl: Add a comment on why we zero out compound controls =
fields

Pawel Osciak (1):
      media: uapi: Add VP8 stateless decoder API

Philipp Zabel (1):
      media: imx: add csc/scaler mem2mem device

Randy Dunlap (1):
      media: media/platform: fsl-viu.c: fix build for MICROBLAZE

Rasmus Villemoes (1):
      media: lib/sort.c: implement sort() variant taking context argument

Rui Wang (1):
      media: mtk-vcodec: Handle H264 error bitstreams

Sakari Ailus (14):
      media: davinci-vpif: Don't dereference endpoint after putting it, fix=
 refcounting
      media: v4l2-async: Get fwnode reference when putting it to the notifi=
er's list
      media: v4l2-async: Add v4l2_async_notifier_add_fwnode_remote_subdev
      media: omap3isp: Rework OF endpoint parsing
      media: v4l2-async: Safely clean up an uninitialised notifier
      media: ipu3-cio2: Clean up notifier's subdev list if parsing endpoint=
s fails
      media: ipu3-cio2: Proceed with notifier init even if there are no sub=
devs
      media: ipu3-cio2: Parse information from firmware without using callb=
acks
      media: ov8856: Check reading clock frequency succeeded
      media: omap3isp: Set device on omap3isp subdevs
      media: omap3isp: Don't set streaming state on random subdevs
      media: v4l: Documentation: Serial busses use parallel mbus codes
      media: v4l: Documentation: Raw Bayer formats are not RGB formats
      media: MAINTAINERS: Add entry for the ov5670 driver

Sean Young (14):
      media: mtk-cir: only allow protocols that have software decoders
      media: rc: remove unused #define RC_PROTO_BIT_ALL
      media: mtk-cir: lower de-glitch counter for rc-mm protocol
      media: technisat-usb2: break out of loop at end of buffer
      media: lirc: document BPF IR decoding
      media: rc: describe rc protocols and their scancodes
      media: imon_raw: simplify and explain bit operations
      media: imon_raw: prevent "nonsensical timing event of duration 0"
      media: selftests: ir: fix ir_loopback test failure
      media: em28xx: modules workqueue not inited for 2nd device
      media: rc: imon-rsc keymap has incorrect mappings
      media: tm6000: double free if usb disconnect while streaming
      media: dvb-frontends: use ida for pll number
      media: ttpci: unknown protocol is rc-mm-32

Shawn Tu (1):
      media: ov5675: Add support for OV5675 sensor

Souptick Joarder (1):
      media: usbvision: Remove dead code

Stanimir Varbanov (10):
      media: venus: helpers: export few helper functions
      media: venus: hfi: add type argument to hfi flush function
      media: venus: hfi: export few HFI functions
      media: venus: hfi: return an error if session_init is already called
      media: venus: helpers: add three more helper functions
      media: venus: vdec_ctrls: get real minimum buffers for capture
      media: venus: vdec: allow bigger sizeimage set by clients
      media: venus: make decoder compliant with stateful codec API
      media: venus: helpers: handle correctly vbuf field
      media: venus: dec: populate properly timestamps and flags for capture=
 buffers

Stephen Boyd (1):
      media: Remove dev_err() usage after platform_get_irq()

Stephen Rothwell (1):
      media: uapi: new file needs types.h

Steve Longerbeam (2):
      media: staging/imx: Fix NULL deref in find_pipeline_entity()
      media: docs-rst: Clarify duration of LP-11 mode

S=C3=A9bastien Szymanski (2):
      media: dt-bindings: imx7-csi: add i.MX6UL/L support
      media: imx7-media-csi: add i.MX6UL support

Tomas Bortoli (1):
      media: ttusb-dec: Fix info-leak in ttusb_dec_send_command()

Tomasz Figa (1):
      media: docs-rst: Document memory-to-memory video decoder interface

Vandana BN (1):
      media: vivid:add sanity check to avoid divide error and set value to =
1 if 0.

Wen Yang (2):
      media: exynos4-is: fix leaked of_node references
      media: ti-vpe: fix leaked of_node references

Wenwen Wang (8):
      media: dvb-frontends: fix memory leaks
      media: dvb-frontends: fix a memory leak bug
      media: dvb-core: fix a memory leak bug
      media: cpia2_usb: fix memory leaks
      media: usb: cx231xx-417: fix a memory leak bug
      media: saa7146: add cleanup in hexium_attach()
      media: fdp1: Fix a memory leak bug
      media: ti-vpe: Add cleanup in vpdma_list_cleanup()

Wolfram Sang (18):
      media: ir-kbd-i2c: remove outdated comments
      media: dvb-frontends: cxd2820r_core: convert to i2c_new_dummy_device
      media: dvb-frontends: mn88443x: convert to i2c_new_dummy_device
      media: dvb-frontends: mn88472: convert to i2c_new_dummy_device
      media: dvb-frontends: mn88473: convert to i2c_new_dummy_device
      media: i2c: ad9389b: convert to i2c_new_dummy_device
      media: i2c: adv7180: convert to i2c_new_dummy_device
      media: i2c: adv7511-v4l2: convert to i2c_new_dummy_device
      media: usb: go7007: s2250-board: convert to i2c_new_dummy_device
      media: i2c: tda1997x: prevent potential NULL pointer access
      media: i2c: adv7842: convert to i2c_new_dummy_device
      media: cxd2820r: don't check retval after our own assignemt
      media: mn88472: don't check retval after our own assignemt
      media: mn88473: don't check retval after our own assignemt
      media: zd1301_demod: don't check retval after our own assignemt
      media: ir-kbd-i2c: convert to i2c_new_dummy_device()
      media: i2c: adv7511-v4l2: drop check because i2c_unregister_device() =
is NULL safe
      media: i2c: adv7842: drop check because i2c_unregister_device() is NU=
LL safe

Yizhuo (1):
      media: pvrusb2: qctrl.flag will be uninitlaized if cx2341x_ctrl_query=
() returns error code

YueHaibing (2):
      media: staging: tegra-vde: Fix build error
      media: imx: remove unused including <linux/version.h>

ZhiChao Yu (1):
      media: hantro: Add support for VP8 decoding on rk3288

 .../bindings/media/allwinner,sun4i-a10-csi.yaml    |  109 +
 .../bindings/media/allwinner,sun4i-a10-ir.yaml     |   80 +
 .../devicetree/bindings/media/cdns,csi2tx.txt      |    3 +-
 .../devicetree/bindings/media/imx7-csi.txt         |    2 +-
 .../devicetree/bindings/media/meson-ao-cec.txt     |    8 +-
 .../devicetree/bindings/media/nvidia,tegra-vde.txt |    2 +
 Documentation/devicetree/bindings/media/rc.txt     |  118 +-
 Documentation/devicetree/bindings/media/rc.yaml    |  145 ++
 .../devicetree/bindings/media/rockchip-vpu.txt     |   18 +-
 .../devicetree/bindings/media/sunxi-ir.txt         |   28 -
 Documentation/media/kapi/csi2.rst                  |   17 +-
 Documentation/media/kapi/v4l2-dev.rst              |    1 +
 Documentation/media/uapi/rc/lirc-dev-intro.rst     |   57 +-
 Documentation/media/uapi/rc/lirc-read.rst          |    3 +-
 Documentation/media/uapi/rc/lirc-write.rst         |    3 +-
 Documentation/media/uapi/rc/rc-protos.rst          |  456 ++++
 Documentation/media/uapi/rc/remote_controllers.rst |    1 +
 Documentation/media/uapi/v4l/biblio.rst            |   10 +
 Documentation/media/uapi/v4l/control.rst           |    2 +-
 Documentation/media/uapi/v4l/dev-decoder.rst       | 1101 ++++++++
 Documentation/media/uapi/v4l/dev-mem2mem.rst       |    8 +-
 Documentation/media/uapi/v4l/ext-ctrls-codec.rst   |  422 ++-
 Documentation/media/uapi/v4l/hist-v4l2.rst         |    2 +-
 Documentation/media/uapi/v4l/pixfmt-bayer.rst      |   38 +
 Documentation/media/uapi/v4l/pixfmt-compressed.rst |   67 +-
 Documentation/media/uapi/v4l/pixfmt-packed-rgb.rst | 1306 ----------
 Documentation/media/uapi/v4l/pixfmt-rgb.rst        | 1302 +++++++++-
 Documentation/media/uapi/v4l/pixfmt-v4l2.rst       |    7 +-
 Documentation/media/uapi/v4l/pixfmt.rst            |    1 +
 Documentation/media/uapi/v4l/subdev-formats.rst    |    8 +
 Documentation/media/uapi/v4l/v4l2.rst              |   10 +-
 .../media/uapi/v4l/vidioc-decoder-cmd.rst          |   41 +-
 Documentation/media/uapi/v4l/vidioc-dqevent.rst    |   11 +-
 Documentation/media/uapi/v4l/vidioc-enum-fmt.rst   |   16 +
 Documentation/media/uapi/v4l/vidioc-queryctrl.rst  |    4 +-
 Documentation/media/v4l-drivers/imx7.rst           |  127 +-
 Documentation/media/v4l-drivers/vimc.rst           |   13 +-
 Documentation/media/videodev2.h.rst.exceptions     |    6 +-
 MAINTAINERS                                        |   36 +-
 arch/arm/mach-omap2/devices.c                      |    7 +
 drivers/input/touchscreen/sur40.c                  |    4 +-
 drivers/media/Kconfig                              |    7 +-
 drivers/media/cec/cec-adap.c                       |    3 +
 drivers/media/cec/cec-notifier.c                   |    2 +
 drivers/media/common/saa7146/saa7146_video.c       |   16 +-
 drivers/media/common/v4l2-tpg/v4l2-tpg-core.c      |  107 +
 .../media/common/videobuf2/videobuf2-dma-contig.c  |   23 +-
 drivers/media/common/videobuf2/videobuf2-v4l2.c    |    8 +-
 drivers/media/dvb-core/dvb_frontend.c              |    4 +-
 drivers/media/dvb-core/dvbdev.c                    |    7 +-
 drivers/media/dvb-frontends/Kconfig                |    5 +-
 drivers/media/dvb-frontends/cx24117.c              |    4 +-
 drivers/media/dvb-frontends/cx24123.c              |    2 +-
 drivers/media/dvb-frontends/cxd2099.c              |    2 +-
 drivers/media/dvb-frontends/cxd2820r_core.c        |    9 +-
 drivers/media/dvb-frontends/dib7000p.c             |    7 +-
 drivers/media/dvb-frontends/drx39xyj/drxj.c        |    5 +-
 drivers/media/dvb-frontends/dvb-pll.c              |   40 +-
 drivers/media/dvb-frontends/mn88443x.c             |    6 +-
 drivers/media/dvb-frontends/mn88472.c              |   18 +-
 drivers/media/dvb-frontends/mn88473.c              |   18 +-
 drivers/media/dvb-frontends/rtl2832_sdr.c          |    3 -
 drivers/media/dvb-frontends/si2168.c               |  164 +-
 drivers/media/dvb-frontends/si2168.h               |    1 +
 drivers/media/dvb-frontends/stv0900_core.c         |    2 +-
 drivers/media/dvb-frontends/zd1301_demod.c         |    3 +-
 drivers/media/firewire/firedtv-ci.c                |    2 +-
 drivers/media/i2c/Kconfig                          |   18 +-
 drivers/media/i2c/Makefile                         |    1 +
 drivers/media/i2c/ad9389b.c                        |    6 +-
 drivers/media/i2c/adv7180.c                        |   12 +-
 drivers/media/i2c/adv7343.c                        |    5 +-
 drivers/media/i2c/adv748x/adv748x-core.c           |   13 +-
 drivers/media/i2c/adv7511-v4l2.c                   |   28 +-
 drivers/media/i2c/adv7842.c                        |   42 +-
 drivers/media/i2c/et8ek8/et8ek8_driver.c           |    5 +-
 drivers/media/i2c/imx274.c                         |    5 +-
 drivers/media/i2c/ir-kbd-i2c.c                     |   14 +-
 drivers/media/i2c/max2175.c                        |    5 +-
 drivers/media/i2c/mt9m001.c                        |    5 +-
 drivers/media/i2c/mt9m111.c                        |    7 +-
 drivers/media/i2c/ov2640.c                         |    7 +-
 drivers/media/i2c/ov2659.c                         |    9 +-
 drivers/media/i2c/ov2680.c                         |    9 +-
 drivers/media/i2c/ov5640.c                         |   14 +-
 drivers/media/i2c/ov5645.c                         |  151 +-
 drivers/media/i2c/ov5647.c                         |    5 +-
 drivers/media/i2c/ov5675.c                         | 1183 +++++++++
 drivers/media/i2c/ov5695.c                         |    5 +-
 drivers/media/i2c/ov7670.c                         |    6 +-
 drivers/media/i2c/ov772x.c                         |    5 +-
 drivers/media/i2c/ov7740.c                         |   13 +-
 drivers/media/i2c/ov8856.c                         |    5 +-
 drivers/media/i2c/ov9650.c                         |   10 +-
 drivers/media/i2c/s5c73m3/s5c73m3-core.c           |    5 +-
 drivers/media/i2c/s5k5baf.c                        |    5 +-
 drivers/media/i2c/s5k6a3.c                         |    5 +-
 drivers/media/i2c/smiapp/smiapp-core.c             |    5 +-
 drivers/media/i2c/tc358743.c                       |    5 +-
 drivers/media/i2c/tda1997x.c                       |    9 +-
 drivers/media/i2c/ths8200.c                        |    5 +-
 drivers/media/i2c/tvp5150.c                        |    9 +-
 drivers/media/i2c/tvp7002.c                        |    4 +-
 drivers/media/pci/bt8xx/bttv-driver.c              |   19 -
 drivers/media/pci/bt8xx/bttv-input.c               |    4 +-
 drivers/media/pci/bt8xx/bttv-risc.c                |    8 +-
 drivers/media/pci/bt8xx/bttvp.h                    |    1 -
 drivers/media/pci/bt8xx/dvb-bt8xx.c                |    2 +-
 drivers/media/pci/cobalt/cobalt-driver.c           |   40 +-
 drivers/media/pci/cobalt/cobalt-driver.h           |   63 +-
 drivers/media/pci/cobalt/cobalt-flash.c            |    2 +-
 drivers/media/pci/cobalt/cobalt-v4l2.c             |    6 -
 drivers/media/pci/cx18/cx18-ioctl.c                |    2 +-
 drivers/media/pci/cx18/cx18-mailbox.c              |    2 +-
 drivers/media/pci/cx23885/cx23885-417.c            |    1 -
 drivers/media/pci/cx23885/cx23885-video.c          |    7 +-
 drivers/media/pci/cx23885/cx23885.h                |    1 -
 drivers/media/pci/cx25821/cx25821-video.c          |    7 +-
 drivers/media/pci/cx25821/cx25821.h                |    1 -
 drivers/media/pci/cx88/cx88-blackbird.c            |    2 -
 drivers/media/pci/cx88/cx88-video.c                |   17 +-
 drivers/media/pci/cx88/cx88.h                      |    1 -
 drivers/media/pci/dt3155/dt3155.c                  |    1 -
 drivers/media/pci/intel/ipu3/ipu3-cio2.c           |  100 +-
 drivers/media/pci/ivtv/ivtv-driver.c               |    2 +-
 drivers/media/pci/ivtv/ivtv-ioctl.c                |    4 +-
 drivers/media/pci/ivtv/ivtv-irq.h                  |   28 +-
 drivers/media/pci/ivtv/ivtv-mailbox.c              |    2 -
 drivers/media/pci/mantis/mantis_reg.h              |  152 +-
 drivers/media/pci/meye/meye.c                      |    3 -
 drivers/media/pci/ngene/ngene-core.c               |    4 -
 drivers/media/pci/pt1/pt1.c                        |    6 +-
 drivers/media/pci/pt3/pt3.c                        |    6 +-
 drivers/media/pci/saa7134/saa7134-dvb.c            |   14 +
 drivers/media/pci/saa7134/saa7134-empress.c        |    2 -
 drivers/media/pci/saa7134/saa7134-i2c.c            |   12 +-
 drivers/media/pci/saa7134/saa7134-tvaudio.c        |    1 -
 drivers/media/pci/saa7134/saa7134-video.c          |   28 +-
 drivers/media/pci/saa7134/saa7134.h                |    1 -
 drivers/media/pci/saa7146/hexium_gemini.c          |    3 +
 drivers/media/pci/saa7164/saa7164-encoder.c        |    1 -
 drivers/media/pci/solo6x10/solo6x10-gpio.c         |    6 +-
 drivers/media/pci/solo6x10/solo6x10-regs.h         |  286 +--
 drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c     |    9 -
 drivers/media/pci/solo6x10/solo6x10-v4l2.c         |    4 -
 drivers/media/pci/sta2x11/sta2x11_vip.c            |    2 -
 drivers/media/pci/ttpci/av7110_hw.c                |    1 -
 drivers/media/pci/ttpci/av7110_ir.c                |   14 +-
 drivers/media/pci/tw68/tw68-video.c                |   14 -
 drivers/media/pci/tw68/tw68.h                      |    1 -
 drivers/media/platform/Kconfig                     |    6 +-
 drivers/media/platform/Makefile                    |    2 +-
 drivers/media/platform/am437x/am437x-vpfe.c        |   30 +-
 drivers/media/platform/am437x/am437x-vpfe.h        |    6 -
 drivers/media/platform/am437x/am437x-vpfe_regs.h   |   26 +-
 drivers/media/platform/aspeed-video.c              |    6 +-
 drivers/media/platform/atmel/atmel-isi.c           |    2 +-
 drivers/media/platform/atmel/atmel-sama5d2-isc.c   |    7 +-
 drivers/media/platform/cadence/cdns-csi2tx.c       |  155 +-
 drivers/media/platform/coda/coda-common.c          |    4 +-
 drivers/media/platform/cros-ec-cec/cros-ec-cec.c   |   69 +-
 drivers/media/platform/davinci/dm644x_ccdc_regs.h  |   20 +-
 drivers/media/platform/davinci/vpbe_display.c      |   21 +-
 drivers/media/platform/davinci/vpbe_osd.c          |    5 -
 drivers/media/platform/davinci/vpbe_venc.c         |    5 -
 drivers/media/platform/davinci/vpfe_capture.c      |   54 +-
 drivers/media/platform/davinci/vpif_capture.c      |   33 +-
 drivers/media/platform/davinci/vpif_display.c      |    7 +-
 drivers/media/platform/exynos-gsc/gsc-core.c       |   22 -
 drivers/media/platform/exynos-gsc/gsc-core.h       |    2 -
 drivers/media/platform/exynos4-is/fimc-capture.c   |    3 -
 drivers/media/platform/exynos4-is/fimc-core.c      |   20 -
 drivers/media/platform/exynos4-is/fimc-is.c        |    2 +-
 drivers/media/platform/exynos4-is/fimc-isp-video.c |    1 -
 drivers/media/platform/exynos4-is/fimc-isp.c       |    3 -
 drivers/media/platform/exynos4-is/fimc-lite-reg.h  |   80 +-
 drivers/media/platform/exynos4-is/fimc-lite.c      |    8 -
 drivers/media/platform/exynos4-is/fimc-m2m.c       |    1 -
 drivers/media/platform/exynos4-is/fimc-reg.h       |  138 +-
 drivers/media/platform/exynos4-is/media-dev.c      |    2 +
 drivers/media/platform/exynos4-is/mipi-csis.c      |   10 +-
 drivers/media/platform/fsl-viu.c                   |   11 +-
 drivers/media/platform/imx-pxp.c                   |    4 +-
 drivers/media/platform/m2m-deinterlace.c           |  140 +-
 drivers/media/platform/marvell-ccic/mcam-core.c    |   15 +-
 drivers/media/platform/marvell-ccic/mmp-driver.c   |    1 +
 drivers/media/platform/meson/ao-cec-g12a.c         |   84 +-
 drivers/media/platform/meson/ao-cec.c              |   44 +-
 drivers/media/platform/mtk-mdp/mtk_mdp_core.c      |    9 +-
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c |    4 +
 drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h |    1 +
 .../media/platform/mtk-vcodec/vdec/vdec_h264_if.c  |   16 +-
 drivers/media/platform/mx2_emmaprp.c               |  141 +-
 drivers/media/platform/omap/Kconfig                |    3 +-
 drivers/media/platform/omap/omap_vout.c            | 1045 ++------
 drivers/media/platform/omap/omap_vout_vrfb.c       |   26 +-
 drivers/media/platform/omap/omap_vout_vrfb.h       |    4 +-
 drivers/media/platform/omap/omap_voutdef.h         |   45 +-
 drivers/media/platform/omap/omap_voutlib.c         |    6 +-
 drivers/media/platform/omap3isp/isp.c              |  340 ++-
 drivers/media/platform/omap3isp/ispccdc.c          |    1 +
 drivers/media/platform/omap3isp/ispccp2.c          |    1 +
 drivers/media/platform/omap3isp/ispcsi2.c          |    1 +
 drivers/media/platform/omap3isp/isppreview.c       |    1 +
 drivers/media/platform/omap3isp/ispreg.h           |  584 ++---
 drivers/media/platform/omap3isp/ispresizer.c       |    1 +
 drivers/media/platform/omap3isp/ispstat.c          |    2 +
 drivers/media/platform/omap3isp/ispvideo.c         |   15 +-
 drivers/media/platform/pxa_camera.c                |    7 +-
 drivers/media/platform/qcom/camss/camss.c          |    2 +-
 drivers/media/platform/qcom/venus/core.c           |    2 +-
 drivers/media/platform/qcom/venus/core.h           |   33 +-
 drivers/media/platform/qcom/venus/helpers.c        |  199 +-
 drivers/media/platform/qcom/venus/helpers.h        |   11 +
 drivers/media/platform/qcom/venus/hfi.c            |   11 +-
 drivers/media/platform/qcom/venus/hfi.h            |    2 +-
 drivers/media/platform/qcom/venus/vdec.c           |  548 +++-
 drivers/media/platform/qcom/venus/vdec_ctrls.c     |    7 +-
 drivers/media/platform/qcom/venus/venc.c           |   13 +-
 drivers/media/platform/rcar-vin/rcar-core.c        |   55 +-
 drivers/media/platform/rcar-vin/rcar-dma.c         |   56 +-
 drivers/media/platform/rcar-vin/rcar-v4l2.c        |   68 +-
 drivers/media/platform/rcar-vin/rcar-vin.h         |    9 +-
 drivers/media/platform/rcar_fdp1.c                 |    3 +-
 drivers/media/platform/renesas-ceu.c               |    4 +-
 drivers/media/platform/rockchip/rga/rga.c          |    1 -
 drivers/media/platform/s3c-camif/camif-capture.c   |   16 +-
 drivers/media/platform/s3c-camif/camif-core.c      |   10 +-
 drivers/media/platform/s3c-camif/camif-core.h      |    1 -
 drivers/media/platform/s3c-camif/camif-regs.h      |  118 +-
 drivers/media/platform/s5p-cec/s5p_cec.c           |   23 +-
 drivers/media/platform/s5p-g2d/g2d.c               |   13 +-
 drivers/media/platform/s5p-g2d/g2d.h               |    1 -
 drivers/media/platform/s5p-jpeg/jpeg-core.c        |   31 +-
 drivers/media/platform/s5p-jpeg/jpeg-core.h        |    2 -
 drivers/media/platform/s5p-jpeg/jpeg-regs.h        |   10 +-
 drivers/media/platform/s5p-mfc/s5p_mfc_common.h    |    1 -
 drivers/media/platform/s5p-mfc/s5p_mfc_dec.c       |   19 +-
 drivers/media/platform/s5p-mfc/s5p_mfc_enc.c       |   14 +-
 drivers/media/platform/s5p-mfc/s5p_mfc_opr_v5.c    |    4 +-
 drivers/media/platform/s5p-mfc/s5p_mfc_opr_v6.c    |    2 +-
 drivers/media/platform/seco-cec/seco-cec.c         |   55 +-
 drivers/media/platform/sh_veu.c                    |   28 +-
 drivers/media/platform/sh_vou.c                    |   17 +-
 drivers/media/platform/sti/bdisp/bdisp-v4l2.c      |    6 +-
 .../media/platform/sti/c8sectpfe/c8sectpfe-core.c  |    8 +-
 drivers/media/platform/sti/cec/stih-cec.c          |   32 +-
 drivers/media/platform/sti/hva/hva-hw.c            |    8 +-
 drivers/media/platform/stm32/stm32-dcmi.c          |  323 ++-
 drivers/media/platform/sunxi/Kconfig               |    2 +
 drivers/media/platform/sunxi/Makefile              |    2 +
 drivers/media/platform/sunxi/sun4i-csi/Kconfig     |   11 +
 drivers/media/platform/sunxi/sun4i-csi/Makefile    |    5 +
 drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c |  314 +++
 drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.h |  160 ++
 drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c |  454 ++++
 .../media/platform/sunxi/sun4i-csi/sun4i_v4l2.c    |  385 +++
 drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c |    7 +-
 drivers/media/platform/tegra-cec/tegra_cec.c       |   35 +-
 drivers/media/platform/tegra-cec/tegra_cec.h       |   82 +-
 drivers/media/platform/ti-vpe/cal.c                |    6 +-
 drivers/media/platform/ti-vpe/vpdma.c              |   10 +-
 drivers/media/platform/ti-vpe/vpe.c                |   12 -
 drivers/media/platform/ti-vpe/vpe_regs.h           |   94 +-
 drivers/media/platform/via-camera.c                |  579 ++---
 drivers/media/platform/vicodec/codec-v4l2-fwht.c   |   30 +-
 drivers/media/platform/vicodec/vicodec-core.c      |   14 +-
 drivers/media/platform/vimc/vimc-capture.c         |   76 +-
 drivers/media/platform/vimc/vimc-common.c          |  309 ++-
 drivers/media/platform/vimc/vimc-common.h          |   58 +-
 drivers/media/platform/vimc/vimc-debayer.c         |   88 +-
 drivers/media/platform/vimc/vimc-scaler.c          |   68 +-
 drivers/media/platform/vimc/vimc-sensor.c          |   57 +-
 drivers/media/platform/vimc/vimc-streamer.c        |   40 +-
 drivers/media/platform/vimc/vimc-streamer.h        |   14 -
 drivers/media/platform/vivid/vivid-core.c          |    4 +-
 drivers/media/platform/vivid/vivid-ctrls.c         |   26 +-
 drivers/media/platform/vivid/vivid-kthread-cap.c   |    9 +-
 drivers/media/platform/vivid/vivid-vid-common.c    |  132 +-
 drivers/media/platform/vsp1/vsp1_dl.c              |    4 +-
 drivers/media/platform/vsp1/vsp1_histo.c           |    3 +-
 drivers/media/platform/vsp1/vsp1_regs.h            |  224 +-
 drivers/media/platform/vsp1/vsp1_video.c           |   10 +-
 drivers/media/platform/xilinx/xilinx-dma.c         |   18 +-
 drivers/media/platform/xilinx/xilinx-vip.c         |   16 +-
 drivers/media/platform/xilinx/xilinx-vip.h         |   31 +-
 drivers/media/platform/xilinx/xilinx-vipp.c        |    2 +-
 drivers/media/radio/radio-gemtek.c                 |    2 +-
 drivers/media/radio/radio-trust.c                  |    1 -
 drivers/media/radio/si470x/radio-si470x-i2c.c      |    5 +-
 drivers/media/radio/si470x/radio-si470x-usb.c      |    5 +-
 drivers/media/radio/si4713/si4713.c                |    5 +-
 drivers/media/radio/wl128x/fmdrv_common.h          |   88 +-
 drivers/media/rc/iguanair.c                        |   15 +-
 drivers/media/rc/img-ir/img-ir-core.c              |    4 +-
 drivers/media/rc/imon.c                            |    7 +-
 drivers/media/rc/imon_raw.c                        |   43 +-
 drivers/media/rc/ir-hix5hd2.c                      |    4 +-
 drivers/media/rc/keymaps/Makefile                  |    7 +
 drivers/media/rc/keymaps/rc-imon-rsc.c             |    7 +-
 drivers/media/rc/keymaps/rc-khadas.c               |   54 +
 drivers/media/rc/keymaps/rc-odroid.c               |   54 +
 drivers/media/rc/keymaps/rc-tanix-tx3mini.c        |   77 +
 drivers/media/rc/keymaps/rc-tanix-tx5max.c         |   68 +
 drivers/media/rc/keymaps/rc-wetek-hub.c            |   53 +
 drivers/media/rc/keymaps/rc-wetek-play2.c          |   93 +
 drivers/media/rc/keymaps/rc-x96max.c               |   83 +
 drivers/media/rc/mceusb.c                          |  401 +--
 drivers/media/rc/meson-ir.c                        |    4 +-
 drivers/media/rc/mtk-cir.c                         |   14 +-
 drivers/media/rc/sunxi-cir.c                       |   89 +-
 drivers/media/spi/Kconfig                          |    5 +-
 drivers/media/tuners/Kconfig                       |    6 +-
 drivers/media/tuners/tuner-xc2028.c                |    3 +-
 drivers/media/tuners/xc4000.c                      |    3 +-
 drivers/media/usb/airspy/airspy.c                  |    3 -
 drivers/media/usb/au0828/au0828-video.c            |    6 -
 drivers/media/usb/cpia2/cpia2_usb.c                |    4 +
 drivers/media/usb/cpia2/cpia2_v4l.c                |   25 +-
 drivers/media/usb/cx231xx/cx231xx-417.c            |    2 +-
 drivers/media/usb/cx231xx/cx231xx-cards.c          |    4 +-
 drivers/media/usb/cx231xx/cx231xx-core.c           |    2 +-
 drivers/media/usb/cx231xx/cx231xx-video.c          |    4 +-
 drivers/media/usb/cx231xx/cx231xx.h                |    1 -
 drivers/media/usb/dvb-usb-v2/dvbsky.c              |   26 +-
 drivers/media/usb/dvb-usb-v2/ec168.c               |    2 +-
 drivers/media/usb/dvb-usb-v2/gl861.c               |    2 +-
 drivers/media/usb/dvb-usb/cxusb.c                  |  161 --
 drivers/media/usb/dvb-usb/dib0700_devices.c        |    8 +
 drivers/media/usb/dvb-usb/pctv452e.c               |    8 -
 drivers/media/usb/dvb-usb/technisat-usb2.c         |   22 +-
 drivers/media/usb/em28xx/em28xx-cards.c            |    4 +-
 drivers/media/usb/em28xx/em28xx-core.c             |    2 +-
 drivers/media/usb/em28xx/em28xx-video.c            |   11 +-
 drivers/media/usb/em28xx/em28xx.h                  |    4 +-
 drivers/media/usb/go7007/go7007-v4l2.c             |   11 -
 drivers/media/usb/go7007/s2250-board.c             |    6 +-
 drivers/media/usb/go7007/snd-go7007.c              |    2 +-
 drivers/media/usb/gspca/gspca.c                    |   37 +-
 drivers/media/usb/gspca/konica.c                   |    5 +
 drivers/media/usb/gspca/nw80x.c                    |    5 +
 drivers/media/usb/gspca/ov519.c                    |   10 +
 drivers/media/usb/gspca/ov534.c                    |    5 +
 drivers/media/usb/gspca/ov534_9.c                  |    1 +
 drivers/media/usb/gspca/se401.c                    |    5 +
 drivers/media/usb/gspca/sn9c20x.c                  |   12 +
 drivers/media/usb/gspca/sonixb.c                   |    5 +
 drivers/media/usb/gspca/sonixj.c                   |    5 +
 drivers/media/usb/gspca/spca1528.c                 |    5 +
 drivers/media/usb/gspca/sq930x.c                   |    5 +
 drivers/media/usb/gspca/sunplus.c                  |    5 +
 drivers/media/usb/gspca/vc032x.c                   |    5 +
 drivers/media/usb/gspca/w996Xcf.c                  |    5 +
 drivers/media/usb/hdpvr/hdpvr-core.c               |   13 +-
 drivers/media/usb/hdpvr/hdpvr-i2c.c                |    6 +-
 drivers/media/usb/hdpvr/hdpvr-video.c              |    3 -
 drivers/media/usb/msi2500/msi2500.c                |    8 -
 drivers/media/usb/pvrusb2/pvrusb2-eeprom.c         |    3 +-
 drivers/media/usb/pvrusb2/pvrusb2-hdw.c            |   19 +-
 drivers/media/usb/pvrusb2/pvrusb2-v4l2.c           |    4 +-
 drivers/media/usb/pwc/pwc-v4l.c                    |    5 -
 drivers/media/usb/s2255/s2255drv.c                 |   10 -
 drivers/media/usb/stk1160/stk1160-v4l.c            |    2 -
 drivers/media/usb/stk1160/stk1160.h                |    1 -
 drivers/media/usb/stkwebcam/stk-webcam.c           |    5 -
 drivers/media/usb/tm6000/tm6000-cards.c            |    2 +-
 drivers/media/usb/tm6000/tm6000-dvb.c              |    3 +
 drivers/media/usb/tm6000/tm6000-video.c            |    4 -
 drivers/media/usb/tm6000/tm6000.h                  |    1 -
 drivers/media/usb/ttusb-dec/ttusb_dec.c            |    2 +-
 drivers/media/usb/usbtv/usbtv-video.c              |    2 -
 drivers/media/usb/usbvision/usbvision-video.c      |   28 +-
 drivers/media/usb/usbvision/usbvision.h            |    1 -
 drivers/media/usb/uvc/uvc_v4l2.c                   |    2 -
 drivers/media/usb/zr364xx/zr364xx.c                |   11 +-
 drivers/media/v4l2-core/Kconfig                    |    5 +
 drivers/media/v4l2-core/Makefile                   |   15 +-
 drivers/media/v4l2-core/v4l2-async.c               |   28 +-
 drivers/media/v4l2-core/v4l2-common.c              |  218 +-
 drivers/media/v4l2-core/v4l2-ctrls.c               |  305 ++-
 drivers/media/v4l2-core/v4l2-dev.c                 |    7 +-
 drivers/media/v4l2-core/v4l2-device.c              |   39 +-
 drivers/media/v4l2-core/v4l2-fwnode.c              |   31 +-
 drivers/media/v4l2-core/v4l2-i2c.c                 |  184 ++
 drivers/media/v4l2-core/v4l2-ioctl.c               |   74 +-
 drivers/media/v4l2-core/v4l2-mem2mem.c             |   47 +-
 drivers/media/v4l2-core/v4l2-spi.c                 |   78 +
 drivers/media/v4l2-core/v4l2-subdev.c              |    6 +-
 drivers/media/v4l2-core/videobuf-core.c            |    5 +-
 drivers/staging/media/Kconfig                      |    4 -
 drivers/staging/media/Makefile                     |    2 -
 drivers/staging/media/bcm2048/Kconfig              |   14 -
 drivers/staging/media/bcm2048/Makefile             |    2 -
 drivers/staging/media/bcm2048/TODO                 |   24 -
 drivers/staging/media/bcm2048/radio-bcm2048.c      | 2689 ----------------=
----
 drivers/staging/media/bcm2048/radio-bcm2048.h      |   26 -
 drivers/staging/media/davinci_vpfe/Kconfig         |   13 -
 drivers/staging/media/davinci_vpfe/Makefile        |   11 -
 drivers/staging/media/davinci_vpfe/TODO            |   38 -
 .../staging/media/davinci_vpfe/davinci-vpfe-mc.txt |  154 --
 .../staging/media/davinci_vpfe/davinci_vpfe_user.h | 1287 ----------
 drivers/staging/media/davinci_vpfe/dm365_ipipe.c   | 1852 --------------
 drivers/staging/media/davinci_vpfe/dm365_ipipe.h   |  174 --
 .../staging/media/davinci_vpfe/dm365_ipipe_hw.c    | 1038 --------
 .../staging/media/davinci_vpfe/dm365_ipipe_hw.h    |  556 ----
 drivers/staging/media/davinci_vpfe/dm365_ipipeif.c | 1070 --------
 drivers/staging/media/davinci_vpfe/dm365_ipipeif.h |  228 --
 .../media/davinci_vpfe/dm365_ipipeif_user.h        |   90 -
 drivers/staging/media/davinci_vpfe/dm365_isif.c    | 2097 ---------------
 drivers/staging/media/davinci_vpfe/dm365_isif.h    |  200 --
 .../staging/media/davinci_vpfe/dm365_isif_regs.h   |  291 ---
 drivers/staging/media/davinci_vpfe/dm365_resizer.c | 1995 ---------------
 drivers/staging/media/davinci_vpfe/dm365_resizer.h |  241 --
 drivers/staging/media/davinci_vpfe/vpfe.h          |   83 -
 .../staging/media/davinci_vpfe/vpfe_mc_capture.c   |  716 ------
 .../staging/media/davinci_vpfe/vpfe_mc_capture.h   |   90 -
 drivers/staging/media/davinci_vpfe/vpfe_video.c    | 1646 ------------
 drivers/staging/media/davinci_vpfe/vpfe_video.h    |  150 --
 drivers/staging/media/hantro/Kconfig               |    2 +-
 drivers/staging/media/hantro/Makefile              |    7 +-
 drivers/staging/media/hantro/hantro.h              |   51 +-
 drivers/staging/media/hantro/hantro_drv.c          |  106 +-
 drivers/staging/media/hantro/hantro_g1_h264_dec.c  |  292 +++
 drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c |   14 +-
 drivers/staging/media/hantro/hantro_g1_vp8_dec.c   |  503 ++++
 drivers/staging/media/hantro/hantro_h1_jpeg_enc.c  |   11 +-
 drivers/staging/media/hantro/hantro_h264.c         |  646 +++++
 drivers/staging/media/hantro/hantro_hw.h           |   80 +
 drivers/staging/media/hantro/hantro_v4l2.c         |   11 +
 drivers/staging/media/hantro/hantro_vp8.c          |  201 ++
 drivers/staging/media/hantro/rk3288_vpu_hw.c       |   41 +-
 drivers/staging/media/hantro/rk3399_vpu_hw.c       |   39 +-
 .../staging/media/hantro/rk3399_vpu_hw_jpeg_enc.c  |   12 +-
 .../staging/media/hantro/rk3399_vpu_hw_mpeg2_dec.c |   14 +-
 .../staging/media/hantro/rk3399_vpu_hw_vp8_dec.c   |  595 +++++
 drivers/staging/media/imx/Kconfig                  |    5 +-
 drivers/staging/media/imx/Makefile                 |    3 +-
 drivers/staging/media/imx/imx-media-csc-scaler.c   |  925 +++++++
 drivers/staging/media/imx/imx-media-dev.c          |   28 +-
 drivers/staging/media/imx/imx-media-internal-sd.c  |    4 +
 drivers/staging/media/imx/imx-media-utils.c        |    2 +-
 drivers/staging/media/imx/imx-media.h              |   12 +
 drivers/staging/media/imx/imx6-mipi-csi2.c         |   12 +-
 drivers/staging/media/imx/imx7-media-csi.c         |   30 +-
 drivers/staging/media/ipu3/ipu3-tables.h           |    4 +-
 drivers/staging/media/ipu3/ipu3.c                  |    3 +-
 drivers/staging/media/omap4iss/iss_video.c         |   40 +-
 drivers/staging/media/omap4iss/iss_video.h         |    2 -
 drivers/staging/media/soc_camera/soc_camera.c      |    2 -
 drivers/staging/media/sunxi/cedrus/cedrus.c        |   63 +-
 drivers/staging/media/sunxi/cedrus/cedrus.h        |    7 +-
 drivers/staging/media/sunxi/cedrus/cedrus_dec.c    |    2 +-
 drivers/staging/media/sunxi/cedrus/cedrus_h264.c   |    4 +-
 drivers/staging/media/sunxi/cedrus/cedrus_hw.c     |    3 -
 drivers/staging/media/sunxi/cedrus/cedrus_regs.h   |    2 +-
 drivers/staging/media/sunxi/cedrus/cedrus_video.c  |   28 +-
 drivers/staging/media/tegra-vde/Kconfig            |    2 +-
 .../vc04_services/bcm2835-camera/bcm2835-camera.c  |   29 -
 .../vc04_services/bcm2835-camera/mmal-common.h     |    1 -
 include/linux/sort.h                               |    5 +
 include/media/davinci/vpfe_capture.h               |    2 +-
 include/media/drv-intf/exynos-fimc.h               |    2 -
 include/media/drv-intf/saa7146_vv.h                |    1 -
 include/media/drv-intf/soc_mediabus.h              |    2 -
 include/media/dvb-usb-ids.h                        |    1 +
 include/media/dvb_frontend.h                       |   21 +-
 include/media/h264-ctrls.h                         |   21 +-
 include/media/rc-map.h                             |   28 +-
 include/media/v4l2-async.h                         |   30 +-
 include/media/v4l2-common.h                        |  150 +-
 include/media/v4l2-ctrls.h                         |   12 +-
 include/media/v4l2-ioctl.h                         |    2 +
 include/media/vp8-ctrls.h                          |  112 +
 include/uapi/linux/videodev2.h                     |    6 +-
 lib/sort.c                                         |   34 +-
 tools/testing/selftests/ir/ir_loopback.c           |    6 +-
 476 files changed, 16764 insertions(+), 24162 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/allwinner,sun4i=
-a10-csi.yaml
 create mode 100644 Documentation/devicetree/bindings/media/allwinner,sun4i=
-a10-ir.yaml
 create mode 100644 Documentation/devicetree/bindings/media/rc.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/sunxi-ir.txt
 create mode 100644 Documentation/media/uapi/rc/rc-protos.rst
 create mode 100644 Documentation/media/uapi/v4l/dev-decoder.rst
 create mode 100644 Documentation/media/uapi/v4l/pixfmt-bayer.rst
 delete mode 100644 Documentation/media/uapi/v4l/pixfmt-packed-rgb.rst
 create mode 100644 drivers/media/i2c/ov5675.c
 create mode 100644 drivers/media/platform/sunxi/Kconfig
 create mode 100644 drivers/media/platform/sunxi/Makefile
 create mode 100644 drivers/media/platform/sunxi/sun4i-csi/Kconfig
 create mode 100644 drivers/media/platform/sunxi/sun4i-csi/Makefile
 create mode 100644 drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
 create mode 100644 drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.h
 create mode 100644 drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c
 create mode 100644 drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c
 create mode 100644 drivers/media/rc/keymaps/rc-khadas.c
 create mode 100644 drivers/media/rc/keymaps/rc-odroid.c
 create mode 100644 drivers/media/rc/keymaps/rc-tanix-tx3mini.c
 create mode 100644 drivers/media/rc/keymaps/rc-tanix-tx5max.c
 create mode 100644 drivers/media/rc/keymaps/rc-wetek-hub.c
 create mode 100644 drivers/media/rc/keymaps/rc-wetek-play2.c
 create mode 100644 drivers/media/rc/keymaps/rc-x96max.c
 create mode 100644 drivers/media/v4l2-core/v4l2-i2c.c
 create mode 100644 drivers/media/v4l2-core/v4l2-spi.c
 delete mode 100644 drivers/staging/media/bcm2048/Kconfig
 delete mode 100644 drivers/staging/media/bcm2048/Makefile
 delete mode 100644 drivers/staging/media/bcm2048/TODO
 delete mode 100644 drivers/staging/media/bcm2048/radio-bcm2048.c
 delete mode 100644 drivers/staging/media/bcm2048/radio-bcm2048.h
 delete mode 100644 drivers/staging/media/davinci_vpfe/Kconfig
 delete mode 100644 drivers/staging/media/davinci_vpfe/Makefile
 delete mode 100644 drivers/staging/media/davinci_vpfe/TODO
 delete mode 100644 drivers/staging/media/davinci_vpfe/davinci-vpfe-mc.txt
 delete mode 100644 drivers/staging/media/davinci_vpfe/davinci_vpfe_user.h
 delete mode 100644 drivers/staging/media/davinci_vpfe/dm365_ipipe.c
 delete mode 100644 drivers/staging/media/davinci_vpfe/dm365_ipipe.h
 delete mode 100644 drivers/staging/media/davinci_vpfe/dm365_ipipe_hw.c
 delete mode 100644 drivers/staging/media/davinci_vpfe/dm365_ipipe_hw.h
 delete mode 100644 drivers/staging/media/davinci_vpfe/dm365_ipipeif.c
 delete mode 100644 drivers/staging/media/davinci_vpfe/dm365_ipipeif.h
 delete mode 100644 drivers/staging/media/davinci_vpfe/dm365_ipipeif_user.h
 delete mode 100644 drivers/staging/media/davinci_vpfe/dm365_isif.c
 delete mode 100644 drivers/staging/media/davinci_vpfe/dm365_isif.h
 delete mode 100644 drivers/staging/media/davinci_vpfe/dm365_isif_regs.h
 delete mode 100644 drivers/staging/media/davinci_vpfe/dm365_resizer.c
 delete mode 100644 drivers/staging/media/davinci_vpfe/dm365_resizer.h
 delete mode 100644 drivers/staging/media/davinci_vpfe/vpfe.h
 delete mode 100644 drivers/staging/media/davinci_vpfe/vpfe_mc_capture.c
 delete mode 100644 drivers/staging/media/davinci_vpfe/vpfe_mc_capture.h
 delete mode 100644 drivers/staging/media/davinci_vpfe/vpfe_video.c
 delete mode 100644 drivers/staging/media/davinci_vpfe/vpfe_video.h
 create mode 100644 drivers/staging/media/hantro/hantro_g1_h264_dec.c
 create mode 100644 drivers/staging/media/hantro/hantro_g1_vp8_dec.c
 create mode 100644 drivers/staging/media/hantro/hantro_h264.c
 create mode 100644 drivers/staging/media/hantro/hantro_vp8.c
 create mode 100644 drivers/staging/media/hantro/rk3399_vpu_hw_vp8_dec.c
 create mode 100644 drivers/staging/media/imx/imx-media-csc-scaler.c
 create mode 100644 include/media/vp8-ctrls.h

