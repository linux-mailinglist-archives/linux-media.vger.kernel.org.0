Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE7AB23E96D
	for <lists+linux-media@lfdr.de>; Fri,  7 Aug 2020 10:43:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727788AbgHGInF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Aug 2020 04:43:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:49302 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726382AbgHGInF (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 7 Aug 2020 04:43:05 -0400
Received: from coco.lan (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 618AC22CAE;
        Fri,  7 Aug 2020 08:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596789782;
        bh=QGOI5RwujmJVqwd85WW6j/h1x7US6HkyAp5qY0KoYog=;
        h=Date:From:To:Cc:Subject:From;
        b=qGLltkD/zDYWOckLgvjVHY9bzxfpYnhTNilSuJM/hNudwD0jg8oHCy1xhLPqJRLFD
         x4TdY9LCUW5NC9HwB6j4HitWSCAz/Gt/WR3WulmAmcM1MZ6xBRyKY3dSp7OELwDNtC
         ltE8YXP0nQxNueaVNJ0GPP8RYHKo2dRdwAEwwmKE=
Date:   Fri, 7 Aug 2020 10:42:58 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL for v5.9-rc1] media updates
Message-ID: <20200807104258.59618b4c@coco.lan>
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
dia/v5.9-1

for:

- Legacy soc_camera driver was removed from staging;
- New I2C sensor related drivers: dw9768, ch7322, max9271, rdacm20;
- TI vpe driver code was re-organized and had new features added;
- Added Xilinx MIPI CSI-2 Rx Subsystem driver;
- Added support for Infrared Toy and IR Droid devices;
- Lots of random driver fixes, new features and cleanups.

Thanks!
Mauro

-

The following changes since commit b3a9e3b9622ae10064826dccb4f7a52bd88c7407:

  Linux 5.8-rc1 (2020-06-14 12:45:04 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/me=
dia/v5.9-1

for you to fetch changes up to f45882cfb152f5d3a421fd58f177f227e44843b9:

  media: camss: fix memory leaks on error handling paths in probe (2020-08-=
06 13:58:40 +0200)

----------------------------------------------------------------
media updates for v5.9-rc1

----------------------------------------------------------------
Alexander A. Klimov (10):
      media: solo6x10: replace http references with https
      media: davinci: replace http references with https
      media: gspca: replace http references with https ones
      media: docs: pvrusb2: replace http references with https ones
      media: cx18: Replace http links with https ones
      media: imon: Replace http links with https ones
      media: ivtv: Replace http links with https ones
      media: rtl2832_sdr: Replace HTTP links with HTTPS ones
      media: tw5864-core: Replace http links with https ones
      media: tw68: Replace http links with https ones

Andrey Konovalov (6):
      media: i2c: imx290: set the format before VIDIOC_SUBDEV_G_FMT is call=
ed
      media: i2c: imx290: fix the order of the args in SET_RUNTIME_PM_OPS()
      media: i2c: imx290: fix reset GPIO pin handling
      media: i2c: imx290: set bus_type before calling v4l2_fwnode_endpoint_=
alloc_parse()
      media: camss: use proper media entity function for subdevices
      media: i2c: imx290: replace msleep(10) with usleep_range(10000, 11000)

Arnd Bergmann (1):
      media: cxusb-analog: fix V4L2 dependency

Benoit Parrot (2):
      media: v4l2-rect.h: add enclosed rectangle helper
      media: use v4l2_rect_enclosed helper

Bingbu Cao (1):
      media: ov2740: make ov2740 driver only work with ACPI

Chen Zhou (1):
      media: coda: jpeg: add NULL check after kmalloc

Christophe JAILLET (1):
      media: s5p-g2d: Fix a memory leak in an error handling path in 'g2d_p=
robe()'

Chuhong Yuan (5):
      media: budget-core: Improve exception handling in budget_register()
      media: marvell-ccic: Add missed v4l2_async_notifier_cleanup()
      media: omap3isp: Add missed v4l2_ctrl_handler_free() for preview_init=
_entities()
      media: tvp5150: Add missed media_entity_cleanup()
      media: exynos4-is: Add missed check for pinctrl_lookup_state()

Colin Ian King (5):
      media: gspca: remove redundant assignment to variable retval
      media: cx231xx: remove redundant assignment to variable err
      media: gspca: remove redundant initialization of variable status
      media: allegro: fix potential null dereference on header
      media: radio: remove redundant assignment to variable retval

Colton Lewis (2):
      media: v4l2: Correct kernel-doc inconsistency
      media: v4l2: Correct kernel-doc inconsistency

Dafna Hirschfeld (22):
      media: staging: rkisp1 stats: set a measure flag with '|=3D' instead =
of '=3D'
      media: staging: rkisp1: stats: don't set stats flags in rkisp1_stats_=
send_measurement
      media: staging: rkisp1: fix dev param for dev_* debugs
      media: staging: rkisp1: cap: remove support of BGR666 format
      media: staging: rkisp1: rsz: supported formats are the isp's src form=
ats, not sink formats
      media: staging: rkisp1: remove macro RKISP1_DIR_SINK_SRC
      media: staging: rkisp1: rename macros 'RKISP1_DIR_*' to 'RKISP1_ISP_S=
D_*'
      media: staging: rkisp1: rsz: set default format if the given format i=
s not RKISP1_ISP_SD_SRC
      media: staging: rkisp1: set more precise size errors in debugfs
      media: staging: rkisp1: use a macro for the statistics flags mask
      media: staging: rkisp1: stats: replace spin_lock_irqsave with spin_lo=
ck_irq
      media: staging: rkisp1: stats: replace locks wq_lock, irq_lock with o=
ne lock
      media: staging: rkisp1: stats: read the stats in the isr
      media: staging: rkisp1: remove duplicate macro definition
      media: staging: rkisp1: fix typos in file rkisp1-config.h
      media: staging: rkisp1: cap: don't set next buffer from rkisp1_vb2_bu=
f_queue
      media: staging: rkisp1: cap: protect buf.curr and buf.next with buf.l=
ock
      media: staging: rkisp1: cap: move code that manages the buffers to rk=
isp1_set_next_buf
      media: staging: rkisp1: cap: in stream start, replace calls to rkisp1=
_handle_buffer with rkisp1_set_next_buf
      media: staging: rkisp1: remove unused field ctrl_handler from struct =
rkisp1_device
      media: staging: rkisp1: remove unused field alloc_ctx from struct rki=
sp1_device
      media: staging: rkisp1: set pads array of the resizer to size 2

Dan Carpenter (5):
      media: firewire: Using uninitialized values in node_probe()
      media: allegro: Fix some NULL vs IS_ERR() checks in probe
      media: pxa_camera: remove an impossible condition
      media: allegro: fix an error pointer vs NULL check
      media: mtk-mdp: Fix a refcounting bug on error in init

Dariusz Marcinkiewicz (1):
      media: cros-ec-cec: do not bail on device_init_wakeup failure

Dinghao Liu (12):
      media: staging: tegra-vde: fix runtime pm imbalance on error
      media: s5k6a3: Fix runtime PM imbalance on error
      media: fimc-capture: Fix runtime PM imbalance on error
      media: coda: Fix runtime PM imbalance on error
      media: camss: csid: Fix runtime PM imbalance in csid_set_power
      media: camss: ispif: Fix runtime PM imbalance on error
      media: camss: vfe: Fix runtime PM imbalance on error
      media: exynos4-is: Fix runtime PM imbalance in isp_video_open
      media: exynos4-is: Fix runtime PM imbalance in fimc_is_probe
      media: vpif: Fix runtime PM imbalance in vpif_probe
      media: smiapp: Fix runtime PM imbalance on error
      media: venus: venc: Fix runtime PM imbalance in venc_open

Dmitry Osipenko (3):
      media: staging: tegra-vde: Runtime PM is always available on Tegra
      media: staging: tegra-vde: Turn ON power domain on shutdown
      media: staging: tegra-vde: Power-cycle hardware on probe

Dongchun Zhu (2):
      media: dt-bindings: media: i2c: Document DW9768 bindings
      media: i2c: dw9768: Add DW9768 VCM driver

Eizan Miyamoto (5):
      media: mtk-mdp: remove mtk_mdp_comp.regs from mtk_mdp_comp.h
      media: mtk-mdp: handle vb2_dma_contig_set_max_seg_size errors during =
probe
      media: mtk-mdp: handle vpu_wdt_reg_handler() errors during probe
      media: mtk-mdp: convert mtk_mdp_dev.comp array to list
      media: mtk-mdp: Remove mtk_mdp_comp.id and supporting functionality

Eugen Hristev (2):
      media: atmel: atmel-sama5d2-isc: fix warning in configs without OF
      media: atmel: atmel-isc: rework component offsets

Eugeniu Rosca (1):
      media: vsp1: dl: Fix NULL pointer dereference on unbind

Evgeny Novikov (4):
      media: rc: return proper error code on error handling path in init
      media: vpss: clean up resources in init
      media: davinci: vpif_capture: fix potential double free
      media: camss: fix memory leaks on error handling paths in probe

Ezequiel Garcia (11):
      v4l2-core: Print control name in VIDIOC_S/G_(EXT)_CTRL(S)
      media: Add V4L2_TYPE_IS_CAPTURE helper
      hantro: h264: Remove unused macro definition
      hantro: h264: Rename scaling list handling function
      hantro: Rework how encoder and decoder are identified
      hantro: Move hantro_enc_buf_finish to JPEG codec_ops.done
      hantro: Remove unused bytesused argument
      hantro: Make sure we don't use post-processor on an encoder
      rkvdec: h264: Refuse to decode unsupported bitstream
      hantro: h264: Refuse to decode unsupported bitstream
      media: videobuf2: Print videobuf2 buffer state by name

Flavio Suligoi (1):
      media: pci: dt3155: fix spelling mistake

Florin Tudorache (1):
      gspca: First camera mode is skipped

Francois Buergisser (1):
      media: mtk-mdp: Remove states for format checks

Gustavo A. R. Silva (2):
      media: usb: pwc: pwc.h: Replace zero-length array with flexible-array=
 member
      media: test_drivers: vivid-core: Use array_size() helper

Hans Verkuil (26):
      media: vidioc-g-parm.rst: update the VIDIOC_G/S_PARM documentation
      media: dev-decoder.rst: small fixes
      media: videodev2.h: add V4L2_FMT_FLAG_ENC_CAP_FRAME_INTERVAL flag
      media: dev-encoder.rst: add reference to V4L2_FMT_FLAG_ENC_CAP_FRAME_=
INTERVAL
      media: cec-ioc-adap-g-caps.rst: document available_log_addrs
      media: cec: remove unused waitq and phys_addrs fields
      media: media/cec.h: document cec_adapter fields
      media: ov9640: update MODULE_DESCRIPTION
      media: pxa_camera: update MODULE_DESCRIPTION
      media: mach-imx: mach-imx27_visstrim_m10.c: remove soc_camera depende=
ncies
      media: mach-omap1: board-ams-delta.c: remove soc_camera dependencies
      media: mach-pxa: palmz72/pcm990: remove soc_camera dependencies
      media: staging/media/soc_camera: remove this driver
      media: soc_camera.h: remove this unused header
      media: arch/arm/configs: remove obsolete CONFIG_SOC_CAMERA*
      media: arch/sh/configs: remove obsolete CONFIG_SOC_CAMERA*
      media: MAINTAINERS: remove SOC-CAMERA entry
      cec-api: prevent leaking memory through hole in structure
      include/media/v4l2-subdev.h: fix typo
      sunxi-csi: fill in bus_info of media device
      sun4i-csi: drop read/write, enable VB2_DMABUF
      sun4i-csi: call _vb2_fop_release instead of v4l2_fh_release
      media: colorspaces-details.rst: fix V4L2_COLORSPACE_JPEG description
      media: v4l2-subdev.h: keep * together with the type
      media: dvbdev.h: keep * together with the type
      media: meye: fix missing pm_mchip_mode field

Helen Koike (1):
      media: staging: rkisp1: rsz: fix resolution limitation on sink pad

Jacopo Mondi (2):
      media: dt-bindings: media: i2c: Add bindings for IMI RDACM2x
      media: i2c: Add RDACM20 driver

Jan Pieter van Woerkom (1):
      media: dvbsky: MyGica T230* receivers also do DVB-C and DVB-T

Jeff Chase (3):
      media: dt-bindings: Add ch7322 media i2c device
      media: cec: add adap_controls_phys_addr option
      media: cec: i2c: ch7322: Add ch7322 CEC controller driver

Jia-Ju Bai (1):
      media: pci: ttpci: av7110: fix possible buffer overflow caused by bad=
 DMA value in debiirq()

Jian-Jia Su (1):
      media: v4l2-dev/ioctl: Fix document for VIDIOC_QUERYCAP

John Cox (1):
      media: videobuf2: Fix length check for single plane dmabuf queueing

Kaaira Gupta (3):
      media: tpg: change char argument to const char
      media: tpg: Add function to return colors' order of test image
      media: vimc: Add a control to display info on test image

Kieran Bingham (1):
      media: i2c: Add MAX9286 driver

Krzysztof Ha=C5=82asa (1):
      staging/media: Remove unneeded geometry restrictions from i.MX CSI dr=
iver

Krzysztof Kozlowski (1):
      media: samsung: Rename Samsung and Exynos to lowercase

Lad Prabhakar (3):
      media: rcar-vin: Invalidate pipeline if conversion is not possible on=
 input formats
      media: rcar-vin: Add support for MEDIA_BUS_FMT_SRGGB8_1X8 format
      media: rcar-csi2: Add support for MEDIA_BUS_FMT_SRGGB8_1X8 format

Laurent Pinchart (98):
      media: vb2: Print the queue pointer in debug messages
      media: ti-vpe: cal: Sort headers alphabetically
      media: ti-vpe: cal: Avoid function forward declaration
      media: ti-vpe: cal: Decouple CSI2 port and CPORT
      media: ti-vpe: cal: Index CSI-2 port starting at 0
      media: ti-vpe: cal: Index IRQ registersstarting at 0
      media: ti-vpe: cal: Merge all status variables in IRQ handler
      media: ti-vpe: cal: Inline CAL_VERSION macro in its only user
      media: ti-vpe: cal: Turn reg_(read|write)_field() into inline functio=
ns
      media: ti-vpe: cal: Make cal_formats array const
      media: ti-vpe: cal: Remove needless variable initialization
      media: ti-vpe: cal: Remove needless casts
      media: ti-vpe: cal: Turn boolean variable into bool
      media: ti-vpe: cal: Make loop indices unsigned where applicable
      media: ti-vpe: cal: Embed base_fields array in struct cal_csi2_phy
      media: ti-vpe: cal: Don't modify cal_csi2_phy base_fields
      media: ti-vpe: cal: Store PHY regmap fields in struct cc_data
      media: ti-vpe: cal: Rename cal_csi2_phy base_fields to fields
      media: ti-vpe: cal: Make structure fields unsigned where applicable
      media: ti-vpe: cal: Constify platform data
      media: ti-vpe: cal: Remove static const cal_regmap_config template
      media: ti-vpe: cal: Remove unused structure fields
      media: ti-vpe: cal: Remove flags field from struct cal_dev
      media: ti-vpe: cal: Move function to avoid forward declaration
      media: ti-vpe: cal: Rename cc_data to cal_camerarx
      media: ti-vpe: cal: Rename cal_csi2_phy to cal_camerarx_data
      media: ti-vpe: cal: Name all cal_dev pointers consistently
      media: ti-vpe: cal: Name all cal_camerarx pointers consistently
      media: ti-vpe: cal: Remove internal phy structure from cal_camerarx
      media: ti-vpe: cal: Store instance ID and cal pointer in cal_camerarx
      media: ti-vpe: cal: Use dev_* print macros
      media: ti-vpe: cal: Add print macros for the cal_camerarx instances
      media: ti-vpe: cal: Store sensor-related data in cal_camerarx
      media: ti-vpe: cal: Create consistent naming for CAMERARX functions
      media: ti-vpe: cal: Group CAMERARX-related functions together
      media: ti-vpe: cal: Inline cal_data_get_num_csi2_phy() in its caller
      media: ti-vpe: cal: Create consistent naming for context functions
      media: ti-vpe: cal: Reorganize remaining code in sections
      media: ti-vpe: cal: Rename cal_ctx.csi2_port to cal_ctx.index
      media: ti-vpe: cal: Use correct device name for bus_info
      media: ti-vpe: cal: Get struct device without going through v4l2_devi=
ce
      media: ti-vpe: cal: Use ctx_info() instead of v4l2_info()
      media: ti-vpe: cal: Use a loop to create CAMERARX and context instanc=
es
      media: ti-vpe: cal: Drop struct cal_dev v4l2_dev field
      media: ti-vpe: cal: Split CAMERARX syscon regmap retrieval to a funct=
ion
      media: ti-vpe: cal: Use syscon_regmap_lookup_by_phandle_args()
      media: ti-vpe: cal: Inline cal_get_camerarx_regmap() in caller
      media: ti-vpe: cal: Add comments to cal_probe() to delimitate sections
      media: ti-vpe: cal: Rename cal_create_instance() to cal_ctx_create()
      media: ti-vpe: cal: Hardcode virtual channel to 0
      media: ti-vpe: cal: Use of_graph_get_endpoint_by_regs() to parse OF
      media: ti-vpe: cal: Fix usage of v4l2_fwnode_endpoint_parse()
      media: ti-vpe: cal: Decouple control handler from v4l2_device
      media: ti-vpe: cal: Move v4l2_device from cal_ctx to cal_dev
      media: ti-vpe: cal: Split video device initialization and registration
      media: ti-vpe: cal: Add context V4L2 cleanup and unregister functions
      media: ti-vpe: cal: Unregister video device before cleanup
      media: ti-vpe: cal: Add cal_camerarx_destroy() to cleanup CAMERARX
      media: ti-vpe: cal: Move DT parsing to CAMERARX
      media: ti-vpe: cal: Use ARRAY_SIZE to replace numerical value
      media: ti-vpe: cal: Move all sensor-related init to .bound() notifier
      media: ti-vpe: cal: Allow multiple contexts per subdev notifier
      media: ti-vpe: cal: Move async notifiers from contexts to cal_dev
      media: ti-vpe: cal: Replace context with phy in async notifier entries
      media: ti-vpe: cal: Operate on phy instances in cal_quickdump_regs()
      media: ti-vpe: cal: Decouple context and phy cleanup at remove time
      media: ti-vpe: cal: Move CAL_NUM_CSI2_PORTS from cal_regs.h to cal.c
      media: ti-vpe: cal: Remove isvcirqset() and isportirqset() macros
      media: ti-vpe: cal: Replace number of ports numerical value by macro
      media: ti-vpe: cal: Split media initialization and cleanup to functio=
ns
      media: ti-vpe: cal: Read hardware revision earlier during probe
      media: ti-vpe: cal: Print revision and hwinfo in a more readable form=
at
      media: ti-vpe: cal: Store struct device in cal_dev
      media: ti-vpe: cal: Register a media device
      media: ti-vpe: cal: Init formats in cal_ctx_v4l2_register()
      media: ti-vpe: cal: Allocate cal_ctx active_fmt array dynamically
      media: ti-vpe: cal: Inline cal_camerarx_max_lanes() in its only caller
      media: ti-vpe: cal: Reorder camerarx functions to prepare refactoring
      media: ti-vpe: cal: Refactor camerarx start and stop
      media: ti-vpe: cal: Don't store external rate in cal_camerarx
      media: ti-vpe: cal: Remove unneeded phy->sensor NULL check
      media: ti-vpe: cal: Use 'unsigned int' type instead of 'unsigned'
      media: ti-vpe: cal: Split video node handling to cal-video.c
      media: ti-vpe: cal: Move CAL I/O accessors to cal.h
      media: ti-vpe: cal: Split CAMERARX handling to cal-camerarx.c
      media: dt-bindings: media: i2c: Add bindings for Maxim Integrated MAX=
9286
      media: device property: Add a function to test is a fwnode is a graph=
 endpoint
      media: v4l2-async: Accept endpoints and devices for fwnode matching
      media: v4l2-async: Pass notifier pointer to match functions
      media: v4l2-async: Log message in case of heterogeneous fwnode match
      media: dt-bindings: media: renesas,fcp: Convert binding to YAML
      media: dt-bindings: media: renesas,fcp: Make power-domains mandatory
      media: dt-bindings: media: renesas,fcp: Add resets and iommus propert=
ies
      media: dt-bindings: media: renesas,fdp1: Convert binding to YAML
      media: dt-bindings: media: renesas,fdp1: Make power-domains mandatory
      media: dt-bindings: media: renesas,fdp1: Add resets property
      media: dt-bindings: media: renesas,vsp1: Convert binding to YAML
      media: dt-bindings: media: renesas,vsp1: Add power-domains and resets

Lukas Bulwahn (1):
      media: MAINTAINERS: rectify CHRONTEL CH7322 CEC DRIVER section

Manivannan Sadhasivam (6):
      media: i2c: imx290: Add support for 2 data lanes
      media: i2c: imx290: Add configurable link frequency and pixel rate
      media: i2c: imx290: Add support for test pattern generation
      media: i2c: imx290: Add RAW12 mode support
      media: i2c: imx290: Add support to enumerate all frame sizes
      media: i2c: imx290: Move the settle time delay out of loop

Mansur Alisha Shaik (1):
      media: venus: fix multiple encoder crash

Mauro Carvalho Chehab (1):
      media: dev-encoder.rst: add GFDL-1-1+ to SPDX header

Michael Tretter (12):
      media: allegro: rework mbox handling
      media: allegro: rework read/write to mailbox
      media: allegro: add explicit mail encoding and decoding
      media: allegro: add field for number of buffers
      media: allegro: don't pack MCU messages
      media: allegro: support handling firmware dependent values
      media: allegro: encode bit fields separately
      media: allegro: add config blob for channel
      media: allegro: set num_ref_idx using response of configured channels
      media: allegro: drop length field from message header
      media: allegro: add a version field to mcu messages
      media: allegro: add support for allegro firmware 2019.2

Niklas S=C3=B6derlund (2):
      media: doc-rst: Fix typos in packed Bayer raw14 pixel formats diagram
      media: rcar-csi2: Rename confirm_start() to phy_post_init() to match =
its usage

Oliver Neukum (1):
      go7007: add sanity checking for endpoints

Paul Kocialkowski (2):
      media: rockchip: rga: Introduce color fmt macros and refactor CSC mod=
e logic
      media: rockchip: rga: Only set output CSC mode for RGB input

Qingwu Zhang (1):
      media: ov2740: add NVMEM interface to read customized OTP data

Randy Dunlap (6):
      Documentation: userspace-api/media: drop doubled words
      media: media-device.h: drop duplicated word in comment
      media: media-devnode.h: drop duplicated word in comment
      media: dvbdev.h: fix duplicated word in comment
      media: media-entity.h: drop duplicated word in comment
      media: v4l2-subdev.h: drop duplicated word in comment

Sakari Ailus (1):
      media: smiapp: Use pm_runtime_get_if_active

Sean Young (7):
      media: rc: add support for Infrared Toy and IR Droid devices
      media: USB: cdc-acm: blacklist IR Droid / IR Toy device
      media: MAINTAINERS: rc-core and lirc maintainership
      media: drx-k: remove unused MulDiv32 function
      media: nuvoton-cir: remove setting tx carrier functions
      media: fintek-cir: remove unused function fintek_clear_reg_bit
      media: cx23888: remove unused functions

Sergey Senozhatsky (14):
      media: videobuf2: use explicit unsigned int in vb2_queue
      media: videobuf2: add cache management members
      media: videobuf2: handle V4L2 buffer cache flags
      media: videobuf2: add V4L2_FLAG_MEMORY_NON_CONSISTENT flag
      media: videobuf2: add queue memory consistency parameter
      media: videobuf2: handle V4L2_FLAG_MEMORY_NON_CONSISTENT flag
      media: videobuf2: factor out planes prepare/finish functions
      media: videobuf2: do not sync caches when we are allowed not to
      media: videobuf2: check ->synced flag in prepare() and finish()
      media: videobuf2: add begin/end cpu_access callbacks to dma-contig
      media: videobuf2: add begin/end cpu_access callbacks to dma-sg
      media: videobuf2: don't test db_attach in dma-contig prepare and fini=
sh
      media: videobuf2: remove redundant if-statement
      media: vivid: add cache_hints module param

Stanimir Varbanov (1):
      media: docs: dev-decoder: Add one more reason for dynamic change

Tomasz Figa (1):
      media: docs-rst: Document memory-to-memory video encoder interface

Tuomas Tynkkynen (1):
      media: media-request: Fix crash if memory allocation fails

Vaibhav Gupta (8):
      media: sta2x11: use generic power management
      media: cx23885: use generic power management
      media: cx25821: use generic power management
      media: cx88: use generic power management
      media: meye: use generic power management
      media: tw68: use generic power management
      media: saa7164: use generic power management
      media: cafe-driver: use generic power management

Vishal Sagar (2):
      media: dt-bindings: media: xilinx: Add Xilinx MIPI CSI-2 Rx Subsystem
      media: v4l: xilinx: Add Xilinx MIPI CSI-2 Rx Subsystem driver

 Documentation/admin-guide/media/fimc.rst           |    6 +-
 Documentation/admin-guide/media/vivid.rst          |    9 +
 .../bindings/media/i2c/chrontel,ch7322.yaml        |   67 +
 .../bindings/media/i2c/dongwoon,dw9768.yaml        |  100 +
 .../bindings/media/i2c/imi,rdacm2x-gmsl.yaml       |  159 ++
 .../bindings/media/i2c/maxim,max9286.yaml          |  366 +++
 .../devicetree/bindings/media/renesas,fcp.txt      |   34 -
 .../devicetree/bindings/media/renesas,fcp.yaml     |   66 +
 .../devicetree/bindings/media/renesas,fdp1.txt     |   37 -
 .../devicetree/bindings/media/renesas,fdp1.yaml    |   69 +
 .../devicetree/bindings/media/renesas,vsp1.txt     |   30 -
 .../devicetree/bindings/media/renesas,vsp1.yaml    |   97 +
 .../bindings/media/xilinx/xlnx,csi2rxss.yaml       |  237 ++
 .../devicetree/bindings/vendor-prefixes.yaml       |    2 +
 Documentation/driver-api/media/drivers/pvrusb2.rst |    2 +-
 Documentation/driver-api/media/drivers/tuners.rst  |    2 +-
 .../media/cec/cec-ioc-adap-g-caps.rst              |    3 +
 .../userspace-api/media/dvb/fe-get-info.rst        |    3 +-
 Documentation/userspace-api/media/v4l/buffer.rst   |   44 +-
 .../media/v4l/colorspaces-details.rst              |    4 +-
 .../userspace-api/media/v4l/dev-decoder.rst        |   10 +-
 .../userspace-api/media/v4l/dev-encoder.rst        |  753 ++++++
 .../userspace-api/media/v4l/dev-mem2mem.rst        |    1 +
 Documentation/userspace-api/media/v4l/dev-osd.rst  |    2 +-
 Documentation/userspace-api/media/v4l/dev-sdr.rst  |    2 +-
 .../userspace-api/media/v4l/hist-v4l2.rst          |    4 +-
 .../userspace-api/media/v4l/pixfmt-srggb14p.rst    |   28 +-
 .../userspace-api/media/v4l/pixfmt-v4l2.rst        |    5 +
 Documentation/userspace-api/media/v4l/v4l2.rst     |    2 +
 .../userspace-api/media/v4l/vidioc-create-bufs.rst |    7 +-
 .../userspace-api/media/v4l/vidioc-dqevent.rst     |    2 +-
 .../userspace-api/media/v4l/vidioc-encoder-cmd.rst |   51 +-
 .../userspace-api/media/v4l/vidioc-enum-fmt.rst    |   30 +-
 .../userspace-api/media/v4l/vidioc-g-parm.rst      |   51 +-
 .../userspace-api/media/v4l/vidioc-querycap.rst    |    4 +-
 .../userspace-api/media/v4l/vidioc-reqbufs.rst     |   21 +-
 .../userspace-api/media/videodev2.h.rst.exceptions |    1 +
 MAINTAINERS                                        |   64 +-
 arch/arm/configs/ezx_defconfig                     |    2 -
 arch/arm/configs/imote2_defconfig                  |    2 -
 arch/arm/configs/imx_v4_v5_defconfig               |    1 -
 arch/arm/configs/imx_v6_v7_defconfig               |    1 -
 arch/arm/configs/pxa_defconfig                     |    3 -
 arch/arm/configs/sama5_defconfig                   |    2 -
 arch/arm/mach-imx/mach-imx27_visstrim_m10.c        |   31 -
 arch/arm/mach-omap1/board-ams-delta.c              |   32 -
 arch/arm/mach-omap1/camera.h                       |   14 -
 arch/arm/mach-omap1/devices.c                      |   43 -
 arch/arm/mach-pxa/palmz72.c                        |  112 -
 arch/arm/mach-pxa/pcm990-baseboard.c               |  157 --
 arch/sh/configs/ap325rxa_defconfig                 |    3 -
 arch/sh/configs/ecovec24_defconfig                 |    3 -
 arch/sh/configs/migor_defconfig                    |    3 -
 arch/sh/configs/se7724_defconfig                   |    2 -
 drivers/media/cec/Kconfig                          |    1 +
 drivers/media/cec/Makefile                         |    2 +-
 drivers/media/cec/core/cec-adap.c                  |    4 -
 drivers/media/cec/core/cec-api.c                   |    8 +-
 drivers/media/cec/core/cec-core.c                  |    1 -
 drivers/media/cec/core/cec-notifier.c              |   11 +-
 drivers/media/cec/i2c/Kconfig                      |   14 +
 drivers/media/cec/i2c/Makefile                     |    5 +
 drivers/media/cec/i2c/ch7322.c                     |  604 +++++
 drivers/media/cec/platform/cros-ec/cros-ec-cec.c   |    6 +-
 drivers/media/common/v4l2-tpg/v4l2-tpg-core.c      |   40 +-
 drivers/media/common/videobuf2/videobuf2-core.c    |  367 +--
 .../media/common/videobuf2/videobuf2-dma-contig.c  |   44 +-
 drivers/media/common/videobuf2/videobuf2-dma-sg.c  |   38 +-
 drivers/media/common/videobuf2/videobuf2-v4l2.c    |  147 +-
 drivers/media/dvb-core/dvb_vb2.c                   |    2 +-
 drivers/media/dvb-frontends/drxk_hard.c            |   11 -
 drivers/media/dvb-frontends/rtl2832_sdr.c          |    2 +-
 drivers/media/firewire/firedtv-fw.c                |    2 +
 drivers/media/i2c/Kconfig                          |   39 +
 drivers/media/i2c/Makefile                         |    4 +
 drivers/media/i2c/dw9768.c                         |  554 +++++
 drivers/media/i2c/imx290.c                         |  404 +++-
 drivers/media/i2c/max9271.c                        |  341 +++
 drivers/media/i2c/max9271.h                        |  224 ++
 drivers/media/i2c/max9286.c                        | 1320 ++++++++++
 drivers/media/i2c/ov2740.c                         |  149 +-
 drivers/media/i2c/ov9640.c                         |    2 +-
 drivers/media/i2c/rdacm20.c                        |  667 ++++++
 drivers/media/i2c/s5k6a3.c                         |    2 +-
 drivers/media/i2c/smiapp/smiapp-core.c             |    5 +-
 drivers/media/i2c/tvp5150.c                        |    8 +-
 drivers/media/mc/mc-request.c                      |   31 +-
 drivers/media/pci/cx18/cx18-cards.c                |    2 +-
 drivers/media/pci/cx23885/cx23885-core.c           |    3 -
 drivers/media/pci/cx23885/cx23888-ir.c             |   20 -
 drivers/media/pci/cx25821/cx25821-core.c           |    3 -
 drivers/media/pci/cx88/cx88-video.c                |   60 +-
 drivers/media/pci/dt3155/dt3155.c                  |    2 +-
 drivers/media/pci/dt3155/dt3155.h                  |    2 +-
 drivers/media/pci/ivtv/ivtv-cards.c                |    2 +-
 drivers/media/pci/meye/meye.c                      |   15 +-
 drivers/media/pci/meye/meye.h                      |    2 -
 drivers/media/pci/saa7164/saa7164-core.c           |    3 -
 drivers/media/pci/solo6x10/solo6x10-core.c         |    2 +-
 drivers/media/pci/solo6x10/solo6x10-disp.c         |    2 +-
 drivers/media/pci/solo6x10/solo6x10-eeprom.c       |    2 +-
 drivers/media/pci/solo6x10/solo6x10-enc.c          |    2 +-
 drivers/media/pci/solo6x10/solo6x10-g723.c         |    2 +-
 drivers/media/pci/solo6x10/solo6x10-gpio.c         |    2 +-
 drivers/media/pci/solo6x10/solo6x10-i2c.c          |    2 +-
 drivers/media/pci/solo6x10/solo6x10-jpeg.h         |    2 +-
 drivers/media/pci/solo6x10/solo6x10-offsets.h      |    2 +-
 drivers/media/pci/solo6x10/solo6x10-p2m.c          |    2 +-
 drivers/media/pci/solo6x10/solo6x10-regs.h         |    2 +-
 drivers/media/pci/solo6x10/solo6x10-tw28.c         |    2 +-
 drivers/media/pci/solo6x10/solo6x10-tw28.h         |    2 +-
 drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c     |    2 +-
 drivers/media/pci/solo6x10/solo6x10-v4l2.c         |    2 +-
 drivers/media/pci/solo6x10/solo6x10.h              |    2 +-
 drivers/media/pci/sta2x11/sta2x11_vip.c            |   63 +-
 drivers/media/pci/ttpci/av7110.c                   |    5 +-
 drivers/media/pci/ttpci/budget-core.c              |   11 +-
 drivers/media/pci/tw5864/tw5864-core.c             |    2 +-
 drivers/media/pci/tw68/tw68-core.c                 |   32 +-
 drivers/media/platform/am437x/am437x-vpfe.c        |   19 +-
 drivers/media/platform/atmel/atmel-isc-base.c      |   60 +-
 drivers/media/platform/atmel/atmel-isc-regs.h      |    2 -
 drivers/media/platform/atmel/atmel-isc.h           |    2 +-
 drivers/media/platform/atmel/atmel-sama5d2-isc.c   |    2 +
 drivers/media/platform/coda/coda-common.c          |    5 +-
 drivers/media/platform/coda/coda-jpeg.c            |    5 +-
 drivers/media/platform/davinci/vpbe_display.c      |    2 +-
 drivers/media/platform/davinci/vpif.c              |    3 +-
 drivers/media/platform/davinci/vpif.h              |    2 +-
 drivers/media/platform/davinci/vpif_capture.c      |    2 -
 drivers/media/platform/davinci/vpif_display.c      |    2 +-
 drivers/media/platform/davinci/vpif_display.h      |    2 +-
 drivers/media/platform/davinci/vpss.c              |   20 +-
 drivers/media/platform/exynos-gsc/gsc-core.c       |    2 +-
 drivers/media/platform/exynos-gsc/gsc-m2m.c        |    2 +-
 drivers/media/platform/exynos4-is/fimc-capture.c   |   22 +-
 drivers/media/platform/exynos4-is/fimc-is.c        |    1 +
 drivers/media/platform/exynos4-is/fimc-isp-video.c |    1 +
 drivers/media/platform/exynos4-is/fimc-lite.c      |   18 +-
 drivers/media/platform/exynos4-is/media-dev.c      |    5 +-
 drivers/media/platform/marvell-ccic/cafe-driver.c  |   31 +-
 drivers/media/platform/marvell-ccic/mcam-core.c    |    5 +-
 drivers/media/platform/marvell-ccic/mcam-core.h    |    2 -
 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c    |    2 +-
 drivers/media/platform/mtk-mdp/mtk_mdp_comp.c      |   76 +-
 drivers/media/platform/mtk-mdp/mtk_mdp_comp.h      |   23 +-
 drivers/media/platform/mtk-mdp/mtk_mdp_core.c      |   69 +-
 drivers/media/platform/mtk-mdp/mtk_mdp_core.h      |   12 +-
 drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c       |   97 +-
 drivers/media/platform/omap3isp/isppreview.c       |    4 +-
 drivers/media/platform/pxa_camera.c                |   21 +-
 drivers/media/platform/qcom/camss/camss-csid.c     |    6 +-
 drivers/media/platform/qcom/camss/camss-csiphy.c   |    2 +-
 drivers/media/platform/qcom/camss/camss-ispif.c    |    6 +-
 drivers/media/platform/qcom/camss/camss-vfe.c      |   10 +-
 drivers/media/platform/qcom/camss/camss.c          |   30 +-
 drivers/media/platform/qcom/venus/pm_helpers.c     |    4 +
 drivers/media/platform/qcom/venus/venc.c           |    3 +-
 drivers/media/platform/rcar-vin/rcar-csi2.c        |   15 +-
 drivers/media/platform/rcar-vin/rcar-dma.c         |   21 +-
 drivers/media/platform/rcar-vin/rcar-v4l2.c        |   15 +-
 drivers/media/platform/rcar_jpu.c                  |    2 +-
 drivers/media/platform/rockchip/rga/rga-hw.c       |   29 +-
 drivers/media/platform/rockchip/rga/rga-hw.h       |    5 +
 drivers/media/platform/s3c-camif/camif-core.c      |    2 +-
 drivers/media/platform/s5p-g2d/g2d.c               |   28 +-
 drivers/media/platform/s5p-jpeg/jpeg-core.c        |   16 +-
 drivers/media/platform/sti/hva/hva-v4l2.c          |    2 +-
 drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c |    2 +
 drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c |    2 +-
 .../media/platform/sunxi/sun4i-csi/sun4i_v4l2.c    |    5 +-
 drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c |    2 +
 drivers/media/platform/ti-vpe/Makefile             |    2 +-
 drivers/media/platform/ti-vpe/cal-camerarx.c       |  649 +++++
 drivers/media/platform/ti-vpe/cal-video.c          |  886 +++++++
 drivers/media/platform/ti-vpe/cal.c                | 2523 ++++------------=
----
 drivers/media/platform/ti-vpe/cal.h                |  267 +++
 drivers/media/platform/ti-vpe/cal_regs.h           |   74 +-
 drivers/media/platform/ti-vpe/vpe.c                |    2 +-
 drivers/media/platform/vsp1/vsp1_dl.c              |    2 +
 drivers/media/platform/xilinx/Kconfig              |    7 +
 drivers/media/platform/xilinx/Makefile             |    1 +
 drivers/media/platform/xilinx/xilinx-csi2rxss.c    | 1111 +++++++++
 drivers/media/radio/si4713/radio-usb-si4713.c      |    2 +-
 drivers/media/rc/Kconfig                           |   11 +
 drivers/media/rc/Makefile                          |    1 +
 drivers/media/rc/fintek-cir.c                      |    7 -
 drivers/media/rc/imon.c                            |    2 +-
 drivers/media/rc/ir_toy.c                          |  509 ++++
 drivers/media/rc/nuvoton-cir.c                     |   32 -
 drivers/media/rc/rc-main.c                         |    2 +-
 drivers/media/test-drivers/vicodec/vicodec-core.c  |    6 +-
 drivers/media/test-drivers/vimc/Kconfig            |    2 +
 drivers/media/test-drivers/vimc/vimc-common.h      |    1 +
 drivers/media/test-drivers/vimc/vimc-core.c        |   10 +
 drivers/media/test-drivers/vimc/vimc-sensor.c      |   71 +
 drivers/media/test-drivers/vivid/vivid-core.c      |   13 +-
 drivers/media/usb/cx231xx/cx231xx-417.c            |    2 +-
 drivers/media/usb/dvb-usb-v2/dvbsky.c              |    8 +-
 drivers/media/usb/dvb-usb/Kconfig                  |    1 +
 drivers/media/usb/go7007/go7007-usb.c              |   11 +-
 drivers/media/usb/gspca/gspca.c                    |    2 +-
 drivers/media/usb/gspca/jl2005bcd.c                |    2 +-
 drivers/media/usb/gspca/ov534.c                    |    2 +-
 drivers/media/usb/gspca/sn9c2028.c                 |    2 +-
 drivers/media/usb/pwc/pwc.h                        |    2 +-
 drivers/media/v4l2-core/v4l2-async.c               |   83 +-
 drivers/media/v4l2-core/v4l2-compat-ioctl32.c      |   10 +-
 drivers/media/v4l2-core/v4l2-ioctl.c               |   19 +-
 drivers/media/v4l2-core/v4l2-mem2mem.c             |    6 +-
 drivers/staging/media/Kconfig                      |    2 -
 drivers/staging/media/Makefile                     |    1 -
 drivers/staging/media/allegro-dvt/allegro-core.c   |  391 +--
 drivers/staging/media/allegro-dvt/allegro-mail.c   |  506 ++++
 drivers/staging/media/allegro-dvt/allegro-mail.h   |  111 +-
 drivers/staging/media/hantro/hantro.h              |   13 +-
 drivers/staging/media/hantro/hantro_drv.c          |   94 +-
 drivers/staging/media/hantro/hantro_h1_jpeg_enc.c  |   17 +
 drivers/staging/media/hantro/hantro_h264.c         |    6 +-
 drivers/staging/media/hantro/hantro_hw.h           |    5 +-
 drivers/staging/media/hantro/hantro_v4l2.c         |   30 +-
 drivers/staging/media/hantro/imx8m_vpu_hw.c        |    2 +-
 drivers/staging/media/hantro/rk3288_vpu_hw.c       |    8 +-
 drivers/staging/media/hantro/rk3399_vpu_hw.c       |    7 +-
 drivers/staging/media/imx/imx-ic-prp.c             |    4 +-
 drivers/staging/media/imx/imx-ic-prpencvf.c        |    4 +-
 drivers/staging/media/imx/imx-media-csi.c          |    4 +-
 drivers/staging/media/imx/imx-media-vdic.c         |    4 +-
 drivers/staging/media/rkisp1/TODO                  |    1 -
 drivers/staging/media/rkisp1/rkisp1-capture.c      |   56 +-
 drivers/staging/media/rkisp1/rkisp1-common.h       |   26 +-
 drivers/staging/media/rkisp1/rkisp1-dev.c          |   11 +-
 drivers/staging/media/rkisp1/rkisp1-isp.c          |   75 +-
 drivers/staging/media/rkisp1/rkisp1-params.c       |    2 +-
 drivers/staging/media/rkisp1/rkisp1-regs.h         |    1 -
 drivers/staging/media/rkisp1/rkisp1-resizer.c      |   18 +-
 drivers/staging/media/rkisp1/rkisp1-stats.c        |  126 +-
 drivers/staging/media/rkisp1/uapi/rkisp1-config.h  |    4 +-
 drivers/staging/media/rkvdec/rkvdec.c              |   29 +-
 drivers/staging/media/soc_camera/Kconfig           |   51 -
 drivers/staging/media/soc_camera/Makefile          |    7 -
 drivers/staging/media/soc_camera/TODO              |    4 -
 drivers/staging/media/soc_camera/imx074.c          |  492 ----
 drivers/staging/media/soc_camera/mt9t031.c         |  853 -------
 drivers/staging/media/soc_camera/soc-camera.rst    |  171 --
 drivers/staging/media/soc_camera/soc_camera.c      | 2164 -----------------
 drivers/staging/media/soc_camera/soc_mediabus.c    |  529 ----
 drivers/staging/media/soc_camera/soc_mt9v022.c     | 1008 --------
 drivers/staging/media/soc_camera/soc_ov5642.c      | 1085 ---------
 drivers/staging/media/soc_camera/soc_ov9740.c      |  992 --------
 drivers/staging/media/tegra-vde/vde.c              |   45 +-
 drivers/usb/class/cdc-acm.c                        |    6 +
 include/linux/platform_data/media/omap1_camera.h   |   32 -
 include/linux/property.h                           |    5 +
 include/media/cec.h                                |   57 +-
 include/media/davinci/vpbe_display.h               |    2 +-
 include/media/drv-intf/soc_mediabus.h              |  107 -
 include/media/dvbdev.h                             |    6 +-
 include/media/media-device.h                       |    2 +-
 include/media/media-devnode.h                      |    2 +-
 include/media/media-entity.h                       |    2 +-
 include/media/soc_camera.h                         |  397 ---
 include/media/tpg/v4l2-tpg.h                       |    3 +-
 include/media/v4l2-mc.h                            |    8 +-
 include/media/v4l2-rect.h                          |   20 +
 include/media/v4l2-subdev.h                        |   39 +-
 include/media/videobuf2-core.h                     |   51 +-
 include/media/videobuf2-v4l2.h                     |   13 +
 include/uapi/linux/videodev2.h                     |   17 +-
 269 files changed, 12786 insertions(+), 12117 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/chrontel,ch=
7322.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/dongwoon,dw=
9768.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/imi,rdacm2x=
-gmsl.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/maxim,max92=
86.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/renesas,fcp.txt
 create mode 100644 Documentation/devicetree/bindings/media/renesas,fcp.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/renesas,fdp1.txt
 create mode 100644 Documentation/devicetree/bindings/media/renesas,fdp1.ya=
ml
 delete mode 100644 Documentation/devicetree/bindings/media/renesas,vsp1.txt
 create mode 100644 Documentation/devicetree/bindings/media/renesas,vsp1.ya=
ml
 create mode 100644 Documentation/devicetree/bindings/media/xilinx/xlnx,csi=
2rxss.yaml
 create mode 100644 Documentation/userspace-api/media/v4l/dev-encoder.rst
 delete mode 100644 arch/arm/mach-omap1/camera.h
 create mode 100644 drivers/media/cec/i2c/Kconfig
 create mode 100644 drivers/media/cec/i2c/Makefile
 create mode 100644 drivers/media/cec/i2c/ch7322.c
 create mode 100644 drivers/media/i2c/dw9768.c
 create mode 100644 drivers/media/i2c/max9271.c
 create mode 100644 drivers/media/i2c/max9271.h
 create mode 100644 drivers/media/i2c/max9286.c
 create mode 100644 drivers/media/i2c/rdacm20.c
 create mode 100644 drivers/media/platform/ti-vpe/cal-camerarx.c
 create mode 100644 drivers/media/platform/ti-vpe/cal-video.c
 create mode 100644 drivers/media/platform/ti-vpe/cal.h
 create mode 100644 drivers/media/platform/xilinx/xilinx-csi2rxss.c
 create mode 100644 drivers/media/rc/ir_toy.c
 delete mode 100644 drivers/staging/media/soc_camera/Kconfig
 delete mode 100644 drivers/staging/media/soc_camera/Makefile
 delete mode 100644 drivers/staging/media/soc_camera/TODO
 delete mode 100644 drivers/staging/media/soc_camera/imx074.c
 delete mode 100644 drivers/staging/media/soc_camera/mt9t031.c
 delete mode 100644 drivers/staging/media/soc_camera/soc-camera.rst
 delete mode 100644 drivers/staging/media/soc_camera/soc_camera.c
 delete mode 100644 drivers/staging/media/soc_camera/soc_mediabus.c
 delete mode 100644 drivers/staging/media/soc_camera/soc_mt9v022.c
 delete mode 100644 drivers/staging/media/soc_camera/soc_ov5642.c
 delete mode 100644 drivers/staging/media/soc_camera/soc_ov9740.c
 delete mode 100644 include/linux/platform_data/media/omap1_camera.h
 delete mode 100644 include/media/drv-intf/soc_mediabus.h
 delete mode 100644 include/media/soc_camera.h

