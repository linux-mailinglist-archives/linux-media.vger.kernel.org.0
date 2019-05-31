Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B05A30ABF
	for <lists+linux-media@lfdr.de>; Fri, 31 May 2019 10:55:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727066AbfEaIz0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 May 2019 04:55:26 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:50609 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726843AbfEaIz0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 May 2019 04:55:26 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.89)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1hWdJt-0003zW-37; Fri, 31 May 2019 10:55:25 +0200
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Jonas Karlman <jonas@kwiboo.se>, devicetree@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH v3 03/10] media: hantro: add PM runtime resume callback
Date:   Fri, 31 May 2019 10:55:16 +0200
Message-Id: <20190531085523.10892-4-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190531085523.10892-1-p.zabel@pengutronix.de>
References: <20190531085523.10892-1-p.zabel@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

It seems that on i.MX8MQ the power domain controller does not propagate
resets to the VPU cores on resume. Add a callback to allow implementing
manual reset of the VPU cores after ungating the power domain.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/staging/media/hantro/hantro.h     |  2 ++
 drivers/staging/media/hantro/hantro_drv.c | 13 +++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/drivers/staging/media/hantro/hantro.h b/drivers/staging/media/hantro/hantro.h
index 14e685428203..296b9ffad547 100644
--- a/drivers/staging/media/hantro/hantro.h
+++ b/drivers/staging/media/hantro/hantro.h
@@ -56,6 +56,7 @@ struct hantro_codec_ops;
  * @codec:			Supported codecs
  * @codec_ops:			Codec ops.
  * @init:			Initialize hardware.
+ * @runtime_resume:		reenable hardware after power gating
  * @vepu_irq:			encoder interrupt handler
  * @vdpu_irq:			decoder interrupt handler
  * @clk_names:			array of clock names
@@ -71,6 +72,7 @@ struct hantro_variant {
 	unsigned int codec;
 	const struct hantro_codec_ops *codec_ops;
 	int (*init)(struct hantro_dev *vpu);
+	int (*runtime_resume)(struct hantro_dev *vpu);
 	irqreturn_t (*vepu_irq)(int irq, void *priv);
 	irqreturn_t (*vdpu_irq)(int irq, void *priv);
 	const char *clk_names[HANTRO_MAX_CLOCKS];
diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
index e4390aa5c213..fb5f140dbaae 100644
--- a/drivers/staging/media/hantro/hantro_drv.c
+++ b/drivers/staging/media/hantro/hantro_drv.c
@@ -831,9 +831,22 @@ static int hantro_remove(struct platform_device *pdev)
 	return 0;
 }
 
+#ifdef CONFIG_PM
+static int hantro_runtime_resume(struct device *dev)
+{
+	struct hantro_dev *vpu = dev_get_drvdata(dev);
+
+	if (vpu->variant->runtime_resume)
+		return vpu->variant->runtime_resume(vpu);
+
+	return 0;
+}
+#endif
+
 static const struct dev_pm_ops hantro_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
 				pm_runtime_force_resume)
+	SET_RUNTIME_PM_OPS(NULL, hantro_runtime_resume, NULL)
 };
 
 static struct platform_driver hantro_driver = {
-- 
2.20.1

