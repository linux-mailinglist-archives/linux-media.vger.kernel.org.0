Return-Path: <linux-media+bounces-43498-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79DC8BB10F1
	for <lists+linux-media@lfdr.de>; Wed, 01 Oct 2025 17:25:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1449A7AB6F7
	for <lists+linux-media@lfdr.de>; Wed,  1 Oct 2025 15:23:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94D112773C2;
	Wed,  1 Oct 2025 15:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KWZ+nPyY"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E39B9748F;
	Wed,  1 Oct 2025 15:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759332323; cv=none; b=Irgubg05X98fZGM8MdS7YI4hudFFxq1noKpare9MPE5IcOYgrknHBGk1J5Z+gcnzYqluOz8ekrbrX4wNQIYOPkdH4/cWNH/B47EP8uKAbwAksYhNt8zb4Md8swtRj3vPKv7n7YDzLlt9NCbI532cT1q2lAY3PkwLsIGLLKUOLCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759332323; c=relaxed/simple;
	bh=C83zHNvTwjbYDJ/LWMnYNm11JqJu5Nui89ndnTqDtUI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=EERXzpLWBhh9UtAHKtFGaywrVfLQxVF5MgsKFW4erbO8yZ79EHuQAW99s23L43fwqqWkAUr8DTN2Uxdnlt7XPORL6Pmyp/D2OtxjGMig1TcgfdZrLptSObnZpxM3JbpSDAfiM6cQTzTE+6T23Ta3Voc29s7j5+T/mmihhYSMBe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KWZ+nPyY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05C7DC4CEF1;
	Wed,  1 Oct 2025 15:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759332322;
	bh=C83zHNvTwjbYDJ/LWMnYNm11JqJu5Nui89ndnTqDtUI=;
	h=Date:From:To:Cc:Subject:From;
	b=KWZ+nPyYw0tQMPg0IxqegQ0T9xkBPYQlaZCDTXhpkVz1Nse+3DTfeJ168m7ucawiU
	 eSKVkKPN12Nn+S3VbqtOkyex6gN+hKhZb/ONtmSkNsBj2TeQzqecNXOTcjr+xz0zqz
	 gnqLOobhDM31FIua+5/dV3T3hnurQYk0v5p1u+126erMis9+IaNL0vymQWCN2tY3U1
	 O45vhWVdhdKAVS66PUdxsQy9G0NFjU/v0juc3VKzJ5FlXN5yZ5/2FD+Stf+JitOX75
	 i4w8RC4I6QxoomXBhzkUfOo5q66dUOAXJG4GZGTigdFz8QEvp3bNch6xbZC7LtNqZc
	 2w/vZp2ys52Jw==
Date: Wed, 1 Oct 2025 17:25:11 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton
 <akpm@linux-foundation.org>, Linux Media Mailing List
 <linux-media@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>
Subject: [GIT PULL for v6.18] media updates
Message-ID: <20251001172511.2d0514ec@sal.lan>
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
a/v6.18-1

For:

- Added a new V4L2 clock helper;
- iris: Enable H.264/H.265 encoder support and fixes in iris driver common =
code;
- camss: add support for new SoC flavors;
- New camera sensor drivers;
- venus: add new SoC support;
- tc358743: support more infoframe types;
- Various fixes, driver improvements and cleanups;
=20
Regards,
Mauro

---

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git tag=
s/media/v6.18-1

for you to fetch changes up to afb100a5ea7a13d7e6937dcd3b36b19dc6cc9328:

  media: venus: pm_helpers: add fallback for the opp-table (2025-09-24 12:5=
2:09 +0200)

----------------------------------------------------------------
[GIT PULL for v6.18] media updates

----------------------------------------------------------------
A.T. Jefferies (1):
      staging: media: tegra-video: use BIT() macro instead of shift

Allen Ballway (1):
      media: ov8865: move mode_configure out of state_configure

Andr=C3=A9 Apitzsch (5):
      media: i2c: imx214: Remove unneeded parentheses
      media: i2c: imx214: Drop dev argument from imx214_parse_fwnode()
      media: i2c: imx214: Use __free(fwnode_handle)
      media: i2c: imx214: Move imx214_pll_update to imx214_ctrls_init
      media: i2c: imx214: Separate legacy link frequency check from PLL cal=
culation

Arnd Bergmann (3):
      media: st-delta: avoid excessive stack usage
      media: s5p-mfc: remove an unused/uninitialized variable
      media: em28xx: add special case for legacy gpiolib interface

Benjamin Mugnier (1):
      media: i2c: vd55g1: Fix duster register address

Biju Das (1):
      media: rzg2l-cru: Drop function pointer to configure CSI

Bingbu Cao (4):
      media: staging/ipu7: convert to use pci_alloc_irq_vectors() API
      media: staging/ipu7: Don't set name for IPU7 PCI device
      media: staging/ipu7: cleanup the MMU correctly in IPU7 driver release
      media: staging/ipu7: fix isys device runtime PM usage in firmware clo=
sing

Bryan O'Donoghue (1):
      MAINTAINERS: Add a media/platform/qcom MAINTAINERS entry

Chandra Mohan Sundar (1):
      media: stm32-csi: Fix dereference before NULL check

Chelsy Ratnawat (1):
      media: fix uninitialized symbol warnings

Chen Ni (1):
      media: au0828: Use USB API functions rather than constants

Colin Ian King (4):
      media: i2c: ov5648: make read-only arrays regs and values static const
      media: Kconfig: Fix spelling mistake "Tehnology" -> "Technology"
      media: atomisp: Fix incorrect snprintf format specifiers for signed i=
ntegers
      media: b2c2: Remove space before newline

Dan Carpenter (2):
      media: stk1160: Restore deleted comment in stk1160_fill_urb()
      media: ti: j721e-csi2rx: Fix NULL vs IS_ERR() bug in ti_csi2rx_reques=
t_max_ppc()

Darshan Rathod (2):
      media: b2c2: flexcop: Fix coding style issues
      media: uvcvideo: Fix assignment in if condition

David Lechner (1):
      media: pci: mg4b: fix uninitialized iio scan data

Desnes Nunes (1):
      media: uvcvideo: Avoid variable shadowing in uvc_ctrl_cleanup_fh

Dikshita Agarwal (30):
      MAINTAINERS: update Dikshita Agarwal's email addresses
      dt-bindings: media: qcom,sm8550-iris: Update Dikshita Agarwal's email=
 address
      mailmap: update Dikshita Agarwal's email addresses
      media: iris: vpu3x: Add MNoC low power handshake during hardware powe=
r-off
      media: iris: Fix buffer count reporting in internal buffer check
      media: iris: Report unreleased PERSIST buffers on session close
      media: iris: Fix memory leak by freeing untracked persist buffer
      media: iris: Fix port streaming handling
      media: iris: Allow substate transition to load resources during outpu=
t streaming
      media: iris: Always destroy internal buffers on firmware release resp=
onse
      media: iris: Update vbuf flags before v4l2_m2m_buf_done
      media: iris: Simplify session stop logic by relying on vb2 checks
      media: iris: Allow stop on firmware only if start was issued.
      media: iris: Send dummy buffer address for all codecs during drain
      media: iris: Fix missing LAST flag handling during drain
      media: iris: Fix format check for CAPTURE plane in try_fmt
      media: iris: Add support for video encoder device
      media: iris: Initialize and deinitialize encoder instance structure
      media: iris: Add support for ENUM_FMT, S/G/TRY_FMT encoder
      media: iris: Add support for ENUM_FRAMESIZES/FRAMEINTERVALS for encod=
er
      media: iris: Add support for VIDIOC_QUERYCAP for encoder video device
      media: iris: Add encoder support for V4L2 event subscription
      media: iris: Add support for G/S_SELECTION for encoder video device
      media: iris: Add support for G/S_PARM for encoder video device
      media: iris: Add platform-specific capabilities for encoder video dev=
ice
      media: iris: Add V4L2 streaming support for encoder video device
      media: iris: Set platform capabilities to firmware for encoder video =
device
      media: iris: Allocate and queue internal buffers for encoder video de=
vice
      media: iris: Add support for buffer management ioctls for encoder dev=
ice
      media: iris: Add support for drain sequence in encoder video device

Dr. David Alan Gilbert (2):
      media: radio-wl1273: Remove
      media: pci: zoran: Remove unused debug parameter

Duoming Zhou (3):
      media: b2c2: Fix use-after-free causing by irq_check_work in flexcop_=
pci_remove
      media: i2c: tc358743: Fix use-after-free bugs caused by orphan timer =
in probe
      media: tuner: xc5000: Fix use-after-free in xc5000_release

Edward Adam Davis (1):
      media: mc: Clear minor number before put device

Geert Uytterhoeven (5):
      media: renesas: rcar_drif: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
      media: renesas: rcar-vin: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
      media: renesas: fdp1: Convert to RUNTIME_PM_OPS()
      media: renesas: ceu: Convert to RUNTIME_PM_OPS()
      media: renesas: vsp1: Convert to SYSTEM_SLEEP/RUNTIME_PM_OPS()

Guoniu Zhou (2):
      media: nxp: imx8-isi: Add suspend/resume support for ISI mem2mem
      media: nxp: imx8-isi: m2m: Fix streaming cleanup on release

Hanne-Lotta M=C3=A4enp=C3=A4=C3=A4 (1):
      media: Documentation: Improve grammar in DVB API

Hans Verkuil (12):
      media: v4l2-core: v4l2-dv-timings: support DRM IFs
      media: i2c: tc358743: add support for more infoframe types
      MAINTAINERS: update Hans Verkuil's email addresses
      Documentation: media: update Hans Verkuil's email address
      media: v4l2-core: update Hans Verkuil's email address
      media: update Hans Verkuil's email address
      Documentation: update Hans Verkuil's email address
      media: include: update Hans Verkuil's email address
      media: update Hans Verkuil's email address
      gpu: drm: display: drm_dp_cec: update Hans' email address
      media: i2c: mt9p031: fix mbus code initialization
      media: vivid: fix disappearing <Vendor Command With ID> messages

Hans de Goede (1):
      media: Move gc0310 sensor drivers to drivers/media/i2c/

