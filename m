Return-Path: <linux-media+bounces-38701-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB897B173EF
	for <lists+linux-media@lfdr.de>; Thu, 31 Jul 2025 17:27:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 079C95843D4
	for <lists+linux-media@lfdr.de>; Thu, 31 Jul 2025 15:27:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D02051DE3BA;
	Thu, 31 Jul 2025 15:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pBrPQ192"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29AA115A8;
	Thu, 31 Jul 2025 15:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753975650; cv=none; b=KIzoTnOS/1j4zEdnIiGLa3oGSmZfxwLZsiJ5gvoZPAZ1lXQvPvQuxG5TB8wjovwAEdujP0cVBai1BpsF0Vt+9rVVXhgogRbOT5Z2m59POuXkmY5hj9iqOxC3+OY/mG+qsDJT5EDxOx1bcJbPZ/5U4nfy4TOGmKt0prPCOlrZC94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753975650; c=relaxed/simple;
	bh=nDK7srfOWgmMG6ce6vxha8N9YivOiXsAakejO9mSzxc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=CNAKOM9rFxGMNMkt1xJKpD/RXd9AX1Dcb2J7ypKJlREzmT5hymn8Ybvx8PL2msvCSKVlDR34j2gJQpRagrBdFjxl/fkkZG8UErVBITbEp/CjqEm7MIJ+GpTAiMyz/OZ4zR8ZUs/f3+kqDb/deU7BIYi7txGDl3a3zdHu8C9lUFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pBrPQ192; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07C94C4CEF7;
	Thu, 31 Jul 2025 15:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753975649;
	bh=nDK7srfOWgmMG6ce6vxha8N9YivOiXsAakejO9mSzxc=;
	h=Date:From:To:Cc:Subject:From;
	b=pBrPQ192VkZ0fty/+LzNC9vk8XhlEocnuptp4CtZkHRUXMvRNbUFtgAo/8eU8jtOd
	 M3YFw8jtprH7kZB4lnTh+eiP3yK2aVOriFESxkj/BN60vww74rZvTYw8Ik/CQnIi2n
	 7bBmIf//dyZmEKXq3LTEVqo+eYosHCuV2/TcQjeMG0hGiEXhFqyIg9QBnSB5HHn28w
	 iKI1cs2Ciz7EtcXG+4PYoZQshdO0XHk5Z5hro9/Fk948ATS7gONGa8QzhYT2nJsaMT
	 ZQHbcxKkMVLpY7Bo0RostkTg9SQEEoqbUYb063pmfNSlS3utB6WpKQytsFV8hCUvIS
	 YddROrbUS0uFQ==
Date: Thu, 31 Jul 2025 17:27:24 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton
 <akpm@linux-foundation.org>, Linux Media Mailing List
 <linux-media@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL for v6.17] media updates
Message-ID: <20250731172724.5de121a3@sal.lan>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Linus,

Please pull from:

	git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git medi=
a/v6.17-1

For:

- v4l2 core: sub-device framework routing improvements;
- v4l2 core: NV12M tiled variants added to v4l2_format_info;
- v4l2 core: some fixes at control handler freeing logic;
- v4l2 core: fixed H264 SEPARATE_COLOUR_PLANE check;
- new staging driver: Intel IPU7 PCI;
- Rockchip video decoder driver got promoted from staging;
- iris: added HEVC/VP9 encoder/decoder support;
- vsp1: driver has gained Renesas VSPX support;
- uvc: switched to vb2 ioctl helpers;
- uvc: added MSXU 1.5 metadata support;
- atomisp: GC0310 sensor driver cleanups in preparation
  for moving it out of staging;
- Lots of cleanup, fixes and improvements.

Regards,
Mauro

---


---

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git tag=
s/media/v6.17-1

for you to fetch changes up to d968e50b5c26642754492dea23cbd3592bde62d8:

  media: rkvdec: Unstage the driver (2025-07-12 08:34:48 +0200)

----------------------------------------------------------------
[GIT PULL for v6.17] media updates

----------------------------------------------------------------
Abdelrahman Fekry (3):
      media: atomisp: Remove debug sysfs attributes active_bo and free_bo
      media: atomisp: Fix premature setting of HMM_BO_DEVICE_INITED flag
      media: atomisp: Remove custom sysfs attributes from atomisp_drvfs.c

Akhil P Oommen (1):
      media: iris: Fix opp scaling of power domains

Alex Guo (2):
      media: dvb-frontends: w7090p: fix null-ptr-deref in w7090p_tuner_writ=
e_serpar and w7090p_tuner_read_serpar
      media: dvb-frontends: dib7090p: fix null-ptr-deref in dib7090p_rw_on_=
apb()

Andr=C3=A9 Apitzsch (5):
      media: i2c: imx214: Reorder imx214_parse_fwnode call
      media: i2c: imx214: Prepare for variable clock frequency
      media: i2c: imx214: Make use of CCS PLL calculator
      media: dt-bindings: sony,imx214: Deprecate property clock-frequency
      media: i2c: imx214: Remove hard-coded external clock frequency

Andy Shevchenko (6):
      media: v4l2-core: Replace the check for firmware registered I2C devic=
es
      media: cx18: Replace custom implementation of list_entry_is_head()
      media: i2c: max96717: Drop unused field assignment
      media: atomisp: Remove unused header
      media: atomisp: Replace macros from math_support.h
      media: atomisp: Remove no more used macros from math_support.h

Arnd Bergmann (2):
      media: staging/ipu7: avoid division by 64-bit value
      media: staging/ipu7: add CONFIG_PCI dependency

Bartosz Golaszewski (7):
      media: dvb-frontends/cxd2820r: use new GPIO line value setter callbac=
ks
      media: solo6x10: remove unneeded GPIO direction setters
      media: solo6x10: use new GPIO line value setter callbacks
      media: i2c: ds90ub953: use new GPIO line value setter callbacks
      media: i2c: ds90ub913: use new GPIO line value setter callbacks
      media: i2c: max96717: use new GPIO line value setter callbacks
      media: i2c: max9286: use new GPIO line value setter callbacks

Benjamin Mugnier (4):
      media: i2c: vd55g1: Fix RATE macros not being expressed in bps
      media: i2c: vd55g1: Fix return code in vd55g1_enable_streams error pa=
th
      media: i2c: vd55g1: Setup sensor external clock before patching
      media: i2c: vd55g1: Use first index of mbus codes array as default

Bingbu Cao (8):
      media: staging/ipu7: add Intel IPU7 PCI device driver
      media: staging/ipu7: add IPU7 DMA APIs and MMU mapping
      media: staging/ipu7: add firmware parse, syscom interface and boot
      media: staging/ipu7: add IPU7 firmware ABI headers
      media: staging/ipu7: add IPU7 input system device driver
      MAINTAINERS: add maintainers for Intel IPU7 input system driver
      media: staging/ipu7: add Makefile, Kconfig and to-do file for IPU7
      media: hi556: correct the test pattern configuration

Bryan O'Donoghue (2):
      media: qcom: camss: csiphy-3ph: Fix inadvertent dropping of SDM660/SD=
M670 phy init
      media: qcom: camss: Remove extraneous -supply postfix on supply names

