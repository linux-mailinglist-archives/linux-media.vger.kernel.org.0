Return-Path: <linux-media+bounces-52541-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gPc1NP17i2n6UgAAu9opvQ
	(envelope-from <linux-media+bounces-52541-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 19:42:05 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 500F111E5F5
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 19:42:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 42F9D3042241
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 18:41:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 742733859F9;
	Tue, 10 Feb 2026 18:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A3/bGbsK"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBAD93112DC;
	Tue, 10 Feb 2026 18:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770748906; cv=none; b=AuzXVo8Q3UlnLYPG6vGlm+rROzvNIolpVxcJAWq+XwJsxM+JRh3oeMp4opP/ZcSa/dmz3yLc0Ud8wwPEwzcr6fZqf7+s9CnSVWq6jxAZ2W8iMxBwqiJbm2E3erdPTHlcz1fshfbS91yK/NT08WDrtyzydjQUAdacJGIMz1iReU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770748906; c=relaxed/simple;
	bh=XwqLQVmp5nfxn7gimax6WbcjxPnpV7xEbQaq50piFpk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=X8D8+pXRrvaTEoIdGQres2FNNZWLRKiFVRhXKGQnpy4uKQbHmKNvBH5OSDLVj2BuTA9IHkR+J4aMG9hK6VxfF+u/KTmq2ZyM8VQ2hPJDFu78Ww0HzJzogWiZkCQDcWC3gVUANpqSeLsNW1aV7QySaHBNq/EELsUJKiFyWX6MtDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A3/bGbsK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0154EC116C6;
	Tue, 10 Feb 2026 18:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770748906;
	bh=XwqLQVmp5nfxn7gimax6WbcjxPnpV7xEbQaq50piFpk=;
	h=Date:From:To:Cc:Subject:From;
	b=A3/bGbsKbQsuGr+80thf1Y4C55bX0JxMAI7tyAr0DOC1ytuPvFUm01iW6bEgoqedm
	 3UdwiUTRHdXkj30loHvvKhGNDZJAVACP8+fYjgDfVoc076oz/dBLUKArUR3sCnW9Em
	 ZA8Q2oL3YUNvLoJNjaxaVxryEyZERq+584QpeyzOeB2BXtcngxA7uX8L8gkVSCKkC2
	 CVK8w2AgEyYjTgUYxM2RzZMESw+/niRwkFHjsKFapOQpqF96ETNcuTupEu0OHY/NNb
	 CbdNr7oCl619/bnvWUdZWTjGd40kJCxSam0oGv67ESF0SYzyUOL4jxp1y0v6Nlu4r1
	 0yu2OxPRMVcjg==
Date: Tue, 10 Feb 2026 19:41:41 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton
 <akpm@linux-foundation.org>, Linux Media Mailing List
 <linux-media@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>
Subject: [GIT PULL for v7.0] media updates
Message-ID: <20260210194141.26d1eed4@foz.lan>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52541-lists,linux-media=lfdr.de,huawei];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_X_PRIO_ONE(0.00)[1];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	PRECEDENCE_BULK(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,foz.lan:mid]
X-Rspamd-Queue-Id: 500F111E5F5
X-Rspamd-Action: no action

Hi Linus,

Please pull from:

	git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git medi=
a/v7.0-1

For:

Key changes

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
   =20
Regards,
Mauro

---

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git tag=
s/media/v7.0-1

for you to fetch changes up to 36eab90d3f4f4c38d1e9635af40cdd40c7675471:

  media: i2c: ov01a10: Add ov01a1b support (2026-01-13 12:28:49 +0100)

----------------------------------------------------------------
[GIT PULL for v7.0] media updates

----------------------------------------------------------------
Abdun Nihaal (2):
      media: i2c/tw9903: Fix potential memory leak in tw9903_probe()
      media: i2c/tw9906: Fix potential memory leak in tw9906_probe()

Alper Ak (1):
      media: rockchip: rga: Fix possible ERR_PTR dereference in rga_buf_ini=
t()

Benjamin Gaignard (3):
      media: verisilicon: AV1: Fix enable cdef computation
      media: verisilicon: AV1: Fix tx mode bit setting
      media: verisilicon: AV1: Set IDR flag for intra_only frame type

Brandon Brnich (3):
      media: chips-media: wave5: Fix conditional in start_streaming
      media: chips-media: wave5: Process ready frames when CMD_STOP sent to=
 Encoder
      media: chips-media: wave5: Fix Potential Probe Resource Leak

Deepa Guthyappa Madivalara (5):
      media: uapi: videodev2: Add support for AV1 stateful decoder
      media: v4l2: Add description for V4L2_PIX_FMT_AV1 in v4l_fill_fmtdesc=