Hao Yao (1):
      media: ov08x40: Fix the horizontal flip control

Hardevsinh Palaniya (1):
      media: i2c: add ov2735 image sensor driver

Himanshu Bhavani (1):
      dt-bindings: media: i2c: Add ov2735 sensor

Jacopo Mondi (37):
      media: rcar-vin: Do not set file->private_data
      media: rzg2l-cru: Do not set file->private_data
      media: camss: Remove custom .release fop()
      media: zoran: Remove zoran_fh structure
      media: zoran: Rename __fh to fh
      media: v4l2-ioctl: Access v4l2_fh from private_data
      media: allegro: Access v4l2_fh from file
      media: meson-ge2d: Access v4l2_fh from file
      media: coda: Access v4l2_fh from file
      media: wave5: Access v4l2_fh from file
      media: m2m-deinterlace: Access v4l2_fh from file
      media: mtk: jpeg: Access v4l2_fh from file->private_data
      media: mtk_mdp_m2m: Access v4l2_fh from file
      media: mtk: mdp3: Access v4l2_fh from file
      media: mtk: vcodec: Access v4l2_fh from file
      media: tegra-vde: Access v4l2_fh from file
      media: imx-jpeg: Access v4l2_fh from file
      media: imx-isi: Access v4l2_fh from file
      media: nxp: mx2: Access v4l2_fh from file
      media: renesas: Access v4l2_fh from file
      media: rockhip: rga: Access v4l2_fh from file
      media: rockchip: rkvdec: Access v4l2_fh from file
      media: exynos-gsc: Access v4l2_fh from file
      media: exynos4-is: Access v4l2_fh from file
      media: s3c-camif: Access v4l2_fh from file
      media: s5p-g2d: Access v4l2_fh from file
      media: s5p-jpeg: Access v4l2_fh from file
      media: s5p-mfc: Access v4l2_fh from file
      media: bdisp: Access v4l2_fh from file
      media: st: delta: Access v4l2_fh from file
      media: stm32: dma2d: Access v4l2_fh from file
      media: omap3isp: Access v4l2_fh from file
      media: cx18: Access v4l2_fh from file
      media: ivtv: Access v4l2_fh from file
      media: usb: hdpvr: Access v4l2_fh from file
      media: usb: uvc: Access v4l2_fh from file
      media: staging: imx: Access v4l2_fh from file

Jai Luthra (6):
      media: ti: j721e-csi2rx: Use devm_of_platform_populate
      media: ti: j721e-csi2rx: Use fwnode_get_named_child_node
      media: ti: j721e-csi2rx: Fix source subdev link creation
      media: cadence: csi2rx: Implement get_fwnode_pad op
      media: cadence: cdns-csi2rx: Support multiple pixels per clock cycle
      media: ti: j721e-csi2rx: Support multiple pixels per clock

Jammy Huang (1):
      media: aspeed: Allow to capture from SoC display (GFX)

Jorge Ramirez-Ortiz (6):
      media: dt-bindings: venus: Add qcm2290 dt schema
      media: venus: Define minimum valid firmware version
      media: venus: Add framework support for AR50_LITE video core
      media: venus: hfi_plat_v4: Add capabilities for the 4XX lite core
      media: venus: core: Sort dt_match alphabetically.
      media: venus: core: Add qcm2290 DT compatible and resource data

Julien Massot (1):
      media: i2c: vgxy61: Report stream using frame descriptors

Krzysztof Kozlowski (6):
      media: i2c: imx: Add note to prevent buggy code re-use
      dt-bindings: media: qcom,sm8550-iris: Add SM8750 video codec
      dt-bindings: media: qcom,sm8550-iris: Do not reference legacy venus p=
roperties
      media: iris: Call correct power off callback in cleanup path
      media: iris: Split power on per variants
      media: iris: Add support for SM8750 (VPU v3.5)

Larshin Sergey (1):
      media: rc: fix races with imon_disconnect()

Laurent Pinchart (135):
      media: pci: saa7164: Store v4l2_fh pointer in file->private_data
      media: imagination: Store v4l2_fh pointer in file->private_data
      media: ti: vpe: Store v4l2_fh pointer in file->private_data
      media: usb: hdpvr: Store v4l2_fh pointer in file->private_data
      media: usb: pvrusb2: Store v4l2_fh pointer in file->private_data
      media: usb: uvcvideo: Store v4l2_fh pointer in file->private_data
      media: staging: most: Store v4l2_fh pointer in file->private_data
      media: Wrap file->private_data access with a helper function
      media: Replace file->private_data access with file_to_v4l2_fh()
      media: nvidia: tegra-vde: Replace file->private_data access
      media: Replace file->private_data access with custom functions
      media: pci: ivtv: Don't create fake v4l2_fh
      media: amphion: Make some vpu_v4l2 functions static
      media: amphion: Delete v4l2_fh synchronously in .release()
      media: visl: Drop visl_v4l2fh_to_ctx() function
      media: v4l2-fh: Move piece of documentation to correct function
      media: camss: Replace .open() file operation with v4l2_fh_open()
      media: chips-media: wave5: Pass file pointer to wave5_cleanup_instanc=
e()
      media: qcom: iris: Pass file pointer to iris_v4l2_fh_(de)init()
      media: qcom: iris: Set file->private_data in iris_v4l2_fh_(de)init()
      media: qcom: iris: Drop unused argument to iris_get_inst()
      media: qcom: venus: Pass file pointer to venus_close_common()
      media: Set file->private_data in v4l2_fh_add()
      media: Reset file->private_data to NULL in v4l2_fh_del()
      media: ipu6: isys: Don't set V4L2_FL_USES_V4L2_FH manually
      media: staging: ipu7: isys: Don't set V4L2_FL_USES_V4L2_FH manually
      media: v4l2-ctrls: Move v4l2_fh retrieval after V4L2_FL_USES_V4L2_FH =
check
      media: v4l2-dev: Make open and release file operations mandatory
      media: Drop V4L2_FL_USES_V4L2_FH checks
      media: s5p-mfc: Store s5p_mfc_ctx in vb2_queue.drv_priv
      media: hantro: Access v4l2_fh from file->private_data
      media: v4l2-ioctl: Stop passing fh pointer to ioctl handlers
      media: v4l2-ioctl: Push NULL fh argument down to ioctl wrappers
      media: test-drivers: Rename second ioctl handlers argument to 'void *=
priv'
      media: uvcvideo: Rename second ioctl handlers argument to 'void *priv'
      media: v4l2-pci-skeleton: Rename second ioctl handlers argument to 'v=
oid *priv'
      media: v4l2-core: Rename second ioctl handlers argument to 'void *pri=
v'
      media: v4l2: Rename second ioctl handlers argument to 'void *priv'
      media: staging: Rename second ioctl handlers argument to 'void *priv'
      media: i2c: ds90ub913: Stop accessing streams configs directly
      media: staging/ipu7: Disallow source multiplexing
      media: v4l2-subdev: Make struct v4l2_subdev_stream_config private
      media: omap3isp: Drop custom .unsubscribe_event() handler
      media: staging: atomisp: Drop custom .unsubscribe_event() handler
      media: staging: imx: Drop custom .unsubscribe_event() handler
      media: ipu6: isys: Use v4l2_ctrl_subdev_subscribe_event()
      media: staging/ipu7: Use v4l2_ctrl_subdev_subscribe_event()
      media: mc: Fix MUST_CONNECT handling for pads with no links
      media: mc: Improve unconnected pads debugging message in link explora=
tion
      media: v4l2-common: Constify media_pad argument to v4l2_get_link_freq=
()
      media: imx-mipi-csis: Simplify access to source pad
      media: imx-mipi-csis: Standardize const keyword placement
      media: imx-mipi-csis: Shorten name of subdev state variables
      media: imx-mipi-csis: Rename register macros to match reference manual
      media: imx-mipi-csis: Use GENMASK for all register field masks
      media: imx-mipi-csis: Fix field alignment in register dump
      media: imx-mipi-csis: Log per-lane start of transmission errors
      media: imx-mipi-csis: Only set clock rate when specified in DT
      dt-bindings: media: nxp,imx-mipi-csi2: Mark clock-frequency as deprec=
ated
      dt-bindings: media: nxp,imx-mipi-csi2: Add fsl,num-channels property
      media: imx-mipi-csis: Initial support for multiple output channels
      media: nxp: imx8-isi: Drop mxc_isi_video.is_streaming field
      media: nxp: imx8-isi: Drop unused argument to mxc_isi_channel_chain()
      media: nxp: imx8-isi: m2m: Delay power up until streamon
      dt-bindings: media: rkisp1: Require pclk clock on i.MX8MP variant
      dt-bindings: media: rkisp1: Add second power domain on i.MX8MP
      media: rkisp1: Refactor clocks initialization
      media: rkisp1: Acquire pclk clock on i.MX8MP
      media: rkisp1: Add support for multiple power domains
      dt-bindings: media: Deprecate clock-frequency property for camera sen=