Christophe JAILLET (2):
      media: flexcop-i2c: Constify struct i2c_algorithm
      media: verisilicon: Use __set_bit() with local bitmaps

Cosmin Tanislav (3):
      media: rc: ir-spi: allocate buffer dynamically
      media: rc: ir-spi: constrain carrier frequency
      media: rc: ir-spi: avoid overflow in multiplication

Dan Carpenter (2):
      media: gspca: Add bounds checking to firmware parser
      media: imx8mq-mipi-csi2: Fix error code in imx8mq_mipi_csi_parse_dt()

Daniel Scally (9):
      media: i2c: Defer ov5670_probe() if endpoint not found
      platform/x86: int3472: Add board data for Dell 7212
      media: ipu-bridge: Add _HID for OV5670
      media: v4l2: Add Renesas Camera Receiver Unit pixel formats
      media: rzg2l-cru: Add vidioc_enum_framesizes()
      media: platform: rzg2l-cru: Use v4l2_get_link_freq()
      media: platform: rzg2l-cru: Use v4l2_fill_pixfmt()
      media: rzg2l-cru: Support multiple mbus codes per pixel format
      media: platform: rzg2l-cru: Add support for RAW10/12/14 data

Dave Stevenson (4):
      media: tc358743: Add support for 972Mbit/s link freq
      media: tc358743: Increase FIFO trigger level to 374
      media: tc358743: Check I2C succeeded during probe
      media: tc358743: Return an appropriate colorspace from tc358743_set_f=
mt

Detlev Casanova (4):
      media: dt-bindings: rockchip: Document RK3588 Video Decoder bindings
      media: dt-bindings: rockchip: Add RK3576 Video Decoder bindings
      media: rkvdec: Remove TODO file
      media: rkvdec: Unstage the driver

Devarsh Thakkar (1):
      media: ti: j721e-csi2rx: Allow passing cache hints from user-space

Dikshita Agarwal (26):
      media: iris: Skip destroying internal buffer if not dequeued
      media: iris: Verify internal buffer release on close
      media: iris: Update CAPTURE format info based on OUTPUT format
      media: iris: Avoid updating frame size to firmware during reconfig
      media: iris: Drop port check for session property response
      media: iris: Prevent HFI queue writes when core is in deinit state
      media: iris: Remove error check for non-zero v4l2 controls
      media: iris: Remove deprecated property setting to firmware
      media: iris: Fix missing function pointer initialization
      media: iris: Fix NULL pointer dereference
      media: iris: Fix typo in depth variable
      media: iris: Track flush responses to prevent premature completion
      media: iris: Fix buffer preparation failure during resolution change
      media: iris: Send V4L2_BUF_FLAG_ERROR for capture buffers with 0 fill=
ed length
      media: iris: Skip flush on first sequence change
      media: iris: Remove unnecessary re-initialization of flush completion
      media: iris: Add handling for corrupt and drop frames
      media: iris: Add handling for no show frames
      media: iris: Improve last flag handling
      media: iris: Remove redundant buffer count check in stream off
      media: iris: Add a comment to explain usage of MBPS
      media: iris: Add HEVC and VP9 formats for decoder
      media: iris: Add platform capabilities for HEVC and VP9 decoders
      media: iris: Set mandatory properties for HEVC and VP9 decoders.
      media: iris: Add internal buffer calculation for HEVC and VP9 decoders
      media: iris: Add codec specific check for VP9 decoder drain handling

Dongcheng Yan (1):
      media: i2c: set lt6911uxe's reset_gpio to GPIOD_OUT_LOW

Dr. David Alan Gilbert (4):
      media: saa7164: Remove unused functions
      media: amphion: Remove unused functions
      media: platform: ti: Remove unused vpdma_update_dma_addr
      media: v4l2-jpeg: Remove unused v4l2_jpeg_parse_* wrappers

Frank Li (9):
      media: dt-bindings: Add binding doc for i.MX8QXP and i.MX8QM ISI
      media: nxp: imx8-isi: Allow num_sources to be greater than num_sink
      media: nxp: imx8-isi: Remove unused offset in mxc_isi_reg and use BIT=
() macro for mask
      media: nxp: imx8-isi: Use devm_clk_bulk_get_all() to fetch clocks
      media: nxp: imx8-isi: Remove redundant check for dma_set_mask_and_coh=
erent()
      media: nxp: imx8-isi: Use dev_err_probe() to simplify code
      media: imx8mq-mipi-csi2: Add support for i.MX8QXP
      dt-bindings: media: convert fsl-vdoa.txt to yaml format
      media: dt-bindings: nxp,imx8-jpeg: Add compatible strings for IMX95 J=
PEG

Gui-Dong Han (1):
      media: rainshadow-cec: fix TOCTOU race condition in rain_interrupt()

Guoniu.zhou (1):
      media: imx8mq-mipi-csi2: Add imx8mq_plat_data for different compatibl=
e strings

Hanne-Lotta M=C3=A4enp=C3=A4=C3=A4 (1):
      media: Documentation: Improve grammar, formatting in Video4Linux

Hans Verkuil (9):
      media: i2c: adv7604/tc358743/tda1997x: HPD low for HZ / 7
      media: cec: core: add glitch error injection
      media: cec: core: add rx-no-low-drive setting
      Documentation: media: cec: update error inj doc
      media: cec: cec-gpio: rename functions
      media: cec: cec-gpio: reading hpd/5v is allowed to sleep
      .mailmap: update Hans Verkuil's email addresses
      media: vivid: fix wrong pixel_array control size
      media: uvcvideo: Use vb2 ioctl and fop helpers

Hans de Goede (41):
      MAINTAINERS: .mailmap: Update Hans de Goede's email address
      media: ipu-bridge: Add link-frequency to the GC0310 entry
      media: ivsc: Fix crash at shutdown due to missing mei_cldev_disable()=
 calls
      media: ipu-bridge: Add Toshiba T4KA3 HID to list of supported sensor
      media: ipu-bridge: Add Onsemi MT9M114 HID to list of supported sensors
      media: ov5693: Improve error logging when fwnode is not found
      media: ov7251: Improve error logging when fwnode is not found
      media: ov8865: Improve error logging when fwnode is not found
      media: ipu-bridge: Improve error logging when waiting for IVSC to bec=
ome ready
      media: atomisp: Move atomisp_stop_streaming() above atomisp_start_str=
eaming()
      media: atomisp: Properly stop the ISP stream on sensor streamon errors
      media: atomisp: Stop pipeline on atomisp_css_start() failure
      media: atomisp: Always free MIPI / CSI-receiver buffers from ia_css_u=
ninit()
      media: atomisp: Fix "stop stream timeout." error
      media: atomisp: Switch to int3472 driver sensor GPIO mapping code
      media: atomisp: gc0310: Rename "dev" function variable to "sensor"
      media: atomisp: gc0310: Drop unused GC0310_FOCAL_LENGTH_NUM define
      media: atomisp: gc0310: Modify vblank value to run at 30 fps
      media: atomisp: gc0310: Switch to CCI register access helpers
      media: atomisp: gc0310: Use V4L2_CID_ANALOGUE_GAIN for gain control
      media: atomisp: gc0310: Add selection API support
      media: atomisp: gc0310: Add link-frequency and pixelrate controls
      media: atomisp: gc0310: Add vblank and hblank controls
      media: atomisp: gc0310: Add camera orientation and sensor rotation co=
