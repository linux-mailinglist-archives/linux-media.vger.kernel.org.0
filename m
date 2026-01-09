Return-Path: <linux-media+bounces-50290-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 69755D0B2B6
	for <lists+linux-media@lfdr.de>; Fri, 09 Jan 2026 17:18:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2833830150FA
	for <lists+linux-media@lfdr.de>; Fri,  9 Jan 2026 16:15:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5793D287505;
	Fri,  9 Jan 2026 16:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Cgx++DNx"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB3721ABC1;
	Fri,  9 Jan 2026 16:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767975348; cv=none; b=p4WVZcan74KXSVzrB8ECbG+hnK7sFWYKERq8B+8h8O0FcktLsSgmsM687XkaodMlyBd5myHRRH71ksrFhwfDd7/IHdduzITwsjZn9ASRCkUYhh5XknYclfrAFcHAE5WzRfhkUBZ8neM7tWBKcv+bF28Dhu5cwEscqI2EBLVkVfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767975348; c=relaxed/simple;
	bh=L5SslSMt2OUPZ0EXP9AkefW/FGjiHvma9IXHfXRcVNc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EAU6vKtXALAptKItWZ5yMbxy04v+xliEWq+SsLdvQDO+pR3FLZMB5EbfVkoueVqnMtaKT8CJpNpzd1IyANXYIT/Wxd4NXTIOf61bDWbTy/cW0mVrIQ8jnMEXmbs+dXQtZNxf2ZYjWCSf307gHRsa4yVvm2v1dSGFj20APNTV1XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Cgx++DNx; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1767975345;
	bh=L5SslSMt2OUPZ0EXP9AkefW/FGjiHvma9IXHfXRcVNc=;
	h=From:To:Cc:Subject:Date:From;
	b=Cgx++DNx68RBVdYbhPb4/NRtTAZm+4CfiwT6F1TCJTXJV/Ry+P8aAHtBfHaGXE7LP
	 HUd48gf0Pn9wpzf9Bkt+TY/HncNJ5AzSbG9BVH6DKVBoRKZCP11doTO5Qx9VOwzOa9
	 agVrIDZPZPfaTeHFgpuRPYX3hdC8TD7ZmVg6YIg7OGp78q1SPJCdhkDP/IJSEy+hGg
	 FCRI/0Lt245wv/Yx0TnVVdU/cBeuwkvo7GY2m7Y1Yk+Yy2g2hXs416GQ1cmuMSuKXT
	 YKnmU42iycYP1jHIctM4tnoS71V4bFGBXBhHURUj6WmRINybLGja8sOW1ms870bGLY
	 84vUWC1p7YKQQ==
Received: from trenzalore (modemcable014.2-22-96.mc.videotron.ca [96.22.2.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 14D9117E1380;
	Fri,  9 Jan 2026 17:15:42 +0100 (CET)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Heiko Stuebner <heiko@sntech.de>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Yunke Cao <yunkec@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	James Cowgill <james.cowgill@blaize.com>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Diederik de Haas <didi.debian@cknow.org>
Subject: [PATCH v8 00/17] media: rkvdec: Add support for VDPU381 and VDPU383
Date: Fri,  9 Jan 2026 11:15:16 -0500
Message-ID: <20260109161538.1294449-1-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These variants are found respectively in the RK3588 and RK3576 SoCs.
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
 .../rockchip/rkvdec/rkvdec-h264-common.c      | 258 +++++
 .../rockchip/rkvdec/rkvdec-h264-common.h      |  89 ++
 .../platform/rockchip/rkvdec/rkvdec-h264.c    | 892 ++----------------
 .../rockchip/rkvdec/rkvdec-hevc-common.c      | 512 ++++++++++
 .../rockchip/rkvdec/rkvdec-hevc-common.h      | 109 +++
 .../platform/rockchip/rkvdec/rkvdec-hevc.c    | 281 +-----
 .../platform/rockchip/rkvdec/rkvdec-rcb.c     | 179 ++++
 .../platform/rockchip/rkvdec/rkvdec-rcb.h     |  29 +
 .../platform/rockchip/rkvdec/rkvdec-regs.h    | 586 ++++++++----
 .../rockchip/rkvdec/rkvdec-vdpu381-h264.c     | 468 +++++++++
 .../rockchip/rkvdec/rkvdec-vdpu381-hevc.c     | 638 +++++++++++++
 .../rockchip/rkvdec/rkvdec-vdpu381-regs.h     | 430 +++++++++
 .../rockchip/rkvdec/rkvdec-vdpu383-h264.c     | 572 +++++++++++
 .../rockchip/rkvdec/rkvdec-vdpu383-hevc.c     | 710 ++++++++++++++
 .../rockchip/rkvdec/rkvdec-vdpu383-regs.h     | 281 ++++++
 .../platform/rockchip/rkvdec/rkvdec-vp9.c     | 232 ++---
 .../media/platform/rockchip/rkvdec/rkvdec.c   | 586 ++++++++++--
 .../media/platform/rockchip/rkvdec/rkvdec.h   |  50 +-
 drivers/media/test-drivers/visl/visl-dec.c    |   7 +
 drivers/media/test-drivers/visl/visl-dec.h    |   3 +
 .../media/test-drivers/visl/visl-trace-hevc.h |  59 ++
 drivers/media/v4l2-core/v4l2-ctrls-core.c     |  28 +
 drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  10 +
 include/uapi/linux/v4l2-controls.h            |  61 ++
 include/uapi/linux/videodev2.h                |   2 +
 30 files changed, 6263 insertions(+), 1463 deletions(-)
 rename drivers/media/platform/rockchip/rkvdec/{rkvdec-hevc-data.c => rkvdec-cabac.c} (86%)
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


