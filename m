Return-Path: <linux-media+bounces-4438-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E241C84297C
	for <lists+linux-media@lfdr.de>; Tue, 30 Jan 2024 17:37:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9F7AC2940F6
	for <lists+linux-media@lfdr.de>; Tue, 30 Jan 2024 16:37:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE14F128388;
	Tue, 30 Jan 2024 16:36:15 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 711EF1272D6;
	Tue, 30 Jan 2024 16:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706632575; cv=none; b=I5Wwr3PJ6ynng0Mc8fpwpa1xpmXXk9j1SvDHCmC35lt5Pal9pjF+zu/Bv8zbJTUhMCShd2HIiZQVrcHiSDejcuVXEZkJqnbMaigGIQqlaE4ihtxhbHZLeGuonx8mCAmuZzvtrNYcS6u8aZnAcVifNQpt92jgspnG8QnoymVWsVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706632575; c=relaxed/simple;
	bh=IghZs2bbWXVfJqQHcH/5+KZwhwJf5cgD6WVbZzRE/XU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qzk85gXbQAS3FHMrWSi5+yQWLZNZhdrYLIoUymfE4r9tLHwu4Hqm66OPS4e3hYE5cJ2wmOV2o1lPewP8u8N0ApEybnXTqulnWkB1PdDzbCjeuG3iQ05qFTqyPZIdKtdIpEKcvqREhkyfv10zvTLkHoYZ9PVmq3JaSXaKDUVZNG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.05,230,1701097200"; 
   d="scan'208";a="196171530"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 31 Jan 2024 01:36:13 +0900
Received: from localhost.localdomain (unknown [10.226.92.244])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 2852C4021750;
	Wed, 31 Jan 2024 01:36:08 +0900 (JST)
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
	linux-renesas-soc@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v2 3/4] media: platform: rzg2l-cru: rzg2l-video: Fix image processing initialization
Date: Tue, 30 Jan 2024 16:35:52 +0000
Message-Id: <20240130163553.116249-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240130163553.116249-1-biju.das.jz@bp.renesas.com>
References: <20240130163553.116249-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As per section 35.3.1 Starting Reception for the MIPI CSI-2 Input on the
latest hardware manual (R01UH0914EJ0140 Rev.1.40) it is mentioned that
initialize the AXI master first and then initialize the image processing.
Fix the start procedure as per the hardware manual.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
v1->v2:
 * Added Rb tag from Laurent.
 * Added a blank space after manual in commit description.
---
 .../media/platform/renesas/rzg2l-cru/rzg2l-video.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index d0ffa90bc656..a7d6fe831d54 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -430,13 +430,6 @@ int rzg2l_cru_start_image_processing(struct rzg2l_cru_dev *cru)
 
 	spin_lock_irqsave(&cru->qlock, flags);
 
-	/* Initialize image convert */
-	ret = rzg2l_cru_initialize_image_conv(cru, fmt);
-	if (ret) {
-		spin_unlock_irqrestore(&cru->qlock, flags);
-		return ret;
-	}
-
 	/* Select a video input */
 	rzg2l_cru_write(cru, CRUnCTRL, CRUnCTRL_VINSEL(0));
 
@@ -450,6 +443,13 @@ int rzg2l_cru_start_image_processing(struct rzg2l_cru_dev *cru)
 	/* Initialize the AXI master */
 	rzg2l_cru_initialize_axi(cru);
 
+	/* Initialize image convert */
+	ret = rzg2l_cru_initialize_image_conv(cru, fmt);
+	if (ret) {
+		spin_unlock_irqrestore(&cru->qlock, flags);
+		return ret;
+	}
+
 	/* Enable interrupt */
 	rzg2l_cru_write(cru, CRUnIE, CRUnIE_EFE);
 
-- 
2.25.1