ntrols
      media: atomisp: gc0310: Limit max exposure value to mode-height + vbl=
ank
      media: atomisp: gc0310: Add check_hwcfg() function
      media: atomisp: gc0310: Fix power on/off sleep times
      media: atomisp: gc0310: Remove unused is_streaming variable
      media: atomisp: gc0310: Switch to {enable,disable}_streams
      media: atomisp: gc0310: Switch to using the sub-device state lock
      media: atomisp: gc0310: Implement internal_ops.init_state
      media: atomisp: gc0310: Use v4l2_subdev_get_fmt() as v4l2_subdev_pad_=
ops.get_fmt()
      media: atomisp: gc0310: Switch to using sd.active_state fmt
      media: atomisp: gc0310: Move and rename suspend/resume functions
      media: atomisp: gc0310: runtime-PM fixes
      media: atomisp: gc0310: Drop gc0310_get_frame_interval()
      media: atomisp: gc0310: Drop gc0310_g_skip_frames()
      media: hi556: Fix reset GPIO timings
      media: hi556: Support full range of power rails
      media: i2c: Automatically select common options for lens drivers
      media: uvcvideo: Use a count variable for meta_formats instead of 0 t=
erminating

Haoxiang Li (1):
      media: imx: fix a potential memory leak in imx_media_csc_scaler_devic=
e_init()

Hugues Fruchet (1):
      media: verisilicon: postproc: 4K support

Jacopo Mondi (10):
      media: rcar-fcp: Add rcar_fcp_soft_reset()
      media: vsp1: vsp1_dl: Detect double list release
      media: vsp1: vsp1_dl: Count display lists
      media: vsp1: Add VSPX support
      media: pisp_be: Drop reference to non-existing function
      media: pisp_be: Remove config validation from schedule()
      media: pisp_be: Split jobs creation and scheduling
      media: pisp_be: Fix pm_runtime underrun in probe
      media: pisp_be: Use clamp() and define max sizes
      media: vsp1: Add missing export.h

Jai Luthra (1):
      media: rockchip: rkisp1: Add support for Wide Dynamic Range

James Cowgill (1):
      media: v4l2-ctrls: Fix H264 SEPARATE_COLOUR_PLANE check

Jason Chen (1):
      media: ipu-bridge: Add support for additional link frequencies

Jernej Skrabec (1):
      media: cedrus: Add support for additional output formats

Jinjie Ruan (3):
      media: samsung: exynos4-is: Use for_each_available_child_of_node_scop=
ed()
      media: c8sectpfe: Use for_each_child_of_node_scoped()
      media: xilinx-vipp: Use for_each_child_of_node_scoped()

Jorge Ramirez-Ortiz (2):
      media: venus: protect against spurious interrupts during probe
      media: venus: hfi: explicitly release IRQ during teardown

Julien Massot (1):
      media: ti: j721e-csi2rx: fix list_del corruption

Koji Matsuoka (1):
      media: vsp1: Reset FCP after VSPD

Konrad Dybcio (1):
      media: venus: Fix MSM8998 frequency table

Krzysztof Ha=C5=82asa (1):
      media: nxp: imx8-isi: Simplify a couple of error messages

Krzysztof Kozlowski (1):
      media: exynos4-is: fimc-is: Fully open-code compatible for grepping

Kuan-Wei Chiu (3):
      media: media/test_drivers: Replace open-coded parity calculation with=
 parity8()
      media: pci: cx18-av-vbi: Replace open-coded parity calculation with p=
arity8()
      media: saa7115: Replace open-coded parity calculation with parity8()

Lad Prabhakar (4):
      media: dt-bindings: media: renesas,fcp: Document RZ/V2N SoC
      media: dt-bindings: media: renesas,vsp1: Document RZ/V2N SoC
      media: renesas: rzg2l-cru: Simplify FIFO empty check
      media: renesas: rzg2l-cru: Fix typo in rzg3e_fifo_empty name

Laurent Pinchart (8):
      media: imx-mipi-csis: Use CSI-2 data type macros from mipi-csi2.h
      media: ipu3-cio2: Use V4L2 subdev active state
      media: v4l2-subdev: Limit the number of active routes to V4L2_FRAME_D=
ESC_ENTRY_MAX
      media: i2c: ds90ub913: Drop check on number of active routes
      media: i2c: ds90ub953: Drop check on number of active routes
      media: i2c: ds90ub960: Drop check on number of active routes
      media: i2c: max96714: Drop check on number of active routes
      media: vsp1: Use lockdep assertions to enforce documented conventions

Ludwig Disterhof (1):
      media: usbtv: Lock resolution while streaming

Marek Szyprowski (1):
      media: v4l2: Add support for NV12M tiled variants to v4l2_format_info=
()

Martin Hecht (1):
      MAINTAINERS: Update my email address to gmail.com

Martin T=C5=AFma (1):
      media: mgb4: Enumerate only the available timings

Mathis Foerst (4):
      media: dt-bindings: mt9m114: Add slew-rate DT-binding
      media: mt9m114: Bypass PLL if required
      media: mt9m114: Factor out mt9m114_configure_pa
      media: mt9m114: Fix deadlock in get_frame_interval/set_frame_interval

Matthias Fend (4):
      media: i2c: imx415: Request the sensor clock without a name
      media: dw9714: coding style fixes
      media: dw9714: move power sequences to dedicated functions
      media: dw9714: add support for powerdown pin

Mehdi Djait (2):
      media: uapi: videodev2: Fix comment for 12-bit packed Bayer formats
      media: v4l2-common: Add the missing Raw Bayer pixel formats

Ming Qian (3):
      media: amphion: Add H264 and HEVC profile and level control
      media: imx-jpeg: Account for data_offset when getting image address
      media: amphion: Support dmabuf and v4l2 buffer without binding

Nicolas Dufresne (2):
      media: verisilicon: Fix AV1 decoder clock frequency
      media: rkvdec: Restore iommu addresses on errors

Niklas S=C3=B6derlund (25):
      media: rcar-csi2: Clarify usage of mbps and msps
      media: rcar-csi2: Rework macros to access AFE lanes
      media: rcar-csi2: Update start procedure for V4H
      media: rcar-csi2: Add D-PHY support for V4H
      media: rcar-vin: Use correct count of remote subdevices
      media: rcar-vin: Store platform info with group structure
      media: rcar-vin: Change link setup argument
      media: rcar-vin: Use error labels in probe
      media: rcar-vin: Generate a VIN group ID for Gen2
      media: rcar-vin: Prepare for unifying all v4l-async notifiers
      media: rcar-vin: Improve error paths for parallel devices
      media: rcar-vin: Merge all notifiers
      media: rcar-vin: Always create a media pad
      media: rcar-vin: Remove NTSC workaround
      media: rcar-vin: Only expose VIN controls
      media: rcar-vin: Enable media-graph on Gen2
      media: rcar-vin: Fold event notifier into only user
      media: rcar-vin: Fold interrupt helpers into only callers
      media: rcar-vin: Check for correct capture interrupt event
      media: rcar-vin: Generate FRAME_SYNC events
      media: v4l2-common: Reduce warnings about missing V4L2_CID_LINK_FREQ =
