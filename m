Return-Path: <linux-media+bounces-47928-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD92C966AA
	for <lists+linux-media@lfdr.de>; Mon, 01 Dec 2025 10:42:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 700474E01D1
	for <lists+linux-media@lfdr.de>; Mon,  1 Dec 2025 09:42:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A58930147A;
	Mon,  1 Dec 2025 09:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bzHBL1tV"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE2E1FDA;
	Mon,  1 Dec 2025 09:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764582152; cv=none; b=BHvE5pEKuBELtxWHp3oEMRDtaIj6zt/zlfdlWvayosibnVjL+8HPNVxsWeaJk83+wAbHjrwm4qQG63xsU36lt7pwKYuvKkQd0ezmYCXGz5ydbutImPmgWnmAWrFRaG3TDFl+44c1oSoJ2CGZ0YtVb1YyLBQpBVfBlisRFNAICJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764582152; c=relaxed/simple;
	bh=gAAAnQCHOcDOskEr9j25jEs6HMcHiQJG1yfAEMfFX2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=mgDLJOtZX+UAJbVzJbs8rpXCzTcm9UTotYSXsxEp19fBcPYMaa3W5pnLuSGfKroC9mzejPTJedef+v5k9HgZrI/6c5kt6St7zXmFX5S0lS2zd9rZHJI2vdfqliaiJ+UQiO4RuXK1Y31xcNlwRvewOEIWrJoFk3y1KPllWTT9lTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bzHBL1tV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C98E8C4CEF1;
	Mon,  1 Dec 2025 09:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764582152;
	bh=gAAAnQCHOcDOskEr9j25jEs6HMcHiQJG1yfAEMfFX2Q=;
	h=Date:From:To:Cc:Subject:From;
	b=bzHBL1tVJcSBv3P1cFwJEOIAxacZq8WKeYAWW555x48LNHVXLZtj5/dLyeCmjrNz4
	 KoyGc4/4HnjicgzceElkyO0P/ZjqZ5zjAs7PCrOICFq7UgItQv9lzWPItgTjuoowz+
	 qQQLXriuVS5fetU0Cl9UfHx0p1pJY98k9V6Eg8LkWmmQoXoawIV00qMVQpxKhhndPx
	 2VT6S9ze22F+Zoehs0V2P7v59Torm0I7ab+x/GjEJzK4rCod8x7rR5a1ulqHpR/8/L
	 V27F5VJR4jv6MdYBNNRd6yRTebjg7ZZvsoXmpfFe0NQbW9jy4GzyA6NetTAsnp4mib
	 TZfdDlqvokTFQ==
Date: Mon, 1 Dec 2025 10:42:26 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton
 <akpm@linux-foundation.org>, Linux Media Mailing List
 <linux-media@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>
Subject: [GIT PULL for v6.19] media updates
Message-ID: <20251201104226.2120e916@foz.lan>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
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
a/v6.19-1

For:

- New Mali-C55 ISP Driver;
- New Rockchip VICAP (RKCIF) Driver;
- New RKVDEC HEVC Decoder;
- New Renesas RZV2H IVC Driver;
- New Sony IMX111 CMOS sensor driver;
- Removed STi C8SECTPFE Driver;
- Added a V4L2 ISP generic framework;
- Usual set of cleanup, fixes and driver improvements.

Thanks!
Mauro

---

