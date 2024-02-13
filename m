Return-Path: <linux-media+bounces-5097-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 32338853994
	for <lists+linux-media@lfdr.de>; Tue, 13 Feb 2024 19:12:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 65B051C20B8D
	for <lists+linux-media@lfdr.de>; Tue, 13 Feb 2024 18:12:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAB0D605C7;
	Tue, 13 Feb 2024 18:12:43 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E069D604D8;
	Tue, 13 Feb 2024 18:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707847963; cv=none; b=Tzx2IGoCaFeaRiwgwJYyH/6w2WnykqGgK+pkRGUBZB/K4OTKlQ7y6JxnhaTNakWfmUvpzYIPpFP4oYNUqGal0V8J1kG28hIyb2Z/jcRvJpKF8dZXoaCUWAAbhyncxJyhRCGLcPCBx0AnNeTtfS6vfqP+lkaIVJHd49vuO4YFupY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707847963; c=relaxed/simple;
	bh=XFtLXNFMRLVAPAUHfGDJGYsa0BKabFaP7n/oc0+oJl4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jeFdXHM36OddDWkL3CEXEB0mKfKKh/FGykktJHwuL+29sGoL5KqIs78xN9YjbJlWLTpy4pWeLLV3xK7gH79aqB3o7XnGgnDOIph/4ruffrv/cNK/KyhtdZRUv/t4EqrvMHZQMjrX6aKu4Lo+hIfZHycJttLZdanVIAJlBS8Gygg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.06,157,1705330800"; 
   d="scan'208";a="197718665"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 14 Feb 2024 03:12:39 +0900
Received: from localhost.localdomain (unknown [10.226.93.58])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id A75D140617B1;
	Wed, 14 Feb 2024 03:12:35 +0900 (JST)
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
Subject: [PATCH v3 0/5] RZ/G2L CSI/CRU improvements
Date: Tue, 13 Feb 2024 18:12:28 +0000
Message-Id: <20240213181233.242316-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series aims to sync the CSI/CRU driver code with the latest
hardware manual (R01UH0914EJ0145 Rev.1.45).

v2->v3:
 * Added Rb tag from Laurent for patch#1.
 * Updated commit header and description for patch#4
 * Patch#4 split the patch into 2. Restructuring of vclk for link
   reception is handled in patch#4 and fixing start reception procedure
   is handled in patch#5.
v1->v2:
 * Updated commit description for patch#1 removing deprecated for
   SET_RUNTIME_PM_OPS() macro.
 * Aligned RUNTIME_PM_OPS() macro.
 * Added Rb tag from Laurent for patch#2 and #3.
 * Replaced usleep_range()->fsleep().
 * Added blank space after manual in commit description for patch#{2,3}.
 * Dropped clk-provider.h and __clk_is_enabled() as consumer clk should
   not use it. Plan to send RFC for clk_disable_unprepare_sync() in ccf.

Biju Das (5):
  media: platform: rzg2l-cru: rzg2l-csi2: Switch to RUNTIME_PM_OPS()
  media: platform: rzg2l-cru: rzg2l-ip: Add delay after D-PHY reset
  media: platform: rzg2l-cru: rzg2l-video: Fix image processing
    initialization
  media: platform: rzg2l-cru: rzg2l-csi2: Restructure vclk handling
  media: platform: rzg2l-cru: rzg2l-video: Fix start reception procedure

 .../platform/renesas/rzg2l-cru/rzg2l-cru.h    |  3 -
 .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   | 37 +++++----
 .../platform/renesas/rzg2l-cru/rzg2l-ip.c     | 18 ++--
 .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 83 ++++++++-----------
 4 files changed, 62 insertions(+), 79 deletions(-)

-- 
2.25.1