sors
      dt-bindings: media: et8ek8: Deprecate clock-frequency property
      dt-bindings: media: imx258: Make clocks property required
      dt-bindings: media: imx274: Make clocks property required
      media: i2c: mt9v022: Drop unused mt9v022.h header
      media: i2c: mt9v032: Replace client->dev usage
      media: i2c: mt9v032: Drop support for platform data
      media: i2c: mt9v111: Do not set clock rate manually
      media: i2c: ov6650: Drop unused driver
      media: i2c: hi556: Replace client->dev usage
      media: i2c: hi556: Use V4L2 sensor clock helper
      media: i2c: hi847: Replace client->dev usage
      media: i2c: hi847: Use V4L2 sensor clock helper
      media: i2c: imx208: Replace client->dev usage
      media: i2c: imx208: Use V4L2 sensor clock helper
      media: i2c: imx319: Replace client->dev usage
      media: i2c: imx319: Use V4L2 sensor clock helper
      media: i2c: imx355: Replace client->dev usage
      media: i2c: imx335: Use V4L2 sensor clock helper
      media: i2c: og01a1b: Replace client->dev usage
      media: i2c: og01a1b: Use V4L2 sensor clock helper
      media: i2c: ov02c10: Replace client->dev usage
      media: i2c: ov02c10: Use V4L2 sensor clock helper
      media: i2c: ov02e10: Replace client->dev usage
      media: i2c: ov02e10: Use V4L2 sensor clock helper
      media: i2c: ov08d10: Replace client->dev usage
      media: i2c: ov08d10: Use V4L2 sensor clock helper
      media: i2c: ov08x40: Replace client->dev usage
      media: i2c: ov08x40: Use V4L2 sensor clock helper
      media: i2c: ov13858: Replace client->dev usage
      media: i2c: ov13858: Use V4L2 sensor clock helper
      media: i2c: ov13b10: Replace client->dev usage
      media: i2c: ov13b10: Use V4L2 sensor clock helper
      media: i2c: ov2740: Replace client->dev usage
      media: i2c: ov2740: Use V4L2 sensor clock helper
      media: i2c: ov4689: Use V4L2 sensor clock helper
      media: i2c: ov5670: Replace client->dev usage
      media: i2c: ov5670: Use V4L2 sensor clock helper
      media: i2c: ov5675: Replace client->dev usage
      media: i2c: ov5675: Use V4L2 sensor clock helper
      media: i2c: ov5693: Use V4L2 sensor clock helper
      media: i2c: ov7251: Use V4L2 sensor clock helper
      media: i2c: ov9734: Replace client->dev usage
      media: i2c: ov9734: Use V4L2 sensor clock helper
      media: v4l2-common: Add legacy camera sensor clock helper
      media: i2c: et8ek8: Drop support for per-mode external clock frequency
      media: i2c: et8ek8: Use V4L2 legacy sensor clock helper
      media: i2c: gc05a2: Use V4L2 legacy sensor clock helper
      media: i2c: gc08a3: Use V4L2 legacy sensor clock helper
      media: i2c: imx258: Replace client->dev usage
      media: i2c: imx258: Use V4L2 legacy sensor clock helper
      media: i2c: imx290: Use V4L2 legacy sensor clock helper
      media: i2c: ov02a10: Replace client->dev usage
      media: i2c: ov02a10: Use V4L2 legacy sensor clock helper
      media: i2c: ov2685: Use V4L2 legacy sensor clock helper
      media: i2c: ov5645: Use V4L2 legacy sensor clock helper
      media: i2c: ov5695: Use V4L2 legacy sensor clock helper
      media: i2c: ov8856: Replace client->dev usage
      media: i2c: ov8856: Use V4L2 legacy sensor clock helper
      media: i2c: s5c73m3: Use V4L2 legacy sensor clock helper
      media: i2c: s5k5baf: Use V4L2 legacy sensor clock helper
      media: i2c: s5k6a3: Use V4L2 legacy sensor clock helper
      media: uvcvideo: Drop unneeded memset() in meta device ioctl handlers
      media: uvcvideo: Add missing curly braces
      media: uvcvideo: Move MSXU_CONTROL_METADATA definition to header
      media: vsp1: Export missing vsp1_isp_free_buffer symbol

Liao Yuanhong (2):
      media: imx296: Remove redundant semicolons
      media: chips-media: wave5: Remove redundant ternary operators

Loic Poulain (7):
      dt-bindings: media: Add qcom,qcm2290-camss
      media: qcom: camss: Add support for TFE (Spectra 340)
      media: qcom: camss: Add CSID 340 support
      media: qcom: camss: csiphy-3ph: Add CSIPHY 2ph DPHY v2.0.1 init seque=
nce
      media: qcom: camss: add support for QCM2290 camss
      media: qcom: camss: Add missing header bitfield.h
      media: qcom: camss: vfe: Fix BPL alignment for QCM2290

Lukas Bulwahn (1):
      MAINTAINERS: merge sections for ROCKCHIP VIDEO DECODER DRIVER

Ma Ke (1):
      media: lirc: Fix error handling in lirc_register()

Markus Elfring (1):
      media: stk1160: Use usb_endpoint_is_isoc_in() rather than duplicating=
 its implementation

Martin T=C5=AFma (1):
      media: pci: mgb4: Fix timings comparison in VIDIOC_S_DV_TIMINGS

Mathis Foerst (2):
      media: mt9m114: Allow set_selection while streaming
      media: mt9m114: Set pad-slew-rate

Mehdi Djait (49):
      media: v4l2-common: Add a helper for obtaining the clock producer
      media: i2c: Kconfig: Ensure a dependency on HAVE_CLK for VIDEO_CAMERA=
_SENSOR
      Documentation: media: camera-sensor: Mention v4l2_devm_sensor_clk_get=
() for obtaining the clock
      media: i2c: ar0521: Use the v4l2 helper for obtaining the clock
      media: i2c: et8ek8: Use the v4l2 helper for obtaining the clock
      media: i2c: gc05a2: Use the v4l2 helper for obtaining the clock
      media: i2c: gc08a3: Use the v4l2 helper for obtaining the clock
      media: i2c: gc2145: Use the v4l2 helper for obtaining the clock
      media: i2c: hi846: Use the v4l2 helper for obtaining the clock
      media: i2c: imx214: Use the v4l2 helper for obtaining the clock
      media: i2c: imx219: Use the v4l2 helper for obtaining the clock
      media: i2c: imx283: Use the v4l2 helper for obtaining the clock
      media: i2c: imx290: Use the v4l2 helper for obtaining the clock
      media: i2c: imx296: Use the v4l2 helper for obtaining the clock
      media: i2c: imx334: Use the v4l2 helper for obtaining the clock
      media: i2c: imx335: Use the v4l2 helper for obtaining the clock
      media: i2c: imx412: Use the v4l2 helper for obtaining the clock
      media: i2c: imx415: Use the v4l2 helper for obtaining the clock
      media: i2c: mt9m001: Use the v4l2 helper for obtaining the clock
      media: i2c: mt9m111: Use the v4l2 helper for obtaining the clock
      media: i2c: mt9m114: Use the v4l2 helper for obtaining the clock
      media: i2c: mt9p031: Use the v4l2 helper for obtaining the clock
      media: i2c: mt9t112: Use the v4l2 helper for obtaining the clock
      media: i2c: mt9v032: Use the v4l2 helper for obtaining the clock
      media: i2c: mt9v111: Use the v4l2 helper for obtaining the clock
      media: i2c: ov02a10: Use the v4l2 helper for obtaining the clock
      media: i2c: ov2659: Use the v4l2 helper for obtaining the clock
      media: i2c: ov2685: Use the v4l2 helper for obtaining the clock
      media: i2c: ov5640: Use the v4l2 helper for obtaining the clock
      media: i2c: ov5645: Use the v4l2 helper for obtaining the clock
      media: i2c: ov5647: Use the v4l2 helper for obtaining the clock
      media: i2c: ov5648: Use the v4l2 helper for obtaining the clock
      media: i2c: ov5695: Use the v4l2 helper for obtaining the clock
      media: i2c: ov64a40: Use the v4l2 helper for obtaining the clock
      media: i2c: ov6650: Use the v4l2 helper for obtaining the clock
      media: i2c: ov7740: Use the v4l2 helper for obtaining the clock
      media: i2c: ov8856: Use the v4l2 helper for obtaining the clock
      media: i2c: ov8858: Use the v4l2 helper for obtaining the clock
      media: i2c: ov8865: Use the v4l2 helper for obtaining the clock
      media: i2c: ov9282: Use the v4l2 helper for obtaining the clock
      media: i2c: ov9640: Use the v4l2 helper for obtaining the clock
      media: i2c: ov9650: Use the v4l2 helper for obtaining the clock
      media: i2c: s5c73m3: Use the v4l2 helper for obtaining the clock
      media: i2c: s5k5baf: Use the v4l2 helper for obtaining the clock
      media: i2c: s5k6a3: Use the v4l2 helper for obtaining the clock
      media: i2c: vd55g1: Use the v4l2 helper for obtaining the clock
      media: i2c: vd56g3: Use the v4l2 helper for obtaining the clock
      media: i2c: vgxy61: Use the v4l2 helper for obtaining the clock
      media: i2c: ov2680: Use the v4l2 helper for obtaining the clock

Michal Pecio (1):
      media: uvcvideo: Shorten the transfer size non compliance message

Nai-Chen Cheng (1):
      staging: media: ipu3: use string_choices API instead of ternary opera=
tor

Neil Armstrong (2):
      media: iris: fix module removal if firmware download failed
      media: iris: add VPU33 specific encoding buffer calculation

Niklas S=C3=B6derlund (11):
      media: adv7180: Move adv7180_set_power() and init_device()
      media: adv7180: Add missing lock in suspend callback
      media: adv7180: Move state mutex handling outside init_device()
      media: adv7180: Use v4l2-ctrls core to handle s_ctrl locking
      media: adv7180: Setup controls every time the device is reset
      media: adv7180: Power down decoder when configuring the device
      media: adv7180: Split device initialization and reset
      media: adv7180: Remove the s_power callback
      media: adv7180: Do not write format to device in set_fmt
      media: adv7180: Only validate format in s_std
      media: adv7180: Only validate format in querystd

N=C3=ADcolas F. R. A. Prado (1):
      media: platform: mtk-mdp3: Add missing MT8188 compatible to comp_dt_i=
ds

Paul Kocialkowski (5):
      media: uapi: Move colorimetry controls at the end of the file
      media: uapi: Cleanup tab after define in headers
      media: verisilicon: imx8m: Use the default Hantro G1 irq handler
      media: verisilicon: Explicitly disable selection api ioctls for decod=
ers
      media: uapi: v4l2-controls: Cleanup codec definitions

Qianfeng Rong (4):
      media: i2c: mt9v111: fix incorrect type for ret
      media: raspberrypi: use int type to store negative error codes
      media: stm32-dcmi: use int type to store negative error codes
      media: redrat3: use int type to store negative error codes

Randy Dunlap (1):
      media: cec: extron-da-hd-4k-plus: drop external-module make commands

Renjiang Han (1):
      media: venus: pm_helpers: add fallback for the opp-table

