Return-Path: <linux-media+bounces-3568-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D2282AF97
	for <lists+linux-media@lfdr.de>; Thu, 11 Jan 2024 14:23:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 22725B22DE8
	for <lists+linux-media@lfdr.de>; Thu, 11 Jan 2024 13:23:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 635A219479;
	Thu, 11 Jan 2024 13:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="YLuzraUe"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43FE315EBD
	for <linux-media@vger.kernel.org>; Thu, 11 Jan 2024 13:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1704979230;
	bh=Ch+zIXbfH/CkA9GnlGmsCVz/TYMlrguj7Id6jLj8Je0=;
	h=From:To:Cc:Subject:Date:From;
	b=YLuzraUeN1M3jjwTkLLQQEGjg9WEW2AmPgh6SzgKFCG2UCTVLSisDolkpBwWPuaF8
	 0mkoiUhu+yS2FCJNVaCa9osWUmKfBlgLEGmmNkrwZ2Lv3N60pmv5PZGhVR1DAu3Rgk
	 0PdQRpzAEtysthrBUmQdal33R6Sxtak7a8STVQwqSpSnQ2KOurP9cQlVua6XPwd/fM
	 q4PKtdaaNbZgNpYjygUjEpz0u3NWer7H35WKVg/MXqaLXFmFoQQVIQrN7dKVpQnuzO
	 L5a6cMoqzuPYK0hkGk2o5LsYHpCYIWqg1Buod5lkQ93VN4NONusA2gtIVs2j4xn/i5
	 TxHPjEn+GEOww==
Received: from stla-brain-8255-1.home (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 1B5133780894;
	Thu, 11 Jan 2024 13:20:30 +0000 (UTC)
From: Julien Massot <julien.massot@collabora.com>
To: hdegoede@redhat.com
Cc: sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org,
	Julien Massot <julien.massot@collabora.com>
Subject: [PATCH] media: v4l2: cci: print leading 0 on error
Date: Thu, 11 Jan 2024 14:20:03 +0100
Message-ID: <20240111132003.2778044-1-julien.massot@collabora.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In some error cases leading '0' for register address
were missing.

Fixes: 613cbb91e9ce ("media: Add MIPI CCI register access helper functions")
Signed-off-by: Julien Massot <julien.massot@collabora.com>
---
 drivers/media/v4l2-core/v4l2-cci.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-cci.c b/drivers/media/v4l2-core/v4l2-cci.c
index 10005c80f43b..ee3475bed37f 100644
--- a/drivers/media/v4l2-core/v4l2-cci.c
+++ b/drivers/media/v4l2-core/v4l2-cci.c
@@ -32,7 +32,7 @@ int cci_read(struct regmap *map, u32 reg, u64 *val, int *err)
 
 	ret = regmap_bulk_read(map, reg, buf, len);
 	if (ret) {
-		dev_err(regmap_get_device(map), "Error reading reg 0x%4x: %d\n",
+		dev_err(regmap_get_device(map), "Error reading reg 0x%04x: %d\n",
 			reg, ret);
 		goto out;
 	}
@@ -131,7 +131,7 @@ int cci_write(struct regmap *map, u32 reg, u64 val, int *err)
 
 	ret = regmap_bulk_write(map, reg, buf, len);
 	if (ret)
-		dev_err(regmap_get_device(map), "Error writing reg 0x%4x: %d\n",
+		dev_err(regmap_get_device(map), "Error writing reg 0x%04x: %d\n",
 			reg, ret);
 
 out:
-- 
2.43.0