control
      media: i2c: imx290: Remove unneeded assignment of subdev device point=
er
      media: adv7180: Remove g_pixelaspect implementation
      media: adv748x: Remove g_pixelaspect implementation
      media: v4l2-subdev: Remove g_pixelaspect operation

Olivier Benjamin (2):
      dt-bindings: media: ov8858: inherit video-interface-devices properties
      dt-bindings: media: imx258: inherit video-interface-devices properties

Pablo (1):
      media: atomisp: Fix ia_css_vf.host.c coding style

Renjiang Han (1):
      media: venus: pm_helpers: use opp-table for the frequency

Ricardo Ribalda (21):
      media: uvcvideo: Set V4L2_CTRL_FLAG_DISABLED during queryctrl errors
      media: uvcvideo: Populate all errors in uvc_probe()
      media: uvcvideo: Refactor uvc_ctrl_set_handle()
      media: uvcvideo: Refactor uvc_queue_streamon
      media: uvcvideo: Refactor uvc_v4l2_compat_ioctl32
      media: uvcvideo: Add quirk for HP Webcam HD 2300
      media: venus: vdec: Clamp param smaller than 1fps and bigger than 240.
      media: venus: venc: Clamp param smaller than 1fps and bigger than 240
      media: venus: venc: Make the range of us_per_frame explicit
      media: venus: vdec: Make the range of us_per_frame explicit
      media: uvcvideo: Handle locks in uvc_queue_return_buffers
      media: uvcvideo: Split uvc_stop_streaming()
      media: uvcvideo: Remove stream->is_streaming field
      media: uvcvideo: Turn on the camera if V4L2_EVENT_SUB_FL_SEND_INITIAL
      media: core: export v4l2_translate_cmd
      media: uvcvideo: uvc_v4l2_unlocked_ioctl: Invert PM logic
      media: uvcvideo: Do not mark valid metadata as invalid
      media: Documentation: Add note about UVCH length field
      media: uvcvideo: Introduce dev->meta_formats
      media: uvcvideo: Introduce V4L2_META_FMT_UVC_MSXU_1_5
      media: uvcvideo: Auto-set UVC_QUIRK_MSXU_META

Richard Acayan (1):
      media: qcom: camss: Power pipeline only when streaming

Robert Chiras (2):
      media: imx8-isi: Add support for i.MX8QM and i.MX8QXP
      media: dt-bindings: nxp,imx8mq-mipi-csi2: Add i.MX8QM(QXP) compatible=
 strings

Sakari Ailus (13):
      media: dt-bindings: mipi-ccs: Refer to video-interface-devices.yaml
      media: v4l2-ctrls: Don't reset handler's error in v4l2_ctrl_handler_f=
ree()
      media: v4l2-ctrls: Return the handler's error in v4l2_ctrl_handler_fr=
ee()
      media: Documentation: Document new v4l2_ctrl_handler_free() behaviour
      media: ivsc: Remove Wentong's e-mail address
      media: ov2740: Remove shorthand variables
      media: ipu7: Drop IPU8 PCI ID for now
      media: ipu6: isys: Use correct pads for xlate_streams()
      media: ipu6: isys: Set minimum height to 1
      media: v4l: Make media_entity_to_video_device() NULL-safe
      media: v4l2-subdev: Print early in v4l2_subdev_{enable,disable}_strea=
ms()
      media: v4l2-subdev: Add debug prints to v4l2_subdev_collect_streams()
      media: ivsc: Add MAINTAINERS entry

Stefan Klug (2):
      media: rkisp1: Properly handle result of rkisp1_params_init_vb2_queue=
()
      media: rkisp1: Add RKISP1_CID_SUPPORTED_PARAMS_BLOCKS control

Thomas Andreatta (3):
      media: atomisp: gc0310: Remove redundant debug message
      media: atomisp: gc2235: Fix struct definition style
      media: atomisp: ov2722: Fix struct definition style

Tomi Valkeinen (2):
      media: raspberrypi: cfe: Fix min_reqbufs_allocation
      media: rcar-csi2: Use the pad version of v4l2_get_link_freq()

Tommaso Merciai (1):
      media: rzg2l-cru: Fix typo in rzg2l_cru_of_id_table struct

Vedang Nagar (2):
      media: venus: Add a check for packet size after reading from shared m=
emory
      media: venus: Fix OOB read due to missing payload bound check

Vladimir Zapolskiy (9):
      dt-bindings: media: qcom,x1e80100-camss: Tighten the property regex p=
attern
      dt-bindings: media: qcom,x1e80100-camss: Add optional bus-type proper=
ty
      dt-bindings: media: qcom,x1e80100-camss: Remove clock-lanes port prop=
erty
      dt-bindings: media: qcom,x1e80100-camss: Fix isp unit address
      media: qcom: camss: cleanup media device allocated resource on error =
path
      media: qcom: camss: remove duplicated csiphy_formats_sc7280 data
      media: qcom: camss: register camss media device before subdevices
      media: qcom: camss: simplify camss_subdev_notifier_complete() function
      MAINTAINERS: add myself as a CAMSS patch reviewer

Wolfram Sang (2):
      media: usb: hdpvr: disable zero-length read messages
      media: usb: hdpvr: use I2C core to handle only supported messages

Yemike Abhilash Chandra (2):
      dt-bindings: media: cdns,csi2rx.yaml: Add optional interrupts for cdn=
s-csi2rx
      media: cadence: csi2rx: Enable csi2rx_err_irq interrupt and add suppo=
rt for VIDIOC_LOG_STATUS

Youngjun Lee (1):
      media: uvcvideo: Fix 1-byte out-of-bounds read in uvc_parse_format()

Zhang Shurong (1):
      media: ov2659: Fix memory leaks in ov2659_probe()

