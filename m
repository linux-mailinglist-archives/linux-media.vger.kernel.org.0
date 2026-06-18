Return-Path: <linux-media+bounces-65238-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JBTDBGBlNGrGWwYAu9opvQ
	(envelope-from <linux-media+bounces-65238-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 23:38:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3472A6A2C8E
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 23:38:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=GcJZtGOJ;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65238-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65238-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ACC803037168
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 21:38:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 346EF326941;
	Thu, 18 Jun 2026 21:38:35 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE8D14ABE;
	Thu, 18 Jun 2026 21:38:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781818714; cv=none; b=X6ndvlzV21CSq7k3AvUxfTe6FrXR2uctAHRyX6LWPi+Irlde8J5PMGgMvz0xQWceYqGjx4nq06aSTzGPhEf1PZZVVm3DoHJrecslINGaHRx3lnU24tmPbyYj5BmCUQPSaA7yGbgSQuXvqN/bcVeoOlj3bjz4mJN2yAs3p7wH764=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781818714; c=relaxed/simple;
	bh=2xaA2bQbfSXE85DlexO6EgyyclQTHpFXqRvlZPD9uyY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=P2uwQ8Co79O2ybG8BRuSqWFslSSwvzTTVZhUnnDmRf6us8WidKGlCnfsw7n1lc8NRHpUa2cxd6ULy+vbew5rKu242X1jUJAdpVJE55cqjZLa56wlN5MBoClHbJ48WhkMu0o06B1lxSfXX04kRUfxZjToRcTgAEhKjs+SL9Hl3Zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GcJZtGOJ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD7331F000E9;
	Thu, 18 Jun 2026 21:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781818711;
	bh=5Rhk3BzeJpR3lFIfu1OOuSVA7FhNawc3jUhvV2atQ+M=;
	h=Date:From:To:Cc:Subject;
	b=GcJZtGOJ8Jmd7/HSd4okOHGfGCJ6eAqU3N9wYmQ7N7USg9z98mZYg9TKHdee2Nwdp
	 7KJG6yrbUXgwHGN08yhZn/yXHEeaMQ5N4aq91+FnWn/uF4mteMJ549pjI4SxBaR3Ne
	 BQ1pgijh6Va11N0WyalT6oqvQs/fJxM3qZYzHWrBXGf/8C44rgEvybg2Atkh4uFsri
	 x4zfANUXf6tkKM/vbNVOw59rdI7PlcI0f/y+he9hneO3RT6jL2+rlgyBbdvKC/VBor
	 +H2C6iKx5hrN0FLQfWo35IZf6TY0tij7lY96gB+Uw6movb/8u3Nd0bAPGNllKgsdvJ
	 jviivIm4QWuEQ==
Date: Thu, 18 Jun 2026 23:38:27 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton
 <akpm@linux-foundation.org>, Linux Media Mailing List
 <linux-media@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>
Subject: [GIT PULL for v7.2] media updates
Message-ID: <20260618233827.582d50a8@foz.lan>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-65238-lists,linux-media=lfdr.de,huawei];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:torvalds@linux-foundation.org,m:gregkh@linuxfoundation.org,m:akpm@linux-foundation.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[mchehab@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3472A6A2C8E

Hi Linus,

Please pull from:

	git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git medi=
a/v7.2-1

For:

- v4l2 core: fix subdev sensor ownership;
- v4l2-subdev: Allow accessing routes with STREAMS client capability;
- v4l2-ctrls: Add validation for HEVC active reference counts and backgroun=
d detection control;
- vb2: Change vb2_read() and vb2_write() return types to ssize_t;
- v4l2-common: Add YUV24 format info and has_alpha helper;
- i2c: cvs: Add driver of Intel Computer Vision Sensing Controller(CVS);
- atmel-isc: remove deprecated driver;
- cec: Add CEC Latency Indication Protocol (LIP) support;
- imon: Add iMON VFD HID OEM v1.2 key mappings;
- AVMatrix: new HWS capture driver;
- isp4: new AMD capture driver;
- qcom: iris: Add hierarchical coding, B-frame, and Long-Term Reference sup=
port for encoder;
- qcom: camss: Add SM6350 platform support;
- qcom: venus: Add SM6115 platform support;
- chips-media: wave5: Add support for Packed YUV422, CBP profile, and backg=
round detection;
- csi2rx: Add multistream support and 32 dma chans;
- Several cleanups and fixes.

Regards,
Mauro

---

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git tag=
s/media/v7.2-1

for you to fetch changes up to 06cb687a5132fcffe624c0070576ab852ac6b568:

  media: v4l2-fwnode: Fix subdev owner overwritten in v4l2_async_register_s=
ubdev_sensor() (2026-06-05 10:28:03 +0300)

----------------------------------------------------------------
Abinash Singh (1):
      staging: media: atomisp: replace uint32_t with u32

Adrian Barna=C5=9B (2):
      staging: media: atomisp: Whitespaces style cleanup in gdc.c
      staging: media: atomisp: Remove return from end of void function in g=
dc.c

Alessandro Baldi (1):
      media: imon: Add iMON VFD HID OEM v1.2 key mappings

Alexandru Hossu (1):
      staging: media: ipu7: fix double-free and use-after-free in error pat=
hs

Alper Ak (1):
      media: mali-c55: Fix possible ERR_PTR in enable_streams

Anand Moon (1):
      media: meson: vdec: Fix memory leak in error path of vdec_open

Andr=C3=A9 Apitzsch (2):
      media: dt-bindings: venus: Add qcom,msm8939 schema
      media: qcom: venus: Add msm8939 resource struct

Andy Shevchenko (2):
      staging: media: atomisp: Kill OP_std_modadd() macro
      media: atomisp: Drop unused include

Antti Laakso (2):
      platform/x86: int3472: Match MSI laptop board name
      platform/x86: int3472: Add more MSI AI evo laptops

Anushka Badhe (1):
      staging: media: atomisp: pci: fix split GP_TIMER_BASE declaration

Arash Golgol (2):
      media: video-i2c: use vb2_video_unregister_device on driver removal
      media: video-i2c: fix buffer queue ordering

Arnd Bergmann (3):
      media: qcom: camss: avoid format string warning
      media: platform: amd: add DRM_AMDGPU dependency
      staging: media: atomisp: reduce load_primary_binaries() stack usage

Arun T (3):
      platform/x86: int3472: Rename daisy-chain GPIO props to generic
      platform/x86: int3472: Add TPS68470 board data for intel nvl
      media: ov13b10: Support multiple regulators

Barnab=C3=A1s P=C5=91cze (1):
      media: rkisp1: Add support for CAC

Bartosz Golaszewski (1):
      media: i2c: drop unneeded dependencies on OF_GPIO

Ben Hoff (1):
      media: pci: add AVMatrix HWS capture driver

Benjamin Gaignard (1):
      media: verisilicon: Export only needed pixels formats

Biju Das (2):
      media: dt-bindings: media: renesas,fcp: Document RZ/G3L FCPVD IP
      media: dt-bindings: media: renesas,vsp1: Document RZ/G3L VSPD

Bin Du (8):
      media: platform: amd: Introduce amd isp4 capture driver
      media: platform: amd: low level support for isp4 firmware
      media: platform: amd: Add isp4 fw and hw interface
      media: platform: amd: isp4 subdev and firmware loading handling added
      media: platform: amd: isp4 video node and buffers handling added
      media: platform: amd: isp4 debug fs logging and more descriptive erro=
rs
      Documentation: add documentation of AMD isp 4 driver
      media: platform: amd: isp4: drop stale list reinit before free

Brandon Brnich (3):
      media: chips-media: wave5: Move src_buf Removal to finish_encode
      media: chips-media: wave5: Release m2m_ctx after Instance Removed fro=
m List
      media: chips-media: wave5: Fix Reports from Kernel Lock Validator

Bryan O'Donoghue (5):
      media: qcom: camss: Fix RDI streaming for CSID 680
      media: qcom: camss: Fix RDI streaming for CSID 340
      media: qcom: camss: Fix RDI streaming for CSID GEN2
      media: qcom: camss: Fix RDI streaming for CSID GEN3
      media: qcom: iris: Fix FPS calculation and VPP FW overhead

Changhuang Liang (1):
      media: cadence: csi2rx: Support runtime PM

Chelsy Ratnawat (1):
      media: atomisp: Use string choices helpers

Chen Ni (3):
      media: mali-c55: Remove unneeded semicolon
      media: mali-c55: core: Remove redundant dev_err()
      media: ti: j721e-csi2rx: Fix error handling for media_entity_remote_s=
ource_pad_unique()

Chen-Yu Tsai (1):
      dt-bindings: media: sun4i-a10-video-engine: Add interconnect properti=
es

Chethan C (1):
      staging: media: av7110: fix coding style

Daniel Scally (1):
      media: rzg2l-cru: Rework rzg2l_cru_fill_hw_slot()

David Carlier (6):
      media: aspeed: fix missing of_reserved_mem_device_release() on probe =
failure
      media: nuvoton: npcm-video: fix error handling in npcm_video_init()
      media: nuvoton: npcm-video: fix memory leaks in probe and remove
      media: mali-c55: Add missing of_reserved_mem_device_release()
      media: mali-c55: Power-off the peripheral in remove()
      media: mali-c55: Disable pm_runtime on probe error

Deepanshu Kartikey (1):
      media: rtl2832: fix use-after-free in rtl2832_remove()

Detlev Casanova (4):
      media: rkvdec: Introduce a global bitwriter helper
      media: rkvdec: Use the global bitwriter instead of local one
      media: rkvdec: common: Drop bitfields for the bitwriter
      media: rkvdec: vdpu383: Drop bitfields for the bitwriter

Dikshita Agarwal (1):
      media: iris: Initialize HFI ops after firmware load in core init

Dmitry Baryshkov (29):
      media: iris: retrieve UBWC platform configuration
      media: iris: don't specify min_acc_length in the source code
      media: iris: don't specify highest_bank_bit in the source code
      media: iris: don't specify ubwc_swizzle in the source code
      media: iris: don't specify bank_spreading in the source code
      media: iris: don't specify max_channels in the source code
      media: iris: drop remnants of UBWC configuration
      media: dt-bindings: qcom,sm8250-venus: sort out power domains
      media: iris: scale MMCX power domain on SM8250
      media: venus: scale MMCX power domain on SM8250
      media: dt-bindings: qcom,sc7280-venus: drop non-PAS support
      media: dt-bindings: qcom-sc7180-venus: move video-firmware here
      media: qcom: venus: flip the venus/iris switch
      media: qcom: iris: drop pas_id from the iris_platform_data struct
      media: qcom: iris: use common set_preset_registers function
      media: qcom: iris: don't use function indirection in gen2-specific co=
de
      media: qcom: iris: split HFI session ops from core ops
      media: qcom: iris: merge hfi_response_ops and hfi_command_ops
      media: qcom: iris: move get_instance to iris_hfi_sys_ops
      media: qcom: iris: drop hw_response_timeout_val from platform data
      media: qcom: iris: split firmware_data from raw platform data
      media: qcom: iris: split platform data from firmware data
      media: qcom: iris: use new firmware name for SM8250
      media: qcom: iris: extract firmware description data
      Revert "media: venus: hfi_platform: Correct supported codecs for sc72=
80"
      media: dt-bindings: qcom,qcm2290-venus: add Venus on SM6115
      media: iris: Fix use IRQF_NO_AUTOEN when requesting the IRQ
      media: dt-bindings: Document SC8280XP/SM8350 Iris
      media: iris: drop struct iris_fmt

Dmitry Osipenko (1):
      media: synopsys: hdmirx: Fix HPD lane hold time

Erikas Bitovtas (2):
      media: qcom: venus: add power domain enable logic for Venus cores
      media: qcom: venus: add codec blacklist mechanism

Ethan Lam (1):
      staging: media: atomisp: fix block comment style in atomisp_cmd.c

Eugen Hristev (2):
      media: staging: atmel-isc: Remove driver
      media: i2c: imx274: trivial cleanup

Felix Gu (3):
      media: ti: vpe: Fix fwnode_handle leak in vip_probe_complete()
      media: ti: vpe: Fix the error code of devm_request_irq()
      media: ti: vpe: Fix the error code of devm_kzalloc() in vip_probe_sli=
ce()

Feng Ning (1):
      staging: media: atomisp: use array3_size() for overflow-safe allocati=
on

Fritz Koenig (1):
      Documentation: media: Fix v4l2_vp9_segmentation

Guangshuo Li (4):
      media: vidtv: fix reference leak on failed device registration
      media: vimc: fix reference leak on failed device registration
      media: vivid: fix cleanup bugs in vivid_init()
      media: marvell-cam: fix missing pci_disable_device() on remove

Guoniu Zhou (9):
      media: synopsys: Fix IPI using hardcoded datatype
      media: synopsys: Add support for RAW16 Bayer formats
      media: synopsys: Add support for multiple streams
      media: synopsys: Add PHY stopstate wait for i.MX93
      media: dt-bindings: add NXP i.MX95 compatible string
      media: synopsys: Add support for i.MX95
      media: nxp: imx8-isi: Prioritize pending buffers over discard buffers
      media: nxp: imx8-isi: Fix potential out-of-bounds issues
      media: nxp: imx8-isi: Fix scale factor calculation for hardware round=
ing

Hamdan Khan (1):
      staging: media: atomisp: Fix typos and formatting in headers

Hans Verkuil (7):
      media: visl: check if ctx->tpg_str_buf allocation failed
      media: include/uapi/linux/cec*.h: add CEC LIP support
      Documentation: media: add CEC opcodes
      media: cec: core: add LIP support
      media: include/uapi/linux/cec*: clarify which msgs are CEC 2.0
      media: vivid: add vivid_update_reduced_fps()
      media: vivid: check for vb2_is_busy() when toggling caps

Hans de Goede (1):
      media: atomisp: Fix alloc_pages_bulk() failed errors

Haoxiang Li (1):
      media: em28xx-video: fix missing res_free() on init_usb_xfer failure

Huihui Huang (1):
      staging: media: atomisp: fix map and vmap leaks in stat buffer alloca=
tion

Hungyu Lin (2):
      media: tegra-video: tegra210: remove redundant NULL check in dequeue_=
buf_done
      media: tegra-video: vi: fix invalid u32 return value in format lookup

Jackson Lee (4):
      media: v4l2-controls: Add control for background detection
      media: chips-media: wave5: Add support for background detection
      media: chips-media: wave5: Support CBP profile
      media: chips-media: wave5: Add Support for Packed YUV422 Formats

Jacopo Mondi (16):
      media: rzv2h-ivc: Add myself as co-maintainer
      media: rzg2l-cru: Add MAINTAINERS entry
      media: rzg2l-cru: Modernize locking usage with guards
      media: rzg2l-cru: Use proper guard() in irq handler
      media: rzg2l-cru: Remove locking from start/stop routines
      media: rzg2l-cru: Do not use irqsave when not needed
      media: rzg2l-cru: Remove wrong locking comment
      media: rz2gl-cru: Introduce a spinlock for hw operations
      media: rzg2l-cru: Split hw locking from buffers
      media: rzg2l-cru: Manually track active slot number
      media: rz2gl-cru: Return pending buffers in order
      media: rzg2l-cru: Remove the 'state' variable
      media: rzg2l-cru: Remove debug printouts from irq
      media: rzg2l-cru: Simplify irq return value handling
      media: rzv2h-ivc: Wait for frame end in stop_streaming
      media: rcar-vin: Drop min_queued_buffers

Jai Luthra (9):
      dt-bindings: media: ti,j721e-csi2rx-shim: Support 32 dma chans
      media: ti: j721e-csi2rx: separate out device and context
      media: ti: j721e-csi2rx: add a subdev for the core device
      media: ti: j721e-csi2rx: add support for processing virtual channels
      media: cadence: csi2rx: add multistream support
      media: ti: j721e-csi2rx: add multistream support
      media: ti: j721e-csi2rx: Submit all available buffers
      media: ti: j721e-csi2rx: Support runtime suspend
      media: ti: j721e-csi2rx: Support system suspend using pm_notifier

Johan Hovold (8):
      media: imon_raw: Refactor endpoint lookup
      media: irtoy: Refactor endpoint lookup
      media: si470x-usb: refactor endpoint lookup
      media: gspca: refactor endpoint lookup
      media: hdpvr: refactor endpoint lookup
      media: s2255: refactor endpoint lookup
      media: vpif_capture: fix OF node reference imbalance
      media: cx231xx: fix devres lifetime

Jose A. Perez de Azpillaga (5):
      media: atomisp: gate ref and tnr frame config behind ISP enable flags
      media: atomisp: remove redundant call to ia_css_output0_configure()
      staging: media: atomisp: fix loop shadowing in ia_css_stream_destroy()
      staging: media: atomisp: extract ISP2401 cleanup into helper function
      staging: media: atomisp: improve cleanup robustness in ia_css_stream_=
destroy_isp2401()

Josh Hesketh (1):
      staging: media: av7110: remove dead code from av7110_hw.c

Julian Braha (1):
      media: dead code cleanup in kconfig for VIDEO_SOLO6X10

Karthikey Kadati (1):
      media: atomisp: replace ia_css_region with v4l2_rect

Kells Ping (1):
      media: platform: cros-ec: Add Dirkson to the match table

Ken Lin (1):
      media: platform: cros-ec: Add Kulnex and Moxoe to the match table

Krzysztof Kozlowski (1):
      media: pci: dm1105: Free allocated workqueue

Laurent Pinchart (12):
      media: mc-entity: Fix documentation typo in function name
      media: mc-entity: Drop ifdef for media_entity_cleanup definition
      media: renesas: vsp1: Avoid forward function declaration
      media: renesas: vsp1: Split vsp1_du_setup_lif()
      drm: renesas: rcar-du: Switch to new VSP API
      drm: renesas: rz-du: Switch to new VSP API
      media: renesas: vsp1: Use mutex guards
      media: renesas: vsp1: Use mutex scoped guards
      media: renesas: vsp1: Use spinlock guards
      media: renesas: vsp1: Use spinlock scoped guards
      media: renesas: vsp1: Simplify iteration over format arrays
      media: renesas: vsp1: Drop deprecated vsp1_du_setup_lif() function

Lian Xiangyu (1):
      staging: media: ipu7: remove 'U' suffix from hexadecimal literals

LiangCheng Wang (4):
      staging: media: atomisp: improve kernel-doc for ia_css_aa_config
      staging: media: atomisp: fix indentation in anr files
      staging: media: atomisp: use designated initializer in anr config
      staging: media: atomisp: fix indentation in bh host files

Lin YuChen (1):
      staging: media: atomisp: use kmalloc_array() for sh_css_blob_info

Loic Poulain (10):
      MAINTAINERS: add myself as a CAMSS patch reviewer
      media: qcom: camss: Add debug message to camss-video format check
      media: qcom: camss: Add per-format BPL alignment helper
      media: qcom: camss: Use proper BPL alignment helper and non-power-of-=
two rounding
      media: qcom: camss: vfe: Make PIX BPL alignment format-based on CAMSS=
_2290
      media: qcom: camss: csid-340: Switch to generic CSID_CFG/CTRL registe=
rs
      media: qcom: camss: csid-340: Add port-to-interface mapping
      media: qcom: camss: csid-340: Enable PIX interface routing
      media: qcom: camss: vfe-340: Proper client handling
      media: qcom: camss: vfe-340: Support for PIX client

Louis-Alexis Eyraud (1):
      media: mtk-jpeg: cancel workqueue on release for supported platforms =
only

Luca Weiss (2):
      dt-bindings: media: camss: Add qcom,sm6350-camss
      media: qcom: camss: Add SM6350 support

Ma Ke (1):
      media: saa7134: Fix a possible memory leak in saa7134_video_init1

Maha Maryam Javaid (2):
      staging: media: av7110: fix typo in av7110.c
      staging: media: meson: fix typo in codec files

Mahad Ibrahim (6):
      media: atomisp: Remove redundant return statement
      media: atomisp: Fix function signature alignment
      media: atomisp: Fix block comment coding style
      media: atomisp: Fix erroneous parameter descriptions
      media: atomisp: Convert comments to kernel-doc
      media: atomisp: Fix block comment coding style in sh_css_param_shadin=
g.c

Marco Nenciarini (1):
      media: intel/ipu6: Improve DWC PHY HSFREQRANGE band selection for ove=
rlapping ranges

Martin Hecht (1):
      media: i2c: alvium: fix critical pointer access in alvium_ctrl_init

Martin T=C5=AFma (1):
      media: mgb4: Fix DV timings limits

Matt Wardle (3):
      staging: media: atomisp: Remove braces for single statement blocks
      staging: media: atomisp: Fix function indentation and braces
      staging: media: atomisp: Fix braces on incorrect lines

Michael Olbrich (1):
      media: rockchip: rga: share the interrupt when an external iommu is u=
sed

Michael Riesch (4):
      media: dt-bindings: rockchip,rk3568-mipi-csi2: add rk3588 compatible
      Documentation: admin-guide: media: add rk3588 vicap
      media: dt-bindings: add rockchip rk3588 vicap
      media: rockchip: rkcif: add support for rk3588 vicap mipi capture

Michael Tretter (3):
      media: staging: imx-csi: move media_pipeline to video device
      media: staging: imx-csi: explicitly start media pipeline on pad 0
      media: staging: imx-csi: use media_pad_is_streaming helper

Michael Ugrin (1):
      staging: media: atomisp: use umin() for strscpy size arguments

Miguel Vadillo (2):
      media: i2c: cvs: Add driver of Intel Computer Vision Sensing Controll=
er(CVS)
      media: pci: intel: Add CVS support for IPU bridge driver

Mirela Rabulea (1):
      media: v4l2-fwnode: Fix subdev owner overwritten in v4l2_async_regist=
er_subdev_sensor()

Mohamad El Harake (1):
      media: atomisp: avoid ACPI package count underflow in gmin_cfg_get_dsm

Myeonghun Pak (5):
      media: cec: seco: unregister adapter on IR probe failure
      media: ti: vpe: unwind v4l2 device registration on probe error
      media: stm32: dcmi: unregister notifier on probe failure
      media: radio-si476x: Unregister v4l2_device on probe failure
      media: cedrus: clean up media device on probe failure

Nas Chung (1):
      media: v4l2-common: Add YUV24 format info

Neil Armstrong (6):
      media: qcom: iris: add helpers for 8bit and 10bit formats
      media: qcom: iris: add QC10C & P010 buffer size calculations
      media: qcom: iris: gen2: add support for 10bit decoding
      media: qcom: iris: vdec: update size and stride calculations for 10bi=
t formats
      media: qcom: iris: vdec: update find_format to handle 8bit and 10bit =
formats
      media: qcom: iris: vdec: allow GEN2 decoding into 10bit format

Niklas S=C3=B6derlund (1):
      media: uapi: rkisp: Correct name version enum

Oskar Ray-Frayssinet (3):
      staging: media: atomisp: remove unnecessary else after return in atom=
isp_cmd.c
      staging: media: atomisp: use __func__ in debug message in atomisp_cmd=
.c
      staging: media: atomisp: replace msleep() with fsleep() in atomisp-gc=
2235.c

Paul Cercueil (1):
      media: v4l2-common: Always register clock with device-specific name

Pedro Pontes (1):
      media: atomisp: use kmalloc_objs for array allocations

Pengpeng Hou (2):
      media: v4l2-ctrls: validate HEVC active reference counts
      media: cedrus: skip invalid H.264 reference list entries

Philipp Matthias Hahn (1):
      media: gspca: Fix comment in sd_init()

Pratyush Yadav (3):
      media: ti: j721e-csi2rx: prepare SHIM code for multiple contexts
      media: ti: j721e-csi2rx: allocate DMA channel based on context index
      media: ti: j721e-csi2rx: get number of contexts from device tree

Renjiang Han (3):
      media: qcom: venus: drop extra padding in NV12 raw size calculation
      media: qcom: venus: relax encoder frame/blur dimension steps on v4
      media: qcom: venus: relax encoder frame/blur step size on v6

Ricardo Ribalda (19):
      media: uvcvideo: Fix sequence number when no EOF
      media: uvcvideo: Fix buffer sequence in frame gaps
      media: uvcvideo: Import standard controls from uvcdynctrl
      media: uvcvideo: Announce deprecation intentions for UVCIOC_CTRL_MAP
      media: uvcvideo: Introduce allow_privacy_override module parameter
      media: v4l2-dev: Add range check for vdev->minor
      media: i2c: mt9p031: Rewrite assignment to make smatch happy
      media: i2c: adv7604: Add range checks for chip info
      media: chips-media: wave5: Add range checks for dec_output_info
      media: staging: ipu3-imgu: Add range check for imgu_css_cfg_acc_stripe
      media: amlogic-c3: Add validations for ae and awb config
      media: uvcvideo: Do not open code uvc_queue_get_current_buffer
      media: uvcvideo: Avoid partial metadata buffers
      media: uvcvideo: Fix dev_sof filtering in hw timestamp
      media: uvcvideo: Use hw timestaming if the clock buffer is full
      media: uvcvideo: Relax the constrains for interpolating the hw clock
      media: uvcvideo: Do not add clock samples with small sof delta
      media: uvcvideo: Do not add samples if dev_sof has not changed
      media: uvcvideo: Only do uvc_video_get_time() if needed

Riccardo Boninsegna (1):
      media: rc: mceusb: Add support for 04eb:e033

Rishikesh Donadkar (5):
      media: ti: j721e-csi2rx: Remove word size alignment on frame width
      media: cadence: csi2rx: Move to .enable/disable_streams API
      media: cadence: csi2rx: Add .get_frame_desc op
      media: ti: j721e-csi2rx: Change the drain architecture for multistream
      media: ti: j721e-csi2rx: Minor cleanup of loop variables

Rosen Penev (1):
      media: gspca: use module_usb_driver()

Rouven Czerwinski (1):
      media: verisilicon: remove hantro_run declaration

Ruslan Valiyev (1):
      media: vidtv: fix NULL pointer dereference in vidtv_mux_push_si

Sakari Ailus (15):
      media: v4l2-subdev: Fail {enable,disable}_streams and s_streaming nic=
ely
      media: dw9719: Add back the I=C2=B2C device id table
      media: Documentation: Use right function to test device power state
      media: imx219: Rename "PIXEL_ARRAY" as "ACTIVE_AREA"
      media: imx219: Fix maximum frame length in lines
      media: imx219: Set horizontal blanking on mode change
      media: imx274: Remove redundant kernel-doc comments
      media: imx334: Remove redundant kernel-doc comments
      media: imx335: Remove redundant kernel-doc comments
      media: imx412: Remove redundant kernel-doc comments
      media: ov9282: Remove redundant kernel-doc comments
      media: tvp514x: Remove redundant kernel-doc comments
      media: Documentation: Improve LINK_FREQ documentation
      media: v4l2-subdev: Refactor returning routes
      media: v4l2-subdev: Allow accessing routes with STREAMS client capabi=
lity

Samuel Holland (2):
      media: cedrus: Fix missing cleanup in error path
      media: cedrus: Fix failure to clean up hardware on probe failure

Sasha Levin (1):
      media: tegra-vde: Add HAS_IOMEM dependency to match SRAM select

Sean Anderson (1):
      media: uvcvideo: Fix deadlock if uvc_status_stop is called from async=
_ctrl.work

Sergey Shtylyov (1):
      media: v4l2-ctrls-request: add NULL check in v4l2_ctrl_request_comple=
te()

Shyam Sunder Reddy Padira (1):
      media: staging: imx: remove unnecessary out-of-memory error message

Sven P=C3=BCschel (26):
      media: dt-bindings: media: rockchip-rga: add rockchip,rk3588-rga3
      media: v4l2-common: sort RGB formats in v4l2_format_info
      media: v4l2-common: add missing 1 and 2 byte RGB formats to v4l2_form=
at_info
      media: v4l2-common: add has_alpha to v4l2_format_info
      media: v4l2-common: add v4l2_fill_pixfmt_mp_aligned helper
      media: rockchip: rga: fix too small buffer size
      media: rockchip: rga: use clk_bulk api
      media: rockchip: rga: use stride for offset calculation
      media: rockchip: rga: remove redundant rga_frame variables
      media: rockchip: rga: announce and sync colorimetry
      media: rockchip: rga: move hw specific parts to a dedicated struct
      media: rockchip: rga: avoid odd frame sizes for YUV formats
      media: rockchip: rga: calculate x_div/y_div using v4l2_format_info
      media: rockchip: rga: move cmdbuf to rga_ctx
      media: rockchip: rga: align stride to 4 bytes
      media: rockchip: rga: reuse cmdbuf contents
      media: rockchip: rga: check scaling factor
      media: rockchip: rga: use card type to specify rga type
      media: rockchip: rga: change offset to dma_addresses
      media: rockchip: rga: support external iommus
      media: rockchip: rga: remove size from rga_frame
      media: rockchip: rga: remove stride from rga_frame
      media: rockchip: rga: move rga_fmt to rga-hw.h
      media: rockchip: rga: add feature flags
      media: rockchip: rga: disable multi-core support
      media: rockchip: rga: add rga3 support

Svyatoslav Ryhel (5):
      media: i2c: lm3560: Fix v4l2 subdev registration
      media: i2c: lm3560: Optimize mutex lock usage
      media: i2c: lm3560: Convert to use OF bindings
      media: i2c: lm3560: Add support for PM features
      media: i2c: lm3560: Add proper support for LM3559

Taekyung Oh (2):
      staging: media: atomisp: Fix block comment style in ov2722.h
      staging: media: atomisp: remove dead code in ov2722.h

Thorsten Blum (1):
      media: ivtv: use clamp in ivtv_try_fmt_vid_{out,cap}

Timo R=C3=B6hling (1):
      media: atomisp: style fix for trailing statements

Tomasz Unger (5):
      staging: media: av7110: remove dead code in av7110.c
      staging: media: av7110: remove print_time() dead code
      staging: media: atomisp: Fix spelling mistakes in comments
      staging: media: atomisp: replace sprintf() with strscpy()
      media: staging: atomisp: Remove unnecessary return statement in void =
function

Tommaso Merciai (4):
      media: dt-bindings: media: renesas,fcp: Document RZ/G3E SoC
      media: dt-bindings: media: renesas,vsp1: Document RZ/G3E
      media: rzg2l-cru: Skip ICnMC configuration when ICnSVC is used
      media: rzg2l-cru: Use only frame end interrupts

Uwe Kleine-K=C3=B6nig (The Capable Hub) (1):
      media: Use named initializers for arrays of i2c_device_data

Valery Borovsky (7):
      media: airspy: Return queued buffers on start_streaming() failure
      media: msi2500: Return queued buffers on start_streaming() failure
      media: pwc: Return queued buffers on start_streaming() failure
      media: rtl2832_sdr: Return queued buffers on start_streaming() failure
      media: stm32-dcmipp: Return queued buffers on start_streaming() failu=
re
      media: sun4i-csi: Return queued buffers on start_streaming() failure
      media: pwc: Drain fill_buf on start_streaming() failure

Vishnu Reddy (2):
      media: iris: add FPS calculation and VPP FW overhead in frequency for=
mula
      media: iris: optimize COMV buffer allocation for VPU3x and VPU4x

Wang Jun (1):
      media: cx23885: add ioremap return check and cleanup

Wangao Wang (9):
      media: dt-bindings: qcom,sm8550-iris: Add X1P42100 compatible
      media: qcom: iris: Add intra refresh support for gen1 encoder
      media: qcom: iris: Add Long-Term Reference support for encoder
      media: qcom: iris: Add B frames support for encoder
      media: qcom: iris: Add hierarchical coding support for encoder
      media: qcom: iris: Optimize iris_hfi_gen1_packet_session_set_property
      media: qcom: iris: Simplify COMV size calculation
      media: iris: Add hardware power on/off ops for X1P42100
      media: iris: Add platform data for X1P42100

Wenmeng Liu (7):
      media: qcom: camss: Fix csid IRQ offset for sa8775p
      media: qcom: camss: Fix csid clock configuration for sa8775p
      media: qcom: camss: Add missing clocks for VFE lite on sa8775p
      media: qcom: camss: Add common TPG support
      media: qcom: camss: Add link support for TPG
      media: qcom: camss: tpg: Add TPG support for multiple targets
      media: qcom: camss: vfe: fix PIX subdev naming on VFE lite

Xiaolei Wang (4):
      media: nxp: imx8-isi: Fix use-after-free on remove
      media: nxp: imx8-isi: Add missing v4l2_subdev_cleanup() in crossbar a=
nd pipe
      media: nxp: imx8-isi: Fix missing v4l2_subdev_cleanup() in pipe init =
error path
      media: nxp: imx8-isi: Clean up already-initialized pipes on probe fai=
lure

Yuho Choi (1):
      media: atomisp: gc2235: fix UAF and memory leak

Zhaoyang Yu (1):
      media: dm1105: fix missing error check for dma_alloc_coherent

Zile Xiong (2):
      media: vb2: use ssize_t for vb2_read/vb2_write
      staging: media: atomisp: hmm: remove unnecessary casts

Zilin Guan (1):
      media: atomisp: Fix memory leak in atomisp_fixed_pattern_table()

jempty.liang (1):
      media: mali-c55: Initialise dev for tpg/rsz/isp subdevs

 Documentation/admin-guide/media/amdisp4-1.rst      |   63 +
 Documentation/admin-guide/media/amdisp4.dot        |    6 +
 .../admin-guide/media/rkcif-rk3588-vicap.dot       |   29 +
 Documentation/admin-guide/media/rkcif.rst          |   32 +
 Documentation/admin-guide/media/v4l-drivers.rst    |    1 +
 .../media/allwinner,sun4i-a10-video-engine.yaml    |   10 +
 .../bindings/media/qcom,msm8939-venus.yaml         |   79 +
 .../bindings/media/qcom,qcm2290-venus.yaml         |    6 +-
 .../bindings/media/qcom,sc7180-venus.yaml          |   15 +
 .../bindings/media/qcom,sc7280-venus.yaml          |   10 +-
 .../bindings/media/qcom,sm6350-camss.yaml          |  471 +++++
 .../bindings/media/qcom,sm8250-venus.yaml          |   23 +-
 .../bindings/media/qcom,sm8550-iris.yaml           |   23 +-
 .../bindings/media/qcom,venus-common.yaml          |   15 -
 .../devicetree/bindings/media/renesas,fcp.yaml     |    4 +
 .../devicetree/bindings/media/renesas,vsp1.yaml    |    2 +
 .../bindings/media/rockchip,rk3568-mipi-csi2.yaml  |   27 +-
 .../bindings/media/rockchip,rk3568-vicap.yaml      |  173 +-
 .../devicetree/bindings/media/rockchip-rga.yaml    |   10 +-
 .../bindings/media/ti,j721e-csi2rx-shim.yaml       |   39 +-
 Documentation/driver-api/media/camera-sensor.rst   |    2 +-
 Documentation/driver-api/media/tx-rx.rst           |    3 +-
 .../userspace-api/media/cec/cec.h.rst.exceptions   |   23 +
 .../userspace-api/media/drivers/uvcvideo.rst       |    2 +
 .../media/v4l/ext-ctrls-codec-stateless.rst        |    2 +-
 .../userspace-api/media/v4l/ext-ctrls-codec.rst    |    6 +
 .../media/v4l/ext-ctrls-image-process.rst          |    5 +-
 MAINTAINERS                                        |   52 +-
 drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c      |    4 +-
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c       |    4 +-
 drivers/media/cec/core/cec-adap.c                  |    9 +
 drivers/media/cec/i2c/tda9950.c                    |    2 +-
 drivers/media/cec/platform/cros-ec/cros-ec-cec.c   |    6 +
 drivers/media/cec/platform/seco/seco-cec.c         |    6 +-
 drivers/media/common/videobuf2/videobuf2-core.c    |   12 +-
 drivers/media/dvb-frontends/a8293.c                |    4 +-
 drivers/media/dvb-frontends/af9013.c               |    4 +-
 drivers/media/dvb-frontends/af9033.c               |    4 +-
 drivers/media/dvb-frontends/au8522_decoder.c       |    4 +-
 drivers/media/dvb-frontends/cxd2099.c              |    4 +-
 drivers/media/dvb-frontends/cxd2820r_core.c        |    4 +-
 drivers/media/dvb-frontends/dvb-pll.c              |   44 +-
 drivers/media/dvb-frontends/helene.c               |    4 +-
 drivers/media/dvb-frontends/lgdt3306a.c            |    4 +-
 drivers/media/dvb-frontends/lgdt330x.c             |    4 +-
 drivers/media/dvb-frontends/m88ds3103.c            |   10 +-
 drivers/media/dvb-frontends/mn88443x.c             |    8 +-
 drivers/media/dvb-frontends/mn88472.c              |    4 +-
 drivers/media/dvb-frontends/mn88473.c              |    4 +-
 drivers/media/dvb-frontends/mxl692.c               |    4 +-
 drivers/media/dvb-frontends/rtl2830.c              |    4 +-
 drivers/media/dvb-frontends/rtl2832.c              |    8 +-
 drivers/media/dvb-frontends/rtl2832_sdr.c          |   19 +-
 drivers/media/dvb-frontends/si2165.c               |    4 +-
 drivers/media/dvb-frontends/si2168.c               |    4 +-
 drivers/media/dvb-frontends/sp2.c                  |    4 +-
 drivers/media/dvb-frontends/stv090x.c              |    4 +-
 drivers/media/dvb-frontends/stv6110x.c             |    4 +-
 drivers/media/dvb-frontends/tc90522.c              |    6 +-
 drivers/media/dvb-frontends/tda10071.c             |    4 +-
 drivers/media/dvb-frontends/ts2020.c               |    6 +-
 drivers/media/i2c/Kconfig                          |   14 +-
 drivers/media/i2c/Makefile                         |    1 +
 drivers/media/i2c/ad5820.c                         |    4 +-
 drivers/media/i2c/adp1653.c                        |    2 +-
 drivers/media/i2c/adv7170.c                        |    4 +-
 drivers/media/i2c/adv7175.c                        |    4 +-
 drivers/media/i2c/adv7180.c                        |   24 +-
 drivers/media/i2c/adv7183.c                        |    4 +-
 drivers/media/i2c/adv7343.c                        |    4 +-
 drivers/media/i2c/adv7393.c                        |    4 +-
 drivers/media/i2c/adv7511-v4l2.c                   |    2 +-
 drivers/media/i2c/adv7604.c                        |   14 +-
 drivers/media/i2c/adv7842.c                        |    2 +-
 drivers/media/i2c/ak881x.c                         |    4 +-
 drivers/media/i2c/alvium-csi2.c                    |   21 +-
 drivers/media/i2c/bt819.c                          |    6 +-
 drivers/media/i2c/bt856.c                          |    2 +-
 drivers/media/i2c/bt866.c                          |    2 +-
 drivers/media/i2c/cs3308.c                         |    2 +-
 drivers/media/i2c/cs5345.c                         |    2 +-
 drivers/media/i2c/cs53l32a.c                       |    2 +-
 drivers/media/i2c/cvs/Kconfig                      |   21 +
 drivers/media/i2c/cvs/Makefile                     |    4 +
 drivers/media/i2c/cvs/core.c                       | 1043 ++++++++++
 drivers/media/i2c/cvs/icvs.h                       |  495 +++++
 drivers/media/i2c/cvs/v4l2.c                       |  618 ++++++
 drivers/media/i2c/cx25840/cx25840-core.c           |    2 +-
 drivers/media/i2c/ds90ub913.c                      |    4 +-
 drivers/media/i2c/ds90ub953.c                      |    6 +-
 drivers/media/i2c/ds90ub960.c                      |    8 +-
 drivers/media/i2c/dw9714.c                         |    2 +-
 drivers/media/i2c/dw9719.c                         |   10 +
 drivers/media/i2c/et8ek8/et8ek8_driver.c           |    2 +-
 drivers/media/i2c/imx219.c                         |   45 +-
 drivers/media/i2c/imx274.c                         |   60 +-
 drivers/media/i2c/imx334.c                         |   93 -
 drivers/media/i2c/imx335.c                         |   87 -
 drivers/media/i2c/imx412.c                         |   82 -
 drivers/media/i2c/ir-kbd-i2c.c                     |    6 +-
 drivers/media/i2c/isl7998x.c                       |    2 +-
 drivers/media/i2c/ks0127.c                         |    6 +-
 drivers/media/i2c/lm3560.c                         |  383 +++-
 drivers/media/i2c/lm3646.c                         |    4 +-
 drivers/media/i2c/m52790.c                         |    2 +-
 drivers/media/i2c/max2175.c                        |    4 +-
 drivers/media/i2c/ml86v7667.c                      |    4 +-
 drivers/media/i2c/msp3400-driver.c                 |    2 +-
 drivers/media/i2c/mt9m001.c                        |    2 +-
 drivers/media/i2c/mt9m111.c                        |    2 +-
 drivers/media/i2c/mt9p031.c                        |    3 +-
 drivers/media/i2c/mt9t112.c                        |    2 +-
 drivers/media/i2c/mt9v011.c                        |    2 +-
 drivers/media/i2c/ov13858.c                        |    4 +-
 drivers/media/i2c/ov13b10.c                        |   47 +-
 drivers/media/i2c/ov2640.c                         |    2 +-
 drivers/media/i2c/ov2659.c                         |    2 +-
 drivers/media/i2c/ov5640.c                         |    4 +-
 drivers/media/i2c/ov5645.c                         |    4 +-
 drivers/media/i2c/ov5647.c                         |    2 +-
 drivers/media/i2c/ov7640.c                         |    2 +-
 drivers/media/i2c/ov7670.c                         |    4 +-
 drivers/media/i2c/ov772x.c                         |    2 +-
 drivers/media/i2c/ov7740.c                         |    2 +-
 drivers/media/i2c/ov9282.c                         |   67 -
 drivers/media/i2c/ov9640.c                         |    2 +-
 drivers/media/i2c/ov9650.c                         |    4 +-
 drivers/media/i2c/rj54n1cb0c.c                     |    2 +-
 drivers/media/i2c/s5c73m3/s5c73m3-core.c           |    2 +-
 drivers/media/i2c/s5k5baf.c                        |    2 +-
 drivers/media/i2c/saa6588.c                        |    2 +-
 drivers/media/i2c/saa6752hs.c                      |    2 +-
 drivers/media/i2c/saa7110.c                        |    2 +-
 drivers/media/i2c/saa7115.c                        |   14 +-
 drivers/media/i2c/saa7127.c                        |   10 +-
 drivers/media/i2c/saa717x.c                        |    2 +-
 drivers/media/i2c/saa7185.c                        |    2 +-
 drivers/media/i2c/sony-btf-mpx.c                   |    2 +-
 drivers/media/i2c/tc358743.c                       |    4 +-
 drivers/media/i2c/tda1997x.c                       |    6 +-
 drivers/media/i2c/tda7432.c                        |    2 +-
 drivers/media/i2c/tda9840.c                        |    2 +-
 drivers/media/i2c/tea6415c.c                       |    2 +-
 drivers/media/i2c/tea6420.c                        |    2 +-
 drivers/media/i2c/ths7303.c                        |    6 +-
 drivers/media/i2c/ths8200.c                        |    4 +-
 drivers/media/i2c/tlv320aic23b.c                   |    2 +-
 drivers/media/i2c/tvaudio.c                        |    2 +-
 drivers/media/i2c/tvp514x.c                        |   63 +-
 drivers/media/i2c/tvp5150.c                        |    2 +-
 drivers/media/i2c/tvp7002.c                        |    2 +-
 drivers/media/i2c/tw2804.c                         |    2 +-
 drivers/media/i2c/tw9900.c                         |    2 +-
 drivers/media/i2c/tw9903.c                         |    2 +-
 drivers/media/i2c/tw9906.c                         |    2 +-
 drivers/media/i2c/tw9910.c                         |    2 +-
 drivers/media/i2c/uda1342.c                        |    2 +-
 drivers/media/i2c/upd64031a.c                      |    2 +-
 drivers/media/i2c/upd64083.c                       |    2 +-
 drivers/media/i2c/video-i2c.c                      |   13 +-
 drivers/media/i2c/vp27smpx.c                       |    2 +-
 drivers/media/i2c/vpx3220.c                        |    6 +-
 drivers/media/i2c/wm8739.c                         |    2 +-
 drivers/media/i2c/wm8775.c                         |    2 +-
 drivers/media/pci/Kconfig                          |    1 +
 drivers/media/pci/Makefile                         |    1 +
 drivers/media/pci/cx23885/cx23885-core.c           |   14 +-
 drivers/media/pci/dm1105/dm1105.c                  |    8 +-
 drivers/media/pci/hws/Kconfig                      |   11 +
 drivers/media/pci/hws/Makefile                     |    4 +
 drivers/media/pci/hws/hws.h                        |  173 ++
 drivers/media/pci/hws/hws_irq.c                    |  269 +++
 drivers/media/pci/hws/hws_irq.h                    |   10 +
 drivers/media/pci/hws/hws_pci.c                    |  865 +++++++++
 drivers/media/pci/hws/hws_reg.h                    |  136 ++
 drivers/media/pci/hws/hws_v4l2_ioctl.c             |  919 +++++++++
 drivers/media/pci/hws/hws_v4l2_ioctl.h             |   36 +
 drivers/media/pci/hws/hws_video.c                  | 1490 +++++++++++++++
 drivers/media/pci/hws/hws_video.h                  |   29 +
 drivers/media/pci/intel/ipu-bridge.c               |   13 +-
 drivers/media/pci/intel/ipu6/ipu6-isys-dwc-phy.c   |   26 +-
 drivers/media/pci/ivtv/ivtv-ioctl.c                |   12 +-
 drivers/media/pci/mgb4/mgb4_vin.c                  |    8 +-
 drivers/media/pci/mgb4/mgb4_vout.c                 |    8 +-
 drivers/media/pci/saa7134/saa7134-video.c          |   25 +-
 drivers/media/pci/solo6x10/Kconfig                 |    1 -
 drivers/media/platform/Kconfig                     |    1 +
 drivers/media/platform/Makefile                    |    1 +
 drivers/media/platform/amd/Kconfig                 |    3 +
 drivers/media/platform/amd/Makefile                |    3 +
 drivers/media/platform/amd/isp4/Kconfig            |   17 +
 drivers/media/platform/amd/isp4/Makefile           |   10 +
 drivers/media/platform/amd/isp4/isp4.c             |  240 +++
 drivers/media/platform/amd/isp4/isp4.h             |   20 +
 drivers/media/platform/amd/isp4/isp4_debug.c       |  271 +++
 drivers/media/platform/amd/isp4/isp4_debug.h       |   41 +
 drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h |  318 ++++
 drivers/media/platform/amd/isp4/isp4_hw_reg.h      |  124 ++
 drivers/media/platform/amd/isp4/isp4_interface.c   |  832 ++++++++
 drivers/media/platform/amd/isp4/isp4_interface.h   |  144 ++
 drivers/media/platform/amd/isp4/isp4_subdev.c      | 1047 ++++++++++
 drivers/media/platform/amd/isp4/isp4_subdev.h      |  127 ++
 drivers/media/platform/amd/isp4/isp4_video.c       |  797 ++++++++
 drivers/media/platform/amd/isp4/isp4_video.h       |   57 +
 .../media/platform/amlogic/c3/isp/c3-isp-params.c  |    4 +
 .../media/platform/arm/mali-c55/mali-c55-core.c    |   24 +-
 drivers/media/platform/arm/mali-c55/mali-c55-isp.c |    8 +
 .../media/platform/arm/mali-c55/mali-c55-resizer.c |    1 +
 drivers/media/platform/arm/mali-c55/mali-c55-tpg.c |    1 +
 drivers/media/platform/aspeed/aspeed-video.c       |    1 +
 drivers/media/platform/cadence/Kconfig             |    1 +
 drivers/media/platform/cadence/cdns-csi2rx.c       |  449 +++--
 .../platform/chips-media/wave5/wave5-helper.c      |    4 +-
 .../platform/chips-media/wave5/wave5-helper.h      |    2 +-
 .../media/platform/chips-media/wave5/wave5-hw.c    |    7 +-
 .../platform/chips-media/wave5/wave5-vpu-dec.c     |   47 +-
 .../platform/chips-media/wave5/wave5-vpu-enc.c     |   73 +-
 .../platform/chips-media/wave5/wave5-vpuapi.c      |   11 +-
 .../platform/chips-media/wave5/wave5-vpuapi.h      |    2 +
 drivers/media/platform/marvell/cafe-driver.c       |    1 +
 .../media/platform/mediatek/jpeg/mtk_jpeg_core.c   |    3 +-
 drivers/media/platform/nuvoton/npcm-video.c        |   34 +-
 drivers/media/platform/nvidia/tegra-vde/Kconfig    |    1 +
 .../media/platform/nxp/imx8-isi/imx8-isi-core.c    |    4 +-
 .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |   16 +
 .../platform/nxp/imx8-isi/imx8-isi-crossbar.c      |    1 +
 drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c  |    9 +-
 drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c |   11 +-
 .../media/platform/nxp/imx8-isi/imx8-isi-pipe.c    |   20 +-
 .../media/platform/nxp/imx8-isi/imx8-isi-video.c   |    6 +-
 drivers/media/platform/qcom/camss/Makefile         |   12 +-
 drivers/media/platform/qcom/camss/camss-csid-340.c |   87 +-
 drivers/media/platform/qcom/camss/camss-csid-680.c |   44 +-
 .../media/platform/qcom/camss/camss-csid-gen2.c    |   47 +-
 .../media/platform/qcom/camss/camss-csid-gen3.c    |   48 +-
 drivers/media/platform/qcom/camss/camss-csid.c     |   45 +-
 drivers/media/platform/qcom/camss/camss-csid.h     |    1 +
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     |  125 ++
 drivers/media/platform/qcom/camss/camss-csiphy.c   |   11 +-
 drivers/media/platform/qcom/camss/camss-csiphy.h   |    2 +
 drivers/media/platform/qcom/camss/camss-format.c   |   14 +
 drivers/media/platform/qcom/camss/camss-format.h   |    1 +
 drivers/media/platform/qcom/camss/camss-tpg-gen1.c |  231 +++
 drivers/media/platform/qcom/camss/camss-tpg.c      |  519 +++++
 drivers/media/platform/qcom/camss/camss-tpg.h      |  118 ++
 drivers/media/platform/qcom/camss/camss-vfe-340.c  |  152 +-
 drivers/media/platform/qcom/camss/camss-vfe.c      |   31 +-
 drivers/media/platform/qcom/camss/camss-video.c    |   19 +-
 drivers/media/platform/qcom/camss/camss.c          |  513 ++++-
 drivers/media/platform/qcom/camss/camss.h          |    6 +
 drivers/media/platform/qcom/iris/Kconfig           |    1 +
 drivers/media/platform/qcom/iris/Makefile          |    9 +-
 drivers/media/platform/qcom/iris/iris_buffer.c     |  283 ++-
 drivers/media/platform/qcom/iris/iris_common.c     |    8 +-
 drivers/media/platform/qcom/iris/iris_core.c       |    5 +-
 drivers/media/platform/qcom/iris/iris_core.h       |   14 +-
 drivers/media/platform/qcom/iris/iris_ctrls.c      |  539 +++++-
 drivers/media/platform/qcom/iris/iris_ctrls.h      |   16 +-
 drivers/media/platform/qcom/iris/iris_firmware.c   |   13 +-
 drivers/media/platform/qcom/iris/iris_hfi_common.c |    6 +-
 drivers/media/platform/qcom/iris/iris_hfi_common.h |   13 +-
 .../iris/{iris_platform_gen1.c =3D> iris_hfi_gen1.c} |  325 ++--
 drivers/media/platform/qcom/iris/iris_hfi_gen1.h   |    6 +-
 .../platform/qcom/iris/iris_hfi_gen1_command.c     |  141 +-
 .../platform/qcom/iris/iris_hfi_gen1_defines.h     |   49 +
 .../platform/qcom/iris/iris_hfi_gen1_response.c    |   11 +-
 .../iris/{iris_platform_gen2.c =3D> iris_hfi_gen2.c} |  657 +++----
 drivers/media/platform/qcom/iris/iris_hfi_gen2.h   |    5 +-
 .../platform/qcom/iris/iris_hfi_gen2_command.c     |  209 +-
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |   19 +
 .../platform/qcom/iris/iris_hfi_gen2_packet.c      |   18 +-
 .../platform/qcom/iris/iris_hfi_gen2_response.c    |   48 +-
 drivers/media/platform/qcom/iris/iris_instance.h   |   19 +-
 .../platform/qcom/iris/iris_platform_common.h      |  140 +-
 .../platform/qcom/iris/iris_platform_qcs8300.h     |    1 -
 .../platform/qcom/iris/iris_platform_sm8250.h      |   29 +
 .../platform/qcom/iris/iris_platform_sm8550.h      |   30 +
 .../media/platform/qcom/iris/iris_platform_vpu2.c  |  123 ++
 .../media/platform/qcom/iris/iris_platform_vpu3x.c |  249 +++
 .../platform/qcom/iris/iris_platform_x1p42100.h    |   22 +
 drivers/media/platform/qcom/iris/iris_probe.c      |   28 +-
 drivers/media/platform/qcom/iris/iris_utils.c      |   21 +-
 drivers/media/platform/qcom/iris/iris_utils.h      |    2 +
 drivers/media/platform/qcom/iris/iris_vb2.c        |    2 +-
 drivers/media/platform/qcom/iris/iris_vdec.c       |  142 +-
 drivers/media/platform/qcom/iris/iris_venc.c       |  100 +-
 drivers/media/platform/qcom/iris/iris_vidc.c       |   14 +-
 drivers/media/platform/qcom/iris/iris_vpu2.c       |    2 +-
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c |   87 +-
 drivers/media/platform/qcom/iris/iris_vpu_common.c |   26 +-
 drivers/media/platform/qcom/iris/iris_vpu_common.h |    2 +
 drivers/media/platform/qcom/venus/core.c           |   58 +-
 drivers/media/platform/qcom/venus/core.h           |   17 +
 drivers/media/platform/qcom/venus/helpers.c        |    4 +-
 drivers/media/platform/qcom/venus/hfi_parser.c     |   16 +-
 drivers/media/platform/qcom/venus/hfi_platform.c   |   24 -
 drivers/media/platform/qcom/venus/hfi_platform.h   |    2 -
 .../media/platform/qcom/venus/hfi_platform_v4.c    |   20 +-
 .../media/platform/qcom/venus/hfi_platform_v6.c    |   16 +-
 drivers/media/platform/qcom/venus/pm_helpers.c     |  154 +-
 drivers/media/platform/renesas/rcar-vin/rcar-dma.c |    1 -
 .../platform/renesas/rzg2l-cru/rzg2l-cru-regs.h    |    4 +-
 .../media/platform/renesas/rzg2l-cru/rzg2l-cru.h   |   29 +-
 .../media/platform/renesas/rzg2l-cru/rzg2l-video.c |  326 ++--
 .../platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c   |   31 +-
 drivers/media/platform/renesas/vsp1/vsp1_brx.c     |   33 +-
 drivers/media/platform/renesas/vsp1/vsp1_clu.c     |   15 +-
 drivers/media/platform/renesas/vsp1/vsp1_dl.c      |   63 +-
 drivers/media/platform/renesas/vsp1/vsp1_drm.c     |  257 +--
 drivers/media/platform/renesas/vsp1/vsp1_entity.c  |   27 +-
 drivers/media/platform/renesas/vsp1/vsp1_hgo.c     |   10 +-
 drivers/media/platform/renesas/vsp1/vsp1_hgt.c     |   16 +-
 drivers/media/platform/renesas/vsp1/vsp1_histo.c   |   55 +-
 drivers/media/platform/renesas/vsp1/vsp1_hsit.c    |   15 +-
 drivers/media/platform/renesas/vsp1/vsp1_lut.c     |   15 +-
 drivers/media/platform/renesas/vsp1/vsp1_pipe.c    |   60 +-
 drivers/media/platform/renesas/vsp1/vsp1_rwpf.c    |   44 +-
 drivers/media/platform/renesas/vsp1/vsp1_sru.c     |   13 +-
 drivers/media/platform/renesas/vsp1/vsp1_uds.c     |   13 +-
 drivers/media/platform/renesas/vsp1/vsp1_uif.c     |   29 +-
 drivers/media/platform/renesas/vsp1/vsp1_video.c   |  157 +-
 drivers/media/platform/renesas/vsp1/vsp1_wpf.c     |   30 +-
 drivers/media/platform/rockchip/rga/Kconfig        |    1 +
 drivers/media/platform/rockchip/rga/Makefile       |    2 +-
 drivers/media/platform/rockchip/rga/rga-buf.c      |   89 +-
 drivers/media/platform/rockchip/rga/rga-hw.c       |  357 +++-
 drivers/media/platform/rockchip/rga/rga-hw.h       |   16 +-
 drivers/media/platform/rockchip/rga/rga.c          |  576 +++---
 drivers/media/platform/rockchip/rga/rga.h          |   88 +-
 drivers/media/platform/rockchip/rga/rga3-hw.c      |  507 +++++
 drivers/media/platform/rockchip/rga/rga3-hw.h      |  192 ++
 .../platform/rockchip/rkcif/rkcif-capture-mipi.c   |  148 +-
 .../platform/rockchip/rkcif/rkcif-capture-mipi.h   |    1 +
 .../media/platform/rockchip/rkcif/rkcif-common.h   |    2 +-
 drivers/media/platform/rockchip/rkcif/rkcif-dev.c  |   18 +
 .../media/platform/rockchip/rkisp1/rkisp1-params.c |   68 +
 .../media/platform/rockchip/rkisp1/rkisp1-regs.h   |   15 +-
 .../platform/rockchip/rkvdec/rkvdec-bitwriter.h    |   39 +
 .../platform/rockchip/rkvdec/rkvdec-h264-common.c  |   51 +-
 .../platform/rockchip/rkvdec/rkvdec-h264-common.h  |   40 +-
 .../media/platform/rockchip/rkvdec/rkvdec-h264.c   |  109 +-
 .../platform/rockchip/rkvdec/rkvdec-hevc-common.c  |   93 +-
 .../platform/rockchip/rkvdec/rkvdec-hevc-common.h  |   57 +-
 .../media/platform/rockchip/rkvdec/rkvdec-hevc.c   |  171 +-
 .../platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c |  351 ++--
 .../platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c |  502 +++--
 drivers/media/platform/st/stm32/stm32-dcmi.c       |    1 +
 .../st/stm32/stm32-dcmipp/dcmipp-bytecap.c         |    6 +-
 drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c |    6 +-
 drivers/media/platform/synopsys/dw-mipi-csi2rx.c   |  128 +-
 .../media/platform/synopsys/hdmirx/snps_hdmirx.c   |    4 +-
 drivers/media/platform/ti/Kconfig                  |    1 +
 drivers/media/platform/ti/davinci/vpif_capture.c   |    2 +-
 .../media/platform/ti/j721e-csi2rx/j721e-csi2rx.c  | 1217 +++++++++---
 drivers/media/platform/ti/vpe/vip.c                |   16 +-
 drivers/media/platform/ti/vpe/vpe.c                |    3 +-
 drivers/media/platform/verisilicon/hantro_hw.h     |    1 -
 drivers/media/platform/verisilicon/hantro_v4l2.c   |    6 +-
 drivers/media/radio/radio-si476x.c                 |    1 +
 drivers/media/radio/radio-tea5764.c                |    2 +-
 drivers/media/radio/saa7706h.c                     |    4 +-
 drivers/media/radio/si470x/radio-si470x-i2c.c      |    2 +-
 drivers/media/radio/si470x/radio-si470x-usb.c      |   11 +-
 drivers/media/radio/si4713/si4713.c                |    2 +-
 drivers/media/radio/tef6862.c                      |    4 +-
 drivers/media/rc/imon.c                            |    4 +
 drivers/media/rc/imon_raw.c                        |   18 +-
 drivers/media/rc/ir_toy.c                          |   23 +-
 drivers/media/rc/mceusb.c                          |    2 +
 drivers/media/test-drivers/vidtv/vidtv_bridge.c    |    4 +-
 drivers/media/test-drivers/vidtv/vidtv_demod.c     |    4 +-
 drivers/media/test-drivers/vidtv/vidtv_mux.c       |    8 +-
 drivers/media/test-drivers/vidtv/vidtv_tuner.c     |    4 +-
 drivers/media/test-drivers/vimc/vimc-core.c        |    1 +
 drivers/media/test-drivers/visl/visl-core.c        |    4 +
 drivers/media/test-drivers/vivid/vivid-core.c      |    6 +-
 drivers/media/test-drivers/vivid/vivid-ctrls.c     |   15 +-
 drivers/media/test-drivers/vivid/vivid-vid-cap.c   |   38 +-
 drivers/media/test-drivers/vivid/vivid-vid-cap.h   |    1 +
 drivers/media/test-drivers/vivid/vivid-vid-out.c   |    6 +
 drivers/media/tuners/e4000.c                       |    4 +-
 drivers/media/tuners/fc2580.c                      |    4 +-
 drivers/media/tuners/m88rs6000t.c                  |    4 +-
 drivers/media/tuners/mt2060.c                      |    4 +-
 drivers/media/tuners/mxl301rf.c                    |    4 +-
 drivers/media/tuners/qm1d1b0004.c                  |    4 +-
 drivers/media/tuners/qm1d1c0042.c                  |    4 +-
 drivers/media/tuners/si2157.c                      |   10 +-
 drivers/media/tuners/tda18212.c                    |    4 +-
 drivers/media/tuners/tda18250.c                    |    4 +-
 drivers/media/tuners/tua9001.c                     |    4 +-
 drivers/media/usb/airspy/airspy.c                  |    8 +-
 drivers/media/usb/cx231xx/cx231xx-cards.c          |   16 +-
 drivers/media/usb/em28xx/em28xx-video.c            |    4 +-
 drivers/media/usb/go7007/s2250-board.c             |    2 +-
 drivers/media/usb/gspca/gspca.c                    |   17 +-
 drivers/media/usb/gspca/sonixb.c                   |    2 +-
 drivers/media/usb/gspca/touptek.c                  |   17 +-
 drivers/media/usb/hdpvr/hdpvr-core.c               |   26 +-
 drivers/media/usb/msi2500/msi2500.c                |   32 +-
 drivers/media/usb/pwc/pwc-if.c                     |   13 +-
 drivers/media/usb/s2255/s2255drv.c                 |   12 +-
 drivers/media/usb/uvc/uvc_ctrl.c                   |  212 +++
 drivers/media/usb/uvc/uvc_driver.c                 |    4 +
 drivers/media/usb/uvc/uvc_status.c                 |   28 +-
 drivers/media/usb/uvc/uvc_v4l2.c                   |   11 +
 drivers/media/usb/uvc/uvc_video.c                  |  204 +-
 drivers/media/usb/uvc/uvcvideo.h                   |    5 +-
 drivers/media/v4l2-core/tuner-core.c               |    2 +-
 drivers/media/v4l2-core/v4l2-common.c              |  147 +-
 drivers/media/v4l2-core/v4l2-ctrls-core.c          |   13 +
 drivers/media/v4l2-core/v4l2-ctrls-defs.c          |    2 +
 drivers/media/v4l2-core/v4l2-ctrls-request.c       |   14 +-
 drivers/media/v4l2-core/v4l2-dev.c                 |    5 +
 drivers/media/v4l2-core/v4l2-fwnode.c              |    6 +-
 drivers/media/v4l2-core/v4l2-subdev.c              |   43 +-
 .../x86/intel/int3472/tps68470_board_data.c        |  158 +-
 drivers/staging/media/Kconfig                      |    4 -
 drivers/staging/media/Makefile                     |    1 -
 drivers/staging/media/atomisp/i2c/atomisp-gc2235.c |   31 +-
 drivers/staging/media/atomisp/i2c/ov2722.h         |  649 +------
 .../staging/media/atomisp/include/linux/atomisp.h  |  182 +-
 .../atomisp/include/linux/atomisp_gmin_platform.h  |    7 +-
 .../media/atomisp/include/linux/atomisp_platform.h |   42 +-
 drivers/staging/media/atomisp/pci/atomisp_cmd.c    |  202 +-
 drivers/staging/media/atomisp/pci/atomisp_cmd.h    |    2 +-
 .../media/atomisp/pci/atomisp_compat_css20.c       |   26 +-
 .../media/atomisp/pci/atomisp_compat_css20.h       |    2 +-
 .../media/atomisp/pci/atomisp_csi2_bridge.c        |    2 +-
 .../media/atomisp/pci/atomisp_gmin_platform.c      |    6 +-
 drivers/staging/media/atomisp/pci/atomisp_subdev.c |   20 +-
 drivers/staging/media/atomisp/pci/atomisp_subdev.h |   12 +-
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c   |    5 +-
 .../pci/base/circbuf/interface/ia_css_circbuf.h    |    9 +-
 .../base/circbuf/interface/ia_css_circbuf_desc.h   |   11 +-
 .../media/atomisp/pci/base/refcount/src/refcount.c |    3 +-
 .../atomisp/pci/camera/pipe/src/pipe_stagedesc.c   |    9 +-
 .../media/atomisp/pci/camera/pipe/src/pipe_util.c  |    3 +-
 .../host/isys_stream2mmio_private.h                |    3 +-
 .../hive_isp_css_common/host/event_fifo_private.h  |    3 +-
 .../atomisp/pci/hive_isp_css_common/host/gdc.c     |   22 +-
 .../pci/hive_isp_css_common/host/input_formatter.c |    3 +-
 .../pci/hive_isp_css_common/host/input_system.c    |   14 +-
 .../atomisp/pci/hive_isp_css_common/host/irq.c     |   30 +-
 .../atomisp/pci/hive_isp_css_common/host/mmu.c     |    3 +-
 .../atomisp/pci/hive_isp_css_common/host/vmem.c    |    4 +-
 .../pci/hive_isp_css_include/host/mmu_public.h     |   87 +-
 .../pci/hive_isp_css_include/math_support.h        |    6 -
 drivers/staging/media/atomisp/pci/hmm/hmm_bo.c     |   27 +-
 drivers/staging/media/atomisp/pci/ia_css_types.h   |   14 +-
 .../pci/isp/kernels/aa/aa_2/ia_css_aa2_types.h     |    8 +-
 .../pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c  |   26 +-
 .../pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.h  |   20 +-
 .../pci/isp/kernels/anr/anr_2/ia_css_anr2.host.c   |   17 +-
 .../pci/isp/kernels/anr/anr_2/ia_css_anr2.host.h   |   13 +-
 .../pci/isp/kernels/bh/bh_2/ia_css_bh.host.c       |   14 +-
 .../pci/isp/kernels/bh/bh_2/ia_css_bh.host.h       |   14 +-
 .../pci/isp/kernels/bnlm/ia_css_bnlm.host.c        |    6 +-
 .../pci/isp/kernels/ctc/ctc2/ia_css_ctc2.host.c    |    7 +-
 .../pci/isp/kernels/dvs/dvs_1.0/ia_css_dvs.host.c  |   14 +-
 .../pci/isp/kernels/eed1_8/ia_css_eed1_8.host.c    |   13 +-
 .../pci/isp/kernels/raw/raw_1.0/ia_css_raw.host.c  |    7 +-
 .../pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c  |    3 +-
 .../isp/kernels/sdis/sdis_1.0/ia_css_sdis.host.c   |    6 +-
 .../isp/kernels/sdis/sdis_2/ia_css_sdis2.host.c    |   13 +-
 .../pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c     |   25 +-
 .../media/atomisp/pci/runtime/binary/src/binary.c  |  114 +-
 .../atomisp/pci/runtime/debug/src/ia_css_debug.c   |   17 +-
 .../atomisp/pci/runtime/isp_param/src/isp_param.c  |   24 +-
 .../atomisp/pci/runtime/isys/src/virtual_isys.c    |    3 +-
 .../atomisp/pci/runtime/pipeline/src/pipeline.c    |    3 +-
 .../media/atomisp/pci/runtime/queue/src/queue.c    |    4 +-
 drivers/staging/media/atomisp/pci/sh_css.c         |  158 +-
 .../staging/media/atomisp/pci/sh_css_firmware.c    |    6 +-
 .../staging/media/atomisp/pci/sh_css_param_dvs.c   |   12 +-
 .../media/atomisp/pci/sh_css_param_shading.c       |   22 +-
 drivers/staging/media/atomisp/pci/sh_css_params.c  |   74 +-
 drivers/staging/media/atomisp/pci/sh_css_sp.c      |   41 +-
 drivers/staging/media/atomisp/pci/system_local.c   |    3 +-
 drivers/staging/media/av7110/av7110.c              |   49 +-
 drivers/staging/media/av7110/av7110.h              |    4 +-
 drivers/staging/media/av7110/av7110_av.c           |   89 +-
 drivers/staging/media/av7110/av7110_ca.c           |    3 +-
 drivers/staging/media/av7110/av7110_hw.c           |   46 -
 drivers/staging/media/av7110/av7110_hw.h           |   71 +-
 drivers/staging/media/av7110/av7110_ir.c           |    4 +-
 drivers/staging/media/av7110/av7110_v4l.c          |   22 +-
 drivers/staging/media/deprecated/atmel/Kconfig     |   47 -
 drivers/staging/media/deprecated/atmel/Makefile    |    8 -
 drivers/staging/media/deprecated/atmel/TODO        |   34 -
 .../media/deprecated/atmel/atmel-isc-base.c        | 2008 ----------------=
----
 .../staging/media/deprecated/atmel/atmel-isc-clk.c |  311 ---
 .../media/deprecated/atmel/atmel-isc-regs.h        |  413 ----
 drivers/staging/media/deprecated/atmel/atmel-isc.h |  362 ----
 .../media/deprecated/atmel/atmel-sama5d2-isc.c     |  644 -------
 .../media/deprecated/atmel/atmel-sama7g5-isc.c     |  607 ------
 drivers/staging/media/imx/imx-media-capture.c      |    8 +-
 drivers/staging/media/imx/imx-media-utils.c        |   16 +-
 drivers/staging/media/imx/imx-media.h              |    7 +-
 drivers/staging/media/ipu3/ipu3-css-params.c       |    8 +-
 drivers/staging/media/ipu7/abi/ipu7_fw_boot_abi.h  |   78 +-
 .../staging/media/ipu7/abi/ipu7_fw_common_abi.h    |    4 +-
 drivers/staging/media/ipu7/abi/ipu7_fw_msg_abi.h   |   12 +-
 drivers/staging/media/ipu7/ipu7-buttress-regs.h    |   10 +-
 drivers/staging/media/ipu7/ipu7.c                  |   22 +-
 drivers/staging/media/meson/vdec/codec_h264.c      |    2 +-
 drivers/staging/media/meson/vdec/codec_mpeg12.c    |    2 +-
 drivers/staging/media/meson/vdec/vdec.c            |    4 +-
 drivers/staging/media/sunxi/cedrus/cedrus.c        |   10 +-
 drivers/staging/media/sunxi/cedrus/cedrus_h264.c   |    3 +
 drivers/staging/media/tegra-video/tegra210.c       |    3 +-
 drivers/staging/media/tegra-video/vi.c             |    4 +-
 include/linux/usb/uvc.h                            |   10 +
 include/media/i2c/lm3560.h                         |   84 -
 include/media/media-entity.h                       |   10 +-
 include/media/v4l2-async.h                         |    4 +-
 include/media/v4l2-common.h                        |    6 +
 include/media/videobuf2-core.h                     |    8 +-
 include/media/vsp1.h                               |    5 +-
 include/uapi/linux/cec-funcs.h                     |  182 ++
 include/uapi/linux/cec.h                           |   31 +-
 include/uapi/linux/rkisp1-config.h                 |  113 +-
 include/uapi/linux/v4l2-controls.h                 |    2 +
 523 files changed, 22887 insertions(+), 11395 deletions(-)
 create mode 100644 Documentation/admin-guide/media/amdisp4-1.rst
 create mode 100644 Documentation/admin-guide/media/amdisp4.dot
 create mode 100644 Documentation/admin-guide/media/rkcif-rk3588-vicap.dot
 create mode 100644 Documentation/devicetree/bindings/media/qcom,msm8939-ve=
nus.yaml
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sm6350-cam=
ss.yaml
 create mode 100644 drivers/media/i2c/cvs/Kconfig
 create mode 100644 drivers/media/i2c/cvs/Makefile
 create mode 100644 drivers/media/i2c/cvs/core.c
 create mode 100644 drivers/media/i2c/cvs/icvs.h
 create mode 100644 drivers/media/i2c/cvs/v4l2.c
 create mode 100644 drivers/media/pci/hws/Kconfig
 create mode 100644 drivers/media/pci/hws/Makefile
 create mode 100644 drivers/media/pci/hws/hws.h
 create mode 100644 drivers/media/pci/hws/hws_irq.c
 create mode 100644 drivers/media/pci/hws/hws_irq.h
 create mode 100644 drivers/media/pci/hws/hws_pci.c
 create mode 100644 drivers/media/pci/hws/hws_reg.h
 create mode 100644 drivers/media/pci/hws/hws_v4l2_ioctl.c
 create mode 100644 drivers/media/pci/hws/hws_v4l2_ioctl.h
 create mode 100644 drivers/media/pci/hws/hws_video.c
 create mode 100644 drivers/media/pci/hws/hws_video.h
 create mode 100644 drivers/media/platform/amd/Kconfig
 create mode 100644 drivers/media/platform/amd/Makefile
 create mode 100644 drivers/media/platform/amd/isp4/Kconfig
 create mode 100644 drivers/media/platform/amd/isp4/Makefile
 create mode 100644 drivers/media/platform/amd/isp4/isp4.c
 create mode 100644 drivers/media/platform/amd/isp4/isp4.h
 create mode 100644 drivers/media/platform/amd/isp4/isp4_debug.c
 create mode 100644 drivers/media/platform/amd/isp4/isp4_debug.h
 create mode 100644 drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h
 create mode 100644 drivers/media/platform/amd/isp4/isp4_hw_reg.h
 create mode 100644 drivers/media/platform/amd/isp4/isp4_interface.c
 create mode 100644 drivers/media/platform/amd/isp4/isp4_interface.h
 create mode 100644 drivers/media/platform/amd/isp4/isp4_subdev.c
 create mode 100644 drivers/media/platform/amd/isp4/isp4_subdev.h
 create mode 100644 drivers/media/platform/amd/isp4/isp4_video.c
 create mode 100644 drivers/media/platform/amd/isp4/isp4_video.h
 create mode 100644 drivers/media/platform/qcom/camss/camss-tpg-gen1.c
 create mode 100644 drivers/media/platform/qcom/camss/camss-tpg.c
 create mode 100644 drivers/media/platform/qcom/camss/camss-tpg.h
 rename drivers/media/platform/qcom/iris/{iris_platform_gen1.c =3D> iris_hf=
i_gen1.c} (60%)
 rename drivers/media/platform/qcom/iris/{iris_platform_gen2.c =3D> iris_hf=
i_gen2.c} (59%)
 create mode 100644 drivers/media/platform/qcom/iris/iris_platform_sm8250.h
 create mode 100644 drivers/media/platform/qcom/iris/iris_platform_sm8550.h
 create mode 100644 drivers/media/platform/qcom/iris/iris_platform_vpu2.c
 create mode 100644 drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
 create mode 100644 drivers/media/platform/qcom/iris/iris_platform_x1p42100=
.h
 create mode 100644 drivers/media/platform/rockchip/rga/rga3-hw.c
 create mode 100644 drivers/media/platform/rockchip/rga/rga3-hw.h
 create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-bitwriter=
.h
 delete mode 100644 drivers/staging/media/deprecated/atmel/Kconfig
 delete mode 100644 drivers/staging/media/deprecated/atmel/Makefile
 delete mode 100644 drivers/staging/media/deprecated/atmel/TODO
 delete mode 100644 drivers/staging/media/deprecated/atmel/atmel-isc-base.c
 delete mode 100644 drivers/staging/media/deprecated/atmel/atmel-isc-clk.c
 delete mode 100644 drivers/staging/media/deprecated/atmel/atmel-isc-regs.h
 delete mode 100644 drivers/staging/media/deprecated/atmel/atmel-isc.h
 delete mode 100644 drivers/staging/media/deprecated/atmel/atmel-sama5d2-is=
c.c
 delete mode 100644 drivers/staging/media/deprecated/atmel/atmel-sama7g5-is=
c.c
 delete mode 100644 include/media/i2c/lm3560.h

