Return-Path: <linux-media+bounces-45278-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 127D7BFD6A4
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 18:57:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C68243B5382
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 16:37:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58FA72BEC55;
	Wed, 22 Oct 2025 16:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ZZQxCZYJ"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D09921773D;
	Wed, 22 Oct 2025 16:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761150334; cv=none; b=nrXzRjtu3yak4xPQ2odmjKsEeQD5TGvlLkLcdzJ6w/ZiiNVU2WuHMYikr/hhx/QMDGqZfkigyIOlutQ9WWq5BCXHv/qa3JlvoSBmOVrvjskTGj0K0Gk974FmZljy8+1AY6LZi/vD1jY5IQc0gRYpMvreMHT1tbtWU9OFgaePzWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761150334; c=relaxed/simple;
	bh=OruFR1IL0sF0Yc9lSU8e89/AgjGQwgCuT+vdASDoh6c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QXxCGM1+OYORlPi8vL/t0jnn/gVKCPKtmRyMFXlrnZDga2ihWLqpq12YW8usHvtqmquOwtBVy6066na/og/2IFKU1jRjo1yxZEfUOGqVWGgsCd2TTL4EU6WkTEM2KErcFSL2dm28fp9lcu/TIZ3flm69GB+lsl6Jwtak5gdtMhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ZZQxCZYJ; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1761150330;
	bh=OruFR1IL0sF0Yc9lSU8e89/AgjGQwgCuT+vdASDoh6c=;
	h=From:To:Cc:Subject:Date:From;
	b=ZZQxCZYJ6g/x3ywB9W+c/vcjGAgwPXB0V2/NjlvpGaioqRW2lLnv7cNvuNGNNlzDw
	 PEwzUXmLcatToydpislaWeWUyP3ng2OFef7Gamc5qUXr650tFeiH0wHthR0EMruFlK
	 iN9iOslK/B0/fzkbgZXr1Os8rTukEWT4kYvThL7nuD20Blr3gKnDCW60qyarAEJIf5
	 ttB4cPR082JkBCbXZCJ0oJR+7Fam9PR3Qvz2BckTpC/usvVg5IepyZeK2PcvDK3Ux3
	 oV/0gjhuy67wVEPYVZ8Yn8UQ7KFWEOXPWgBHYysjKl1/Y4Y/dElvggc5iCKdl4YRe0
	 7lnGVfEwWbZfg==
Received: from trenzalore (unknown [23.233.251.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 29C4117E108C;
	Wed, 22 Oct 2025 18:25:28 +0200 (CEST)
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
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: [PATCH v3 00/15] media: rkvdec: Add support for VDPU381 and VDPU383
Date: Wed, 22 Oct 2025 12:21:59 -0400
Message-ID: <20251022162459.271603-1-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.51.1.dirty
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

The patchset is based on Kwiboo's HEVC support for rk3399[3].

[1]: https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/9355
[2]: https://gitlab.collabora.com/detlev/ffmpeg
[3]: https://lore.kernel.org/all/20250905161942.3759717-1-jonas@kwiboo.se/

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

Detlev Casanova (15):
  media: uapi: HEVC: Add v4l2_ctrl_hevc_ext_sps_[ls]t_rps controls
  media: v4l2-ctrls: Add hevc_ext_sps_[ls]t_rps controls
  media: rkvdec: Switch to using structs instead of writel
  media: rkvdec: Move cabac tables to their own source file
  media: rkvdec: Use structs to represent the HW RPS
  media: rkvdec: Move h264 functions to common file
  media: rkvdec: Move hevc functions to common file
  media: rkvdec: Add generic configuration for variants
  media: rkvdec: Add RCB and SRAM support
  media: rkvdec: Support per-variant interrupt handler
  media: rkvdec: Enable all clocks without naming them
  media: rkvdec: Add H264 support for the VDPU381 variant
  media: rkvdec: Add H264 support for the VDPU383 variant
  media: rkvdec: Add HEVC support for the VDPU381 variant
  media: rkvdec: Add HEVC support for the VDPU383 variant

 .../media/v4l/ext-ctrls-codec-stateless.rst   | 114 +++
 .../media/v4l/videodev2.h.rst.exceptions      |   2 +
 .../media/v4l/vidioc-queryctrl.rst            |  12 +
 .../media/platform/rockchip/rkvdec/Kconfig    |   1 +
 .../media/platform/rockchip/rkvdec/Makefile   |  14 +-
 .../{rkvdec-hevc-data.c => rkvdec-cabac.c}    | 506 +++++++++-
 .../rockchip/rkvdec/rkvdec-h264-common.c      | 252 +++++
 .../rockchip/rkvdec/rkvdec-h264-common.h      |  83 ++
 .../platform/rockchip/rkvdec/rkvdec-h264.c    | 891 ++----------------
 .../rockchip/rkvdec/rkvdec-hevc-common.c      | 531 +++++++++++
 .../rockchip/rkvdec/rkvdec-hevc-common.h      | 112 +++
 .../platform/rockchip/rkvdec/rkvdec-hevc.c    | 306 +-----
 .../platform/rockchip/rkvdec/rkvdec-rcb.c     | 173 ++++
 .../platform/rockchip/rkvdec/rkvdec-rcb.h     |  29 +
 .../platform/rockchip/rkvdec/rkvdec-regs.h    | 571 +++++++----
 .../rockchip/rkvdec/rkvdec-vdpu381-h264.c     | 469 +++++++++
 .../rockchip/rkvdec/rkvdec-vdpu381-hevc.c     | 595 ++++++++++++
 .../rockchip/rkvdec/rkvdec-vdpu381-regs.h     | 427 +++++++++
 .../rockchip/rkvdec/rkvdec-vdpu383-h264.c     | 582 ++++++++++++
 .../rockchip/rkvdec/rkvdec-vdpu383-hevc.c     | 690 ++++++++++++++
 .../rockchip/rkvdec/rkvdec-vdpu383-regs.h     | 284 ++++++
 .../platform/rockchip/rkvdec/rkvdec-vp9.c     | 231 ++---
 .../media/platform/rockchip/rkvdec/rkvdec.c   | 536 ++++++++++-
 .../media/platform/rockchip/rkvdec/rkvdec.h   |  39 +
 drivers/media/v4l2-core/v4l2-ctrls-core.c     |  18 +
 drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  10 +
 include/uapi/linux/v4l2-controls.h            |  61 ++
 include/uapi/linux/videodev2.h                |   2 +
 28 files changed, 6080 insertions(+), 1461 deletions(-)
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
2.51.1.dirty


