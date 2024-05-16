Return-Path: <linux-media+bounces-11501-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CED2F8C71CA
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2024 09:02:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E27191C20E6E
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2024 07:02:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F62B2942A;
	Thu, 16 May 2024 07:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DJsjeTah"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F43E22EF3;
	Thu, 16 May 2024 07:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715842926; cv=none; b=mwxfVinFLQrnp0NtZUNDX1Rxn+NFbtyZ0V40D/k2h6QsElsVAguwJgL0WuOdYWyIDb7E+z2+19MXG5hpyvqOfOnD0awpnANR1zAqNWnazJerKzLLkmHzKvUKCTIefbjKlrBNqcchKIMbSizuVWXLFbexKeGGk+vGdjBj/OHm42w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715842926; c=relaxed/simple;
	bh=yNGca3xYlB366jh0ht640UFdJ+28JkFGcDjDAjVxH0I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ifOxpBqLYvQSkdEmbX5BAms9zgYcqSsH9QjENvdstfhipidfnhYsdBO9bXcXYMDAPCWDZr75h6Yx0uEN1MukaId6b6ozHq3Dw/p/bs2p2ZW/dQBVPjPkvmN88/7GcLlexnbepY3MATEhgGammhkICAZF0U9nR14UIEymFvHQkgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DJsjeTah; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B59B3C113CC;
	Thu, 16 May 2024 07:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715842926;
	bh=yNGca3xYlB366jh0ht640UFdJ+28JkFGcDjDAjVxH0I=;
	h=Date:From:To:Cc:Subject:From;
	b=DJsjeTah3yEp8E2LgPiR1wX7f0hV/q0pQ/IDFqS9TW3WTdQveFd7EUI0wuf9oQmqs
	 8lix1d0ZjpAEc5wjYwZ0rkyEdu72/s1Ws6Z8Wst6GMI3XBi6mB6t0Kgw+5i+sUwjow
	 V/faZxkID4CqLoyHdSqEIseCyGealYP0ZO0i1qEFujKMGZkdBwF0dIlmi0CrfF4l9i
	 6Of/+cPs5SXhmYrFtCUmXulLHhrVPj2VQaRotFLB2fYAfo6q969a00AkSeusClAFP/
	 I4lAR+1f0+ayL6kIWhY2NdsL6ImVdVbsJcnVEF0zYS921k4L3Ej3fhcdkNbANDjUw2
	 sRIKE7Wcg9HnQ==
Date: Thu, 16 May 2024 08:01:59 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton
 <akpm@linux-foundation.org>, Linux Media Mailing List
 <linux-media@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>
Subject: [GIT PULL for v6.10-rc1] media updates
Message-ID: <20240516080159.76e8b45d@sal.lan>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
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
dia/v6.10-1

For:
  - New V4L2 ioctl VIDIOC_REMOVE_BUFS;
  - experimental support for using generic metaformats on V4L2 core;
  - New drivers: Intel IPU6 controller driver, Broadcom BCM283x/BCM271x;
  - More cleanups at atomisp driver;
  - Usual bunch of driver cleanups, improvements and fixes.

Regards,
Mauro

---