The following changes since commit e9a6fb0bcdd7609be6969112f3fbfcce3b1d4a7c:

  Linux 6.18-rc5 (2025-11-09 15:10:19 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git tag=
s/media/v6.19-1

for you to fetch changes up to 1f2353f5a1af995efbf7bea44341aa0d03460b28:

  media: rockchip: rkcif: add support for rk3568 vicap mipi capture (2025-1=
1-15 12:40:33 +0100)

----------------------------------------------------------------
[GIT PULL for v6.19] media updates

----------------------------------------------------------------
Adam J. Sypniewski (1):
      media: ov13b10: Add ACPI ID for ASUS Z13 Flow laptop

Alex Bee (3):
      media: rkvdec: Add variants support
      media: rkvdec: Add RK3288 variant
      media: rkvdec: Disable QoS for HEVC and VP9 on RK3328

Alice Yuan (2):
      media: dt-bindings: nxp,imx8-isi: Add i.MX91 ISI compatible string
      media: nxp: imx8-isi: Add parallel camera input support for i.MX93

Andr=C3=A9 Apitzsch (3):
      dt-bindings: media: i2c: Add DW9718S, DW9719 and DW9761 VCM
      media: i2c: dw9719: Deprecate dongwoon,vcm-freq
      media: i2c: dw9719: Remove unused i2c device id table

Benjamin Mugnier (2):
      media: dt-bindings: vd55g1: Add vd65g4 compatible
      media: i2c: vd55g1: Add support for vd65g4 RGB variant

Brian Masney (4):
      media: i2c: ds90ub953: convert from round_rate() to determine_rate()
      media: i2c: max96717: convert from round_rate() to determine_rate()
      media: i2c: tc358746: convert from round_rate() to determine_rate()
      media: platform: ti: omap3isp: isp: convert from round_rate() to dete=
rmine_rate()

Chen-Yu Tsai (1):
      media: mediatek: vcodec: Use spinlock for context list protection lock

Colin Ian King (1):
      media: pvrusb2: Fix incorrect variable used in trace message

Daniel Scally (18):
      MAINTAINERS: Update Daniel Scally's email address
      media: uapi: Add MEDIA_BUS_FMT_RGB202020_1X60 format code
      media: uapi: Add 20-bit bayer formats
      dt-bindings: media: Add bindings for ARM mali-c55
      media: uapi: Add controls for Mali-C55 ISP
      media: mali-c55: Add Mali-C55 ISP driver
      media: Documentation: Add Mali-C55 ISP Documentation
      MAINTAINERS: Add entry for mali-c55 driver
      media: Add MALI_C55_3A_STATS meta format
      media: uapi: Add 3a stats buffer for mali-c55
      media: platform: Add mali-c55 3a stats devnode
      Documentation: media: mali-c55: Add Statistics documentation
      media: uapi: Add parameters structs to mali-c55-config.h
      media: platform: Add mali-c55 parameters video node
      Documentation: media: mali-c55: Document the mali-c55 parameter setti=
ng
      dt-bindings: media: Add bindings for the RZ/V2H(P) IVC block
      media: platform: Add Renesas Input Video Control block driver
      MAINTAINERS: Add entry for rzv2h-ivc driver

Darshan Rathod (2):
      media: dvb-core: dvb_ringbuffer: Fix various coding style issues
      media: dvb-core: dvb_demux: Fix assignments in if conditions

Dave Stevenson (1):
      media: i2c: imx219: Fix 1920x1080 mode to use 1:1 pixel aspect ratio

David Lechner (2):
      media: pci: mg4b: use aligned_s64
      media: pci: mg4b: use iio_push_to_buffers_with_ts()

Dikshita Agarwal (4):
      media: iris: Add support for HFI_PROP_OPB_ENABLE to control split mode
      media: iris: Add support for QC08C format for decoder
      media: iris: Add support for QC08C format for encoder
      media: iris: Refine internal buffer reconfiguration logic for resolut=
ion change

Dmitry Antipov (1):
      Revert "media: xc2028: avoid use-after-free in load_firmware_cb()"

Dmitry Baryshkov (6):
      media: iris: turn platform caps into constants
      media: iris: turn platform data into constants
      media: iris: stop encoding PIPE value into fw_caps
      media: iris: remove duplication between generic gen2 data and qcs8300
      media: iris: rename sm8250 platform file to gen1
      media: iris: enable support for SC7280 platform

Dmitry Osipenko (2):
      MAINTAINERS: Update Synopsys HDMI RX driver entry
      media: dt-bindings: snps,dw-hdmi-rx.yaml: Updated maintainers entry

Duoming Zhou (3):
      media: TDA1997x: Remove redundant cancel_delayed_work in probe
      media: i2c: adv7842: Remove redundant cancel_delayed_work in probe
      media: i2c: ADV7604: Remove redundant cancel_delayed_work in probe

Edward Adam Davis (1):
      media: dvb-usb: pctv452e: move snd/rcv len check before kmalloc

Elgin Perumbilly (1):
      media: i2c: Fix vendor name typo in OV2735 Kconfig help text

Frank Li (4):
      dt-bindings: media: Convert ti,tvp5150.txt to yaml format.
      dt-bindings: media: convert nxp,tda1997x.txt to yaml format
      media: dt-bindings: video-interfaces: add video-interfaces.h informat=
ion
      MAINTAINERS: Add Frank Li as reviewer for NXP media drivers

Geert Uytterhoeven (2):
      media: rcar_jpu: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
      media: amphion: Remove dummy PM handling

Griffin Kroah-Hartman (2):
      dt-bindings: media: i2c: dw9719: Document DW9800K
      media: i2c: dw9719: Add DW9800K support

Guoniu Zhou (3):
      media: nxp: imx8-isi: Refine code by using helper macro
      media: nxp: imx8-isi: Reorder the platform data
      media: nxp: imx8-isi: Add ISI support for i.MX91

Hangxiang Ma (2):
      media: qcom: camss: Use a macro to specify the initial buffer count
      media: qcom: camss: Enable setting the rate to camnoc_rt_axi clock

Hans Verkuil (1):
      Documentation: media: fix VIDIOC_REMOVE_BUFS typo

Hans de Goede (1):
      media: ipu6: isys: Add support for monochrome media bus formats

Hao Yao (1):
      media: ipu-bridge: Add OV05C10 to the list of supported sensors

Haotian Zhang (3):
      media: cec: Fix debugfs leak on bus_register() failure
      media: videobuf2: Fix device reference leak in vb2_dc_alloc error path
      media: rc: st_rc: Fix reset control resource leak

Haoxiang Li (1):
      media: mediatek: vcodec: Fix a reference leak in mtk_vcodec_fw_vpu_in=
it()

Isaac Scott (4):
      media: v4l: Add helper to get number of active lanes via a pad
      media: imx-mipi-csis: Move redundant debug print in probe
      media: imx-mipi-csis: Add num_data_lanes to mipi_csis_device
      media: imx-mipi-csis: Support active data lanes differing from maximum

Ivan Abramov (2):
      media: adv7842: Avoid possible out-of-bounds array accesses in adv784=
2_cp_log_status()
      media: msp3400: Avoid possible out-of-bounds array accesses in msp340=
0c_thread()

Jacopo Mondi (12):
      media: uapi: Introduce V4L2 generic ISP types
      media: uapi: Convert RkISP1 to V4L2 extensible params
      media: uapi: Convert Amlogic C3 to V4L2 extensible params
      media: Documentation: uapi: Add V4L2 ISP documentation
      media: v4l2-core: Introduce v4l2-isp.c
      media: rkisp1: Use v4l2-isp for validation
      media: amlogic-c3: Use v4l2-isp for validation
      media: Documentation: kapi: Add v4l2 generic ISP support
      media: mali-c55: Add image formats for Mali-C55 parameters buffer
      media: v4l2-isp: Rename block_info to block_type_info
      media: mali-c55: Assert ISP blocks size correctness
      media: mali-c55: Mark pm handlers as __maybe_unused

Jai Luthra (7):
      media: i2c: imx219: Simplify imx219_get_binning() function
      media: imx335: Update the native pixel array width
      media: imx335: Update HBLANK range on mode change
      media: imx335: Handle runtime PM in leaf functions
      media: imx355: Use subdev active state
      media: imx335: Support 2x2 binning
      media: imx335: Switch to {enable,disable}_streams

Jeongjun Park (2):
      media: dvb-usb: dtv5100: fix out-of-bounds in dtv5100_i2c_msg()
      media: vidtv: initialize local pointers upon transfer of memory owner=
ship

Jimmy Su (1):
      media: ipu-bridge: Add IMX471 to the list of supported sensors

Johan Hovold (12):
      media: platform: mtk-mdp3: fix device leaks at probe
      media: imx-mipi-csis: drop unused module alias
      media: imx7-media-csi: drop unused module alias
      media: imx8mq-mipi-csi2: drop unused module alias
      media: vpif_capture: fix section mismatch
      media: vpif_display: fix section mismatch
      media: exynos4-is: fimc-is: drop unused module alias
      media: exynos4-is: fimc-lite: drop unused module alias
      media: venus: drop bogus probe deferrals
      media: venus: drop unused module aliases
      media: qcom: camss: drop unused module alias
      media: ir-hix5hd2: Drop unused module alias

Jonas Karlman (3):
      media: rkvdec: Add HEVC backend
      media: rkvdec: Implement capability filtering
      media: dt-bindings: rockchip,vdec: Add RK3288 compatible

Krzysztof Kozlowski (1):
      media: dt-bindings: qcom,x1e80100-camss: Fix typo in CSIPHY supply de=
scription

Laurent Pinchart (31):
      media: v4l2-mem2mem: Fix outdated documentation
      media: v4l2-mem2mem: Document that v4l2_m2m_get_vq() never returns NU=
LL
      media: allgro-dvt: Drop unneeded v4l2_m2m_get_vq() NULL check
      media: meson-g2d: Drop unneeded v4l2_m2m_get_vq() NULL check
      media: amphion: Drop unneeded v4l2_m2m_get_vq() NULL check
      media: coda: Drop unneeded v4l2_m2m_get_vq() NULL check
      media: imagination: e5010: Drop unneeded v4l2_m2m_get_vq() NULL check
      media: m2m-deinterlace: Drop unneeded v4l2_m2m_get_vq() NULL check
      media: mediatek: jpeg: Drop unneeded v4l2_m2m_get_vq() NULL check
      media: mediatek: vcodec: Drop unneeded v4l2_m2m_get_vq() NULL check
      media: dw100: Drop unneeded v4l2_m2m_get_vq() NULL check
      media: imx-jpeg: Drop unneeded v4l2_m2m_get_vq() NULL check
      media: imx-pxp: Drop unneeded v4l2_m2m_get_vq() NULL check
      media: nxp: imx8-isi: Drop unneeded v4l2_m2m_get_vq() NULL check
      media: mx2_emmaprp: Drop unneeded v4l2_m2m_get_vq() NULL check
      media: qcom: iris: Drop unneeded v4l2_m2m_get_vq() NULL check
      media: qcom: venus: Drop unneeded v4l2_m2m_get_vq() NULL check
      media: renesas: fdp1: Drop unneeded v4l2_m2m_get_vq() NULL check
      media: rcar_jpu: Drop unneeded v4l2_m2m_get_vq() NULL check
      media: platform: rga: Drop unneeded v4l2_m2m_get_vq() NULL check
      media: samsung: s5p-g2d: Drop unneeded v4l2_m2m_get_vq() NULL check
      media: samsung: s5p-jpeg: Drop unneeded v4l2_m2m_get_vq() NULL check
      media: stm32: dma2d: Drop unneeded v4l2_m2m_get_vq() NULL check
      media: ti: vpe: Drop unneeded v4l2_m2m_get_vq() NULL check
      media: vicodec: Drop unneeded v4l2_m2m_get_vq() NULL check
      media: vim2m: Drop unneeded v4l2_m2m_get_vq() NULL check
      media: v4l2-mem2mem: Don't copy frame flags in v4l2_m2m_buf_copy_meta=
data()
      media: ipu3-imgu: Drop struct imgu_device v4l2_file_ops field
      media: staging: ipu7: isys: Drop video_open() function
      media: saa7146: Replace saa7146_ext_vv.vbi_fops with write function
      media: iris: Constify iris_v4l2_file_ops

Liao Yuanhong (3):
      media: synopsys: hdmirx: media: Remove redundant ternary operators
      media: dvb-frontends: Remove redundant ternary operators
      media: siano: Remove redundant ternary operators

Lukas Bulwahn (1):
      MAINTAINERS: adjust file entry in TDA1997x MEDIA DRIVER

Ma Ke (1):
      media: ivsc: Release csi_dev reference early in mei_ace_setup_dev_lin=
k()

Marek Szyprowski (1):
      media: samsung: exynos4-is: fix potential ABBA deadlock on init

Martin T=C5=AFma (1):
      media: pci: mgb4: Fix DV capabilities

Matthias Fend (3):
      media: allegro: print warning if channel creation timeout occurs
      media: allegro: process all pending status mbox messages
      media: allegro: fix race conditions in channel handling

Mauro Carvalho Chehab (25):
      tools: docs: parse_data_structs.py: drop contents header
      tools: docs: parse_data_structs.py: output a line number
      docs: kernel_include.py: fix line numbers for TOC
      docs: kernel_include.py: propose alternatives
      tools: docs: parse_data_structs: make process_exceptions two stages
      tools: docs: parse_data_structs.py: get rid of process_exceptions()
      tools: docs: parse_data_structs.py: add namespace support
      tools: docs: parse_data_structs.py: accept more reftypes
      docs: media: dvb: use TOC instead of file contents at headers
      docs: media: dvb: enable warnings for most headers
      docs: media: rc: use TOC instead of file contents for LIRC header
      docs: media: mediactl: use TOC instead of file contents
      docs: kernel_include.py: use get_close_matches() to propose alternati=
ves
      docs: media: add missing c namespace to V4L headers
      docs: media: videodev2.h.rst.exceptions: fix namespace on refs
      media: docs: add a missing reference for VIDIOC_QUERY_CTRL
      media: docs: videodev2.h.rst.exceptions: ignore struct __kernel_v4l2_=
timeval
      media: docs: add some C domain missing references
      docs: cec: cec.h.rst.exceptions: fix broken references from cec.h
      docs: cec: show broken xrefs and show TOC instead of cec.h content
      docs: media: dmx_types: place kerneldoc at the right namespace
      docs: media: dvb: headers: warn about broken cross references
      docs: media: dvb: fix dmx.h.rst.exceptions
      Merge branch 'media-uapi' of git://git.lwn.net/linux into media-next
      Merge tag 'v6.18-rc5' into media-next

Mehdi Djait (1):
      media: dt-bindings: add rockchip px30 vip

Miaoqian Lin (1):
      media: renesas: rcar_drif: fix device node reference leak in rcar_dri=
f_bond_enabled

Michael Riesch (9):
      Documentation: admin-guide: media: add rockchip camera interface
      media: dt-bindings: video-interfaces: add defines for sampling modes
      media: dt-bindings: add rockchip rk3568 vicap
      media: rockchip: add driver for the rockchip camera interface
      media: rockchip: rkcif: add abstraction for interface and crop blocks
      media: rockchip: rkcif: add abstraction for dma blocks
      media: rockchip: rkcif: add support for px30 vip dvp capture
      media: rockchip: rkcif: add support for rk3568 vicap dvp capture
      media: rockchip: rkcif: add support for rk3568 vicap mipi capture

Ming Qian (2):
      media: amphion: Remove vpu_vb_is_codecconfig
      media: amphion: Cancel message work before releasing the VPU core

Nicolas Dufresne (2):
      media: verisilicon: Fix CPU stalls on G2 bus error
      media: verisilicon: Protect G2 HEVC decoder against invalid DPB index

Osama Albahrani (1):
      media: av7110: Fix warning 'unsigned' -> 'unsigned int'

Pavan Bobba (2):
      media: v4l2-ctrls: add full AV1 profile validation in validate_av1_se=
quence()
      media: v4l2-ctrls: set AV1 sequence flags for testing

Qianfeng Rong (4):
      media: dvb-core: use vmalloc_array to simplify code
      media: pt1: use vmalloc_array to simplify code
      media: vivid: use vmalloc_array and vcalloc to simplify code
      media: dvb: Use int type to store negative error codes

Raphael Gallais-Pou (3):
      media: c8sectpfe: remove support of STi c8sectpfe driver
      media: include: remove c8sectpfe header
      media: doc/dt-bindings: remove support of stih407-c8sectpfe

Ricardo Ribalda (33):
      media: dvbdev: Use %pe format specifier
      media: mn88443x: Use %pe format specifier
      media: adv7842: Use %pe format specifier
      media: ar0521: Use %pe format specifier
      media: ccs: Use %pe format specifier
      media: i2c: ds90ub913: Use %pe format specifier
      media: i2c: ds90ub953: Use %pe format specifier
      media: i2c: imx274: Use %pe format specifier
      media: i2c: imx335: Use %pe format specifier
      media: i2c: imx412: Use %pe format specifier
      media: i2c: max9286: Use %pe format specifier
      media: i2c: max96717: Use %pe format specifier
      media: i2c: mt9m111: Use %pe format specifier
      media: i2c: mt9v111: Use %pe format specifier
      media: i2c: ov5675: Use %pe format specifier
      media: i2c: ov5693: Use %pe format specifier
      media: i2c: ov9282: Use %pe format specifier
      media: rj54n1cb0c: Use %pe format specifier
      media: i2c: st-mipid02: Use %pe format specifier
      media: ipu-bridge: Use %pe format specifier
      media: ipu3-cio2: Use %pe format specifier
      media: ipu6: isys: Use %pe format specifier
      media: mediatek: vcodec: Use %pe format specifier
      media: imx8mq-mipi-csi2: Use %pe format specifier
      media: platform: rzg2l-cru: Use %pe format specifier
      media: renesas: vsp1: Use %pe format specifier
      media: rkisp1: Use %pe format specifier
      media: samsung: exynos4-is: Use %pe format specifier
      media: ti: cal Use %pe format specifier
      media: staging: ipu3-imgu: Use %pe format specifier
      media: staging/ipu7: Use %pe format specifier
      media: renesas: fdp1: Use %pe format specifier
      media: i2c: imx214: Rearrange control initialization

Rob Herring (Arm) (1):
      media: Use of_reserved_mem_region_to_resource() for "memory-region"

Sakari Ailus (4):
      media: MAINTAINERS: Assign ov08x40 driver to Jimmy
      media: v4l2-subdev: Make media_entity_to_v4l2_subdev() const-aware
      media: v4l2-dev: Make macros to obtain containers const-aware
      media: mc: Make macros to obtain containers const-aware

Sebastian Reichel (2):
      media: ov02c10: Fix default vertical flip
      media: ov02c10: Support hflip and vflip

Stefan Klug (1):
      media: rkisp1: Improve frame sequence correctness on stats and params=
 buffers

Svyatoslav Ryhel (2):
      dt-bindings: media: i2c: document Sony IMX111 CMOS sensor
      media: i2c: add Sony IMX111 CMOS camera sensor driver

Tarang Raval (2):
      media: i2c: imx219: Propagate errors from control range updates
      media: i2c: imx219: Replace exposure magic value with named constant

Umang Jain (2):
      media: imx335: Rectify name of mode struct
      media: imx335: Support vertical flip

Val Packett (5):
      media: i2c: dw9719: Add an of_match_table
      media: i2c: dw9719: Add driver_data matching
      media: i2c: dw9719: Add DW9718S support
      media: i2c: dw9719: Update PM last busy time upon close
      media: i2c: dw9719: Fix power on/off sequence

Vincent Knecht (3):
      media: dt-bindings: Add qcom,msm8939-camss
      media: qcom: camss: vfe: Add VBIF setting support
      media: qcom: camss: Add support for MSM8939

Vladimir Zapolskiy (3):
      dt-bindings: media: Describe Qualcomm SM8650 CAMSS IP
      media: qcom: camss: Add Qualcomm SM8650 CAMSS support
      media: qcom: camss: Add CSIPHY 2.2.0 lane configuration for SM8650

Wangao Wang (1):
      media: iris: Add sanity check for stop streaming

Xichao Zhao (2):
      staging: media: tegra-video: Remove the use of dev_err_probe()
      media: dvb_ca_en50221: fix "writen"->"written"

 Documentation/admin-guide/media/mali-c55-graph.dot |   19 +
 Documentation/admin-guide/media/mali-c55.rst       |  413 +++++
 .../admin-guide/media/platform-cardlist.rst        |    2 -
 .../admin-guide/media/rkcif-rk3568-vicap.dot       |    8 +
 Documentation/admin-guide/media/rkcif.rst          |   79 +
 Documentation/admin-guide/media/v4l-drivers.rst    |    2 +
 .../devicetree/bindings/media/arm,mali-c55.yaml    |   86 +
 .../bindings/media/i2c/dongwoon,dw9719.yaml        |   89 +
 .../bindings/media/i2c/nxp,tda19971.yaml           |  162 ++
 .../devicetree/bindings/media/i2c/nxp,tda1997x.txt |  178 --
 .../devicetree/bindings/media/i2c/sony,imx111.yaml |  105 ++
 .../devicetree/bindings/media/i2c/st,vd55g1.yaml   |    6 +-
 .../devicetree/bindings/media/i2c/ti,tvp5150.txt   |  157 --
 .../devicetree/bindings/media/i2c/ti,tvp5150.yaml  |  133 ++
 .../devicetree/bindings/media/nxp,imx8-isi.yaml    |   13 +-
 .../bindings/media/qcom,msm8939-camss.yaml         |  254 +++
 .../bindings/media/qcom,sm8650-camss.yaml          |  375 ++++
 .../bindings/media/qcom,x1e80100-camss.yaml        |    2 +-
 .../bindings/media/renesas,r9a09g057-ivc.yaml      |  103 ++
 .../bindings/media/rockchip,px30-vip.yaml          |  124 ++
 .../bindings/media/rockchip,rk3568-vicap.yaml      |  172 ++
 .../devicetree/bindings/media/rockchip,vdec.yaml   |    1 +
 .../devicetree/bindings/media/snps,dw-hdmi-rx.yaml |    2 +-
 .../bindings/media/stih407-c8sectpfe.txt           |   88 -
 .../bindings/media/video-interfaces.yaml           |    4 +-
 Documentation/driver-api/media/v4l2-core.rst       |    1 +
 Documentation/driver-api/media/v4l2-isp.rst        |   49 +
 Documentation/sphinx/kernel_include.py             |  108 +-
 .../userspace-api/media/cec/cec-header.rst         |    8 +-
 .../userspace-api/media/cec/cec.h.rst.exceptions   |    3 +
 .../userspace-api/media/drivers/index.rst          |    1 +
 .../userspace-api/media/drivers/mali-c55.rst       |   55 +
 .../userspace-api/media/dvb/dmx.h.rst.exceptions   |   86 +-
 .../userspace-api/media/dvb/dmx_types.rst          |    1 +
 .../media/dvb/frontend.h.rst.exceptions            |    5 +-
 Documentation/userspace-api/media/dvb/headers.rst  |   31 +-
 .../userspace-api/media/mediactl/media-header.rst  |    8 +-
 .../media/mediactl/media.h.rst.exceptions          |    3 +
 .../userspace-api/media/rc/lirc-header.rst         |   14 +-
 Documentation/userspace-api/media/v4l/app-pri.rst  |    1 +
 Documentation/userspace-api/media/v4l/audio.rst    |    1 +
 Documentation/userspace-api/media/v4l/biblio.rst   |    1 +
 Documentation/userspace-api/media/v4l/buffer.rst   |    2 +
 .../userspace-api/media/v4l/capture-example.rst    |    1 +
 .../userspace-api/media/v4l/capture.c.rst          |    1 +
 .../userspace-api/media/v4l/colorspaces-defs.rst   |    1 +
 .../media/v4l/colorspaces-details.rst              |    1 +
 .../userspace-api/media/v4l/colorspaces.rst        |    1 +
 .../userspace-api/media/v4l/common-defs.rst        |    1 +
 Documentation/userspace-api/media/v4l/common.rst   |    1 +
 Documentation/userspace-api/media/v4l/compat.rst   |    1 +
 Documentation/userspace-api/media/v4l/control.rst  |    1 +
 Documentation/userspace-api/media/v4l/crop.rst     |    1 +
 .../userspace-api/media/v4l/depth-formats.rst      |    1 +
 .../userspace-api/media/v4l/dev-decoder.rst        |    1 +
 .../userspace-api/media/v4l/dev-encoder.rst        |    1 +
 .../userspace-api/media/v4l/dev-event.rst          |    1 +
 .../userspace-api/media/v4l/dev-mem2mem.rst        |    1 +
 Documentation/userspace-api/media/v4l/dev-meta.rst |    1 +
 Documentation/userspace-api/media/v4l/dev-osd.rst  |    1 +
 .../userspace-api/media/v4l/dev-overlay.rst        |    1 +
 .../userspace-api/media/v4l/dev-radio.rst          |    1 +
 Documentation/userspace-api/media/v4l/dev-sdr.rst  |    1 +
 .../media/v4l/dev-stateless-decoder.rst            |    1 +
 .../userspace-api/media/v4l/dev-subdev.rst         |    1 +
 .../userspace-api/media/v4l/dev-touch.rst          |    1 +
 Documentation/userspace-api/media/v4l/devices.rst  |    1 +
 .../userspace-api/media/v4l/dv-timings.rst         |    1 +
 .../userspace-api/media/v4l/ext-ctrls-camera.rst   |    1 +
 .../media/v4l/ext-ctrls-codec-stateless.rst        |    1 +
 .../userspace-api/media/v4l/ext-ctrls-codec.rst    |    1 +
 .../media/v4l/ext-ctrls-colorimetry.rst            |    1 +
 .../userspace-api/media/v4l/ext-ctrls-detect.rst   |    1 +
 .../userspace-api/media/v4l/ext-ctrls-dv.rst       |    1 +
 .../userspace-api/media/v4l/ext-ctrls-flash.rst    |    1 +
 .../userspace-api/media/v4l/ext-ctrls-fm-rx.rst    |    1 +
 .../userspace-api/media/v4l/ext-ctrls-fm-tx.rst    |    1 +
 .../media/v4l/ext-ctrls-image-process.rst          |    1 +
 .../media/v4l/ext-ctrls-image-source.rst           |    1 +
 .../userspace-api/media/v4l/ext-ctrls-jpeg.rst     |    1 +
 .../userspace-api/media/v4l/ext-ctrls-rf-tuner.rst |    1 +
 .../userspace-api/media/v4l/extended-controls.rst  |    1 +
 .../userspace-api/media/v4l/field-order.rst        |    1 +
 Documentation/userspace-api/media/v4l/fourcc.rst   |    1 +
 .../userspace-api/media/v4l/hsv-formats.rst        |    1 +
 Documentation/userspace-api/media/v4l/libv4l.rst   |    1 +
 .../userspace-api/media/v4l/meta-formats.rst       |    3 +
 .../media/v4l/metafmt-arm-mali-c55.rst             |   84 +
 .../userspace-api/media/v4l/metafmt-c3-isp.rst     |    1 +
 .../userspace-api/media/v4l/metafmt-d4xx.rst       |    1 +
 .../userspace-api/media/v4l/metafmt-generic.rst    |    1 +
 .../userspace-api/media/v4l/metafmt-intel-ipu3.rst |    1 +
 .../userspace-api/media/v4l/metafmt-pisp-be.rst    |    1 +
 .../userspace-api/media/v4l/metafmt-pisp-fe.rst    |    1 +
 .../userspace-api/media/v4l/metafmt-rkisp1.rst     |    1 +
 .../userspace-api/media/v4l/metafmt-uvc.rst        |    1 +
 .../userspace-api/media/v4l/metafmt-vivid.rst      |    1 +
 .../userspace-api/media/v4l/metafmt-vsp1-hgo.rst   |    1 +
 .../userspace-api/media/v4l/metafmt-vsp1-hgt.rst   |    1 +
 .../userspace-api/media/v4l/pixfmt-bayer.rst       |    1 +
 .../userspace-api/media/v4l/pixfmt-cnf4.rst        |    1 +
 .../userspace-api/media/v4l/pixfmt-compressed.rst  |    1 +
 .../userspace-api/media/v4l/pixfmt-indexed.rst     |    1 +
 .../userspace-api/media/v4l/pixfmt-intro.rst       |    1 +
 .../userspace-api/media/v4l/pixfmt-inzi.rst        |    1 +
 .../userspace-api/media/v4l/pixfmt-m420.rst        |    1 +
 .../userspace-api/media/v4l/pixfmt-packed-hsv.rst  |    1 +
 .../userspace-api/media/v4l/pixfmt-packed-yuv.rst  |    1 +
 .../userspace-api/media/v4l/pixfmt-reserved.rst    |    1 +
 .../userspace-api/media/v4l/pixfmt-rgb.rst         |    1 +
 .../userspace-api/media/v4l/pixfmt-sdr-cs08.rst    |    1 +
 .../userspace-api/media/v4l/pixfmt-sdr-cs14le.rst  |    1 +
 .../userspace-api/media/v4l/pixfmt-sdr-cu08.rst    |    1 +
 .../userspace-api/media/v4l/pixfmt-sdr-cu16le.rst  |    1 +
 .../userspace-api/media/v4l/pixfmt-sdr-pcu16be.rst |    1 +
 .../userspace-api/media/v4l/pixfmt-sdr-pcu18be.rst |    1 +
 .../userspace-api/media/v4l/pixfmt-sdr-pcu20be.rst |    1 +
 .../userspace-api/media/v4l/pixfmt-sdr-ru12le.rst  |    1 +
 .../media/v4l/pixfmt-srggb10-ipu3.rst              |    1 +
 .../userspace-api/media/v4l/pixfmt-srggb10.rst     |    1 +
 .../media/v4l/pixfmt-srggb10alaw8.rst              |    1 +
 .../media/v4l/pixfmt-srggb10dpcm8.rst              |    1 +
 .../userspace-api/media/v4l/pixfmt-srggb10p.rst    |    1 +
 .../userspace-api/media/v4l/pixfmt-srggb12.rst     |    1 +
 .../userspace-api/media/v4l/pixfmt-srggb12p.rst    |    1 +
 .../userspace-api/media/v4l/pixfmt-srggb14.rst     |    1 +
 .../userspace-api/media/v4l/pixfmt-srggb14p.rst    |    1 +
 .../userspace-api/media/v4l/pixfmt-srggb16.rst     |    1 +
 .../media/v4l/pixfmt-srggb8-pisp-comp.rst          |    1 +
 .../userspace-api/media/v4l/pixfmt-srggb8.rst      |    1 +
 .../userspace-api/media/v4l/pixfmt-tch-td08.rst    |    1 +
 .../userspace-api/media/v4l/pixfmt-tch-td16.rst    |    1 +
 .../userspace-api/media/v4l/pixfmt-tch-tu08.rst    |    1 +
 .../userspace-api/media/v4l/pixfmt-tch-tu16.rst    |    1 +
 .../userspace-api/media/v4l/pixfmt-uv8.rst         |    1 +
 .../userspace-api/media/v4l/pixfmt-v4l2-mplane.rst |    1 +
 .../userspace-api/media/v4l/pixfmt-v4l2.rst        |    1 +
 .../userspace-api/media/v4l/pixfmt-y12i.rst        |    1 +
 .../userspace-api/media/v4l/pixfmt-y16i.rst        |    1 +
 .../userspace-api/media/v4l/pixfmt-y8i.rst         |    1 +
 .../userspace-api/media/v4l/pixfmt-yuv-luma.rst    |    1 +
 .../userspace-api/media/v4l/pixfmt-yuv-planar.rst  |    1 +
 .../userspace-api/media/v4l/pixfmt-z16.rst         |    1 +
 Documentation/userspace-api/media/v4l/pixfmt.rst   |    1 +
 .../userspace-api/media/v4l/planar-apis.rst        |    1 +
 Documentation/userspace-api/media/v4l/querycap.rst |    1 +
 .../userspace-api/media/v4l/sdr-formats.rst        |    1 +
 .../media/v4l/selection-api-configuration.rst      |    1 +
 .../media/v4l/selection-api-examples.rst           |    1 +
 .../media/v4l/selection-api-intro.rst              |    1 +
 .../media/v4l/selection-api-targets.rst            |    1 +
 .../media/v4l/selection-api-vs-crop-api.rst        |    1 +
 .../userspace-api/media/v4l/selection-api.rst      |    1 +
 .../userspace-api/media/v4l/selections-common.rst  |    1 +
 Documentation/userspace-api/media/v4l/standard.rst |    1 +
 .../userspace-api/media/v4l/subdev-formats.rst     |  421 ++++-
 .../userspace-api/media/v4l/tch-formats.rst        |    1 +
 Documentation/userspace-api/media/v4l/tuner.rst    |    1 +
 .../userspace-api/media/v4l/user-func.rst          |    1 +
 Documentation/userspace-api/media/v4l/v4l2-isp.rst |   67 +
 .../media/v4l/v4l2-selection-flags.rst             |    1 +
 .../media/v4l/v4l2-selection-targets.rst           |    1 +
 Documentation/userspace-api/media/v4l/v4l2.rst     |    1 +
 .../userspace-api/media/v4l/v4l2grab-example.rst   |    1 +
 .../userspace-api/media/v4l/v4l2grab.c.rst         |    1 +
 Documentation/userspace-api/media/v4l/video.rst    |    1 +
 Documentation/userspace-api/media/v4l/videodev.rst |    9 +-
 .../media/v4l/videodev2.h.rst.exceptions           |  288 +--
 .../userspace-api/media/v4l/vidioc-queryctrl.rst   |    8 +
 .../userspace-api/media/v4l/vidioc-remove-bufs.rst |    2 +-
 .../userspace-api/media/v4l/yuv-formats.rst        |    1 +
 MAINTAINERS                                        |   59 +-
 drivers/media/cec/core/cec-core.c                  |    1 +
 drivers/media/common/saa7146/saa7146_fops.c        |    4 +-
 drivers/media/common/siano/smsir.c                 |    2 +-
 .../media/common/videobuf2/videobuf2-dma-contig.c  |    1 +
 drivers/media/dvb-core/dmxdev.c                    |    4 +-
 drivers/media/dvb-core/dvb_ca_en50221.c            |    2 +-
 drivers/media/dvb-core/dvb_demux.c                 |   28 +-
 drivers/media/dvb-core/dvb_ringbuffer.c            |   36 +-
 drivers/media/dvb-core/dvbdev.c                    |    4 +-
 drivers/media/dvb-frontends/cxd2841er.c            |    3 +-
 drivers/media/dvb-frontends/drx39xyj/drxj.c        |    2 +-
 drivers/media/dvb-frontends/drxk_hard.c            |    3 +-
 drivers/media/dvb-frontends/lgdt330x.c             |    4 +-
 drivers/media/dvb-frontends/mn88443x.c             |    7 +-
 drivers/media/i2c/Kconfig                          |   12 +-
 drivers/media/i2c/Makefile                         |    1 +
 drivers/media/i2c/adv7604.c                        |    4 +-
 drivers/media/i2c/adv7842.c                        |   15 +-
 drivers/media/i2c/ar0521.c                         |    4 +-
 drivers/media/i2c/ccs/ccs-core.c                   |    8 +-
 drivers/media/i2c/ds90ub913.c                      |    2 +-
 drivers/media/i2c/ds90ub953.c                      |   14 +-
 drivers/media/i2c/dw9719.c                         |  128 +-
 drivers/media/i2c/imx111.c                         | 1610 +++++++++++++++++
 drivers/media/i2c/imx214.c                         |   15 +-
 drivers/media/i2c/imx219.c                         |   99 +-
 drivers/media/i2c/imx274.c                         |    3 +-
 drivers/media/i2c/imx335.c                         |  513 ++++--
 drivers/media/i2c/imx412.c                         |    4 +-
 drivers/media/i2c/max9286.c                        |    4 +-
 drivers/media/i2c/max96717.c                       |   18 +-
 drivers/media/i2c/msp3400-kthreads.c               |    2 +
 drivers/media/i2c/mt9m111.c                        |    4 +-
 drivers/media/i2c/mt9v111.c                        |   12 +-
 drivers/media/i2c/ov02c10.c                        |   27 +-
 drivers/media/i2c/ov13b10.c                        |    1 +
 drivers/media/i2c/ov5675.c                         |    4 +-
 drivers/media/i2c/ov5693.c                         |    4 +-
 drivers/media/i2c/ov9282.c                         |    4 +-
 drivers/media/i2c/rj54n1cb0c.c                     |    8 +-
 drivers/media/i2c/st-mipid02.c                     |    4 +-
 drivers/media/i2c/tc358746.c                       |   12 +-
 drivers/media/i2c/tda1997x.c                       |    1 -
 drivers/media/i2c/vd55g1.c                         |  234 ++-
 drivers/media/pci/intel/ipu-bridge.c               |    8 +-
 drivers/media/pci/intel/ipu3/ipu3-cio2.c           |    4 +-
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c      |    8 +-
 drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c    |   34 +-
 drivers/media/pci/intel/ipu6/ipu6-isys-video.c     |   14 +
 drivers/media/pci/intel/ivsc/mei_ace.c             |    4 +-
 drivers/media/pci/mgb4/mgb4_trigger.c              |    5 +-
 drivers/media/pci/mgb4/mgb4_vin.c                  |    4 +-
 drivers/media/pci/mgb4/mgb4_vout.c                 |    4 +-
 drivers/media/pci/pt1/pt1.c                        |    2 +-
 drivers/media/platform/Kconfig                     |    1 +
 drivers/media/platform/Makefile                    |    1 +
 drivers/media/platform/allegro-dvt/allegro-core.c  |  118 +-
 drivers/media/platform/amlogic/c3/isp/Kconfig      |    1 +
 .../media/platform/amlogic/c3/isp/c3-isp-params.c  |  166 +-
 drivers/media/platform/amlogic/meson-ge2d/ge2d.c   |    5 -
 drivers/media/platform/amphion/vdec.c              |    4 +-
 drivers/media/platform/amphion/venc.c              |    4 +-
 drivers/media/platform/amphion/vpu_core.c          |   40 +-
 drivers/media/platform/amphion/vpu_drv.c           |   26 -
 drivers/media/platform/amphion/vpu_malone.c        |   23 +-
 drivers/media/platform/amphion/vpu_v4l2.c          |   16 +-
 drivers/media/platform/amphion/vpu_v4l2.h          |   10 -
 drivers/media/platform/arm/Kconfig                 |    5 +
 drivers/media/platform/arm/Makefile                |    2 +
 drivers/media/platform/arm/mali-c55/Kconfig        |   18 +
 drivers/media/platform/arm/mali-c55/Makefile       |   11 +
 .../media/platform/arm/mali-c55/mali-c55-capture.c |  959 ++++++++++
 .../media/platform/arm/mali-c55/mali-c55-common.h  |  310 ++++
 .../media/platform/arm/mali-c55/mali-c55-core.c    |  917 ++++++++++
 drivers/media/platform/arm/mali-c55/mali-c55-isp.c |  665 +++++++
 .../media/platform/arm/mali-c55/mali-c55-params.c  |  819 +++++++++
 .../platform/arm/mali-c55/mali-c55-registers.h     |  449 +++++
 .../media/platform/arm/mali-c55/mali-c55-resizer.c | 1156 ++++++++++++
 .../media/platform/arm/mali-c55/mali-c55-stats.c   |  323 ++++
 drivers/media/platform/arm/mali-c55/mali-c55-tpg.c |  437 +++++
 drivers/media/platform/chips-media/coda/coda-bit.c |    2 +-
 .../media/platform/chips-media/coda/coda-common.c  |    4 -
 .../media/platform/chips-media/coda/coda-jpeg.c    |    4 +-
 .../media/platform/imagination/e5010-jpeg-enc.c    |    6 +-
 drivers/media/platform/m2m-deinterlace.c           |    7 -
 .../media/platform/mediatek/jpeg/mtk_jpeg_core.c   |   11 +-
 .../media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c |    4 +-
 .../media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c |    4 +-
 .../media/platform/mediatek/mdp3/mtk-mdp3-core.c   |   14 +
 .../media/platform/mediatek/mdp3/mtk-mdp3-m2m.c    |    2 +-
 .../mediatek/vcodec/common/mtk_vcodec_dbgfs.c      |    4 +-
 .../mediatek/vcodec/common/mtk_vcodec_fw_vpu.c     |   14 +-
 .../mediatek/vcodec/decoder/mtk_vcodec_dec.c       |    7 -
 .../mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c   |   12 +-
 .../mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h   |    2 +-
 .../vcodec/decoder/vdec/vdec_av1_req_lat_if.c      |    6 +-
 .../vcodec/decoder/vdec/vdec_h264_req_if.c         |    2 +-
 .../vcodec/decoder/vdec/vdec_h264_req_multi_if.c   |   14 +-
 .../vcodec/decoder/vdec/vdec_hevc_req_multi_if.c   |    5 +-
 .../mediatek/vcodec/decoder/vdec/vdec_vp8_req_if.c |    2 +-
 .../vcodec/decoder/vdec/vdec_vp9_req_lat_if.c      |    8 +-
 .../platform/mediatek/vcodec/decoder/vdec_vpu_if.c |    5 +-
 .../mediatek/vcodec/encoder/mtk_vcodec_enc.c       |   14 -
 .../mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c   |   12 +-
 .../mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h   |    2 +-
 .../platform/mediatek/vcodec/encoder/venc_vpu_if.c |    5 +-
 drivers/media/platform/nvidia/tegra-vde/h264.c     |    2 +-
 drivers/media/platform/nxp/dw100/dw100.c           |    9 +-
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c     |    6 +-
 drivers/media/platform/nxp/imx-mipi-csis.c         |   22 +-
 drivers/media/platform/nxp/imx-pxp.c               |    7 -
 drivers/media/platform/nxp/imx7-media-csi.c        |    1 -
 .../media/platform/nxp/imx8-isi/imx8-isi-core.c    |   50 +-
 .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |    1 +
 .../media/platform/nxp/imx8-isi/imx8-isi-gasket.c  |   22 +-
 drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c |    4 +-
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c      |    5 +-
 drivers/media/platform/nxp/mx2_emmaprp.c           |    7 -
 drivers/media/platform/qcom/camss/Makefile         |    1 +
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     |  102 ++
 drivers/media/platform/qcom/camss/camss-csiphy.c   |    1 +
 drivers/media/platform/qcom/camss/camss-ispif.c    |    8 +-
 drivers/media/platform/qcom/camss/camss-vfe-4-1.c  |   12 +
 drivers/media/platform/qcom/camss/camss-vfe-vbif.c |   31 +
 drivers/media/platform/qcom/camss/camss-vfe-vbif.h |   19 +
 drivers/media/platform/qcom/camss/camss-vfe.c      |   17 +-
 drivers/media/platform/qcom/camss/camss-vfe.h      |    3 +
 drivers/media/platform/qcom/camss/camss.c          |  483 ++++-
 drivers/media/platform/qcom/camss/camss.h          |    3 +
 drivers/media/platform/qcom/iris/Makefile          |    2 +-
 drivers/media/platform/qcom/iris/iris_buffer.c     |   17 +-
 drivers/media/platform/qcom/iris/iris_common.c     |    7 +-
 drivers/media/platform/qcom/iris/iris_ctrls.c      |   18 +-
 drivers/media/platform/qcom/iris/iris_firmware.c   |   18 +-
 .../platform/qcom/iris/iris_hfi_gen1_command.c     |   15 +-
 .../platform/qcom/iris/iris_hfi_gen2_command.c     |   21 +-
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |    1 +
 drivers/media/platform/qcom/iris/iris_instance.h   |    7 +-
 .../platform/qcom/iris/iris_platform_common.h      |   18 +-
 ...iris_platform_sm8250.c =3D> iris_platform_gen1.c} |   63 +-
 .../media/platform/qcom/iris/iris_platform_gen2.c  |   26 +-
 .../platform/qcom/iris/iris_platform_qcs8300.h     |  535 +-----
 .../platform/qcom/iris/iris_platform_sc7280.h      |   26 +
 drivers/media/platform/qcom/iris/iris_probe.c      |    4 +
 drivers/media/platform/qcom/iris/iris_resources.c  |    2 +-
 drivers/media/platform/qcom/iris/iris_utils.c      |    3 +-
 drivers/media/platform/qcom/iris/iris_vb2.c        |    8 +-
 drivers/media/platform/qcom/iris/iris_vdec.c       |   63 +-
 drivers/media/platform/qcom/iris/iris_venc.c       |   61 +-
 drivers/media/platform/qcom/iris/iris_vidc.c       |    2 +-
 drivers/media/platform/qcom/iris/iris_vpu2.c       |    6 +
 drivers/media/platform/qcom/iris/iris_vpu_common.c |   34 +-
 drivers/media/platform/qcom/venus/core.c           |    1 -
 drivers/media/platform/qcom/venus/firmware.c       |   19 +-
 drivers/media/platform/qcom/venus/vdec.c           |    8 +-
 drivers/media/platform/qcom/venus/venc.c           |    8 +-
 drivers/media/platform/renesas/Kconfig             |    1 +
 drivers/media/platform/renesas/Makefile            |    1 +
 drivers/media/platform/renesas/rcar_drif.c         |    1 +
 drivers/media/platform/renesas/rcar_fdp1.c         |    6 +-
 drivers/media/platform/renesas/rcar_jpu.c          |   16 +-
 .../media/platform/renesas/rzg2l-cru/rzg2l-csi2.c  |    8 +-
 drivers/media/platform/renesas/rzv2h-ivc/Kconfig   |   18 +
 drivers/media/platform/renesas/rzv2h-ivc/Makefile  |    5 +
 .../platform/renesas/rzv2h-ivc/rzv2h-ivc-dev.c     |  251 +++
 .../platform/renesas/rzv2h-ivc/rzv2h-ivc-subdev.c  |  376 ++++
 .../platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c   |  531 ++++++
 .../media/platform/renesas/rzv2h-ivc/rzv2h-ivc.h   |  130 ++
 drivers/media/platform/renesas/vsp1/vsp1_drv.c     |    3 +-
 drivers/media/platform/rockchip/Kconfig            |    1 +
 drivers/media/platform/rockchip/Makefile           |    1 +
 drivers/media/platform/rockchip/rga/rga.c          |    6 +-
 drivers/media/platform/rockchip/rkcif/Kconfig      |   18 +
 drivers/media/platform/rockchip/rkcif/Makefile     |    8 +
 .../platform/rockchip/rkcif/rkcif-capture-dvp.c    |  865 +++++++++
 .../platform/rockchip/rkcif/rkcif-capture-dvp.h    |   25 +
 .../platform/rockchip/rkcif/rkcif-capture-mipi.c   |  777 ++++++++
 .../platform/rockchip/rkcif/rkcif-capture-mipi.h   |   23 +
 .../media/platform/rockchip/rkcif/rkcif-common.h   |  250 +++
 drivers/media/platform/rockchip/rkcif/rkcif-dev.c  |  303 ++++
 .../platform/rockchip/rkcif/rkcif-interface.c      |  442 +++++
 .../platform/rockchip/rkcif/rkcif-interface.h      |   31 +
 drivers/media/platform/rockchip/rkcif/rkcif-regs.h |  153 ++
 .../media/platform/rockchip/rkcif/rkcif-stream.c   |  636 +++++++
 .../media/platform/rockchip/rkcif/rkcif-stream.h   |   32 +
 drivers/media/platform/rockchip/rkisp1/Kconfig     |    1 +
 .../media/platform/rockchip/rkisp1/rkisp1-common.h |    1 +
 .../media/platform/rockchip/rkisp1/rkisp1-csi.c    |    4 +-
 .../media/platform/rockchip/rkisp1/rkisp1-isp.c    |   31 +-
 .../media/platform/rockchip/rkisp1/rkisp1-params.c |  151 +-
 drivers/media/platform/rockchip/rkvdec/Makefile    |    2 +-
 .../platform/rockchip/rkvdec/rkvdec-hevc-data.c    | 1848 ++++++++++++++++=
