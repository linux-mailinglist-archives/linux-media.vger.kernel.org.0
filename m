Return-Path: <linux-media+bounces-50893-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 082E5D3179A
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 14:03:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 97317306CA4B
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 13:02:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E364324886A;
	Fri, 16 Jan 2026 13:02:46 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx.gpxsee.org (mx.gpxsee.org [37.205.14.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B89238D52;
	Fri, 16 Jan 2026 13:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.205.14.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768568566; cv=none; b=UfbZdTeyDCQUsbPN12UHYwcQD9c2bzDD2sLHU879U5dGK9JqOeF3T9Ve0EFsJ/ELzj+gUWf30kh0u0RZFgP7RsYdm96BjIxcO+d1PeL8PzVJpLKHblorEdPNJkbNAMgD17jIEdebZjEQiHTg+xpugGC9t6Kivb81Jnj3Rjk/nSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768568566; c=relaxed/simple;
	bh=8opqSxVWF1gye+oymeUfoEreZ+GfEImVMWC3ZD4LAX8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OkuaX4JE9QCxMS5mCp8aBro43FiKoSNelhyHH5g6BwCEGltQkXVqULM+iVfMP+fm59QmTUoNBY35ptUx0ydY9svoK1bFL5JWpsHzCPww8LNNikf+jFdEtxAGSFsWmRBcQuq0s2kdQ+GyfLEcn+ZVAGDyyaZCOIG8a9UrD/gZtlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org; spf=pass smtp.mailfrom=gpxsee.org; arc=none smtp.client-ip=37.205.14.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gpxsee.org
Received: from localhost (unknown [62.77.71.229])
	by mx.gpxsee.org (Postfix) with ESMTPSA id B8C9D7A645;
	Fri, 16 Jan 2026 13:56:12 +0100 (CET)
From: tumic@gpxsee.org
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Martin=20T=C5=AFma?= <martin.tuma@digiteqautomotive.com>
Subject: [PATCH RESEND v3 2/3] media: pci: mgb4: Add support for GMSL3 coaxial modules
Date: Fri, 16 Jan 2026 13:55:54 +0100
Message-ID: <20260116125555.5287-3-tumic@gpxsee.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260116125555.5287-1-tumic@gpxsee.org>
References: <20260116125555.5287-1-tumic@gpxsee.org>
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
2.52.0