()
      media: iris: Add support for AV1 format in iris decoder
      media: iris: Define AV1-specific platform capabilities and properties
      media: iris: Add internal buffer calculation for AV1 decoder

Dmitry Antipov (1):
      media: v4l2-core: simplify v4l2_m2m_register_entity()

Dmitry Osipenko (1):
      media: synopsys: hdmirx: Detect broken interrupt

Elgin Perumbilly (1):
      dt-bindings: media: i2c: Add os05b10 sensor

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

Hans de Goede (23):
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

Haoxiang Li (6):
      media: mtk-mdp: Fix error handling in probe function
      media: mtk-mdp: Fix a reference leak bug in mtk_mdp_remove()
      media: cx88: Add missing unmap in snd_cx88_hw_params()
      media: cx23885: Add missing unmap in snd_cx23885_hw_params()
      media: cx25821: Add missing unmap in snd_cx25821_hw_params()
      media: cx25821: Fix a resource leak in cx25821_dev_setup()

Himanshu Bhavani (1):
      media: i2c: add os05b10 image sensor driver

Irui Wang (1):
      media: mediatek: encoder: Fix uninitialized scalar variable issue

Jackson Lee (4):
      media: chips-media: wave5: Fix SError of kernel panic when closed
      media: chips-media: wave5: Fix Null reference while testing fluster
      media: chips-media: wave5: Add WARN_ON to check if dec_output_info is=
 NULL
      media: chips-media: wave5: Improve performance of decoder

Jammy Huang (1):
      media: aspeed: Fix dram hang at res-change

Johan Hovold (1):
      media: mediatek: amend vpu_get_plat_device() documentation

John Bauer (1):
      media: uvcvideo: UVC minimum relative pan/tilt/zoom speed fix.

Kees Cook (1):
      media: solo6x10: Check for out of bounds chip_id

Laurent Pinchart (1):
      media: uvcvideo: Replace dev_dbg() with uvc_dbg()

Lukas Bulwahn (1):
      MAINTAINERS: adjust file entry in MEDIATEK MDP DRIVER

Marco Crivellari (1):
      media: platform: mtk-mdp3: add WQ_PERCPU to alloc_workqueue users

Marek Vasut (2):
      media: dt-bindings: nxp,imx8-jpeg: Document optional SRAM support
      media: imx-jpeg: Add support for descriptor allocation from SRAM

Michael Tretter (1):
      media: dt-bindings: adi,adv7180: add VPP and CSI register maps

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

Rafael J. Wysocki (1):
      media: mediatek: vcodec: Discard pm_runtime_put() return value

Ricardo Ribalda (4):
      media: uvcvideo: Fix support for V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX
      media: uvcvideo: Remove nodrop parameter
      media: uvcvideo: Document how to format GUIDs
      Revert "media: uvcvideo: Remove nodrop parameter"

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

Vladimir Zapolskiy (4):
      dt-bindings: media: i2c: Add Samsung S5KJN1 image sensor
      media: i2c: add Samsung S5KJN1 image sensor device driver
      dt-bindings: media: i2c: Add Samsung S5K3M5 image sensor
      media: i2c: Add Samsung S5K3M5 13MP camera sensor driver

Xulin Sun (3):
      media: chips-media: wave5: Fix PM runtime usage count underflow
      media: chips-media: wave5: Fix kthread worker destruction in polling =
mode
      media: chips-media: wave5: Fix device cleanup order to prevent kernel=
 panic

Zilin Guan (2):
      media: chips-media: wave5: Fix memory leak on codec_info allocation f=
ailure
      media: tegra-video: Fix memory leak in __tegra_channel_try_format()

 .../devicetree/bindings/media/i2c/adi,adv7180.yaml |   97 +-
 .../bindings/media/i2c/ovti,os05b10.yaml           |  103 ++
 .../bindings/media/i2c/samsung,s5k3m5.yaml         |  103 ++
 .../bindings/media/i2c/samsung,s5kjn1.yaml         |  103 ++
 .../devicetree/bindings/media/nxp,imx8-jpeg.yaml   |    6 +
 Documentation/driver-api/media/v4l2-dev.rst        |    8 +-
 Documentation/userspace-api/media/conf_nitpick.py  |    2 -
 .../userspace-api/media/v4l/dev-decoder.rst        |    5 +-
 .../userspace-api/media/v4l/pixfmt-compressed.rst  |    8 +
 MAINTAINERS                                        |   26 +-
 drivers/media/common/videobuf2/videobuf2-core.c    |   49 +-
 drivers/media/common/videobuf2/videobuf2-v4l2.c    |   14 -
 drivers/media/dvb-core/dmxdev.c                    |   46 +-
 drivers/media/dvb-core/dvb_vb2.c                   |   45 +-
 drivers/media/i2c/Kconfig                          |   31 +
 drivers/media/i2c/Makefile                         |    3 +
 drivers/media/i2c/adv7180.c                        |   55 +-
 drivers/media/i2c/os05b10.c                        | 1135 +++++++++++++++
 drivers/media/i2c/ov01a10.c                        |  918 +++++++-----
 drivers/media/i2c/s5k3m5.c                         | 1377 ++++++++++++++++=
