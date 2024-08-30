Return-Path: <linux-media+bounces-17197-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E13965798
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2024 08:27:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9A6D41F248EA
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2024 06:27:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB8101531F1;
	Fri, 30 Aug 2024 06:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Ood/uSLu"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A301509A8;
	Fri, 30 Aug 2024 06:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724999215; cv=none; b=Mr9QazYTwCr7Qt3Ja0Ap0TVzCa/5CRQe20cS3oX/8jENr/KAcvfF9hbwvjhqNpi23oytXI2xsNWd+OkIj0dBd1lkrs7K7sxK11vVnvYUVzeVjcHPnc1oKcQlba2S97hYpzjmpFTVqlTxRQXOM6dQzn6smuHAl7rX52GyYdPMD94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724999215; c=relaxed/simple;
	bh=WDN9FmBgZj8QXTrCitWtIt6mtxXYsvNYG8bn+i3uL/E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CsX1QDupxnAf0qzcTEeua8lCZej7qqyp3zFHItgIoG1yQTysmnPCkh9uBa0y22fLrK4k9+678N0LoKG9dHEqrNNl1Bt1UT62FIvWrki44YDf/jMU/+9CNIbF9MtjU0rf5tdRM4OOrLd3jJjn8Q4+5AgV1g4DHLhi/1PzTwnSHIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Ood/uSLu; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (unknown [IPv6:2405:201:2015:f873:55f8:639e:8e9f:12ec])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3C929524;
	Fri, 30 Aug 2024 08:25:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724999143;
	bh=WDN9FmBgZj8QXTrCitWtIt6mtxXYsvNYG8bn+i3uL/E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ood/uSLufGPsUUsduOlxI2p8h72La/RDCoN1Ba4ZqG8TQpcFMkUETql8SZPs+1HMs
	 dp6GyDOBbHJaWm4WuTRHL2A7SAfnMODw7VLdcuAAAvkTcIORROfowigSpifOxctP+d
	 T8DrhtXRLcNZ8vN+at1bsuqc3IDN+/tWgW4Szyno=
From: Umang Jain <umang.jain@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	open list <linux-kernel@vger.kernel.org>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>
Subject: [PATCH v2 1/2] media: imx335: Rectify name of mode struct
Date: Fri, 30 Aug 2024 11:56:38 +0530
Message-ID: <20240830062639.72947-2-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240830062639.72947-1-umang.jain@ideasonboard.com>
References: <20240830062639.72947-1-umang.jain@ideasonboard.com>
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
Reviewed-by: Tommaso Merciai <tomm.merciai@gmail.com>
Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 drivers/media/i2c/imx335.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/imx335.c b/drivers/media/i2c/imx335.c
index 54a1de53d497..5a4519957f9d 100644
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


