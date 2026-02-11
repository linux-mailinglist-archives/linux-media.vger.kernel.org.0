Return-Path: <linux-media+bounces-52598-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IBnzFHdojGkdnAAAu9opvQ
	(envelope-from <linux-media+bounces-52598-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 12:31:03 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A8D123DF7
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 12:31:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0BA0F300B9B5
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 11:31:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DD2D314A83;
	Wed, 11 Feb 2026 11:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CCaJDDFe"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769B42F2905;
	Wed, 11 Feb 2026 11:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770809459; cv=none; b=NXdzoiwvLJEW5DtWQJ0xlbPlM4ixD1gjCuJAhFQvMVvzbh5ZTJcR83GpSMAZG87Za+qRag9/9mU+XohVSk4cY05gyDv9mlJ1TOnEJlB9KrFQhRQWJMqbtTgZpfdHqalWQP/TbROY4RAjNJpNc28yi0yKT9bQE4CHgRaUFxy19t8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770809459; c=relaxed/simple;
	bh=q8VKQ4qETOuYpvlmDCiIS0C4u06AM6uHmFsi+viP3TQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cNArEMPhODLr8DneMJWnGBda6H3m1jc23dI445EQ/t0xgLV53Ed9eCAf0eI3rEQCAnV7ILeT3F/WiKhnogPK3dHAyGL1IncU6JlJB9+xd6EEdUd2ERxLyAKhL42RV+b+znj/aYVahybJ7vEubKZ7Q76CvS+rqDaHnkQmsh2EHPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CCaJDDFe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27D11C4CEF7;
	Wed, 11 Feb 2026 11:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770809459;
	bh=q8VKQ4qETOuYpvlmDCiIS0C4u06AM6uHmFsi+viP3TQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=CCaJDDFe9QAPNr1DdBp7J/sSL5bjXPTIrjxRADXhbQunbZ3hxC8w3d3Kr4Kpb1rPI
	 no3wbD0ej2aewKULVDEz4Nxo1ENCeBTB9LHPlmJsLTsLBDJh7dYN82RoFaraZ2AZuJ
	 c9+y23GGSe/ee1lLUjNWqTX4bpF432LHsGyMt7GikZaoyGlzgpUTnI/8N/5ubjvYVg
	 hPutJEmibtkPalnvC6hSXKI5Fb8s0XtA8mN1IGzvB+RG+DWZu1Ad1OqMOVE7Xnpb5a
	 1Nl5OFAO1xKOB3OkGsdohTNY7boU+B6BHnpO3V22i06GZLGVKeHof5K3IN29P2m4eg
	 04UvVJxehxnfg==
Date: Wed, 11 Feb 2026 12:30:55 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton
 <akpm@linux-foundation.org>, Linux Media Mailing List
 <linux-media@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>
Subject: Re: [GIT PULL for v7.0] media updates
Message-ID: <20260211123055.7cb99ee4@foz.lan>
In-Reply-To: <20260210194141.26d1eed4@foz.lan>
References: <20260210194141.26d1eed4@foz.lan>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,foz.lan:mid];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_FROM(0.00)[bounces-52598-lists,linux-media=lfdr.de,huawei];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_ALL(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Queue-Id: 21A8D123DF7
X-Rspamd-Action: no action

Hi Linus,

On Tue, 10 Feb 2026 19:41:41 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Hi Linus,
>=20
> Please pull from:
>=20
> 	git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git me=
dia/v7.0-1

Please ignore the PR from media/v7.0-1 tag, as it doesn't contain
everything that it is described below.

Just sent an updated PR with all patches on it.

Regards,
Mauro

>=20
> For:
>=20
> Key changes
>=20
> - PCI=E2=80=AF:=E2=80=AFmgb4 =E2=80=93 Add support for GMSL1 and GMSL=E2=
=80=91coax modules =20
> - Add driver for TI=E2=80=AFVIP;
> - AV1 =E2=80=93 first kernel support (pixel=E2=80=91format, decoder, tran=
scoder) =20
> - Three new camera=E2=80=91sensor drivers (os05b10, s5k3m5, s5kjn1) =20
> - Synopsys CSI=E2=80=912 receiver driver =20
> - Verisilicon & rkvdec =E2=80=93 major fixes and enhancements =20
> - PCI=E2=80=AFmgb4 =E2=80=93 support for GMSL=E2=80=91coax modules
> - IPU6 (and 7) fixes and preparation for metadata;
> - omap3isp: v4l2-compliance updates;
> - dvb/vb2: fix DVB streaming, drop wait_prepare/finish.
>    =20
> Regards,
> Mauro
>=20
> ---
>=20
> The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1=
e8:
>=20
>   Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git t=
ags/media/v7.0-1
>=20
> for you to fetch changes up to 36eab90d3f4f4c38d1e9635af40cdd40c7675471:
>=20
>   media: i2c: ov01a10: Add ov01a1b support (2026-01-13 12:28:49 +0100)
>=20
> ----------------------------------------------------------------
> [GIT PULL for v7.0] media updates
>=20
> ----------------------------------------------------------------
> Abdun Nihaal (2):
>       media: i2c/tw9903: Fix potential memory leak in tw9903_probe()
>       media: i2c/tw9906: Fix potential memory leak in tw9906_probe()
>=20
> Alper Ak (1):
>       media: rockchip: rga: Fix possible ERR_PTR dereference in rga_buf_i=
nit()
>=20
> Benjamin Gaignard (3):
>       media: verisilicon: AV1: Fix enable cdef computation
>       media: verisilicon: AV1: Fix tx mode bit setting
>       media: verisilicon: AV1: Set IDR flag for intra_only frame type
>=20
> Brandon Brnich (3):
>       media: chips-media: wave5: Fix conditional in start_streaming
>       media: chips-media: wave5: Process ready frames when CMD_STOP sent =
to Encoder
>       media: chips-media: wave5: Fix Potential Probe Resource Leak
>=20
> Deepa Guthyappa Madivalara (5):
>       media: uapi: videodev2: Add support for AV1 stateful decoder
>       media: v4l2: Add description for V4L2_PIX_FMT_AV1 in v4l_fill_fmtde=
sc()
>       media: iris: Add support for AV1 format in iris decoder
>       media: iris: Define AV1-specific platform capabilities and properti=
es
>       media: iris: Add internal buffer calculation for AV1 decoder
>=20
> Dmitry Antipov (1):
>       media: v4l2-core: simplify v4l2_m2m_register_entity()
>=20
> Dmitry Osipenko (1):
>       media: synopsys: hdmirx: Detect broken interrupt
>=20
> Elgin Perumbilly (1):
>       dt-bindings: media: i2c: Add os05b10 sensor
>=20
> Hans Verkuil (20):
>       media: dvb-core: dmxdevfilter must always flush bufs
>       media: dvb-core/dmxdev: drop locks around mmap()
>       media: dvb-core: dvb_vb2: drop wait_prepare/finish callbacks
>       media: vb2: remove vb2_ops_wait_prepare/finish helpers
>       media: vb2: drop wait_prepare/finish callbacks
>       media: omap3isp: configure entity functions
>       media: omap3isp: add V4L2_CAP_IO_MC and don't set bus_info
>       media: omap3isp: isp_video_mbus_to_pix/pix_to_mbus fixes
>       media: omap3isp: implement enum_fmt_vid_cap/out
>       media: omap3isp: use V4L2_COLORSPACE_SRGB instead of _JPEG
>       media: omap3isp: set initial format
>       media: omap3isp: rework isp_video_try/set_format
>       media: omap3isp: implement create/prepare_bufs
>       media: omap3isp: better VIDIOC_G/S_PARM handling
>       media: omap3isp: support ctrl events for isppreview
>       media: omap3isp: ispccp2: always clamp in ccp2_try_format()
>       media: omap3isp: isppreview: always clamp in preview_try_format()
>       media: mc: add manual request completion
>       media: vicodec: add support for manual completion
>       media: mc: add debugfs node to keep track of requests
>=20
> Hans de Goede (23):
>       media: i2c: ov01a10: Fix the horizontal flip control
>       media: i2c: ov01a10: Fix reported pixel-rate value
>       media: i2c: ov01a10: Fix analogue gain range
>       media: i2c: ov01a10: Add missing v4l2_subdev_cleanup() calls
>       media: i2c: ov01a10: Fix passing stream instead of pad to v4l2_subd=
ev_state_get_format()
>       media: i2c: ov01a10: Fix test-pattern disabling
>       media: i2c: ov01a10: Change default vblank value to a vblank result=
ing in 30 fps
>       media: i2c: ov01a10: Convert to new CCI register access helpers
>       media: i2c: ov01a10: Remove overly verbose probe() error reporting
>       media: i2c: ov01a10: Store dev pointer in struct ov01a10
>       media: i2c: ov01a10: Add ov01a10_check_hwcfg() function
>       media: i2c: ov01a10: Add power on/off sequencing support
>       media: i2c: ov01a10: Don't update pixel_rate and link_freq from set=
_fmt
>       media: i2c: ov01a10: Move setting of ctrl->flags to after checking =
ctrl_hdlr->error
>       media: i2c: ov01a10: Use native and default for pixel-array size na=
mes
>       media: i2c: ov01a10: Add cropping support / allow arbitrary sizes
>       media: i2c: ov01a10: Remove struct ov01a10_reg_list
>       media: i2c: ov01a10: Replace exposure->min/step with direct define =
use
>       media: i2c: ov01a10: Only set register 0x0305 once
>       media: i2c: ov01a10: Remove values set by controls from global_sett=
ing[]
>       media: i2c: ov01a10: Add ov01a10_sensor_cfg struct
>       media: i2c: ov01a10: Optimize setting h/vflip values
>       media: i2c: ov01a10: Add ov01a1b support
>=20
> Haoxiang Li (6):
>       media: mtk-mdp: Fix error handling in probe function
>       media: mtk-mdp: Fix a reference leak bug in mtk_mdp_remove()
>       media: cx88: Add missing unmap in snd_cx88_hw_params()
>       media: cx23885: Add missing unmap in snd_cx23885_hw_params()
>       media: cx25821: Add missing unmap in snd_cx25821_hw_params()
>       media: cx25821: Fix a resource leak in cx25821_dev_setup()
>=20
> Himanshu Bhavani (1):
>       media: i2c: add os05b10 image sensor driver
>=20
> Irui Wang (1):
>       media: mediatek: encoder: Fix uninitialized scalar variable issue
>=20
> Jackson Lee (4):
>       media: chips-media: wave5: Fix SError of kernel panic when closed
>       media: chips-media: wave5: Fix Null reference while testing fluster
>       media: chips-media: wave5: Add WARN_ON to check if dec_output_info =
is NULL
>       media: chips-media: wave5: Improve performance of decoder
>=20
> Jammy Huang (1):
>       media: aspeed: Fix dram hang at res-change
>=20
> Johan Hovold (1):
>       media: mediatek: amend vpu_get_plat_device() documentation
>=20
> John Bauer (1):
>       media: uvcvideo: UVC minimum relative pan/tilt/zoom speed fix.
>=20
> Kees Cook (1):
>       media: solo6x10: Check for out of bounds chip_id
>=20
> Laurent Pinchart (1):
>       media: uvcvideo: Replace dev_dbg() with uvc_dbg()
>=20
> Lukas Bulwahn (1):
>       MAINTAINERS: adjust file entry in MEDIATEK MDP DRIVER
>=20
> Marco Crivellari (1):
>       media: platform: mtk-mdp3: add WQ_PERCPU to alloc_workqueue users
>=20
> Marek Vasut (2):
>       media: dt-bindings: nxp,imx8-jpeg: Document optional SRAM support
>       media: imx-jpeg: Add support for descriptor allocation from SRAM
>=20
> Michael Tretter (1):
>       media: dt-bindings: adi,adv7180: add VPP and CSI register maps
>=20
> Ming Qian (6):
>       media: verisilicon: Avoid G2 bus error while decoding H.264 and HEVC
>       media: docs: dev-decoder: Trigger dynamic source change for colorsp=
ace
>       media: amphion: Clear last_buffer_dequeued flag for DEC_CMD_START
>       media: amphion: Trigger source change if colorspace changed
>       media: amphion: Use kmalloc instead of vmalloc
>       media: amphion: Drop min_queued_buffers assignment
>=20
> Nicolas Dufresne (2):
>       media: mediatek: vcodec: Don't try to decode 422/444 VP9
>       media: v4l2-mem2mem: Add a kref to the v4l2_m2m_dev structure
>=20
> Preyas Sharma (2):
>       staging: media: av7110: use usleep_range in av7110_hw.c
>       staging: media: av7110: use usleep_range in sp8870.c
>=20
> Qianfeng Rong (1):
>       media: mediatek: vcodec: use =3D { } instead of memset()
>=20
> Rafael J. Wysocki (1):
>       media: mediatek: vcodec: Discard pm_runtime_put() return value
>=20
> Ricardo Ribalda (4):
>       media: uvcvideo: Fix support for V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX
>       media: uvcvideo: Remove nodrop parameter
>       media: uvcvideo: Document how to format GUIDs
>       Revert "media: uvcvideo: Remove nodrop parameter"
>=20
> Sebastian Fricke (1):
>       media: mediatek: vcodec: Implement manual request completion
>=20
> Shaurya Rane (1):
>       media: radio-keene: fix memory leak in error path
>=20
> Shrikant Raskar (1):
>       media: saa6588: Remove dprintk macro and use v4l2_info()
>=20
> Sun Jian (2):
>       staging: media: tegra-video: move tegra210_csi_soc declaration to c=
si.h
>       staging: media: tegra-video: move tegra20_vip_soc declaration to vi=
p.h
>=20
> Szymon Wilczek (1):
>       media: pvrusb2: fix URB leak in pvr2_send_request_ex
>=20
> Thorsten Schmelzer (3):
>       media: adv7180: add support for ancillary devices
>       media: adv7180: implement g_register and s_register
>       media: adv7180: fix frame interval in progressive mode
>=20
> Vladimir Zapolskiy (4):
>       dt-bindings: media: i2c: Add Samsung S5KJN1 image sensor
>       media: i2c: add Samsung S5KJN1 image sensor device driver
>       dt-bindings: media: i2c: Add Samsung S5K3M5 image sensor
>       media: i2c: Add Samsung S5K3M5 13MP camera sensor driver
>=20
> Xulin Sun (3):
>       media: chips-media: wave5: Fix PM runtime usage count underflow
>       media: chips-media: wave5: Fix kthread worker destruction in pollin=
g mode
>       media: chips-media: wave5: Fix device cleanup order to prevent kern=
el panic
>=20
> Zilin Guan (2):
>       media: chips-media: wave5: Fix memory leak on codec_info allocation=
 failure
>       media: tegra-video: Fix memory leak in __tegra_channel_try_format()
>=20
>  .../devicetree/bindings/media/i2c/adi,adv7180.yaml |   97 +-
>  .../bindings/media/i2c/ovti,os05b10.yaml           |  103 ++
>  .../bindings/media/i2c/samsung,s5k3m5.yaml         |  103 ++
>  .../bindings/media/i2c/samsung,s5kjn1.yaml         |  103 ++
>  .../devicetree/bindings/media/nxp,imx8-jpeg.yaml   |    6 +
>  Documentation/driver-api/media/v4l2-dev.rst        |    8 +-
>  Documentation/userspace-api/media/conf_nitpick.py  |    2 -
>  .../userspace-api/media/v4l/dev-decoder.rst        |    5 +-
>  .../userspace-api/media/v4l/pixfmt-compressed.rst  |    8 +
>  MAINTAINERS                                        |   26 +-
>  drivers/media/common/videobuf2/videobuf2-core.c    |   49 +-
>  drivers/media/common/videobuf2/videobuf2-v4l2.c    |   14 -
>  drivers/media/dvb-core/dmxdev.c                    |   46 +-
>  drivers/media/dvb-core/dvb_vb2.c                   |   45 +-
>  drivers/media/i2c/Kconfig                          |   31 +
>  drivers/media/i2c/Makefile                         |    3 +
>  drivers/media/i2c/adv7180.c                        |   55 +-
>  drivers/media/i2c/os05b10.c                        | 1135 +++++++++++++++
>  drivers/media/i2c/ov01a10.c                        |  918 +++++++-----
>  drivers/media/i2c/s5k3m5.c                         | 1377 ++++++++++++++=
++++
>  drivers/media/i2c/s5kjn1.c                         | 1487 ++++++++++++++=
++++++
>  drivers/media/i2c/saa6588.c                        |   27 +-
>  drivers/media/i2c/tw9903.c                         |    1 +
>  drivers/media/i2c/tw9906.c                         |    1 +
>  drivers/media/mc/mc-device.c                       |   30 +
>  drivers/media/mc/mc-devnode.c                      |    5 +
>  drivers/media/mc/mc-request.c                      |   47 +-
>  drivers/media/pci/cx23885/cx23885-alsa.c           |    4 +-
>  drivers/media/pci/cx25821/cx25821-alsa.c           |    1 +
>  drivers/media/pci/cx25821/cx25821-core.c           |    1 +
>  drivers/media/pci/cx88/cx88-alsa.c                 |    4 +-
>  drivers/media/pci/solo6x10/solo6x10-tw28.c         |    8 +-
>  drivers/media/platform/amphion/vdec.c              |   78 +-
>  drivers/media/platform/amphion/venc.c              |   20 +-
>  drivers/media/platform/amphion/vpu_cmds.c          |   15 +-
>  drivers/media/platform/amphion/vpu_core.c          |   11 +-
>  drivers/media/platform/amphion/vpu_v4l2.c          |    3 -
>  drivers/media/platform/aspeed/aspeed-video.c       |   22 +-
>  .../platform/chips-media/wave5/wave5-helper.c      |   28 +-
>  .../platform/chips-media/wave5/wave5-helper.h      |    1 +
>  .../media/platform/chips-media/wave5/wave5-hw.c    |    2 +-
>  .../platform/chips-media/wave5/wave5-vpu-dec.c     |  194 ++-
>  .../platform/chips-media/wave5/wave5-vpu-enc.c     |   17 +-
>  .../media/platform/chips-media/wave5/wave5-vpu.c   |  121 +-
>  .../media/platform/chips-media/wave5/wave5-vpu.h   |    2 +-
>  .../platform/chips-media/wave5/wave5-vpuapi.c      |   68 +-
>  .../platform/chips-media/wave5/wave5-vpuapi.h      |   12 +
>  .../platform/chips-media/wave5/wave5-vpuconfig.h   |    1 +
>  drivers/media/platform/mediatek/mdp/mtk_mdp_core.c |   17 +-
>  .../media/platform/mediatek/mdp3/mtk-mdp3-core.c   |    6 +-
>  .../mediatek/vcodec/decoder/mtk_vcodec_dec.c       |    4 +-
>  .../mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h   |   17 +
>  .../mediatek/vcodec/decoder/mtk_vcodec_dec_pm.c    |    6 +-
>  .../vcodec/decoder/mtk_vcodec_dec_stateless.c      |  115 +-
>  .../mediatek/vcodec/decoder/vdec/vdec_vp9_if.c     |    3 +-
>  .../platform/mediatek/vcodec/decoder/vdec_vpu_if.c |   12 +-
>  .../mediatek/vcodec/encoder/mtk_vcodec_enc.c       |   12 +-
>  .../mediatek/vcodec/encoder/mtk_vcodec_enc_pm.c    |    6 +-
>  .../platform/mediatek/vcodec/encoder/venc_vpu_if.c |   15 +-
>  drivers/media/platform/mediatek/vpu/mtk_vpu.h      |    3 +-
>  drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c     |   70 +-
>  drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h     |    1 +
>  drivers/media/platform/qcom/iris/iris_buffer.h     |    2 +
>  drivers/media/platform/qcom/iris/iris_ctrls.c      |    8 +
>  drivers/media/platform/qcom/iris/iris_hfi_common.h |    3 +
>  .../platform/qcom/iris/iris_hfi_gen2_command.c     |   85 +-
>  .../platform/qcom/iris/iris_hfi_gen2_defines.h     |    9 +
>  .../platform/qcom/iris/iris_hfi_gen2_response.c    |   22 +
>  drivers/media/platform/qcom/iris/iris_instance.h   |    1 +
>  .../platform/qcom/iris/iris_platform_common.h      |   13 +
>  .../media/platform/qcom/iris/iris_platform_gen1.c  |   22 +-
>  .../media/platform/qcom/iris/iris_platform_gen2.c  |  159 +++
>  drivers/media/platform/qcom/iris/iris_vdec.c       |   23 +-
>  drivers/media/platform/qcom/iris/iris_vidc.c       |    1 +
>  drivers/media/platform/qcom/iris/iris_vpu_buffer.c |  299 +++-
>  drivers/media/platform/qcom/iris/iris_vpu_buffer.h |  116 ++
>  drivers/media/platform/rockchip/rga/rga-buf.c      |    3 +
>  .../media/platform/synopsys/hdmirx/snps_hdmirx.c   |   90 +-
>  .../media/platform/synopsys/hdmirx/snps_hdmirx.h   |    2 +
>  drivers/media/platform/ti/omap3isp/ispccdc.c       |    1 +
>  drivers/media/platform/ti/omap3isp/ispccp2.c       |    3 +-
>  drivers/media/platform/ti/omap3isp/ispcsi2.c       |    1 +
>  drivers/media/platform/ti/omap3isp/isppreview.c    |   26 +-
>  drivers/media/platform/ti/omap3isp/ispresizer.c    |    3 +-
>  drivers/media/platform/ti/omap3isp/ispstat.c       |    1 +
>  drivers/media/platform/ti/omap3isp/ispvideo.c      |  178 ++-
>  drivers/media/platform/verisilicon/hantro.h        |    2 +
>  drivers/media/platform/verisilicon/hantro_drv.c    |   42 +-
>  drivers/media/platform/verisilicon/imx8m_vpu_hw.c  |    8 +
>  .../verisilicon/rockchip_vpu981_hw_av1_dec.c       |   39 +-
>  drivers/media/radio/radio-keene.c                  |    2 +-
>  drivers/media/test-drivers/vicodec/vicodec-core.c  |   21 +-
>  drivers/media/usb/pvrusb2/pvrusb2-hdw.c            |    5 +
>  drivers/media/usb/uvc/uvc_ctrl.c                   |   79 +-
>  drivers/media/usb/uvc/uvc_queue.c                  |    2 +-
>  drivers/media/usb/uvc/uvc_v4l2.c                   |   10 +-
>  drivers/media/usb/uvc/uvcvideo.h                   |    2 +-
>  drivers/media/v4l2-core/v4l2-ioctl.c               |    1 +
>  drivers/media/v4l2-core/v4l2-mem2mem.c             |   33 +-
>  drivers/staging/media/av7110/av7110_hw.c           |   20 +-
>  drivers/staging/media/av7110/sp8870.c              |    2 +-
>  drivers/staging/media/tegra-video/csi.c            |    4 -
>  drivers/staging/media/tegra-video/csi.h            |    4 +
>  drivers/staging/media/tegra-video/vi.c             |   13 +-
>  drivers/staging/media/tegra-video/vip.c            |    4 -
>  drivers/staging/media/tegra-video/vip.h            |    4 +
>  include/linux/usb/uvc.h                            |    8 +
>  include/media/dvb_vb2.h                            |   17 +-
>  include/media/media-device.h                       |    9 +
>  include/media/media-devnode.h                      |    4 +
>  include/media/media-request.h                      |   40 +-
>  include/media/v4l2-mem2mem.h                       |   21 +
>  include/media/videobuf2-core.h                     |   23 +-
>  include/media/videobuf2-v4l2.h                     |   18 -
>  include/uapi/linux/videodev2.h                     |    1 +
>  115 files changed, 7151 insertions(+), 990 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,os05=
b10.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/samsung,s=
5k3m5.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/samsung,s=
5kjn1.yaml
>  create mode 100644 drivers/media/i2c/os05b10.c
>  create mode 100644 drivers/media/i2c/s5k3m5.c
>  create mode 100644 drivers/media/i2c/s5kjn1.c



Thanks,
Mauro

