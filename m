Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D75221A195D
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2020 03:00:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726443AbgDHBAG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Apr 2020 21:00:06 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:50719 "EHLO
        out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726437AbgDHBAF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 7 Apr 2020 21:00:05 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id E0A3E5C005D;
        Tue,  7 Apr 2020 21:00:03 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Tue, 07 Apr 2020 21:00:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm2; bh=geBpTybH7E3rdFCCql7LS3kZxJ
        h8KzFXdfL8MpTm4uA=; b=jOBy3fU38YnhzEUfC4/mB1kKkL8tcsO9JEJ3+s/yka
        b+xYN0diHSWT21W5zEE6CXkVQt4PgKgf+ATQV66BEv9sjkAzty2SFtMHTDduvjfK
        r2UqfLhDO11vM65XBsB6CYfZxkaAbaPItONbs/E2hu9dN9S2xbdk28d5X0lh+eSm
        CK+8KCR/iYYdFbAyGxkrGsPRzk8xvF/Wh0VgqxOa0nZ6NAA7f1UHACe29ZPVdHCA
        n05duRzY0x3idz1mVqnv/CbKK0PmWx/NWBvR4nTC6dHnCNiPKZfcsp7tts7/+ZZm
        nAs9vaE7I04PdOHC1lai7khAWHtWKB0hlewOn3IS/ixw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=geBpTybH7E3rdFCCq
        l7LS3kZxJh8KzFXdfL8MpTm4uA=; b=pEqCV0wO+MDMwY+wxBZVCqFuVGL91EzVN
        ofb5xgeZFseBvnZNV7aZnJxgK3WLS41kyxYS2EILx+KpN5X5blwSsCbs9sXDvCN5
        aMZf4NbgG3AJBX0PazlcybtF5B1ywUR08CqZiCE4ECgqyszy9uHSRNx+5ZRnEhrV
        LF4jTi4DqhEKF7wyVA/FINxbEro0bKtc55/LYyeKIZYsE8ZXlEIM14GwTLA61OaH
        2Tp5jHeFCK6Spd/kdVIvlfmGi5kAhF1o6vV4TY0a/sbtlynIIfQZbjTqsBgQzaqt
        kA/x7jPEZLgV9hOiM1tW6h09TubFwD9/NDToxkQgLEUnJaVSPbKKA==
X-ME-Sender: <xms:EyKNXrFpZNtXB-Ah0Z_zSpQlmSy20Ke6-3zo7lbaFobrOfVHl8iMoA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudeigdegudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghlucfj
    ohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecukfhppeejtd
    drudefhedrudegkedrudehudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
    mhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:EyKNXlxMvOBaB7C7rloDBhAqCrqSim83kP5pE24z-XsRh-3oedFtBg>
    <xmx:EyKNXtHm5ye2HVR8SJ5dnwVjifsPeXGyRTMRkym5rIo6EpjXQzirpQ>
    <xmx:EyKNXqulDchRhFbr50Hd5S2cgAXEJrRXEcHcXcc1u8_NWWNYzKPJBA>
    <xmx:EyKNXq9ZZEoKLuS6DpU7Ab3ZjiWCIZzExonr2w3lZIAKqv0QJbShJQ>