++
 drivers/media/i2c/s5kjn1.c                         | 1487 ++++++++++++++++=
++++
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
 .../platform/chips-media/wave5/wave5-vpu-dec.c     |  194 ++-
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
 drivers/media/platform/qcom/iris/iris_buffer.h     |    2 +
 drivers/media/platform/qcom/iris/iris_ctrls.c      |    8 +
 drivers/media/platform/qcom/iris/iris_hfi_common.h |    3 +
 .../platform/qcom/iris/iris_hfi_gen2_command.c     |   85 +-
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |    9 +
 .../platform/qcom/iris/iris_hfi_gen2_response.c    |   22 +
 drivers/media/platform/qcom/iris/iris_instance.h   |    1 +
 .../platform/qcom/iris/iris_platform_common.h      |   13 +
 .../media/platform/qcom/iris/iris_platform_gen1.c  |   22 +-
 .../media/platform/qcom/iris/iris_platform_gen2.c  |  159 +++
 drivers/media/platform/qcom/iris/iris_vdec.c       |   23 +-
 drivers/media/platform/qcom/iris/iris_vidc.c       |    1 +
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c |  299 +++-
 drivers/media/platform/qcom/iris/iris_vpu_buffer.h |  116 ++
 drivers/media/platform/rockchip/rga/rga-buf.c      |    3 +
 .../media/platform/synopsys/hdmirx/snps_hdmirx.c   |   90 +-
 .../media/platform/synopsys/hdmirx/snps_hdmirx.h   |    2 +
 drivers/media/platform/ti/omap3isp/ispccdc.c       |    1 +
 drivers/media/platform/ti/omap3isp/ispccp2.c       |    3 +-
 drivers/media/platform/ti/omap3isp/ispcsi2.c       |    1 +
 drivers/media/platform/ti/omap3isp/isppreview.c    |   26 +-
 drivers/media/platform/ti/omap3isp/ispresizer.c    |    3 +-
 drivers/media/platform/ti/omap3isp/ispstat.c       |    1 +
 drivers/media/platform/ti/omap3isp/ispvideo.c      |  178 ++-
 drivers/media/platform/verisilicon/hantro.h        |    2 +
 drivers/media/platform/verisilicon/hantro_drv.c    |   42 +-
 drivers/media/platform/verisilicon/imx8m_vpu_hw.c  |    8 +
 .../verisilicon/rockchip_vpu981_hw_av1_dec.c       |   39 +-
 drivers/media/radio/radio-keene.c                  |    2 +-
 drivers/media/test-drivers/vicodec/vicodec-core.c  |   21 +-
 drivers/media/usb/pvrusb2/pvrusb2-hdw.c            |    5 +
 drivers/media/usb/uvc/uvc_ctrl.c                   |   79 +-
 drivers/media/usb/uvc/uvc_queue.c                  |    2 +-
 drivers/media/usb/uvc/uvc_v4l2.c                   |   10 +-
 drivers/media/usb/uvc/uvcvideo.h                   |    2 +-
 drivers/media/v4l2-core/v4l2-ioctl.c               |    1 +
 drivers/media/v4l2-core/v4l2-mem2mem.c             |   33 +-
 drivers/staging/media/av7110/av7110_hw.c           |   20 +-
 drivers/staging/media/av7110/sp8870.c              |    2 +-
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
 include/media/v4l2-mem2mem.h                       |   21 +
 include/media/videobuf2-core.h                     |   23 +-
 include/media/videobuf2-v4l2.h                     |   18 -
 include/uapi/linux/videodev2.h                     |    1 +
 115 files changed, 7151 insertions(+), 990 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,os05b1=
0.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/samsung,s5k=
3m5.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/samsung,s5k=
jn1.yaml
 create mode 100644 drivers/media/i2c/os05b10.c
 create mode 100644 drivers/media/i2c/s5k3m5.c
 create mode 100644 drivers/media/i2c/s5kjn1.c

