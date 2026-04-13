Return-Path: <linux-media+bounces-58635-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AEQSCbyi3GkEUgkAu9opvQ
	(envelope-from <linux-media+bounces-58635-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 10:01:00 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3E43E8A72
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 10:00:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D6E7D304B296
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 07:53:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E9DA39DBEB;
	Mon, 13 Apr 2026 07:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sdv2mIJl"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F21260566;
	Mon, 13 Apr 2026 07:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776066818; cv=none; b=WMQGMQEj2efLpcBXAoMh+pl0kOdD//h5X//eKTmvSwrBv0xZltQXSmzpqai3fdV4Nky3ij1fEwCQikuDiuu+/sVjfoEfhMf73EiPyj4/zPLDok+iU8sKfphGY+IS26vQQGgqebKXZYRDzks3XizWmWFOwKNc8us9pgW/r3x1FtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776066818; c=relaxed/simple;
	bh=Lmp7sawhnzcbNZz9QdCH9AhIXFJvYSPcD3rfNVP29s4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=roZOoSCj8tHJ9RfHx3TW5/zNBOcxpFu1ASQ60xlSrMS+blLdaQAulG0rCHrZcVVqrpqXVUzrVrkpyyJJ0HV8LnE14ijJkll8NcppEnjdkRv0uMxp9Fs9gdiC4fftyIqRbzSyn8wswY3RWe5k7V4lTTIWdHJr7G+17lU/5jeRkmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sdv2mIJl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11688C116C6;
	Mon, 13 Apr 2026 07:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776066818;
	bh=Lmp7sawhnzcbNZz9QdCH9AhIXFJvYSPcD3rfNVP29s4=;
	h=Date:From:To:Cc:Subject:From;
	b=Sdv2mIJlyYQDoFMnffDA8G0rzbfA5R87FBkzppukVV0sMuFR110WNG6y+CEW87YJ2
	 0j47CKYHwVdPiuZPHjJmzvd6zEeof1UnG3iDSmFEEykGfVpkGzujJWZAyLhAicufMo
	 aNZ7acrH4QiGrE3NgwWxjLVYj7Lwc2zFfM3AX7AyNC/eER2InBu5bN0Xwojg0jEF4j
	 VxFpx9oG2VLPfP1/0DI2JskazbDfC0gs3uFGn3woV0yVm/AjATI531x/8UII1Tb5Ha
	 t+hGR+eFYFBjsENPabTzRqa/Tt/BQd9XxaLb0wEQ4EjAMuSdavZz6cSFSCaO8l1Q7z
	 N3mAfLcJveVPw==
Date: Mon, 13 Apr 2026 09:53:33 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton
 <akpm@linux-foundation.org>, Linux Media Mailing List
 <linux-media@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>
Subject: [GIT PULL for v7.1] media updates
Message-ID: <20260413095333.78a940f7@foz.lan>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58635-lists,linux-media=lfdr.de,huawei];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,foz.lan:mid]
X-Rspamd-Queue-Id: 5D3E43E8A72
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Linus,

Please pull from:

	git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git medi=
a/v7.1-1

For:

- new CSI tegra support, covering Tegra20 and Tegra30;
- new camera sensor drivers: T4ka3 and ov2732;
- m88ds3103: add 3103c chip support;
- uvcvideo: add support for Intel RealSense D436/D555 and P010 pixel format;
- synopsys csi2rx: add i.MX93 support;
- imx8-isi: add i.MX95 support;
- imx8mq-mipi-csi2: add i.MX8ULP support;
- dw100: add V4L2 requests support;
- support for DTV devices from Hauppauge got some improvements;
- media staging: dropped starfive-camss driver;
- media docs: document multi-committers model and improve maint profile;
- media core: add v4l2_subdev_get_frame_desc_passthrough() helper;
- media core: improve error handling in fwnode parsing;
- lots of driver fixes, cleanups and improvements.
   =20
Regards,
Mauro

---