Ricardo Ribalda (7):
      media: uvcvideo: Fix comments in uvc_meta_detect_msxu
      media: uvcvideo: Drop stream->mutex
      media: uvcvideo: Move video_device under video_queue
      media: uvcvideo: Use intf instead of udev for printks
      media: uvcvideo: Do not re-reference dev->udev
      media: uvcvideo: Run uvc_ctrl_init_ctrl for all controls
      media: uvcvideo: Support UVC_CROSXU_CONTROL_IQ_PROFILE

Richard Leitner (1):
      media: nxp: imx8-isi: Fix streaming cleanup on release

Sakari Ailus (17):
      media: v4l2-common: Improve devm_v4l2_sensor_clk_get() documentation
      media: vimc: Don't explicitly set bus_info
      media: Documentation: Add a hyphen to list-based
      media: Documentation: Reword split of sensor driver to two classes
      media: MAINTAINERS: Remove Stanislaw from IVCS and IPU6 reviewers
      media: ipu6: isys: Set embedded data type correctly for metadata form=
ats
      media: Documentation: Move streams documentation one level up
      media: MAINTAINERS: Change rcar-jpu maintainer
      media: vim2m: Remove compilation conditional to CONFIG_MEDIA_CONTROLL=
ER
      media: ov02c10: Don't include linux/version.h
      media: uapi: Documentation: Improve column width hints for examples
      media: amlogic: c3-mipi-csi2: Call v4l2_get_link_freq() on source pad
      media: v4l2-common: Drop the workaround from v4l2_get_link_freq()
      media: v4l2-common: Update v4l2_get_link_freq() documentation
      media: mc: Clear minor number reservation at unregistration time
      media: staging: ipu7: Don't include linux/version.h
      media: ov02e10: Remove Jingjing's e-mail address

Sean Young (1):
      media: imon: Remove unused defines

Shravan Chippa (1):
      media: i2c: imx334: add support for additional test patterns

Stephan Gerhold (3):
      media: venus: firmware: Use correct reset sequence for IRIS2
      dt-bindings: media: qcom,sm8550-iris: Add X1E80100 compatible
      media: iris: Fix firmware reference leak and unmap memory after load

Tetsuo Handa (2):
      media: imon: make send_packet() more robust
      media: imon: grab lock earlier in imon_ir_change_protocol()

Thadeu Lima de Souza Cascardo (1):
      media: uvcvideo: Mark invalid entities with id UVC_INVALID_ENTITY_ID

Thomas Fourier (2):
      media: cx18: Add missing check after DMA map
      media: pci: ivtv: Add missing check after DMA map

Thomas Huth (1):
      media: pci/ivtv: Replace GPLv2 boilerplate text with SPDX

Thomas Wei=C3=9Fschuh (1):
      media: platform: mtk-mdp3: don't use %pK through printk

Tomi Valkeinen (1):
      media: v4l2-subdev: Fix alloc failure check in v4l2_subdev_call_state=
_try()

Vikash Garodia (1):
      MAINTAINERS: Update Vikash Garodia's email address

Vikram Sharma (14):
      media: qcom: camss: Rename camss-csid-780.c to camss-csid-gen3.c
      media: qcom: camss: Rename camss-vfe-780.c to camss-vfe-gen3.c
      media: dt-bindings: Add qcom,sa8775p-camss compatible
      media: qcom: camss: Add qcom,sa8775p-camss compatible
      media: qcom: camss: Add support for CSIPHY (v1.3.0)
      media: qcom: camss: Add support for CSID 690
      media: qcom: camss: Add support for VFE 690
      media: qcom: camss: Enumerate resources for lemans(sa8775p)
      media: dt-bindings: Add qcom,qcs8300-camss compatible
      media: qcom: camss: Add qcs8300 compatible
      media: qcom: camss: Add CSIPHY support for QCS8300
      media: qcom: camss: enable csid 690 for qcs8300
      media: qcom: camss: enable vfe 690 for qcs8300
      media: qcom: camss: Enumerate resources for QCS8300

Vladimir Zapolskiy (8):
      media: i2c: og01a1b: Specify monochrome media bus format instead of B=
ayer
      dt-bindings: media: i2c: Add OmniVision OV6211 image sensor
      media: i2c: Add OmniVision OV6211 image sensor driver
      dt-bindings: media: i2c: Add OmniVision OG0VE1B camera sensor
      media: i2c: Add OmniVision OG0VE1B camera sensor
      media: qcom: camss: remove .link_entities callback
      media: qcom: camss: unconditionally set async notifier of subdevices
      media: qcom: camss: remove a check for unavailable CAMSS endpoint

Wolfram Sang (1):
      media: remove unneeded 'fast_io' parameter in regmap_config

Yemike Abhilash Chandra (1):
      MAINTAINERS: Update maintainers of TI VPE and CAL

Yunseong Kim (1):
      media: vim2m: remove unused CLIP macro