Received: from titanium.stl.sholland.net (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
        by mail.messagingengine.com (Postfix) with ESMTPA id 77F39328005D;
        Tue,  7 Apr 2020 21:00:02 -0400 (EDT)
From:   Samuel Holland <samuel@sholland.org>
To:     Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-sunxi@googlegroups.com,
        Samuel Holland <samuel@sholland.org>
Subject: [PATCH] media: cedrus: Implement runtime PM
Date:   Tue,  7 Apr 2020 20:02:32 -0500
Message-Id: <20200408010232.48432-1-samuel@sholland.org>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This allows the VE clocks and PLL_VE to be disabled most of the time.

Since the device is stateless, each frame gets a separate runtime PM
reference. Enable autosuspend so the PM callbacks are not run before and
after every frame.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

I tested this with v4l2-request-test. I don't have the setup to do
anything more complicated at the moment.

---
 drivers/staging/media/sunxi/cedrus/cedrus.c   |   7 ++
 .../staging/media/sunxi/cedrus/cedrus_hw.c    | 115 ++++++++++++------
 .../staging/media/sunxi/cedrus/cedrus_hw.h    |   3 +
 3 files changed, 88 insertions(+), 37 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index 3fad5edccd17..9aa1fc8a6c26 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -16,6 +16,7 @@
 #include <linux/platform_device.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/pm.h>
 
 #include <media/v4l2-device.h>
 #include <media/v4l2-ioctl.h>
@@ -474,6 +475,11 @@ static int cedrus_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct dev_pm_ops cedrus_dev_pm_ops = {
+	SET_RUNTIME_PM_OPS(cedrus_hw_suspend,
+			   cedrus_hw_resume, NULL)
+};
+
 static const struct cedrus_variant sun4i_a10_cedrus_variant = {
 	.mod_rate	= 320000000,
 };
@@ -559,6 +565,7 @@ static struct platform_driver cedrus_driver = {
 	.driver		= {
 		.name		= CEDRUS_NAME,
 		.of_match_table	= of_match_ptr(cedrus_dt_match),
+		.pm		= &cedrus_dev_pm_ops,
 	},
 };
 module_platform_driver(cedrus_driver);
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
index daf5f244f93b..b84814d5afe4 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
@@ -19,6 +19,7 @@
 #include <linux/dma-mapping.h>
 #include <linux/interrupt.h>
 #include <linux/clk.h>
+#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
 #include <linux/soc/sunxi/sunxi_sram.h>
@@ -63,6 +64,8 @@ int cedrus_engine_enable(struct cedrus_ctx *ctx, enum cedrus_codec codec)
 	if (ctx->src_fmt.width > 2048)
 		reg |= VE_MODE_PIC_WIDTH_MORE_2048;
 
+	pm_runtime_get_sync(ctx->dev->dev);
+
 	cedrus_write(ctx->dev, VE_MODE, reg);
 
 	return 0;
@@ -71,6 +74,9 @@ int cedrus_engine_enable(struct cedrus_ctx *ctx, enum cedrus_codec codec)
 void cedrus_engine_disable(struct cedrus_dev *dev)
 {
 	cedrus_write(dev, VE_MODE, VE_MODE_DISABLED);
+
+	pm_runtime_mark_last_busy(dev->dev);
+	pm_runtime_put_autosuspend(dev->dev);
 }
 
 void cedrus_dst_format_set(struct cedrus_dev *dev,
@@ -134,12 +140,72 @@ static irqreturn_t cedrus_irq(int irq, void *data)
 	else
 		state = VB2_BUF_STATE_DONE;
 
+	cedrus_engine_disable(dev);
+
 	v4l2_m2m_buf_done_and_job_finish(ctx->dev->m2m_dev, ctx->fh.m2m_ctx,
 					 state);
 
 	return IRQ_HANDLED;
 }
 
+int cedrus_hw_resume(struct device *d)
+{
+	struct cedrus_dev *dev = dev_get_drvdata(d);
+	int ret;
+
+	ret = clk_prepare_enable(dev->ahb_clk);
+	if (ret) {
+		dev_err(dev->dev, "Failed to enable AHB clock\n");
+
+		return ret;
+	}
+
+	ret = clk_prepare_enable(dev->mod_clk);
+	if (ret) {
+		dev_err(dev->dev, "Failed to enable MOD clock\n");
+
+		goto err_ahb_clk;
+	}
+
+	ret = clk_prepare_enable(dev->ram_clk);
+	if (ret) {
+		dev_err(dev->dev, "Failed to enable RAM clock\n");
+
+		goto err_mod_clk;
+	}
+
+	ret = reset_control_reset(dev->rstc);
+	if (ret) {
+		dev_err(dev->dev, "Failed to apply reset\n");
+
+		goto err_ram_clk;
+	}
+
+	return 0;
+
+err_ram_clk:
+	clk_disable_unprepare(dev->ram_clk);
+err_mod_clk:
+	clk_disable_unprepare(dev->mod_clk);
+err_ahb_clk:
+	clk_disable_unprepare(dev->ahb_clk);
+
+	return ret;
+}
+
+int cedrus_hw_suspend(struct device *d)
+{
+	struct cedrus_dev *dev = dev_get_drvdata(d);
+
+	reset_control_assert(dev->rstc);
+
+	clk_disable_unprepare(dev->ram_clk);
+	clk_disable_unprepare(dev->mod_clk);
+	clk_disable_unprepare(dev->ahb_clk);
+
+	return 0;
+}
+
 int cedrus_hw_probe(struct cedrus_dev *dev)
 {
 	const struct cedrus_variant *variant;
@@ -236,42 +302,19 @@ int cedrus_hw_probe(struct cedrus_dev *dev)
 		goto err_sram;
 	}
 
-	ret = clk_prepare_enable(dev->ahb_clk);
-	if (ret) {
-		dev_err(dev->dev, "Failed to enable AHB clock\n");
-
-		goto err_sram;
-	}
-
-	ret = clk_prepare_enable(dev->mod_clk);
-	if (ret) {
-		dev_err(dev->dev, "Failed to enable MOD clock\n");
-
-		goto err_ahb_clk;
-	}
-
-	ret = clk_prepare_enable(dev->ram_clk);
-	if (ret) {
-		dev_err(dev->dev, "Failed to enable RAM clock\n");
-
-		goto err_mod_clk;
-	}
-
-	ret = reset_control_reset(dev->rstc);
-	if (ret) {
-		dev_err(dev->dev, "Failed to apply reset\n");
-
-		goto err_ram_clk;
+	pm_runtime_set_autosuspend_delay(dev->dev, 1000);
+	pm_runtime_use_autosuspend(dev->dev);
+	pm_runtime_enable(dev->dev);
+	if (!pm_runtime_enabled(dev->dev)) {
+		ret = cedrus_hw_resume(dev->dev);
+		if (ret)
+			goto err_pm;
 	}
 
 	return 0;
 
-err_ram_clk:
-	clk_disable_unprepare(dev->ram_clk);
-err_mod_clk:
-	clk_disable_unprepare(dev->mod_clk);
-err_ahb_clk:
-	clk_disable_unprepare(dev->ahb_clk);
+err_pm:
+	pm_runtime_disable(dev->dev);
 err_sram:
 	sunxi_sram_release(dev->dev);
 err_mem:
@@ -282,11 +325,9 @@ int cedrus_hw_probe(struct cedrus_dev *dev)
 
 void cedrus_hw_remove(struct cedrus_dev *dev)
 {
-	reset_control_assert(dev->rstc);
-
-	clk_disable_unprepare(dev->ram_clk);
-	clk_disable_unprepare(dev->mod_clk);
-	clk_disable_unprepare(dev->ahb_clk);
+	pm_runtime_disable(dev->dev);
+	if (!pm_runtime_status_suspended(dev->dev))
+		cedrus_hw_suspend(dev->dev);
 
 	sunxi_sram_release(dev->dev);
 
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_hw.h b/drivers/staging/media/sunxi/cedrus/cedrus_hw.h
index 604ff932fbf5..17822b470a1e 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_hw.h
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_hw.h
@@ -22,6 +22,9 @@ void cedrus_engine_disable(struct cedrus_dev *dev);
 void cedrus_dst_format_set(struct cedrus_dev *dev,
 			   struct v4l2_pix_format *fmt);
 
+int cedrus_hw_resume(struct device *dev);
+int cedrus_hw_suspend(struct device *dev);
+
 int cedrus_hw_probe(struct cedrus_dev *dev);
 void cedrus_hw_remove(struct cedrus_dev *dev);
 
-- 
2.24.1

