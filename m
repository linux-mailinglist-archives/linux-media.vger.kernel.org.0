Return-Path: <linux-media+bounces-39137-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65171B1EF29
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 22:04:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2170EA603A1
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 20:04:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5993E22D781;
	Fri,  8 Aug 2025 20:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="g9wsNghN"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC43225A5B;
	Fri,  8 Aug 2025 20:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754683437; cv=none; b=XExE3970/Ayi1K9Ldbt+jUR541reCsEEuYY7AL2+WVx3p4YBeQpWBmbyMn9GAg+jx5wW6BLQ79uBoihDVUtkx/DquyBgCBjryius9BzF/DPUkSl3Q11raVEgxsoh5IovsTeWhg3tBVP7AzUGejLhDm5oigy+4O3n3C3dLDZHHU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754683437; c=relaxed/simple;
	bh=8Hxw2IStYv/MEOzfgY792r3eSVsz/GkseQLYrGILriA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ujyvwpUM6Wftx6AX99yNC2qtRV2Oh4XkMHuWu07ffEhJwqYxtDmATVhcTgbVAKIYJ+N3rIIGgq6DLQcCIJ3cFQ1D1OyzmnEZZJ9pAgiLriHDp+Gkp2XiiiTLZ4ZnbGH3uRxhS+CD5ZYAojo5cLHNtmCh96uChBPOBFm1QqxrX9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=g9wsNghN; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754683428;
	bh=8Hxw2IStYv/MEOzfgY792r3eSVsz/GkseQLYrGILriA=;
	h=From:To:Cc:Subject:Date:From;
	b=g9wsNghNoNuXbDOEp8M9JNUVlKfFqjuTkQJjuEHpDN0mO+rvxmzTOsecohCmz1Y1/
	 g+mut7bQ7EwopiVbRJsBHDaUavF4q+/8ZOpL2p9oSffw5V+gGaPgu8IwX8Ja37eMHg
	 HfU4FtDwmuC016BL2S31GfapVAtKi0g/wJbVVMGTulWfs7jMtmAAwce3zsYPCgUbJn
	 Ibq4ssDQahNwxVJzd0so3xVx8ppCJAgcoaiv/sjvLsfpOpSrPMMI4Ug08VXt1vgYtV
	 Efd0x+Ba1soExskMGJ2ySDmyTYNyNDhKG1/uktzxAGCeTpcjghD+q0JtpE+736UqHi
	 AYPL8eVO+q7Sw==
Received: from earth.mtl.collabora.ca (mtl.collabora.ca [66.171.169.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3320B17E0C8C;
	Fri,  8 Aug 2025 22:03:47 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Detlev Casanova <detlev.casanova@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v2 00/12] media: rkvdec: Add support for VDPU381 and VDPU383
Date: Fri,  8 Aug 2025 16:03:22 -0400
Message-ID: <20250808200340.156393-1-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.50.1
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
controls for HEVC [1].
Therefore, a patched version of userpace tools is needed for HEVC
support (added for GStreamer[2] and in an early stage for FFmpeg[3]).

This patch set also depends on the preparation patch set sent earlier [4]
as well as the iommu restore fix [5] (already merged in linux-media) and
Nicolas Frattaroli's bitmap patch [6] to support setting registers that
uses upper 16 bits as masks.

[1]: https://lore.kernel.org/all/20250807194327.69900-1-detlev.casanova@collabora.com/
[2]: https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/9355
[3]: https://gitlab.collabora.com/detlev/ffmpeg
[4]: https://lore.kernel.org/all/20250623160722.55938-1-detlev.casanova@collabora.com/
[5]: https://lore.kernel.org/all/20250508-rkvdec-iommu-reset-v1-1-c46b6efa6e9b@collabora.com/
[6]: https://lore.kernel.org/all/20250623-byeword-update-v2-1-cf1fc08a2e1f@collabora.com/

Changes since v1:
 - Add parsing of the short and long term ref frame sets from the new v4l2
   controls
 - Add RPS cache to avoid parsing the same data again
 - Fix HEVC pixel formats selection
 - Fix multiple indentation errors

Detlev Casanova (12):
  media: rkvdec: Switch to using structs instead of writel
  media: rkvdec: Move cabac table to its own source file
  media: rkvdec: Use structs to represent the HW RPS
  media: rkvdec: Move h264 functions to common file
  media: rkvdec: Add per variant configuration
  media: rkvdec: Add RCB and SRAM support
  media: rkvdec: Support per-variant interrupt handler
  media: rkvdec: Enable all clocks without naming them
  media: rkvdec: Add H264 support for the VDPU381 variant
  media: rkvdec: Add H264 support for the VDPU383 variant
  media: rkvdec: Add HEVC support for the VDPU381 variant
  media: rkvdec: Add HEVC support for the VDPU383 variant

 .../media/platform/rockchip/rkvdec/Kconfig    |    1 +
 .../media/platform/rockchip/rkvdec/Makefile   |   13 +-
 .../platform/rockchip/rkvdec/rkvdec-cabac.c   | 3944 +++++++++++++++++
 .../rockchip/rkvdec/rkvdec-h264-common.c      |  253 ++
 .../rockchip/rkvdec/rkvdec-h264-common.h      |   81 +
 .../platform/rockchip/rkvdec/rkvdec-h264.c    |  891 +---
 .../rockchip/rkvdec/rkvdec-hevc-common.c      |  511 +++
 .../rockchip/rkvdec/rkvdec-hevc-common.h      |  101 +
 .../platform/rockchip/rkvdec/rkvdec-rcb.c     |  174 +
 .../platform/rockchip/rkvdec/rkvdec-rcb.h     |   29 +
 .../platform/rockchip/rkvdec/rkvdec-regs.h    |  567 ++-
 .../rockchip/rkvdec/rkvdec-vdpu381-h264.c     |  469 ++
 .../rockchip/rkvdec/rkvdec-vdpu381-hevc.c     |  596 +++
 .../rockchip/rkvdec/rkvdec-vdpu381-regs.h     |  427 ++
 .../rockchip/rkvdec/rkvdec-vdpu383-h264.c     |  582 +++
 .../rockchip/rkvdec/rkvdec-vdpu383-hevc.c     |  688 +++
 .../rockchip/rkvdec/rkvdec-vdpu383-regs.h     |  284 ++
 .../platform/rockchip/rkvdec/rkvdec-vp9.c     |  230 +-
 .../media/platform/rockchip/rkvdec/rkvdec.c   |  569 ++-
 .../media/platform/rockchip/rkvdec/rkvdec.h   |   39 +
 20 files changed, 9260 insertions(+), 1189 deletions(-)
 create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-cabac.c
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
2.50.1


