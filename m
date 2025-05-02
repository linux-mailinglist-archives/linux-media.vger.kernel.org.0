Return-Path: <linux-media+bounces-31615-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E9D1AA759E
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 17:08:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7BCB31736D9
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 15:08:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A09CF25D1E1;
	Fri,  2 May 2025 15:07:13 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D5C525B1FA
	for <linux-media@vger.kernel.org>; Fri,  2 May 2025 15:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746198433; cv=none; b=jah3FxnAjOLs0TUAfD9HYuHlKsLDtcNkhMMYWSXHCrZjGsQK++qGEfj+fdr4RsKC2BQqZ8wVlvuWf0N8uUluy7zCnbGwpC7OHVDRsdjTxZr2DCExxYlSEg6xbI0WF17Gliez901qgoJFe4uTZcuZHplazXtrL0Sx8MyLfaRBMAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746198433; c=relaxed/simple;
	bh=ovx3GVZBG348SQWXrvTALn0ZGZEI4xJVWp/EdS7tQQ4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Wzpalsn9ePnUEIIkC0zSO4nKXYKA7C4niZCQNhjk1sxdoQJK93WpF37UimhQ0zDvWvSQJv/8JyQwcvojBLhJRgNqfQt+yJFPvsanIExf7Xqt1j9UscI5qutnMpaO55XlDIIvSmwirD77rrcPVWkpuiz0hwzweDD/+L6k11IE92Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1uAryc-0004HG-GP; Fri, 02 May 2025 17:06:58 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: nicolas.dufresne@collabora.com,
	benjamin.gaignard@collabora.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org,
	shawnguo@kernel.org,
	Sascha Hauer <s.hauer@pengutronix.de>,
	kernel@pengutronix.de,
	festevam@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	paulk@sys-base.io,
	hverkuil@xs4all.nl,
	laurent.pinchart@ideasonboard.com,
	sebastian.fricke@collabora.com,
	ming.qian@nxp.com
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [RFC PATCH 10/11] media: verisilicon: split read/write debug
Date: Fri,  2 May 2025 17:05:13 +0200
Message-Id: <20250502150513.4169098-11-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250502150513.4169098-1-m.felsch@pengutronix.de>
References: <20250502150513.4169098-1-m.felsch@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: m.felsch@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org

Allow a more fine grain read/write debug control. This is very useful in
case of hantro_reg_write() is used to not interfere the write debug
prints with read debug prints.

While on it, make the reg/swreg value clear for new developers.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 drivers/media/platform/verisilicon/hantro.h | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro.h b/drivers/media/platform/verisilicon/hantro.h
index e464bec47b11..7b031df5b0a1 100644
--- a/drivers/media/platform/verisilicon/hantro.h
+++ b/drivers/media/platform/verisilicon/hantro.h
@@ -367,7 +367,8 @@ struct hantro_decoded_buffer {
  * bit 3 - contents of big controls from userspace
  * bit 4 - detail fmt, ctrl, buffer q/dq information
  * bit 5 - detail function enter/leave trace information
- * bit 6 - register write/read information
+ * bit 6 - register write information
+ * bit 7 - register read information
  */
 extern int hantro_debug;
 
@@ -391,13 +392,13 @@ static __always_inline struct hantro_ctx *fh_to_ctx(struct v4l2_fh *fh)
 static __always_inline void vepu_write_relaxed(struct hantro_dev *vpu,
 					       u32 val, u32 reg)
 {
-	vpu_debug(6, "0x%04x = 0x%08x\n", reg / 4, val);
+	vpu_debug(6, "0x%04x (swreg%u) = 0x%08x\n", reg, reg / 4, val);
 	writel_relaxed(val, vpu->enc_base + reg);
 }
 
 static __always_inline void vepu_write(struct hantro_dev *vpu, u32 val, u32 reg)
 {
-	vpu_debug(6, "0x%04x = 0x%08x\n", reg / 4, val);
+	vpu_debug(6, "0x%04x (swreg%u) = 0x%08x\n", reg, reg / 4, val);
 	writel(val, vpu->enc_base + reg);
 }
 
@@ -405,20 +406,20 @@ static __always_inline u32 vepu_read(struct hantro_dev *vpu, u32 reg)
 {
 	u32 val = readl(vpu->enc_base + reg);
 
-	vpu_debug(6, "0x%04x = 0x%08x\n", reg / 4, val);
+	vpu_debug(7, "0x%04x (swreg%u) = 0x%08x\n", reg, reg / 4, val);
 	return val;
 }
 
 static __always_inline void vdpu_write_relaxed(struct hantro_dev *vpu,
 					       u32 val, u32 reg)
 {
-	vpu_debug(6, "0x%04x = 0x%08x\n", reg / 4, val);
+	vpu_debug(6, "0x%04x (swreg%u) = 0x%08x\n", reg, reg / 4, val);
 	writel_relaxed(val, vpu->dec_base + reg);
 }
 
 static __always_inline void vdpu_write(struct hantro_dev *vpu, u32 val, u32 reg)
 {
-	vpu_debug(6, "0x%04x = 0x%08x\n", reg / 4, val);
+	vpu_debug(6, "0x%04x (swreg%u) = 0x%08x\n", reg, reg / 4, val);
 	writel(val, vpu->dec_base + reg);
 }
 
@@ -433,7 +434,7 @@ static __always_inline u32 vdpu_read(struct hantro_dev *vpu, u32 reg)
 {
 	u32 val = readl(vpu->dec_base + reg);
 
-	vpu_debug(6, "0x%04x = 0x%08x\n", reg / 4, val);
+	vpu_debug(7, "0x%04x (swreg%u) = 0x%08x\n", reg, reg / 4, val);
 	return val;
 }
 
-- 
2.39.5


