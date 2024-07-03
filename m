Return-Path: <linux-media+bounces-14573-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8154D9256FC
	for <lists+linux-media@lfdr.de>; Wed,  3 Jul 2024 11:39:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B753283BF1
	for <lists+linux-media@lfdr.de>; Wed,  3 Jul 2024 09:39:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED72413D60F;
	Wed,  3 Jul 2024 09:39:07 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-sh.amlogic.com (unknown [58.32.228.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7DAC1369AD;
	Wed,  3 Jul 2024 09:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=58.32.228.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719999547; cv=none; b=XNRhb/fTAHO/lDPuw6/SPE6PXMFwsanA3d+17nd3u1U4CNfKpiPKBrzB9leFltVpdVaa0WgOV9wUkKpE19ulFCy5nsFtZfUnxVXQJF2OJPcd3606VNTNn1tFAEGDiw4d1Fs3EEn9hM5DT+A/k1TxSJnn6YgtyBL8xYexUMbrEnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719999547; c=relaxed/simple;
	bh=o3d/OdEP4D4DDZPtnB5R7j0B3c85BtRfkViu9ZiJipw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=W6qpcDLhHmqOi32CC10/PyHEf5XMfau5hc+PUPdU/7WCFLxZkp30ztvsbF4LQeNeIVTHk/4Il1s1KJiNdGCPuFdOkQW963OFmMje3FoHKCOA6Tm5urON3EFgDkxzVn/oBV1QFGfao8BHoh1nUkEyy7eauprwbKb2e3Nc0MVMx7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; arc=none smtp.client-ip=58.32.228.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Received: from droid10-sz.amlogic.com (10.28.11.69) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.6; Wed, 3 Jul 2024
 17:39:00 +0800
From: zelong dong <zelong.dong@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>, Jerome Brunet
	<jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, "Martin
 Blumenstingl" <martin.blumenstingl@googlemail.com>
CC: <linux-media@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<kelvin.zhang@amlogic.com>, Zelong Dong <zelong.dong@amlogic.com>
Subject: [PATCH] media: rc: meson-ir: support PM suspend/resume
Date: Wed, 3 Jul 2024 17:38:58 +0800
Message-ID: <20240703093858.12655-1-zelong.dong@amlogic.com>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Zelong Dong <zelong.dong@amlogic.com>

IR Controller could be used and updated by other processor
while kernel has been suspended.
Reinitialize IR Controller just in case while kernel is resuming.

Signed-off-by: Zelong Dong <zelong.dong@amlogic.com>
---
 drivers/media/rc/meson-ir.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/media/rc/meson-ir.c b/drivers/media/rc/meson-ir.c
index 5303e6da5809..9cdb45821ecc 100644
--- a/drivers/media/rc/meson-ir.c
+++ b/drivers/media/rc/meson-ir.c
@@ -567,6 +567,32 @@ static void meson_ir_shutdown(struct platform_device *pdev)
 	spin_unlock_irqrestore(&ir->lock, flags);
 }
 
+static __maybe_unused int meson_ir_resume(struct device *dev)
+{
+	struct meson_ir *ir = dev_get_drvdata(dev);
+
+	if (ir->param->support_hw_decoder)
+		meson_ir_hw_decoder_init(ir->rc, &ir->rc->enabled_protocols);
+	else
+		meson_ir_sw_decoder_init(ir->rc);
+
+	return 0;
+}
+
+static __maybe_unused int meson_ir_suspend(struct device *dev)
+{
+	struct meson_ir *ir = dev_get_drvdata(dev);
+	unsigned long flags;
+
+	spin_lock_irqsave(&ir->lock, flags);
+	regmap_update_bits(ir->reg, IR_DEC_REG1, IR_DEC_REG1_ENABLE, 0);
+	spin_unlock_irqrestore(&ir->lock, flags);
+
+	return 0;
+}
+
+static SIMPLE_DEV_PM_OPS(meson_ir_pm_ops, meson_ir_suspend, meson_ir_resume);
+
 static const struct meson_ir_param meson6_ir_param = {
 	.support_hw_decoder = false,
 	.max_register = IR_DEC_REG1,
@@ -607,6 +633,7 @@ static struct platform_driver meson_ir_driver = {
 	.driver = {
 		.name		= DRIVER_NAME,
 		.of_match_table	= meson_ir_match,
+		.pm = pm_ptr(&meson_ir_pm_ops),
 	},
 };
 
-- 
2.35.1