Zhang Shurong (1):
      media: rj54n1cb0c: Fix memleak in rj54n1_probe()

 .mailmap                                           |    6 +-
 Documentation/ABI/testing/debugfs-cec-error-inj    |    2 +-
 Documentation/admin-guide/bug-hunting.rst          |    2 +-
 Documentation/admin-guide/media/i2c-cardlist.rst   |    1 -
 Documentation/admin-guide/media/ivtv.rst           |    2 +-
 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml      |    6 +-
 .../devicetree/bindings/media/cec/cec-common.yaml  |    2 +-
 .../devicetree/bindings/media/cec/cec-gpio.yaml    |    2 +-
 .../bindings/media/cec/nvidia,tegra114-cec.yaml    |    2 +-
 .../devicetree/bindings/media/i2c/adi,adv7604.yaml |    2 +-
 .../devicetree/bindings/media/i2c/mipi-ccs.yaml    |    7 +-
 .../bindings/media/i2c/ovti,og0ve1b.yaml           |   97 +
 .../bindings/media/i2c/ovti,ov02a10.yaml           |    3 +-
 .../devicetree/bindings/media/i2c/ovti,ov2735.yaml |  108 +
 .../devicetree/bindings/media/i2c/ovti,ov5645.yaml |    6 +-
 .../devicetree/bindings/media/i2c/ovti,ov6211.yaml |   96 +
 .../devicetree/bindings/media/i2c/ovti,ov7251.yaml |    6 +-
 .../devicetree/bindings/media/i2c/ovti,ov8856.yaml |    3 +-
 .../bindings/media/i2c/samsung,s5k5baf.yaml        |    6 +-
 .../bindings/media/i2c/samsung,s5k6a3.yaml         |    6 +-
 .../devicetree/bindings/media/i2c/sony,imx258.yaml |    1 +
 .../devicetree/bindings/media/i2c/sony,imx274.yaml |    4 +
 .../devicetree/bindings/media/i2c/sony,imx290.yaml |    5 +-
 .../bindings/media/i2c/ti,ds90ub960.yaml           |    3 +
 .../bindings/media/i2c/toshiba,et8ek8.txt          |    8 +-
 .../bindings/media/nxp,imx-mipi-csi2.yaml          |   18 +-
 .../bindings/media/qcom,qcm2290-camss.yaml         |  243 +++
 .../bindings/media/qcom,qcm2290-venus.yaml         |  130 ++
 .../bindings/media/qcom,qcs8300-camss.yaml         |  336 +++
 .../bindings/media/qcom,sa8775p-camss.yaml         |  361 ++++
 .../bindings/media/qcom,sm8550-iris.yaml           |   16 +-
 .../bindings/media/qcom,sm8750-iris.yaml           |  186 ++
 .../devicetree/bindings/media/rockchip-isp1.yaml   |   23 +-
 .../bindings/media/samsung,exynos4212-fimc-is.yaml |    3 +-
 .../devicetree/bindings/media/samsung,fimc.yaml    |    3 +-
 .../devicetree/bindings/media/silabs,si470x.yaml   |    2 +-
 Documentation/driver-api/media/camera-sensor.rst   |   24 +-
 .../driver-api/media/maintainer-entry-profile.rst  |    4 +-
 Documentation/driver-api/media/v4l2-fh.rst         |   59 +-
 .../translations/zh_CN/admin-guide/bug-hunting.rst |    2 +-
 .../zh_CN/video4linux/v4l2-framework.txt           |   16 +-
 .../translations/zh_TW/admin-guide/bug-hunting.rst |    2 +-
 Documentation/userspace-api/media/cec/cec-api.rst  |    2 +-
 .../userspace-api/media/drivers/camera-sensor.rst  |   16 +-
 .../userspace-api/media/drivers/cx2341x-uapi.rst   |    2 +-
 .../media/dvb/fe-diseqc-send-burst.rst             |    2 +-
 .../userspace-api/media/dvb/fe-set-tone.rst        |    2 +-
 .../userspace-api/media/dvb/fe-set-voltage.rst     |    2 +-
 .../media/dvb/fe_property_parameters.rst           |   23 +-
 .../dvb/frontend-property-terrestrial-systems.rst  |    2 +-
 Documentation/userspace-api/media/dvb/intro.rst    |    4 +-
 .../userspace-api/media/dvb/legacy_dvb_audio.rst   |    4 +-
 .../userspace-api/media/v4l/dev-subdev.rst         |   12 +-
 .../userspace-api/media/v4l/metafmt-generic.rst    |    8 +-
 Documentation/userspace-api/media/v4l/v4l2.rst     |    2 +-
 MAINTAINERS                                        |  150 +-
 drivers/gpu/drm/display/drm_dp_cec.c               |    2 +-
 drivers/media/cec/core/cec-core.c                  |    2 +-
 drivers/media/cec/platform/cec-gpio/cec-gpio.c     |    2 +-
 drivers/media/cec/platform/stm32/stm32-cec.c       |    1 -
 .../media/cec/usb/extron-da-hd-4k-plus/Makefile    |    6 -
 .../extron-da-hd-4k-plus/extron-da-hd-4k-plus.c    |    6 +-
 drivers/media/cec/usb/pulse8/pulse8-cec.c          |    4 +-
 drivers/media/cec/usb/rainshadow/rainshadow-cec.c  |    4 +-
 drivers/media/common/b2c2/flexcop-sram.c           |    2 +-
 drivers/media/common/b2c2/flexcop.c                |   22 +-
 drivers/media/common/cx2341x.c                     |    2 +-
 drivers/media/common/videobuf2/videobuf2-v4l2.c    |   12 +-
 drivers/media/dvb-frontends/Kconfig                |    4 +-
 drivers/media/i2c/Kconfig                          |   50 +-
 drivers/media/i2c/Makefile                         |    5 +-
 drivers/media/i2c/adv7180.c                        |  338 +--
 drivers/media/i2c/adv7604.c                        |    2 +-
 drivers/media/i2c/adv7842.c                        |    2 +-
 drivers/media/i2c/ar0521.c                         |    9 +-
 drivers/media/i2c/cx25840/cx25840-core.c           |    4 +-
 drivers/media/i2c/ds90ub913.c                      |   17 +-
 drivers/media/i2c/et8ek8/et8ek8_driver.c           |   34 +-
 drivers/media/i2c/et8ek8/et8ek8_mode.c             |    9 -
 drivers/media/i2c/et8ek8/et8ek8_reg.h              |    1 -
 .../i2c/atomisp-gc0310.c =3D> media/i2c/gc0310.c}    |    0
 drivers/media/i2c/gc05a2.c                         |    8 +-
 drivers/media/i2c/gc08a3.c                         |    8 +-
 drivers/media/i2c/gc2145.c                         |    2 +-
 drivers/media/i2c/hi556.c                          |   92 +-
 drivers/media/i2c/hi846.c                          |   11 +-
 drivers/media/i2c/hi847.c                          |   84 +-
 drivers/media/i2c/imx208.c                         |   91 +-
 drivers/media/i2c/imx214.c                         |  247 ++-
 drivers/media/i2c/imx219.c                         |    6 +-
 drivers/media/i2c/imx258.c                         |  105 +-
 drivers/media/i2c/imx274.c                         |    2 +
 drivers/media/i2c/imx283.c                         |    5 +-
 drivers/media/i2c/imx290.c                         |   27 +-
 drivers/media/i2c/imx296.c                         |    4 +-
 drivers/media/i2c/imx319.c                         |   92 +-
 drivers/media/i2c/imx334.c                         |   15 +-
 drivers/media/i2c/imx335.c                         |    9 +-
 drivers/media/i2c/imx355.c                         |   90 +-
 drivers/media/i2c/imx412.c                         |    9 +-
 drivers/media/i2c/imx415.c                         |    2 +-
 drivers/media/i2c/ir-kbd-i2c.c                     |    6 +-
 drivers/media/i2c/mt9m001.c                        |    5 +-
 drivers/media/i2c/mt9m111.c                        |    5 +-
 drivers/media/i2c/mt9m114.c                        |   75 +-
 drivers/media/i2c/mt9p031.c                        |    9 +-
 drivers/media/i2c/mt9t112.c                        |   11 +-
 drivers/media/i2c/mt9v032.c                        |  105 +-
 drivers/media/i2c/mt9v111.c                        |    9 +-
 drivers/media/i2c/og01a1b.c                        |  115 +-
 drivers/media/i2c/og0ve1b.c                        |  816 ++++++++
 drivers/media/i2c/ov02a10.c                        |   45 +-
 drivers/media/i2c/ov02c10.c                        |  108 +-
 drivers/media/i2c/ov02e10.c                        |  107 +-
 drivers/media/i2c/ov08d10.c                        |   82 +-
 drivers/media/i2c/ov08x40.c                        |   95 +-
 drivers/media/i2c/ov13858.c                        |   69 +-
 drivers/media/i2c/ov13b10.c                        |  110 +-
 drivers/media/i2c/ov2659.c                         |    5 +-
 drivers/media/i2c/ov2680.c                         |   29 +-
 drivers/media/i2c/ov2685.c                         |   16 +-
 drivers/media/i2c/ov2735.c                         | 1109 ++++++++++
 drivers/media/i2c/ov2740.c                         |   91 +-
 drivers/media/i2c/ov4689.c                         |   12 +-
 drivers/media/i2c/ov5640.c                         |    9 +-
 drivers/media/i2c/ov5645.c                         |   13 +-
 drivers/media/i2c/ov5647.c                         |    9 +-
 drivers/media/i2c/ov5648.c                         |   10 +-
 drivers/media/i2c/ov5670.c                         |  105 +-
 drivers/media/i2c/ov5675.c                         |   89 +-
 drivers/media/i2c/ov5693.c                         |   16 +-
 drivers/media/i2c/ov5695.c                         |   16 +-
 drivers/media/i2c/ov6211.c                         |  793 +++++++
 drivers/media/i2c/ov64a40.c                        |    2 +-
 drivers/media/i2c/ov6650.c                         | 1149 -----------
 drivers/media/i2c/ov7251.c                         |   26 +-
 drivers/media/i2c/ov7740.c                         |   11 +-
 drivers/media/i2c/ov8856.c                         |   95 +-
 drivers/media/i2c/ov8858.c                         |    2 +-
 drivers/media/i2c/ov8865.c                         |   50 +-
 drivers/media/i2c/ov9282.c                         |    9 +-
 drivers/media/i2c/ov9640.c                         |    5 +-
 drivers/media/i2c/ov9650.c                         |    5 +-
 drivers/media/i2c/ov9734.c                         |   82 +-
 drivers/media/i2c/rj54n1cb0c.c                     |    9 +-
 drivers/media/i2c/s5c73m3/s5c73m3-core.c           |   19 +-
 drivers/media/i2c/s5c73m3/s5c73m3.h                |    2 -
 drivers/media/i2c/s5k5baf.c                        |   21 +-
 drivers/media/i2c/s5k6a3.c                         |   20 +-
 drivers/media/i2c/saa6752hs.c                      |    2 +-
 drivers/media/i2c/saa7115.c                        |    2 +-
 drivers/media/i2c/saa7127.c                        |    2 +-
 drivers/media/i2c/saa717x.c                        |    2 +-
 drivers/media/i2c/tc358743.c                       |  113 +-
 drivers/media/i2c/tc358743_regs.h                  |   57 +-
 drivers/media/i2c/tda9840.c                        |    2 +-
 drivers/media/i2c/tea6415c.c                       |    2 +-
 drivers/media/i2c/tea6420.c                        |    2 +-
 drivers/media/i2c/ths7303.c                        |    2 +-
 drivers/media/i2c/tlv320aic23b.c                   |    2 +-
 drivers/media/i2c/upd64031a.c                      |    2 +-
 drivers/media/i2c/upd64083.c                       |    2 +-
 drivers/media/i2c/vd55g1.c                         |    4 +-
 drivers/media/i2c/vd56g3.c                         |    2 +-
 drivers/media/i2c/vgxy61.c                         |   26 +-
 drivers/media/i2c/vp27smpx.c                       |    2 +-
 drivers/media/i2c/wm8739.c                         |    2 +-
 drivers/media/i2c/wm8775.c                         |    2 +-
 drivers/media/mc/mc-devnode.c                      |    6 +-
 drivers/media/mc/mc-entity.c                       |    6 +-
 drivers/media/mc/mc-request.c                      |    2 +-
 drivers/media/pci/b2c2/flexcop-pci.c               |    2 +-
 drivers/media/pci/bt8xx/bttv-driver.c              |   14 +-
 drivers/media/pci/bt8xx/bttv-vbi.c                 |    6 +-
 drivers/media/pci/cobalt/cobalt-driver.c           |    2 +-
 drivers/media/pci/cobalt/cobalt-v4l2.c             |   60 +-
 drivers/media/pci/cx18/cx18-audio.c                |    2 +-
 drivers/media/pci/cx18/cx18-audio.h                |    2 +-
 drivers/media/pci/cx18/cx18-av-audio.c             |    2 +-
 drivers/media/pci/cx18/cx18-av-core.c              |    2 +-
 drivers/media/pci/cx18/cx18-av-core.h              |    2 +-
 drivers/media/pci/cx18/cx18-av-firmware.c          |    2 +-
 drivers/media/pci/cx18/cx18-av-vbi.c               |    2 +-
 drivers/media/pci/cx18/cx18-cards.c                |    2 +-
 drivers/media/pci/cx18/cx18-cards.h                |    2 +-
 drivers/media/pci/cx18/cx18-controls.c             |    2 +-
 drivers/media/pci/cx18/cx18-controls.h             |    2 +-
 drivers/media/pci/cx18/cx18-driver.c               |    2 +-
 drivers/media/pci/cx18/cx18-driver.h               |    4 +-
 drivers/media/pci/cx18/cx18-fileops.c              |   13 +-
 drivers/media/pci/cx18/cx18-fileops.h              |    2 +-
 drivers/media/pci/cx18/cx18-firmware.c             |    2 +-
 drivers/media/pci/cx18/cx18-firmware.h             |    2 +-
 drivers/media/pci/cx18/cx18-gpio.c                 |    2 +-
 drivers/media/pci/cx18/cx18-gpio.h                 |    2 +-
 drivers/media/pci/cx18/cx18-i2c.c                  |    2 +-
 drivers/media/pci/cx18/cx18-i2c.h                  |    2 +-
 drivers/media/pci/cx18/cx18-io.c                   |    2 +-
 drivers/media/pci/cx18/cx18-io.h                   |    2 +-
 drivers/media/pci/cx18/cx18-ioctl.c                |   66 +-
 drivers/media/pci/cx18/cx18-ioctl.h                |    2 +-
 drivers/media/pci/cx18/cx18-irq.c                  |    2 +-
 drivers/media/pci/cx18/cx18-irq.h                  |    2 +-
 drivers/media/pci/cx18/cx18-mailbox.c              |    2 +-
 drivers/media/pci/cx18/cx18-mailbox.h              |    2 +-
 drivers/media/pci/cx18/cx18-queue.c                |   15 +-
 drivers/media/pci/cx18/cx18-queue.h                |    2 +-
 drivers/media/pci/cx18/cx18-scb.c                  |    2 +-
 drivers/media/pci/cx18/cx18-scb.h                  |    2 +-
 drivers/media/pci/cx18/cx18-streams.c              |    2 +-
 drivers/media/pci/cx18/cx18-streams.h              |    2 +-
 drivers/media/pci/cx18/cx18-vbi.c                  |    2 +-
 drivers/media/pci/cx18/cx18-vbi.h                  |    2 +-
 drivers/media/pci/cx18/cx18-version.h              |    2 +-
 drivers/media/pci/cx18/cx18-video.c                |    2 +-
 drivers/media/pci/cx18/cx18-video.h                |    2 +-
 drivers/media/pci/cx18/cx23418.h                   |    2 +-
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c      |    2 +-
 drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c    |    6 +
 drivers/media/pci/intel/ipu6/ipu6-isys-video.c     |    1 -
 drivers/media/pci/ivtv/ivtv-alsa-pcm.c             |    2 -
 drivers/media/pci/ivtv/ivtv-cards.c                |    2 +-
 drivers/media/pci/ivtv/ivtv-cards.h                |    2 +-
 drivers/media/pci/ivtv/ivtv-controls.c             |    2 +-
 drivers/media/pci/ivtv/ivtv-controls.h             |    2 +-
 drivers/media/pci/ivtv/ivtv-driver.c               |   17 +-
 drivers/media/pci/ivtv/ivtv-driver.h               |   24 +-
 drivers/media/pci/ivtv/ivtv-fileops.c              |   42 +-
 drivers/media/pci/ivtv/ivtv-fileops.h              |    2 +-
 drivers/media/pci/ivtv/ivtv-firmware.c             |    2 +-
 drivers/media/pci/ivtv/ivtv-firmware.h             |    2 +-
 drivers/media/pci/ivtv/ivtv-gpio.c                 |    2 +-
 drivers/media/pci/ivtv/ivtv-gpio.h                 |    2 +-
 drivers/media/pci/ivtv/ivtv-i2c.c                  |    2 +-
 drivers/media/pci/ivtv/ivtv-i2c.h                  |    2 +-
 drivers/media/pci/ivtv/ivtv-ioctl.c                |  126 +-
 drivers/media/pci/ivtv/ivtv-ioctl.h                |    2 +-
 drivers/media/pci/ivtv/ivtv-irq.c                  |    8 +-
 drivers/media/pci/ivtv/ivtv-irq.h                  |    2 +-
 drivers/media/pci/ivtv/ivtv-mailbox.c              |    2 +-
 drivers/media/pci/ivtv/ivtv-mailbox.h              |    2 +-
 drivers/media/pci/ivtv/ivtv-queue.c                |    2 +-
 drivers/media/pci/ivtv/ivtv-queue.h                |    2 +-
 drivers/media/pci/ivtv/ivtv-routing.c              |    2 +-
 drivers/media/pci/ivtv/ivtv-routing.h              |    2 +-
 drivers/media/pci/ivtv/ivtv-streams.c              |   17 +-
 drivers/media/pci/ivtv/ivtv-streams.h              |    2 +-
 drivers/media/pci/ivtv/ivtv-udma.c                 |    2 +-
 drivers/media/pci/ivtv/ivtv-udma.h                 |    2 +-
 drivers/media/pci/ivtv/ivtv-vbi.c                  |    2 +-
 drivers/media/pci/ivtv/ivtv-vbi.h                  |    2 +-
 drivers/media/pci/ivtv/ivtv-version.h              |    2 +-
 drivers/media/pci/ivtv/ivtv-yuv.c                  |    8 +-
 drivers/media/pci/mgb4/mgb4_trigger.c              |    2 +-
 drivers/media/pci/mgb4/mgb4_vin.c                  |    3 +-
 drivers/media/pci/saa7134/saa7134-video.c          |    4 +-
 drivers/media/pci/saa7164/saa7164-encoder.c        |   30 +-
 drivers/media/pci/saa7164/saa7164-vbi.c            |   25 +-
 drivers/media/pci/saa7164/saa7164.h                |   10 +
 drivers/media/pci/tw68/tw68-core.c                 |    4 +-
 drivers/media/pci/tw68/tw68-reg.h                  |    2 +-
 drivers/media/pci/tw68/tw68-risc.c                 |    2 +-
 drivers/media/pci/tw68/tw68-video.c                |    2 +-
 drivers/media/pci/tw68/tw68.h                      |    2 +-
 drivers/media/pci/zoran/zoran.h                    |    6 -
 drivers/media/pci/zoran/zoran_card.c               |    4 -
 drivers/media/pci/zoran/zoran_card.h               |    2 -
 drivers/media/pci/zoran/zoran_driver.c             |   35 +-
 drivers/media/platform/allegro-dvt/allegro-core.c  |   33 +-
 .../platform/amlogic/c3/mipi-csi2/c3-mipi-csi2.c   |    7 +-
 drivers/media/platform/amlogic/meson-ge2d/ge2d.c   |   25 +-
 drivers/media/platform/amphion/vpu.h               |    2 +-
 drivers/media/platform/amphion/vpu_v4l2.c          |   22 +-
 drivers/media/platform/amphion/vpu_v4l2.h          |    8 -
 drivers/media/platform/aspeed/aspeed-video.c       |  199 +-
 drivers/media/platform/cadence/cdns-csi2rx.c       |   75 +-
 .../media/platform/chips-media/coda/coda-common.c  |   50 +-
 .../platform/chips-media/wave5/wave5-helper.c      |   10 +-
 .../platform/chips-media/wave5/wave5-helper.h      |    2 +-
 .../platform/chips-media/wave5/wave5-vpu-dec.c     |   23 +-
 .../platform/chips-media/wave5/wave5-vpu-enc.c     |   31 +-
 .../media/platform/chips-media/wave5/wave5-vpu.h   |    5 +
 .../media/platform/imagination/e5010-jpeg-enc.c    |   23 +-
 .../media/platform/imagination/e5010-jpeg-enc.h    |    5 +
 drivers/media/platform/m2m-deinterlace.c           |   26 +-
 drivers/media/platform/marvell/cafe-driver.c       |    2 +-
 .../media/platform/mediatek/jpeg/mtk_jpeg_core.c   |   37 +-
 drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c  |   29 +-
 .../media/platform/mediatek/mdp3/mtk-mdp3-comp.c   |    3 +
 .../media/platform/mediatek/mdp3/mtk-mdp3-core.c   |    2 +-
 .../media/platform/mediatek/mdp3/mtk-mdp3-m2m.c    |   25 +-
 .../media/platform/mediatek/mdp3/mtk-mdp3-vpu.c    |    2 +-
 .../mediatek/vcodec/decoder/mtk_vcodec_dec.c       |   36 +-
 .../mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c   |    9 +-
 .../mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h   |    5 +
 .../mediatek/vcodec/encoder/mtk_vcodec_enc.c       |   37 +-
 .../mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c   |    9 +-
 .../mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h   |    4 +-
 drivers/media/platform/nvidia/tegra-vde/v4l2.c     |   35 +-
 drivers/media/platform/nxp/dw100/dw100.c           |    7 +-
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c     |   45 +-
 drivers/media/platform/nxp/imx-mipi-csis.c         |  353 ++--
 drivers/media/platform/nxp/imx-pxp.c               |    7 +-
 .../media/platform/nxp/imx8-isi/imx8-isi-core.c    |    8 +
 .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |   14 +-
 drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c  |    2 +-
 drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c |  292 ++-
 .../media/platform/nxp/imx8-isi/imx8-isi-pipe.c    |    2 +-
 .../media/platform/nxp/imx8-isi/imx8-isi-video.c   |  156 +-
 drivers/media/platform/nxp/mx2_emmaprp.c           |   24 +-
 drivers/media/platform/qcom/camss/Makefile         |    6 +-
 drivers/media/platform/qcom/camss/camss-csid-340.c |  190 ++
 .../camss/{camss-csid-780.c =3D> camss-csid-gen3.c}  |   34 +-
 .../camss/{camss-csid-780.h =3D> camss-csid-gen3.h}  |    8 +-
 drivers/media/platform/qcom/camss/camss-csid.h     |    3 +-
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     |  175 ++
 drivers/media/platform/qcom/camss/camss-vfe-340.c  |  320 +++
 .../camss/{camss-vfe-780.c =3D> camss-vfe-gen3.c}    |   76 +-
 drivers/media/platform/qcom/camss/camss-vfe.c      |   28 +-
 drivers/media/platform/qcom/camss/camss-vfe.h      |    3 +-
 drivers/media/platform/qcom/camss/camss-video.c    |   43 +-
 drivers/media/platform/qcom/camss/camss.c          |  705 ++++++-
 drivers/media/platform/qcom/camss/camss.h          |    4 +-
 drivers/media/platform/qcom/iris/Makefile          |    5 +-
 drivers/media/platform/qcom/iris/iris_buffer.c     |  222 +-
 drivers/media/platform/qcom/iris/iris_buffer.h     |    7 +-
 drivers/media/platform/qcom/iris/iris_common.c     |  232 +++
 drivers/media/platform/qcom/iris/iris_common.h     |   18 +
 drivers/media/platform/qcom/iris/iris_core.c       |   10 +-
 drivers/media/platform/qcom/iris/iris_core.h       |   20 +-
 drivers/media/platform/qcom/iris/iris_ctrls.c      |  675 +++++-
 drivers/media/platform/qcom/iris/iris_ctrls.h      |   15 +
 drivers/media/platform/qcom/iris/iris_firmware.c   |   15 +-
 drivers/media/platform/qcom/iris/iris_hfi_common.h |    2 +-
 .../platform/qcom/iris/iris_hfi_gen1_command.c     |  482 +++--
 .../platform/qcom/iris/iris_hfi_gen1_defines.h     |  112 +-
 .../platform/qcom/iris/iris_hfi_gen1_response.c    |   60 +-
 .../platform/qcom/iris/iris_hfi_gen2_command.c     |  359 +++-
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |   44 +-
 .../platform/qcom/iris/iris_hfi_gen2_response.c    |   46 +-
 drivers/media/platform/qcom/iris/iris_instance.h   |   24 +
 .../platform/qcom/iris/iris_platform_common.h      |   82 +-
 .../media/platform/qcom/iris/iris_platform_gen2.c  |  609 +++++-
 .../platform/qcom/iris/iris_platform_qcs8300.h     |  352 +++-
 .../platform/qcom/iris/iris_platform_sm8250.c      |  236 ++-
 .../platform/qcom/iris/iris_platform_sm8750.h      |   22 +
 drivers/media/platform/qcom/iris/iris_probe.c      |   37 +-
 drivers/media/platform/qcom/iris/iris_state.c      |    9 +-
 drivers/media/platform/qcom/iris/iris_state.h      |    1 +
 drivers/media/platform/qcom/iris/iris_utils.c      |   36 +
 drivers/media/platform/qcom/iris/iris_utils.h      |    2 +
 drivers/media/platform/qcom/iris/iris_vb2.c        |   58 +-
 drivers/media/platform/qcom/iris/iris_vdec.c       |  251 +--
 drivers/media/platform/qcom/iris/iris_vdec.h       |   13 +-
 drivers/media/platform/qcom/iris/iris_venc.c       |  579 ++++++
 drivers/media/platform/qcom/iris/iris_venc.h       |   27 +
 drivers/media/platform/qcom/iris/iris_vidc.c       |  335 ++-
 drivers/media/platform/qcom/iris/iris_vpu2.c       |    2 +
 drivers/media/platform/qcom/iris/iris_vpu3x.c      |  202 +-
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c |  922 ++++++++-
 drivers/media/platform/qcom/iris/iris_vpu_buffer.h |   24 +-
 drivers/media/platform/qcom/iris/iris_vpu_common.c |   14 +-
 drivers/media/platform/qcom/iris/iris_vpu_common.h |    6 +
 drivers/media/platform/qcom/venus/core.c           |  113 +-
 drivers/media/platform/qcom/venus/core.h           |   22 +-
 drivers/media/platform/qcom/venus/firmware.c       |   38 +-
 drivers/media/platform/qcom/venus/firmware.h       |    2 +
 drivers/media/platform/qcom/venus/helpers.c        |   12 +-
 drivers/media/platform/qcom/venus/hfi_msgs.c       |   11 +-
 drivers/media/platform/qcom/venus/hfi_parser.c     |    2 +-
 drivers/media/platform/qcom/venus/hfi_platform.c   |   23 +-
 drivers/media/platform/qcom/venus/hfi_platform.h   |   34 +-
 .../media/platform/qcom/venus/hfi_platform_v4.c    |  188 +-
 .../media/platform/qcom/venus/hfi_platform_v6.c    |   33 +-
 drivers/media/platform/qcom/venus/hfi_venus.c      |   25 +-
 drivers/media/platform/qcom/venus/hfi_venus_io.h   |    4 +
 drivers/media/platform/qcom/venus/pm_helpers.c     |   11 +-
 drivers/media/platform/qcom/venus/vdec.c           |    5 +-
 drivers/media/platform/qcom/venus/venc.c           |    5 +-
 drivers/media/platform/raspberrypi/rp1-cfe/csi2.c  |    2 +-
 .../media/platform/renesas/rcar-vin/rcar-core.c    |    8 +-
 .../media/platform/renesas/rcar-vin/rcar-v4l2.c    |    2 -
 drivers/media/platform/renesas/rcar_drif.c         |   12 +-
 drivers/media/platform/renesas/rcar_fdp1.c         |   27 +-
 drivers/media/platform/renesas/rcar_jpu.c          |   29 +-
 drivers/media/platform/renesas/renesas-ceu.c       |   10 +-
 .../media/platform/renesas/rzg2l-cru/rzg2l-core.c  |    2 -
 .../media/platform/renesas/rzg2l-cru/rzg2l-cru.h   |    9 -
 .../media/platform/renesas/rzg2l-cru/rzg2l-video.c |   31 +-
 drivers/media/platform/renesas/vsp1/vsp1_drv.c     |   14 +-
 drivers/media/platform/renesas/vsp1/vsp1_histo.c   |    6 +-
 drivers/media/platform/renesas/vsp1/vsp1_video.c   |   18 +-
 drivers/media/platform/renesas/vsp1/vsp1_vspx.c    |    1 +
 drivers/media/platform/rockchip/rga/rga.c          |   30 +-
 drivers/media/platform/rockchip/rga/rga.h          |    5 +
 .../media/platform/rockchip/rkisp1/rkisp1-common.h |   17 +-
 .../media/platform/rockchip/rkisp1/rkisp1-dev.c    |  123 +-
 drivers/media/platform/rockchip/rkvdec/rkvdec.c    |   21 +-
 drivers/media/platform/rockchip/rkvdec/rkvdec.h    |    4 +-
 .../media/platform/samsung/exynos-gsc/gsc-core.h   |    6 +-
 .../media/platform/samsung/exynos-gsc/gsc-m2m.c    |   37 +-
 .../media/platform/samsung/exynos4-is/fimc-core.h  |    5 +-
 .../media/platform/samsung/exynos4-is/fimc-m2m.c   |   19 +-
 .../platform/samsung/s3c-camif/camif-capture.c     |   26 +-
 drivers/media/platform/samsung/s5p-g2d/g2d.c       |   40 +-
 .../media/platform/samsung/s5p-jpeg/jpeg-core.c    |   33 +-
 drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c   |   17 +-
 .../platform/samsung/s5p-mfc/s5p_mfc_cmd_v6.c      |   35 +-
 .../platform/samsung/s5p-mfc/s5p_mfc_common.h      |    6 +-
 .../media/platform/samsung/s5p-mfc/s5p_mfc_dec.c   |   34 +-
 .../media/platform/samsung/s5p-mfc/s5p_mfc_enc.c   |   38 +-
 drivers/media/platform/st/sti/bdisp/bdisp-v4l2.c   |   30 +-
 .../media/platform/st/sti/delta/delta-mjpeg-dec.c  |   20 +-
 drivers/media/platform/st/sti/delta/delta-v4l2.c   |   41 +-
 drivers/media/platform/st/sti/hva/hva-v4l2.c       |   38 +-
 drivers/media/platform/st/sti/hva/hva.h            |    2 -
 drivers/media/platform/st/stm32/dma2d/dma2d.c      |   28 +-
 drivers/media/platform/st/stm32/stm32-csi.c        |    4 +-
 drivers/media/platform/st/stm32/stm32-dcmi.c       |    4 +-
 .../platform/sunxi/sun6i-csi/sun6i_csi_capture.c   |   16 +-
 drivers/media/platform/sunxi/sun8i-di/sun8i-di.c   |   10 +-
 .../platform/sunxi/sun8i-rotate/sun8i_rotate.c     |   10 +-
 .../media/platform/synopsys/hdmirx/snps_hdmirx.c   |    8 +-
 drivers/media/platform/ti/Kconfig                  |    3 +-
 .../media/platform/ti/j721e-csi2rx/j721e-csi2rx.c  |   67 +-
 drivers/media/platform/ti/omap/omap_vout.c         |    6 +-
 drivers/media/platform/ti/omap3isp/ispccdc.c       |    8 +-
 drivers/media/platform/ti/omap3isp/isph3a_aewb.c   |    2 +-
 drivers/media/platform/ti/omap3isp/isph3a_af.c     |    2 +-
 drivers/media/platform/ti/omap3isp/isphist.c       |    2 +-
 drivers/media/platform/ti/omap3isp/ispstat.c       |    7 -
 drivers/media/platform/ti/omap3isp/ispstat.h       |    3 -
 drivers/media/platform/ti/omap3isp/ispvideo.c      |   36 +-
 drivers/media/platform/ti/omap3isp/ispvideo.h      |    6 +-
 drivers/media/platform/ti/vpe/vpe.c                |   21 +-
 drivers/media/platform/verisilicon/hantro.h        |    4 +-
 drivers/media/platform/verisilicon/hantro_drv.c    |   12 +-
 drivers/media/platform/verisilicon/hantro_v4l2.c   |   28 +-
 drivers/media/platform/verisilicon/imx8m_vpu_hw.c  |   20 +-
 drivers/media/platform/xilinx/xilinx-dma.c         |   10 +-
 drivers/media/radio/Kconfig                        |   17 -
 drivers/media/radio/Makefile                       |    1 -
 drivers/media/radio/radio-aimslab.c                |    2 +-
 drivers/media/radio/radio-aztech.c                 |    2 +-
 drivers/media/radio/radio-gemtek.c                 |    2 +-
 drivers/media/radio/radio-isa.c                    |    2 +-
 drivers/media/radio/radio-isa.h                    |    2 +-
 drivers/media/radio/radio-keene.c                  |    4 +-
 drivers/media/radio/radio-miropcm20.c              |    2 +-
 drivers/media/radio/radio-raremono.c               |    4 +-
 drivers/media/radio/radio-rtrack2.c                |    2 +-
 drivers/media/radio/radio-terratec.c               |    2 +-
 drivers/media/radio/radio-wl1273.c                 | 2159 ----------------=
