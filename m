Return-Path: <linux-media+bounces-51152-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GBUVIhEHcGlyUwAAu9opvQ
	(envelope-from <linux-media+bounces-51152-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 20 Jan 2026 23:52:01 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 323064D4A3
	for <lists+linux-media@lfdr.de>; Tue, 20 Jan 2026 23:52:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id AE48F90C842
	for <lists+linux-media@lfdr.de>; Tue, 20 Jan 2026 22:20:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCC7D3A89B1;
	Tue, 20 Jan 2026 22:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="NqLeINkJ"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CDF52F6905;
	Tue, 20 Jan 2026 22:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768947632; cv=none; b=J749JG6cQMWV7N1JrFCgg4GELrofDzXSbRsaccvtEndvDWpTRtnrErGxlMRQHP4BvzIhSTxYuaNuqtpQMZGnw1ykuPbBGBt0ZS5pggBns+bskacQBXtqX8yuZMh0r6nRQJ2SuxC3FqgiCXxnzYVqbWrvanLRMKRC9ONy92b/Knw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768947632; c=relaxed/simple;
	bh=VOu//zKwpESYwiVen5/Iuw/HguocJ7wqDJHMFP8YBCI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TxefVfB7HrCw93qRp7zFIWuPZg1IxzqoPBHHZ1jeXYZNJBrNxALZIFHxOOdG4YUmvX87VEfwszGuwGZl1T16n5AG9cJElqOxTCZ+KFL5a1UvM7NqEmoIrrxNt55mMaKdP7TmQeDjR7t8l8SO62W6DfQhx4T0dqu8aZ397UX1oyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=NqLeINkJ; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768947625;
	bh=VOu//zKwpESYwiVen5/Iuw/HguocJ7wqDJHMFP8YBCI=;
	h=From:To:Cc:Subject:Date:From;
	b=NqLeINkJd6NqX1XDq9O5SF6f98Ykd/RJLUTdR8uz6b93x3HOGja9DGdeqlZ4DbZnZ
	 CzZvdqkqtCwc/ynXHPiDv8fdUHYO03KCwrJagNXhf/+o0olMNlxI6jxyxjHTuh3z+U
	 pU9WwxtGM8aKwZ6tv3EHU6JE0IRTfJQ0E6D6e4X/XpZ1jJvl/fuCNhicXyqhQqttzz
	 zt89iT5lkCNOGxeqoWoJYMhHIVl1SsYcoNEQrHRAS0RCI/XmEY9/QrPW+Q3thqVIG7
	 1BQ88JT/tarYCHUbsIDUGbhFhlH/4UrjPLzgN2E8lPHyfhCM6mcQtODKA4OIATldHQ
	 aSYHpd5gm3cGQ==
Received: from earth.mtl.collabora.ca (mtl.collabora.ca [66.171.169.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A4EE017E0117;
	Tue, 20 Jan 2026 23:20:21 +0100 (CET)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Heiko Stuebner <heiko@sntech.de>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Yunke Cao <yunkec@google.com>,
	Hans de Goede <hansg@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Pavan Bobba <opensource206@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	James Cowgill <james.cowgill@blaize.com>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	Jonas Karlman <jonas@kwiboo.se>,
	Diederik de Haas <didi.debian@cknow.org>
Subject: [PATCH v9 00/17] media: rkvdec: Add support for VDPU381 and VDPU383
Date: Tue, 20 Jan 2026 17:20:00 -0500
Message-ID: <20260120222018.404741-1-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.46 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-51152-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,collabora.com,vanguardiasur.com.ar,sntech.de,lwn.net,chromium.org,google.com,ideasonboard.com,gmail.com,linux.intel.com,blaize.com,vger.kernel.org,lists.infradead.org,kwiboo.se,cknow.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_POLICY_ALLOW(0.00)[collabora.com,none];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[detlev.casanova@collabora.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:dkim,collabora.com:mid,collabora.com:url,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: 323064D4A3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

hese variants are found respectively in the RK3588 and RK3576 SoCs.
This patch only adds support for H264 and H265 in both variants.

As there is a considerable part of the code that can be shared with the
already supported rkvdec decoder driver, the support for these variants
is added here rather than writing a new driver.

This patch set uses the newly introduced hevc_ext_sps_[ls]t_rps v4l2
controls for HEVC.
Therefore, a patched version of userpace tools is needed for HEVC
support (added for GStreamer[1] and in an early stage for FFmpeg[2]).

The DTS changes can be found in another patch set[3]

[1]: https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/9355
[2]: https://gitlab.collabora.com/detlev/ffmpeg
[3]: https://lore.kernel.org/all/20251020212009.8852-1-detlev.casanova@collabora.com/

Changes since v8:
 - Fix function stack frame size being too big with clang and some config
 - Move cabac tables declarations in their own header
 - Add vdpu38x_h264_ctrl_descs to allow levels up to 6.0 on vdpu381 and vdpu383
 - Fix small alignment issue

Changes since v7:
 - Be more consistent with reg names format (reg<num:03>_<name>)
 - Re-add sps validation in start(), skipping it would let userspace
   configure the driver to do buffer overflows
 - Move watchdog configuration to a common function
 - Use div_u64() to allow building for 32 bits architectures
 - Do not try to program extended rps if it was not set

Changes since v6:
 - Remove coded_fmts capabilities
 - Remove inexistant V4L2_HEVC kconfig dependency
 - Add missing rkvdec registers
 - Fix memcpy sizes
 - Remove non-necessary name and style changes
 - Use common get_image_fmt
 - Do not validate sps in start()
 - Remove unused variable
 - Change named_regs to has_single_reg_region
 - Compared to v6, I didn't use a union for the ref addr and flags
   registers, as I find the flat struct more readable.

Changes since v5:
- Extract multicore management in separate commit
- Move variant specific functions to an ops struct
- Fix a typo and "h264" -> "hevc" copy/paste mistakes
- Move RKVDEC_*_PIXELS to rkvdec.h
- Drop VDPU383_*_PIXELS, use the the RKVDEC ones instead
- Change RKVDEC_1080P_PIXELS value to 1920 * 1088
- Long and short term ref sets extend controls:
  - Add them in visl traces
  - Reword documentation to specify SPS extension and use
  - Mention Vulkan Video API similarity
  - Specify behavior for empty array values
  - Reorder struct fields to ensure fixed compiled size
  - Remove the mention of V4L2_CTRL_FLAG_DYNAMIC_ARRAY flag

Changes since v4:
 - Add basic ext_sps_[ls]t_rps validation (flags only)
 - Add missing copyright in new common files
 - Rename num_coded_fmts, rcb_num, clk_count
 - Avoid allocating RCB config when not needed
 - Merge rkvdec_config into rkvdec_variant
 - Keep rkvdec_hevc_get_image_fmt per variant

Changes since v3:
 - Rebased on latest next (ea299a216426) + HEVC support for rk3399

Changes since v2:
 - Rebased on Kwiboo's HEVC support for rk3399
 - Include hevc_ext_sps_[ls]t_rps v4l2 controls commits
 - Remove empty lines at end of files
 - Rename RKVDEC2_ALLOC_* to RKVDEC_ALLOC_*
 - Set min_with and min_height to 64
 - Remove vdpu38x_fill_pixfmt_mp() function
 - Handle userspace not supporting hevc_ext_sps_[ls]t_rps
 - Make all config structs static const

Changes since v1:
 - Add parsing of the short and long term ref frame sets from the new v4l2
   controls
 - Add RPS cache to avoid parsing the same data again
 - Fix HEVC pixel formats selection
 - Fix multiple indentation errors

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

 .../media/v4l/ext-ctrls-codec-stateless.rst   | 120 +++
 .../media/v4l/videodev2.h.rst.exceptions      |   2 +
 .../media/v4l/vidioc-queryctrl.rst            |  12 +
 .../media/platform/rockchip/rkvdec/Makefile   |  14 +-
 .../{rkvdec-hevc-data.c => rkvdec-cabac.c}    | 506 +++++++++-
 .../platform/rockchip/rkvdec/rkvdec-cabac.h   |  21 +
 .../rockchip/rkvdec/rkvdec-h264-common.c      | 258 +++++
 .../rockchip/rkvdec/rkvdec-h264-common.h      |  85 ++
 .../platform/rockchip/rkvdec/rkvdec-h264.c    | 893 ++----------------
 .../rockchip/rkvdec/rkvdec-hevc-common.c      | 511 ++++++++++
 .../rockchip/rkvdec/rkvdec-hevc-common.h      | 107 +++
 .../platform/rockchip/rkvdec/rkvdec-hevc.c    | 282 +-----
 .../platform/rockchip/rkvdec/rkvdec-rcb.c     | 179 ++++
 .../platform/rockchip/rkvdec/rkvdec-rcb.h     |  29 +
 .../platform/rockchip/rkvdec/rkvdec-regs.h    | 586 ++++++++----
 .../rockchip/rkvdec/rkvdec-vdpu381-h264.c     | 469 +++++++++
 .../rockchip/rkvdec/rkvdec-vdpu381-hevc.c     | 639 +++++++++++++
 .../rockchip/rkvdec/rkvdec-vdpu381-regs.h     | 430 +++++++++
 .../rockchip/rkvdec/rkvdec-vdpu383-h264.c     | 538 +++++++++++
 .../rockchip/rkvdec/rkvdec-vdpu383-hevc.c     | 652 +++++++++++++
 .../rockchip/rkvdec/rkvdec-vdpu383-regs.h     | 281 ++++++
 .../platform/rockchip/rkvdec/rkvdec-vp9.c     | 232 ++---
 .../media/platform/rockchip/rkvdec/rkvdec.c   | 633 +++++++++++--
 .../media/platform/rockchip/rkvdec/rkvdec.h   |  50 +-
 drivers/media/test-drivers/visl/visl-dec.c    |   7 +
 drivers/media/test-drivers/visl/visl-dec.h    |   3 +
 .../media/test-drivers/visl/visl-trace-hevc.h |  59 ++
 drivers/media/v4l2-core/v4l2-ctrls-core.c     |  28 +
 drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  10 +
 include/uapi/linux/v4l2-controls.h            |  61 ++
 include/uapi/linux/videodev2.h                |   2 +
 31 files changed, 6235 insertions(+), 1464 deletions(-)
 rename drivers/media/platform/rockchip/rkvdec/{rkvdec-hevc-data.c => rkvdec-cabac.c} (86%)
 create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-cabac.h
 create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-h264-common.c
 create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-h264-common.h
 create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
 create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.h
 create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.c
 create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.h
 create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-h264.c
 create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c
 create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-regs.h
 create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c
 create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c
 create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-regs.h

-- 
2.52.0


