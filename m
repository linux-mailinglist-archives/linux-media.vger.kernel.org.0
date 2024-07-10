Return-Path: <linux-media+bounces-14813-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C9792C9FF
	for <lists+linux-media@lfdr.de>; Wed, 10 Jul 2024 06:47:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9E7ED285781
	for <lists+linux-media@lfdr.de>; Wed, 10 Jul 2024 04:47:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9C2655C0A;
	Wed, 10 Jul 2024 04:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="cQ5NwANM"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623433EA6C;
	Wed, 10 Jul 2024 04:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720586811; cv=none; b=Yd+9gSy3o1jJWz4CG+lGKwxXm/vQ7YCjxluypocE161emDQjeG/kzw/3dP2+rXDTokBXhR7VAPyu4b5AHTfvrGxvUGQVQAtI0yoAPhut0xUvPJoXAqD7IIvjksF71tbtDihr8AXc+w3+STl7j9XqEI9bBM1breMl/VAkWKuSolE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720586811; c=relaxed/simple;
	bh=0nlQnSPs7lppzjFnaLcUIPCL+ZeHmaoqJH3GJRrctqw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VTlOwCBc1j1A/P1ud1jJpCrHwgaGtjb8m9eJiiJFUzhSHgxNtA0UoHRxbixWPxecs58FMp3UgENiKSNKBn9cogeZt1U9z+4W9muKuw9ySVVUwRPZ1Ssw7y+LOHeJUHQtHY214fGZW8SICS86dRPuuv1/vGEBAvKLmjNGEiYB0Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=cQ5NwANM; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (unknown [IPv6:2405:201:2015:f873:55f8:639e:8e9f:12ec])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2E9A3114C;
	Wed, 10 Jul 2024 06:46:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1720586774;
	bh=0nlQnSPs7lppzjFnaLcUIPCL+ZeHmaoqJH3GJRrctqw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cQ5NwANMKbEAXbOSI6n3oET4WBB9/ycarJwqeksHmhDcn8GD8xGjkeQA6QvzpBkKY
	 pKWxMo6kT8xt8I8M/LOZL+VP2NgIl16jePQY5ylktnTJ+UZIkSzP5O7M2PBrYeRY4w
	 6fkyIwFZM5e2C4rRrRRSix4FZyZwzNtUnebdAe9U=
From: Umang Jain <umang.jain@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Alexander Shiyan <eagle.alexander923@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	open list <linux-kernel@vger.kernel.org>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH 1/2] media: imx335: Rectify name of mode struct
Date: Wed, 10 Jul 2024 10:16:31 +0530
Message-ID: <20240710044633.81372-2-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240710044633.81372-1-umang.jain@ideasonboard.com>
References: <20240710044633.81372-1-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In commit 81495a59baeb ("media: imx335: Fix active area height discrepency")
the height for the mode struct was rectified to '1944'. However, the
name of mode struct is still reflecting to '1940'. Update it.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 drivers/media/i2c/imx335.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/imx335.c b/drivers/media/i2c/imx335.c
index 990d74214cc2..6c1e61b6696b 100644
--- a/drivers/media/i2c/imx335.c
+++ b/drivers/media/i2c/imx335.c
@@ -252,7 +252,7 @@ static const int imx335_tpg_val[] = {
 };
 
 /* Sensor mode registers */
-static const struct cci_reg_sequence mode_2592x1940_regs[] = {
+static const struct cci_reg_sequence mode_2592x1944_regs[] = {
 	{ IMX335_REG_MODE_SELECT, IMX335_MODE_STANDBY },
 	{ IMX335_REG_MASTER_MODE, 0x00 },
 	{ IMX335_REG_WINMODE, 0x04 },
@@ -416,8 +416,8 @@ static const struct imx335_mode supported_mode = {
 	.vblank_max = 133060,
 	.pclk = 396000000,
 	.reg_list = {
-		.num_of_regs = ARRAY_SIZE(mode_2592x1940_regs),
-		.regs = mode_2592x1940_regs,
+		.num_of_regs = ARRAY_SIZE(mode_2592x1944_regs),
+		.regs = mode_2592x1944_regs,
 	},
 };
 
-- 
2.45.0