----
 drivers/media/radio/radio-zoltrix.c                |    2 +-
 drivers/media/radio/si4713/radio-platform-si4713.c |   10 +-
 drivers/media/rc/imon.c                            |   99 +-
 drivers/media/rc/lirc_dev.c                        |    9 +-
 drivers/media/rc/redrat3.c                         |    2 +-
 drivers/media/test-drivers/vicodec/vicodec-core.c  |   23 +-
 drivers/media/test-drivers/vim2m.c                 |   23 +-
 drivers/media/test-drivers/vimc/vimc-capture.c     |    4 +-
 drivers/media/test-drivers/vimc/vimc-core.c        |    2 -
 drivers/media/test-drivers/visl/visl-core.c        |    5 +-
 drivers/media/test-drivers/visl/visl.h             |    7 +-
 drivers/media/test-drivers/vivid/vivid-cec.c       |   12 +-
 drivers/media/test-drivers/vivid/vivid-core.c      |  100 +-
 drivers/media/test-drivers/vivid/vivid-radio-rx.c  |   12 +-
 drivers/media/test-drivers/vivid/vivid-radio-rx.h  |    8 +-
 drivers/media/test-drivers/vivid/vivid-radio-tx.c  |    8 +-
 drivers/media/test-drivers/vivid/vivid-radio-tx.h  |    4 +-
 drivers/media/test-drivers/vivid/vivid-sdr-cap.c   |   18 +-
 drivers/media/test-drivers/vivid/vivid-sdr-cap.h   |   18 +-
 drivers/media/test-drivers/vivid/vivid-vbi-cap.c   |   10 +-
 drivers/media/test-drivers/vivid/vivid-vbi-cap.h   |    8 +-
 drivers/media/test-drivers/vivid/vivid-vbi-out.c   |    8 +-
 drivers/media/test-drivers/vivid/vivid-vbi-out.h   |    6 +-
 drivers/media/test-drivers/vivid/vivid-vid-cap.c   |   24 +-
 drivers/media/test-drivers/vivid/vivid-vid-cap.h   |   24 +-
 .../media/test-drivers/vivid/vivid-vid-common.c    |    8 +-
 .../media/test-drivers/vivid/vivid-vid-common.h    |    8 +-
 drivers/media/test-drivers/vivid/vivid-vid-out.c   |   16 +-
 drivers/media/test-drivers/vivid/vivid-vid-out.h   |   16 +-
 drivers/media/tuners/xc4000.c                      |    8 +-
 drivers/media/tuners/xc5000.c                      |   14 +-
 drivers/media/usb/au0828/au0828-video.c            |    5 +-
 drivers/media/usb/cx231xx/cx231xx-417.c            |    2 +-
 drivers/media/usb/em28xx/Kconfig                   |    1 +
 drivers/media/usb/em28xx/em28xx-dvb.c              |    4 +-
 drivers/media/usb/gspca/gspca.c                    |   18 +-
 drivers/media/usb/hdpvr/hdpvr-video.c              |   69 +-
 drivers/media/usb/pvrusb2/pvrusb2-v4l2.c           |   69 +-
 drivers/media/usb/stk1160/stk1160-core.c           |    3 +-
 drivers/media/usb/stk1160/stk1160-video.c          |    7 +-
 drivers/media/usb/uvc/uvc_ctrl.c                   |   56 +-
 drivers/media/usb/uvc/uvc_driver.c                 |  115 +-
 drivers/media/usb/uvc/uvc_entity.c                 |    4 +-
 drivers/media/usb/uvc/uvc_metadata.c               |   71 +-
 drivers/media/usb/uvc/uvc_status.c                 |    7 +-
 drivers/media/usb/uvc/uvc_v4l2.c                   |  128 +-
 drivers/media/usb/uvc/uvc_video.c                  |   10 +-
 drivers/media/usb/uvc/uvcvideo.h                   |   21 +-
 drivers/media/v4l2-core/v4l2-common.c              |   90 +-
 drivers/media/v4l2-core/v4l2-compat-ioctl32.c      |   11 +-
 drivers/media/v4l2-core/v4l2-ctrls-api.c           |   13 +-
 drivers/media/v4l2-core/v4l2-ctrls-core.c          |    2 +-
 drivers/media/v4l2-core/v4l2-ctrls-defs.c          |    2 +-
 drivers/media/v4l2-core/v4l2-ctrls-priv.h          |    2 +-
 drivers/media/v4l2-core/v4l2-ctrls-request.c       |    2 +-
 drivers/media/v4l2-core/v4l2-dev.c                 |   45 +-
 drivers/media/v4l2-core/v4l2-device.c              |    2 +-
 drivers/media/v4l2-core/v4l2-dv-timings.c          |    4 +
 drivers/media/v4l2-core/v4l2-fh.c                  |   16 +-
 drivers/media/v4l2-core/v4l2-ioctl.c               |  456 ++---
 drivers/media/v4l2-core/v4l2-mem2mem.c             |   50 +-
 drivers/media/v4l2-core/v4l2-subdev.c              |   40 +-
 drivers/staging/media/atomisp/i2c/Kconfig          |    9 -
 drivers/staging/media/atomisp/i2c/Makefile         |    1 -
 drivers/staging/media/atomisp/pci/atomisp_subdev.c |    9 +-
 .../media/atomisp/pci/runtime/bufq/src/bufq.c      |    4 +-
 drivers/staging/media/imx/imx-media-csc-scaler.c   |   26 +-
 drivers/staging/media/imx/imx-media-csi.c          |    8 +-
 drivers/staging/media/ipu3/ipu3-css.c              |    3 +-
 drivers/staging/media/ipu3/ipu3-v4l2.c             |    5 +-
 drivers/staging/media/ipu7/ipu7-isys-csi2.c        |    2 +-
 drivers/staging/media/ipu7/ipu7-isys-queue.c       |    3 +-
 drivers/staging/media/ipu7/ipu7-isys-subdev.c      |   35 +-
 drivers/staging/media/ipu7/ipu7-isys-subdev.h      |    1 -
 drivers/staging/media/ipu7/ipu7-isys-video.c       |   37 +-
 drivers/staging/media/ipu7/ipu7.c                  |   29 +-
 drivers/staging/media/meson/vdec/vdec.c            |   29 +-
 drivers/staging/media/meson/vdec/vdec.h            |    5 +
 drivers/staging/media/sunxi/cedrus/cedrus.c        |    8 +-
 drivers/staging/media/sunxi/cedrus/cedrus.h        |    5 +
 drivers/staging/media/sunxi/cedrus/cedrus_video.c  |    5 -
 .../media/sunxi/sun6i-isp/sun6i_isp_capture.c      |   16 +-
 .../media/sunxi/sun6i-isp/sun6i_isp_params.c       |    6 +-
 drivers/staging/media/tegra-video/tegra20.c        |    4 +-
 drivers/staging/most/video/video.c                 |   19 +-
 drivers/usb/gadget/function/uvc.h                  |    5 +
 drivers/usb/gadget/function/uvc_v4l2.c             |    8 +-
 include/dt-bindings/media/tvp5150.h                |    2 +-
 include/linux/usb/uvc.h                            |   22 +
 include/linux/videodev2.h                          |    2 +-
 include/media/cadence/cdns-csi2rx.h                |   19 +
 include/media/drv-intf/cx25840.h                   |    2 +-
 include/media/drv-intf/msp3400.h                   |    2 +-
 include/media/i2c/bt819.h                          |    2 +-
 include/media/i2c/cs5345.h                         |    2 +-
 include/media/i2c/cs53l32a.h                       |    2 +-
 include/media/i2c/m52790.h                         |    2 +-
 include/media/i2c/mt9v011.h                        |    2 +-
 include/media/i2c/mt9v022.h                        |   13 -
 include/media/i2c/mt9v032.h                        |   12 -
 include/media/i2c/saa7115.h                        |    2 +-
 include/media/i2c/saa7127.h                        |    2 +-
 include/media/i2c/ths7303.h                        |    2 +-
 include/media/i2c/tvaudio.h                        |    2 +-
 include/media/i2c/upd64031a.h                      |    2 +-
 include/media/i2c/upd64083.h                       |    2 +-
 include/media/i2c/wm8775.h                         |    2 +-
 include/media/media-request.h                      |    2 +-
 include/media/v4l2-common.h                        |  103 +-
 include/media/v4l2-ctrls.h                         |    6 +-
 include/media/v4l2-dev.h                           |    2 +-
 include/media/v4l2-device.h                        |    2 +-
 include/media/v4l2-dv-timings.h                    |    1 +
 include/media/v4l2-fh.h                            |   30 +-
 include/media/v4l2-ioctl.h                         |  238 +--
 include/media/v4l2-mem2mem.h                       |   42 +-
 include/media/v4l2-subdev.h                        |   57 +-
 include/uapi/linux/aspeed-video.h                  |    7 +
 include/uapi/linux/ivtv.h                          |    2 +-
 include/uapi/linux/v4l2-controls.h                 |  121 +-
 include/uapi/linux/v4l2-dv-timings.h               |    2 +-
 include/uapi/linux/videodev2.h                     |   20 +-
 samples/v4l/v4l2-pci-skeleton.c                    |   10 +-
 576 files changed, 16905 insertions(+), 9289 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,og0ve1=
