Return-Path: <linux-media+bounces-33436-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBFD2AC48F0
	for <lists+linux-media@lfdr.de>; Tue, 27 May 2025 09:01:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EF7B77ACC4F
	for <lists+linux-media@lfdr.de>; Tue, 27 May 2025 07:00:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8BDC20B7E1;
	Tue, 27 May 2025 06:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QMspM6ed"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AEEA1FBCAD;
	Tue, 27 May 2025 06:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748329166; cv=none; b=I5BjStzW91j/TZz/tfEYjKcv6kOfV7LBLm26Yt3KWWBGFJcTEyiJ3W4ZWhjrl0V/0ujuuvsZVHvHMFR0fc1fIi9V8DI8qHCt0iP+lpTzqNaQmO7zWbQ9s3xdvG1veEK/9lCPxKpLcsAZ4UPrWIVwVjeWPBjC0ADoplvvJpXLvPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748329166; c=relaxed/simple;
	bh=IYi/tYEU/AqMuu1vhB/k1SSWQtn4BNtQHcZPhL88jto=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=L7i8gmjOzeU6GcU2bAEKTCPCJfcNygOqjb4AElFSsdGQm65wrNSob8MFATMOH3jX994q06riZ0feLwKyZXtyg6riDDCGJjMCFqy53OE87Pg3FtMTz0MxSnq0CcT58mROBtwG598Nh6tH84QdqM8eXmeezn1xo3G7saXvb1oL61M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QMspM6ed; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A3ADC4CEEA;
	Tue, 27 May 2025 06:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748329165;
	bh=IYi/tYEU/AqMuu1vhB/k1SSWQtn4BNtQHcZPhL88jto=;
	h=Date:From:To:Cc:Subject:From;
	b=QMspM6edVuzS7FEf2LaccyzL3rziMcbu8gUeZ4o/BcK2Ih8QtonLZD5uOIFgxw1Cy
	 +aE5gy7QcliUB4WCzea/u7+/LiXWJXaRLCiECKQ+R0kOG8Q4HhnBsmpKnA+6Ry+SYG
	 LypB+FD3P2uVrrOjOBRoCjg3KlC1/yc/poVnw6RmtJiTUwKcW3k0K6KnuCSU6gmZQO
	 DTtwDMxf78WY4mJZxuIFRriF22Z4fMxaBxS75zDM+U1+SnmuuyMYWnHmMAQXvo+gTN
	 nQgCLOV7mpAsafzkPEHIhCofIykDB8GG6joEkqTasvxwSDsINYd0FhuTUQMYzIQWqd
	 QcyuTb6lmfdtw==
Date: Tue, 27 May 2025 08:59:21 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton
 <akpm@linux-foundation.org>, Linux Media Mailing List
 <linux-media@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>
Subject: [GIT PULL for v6.16] media updates
Message-ID: <20250527085921.4bd19558@foz.lan>
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
a/v6.16-1

For:

- v4l2-core fix: V4L2_BUF_TYPE_VIDEO_OVERLAY is capture, not output;
- New driver: Amlogic C3 ISP;
- New sensor drivers: ST VD55G1 and VD56G3, OmniVision OV02C10;
- amlogic: c3-mipi-csi2: Handle 64-bits division;
- a fix for 64-bits division at the amlogic c3-mipi-csi2 driver;
- Changes at atomisp to support mainline mt9m114 driver and remove deprecat=
ed
  GPIO APIs;
- various cleanups, fixes and enhancements.
   =20
Regards,
Mauro

---

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git tag=
s/media/v6.16-1

for you to fetch changes up to 5e1ff2314797bf53636468a97719a8222deca9ae:

  media: rkvdec: h264: Support High 10 and 4:2:2 profiles (2025-05-15 08:13=
:32 +0200)

----------------------------------------------------------------
[GIT PULL for v6.16] media updates

----------------------------------------------------------------
Aakarsh Jain (1):
      media: s5p-mfc: Support for handling RET_ENC_BUFFER_FULL interrupt

Aaron Kling (1):
      media: dt-bindings: Document Tegra186 and Tegra194 cec

Abraham Samuel Adekunle (1):
      media: atomisp: gmin: Remove duplicate NULL test

Alex Bee (1):
      media: rkvdec: h264: Don't hardcode SPS/PPS parameters

Andrew Kreimer (1):
      media: dvb: Fix typos bloc -> block

Andy Shevchenko (4):
      media: i2c: max9671x: Remove (explicitly) unused header
      media: i2c: ds90ub9x3: Remove (explicitly) unused header
      media: raspberrypi: rp1-cfe: Remove (explicitly) unused header
      media: i2c: rdacm2x: Make use of device properties

Benjamin Mugnier (2):
      media: dt-bindings: Add ST VD55G1 camera sensor
      media: i2c: Add driver for ST VD55G1 camera sensor

Biju Das (2):
      media: platform: exynos4-is: Use of_get_available_child_by_name()
      media: renesas: vsp1: Use %p4cc printk modifier to print FourCC codes

Bryan O'Donoghue (12):
      media: MAINTAINERS: Amend venus Maintainers and Reviewers
      media: MAINTAINERS: Add myself to iris Reviewers
      dt-bindings: media: Add qcom,x1e80100-camss
      media: qcom: camss: Add an id property to struct resources
      media: qcom: camss: Use the CSIPHY id property to find clock names
      media: qcom: camss: Add CSID 680 support
      media: qcom: camss: Add VFE680 support
      media: qcom: camss: Add support for 3ph CSIPHY write settle delay
      media: qcom: camss: csiphy-3ph: Add 4nm CSIPHY 2ph 5Gbps DPHY v2.1.2 =
init sequence
      media: qcom: camss: Add x1e80100 specific support
      media: dt-bindings: Add OmniVision OV02E10
      media: dt-bindings: Add OmniVision OV02C10

Chris Green (1):
      media: v4l: subdev: Fix coverity issue: Logically dead code

Christophe JAILLET (1):
      media: amphion: Slightly simplify vpu_core_register()

Colin Ian King (2):
      media: amphion: Fix spelling mistake "dismatch" -> "mismatch"
      media: mediatek: vcodec: Remove trailing space after \n newline

Dan Carpenter (4):
      media: iris: fix error code in iris_load_fw_to_memory()
      media: i2c: imx334: uninitialized variable in imx334_update_exp_gain()
      media: i2c: ds90ub960: Fix uninitialized variable in ub960_serializer=
_temp_ramp()
      media: i2c: ds90ub960: Fix uninitialized variable in ub960_rxport_bc_=
ser_config()

David Heidelberg (2):
      media: dt-bindings: media: i2c: align filenames format with standard
      media: dt-bindings: Convert Analog Devices ad5820 to DT schema

Denis Arefev (1):
      media: vivid: Change the siize of the composing

Detlev Casanova (1):
      media: verisilicon: Free post processor buffers on error

Dmitry Baryshkov (1):
      media: adv7511-v4l2: use constants for BT.2020 colorimetry

Dmitry Nikiforov (1):
      media: davinci: vpif: Fix memory leak in probe error path

Dongcheng Yan (2):
      media: ipu-bridge: add ACPI HID for lt6911uxe bridge
      media: i2c: change lt6911uxe irq_gpio name to "hpd"

Dr. David Alan Gilbert (2):
      media: pvrusb2: Remove unused pvr2_std_create_enum
      media: platform: mtk-mdp3: Remove unused mdp_get_plat_device

Edward Adam Davis (2):
      media: vidtv: Terminating the subsequent process of initialization fa=