The following changes since commit 39cd87c4eb2b893354f3b850f916353f2658ae6f:

  Linux 6.9-rc2 (2024-03-31 14:32:39 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/me=
dia/v6.10-1

for you to fetch changes up to 8771b7f31b7fff91a998e6afdb60650d4bac59a5:

  media: bcm2835-unicam: Depend on COMMON_CLK (2024-05-14 08:09:05 +0200)

----------------------------------------------------------------
media updates for v6.10-rc1

----------------------------------------------------------------
Aleksandr Burakov (1):
      media: ngene: Add dvb_ca_en50221_init return value check

Alex Volkov (1):
      media: IR remote control for AVerMedia TD310

Alexander Stein (4):
      media: v4l: async: Fix notifier list entry init
      media: dt-bindings: nxp,imx8-isi: Refuse port@1 for single pipeline m=
odels
      media: dt-bindings: sony,imx290: Allow props from video-interface-dev=
ices
      media: dt-bindings: i2c: use absolute path to other schema

Andrzej Pietrasiewicz (2):
      media: verisilicon Correct a typo in H1_REG_ENC_CTRL2_DEBLOCKING_FILT=
ER_MODE
      media: verisilicon: Correct a typo in H1_REG_MAD_CTRL_MAD_THRESHOLD

Andy Shevchenko (11):
      media: rc: gpio-ir-recv: Remove unused of_gpio.h
      media: c8sectpfe: Remove unused of_gpio.h
      media: ir-spi: Don't use "proxy" headers
      media: ir-spi: Make use of device properties
      media: ir-spi: Utilise temporary variable for struct device
      media: ir-spi: Remove trailing comma in the terminator entry
      media: ir-spi: Unify indentation and comment style
      media: atomisp: Remove unsused macros
      media: atomisp: Put PMIC device after getting its I=C2=B2C address
      media: atomisp: Replace open-coded i2c_find_device_by_fwnode()
      media: atomisp: Get rid of PCI device ID hack check

Arnd Bergmann (1):
      media: rcar-vin: work around -Wenum-compare-conditional warning

Benjamin Gaignard (9):
      media: videobuf2: Update vb2_is_busy() logic
      media: videobuf2: Add min_reqbufs_allocation field to vb2_queue struc=
ture
      media: test-drivers: Set REQBUFS minimum number of buffers
      media: core: Rework how create_buf index returned value is computed
      media: core: Add bitmap manage bufs array entries
      media: core: Free range of buffers
      media: v4l2: Add REMOVE_BUFS ioctl
      media: v4l2: Add mem2mem helpers for REMOVE_BUFS ioctl
      media: verisilicon: Support removing buffers on capture queue

Bingbu Cao (16):
      media: intel/ipu6: add Intel IPU6 PCI device driver
      media: intel/ipu6: add IPU auxiliary devices
      media: intel/ipu6: add IPU6 buttress interface driver
      media: intel/ipu6: CPD parsing for get firmware components
      media: intel/ipu6: add IPU6 DMA mapping API and MMU table
      media: intel/ipu6: add syscom interfaces between firmware and driver
      media: intel/ipu6: input system ABI between firmware and driver
      media: intel/ipu6: add IPU6 CSI2 receiver v4l2 sub-device
      media: intel/ipu6: add the CSI2 DPHY implementation
      media: intel/ipu6: input system video nodes and buffer queues
      media: intel/ipu6: add the main input system driver
      media: intel/ipu6: add Kconfig and Makefile
      media: MAINTAINERS: add maintainers for Intel IPU6 input system driver
      media: intel/ipu6: support line-based metadata capture support
      media: Documentation: add Intel IPU6 ISYS driver admin-guide doc
      media: Documentation: add documentation of Intel IPU6 driver and hard=
ware overview

Bjorn Helgaas (1):
      media: ipu-cio2: Remove unnecessary runtime PM power state setting

Bryan O'Donoghue (6):
      media: dt-bindings: media: camss: Add qcom,sc8280xp-camss binding
      media: qcom: camss: csiphy-3ph: Add Gen2 v1.1 two-phase MIPI CSI-2 DP=
HY init
      media: qcom: camss: Add CAMSS_SC8280XP enum
      media: qcom: camss: Add sc8280xp resources
      media: qcom: camss: Add sc8280xp support
      media: qcom: camss: vfe-17x: Rename camss-vfe-170 to camss-vfe-17x

Changhuang Liang (2):
      staging: media: starfive: Remove links when unregistering devices
      media: staging: media: starfive: Clean pad selection in isp_try_forma=
t()

Colin Ian King (2):
      staging: media: ipu3: remove redundant assignment to pointer css_pipe
      media: media: intel/ipu6: Fix spelling mistake "remappinp" -> "remapp=
ing"

Dan Carpenter (2):
      media: stk1160: fix bounds checking in stk1160_copy_video()
      media: bcm2835-unicam: Fix a NULL vs IS_ERR() check

Dave Stevenson (2):
      dt-bindings: media: Add bindings for bcm2835-unicam
      media: bcm2835-unicam: Add support for CCP2/CSI2 camera interface

Devarsh Thakkar (1):
      media: chips-media: wave5: Add hrtimer based polling support

Dongliang Mu (1):
      media: flexcop-usb: fix sanity check of bNumEndpoints

Eugen Hristev (1):
      media: mediatek: vcodec: fix possible unbalanced PM counter

Fabio Estevam (6):
      media: ov2680: Clear the 'ret' variable on success
      media: ov2680: Allow probing if link-frequencies is absent
      media: dt-bindings: ovti,ov2680: Fix the power supply names
      media: dt-bindings: ovti,ov2680: Document link-frequencies
      media: ov2680: Do not fail if data-lanes property is absent
      media: dt-bindings: nxp,imx8-jpeg: Add clocks entries

Fei Shao (4):
      media: mediatek: vcodec: Replace dev_name in error string
      media: mediatek: vcodec: Drop unnecessary variable
      media: mediatek: vcodec: Update mtk_vcodec_mem_free() error messages
      media: mediatek: vcodec: Only free buffer VA that is not NULL

Fullway Wang (1):
      media: mtk-vcodec: potential null pointer deference in SCP

Hans Verkuil (16):
      Merge tag 'v6.9-rc2' into media_stage
      media: v4l2-ctrls: add support for area type logging
      Merge tag 'tags/media-next-imx-20240419' of git://git.kernel.org/pub/=
scm/linux/kernel/git/pinchartl/linux.git into media_stage
      media: mc: mark the media devnode as registered from the, start
      Merge tag 'tags/media-next-uvc-20240419' of git://git.kernel.org/pub/=
scm/linux/kernel/git/pinchartl/linux.git into media_stage
      media: v4l2-core: hold videodev_lock until dev reg, finishes
      media: cec: return -ENODEV instead of -ENXIO if unregistered
      doc: media: v4l/func-open.rst: ENXIO should be ENODEV
      media: videobuf2: improve max_num_buffers sanity checks
      media: cec: cec.h: 2.1 ms -> 2100 ms
      media: cec: cec-adap: always cancel work in cec_transmit_msg_fh
      media: cec: cec-api: add locking in cec_release()
      media: cec: core: avoid recursive cec_claim_log_addrs
      media: cec: core: avoid confusing "transmit timed out" message
      Merge tag 'media-fixes-unicam-20240510' of https://git.kernel.org/pub=
/scm/linux/kernel/git/pinchartl/linux into media_stage
      Revert "media: v4l2-ctrls: show all owned controls in log_status"

Hans de Goede (48):
      media: atomisp: Fix double negation in unsupported revision error
      media: atomisp: Remove isp_subdev_propagate()
      media: atomisp: Rename atomisp_set_crop_and_fmt()
      media: atomisp: Remove custom VCM handling
      media: atomisp: Remove ISP controls which get passed through to the c=
amera
      media: atomisp: Stop setting sd->devnode for the ATOMISP_SUBDEV v4l2-=
subdev
      media: atomisp: Add DMABUF support
      media: atomisp: Change ISP subdev name to "ATOM ISP"
      media: atomisp: Make MC link from ISP to /dev/video# output node immu=
table
      media: atomisp: Implement link_setup() op for ISP subdev MC entity
      media: ov2680: Stop sending more data then requested
      media: ov2680: Drop hts, vts ov2680_mode struct members
      media: ov2680: Add vblank control
      media: ov2680: Add hblank control
      media: ov2680: Add camera orientation and sensor rotation controls
      media: hi556: Return -EPROBE_DEFER if no endpoint is found
      media: hi556: Add support for reset GPIO
      media: hi556: Add support for external clock
      media: hi556: Add support for avdd regulator
      media: atomisp: Drop second V4L2_PIX_FMT_UYVY atomisp_output_fmts[] e=
ntry
      media: atomisp: Replace V4L2_PIX_FMT_RGB32 with V4L2_PIX_FMT_RGBX32
      media: atomisp: Disable broken V4L2_PIX_FMT_RGBX32 output support
      media: atomisp: Initialize sequence counters to 0 instead of -1
      media: atomisp: Add atomisp_s_sensor_power() helper
      media: atomisp: Turn on sensor power from atomisp_set_fmt()
      media: atomisp: Add atomisp_select_input() helper
      media: atomisp: Simplify atomisp_s_input() input argument checking
      media: atomisp: Ensure CSI-receiver[x] -> ISP links correctly reflect=
 current sensor
      media: atomisp: Propagate set_fmt on sensor results to CSI port
      media: atomisp: Propagate v4l2_mbus_framefmt.field to CSI port sink p=
ad
      media: atomisp: Call media_pipeline_alloc_start() in stream start
      media: atomisp: Drop atomisp_pipe_check() from atomisp_link_setup()
      media: atomisp: ov2722: Remove power on sensor from set_fmt() callback
      media: atomisp: Remove test pattern generator (TPG) support
      media: atomisp: Remove input_port_ID_t
      media: atomisp: Drop the atomisp custom lm3554 flash driver
      media: atomisp: Drop custom flash support
      media: atomisp: Drop unused frame_status tracking
      media: atomisp: Drop intel_v4l2_subdev_type
      media: atomisp: Remove gmin_platform VCM code.
      media: atomisp: Remove struct atomisp_platform_data
      media: atomisp: Remove clearing of ISP crop / compose rectangles on f=
ile release
      media: atomisp: Remove empty s_power() op from ISP subdev
      media: atomisp: Remove empty s_stream() op from CSI subdev
      media: atomisp: Cleanup atomisp_isr_thread() spinlock handling
      media: atomisp: Remove setting of f->fmt.pix.priv from atomisp_set_fm=
t()
      media: atomisp: Fix sh_css_config_input_network_2400() coding style
      media: ov2740: Ensure proper reset sequence on probe()

Ihor Matushchak (1):
      media: staging: max96712: fix copy-paste error

Istv=C3=A1n V=C3=A1radi (1):
      media: anysee: accept read buffers of length 1 in anysee_master_xfer

Jacopo Mondi (1):
      media: v4l2-common: Add Y210 and Y216 format info

Jai Luthra (1):
      media: ti: j721e-csi2rx: Fix races while restarting DMA

Jean-Michel Hautbois (2):
      media: v4l: Add V4L2-PIX-FMT-Y12P format
      media: v4l: Add V4L2-PIX-FMT-Y14P format

Jonathan Bergh (10):
      media: staging: media: atomisp: Fix various formatting issues and rem=
ove unneccesary braces
      media: staging: media: atomisp: Fix formatting issues and minor code =
issue
      media: staging: media: atomisp: Remove unnecessary braces from single=
 line conditional statements
      media: staging: media: atomisp: Fixed "unsigned int *" rather than "u=
nsigned *" declaration in variable declaration
      media: staging: media: atomisp: Ensure trailing statements are on a n=
ewline and remove spurious whitespaces
      media: staging: media: atomisp: Remove unnecessary parentheses from c=
onditional statement
      media: staging: media: atomisp: Remove unneeded return statement from=
 void function
      media: staging: media: atomisp: Remove old commented code and fix mul=
tiple block comment style
      media: staging: media: atomisp: Fix various multiline block comment f=
ormatting instances
      media: staging: media: atomisp: Remove extra whitespace after opening=
 parentheses

Julia Lawall (1):
      media: atomisp-mt9m114: adjust macro parameter name

Kieran Bingham (2):
      media: imx335: Support 2 or 4 lane operation modes
      media: imx335: Parse fwnode properties

Krzysztof Kozlowski (1):
      media: mmc: siano: simplify module initialization

Lad Prabhakar (1):
      media: dt-bindings: media: i2c: Rename ov8856.yaml

Laurent Pinchart (8):
      media: v4l2-subdev: Fix stream handling for crop API
      media: i2c: rdacm20: Fix indentation in comment
      media: i2c: max9271: Add header include guards to max9271.h
      media: v4l2-subdev: Clearly document that the crop API won't be exten=
ded
      media: uapi: v4l: Don't expose generic metadata formats to userspace
      media: bcm2835-unicam: Include v4l2-subdev.h
      media: bcm2835-unicam: Fix driver path in MAINTAINERS
      media: bcm2835-unicam: Depend on COMMON_CLK

Li Zhijian (1):
      media: imon: Convert sprintf/snprintf to sysfs_emit

Martin T=C5=AFma (1):
      media: admin-guide: Fix mgb4 driver documentation structure

Matthijs Kooijman (1):
      media: docs: Fix mem_offset name in multiplane example

Mauro Carvalho Chehab (2):
      media: dw2102: fix coding style issues
      media: dw2102: fix a potential buffer overflow

Michael Bunk (4):
      media: m88ds3103: Fix lock led support
      media: dw2102: Don't translate i2c read into write
      media: dw2102: Dont't list TT Cinergy S2 R4 twice
      media: dw2102: Fix minor issues

Mikhail Rudenko (16):
      media: i2c: ov4689: Clean up and annotate the register table
      media: i2c: ov4689: Sort register definitions by address
      media: i2c: ov4689: Fix typo in a comment
      media: i2c: ov4689: CCI conversion
      media: i2c: ov4689: Remove i2c_client from ov4689 struct
      media: i2c: ov4689: Refactor ov4689_set_ctrl
      media: i2c: ov4689: Use sub-device active state
      media: i2c: ov4689: Enable runtime PM before registering sub-device
      media: i2c: ov4689: Use runtime PM autosuspend
      media: i2c: ov4689: Remove max_fps field from struct ov4689_mode
      media: i2c: ov4689: Make horizontal blanking configurable
      media: i2c: ov4689: Implement vflip/hflip controls
      media: i2c: ov4689: Implement digital gain control
      media: i2c: ov4689: Implement manual color balance controls
      media: i2c: ov4689: Move pixel array size out of struct ov4689_mode
      media: i2c: ov4689: Set timing registers programmatically

Minghao Chi (1):
      media: si2165: Remove redundant NULL check before release_firmware() =
call

Nathan Chancellor (1):
      media: mxl5xx: Move xpt structures off stack

Oliver Neukum (3):
      media: as102: avoid GFP_ATOMIC
      media: flexcop: unneeded ATOMIC
      media: flexcop: allow for modern speeds

Pawe=C5=82 Anikiel (17):
      media: v4l2-subdev: Add pad versions of dv timing subdev calls
      media: i2c: adv748x: Switch dv timing callbacks to pad ops
      media: i2c: adv7511: Switch dv timing callbacks to pad ops
      media: i2c: adv7604: Switch dv timing callbacks to pad ops
      media: i2c: adv7842: Switch dv timing callbacks to pad ops
      media: i2c: tc358743: Switch dv timing callbacks to pad ops
      media: i2c: tda1997x: Switch dv timing callbacks to pad ops
      media: i2c: ths7303: Switch dv timing callbacks to pad ops
      media: i2c: ths8200: Switch dv timing callbacks to pad ops
      media: i2c: tvp7002: Switch dv timing callbacks to pad ops
      media: spi: gs1662: Switch dv timing callbacks to pad ops
      media: cobalt: Use pad variant of dv timing subdev calls
      media: rcar-vin: Use pad variant of dv timing subdev calls
      media: vpif_capture: Use pad variant of dv timing subdev calls
      media: vpif_display: Use pad variant of dv timing subdev calls
      media: tegra-video: Use pad variant of dv timing subdev calls
      media: v4l2-subdev: Remove non-pad dv timing callbacks

Prasad Pandit (1):
      media: cxd2880: Add terminating new line to Kconfig

Pratyush Yadav (1):
      media: cadence: csi2rx: configure DPHY before starting source stream

Rajeshwar R Shinde (1):
      staging: media: imx: Remove duplicate Kconfig dependency

Randy Dunlap (1):
      media: sunxi: a83-mips-csi2: also select GENERIC_PHY

Ricardo B. Marliere (1):
      media: lirc_dev: Make lirc_class constant

Ricardo Ribalda (52):
      staging: media: tegra-video: Fix -Wmaybe-unitialized warn in gcc
      media: radio-shark2: Avoid led_names truncations
      media: dvbdev: Initialize sbuf
      media: c8sectpfe: Do not depend on DEBUG_FS
      media: dvb: as102-fe: Fix as10x_register_addr packing
      media: dvb: Fix dtvs_stats packing.
      media: videodev2: Fix v4l2_ext_control packing.
      media: solo6x10: Use pcim functions
      media: solo6x10: Use devm functions
      media: saa7134: Use devm_request_irq
      media: c8sectpfe: Refactor load_c8sectpfe_fw
      media: tunner: xc5000: Refactor firmware load
      media: dvb-frontends: drx39xyj: Refactor firmware upload
      media: dvb-usb: dib0700_devices: Add missing release_firmware()
      media: cxd2880: Replaze kmalloc with kzalloc
      media: platform: sti: hva: clk_unprepare unconditionally
      media: v4l2-ctrls-core.c: Do not use iterator outside loop
      media: adv7180: Only request valids IRQs
      media: usb: siano: Fix allocation of urbs
      media: uvcvideo: Add quirk for Logitech Rally Bar
      media: uvcvideo: Fix power line control for Shine-Optics Camera
      media: uvcvideo: Disable autosuspend for Insta360 Link
      media: bcm2835-unicam: Fix build with !PM
      media: intel/ipu6: Switch to RUNTIME_PM_OPS() and SYSTEM_SLEEP_PM_OPS
      media: intel/ipu6: Fix build with !ACPI
      media: intel/ipu6: Fix direct dependency Kconfig error
      media: pci: mgb4: Refactor struct resources
      media: stb0899: Simplify check
      media: uvcvideo: Use max() macro
      media: go7007: Use min and max macros
      media: stm32-dcmipp: Remove redundant printk
      media: staging: sun6i-isp: Remove redundant printk
      media: dvb-frontends: tda18271c2dd: Remove casting during div
      media: staging: media: tegra-video: Use swap macro
      media: s2255: Use refcount_t instead of atomic_t for num_channels
      media: platform: mtk-mdp3: Use refcount_t for job_count
      media: common: saa7146: Use min macro
      media: dvb-frontends: drx39xyj: Use min macro
      media: netup_unidvb: Use min macro
      media: au0828: Use umin macro
      media: flexcop-usb: Use min macro
      media: gspca: cpia1: Use min macro
      media: stk1160: Use min macro
      media: tegra-vde: Refactor timeout handling
      media: i2c: st-mipid02: Use the correct div function
      media: tc358746: Use the correct div_ function
      media: dvb-frontends: tda10048: Fix integer overflow
      media: v4l: async: refactor v4l2_async_create_ancillary_links
      media: uvcvideo: Refactor iterators
      media: cec.h: Fix kerneldoc
      media: bcm2835-unicam: Do not replace IRQ retcode during probe
      media: bcm2835-unicam: Do not print error when irq not found

Sakari Ailus (30):
      media: ipu3-cio2: Request IRQ earlier
      media: mc: Add nop implementations of media_device_{init,cleanup}
      media: v4l: async: Don't set notifier's V4L2 device if registering fa=
ils
      media: v4l: async: Properly re-initialise notifier entry in unregister
      media: ov2740: Fix LINK_FREQ and PIXEL_RATE control value reporting
      media: ipu3-cio2: Update e-mail addresses
      media: dw9714: Update e-mail addresses
      staging: media: ipu3-imgu: Update e-mail addresses
      media: v4l: Don't turn on privacy LED if streamon fails
      media: staging: ipu3-imgu: Update firmware path
      media: v4l2-ctrls: Return handler error in creating new fwnode proper=
ties
      media: v4l: Set sub-device's owner field to the caller's module
      media: v4l: async: Set owner for async sub-devices
      media: Documentation: Add "stream" into glossary
      media: uapi: Add generic serial metadata mbus formats
      media: uapi: Document which mbus format fields are valid for metadata
      media: uapi: v4l: Add generic 8-bit metadata format definitions
      media: v4l: Support line-based metadata capture
      media: v4l: Set line based metadata flag in V4L2 core
      media: Documentation: Additional streams generally don't harm capture
      media: Documentation: Document S_ROUTING behaviour
      media: v4l: subdev: Add a function to lock two sub-device states, use=
 it
      media: v4l: subdev: Copy argument back to user also for S_ROUTING
      media: v4l: subdev: Add len_routes field to struct v4l2_subdev_routing
      media: v4l: subdev: Return routes set using S_ROUTING
      media: v4l: subdev: Add trivial set_routing support
      media: ipu6: Add PCI device table header
      media: ivsc: csi: Use IPU bridge
      media: intel/ipu6: Don't re-allocate memory for firmware
      media: intel/ipu6: Don't print user-triggerable errors to kernel log

Sebastian Fricke (3):
      media: mediatek: vcodec: Fix multiple typos
      media: mediatek: vcodec: Improve wording & fix grammatic issues
      media: mediatek: vcodec: Replace false function description

Stefan Herdler (10):
      media: ttpci: coding style fixes: whitespace and newlines
      media: ttpci: coding style fixes: whitespace
      media: ttpci: coding style fixes: comments
      media: ttpci: coding style fixes: braces
      media: ttpci: coding style fixes: export_symbol
      media: ttpci: coding style fixes: assign_in_if
      media: ttpci: coding style fixes: trailing_statements
      media: ttpci: coding style fixes: constant_comparsation
      media: ttpci: coding style fixes: miscellaneous
      media: ttpci: coding style fixes: logging

Stefan Klug (1):
      media: mipi-csis: Emit V4L2_EVENT_FRAME_SYNC events

Stephen Rothwell (1):
      media: intel/ipu6: explicitly include vmalloc.h

Tomi Valkeinen (1):
      media: mc: Fix graph walk in media_pipeline_start

Tzung-Bi Shih (1):
      media: platform: cros-ec: provide ID table for avoiding fallback match

Umang Jain (6):
      media: imx335: Use V4L2 CCI for accessing sensor registers
      media: imx335: Use integer values for size registers
      media: imx335: Fix active area height discrepency
      media: imx335: Limit analogue gain value
      media: imx335: Describe CCI struct member
      media: i2c: imx219: Use dev_err_probe on probe

Uwe Kleine-K=C3=B6nig (3):
      media: staging: media: starfive: camss: Convert to platform remove ca=
llback returning void
      media: i2c: et8ek8: Don't strip remove function when driver is builtin
      media: bcm2835-unicam: Convert to platform remove callback returning =
void

V=C3=ADctor Gonzalo (1):
      media: ipu3: Use MODULE_FIRMWARE to add firmware files metadata

Zheyu Ma (2):
      media: lgdt3306a: Add a check against null-pointer-def
      media: imx214: Fix the error handling in imx214_probe()

Zhipeng Lu (1):
      media: atomisp: ssh_css: Fix a null-pointer dereference in load_video=
_binaries

hanchunchao (1):
      media: docs: Remove the repeated word "the" in docs.

 Documentation/admin-guide/media/ipu6-isys.rst      |  161 ++
 .../admin-guide/media/ipu6_isys_graph.svg          |  548 ++++
 Documentation/admin-guide/media/mgb4.rst           |   35 +-
 Documentation/admin-guide/media/v4l-drivers.rst    |    1 +
 .../bindings/media/brcm,bcm2835-unicam.yaml        |  127 +
 .../bindings/media/i2c/galaxycore,gc0308.yaml      |    2 +-
 .../bindings/media/i2c/galaxycore,gc2145.yaml      |    2 +-
 .../devicetree/bindings/media/i2c/ovti,ov2680.yaml |   35 +-
 .../media/i2c/{ov8856.yaml =3D> ovti,ov8856.yaml}    |    2 +-
 .../devicetree/bindings/media/i2c/sony,imx214.yaml |    2 +-
 .../devicetree/bindings/media/i2c/sony,imx290.yaml |    5 +-
 .../devicetree/bindings/media/i2c/sony,imx415.yaml |    2 +-
 .../devicetree/bindings/media/nxp,imx8-isi.yaml    |    1 +
 .../devicetree/bindings/media/nxp,imx8-jpeg.yaml   |   11 +
 .../bindings/media/qcom,sc8280xp-camss.yaml        |  512 ++++
 Documentation/driver-api/media/drivers/index.rst   |    1 +
 Documentation/driver-api/media/drivers/ipu6.rst    |  205 ++
 .../userspace-api/media/cec/cec-func-open.rst      |    4 +-
 .../userspace-api/media/dvb/frontend_f_open.rst    |    2 +-
 Documentation/userspace-api/media/glossary.rst     |   12 +
 Documentation/userspace-api/media/v4l/dev-meta.rst |   21 +
 .../userspace-api/media/v4l/dev-subdev.rst         |   31 +-
 .../userspace-api/media/v4l/func-open.rst          |    4 +-
 .../userspace-api/media/v4l/meta-formats.rst       |    3 +-
 .../userspace-api/media/v4l/metafmt-generic.rst    |  340 +++
 Documentation/userspace-api/media/v4l/mmap.rst     |    2 +-
 .../userspace-api/media/v4l/pixfmt-yuv-luma.rst    |   48 +
 .../userspace-api/media/v4l/subdev-formats.rst     |  269 +-
 .../userspace-api/media/v4l/user-func.rst          |    1 +
 .../userspace-api/media/v4l/vidioc-enum-fmt.rst    |    7 +
 .../userspace-api/media/v4l/vidioc-remove-bufs.rst |   86 +
 .../userspace-api/media/v4l/vidioc-reqbufs.rst     |    1 +
 .../media/v4l/vidioc-subdev-g-crop.rst             |    6 +-
 .../media/v4l/vidioc-subdev-g-routing.rst          |   51 +-
 .../userspace-api/media/videodev2.h.rst.exceptions |    1 +
 MAINTAINERS                                        |   19 +-
 drivers/media/cec/core/cec-adap.c                  |   24 +-
 drivers/media/cec/core/cec-api.c                   |    5 +-
 drivers/media/cec/core/cec-core.c                  |    4 +-
 drivers/media/cec/platform/cros-ec/cros-ec-cec.c   |    9 +-
 drivers/media/common/saa7146/saa7146_hlp.c         |    8 +-
 drivers/media/common/videobuf2/videobuf2-core.c    |  231 +-
 drivers/media/common/videobuf2/videobuf2-v4l2.c    |   34 +-
 drivers/media/dvb-core/dvbdev.c                    |    2 +-
 drivers/media/dvb-frontends/as102_fe_types.h       |    2 +-
 drivers/media/dvb-frontends/cxd2880/Kconfig        |    2 +-
 drivers/media/dvb-frontends/drx39xyj/drx_driver.h  |    2 -
 drivers/media/dvb-frontends/drx39xyj/drxj.c        |   58 +-
 drivers/media/dvb-frontends/lgdt3306a.c            |    5 +
 drivers/media/dvb-frontends/m88ds3103.c            |    7 +
 drivers/media/dvb-frontends/mxl5xx.c               |   22 +-
 drivers/media/dvb-frontends/si2165.c               |    6 +-
 drivers/media/dvb-frontends/stb0899_drv.c          |    2 +-
 drivers/media/dvb-frontends/tda10048.c             |    9 +-
 drivers/media/dvb-frontends/tda18271c2dd.c         |    4 +-
 drivers/media/i2c/Kconfig                          |    2 +
 drivers/media/i2c/adv7180.c                        |    2 +-
 drivers/media/i2c/adv748x/adv748x-hdmi.c           |   16 +-
 drivers/media/i2c/adv7511-v4l2.c                   |   16 +-
 drivers/media/i2c/adv7604.c                        |   20 +-
 drivers/media/i2c/adv7842.c                        |   25 +-
 drivers/media/i2c/dw9714.c                         |    6 +-
 drivers/media/i2c/et8ek8/et8ek8_driver.c           |    4 +-
 drivers/media/i2c/hi556.c                          |  105 +-
 drivers/media/i2c/imx214.c                         |    1 +
 drivers/media/i2c/imx219.c                         |   77 +-
 drivers/media/i2c/imx335.c                         |  637 +++--
 drivers/media/i2c/max9271.h                        |    5 +
 drivers/media/i2c/ov2680.c                         |  103 +-
 drivers/media/i2c/ov2740.c                         |   20 +-
 drivers/media/i2c/ov4689.c                         |  673 ++---
 drivers/media/i2c/rdacm20.c                        |    4 +-
 drivers/media/i2c/st-mipid02.c                     |    2 +-
 drivers/media/i2c/tc358743.c                       |   25 +-
 drivers/media/i2c/tc358746.c                       |    3 +-
 drivers/media/i2c/tda1997x.c                       |   14 +-
 drivers/media/i2c/ths7303.c                        |   10 +-
 drivers/media/i2c/ths8200.c                        |   14 +-
 drivers/media/i2c/tvp7002.c                        |   32 +-
 drivers/media/mc/mc-devnode.c                      |    5 +-
 drivers/media/mc/mc-entity.c                       |    6 +
 drivers/media/mmc/siano/smssdio.c                  |   25 +-
 drivers/media/pci/cobalt/cobalt-v4l2.c             |   12 +-
 drivers/media/pci/intel/Kconfig                    |    4 +-
 drivers/media/pci/intel/Makefile                   |    1 +
 drivers/media/pci/intel/ipu-bridge.c               |   66 +-
 drivers/media/pci/intel/ipu3/ipu3-cio2.c           |   29 +-
 drivers/media/pci/intel/ipu3/ipu3-cio2.h           |    4 -
 drivers/media/pci/intel/ipu6/Kconfig               |   18 +
 drivers/media/pci/intel/ipu6/Makefile              |   23 +
 drivers/media/pci/intel/ipu6/ipu6-bus.c            |  165 ++
 drivers/media/pci/intel/ipu6/ipu6-bus.h            |   58 +
 drivers/media/pci/intel/ipu6/ipu6-buttress.c       |  917 +++++++
 drivers/media/pci/intel/ipu6/ipu6-buttress.h       |   92 +
 drivers/media/pci/intel/ipu6/ipu6-cpd.c            |  362 +++
 drivers/media/pci/intel/ipu6/ipu6-cpd.h            |  105 +
 drivers/media/pci/intel/ipu6/ipu6-dma.c            |  502 ++++
 drivers/media/pci/intel/ipu6/ipu6-dma.h            |   19 +
 drivers/media/pci/intel/ipu6/ipu6-fw-com.c         |  413 +++
 drivers/media/pci/intel/ipu6/ipu6-fw-com.h         |   47 +
 drivers/media/pci/intel/ipu6/ipu6-fw-isys.c        |  487 ++++
 drivers/media/pci/intel/ipu6/ipu6-fw-isys.h        |  596 +++++
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c      |  663 +++++
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h      |   82 +
 drivers/media/pci/intel/ipu6/ipu6-isys-dwc-phy.c   |  536 ++++
 drivers/media/pci/intel/ipu6/ipu6-isys-jsl-phy.c   |  242 ++
 drivers/media/pci/intel/ipu6/ipu6-isys-mcd-phy.c   |  720 +++++
 drivers/media/pci/intel/ipu6/ipu6-isys-queue.c     |  810 ++++++
 drivers/media/pci/intel/ipu6/ipu6-isys-queue.h     |   78 +
 drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c    |  403 +++
 drivers/media/pci/intel/ipu6/ipu6-isys-subdev.h    |   59 +
 drivers/media/pci/intel/ipu6/ipu6-isys-video.c     | 1420 ++++++++++
 drivers/media/pci/intel/ipu6/ipu6-isys-video.h     |  141 +
 drivers/media/pci/intel/ipu6/ipu6-isys.c           | 1367 ++++++++++
 drivers/media/pci/intel/ipu6/ipu6-isys.h           |  206 ++
 drivers/media/pci/intel/ipu6/ipu6-mmu.c            |  846 ++++++
 drivers/media/pci/intel/ipu6/ipu6-mmu.h            |   73 +
 .../pci/intel/ipu6/ipu6-platform-buttress-regs.h   |  226 ++
 .../pci/intel/ipu6/ipu6-platform-isys-csi2-reg.h   |  172 ++
 drivers/media/pci/intel/ipu6/ipu6-platform-regs.h  |  179 ++
 drivers/media/pci/intel/ipu6/ipu6.c                |  856 ++++++
 drivers/media/pci/intel/ipu6/ipu6.h                |  342 +++
 drivers/media/pci/intel/ivsc/mei_csi.c             |   20 +-
 drivers/media/pci/mgb4/mgb4_core.c                 |    4 +-
 drivers/media/pci/mgb4/mgb4_regs.c                 |    2 +-
 drivers/media/pci/netup_unidvb/netup_unidvb_i2c.c  |    2 +-
 drivers/media/pci/ngene/ngene-core.c               |    4 +-
 drivers/media/pci/saa7134/saa7134-alsa.c           |    9 +-
 drivers/media/pci/solo6x10/solo6x10-core.c         |   16 +-
 drivers/media/pci/ttpci/budget-av.c                |  573 ++--
 drivers/media/pci/ttpci/budget-ci.c                |  495 ++--
 drivers/media/pci/ttpci/budget-core.c              |   38 +-
 drivers/media/pci/ttpci/budget.c                   |  173 +-
 drivers/media/pci/ttpci/budget.h                   |   21 +-
 drivers/media/platform/Kconfig                     |    1 +
 drivers/media/platform/Makefile                    |    1 +
 drivers/media/platform/broadcom/Kconfig            |   23 +
 drivers/media/platform/broadcom/Makefile           |    3 +
 .../media/platform/broadcom/bcm2835-unicam-regs.h  |  246 ++
 drivers/media/platform/broadcom/bcm2835-unicam.c   | 2739 ++++++++++++++++=
++++
 drivers/media/platform/cadence/cdns-csi2rx.c       |   26 +-
 .../platform/chips-media/wave5/wave5-helper.c      |   17 +-
 .../platform/chips-media/wave5/wave5-vpu-dec.c     |   13 +-
 .../platform/chips-media/wave5/wave5-vpu-enc.c     |   13 +-
 .../media/platform/chips-media/wave5/wave5-vpu.c   |  125 +-
 .../platform/chips-media/wave5/wave5-vpuapi.h      |    4 +
 .../media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c   |   10 +-
 .../media/platform/mediatek/mdp3/mtk-mdp3-core.c   |    6 +-
 .../media/platform/mediatek/mdp3/mtk-mdp3-core.h   |    2 +-
 .../media/platform/mediatek/mdp3/mtk-mdp3-m2m.c    |    6 +-
 .../mediatek/vcodec/common/mtk_vcodec_fw_scp.c     |    2 +
 .../mediatek/vcodec/common/mtk_vcodec_util.c       |   23 +-
 .../mediatek/vcodec/decoder/mtk_vcodec_dec.c       |    2 +-
 .../mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h   |    4 +-
 .../vcodec/decoder/vdec/vdec_av1_req_lat_if.c      |   42 +-
 .../mediatek/vcodec/decoder/vdec/vdec_h264_if.c    |   12 +-
 .../vcodec/decoder/vdec/vdec_h264_req_common.h     |   15 +-
 .../vcodec/decoder/vdec/vdec_h264_req_if.c         |   14 +-
 .../vcodec/decoder/vdec/vdec_h264_req_multi_if.c   |    6 +-
 .../vcodec/decoder/vdec/vdec_hevc_req_multi_if.c   |    4 +-
 .../mediatek/vcodec/decoder/vdec/vdec_vp8_if.c     |    4 +-
 .../mediatek/vcodec/decoder/vdec/vdec_vp8_req_if.c |    2 +-
 .../mediatek/vcodec/decoder/vdec/vdec_vp9_if.c     |    4 +-
 .../mediatek/vcodec/decoder/vdec_msg_queue.h       |    4 +-
 .../platform/mediatek/vcodec/decoder/vdec_vpu_if.h |    4 +-
 .../mediatek/vcodec/encoder/mtk_vcodec_enc.c       |    2 +-
 .../mediatek/vcodec/encoder/mtk_vcodec_enc_pm.c    |    4 +-
 .../mediatek/vcodec/encoder/mtk_vcodec_enc_pm.h    |    2 +-
 .../mediatek/vcodec/encoder/venc/venc_h264_if.c    |    5 +-
 .../platform/mediatek/vcodec/encoder/venc_drv_if.c |    5 +-
 .../platform/mediatek/vcodec/encoder/venc_drv_if.h |    2 +-
 drivers/media/platform/nvidia/tegra-vde/h264.c     |    6 +-
 drivers/media/platform/nxp/imx-mipi-csis.c         |   34 +-
 drivers/media/platform/qcom/camss/Makefile         |    2 +-
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     |  108 +-
 drivers/media/platform/qcom/camss/camss-csiphy.c   |    1 +
 .../camss/{camss-vfe-170.c =3D> camss-vfe-17x.c}     |    0
 drivers/media/platform/qcom/camss/camss-vfe.c      |   25 +-
 drivers/media/platform/qcom/camss/camss-video.c    |    1 +
 drivers/media/platform/qcom/camss/camss.c          |  307 +++
 drivers/media/platform/qcom/camss/camss.h          |    1 +
 .../media/platform/renesas/rcar-vin/rcar-v4l2.c    |    9 +-
 drivers/media/platform/renesas/rcar-vin/rcar-vin.h |    2 +-
 drivers/media/platform/st/sti/c8sectpfe/Kconfig    |    1 -
 drivers/media/platform/st/sti/c8sectpfe/Makefile   |    7 +-
 .../platform/st/sti/c8sectpfe/c8sectpfe-core.c     |    3 +-
 .../platform/st/sti/c8sectpfe/c8sectpfe-debugfs.h  |    5 +
 drivers/media/platform/st/sti/hva/hva-hw.c         |    3 +-
 .../platform/st/stm32/stm32-dcmipp/dcmipp-core.c   |    7 +-
 .../platform/sunxi/sun8i-a83t-mipi-csi2/Kconfig    |    1 +
 drivers/media/platform/ti/davinci/vpif_capture.c   |    4 +-
 drivers/media/platform/ti/davinci/vpif_display.c   |    2 +-
 .../media/platform/ti/j721e-csi2rx/j721e-csi2rx.c  |    5 +-
 .../media/platform/verisilicon/hantro_h1_regs.h    |    4 +-
 drivers/media/platform/verisilicon/hantro_v4l2.c   |    1 +
 drivers/media/radio/radio-shark2.c                 |    2 +-
 drivers/media/rc/gpio-ir-recv.c                    |    1 -
 drivers/media/rc/imon.c                            |   12 +-
 drivers/media/rc/ir-spi.c                          |   41 +-
 drivers/media/rc/lirc_dev.c                        |   18 +-
 drivers/media/spi/cxd2880-spi.c                    |    2 +-
 drivers/media/spi/gs1662.c                         |   27 +-
 drivers/media/test-drivers/vicodec/vicodec-core.c  |    1 +
 drivers/media/test-drivers/vimc/vimc-capture.c     |    3 +-
 drivers/media/test-drivers/visl/visl-video.c       |    1 +
 drivers/media/test-drivers/vivid/vivid-core.c      |    9 +-
 drivers/media/test-drivers/vivid/vivid-meta-out.c  |    4 -
 drivers/media/test-drivers/vivid/vivid-touch-cap.c |    4 -
 drivers/media/tuners/xc5000.c                      |   39 +-
 drivers/media/usb/as102/as102_usb_drv.c            |    2 +-
 drivers/media/usb/au0828/au0828-video.c            |    5 +-
 drivers/media/usb/b2c2/flexcop-usb.c               |   17 +-
 drivers/media/usb/dvb-usb-v2/af9035.c              |   10 +-
 drivers/media/usb/dvb-usb-v2/anysee.c              |    4 +-
 drivers/media/usb/dvb-usb/dib0700_devices.c        |   18 +-
 drivers/media/usb/dvb-usb/dw2102.c                 |  462 ++--
 drivers/media/usb/go7007/go7007-fw.c               |    4 +-
 drivers/media/usb/gspca/cpia1.c                    |    6 +-
 drivers/media/usb/s2255/s2255drv.c                 |   20 +-
 drivers/media/usb/siano/smsusb.c                   |   20 +-
 drivers/media/usb/stk1160/stk1160-video.c          |   30 +-
 drivers/media/usb/uvc/uvc_ctrl.c                   |   26 +-
 drivers/media/usb/uvc/uvc_driver.c                 |   54 +-
 drivers/media/usb/uvc/uvcvideo.h                   |    2 +
 drivers/media/v4l2-core/v4l2-async.c               |   30 +-
 drivers/media/v4l2-core/v4l2-common.c              |    2 +
 drivers/media/v4l2-core/v4l2-ctrls-api.c           |   33 +-
 drivers/media/v4l2-core/v4l2-ctrls-core.c          |   24 +-
 drivers/media/v4l2-core/v4l2-dev.c                 |    6 +
 drivers/media/v4l2-core/v4l2-device.c              |   12 +-
 drivers/media/v4l2-core/v4l2-i2c.c                 |    2 +-
 drivers/media/v4l2-core/v4l2-ioctl.c               |   73 +-
 drivers/media/v4l2-core/v4l2-mem2mem.c             |   15 +
 drivers/media/v4l2-core/v4l2-spi.c                 |    2 +-
 drivers/media/v4l2-core/v4l2-subdev.c              |  113 +-
 drivers/staging/media/atomisp/Makefile             |    1 -
 drivers/staging/media/atomisp/i2c/Kconfig          |   15 -
 drivers/staging/media/atomisp/i2c/Makefile         |    5 -
 drivers/staging/media/atomisp/i2c/atomisp-gc2235.c |    2 +-
 drivers/staging/media/atomisp/i2c/atomisp-lm3554.c |  955 -------
 .../staging/media/atomisp/i2c/atomisp-mt9m114.c    |    4 +-
 drivers/staging/media/atomisp/i2c/atomisp-ov2722.c |   14 +-
 drivers/staging/media/atomisp/i2c/ov2722.h         |    1 -
 .../staging/media/atomisp/include/linux/atomisp.h  |   81 -
 .../atomisp/include/linux/atomisp_gmin_platform.h  |    6 +-
 .../media/atomisp/include/linux/atomisp_platform.h |   41 +-
 .../staging/media/atomisp/include/media/lm3554.h   |  132 -
 drivers/staging/media/atomisp/pci/atomisp_cmd.c    |  281 +-
 drivers/staging/media/atomisp/pci/atomisp_cmd.h    |   13 +-
 .../media/atomisp/pci/atomisp_compat_css20.c       |   31 +-
 drivers/staging/media/atomisp/pci/atomisp_csi2.c   |   26 +-
 drivers/staging/media/atomisp/pci/atomisp_fops.c   |   49 +-
 .../media/atomisp/pci/atomisp_gmin_platform.c      |  123 +-
 .../staging/media/atomisp/pci/atomisp_internal.h   |   19 +-
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c  |  493 +---
 drivers/staging/media/atomisp/pci/atomisp_subdev.c |  102 +-
 drivers/staging/media/atomisp/pci/atomisp_subdev.h |   17 +-
 drivers/staging/media/atomisp/pci/atomisp_tpg.c    |  164 --
 drivers/staging/media/atomisp/pci/atomisp_tpg.h    |   39 -
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c   |  183 +-
 drivers/staging/media/atomisp/pci/bits.h           |    4 +-
 drivers/staging/media/atomisp/pci/defs.h           |   37 -
 .../pci/hive_isp_css_common/host/dma_local.h       |    1 -
 .../pci/hive_isp_css_common/host/input_system.c    |   38 -
 drivers/staging/media/atomisp/pci/hive_types.h     |   19 -
 drivers/staging/media/atomisp/pci/ia_css.h         |    1 -
 .../media/atomisp/pci/ia_css_frame_public.h        |    8 -
 .../media/atomisp/pci/ia_css_stream_public.h       |   17 -
 drivers/staging/media/atomisp/pci/ia_css_tpg.h     |   79 -
 .../atomisp/pci/isp2400_input_system_global.h      |    1 -
 .../atomisp/pci/isp2400_input_system_public.h      |   15 -
 .../atomisp/pci/isp2401_input_system_global.h      |    1 -
 .../atomisp/pci/runtime/debug/src/ia_css_debug.c   |   20 +-
 .../media/atomisp/pci/runtime/ifmtr/src/ifmtr.c    |   11 -
 .../atomisp/pci/runtime/isys/src/virtual_isys.c    |   28 +-
 drivers/staging/media/atomisp/pci/sh_css.c         |  138 +-
 .../staging/media/atomisp/pci/sh_css_internal.h    |    1 -
 drivers/staging/media/atomisp/pci/sh_css_mipi.c    |    2 +-
 drivers/staging/media/atomisp/pci/sh_css_sp.c      |  127 +-
 drivers/staging/media/atomisp/pci/sh_css_sp.h      |    7 -
 drivers/staging/media/atomisp/pci/system_global.h  |   12 -
 drivers/staging/media/imx/Kconfig                  |    1 -
 drivers/staging/media/ipu3/ipu3-css-fw.c           |    4 +-
 drivers/staging/media/ipu3/ipu3-css-fw.h           |    2 +
 drivers/staging/media/ipu3/ipu3-css.c              |    1 -
 drivers/staging/media/ipu3/ipu3.c                  |   10 +-
 drivers/staging/media/max96712/max96712.c          |    2 +-
 drivers/staging/media/starfive/camss/stf-camss.c   |   12 +-
 drivers/staging/media/starfive/camss/stf-isp.c     |   10 +-
 drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c  |    3 +-
 drivers/staging/media/tegra-video/tegra20.c        |   10 +-
 drivers/staging/media/tegra-video/vi.c             |   12 +-
 include/media/cec.h                                |    4 +-
 include/media/ipu6-pci-table.h                     |   28 +
 include/media/media-device.h                       |    6 +
 include/media/v4l2-async.h                         |    4 +-
 include/media/v4l2-device.h                        |    7 +-
 include/media/v4l2-ioctl.h                         |    4 +
 include/media/v4l2-mem2mem.h                       |    2 +
 include/media/v4l2-subdev.h                        |   70 +-
 include/media/videobuf2-core.h                     |   52 +-
 include/media/videobuf2-v4l2.h                     |    2 +
 include/uapi/linux/dvb/frontend.h                  |    2 +-
 include/uapi/linux/media-bus-format.h              |    9 +
 include/uapi/linux/v4l2-mediabus.h                 |   18 +-
 include/uapi/linux/v4l2-subdev.h                   |   14 +-
 include/uapi/linux/videodev2.h                     |   45 +-
 307 files changed, 22908 insertions(+), 5428 deletions(-)
 create mode 100644 Documentation/admin-guide/media/ipu6-isys.rst
 create mode 100644 Documentation/admin-guide/media/ipu6_isys_graph.svg
 create mode 100644 Documentation/devicetree/bindings/media/brcm,bcm2835-un=
icam.yaml
 rename Documentation/devicetree/bindings/media/i2c/{ov8856.yaml =3D> ovti,=
ov8856.yaml} (98%)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sc8280xp-c=
amss.yaml
 create mode 100644 Documentation/driver-api/media/drivers/ipu6.rst
 create mode 100644 Documentation/userspace-api/media/v4l/metafmt-generic.r=
st
 create mode 100644 Documentation/userspace-api/media/v4l/vidioc-remove-buf=
s.rst
 create mode 100644 drivers/media/pci/intel/ipu6/Kconfig
 create mode 100644 drivers/media/pci/intel/ipu6/Makefile
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-bus.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-bus.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-buttress.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-buttress.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-cpd.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-cpd.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-dma.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-dma.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-fw-com.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-fw-com.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-fw-isys.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-fw-isys.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-dwc-phy.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-jsl-phy.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-mcd-phy.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-queue.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-subdev.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-video.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-video.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-mmu.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-mmu.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-platform-buttress-reg=
s.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-platform-isys-csi2-re=
g.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-platform-regs.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6.h
 create mode 100644 drivers/media/platform/broadcom/Kconfig
 create mode 100644 drivers/media/platform/broadcom/Makefile
 create mode 100644 drivers/media/platform/broadcom/bcm2835-unicam-regs.h
 create mode 100644 drivers/media/platform/broadcom/bcm2835-unicam.c
 rename drivers/media/platform/qcom/camss/{camss-vfe-170.c =3D> camss-vfe-1=
7x.c} (100%)
 delete mode 100644 drivers/staging/media/atomisp/i2c/atomisp-lm3554.c
 delete mode 100644 drivers/staging/media/atomisp/include/media/lm3554.h
 delete mode 100644 drivers/staging/media/atomisp/pci/atomisp_tpg.c
 delete mode 100644 drivers/staging/media/atomisp/pci/atomisp_tpg.h
 delete mode 100644 drivers/staging/media/atomisp/pci/defs.h
 delete mode 100644 drivers/staging/media/atomisp/pci/ia_css_tpg.h
 create mode 100644 include/media/ipu6-pci-table.h


