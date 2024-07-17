Return-Path: <linux-media+bounces-15071-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 10CE89339B7
	for <lists+linux-media@lfdr.de>; Wed, 17 Jul 2024 11:16:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 396471F22EDA
	for <lists+linux-media@lfdr.de>; Wed, 17 Jul 2024 09:16:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F07447F5D;
	Wed, 17 Jul 2024 09:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D4cKqzvt"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768B74653A;
	Wed, 17 Jul 2024 09:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721207773; cv=none; b=I8aX6WJ/DJ0mUIE1OQxMGqKmkc+VnNpnljJKKz5nniO4//JCZNu/S+nzAMUu9bSRjjFkJOXE3W9Vd+crL5rD18/rFOYnsjEjXCOdXeKznGomixsQCN9LU1JJeAfJTVckuPPD/U1XM/iuHYjlYfGKKmh6/2V64mCFf4ldHc8xhfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721207773; c=relaxed/simple;
	bh=OPrsv+dc5fo5rBzxVLBqHPLmn7+P8EYsjNaXpoFI3dY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=tRqJ8sdQB1BADOMDnfCwToCI00rKrSWi2gdkrzJ33UBds/OXAJ0FlWfjC+R4kLRQzlQcdAahWszPWEooo0U2ntsA3ZZFcq3HpUCm7zsGqkFJgSLladLN2u0lJkv0ds08BDeBec5LRq3gSVCXZ+Kdw6r/1jf7VeH8AQFhN03xmZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D4cKqzvt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84C95C4AF0F;
	Wed, 17 Jul 2024 09:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721207773;
	bh=OPrsv+dc5fo5rBzxVLBqHPLmn7+P8EYsjNaXpoFI3dY=;
	h=Date:From:To:Cc:Subject:From;
	b=D4cKqzvtBXb6gq4cjqwhXs9OcAUlApr17D71HlXx8kkKON0t9b59itgRMIzDQOI7/
	 4aB60Eq5JlaK6U/Z+Da070llrd9Q14rMIYT397DCJojxNw9TmFFL5B6VQGcaEtIt9w
	 NdfGkVUSgx3rHiClSzzWmlhNahH+1/cC0iIHBd+Z/M/ugRUhDyb8fI0nFQDuGBbRHu
	 eU2HfRJM28PUsVDedUYQF2JBa7HE2meCP8EFKho2l4glUl25aYErrEhrGVj0i2zGGo
	 o39Vde/Kk/ctL5LqCO4gyU0c6iS9LWEG85l9YGO0GDyvKHxjWLnb3ie9Uq8sSZ+LCf
	 LeRs5+aJZPt5g==
Date: Wed, 17 Jul 2024 11:16:07 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton
 <akpm@linux-foundation.org>, Linux Media Mailing List
 <linux-media@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>
Subject: [GIT PULL for v6.11-rc1] media updates (RESEND: previous email was
 missing diffstat)
Message-ID: <20240717111607.66aadf19@foz.lan>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-redhat-linux-gnu)
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

  git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/me=
dia/v6.11-1

For:

- New sensor drivers: gc05a2, gc08a3 and imx283;
- New serializer/deserializer drivers: max96714 and max96717;
- New JPEG encoder driver: e5010;
- Support for Raspberry Pi PiSP Backend (BE) ISP driver;
- Old documentation for av7110 driver removed, as a new version
  was added as Documentation/userspace-api/media/dvb/legacy*.rst;
- atompisp: Linux firmwares are now available at:
  https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.g=
it/tree/intel/ipu
  so, drop firmware-related task from TODO and update firmware
  logic;
- The imx258 driver has gained several improvements;
- wave5 driver has gained support for HEVC decoding;
- em28xx gained support for MyGica UTV3;
- av7110 budget-patch driver removed;
- Lots of other cleanups, improvements and fixes.

Regards,
Mauro

---