b.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov2735=
.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov6211=
.yaml
 create mode 100644 Documentation/devicetree/bindings/media/qcom,qcm2290-ca=
mss.yaml
 create mode 100644 Documentation/devicetree/bindings/media/qcom,qcm2290-ve=
nus.yaml
 create mode 100644 Documentation/devicetree/bindings/media/qcom,qcs8300-ca=
mss.yaml
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sa8775p-ca=
mss.yaml
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sm8750-iri=
s.yaml
 rename drivers/{staging/media/atomisp/i2c/atomisp-gc0310.c =3D> media/i2c/=
gc0310.c} (100%)
 create mode 100644 drivers/media/i2c/og0ve1b.c
 create mode 100644 drivers/media/i2c/ov2735.c
 create mode 100644 drivers/media/i2c/ov6211.c
 delete mode 100644 drivers/media/i2c/ov6650.c
 create mode 100644 drivers/media/platform/qcom/camss/camss-csid-340.c
 rename drivers/media/platform/qcom/camss/{camss-csid-780.c =3D> camss-csid=
-gen3.c} (88%)
 rename drivers/media/platform/qcom/camss/{camss-csid-780.h =3D> camss-csid=
-gen3.h} (84%)
 create mode 100644 drivers/media/platform/qcom/camss/camss-vfe-340.c
 rename drivers/media/platform/qcom/camss/{camss-vfe-780.c =3D> camss-vfe-g=
en3.c} (69%)
 create mode 100644 drivers/media/platform/qcom/iris/iris_common.c
 create mode 100644 drivers/media/platform/qcom/iris/iris_common.h
 create mode 100644 drivers/media/platform/qcom/iris/iris_platform_sm8750.h
 create mode 100644 drivers/media/platform/qcom/iris/iris_venc.c
 create mode 100644 drivers/media/platform/qcom/iris/iris_venc.h
 delete mode 100644 drivers/media/radio/radio-wl1273.c
 create mode 100644 include/media/cadence/cdns-csi2rx.h
 delete mode 100644 include/media/i2c/mt9v022.h
 delete mode 100644 include/media/i2c/mt9v032.h