ilure
      media: cxusb: no longer judge rbuf when the write fails

Fei Shao (1):
      media: mediatek: vcodec: Correct vsi_core framebuffer size

Frank Li (1):
      dt-bindings: media: convert imx.txt to yaml format

Gabriel Shahrouzi (1):
      media: atomisp: Fix indentation to use TAB instead of spaces

Hans Verkuil (10):
      media: cec: extron-da-hd-4k-plus: Fix Wformat-truncation
      media: omap3isp: drop wait_prepare/finish callbacks
      media: staging: atomisp/starfive: use (t,l)/wxh format for rectangle
      media: usb: em28xx: use (t,l)/wxh format for rectangle
      media: vivid: use (t,l)/wxh format for rectangle
      media: i2c: imx283: use (t,l)/wxh format for rectangle
      media: pci: zoran: use (t,l)/wxh format for rectangle
      media: platform: use (t,l)/wxh format for rectangle
      media: tc358743: ignore video while HPD is low
      media: uapi: cec-funcs.h: use CEC_LOG_ADDR_BROADCAST

Hans de Goede (9):
      media: ov08x40: Extend sleep after reset to 5 ms
      media: ov2740: Move pm-runtime cleanup on probe-errors to proper place
      media: atomisp: Remove gmin_platform Asus T100TA quirks
      media: atomisp: gmin: Remove GPIO driven regulator support
      media: atomisp: Avoid picking too big sensor resolution
      media: atomisp: Rename camera to sensor
      media: atomisp: Avoid deadlock with sensor subdevs with state_lock set
      media: atomisp: Add support for sensors with a separate ISP v4l2_subd=
ev
      media: atomisp: Remove atomisp-mt9m114 driver

Hao Yao (4):
      media: ipu6: Remove workaround for Meteor Lake ES2
      media: i2c: ov13b10: Fix h_blank calculation
      media: i2c: ov13b10: Improve code readability
      media: i2c: ov13b10: Support 2 lane mode

Haoxiang Li (1):
      media: imagination: fix a potential memory leak in e5010_probe()

Hardevsinh Palaniya (1):
      media: atomisp: Remove compat ioctl32 header file

Heimir Thor Sverrisson (1):
      media: i2c: Add Omnivision OV02C10 sensor driver

Jacopo Mondi (5):
      media: renesas: vsp1: Add support IIF ISP Interface
      media: renesas: vsp1: dl: Use singleshot DL for VSPX
      media: renesas: vsp1: wpf: Propagate vsp1_rwpf_init_ctrls()
      media: renesas: vsp1: rwpf: Support operations with IIF
      media: amlogic: c3-mipi-csi2: Handle 64-bits division

Jai Luthra (4):
      media: i2c: ds90ub953: Speed-up I2C watchdog timer
      media: dt-bindings: ti,ds90ub960: Allow setting serializer address
      media: i2c: ds90ub960: Configure serializer using back-channel
      media: i2c: ds90ub9xx: Set serializer temperature ramp

Jason Chen (6):
      media: ov08x40: Separate the lane configuration and PLL settings
      media: ov08x40: Add support for 2/4 lanes at 1500 Mbps
      media: ov08x40: Remove common register settings from resolution-speci=
fic table
      media: ov08x40: Add shared global register list
      media: ov08x40: Use v4l2_link_freq_to_bitmap helper
      media: ov08x40: Select mode based on mipi lane count

Jianhua Lin (1):
      media: mediatek: jpeg: support 34bits

Jingjing Xiong (1):
      media: i2c: ov02e10: add OV02E10 image sensor driver

Johan Hovold (4):
      media: qcom: camss: csid: suppress CSID log spam
      media: qcom: camss: vfe: suppress VFE version log spam
      media: ov5675: suppress probe deferral errors
      media: ov8856: suppress probe deferral errors

Jonas Karlman (10):
      media: v4l2-common: Add helpers to calculate bytesperline and sizeima=
ge
      media: v4l2: Add NV15 and NV20 pixel formats
      media: rkvdec: h264: Use bytesperline and buffer height as virstride
      media: rkvdec: Extract rkvdec_fill_decoded_pixfmt into helper
      media: rkvdec: Move rkvdec_reset_decoded_fmt helper
      media: rkvdec: Extract decoded format enumeration into helper
      media: rkvdec: Add image format concept
      media: rkvdec: Fix frame size enumeration
      media: rkvdec: Add get_image_fmt ops
      media: rkvdec: h264: Support High 10 and 4:2:2 profiles

Keke Li (10):
      media: dt-bindings: Add amlogic,c3-mipi-csi2.yaml
      media: platform: Add C3 MIPI CSI-2 driver
      media: dt-bindings: Add amlogic,c3-mipi-adapter.yaml
      media: platform: Add C3 MIPI adapter driver
      media: dt-bindings: Add amlogic,c3-isp.yaml
      media: Add C3ISP_PARAMS and C3ISP_STATS meta formats
      media: uapi: Add stats info and parameters buffer for C3 ISP
      media: platform: Add C3 ISP driver
      Documentation: media: Add documentation file metafmt-c3-isp.rst
      Documentation: media: Add documentation file c3-isp.rst

Kells Ping (2):
      media: platform: cros-ec: Add Dirks to the match table
      media: platform: cros-ec: select ports ab for Dirks

Ken Lin (1):
      media: platform: cros-ec: Add Moxie to the match table

Kieran Bingham (2):
      media: imx335: Add MAINTAINER entry
      media: i2c: imx335: Fix frame size enumeration

Lad Prabhakar (14):
      media: dt-bindings: media: renesas,vsp1: Document RZ/V2H(P)
      media: dt-bindings: media: renesas,fcp: Document RZ/V2H(P) SoC
      media: dt-bindings: renesas,rzg2l-csi2: Document Renesas RZ/V2H(P) SoC
      media: rzg2l-cru: csi2: Use local variable for struct device in rzg2l=
_csi2_probe()
      media: rzg2l-cru: rzg2l-core: Use local variable for struct device in=
 rzg2l_cru_probe()
      media: rzg2l-cru: csi2: Introduce SoC-specific D-PHY handling
      media: rzg2l-cru: csi2: Add support for RZ/V2H(P) SoC
      media: rzg2l-cru: Add register mapping support
      media: rzg2l-cru: Pass resolution limits via OF data
      media: rzg2l-cru: Add image_conv offset to OF data
      media: rzg2l-cru: Add IRQ handler to OF data
      media: rzg2l-cru: Add function pointer to check if FIFO is empty
      media: rzg2l-cru: Add function pointer to configure CSI
      media: rzg2l-cru: Add support for RZ/G3E SoC

Laurent Pinchart (9):
      media: renesas: vsp1: Implement pixel format enumeration
      media: renesas: vsp1: Make HSI and HST modules optional
      media: renesas: vsp1: Fix HSV format enumeration
      media: renesas: vsp1: Fix media bus code setup on RWPF source pad
      media: renesas: vsp1: Report colour space information to userspace
      media: renesas: vsp1: Allow setting encoding and quantization
      media: renesas: vsp1: Name nested structure in vsp1_drm
      media: renesas: vsp1: Expose color space through the DRM API
      media: ccs-pll: Print a debug message when VT tree calculation fails

Laurentiu Palcu (1):
      media: nxp: imx8-isi: better handle the m2m usage_count

Liu Jing (1):
      media: atomisp: Fix spelling error in ia_css_sdis2_types.h

Loic Poulain (1):
      media: venus: Fix probe error handling

