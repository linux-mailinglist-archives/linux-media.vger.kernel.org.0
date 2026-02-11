Return-Path: <linux-media+bounces-52597-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CGlGDB5ojGkdnAAAu9opvQ
	(envelope-from <linux-media+bounces-52597-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 12:29:34 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 15684123DBA
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 12:29:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B0E3A3007A77
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 11:29:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89A4436BCEE;
	Wed, 11 Feb 2026 11:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SNAI0N0B"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F22D62F2910;
	Wed, 11 Feb 2026 11:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770809366; cv=none; b=nSO8Nz6X5WAdPAapghp6m9Aa0EReqCmSQOP/j0GbqiI8JITs2x9AHncuDrgtBAhDGI2Nivln1NwN76ie5+TltXlyoK7vCFdn0BOsqwTyEJp1AoeSgCdIVSj3ykMx5YmIflcrHI20hDq7MO2DmcguMv+xvx8w+El3DDofn5j3ol4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770809366; c=relaxed/simple;
	bh=NCJoIeP8bBZoYjWcOfiHeLzo2u80ZhqUXGVO6L/x+GA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ISXnSq4Rt8m7abZpJ0aDnhzT3tQXbPBQ7T6XgeOpAxHPjKcDi2dWDF5j8W15PMSAiDJ2Np9yQbEqNX8wtQvE/kMlunNsAtT/cHNnVQEhI+hX3HT1ZQ8gyJ45oyhxeUAa2FKQ9xi4Kr2xdfnSuID+kC9yz6QyKtndVIwY/o9JzBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SNAI0N0B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4131CC4CEF7;
	Wed, 11 Feb 2026 11:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770809365;
	bh=NCJoIeP8bBZoYjWcOfiHeLzo2u80ZhqUXGVO6L/x+GA=;
	h=Date:From:To:Cc:Subject:From;
	b=SNAI0N0Bb5dU+qXLTtpfqff6jwZlpa3KvbcbwtzyGUKbzyrcoqJwOrdDj6XNeDDbZ
	 rL7FkpgUOMxi7gksCWvrEix3mSsyOZraxEIpYJHBGTT0SkWBR+sHIo1bnqepe4pNaE
	 fXc9rmHMey1NXUO0AIGKWvrOtXnAvfRnsdXKRYi2eTYgjESHEIXeWEtfTwJOOo9fq/
	 FPINtpLBoLKSnoCiEYfOJIg33P5oToFDu1YYgfrmR1eUPwA2trGUkZZWEe4jHElPTC
	 z5/2KEJTEeyCw+T1Wmsp4OHLs8hyp81rcy3CLUUCo3kSHTQQiXIjcaMR49wVhShCEo
	 HmrJ0Ek/D4weA==
Date: Wed, 11 Feb 2026 12:29:21 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton
 <akpm@linux-foundation.org>, Linux Media Mailing List
 <linux-media@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>
Subject: [GIT PULL for v7.0] media updates
Message-ID: <20260211122921.42215991@foz.lan>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_FROM(0.00)[bounces-52597-lists,linux-media=lfdr.de,huawei];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_ALL(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Queue-Id: 15684123DBA
X-Rspamd-Action: no action

Hi Linus,

Please pull from:

	git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git medi=
a/v7.0-2

For:

- PCI=E2=80=AF:=E2=80=AFmgb4 =E2=80=93 Add support for GMSL1 and GMSL=E2=80=
=91coax modules =20
- Add driver for TI=E2=80=AFVIP;
- AV1 =E2=80=93 first kernel support (pixel=E2=80=91format, decoder, transc=
oder) =20
- Three new camera=E2=80=91sensor drivers (os05b10, s5k3m5, s5kjn1) =20
- Synopsys CSI=E2=80=912 receiver driver =20
- Verisilicon & rkvdec =E2=80=93 major fixes and enhancements =20
- PCI=E2=80=AFmgb4 =E2=80=93 support for GMSL=E2=80=91coax modules
- IPU6 (and 7) fixes and preparation for metadata;
- omap3isp: v4l2-compliance updates;
- dvb/vb2: fix DVB streaming, drop wait_prepare/finish.

Regards,
Mauro

---

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git tag=
s/media/v7.0-2

for you to fetch changes up to c824345288d11e269ce41b36c105715bc2286050:

  media: uvcvideo: Pass allocation size directly to uvc_alloc_urb_buffer (2=
026-01-22 08:18:51 +0100)

----------------------------------------------------------------
[GIT PULL for v7.0] media updates

----------------------------------------------------------------
Abdun Nihaal (2):
      media: i2c/tw9903: Fix potential memory leak in tw9903_probe()
      media: i2c/tw9906: Fix potential memory leak in tw9906_probe()

Alain Volmat (7):
      media: stm32: dcmipp: avoid naming clock if only one is needed
      media: stm32: dcmipp: bytecap: clear all interrupts upon stream stop
      media: stm32: dcmipp: byteproc: disable compose for all bayers
      media: stm32: dcmipp: Add RGB888 format support overall
      media: stm32: dcmipp: add Y10-Y12-Y14 in all subdevs
      media: stm32: dcmipp: byteproc: only allow compose with 8/16bit fmts
      media: stm32: dcmipp: bytecap: remove useless cmier variable

Alex Tran (2):
      media: dt-bindings: i2c: toshiba,et8ek8: Convert to DT schema
      media: dt-bindings: ti,omap3isp: Convert to DT schema

Alper Ak (2):
      media: rockchip: rga: Fix possible ERR_PTR dereference in rga_buf_ini=
t()
      media: qcom: camss: vfe: Fix out-of-bounds access in vfe_isr_reg_upda=
te()

Arjun Changla (1):
      staging: media: atomisp: fix trailing statement

Benjamin Gaignard (4):
      media: verisilicon: AV1: Fix enable cdef computation
      media: verisilicon: AV1: Fix tx mode bit setting
      media: verisilicon: AV1: Set IDR flag for intra_only frame type
      media: verisilicon: AV1: Fix tile info buffer size

Bingbu Cao (6):
      media: ipu6: Fix typo and wrong constant in ipu6-mmu.c
      media: ipu6: Fix RPM reference leak in probe error paths
      media: staging/ipu7: Ignore interrupts when device is suspended
      media: staging/ipu7: Call synchronous RPM suspend in probe failure
      media: staging/ipu7: Update CDPHY register settings
      media: staging/ipu7: Fix the loop bound in l2 table alloc

Brandon Brnich (3):
      media: chips-media: wave5: Fix conditional in start_streaming
      media: chips-media: wave5: Process ready frames when CMD_STOP sent to=
 Encoder
      media: chips-media: wave5: Fix Potential Probe Resource Leak

Dale Farnsworth (2):
      dt-bindings: media: ti: vpe: Add support for Video Input Port
      media: ti: vpe: Add the VIP driver

Dave Stevenson (7):
      media: i2c: ov5647: Add support for regulator control
      media: i2c: ov5647: Use v4l2_async_register_subdev_sensor for lens bi=
nding
      media: i2c: ov5647: Add control of V4L2_CID_HBLANK
      media: i2c: ov5647: Tidy up mode registers to make the order common
      media: i2c: ov5647: Separate out the common registers.
      media: i2c: ov5647: Use the same PLL config for full, 1080p, and binn=
ed modes
      media: i2c: ov5647: Add V4L2_CID_LINK_FREQUENCY control

David Heidelberg (2):
      dt-bindings: media: Correct camss supply description
      media: ccs: Accommodate C-PHY into the calculation

David Plowman (4):
      media: i2c: ov5647: Correct pixel array offset
      media: i2c: ov5647: Correct minimum VBLANK value
      media: i2c: ov5647: Sensor should report RAW color space
      media: i2c: ov5647: Support HFLIP and VFLIP

Deepa Guthyappa Madivalara (5):
      media: uapi: videodev2: Add support for AV1 stateful decoder
      media: v4l2: Add description for V4L2_PIX_FMT_AV1 in v4l_fill_fmtdesc=
()
      media: iris: Add support for AV1 format in iris decoder
      media: iris: Define AV1-specific platform capabilities and properties
      media: iris: Add internal buffer calculation for AV1 decoder

Detlev Casanova (17):
      media: uapi: HEVC: Add v4l2_ctrl_hevc_ext_sps_[ls]t_rps controls
      media: v4l2-ctrls: Add hevc_ext_sps_[ls]t_rps controls
      media: visl: Add HEVC short and long term RPS sets
      media: rkvdec: Switch to using structs instead of writel
      media: rkvdec: Move cabac tables to their own source file
      media: rkvdec: Use structs to represent the HW RPS
      media: rkvdec: Move h264 functions to common file
      media: rkvdec: Move hevc functions to common file
      media: rkvdec: Add variant specific coded formats list
      media: rkvdec: Add RCB and SRAM support
      media: rkvdec: Support per-variant interrupt handler
      media: rkvdec: Enable all clocks without naming them
      media: rkvdec: Disable multicore support
      media: rkvdec: Add H264 support for the VDPU381 variant
      media: rkvdec: Add H264 support for the VDPU383 variant
      media: rkvdec: Add HEVC support for the VDPU381 variant
      media: rkvdec: Add HEVC support for the VDPU383 variant

Dikshita Agarwal (8):
      media: venus: vdec: restrict EOS addr quirk to IRIS2 only
      Revert "media: iris: Add sanity check for stop streaming"
      media: iris: remove v4l2_m2m_ioctl_{de,en}coder_cmd API usage during =
STOP handling
      media: iris: Add missing platform data entries for SM8750
      media: iris: Add buffer to list only after successful allocation
      media: iris: Skip resolution set on first IPSC
      media: iris: gen1: Destroy internal buffers after FW releases
      media: iris: gen2: Add sanity check for session stop

Dmitry Antipov (1):
      media: v4l2-core: simplify v4l2_m2m_register_entity()

Dmitry Osipenko (1):
      media: synopsys: hdmirx: Detect broken interrupt

Elgin Perumbilly (2):
      dt-bindings: media: i2c: Add os05b10 sensor
      media: i2c: ov2735: request reset GPIO as initially asserted

Frank Li (7):
      MAINTAINERS: Promote Frank Li as i.MX7/8 media maintainer
      media: nxp: use dev_err_probe() to simplify code
      media: nxp: imx8-isi: use devm_pm_runtime_enable() to simplify code
      media: nxp: use cleanup __free(fwnode_handle) simplify code
      media: staging: media: imx6-mipi-csi2: replace spaces with tabs for a=
lignment
      media: staging: media: imx6-mipi-csi2: use devm_mutex_init() to simpl=
ify code
      media: staging: media: imx6-mipi-csi2: use devm_platform_ioremap_reso=
urce() simplify code

Hangxiang Ma (1):
      media: camss: csiphy: Make CSIPHY status macro cross-platform

Hans Verkuil (20):
      media: dvb-core: dmxdevfilter must always flush bufs
      media: dvb-core/dmxdev: drop locks around mmap()
      media: dvb-core: dvb_vb2: drop wait_prepare/finish callbacks
      media: vb2: remove vb2_ops_wait_prepare/finish helpers
      media: vb2: drop wait_prepare/finish callbacks
      media: omap3isp: configure entity functions
      media: omap3isp: add V4L2_CAP_IO_MC and don't set bus_info
      media: omap3isp: isp_video_mbus_to_pix/pix_to_mbus fixes
      media: omap3isp: implement enum_fmt_vid_cap/out
      media: omap3isp: use V4L2_COLORSPACE_SRGB instead of _JPEG
      media: omap3isp: set initial format
      media: omap3isp: rework isp_video_try/set_format
      media: omap3isp: implement create/prepare_bufs
      media: omap3isp: better VIDIOC_G/S_PARM handling
      media: omap3isp: support ctrl events for isppreview
      media: omap3isp: ispccp2: always clamp in ccp2_try_format()
      media: omap3isp: isppreview: always clamp in preview_try_format()
      media: mc: add manual request completion
      media: vicodec: add support for manual completion
      media: mc: add debugfs node to keep track of requests

Hans de Goede (37):
      media: i2c: ov01a10: Fix the horizontal flip control
      media: i2c: ov01a10: Fix reported pixel-rate value
      media: i2c: ov01a10: Fix analogue gain range
      media: i2c: ov01a10: Add missing v4l2_subdev_cleanup() calls
      media: i2c: ov01a10: Fix passing stream instead of pad to v4l2_subdev=
_state_get_format()
      media: i2c: ov01a10: Fix test-pattern disabling
      media: i2c: ov01a10: Change default vblank value to a vblank resultin=
g in 30 fps
      media: i2c: ov01a10: Convert to new CCI register access helpers
      media: i2c: ov01a10: Remove overly verbose probe() error reporting
      media: i2c: ov01a10: Store dev pointer in struct ov01a10
      media: i2c: ov01a10: Add ov01a10_check_hwcfg() function
      media: i2c: ov01a10: Add power on/off sequencing support
      media: i2c: ov01a10: Don't update pixel_rate and link_freq from set_f=
mt
      media: i2c: ov01a10: Move setting of ctrl->flags to after checking ct=
rl_hdlr->error
      media: i2c: ov01a10: Use native and default for pixel-array size names
      media: i2c: ov01a10: Add cropping support / allow arbitrary sizes
      media: i2c: ov01a10: Remove struct ov01a10_reg_list
      media: i2c: ov01a10: Replace exposure->min/step with direct define use
      media: i2c: ov01a10: Only set register 0x0305 once
      media: i2c: ov01a10: Remove values set by controls from global_settin=
g[]
      media: i2c: ov01a10: Add ov01a10_sensor_cfg struct
      media: i2c: ov01a10: Optimize setting h/vflip values
      media: i2c: ov01a10: Add ov01a1b support
      media: aptina-pll: Debug log p1 min and max values
      media: mt9m114: Use aptina-PLL helper to get PLL values
      media: mt9m114: Lower minimum vblank value
      media: mt9m114: Fix default hblank and vblank values
      media: mt9m114: Tweak default hblank and vblank for more accurate fps
      media: mt9m114: Avoid a reset low spike during probe()
      media: mt9m114: Put sensor in reset on power down
      media: mt9m114: Add and use mt9m114_ifp_get_border() helper function
      media: mt9m114: Adjust IFP selections and source format when source f=
ormat changes to/from RAW10
      media: mt9m114: Update source pad selection and format when sink pad =
format changes
      media: mt9m114: Don't allow changing the IFP crop/compose selections =
when bypassing the scaler
      media: mt9m114: Drop start-, stop-streaming sequence from initialize
      media: mt9m114: Return -EPROBE_DEFER if no endpoint is found
      media: mt9m114: Add ACPI enumeration support

Haoxiang Li (6):
      media: mtk-mdp: Fix error handling in probe function
      media: mtk-mdp: Fix a reference leak bug in mtk_mdp_remove()
      media: cx88: Add missing unmap in snd_cx88_hw_params()
      media: cx23885: Add missing unmap in snd_cx23885_hw_params()
      media: cx25821: Add missing unmap in snd_cx25821_hw_params()
      media: cx25821: Fix a resource leak in cx25821_dev_setup()

Himanshu Bhavani (2):
      media: i2c: add os05b10 image sensor driver
      media: i2c: os05b10: Few minor improvements

Irui Wang (1):
      media: mediatek: encoder: Fix uninitialized scalar variable issue

Jackson Lee (4):
      media: chips-media: wave5: Fix SError of kernel panic when closed
      media: chips-media: wave5: Fix Null reference while testing fluster
      media: chips-media: wave5: Add WARN_ON to check if dec_output_info is=
 NULL
      media: chips-media: wave5: Improve performance of decoder

Jai Luthra (5):
      media: i2c: ov5647: Initialize subdev before controls
      media: i2c: ov5647: Fix PIXEL_RATE value for VGA mode
      dt-bindings: media: ov5647: Add optional regulators
      dt-bindings: media: ov5647: Allow props from video-interface-devices
      media: i2c: ov5647: Tidy up PIXEL_RATE control

Jammy Huang (1):
      media: aspeed: Fix dram hang at res-change

Johan Hovold (1):
      media: mediatek: amend vpu_get_plat_device() documentation

John Bauer (1):
      media: uvcvideo: UVC minimum relative pan/tilt/zoom speed fix.

Jorge Ramirez-Ortiz (1):
      media: venus: assign unique bus_info strings for encoder and decoder

Kees Cook (1):
      media: solo6x10: Check for out of bounds chip_id

Krzysztof Kozlowski (1):
      media: i2c: Add note to prevent buggy code re-use

Lad Prabhakar (1):
      media: dt-bindings: media: renesas,fcp: Allow three clocks for RZ/V2N=
 SoC

Laurent Pinchart (4):
      media: uvcvideo: Replace dev_dbg() with uvc_dbg()
      media: i2c: ov5647: Parse and register properties
      media: i2c: imx219: Inline imx219_update_pad_format() in its caller
      media: imx8-isi: Drop unneeded module alias

Loic Poulain (1):
      media: qcom: camss: csid-340: Fix unused variables

Lukas Bulwahn (1):
      MAINTAINERS: adjust file entry in MEDIATEK MDP DRIVER

Marco Crivellari (1):
      media: platform: mtk-mdp3: add WQ_PERCPU to alloc_workqueue users

Marek Vasut (2):
      media: dt-bindings: nxp,imx8-jpeg: Document optional SRAM support
      media: imx-jpeg: Add support for descriptor allocation from SRAM

Martin T=C5=AFma (3):
      media: pci: mgb4: Add support for GMSL1 modules
      media: pci: mgb4: Add support for GMSL3 coaxial modules
      Documentation: admin-guide: media: mgb4: Add GMSL1 & GMSL3-coax modul=
es info

Mehdi Djait (1):
      media: i2c: ov01a10: Fix digital gain range

Michael Riesch (2):
      media: dt-bindings: add rockchip mipi csi-2 receiver
      media: synopsys: add driver for the designware mipi csi-2 receiver

Michael Tretter (1):
      media: dt-bindings: adi,adv7180: add VPP and CSI register maps

Michal Pecio (1):
      media: uvcvideo: Return queued buffers on start_streaming() failure

Ming Qian (6):
      media: verisilicon: Avoid G2 bus error while decoding H.264 and HEVC
      media: docs: dev-decoder: Trigger dynamic source change for colorspace
      media: amphion: Clear last_buffer_dequeued flag for DEC_CMD_START
      media: amphion: Trigger source change if colorspace changed
      media: amphion: Use kmalloc instead of vmalloc
      media: amphion: Drop min_queued_buffers assignment

Nicolas Dufresne (2):
      media: mediatek: vcodec: Don't try to decode 422/444 VP9
      media: v4l2-mem2mem: Add a kref to the v4l2_m2m_dev structure

Preyas Sharma (2):
      staging: media: av7110: use usleep_range in av7110_hw.c
      staging: media: av7110: use usleep_range in sp8870.c

Qianfeng Rong (1):
      media: mediatek: vcodec: use =3D { } instead of memset()

Rafael J. Wysocki (2):
      media: mediatek: vcodec: Discard pm_runtime_put() return value
      media: rkisp1: Discard pm_runtime_put() return value

Renjiang Han (1):
      media: venus: vdec: fix error state assignment for zero bytesused

Ricardo Ribalda (10):
      media: uvcvideo: Fix support for V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX
      media: uvcvideo: Remove nodrop parameter
      media: uvcvideo: Document how to format GUIDs
      Revert "media: uvcvideo: Remove nodrop parameter"
      media: dw9714: Fix powerup sequence
      media: iris: Fix fps calculation
      media: iris: Document difference in size during allocation
      media: uvcvideo: Create an ID namespace for streaming output terminals
      media: uvcvideo: Fix allocation for small frame sizes
      media: uvcvideo: Pass allocation size directly to uvc_alloc_urb_buffer

Richard Leitner (8):
      media: v4l: ctrls: add a control for flash/strobe duration
      media: v4l: ctrls: add a control for enabling strobe output
      Documentation: uAPI: media: add V4L2_CID_FLASH_{DURATION,STROBE_OE}
      media: i2c: ov9282: add output enable register definitions
      media: i2c: ov9282: add strobe output enable v4l2 control
      media: i2c: ov9282: add strobe_duration v4l2 control
      media: i2c: ov9282: implement try_ctrl for strobe_duration
      media: i2c: ov9282: dynamic flash_duration maximum

Rui Wang (1):
      media: rkisp1: Fix filter mode register configuration

Sakari Ailus (41):
      media: v4l2-ctrls: Set error v4l2_ctrl_new_fwnode_properties consiste=
ntly
      media: v4l2-fwnode: Allow passing NULL fwnode to endpoint parsers
      media: ccs: Avoid possible division by zero
      media: v4l2-async: Fix error handling on steps after finding a match
      media: Documentation: Clean up figure titles
      media: Documentation: Fix routing documentation flag references
      media: Documentation: Document -ENXIO for VIDIOC_SUBDEV_S_ROUTING
      media: v4l2-subdev: Extend VIDIOC_SUBDEV_S_ROUTING error codes
      media: ccs: No need to set streaming to false in power off
      media: ccs: Move ccs_pm_get_init function up
      media: ccs: Rename out label of ccs_start_streaming
      media: ccs: Move ccs_validate_csi_data_format up
      media: ccs: Fix setting initial sub-device state
      media: ccs: Use {enable,disable}_streams operations
      media: ccs: Track streaming state
      media: ccs: Support frame descriptors
      media: ipu6: Ensure stream_mutex is acquired when dealing with node l=
ist
      media: ipu6: Drop MMU hardware initialisation in probe()
      media: ipu6: Remove redundant driver data checks
      media: ipu6: Make symbols static
      media: ipu6: Remove redundant streaming start via buffer queueing
      media: ipu6: Don't check pipeline in stream_start
      media: ipu6: Close firmware streams on streaming enable failure
      media: ipu6: Always close firmware stream
      media: ipu6: Drop error argument from ipu6_isys_stream_start()
      media: ipu6: Obtain remote pad using media_pad_remote_pad_unique()
      media: ipu6: Obtain unique source pad from remote sub-device
      media: ipu6: Remove source_entity from struct ipu6_isys_stream
      media: ipu6: Drop custom functions to obtain sd state information
      media: ipu6: Always call video_device_pipeline_alloc_start()
      media: ccs: Clean up ccs_get_hwcfg() a little
      media: ccs: Use devm_v4l2_sensor_clk_get()
      media: ipu6: Update e-mail addresses
      media: ov01a10: Fix indentation
      media: ccs: Remove ccs_get_crop_compose helper
      media: ccs: Rely on sub-device state locking
      media: ccs: Switch to guard and scoped_guard
      media: ccs: Compute binning configuration from sub-device state
      media: ccs: Compute scaling configuration from sub-device state
      media: ccs: Remove which parameter from ccs_propagate
      media: ccs: Make supported mbus code bitmask a u64

Sebastian Fricke (1):
      media: mediatek: vcodec: Implement manual request completion

Shaurya Rane (1):
      media: radio-keene: fix memory leak in error path

Shrikant Raskar (1):
      media: saa6588: Remove dprintk macro and use v4l2_info()

Sun Jian (2):
      staging: media: tegra-video: move tegra210_csi_soc declaration to csi=
.h
      staging: media: tegra-video: move tegra20_vip_soc declaration to vip.h

Szymon Wilczek (1):
      media: pvrusb2: fix URB leak in pvr2_send_request_ex

Thorsten Schmelzer (3):
      media: adv7180: add support for ancillary devices
      media: adv7180: implement g_register and s_register
      media: adv7180: fix frame interval in progressive mode

Val Packett (1):
      media: iris: use fallback size when S_FMT is called without width/hei=
ght

Vikash Garodia (6):
      media: iris: Add support for multiple clock sources
      media: iris: Add support for multiple TZ content protection(CP) confi=
gs
      media: iris: Introduce buffer size calculations for vpu4
      media: iris: Move vpu register defines to common header file
      media: iris: Move vpu35 specific api to common to use for vpu4
      media: iris: Introduce vpu ops for vpu4 with necessary hooks

Vikram Sharma (1):
      dt-bindings: media: qcom,qcs8300-camss: Add missing power supplies

Vishnu Reddy (3):
      media: iris: Fix ffmpeg corrupted frame error
      media: iris: Prevent output buffer queuing before stream-on completes
      media: iris: Change psc properties message to debug level

Vladimir Zapolskiy (9):
      dt-bindings: media: i2c: Add Samsung S5KJN1 image sensor
      media: i2c: add Samsung S5KJN1 image sensor device driver
      dt-bindings: media: i2c: Add Samsung S5K3M5 image sensor
      media: i2c: Add Samsung S5K3M5 13MP camera sensor driver
      media: qcom: camss: Do not enable cpas fast ahb clock for SM8550 VFE =
lite
      media: qcom: camss: change internals of endpoint parsing to fwnode ha=
ndling
      media: qcom: camss: use a handy v4l2_async_nf_add_fwnode_remote() fun=
ction
      media: i2c: ov6211: make configurable vblank control of the sensor
      media: i2c: og0ve1b: make configurable vblank control of the sensor

Wangao Wang (6):
      media: qcom: iris: Improve format alignment for encoder
      media: qcom: iris: Improve crop_offset handling for encoder
      media: qcom: iris: Add scale support for encoder
      media: qcom: iris: Add rotation support for encoder
      media: qcom: iris: Add flip support for encoder
      media: qcom: iris: Add intra refresh support for encoder

Wenmeng Liu (3):
      media: qcom: camss: Add support for regulator init_load_uA in CSIPHY
      dt-bindings: media: Add qcom,sm6150-camss
      media: qcom: camss: add support for SM6150 camss

Xiaolei Wang (4):
      media: i2c: ov5647: use our own mutex for the ctrl lock
      media: i2c: ov5647: Convert to CCI register access helpers
      media: i2c: ov5647: Switch to using the sub-device state lock
      media: i2c: ov5647: switch to {enable,disable}_streams

Xulin Sun (3):
      media: chips-media: wave5: Fix PM runtime usage count underflow
      media: chips-media: wave5: Fix kthread worker destruction in polling =
mode
      media: chips-media: wave5: Fix device cleanup order to prevent kernel=
 panic

Yemike Abhilash Chandra (2):
      media: ti: vpe: Re-introduce multi-instance and multi-client support
      media: ti: vpe: Export vpdma_load_firmware() function

Zilin Guan (2):
      media: chips-media: wave5: Fix memory leak on codec_info allocation f=
ailure
      media: tegra-video: Fix memory leak in __tegra_channel_try_format()

Zixuan Dong (1):
      media: staging: atomisp: remove redundant OOM error messages

 Documentation/admin-guide/media/mgb4.rst           |   11 +-
 .../devicetree/bindings/media/i2c/adi,adv7180.yaml |   97 +-
 .../bindings/media/i2c/ovti,os05b10.yaml           |  103 +
 .../devicetree/bindings/media/i2c/ovti,ov5647.yaml |   14 +-
 .../bindings/media/i2c/samsung,s5k3m5.yaml         |  103 +
 .../bindings/media/i2c/samsung,s5kjn1.yaml         |  103 +
 .../bindings/media/i2c/toshiba,et8ek8.txt          |   55 -
 .../bindings/media/i2c/toshiba,et8ek8.yaml         |   87 +
 .../devicetree/bindings/media/nxp,imx8-jpeg.yaml   |    6 +
 .../bindings/media/qcom,qcs8300-camss.yaml         |   13 +
 .../bindings/media/qcom,sa8775p-camss.yaml         |    4 +-
 .../bindings/media/qcom,sc7280-camss.yaml          |    4 +-
 .../bindings/media/qcom,sc8280xp-camss.yaml        |    4 +-
 .../bindings/media/qcom,sdm670-camss.yaml          |    4 +-
 .../bindings/media/qcom,sdm845-camss.yaml          |    4 +-
 .../bindings/media/qcom,sm6150-camss.yaml          |  439 +++
 .../bindings/media/qcom,sm8250-camss.yaml          |    4 +-
 .../bindings/media/qcom,sm8550-camss.yaml          |    4 +-
 .../bindings/media/qcom,x1e80100-camss.yaml        |    4 +-
 .../devicetree/bindings/media/renesas,fcp.yaml     |    1 +
 .../bindings/media/rockchip,rk3568-mipi-csi2.yaml  |  141 +
 .../devicetree/bindings/media/ti,omap3isp.txt      |   71 -
 .../devicetree/bindings/media/ti,omap3isp.yaml     |  189 +
 .../devicetree/bindings/media/ti,vip.yaml          |  152 +
 Documentation/driver-api/media/v4l2-dev.rst        |    8 +-
 Documentation/userspace-api/media/conf_nitpick.py  |    2 -
 .../userspace-api/media/v4l/dev-decoder.rst        |    5 +-
 .../userspace-api/media/v4l/dev-raw-vbi.rst        |    6 +-
 .../userspace-api/media/v4l/dev-subdev.rst         |   17 +-
 .../media/v4l/ext-ctrls-codec-stateless.rst        |  120 +
 .../userspace-api/media/v4l/ext-ctrls-flash.rst    |   42 +
 .../userspace-api/media/v4l/pixfmt-compressed.rst  |    8 +
 .../userspace-api/media/v4l/subdev-formats.rst     |    2 +-
 .../media/v4l/videodev2.h.rst.exceptions           |    2 +
 .../userspace-api/media/v4l/vidioc-queryctrl.rst   |   12 +
 .../media/v4l/vidioc-subdev-g-routing.rst          |    9 +-
 MAINTAINERS                                        |   39 +-
 drivers/media/common/videobuf2/videobuf2-core.c    |   49 +-
 drivers/media/common/videobuf2/videobuf2-v4l2.c    |   14 -
 drivers/media/dvb-core/dmxdev.c                    |   46 +-
 drivers/media/dvb-core/dvb_vb2.c                   |   45 +-
 drivers/media/i2c/Kconfig                          |   33 +
 drivers/media/i2c/Makefile                         |    3 +
 drivers/media/i2c/adv7180.c                        |   55 +-
 drivers/media/i2c/adv7604.c                        |    8 +-
 drivers/media/i2c/aptina-pll.c                     |    2 +
 drivers/media/i2c/ccs/ccs-core.c                   |  854 ++---
 drivers/media/i2c/ccs/ccs.h                        |   17 +-
 drivers/media/i2c/dw9714.c                         |    2 +-
 drivers/media/i2c/et8ek8/et8ek8_driver.c           |    4 +
 drivers/media/i2c/imx219.c                         |   29 +-
 drivers/media/i2c/mt9m114.c                        |  271 +-
 drivers/media/i2c/og0ve1b.c                        |   55 +-
 drivers/media/i2c/os05b10.c                        | 1130 ++++++
 drivers/media/i2c/ov01a10.c                        |  920 +++--
 drivers/media/i2c/ov2735.c                         |    2 +-
 drivers/media/i2c/ov5647.c                         |  878 ++---
 drivers/media/i2c/ov6211.c                         |   55 +-
 drivers/media/i2c/ov9282.c                         |  173 +-
 drivers/media/i2c/s5k3m5.c                         | 1377 ++++++++
 drivers/media/i2c/s5kjn1.c                         | 1487 ++++++++
 drivers/media/i2c/saa6588.c                        |   27 +-
 drivers/media/i2c/tw9903.c                         |    1 +
 drivers/media/i2c/tw9906.c                         |    1 +
 drivers/media/mc/mc-device.c                       |   30 +
 drivers/media/mc/mc-devnode.c                      |    5 +
 drivers/media/mc/mc-request.c                      |   47 +-
 drivers/media/pci/cx23885/cx23885-alsa.c           |    4 +-
 drivers/media/pci/cx25821/cx25821-alsa.c           |    1 +
 drivers/media/pci/cx25821/cx25821-core.c           |    1 +
 drivers/media/pci/cx88/cx88-alsa.c                 |    4 +-
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c      |    2 +-
 drivers/media/pci/intel/ipu6/ipu6-isys-queue.c     |   73 +-
 drivers/media/pci/intel/ipu6/ipu6-isys-queue.h     |    1 -
 drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c    |   36 -
 drivers/media/pci/intel/ipu6/ipu6-isys-subdev.h    |    4 -
 drivers/media/pci/intel/ipu6/ipu6-isys-video.c     |   88 +-
 drivers/media/pci/intel/ipu6/ipu6-isys-video.h     |    6 +-
 drivers/media/pci/intel/ipu6/ipu6-isys.c           |   23 +-
 drivers/media/pci/intel/ipu6/ipu6-isys.h           |    2 -
 drivers/media/pci/intel/ipu6/ipu6-mmu.c            |    4 +-
 drivers/media/pci/intel/ipu6/ipu6.c                |   12 +-
 drivers/media/pci/mgb4/mgb4_core.c                 |   22 +-
 drivers/media/pci/mgb4/mgb4_core.h                 |   16 +-
 drivers/media/pci/mgb4/mgb4_sysfs.h                |    6 +-
 drivers/media/pci/mgb4/mgb4_sysfs_in.c             |   49 +-
 drivers/media/pci/mgb4/mgb4_sysfs_out.c            |   38 +-
 drivers/media/pci/mgb4/mgb4_vin.c                  |   93 +-
 drivers/media/pci/mgb4/mgb4_vout.c                 |   64 +-
 drivers/media/pci/solo6x10/solo6x10-tw28.c         |    8 +-
 drivers/media/platform/amphion/vdec.c              |   78 +-
 drivers/media/platform/amphion/venc.c              |   20 +-
 drivers/media/platform/amphion/vpu_cmds.c          |   15 +-
 drivers/media/platform/amphion/vpu_core.c          |   11 +-
 drivers/media/platform/amphion/vpu_v4l2.c          |    3 -
 drivers/media/platform/aspeed/aspeed-video.c       |   22 +-
 .../platform/chips-media/wave5/wave5-helper.c      |   28 +-
 .../platform/chips-media/wave5/wave5-helper.h      |    1 +
 .../media/platform/chips-media/wave5/wave5-hw.c    |    2 +-
 .../platform/chips-media/wave5/wave5-vpu-dec.c     |  194 +-
 .../platform/chips-media/wave5/wave5-vpu-enc.c     |   17 +-
 .../media/platform/chips-media/wave5/wave5-vpu.c   |  121 +-
 .../media/platform/chips-media/wave5/wave5-vpu.h   |    2 +-
 .../platform/chips-media/wave5/wave5-vpuapi.c      |   68 +-
 .../platform/chips-media/wave5/wave5-vpuapi.h      |   12 +
 .../platform/chips-media/wave5/wave5-vpuconfig.h   |    1 +
 drivers/media/platform/mediatek/mdp/mtk_mdp_core.c |   17 +-
 .../media/platform/mediatek/mdp3/mtk-mdp3-core.c   |    6 +-
 .../mediatek/vcodec/decoder/mtk_vcodec_dec.c       |    4 +-
 .../mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h   |   17 +
 .../mediatek/vcodec/decoder/mtk_vcodec_dec_pm.c    |    6 +-
 .../vcodec/decoder/mtk_vcodec_dec_stateless.c      |  115 +-
 .../mediatek/vcodec/decoder/vdec/vdec_vp9_if.c     |    3 +-
 .../platform/mediatek/vcodec/decoder/vdec_vpu_if.c |   12 +-
 .../mediatek/vcodec/encoder/mtk_vcodec_enc.c       |   12 +-
 .../mediatek/vcodec/encoder/mtk_vcodec_enc_pm.c    |    6 +-
 .../platform/mediatek/vcodec/encoder/venc_vpu_if.c |   15 +-
 drivers/media/platform/mediatek/vpu/mtk_vpu.h      |    3 +-
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c     |   70 +-
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h     |    1 +
 drivers/media/platform/nxp/imx-mipi-csis.c         |   31 +-
 drivers/media/platform/nxp/imx7-media-csi.c        |   14 +-
 .../media/platform/nxp/imx8-isi/imx8-isi-core.c    |   17 +-
 .../platform/nxp/imx8-isi/imx8-isi-crossbar.c      |    2 +-
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c      |   58 +-
 drivers/media/platform/qcom/camss/camss-csid-340.c |   10 +-
 drivers/media/platform/qcom/camss/camss-csid.c     |   18 +-
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     |   21 +-
 drivers/media/platform/qcom/camss/camss-csiphy.c   |   19 +-
 drivers/media/platform/qcom/camss/camss-csiphy.h   |    1 +
 drivers/media/platform/qcom/camss/camss-vfe-480.c  |    6 +-
 drivers/media/platform/qcom/camss/camss-vfe.c      |    2 +
 drivers/media/platform/qcom/camss/camss.c          |  586 +++-
 drivers/media/platform/qcom/camss/camss.h          |    3 +-
 drivers/media/platform/qcom/iris/Makefile          |    1 +
 drivers/media/platform/qcom/iris/iris_buffer.c     |    7 +-
 drivers/media/platform/qcom/iris/iris_buffer.h     |    2 +
 drivers/media/platform/qcom/iris/iris_ctrls.c      |  103 +
 drivers/media/platform/qcom/iris/iris_ctrls.h      |    3 +
 drivers/media/platform/qcom/iris/iris_firmware.c   |   23 +-
 drivers/media/platform/qcom/iris/iris_hfi_common.h |    3 +
 .../platform/qcom/iris/iris_hfi_gen1_command.c     |    6 +-
 .../platform/qcom/iris/iris_hfi_gen2_command.c     |  153 +-
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |   28 +
 .../platform/qcom/iris/iris_hfi_gen2_response.c    |   24 +
 drivers/media/platform/qcom/iris/iris_instance.h   |    9 +
 .../platform/qcom/iris/iris_platform_common.h      |   29 +-
 .../media/platform/qcom/iris/iris_platform_gen1.c  |   47 +-
 .../media/platform/qcom/iris/iris_platform_gen2.c  |  257 +-
 .../platform/qcom/iris/iris_platform_sc7280.h      |    5 +
 drivers/media/platform/qcom/iris/iris_power.c      |    2 +-
 drivers/media/platform/qcom/iris/iris_probe.c      |   20 +-
 drivers/media/platform/qcom/iris/iris_resources.c  |   16 +-
 drivers/media/platform/qcom/iris/iris_resources.h  |    1 +
 drivers/media/platform/qcom/iris/iris_utils.c      |    6 +
 drivers/media/platform/qcom/iris/iris_utils.h      |    1 +
 drivers/media/platform/qcom/iris/iris_vb2.c        |   18 +-
 drivers/media/platform/qcom/iris/iris_vdec.c       |   31 +-
 drivers/media/platform/qcom/iris/iris_venc.c       |   48 +-
 drivers/media/platform/qcom/iris/iris_vidc.c       |   11 +-
 drivers/media/platform/qcom/iris/iris_vpu3x.c      |  199 +-
 drivers/media/platform/qcom/iris/iris_vpu4x.c      |  369 ++
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c |  701 +++-
 drivers/media/platform/qcom/iris/iris_vpu_buffer.h |  140 +
 drivers/media/platform/qcom/iris/iris_vpu_common.c |  188 +-
 drivers/media/platform/qcom/iris/iris_vpu_common.h |    5 +
 .../platform/qcom/iris/iris_vpu_register_defines.h |   61 +
 drivers/media/platform/qcom/venus/vdec.c           |   20 +-
 drivers/media/platform/qcom/venus/venc.c           |    6 +-
 drivers/media/platform/raspberrypi/rp1-cfe/csi2.c  |    2 +-
 drivers/media/platform/rockchip/rga/rga-buf.c      |    3 +
 .../platform/rockchip/rkisp1/rkisp1-capture.c      |    5 +-
 .../media/platform/rockchip/rkisp1/rkisp1-params.c |    6 -
 drivers/media/platform/rockchip/rkvdec/Makefile    |   14 +-
 .../rkvdec/{rkvdec-hevc-data.c =3D> rkvdec-cabac.c}  |  506 ++-
 .../media/platform/rockchip/rkvdec/rkvdec-cabac.h  |   21 +
 .../platform/rockchip/rkvdec/rkvdec-h264-common.c  |  258 ++
 .../platform/rockchip/rkvdec/rkvdec-h264-common.h  |   85 +
 .../media/platform/rockchip/rkvdec/rkvdec-h264.c   |  893 +----
 .../platform/rockchip/rkvdec/rkvdec-hevc-common.c  |  511 +++
 .../platform/rockchip/rkvdec/rkvdec-hevc-common.h  |  107 +
 .../media/platform/rockchip/rkvdec/rkvdec-hevc.c   |  282 +-
 .../media/platform/rockchip/rkvdec/rkvdec-rcb.c    |  179 +
 .../media/platform/rockchip/rkvdec/rkvdec-rcb.h    |   29 +
 .../media/platform/rockchip/rkvdec/rkvdec-regs.h   |  586 +++-
 .../platform/rockchip/rkvdec/rkvdec-vdpu381-h264.c |  469 +++
 .../platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c |  639 ++++
 .../platform/rockchip/rkvdec/rkvdec-vdpu381-regs.h |  430 +++
 .../platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c |  538 +++
 .../platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c |  652 ++++
 .../platform/rockchip/rkvdec/rkvdec-vdpu383-regs.h |  281 ++
 .../media/platform/rockchip/rkvdec/rkvdec-vp9.c    |  232 +-
 drivers/media/platform/rockchip/rkvdec/rkvdec.c    |  633 +++-
 drivers/media/platform/rockchip/rkvdec/rkvdec.h    |   50 +-
 .../st/stm32/stm32-dcmipp/dcmipp-bytecap.c         |   24 +-
 .../st/stm32/stm32-dcmipp/dcmipp-byteproc.c        |   24 +-
 .../platform/st/stm32/stm32-dcmipp/dcmipp-core.c   |    7 +-
 .../platform/st/stm32/stm32-dcmipp/dcmipp-input.c  |   10 +
 drivers/media/platform/synopsys/Kconfig            |   18 +
 drivers/media/platform/synopsys/Makefile           |    2 +
 drivers/media/platform/synopsys/dw-mipi-csi2rx.c   |  722 ++++
 .../media/platform/synopsys/hdmirx/snps_hdmirx.c   |   90 +-
 .../media/platform/synopsys/hdmirx/snps_hdmirx.h   |    2 +
 drivers/media/platform/ti/Kconfig                  |   13 +
 drivers/media/platform/ti/omap3isp/ispccdc.c       |    1 +
 drivers/media/platform/ti/omap3isp/ispccp2.c       |    3 +-
 drivers/media/platform/ti/omap3isp/ispcsi2.c       |    1 +
 drivers/media/platform/ti/omap3isp/isppreview.c    |   26 +-
 drivers/media/platform/ti/omap3isp/ispresizer.c    |    3 +-
 drivers/media/platform/ti/omap3isp/ispstat.c       |    1 +
 drivers/media/platform/ti/omap3isp/ispvideo.c      |  178 +-
 drivers/media/platform/ti/vpe/Makefile             |    2 +
 drivers/media/platform/ti/vpe/vip.c                | 3673 ++++++++++++++++=
++++
 drivers/media/platform/ti/vpe/vip.h                |  717 ++++
 drivers/media/platform/ti/vpe/vpdma.c              |   51 +-
 drivers/media/platform/ti/vpe/vpdma.h              |    6 +
 drivers/media/platform/verisilicon/hantro.h        |    2 +
 drivers/media/platform/verisilicon/hantro_drv.c    |   42 +-
 drivers/media/platform/verisilicon/imx8m_vpu_hw.c  |    8 +
 .../verisilicon/rockchip_vpu981_hw_av1_dec.c       |   43 +-
 drivers/media/radio/radio-keene.c                  |    2 +-
 drivers/media/test-drivers/vicodec/vicodec-core.c  |   21 +-
 drivers/media/test-drivers/visl/visl-dec.c         |    7 +
 drivers/media/test-drivers/visl/visl-dec.h         |    3 +
 drivers/media/test-drivers/visl/visl-trace-hevc.h  |   59 +
 drivers/media/usb/pvrusb2/pvrusb2-hdw.c            |    5 +
 drivers/media/usb/uvc/uvc_ctrl.c                   |   79 +-
 drivers/media/usb/uvc/uvc_driver.c                 |   54 +-
 drivers/media/usb/uvc/uvc_queue.c                  |   14 +-
 drivers/media/usb/uvc/uvc_v4l2.c                   |   10 +-
 drivers/media/usb/uvc/uvc_video.c                  |   15 +-
 drivers/media/usb/uvc/uvcvideo.h                   |    5 +-
 drivers/media/v4l2-core/v4l2-async.c               |   45 +-
 drivers/media/v4l2-core/v4l2-ctrls-core.c          |   31 +-
 drivers/media/v4l2-core/v4l2-ctrls-defs.c          |   13 +
 drivers/media/v4l2-core/v4l2-fwnode.c              |    3 +
 drivers/media/v4l2-core/v4l2-ioctl.c               |    1 +
 drivers/media/v4l2-core/v4l2-mem2mem.c             |   33 +-
 drivers/media/v4l2-core/v4l2-subdev.c              |    2 +-
 drivers/staging/media/atomisp/pci/atomisp_cmd.c    |    5 +-
 .../isp/kernels/fc/fc_1.0/ia_css_formats.host.c    |    3 +-
 drivers/staging/media/av7110/av7110_hw.c           |   20 +-
 drivers/staging/media/av7110/sp8870.c              |    2 +-
 drivers/staging/media/imx/imx6-mipi-csi2.c         |  106 +-
 drivers/staging/media/ipu7/ipu7-buttress.c         |   17 +-
 drivers/staging/media/ipu7/ipu7-isys-csi-phy.c     |   13 +-
 drivers/staging/media/ipu7/ipu7-mmu.c              |    2 +-
 drivers/staging/media/ipu7/ipu7.c                  |    6 +-
 drivers/staging/media/tegra-video/csi.c            |    4 -
 drivers/staging/media/tegra-video/csi.h            |    4 +
 drivers/staging/media/tegra-video/vi.c             |   13 +-
 drivers/staging/media/tegra-video/vip.c            |    4 -
 drivers/staging/media/tegra-video/vip.h            |    4 +
 include/linux/usb/uvc.h                            |    8 +
 include/media/dvb_vb2.h                            |   17 +-
 include/media/media-device.h                       |    9 +
 include/media/media-devnode.h                      |    4 +
 include/media/media-request.h                      |   40 +-
 include/media/v4l2-ctrls.h                         |    3 +
 include/media/v4l2-fwnode.h                        |    8 +-
 include/media/v4l2-mem2mem.h                       |   21 +
 include/media/videobuf2-core.h                     |   23 +-
 include/media/videobuf2-v4l2.h                     |   18 -
 include/uapi/linux/v4l2-controls.h                 |   63 +
 include/uapi/linux/videodev2.h                     |    3 +
 265 files changed, 23495 insertions(+), 4686 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,os05b1=
0.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/samsung,s5k=
3m5.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/samsung,s5k=
jn1.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/toshiba,et8=
ek8.txt
 create mode 100644 Documentation/devicetree/bindings/media/i2c/toshiba,et8=
ek8.yaml
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sm6150-cam=
ss.yaml
 create mode 100644 Documentation/devicetree/bindings/media/rockchip,rk3568=
-mipi-csi2.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/ti,omap3isp.txt
 create mode 100644 Documentation/devicetree/bindings/media/ti,omap3isp.yaml
 create mode 100644 Documentation/devicetree/bindings/media/ti,vip.yaml
 create mode 100644 drivers/media/i2c/os05b10.c
 create mode 100644 drivers/media/i2c/s5k3m5.c
 create mode 100644 drivers/media/i2c/s5kjn1.c
 create mode 100644 drivers/media/platform/qcom/iris/iris_vpu4x.c
 rename drivers/media/platform/rockchip/rkvdec/{rkvdec-hevc-data.c =3D> rkv=
dec-cabac.c} (86%)
 create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-cabac.h
 create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-h264-comm=
on.c
 create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-h264-comm=
on.h
 create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-comm=
on.c
 create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-comm=
on.h
 create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.c
 create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.h
 create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-h=
264.c
 create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-h=
evc.c
 create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-r=
egs.h
 create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-h=
264.c
 create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-h=
evc.c
 create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-r=
egs.h
 create mode 100644 drivers/media/platform/synopsys/dw-mipi-csi2rx.c
 create mode 100644 drivers/media/platform/ti/vpe/vip.c
 create mode 100644 drivers/media/platform/ti/vpe/vip.h

