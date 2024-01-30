Return-Path: <linux-media+bounces-4440-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A55168429B3
	for <lists+linux-media@lfdr.de>; Tue, 30 Jan 2024 17:41:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D8AE11C246BE
	for <lists+linux-media@lfdr.de>; Tue, 30 Jan 2024 16:41:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 498F41272B3;
	Tue, 30 Jan 2024 16:41:25 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1C158612C;
	Tue, 30 Jan 2024 16:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706632884; cv=none; b=YoW1kjKjZRaUMDRRS2pG78UL+OxwlIkpmexbGC+PoKo7gEZsrfBV4/GWFEMAQwMFw4f45ZkiDMOOWwb9PRI2vQHIJENi5VkTWEsEfhwNhsxaM1E+4wKQVaiuac40dn9iz3sx7/GCn2d659Z6aSvAhdVA9JPokM91IoCaf2JHjzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706632884; c=relaxed/simple;
	bh=8ixBQm+pgtUggLI9BZ6kZHDGNhG5Kd7cjL1HuRfUS4g=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=epP1Vo/MFDJQ0lMOYY8tTbUwOX6bWzu9eNaO71tOIjMCW+eEISttJQZhS+OErLalV2Hc7+ZScMWKy2MYSgeIiIjCipJS3m8Wdt+CudMmyePQUTyEaw21nH0L5mBNKxsdBmlDEHvw/9CL5Jm8jOM/E3D5XUweLBf25CwmsMkg9f8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.05,230,1701097200"; 
   d="scan'208";a="192261111"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 31 Jan 2024 01:41:21 +0900
Received: from localhost.localdomain (unknown [10.226.92.244])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id EEBC6400297E;
	Wed, 31 Jan 2024 01:41:17 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-media@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 RESEND 0/4] RZ/G2L CSI/CRU improvements
Date: Tue, 30 Jan 2024 16:41:11 +0000
Message-Id: <20240130164115.116613-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series aims to sync the CSI/CRU driver code with the latest
hardware manual (R01UH0914EJ0140 Rev.1.40).

v1->v2:
 * Updated commit description for patch#1 removing deprecated for
   SET_RUNTIME_PM_OPS() macro.
 * Aligned RUNTIME_PM_OPS() macro.
 * Added Rb tag from Laurent for patch#2 and #3.
 * Replaced usleep_range()->fsleep().
 * Added blank space after manual in commit description for patch#{2,3}.
 * Dropped clk-provider.h and __clk_is_enabled() as consumer clk should
   not use it. Plan to send RFC for clk_disable_unprepare_sync() in ccf.

Biju Das (4):
  media: platform: rzg2l-cru: rzg2l-csi2: Switch to RUNTIME_PM_OPS()
  media: platform: rzg2l-cru: rzg2l-ip: Add delay after D-PHY reset
  media: platform: rzg2l-cru: rzg2l-video: Fix image processing
    initialization
  media: platform: rzg2l-cru: rzg2l-video: Restructure clk handling

 .../platform/renesas/rzg2l-cru/rzg2l-cru.h    |  3 -
 .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   | 37 +++++----
 .../platform/renesas/rzg2l-cru/rzg2l-ip.c     | 18 ++--
 .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 83 ++++++++-----------
 4 files changed, 62 insertions(+), 79 deletions(-)

-- 
2.25.1