Luca Weiss (2):
      dt-bindings: media: camss: Restrict bus-type property
      media: qcom: camss: Restrict endpoint bus-type to D-PHY

Lukas Bulwahn (2):
      media: remove STA2x11 media pci driver
      MAINTAINERS: adjust file entry in OMNIVISION OV7670 SENSOR DRIVER

Ma Ke (1):
      media: v4l2-dev: fix error handling in __video_register_device()

Marek Szyprowski (2):
      media: videobuf2: use sgtable-based scatterlist wrappers
      media: omap3isp: use sgtable-based scatterlist wrappers

Martin T=C5=AFma (3):
      docs: media: mgb4: Improve mgb4 driver documentation
      media: mgb4: Fix resolution change events triggering
      media: mgb4: Enumerate only the available timings

Matthew Majewski (3):
      media: v4l2-common: Add RGBR format info
      media: vim2m: Simplify try_fmt
      media: vim2m: Add parametized support for multiplanar API

Michael Chang (2):
      media: nuvoton: npcm-video: Fix stuck due to no video signal error
      media: nuvoton: npcm-video: Prevent returning unsupported resolutions

Michael Riesch (2):
      media: mailmap: add entry for Michael Riesch
      media: dt-bindings: sony,imx415: update maintainer e-mail address

Micha=C5=82 Miros=C5=82aw (1):
      media: videobuf2: check constants during build time

Ming Qian (8):
      media: amphion: Reduce decoding latency for HEVC decoder
      media: amphion: Add a frame flush mode for decoder
      media: imx-jpeg: Drop the first error frames
      media: imx-jpeg: Move mxc_jpeg_free_slot_data() ahead
      media: imx-jpeg: Reset slot data pointers when freed
      media: imx-jpeg: Cleanup after an allocation error
      media: imx-jpeg: Change the pattern size to 128x64
      media: imx-jpeg: Check decoding is ongoing for motion-jpeg

Nas Chung (3):
      media: uapi: v4l: Change V4L2_TYPE_IS_CAPTURE condition
      media: qcom: venus: Fix uninitialized variable warning
      media: uapi: v4l: Fix V4L2_TYPE_IS_OUTPUT condition

Nathan Hebert (1):
      media: mediatek: vcodec: Enable HEVC main still picture decode

Neil Armstrong (7):
      dt-bindings: media: qcom,sm8550-iris: document SM8650 IRIS accelerator
      media: platform: qcom/iris: add power_off_controller to vpu_ops
      media: platform: qcom/iris: introduce optional controller_rst_tbl
      media: platform: qcom/iris: rename iris_vpu3 to iris_vpu3x
      media: platform: qcom/iris: add support for vpu33
      media: platform: qcom/iris: rename platform_sm8550 to platform_gen2
      media: platform: qcom/iris: add sm8650 support

Nicolas Dufresne (5):
      media: verisilicon: Enable wide 4K in AV1 decoder
      media: verisilicon: Enable NV15 support for Rockchip VDPU981
      media: synopsys: hdmirx: Renamed frame_idx to sequence
      media: synopsys: hdmirx: Count dropped frames
      media: rkvdec: Initialize the m2m context before the controls

Niklas S=C3=B6derlund (11):
      media: rcar-vin: Fix stride setting for RAW8 formats
      media: rcar-vin: Remove emulated SEQ_{TB,BT}
      media: rcar-vin: Remove superfluous suspended state
      media: rcar-vin: Remove superfluous starting state
      media: rcar-vin: Simplify the shutdown process
      media: rcar-csi2: Remove hack to detect NTSC content
      dt-bindings: media: renesas,isp: Add ISP core function block
      media: rcar-isp: Move driver to own directory
      media: rcar-isp: Rename base register variable
      media: rcar-isp: Parse named cs memory region
      media: dt-bindings: sony,imx290: Update usage example

Petja Patjas (1):
      media: rc: add keymap for Hauppauge Credit Card RC

Philipp Stanner (5):
      media: ipu3-cio2: Replace deprecated PCI functions
      media: intel/ipu6: Replace deprecated PCI functions
      media: pt3: Replace deprecated PCI functions
      media: solo6x10: Replace deprecated PCI functions
      media: tw5864: Replace deprecated PCI functions

Raag Jadav (2):
      media: atmel-isi: use devm_kmemdup_array()
      media: stm32-dcmi: use devm_kmemdup_array()

Renjiang Han (3):
      dt-bindings: media: add support for video hardware on QCS615 platform
      media: venus: vdec: queue dpb buffers to firmware for video seek
      media: venus: pm_helpers: add compatibility for dev_pm_genpd_set_hwmo=
de on V4

Ricardo Ribalda (14):
      media: vivid: Fix requirement about webcam_intervals
      media: vivid: Add more webcam resolutions
      media: atomisp: Fix Wformat-truncation warning
      media: atomisp: Use the actual value of the enum instead of the enum
      media: uvcvideo: Keep streaming state in the file handle
      media: uvcvideo: Create uvc_pm_(get|put) functions
      media: uvcvideo: Increase/decrease the PM counter per IOCTL
      media: uvcvideo: Make power management granular
      media: uvcvideo: Do not turn on the camera for some ioctls
      media: uvcvideo: Return the number of processed controls
      media: uvcvideo: Send control events for partial succeeds
      media: uvcvideo: Rollback non processed entities on error
      media: uvcvideo: Fix deferred probing error
      media: uvcvideo: Use dev_err_probe for devm_gpiod_get_optional

Sakari Ailus (18):
      media: ccs-pll: Start OP pre-PLL multiplier search from correct value
      media: ccs-pll: Start VT pre-PLL multiplier search from correct value
      media: ccs-pll: Check for too high VT PLL multiplier in dual PLL case
      media: ccs-pll: Correct the upper limit of maximum op_pre_pll_clk_div
      media: ccs-pll: Print a debug message on too high VT PLL OP clock
      media: ccs-pll: Drop LINK_DECOUPLED flag
      media: ccs-pll: Print missing PLL flags
      media: ccs-pll: Add a flag for even PLL multipliers
      media: ccs-pll: Better validate VT PLL branch
      media: ccs-pll: Print PLL calculator flags in the beginning
      media: ccs-pll: Document the CCS PLL flags
      media: ccs: Try a little longer to access the sensor before giving up
      media: ccs: Use read_poll_timeout() in reset polling
      media: ccs: Remove I=C2=B2C write retry hack
      media: ccs: Don't complain about lack of quirks
      media: ccs: Don't complain about missing "clock-frequency" property
      media: common: Add v4l2_find_nearest_size_conditional()
      media: ov02c10: Use div_u64 to divide a 64-bit number

Sebastian Fricke (1):
      media: rkvdec: h264: Limit minimum profile to constrained baseline

Shravan Chippa (4):
      media: i2c: imx334: Optimized 4k and 2k mode register arrays
      media: i2c: imx334: update mode_3840x2160_regs array
      media: i2c: imx334: add modes for 720p and 480p resolutions
      media: i2c: imx334: common reg value correction

Stanislaw Gruszka (15):
      media: intel/ipu6: Remove unused IPU6_BUS_NAME
      media: intel/ipu6: Remove ipu6_buttress_ctrl started field
      media: intel/ipu6: Constify ipu6_buttress_ctrl structure
      media: intel/ipu6: Remove unused ipu6_isys_subdev_link_validate()
      media: intel/ipu6: Add missing new line character in error message
      media: intel/ipu6: Make two functions static
      media: intel/ipu6: Use timestamp value directly
      media: intel/ipu6: Abstract buf ready function
      media: intel/ipu6: Remove unused dev field from ipu6_isys_queue
      media: intel/ipu6: Minor dma_mask clenaup
      media: intel/ipu6: Fix dma mask for non-secure mode
      media: intel/ipu6: Remove unused ipu6_isys_csi2_pdata
      media: intel/ipu6: Remove pin_ready function pointer
      media: intel/ipu6: Remove line_align
      media: intel/ipu6: Change deprecated lock comment

