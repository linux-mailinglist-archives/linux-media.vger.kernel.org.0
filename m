Return-Path: <linux-media+bounces-4516-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B378443C2
	for <lists+linux-media@lfdr.de>; Wed, 31 Jan 2024 17:10:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 167D41C25B15
	for <lists+linux-media@lfdr.de>; Wed, 31 Jan 2024 16:10:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB7CB12AADC;
	Wed, 31 Jan 2024 16:10:10 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98BAA12A148;
	Wed, 31 Jan 2024 16:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706717410; cv=none; b=rzARPV+z0JDZU/hRiMuqNm0r7T3FLmFnbc90+tUYubOlA4Xd3YMjhbv/J5dITqa48aaE10NS6+ZDsysBdRZYEsqda/gKWp/FiKJmxTrvT9k54ZunsRV90kxczOqfrQlgjebslNN0Z6xF2zg30nbykOHkc8ydMZC1yKnER35f0fQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706717410; c=relaxed/simple;
	bh=12cYme6x/taHknHj3lS2U5xAwlTbyFCg7tD1Xg65RHw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=psURhYxthAARU4yO82AOPnllhZt9ydJJ6rmghdtRLH6gFd2Pn40iDoH7c+cenlUVFtOFlCRvHsmzEImj/Zq2LMNwntVaWPIUbQ3Is3MrAv2YhzPftZP4LM399uS5vBGZdBH63b8jmqXw3Jd34OHsgYephkTVFlVXbE2lbQYHUr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.05,231,1701097200"; 
   d="scan'208";a="192402259"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 01 Feb 2024 01:10:07 +0900
Received: from localhost.localdomain (unknown [10.226.92.227])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 5D7774018855;
	Thu,  1 Feb 2024 01:10:03 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-media@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH RFC 3/3] media: platform: rzg2l-cru: rzg2l-video: Use clk_disable_unprepare_sync()
Date: Wed, 31 Jan 2024 16:09:47 +0000
Message-Id: <20240131160947.96171-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240131160947.96171-1-biju.das.jz@bp.renesas.com>
References: <20240131160947.96171-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the clk_disable_unprepare_sync() for synchronizing clk gating in
rzg2l_csi2_mipi_link_enable()

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
index e68fcdaea207..8d8f1632168f 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
@@ -387,7 +387,7 @@ static int rzg2l_csi2_mipi_link_enable(struct rzg2l_csi2 *csi2)
 	rzg2l_csi2_write(csi2, CSI2nDTEL, 0xf778ff0f);
 	rzg2l_csi2_write(csi2, CSI2nDTEH, 0x00ffff1f);
 
-	clk_disable_unprepare(csi2->vclk);
+	clk_disable_unprepare_sync(csi2->vclk);
 
 	/* Enable LINK reception */
 	rzg2l_csi2_write(csi2, CSI2nMCT3, CSI2nMCT3_RXEN);
-- 
2.25.1