++++
 .../media/platform/rockchip/rkvdec/rkvdec-hevc.c   |  820 +++++++++
 .../media/platform/rockchip/rkvdec/rkvdec-regs.h   |    4 +
 .../media/platform/rockchip/rkvdec/rkvdec-vp9.c    |    4 +
 drivers/media/platform/rockchip/rkvdec/rkvdec.c    |  200 ++-
 drivers/media/platform/rockchip/rkvdec/rkvdec.h    |   17 +
 .../media/platform/samsung/exynos4-is/fimc-is.c    |    1 -
 .../media/platform/samsung/exynos4-is/fimc-lite.c  |    1 -
 .../media/platform/samsung/exynos4-is/media-dev.c  |   14 +-
 drivers/media/platform/samsung/s5p-g2d/g2d.c       |    4 -
 .../media/platform/samsung/s5p-jpeg/jpeg-core.c    |    7 -
 drivers/media/platform/st/Makefile                 |    1 -
 drivers/media/platform/st/sti/Kconfig              |    1 -
 drivers/media/platform/st/sti/Makefile             |    1 -
 drivers/media/platform/st/sti/c8sectpfe/Kconfig    |   28 -
 drivers/media/platform/st/sti/c8sectpfe/Makefile   |   11 -
 .../platform/st/sti/c8sectpfe/c8sectpfe-common.c   |  262 ---
 .../platform/st/sti/c8sectpfe/c8sectpfe-common.h   |   60 -
 .../platform/st/sti/c8sectpfe/c8sectpfe-core.c     | 1158 ------------
 .../platform/st/sti/c8sectpfe/c8sectpfe-core.h     |  287 ---
 .../platform/st/sti/c8sectpfe/c8sectpfe-debugfs.c  |  244 ---
 .../platform/st/sti/c8sectpfe/c8sectpfe-debugfs.h  |   23 -
 .../platform/st/sti/c8sectpfe/c8sectpfe-dvb.c      |  235 ---
 .../platform/st/sti/c8sectpfe/c8sectpfe-dvb.h      |   17 -
 drivers/media/platform/st/stm32/dma2d/dma2d.c      |    7 +-
 drivers/media/platform/sunxi/sun8i-di/sun8i-di.c   |    2 +-
 .../platform/sunxi/sun8i-rotate/sun8i_rotate.c     |    2 +-
 .../media/platform/synopsys/hdmirx/snps_hdmirx.c   |    2 +-
 drivers/media/platform/ti/cal/cal.c                |    3 +-
 drivers/media/platform/ti/davinci/vpif_capture.c   |    4 +-
 drivers/media/platform/ti/davinci/vpif_display.c   |    4 +-
 drivers/media/platform/ti/omap3isp/isp.c           |   10 +-
 drivers/media/platform/ti/vpe/vpe.c                |    7 -
 drivers/media/platform/verisilicon/hantro_drv.c    |    2 +-
 drivers/media/platform/verisilicon/hantro_g2.c     |   88 +-
 .../platform/verisilicon/hantro_g2_hevc_dec.c      |   17 +-
 .../media/platform/verisilicon/hantro_g2_regs.h    |   13 +
 .../media/platform/verisilicon/hantro_g2_vp9_dec.c |    2 -
 drivers/media/platform/verisilicon/hantro_hw.h     |    1 +
 drivers/media/platform/verisilicon/imx8m_vpu_hw.c  |    2 +
 drivers/media/rc/ir-hix5hd2.c                      |    1 -
 drivers/media/rc/st_rc.c                           |    2 +-
 drivers/media/test-drivers/vicodec/vicodec-core.c  |   11 +-
 drivers/media/test-drivers/vidtv/vidtv_channel.c   |    3 +
 drivers/media/test-drivers/vim2m.c                 |   14 +-
 drivers/media/test-drivers/visl/visl-dec.c         |    2 +-
 drivers/media/test-drivers/vivid/vivid-core.c      |    6 +-
 drivers/media/tuners/xc2028.c                      |    9 +-
 drivers/media/usb/dvb-usb/dtv5100.c                |    5 +
 drivers/media/usb/dvb-usb/pctv452e.c               |    7 +-
 drivers/media/usb/pvrusb2/pvrusb2-hdw.c            |    2 +-
 drivers/media/v4l2-core/Kconfig                    |    4 +
 drivers/media/v4l2-core/Makefile                   |    1 +
 drivers/media/v4l2-core/v4l2-common.c              |   29 +
 drivers/media/v4l2-core/v4l2-ctrls-core.c          |  131 +-
 drivers/media/v4l2-core/v4l2-ioctl.c               |    2 +
 drivers/media/v4l2-core/v4l2-isp.c                 |  132 ++
 drivers/media/v4l2-core/v4l2-mem2mem.c             |   21 +-
 drivers/staging/media/av7110/av7110_ca.c           |    2 +-
 drivers/staging/media/av7110/av7110_v4l.c          |    4 +-
 drivers/staging/media/imx/imx-media-csc-scaler.c   |    2 +-
 drivers/staging/media/ipu3/ipu3.c                  |    3 +-
 drivers/staging/media/ipu3/ipu3.h                  |    1 -
 drivers/staging/media/ipu7/ipu7-isys-csi-phy.c     |    4 +-
 drivers/staging/media/ipu7/ipu7-isys-csi2.c        |    4 +-
 drivers/staging/media/ipu7/ipu7-isys-video.c       |    7 +-
 drivers/staging/media/sunxi/cedrus/cedrus_dec.c    |    2 +-
 drivers/staging/media/tegra-video/tegra20.c        |    2 +-
 include/dt-bindings/media/c8sectpfe.h              |   13 -
 include/dt-bindings/media/video-interfaces.h       |    4 +
 include/media/drv-intf/saa7146_vv.h                |    3 +-
 include/media/media-entity.h                       |   10 +-
 include/media/v4l2-common.h                        |   20 +
 include/media/v4l2-dev.h                           |    6 +-
 include/media/v4l2-isp.h                           |   91 +
 include/media/v4l2-mem2mem.h                       |   18 +-
 include/media/v4l2-subdev.h                        |    2 +-
 include/uapi/linux/media-bus-format.h              |    9 +-
 include/uapi/linux/media/amlogic/c3-isp-config.h   |   92 +-
 include/uapi/linux/media/arm/mali-c55-config.h     |  794 +++++++++
 include/uapi/linux/media/v4l2-isp.h                |  102 ++
 include/uapi/linux/rkisp1-config.h                 |  107 +-
 include/uapi/linux/v4l2-controls.h                 |    6 +
 include/uapi/linux/videodev2.h                     |    4 +
 tools/docs/lib/parse_data_structs.py               |  230 +--
 tools/docs/parse-headers.py                        |    5 +-
 449 files changed, 22742 insertions(+), 5151 deletions(-)
 create mode 100644 Documentation/admin-guide/media/mali-c55-graph.dot
 create mode 100644 Documentation/admin-guide/media/mali-c55.rst
 create mode 100644 Documentation/admin-guide/media/rkcif-rk3568-vicap.dot
 create mode 100644 Documentation/admin-guide/media/rkcif.rst
 create mode 100644 Documentation/devicetree/bindings/media/arm,mali-c55.ya=