Stefan Klug (1):
      media: rkisp1: Remove unnecessary defines

Sylvain Petinot (2):
      media: dt-bindings: Add ST VD56G3 camera sensor
      media: i2c: Add driver for ST VD56G3 camera sensor

Tarang Raval (11):
      media: i2c: imx219: switch to {enable,disable}_streams
      media: i2c: imx219: media: i2c: imx219: Enable runtime PM autosuspend
      media: i2c: imx334: Simplify with dev_err_probe()
      media: i2c: imx334: Convert to CCI register access helpers
      media: i2c: imx334: Remove redundant register entries
      media: i2c: imx334: Configure lane mode dynamically
      media: i2c: imx334: Fix power management and control handling
      media: i2c: imx334: Fix runtime PM handling in remove function
      media: i2c: imx334: Enable runtime PM before sub-device registration
      media: i2c: imx334: Use subdev state lock for synchronization
      media: i2c: imx334: switch to {enable,disable}_streams

Thomas Andreatta (1):
      media: atomisp: gmin: Fix indentation to use TAB instead of spaces

Tomi Valkeinen (22):
      media: i2c: ds90ub953: Fix error prints
      media: i2c: ds90ub913: Fix returned fmt from .set_fmt()
      media: i2c: ds90ub913: Align ub913_read() with other similar functions
      media: i2c: ds90ub9xx: Add err parameter to read/write funcs
      media: i2c: ds90ub960: Add error handling to multiple places
      media: i2c: ds90ub953: Add error handling to ub953_log_status()
      media: i2c: ds90ub913: Add error handling to ub913_log_status()
      media: i2c: ds90ub960: Move UB9702 registers to a separate section
      media: i2c: ds90ub960: Add UB9702 specific registers
      media: i2c: ds90ub960: Split ub960_init_tx_ports()
      media: i2c: ds90ub960: Refresh ub960_init_tx_ports_ub9702()
      media: i2c: ds90ub960: Add RX port iteration support
      media: i2c: ds90ub960: Move all RX port init code into ub960_init_rx_=
ports()
      media: i2c: ds90ub960: Update UB9702 init sequences
      media: i2c: ds90ub953: Move reg defines to a header file
      media: ti: cal: Use printk's fourcc formatting
      media: ti: cal: Fix wrong goto on error path
      media: ti: cal: Add streams support
      media: rcar-vin: Add RCAR_GEN4 model value
      media: rcar-vin: Remove unnecessary checks
      media: rcar-vin: Fix RAW8
      media: rcar-vin: Fix RAW10

Tommaso Merciai (5):
      media: dt-bindings: renesas,rzg2l-csi2: Document Renesas RZ/G3E CSI-2=
 block
      media: dt-bindings: renesas,rzg2l-cru: Document Renesas RZ/G3E SoC
      media: rzg2l-cru: csi2: Use devm_pm_runtime_enable()
      media: rzg2l-cru: rzg2l-core: Use devm_pm_runtime_enable()
      media: rzg2l-cru: csi2: Skip system clock for RZ/V2H(P) SoC

Umang Jain (1):
      media: imx335: Use correct register width for HNUM

Vikash Garodia (4):
      dt-bindings: media: qcom,sm8550-iris: document SA8775p IRIS accelerat=
or
      dt-bindings: media: qcom,sm8550-iris: document QCS8300 IRIS accelerat=
or
      media: iris: fix the order of compat strings
      media: iris: add qcs8300 platform data

Wentao Liang (2):
      media: platform: exynos4-is: Add hardware sync wait to fimc_is_hw_cha=
nge_mode()
      media: gspca: Add error handling for stv06xx_read_sensor()

Yunfei Dong (3):
      media: mediatek: vcodec: remove vsi operation in common interface
      media: mediatek: vcodec: support extended h264 decode
      media: mediatek: vcodec: add description for vsi struct

 .mailmap                                           |    1 +
 Documentation/admin-guide/media/c3-isp.dot         |   26 +
 Documentation/admin-guide/media/c3-isp.rst         |  101 +
 Documentation/admin-guide/media/mgb4.rst           |    9 +
 Documentation/admin-guide/media/pci-cardlist.rst   |    1 -
 Documentation/admin-guide/media/v4l-drivers.rst    |    1 +
 .../devicetree/bindings/media/amlogic,c3-isp.yaml  |   88 +
 .../bindings/media/amlogic,c3-mipi-adapter.yaml    |  111 +
 .../bindings/media/amlogic,c3-mipi-csi2.yaml       |  127 ++
 .../bindings/media/cec/nvidia,tegra114-cec.yaml    |   14 +-
 .../bindings/media/fsl,imx-capture-subsystem.yaml  |   37 +
 .../bindings/media/fsl,imx6-mipi-csi2.yaml         |  143 ++
 .../devicetree/bindings/media/i2c/ad5820.txt       |   28 -
 .../devicetree/bindings/media/i2c/adi,ad5820.yaml  |   56 +
 .../media/i2c/{adp1653.txt =3D> adi,adp1653.txt}     |    0
 .../media/i2c/{adv7180.yaml =3D> adi,adv7180.yaml}   |    2 +-
 .../media/i2c/{adv7343.txt =3D> adi,adv7343.txt}     |    0
 .../media/i2c/{adv748x.yaml =3D> adi,adv748x.yaml}   |    2 +-
 .../media/i2c/{adv7604.yaml =3D> adi,adv7604.yaml}   |    2 +-
 .../media/i2c/{mt9v032.txt =3D> aptina,mt9v032.txt}  |    0
 .../media/i2c/{max2175.txt =3D> maxim,max2175.txt}   |    0
 .../media/i2c/{mt9m111.txt =3D> micron,mt9m111.txt}  |    0
 .../media/i2c/{tda1997x.txt =3D> nxp,tda1997x.txt}   |    0
 .../media/i2c/{mt9m001.txt =3D> onnn,mt9m001.txt}    |    0
 .../bindings/media/i2c/ovti,ov02e10.yaml           |  152 ++
 .../media/i2c/{ov2640.txt =3D> ovti,ov2640.txt}      |    0
 .../media/i2c/{ov2659.txt =3D> ovti,ov2659.txt}      |    0
 .../media/i2c/{ov7670.txt =3D> ovti,ov7670.txt}      |    0
 .../media/i2c/{ov7740.txt =3D> ovti,ov7740.txt}      |    0
 .../media/i2c/{ov9650.txt =3D> ovti,ov9650.txt}      |    0
 .../media/i2c/{imx219.yaml =3D> sony,imx219.yaml}    |    2 +-
 .../devicetree/bindings/media/i2c/sony,imx290.yaml |    2 +-
 .../devicetree/bindings/media/i2c/sony,imx415.yaml |    2 +-
 .../devicetree/bindings/media/i2c/st,vd55g1.yaml   |  133 ++
 .../devicetree/bindings/media/i2c/st,vd56g3.yaml   |  139 ++
 .../bindings/media/i2c/ti,ds90ub953.yaml           |   77 +-
 .../bindings/media/i2c/ti,ds90ub960.yaml           |   16 +-
 .../media/i2c/{ths8200.txt =3D> ti,ths8200.txt}      |    0
 .../media/i2c/{tvp514x.txt =3D> ti,tvp514x.txt}      |    0
 .../media/i2c/{tvp5150.txt =3D> ti,tvp5150.txt}      |    0
 .../media/i2c/{tvp7002.txt =3D> ti,tvp7002.txt}      |    0
 .../i2c/{tc358743.txt =3D> toshiba,tc358743.txt}     |    0
 Documentation/devicetree/bindings/media/imx.txt    |   53 -
 .../bindings/media/qcom,msm8916-camss.yaml         |    8 +
 .../bindings/media/qcom,msm8953-camss.yaml         |   15 +
 .../bindings/media/qcom,msm8996-camss.yaml         |   20 +
 .../bindings/media/qcom,sc7180-venus.yaml          |    7 +-
 .../bindings/media/qcom,sc8280xp-camss.yaml        |   20 +
 .../bindings/media/qcom,sdm660-camss.yaml          |   20 +
 .../bindings/media/qcom,sdm845-camss.yaml          |   20 +
 .../bindings/media/qcom,sm8250-camss.yaml          |   30 +
 .../bindings/media/qcom,sm8550-iris.yaml           |   39 +-
 .../bindings/media/qcom,x1e80100-camss.yaml        |  367 ++++
 .../devicetree/bindings/media/renesas,fcp.yaml     |    2 +
 .../devicetree/bindings/media/renesas,isp.yaml     |   63 +-
 .../bindings/media/renesas,rzg2l-cru.yaml          |   65 +-
 .../bindings/media/renesas,rzg2l-csi2.yaml         |   62 +-
 .../devicetree/bindings/media/renesas,vsp1.yaml    |    1 +
 .../userspace-api/media/v4l/meta-formats.rst       |    1 +
 .../userspace-api/media/v4l/metafmt-c3-isp.rst     |   86 +
 .../userspace-api/media/v4l/pixfmt-yuv-planar.rst  |  128 ++
 MAINTAINERS                                        |   96 +-
 drivers/media/cec/platform/cros-ec/cros-ec-cec.c   |    5 +
 .../extron-da-hd-4k-plus/extron-da-hd-4k-plus.c    |    4 +-
 drivers/media/common/videobuf2/videobuf2-dma-sg.c  |    4 +-
 drivers/media/common/videobuf2/videobuf2-v4l2.c    |   11 +-
 drivers/media/dvb-frontends/dib7000p.c             |    4 +-
 drivers/media/dvb-frontends/dib8000.c              |    5 +-
 drivers/media/i2c/Kconfig                          |   43 +
 drivers/media/i2c/Makefile                         |    4 +
 drivers/media/i2c/adv7511-v4l2.c                   |    4 +-
 drivers/media/i2c/ccs-pll.c                        |   53 +-
 drivers/media/i2c/ccs-pll.h                        |   29 +-
 drivers/media/i2c/ccs/ccs-core.c                   |   55 +-
 drivers/media/i2c/ccs/ccs-quirk.c                  |    3 +-
 drivers/media/i2c/ccs/ccs-reg-access.c             |    9 +-
 drivers/media/i2c/ccs/ccs.h                        |    2 +
 drivers/media/i2c/ds90ub913.c                      |   83 +-
 drivers/media/i2c/ds90ub953.c                      |  243 ++-
 drivers/media/i2c/ds90ub953.h                      |  104 +
 drivers/media/i2c/ds90ub960.c                      | 2166 +++++++++++++++-=