chenchangcheng (1):
      media: uvcvideo: Fix bandwidth issue for Alcor camera

 .mailmap                                           |    6 +-
 .../devicetree/bindings/media/cdns,csi2rx.yaml     |    8 +
 .../devicetree/bindings/media/fsl,imx6q-vdoa.yaml  |   42 +
 .../devicetree/bindings/media/fsl,imx8qm-isi.yaml  |  117 +
 .../devicetree/bindings/media/fsl,imx8qxp-isi.yaml |  106 +
 .../devicetree/bindings/media/fsl-vdoa.txt         |   21 -
 .../devicetree/bindings/media/i2c/mipi-ccs.yaml    |   13 +-
 .../bindings/media/i2c/onnn,mt9m114.yaml           |    9 +
 .../devicetree/bindings/media/i2c/ovti,ov8858.yaml |    4 +-
 .../devicetree/bindings/media/i2c/sony,imx214.yaml |   29 +-
 .../devicetree/bindings/media/i2c/sony,imx258.yaml |    4 +-
 .../devicetree/bindings/media/nxp,imx8-jpeg.yaml   |   28 +-
 .../bindings/media/nxp,imx8mq-mipi-csi2.yaml       |   38 +-
 .../bindings/media/qcom,x1e80100-camss.yaml        |   14 +-
 .../devicetree/bindings/media/renesas,fcp.yaml     |    1 +
 .../devicetree/bindings/media/renesas,vsp1.yaml    |    1 +
 .../devicetree/bindings/media/rockchip,vdec.yaml   |   80 +-
 Documentation/driver-api/media/v4l2-controls.rst   |    9 +-
 .../userspace-api/media/cec/cec-pin-error-inj.rst  |   42 +
 Documentation/userspace-api/media/v4l/biblio.rst   |    2 +-
 .../userspace-api/media/v4l/dev-sliced-vbi.rst     |    4 +-
 .../userspace-api/media/v4l/ext-ctrls-fm-rx.rst    |   11 +-
 .../userspace-api/media/v4l/ext-ctrls-fm-tx.rst    |   21 +-
 .../userspace-api/media/v4l/meta-formats.rst       |    1 +
 .../media/v4l/metafmt-uvc-msxu-1-5.rst             |   23 +
 .../userspace-api/media/v4l/metafmt-uvc.rst        |    4 +-
 .../userspace-api/media/v4l/pixfmt-bayer.rst       |    1 +
 .../userspace-api/media/v4l/pixfmt-rawnn-cru.rst   |  143 +
 .../userspace-api/media/v4l/pixfmt-srggb12p.rst    |    4 +-
 .../userspace-api/media/v4l/pixfmt-srggb14p.rst    |    2 +-
 MAINTAINERS                                        |  104 +-
 drivers/media/cec/core/cec-pin-error-inj.c         |   59 +-
 drivers/media/cec/core/cec-pin-priv.h              |    8 +
 drivers/media/cec/core/cec-pin.c                   |   31 +-
 drivers/media/cec/platform/cec-gpio/cec-gpio.c     |   58 +-
 drivers/media/cec/usb/rainshadow/rainshadow-cec.c  |    3 +-
 drivers/media/common/b2c2/flexcop-i2c.c            |    2 +-
 drivers/media/dvb-frontends/cxd2820r_core.c        |    6 +-
 drivers/media/dvb-frontends/dib7000p.c             |    8 +
 drivers/media/i2c/Kconfig                          |   41 +-
 drivers/media/i2c/adv7180.c                        |   16 -
 drivers/media/i2c/adv748x/adv748x-afe.c            |   17 -
 drivers/media/i2c/adv748x/adv748x-hdmi.c           |   10 -
 drivers/media/i2c/adv7604.c                        |    4 +-
 drivers/media/i2c/ds90ub913.c                      |   14 +-
 drivers/media/i2c/ds90ub953.c                      |   19 +-
 drivers/media/i2c/ds90ub960.c                      |    8 -
 drivers/media/i2c/dw9714.c                         |   62 +-
 drivers/media/i2c/hi556.c                          |   73 +-
 drivers/media/i2c/imx214.c                         |  263 +-
 drivers/media/i2c/imx290.c                         |    1 -
 drivers/media/i2c/imx415.c                         |    2 +-
 drivers/media/i2c/lt6911uxe.c                      |    2 +-
 drivers/media/i2c/max9286.c                        |    8 +-
 drivers/media/i2c/max96714.c                       |    7 -
 drivers/media/i2c/max96717.c                       |   11 +-
 drivers/media/i2c/mt9m114.c                        |  171 +-
 drivers/media/i2c/ov2659.c                         |    3 +-
 drivers/media/i2c/ov2740.c                         |   18 +-
 drivers/media/i2c/ov5670.c                         |    9 +-
 drivers/media/i2c/ov5693.c                         |    7 +-
 drivers/media/i2c/ov7251.c                         |    7 +-
 drivers/media/i2c/ov8865.c                         |    3 +-
 drivers/media/i2c/saa7115.c                        |   12 +-
 drivers/media/i2c/tc358743.c                       |  138 +-
 drivers/media/i2c/tda1997x.c                       |    4 +-
 drivers/media/i2c/vd55g1.c                         |   32 +-
 drivers/media/pci/cx18/cx18-av-vbi.c               |   12 +-
 drivers/media/pci/cx18/cx18-driver.h               |   12 -
 drivers/media/pci/cx18/cx18-fileops.c              |    2 +-
 drivers/media/pci/cx18/cx18-ioctl.c                |    2 +-
 drivers/media/pci/intel/ipu-bridge.c               |   13 +-
 drivers/media/pci/intel/ipu3/ipu3-cio2.c           |   82 +-
 drivers/media/pci/intel/ipu3/ipu3-cio2.h           |    2 -
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c      |   12 +-
 drivers/media/pci/intel/ipu6/ipu6-isys.h           |    2 +-
 drivers/media/pci/intel/ivsc/mei_ace.c             |    4 +-
 drivers/media/pci/intel/ivsc/mei_csi.c             |    4 +-
 drivers/media/pci/mgb4/mgb4_vout.c                 |    9 +-
 drivers/media/pci/saa7164/saa7164-buffer.c         |   20 -
 drivers/media/pci/saa7164/saa7164-cmd.c            |   28 -
 drivers/media/pci/saa7164/saa7164.h                |    2 -
 drivers/media/pci/solo6x10/solo6x10-gpio.c         |   22 +-
 drivers/media/platform/amphion/vdec.c              |  294 ++-
 drivers/media/platform/amphion/vpu.h               |    7 +-
 drivers/media/platform/amphion/vpu_color.c         |   73 -
 drivers/media/platform/amphion/vpu_dbg.c           |   15 +-
 drivers/media/platform/amphion/vpu_defs.h          |   12 +
 drivers/media/platform/amphion/vpu_helpers.c       |  123 +
 drivers/media/platform/amphion/vpu_helpers.h       |   12 +-
 drivers/media/platform/amphion/vpu_malone.c        |    5 +-
 drivers/media/platform/amphion/vpu_mbox.c          |    4 -
 drivers/media/platform/amphion/vpu_mbox.h          |    1 -
 drivers/media/platform/amphion/vpu_v4l2.c          |   11 +
 drivers/media/platform/cadence/cdns-csi2rx.c       |  131 +
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c     |   47 +-
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h     |    1 +
 drivers/media/platform/nxp/imx-mipi-csis.c         |   68 +-
 .../media/platform/nxp/imx8-isi/imx8-isi-core.c    |  135 +-
 .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |    6 +-
 .../platform/nxp/imx8-isi/imx8-isi-crossbar.c      |   18 +-
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c      |  169 +-
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     |    3 +-
 drivers/media/platform/qcom/camss/camss-csiphy.c   |    5 -
 drivers/media/platform/qcom/camss/camss-csiphy.h   |    1 -
 drivers/media/platform/qcom/camss/camss-video.c    |   39 +-
 drivers/media/platform/qcom/camss/camss.c          |  107 +-
 drivers/media/platform/qcom/iris/iris_buffer.c     |   35 +-
 drivers/media/platform/qcom/iris/iris_buffer.h     |    3 +-
 drivers/media/platform/qcom/iris/iris_ctrls.c      |   35 +-
 drivers/media/platform/qcom/iris/iris_hfi_common.h |    1 +
 .../platform/qcom/iris/iris_hfi_gen1_command.c     |   48 +-
 .../platform/qcom/iris/iris_hfi_gen1_defines.h     |    5 +-
 .../platform/qcom/iris/iris_hfi_gen1_response.c    |   37 +-
 .../platform/qcom/iris/iris_hfi_gen2_command.c     |  143 +-
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |    5 +
 .../platform/qcom/iris/iris_hfi_gen2_response.c    |   56 +-
 drivers/media/platform/qcom/iris/iris_hfi_queue.c  |    2 +-
 drivers/media/platform/qcom/iris/iris_instance.h   |    6 +
 .../platform/qcom/iris/iris_platform_common.h      |   28 +-
 .../media/platform/qcom/iris/iris_platform_gen2.c  |  198 +-
 .../platform/qcom/iris/iris_platform_qcs8300.h     |  126 +-
 .../platform/qcom/iris/iris_platform_sm8250.c      |   15 +-
 drivers/media/platform/qcom/iris/iris_probe.c      |    2 +-
 drivers/media/platform/qcom/iris/iris_state.c      |    2 +-
 drivers/media/platform/qcom/iris/iris_state.h      |    1 +
 drivers/media/platform/qcom/iris/iris_vb2.c        |   18 +-
 drivers/media/platform/qcom/iris/iris_vdec.c       |  116 +-
 drivers/media/platform/qcom/iris/iris_vdec.h       |   11 +
 drivers/media/platform/qcom/iris/iris_vidc.c       |   36 +-
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c |  397 ++-
 drivers/media/platform/qcom/iris/iris_vpu_buffer.h |   46 +-
 drivers/media/platform/qcom/venus/core.c           |   18 +-
 drivers/media/platform/qcom/venus/core.h           |    2 +
 drivers/media/platform/qcom/venus/hfi_msgs.c       |   83 +-
 drivers/media/platform/qcom/venus/hfi_venus.c      |    5 +
 drivers/media/platform/qcom/venus/pm_helpers.c     |   58 +-
 drivers/media/platform/qcom/venus/vdec.c           |    8 +-
 drivers/media/platform/qcom/venus/venc.c           |    8 +-
 drivers/media/platform/raspberrypi/pisp_be/Kconfig |    1 +
 .../media/platform/raspberrypi/pisp_be/pisp_be.c   |  207 +-
 drivers/media/platform/raspberrypi/rp1-cfe/cfe.c   |    4 +-
 drivers/media/platform/renesas/rcar-csi2.c         |  336 ++-
 drivers/media/platform/renesas/rcar-fcp.c          |   36 +
 .../media/platform/renesas/rcar-vin/rcar-core.c    |  694 ++---
 drivers/media/platform/renesas/rcar-vin/rcar-dma.c |   77 +-
 .../media/platform/renesas/rcar-vin/rcar-v4l2.c    |  492 +---
 drivers/media/platform/renesas/rcar-vin/rcar-vin.h |   16 +-
 .../media/platform/renesas/rzg2l-cru/rzg2l-core.c  |    6 +-
 .../media/platform/renesas/rzg2l-cru/rzg2l-cru.h   |   14 +-
 .../media/platform/renesas/rzg2l-cru/rzg2l-csi2.c  |   45 +-
 .../media/platform/renesas/rzg2l-cru/rzg2l-ip.c    |  108 +-
 .../media/platform/renesas/rzg2l-cru/rzg2l-video.c |   42 +-
 drivers/media/platform/renesas/vsp1/Makefile       |    1 +
 drivers/media/platform/renesas/vsp1/vsp1.h         |    1 +
 drivers/media/platform/renesas/vsp1/vsp1_dl.c      |   25 +
 drivers/media/platform/renesas/vsp1/vsp1_drm.c     |    1 +
 drivers/media/platform/renesas/vsp1/vsp1_drv.c     |   22 +-
 drivers/media/platform/renesas/vsp1/vsp1_pipe.c    |    3 +
 drivers/media/platform/renesas/vsp1/vsp1_regs.h    |    1 +
 drivers/media/platform/renesas/vsp1/vsp1_vspx.c    |  633 +++++
 drivers/media/platform/renesas/vsp1/vsp1_vspx.h    |   16 +
 drivers/media/platform/rockchip/Kconfig            |    1 +
 drivers/media/platform/rockchip/Makefile           |    1 +
 .../media/platform/rockchip/rkisp1/rkisp1-common.h |    2 +
 .../media/platform/rockchip/rkisp1/rkisp1-params.c |  150 +-
 .../media/platform/rockchip/rkisp1/rkisp1-regs.h   |   99 +-
 .../platform/rockchip}/rkvdec/Kconfig              |    0
 .../platform/rockchip}/rkvdec/Makefile             |    0
 .../platform/rockchip}/rkvdec/rkvdec-h264.c        |    0
 .../platform/rockchip}/rkvdec/rkvdec-regs.h        |    0
 .../platform/rockchip}/rkvdec/rkvdec-vp9.c         |    0
 .../platform/rockchip}/rkvdec/rkvdec.c             |   43 +-
 .../platform/rockchip}/rkvdec/rkvdec.h             |    1 +
 .../platform/samsung/exynos4-is/fimc-is-i2c.c      |    2 +-
 .../platform/samsung/exynos4-is/fimc-is-i2c.h      |    2 -
 .../media/platform/samsung/exynos4-is/fimc-is.c    |    2 +-
 .../media/platform/samsung/exynos4-is/media-dev.c  |   27 +-
 .../platform/st/sti/c8sectpfe/c8sectpfe-core.c     |   34 +-
 .../media/platform/ti/j721e-csi2rx/j721e-csi2rx.c  |    2 +
 drivers/media/platform/ti/vpe/vpdma.c              |   32 -
 drivers/media/platform/ti/vpe/vpdma.h              |    3 -
 drivers/media/platform/verisilicon/hantro.h        |    2 +
 .../media/platform/verisilicon/hantro_g1_regs.h    |    2 +-
 drivers/media/platform/verisilicon/hantro_h264.c   |    6 +-
 .../media/platform/verisilicon/hantro_postproc.c   |    6 +-
 .../media/platform/verisilicon/rockchip_vpu_hw.c   |    9 -
 drivers/media/platform/xilinx/xilinx-vipp.c        |    7 +-
 drivers/media/rc/ir-spi.c                          |   40 +-
 drivers/media/test-drivers/vivid/vivid-ctrls.c     |    3 +-
 drivers/media/test-drivers/vivid/vivid-vbi-gen.c   |    8 +-
 drivers/media/test-drivers/vivid/vivid-vid-cap.c   |    4 +-
 drivers/media/usb/gspca/vicam.c                    |   10 +-
 drivers/media/usb/hdpvr/hdpvr-i2c.c                |   30 +-
 drivers/media/usb/usbtv/usbtv-video.c              |    4 +
 drivers/media/usb/uvc/uvc_ctrl.c                   |  131 +-
 drivers/media/usb/uvc/uvc_driver.c                 |   74 +-
 drivers/media/usb/uvc/uvc_metadata.c               |  122 +-
 drivers/media/usb/uvc/uvc_queue.c                  |  199 +-
 drivers/media/usb/uvc/uvc_v4l2.c                   |  366 +--
 drivers/media/usb/uvc/uvc_video.c                  |   21 +-
 drivers/media/usb/uvc/uvcvideo.h                   |   46 +-
 drivers/media/v4l2-core/v4l2-common.c              |   40 +-
 drivers/media/v4l2-core/v4l2-ctrls-core.c          |   20 +-
 drivers/media/v4l2-core/v4l2-i2c.c                 |    3 +-
 drivers/media/v4l2-core/v4l2-ioctl.c               |   10 +-
 drivers/media/v4l2-core/v4l2-jpeg.c                |   80 -
 drivers/media/v4l2-core/v4l2-subdev.c              |   31 +-
 .../x86/intel/int3472/tps68470_board_data.c        |  128 +
 drivers/staging/media/Kconfig                      |    4 +-
 drivers/staging/media/Makefile                     |    2 +-
 drivers/staging/media/atomisp/Kconfig              |    1 +
 drivers/staging/media/atomisp/Makefile             |    1 -
 drivers/staging/media/atomisp/TODO                 |    2 -
 drivers/staging/media/atomisp/i2c/Kconfig          |    1 +
 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c |  611 +++--
 drivers/staging/media/atomisp/i2c/atomisp-gc2235.c |    2 -
 drivers/staging/media/atomisp/i2c/gc2235.h         |   16 +-
 drivers/staging/media/atomisp/i2c/ov2722.h         |   16 +-
 .../media/atomisp/pci/atomisp_compat_css20.c       |    2 +-
 drivers/staging/media/atomisp/pci/atomisp_csi2.h   |   17 -
 .../media/atomisp/pci/atomisp_csi2_bridge.c        |  233 +-
 drivers/staging/media/atomisp/pci/atomisp_drvfs.c  |  155 --
 drivers/staging/media/atomisp/pci/atomisp_drvfs.h  |   15 -
 drivers/staging/media/atomisp/pci/atomisp_fops.c   |    5 +-
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c  |  129 +-
 drivers/staging/media/atomisp/pci/atomisp_subdev.h |    3 -
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c   |    5 +-
 .../pci/hive_isp_css_include/math_support.h        |    5 -
 drivers/staging/media/atomisp/pci/hmm/hmm.c        |   91 -
 drivers/staging/media/atomisp/pci/hmm/hmm_bo.c     |    5 +-
 drivers/staging/media/atomisp/pci/ia_css_pipe.h    |    2 -
 .../pci/isp/kernels/anr/anr_1.0/ia_css_anr_types.h |    4 +-
 .../pci/isp/kernels/dpc2/ia_css_dpc2_param.h       |    6 +-
 .../pci/isp/kernels/dvs/dvs_1.0/ia_css_dvs.host.c  |    4 +-
 .../pci/isp/kernels/eed1_8/ia_css_eed1_8_param.h   |   22 +-
 .../pci/isp/kernels/fpn/fpn_1.0/ia_css_fpn.host.c  |    6 +-
 .../pci/isp/kernels/sc/sc_1.0/ia_css_sc_param.h    |    2 +-
 .../pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c     |    3 +-
 .../pci/isp/modes/interface/input_buf.isp.h        |    6 +-
 .../atomisp/pci/isp/modes/interface/isp_const.h    |  157 --
 .../atomisp/pci/runtime/debug/src/ia_css_debug.c   |    1 -
 .../media/atomisp/pci/runtime/frame/src/frame.c    |   29 +-
 .../media/atomisp/pci/runtime/ifmtr/src/ifmtr.c    |   11 +-
 .../atomisp/pci/runtime/isys/src/virtual_isys.c    |    2 +-
 .../runtime/pipeline/interface/ia_css_pipeline.h   |    1 -
 .../atomisp/pci/runtime/pipeline/src/pipeline.c    |    2 -
 drivers/staging/media/atomisp/pci/sh_css.c         |   27 -
 drivers/staging/media/atomisp/pci/sh_css_defs.h    |   12 +-
 .../staging/media/atomisp/pci/sh_css_internal.h    |    8 +-
 drivers/staging/media/atomisp/pci/sh_css_mipi.c    |   11 -
 drivers/staging/media/atomisp/pci/sh_css_mipi.h    |    2 -
 .../staging/media/atomisp/pci/sh_css_param_dvs.h   |   22 +-
 drivers/staging/media/atomisp/pci/sh_css_params.c  |   12 +-
 drivers/staging/media/imx/imx-media-csc-scaler.c   |    2 +-
 drivers/staging/media/ipu7/Kconfig                 |   19 +
 drivers/staging/media/ipu7/Makefile                |   23 +
 drivers/staging/media/ipu7/TODO                    |   28 +
 drivers/staging/media/ipu7/abi/ipu7_fw_boot_abi.h  |  163 ++
 .../staging/media/ipu7/abi/ipu7_fw_common_abi.h    |  175 ++
 .../staging/media/ipu7/abi/ipu7_fw_config_abi.h    |   19 +
 .../media/ipu7/abi/ipu7_fw_insys_config_abi.h      |   19 +
 drivers/staging/media/ipu7/abi/ipu7_fw_isys_abi.h  |  412 +++
 drivers/staging/media/ipu7/abi/ipu7_fw_msg_abi.h   |  465 ++++
 .../media/ipu7/abi/ipu7_fw_psys_config_abi.h       |   24 +
 .../staging/media/ipu7/abi/ipu7_fw_syscom_abi.h    |   49 +
 drivers/staging/media/ipu7/ipu7-boot.c             |  430 +++
 drivers/staging/media/ipu7/ipu7-boot.h             |   25 +
 drivers/staging/media/ipu7/ipu7-bus.c              |  158 ++
 drivers/staging/media/ipu7/ipu7-bus.h              |   69 +
 drivers/staging/media/ipu7/ipu7-buttress-regs.h    |  461 ++++
 drivers/staging/media/ipu7/ipu7-buttress.c         | 1192 +++++++++
 drivers/staging/media/ipu7/ipu7-buttress.h         |   77 +
 drivers/staging/media/ipu7/ipu7-cpd.c              |  276 ++
 drivers/staging/media/ipu7/ipu7-cpd.h              |   16 +
 drivers/staging/media/ipu7/ipu7-dma.c              |  477 ++++
 drivers/staging/media/ipu7/ipu7-dma.h              |   46 +
 drivers/staging/media/ipu7/ipu7-fw-isys.c          |  301 +++
 drivers/staging/media/ipu7/ipu7-fw-isys.h          |   39 +
 drivers/staging/media/ipu7/ipu7-isys-csi-phy.c     | 1034 ++++++++
 drivers/staging/media/ipu7/ipu7-isys-csi-phy.h     |   16 +
 drivers/staging/media/ipu7/ipu7-isys-csi2-regs.h   | 1197 +++++++++
 drivers/staging/media/ipu7/ipu7-isys-csi2.c        |  543 ++++
 drivers/staging/media/ipu7/ipu7-isys-csi2.h        |   64 +
 drivers/staging/media/ipu7/ipu7-isys-queue.c       |  829 ++++++
 drivers/staging/media/ipu7/ipu7-isys-queue.h       |   72 +
 drivers/staging/media/ipu7/ipu7-isys-subdev.c      |  348 +++
 drivers/staging/media/ipu7/ipu7-isys-subdev.h      |   53 +
 drivers/staging/media/ipu7/ipu7-isys-video.c       | 1112 ++++++++
 drivers/staging/media/ipu7/ipu7-isys-video.h       |  117 +
 drivers/staging/media/ipu7/ipu7-isys.c             | 1166 ++++++++
 drivers/staging/media/ipu7/ipu7-isys.h             |  140 +
 drivers/staging/media/ipu7/ipu7-mmu.c              |  853 ++++++
 drivers/staging/media/ipu7/ipu7-mmu.h              |  414 +++
 drivers/staging/media/ipu7/ipu7-platform-regs.h    |   82 +
 drivers/staging/media/ipu7/ipu7-syscom.c           |   78 +
 drivers/staging/media/ipu7/ipu7-syscom.h           |   35 +
 drivers/staging/media/ipu7/ipu7.c                  | 2783 ++++++++++++++++=
