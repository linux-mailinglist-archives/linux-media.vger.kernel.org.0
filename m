Return-Path: <linux-media+bounces-4082-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EA26F838E07
	for <lists+linux-media@lfdr.de>; Tue, 23 Jan 2024 12:58:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 89C8D1F24EFE
	for <lists+linux-media@lfdr.de>; Tue, 23 Jan 2024 11:58:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 703085D917;
	Tue, 23 Jan 2024 11:58:43 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66FBC57892;
	Tue, 23 Jan 2024 11:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706011123; cv=none; b=XL5rs40MCLjFd7yPjHT+qtyoq3n4AFKmOKc2EsnkONK5Vtq4OBprMY5xVseevUX6BEa6wKTOS3wlX5DC269gjR6bg59hwNjuFd2OkHoxaBInBK7tPl5WriMRRbEbFVhw5wy792wlRMY9oMqQZMGRGmh+78CdmduLLGNoejRkjgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706011123; c=relaxed/simple;
	bh=w02NdBJoFqY0vZSuqNExrYeAyaGSswbt57WtzJSYnAc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mGRRtKXWWyHZKAdT6CwhUHnDG8SOMnn1NgYKeWFzXsp7XvvQv/TgQZA210XTHQdr8RK3Wl99EZ2iJfK382Sdc5bWUAhrAtDOwikZlMSR3XZve3/4jgUCKqQ+ou/aH3U9EFa6FT3WUjRoOYkpGP8fawkY88sqXZX+9DMSyATyjq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.05,214,1701097200"; 
   d="scan'208";a="195342068"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 23 Jan 2024 20:58:41 +0900
Received: from localhost.localdomain (unknown [10.226.93.36])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 65B484001B60;
	Tue, 23 Jan 2024 20:58:37 +0900 (JST)
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
Subject: [PATCH 3/4] media: platform: rzg2l-cru: rzg2l-video: Fix image processing initialization
Date: Tue, 23 Jan 2024 11:58:20 +0000
Message-Id: <20240123115821.292787-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240123115821.292787-1-biju.das.jz@bp.renesas.com>
References: <20240123115821.292787-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As per section 35.3.1 Starting Reception for the MIPI CSI-2 Input on the
latest hardware manual(R01UH0914EJ0140 Rev.1.40) it is mentioned that
initialize the AXI master first and then initialize the image processing.
Fix the start procedure as per the hardware manual.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
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