----
 drivers/media/i2c/imx219.c                         |   38 +-
 drivers/media/i2c/imx283.c                         |    2 +-
 drivers/media/i2c/imx334.c                         | 1035 +++++-----
 drivers/media/i2c/imx335.c                         |    5 +-
 drivers/media/i2c/lt6911uxe.c                      |    4 +-
 drivers/media/i2c/max96714.c                       |    2 +-
 drivers/media/i2c/max96717.c                       |    2 +-
 drivers/media/i2c/ov02c10.c                        | 1013 +++++++++
 drivers/media/i2c/ov02e10.c                        |  969 +++++++++
 drivers/media/i2c/ov08x40.c                        | 1380 +++++++------
 drivers/media/i2c/ov13b10.c                        |  176 +-
 drivers/media/i2c/ov2740.c                         |    4 +-
 drivers/media/i2c/ov5675.c                         |    5 +-
 drivers/media/i2c/ov8856.c                         |    9 +-
 drivers/media/i2c/rdacm20.c                        |    7 +-
 drivers/media/i2c/rdacm21.c                        |    7 +-
 drivers/media/i2c/tc358743.c                       |    4 +
 drivers/media/i2c/vd55g1.c                         | 1965 ++++++++++++++++=
++
 drivers/media/i2c/vd56g3.c                         | 1586 ++++++++++++++
 drivers/media/pci/Kconfig                          |    1 -
 drivers/media/pci/Makefile                         |    2 -
 drivers/media/pci/intel/ipu-bridge.c               |    2 +
 drivers/media/pci/intel/ipu3/ipu3-cio2.c           |    5 +-
 drivers/media/pci/intel/ipu6/ipu6-bus.c            |    2 +-
 drivers/media/pci/intel/ipu6/ipu6-bus.h            |    7 +-
 drivers/media/pci/intel/ipu6/ipu6-buttress.c       |    6 +-
 drivers/media/pci/intel/ipu6/ipu6-buttress.h       |    5 +-
 drivers/media/pci/intel/ipu6/ipu6-dma.c            |    4 +-
 drivers/media/pci/intel/ipu6/ipu6-dma.h            |    3 -
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h      |    2 -
 drivers/media/pci/intel/ipu6/ipu6-isys-queue.c     |   45 +-
 drivers/media/pci/intel/ipu6/ipu6-isys-queue.h     |   10 +-
 drivers/media/pci/intel/ipu6/ipu6-isys-subdev.h    |    4 -
 drivers/media/pci/intel/ipu6/ipu6-isys-video.c     |    5 +-
 drivers/media/pci/intel/ipu6/ipu6-isys-video.h     |    8 +-
 drivers/media/pci/intel/ipu6/ipu6-isys.c           |    8 +-
 drivers/media/pci/intel/ipu6/ipu6-isys.h           |    4 -
 drivers/media/pci/intel/ipu6/ipu6.c                |   13 +-
 drivers/media/pci/mgb4/mgb4_vin.c                  |   21 +-
 drivers/media/pci/pt3/pt3.c                        |   17 +-
 drivers/media/pci/solo6x10/solo6x10-core.c         |    4 +-
 drivers/media/pci/sta2x11/Kconfig                  |   16 -
 drivers/media/pci/sta2x11/Makefile                 |    2 -
 drivers/media/pci/sta2x11/sta2x11_vip.c            | 1270 ------------
 drivers/media/pci/sta2x11/sta2x11_vip.h            |   29 -
 drivers/media/pci/tw5864/tw5864-core.c             |   13 +-
 drivers/media/pci/zoran/zoran_card.c               |    2 +-
 drivers/media/pci/zoran/zr36016.c                  |    2 +-
 drivers/media/pci/zoran/zr36050.c                  |    2 +-
 drivers/media/pci/zoran/zr36060.c                  |    2 +-
 drivers/media/platform/amlogic/Kconfig             |    1 +
 drivers/media/platform/amlogic/Makefile            |    2 +
 drivers/media/platform/amlogic/c3/Kconfig          |    5 +
 drivers/media/platform/amlogic/c3/Makefile         |    5 +
 drivers/media/platform/amlogic/c3/isp/Kconfig      |   18 +
 drivers/media/platform/amlogic/c3/isp/Makefile     |   10 +
 .../media/platform/amlogic/c3/isp/c3-isp-capture.c |  804 ++++++++
 .../media/platform/amlogic/c3/isp/c3-isp-common.h  |  340 +++
 .../media/platform/amlogic/c3/isp/c3-isp-core.c    |  641 ++++++
 drivers/media/platform/amlogic/c3/isp/c3-isp-dev.c |  421 ++++
 .../media/platform/amlogic/c3/isp/c3-isp-params.c  | 1008 +++++++++
 .../media/platform/amlogic/c3/isp/c3-isp-regs.h    |  618 ++++++
 .../media/platform/amlogic/c3/isp/c3-isp-resizer.c |  892 ++++++++
 .../media/platform/amlogic/c3/isp/c3-isp-stats.c   |  326 +++
 .../media/platform/amlogic/c3/mipi-adapter/Kconfig |   16 +
 .../platform/amlogic/c3/mipi-adapter/Makefile      |    3 +
 .../amlogic/c3/mipi-adapter/c3-mipi-adap.c         |  842 ++++++++
 .../media/platform/amlogic/c3/mipi-csi2/Kconfig    |   16 +
 .../media/platform/amlogic/c3/mipi-csi2/Makefile   |    3 +
 .../platform/amlogic/c3/mipi-csi2/c3-mipi-csi2.c   |  828 ++++++++
 drivers/media/platform/amphion/vdec.c              |    2 +-
 drivers/media/platform/amphion/vpu.h               |    1 -
 drivers/media/platform/amphion/vpu_core.c          |    7 +-
 drivers/media/platform/amphion/vpu_malone.c        |   39 +-
 drivers/media/platform/atmel/atmel-isi.c           |    8 +-
 .../media/platform/imagination/e5010-jpeg-enc.c    |    9 +-
 .../media/platform/mediatek/jpeg/mtk_jpeg_core.c   |    5 +-
 .../media/platform/mediatek/jpeg/mtk_jpeg_core.h   |    4 +
 .../media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c |   73 +-
 .../media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.h |    1 +
 .../platform/mediatek/jpeg/mtk_jpeg_dec_reg.h      |    8 +
 .../media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c |   33 +-
 .../media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.h |    7 +-
 drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c  |    2 +-
 .../media/platform/mediatek/mdp3/mtk-mdp3-cmdq.h   |    2 -
 .../media/platform/mediatek/mdp3/mtk-mdp3-core.c   |   19 -
 .../media/platform/mediatek/mdp3/mtk-mdp3-regs.c   |    4 +-
 .../mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h   |    2 +
 .../vcodec/decoder/mtk_vcodec_dec_stateless.c      |    2 -
 .../vcodec/decoder/vdec/vdec_h264_req_multi_if.c   |  652 +++++-
 .../vcodec/decoder/vdec/vdec_hevc_req_multi_if.c   |    2 +-
 .../mediatek/vcodec/encoder/venc/venc_h264_if.c    |    2 +-
 drivers/media/platform/nuvoton/npcm-video.c        |   19 +-
 drivers/media/platform/nxp/dw100/dw100.c           |    8 +-
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h  |    1 +
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c     |  132 +-
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h     |    5 +
 drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c |   14 +-
 drivers/media/platform/qcom/camss/Makefile         |    2 +
 drivers/media/platform/qcom/camss/camss-csid-680.c |  422 ++++
 drivers/media/platform/qcom/camss/camss-csid.c     |    4 +-
 drivers/media/platform/qcom/camss/camss-csid.h     |    1 +
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     |  131 +-
 drivers/media/platform/qcom/camss/camss-csiphy.c   |   28 +-
 drivers/media/platform/qcom/camss/camss-csiphy.h   |    1 +
 drivers/media/platform/qcom/camss/camss-vfe-680.c  |  244 +++
 drivers/media/platform/qcom/camss/camss-vfe.c      |    6 +-
 drivers/media/platform/qcom/camss/camss-vfe.h      |    1 +
 drivers/media/platform/qcom/camss/camss.c          |  359 +++-
 drivers/media/platform/qcom/camss/camss.h          |    1 +
 drivers/media/platform/qcom/iris/Makefile          |    4 +-
 drivers/media/platform/qcom/iris/iris_core.h       |    2 +
 drivers/media/platform/qcom/iris/iris_firmware.c   |    4 +-
 .../platform/qcom/iris/iris_platform_common.h      |    4 +
 ...iris_platform_sm8550.c =3D> iris_platform_gen2.c} |  119 ++
 .../platform/qcom/iris/iris_platform_qcs8300.h     |  124 ++
 .../platform/qcom/iris/iris_platform_sm8650.h      |   13 +
 drivers/media/platform/qcom/iris/iris_probe.c      |   59 +-
 drivers/media/platform/qcom/iris/iris_vpu2.c       |    1 +
 drivers/media/platform/qcom/iris/iris_vpu3.c       |  122 --
 drivers/media/platform/qcom/iris/iris_vpu3x.c      |  275 +++
 drivers/media/platform/qcom/iris/iris_vpu_common.c |    4 +-
 drivers/media/platform/qcom/iris/iris_vpu_common.h |    3 +
 drivers/media/platform/qcom/venus/core.c           |   16 +-
 drivers/media/platform/qcom/venus/core.h           |    2 +
 drivers/media/platform/qcom/venus/pm_helpers.c     |   38 +-
 drivers/media/platform/qcom/venus/vdec.c           |   18 +-
 drivers/media/platform/raspberrypi/rp1-cfe/cfe.c   |    1 -
 drivers/media/platform/renesas/Kconfig             |   18 +-
 drivers/media/platform/renesas/Makefile            |    2 +-
 drivers/media/platform/renesas/rcar-csi2.c         |    8 +-
 drivers/media/platform/renesas/rcar-isp/Kconfig    |   18 +
 drivers/media/platform/renesas/rcar-isp/Makefile   |    4 +
 .../renesas/{rcar-isp.c =3D> rcar-isp/csisp.c}       |   57 +-
 .../media/platform/renesas/rcar-vin/rcar-core.c    |    8 +-
 drivers/media/platform/renesas/rcar-vin/rcar-dma.c |  182 +-
 .../media/platform/renesas/rcar-vin/rcar-v4l2.c    |   23 +-
 drivers/media/platform/renesas/rcar-vin/rcar-vin.h |   41 +-
 .../media/platform/renesas/rzg2l-cru/rzg2l-core.c  |  139 +-
 .../platform/renesas/rzg2l-cru/rzg2l-cru-regs.h    |   91 +-
 .../media/platform/renesas/rzg2l-cru/rzg2l-cru.h   |   39 +-
 .../media/platform/renesas/rzg2l-cru/rzg2l-csi2.c  |  165 +-
 .../media/platform/renesas/rzg2l-cru/rzg2l-ip.c    |   13 +-
 .../media/platform/renesas/rzg2l-cru/rzg2l-video.c |  295 ++-
 drivers/media/platform/renesas/vsp1/Makefile       |    2 +-
 drivers/media/platform/renesas/vsp1/vsp1.h         |    4 +
 drivers/media/platform/renesas/vsp1/vsp1_brx.c     |    9 +-
 drivers/media/platform/renesas/vsp1/vsp1_dl.c      |    7 +-
 drivers/media/platform/renesas/vsp1/vsp1_drm.c     |   30 +-
 drivers/media/platform/renesas/vsp1/vsp1_drm.h     |    8 +-
 drivers/media/platform/renesas/vsp1/vsp1_drv.c     |   70 +-
 drivers/media/platform/renesas/vsp1/vsp1_entity.c  |   30 +-
 drivers/media/platform/renesas/vsp1/vsp1_entity.h  |    3 +
 drivers/media/platform/renesas/vsp1/vsp1_hsit.c    |   11 +-
 drivers/media/platform/renesas/vsp1/vsp1_iif.c     |  121 ++
 drivers/media/platform/renesas/vsp1/vsp1_iif.h     |   29 +
 drivers/media/platform/renesas/vsp1/vsp1_pipe.c    |  187 +-
 drivers/media/platform/renesas/vsp1/vsp1_pipe.h    |    6 +
 drivers/media/platform/renesas/vsp1/vsp1_regs.h    |    8 +
 drivers/media/platform/renesas/vsp1/vsp1_rpf.c     |   38 +-
 drivers/media/platform/renesas/vsp1/vsp1_rwpf.c    |   51 +-
 drivers/media/platform/renesas/vsp1/vsp1_sru.c     |    9 +-
 drivers/media/platform/renesas/vsp1/vsp1_uds.c     |    9 +-
 drivers/media/platform/renesas/vsp1/vsp1_video.c   |   50 +-
 drivers/media/platform/renesas/vsp1/vsp1_wpf.c     |   53 +-
 .../media/platform/rockchip/rkisp1/rkisp1-isp.c    |    2 +-
 .../media/platform/rockchip/rkisp1/rkisp1-regs.h   |    7 -
 .../platform/rockchip/rkisp1/rkisp1-resizer.c      |    2 +-
 .../platform/samsung/exynos4-is/fimc-capture.c     |    6 +-
 .../platform/samsung/exynos4-is/fimc-is-regs.c     |    1 +
 .../media/platform/samsung/exynos4-is/fimc-lite.c  |    8 +-
 .../media/platform/samsung/exynos4-is/media-dev.h  |    4 +-
 .../platform/samsung/s3c-camif/camif-capture.c     |   12 +-
 .../media/platform/samsung/s5p-mfc/regs-mfc-v6.h   |    1 +
 drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c   |   14 +
 .../platform/samsung/s5p-mfc/s5p_mfc_common.h      |    1 +
 .../platform/samsung/s5p-mfc/s5p_mfc_opr_v6.c      |    5 +
 drivers/media/platform/st/sti/bdisp/bdisp-debug.c  |    8 +-
 drivers/media/platform/st/sti/bdisp/bdisp-v4l2.c   |   14 +-
 drivers/media/platform/st/sti/delta/delta-debug.c  |    8 +-
 drivers/media/platform/st/stm32/stm32-dcmi.c       |   18 +-
 .../st/stm32/stm32-dcmipp/dcmipp-byteproc.c        |   10 +-
 .../media/platform/synopsys/hdmirx/snps_hdmirx.c   |   14 +-
 drivers/media/platform/ti/am437x/am437x-vpfe.c     |    2 +-
 drivers/media/platform/ti/cal/cal-camerarx.c       |  266 ++-
 drivers/media/platform/ti/cal/cal-video.c          |  157 +-
 drivers/media/platform/ti/cal/cal.c                |   45 +-
 drivers/media/platform/ti/cal/cal.h                |    3 +-
 drivers/media/platform/ti/davinci/vpif.c           |    4 +-
 drivers/media/platform/ti/omap3isp/ispccdc.c       |    8 +-
 drivers/media/platform/ti/omap3isp/ispstat.c       |    6 +-
 drivers/media/platform/ti/omap3isp/ispvideo.c      |   19 +-
 .../media/platform/verisilicon/hantro_postproc.c   |    4 +-
 drivers/media/platform/verisilicon/hantro_v4l2.c   |    1 +
 .../verisilicon/rockchip_vpu981_hw_av1_dec.c       |    4 +
 .../media/platform/verisilicon/rockchip_vpu_hw.c   |   34 +-
 drivers/media/rc/keymaps/rc-hauppauge.c            |   42 +
 drivers/media/test-drivers/vidtv/vidtv_channel.c   |    2 +-
 drivers/media/test-drivers/vim2m.c                 |  327 ++-
 .../media/test-drivers/vivid/vivid-kthread-cap.c   |   20 +-
 drivers/media/test-drivers/vivid/vivid-vid-cap.c   |    8 +-
 drivers/media/usb/dvb-usb/cxusb.c                  |    3 +-
 drivers/media/usb/em28xx/em28xx-video.c            |    2 +-
 drivers/media/usb/gspca/stv06xx/stv06xx_hdcs.c     |    7 +-
 drivers/media/usb/pvrusb2/pvrusb2-std.c            |  167 --
 drivers/media/usb/pvrusb2/pvrusb2-std.h            |    6 -
 drivers/media/usb/uvc/uvc_ctrl.c                   |   91 +-
 drivers/media/usb/uvc/uvc_driver.c                 |   38 +-
 drivers/media/usb/uvc/uvc_v4l2.c                   |  115 +-
 drivers/media/usb/uvc/uvcvideo.h                   |    5 +
 drivers/media/v4l2-core/v4l2-common.c              |   99 +-
 drivers/media/v4l2-core/v4l2-dev.c                 |   14 +-
 drivers/media/v4l2-core/v4l2-ioctl.c               |    7 +-
 drivers/staging/media/atomisp/i2c/Kconfig          |   12 -
 drivers/staging/media/atomisp/i2c/Makefile         |    1 -
 .../staging/media/atomisp/i2c/atomisp-mt9m114.c    | 1612 ---------------
 drivers/staging/media/atomisp/i2c/mt9m114.h        | 1768 ----------------
 drivers/staging/media/atomisp/pci/atomisp_cmd.c    |   73 +-
 .../media/atomisp/pci/atomisp_compat_css20.c       |    2 +-
 .../media/atomisp/pci/atomisp_compat_ioctl32.h     |  244 ---
 drivers/staging/media/atomisp/pci/atomisp_csi2.c   |    2 +-
 .../media/atomisp/pci/atomisp_gmin_platform.c      |   92 +-
 .../staging/media/atomisp/pci/atomisp_internal.h   |   10 +-
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c  |   30 +-
 drivers/staging/media/atomisp/pci/atomisp_ioctl.h  |    4 -
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c   |   60 +-
 .../atomisp/pci/hive_isp_css_common/irq_global.h   |    2 +-
 .../isp/kernels/sdis/sdis_2/ia_css_sdis2_types.h   |    2 +-
 .../pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c     |    2 +-
 .../atomisp/pci/runtime/debug/src/ia_css_debug.c   |    3 +-
 drivers/staging/media/rkvdec/rkvdec-h264.c         |   64 +-
 drivers/staging/media/rkvdec/rkvdec.c              |  239 ++-
 drivers/staging/media/rkvdec/rkvdec.h              |   18 +-
 drivers/staging/media/starfive/camss/stf-isp.c     |    2 +-
 include/media/v4l2-common.h                        |   58 +-
 include/media/vsp1.h                               |    4 +
 include/uapi/linux/cec-funcs.h                     |   40 +-
 include/uapi/linux/media/amlogic/c3-isp-config.h   |  564 +++++
 include/uapi/linux/videodev2.h                     |   18 +-
 320 files changed, 24149 insertions(+), 9062 deletions(-)
 create mode 100644 Documentation/admin-guide/media/c3-isp.dot
 create mode 100644 Documentation/admin-guide/media/c3-isp.rst
 create mode 100644 Documentation/devicetree/bindings/media/amlogic,c3-isp.=