ml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/dongwoon,dw=
9719.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/nxp,tda1997=
1.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/nxp,tda1997=
x.txt
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx111=
.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/ti,tvp5150.=
txt
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ti,tvp5150.=
yaml
 create mode 100644 Documentation/devicetree/bindings/media/qcom,msm8939-ca=
mss.yaml
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sm8650-cam=
ss.yaml
 create mode 100644 Documentation/devicetree/bindings/media/renesas,r9a09g0=
57-ivc.yaml
 create mode 100644 Documentation/devicetree/bindings/media/rockchip,px30-v=
ip.yaml
 create mode 100644 Documentation/devicetree/bindings/media/rockchip,rk3568=
-vicap.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/stih407-c8sectp=
fe.txt
 create mode 100644 Documentation/driver-api/media/v4l2-isp.rst
 create mode 100644 Documentation/userspace-api/media/drivers/mali-c55.rst
 create mode 100644 Documentation/userspace-api/media/v4l/metafmt-arm-mali-=
c55.rst
 create mode 100644 Documentation/userspace-api/media/v4l/v4l2-isp.rst
 create mode 100644 drivers/media/i2c/imx111.c
 create mode 100644 drivers/media/platform/arm/Kconfig
 create mode 100644 drivers/media/platform/arm/Makefile
 create mode 100644 drivers/media/platform/arm/mali-c55/Kconfig
 create mode 100644 drivers/media/platform/arm/mali-c55/Makefile
 create mode 100644 drivers/media/platform/arm/mali-c55/mali-c55-capture.c
 create mode 100644 drivers/media/platform/arm/mali-c55/mali-c55-common.h
 create mode 100644 drivers/media/platform/arm/mali-c55/mali-c55-core.c
 create mode 100644 drivers/media/platform/arm/mali-c55/mali-c55-isp.c
 create mode 100644 drivers/media/platform/arm/mali-c55/mali-c55-params.c
 create mode 100644 drivers/media/platform/arm/mali-c55/mali-c55-registers.h
 create mode 100644 drivers/media/platform/arm/mali-c55/mali-c55-resizer.c
 create mode 100644 drivers/media/platform/arm/mali-c55/mali-c55-stats.c
 create mode 100644 drivers/media/platform/arm/mali-c55/mali-c55-tpg.c
 create mode 100644 drivers/media/platform/qcom/camss/camss-vfe-vbif.c
 create mode 100644 drivers/media/platform/qcom/camss/camss-vfe-vbif.h
 rename drivers/media/platform/qcom/iris/{iris_platform_sm8250.c =3D> iris_=
platform_gen1.c} (82%)
 create mode 100644 drivers/media/platform/qcom/iris/iris_platform_sc7280.h
 create mode 100644 drivers/media/platform/renesas/rzv2h-ivc/Kconfig
 create mode 100644 drivers/media/platform/renesas/rzv2h-ivc/Makefile
 create mode 100644 drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-dev.c
 create mode 100644 drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-subd=