++++
 drivers/staging/media/ipu7/ipu7.h                  |  242 ++
 drivers/staging/media/rkvdec/TODO                  |   11 -
 drivers/staging/media/sunxi/cedrus/cedrus_hw.c     |   19 +-
 drivers/staging/media/sunxi/cedrus/cedrus_video.c  |   18 +
 include/linux/usb/uvc.h                            |    3 +
 include/media/rcar-fcp.h                           |    5 +
 include/media/v4l2-ctrls.h                         |    4 +-
 include/media/v4l2-dev.h                           |   14 +-
 include/media/v4l2-ioctl.h                         |    1 +
 include/media/v4l2-jpeg.h                          |    9 -
 include/media/v4l2-subdev.h                        |    3 -
 include/media/vsp1.h                               |   89 +
 .../uapi/linux/media/raspberrypi/pisp_be_config.h  |    9 +-
 include/uapi/linux/rkisp1-config.h                 |  106 +-
 include/uapi/linux/v4l2-controls.h                 |    6 +
 include/uapi/linux/videodev2.h                     |    9 +-
 314 files changed, 23168 insertions(+), 4636 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/fsl,imx6q-vdoa.=
yaml
 create mode 100644 Documentation/devicetree/bindings/media/fsl,imx8qm-isi.=