yaml
 create mode 100644 Documentation/devicetree/bindings/media/amlogic,c3-mipi=
-adapter.yaml
 create mode 100644 Documentation/devicetree/bindings/media/amlogic,c3-mipi=
-csi2.yaml
 create mode 100644 Documentation/devicetree/bindings/media/fsl,imx-capture=
-subsystem.yaml
 create mode 100644 Documentation/devicetree/bindings/media/fsl,imx6-mipi-c=
si2.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/ad5820.txt
 create mode 100644 Documentation/devicetree/bindings/media/i2c/adi,ad5820.=
yaml
 rename Documentation/devicetree/bindings/media/i2c/{adp1653.txt =3D> adi,a=
dp1653.txt} (100%)
 rename Documentation/devicetree/bindings/media/i2c/{adv7180.yaml =3D> adi,=
adv7180.yaml} (98%)
 rename Documentation/devicetree/bindings/media/i2c/{adv7343.txt =3D> adi,a=
dv7343.txt} (100%)
 rename Documentation/devicetree/bindings/media/i2c/{adv748x.yaml =3D> adi,=
adv748x.yaml} (98%)
 rename Documentation/devicetree/bindings/media/i2c/{adv7604.yaml =3D> adi,=
adv7604.yaml} (98%)
 rename Documentation/devicetree/bindings/media/i2c/{mt9v032.txt =3D> aptin=
a,mt9v032.txt} (100%)
 rename Documentation/devicetree/bindings/media/i2c/{max2175.txt =3D> maxim=
,max2175.txt} (100%)
 rename Documentation/devicetree/bindings/media/i2c/{mt9m111.txt =3D> micro=
n,mt9m111.txt} (100%)
 rename Documentation/devicetree/bindings/media/i2c/{tda1997x.txt =3D> nxp,=
tda1997x.txt} (100%)
 rename Documentation/devicetree/bindings/media/i2c/{mt9m001.txt =3D> onnn,=
mt9m001.txt} (100%)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov02e1=
0.yaml
 rename Documentation/devicetree/bindings/media/i2c/{ov2640.txt =3D> ovti,o=
v2640.txt} (100%)
 rename Documentation/devicetree/bindings/media/i2c/{ov2659.txt =3D> ovti,o=
v2659.txt} (100%)
 rename Documentation/devicetree/bindings/media/i2c/{ov7670.txt =3D> ovti,o=
v7670.txt} (100%)
 rename Documentation/devicetree/bindings/media/i2c/{ov7740.txt =3D> ovti,o=
v7740.txt} (100%)
 rename Documentation/devicetree/bindings/media/i2c/{ov9650.txt =3D> ovti,o=
v9650.txt} (100%)
 rename Documentation/devicetree/bindings/media/i2c/{imx219.yaml =3D> sony,=
imx219.yaml} (97%)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/st,vd55g1.y=
aml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/st,vd56g3.y=
aml
 rename Documentation/devicetree/bindings/media/i2c/{ths8200.txt =3D> ti,th=
s8200.txt} (100%)
 rename Documentation/devicetree/bindings/media/i2c/{tvp514x.txt =3D> ti,tv=
p514x.txt} (100%)
 rename Documentation/devicetree/bindings/media/i2c/{tvp5150.txt =3D> ti,tv=
p5150.txt} (100%)
 rename Documentation/devicetree/bindings/media/i2c/{tvp7002.txt =3D> ti,tv=
p7002.txt} (100%)
 rename Documentation/devicetree/bindings/media/i2c/{tc358743.txt =3D> tosh=
iba,tc358743.txt} (100%)
 delete mode 100644 Documentation/devicetree/bindings/media/imx.txt
 create mode 100644 Documentation/devicetree/bindings/media/qcom,x1e80100-c=
