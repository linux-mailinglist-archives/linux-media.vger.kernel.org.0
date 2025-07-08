Return-Path: <linux-media+bounces-37120-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F51BAFCEF0
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 17:20:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E952E174512
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 15:20:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A295E2E11D1;
	Tue,  8 Jul 2025 15:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="O+CkKxN9"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B4D2E0412;
	Tue,  8 Jul 2025 15:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751988005; cv=none; b=EHRwsxoUBl4ACgWVYS4AOWmzRMGUF8NxXRNqaWevtRs2yUVYo7TG4XWwGwTgcds2In1VThETum1KdVqo0xYiQKPHW8r1wnyapqZeZwKUCCopPbAYZshIFcv6mTIq3hRuywvQaBj9W8norJvlhiCmwvVLwo+TWqxE1IQzWwDqbjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751988005; c=relaxed/simple;
	bh=ldW+8NLIWI9EH03+6vgdJz7W7PLDyT0T4sDDOhAg+Wg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=idMOoE6QBZqvnF88mttoNtLrHsmggMTNEQUW4g/ELvrCWWHav8VzyjU/2KvybHicNqbpLeLW5pAod9oyILU4Kj10x63NJ/dhARtevUR1OXAZgfoEOZ/QhkwKEXct+R5u4Bk6n5NuGHd6ziDdL1bsk/7NeAsnOUtYwuJcjT9JNIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=O+CkKxN9; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751987994;
	bh=ldW+8NLIWI9EH03+6vgdJz7W7PLDyT0T4sDDOhAg+Wg=;
	h=From:To:Cc:Subject:Date:From;
	b=O+CkKxN93ev5LYgwxsRmUCBdvNE/oYc0sqGBkbZ1MUyp44t3xf4+NPkhZT6wvE942
	 jQ/tj8uxiQfjqptkJKJStnaUiKXwJKTvulWEPCu0ZbhwOA/0X1qFKSqOAjcHPeCQBm
	 uWUk+hibDaS74i0MBmV7/X18hRMViszziMfnInJi918cH9kY54UH6owlK0xZKgNJlH
	 HPKFSL7JsPB9irr6cg2AKGycNpMJEMViNXGZkVGSfz4duo5WkxqyCPsKRbYEhqTURo
	 GtX6MdeoBXv55dm/xfBErTeENjeudFeY7E7lkhxFXrdjOdqo2aYWLjnK9kiYpOCpRr
	 5C08OcXMP3upQ==
Received: from trenzalore.hitronhub.home (unknown [23.233.251.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7E28017E0456;
	Tue,  8 Jul 2025 17:19:53 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Detlev Casanova <detlev.casanova@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: [PATCH 00/12] media: rkvdec: Add support for VDPU381 and VDPU383
Date: Tue,  8 Jul 2025 11:19:33 -0400
Message-ID: <20250708151946.374349-1-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.50.0
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

This patch set uses the newly introduced EXT_SPS_RPS v4l2 control for
HEVC [1].
Therefore, a patched version of userpace tools is needed for HEVC
support (currently only added for GStreamer[2])

This patch set also depends on the preparation patch set sent earlier [3]
as well as the iommu restore fix [4] (already merged in linux-media) and
Nicolas Frattaroli's bitmap patch [5] to support setting registers that
uses upper 16 bits as masks.

[1]: https://lore.kernel.org/all/20250623160722.55938-7-detlev.casanova@collabora.com/
[2]: https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/9355
[3]: https://lore.kernel.org/all/20250623160722.55938-1-detlev.casanova@collabora.com/
[4]: https://lore.kernel.org/all/20250508-rkvdec-iommu-reset-v1-1-c46b6efa6e9b@collabora.com/
[5]: https://lore.kernel.org/all/20250623-byeword-update-v2-1-cf1fc08a2e1f@collabora.com/

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
 .../rockchip/rkvdec/rkvdec-hevc-common.c      |  331 ++
 .../rockchip/rkvdec/rkvdec-hevc-common.h      |   99 +
 .../platform/rockchip/rkvdec/rkvdec-rcb.c     |  175 +
 .../platform/rockchip/rkvdec/rkvdec-rcb.h     |   29 +
 .../platform/rockchip/rkvdec/rkvdec-regs.h    |  567 ++-
 .../rockchip/rkvdec/rkvdec-vdpu381-h264.c     |  469 ++
 .../rockchip/rkvdec/rkvdec-vdpu381-hevc.c     |  596 +++
 .../rockchip/rkvdec/rkvdec-vdpu381-regs.h     |  425 ++
 .../rockchip/rkvdec/rkvdec-vdpu383-h264.c     |  583 +++
 .../rockchip/rkvdec/rkvdec-vdpu383-hevc.c     |  687 +++
 .../rockchip/rkvdec/rkvdec-vdpu383-regs.h     |  284 ++
 .../platform/rockchip/rkvdec/rkvdec-vp9.c     |  230 +-
 .../media/platform/rockchip/rkvdec/rkvdec.c   |  565 ++-
 .../media/platform/rockchip/rkvdec/rkvdec.h   |   39 +
 20 files changed, 9073 insertions(+), 1189 deletions(-)
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
2.50.0


