Return-Path: <linux-media+bounces-18467-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AFEE897EA3A
	for <lists+linux-media@lfdr.de>; Mon, 23 Sep 2024 12:56:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 09F1C1F21BB1
	for <lists+linux-media@lfdr.de>; Mon, 23 Sep 2024 10:56:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 935EA197A83;
	Mon, 23 Sep 2024 10:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eQWt/F1G"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F6D6D1B4;
	Mon, 23 Sep 2024 10:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727089008; cv=none; b=k03vebMY6JofBun0w+vsjkw7TWDYQnWzVB7br8CCHL+R8icP3yVc76NxPUhmlYZj+om/eK8h7AAE2vOqcraJbIn+1YZPKcOdcaQHO/tUoS1J6wr5uQb/5EhiCPYj1J33/2AoGQgh40XBptDR7WBKeLTwwhVgwbgoohTpx8zypiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727089008; c=relaxed/simple;
	bh=RP45ER8D4v5tl4q1UftwWDRHy/SzzHuDAQZ0MZfd4e0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=hcEl6amPBJ3C8DtcsNnVPaS6tkY1cUH3+Yk6pultoEkyuRXuI2UlgL2kCUlJqUEvez1bKUmc1mpZtS+2BteSasw1Sv07AZpwqP+5Knx60qX6bB3wWTu0Tn7ge0rU9SCUwx9t5bKgzBGrkUzMAjNvUDSf3KMwRDfBv4GyRHy8I44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eQWt/F1G; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 408D2C4CEC5;
	Mon, 23 Sep 2024 10:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727089007;
	bh=RP45ER8D4v5tl4q1UftwWDRHy/SzzHuDAQZ0MZfd4e0=;
	h=Date:From:To:Cc:Subject:From;
	b=eQWt/F1GNNWYLxMqVkgdJBUqrMUWsbXOHqC2BoBl1VHOf2l9Jj7GckqtdLTWZjj8F
	 qDOE+gOR0ph4vneUWlsph2aJ7hmIPj2Rdmv8wpf8rPY4ZeIYo3zVyJcS/HdIKvWc3b
	 b+fkezhKGNBS5eLfDKgdvFUd3jaHoB3WHVsSueV/5TMyowCWJ+Vgw8Qt1vf4atAByT
	 3GFxskuH4GSMrNphUAr+ChEq+165KN6TRgPXUzt/ZaJBNMI7yY7eiCVaq3mDF7n5q6
	 xVVWn5kE87+L+pvc/9Knly9YyskoWiSMk6pNlakf9Kq2L/7APSZVN0NXCQrmvGfvQH
	 jMgvmWpDl3jcA==
Date: Mon, 23 Sep 2024 12:56:42 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton
 <akpm@linux-foundation.org>, Linux Media Mailing List
 <linux-media@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>
Subject: [GIT PULL for v6.12-rc1] media updates
Message-ID: <20240923125642.7aed968b@foz.lan>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Importance: high
X-Priority: 1 (Highest)
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
dia/v6.12-1

For:

- New CEC driver: Extron DA HD 4K Plus;
- Lots of driver fixes, cleanups and improvements.

Regards,
Mauro

---