amss.yaml
 create mode 100644 Documentation/userspace-api/media/v4l/metafmt-c3-isp.rst
 create mode 100644 drivers/media/i2c/ds90ub953.h
 create mode 100644 drivers/media/i2c/ov02c10.c
 create mode 100644 drivers/media/i2c/ov02e10.c
 create mode 100644 drivers/media/i2c/vd55g1.c
 create mode 100644 drivers/media/i2c/vd56g3.c
 delete mode 100644 drivers/media/pci/sta2x11/Kconfig
 delete mode 100644 drivers/media/pci/sta2x11/Makefile
 delete mode 100644 drivers/media/pci/sta2x11/sta2x11_vip.c
 delete mode 100644 drivers/media/pci/sta2x11/sta2x11_vip.h
 create mode 100644 drivers/media/platform/amlogic/c3/Kconfig
 create mode 100644 drivers/media/platform/amlogic/c3/Makefile
 create mode 100644 drivers/media/platform/amlogic/c3/isp/Kconfig
 create mode 100644 drivers/media/platform/amlogic/c3/isp/Makefile
 create mode 100644 drivers/media/platform/amlogic/c3/isp/c3-isp-capture.c
 create mode 100644 drivers/media/platform/amlogic/c3/isp/c3-isp-common.h
 create mode 100644 drivers/media/platform/amlogic/c3/isp/c3-isp-core.c
 create mode 100644 drivers/media/platform/amlogic/c3/isp/c3-isp-dev.c
 create mode 100644 drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
 create mode 100644 drivers/media/platform/amlogic/c3/isp/c3-isp-regs.h
 create mode 100644 drivers/media/platform/amlogic/c3/isp/c3-isp-resizer.c
 create mode 100644 drivers/media/platform/amlogic/c3/isp/c3-isp-stats.c
 create mode 100644 drivers/media/platform/amlogic/c3/mipi-adapter/Kconfig
 create mode 100644 drivers/media/platform/amlogic/c3/mipi-adapter/Makefile
 create mode 100644 drivers/media/platform/amlogic/c3/mipi-adapter/c3-mipi-=