yaml
 create mode 100644 Documentation/devicetree/bindings/media/fsl,imx8qxp-isi=
.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/fsl-vdoa.txt
 create mode 100644 Documentation/userspace-api/media/v4l/metafmt-uvc-msxu-=
1-5.rst
 create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-rawnn-cru.=
rst
 create mode 100644 drivers/media/platform/renesas/vsp1/vsp1_vspx.c
 create mode 100644 drivers/media/platform/renesas/vsp1/vsp1_vspx.h
 rename drivers/{staging/media =3D> media/platform/rockchip}/rkvdec/Kconfig=
 (100%)
 rename drivers/{staging/media =3D> media/platform/rockchip}/rkvdec/Makefil=
e (100%)
 rename drivers/{staging/media =3D> media/platform/rockchip}/rkvdec/rkvdec-=
h264.c (100%)
 rename drivers/{staging/media =3D> media/platform/rockchip}/rkvdec/rkvdec-=
regs.h (100%)
 rename drivers/{staging/media =3D> media/platform/rockchip}/rkvdec/rkvdec-=
vp9.c (100%)
 rename drivers/{staging/media =3D> media/platform/rockchip}/rkvdec/rkvdec.=
c (96%)
 rename drivers/{staging/media =3D> media/platform/rockchip}/rkvdec/rkvdec.=
