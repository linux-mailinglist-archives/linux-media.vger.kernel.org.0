Return-Path: <linux-media+bounces-4435-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D788842977
	for <lists+linux-media@lfdr.de>; Tue, 30 Jan 2024 17:36:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8DD94B25F4D
	for <lists+linux-media@lfdr.de>; Tue, 30 Jan 2024 16:36:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D95E485C6F;
	Tue, 30 Jan 2024 16:36:09 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FDDF36102;
	Tue, 30 Jan 2024 16:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706632569; cv=none; b=fn+onMoL/XKcAM6BXeIigKkXN+lC9kD4uN0qI43JDuKgFzi6Xc1TtLt5+s1tcsaGeSadt7jeLGvyj1I48V/OhUQjNt4BvV1DosOYzkHbPFmUSZnjFCDMFtZK+757fymQ2FWLW5wP3p29vN6y6UH7LcqDMK6701tzXsPIvCjWVh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706632569; c=relaxed/simple;
	bh=8ixBQm+pgtUggLI9BZ6kZHDGNhG5Kd7cjL1HuRfUS4g=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YmFEiId6Q8qeSJMM7OkwngKuD4KfKJqSgT8u/EY1HCaPziMubA48t5Zm9gTfxIpZ3xWlkX7zWYWaW2ZYUrfDNoeI0BnQTsFN7uPqXYGtJcXFbYiiKBeGIm41G45Bt6mWl2HZN85YCYrn9oWuftt7tzspqUz8Bdez3UtoWsJYWjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.05,230,1701097200"; 
   d="scan'208";a="192260837"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 31 Jan 2024 01:35:59 +0900
Received: from localhost.localdomain (unknown [10.226.92.244])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 285C14021B44;
	Wed, 31 Jan 2024 01:35:55 +0900 (JST)
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
Subject: [PATCH v2 0/4] clk_disable_unprepare
Date: Tue, 30 Jan 2024 16:35:49 +0000
Message-Id: <20240130163553.116249-1-biju.das.jz@bp.renesas.com>
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


