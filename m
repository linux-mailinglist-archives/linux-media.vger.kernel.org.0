Return-Path: <linux-media+bounces-59815-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8I2EIHJ78GnMTwEAu9opvQ
	(envelope-from <linux-media+bounces-59815-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 11:18:42 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EB98748132E
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 11:18:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8DBC730FF0E0
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 09:05:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 804DD3DA5CF;
	Tue, 28 Apr 2026 09:01:23 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 802793F23D0
	for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 09:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777366883; cv=none; b=ap2P4OsufxWp3KVoKRLQhKp9nO66Ec1G4Y8sQzsj2Ui37Oa+Q7mfu6/94feMqtzSr5QUHT64BG+1UEeHWFuXDtHYFSGJCedRv8wvMZfuEAb75GRRMEU1bGJDzVCWPMVyvA7VvMQ6H0YXHyGpikG2IHU0IjmybLkeYxzEvXvWfIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777366883; c=relaxed/simple;
	bh=bS3TLNSJnwhL7S0Q1umoEt4VYf26k0U96R/FOq8RVnU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ka9A4Y+81UT8yyCNWQ5Xy4MrXP3iNCaq3YmZPCKAgIcHiffeQrl63p4QRt2LWPwurQBOrEx7SEoGICdev3U2R9CI8Hvr114Xkcn1bI/UViNPvcvJdb61rsEltJrdvYFdeVAXQxKLx6lSkoTzNspdILAQmC/p7zTX0XB0Li7eucY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1wHeJ7-0004Lz-Aw; Tue, 28 Apr 2026 11:00:41 +0200
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Subject: [PATCH v5 00/29] media: platform: rga: Add RGA3 support
Date: Tue, 28 Apr 2026 11:00:35 +0200
Message-Id: <20260428-spu-rga3-v5-0-eb7f5d019d86@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22Qy26DMBAAfwX5XLfrN3Dqf1Q9GLMhPvCobRBVl
 H+vIYpAao5r7czKcyMRg8dI6uJGAi4++nHIg3oriLvaoUPq2zwTDlwxAEbjNNPQWUFLC4DAyoZ
 xIHl9Cnjx6676+s7z1cc0ht/dvLDt9Skxh2RhFKjQti2VMiCBf044dHMK4+DX9xbJZlr4QXMQJ
 5pnuiorq00lzcWwl7R40hoYP98WmTam4UaANg02L2l50IKrEy0zjRWgY04zoeQ/+v6IEvBnzln
 To8xRtS72DzGud6kf+35u09aQuhac4lI6I22d22VRYyNSl3d8qoseW28/BlxTvnL/AwLwIi3EA
 QAA
X-Change-ID: 20251001-spu-rga3-8a00e018b120
To: Jacob Chen <jacob-chen@iotwrt.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@pengutronix.de, nicolas@ndufresne.ca, 
 sebastian.reichel@collabora.com, 
 =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Michael Olbrich <m.olbrich@pengutronix.de>
X-Mailer: b4 0.15.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Rspamd-Queue-Id: EB98748132E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59815-lists,linux-media=lfdr.de];
	DMARC_NA(0.00)[pengutronix.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[s.pueschel@pengutronix.de,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.991];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

This series adds support for the Raster Graphic Acceleration 3 (RGA3)
peripheral, which is included in the RK3588 SoC. The RK3588
contains one RGA2-Enhanced core (which is already implemented by the
rockchip rga driver) and two independent RGA3 cores. They feature
a similar functionality of scaling, cropping and rotating of up to two input
images into one output image. Key differences of the RGA3 are:

- supports 10bit YUV output formats
- supports 8x8 tiles and FBCD as inputs and outputs
- supports BT2020 color space conversion
- max output resolution of (8192-64)x(8192-64)
- MMU can map up to 32G DDR RAM
- fully planar formats (3 planes) are not supported
- max scale up/down factor of 8 (RGA2 allows up to 16)

This patch set adds support for one RGA3 core in the existing
rga m2m driver. The feature set of the PR is limited to scaling,
format and color space conversions between common 8bit RGB/YUV formats.
This already allows a practical usage of the RGA3.

During testing it has been noted that the scaling of the hardware is
slightly incorrect. A test conversion of 128x128 RGBA to 256x256 RGBA
causes a slight shift to the bottom right. The shift is suddle, as it seems
that the image is shifted by about 2px down and right and then cropped to
it's final size (probably caused by the source sampling).
The same behavior has been observed when using the vendor driver
with the librga library.

Furthermore comparing the RGA3 conversion with the GStreamer
videoconvertscale element, the chroma-site is different. A quick testing
didn't reveal a chroma-site that creates the same image with the
GStreamer Element. Also when converting from YUV to RGB the RGB values
differ by 1 or 2. This doesn't seem to be a colorspace conversion issue
but rather a slightly different precision on the calculation.

This was tested on a Radxa Rock 5T. Around 80 fps were measured when
scaling and converting from RGBA 480x360 to NV12 3840x2160 in a single
gstreamer pipeline. Format conversions were tested with a single
gstreamer pipeline converting a fixed input to a given input format.
Afterwards it's piped through the RGA3 and the result is converted back
to rgba and compared against a given hash value (generated after
comparing the output manually to the input).

The patchset also fixes the failing v4l2-compliance tests due to the
missing colorimetry propagation from output to capture:

  v4l2-compliance 1.32.0, 64 bits, 64-bit time_t
  ...
  	Card type        : rga2
  ...
  Total for rockchip-rga device /dev/video0: 48, Succeeded: 48, Failed: 0, Warnings: 0

  v4l2-compliance 1.32.0, 64 bits, 64-bit time_t
  ...
	Card type        : rga3
  ...
  Total for rockchip-rga device /dev/video1: 48, Succeeded: 48, Failed: 0, Warnings: 0

To distinguish the RGA2 core from the RGA3 cores the Card type is set
accordingly. Scheduling operations between both RGA3 cores to double
the possible frame rate might be a future improvement. Until then
additional RGA3 cores are disabled to only provide one video device to
the user space. This prevents a potential ABI breakage when multi core
support is implemented.

The DTS change at the end is just as a preview, as this series targets
media/next. After it's merged the DTS change will be sent as a new
patch not targeting media.

Patch 1 updates the dtb bindings doc to support the RGA3
Patch 2-5 extend v4l2 common functionality
Patch 6-10 are general cleanups
Patch 11-27 prepare the rga driver for the RGA3
Patch 28 adds RGA3 support to the rga driver
Patch 29 dtsi additions for the RGA3

Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
---
Changes in v5:
- Fixed cmdbuf allocation size being only a quarter
- Fixed streamon cmdbuf preparation to not set
  rotation/flipping which prevents changing it during streaming
- Link to v4: https://patch.msgid.link/20260325-spu-rga3-v4-0-e90ec1c61354@pengutronix.de

Changes in v4:
- Add Nicolas to Cc for potential reviews and Sebastian for the nice
  RK3588 mainline status table
- Improved single memory plane y stride alignment adjustments
- Adjusted scaling inaccuracy description
- Dropped required iommu property from the binding yaml
- Fixed binding yaml indentation
- Link to v3: https://lore.kernel.org/r/20260127-spu-rga3-v3-0-77b273067beb@pengutronix.de

Changes in v3:
- Add iommus property to the dtb bindings documentation
- Drop interrupt name from the dtsi
- Added v4l2_format_info for missing 2 byte RGB formats
- Fixed incorrect dt node reference in the binding patch commit message
- Removed now unused depth member of rga_frame
- Replaced RGA3 semi planar bool with v4l2_format_info check
- Calculated x_div/y_div variables instead of storing them
- Limited width/height to even values for YUV formats
- Support all 4 CSC modes: BT601L, BT601F, BT709L, BT2020L
- Note slightly incorrect scaling by the hardware
- Fix stride alignment to bytes
- Use early returns in rga-buf init/cleanup
- Fix incorrect devm_clk_bulk_get with devm_clk_bulk_get_all
- Don't enforce max scaling factor in try_fmt (only in s_fmt)
- Merge single register editing RGA3 functions into the other functions
- Link to v2: https://lore.kernel.org/r/20251203-spu-rga3-v2-0-989a67947f71@pengutronix.de

Changes in v2:
- Removed overclocking (assigning higher clock speeds in the dts)
- Disable the second RGA3 core
- Improved RGA3 feature documentation and code comments
- Don't write the whole command buffer in each frame
- Don't announce CIDs for the RGA3 and error out on s_selection
- Check the max scaling factor of 16 (RGA2) and 8 (RGA3)
- Move stride alignment and alpha checking to v4l2 common
- Register the interrupt as shared for an external IOMMU
- Add IOMMU patch as dependency to fix sporadic hangups
- Link to v1: https://lore.kernel.org/r/20251007-spu-rga3-v1-0-36ad85570402@pengutronix.de

To: Jacob Chen <jacob-chen@iotwrt.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
To: Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org
Cc: linux-rockchip@lists.infradead.org
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org

---
Michael Olbrich (1):
      media: rockchip: rga: share the interrupt when an external iommu is used

Sven Püschel (28):
      media: dt-bindings: media: rockchip-rga: add rockchip,rk3588-rga3
      media: v4l2-common: sort RGB formats in v4l2_format_info
      media: v4l2-common: add missing 1 and 2 byte RGB formats to v4l2_format_info
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
      media: rockchip: rga: split flip and rotate into separate function
      media: rockchip: rga: prepare cmdbuf on streamon
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
      arm64: dts: rockchip: add rga3 dt nodes

 .../devicetree/bindings/media/rockchip-rga.yaml    |  10 +-
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      |  44 ++
 drivers/media/platform/rockchip/rga/Makefile       |   2 +-
 drivers/media/platform/rockchip/rga/rga-buf.c      |  61 ++-
 drivers/media/platform/rockchip/rga/rga-hw.c       | 413 ++++++++++-----
 drivers/media/platform/rockchip/rga/rga-hw.h       |  16 +-
 drivers/media/platform/rockchip/rga/rga.c          | 577 ++++++++++-----------
 drivers/media/platform/rockchip/rga/rga.h          |  85 +--
 drivers/media/platform/rockchip/rga/rga3-hw.c      | 507 ++++++++++++++++++
 drivers/media/platform/rockchip/rga/rga3-hw.h      | 192 +++++++
 drivers/media/v4l2-core/v4l2-common.c              | 128 +++--
 include/media/v4l2-common.h                        |   6 +
 12 files changed, 1514 insertions(+), 527 deletions(-)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20251001-spu-rga3-8a00e018b120
prerequisite-change-id: 20251126-spu-iommudtefix-cd0c5244c74a:v1
prerequisite-patch-id: 10c6c977c0f71400931941b42da73adcaf63e810

Best regards,
--  
Sven Püschel <s.pueschel@pengutronix.de>