h (98%)
 delete mode 100644 drivers/staging/media/atomisp/pci/atomisp_drvfs.c
 delete mode 100644 drivers/staging/media/atomisp/pci/atomisp_drvfs.h
 delete mode 100644 drivers/staging/media/atomisp/pci/isp/modes/interface/i=
sp_const.h
 create mode 100644 drivers/staging/media/ipu7/Kconfig
 create mode 100644 drivers/staging/media/ipu7/Makefile
 create mode 100644 drivers/staging/media/ipu7/TODO
 create mode 100644 drivers/staging/media/ipu7/abi/ipu7_fw_boot_abi.h
 create mode 100644 drivers/staging/media/ipu7/abi/ipu7_fw_common_abi.h
 create mode 100644 drivers/staging/media/ipu7/abi/ipu7_fw_config_abi.h
 create mode 100644 drivers/staging/media/ipu7/abi/ipu7_fw_insys_config_abi=
.h
 create mode 100644 drivers/staging/media/ipu7/abi/ipu7_fw_isys_abi.h
 create mode 100644 drivers/staging/media/ipu7/abi/ipu7_fw_msg_abi.h
 create mode 100644 drivers/staging/media/ipu7/abi/ipu7_fw_psys_config_abi.h
 create mode 100644 drivers/staging/media/ipu7/abi/ipu7_fw_syscom_abi.h
 create mode 100644 drivers/staging/media/ipu7/ipu7-boot.c
 create mode 100644 drivers/staging/media/ipu7/ipu7-boot.h
 create mode 100644 drivers/staging/media/ipu7/ipu7-bus.c
 create mode 100644 drivers/staging/media/ipu7/ipu7-bus.h
 create mode 100644 drivers/staging/media/ipu7/ipu7-buttress-regs.h
 create mode 100644 drivers/staging/media/ipu7/ipu7-buttress.c
 create mode 100644 drivers/staging/media/ipu7/ipu7-buttress.h
 create mode 100644 drivers/staging/media/ipu7/ipu7-cpd.c
 create mode 100644 drivers/staging/media/ipu7/ipu7-cpd.h
 create mode 100644 drivers/staging/media/ipu7/ipu7-dma.c
 create mode 100644 drivers/staging/media/ipu7/ipu7-dma.h
 create mode 100644 drivers/staging/media/ipu7/ipu7-fw-isys.c
 create mode 100644 drivers/staging/media/ipu7/ipu7-fw-isys.h
 create mode 100644 drivers/staging/media/ipu7/ipu7-isys-csi-phy.c
 create mode 100644 drivers/staging/media/ipu7/ipu7-isys-csi-phy.h
 create mode 100644 drivers/staging/media/ipu7/ipu7-isys-csi2-regs.h
 create mode 100644 drivers/staging/media/ipu7/ipu7-isys-csi2.c
 create mode 100644 drivers/staging/media/ipu7/ipu7-isys-csi2.h
 create mode 100644 drivers/staging/media/ipu7/ipu7-isys-queue.c
 create mode 100644 drivers/staging/media/ipu7/ipu7-isys-queue.h
 create mode 100644 drivers/staging/media/ipu7/ipu7-isys-subdev.c
 create mode 100644 drivers/staging/media/ipu7/ipu7-isys-subdev.h
 create mode 100644 drivers/staging/media/ipu7/ipu7-isys-video.c
 create mode 100644 drivers/staging/media/ipu7/ipu7-isys-video.h
 create mode 100644 drivers/staging/media/ipu7/ipu7-isys.c
 create mode 100644 drivers/staging/media/ipu7/ipu7-isys.h
 create mode 100644 drivers/staging/media/ipu7/ipu7-mmu.c
 create mode 100644 drivers/staging/media/ipu7/ipu7-mmu.h
 create mode 100644 drivers/staging/media/ipu7/ipu7-platform-regs.h
 create mode 100644 drivers/staging/media/ipu7/ipu7-syscom.c
 create mode 100644 drivers/staging/media/ipu7/ipu7-syscom.h
 create mode 100644 drivers/staging/media/ipu7/ipu7.c
 create mode 100644 drivers/staging/media/ipu7/ipu7.h
 delete mode 100644 drivers/staging/media/rkvdec/TODO