The following changes since commit 11439c4635edd669ae435eec308f4ab8a0804808:

  Linux 7.0-rc2 (2026-03-01 15:39:31 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git tag=
s/media/v7.1-1

for you to fetch changes up to 4fbeef21f5387234111b5d52924e77757626faa5:

  Revert "media: cx231xx: add USB ID 2040:8360 for Hauppauge WinTV-HVR-935"=
 (2026-03-26 22:27:24 +0100)

----------------------------------------------------------------
[GIT PULL for v7.1] media updates

----------------------------------------------------------------
Abd-Alrhman Masalkhi (1):
      media: vidtv: fix pass-by-value structs causing MSAN warnings

Abdun Nihaal (1):
      media: pci: zoran: fix potential memory leak in zoran_probe()

Abhishek Kumar (1):
      media: em28xx: fix use-after-free in em28xx_v4l2_open()

Alain Volmat (11):
      media: stm32: dcmi: Switch from __maybe_unused to pm_ptr()
      media: stm32: dcmi: perform dmaengine_slave_config at probe
      media: stm32: dcmi: only create dma descriptor once at buf_prepare
      media: stm32: dcmi: stop the dma transfer on overrun
      media: stm32: dcmi: rework spin_lock calls
      media: stm32: dcmi: perform all dma handling within irq_thread
      media: stm32: dcmi: use dmaengine_terminate_async in irq context
      media: stm32: dcmi: continuous mode capture in JPEG
      dt-bindings: media: st: dcmi: add DMA-MDMA chaining properties
      media: stm32: dcmi: addition of DMA-MDMA chaining support
      dt-bindings: media: st,stm32-dcmi: add 'power-domains' property

Alexander Koskovich (3):
      media: i2c: ov8856: free control handler on error in ov8856_init_cont=
rols()
      media: dt-bindings: ovti,ov8856: Allow orientation & rotation props
      media: i2c: ov8856: parse and register V4L2 device tree properties

Alexander Shiyan (1):
      media: ccs-pll: Fix pre-PLL divider calculation for EXT_IP_PLL_DIVIDE=
R flag

Andriy Utkin (1):
      MAINTAINERS: drop myself from solo6x10, tw5864

Andy Shevchenko (1):
      media: vidtv: Rename PI definition to PI_SAMPLES

Antti Laakso (4):
      media: i2c: ov5675: Wait for endpoint
      platform: int3472: Add gpio software node
      gpio: tps68470: Add i2c daisy chain support
      platform: int3472: Add MSI prestige board data

Arnd Bergmann (1):
      media: mxl5005s: reduce stack usage in MXL5005_ControlInit

Artem Lytkin (1):
      staging: media: av7110: replace BUG() with error return in gpioirq

Atharv Dubey (1):
      media: cx25821-alsa: replace BUG_ON() with WARN_ON()

Ayush Kumar (1):
      media: staging: imx: Remove unnecessary braces from if statement

Barnab=C3=A1s P=C5=91cze (4):
      media: rzv2h-ivc: Fix AXIRX_VBLANK register write
      media: rzv2h-ivc: Write AXIRX_PIXFMT once
      media: rzv2h-ivc: Fix FM_STOP register write
      media: rzv2h-ivc: Fix concurrent buffer list access

Bartosz Golaszewski (1):
      media: saa7134: rename i2c_dbg() to saa7134_i2c_dbg()

Bradford Love (20):
      media: si2157: Analog format fixes
      media: cx25840: Fix NTSC-J, PAL-N, and SECAM standards
      media: xc5000: Add rf strength function
      media: cx231xx: Fix AGC levels for NTSC-M
      media: si2168: Fix i2c command timeout on embedded platforms
      media: si2168: fw 4.0-11 loses warm state during sleep
      media: saa7164: Fix REV2 firmware filename
      media: au0828: Add new Hauppauge HVR1265 and ImpactVCB-e
      media: em28xx: Add a variety of DualHD usb id
      media: em28xx: remove tuner type from Hauppauge DVB DualHD
      media: em28xx: Add support for Empia em2828X bridge
      media: em28xx: Add Hauppauge USB Live2
      media: au0828: Fix green screen in analog
      media: em28xx: driver supports two frontends, but not i2c clients
      media: si2157: Include support for si2177 chip
      media: em28xx: Add Hauppauge em2828X based 9x5 revisions
      media: m88ds3103: Implement 3103c chip support
      media: em28xx: Add Hauppauge 461e v3
      media: cx23885: Module option to disable analog video
      Revert "media: cx231xx: add USB ID 2040:8360 for Hauppauge WinTV-HVR-=
935"

Chen Ni (5):
      media: i2c: imx219: Check return value of devm_gpiod_get_optional() i=
n imx219_probe()
      media: i2c: mt9p031: Check return value of devm_gpiod_get_optional() =
in mt9p031_probe()
      media: i2c: vgxy61: Check return value of devm_gpiod_get_optional() i=
n vgxy61_probe()
      media: i2c: ar0521: Check return value of devm_gpiod_get_optional() i=
n ar0521_probe()
      media: v4l2-subdev: Fix error check in v4l2_subdev_get_frame_desc_pas=
sthrough()

Cristian Ciocaltea (2):
      media: dt-bindings: rockchip,vdec: Mark reg-names required for RK35{7=
6,88}
      media: dt-bindings: rockchip,vdec: Add alternative reg-names order fo=
r RK35{76,88}

Dan Carpenter (1):
      media: rockchip: rkcif: fix off by one bugs

Dang Huynh (1):
      media: rockchip: rkcif: Add missing MUST_CONNECT flag to pads

Daniel Scally (2):
      media: mali-c55: Fix Iridix bypass macros
      media: rzv2h-ivc: Revise default VBLANK formula

Dmitry Torokhov (1):
      media: i2c: max9286: normalize return value of gpio_get

Eric Biggers (1):
      media: vidtv: Use crc32_be() instead of open coding

Ethan Nelson-Moore (1):
      media: remove unnecessary module_init/exit functions

Ethan Tidmore (1):
      media: intel/ipu6: fix error pointer dereference

Faizel K B (3):
      media: vimc: sensor: Move vimc_sensor_device to common header
      media: vimc: sensor: Add pixel_rate,vblank and hblank configuration
      media: vimc: streamer: Apply sensor frame rate in streamer thread

Fan Wu (2):
      media: mtk-jpeg: fix use-after-free in release path due to uncancelle=
d work
      media: mediatek: vcodec: fix use-after-free in encoder release path

Felix Gu (1):
      media: ti: vpe: Add missing v4l2_device_unregister in vip_remove()

Frank Li (7):
      media: nxp: Add dev_err_probe() to all error paths in *async_register=
() helpers
      media: synopsys: csi2rx: use devm_reset_control_get_optional_exclusiv=
e()
      media: synopsys: csi2rx: only check errors from devm_clk_bulk_get_all=
()
      media: synopsys: csi2rx: implement .get_frame_desc() callback
      media: synopsys: csi2rx: Use enum and u32 array for register offsets
      media: dt-bindings: add NXP i.MX93 compatible string
      media: synopsys: csi2rx: add i.MX93 support

Gaston Gonzalez (2):
      media: bcm2835-unicam: remove obsolete comment
      media: bcm2835-unicam: remove reference to dropped driver in Kconfig

Geert Uytterhoeven (1):
      media: synopsys: VIDEO_DW_MIPI_CSI2RX should depend on ARCH_ROCKCHIP

Guoniu Zhou (8):
      media: nxp: imx8-isi: Reduce minimum queued buffers from 2 to 0
      media: dt-bindings: nxp,imx8-isi: Add i.MX95 ISI compatible string
      media: nxp: imx8-isi: Keep the default value for BLANK_PXL field
      media: nxp: imx8-isi: Add ISI support for i.MX95
      media: dt-bindings: nxp,imx8mq-mipi-csi2: Add i.MX8ULP compatible str=
ing
      media: imx8mq-mipi-csi2: Use devm_clk_bulk_get_all() to fetch clocks
      media: imx8mq-mipi-csi2: Explicitly release reset
      media: imx8mq-mipi-csi2: Add support for i.MX8ULP

Hans Verkuil (3):
      docs: media: document Media Maintainers
      .mailmap: Add back old email alias
      media: cx231xx: add USB ID 2040:8360 for Hauppauge WinTV-HVR-935

Hans de Goede (1):
      media: ipu-bridge: Add upside-down sensor DMI quirk for Dell XPS 13 9=
340 and XPS 14 9440

Haoxiang Li (2):
      media: omap3isp: drop the use count of v4l2 pipeline
      media: chips-media: wave5: fix a potential memory leak in wave5_vdi_i=
nit()

Jacopo Mondi (7):
      media: mali-c55: Fix wrong comment of ISP block types
      media: mali-c55: Initialize the ISP in enable_streams()
      media: mali-c55: Fully reset the ISP configuration
      media: mali-c55: Bypass the Iridix Tonemap engine
      media: mali-c55: Bypass Purple Fringe Correction
      media: rzv2h-ivc: Avoid double job scheduling
      media: rzv2h-ivc: Replace workqueue with direct function call

Jai Luthra (4):
      media: staging: Drop starfive-camss from staging
      media: dt-bindings: Drop starfive,jh7110-camss from staging
      media: i2c: imx283: Enter full standby when stopping streaming
      media: i2c: imx283: Fix hang when going from large to small resolution

Janne Grunau (1):
      media: videobuf2: Set vma_flags in vb2_dma_sg_mmap

Jeongjun Park (2):
      media: hackrf: fix to not free memory after the device is registered =
in hackrf_probe()
      media: as102: fix to not free memory after the device is registered i=
n as102_usb_probe()

Johan Hovold (5):
      media: go7007-loader: drop redundant device reference
      media: usbtv: drop redundant device reference
      media: cx231xx: drop redundant device reference
      media: imon: drop redundant device references
      media: mceusb: drop redundant device reference

Kate Hsuan (1):
      media: Add t4ka3 camera sensor driver

Krzysztof Kozlowski (2):
      media: samsung: exynos4-is: Simplify with scoped for each OF child lo=
op
      media: samsung: exynos4-is: Simplify with scoped for each OF child lo=
op

Laurent Pinchart (13):
      media: renesas: vsp1: Store supported media bus codes in vsp1_entity
      media: renesas: vsp1: Store size limits in vsp1_entity
      media: renesas: vsp1: Fix code checks in frame size enumeration
      media: renesas: vsp1: rpf: Fix crop left and top clamping
      media: renesas: vsp1: rpf: Fix crop width and height clamping
      media: renesas: vsp1: rwpf: Fix media bus code and frame size enumera=
tion
      media: renesas: vsp1: brx: Fix format propagation
      media: renesas: vsp1: hsit: Fix size enumeration
      media: renesas: vsp1: histo: Fix code enumeration
      media: renesas: vsp1: histo: Fix size enumeration
      media: renesas: vsp1: histo: Fix format setting
      media: renesas: vsp1: Implement control events
      media: renesas: vsp1: Initialize format on all pads

Leif Skunberg (1):
      media: ipu-bridge: Add OV5675 sensor config

LiPeng Huang (1):
      media: lirc: increase IR_MAX_DURATION to send extended code sequences

Mark Brown (1):
      media: synopsys: hdmirx: support use with sleeping GPIOs

Martin Hecht (2):
      dt-bindings: media: i2c: alliedvision,alvium-csi2
      media: i2c: alvium-csi2

Martin T=C5=AFma (3):
      media:pci:mgb4: Fixed negative hwmon temperatures processing
      media:pci:mgb4: Add zDML color mapping support
      media:admin-guide:mgb4: Add zDML color mapping info

Matthias Fend (10):
      media: i2c: ov08d10: fix runtime PM handling in probe
      media: i2c: ov08d10: fix image vertical start setting
      media: i2c: ov08d10: remove duplicate register write
      media: i2c: ov08d10: fix some typos in comments
      media: i2c: ov08d10: add missing newline to prints
      dt-bindings: media: i2c: document Omnivision OV08D10 CMOS image sensor
      media: i2c: ov08d10: add support for binding via device tree
      media: i2c: ov08d10: add support for reset and power management
      media: i2c: ov08d10: add support for 24 MHz input clock
      media: i2c: imx283: add support for non-continuous MIPI clock mode

Mauro Carvalho Chehab (5):
      docs: maintainer-pgp-guide.rst: add a reference for kernel.org sign
      MAINTAINERS: fix a couple issues at media input infrastructure
      docs: media: update maintainer-entry-profile for multi-committers
      docs: media: document media multi-committers rules and process
      Merge tag 'v7.0-rc2' into __tmp-hverkuil-media-tags_br_v7_1a

Maxime Ripard (2):
      media: uapi: Clarify MBUS color component order for serial buses
      media: bcm2835-unicam: Fix RGB format / mbus code association

Michael Riesch (1):
      media: rockchip: rkcif: comply with minimum number of buffers require=
ment

Michael Tretter (2):
      media: staging: imx: request mbus_config in csi_start
      media: staging: imx: configure src_mux in csi_start

Ming Qian (5):
      media: imx-jpeg: Simplify descriptor initialization with memset
      media: imx-jpeg: Use devm_pm_runtime_enable() helper
      media: imx-jpeg: Add encoder ops layer for hardware abstraction
      media: imx-jpeg: Add support for encoder v1 descriptor configuration
      media: amphion: Fix race between m2m job_abort and device_run

Nauman Sabir (1):
      media: docs: Fix typo 'hardwares' to 'hardware'

Oliver Collyer (1):
      media: uvcvideo: Add support for P010 pixel format

Oliver Neukum (4):
      media: rc: streamzap: Error handling in probe
      media: rc: xbox_remote: heed DMA restrictions
      media: rc: igorplugusb: heed coherency rules
      media: rc: ttusbir: respect DMA coherency rules

Omer El Idrissi (1):
      staging: media: ipu3: fix function argument alignment

Ricardo Ribalda (4):
      media: uvcvideo: Enable VB2_DMABUF for metadata stream
      media: uvcvideo: uvc_queue_to_stream(): Support meta queues
      media: uvcvideo: Allow userspace to increase the meta buffersize
      media: uvcvideo: Add a stream backpointer in uvc_video_queue

Richard Acayan (4):
      dt-bindings: media: qcom,sdm670-camss: Remove clock-lanes requirement
      dt-bindings: media: i2c: Add Sony IMX355
      media: i2c: imx355: Support devicetree and power management
      media: i2c: imx355: Restrict data lanes to 4

Ruslan Valiyev (2):
      media: vidtv: fix nfeeds state corruption on start_streaming failure
      media: vidtv: fix NULL pointer dereference in vidtv_channel_pmt_match=
_sections

Sakari Ailus (5):
      staging: media: atomisp: Disallow all private IOCTLs
      media: v4l2-fwnode: Return -EPROBE_DEFER on parsing NULL endpoints
      media: ov02a10, dw9768: Remove Dongchung's e-mail
      platform: int3472: Drop redundant initialisation to 0 and NULL
      staging: media: ipu7: Update TODO

Sean Young (1):
      media: rc: fix race between unregister and urb/irq callbacks

Sergey Shtylyov (1):
      media: dib8000: avoid division by 0 in dib8000_set_dds()

Stefan Klug (4):
      media: dw100: Implement V4L2 requests support
      media: dw100: Implement dynamic vertex map update
      media: dw100: Fix kernel oops with PREEMPT_RT enabled
      media: dw100: Merge dw100_device_run and dw100_start

Svyatoslav Ryhel (17):
      dt-bindings: media: mt9m114: document MI1040 sensor
      media: i2c: mt9m114: add support for Aptina MI1040
      staging: media: tegra-video: expand VI and VIP support to Tegra30
      staging: media: tegra-video: vi: adjust get_selection operation check
      staging: media: tegra-video: vi: add flip controls only if no source =
controls are provided
      staging: media: tegra-video: csi: move CSI helpers to header
      gpu: host1x: convert MIPI to use operation function pointers
      staging: media: tegra-video: vi: improve logic of source requesting
      staging: media: tegra-video: csi: move avdd-dsi-csi-supply from VI to=
 CSI
      staging: media: tegra-video: tegra20: set correct maximum width and h=
eight
      staging: media: tegra-video: tegra20: add support for second output o=
f VI
      staging: media: tegra-video: tegra20: adjust format align calculations
      staging: media: tegra-video: tegra20: set VI HW revision
      staging: media: tegra-video: tegra20: increase maximum VI clock frequ=
ency
      staging: media: tegra-video: tegra20: expand format support with RAW8=
/10 and YUV422/YUV420p 1X16
      staging: media: tegra-video: tegra20: adjust luma buffer stride
      staging: media: tegra-video: add CSI support for Tegra20 and Tegra30

Tarang Raval (1):
      media: rkisp1: Fix enum_framesizes accepting invalid pixel formats

Tomi Valkeinen (13):
      media: rcar-isp: Improve ISPPROCMODE_DT_PROC_MODE_VC
      media: rcar-csi2: Improve FLD_FLD_EN macros
      media: rcar-csi2: Move rcsi2_calc_mbps()
      media: rcar-csi2: Simplify rcsi2_calc_mbps()
      media: rcar-csi2: Optimize rcsi2_calc_mbps()
      media: subdev: Add v4l2_subdev_get_frame_desc_passthrough helper
      media: i2c: ds90ub953: Use v4l2_subdev_get_frame_desc_passthrough
      media: i2c: ds90ub913: Use v4l2_subdev_get_frame_desc_passthrough
      media: renesas: vsp1: Fix NULL pointer deref on module unload
      media: renesas: vin: Fix RAW8 (again)
      media: subdev: Improve v4l2_subdev_get_frame_desc_passthrough() kdoc
      media: subdev: Minor v4l2_subdev_get_frame_desc_passthrough() cleanups
      media: subdev: Split v4l2_subdev_get_frame_desc_passthrough() into lo=
cked and unlocked

Vicki Pfau (1):
      media: pulse8-cec: Handle partial deinit

Vladimir Zapolskiy (6):
      media: i2c: og01a1b: Fix V4L2 subdevice data initialization on probe
      media: i2c: og01a1b: Switch from .s_stream to .enable_streams/.disabl=
e_streams
      media: i2c: og01a1b: Change I2C interface controls to V4L2 CCI
      media: i2c: og01a1b: Replace .open with .init_state internal ops
      media: i2c: og01a1b: Use generic v4l2_subdev_get_fmt() to get format
      media: i2c: og01a1b: Add support of 8-bit media bus format

Walter Werner Schneider (2):
      dt-bindings: media: i2c: Add ov2732 image sensor
      media: i2c: Add ov2732 image sensor driver

Wang Jun (1):
      media: saa7164: add ioremap return checks and cleanups

Wenmeng Liu (2):
      media: i2c: imx412: Assert reset GPIO during probe
      media: i2c: imx412: Extend the power-on waiting time

Xiaolei Wang (4):
      media: i2c: ov9282: Convert to CCI register access helpers
      media: i2c: ov9282: Switch to using the sub-device state lock
      media: i2c: ov9282: switch to {enable,disable}_streams
      media: i2c: ov5647: Fix runtime PM refcount leak in s_ctrl

Yemike Abhilash Chandra (4):
      media: dt-bindings: ti,ds90ub960: Refactor port definitions
      media: i2c: ds90ub960: Use enums for chip type and chip family
      media: dt-bindings: ti,ds90ub960: Add support for DS90UB954-Q1
      media: i2c: ds90ub960: Add support for DS90UB954-Q1

Yogev Modlin (2):
      media: uvcvideo: Change comment to 'Intel RealSense'
      media: uvcvideo: Add D436 and D555 cameras metadata support

Zhaoyang Yu (1):
      media: fimc: check return value of clk_enable in runtime_resume

Ziyi Guo (3):
      media: i2c: imx258: add missing mutex protection for format code acce=
ss
      media: chips-media: wave5: add missing spinlock protection for send_e=
os_event()
      media: chips-media: wave5: add missing spinlock protection for handle=
_dynamic_resolution_change()

vivek yadav (1):
      media: staging: imx: fix code style issues

 .mailmap                                           |    1 +
 Documentation/admin-guide/media/mgb4.rst           |    8 +
 Documentation/admin-guide/media/starfive_camss.rst |   72 --
 .../admin-guide/media/starfive_camss_graph.dot     |   12 -
 Documentation/admin-guide/media/v4l-drivers.rst    |    1 -
 .../media/i2c/alliedvision,alvium-csi2.yaml        |    2 +-
 .../bindings/media/i2c/onnn,mt9m114.yaml           |    4 +-
 .../bindings/media/i2c/ovti,ov08d10.yaml           |  101 ++
 .../devicetree/bindings/media/i2c/ovti,ov2732.yaml |  103 ++
 .../devicetree/bindings/media/i2c/ovti,ov8856.yaml |    6 +
 .../devicetree/bindings/media/i2c/sony,imx355.yaml |  111 ++
 .../bindings/media/i2c/ti,ds90ub960.yaml           |  213 ++--
 .../devicetree/bindings/media/nxp,imx8-isi.yaml    |   27 +-
 .../bindings/media/nxp,imx8mq-mipi-csi2.yaml       |   49 +-
 .../bindings/media/qcom,sdm670-camss.yaml          |    3 -
 .../bindings/media/rockchip,rk3568-mipi-csi2.yaml  |   47 +-
 .../devicetree/bindings/media/rockchip,vdec.yaml   |   22 +-
 .../devicetree/bindings/media/st,stm32-dcmi.yaml   |   14 +-
 .../bindings/media/starfive,jh7110-camss.yaml      |  180 ----
 Documentation/driver-api/media/index.rst           |    1 +
 .../driver-api/media/maintainer-entry-profile.rst  |  463 +++++++--
 .../driver-api/media/media-committers.rst          |  203 ++++
 Documentation/process/maintainer-pgp-guide.rst     |    2 +
 .../userspace-api/media/dvb/legacy_dvb_audio.rst   |    2 +-
 .../userspace-api/media/v4l/subdev-formats.rst     |   20 +-
 MAINTAINERS                                        |   30 +-
 drivers/gpio/gpio-tps68470.c                       |   21 +-
 drivers/gpu/drm/bridge/sil-sii8620.c               |    1 +
 drivers/gpu/drm/tegra/dsi.c                        |    1 +
 drivers/gpu/host1x/Makefile                        |    1 +
 drivers/gpu/host1x/mipi.c                          |  592 +++--------
 drivers/gpu/host1x/tegra114-mipi.c                 |  483 +++++++++
 drivers/hid/hid-picolcd_cir.c                      |    1 +
 drivers/media/cec/core/cec-core.c                  |    2 +-
 drivers/media/cec/usb/pulse8/pulse8-cec.c          |    7 +
 drivers/media/common/b2c2/flexcop.c                |   14 -
 drivers/media/common/saa7146/saa7146_fops.c        |   13 -
 drivers/media/common/siano/smsir.c                 |    1 +
 drivers/media/common/uvc.c                         |    4 +
 drivers/media/common/videobuf2/videobuf2-dma-sg.c  |    1 +
 drivers/media/dvb-frontends/au8522_decoder.c       |    1 +
 drivers/media/dvb-frontends/dib8000.c              |    4 +-
 drivers/media/dvb-frontends/m88ds3103.c            |  426 ++++++--
 drivers/media/dvb-frontends/m88ds3103_priv.h       |   46 +-
 drivers/media/dvb-frontends/si2168.c               |    8 +-
 drivers/media/i2c/Kconfig                          |   31 +-
 drivers/media/i2c/Makefile                         |    2 +
 drivers/media/i2c/alvium-csi2.c                    |    2 +-
 drivers/media/i2c/ar0521.c                         |    3 +
 drivers/media/i2c/ccs-pll.c                        |    5 +-
 drivers/media/i2c/cx25840/cx25840-core.c           |   29 +-
 drivers/media/i2c/ds90ub913.c                      |   59 +-
 drivers/media/i2c/ds90ub953.c                      |   61 +-
 drivers/media/i2c/ds90ub960.c                      |  216 ++--
 drivers/media/i2c/dw9768.c                         |    2 +-
 drivers/media/i2c/imx219.c                         |    3 +
 drivers/media/i2c/imx258.c                         |   14 +-
 drivers/media/i2c/imx283.c                         |   27 +-
 drivers/media/i2c/imx355.c                         |  117 ++-
 drivers/media/i2c/imx412.c                         |    8 +-
 drivers/media/i2c/ir-kbd-i2c.c                     |    2 +
 drivers/media/i2c/max9286.c                        |    2 +-
 drivers/media/i2c/mt9m114.c                        |   35 +-
 drivers/media/i2c/mt9p031.c                        |    4 +
 drivers/media/i2c/og01a1b.c                        |  899 ++++++++---------
 drivers/media/i2c/ov02a10.c                        |    2 +-
 drivers/media/i2c/ov08d10.c                        |  246 ++++-
 drivers/media/i2c/ov2732.c                         |  790 +++++++++++++++
 drivers/media/i2c/ov5647.c                         |   12 +-
 drivers/media/i2c/ov5675.c                         |   32 +-
 drivers/media/i2c/ov8856.c                         |   23 +-
 drivers/media/i2c/ov9282.c                         |  679 +++++--------
 drivers/media/i2c/t4ka3.c                          | 1064 ++++++++++++++++=
++++
 drivers/media/i2c/vgxy61.c                         |    3 +
 drivers/media/pci/bt8xx/bttv-input.c               |    3 +-
 drivers/media/pci/cx23885/cx23885-cards.c          |    3 +
 drivers/media/pci/cx23885/cx23885-core.c           |   15 +-
 drivers/media/pci/cx23885/cx23885-dvb.c            |    6 +-
 drivers/media/pci/cx23885/cx23885-input.c          |    1 +
 drivers/media/pci/cx23885/cx23885.h                |    1 +
 drivers/media/pci/cx25821/cx25821-alsa.c           |    6 +-
 drivers/media/pci/cx88/cx88-input.c                |    3 +-
 drivers/media/pci/dm1105/dm1105.c                  |    1 +
 drivers/media/pci/intel/ipu-bridge.c               |   16 +
 drivers/media/pci/intel/ipu6/ipu6.c                |    2 +-
 drivers/media/pci/mantis/mantis_input.c            |    1 +
 drivers/media/pci/mgb4/mgb4_core.c                 |    3 +-
 drivers/media/pci/mgb4/mgb4_sysfs_in.c             |   18 +-
 drivers/media/pci/mgb4/mgb4_sysfs_out.c            |   62 ++
 drivers/media/pci/saa7134/saa7134-i2c.c            |   26 +-
 drivers/media/pci/saa7134/saa7134-input.c          |    1 +
 drivers/media/pci/saa7164/saa7164-core.c           |   47 +-
 drivers/media/pci/saa7164/saa7164-fw.c             |    4 +-
 drivers/media/pci/smipcie/smipcie-ir.c             |    1 +
 drivers/media/pci/ttpci/budget-ci.c                |    1 +
 drivers/media/pci/zoran/zoran_card.c               |    2 +-
 drivers/media/platform/amphion/vpu_v4l2.c          |    9 +-
 .../media/platform/arm/mali-c55/mali-c55-common.h  |    2 +
 .../media/platform/arm/mali-c55/mali-c55-core.c    |   35 -
 drivers/media/platform/arm/mali-c55/mali-c55-isp.c |   37 +-
 .../media/platform/arm/mali-c55/mali-c55-params.c  |  134 ++-
 .../platform/arm/mali-c55/mali-c55-registers.h     |    4 +-
 drivers/media/platform/broadcom/Kconfig            |    5 -
 drivers/media/platform/broadcom/bcm2835-unicam.c   |   45 +-
 .../media/platform/chips-media/wave5/wave5-vdi.c   |    1 +
 .../platform/chips-media/wave5/wave5-vpu-dec.c     |   14 +-
 .../media/platform/mediatek/jpeg/mtk_jpeg_core.c   |    1 +
 .../mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c   |    9 +
 drivers/media/platform/nxp/dw100/dw100.c           |  134 ++-
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h  |    3 +
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c     |  117 ++-
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h     |   22 +
 drivers/media/platform/nxp/imx-mipi-csis.c         |   31 +-
 .../media/platform/nxp/imx8-isi/imx8-isi-core.c    |   12 +
 .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |    1 +
 drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c  |    6 +-
 .../media/platform/nxp/imx8-isi/imx8-isi-video.c   |    2 +-
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c      |   92 +-
 drivers/media/platform/renesas/rcar-csi2.c         |  116 ++-
 drivers/media/platform/renesas/rcar-isp/csisp.c    |   13 +-
 drivers/media/platform/renesas/rcar-vin/rcar-dma.c |   22 +
 .../media/platform/renesas/rcar-vin/rcar-v4l2.c    |   12 +
 .../platform/renesas/rzv2h-ivc/rzv2h-ivc-dev.c     |    2 +-
 .../platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c   |   63 +-
 .../media/platform/renesas/rzv2h-ivc/rzv2h-ivc.h   |   13 +-
 drivers/media/platform/renesas/vsp1/vsp1_brx.c     |   37 +-
 drivers/media/platform/renesas/vsp1/vsp1_clu.c     |   47 +-
 drivers/media/platform/renesas/vsp1/vsp1_drv.c     |    8 +-
 drivers/media/platform/renesas/vsp1/vsp1_entity.c  |  108 +-
 drivers/media/platform/renesas/vsp1/vsp1_entity.h  |   21 +-
 drivers/media/platform/renesas/vsp1/vsp1_histo.c   |   97 +-
 drivers/media/platform/renesas/vsp1/vsp1_histo.h   |    2 -
 drivers/media/platform/renesas/vsp1/vsp1_hsit.c    |   61 +-
 drivers/media/platform/renesas/vsp1/vsp1_iif.c     |   39 +-
 drivers/media/platform/renesas/vsp1/vsp1_lif.c     |   40 +-
 drivers/media/platform/renesas/vsp1/vsp1_lut.c     |   47 +-
 drivers/media/platform/renesas/vsp1/vsp1_rpf.c     |    7 +-
 drivers/media/platform/renesas/vsp1/vsp1_rwpf.c    |  127 ++-
 drivers/media/platform/renesas/vsp1/vsp1_rwpf.h    |    6 +-
 drivers/media/platform/renesas/vsp1/vsp1_sru.c     |   63 +-
 drivers/media/platform/renesas/vsp1/vsp1_uds.c     |   62 +-
 drivers/media/platform/renesas/vsp1/vsp1_uif.c     |   40 +-
 drivers/media/platform/renesas/vsp1/vsp1_wpf.c     |   13 +-
 .../platform/rockchip/rkcif/rkcif-capture-mipi.c   |   10 +-
 .../platform/rockchip/rkcif/rkcif-interface.c      |    3 +-
 .../media/platform/rockchip/rkcif/rkcif-stream.c   |   46 +-
 .../platform/rockchip/rkisp1/rkisp1-capture.c      |    3 +
 .../media/platform/samsung/exynos4-is/fimc-core.c  |    6 +-
 .../media/platform/samsung/exynos4-is/fimc-is.c    |   11 +-
 drivers/media/platform/st/stm32/stm32-dcmi.c       |  475 ++++++---
 drivers/media/platform/synopsys/Kconfig            |    1 +
 drivers/media/platform/synopsys/dw-mipi-csi2rx.c   |  279 ++++-
 .../media/platform/synopsys/hdmirx/snps_hdmirx.c   |    6 +-
 drivers/media/platform/ti/omap3isp/ispvideo.c      |    1 +
 drivers/media/platform/ti/vpe/vip.c                |    1 +
 drivers/media/rc/ati_remote.c                      |    6 +-
 drivers/media/rc/ene_ir.c                          |    2 +-
 drivers/media/rc/fintek-cir.c                      |    3 +-
 drivers/media/rc/gpio-ir-tx.c                      |    4 +-
 drivers/media/rc/igorplugusb.c                     |   17 +-
 drivers/media/rc/iguanair.c                        |    1 +
 drivers/media/rc/img-ir/img-ir-hw.c                |    3 +-
 drivers/media/rc/img-ir/img-ir-raw.c               |    3 +-
 drivers/media/rc/imon.c                            |   16 +-
 drivers/media/rc/ir-hix5hd2.c                      |    2 +-
 drivers/media/rc/ir_toy.c                          |    1 +
 drivers/media/rc/ite-cir.c                         |    2 +-
 drivers/media/rc/mceusb.c                          |    5 +-
 drivers/media/rc/rc-ir-raw.c                       |    5 -
 drivers/media/rc/rc-loopback.c                     |    1 +
 drivers/media/rc/rc-main.c                         |    6 +-
 drivers/media/rc/redrat3.c                         |    4 +-
 drivers/media/rc/st_rc.c                           |    2 +-
 drivers/media/rc/streamzap.c                       |   19 +-
 drivers/media/rc/sunxi-cir.c                       |    1 +
 drivers/media/rc/ttusbir.c                         |   15 +-
 drivers/media/rc/winbond-cir.c                     |    2 +-
 drivers/media/rc/xbox_remote.c                     |   14 +-
 drivers/media/test-drivers/vidtv/Kconfig           |    1 +
 drivers/media/test-drivers/vidtv/vidtv_bridge.c    |    4 +-
 drivers/media/test-drivers/vidtv/vidtv_channel.c   |    4 +
 drivers/media/test-drivers/vidtv/vidtv_mux.c       |    4 +-
 drivers/media/test-drivers/vidtv/vidtv_psi.c       |   57 +-
 drivers/media/test-drivers/vidtv/vidtv_s302m.c     |    6 +-
 drivers/media/test-drivers/vidtv/vidtv_ts.c        |   48 +-
 drivers/media/test-drivers/vidtv/vidtv_ts.h        |    4 +-
 drivers/media/test-drivers/vimc/vimc-common.h      |   41 +
 drivers/media/test-drivers/vimc/vimc-sensor.c      |  114 ++-
 drivers/media/test-drivers/vimc/vimc-streamer.c    |   33 +-
 drivers/media/tuners/mxl5005s.c                    |    6 +
 drivers/media/tuners/si2157.c                      |  222 +++-
 drivers/media/tuners/si2157_priv.h                 |    3 +-
 drivers/media/tuners/xc5000.c                      |   12 +-
 drivers/media/usb/as102/as102_usb_drv.c            |    2 +
 drivers/media/usb/au0828/au0828-cards.c            |   50 +
 drivers/media/usb/au0828/au0828-cards.h            |    2 +
 drivers/media/usb/au0828/au0828-dvb.c              |    1 +
 drivers/media/usb/au0828/au0828-input.c            |    2 +
 drivers/media/usb/au0828/au0828-video.c            |   25 +-
 drivers/media/usb/cx231xx/cx231xx-avcore.c         |    7 +-
 drivers/media/usb/cx231xx/cx231xx-cards.c          |    5 +-
 drivers/media/usb/dvb-usb-v2/dvb_usb_core.c        |    1 +
 drivers/media/usb/dvb-usb/dvb-usb-remote.c         |    6 +-
 drivers/media/usb/em28xx/em28xx-cards.c            |  258 ++++-
 drivers/media/usb/em28xx/em28xx-core.c             |  159 ++-
 drivers/media/usb/em28xx/em28xx-dvb.c              |  322 +++++-
 drivers/media/usb/em28xx/em28xx-i2c.c              |    2 +
 drivers/media/usb/em28xx/em28xx-input.c            |    1 +
 drivers/media/usb/em28xx/em28xx-reg.h              |    1 +
 drivers/media/usb/em28xx/em28xx-video.c            |  207 +++-
 drivers/media/usb/em28xx/em28xx.h                  |   23 +
 drivers/media/usb/go7007/go7007-loader.c           |    6 +-
 drivers/media/usb/gspca/gspca.c                    |   13 -
 drivers/media/usb/hackrf/hackrf.c                  |    7 +-
 drivers/media/usb/usbtv/usbtv-core.c               |    4 +-
 drivers/media/usb/uvc/uvc_driver.c                 |   38 +-
 drivers/media/usb/uvc/uvc_isight.c                 |    2 +-
 drivers/media/usb/uvc/uvc_metadata.c               |    9 +-
 drivers/media/usb/uvc/uvc_queue.c                  |   23 +-
 drivers/media/usb/uvc/uvc_v4l2.c                   |    3 +
 drivers/media/usb/uvc/uvcvideo.h                   |   13 +-
 drivers/media/v4l2-core/v4l2-fwnode.c              |    9 +-
 drivers/media/v4l2-core/v4l2-subdev.c              |  119 +++
 drivers/platform/x86/intel/int3472/tps68470.c      |    1 +
 drivers/platform/x86/intel/int3472/tps68470.h      |    1 +
 .../x86/intel/int3472/tps68470_board_data.c        |  107 +-
 drivers/staging/media/Kconfig                      |    2 -
 drivers/staging/media/Makefile                     |    1 -
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c  |    4 +
 drivers/staging/media/av7110/av7110.c              |    2 +-
 drivers/staging/media/av7110/av7110_ir.c           |    1 +
 drivers/staging/media/imx/imx-media-csi.c          |   86 +-
 drivers/staging/media/imx/imx-media-of.c           |    3 +-
 drivers/staging/media/imx/imx-media-vdic.c         |    2 +-
 drivers/staging/media/imx/imx-media.h              |    2 +-
 drivers/staging/media/ipu3/ipu3.c                  |    2 +-
 drivers/staging/media/ipu7/TODO                    |   12 +-
 drivers/staging/media/starfive/Kconfig             |    5 -
 drivers/staging/media/starfive/Makefile            |    2 -
 drivers/staging/media/starfive/camss/Kconfig       |   18 -
 drivers/staging/media/starfive/camss/Makefile      |   13 -
 drivers/staging/media/starfive/camss/TODO.txt      |    4 -
 drivers/staging/media/starfive/camss/stf-camss.c   |  438 --------
 drivers/staging/media/starfive/camss/stf-camss.h   |  134 ---
 drivers/staging/media/starfive/camss/stf-capture.c |  605 -----------
 drivers/staging/media/starfive/camss/stf-capture.h |   86 --
 .../staging/media/starfive/camss/stf-isp-hw-ops.c  |  445 --------
 drivers/staging/media/starfive/camss/stf-isp.c     |  379 -------
 drivers/staging/media/starfive/camss/stf-isp.h     |  428 --------
 drivers/staging/media/starfive/camss/stf-video.c   |  570 -----------
 drivers/staging/media/starfive/camss/stf-video.h   |  100 --
 drivers/staging/media/tegra-video/Makefile         |    1 +
 drivers/staging/media/tegra-video/csi.c            |   64 +-
 drivers/staging/media/tegra-video/csi.h            |   22 +
 drivers/staging/media/tegra-video/tegra20.c        |  820 +++++++++++++--
 drivers/staging/media/tegra-video/vi.c             |   58 +-
 drivers/staging/media/tegra-video/vi.h             |    6 +-
 drivers/staging/media/tegra-video/video.c          |    8 +-
 drivers/staging/media/tegra-video/vip.c            |    2 +-
 drivers/staging/media/tegra-video/vip.h            |    2 +-
 include/linux/host1x.h                             |   10 -
 include/linux/tegra-mipi-cal.h                     |   57 ++
 include/linux/usb/uvc.h                            |    3 +
 include/media/rc-core.h                            |    4 +-
 include/media/v4l2-fwnode.h                        |    6 +-
 include/media/v4l2-subdev.h                        |   56 ++
 266 files changed, 10022 insertions(+), 7106 deletions(-)
 delete mode 100644 Documentation/admin-guide/media/starfive_camss.rst
 delete mode 100644 Documentation/admin-guide/media/starfive_camss_graph.dot
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov08d1=
0.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov2732=
.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx355=
.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/starfive,jh7110=
-camss.yaml
 create mode 100644 Documentation/driver-api/media/media-committers.rst
 create mode 100644 drivers/gpu/host1x/tegra114-mipi.c
 create mode 100644 drivers/media/i2c/ov2732.c
 create mode 100644 drivers/media/i2c/t4ka3.c
 delete mode 100644 drivers/staging/media/starfive/Kconfig
 delete mode 100644 drivers/staging/media/starfive/Makefile
 delete mode 100644 drivers/staging/media/starfive/camss/Kconfig
 delete mode 100644 drivers/staging/media/starfive/camss/Makefile
 delete mode 100644 drivers/staging/media/starfive/camss/TODO.txt
 delete mode 100644 drivers/staging/media/starfive/camss/stf-camss.c
 delete mode 100644 drivers/staging/media/starfive/camss/stf-camss.h
 delete mode 100644 drivers/staging/media/starfive/camss/stf-capture.c
 delete mode 100644 drivers/staging/media/starfive/camss/stf-capture.h
 delete mode 100644 drivers/staging/media/starfive/camss/stf-isp-hw-ops.c
 delete mode 100644 drivers/staging/media/starfive/camss/stf-isp.c
 delete mode 100644 drivers/staging/media/starfive/camss/stf-isp.h
 delete mode 100644 drivers/staging/media/starfive/camss/stf-video.c
 delete mode 100644 drivers/staging/media/starfive/camss/stf-video.h
 create mode 100644 include/linux/tegra-mipi-cal.h