adap.c
 create mode 100644 drivers/media/platform/amlogic/c3/mipi-csi2/Kconfig
 create mode 100644 drivers/media/platform/amlogic/c3/mipi-csi2/Makefile
 create mode 100644 drivers/media/platform/amlogic/c3/mipi-csi2/c3-mipi-csi=
2.c
 create mode 100644 drivers/media/platform/qcom/camss/camss-csid-680.c
 create mode 100644 drivers/media/platform/qcom/camss/camss-vfe-680.c
 rename drivers/media/platform/qcom/iris/{iris_platform_sm8550.c =3D> iris_=
platform_gen2.c} (61%)
 create mode 100644 drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
 create mode 100644 drivers/media/platform/qcom/iris/iris_platform_sm8650.h
 delete mode 100644 drivers/media/platform/qcom/iris/iris_vpu3.c
 create mode 100644 drivers/media/platform/qcom/iris/iris_vpu3x.c
 create mode 100644 drivers/media/platform/renesas/rcar-isp/Kconfig
 create mode 100644 drivers/media/platform/renesas/rcar-isp/Makefile
 rename drivers/media/platform/renesas/{rcar-isp.c =3D> rcar-isp/csisp.c} (=
90%)
 create mode 100644 drivers/media/platform/renesas/vsp1/vsp1_iif.c
 create mode 100644 drivers/media/platform/renesas/vsp1/vsp1_iif.h
 delete mode 100644 drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
 delete mode 100644 drivers/staging/media/atomisp/i2c/mt9m114.h
 delete mode 100644 drivers/staging/media/atomisp/pci/atomisp_compat_ioctl3=
2.h
 create mode 100644 include/uapi/linux/media/amlogic/c3-isp-config.h