The following changes since commit de9c2c66ad8e787abec7c9d7eff4f8c3cdd28aed:

  Linux 6.11-rc2 (2024-08-04 13:50:53 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/me=
dia/v6.12-1

for you to fetch changes up to 81ee62e8d09ee3c7107d11c8bbfd64073ab601ad:

  media: atomisp: Use clamp() in ia_css_eed1_8_vmem_encode() (2024-09-10 07=
:30:36 +0200)

----------------------------------------------------------------
media updates for v6.12-rc1

----------------------------------------------------------------
Alex Bee (1):
      dt-bindings: media: rockchip,vpu: Document RK3128 compatible

Alexander Shiyan (1):
      media: i2c: ar0521: Use cansleep version of gpiod_set_value()

Alexander Stein (2):
      media: verisilicon: Move Rockchip hardware drivers to the correspondi=
ng option
      media: verisilicon: Move Rockchip AV1 hardware drivers to the corresp=
onding option

Anastasia Belova (1):
      media: coda: cast an operand of multiplication to a larger type

Andy Shevchenko (3):
      media: atomisp: Remove duplicated leftover, i.e. sh_css_dvs_info.h
      media: atomisp: Replace rarely used macro from math_support.h
      media: atomisp: Simplify ia_css_pipe_create_cas_scaler_desc_single_ou=
tput()

Benjamin Gaignard (4):
      media: verisilicon: AV1: Be more flexible with postproc capabilities
      media: verisilicon: Fix auxiliary buffer allocation size
      media: verisilicon: AV1: Correct some sizes/positions on register fie=
lds
      media: verisilicon: Add reference buffer compression feature

Biju Das (5):
      media: dt-bindings: media: renesas,vsp1: Document RZ/G2UL VSPD bindin=
gs
      media: dt-bindings: media: renesas,fcp: Document RZ/G2UL FCPVD bindin=
gs
      media: platform: rzg2l-cru: rzg2l-csi2: Add missing MODULE_DEVICE_TAB=
LE
      media: mt9p031: Extend match support for OF tables
      media: mt9p031: Drop CONFIG_OF ifdeffery

Bryan O'Donoghue (3):
      media: qcom: camss: Remove use_count guard in stop_streaming
      media: qcom: camss: Fix ordering of pm_runtime_enable
      media: ov5675: Fix power on/off delay timings

Changhuang Liang (2):
      staging: media: starfive: Add the dynamic resolution support
      media: MAINTAINERS: Add "qcom," substring for Qualcomm Camera Subsyst=
em

Chen Ni (1):
      media: i2c: thp7312: Convert comma to semicolon

Christian Hewitt (2):
      dt-bindings: media: amlogic,gx-vdec: add the GXLX SoC family and upda=
te GXL
      media: meson: vdec: add GXLX SoC platform

Christophe JAILLET (6):
      media: i2c: tvp5150: Constify some structures
      media: platform: allegro-dvt: Constify struct regmap_config
      media: ti: cal: Constify struct media_entity_operations
      media: venus: Constify struct dec_bufsize_ops and enc_bufsize_ops
      media: mediatek: vcodec: Constify struct vb2_ops
      media: atomisp: Use clamp() in ia_css_eed1_8_vmem_encode()

Colin Ian King (2):
      media: i2c: GC05A2: Fix spelling mistake "Horizental" -> "Horizontal"
      media: i2c: GC08A3: Fix spelling mistake "STRAEMING_REG" -> "STREAMIN=
G_REG"

Deborah Brouwer (1):
      media: vicodec: allow en/decoder cmd w/o CAPTURE

Emmanuel Gil Peyrot (1):
      media: dt-bindings: rk3568-vepu: Add RK3588 VEPU121

Erling Ljunggren (3):
      media: videodev2.h: add V4L2_CAP_EDID
      media: v4l2-dev: handle V4L2_CAP_EDID
      media: docs: Add V4L2_CAP_EDID

Fabio Estevam (2):
      media: imx-mipi-csis: Switch to RUNTIME_PM_OPS()
      media: imx8mq-mipi-csi2: Switch to RUNTIME/SYSTEM_SLEEP_PM_OPS()

Fritz Koenig (2):
      Documentation: media: Fix v4l2_av1_segmentation table formatting
      Documentation: media: Fix AV1 struct documentation

Geert Uytterhoeven (2):
      media: raspberrypi: VIDEO_RASPBERRYPI_PISP_BE should depend on ARCH_B=
CM2835
      media: imagination: VIDEO_E5010_JPEG_ENC should depend on ARCH_K3

Hans Verkuil (19):
      media: cec: core: add new CEC_MSG_FL_REPLY_VENDOR_ID flag
      media: vivid: add <Vendor Command With ID> support
      media: uapi/linux/cec.h: cec_msg_set_reply_to: zero flags
      media: cec: cec-adap.c: improve CEC_MSG_FL_REPLY_VENDOR_ID check
      Documentation: media: vivid.rst: update TODO list
      Documentation: media: add missing V4L2_BUF_CAP_ flags
      media: v4l2-core: v4l2-ioctl: missing ', ' in create_bufs logging
      Documentation: media: move Memory Consistency Flags
      Merge tag 'next-media-rkisp1-20240814' of git://git.kernel.org/pub/sc=
m/linux/kernel/git/pinchartl/linux.git
      Merge tag 'tags/next-media-misc-20240825' of git://git.kernel.org/pub=
/scm/linux/kernel/git/pinchartl/linux.git
      Merge tag 'tags/next-media-imx-20240825' of git://git.kernel.org/pub/=
scm/linux/kernel/git/pinchartl/linux.git
      Merge tag 'tags/next-media-renesas-20240825' of git://git.kernel.org/=
pub/scm/linux/kernel/git/pinchartl/linux.git
      Merge tag 'next-media-20240826' of git://git.kernel.org/pub/scm/linux=
/kernel/git/pinchartl/linux.git
      Merge tag 'tags/next-media-videobuf-20240827' of git://git.kernel.org=
/pub/scm/linux/kernel/git/pinchartl/linux.git
      media: input: serio.h: add SERIO_EXTRON_DA_HD_PLUS
      media: cec: move cec_get/put_device to header
      media: cec: extron-da-hd-4k-plus: add the Extron DA HD 4K Plus CEC dr=
iver
      media: atomisp: add missing wait_prepare/finish ops
      media: atomisp: set lock before calling vb2_queue_init()

Hans de Goede (4):
      media: atomisp: csi2-bridge: Add DMI quirk for t4ka3 on Xiaomi Mipad2
      media: atomisp: Drop dev_dbg() calls from hmm_[alloc|free]()
      media: atomisp: Improve binary finding debug logging
      media: atomisp: Fix eed1_8 code assigning signed values to an unsigne=
d variable

Hongbo Li (1):
      media: intel/ipu6: make use of dev_err_cast_probe()

Jacopo Mondi (7):
      media: uapi: rkisp1-config: Add extensible params format
      media: uapi: videodev2: Add V4L2_META_FMT_RK_ISP1_EXT_PARAMS
      media: rkisp1: Add struct rkisp1_params_buffer
      media: rkisp1: Copy the parameters buffer
      media: rkisp1: Cache the currently active format
      media: rkisp1: Implement extensible params support
      media: rkisp1: Implement s_fmt/try_fmt

Javier Carrasco (2):
      media: i2c: tda1997x: constify snd_soc_component_driver struct
      media: docs: Fix newline typos in capture.c

Jianfeng Liu (1):
      media: dt-bindings: rockchip-vpu: Add RK3588 VPU121

Julien Massot (2):
      media: i2c: max96717: coding style fixes
      media: i2c: max96714: coding style fixes

Junlin Li (2):
      drivers: media: dvb-frontends/rtl2832: fix an out-of-bounds write err=
or
      drivers: media: dvb-frontends/rtl2830: fix an out-of-bounds write err=
or

Kartik Kulkarni (1):
      media: atomisp: bnr: fix trailing statement

Kathara Sasikumar (1):
      media: atomisp: Fix trailing statement in ia_css_de.host.c

Kuninori Morimoto (4):
      media: platform: microchip: use for_each_endpoint_of_node()
      media: platform: ti: use for_each_endpoint_of_node()
      media: platform: xilinx: use for_each_endpoint_of_node()
      staging: media: atmel: use for_each_endpoint_of_node()

Laurent Pinchart (11):
      media: rkisp1: Add helper function to swap colour channels
      media: rkisp1: Add features mask to extensible block handlers
      media: v4l2-mc: Mark v4l2_pipeline_link_notify() as deprecated
      media: Documentation: mc: Replace deprecated graph walk API
      media: microchip-isc: Drop v4l2_subdev_link_validate() for video devi=
ces
      media: sun4i_csi: Implement link validate for sun4i_csi subdev
      media: sun4i_csi: Don't use v4l2_subdev_link_validate() for video dev=
ice
      media: v4l2-subdev: Refactor warnings in v4l2_subdev_link_validate()
      media: v4l2-subdev: Support hybrid links in v4l2_subdev_link_validate=
()
      media: renesas: vsp1: Implement .link_validate() for video devices
      media: videobuf2: Drop minimum allocation requirement of 2 buffers

Li Zetao (2):
      media: atomisp: use clamp() in ia_css_eed1_8_encode()
      media: atomisp: use clamp() in compute_coring()

Liao Chen (2):
      media: i2c: mt9v111: Enable module autoloading
      media: i2c: mt9v111: Drop redundant comma

Lu Baolu (1):
      media: venus: firmware: Use iommu_paging_domain_alloc()

Luca Weiss (1):
      media: dt-bindings: qcom,sc7280-venus: Allow one IOMMU entry

Martin T=C5=AFma (4):
      media: mgb4: Add support for YUV image formats
      media: mgb4: Add support for V4L2_CAP_TIMEPERFRAME
      media: mgb4: Fixed signal frame rate limit handling
      media: admin-guide: mgb4: Outputs DV timings documentation update

Matthias Fend (1):
      media: imx-mipi-csis: avoid logging while holding spinlock

Mauro Carvalho Chehab (1):
      Merge tag 'v6.11-rc2' into media_stage

Max Staudt (3):
      staging: media: ipu3: Drop superfluous check in imgu_vb2_stop_streami=
ng()
      staging: media: ipu3: Return buffers outside of needless locking
      staging: media: ipu3: Stop streaming in inverse order of starting

Michael Tretter (1):
      media: verisilicon: Use fourcc format string

Nicolas Dufresne (4):
      docs: uapi: media: Properly locate NV12MT diagram
      docs: uapi: media: Move NV12_10BE_8L128 to NV15 section
      docs: uapi: media: Add a layout diagram for MT2110T
      docs: uapi: media: Document Mediatek 10bit tiled formats

Niklas S=C3=B6derlund (3):
      dt-bindings: media: renesas,vin: Add Gen4 family fallback
      media: rcar-vin: Add family compatible for R-Car Gen4 family
      dt-bindings: media: renesas,vin: Add binding for V4M

Ondrej Jirman (1):
      media: rkisp1: Adapt to different SoCs having different size limits

Paul Elder (3):
      media: rkisp1: Add register definitions for the companding block
      media: rkisp1: Add feature flags for BLS and compand
      media: rkisp1: Add support for the companding block

Ricardo Ribalda (17):
      media: siano: Simplify smscore_load_firmware_from_file
      media: imx-pxp: Rewrite coeff expression
      media: venus: Refactor struct hfi_uncompressed_plane_info
      media: venus: Refactor struct hfi_session_get_property_pkt
      media: venus: Refactor struct hfi_uncompressed_format_supported
      media: venus: Refactor hfi_session_empty_buffer_uncompressed_plane0_p=
kt
      media: venus: Refactor hfi_session_empty_buffer_compressed_pkt
      media: venus: Refactor hfi_sys_get_property_pkt
      media: venus: Refactor hfi_session_fill_buffer_pkt
      media: venus: Refactor hfi_buffer_alloc_mode_supported
      media: venus: Convert one-element-arrays to flex-arrays
      media: ar0521: Refactor ar0521_power_off()
      media: i2c: ov5645: Refactor ov5645_set_power_off()
      media: i2c: s5c73m3: Move clk_prepare to its own function
      media: tc358746: Move clk_prepare to its own function
      media: meson: vdec_1: Refactor vdec_1_stop()
      media: meson: vdec: hevc: Refactor vdec_hevc_start and vdec_hevc_stop

Robert Mader (1):
      media: i2c: imx355: Parse and register properties

Roman Smirnov (1):
      Revert "media: tuners: fix error return code of hybrid_tuner_request_=
state()"

Roshan Khatri (3):
      media: atomisp: Fix spelling mistake in csi_rx_public.h
      media: atomisp: Fix spelling mistakes in atomisp_platform.h
      media: atomisp: Fix spelling mistakes in atomisp.h

Sakari Ailus (1):
      media: Documentation: Fix spelling of "blanking"

Sakirnth Nagarasa (1):
      media: atomisp: move trailing statement to next line.

Sean Young (1):
      media: rc: remove unused tx_resolution field

Sebastian Reichel (2):
      media: hantro: Disable multicore support
      media: hantro: Add RK3588 VEPU121

Sergio de Almeida Cipriano Junior (1):
      media: atomisp: move trailing */ to separate lines

Tommaso Merciai (1):
      media: i2c: max96717: add test pattern ctrl

Umang Jain (3):
      media: imx283: Add 3/3 binning mode
      dt-bindings: media: imx335: Add reset-gpios to the DT example
      media: imx335: Fix reset-gpio handling

Uwe Kleine-K=C3=B6nig (2):
      media: Drop explicit initialization of struct i2c_device_id::driver_d=
ata to 0
      media: staging: media: starfive: camss: Drop obsolete return value do=
cumentation

Vladimir Zapolskiy (6):
      media: dt-bindings: Add OmniVision OG01A1B image sensor
      media: i2c: og01a1b: Add OF support to the image sensor driver
      media: i2c: og01a1b: Add stubs of runtime power management functions
      media: i2c: og01a1b: Add support of xvclk supply clock in power manag=
ement
      media: i2c: og01a1b: Add management of optional reset GPIO
      media: i2c: og01a1b: Add management of optional sensor supply lines

Wolfram Sang (8):
      media: allegro: use 'time_left' variable with wait_for_completion_tim=
eout()
      media: atmel-isi: use 'time_left' variable with wait_for_completion_t=
imeout()
      media: bdisp: use 'time_left' variable with wait_event_timeout()
      media: fimc-is: use 'time_left' variable with wait_event_timeout()
      media: platform: exynos-gsc: use 'time_left' variable with wait_event=
_timeout()
      media: solo6x10: use 'time_left' variable with wait_for_completion_ti=
meout()
      media: tegra-vde: use 'time_left' variable with wait_for_completion_i=
nterruptible_timeout()
      media: ti: cal: use 'time_left' variable with wait_event_timeout()

Yue Haibing (2):
      media: ccs: Remove unused declarations
      media: siano: Remove unused declarations

Yunfei Dong (3):
      media: mediatek: vcodec: Fix H264 multi stateless decoder smatch warn=
ing
      media: mediatek: vcodec: Fix VP8 stateless decoder smatch warning
      media: mediatek: vcodec: Fix H264 stateless decoder smatch warning

Yunke Cao (4):
      media: videobuf2-core: clear memory related fields in __vb2_plane_dma=
buf_put()
      media: videobuf2-core: release all planes first in __prepare_dmabuf()
      media: videobuf2-core: reverse the iteration order in __vb2_buf_dmabu=
f_put
      media: videobuf2-core: attach once if multiple planes share the same =
dbuf

Zelong Dong (1):
      media: rc: meson-ir: support PM suspend/resume

Zhang Zekun (1):
      media: atomisp: Remove unused declaration

Zheng Wang (1):
      media: venus: fix use after free bug in venus_remove due to race cond=
ition

 Documentation/admin-guide/media/cec.rst            |   87 +
 Documentation/admin-guide/media/mgb4.rst           |   23 +-
 Documentation/admin-guide/media/rkisp1.rst         |   11 +-
 Documentation/admin-guide/media/vivid.rst          |    4 +-
 .../devicetree/bindings/media/amlogic,gx-vdec.yaml |    3 +-
 .../bindings/media/i2c/ovti,og01a1b.yaml           |  107 ++
 .../devicetree/bindings/media/i2c/sony,imx335.yaml |    4 +
 .../bindings/media/qcom,sc7280-venus.yaml          |    1 +
 .../devicetree/bindings/media/renesas,fcp.yaml     |    2 +
 .../devicetree/bindings/media/renesas,vin.yaml     |    4 +
 .../devicetree/bindings/media/renesas,vsp1.yaml    |    1 +
 .../bindings/media/rockchip,rk3568-vepu.yaml       |    1 +
 .../devicetree/bindings/media/rockchip-vpu.yaml    |    7 +-
 Documentation/driver-api/media/mc-core.rst         |   67 +-
 .../media/cec/cec-ioc-adap-g-caps.rst              |    6 +
 .../userspace-api/media/cec/cec-ioc-receive.rst    |   15 +
 Documentation/userspace-api/media/v4l/biblio.rst   |   11 +
 Documentation/userspace-api/media/v4l/buffer.rst   |   35 -
 .../userspace-api/media/v4l/capture.c.rst          |    6 +-
 .../media/v4l/ext-ctrls-codec-stateless.rst        |   20 +-
 .../media/v4l/ext-ctrls-image-process.rst          |    2 +-
 .../userspace-api/media/v4l/metafmt-rkisp1.rst     |   57 +-
 Documentation/userspace-api/media/v4l/mt2110t.svg  |  315 ++++
 .../userspace-api/media/v4l/pixfmt-reserved.rst    |   13 -
 .../userspace-api/media/v4l/pixfmt-yuv-planar.rst  |  181 +-
 .../userspace-api/media/v4l/vidioc-querycap.rst    |   11 +
 .../userspace-api/media/v4l/vidioc-reqbufs.rst     |   40 +-
 .../userspace-api/media/videodev2.h.rst.exceptions |    1 +
 MAINTAINERS                                        |   10 +-
 drivers/media/cec/core/cec-adap.c                  |   53 +-
 drivers/media/cec/core/cec-api.c                   |    4 +-
 drivers/media/cec/core/cec-core.c                  |   31 +-
 drivers/media/cec/core/cec-priv.h                  |    2 -
 drivers/media/cec/usb/Kconfig                      |    1 +
 drivers/media/cec/usb/Makefile                     |    1 +
 drivers/media/cec/usb/extron-da-hd-4k-plus/Kconfig |   14 +
 .../media/cec/usb/extron-da-hd-4k-plus/Makefile    |    8 +
 .../cec/usb/extron-da-hd-4k-plus/cec-splitter.c    |  657 +++++++
 .../cec/usb/extron-da-hd-4k-plus/cec-splitter.h    |   51 +
 .../extron-da-hd-4k-plus/extron-da-hd-4k-plus.c    | 1836 ++++++++++++++++=
++++
 .../extron-da-hd-4k-plus/extron-da-hd-4k-plus.h    |  118 ++
 drivers/media/common/siano/smscoreapi.c            |   15 +-
 drivers/media/common/siano/smscoreapi.h            |   10 -
 drivers/media/common/videobuf2/videobuf2-core.c    |  166 +-
 drivers/media/dvb-frontends/a8293.c                |    2 +-
 drivers/media/dvb-frontends/af9013.c               |    2 +-
 drivers/media/dvb-frontends/af9033.c               |    2 +-
 drivers/media/dvb-frontends/au8522_decoder.c       |    2 +-
 drivers/media/dvb-frontends/cxd2099.c              |    2 +-
 drivers/media/dvb-frontends/cxd2820r_core.c        |    2 +-
 drivers/media/dvb-frontends/lgdt3306a.c            |    2 +-
 drivers/media/dvb-frontends/lgdt330x.c             |    2 +-
 drivers/media/dvb-frontends/mn88472.c              |    2 +-
 drivers/media/dvb-frontends/mn88473.c              |    2 +-
 drivers/media/dvb-frontends/mxl692.c               |    2 +-
 drivers/media/dvb-frontends/rtl2830.c              |    4 +-
 drivers/media/dvb-frontends/rtl2832.c              |    4 +-
 drivers/media/dvb-frontends/si2165.c               |    2 +-
 drivers/media/dvb-frontends/si2168.c               |    2 +-
 drivers/media/dvb-frontends/sp2.c                  |    2 +-
 drivers/media/dvb-frontends/stv090x.c              |    2 +-
 drivers/media/dvb-frontends/stv6110x.c             |    2 +-
 drivers/media/dvb-frontends/tda10071.c             |    2 +-
 drivers/media/dvb-frontends/ts2020.c               |    4 +-
 drivers/media/i2c/ad5820.c                         |    4 +-
 drivers/media/i2c/adp1653.c                        |    2 +-
 drivers/media/i2c/adv7170.c                        |    4 +-
 drivers/media/i2c/adv7175.c                        |    4 +-
 drivers/media/i2c/adv7183.c                        |    4 +-
 drivers/media/i2c/adv7343.c                        |    4 +-
 drivers/media/i2c/adv7393.c                        |    4 +-
 drivers/media/i2c/adv7511-v4l2.c                   |    2 +-
 drivers/media/i2c/adv7842.c                        |    2 +-
 drivers/media/i2c/ak881x.c                         |    4 +-
 drivers/media/i2c/ar0521.c                         |   22 +-
 drivers/media/i2c/bt819.c                          |    6 +-
 drivers/media/i2c/bt856.c                          |    2 +-
 drivers/media/i2c/bt866.c                          |    2 +-
 drivers/media/i2c/ccs/ccs-reg-access.h             |    3 -
 drivers/media/i2c/cs3308.c                         |    2 +-
 drivers/media/i2c/cs5345.c                         |    2 +-
 drivers/media/i2c/cs53l32a.c                       |    2 +-
 drivers/media/i2c/cx25840/cx25840-core.c           |    2 +-
 drivers/media/i2c/ds90ub913.c                      |    5 +-
 drivers/media/i2c/dw9714.c                         |    4 +-
 drivers/media/i2c/et8ek8/et8ek8_driver.c           |    2 +-
 drivers/media/i2c/gc05a2.c                         |    2 +-
 drivers/media/i2c/gc08a3.c                         |    2 +-
 drivers/media/i2c/imx274.c                         |    2 +-
 drivers/media/i2c/imx283.c                         |   33 +
 drivers/media/i2c/imx335.c                         |    9 +-
 drivers/media/i2c/imx355.c                         |   12 +-
 drivers/media/i2c/isl7998x.c                       |    4 +-
 drivers/media/i2c/ks0127.c                         |    6 +-
 drivers/media/i2c/lm3560.c                         |    4 +-
 drivers/media/i2c/lm3646.c                         |    2 +-
 drivers/media/i2c/m52790.c                         |    2 +-
 drivers/media/i2c/max2175.c                        |    4 +-
 drivers/media/i2c/max96714.c                       |   18 +-
 drivers/media/i2c/max96717.c                       |  236 ++-
 drivers/media/i2c/ml86v7667.c                      |    4 +-
 drivers/media/i2c/msp3400-driver.c                 |    2 +-
 drivers/media/i2c/mt9m001.c                        |    2 +-
 drivers/media/i2c/mt9m111.c                        |    2 +-
 drivers/media/i2c/mt9p031.c                        |   38 +-
 drivers/media/i2c/mt9t112.c                        |    2 +-
 drivers/media/i2c/mt9v011.c                        |    2 +-
 drivers/media/i2c/mt9v111.c                        |    3 +-
 drivers/media/i2c/og01a1b.c                        |  187 +-
 drivers/media/i2c/ov13858.c                        |    4 +-
 drivers/media/i2c/ov2640.c                         |    2 +-
 drivers/media/i2c/ov2659.c                         |    4 +-
 drivers/media/i2c/ov5640.c                         |    4 +-
 drivers/media/i2c/ov5645.c                         |   17 +-
 drivers/media/i2c/ov5647.c                         |    2 +-
 drivers/media/i2c/ov5675.c                         |   12 +-
 drivers/media/i2c/ov6650.c                         |    2 +-
 drivers/media/i2c/ov7640.c                         |    2 +-
 drivers/media/i2c/ov772x.c                         |    2 +-
 drivers/media/i2c/ov7740.c                         |    2 +-
 drivers/media/i2c/ov9640.c                         |    2 +-
 drivers/media/i2c/ov9650.c                         |    4 +-
 drivers/media/i2c/rj54n1cb0c.c                     |    2 +-
 drivers/media/i2c/s5c73m3/s5c73m3-core.c           |   15 +-
 drivers/media/i2c/s5k5baf.c                        |    4 +-
 drivers/media/i2c/saa6588.c                        |    2 +-
 drivers/media/i2c/saa6752hs.c                      |    2 +-
 drivers/media/i2c/saa7110.c                        |    2 +-
 drivers/media/i2c/saa717x.c                        |    2 +-
 drivers/media/i2c/saa7185.c                        |    2 +-
 drivers/media/i2c/sony-btf-mpx.c                   |    2 +-
 drivers/media/i2c/tc358743.c                       |    2 +-
 drivers/media/i2c/tc358746.c                       |   12 +-
 drivers/media/i2c/tda1997x.c                       |    2 +-
 drivers/media/i2c/tda7432.c                        |    2 +-
 drivers/media/i2c/tda9840.c                        |    2 +-
 drivers/media/i2c/tea6415c.c                       |    2 +-
 drivers/media/i2c/tea6420.c                        |    2 +-
 drivers/media/i2c/thp7312.c                        |    2 +-
 drivers/media/i2c/ths7303.c                        |    6 +-
 drivers/media/i2c/ths8200.c                        |    4 +-
 drivers/media/i2c/tlv320aic23b.c                   |    2 +-
 drivers/media/i2c/tvaudio.c                        |    2 +-
 drivers/media/i2c/tvp5150.c                        |    6 +-
 drivers/media/i2c/tvp7002.c                        |    2 +-
 drivers/media/i2c/tw2804.c                         |    2 +-
 drivers/media/i2c/tw9900.c                         |    2 +-
 drivers/media/i2c/tw9903.c                         |    2 +-
 drivers/media/i2c/tw9906.c                         |    2 +-
 drivers/media/i2c/tw9910.c                         |    2 +-
 drivers/media/i2c/uda1342.c                        |    2 +-
 drivers/media/i2c/upd64031a.c                      |    2 +-
 drivers/media/i2c/upd64083.c                       |    2 +-
 drivers/media/i2c/vp27smpx.c                       |    2 +-
 drivers/media/i2c/vpx3220.c                        |    6 +-
 drivers/media/i2c/wm8739.c                         |    2 +-
 drivers/media/i2c/wm8775.c                         |    2 +-
 drivers/media/pci/intel/ipu6/ipu6.c                |   20 +-
 drivers/media/pci/mgb4/mgb4_core.c                 |    2 +-
 drivers/media/pci/mgb4/mgb4_core.h                 |    2 +
 drivers/media/pci/mgb4/mgb4_io.h                   |   29 +-
 drivers/media/pci/mgb4/mgb4_sysfs_out.c            |    9 +-
 drivers/media/pci/mgb4/mgb4_vin.c                  |  193 +-
 drivers/media/pci/mgb4/mgb4_vin.h                  |    3 +-
 drivers/media/pci/mgb4/mgb4_vout.c                 |  309 +++-
 drivers/media/pci/mgb4/mgb4_vout.h                 |    5 +-
 drivers/media/pci/solo6x10/solo6x10-p2m.c          |    8 +-
 drivers/media/platform/allegro-dvt/allegro-core.c  |   28 +-
 drivers/media/platform/atmel/atmel-isi.c           |    8 +-
 drivers/media/platform/chips-media/coda/coda-bit.c |    2 +-
 drivers/media/platform/imagination/Kconfig         |    1 +
 .../vcodec/decoder/mtk_vcodec_dec_stateful.c       |    2 +-
 .../vcodec/decoder/mtk_vcodec_dec_stateless.c      |    2 +-
 .../vcodec/decoder/vdec/vdec_h264_req_if.c         |    9 +-
 .../vcodec/decoder/vdec/vdec_h264_req_multi_if.c   |    9 +-
 .../mediatek/vcodec/decoder/vdec/vdec_vp8_req_if.c |   10 +-
 .../media/platform/microchip/microchip-isc-base.c  |   19 +-
 .../platform/microchip/microchip-sama5d2-isc.c     |   21 +-
 .../platform/microchip/microchip-sama7g5-isc.c     |   21 +-
 drivers/media/platform/nvidia/tegra-vde/h264.c     |   10 +-
 drivers/media/platform/nxp/imx-mipi-csis.c         |   19 +-
 drivers/media/platform/nxp/imx-pxp.h               |    9 +-
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c      |   17 +-
 drivers/media/platform/qcom/camss/camss-video.c    |    6 -
 drivers/media/platform/qcom/camss/camss.c          |    5 +-
 drivers/media/platform/qcom/venus/core.c           |    1 +
 drivers/media/platform/qcom/venus/firmware.c       |    6 +-
 drivers/media/platform/qcom/venus/hfi_cmds.c       |    8 +-
 drivers/media/platform/qcom/venus/hfi_cmds.h       |   16 +-
 drivers/media/platform/qcom/venus/hfi_helper.h     |   20 +-
 drivers/media/platform/qcom/venus/hfi_parser.c     |    2 +-
 .../media/platform/qcom/venus/hfi_plat_bufs_v6.c   |   20 +-
 drivers/media/platform/raspberrypi/pisp_be/Kconfig |    1 +
 .../media/platform/renesas/rcar-vin/rcar-core.c    |   21 +-
 .../media/platform/renesas/rzg2l-cru/rzg2l-csi2.c  |    1 +
 drivers/media/platform/renesas/vsp1/vsp1_video.c   |   22 +
 .../media/platform/rockchip/rkisp1/rkisp1-common.c |   14 +
 .../media/platform/rockchip/rkisp1/rkisp1-common.h |   49 +-
 .../media/platform/rockchip/rkisp1/rkisp1-csi.c    |    5 +-
 .../media/platform/rockchip/rkisp1/rkisp1-dev.c    |   15 +-
 .../media/platform/rockchip/rkisp1/rkisp1-isp.c    |    9 +-
 .../media/platform/rockchip/rkisp1/rkisp1-params.c | 1041 +++++++++--
 .../media/platform/rockchip/rkisp1/rkisp1-regs.h   |   23 +
 .../platform/rockchip/rkisp1/rkisp1-resizer.c      |    4 +-
 .../media/platform/rockchip/rkisp1/rkisp1-stats.c  |   51 +-
 .../media/platform/samsung/exynos-gsc/gsc-core.c   |   10 +-
 .../media/platform/samsung/exynos4-is/fimc-core.c  |   10 +-
 drivers/media/platform/st/sti/bdisp/bdisp-v4l2.c   |   10 +-
 drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c |   12 +
 drivers/media/platform/ti/am437x/am437x-vpfe.c     |   12 +-
 drivers/media/platform/ti/cal/cal-camerarx.c       |    2 +-
 drivers/media/platform/ti/cal/cal.c                |    8 +-
 drivers/media/platform/ti/davinci/vpif_capture.c   |   14 +-
 drivers/media/platform/verisilicon/Kconfig         |    8 +
 drivers/media/platform/verisilicon/Makefile        |   14 +-
 drivers/media/platform/verisilicon/hantro_drv.c    |   48 +
 drivers/media/platform/verisilicon/hantro_g2.c     |   29 +
 .../platform/verisilicon/hantro_g2_hevc_dec.c      |   20 +-
 .../media/platform/verisilicon/hantro_g2_regs.h    |    4 +
 drivers/media/platform/verisilicon/hantro_hevc.c   |    8 +
 drivers/media/platform/verisilicon/hantro_hw.h     |   38 +
 .../media/platform/verisilicon/hantro_postproc.c   |    6 +-
 drivers/media/platform/verisilicon/hantro_v4l2.c   |    6 +-
 .../verisilicon/rockchip_vpu981_hw_av1_dec.c       |    3 +-
 .../platform/verisilicon/rockchip_vpu981_regs.h    |   10 +-
 .../media/platform/verisilicon/rockchip_vpu_hw.c   |    1 -
 drivers/media/platform/xilinx/xilinx-vipp.c        |    9 +-
 drivers/media/radio/radio-tea5764.c                |    2 +-
 drivers/media/radio/saa7706h.c                     |    4 +-
 drivers/media/radio/si470x/radio-si470x-i2c.c      |    2 +-
 drivers/media/radio/si4713/si4713.c                |    4 +-
 drivers/media/radio/tef6862.c                      |    4 +-
 drivers/media/rc/ene_ir.c                          |    3 -
 drivers/media/rc/ite-cir.c                         |    1 -
 drivers/media/rc/meson-ir.c                        |   27 +
 drivers/media/rc/rc-loopback.c                     |    1 -
 drivers/media/test-drivers/vicodec/vicodec-core.c  |    6 +-
 drivers/media/test-drivers/vidtv/vidtv_demod.c     |    2 +-
 drivers/media/test-drivers/vidtv/vidtv_tuner.c     |    2 +-
 drivers/media/test-drivers/vivid/vivid-cec.c       |   48 +-
 drivers/media/tuners/e4000.c                       |    2 +-
 drivers/media/tuners/fc2580.c                      |    2 +-
 drivers/media/tuners/m88rs6000t.c                  |    2 +-
 drivers/media/tuners/mt2060.c                      |    2 +-
 drivers/media/tuners/mxl301rf.c                    |    2 +-
 drivers/media/tuners/qm1d1b0004.c                  |    2 +-
 drivers/media/tuners/qm1d1c0042.c                  |    2 +-
 drivers/media/tuners/tda18212.c                    |    2 +-
 drivers/media/tuners/tda18250.c                    |    2 +-
 drivers/media/tuners/tua9001.c                     |    2 +-
 drivers/media/tuners/tuner-i2c.h                   |    4 +-
 drivers/media/usb/go7007/s2250-board.c             |    2 +-
 drivers/media/v4l2-core/v4l2-dev.c                 |   15 +
 drivers/media/v4l2-core/v4l2-ioctl.c               |    3 +-
 drivers/media/v4l2-core/v4l2-subdev.c              |   53 +-
 .../staging/media/atomisp/include/linux/atomisp.h  |    4 +-
 .../media/atomisp/include/linux/atomisp_platform.h |    6 +-
 .../media/atomisp/pci/atomisp_csi2_bridge.c        |    2 +
 drivers/staging/media/atomisp/pci/atomisp_fops.c   |    2 +
 drivers/staging/media/atomisp/pci/atomisp_subdev.c |    2 +-
 .../pci/hive_isp_css_common/host/vmem_local.h      |    4 +-
 .../pci/hive_isp_css_include/assert_support.h      |    6 +-
 .../pci/hive_isp_css_include/host/csi_rx_public.h  |    4 +-
 .../pci/hive_isp_css_include/math_support.h        |    6 -
 drivers/staging/media/atomisp/pci/hmm/hmm.c        |    5 -
 .../pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c  |    3 +-
 .../pci/isp/kernels/de/de_1.0/ia_css_de.host.c     |    3 +-
 .../pci/isp/kernels/eed1_8/ia_css_eed1_8.host.c    |   22 +-
 .../pci/isp/kernels/eed1_8/ia_css_eed1_8_param.h   |    4 +-
 .../pci/isp/kernels/fpn/fpn_1.0/ia_css_fpn.host.c  |    3 +-
 .../ipu2_io_ls/bayer_io_ls/ia_css_bayer_io.host.c  |    9 +-
 .../yuv444_io_ls/ia_css_yuv444_io.host.c           |    9 +-
 .../pci/isp/kernels/xnr/xnr_3.0/ia_css_xnr3.host.c |   12 +-
 .../media/atomisp/pci/runtime/binary/src/binary.c  |  259 ++-
 .../atomisp/pci/runtime/isys/src/virtual_isys.c    |    8 +-
 drivers/staging/media/atomisp/pci/sh_css.c         |   44 +-
 .../staging/media/atomisp/pci/sh_css_dvs_info.h    |   37 -
 .../staging/media/atomisp/pci/sh_css_param_dvs.h   |    1 -
 .../media/deprecated/atmel/atmel-sama5d2-isc.c     |   10 +-
 .../media/deprecated/atmel/atmel-sama7g5-isc.c     |   10 +-
 drivers/staging/media/ipu3/ipu3-v4l2.c             |   40 +-
 drivers/staging/media/meson/vdec/vdec.c            |    2 +
 drivers/staging/media/meson/vdec/vdec_1.c          |   16 +-
 drivers/staging/media/meson/vdec/vdec_hevc.c       |   43 +-
 drivers/staging/media/meson/vdec/vdec_platform.c   |   44 +
 drivers/staging/media/meson/vdec/vdec_platform.h   |    2 +
 drivers/staging/media/starfive/camss/stf-camss.c   |    2 -
 drivers/staging/media/starfive/camss/stf-capture.c |    4 +-
 include/media/cec.h                                |   33 +
 include/media/rc-core.h                            |    2 -
 include/media/v4l2-mc.h                            |    3 +
 include/media/v4l2-subdev.h                        |    6 +
 include/media/videobuf2-core.h                     |    3 +
 include/uapi/linux/cec.h                           |    9 +-
 include/uapi/linux/rkisp1-config.h                 |  578 ++++++
 include/uapi/linux/serio.h                         |    1 +
 include/uapi/linux/videodev2.h                     |    2 +
 297 files changed, 7385 insertions(+), 1364 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,og01a1=
b.yaml
 create mode 100644 Documentation/userspace-api/media/v4l/mt2110t.svg
 create mode 100644 drivers/media/cec/usb/extron-da-hd-4k-plus/Kconfig
 create mode 100644 drivers/media/cec/usb/extron-da-hd-4k-plus/Makefile
 create mode 100644 drivers/media/cec/usb/extron-da-hd-4k-plus/cec-splitter=
.c
 create mode 100644 drivers/media/cec/usb/extron-da-hd-4k-plus/cec-splitter=
.h
 create mode 100644 drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd=
-4k-plus.c
 create mode 100644 drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd=
-4k-plus.h
 delete mode 100644 drivers/staging/media/atomisp/pci/sh_css_dvs_info.h


