Return-Path: <linux-media+bounces-47497-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B3302C7431F
	for <lists+linux-media@lfdr.de>; Thu, 20 Nov 2025 14:26:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5EE38349887
	for <lists+linux-media@lfdr.de>; Thu, 20 Nov 2025 13:20:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3450A33C1B7;
	Thu, 20 Nov 2025 13:15:49 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx.gpxsee.org (mx.gpxsee.org [37.205.14.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F33621257E;
	Thu, 20 Nov 2025 13:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.205.14.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763644548; cv=none; b=mgVz/f2qFuJuyY2eH8j3G/WtPyR1aQ19J1/MXg8equtUVRRE3fJ1SAkFyxEzaSJg5Ut8lTUt5q21AsA2q0rwHB28EOSxtIgxg/qjk9NvLDzWXuABq7DvxxgoDO1KV7sLUQCWLqb/r2r+G9j/mjqcMhIMD1XeEJa4/rDZcX80xq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763644548; c=relaxed/simple;
	bh=4EnT5pVEonaN4L88qLB862FatgJev+Bn/qzfpnpxbp0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uTK7bxprLAgn3gZn5o+bWd9kCWV71s98HvB2kGdz0CISv6DiZtgknHNBP1pJHpzHWd8yWJDDmeq30qYB9UU0C9BWK+dD4RJe2wDICw6m+xtvCboB/gABoZOnOTOKmLCrLIHt+rAjmAXoTZ5ck9+/tFPzbdEevfT0A7N8R0d+lFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org; spf=pass smtp.mailfrom=gpxsee.org; arc=none smtp.client-ip=37.205.14.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gpxsee.org
Received: from mgb4.digiteq.red (unknown [62.77.71.229])
	by mx.gpxsee.org (Postfix) with ESMTPSA id 6506734380;
	Thu, 20 Nov 2025 14:08:37 +0100 (CET)
From: tumic@gpxsee.org
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Martin=20T=C5=AFma?= <martin.tuma@digiteqautomotive.com>
Subject: [PATCH v3 2/3] media: pci: mgb4: Add support for GMSL3 coaxial modules
Date: Thu, 20 Nov 2025 14:08:26 +0100
Message-ID: <20251120130827.1882-3-tumic@gpxsee.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251120130827.1882-1-tumic@gpxsee.org>
References: <20251120130827.1882-1-tumic@gpxsee.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Martin Tůma <martin.tuma@digiteqautomotive.com>

Add support for GMSL3 modules with a coaxial interface, a variant of the
already existing module with the id #4. The FW is the same as for all other
GMSL3 modules.

Signed-off-by: Martin Tůma <martin.tuma@digiteqautomotive.com>
---
 drivers/media/pci/mgb4/mgb4_core.h |  7 +++++--
 drivers/media/pci/mgb4/mgb4_vin.c  | 27 +++++++++++++++++++++++----
 2 files changed, 28 insertions(+), 6 deletions(-)

diff --git a/drivers/media/pci/mgb4/mgb4_core.h b/drivers/media/pci/mgb4/mgb4_core.h
index 06ef8bb44089..bfae75f30c7c 100644
--- a/drivers/media/pci/mgb4/mgb4_core.h
+++ b/drivers/media/pci/mgb4/mgb4_core.h
@@ -21,8 +21,11 @@
 #define MGB4_IS_GMSL1(mgbdev) \
 	(((mgbdev)->module_version >> 4) == 6)
 #define MGB4_IS_GMSL3(mgbdev) \
-	((((mgbdev)->module_version >> 4) >= 2) && \
-	 (((mgbdev)->module_version >> 4) <= 4))
+	(((((mgbdev)->module_version >> 4) >= 2) && \
+	  (((mgbdev)->module_version >> 4) <= 4)) || \
+	 (((mgbdev)->module_version >> 4) == 8))
+#define MGB4_IS_GMSL3C(mgbdev) \
+	(((mgbdev)->module_version >> 4) == 8)
 #define MGB4_IS_FPDL3(mgbdev) \
 	(((mgbdev)->module_version >> 4) == 1)
 #define MGB4_HAS_VOUT(mgbdev) \
diff --git a/drivers/media/pci/mgb4/mgb4_vin.c b/drivers/media/pci/mgb4/mgb4_vin.c
index be55491b52b2..e782db79686f 100644
--- a/drivers/media/pci/mgb4/mgb4_vin.c
+++ b/drivers/media/pci/mgb4/mgb4_vin.c
@@ -50,6 +50,11 @@ static const struct i2c_board_info gmsl3_deser_info[] = {
 	{I2C_BOARD_INFO("deserializer2", 0x2A)},
 };
 
+static const struct i2c_board_info gmsl3c_deser_info[] = {
+	{I2C_BOARD_INFO("deserializer1", 0x6A)},
+	{I2C_BOARD_INFO("deserializer2", 0x6C)},
+};
+
 static const struct i2c_board_info gmsl1_deser_info[] = {
 	{I2C_BOARD_INFO("deserializer1", 0x2C)},
 	{I2C_BOARD_INFO("deserializer2", 0x6C)},
@@ -67,6 +72,13 @@ static const struct mgb4_i2c_kv gmsl3_i2c[] = {
 	{0x308, 0x01, 0x01}, {0x10, 0x20, 0x20}, {0x300, 0x40, 0x40}
 };
 
+static const struct mgb4_i2c_kv gmsl3c_i2c[] = {
+	{0x01, 0x03, 0x02}, {0x300, 0x0C, 0x08}, {0x03, 0xC0, 0x00},
+	{0x1CE, 0x0E, 0x0E}, {0x11, 0x05, 0x05}, {0x05, 0xC0, 0x40},
+	{0x307, 0x0F, 0x00}, {0xA0, 0x03, 0x00}, {0x3E0, 0x07, 0x00},
+	{0x308, 0x01, 0x00}, {0x10, 0x20, 0x20}, {0x300, 0x40, 0x40}
+};
+
 static const struct mgb4_i2c_kv gmsl1_i2c[] = {
 };
 
@@ -812,10 +824,17 @@ static int deser_init(struct mgb4_vin_dev *vindev, int id)
 	struct device *dev = &vindev->mgbdev->pdev->dev;
 
 	if (MGB4_IS_GMSL3(vindev->mgbdev)) {
-		info = &gmsl3_deser_info[id];
-		addr_size = 16;
-		values = gmsl3_i2c;
-		count = ARRAY_SIZE(gmsl3_i2c);
+		if (MGB4_IS_GMSL3C(vindev->mgbdev)) {
+			info = &gmsl3c_deser_info[id];
+			addr_size = 16;
+			values = gmsl3c_i2c;
+			count = ARRAY_SIZE(gmsl3c_i2c);
+		} else {
+			info = &gmsl3_deser_info[id];
+			addr_size = 16;
+			values = gmsl3_i2c;
+			count = ARRAY_SIZE(gmsl3_i2c);
+		}
 	} else if (MGB4_IS_FPDL3(vindev->mgbdev)) {
 		info = &fpdl3_deser_info[id];
 		addr_size = 8;
-- 
2.51.2