ev.c
 create mode 100644 drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-vide=
o.c
 create mode 100644 drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc.h
 create mode 100644 drivers/media/platform/rockchip/rkcif/Kconfig
 create mode 100644 drivers/media/platform/rockchip/rkcif/Makefile
 create mode 100644 drivers/media/platform/rockchip/rkcif/rkcif-capture-dvp=
.c
 create mode 100644 drivers/media/platform/rockchip/rkcif/rkcif-capture-dvp=
.h
 create mode 100644 drivers/media/platform/rockchip/rkcif/rkcif-capture-mip=
i.c
 create mode 100644 drivers/media/platform/rockchip/rkcif/rkcif-capture-mip=
i.h
 create mode 100644 drivers/media/platform/rockchip/rkcif/rkcif-common.h
 create mode 100644 drivers/media/platform/rockchip/rkcif/rkcif-dev.c
 create mode 100644 drivers/media/platform/rockchip/rkcif/rkcif-interface.c
 create mode 100644 drivers/media/platform/rockchip/rkcif/rkcif-interface.h
 create mode 100644 drivers/media/platform/rockchip/rkcif/rkcif-regs.h
 create mode 100644 drivers/media/platform/rockchip/rkcif/rkcif-stream.c
 create mode 100644 drivers/media/platform/rockchip/rkcif/rkcif-stream.h
 create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-data=
.c
 create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
 delete mode 100644 drivers/media/platform/st/sti/c8sectpfe/Kconfig
 delete mode 100644 drivers/media/platform/st/sti/c8sectpfe/Makefile
 delete mode 100644 drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-commo=
n.c
 delete mode 100644 drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-commo=
n.h
 delete mode 100644 drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c
 delete mode 100644 drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.h
 delete mode 100644 drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-debug=
fs.c
 delete mode 100644 drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-debug=
fs.h
 delete mode 100644 drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-dvb.c
 delete mode 100644 drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-dvb.h
 create mode 100644 drivers/media/v4l2-core/v4l2-isp.c
 delete mode 100644 include/dt-bindings/media/c8sectpfe.h
 create mode 100644 include/media/v4l2-isp.h
 create mode 100644 include/uapi/linux/media/arm/mali-c55-config.h
 create mode 100644 include/uapi/linux/media/v4l2-isp.h

