Return-Path: <linux-media+bounces-3782-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D93FE8300A1
	for <lists+linux-media@lfdr.de>; Wed, 17 Jan 2024 08:40:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7173D287D74
	for <lists+linux-media@lfdr.de>; Wed, 17 Jan 2024 07:40:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0AE6D26D;
	Wed, 17 Jan 2024 07:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="iXnyG1To"
X-Original-To: linux-media@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B71F7BE58
	for <linux-media@vger.kernel.org>; Wed, 17 Jan 2024 07:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705477188; cv=none; b=stasLz/S7hw/1NRk0kTUSOgp8giHhEuH5eg2VYMl8vsGpjqVVE85Xr0Xv4/hdJ9wMP5+VYGW7VtvZF3GsDj4vmmWBq3mI08ZJ/PP1oeUvyrYNi7kEudk51dsncLOmCHhSydqqUTT957NlvN6He0HhTTpjoxz1cdMENv3e/VHskI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705477188; c=relaxed/simple;
	bh=cEr/f2fq2rWgh9f5glliqtALSg+wKbqzB+zipkoBX7U=;
	h=DKIM-Signature:X-IronPort-AV:Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding; b=S7o7gdSilJcH7u0roErgYOF1pa7K/jsh5w82O3Z1k1BZPRUEMAJLeO0GWXrY3bqgFHadaQHc5QsCgpgwCy8uEzM9jN0bkx+lk1lSo+4vFN+qHaI09+xicWwJ/BGTJapPAyy6U0hNtFFlqoozWmR7iE4qZAZpCHphp9QTJ2hTs7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=iXnyG1To; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1705477186; x=1737013186;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fwlrTwiTfAYgmlTntDpgBnO+hrZ59tahxQFasdR+rcs=;
  b=iXnyG1Toby+3x8B+OlKKQzKlfVFqahS1tRwB8o9htyC+4GCNmCSrPpSE
   07/Khy5+xCHa+grDI/WVFJktsOODQfbXkxB1a/71C9QZIsbYbJIHATApI
   gccxP+oSyt8sp29VXDG0TojTX6ezAHmd2p8DhIYSTlLu2UZA9Qxrkin92
   sfk73Rt3zGUj8wLytYzcSC8xt4QbHLPgLhtGdOOl5OHfOe9D1jehqC8T1
   UbmK0d42SHmBi7bKUz7KFCZtYlBG8pud3gvtyyrcJu1IyhH170qTF/Cro
   AViXNjgK6UGIV2WvPFRsxTr2TQNZCx6XayTZK94qRG0SWPgm6rmfg6fcR
   Q==;
X-IronPort-AV: E=Sophos;i="6.05,200,1701126000"; 
   d="scan'208";a="34931179"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 17 Jan 2024 08:39:39 +0100