The following changes since commit 83a7eefedc9b56fe7bfeff13b6c7356688ffa670:

  Linux 6.10-rc3 (2024-06-09 14:19:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/me=
dia/v6.11-1

for you to fetch changes up to 68a72104cbcf38ad16500216e213fa4eb21c4be2:

  media: raspberrypi: Switch to remove_new (2024-07-12 10:11:43 +0200)

----------------------------------------------------------------
media updates for v6.11-rc1

----------------------------------------------------------------
Abdulrasaq Lawani (1):
      media: i2c: ov5647: replacing of_node_put with __free(device_node)

Alain Volmat (4):
      media: stm32: dcmipp: correct error handling in dcmipp_create_subdevs
      media: i2c: gc2145: addition of RAW8 formats support
      media: i2c: gc2145: use CCI_REG16_LE for little-endian registers
      media: stm32: dcmipp: correct error handling in dcmipp_create_subdevs

Aleksandr Burakov (1):
      saa7134: Unchecked i2c_transfer function result fixed

Allen Pais (1):
      media: Convert from tasklet to BH workqueue

Andy Shevchenko (3):
      media: atomisp: Clean up unused macros from math_support.h
      media: atomisp: Replace COMPILATION_ERROR_IF() by static_assert()
      media: atomisp: Remove unused GPIO related defines and APIs

AngeloGioacchino Del Regno (2):
      dt-bindings: media: mediatek: mdp3: Add support for MT8188 RDMA
      media: platform: mtk-mdp3: Add support for MT8188 MDP3 components

Atanas Filipov (1):
      media: qcom: camss: Decompose register and link operations

Benjamin Mugnier (1):
      media: i2c: vgxy61: Fix device name

Bingbu Cao (1):
      media: ipu-bridge: add mod_devicetable.h header inclusion

Bryan O'Donoghue (1):
      media: i2c: Fix imx412 exposure control

Chen Ni (1):
      media: qcom: camss: Add check for v4l2_fwnode_endpoint_parse

Chi Zhiling (1):
      media: xc2028: avoid use-after-free in load_firmware_cb()

ChiYuan Huang (1):
      media: v4l: async: Fix NULL pointer dereference in adding ancillary l=
inks

Christophe JAILLET (1):
      media: cx231xx: Constify struct vb2_ops

Colin Ian King (1):
      media: atomisp: Fix spelling mistake "pipline" -> "pipeline"

Conor Dooley (1):
      media: i2c: imx219: fix msr access command sequence

Daniel Schaefer (1):
      media: uvcvideo: Override default flags

Dave Stevenson (20):
      media: i2c: imx258: Remove unused defines
      media: i2c: imx258: Make image geometry meet sensor requirements
      media: i2c: imx258: Disable digital cropping on binned modes
      media: i2c: imx258: Remove redundant I2C writes.
      media: i2c: imx258: Add regulator control
      media: i2c: imx258: Make V4L2_CID_VBLANK configurable.
      media: i2c: imx258: Split out common registers from the mode based on=
es
      media: i2c: imx258: Add support for 24MHz clock
      media: i2c: imx258: Add support for running on 2 CSI data lanes
      media: i2c: imx258: Follow normal V4L2 behaviours for clipping exposu=
re
      media: i2c: imx258: Add get_selection for pixel array information
      media: i2c: imx258: Allow configuration of clock lane behaviour
      media: i2c: imx258: Correct max FRM_LENGTH_LINES value
      media: i2c: imx258: Issue reset before starting streaming
      media: i2c: imx258: Set pixel_rate range to the same as the value
      media: i2c: imx258: Support faster pixel rate on binned modes
      dt-bindings: media: imx258: Rename to include vendor prefix
      dt-bindings: media: imx258: Add alternate compatible strings
      media: i2c: imx258: Change register settings for variants of the sens=
or
      media: i2c: imx258: Make HFLIP and VFLIP controls writable

Devarsh Thakkar (6):
      media: dt-bindings: Add Imagination E5010 JPEG Encoder
      media: imagination: Add E5010 JPEG Encoder driver
      media: v4l2-jpeg: Export reference quantization and huffman tables
      media: Documentation: Document v4l2-jpeg helper functions
      media: imagination: Use exported tables from v4l2-jpeg core
      media: verisilicon : Use exported tables from v4l2-jpeg for hantro co=
dec

Dikshita Agarwal (3):
      media: venus: flush all buffers in output plane streamoff
      media: venus: avoid multiple core dumps
      media: venus: fix use after free in vdec_close

Dorcas Anono Litunya (3):
      media: Documentation: vivid.rst: Remove documentation for Capture Ove=
rlay
      media: vivid: Add 'Is Connected To' menu controls
      documentation: media: vivid: Update documentation on vivid loopback s=
upport

Douglas Anderson (1):
      media: mediatek: vcodec: Alloc DMA memory with DMA_ATTR_ALLOC_SINGLE_=
PAGES

Dr. David Alan Gilbert (13):
      media: dvb-frontends: drx39xyj: remove unused struct 'drxjeq_stat'
      media: dvb-frontends: stv0910: remove unused struct 'sinit_table'
      media: dvb-frontends: dib7000p: remove unused struct 'i2c_device'
      media: gs1662: remove unused struct 'gs_reg_fmt_custom'
      media: opera1: remove unused struct 'rc_map_opera_table'
      media: pvrusb2: remove unused struct 'debugifc_mask_item'
      media: amphion: remove unused struct 'vpu_malone_frame_buffer'
      media: m2m-deinterlace: remove unused struct 'vb2_dc_conf'
      media: tegra-vde: remove unused struct 'tegra_vde_h264_frame'
      media: i2c: dw9768: remove unused struct 'regval_list'
      media: i2c: ks0127: remove unused struct 'adjust'
      media: i2c: tw9910: remove unused strust 'regval_list'
      media: i2c: adv7511: remove unused struct 'i2c_reg_value'

Fritz Koenig (1):
      Documentation: media: Fix v4l2_ctrl_vp8_frame struct

Hans Verkuil (16):
      Merge tag 'v6.10-rc3'
      media: imx283: drop CENTERED_RECTANGLE due to clang failure
      Merge tag 'tags/media-next-uvc-20240617-2' of git://git.kernel.org/pu=
b/scm/linux/kernel/git/pinchartl/linux.git into media_stage
      media: b2c2: flexcop-usb: fix flexcop_usb_memory_req
      Merge tag 'tags/next-media-renesas-20240619' of git://git.kernel.org/=
pub/scm/linux/kernel/git/pinchartl/linux.git
      Merge tag 'tags/next-media-20240626' of git://git.kernel.org/pub/scm/=
linux/kernel/git/pinchartl/linux.git
      media: vivid: fix wrong sizeimage value for mplane
      media: vivid: fix CREATE_BUFS support in queue_setup()
      Revert "media: stm32: dcmipp: correct error handling in dcmipp_create=
_subdevs"
      media: Documentation: vivid.rst: fix confusing section refs
      media: Documentation: vivid.rst: drop "Video, VBI and RDS Looping"
      media: Documentation: vivid.rst: add supports_requests
      media: vivid: vidioc_g_edid: do not change the original input EDID
      media: vivid: don't set HDMI TX controls if there are no HDMI outputs
      media: vivid: add instance number to input/output names
      media: vivid: loopback based on 'Connected To' controls

Hans de Goede (9):
      media: ov5693: Drop privacy-LED GPIO control
      media: ipu-bridge: Sort ipu_supported_sensors[] array by ACPI HID
      media: ipu-bridge: Add HIDs from out of tree IPU6 driver ipu-bridge c=
opy
      media: ov2680: Pass correct number of controls to v4l2_ctrl_handler_i=
nit()
      media: atomisp: Remove unused mipicsi_flag module parameter
      media: atomisp: Remove firmware_name module parameter
      media: atomisp: Prefix firmware paths with "intel/ipu/"
      media: atomisp: Update TODO
      media: atomisp: csi2-bridge: Add DMI quirk for OV5693 on Xiaomi Mipad2

Harshit Mogalapalli (1):
      media: imx-pxp: Fix ERR_PTR dereference in pxp_probe()

Irui Wang (1):
      media: mediatek: vcodec: Handle invalid decoder vsi

Ivan Bornyakov (5):
      media: chips-media: wave5: support decoding HEVC Main10 profile
      media: chips-media: wave5: support reset lines
      media: chips-media: wave5: separate irq setup routine
      media: chips-media: wave5: drop "sram-size" DT property
      media: chips-media: wave5: support Wave515 decoder

Jacopo Mondi (23):
      media: rcar-vin: Fix YUYV8_1X16 handling for CSI-2
      media: rcar-csi2: Disable runtime_pm in probe error
      media: rcar-csi2: Cleanup subdevice in remove()
      media: rcar-csi2: Use the subdev active state
      media: adv748x-csi2: Implement enum_mbus_codes
      media: adv748x-afe: Use 1X16 media bus code
      media: adv748x-csi2: Validate the image format
      media: adv748x-csi2: Use the subdev active state
      media: max9286: Fix enum_mbus_code
      media: max9286: Use the subdev active state
      media: max9286: Use frame interval from subdev state
      media: uapi: pixfmt-luma: Document MIPI CSI-2 packing
      media: uapi: Add a pixel format for BGR48 and RGB48
      media: uapi: Add Raspberry Pi PiSP Back End uAPI
      media: uapi: Add meta pixel format for PiSP BE config
      media: uapi: Add PiSP Compressed RAW Bayer formats
      media: dt-bindings: Add bindings for Raspberry Pi PiSP Back End
      media: admin-guide: Document the Raspberry Pi PiSP BE
      media: uapi: pisp_be_config: Drop BIT() from uAPI
      media: uapi: pisp_common: Add 32 bpp format test
      media: uapi: pisp_common: Capitalize all macros
      media: uapi: pisp_be_config: Re-sort pisp_be_tiles_config
      media: uapi: pisp_be_config: Add extra config fields

Jeff Johnson (16):
      media: marvell: add missing MODULE_DESCRIPTION() macros
      media: saa7134: add missing MODULE_DESCRIPTION() macros
      media: go7007: add missing MODULE_DESCRIPTION() macros
      media: pci: add missing MODULE_DESCRIPTION() macros
      media: si470x: add missing MODULE_DESCRIPTION() macro
      media: tda9887: add missing MODULE_DESCRIPTION() macro
      media: v4l: add missing MODULE_DESCRIPTION() macros
      media: rc: add missing MODULE_DESCRIPTION() macro
      media: exynos4-is: add missing MODULE_DESCRIPTION() macros
      media: ti: add missing MODULE_DESCRIPTION() macros
      media: atomisp: add missing MODULE_DESCRIPTION() macros
      media: dvb-frontends: add missing MODULE_DESCRIPTION() macros
      media: uda1342: add missing MODULE_DESCRIPTION() macro
      usb: uvc: add missing MODULE_DESCRIPTION() macro
      media: dvb-usb: add missing MODULE_DESCRIPTION() macros
      media: videobuf2: add missing MODULE_DESCRIPTION() macro

Jianfeng Liu (1):
      dt-bindings: media: rockchip-rga: add rockchip,rk3588-rga

Julien Massot (5):
      dt-bindings: media: add Maxim MAX96717 GMSL2 Serializer
      dt-bindings: media: add Maxim MAX96714 GMSL2 Deserializer
      media: i2c: add MAX96717 driver
      media: i2c: add MAX96714 driver
      drivers: media: max96717: stop the csi receiver before the source

Kieran Bingham (1):
      media: i2c: Add imx283 camera sensor driver

Kory Maincent (1):
      media: i2c: Kconfig: Fix missing firmware upload config select

Laurent Pinchart (36):
      media: v4l2-subdev: Fix v4l2_subdev_state_get_format() documentation
      media: v4l2-subdev: Provide const-aware subdev state accessors
      media: rkisp1: Mark subdev state pointers as const
      media: uvcvideo: Force UVC version to 1.0a for 0408:4035
      media: renesas: vsp1: Fix _irqsave and _irq mix
      media: videobuf2: core: Drop unneeded forward declaration
      media: v4l2-subdev: Drop unreacheable warning
      media: renesas: vsp1: Print debug message to diagnose validation fail=
ure
      media: renesas: vsp1: Drop vsp1_entity_get_pad_format() wrapper
      media: renesas: vsp1: Drop vsp1_entity_get_pad_selection() wrapper
      media: renesas: vsp1: Drop vsp1_rwpf_get_crop() wrapper
      media: renesas: vsp1: Drop brx_get_compose() wrapper
      media: renesas: vsp1: Drop custom .get_fmt() handler for histogram
      media: renesas: vsp1: Move partition calculation to vsp1_pipe.c
      media: renesas: vsp1: Simplify partition calculation
      media: renesas: vsp1: Store RPF partition configuration per RPF insta=
nce
      media: renesas: vsp1: Pass partition pointer to .configure_partition()
      media: renesas: vsp1: Replace vsp1_partition_window with v4l2_rect
      media: renesas: vsp1: Add and use function to dump a pipeline to the =
log
      media: renesas: vsp1: Keep the DRM pipeline entities sorted
      media: renesas: vsp1: Compute partitions for DRM pipelines
      media: renesas: vsp1: Get configuration from partition instead of sta=
te
      media: renesas: vsp1: Name parameters to entity operations
      media: renesas: vsp1: Pass subdev state to entity operations
      media: renesas: vsp1: Initialize control handler after subdev
      media: v4l: subdev: Fix typo in documentation
      media: vimc: Don't iterate over single pad
      media: vimc: Constify vimc_ent_type structures
      media: vimc: Constify the ent_config array
      media: vimc: scaler: Rename vic_sca_pad enum to vimc_scaler_pad
      media: vimc: Centralize subdev internal_ops initialization
      media: vimc: Initialize subdev active state
      media: vimc: sensor: Use subdev active state
      media: vimc: debayer: Use subdev active state
      media: vimc: scaler: Use subdev active state
      media: imx-mipi-csis: Use v4l2_subdev_enable_streams()

Luis Garcia (2):
      media: i2c: imx258: Use v4l2_link_freq_to_bitmap helper
      media: i2c: imx258: Convert to new CCI register access helpers

Marc Gonzalez (1):
      dt-bindings: media: add qcom,msm8998-venus

Michael Tretter (1):
      media: rockchip: rga: fix sequence number handling

Michal Pecio (1):
      media: uvcvideo: Fix the bandwdith quirk on USB 3.x

Mikhail Kobuk (1):
      media: pci: ivtv: Add check for DMA map result

Milen Mitkov (2):
      media: qcom: camss: Split testgen, RDI and RX for CSID 170
      media: qcom: camss: Decouple VFE from CSID

Ming Qian (5):
      media: v4l2-ctrls: Add average QP control
      media: amphion: Remove lock in s_ctrl callback
      media: amphion: Report the average QP of current encoded frame
      media: imx-jpeg: Remove some redundant error logs
      media: imx-jpeg: Drop initial source change event if capture has been=
 setup

Naushir Patuck (1):
      media: raspberrypi: Add support for PiSP BE

Niklas S=C3=B6derlund (1):
      media: staging: max96712: Store format in subdev active state

Nils Rothaug (5):
      media: tuner-simple: Add support for Tena TNF931D-DFDR1
      media: rc: add keymap for MyGica UTV3 remote
      media: dt-bindings: rc: add rc-mygica-utv3
      media: em28xx: Add support for MyGica UTV3
      media: em28xx: Set GPIOs for non-audio boards when switching input

Oleksandr Natalenko (1):
      media: uvcvideo: Add quirk for invalid dev_sof in Logitech C920

Pierre-Hugues Husson (1):
      media: venus: add msm8998 support

Radoslav Tsvetkov (5):
      media: qcom: camss: Add per sub-device type resources
      media: qcom: camss: Attach formats to VFE resources
      media: qcom: camss: Attach formats to CSID resources
      media: qcom: camss: Attach formats to CSIPHY resources
      media: qcom: camss: Move format related functions

Rafa=C5=82 Mi=C5=82ecki (1):
      dt-bindings: media: convert Mediatek consumer IR to the json-schema

Ricardo Ribalda (30):
      media: ivtv: Factor out schedule functions
      media: dvb-frontends/stv090x: Refactor tuner_i2c_lock
      media: go7007: Refactor Adlink PCI-MPG24 i2c mutex
      media: allegro: nal-hevc: Replace array[1] with array[N]
      media: xilinx: Refactor struct xvip_dma
      media: pci: cx18: Use flex arrays for struct cx18_scb
      media: siano: Refactor struct sms_msg_data
      media: siano: Remove unused structures
      media: siano: Use flex arrays for sms_firmware
      media: pci/ivtv: Replace ioremap with devm_ variants
      media: pci/ivtv: Replace request_mem_region with devm_ variant
      media: pci/ivtv: Use managed version of pci_enable_device
      media: imon: Fix race getting ictx->lock
      media: i2c: hi846: Fix V4L2_SUBDEV_FORMAT_TRY get_selection()
      media: c8sectpfe: Add missing parameter names
      media: dvb-frontend/mxl5xx: Refactor struct MBIN_FILE_T and MBIN_SEGM=
ENT_T
      media: uvcvideo: Support timestamp lists of any size
      media: uvcvideo: Ignore empty TS packets
      media: uvcvideo: Quirk for invalid dev_sof in Logitech C922
      media: uvcvideo: Allow hw clock updates with buffers not full
      media: uvcvideo: Refactor clock circular buffer
      media: uvcvideo: Fix hw timestamp handling for slow FPS
      media: uvcvideo: Fix integer overflow calculating timestamp
      media: uvcvideo: Enforce alignment of frame and interval
      media: uvcvideo: Allow custom control mapping
      media: uvcvideo: Refactor Power Line Frequency limit selection
      media: uvcvideo: Probe the PLF characteristics
      media: uvcvideo: Cleanup version-specific mapping
      media: uvcvideo: Remove PLF device quirking
      media: uvcvideo: Remove mappings form uvc_device_info

Roshan Khatri (5):
      media: atomisp: Fix spelling mistake in sh_css_internal.h
      media: atomisp: Fix spelling mistake in ia_css_eed1_8.host.c
      media: atomisp: Fix spelling mistake in hmm_bo.c
      media: atomisp: Fix spelling mistake in ia_css_debug.c
      media: atomisp: Fix spelling mistakes in sh_css_sp.c

Sakari Ailus (4):
      media: async: Warn on attept to create an ancillary link to a non-sub=
dev
      media: ipu6: Rework CSI-2 sub-device streaming control
      media: ipu6: Print CSR messages using debug level
      media: v4l2-cci: Always assign *val

Samuel Wein (1):
      media: Documentation: ipu6: Fix examples in ipu6-isys admin-guide

Sean Young (1):
      media: mceusb: No need for vendor/product ID in name

Stefan Herdler (21):
      media: av7110: remove old documentation files
      media: av7110: remove budget-patch driver
      media: sp8870: coding style fixes: whitespace
      media: sp8870: coding style fixes: newline, comments and braces
      media: sp8870: coding style fixes: miscellaneous
      media: sp8870: coding style fixes: logging
      media: av7110: coding style fixes: pointer_location
      media: av7110: coding style fixes: blank lines
      media: av7110: coding style fixes: whitespace
      media: av7110: coding style fixes: newline
      media: av7110: coding style fixes: whitespace (strict)
      media: av7110: coding style fixes: comments
      media: av7110: coding style fixes: braces
      media: av7110: coding style fixes: assignments
      media: av7110: coding style fixes: comparsations
      media: av7110: coding style fixes: sizeof
      media: av7110: coding style fixes: variable types
      media: av7110: coding style fixes: miscellaneous
      media: av7110: coding style fixes: deep_indentation
      media: av7110: coding style fixes: logging
      media: av7110: coding style fixes: avoid_externs

Stephen Rothwell (1):
      media: raspberrypi: Switch to remove_new

Tomi Valkeinen (11):
      media: subdev: Add privacy led helpers
      media: subdev: Use v4l2_subdev_has_op() in v4l2_subdev_enable/disable=
_streams()
      media: subdev: Add checks for subdev features
      media: subdev: Fix use of sd->enabled_streams in call_s_stream()
      media: subdev: Improve v4l2_subdev_enable/disable_streams_fallback
      media: subdev: Add v4l2_subdev_is_streaming()
      media: subdev: Support privacy led in v4l2_subdev_enable/disable_stre=
ams()
      media: subdev: Refactor v4l2_subdev_enable/disable_streams()
      media: subdev: Support single-stream case in v4l2_subdev_enable/disab=
le_streams()
      media: subdev: Support non-routing subdevs in v4l2_subdev_s_stream_he=
lper()
      media: subdev: Improve s_stream documentation

Tommaso Merciai (5):
      media: i2c: alvium: fix alvium_get_fw_version()
      media: i2c: alvium: rename acquisition frame rate enable reg
      media: i2c: alvium: enable acquisition frame rate
      media: i2c: alvium: implement enum_frame_size
      media: i2c: alvium: Move V4L2_CID_GAIN to V4L2_CID_ANALOG_GAIN

Tony Luck (1):
      media: atomisp: Switch to new Intel CPU model defines

Umang Jain (1):
      media: dt-bindings: media: Add bindings for IMX283

Wentong Wu (3):
      media: ivsc: csi: add separate lock for v4l2 control handler
      media: ivsc: csi: don't count privacy on as error
      media: ivsc: csi: remove privacy status in struct mei_csi

Wolfram Sang (1):
      MAINTAINERS: delete email for Anton Sviridenko

Yunfei Dong (2):
      media: mediatek: vcodec: add decoder command to support stateless dec=
oder
      media: mediatek: vcodec: Fix unreasonable data conversion

Zheng Yejian (1):
      media: dvb-usb: Fix unexpected infinite loop in dvb_usb_read_remote_c=
ontrol()

Zhi Mao (4):
      media: dt-bindings: i2c: add GalaxyCore GC08A3 image sensor
      media: i2c: Add GC08A3 image sensor driver
      media: dt-bindings: i2c: add GalaxyCore GC05A2 image sensor
      media: i2c: Add GC05A2 image sensor driver

 .../admin-guide/media/em28xx-cardlist.rst          |    8 +
 Documentation/admin-guide/media/ipu6-isys.rst      |   14 +-
 .../admin-guide/media/raspberrypi-pisp-be.dot      |   20 +
 .../admin-guide/media/raspberrypi-pisp-be.rst      |  109 ++
 Documentation/admin-guide/media/tuner-cardlist.rst |    2 +
 Documentation/admin-guide/media/v4l-drivers.rst    |    1 +
 Documentation/admin-guide/media/vivid.rst          |  185 +-
 .../bindings/media/i2c/galaxycore,gc05a2.yaml      |  112 ++
 .../bindings/media/i2c/galaxycore,gc08a3.yaml      |  112 ++
 .../bindings/media/i2c/maxim,max96714.yaml         |  174 ++
 .../bindings/media/i2c/maxim,max96717.yaml         |  157 ++
 .../media/i2c/{imx258.yaml =3D> sony,imx258.yaml}    |   11 +-
 .../devicetree/bindings/media/i2c/sony,imx283.yaml |  107 ++
 .../bindings/media/img,e5010-jpeg-enc.yaml         |   75 +
 .../bindings/media/mediatek,mdp3-rdma.yaml         |    1 +
 .../bindings/media/mediatek,mt7622-cir.yaml        |   55 +
 .../devicetree/bindings/media/mtk-cir.txt          |   28 -
 .../bindings/media/qcom,msm8996-venus.yaml         |    4 +-
 .../bindings/media/raspberrypi,pispbe.yaml         |   63 +
 Documentation/devicetree/bindings/media/rc.yaml    |    1 +
 .../devicetree/bindings/media/rockchip-rga.yaml    |    1 +
 Documentation/driver-api/media/v4l2-core.rst       |    1 +
 Documentation/driver-api/media/v4l2-jpeg.rst       |   10 +
 .../userspace-api/media/drivers/index.rst          |    2 +-
 .../media/drivers/{st-vgxy61.rst =3D> vgxy61.rst}    |    0
 .../media/v4l/ext-ctrls-codec-stateless.rst        |    4 +-
 .../userspace-api/media/v4l/ext-ctrls-codec.rst    |   14 +
 .../userspace-api/media/v4l/meta-formats.rst       |    1 +
 .../userspace-api/media/v4l/metafmt-pisp-be.rst    |   56 +
 .../userspace-api/media/v4l/pixfmt-bayer.rst       |    1 +
 .../userspace-api/media/v4l/pixfmt-rgb.rst         |   54 +
 .../media/v4l/pixfmt-srggb8-pisp-comp.rst          |   74 +
 .../userspace-api/media/v4l/pixfmt-yuv-luma.rst    |    4 +
 MAINTAINERS                                        |   63 +-
 drivers/media/common/siano/smscoreapi.c            |   10 +-
 drivers/media/common/siano/smscoreapi.h            |   18 +-
 drivers/media/common/siano/smsdvb-main.c           |    4 +-
 drivers/media/common/siano/smsendian.c             |    8 +-
 drivers/media/common/uvc.c                         |    1 +
 drivers/media/common/videobuf2/videobuf2-core.c    |    1 -
 drivers/media/common/videobuf2/videobuf2-dvb.c     |    1 +
 drivers/media/dvb-frontends/au8522_decoder.c       |    1 +
 drivers/media/dvb-frontends/dib7000p.c             |    5 -
 drivers/media/dvb-frontends/drx39xyj/drxj.c        |    7 -
 drivers/media/dvb-frontends/mb86a16.c              |    1 +
 drivers/media/dvb-frontends/mxl5xx_defs.h          |    4 +-
 drivers/media/dvb-frontends/stv090x.c              |   37 +-
 drivers/media/dvb-frontends/stv0910.c              |    5 -
 drivers/media/i2c/Kconfig                          |   68 +-
 drivers/media/i2c/Makefile                         |    7 +-
 drivers/media/i2c/adv748x/adv748x-afe.c            |    4 +-
 drivers/media/i2c/adv748x/adv748x-csi2.c           |  145 +-
 drivers/media/i2c/adv748x/adv748x.h                |    1 -
 drivers/media/i2c/adv7511-v4l2.c                   |    5 -
 drivers/media/i2c/alvium-csi2.c                    |   65 +-
 drivers/media/i2c/alvium-csi2.h                    |   16 +-
 drivers/media/i2c/dw9768.c                         |    5 -
 drivers/media/i2c/gc05a2.c                         | 1359 +++++++++++++++
 drivers/media/i2c/gc08a3.c                         | 1339 +++++++++++++++
 drivers/media/i2c/gc2145.c                         |   90 +-
 drivers/media/i2c/hi846.c                          |    2 +-
 drivers/media/i2c/imx219.c                         |    2 +-
 drivers/media/i2c/imx258.c                         | 1424 +++++++++-------
 drivers/media/i2c/imx283.c                         | 1612 ++++++++++++++++=
++
 drivers/media/i2c/imx412.c                         |    9 +-
 drivers/media/i2c/ks0127.c                         |    8 -
 drivers/media/i2c/max9286.c                        |  181 +-
 drivers/media/i2c/max96714.c                       | 1024 +++++++++++
 drivers/media/i2c/max96717.c                       |  927 ++++++++++
 drivers/media/i2c/ov2680.c                         |    2 +-
 drivers/media/i2c/ov5647.c                         |   11 +-
 drivers/media/i2c/ov5693.c                         |   10 -
 drivers/media/i2c/tw9910.c                         |    5 -
 drivers/media/i2c/uda1342.c                        |    1 +
 drivers/media/i2c/{st-vgxy61.c =3D> vgxy61.c}        |    2 +-
 drivers/media/pci/bt8xx/bt878.c                    |    9 +-
 drivers/media/pci/bt8xx/bt878.h                    |    3 +-
 drivers/media/pci/bt8xx/dvb-bt8xx.c                |    8 +-
 drivers/media/pci/cx18/cx18-scb.h                  |    2 +-
 drivers/media/pci/ddbridge/ddbridge.h              |    2 +-
 drivers/media/pci/intel/ipu-bridge.c               |   40 +-
 drivers/media/pci/intel/ipu6/ipu6-buttress.c       |    4 +-
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c      |   98 +-
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h      |    2 -
 drivers/media/pci/intel/ipu6/ipu6-isys-queue.c     |    3 -
 drivers/media/pci/intel/ipu6/ipu6-isys-video.c     |   43 +-
 drivers/media/pci/intel/ivsc/mei_csi.c             |   24 +-
 drivers/media/pci/ivtv/ivtv-driver.c               |   93 +-
 drivers/media/pci/ivtv/ivtv-fileops.c              |   66 +-
 drivers/media/pci/ivtv/ivtv-udma.c                 |    8 +
 drivers/media/pci/ivtv/ivtv-yuv.c                  |    6 +
 drivers/media/pci/ivtv/ivtvfb.c                    |    7 +-
 drivers/media/pci/mantis/hopper_cards.c            |    2 +-
 drivers/media/pci/mantis/mantis_cards.c            |    2 +-
 drivers/media/pci/mantis/mantis_common.h           |    2 +-
 drivers/media/pci/mantis/mantis_dma.c              |    4 +-
 drivers/media/pci/mantis/mantis_dma.h              |    2 +-
 drivers/media/pci/mantis/mantis_dvb.c              |   12 +-
 drivers/media/pci/ngene/ngene-core.c               |   22 +-
 drivers/media/pci/ngene/ngene.h                    |    5 +-
 drivers/media/pci/saa7134/saa7134-alsa.c           |    1 +
 drivers/media/pci/saa7134/saa7134-dvb.c            |    9 +-
 drivers/media/pci/saa7134/saa7134-empress.c        |    1 +
 drivers/media/pci/saa7134/saa7134-go7007.c         |    1 +
 drivers/media/pci/smipcie/smipcie-main.c           |   18 +-
 drivers/media/pci/smipcie/smipcie.h                |    3 +-
 drivers/media/pci/ttpci/budget-av.c                |    3 +-
 drivers/media/pci/ttpci/budget-ci.c                |   27 +-
 drivers/media/pci/ttpci/budget-core.c              |   11 +-
 drivers/media/pci/ttpci/budget.h                   |    5 +-
 drivers/media/pci/tw5864/tw5864-core.c             |    2 +-
 drivers/media/pci/tw5864/tw5864-video.c            |   13 +-
 drivers/media/pci/tw5864/tw5864.h                  |    7 +-
 drivers/media/platform/Kconfig                     |    2 +
 drivers/media/platform/Makefile                    |    2 +
 drivers/media/platform/allegro-dvt/nal-hevc.h      |    7 +-
 drivers/media/platform/amphion/vdec.c              |    2 -
 drivers/media/platform/amphion/venc.c              |    6 +-
 drivers/media/platform/amphion/vpu.h               |    1 +
 drivers/media/platform/amphion/vpu_defs.h          |    1 +
 drivers/media/platform/amphion/vpu_malone.c        |    5 -
 drivers/media/platform/amphion/vpu_v4l2.c          |   16 +
 drivers/media/platform/amphion/vpu_v4l2.h          |    1 +
 drivers/media/platform/amphion/vpu_windsor.c       |    2 +
 .../platform/chips-media/wave5/wave5-helper.c      |    8 +-
 .../media/platform/chips-media/wave5/wave5-hw.c    |  395 +++--
 .../platform/chips-media/wave5/wave5-regdefine.h   |    5 +
 .../media/platform/chips-media/wave5/wave5-vdi.c   |   27 +-
 .../platform/chips-media/wave5/wave5-vpu-dec.c     |   51 +-
 .../platform/chips-media/wave5/wave5-vpu-enc.c     |    2 +-
 .../media/platform/chips-media/wave5/wave5-vpu.c   |   35 +-
 .../platform/chips-media/wave5/wave5-vpuapi.h      |    3 +
 .../platform/chips-media/wave5/wave5-vpuconfig.h   |   16 +-
 drivers/media/platform/chips-media/wave5/wave5.h   |    6 +
 drivers/media/platform/imagination/Kconfig         |   13 +
 drivers/media/platform/imagination/Makefile        |    3 +
 .../media/platform/imagination/e5010-core-regs.h   |  585 +++++++
 .../media/platform/imagination/e5010-jpeg-enc-hw.c |  267 +++
 .../media/platform/imagination/e5010-jpeg-enc-hw.h |   42 +
 .../media/platform/imagination/e5010-jpeg-enc.c    | 1632 ++++++++++++++++=
++
 .../media/platform/imagination/e5010-jpeg-enc.h    |  168 ++
 .../media/platform/imagination/e5010-mmu-regs.h    |  311 ++++
 drivers/media/platform/intel/pxa_camera.c          |   15 +-
 drivers/media/platform/m2m-deinterlace.c           |    4 -
 drivers/media/platform/marvell/mcam-core.c         |    9 +-
 drivers/media/platform/marvell/mcam-core.h         |    3 +-
 drivers/media/platform/marvell/mmp-driver.c        |    1 +
 .../media/platform/mediatek/mdp3/mdp_cfg_data.c    |  280 +++
 drivers/media/platform/mediatek/mdp3/mtk-img-ipi.h |    1 +
 .../media/platform/mediatek/mdp3/mtk-mdp3-cfg.h    |    1 +
 .../media/platform/mediatek/mdp3/mtk-mdp3-core.c   |    3 +
 .../mediatek/vcodec/common/mtk_vcodec_util.c       |    3 +-
 .../mediatek/vcodec/decoder/mtk_vcodec_dec.c       |   60 +-
 .../mediatek/vcodec/decoder/vdec/vdec_vp8_if.c     |    2 +-
 .../platform/mediatek/vcodec/decoder/vdec_vpu_if.c |    6 +
 drivers/media/platform/nvidia/tegra-vde/h264.c     |    5 -
 drivers/media/platform/nvidia/tegra-vde/vde.h      |    1 -
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c     |   14 +-
 drivers/media/platform/nxp/imx-mipi-csis.c         |   22 +-
 drivers/media/platform/nxp/imx-pxp.c               |    3 +
 drivers/media/platform/qcom/camss/Makefile         |    1 +
 drivers/media/platform/qcom/camss/camss-csid-4-1.c |  132 +-
 drivers/media/platform/qcom/camss/camss-csid-4-7.c |  160 +-
 .../media/platform/qcom/camss/camss-csid-gen2.c    |  407 ++---
 drivers/media/platform/qcom/camss/camss-csid.c     |  512 +++++-
 drivers/media/platform/qcom/camss/camss-csid.h     |   32 +-
 drivers/media/platform/qcom/camss/camss-csiphy.c   |   74 +-
 drivers/media/platform/qcom/camss/camss-csiphy.h   |   23 +-
 drivers/media/platform/qcom/camss/camss-format.c   |   91 +
 drivers/media/platform/qcom/camss/camss-format.h   |   62 +
 drivers/media/platform/qcom/camss/camss-vfe-17x.c  |   10 +-
 drivers/media/platform/qcom/camss/camss-vfe-4-1.c  |    4 +-
 drivers/media/platform/qcom/camss/camss-vfe-4-7.c  |    6 +-
 drivers/media/platform/qcom/camss/camss-vfe-4-8.c  |    6 +-
 drivers/media/platform/qcom/camss/camss-vfe-gen1.c |    8 +-
 drivers/media/platform/qcom/camss/camss-vfe.c      |  483 +++---
 drivers/media/platform/qcom/camss/camss-vfe.h      |   22 +-
 drivers/media/platform/qcom/camss/camss-video.c    |  294 +---
 drivers/media/platform/qcom/camss/camss-video.h    |    4 +-
 drivers/media/platform/qcom/camss/camss.c          |  683 ++++++--
 drivers/media/platform/qcom/camss/camss.h          |   20 +-
 drivers/media/platform/qcom/venus/core.c           |   45 +-
 drivers/media/platform/qcom/venus/core.h           |    2 +
 drivers/media/platform/qcom/venus/vdec.c           |    3 +-
 drivers/media/platform/raspberrypi/Kconfig         |    5 +
 drivers/media/platform/raspberrypi/Makefile        |    3 +
 drivers/media/platform/raspberrypi/pisp_be/Kconfig |   12 +
 .../media/platform/raspberrypi/pisp_be/Makefile    |    6 +
 .../media/platform/raspberrypi/pisp_be/pisp_be.c   | 1797 ++++++++++++++++=
++++
 .../platform/raspberrypi/pisp_be/pisp_be_formats.h |  519 ++++++
 drivers/media/platform/renesas/rcar-csi2.c         |  155 +-
 drivers/media/platform/renesas/rcar-vin/rcar-dma.c |   16 +-
 drivers/media/platform/renesas/vsp1/vsp1_brx.c     |   31 +-
 drivers/media/platform/renesas/vsp1/vsp1_clu.c     |    4 +-
 drivers/media/platform/renesas/vsp1/vsp1_drm.c     |   27 +-
 drivers/media/platform/renesas/vsp1/vsp1_drm.h     |    2 +
 drivers/media/platform/renesas/vsp1/vsp1_entity.c  |   66 +-
 drivers/media/platform/renesas/vsp1/vsp1_entity.h  |   48 +-
 drivers/media/platform/renesas/vsp1/vsp1_hgo.c     |   28 +-
 drivers/media/platform/renesas/vsp1/vsp1_hgt.c     |   20 +-
 drivers/media/platform/renesas/vsp1/vsp1_histo.c   |   76 +-
 drivers/media/platform/renesas/vsp1/vsp1_hsit.c    |    6 +-
 drivers/media/platform/renesas/vsp1/vsp1_lif.c     |    4 +-
 drivers/media/platform/renesas/vsp1/vsp1_lut.c     |    1 +
 drivers/media/platform/renesas/vsp1/vsp1_pipe.c    |  103 +-
 drivers/media/platform/renesas/vsp1/vsp1_pipe.h    |   48 +-
 drivers/media/platform/renesas/vsp1/vsp1_rpf.c     |   56 +-
 drivers/media/platform/renesas/vsp1/vsp1_rwpf.c    |   26 +-
 drivers/media/platform/renesas/vsp1/vsp1_rwpf.h    |    3 -
 drivers/media/platform/renesas/vsp1/vsp1_sru.c     |   37 +-
 drivers/media/platform/renesas/vsp1/vsp1_uds.c     |   51 +-
 drivers/media/platform/renesas/vsp1/vsp1_uif.c     |   15 +-
 drivers/media/platform/renesas/vsp1/vsp1_video.c   |  200 +--
 drivers/media/platform/renesas/vsp1/vsp1_wpf.c     |   43 +-
 drivers/media/platform/rockchip/rga/rga-buf.c      |    5 +
 drivers/media/platform/rockchip/rga/rga.c          |    4 +
 drivers/media/platform/rockchip/rga/rga.h          |    3 +
 .../media/platform/rockchip/rkisp1/rkisp1-isp.c    |    8 +-
 .../platform/rockchip/rkisp1/rkisp1-resizer.c      |    8 +-
 drivers/media/platform/samsung/exynos4-is/common.c |    1 +
 .../media/platform/samsung/exynos4-is/fimc-is.c    |    1 +
 .../media/platform/samsung/exynos4-is/fimc-lite.c  |    1 +
 .../platform/st/sti/c8sectpfe/c8sectpfe-core.c     |   14 +-
 .../platform/st/sti/c8sectpfe/c8sectpfe-core.h     |    2 +-
 .../platform/st/sti/c8sectpfe/c8sectpfe-debugfs.h  |    4 +-
 .../platform/st/stm32/stm32-dcmipp/dcmipp-core.c   |    4 +-
 drivers/media/platform/ti/vpe/vpdma.c              |    1 +
 drivers/media/platform/verisilicon/Kconfig         |    1 +
 drivers/media/platform/verisilicon/hantro_jpeg.c   |  129 +-
 drivers/media/platform/xilinx/xilinx-dma.c         |    4 +-
 drivers/media/platform/xilinx/xilinx-dma.h         |    2 +-
 drivers/media/radio/si470x/radio-si470x-common.c   |    1 +
 drivers/media/radio/wl128x/fmdrv.h                 |    5 +-
 drivers/media/radio/wl128x/fmdrv_common.c          |   40 +-
 drivers/media/rc/imon.c                            |    5 +-
 drivers/media/rc/keymaps/Makefile                  |    1 +
 drivers/media/rc/keymaps/rc-mygica-utv3.c          |   69 +
 drivers/media/rc/mceusb.c                          |   13 +-
 drivers/media/rc/rc-main.c                         |    1 +
 drivers/media/spi/gs1662.c                         |    8 -
 drivers/media/test-drivers/vimc/vimc-capture.c     |    2 +-
 drivers/media/test-drivers/vimc/vimc-common.c      |   25 +-
 drivers/media/test-drivers/vimc/vimc-common.h      |   14 +-
 drivers/media/test-drivers/vimc/vimc-core.c        |    2 +-
 drivers/media/test-drivers/vimc/vimc-debayer.c     |  201 +--
 drivers/media/test-drivers/vimc/vimc-lens.c        |    5 +-
 drivers/media/test-drivers/vimc/vimc-scaler.c      |  134 +-
 drivers/media/test-drivers/vimc/vimc-sensor.c      |  125 +-
 drivers/media/test-drivers/vivid/vivid-cec.c       |   88 +-
 drivers/media/test-drivers/vivid/vivid-core.c      |  250 ++-
 drivers/media/test-drivers/vivid/vivid-core.h      |  125 +-
 drivers/media/test-drivers/vivid/vivid-ctrls.c     |  262 +--
 .../media/test-drivers/vivid/vivid-kthread-cap.c   |   86 +-
 drivers/media/test-drivers/vivid/vivid-sdr-cap.c   |    7 +-
 drivers/media/test-drivers/vivid/vivid-touch-cap.c |    6 +-
 drivers/media/test-drivers/vivid/vivid-vbi-cap.c   |    7 +-
 drivers/media/test-drivers/vivid/vivid-vbi-out.c   |    2 +
 drivers/media/test-drivers/vivid/vivid-vid-cap.c   |  120 +-
 drivers/media/test-drivers/vivid/vivid-vid-cap.h   |    2 +
 .../media/test-drivers/vivid/vivid-vid-common.c    |  134 +-
 .../media/test-drivers/vivid/vivid-vid-common.h    |    5 +-
 drivers/media/test-drivers/vivid/vivid-vid-out.c   |   41 +-
 drivers/media/tuners/tda9887.c                     |    1 +
 drivers/media/tuners/tuner-types.c                 |   21 +
 drivers/media/tuners/xc2028.c                      |    9 +-
 drivers/media/usb/b2c2/flexcop-usb.c               |    7 +-
 drivers/media/usb/cx231xx/cx231xx-417.c            |    2 +-
 drivers/media/usb/cx231xx/cx231xx-video.c          |    2 +-
 drivers/media/usb/dvb-usb/dibusb-common.c          |    1 +
 drivers/media/usb/dvb-usb/dibusb-mc-common.c       |    1 +
 drivers/media/usb/dvb-usb/dvb-usb-init.c           |   35 +-
 drivers/media/usb/dvb-usb/opera1.c                 |    4 -
 drivers/media/usb/em28xx/em28xx-cards.c            |   52 +
 drivers/media/usb/em28xx/em28xx-core.c             |    3 +-
 drivers/media/usb/em28xx/em28xx.h                  |    1 +
 drivers/media/usb/go7007/go7007-driver.c           |    1 +
 drivers/media/usb/go7007/go7007-i2c.c              |   30 +-
 drivers/media/usb/go7007/go7007-usb.c              |    1 +
 drivers/media/usb/pvrusb2/pvrusb2-debugifc.c       |    5 -
 drivers/media/usb/ttusb-dec/ttusb_dec.c            |   21 +-
 drivers/media/usb/uvc/uvc_ctrl.c                   |  193 ++-
 drivers/media/usb/uvc/uvc_driver.c                 |  160 +-
 drivers/media/usb/uvc/uvc_video.c                  |  169 +-
 drivers/media/usb/uvc/uvcvideo.h                   |   10 +-
 drivers/media/v4l2-core/v4l2-async.c               |    8 +
 drivers/media/v4l2-core/v4l2-cci.c                 |    9 +
 drivers/media/v4l2-core/v4l2-common.c              |    2 +
 drivers/media/v4l2-core/v4l2-ctrls-defs.c          |    5 +
 drivers/media/v4l2-core/v4l2-fwnode.c              |    1 +
 drivers/media/v4l2-core/v4l2-ioctl.c               |   13 +
 drivers/media/v4l2-core/v4l2-jpeg.c                |  116 ++
 drivers/media/v4l2-core/v4l2-subdev.c              |  393 +++--
 drivers/staging/media/atomisp/TODO                 |   31 +-
 .../media/atomisp/i2c/atomisp-libmsrlisthelper.c   |    1 +
 .../staging/media/atomisp/i2c/atomisp-mt9m114.c    |    1 +
 .../media/atomisp/include/linux/atomisp_platform.h |   27 +-
 drivers/staging/media/atomisp/pci/atomisp_common.h |    1 -
 .../media/atomisp/pci/atomisp_csi2_bridge.c        |   14 +
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c  |    2 +-
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c   |   41 +-
 .../base/circbuf/interface/ia_css_circbuf_comm.h   |    6 +
 .../pci/camera/util/interface/ia_css_util.h        |   11 -
 .../media/atomisp/pci/camera/util/src/util.c       |   25 +-
 .../staging/media/atomisp/pci/gpio_block_defs.h    |   17 -
 .../atomisp/pci/hive_isp_css_common/gpio_global.h  |   23 -
 .../pci/hive_isp_css_common/host/gpio_local.h      |   21 -
 .../pci/hive_isp_css_common/host/gpio_private.h    |    9 +-
 .../pci/hive_isp_css_include/assert_support.h      |   23 -
 .../media/atomisp/pci/hive_isp_css_include/gpio.h  |   46 -
 .../pci/hive_isp_css_include/host/gpio_public.h    |   46 -
 .../pci/hive_isp_css_include/math_support.h        |  110 +-
 .../pci/hive_isp_css_include/type_support.h        |    5 +-
 drivers/staging/media/atomisp/pci/hmm/hmm_bo.c     |    4 +-
 drivers/staging/media/atomisp/pci/ia_css_3a.h      |    5 +
 drivers/staging/media/atomisp/pci/ia_css_dvs.h     |    4 +
 .../staging/media/atomisp/pci/ia_css_metadata.h    |    4 +
 drivers/staging/media/atomisp/pci/ia_css_types.h   |    2 +
 .../pci/isp/kernels/eed1_8/ia_css_eed1_8.host.c    |    2 +-
 .../pci/isp/kernels/xnr/xnr_3.0/ia_css_xnr3.host.c |    6 +-
 .../media/atomisp/pci/runtime/binary/src/binary.c  |    2 -
 .../atomisp/pci/runtime/debug/src/ia_css_debug.c   |    4 +-
 .../runtime/spctrl/interface/ia_css_spctrl_comm.h  |    4 +
 drivers/staging/media/atomisp/pci/sh_css.c         |   48 +-
 drivers/staging/media/atomisp/pci/sh_css_frac.h    |    4 +-
 .../staging/media/atomisp/pci/sh_css_internal.h    |   19 +-
 drivers/staging/media/atomisp/pci/sh_css_sp.c      |   24 +-
 drivers/staging/media/av7110/Kconfig               |   22 -
 drivers/staging/media/av7110/Makefile              |    2 -
 drivers/staging/media/av7110/TODO                  |    3 -
 .../av7110/audio-bilingual-channel-select.rst      |   58 -
 .../staging/media/av7110/audio-channel-select.rst  |   57 -
 .../staging/media/av7110/audio-clear-buffer.rst    |   48 -
 drivers/staging/media/av7110/audio-continue.rst    |   48 -
 drivers/staging/media/av7110/audio-fclose.rst      |   51 -
 drivers/staging/media/av7110/audio-fopen.rst       |  103 --
 drivers/staging/media/av7110/audio-fwrite.rst      |   79 -
 .../media/av7110/audio-get-capabilities.rst        |   54 -
 drivers/staging/media/av7110/audio-get-status.rst  |   54 -
 drivers/staging/media/av7110/audio-pause.rst       |   49 -
 drivers/staging/media/av7110/audio-play.rst        |   48 -
 .../staging/media/av7110/audio-select-source.rst   |   56 -
 drivers/staging/media/av7110/audio-set-av-sync.rst |   58 -
 .../staging/media/av7110/audio-set-bypass-mode.rst |   62 -
 drivers/staging/media/av7110/audio-set-id.rst      |   59 -
 drivers/staging/media/av7110/audio-set-mixer.rst   |   53 -
 drivers/staging/media/av7110/audio-set-mute.rst    |   62 -
 .../staging/media/av7110/audio-set-streamtype.rst  |   66 -
 drivers/staging/media/av7110/audio-stop.rst        |   48 -
 drivers/staging/media/av7110/audio.rst             |   27 -
 drivers/staging/media/av7110/audio_data_types.rst  |  116 --
 .../staging/media/av7110/audio_function_calls.rst  |   30 -
 drivers/staging/media/av7110/av7110.c              |  496 +++---
 drivers/staging/media/av7110/av7110.h              |   50 +-
 drivers/staging/media/av7110/av7110_av.c           |  234 +--
 drivers/staging/media/av7110/av7110_av.h           |   37 +-
 drivers/staging/media/av7110/av7110_ca.c           |   43 +-
 drivers/staging/media/av7110/av7110_ca.h           |   12 +-
 drivers/staging/media/av7110/av7110_hw.c           |  230 ++-
 drivers/staging/media/av7110/av7110_hw.h           |   79 +-
 drivers/staging/media/av7110/av7110_ipack.c        |  282 ++-
 drivers/staging/media/av7110/av7110_ipack.h        |   12 +-
 drivers/staging/media/av7110/av7110_ir.c           |    3 +-
 drivers/staging/media/av7110/av7110_v4l.c          |  102 +-
 drivers/staging/media/av7110/budget-patch.c        |  665 --------
 drivers/staging/media/av7110/dvb_filter.c          |  116 +-
 drivers/staging/media/av7110/dvb_filter.h          |   22 +-
 drivers/staging/media/av7110/sp8870.c              |  200 ++-
 drivers/staging/media/av7110/sp8870.h              |   24 +-
 .../staging/media/av7110/video-clear-buffer.rst    |   54 -
 drivers/staging/media/av7110/video-command.rst     |   96 --
 drivers/staging/media/av7110/video-continue.rst    |   57 -
 .../staging/media/av7110/video-fast-forward.rst    |   72 -
 drivers/staging/media/av7110/video-fclose.rst      |   51 -
 drivers/staging/media/av7110/video-fopen.rst       |  111 --
 drivers/staging/media/av7110/video-freeze.rst      |   61 -
 drivers/staging/media/av7110/video-fwrite.rst      |   79 -
 .../media/av7110/video-get-capabilities.rst        |   61 -
 drivers/staging/media/av7110/video-get-event.rst   |  105 --
 .../staging/media/av7110/video-get-frame-count.rst |   65 -
 drivers/staging/media/av7110/video-get-pts.rst     |   69 -
 drivers/staging/media/av7110/video-get-size.rst    |   69 -
 drivers/staging/media/av7110/video-get-status.rst  |   72 -
 drivers/staging/media/av7110/video-play.rst        |   57 -
 .../staging/media/av7110/video-select-source.rst   |   76 -
 drivers/staging/media/av7110/video-set-blank.rst   |   64 -
 .../media/av7110/video-set-display-format.rst      |   60 -
 drivers/staging/media/av7110/video-set-format.rst  |   82 -
 .../staging/media/av7110/video-set-streamtype.rst  |   61 -
 drivers/staging/media/av7110/video-slowmotion.rst  |   72 -
 .../staging/media/av7110/video-stillpicture.rst    |   61 -
 drivers/staging/media/av7110/video-stop.rst        |   74 -
 drivers/staging/media/av7110/video-try-command.rst |   66 -
 drivers/staging/media/av7110/video.rst             |   36 -
 .../staging/media/av7110/video_function_calls.rst  |   35 -
 drivers/staging/media/av7110/video_types.rst       |  248 ---
 drivers/staging/media/max96712/max96712.c          |   37 +-
 include/media/ipu-bridge.h                         |    1 +
 include/media/rc-map.h                             |    1 +
 include/media/tuner.h                              |    1 +
 include/media/v4l2-jpeg.h                          |   32 +
 include/media/v4l2-subdev.h                        |   92 +-
 .../uapi/linux/media/raspberrypi/pisp_be_config.h  |  968 +++++++++++
 include/uapi/linux/media/raspberrypi/pisp_common.h |  202 +++
 include/uapi/linux/v4l2-controls.h                 |    2 +
 include/uapi/linux/videodev2.h                     |   17 +
 405 files changed, 21983 insertions(+), 10210 deletions(-)
 create mode 100644 Documentation/admin-guide/media/raspberrypi-pisp-be.dot
 create mode 100644 Documentation/admin-guide/media/raspberrypi-pisp-be.rst
 create mode 100644 Documentation/devicetree/bindings/media/i2c/galaxycore,=
gc05a2.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/galaxycore,=
gc08a3.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/maxim,max96=
714.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/maxim,max96=
717.yaml
 rename Documentation/devicetree/bindings/media/i2c/{imx258.yaml =3D> sony,=
imx258.yaml} (88%)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx283=
.yaml
 create mode 100644 Documentation/devicetree/bindings/media/img,e5010-jpeg-=
enc.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt7622=
-cir.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/mtk-cir.txt
 create mode 100644 Documentation/devicetree/bindings/media/raspberrypi,pis=
pbe.yaml
 create mode 100644 Documentation/driver-api/media/v4l2-jpeg.rst
 rename Documentation/userspace-api/media/drivers/{st-vgxy61.rst =3D> vgxy6=
1.rst} (100%)
 create mode 100644 Documentation/userspace-api/media/v4l/metafmt-pisp-be.r=
st
 create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-srggb8-pis=
p-comp.rst
 create mode 100644 drivers/media/i2c/gc05a2.c
 create mode 100644 drivers/media/i2c/gc08a3.c
 create mode 100644 drivers/media/i2c/imx283.c
 create mode 100644 drivers/media/i2c/max96714.c
 create mode 100644 drivers/media/i2c/max96717.c
 rename drivers/media/i2c/{st-vgxy61.c =3D> vgxy61.c} (99%)
 create mode 100644 drivers/media/platform/imagination/Kconfig
 create mode 100644 drivers/media/platform/imagination/Makefile
 create mode 100644 drivers/media/platform/imagination/e5010-core-regs.h
 create mode 100644 drivers/media/platform/imagination/e5010-jpeg-enc-hw.c
 create mode 100644 drivers/media/platform/imagination/e5010-jpeg-enc-hw.h
 create mode 100644 drivers/media/platform/imagination/e5010-jpeg-enc.c
 create mode 100644 drivers/media/platform/imagination/e5010-jpeg-enc.h
 create mode 100644 drivers/media/platform/imagination/e5010-mmu-regs.h
 create mode 100644 drivers/media/platform/qcom/camss/camss-format.c
 create mode 100644 drivers/media/platform/qcom/camss/camss-format.h
 create mode 100644 drivers/media/platform/raspberrypi/Kconfig
 create mode 100644 drivers/media/platform/raspberrypi/Makefile
 create mode 100644 drivers/media/platform/raspberrypi/pisp_be/Kconfig
 create mode 100644 drivers/media/platform/raspberrypi/pisp_be/Makefile
 create mode 100644 drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
 create mode 100644 drivers/media/platform/raspberrypi/pisp_be/pisp_be_form=
ats.h
 create mode 100644 drivers/media/rc/keymaps/rc-mygica-utv3.c
 delete mode 100644 drivers/staging/media/atomisp/pci/hive_isp_css_common/h=
ost/gpio_local.h
 delete mode 100644 drivers/staging/media/atomisp/pci/hive_isp_css_include/=
gpio.h
 delete mode 100644 drivers/staging/media/atomisp/pci/hive_isp_css_include/=
host/gpio_public.h
 delete mode 100644 drivers/staging/media/av7110/TODO
 delete mode 100644 drivers/staging/media/av7110/audio-bilingual-channel-se=
lect.rst
 delete mode 100644 drivers/staging/media/av7110/audio-channel-select.rst
 delete mode 100644 drivers/staging/media/av7110/audio-clear-buffer.rst
 delete mode 100644 drivers/staging/media/av7110/audio-continue.rst
 delete mode 100644 drivers/staging/media/av7110/audio-fclose.rst
 delete mode 100644 drivers/staging/media/av7110/audio-fopen.rst
 delete mode 100644 drivers/staging/media/av7110/audio-fwrite.rst
 delete mode 100644 drivers/staging/media/av7110/audio-get-capabilities.rst
 delete mode 100644 drivers/staging/media/av7110/audio-get-status.rst
 delete mode 100644 drivers/staging/media/av7110/audio-pause.rst
 delete mode 100644 drivers/staging/media/av7110/audio-play.rst
 delete mode 100644 drivers/staging/media/av7110/audio-select-source.rst
 delete mode 100644 drivers/staging/media/av7110/audio-set-av-sync.rst
 delete mode 100644 drivers/staging/media/av7110/audio-set-bypass-mode.rst
 delete mode 100644 drivers/staging/media/av7110/audio-set-id.rst
 delete mode 100644 drivers/staging/media/av7110/audio-set-mixer.rst
 delete mode 100644 drivers/staging/media/av7110/audio-set-mute.rst
 delete mode 100644 drivers/staging/media/av7110/audio-set-streamtype.rst
 delete mode 100644 drivers/staging/media/av7110/audio-stop.rst
 delete mode 100644 drivers/staging/media/av7110/audio.rst
 delete mode 100644 drivers/staging/media/av7110/audio_data_types.rst
 delete mode 100644 drivers/staging/media/av7110/audio_function_calls.rst
 delete mode 100644 drivers/staging/media/av7110/budget-patch.c
 delete mode 100644 drivers/staging/media/av7110/video-clear-buffer.rst
 delete mode 100644 drivers/staging/media/av7110/video-command.rst
 delete mode 100644 drivers/staging/media/av7110/video-continue.rst
 delete mode 100644 drivers/staging/media/av7110/video-fast-forward.rst
 delete mode 100644 drivers/staging/media/av7110/video-fclose.rst
 delete mode 100644 drivers/staging/media/av7110/video-fopen.rst
 delete mode 100644 drivers/staging/media/av7110/video-freeze.rst
 delete mode 100644 drivers/staging/media/av7110/video-fwrite.rst
 delete mode 100644 drivers/staging/media/av7110/video-get-capabilities.rst
 delete mode 100644 drivers/staging/media/av7110/video-get-event.rst
 delete mode 100644 drivers/staging/media/av7110/video-get-frame-count.rst
 delete mode 100644 drivers/staging/media/av7110/video-get-pts.rst
 delete mode 100644 drivers/staging/media/av7110/video-get-size.rst
 delete mode 100644 drivers/staging/media/av7110/video-get-status.rst
 delete mode 100644 drivers/staging/media/av7110/video-play.rst
 delete mode 100644 drivers/staging/media/av7110/video-select-source.rst
 delete mode 100644 drivers/staging/media/av7110/video-set-blank.rst
 delete mode 100644 drivers/staging/media/av7110/video-set-display-format.r=
st
 delete mode 100644 drivers/staging/media/av7110/video-set-format.rst
 delete mode 100644 drivers/staging/media/av7110/video-set-streamtype.rst
 delete mode 100644 drivers/staging/media/av7110/video-slowmotion.rst
 delete mode 100644 drivers/staging/media/av7110/video-stillpicture.rst
 delete mode 100644 drivers/staging/media/av7110/video-stop.rst
 delete mode 100644 drivers/staging/media/av7110/video-try-command.rst
 delete mode 100644 drivers/staging/media/av7110/video.rst
 delete mode 100644 drivers/staging/media/av7110/video_function_calls.rst
 delete mode 100644 drivers/staging/media/av7110/video_types.rst
 create mode 100644 include/uapi/linux/media/raspberrypi/pisp_be_config.h
 create mode 100644 include/uapi/linux/media/raspberrypi/pisp_common.h