Received: from steina-w.tq-net.de (steina-w.tq-net.de [10.123.53.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 943C7280075;
	Wed, 17 Jan 2024 08:39:38 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Michael Riesch <michael.riesch@wolfvision.net>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Gerald Loacker <gerald.loacker@wolfvision.net>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-media@vger.kernel.org
Subject: [PATCH v4 2/2] media: i2c: imx415: Add more clock configurations
Date: Wed, 17 Jan 2024 08:39:36 +0100
Message-Id: <20240117073936.2812336-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240117073936.2812336-1-alexander.stein@ew.tq-group.com>
References: <20240117073936.2812336-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Complete the list from "INCK Setting" section in IMX415-AAQR-C
(Rev. E19504, 2019/05/21). For consistency suffix all lane rate values by
UL, which is needed for 2376000000 anyway.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/media/i2c/imx415.c | 265 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 260 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/imx415.c b/drivers/media/i2c/imx415.c
index e52437fb5087f..a20b0db330d34 100644
--- a/drivers/media/i2c/imx415.c
+++ b/drivers/media/i2c/imx415.c
@@ -114,7 +114,7 @@ struct imx415_clk_params {
 /* INCK Settings - includes all lane rate and INCK dependent registers */
 static const struct imx415_clk_params imx415_clk_params[] = {
 	{
-		.lane_rate = 594000000,
+		.lane_rate = 594000000UL,
 		.inck = 27000000,
 		.regs[0] = { IMX415_BCWAIT_TIME, 0x05D },
 		.regs[1] = { IMX415_CPWAIT_TIME, 0x042 },
@@ -129,7 +129,37 @@ static const struct imx415_clk_params imx415_clk_params[] = {
 		.regs[10] = { IMX415_TXCLKESC_FREQ, 0x06C0 },
 	},
 	{
-		.lane_rate = 720000000,
+		.lane_rate = 594000000UL,
+		.inck = 37125000,
+		.regs[0] = { IMX415_BCWAIT_TIME, 0x07F },
+		.regs[1] = { IMX415_CPWAIT_TIME, 0x05B },
+		.regs[2] = { IMX415_SYS_MODE, 0x7 },
+		.regs[3] = { IMX415_INCKSEL1, 0x00 },
+		.regs[4] = { IMX415_INCKSEL2, 0x24 },
+		.regs[5] = { IMX415_INCKSEL3, 0x080 },
+		.regs[6] = { IMX415_INCKSEL4, 0x0E0 },
+		.regs[7] = { IMX415_INCKSEL5, 0x24 },
+		.regs[8] = { IMX415_INCKSEL6, 0x0 },
+		.regs[9] = { IMX415_INCKSEL7, 0x1 },
+		.regs[10] = { IMX415_TXCLKESC_FREQ, 0x0984 },
+	},
+	{
+		.lane_rate = 594000000UL,
+		.inck = 74250000,
+		.regs[0] = { IMX415_BCWAIT_TIME, 0x0FF },
+		.regs[1] = { IMX415_CPWAIT_TIME, 0x0B6 },
+		.regs[2] = { IMX415_SYS_MODE, 0x7 },
+		.regs[3] = { IMX415_INCKSEL1, 0x00 },
+		.regs[4] = { IMX415_INCKSEL2, 0x28 },
+		.regs[5] = { IMX415_INCKSEL3, 0x080 },
+		.regs[6] = { IMX415_INCKSEL4, 0x0E0 },
+		.regs[7] = { IMX415_INCKSEL5, 0x28 },
+		.regs[8] = { IMX415_INCKSEL6, 0x0 },
+		.regs[9] = { IMX415_INCKSEL7, 0x1 },
+		.regs[10] = { IMX415_TXCLKESC_FREQ, 0x1290 },
+	},
+	{
+		.lane_rate = 720000000UL,
 		.inck = 24000000,
 		.regs[0] = { IMX415_BCWAIT_TIME, 0x054 },
 		.regs[1] = { IMX415_CPWAIT_TIME, 0x03B },
@@ -144,7 +174,22 @@ static const struct imx415_clk_params imx415_clk_params[] = {
 		.regs[10] = { IMX415_TXCLKESC_FREQ, 0x0600 },
 	},
 	{
-		.lane_rate = 891000000,
+		.lane_rate = 720000000UL,
+		.inck = 72000000,
+		.regs[0] = { IMX415_BCWAIT_TIME, 0x0F8 },
+		.regs[1] = { IMX415_CPWAIT_TIME, 0x0B0 },
+		.regs[2] = { IMX415_SYS_MODE, 0x9 },
+		.regs[3] = { IMX415_INCKSEL1, 0x00 },
+		.regs[4] = { IMX415_INCKSEL2, 0x28 },
+		.regs[5] = { IMX415_INCKSEL3, 0x0A0 },
+		.regs[6] = { IMX415_INCKSEL4, 0x0E0 },
+		.regs[7] = { IMX415_INCKSEL5, 0x28 },
+		.regs[8] = { IMX415_INCKSEL6, 0x0 },
+		.regs[9] = { IMX415_INCKSEL7, 0x1 },
+		.regs[10] = { IMX415_TXCLKESC_FREQ, 0x1200 },
+	},
+	{
+		.lane_rate = 891000000UL,
 		.inck = 27000000,
 		.regs[0] = { IMX415_BCWAIT_TIME, 0x05D },
 		.regs[1] = { IMX415_CPWAIT_TIME, 0x042 },
@@ -159,7 +204,37 @@ static const struct imx415_clk_params imx415_clk_params[] = {
 		.regs[10] = { IMX415_TXCLKESC_FREQ, 0x06C0 },
 	},
 	{
-		.lane_rate = 1440000000,
+		.lane_rate = 891000000UL,
+		.inck = 37125000,
+		.regs[0] = { IMX415_BCWAIT_TIME, 0x07F },
+		.regs[1] = { IMX415_CPWAIT_TIME, 0x05B },
+		.regs[2] = { IMX415_SYS_MODE, 0x5 },
+		.regs[3] = { IMX415_INCKSEL1, 0x00 },
+		.regs[4] = { IMX415_INCKSEL2, 0x24 },
+		.regs[5] = { IMX415_INCKSEL3, 0x0C0 },
+		.regs[6] = { IMX415_INCKSEL4, 0x0E0 },
+		.regs[7] = { IMX415_INCKSEL5, 0x24 },
+		.regs[8] = { IMX415_INCKSEL6, 0x0 },
+		.regs[9] = { IMX415_INCKSEL7, 0x1 },
+		.regs[10] = { IMX415_TXCLKESC_FREQ, 0x0948 },
+	},
+	{
+		.lane_rate = 891000000UL,
+		.inck = 74250000,
+		.regs[0] = { IMX415_BCWAIT_TIME, 0x0FF },
+		.regs[1] = { IMX415_CPWAIT_TIME, 0x0B6 },
+		.regs[2] = { IMX415_SYS_MODE, 0x5 },
+		.regs[3] = { IMX415_INCKSEL1, 0x00 },
+		.regs[4] = { IMX415_INCKSEL2, 0x28 },
+		.regs[5] = { IMX415_INCKSEL3, 0x0C0 },
+		.regs[6] = { IMX415_INCKSEL4, 0x0E0 },
+		.regs[7] = { IMX415_INCKSEL5, 0x28 },
+		.regs[8] = { IMX415_INCKSEL6, 0x0 },
+		.regs[9] = { IMX415_INCKSEL7, 0x1 },
+		.regs[10] = { IMX415_TXCLKESC_FREQ, 0x1290 },
+	},
+	{
+		.lane_rate = 1440000000UL,
 		.inck = 24000000,
 		.regs[0] = { IMX415_BCWAIT_TIME, 0x054 },
 		.regs[1] = { IMX415_CPWAIT_TIME, 0x03B },
@@ -174,7 +249,22 @@ static const struct imx415_clk_params imx415_clk_params[] = {
 		.regs[10] = { IMX415_TXCLKESC_FREQ, 0x0600 },
 	},
 	{
-		.lane_rate = 1485000000,
+		.lane_rate = 1440000000UL,
+		.inck = 72000000,
+		.regs[0] = { IMX415_BCWAIT_TIME, 0x0F8 },
+		.regs[1] = { IMX415_CPWAIT_TIME, 0x0B0 },
+		.regs[2] = { IMX415_SYS_MODE, 0x8 },
+		.regs[3] = { IMX415_INCKSEL1, 0x00 },
+		.regs[4] = { IMX415_INCKSEL2, 0x28 },
+		.regs[5] = { IMX415_INCKSEL3, 0x0A0 },
+		.regs[6] = { IMX415_INCKSEL4, 0x0E0 },
+		.regs[7] = { IMX415_INCKSEL5, 0x28 },
+		.regs[8] = { IMX415_INCKSEL6, 0x1 },
+		.regs[9] = { IMX415_INCKSEL7, 0x0 },
+		.regs[10] = { IMX415_TXCLKESC_FREQ, 0x1200 },
+	},
+	{
+		.lane_rate = 1485000000UL,
 		.inck = 27000000,
 		.regs[0] = { IMX415_BCWAIT_TIME, 0x05D },
 		.regs[1] = { IMX415_CPWAIT_TIME, 0x042 },
@@ -188,6 +278,171 @@ static const struct imx415_clk_params imx415_clk_params[] = {
 		.regs[9] = { IMX415_INCKSEL7, 0x0 },
 		.regs[10] = { IMX415_TXCLKESC_FREQ, 0x06C0 },
 	},
+	{
+		.lane_rate = 1485000000UL,
+		.inck = 37125000,
+		.regs[0] = { IMX415_BCWAIT_TIME, 0x07F },
+		.regs[1] = { IMX415_CPWAIT_TIME, 0x05B },
+		.regs[2] = { IMX415_SYS_MODE, 0x8 },
+		.regs[3] = { IMX415_INCKSEL1, 0x00 },
+		.regs[4] = { IMX415_INCKSEL2, 0x24 },
+		.regs[5] = { IMX415_INCKSEL3, 0x0A0 },
+		.regs[6] = { IMX415_INCKSEL4, 0x0E0 },
+		.regs[7] = { IMX415_INCKSEL5, 0x24 },
+		.regs[8] = { IMX415_INCKSEL6, 0x1 },
+		.regs[9] = { IMX415_INCKSEL7, 0x0 },
+		.regs[10] = { IMX415_TXCLKESC_FREQ, 0x0948 },
+	},
+	{
+		.lane_rate = 1485000000UL,
+		.inck = 74250000,
+		.regs[0] = { IMX415_BCWAIT_TIME, 0x0FF },
+		.regs[1] = { IMX415_CPWAIT_TIME, 0x0B6 },
+		.regs[2] = { IMX415_SYS_MODE, 0x8 },
+		.regs[3] = { IMX415_INCKSEL1, 0x00 },
+		.regs[4] = { IMX415_INCKSEL2, 0x28 },
+		.regs[5] = { IMX415_INCKSEL3, 0x0A0 },
+		.regs[6] = { IMX415_INCKSEL4, 0x0E0 },
+		.regs[7] = { IMX415_INCKSEL5, 0x28 },
+		.regs[8] = { IMX415_INCKSEL6, 0x1 },
+		.regs[9] = { IMX415_INCKSEL7, 0x0 },
+		.regs[10] = { IMX415_TXCLKESC_FREQ, 0x1290 },
+	},
+	{
+		.lane_rate = 1782000000UL,
+		.inck = 27000000,
+		.regs[0] = { IMX415_BCWAIT_TIME, 0x05D },
+		.regs[1] = { IMX415_CPWAIT_TIME, 0x042 },
+		.regs[2] = { IMX415_SYS_MODE, 0x4 },
+		.regs[3] = { IMX415_INCKSEL1, 0x00 },
+		.regs[4] = { IMX415_INCKSEL2, 0x23 },
+		.regs[5] = { IMX415_INCKSEL3, 0x0C6 },
+		.regs[6] = { IMX415_INCKSEL4, 0x0E7 },
+		.regs[7] = { IMX415_INCKSEL5, 0x23 },
+		.regs[8] = { IMX415_INCKSEL6, 0x1 },
+		.regs[9] = { IMX415_INCKSEL7, 0x0 },
+		.regs[10] = { IMX415_TXCLKESC_FREQ, 0x06C0 },
+	},
+	{
+		.lane_rate = 1782000000UL,
+		.inck = 37125000,
+		.regs[0] = { IMX415_BCWAIT_TIME, 0x07F },
+		.regs[1] = { IMX415_CPWAIT_TIME, 0x05B },
+		.regs[2] = { IMX415_SYS_MODE, 0x4 },
+		.regs[3] = { IMX415_INCKSEL1, 0x00 },
+		.regs[4] = { IMX415_INCKSEL2, 0x24 },
+		.regs[5] = { IMX415_INCKSEL3, 0x0C0 },
+		.regs[6] = { IMX415_INCKSEL4, 0x0E0 },
+		.regs[7] = { IMX415_INCKSEL5, 0x24 },
+		.regs[8] = { IMX415_INCKSEL6, 0x1 },
+		.regs[9] = { IMX415_INCKSEL7, 0x0 },
+		.regs[10] = { IMX415_TXCLKESC_FREQ, 0x0948 },
+	},
+	{
+		.lane_rate = 1782000000UL,
+		.inck = 74250000,
+		.regs[0] = { IMX415_BCWAIT_TIME, 0x0FF },
+		.regs[1] = { IMX415_CPWAIT_TIME, 0x0B6 },
+		.regs[2] = { IMX415_SYS_MODE, 0x4 },
+		.regs[3] = { IMX415_INCKSEL1, 0x00 },
+		.regs[4] = { IMX415_INCKSEL2, 0x28 },
+		.regs[5] = { IMX415_INCKSEL3, 0x0C0 },
+		.regs[6] = { IMX415_INCKSEL4, 0x0E0 },
+		.regs[7] = { IMX415_INCKSEL5, 0x28 },
+		.regs[8] = { IMX415_INCKSEL6, 0x1 },
+		.regs[9] = { IMX415_INCKSEL7, 0x0 },
+		.regs[10] = { IMX415_TXCLKESC_FREQ, 0x1290 },
+	},
+	{
+		.lane_rate = 2079000000UL,
+		.inck = 27000000,
+		.regs[0] = { IMX415_BCWAIT_TIME, 0x05D },
+		.regs[1] = { IMX415_CPWAIT_TIME, 0x042 },
+		.regs[2] = { IMX415_SYS_MODE, 0x2 },
+		.regs[3] = { IMX415_INCKSEL1, 0x00 },
+		.regs[4] = { IMX415_INCKSEL2, 0x23 },
+		.regs[5] = { IMX415_INCKSEL3, 0x0E7 },
+		.regs[6] = { IMX415_INCKSEL4, 0x0E7 },
+		.regs[7] = { IMX415_INCKSEL5, 0x23 },
+		.regs[8] = { IMX415_INCKSEL6, 0x1 },
+		.regs[9] = { IMX415_INCKSEL7, 0x0 },
+		.regs[10] = { IMX415_TXCLKESC_FREQ, 0x06C0 },
+	},
+	{
+		.lane_rate = 2079000000UL,
+		.inck = 37125000,
+		.regs[0] = { IMX415_BCWAIT_TIME, 0x07F },
+		.regs[1] = { IMX415_CPWAIT_TIME, 0x05B },
+		.regs[2] = { IMX415_SYS_MODE, 0x2 },
+		.regs[3] = { IMX415_INCKSEL1, 0x00 },
+		.regs[4] = { IMX415_INCKSEL2, 0x24 },
+		.regs[5] = { IMX415_INCKSEL3, 0x0E0 },
+		.regs[6] = { IMX415_INCKSEL4, 0x0E0 },
+		.regs[7] = { IMX415_INCKSEL5, 0x24 },
+		.regs[8] = { IMX415_INCKSEL6, 0x1 },
+		.regs[9] = { IMX415_INCKSEL7, 0x0 },
+		.regs[10] = { IMX415_TXCLKESC_FREQ, 0x0948 },
+	},
+	{
+		.lane_rate = 2079000000UL,
+		.inck = 74250000,
+		.regs[0] = { IMX415_BCWAIT_TIME, 0x0FF },
+		.regs[1] = { IMX415_CPWAIT_TIME, 0x0B6 },
+		.regs[2] = { IMX415_SYS_MODE, 0x2 },
+		.regs[3] = { IMX415_INCKSEL1, 0x00 },
+		.regs[4] = { IMX415_INCKSEL2, 0x28 },
+		.regs[5] = { IMX415_INCKSEL3, 0x0E0 },
+		.regs[6] = { IMX415_INCKSEL4, 0x0E0 },
+		.regs[7] = { IMX415_INCKSEL5, 0x28 },
+		.regs[8] = { IMX415_INCKSEL6, 0x1 },
+		.regs[9] = { IMX415_INCKSEL7, 0x0 },
+		.regs[10] = { IMX415_TXCLKESC_FREQ, 0x1290 },
+	},
+	{
+		.lane_rate = 2376000000UL,
+		.inck = 27000000,
+		.regs[0] = { IMX415_BCWAIT_TIME, 0x05D },
+		.regs[1] = { IMX415_CPWAIT_TIME, 0x042 },
+		.regs[2] = { IMX415_SYS_MODE, 0x0 },
+		.regs[3] = { IMX415_INCKSEL1, 0x00 },
+		.regs[4] = { IMX415_INCKSEL2, 0x23 },
+		.regs[5] = { IMX415_INCKSEL3, 0x108 },
+		.regs[6] = { IMX415_INCKSEL4, 0x0E7 },
+		.regs[7] = { IMX415_INCKSEL5, 0x23 },
+		.regs[8] = { IMX415_INCKSEL6, 0x1 },
+		.regs[9] = { IMX415_INCKSEL7, 0x0 },
+		.regs[10] = { IMX415_TXCLKESC_FREQ, 0x06C0 },
+	},
+	{
+		.lane_rate = 2376000000UL,
+		.inck = 37125000,
+		.regs[0] = { IMX415_BCWAIT_TIME, 0x07F },
+		.regs[1] = { IMX415_CPWAIT_TIME, 0x05B },
+		.regs[2] = { IMX415_SYS_MODE, 0x0 },
+		.regs[3] = { IMX415_INCKSEL1, 0x00 },
+		.regs[4] = { IMX415_INCKSEL2, 0x24 },
+		.regs[5] = { IMX415_INCKSEL3, 0x100 },
+		.regs[6] = { IMX415_INCKSEL4, 0x0E0 },
+		.regs[7] = { IMX415_INCKSEL5, 0x24 },
+		.regs[8] = { IMX415_INCKSEL6, 0x1 },
+		.regs[9] = { IMX415_INCKSEL7, 0x0 },
+		.regs[10] = { IMX415_TXCLKESC_FREQ, 0x0948 },
+	},
+	{
+		.lane_rate = 2376000000UL,
+		.inck = 74250000,
+		.regs[0] = { IMX415_BCWAIT_TIME, 0x0FF },
+		.regs[1] = { IMX415_CPWAIT_TIME, 0x0B6 },
+		.regs[2] = { IMX415_SYS_MODE, 0x0 },
+		.regs[3] = { IMX415_INCKSEL1, 0x00 },
+		.regs[4] = { IMX415_INCKSEL2, 0x28 },
+		.regs[5] = { IMX415_INCKSEL3, 0x100 },
+		.regs[6] = { IMX415_INCKSEL4, 0x0E0 },
+		.regs[7] = { IMX415_INCKSEL5, 0x28 },
+		.regs[8] = { IMX415_INCKSEL6, 0x1 },
+		.regs[9] = { IMX415_INCKSEL7, 0x0 },
+		.regs[10] = { IMX415_TXCLKESC_FREQ, 0x1290 },
+	},
 };
 
 /* all-pixel 2-lane 720 Mbps 15.74 Hz mode */
-- 
2.34.1


