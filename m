Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 353174088F4
	for <lists+linux-media@lfdr.de>; Mon, 13 Sep 2021 12:24:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239048AbhIMKZt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Sep 2021 06:25:49 -0400
Received: from esa.microchip.iphmx.com ([68.232.153.233]:55126 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235168AbhIMKZt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Sep 2021 06:25:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1631528673; x=1663064673;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=LXY3tevlq2YZeyO3RhjMeO4/OcvgVWditq9VKBRV+Ek=;
  b=dPdjO86ZC+ceJAgBdrs9gzbepEzQEYVrGx8S0G8HlR1Fq9Kh6eJzzuOs
   Rcw2Aj74LLqDUMlYWhHPn6Zx3Z0R2Xr8IqpiGHUfvJya5v9J1yH+nXfqG
   Cpw+9m97/+sz6NPDFX9NgStRY12WlxWCIJFFFreINoGBUuPG/KFHFEoUE
   MWR6sIWdvGtEw/zQ/hk9bvQIcJwA/zeqDqzKMWT24Q3wXye/ut29BWGiY
   0tOWxzmRQJ4tbSEnAiLNRenKRuAeehOTiUOoI1YOZq6mTsSLxClP4EhKO
   OuJ2OURbjyL+5PMUYQc8+dTDa9fggY/WxPa2kBvwT8+pbkqNVaSzKhzxd
   A==;
IronPort-SDR: 2X1ID3r21phUw+LeWwyMph+JWmbZzl9/CiiqacZPPXLSQXqD0tZ9k52awUOL9168jD2WG74AXz
 Qg56sgZfH0XWCcj0re42zEcDyP5gjcOYiCW+T9vwoXu9aFtLLORFUv9ZbwXocVLllTSomQYn8T
 4cvxtxzmDz0bzez0A0iGaa5+m6nD9WaLWLF/3K0rSgM5+l7UFXwXxOAHgE0F/ufpFqsF2JEDub
 decg0AeHJlYFKqwqKjpydECwd9OePmVbmfRvt6G4hDZNjFmlGKRgBjqO/7azZdRQoWTsXP80cW
 /KrzZ3DcEdXtV4gO+86bXL5w
X-IronPort-AV: E=Sophos;i="5.85,288,1624345200"; 
   d="scan'208";a="143860533"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 Sep 2021 03:24:33 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 13 Sep 2021 03:24:33 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Mon, 13 Sep 2021 03:24:31 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <hverkuil-cisco@xs4all.nl>
CC:     <linux-media@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Eugen Hristev <eugen.hristev@microchip.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH] media: atmel: fix the ispck initialization
Date:   Mon, 13 Sep 2021 13:22:54 +0300
Message-ID: <20210913102254.108638-1-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The runtime enabling of the ISPCK (internally clocks the pipeline inside the
ISC) has to be done after the pm_runtime for the ISC dev has been started.

After the commit by Mauro:
Fixes: dd97908ee350 ("media: atmel: properly get pm_runtime")
the ISC failed to probe with the error:

atmel-sama5d2-isc f0008000.isc: failed to enable ispck: -13
atmel-sama5d2-isc: probe of f0008000.isc failed with error -13

This is because the enabling of the ispck is done too early in the probe, and
the PM runtime returns invalid request.
Thus, moved this clock enabling after pm_runtime_idle is called.

The ISPCK is required only for sama5d2 type of ISC.
Thus, add a bool inside the isc struct that is platform dependent.
For the sama7g5-isc, the enabling of the ISPCK is wrong and does not make
sense. Removed it from the sama7g5 probe. In sama7g5-isc, there is only
one clock, the MCK, which also clocks the internal pipeline of the ISC.

Adapted the clk_prepare and clk_unprepare to request the runtime PM
for both clocks (MCK and ISPCK) in case of sama5d2-isc, and the single clock
(MCK) in case of sama7g5-isc.

Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---

Hi,

This fixes the probe problem in 5.15 kernel for the ISC driver.

Eugen

 drivers/media/platform/atmel/atmel-isc-base.c | 25 ++++++------
 drivers/media/platform/atmel/atmel-isc.h      |  2 +
 .../media/platform/atmel/atmel-sama5d2-isc.c  | 39 ++++++++++---------
 .../media/platform/atmel/atmel-sama7g5-isc.c  | 22 ++---------
 4 files changed, 38 insertions(+), 50 deletions(-)

diff --git a/drivers/media/platform/atmel/atmel-isc-base.c b/drivers/media/platform/atmel/atmel-isc-base.c
index 136ab7cf36ed..ebf264b980f9 100644
--- a/drivers/media/platform/atmel/atmel-isc-base.c
+++ b/drivers/media/platform/atmel/atmel-isc-base.c
@@ -123,11 +123,9 @@ static int isc_clk_prepare(struct clk_hw *hw)
 	struct isc_clk *isc_clk = to_isc_clk(hw);
 	int ret;
 
-	if (isc_clk->id == ISC_ISPCK) {
-		ret = pm_runtime_resume_and_get(isc_clk->dev);
-		if (ret < 0)
-			return ret;
-	}
+	ret = pm_runtime_resume_and_get(isc_clk->dev);
+	if (ret < 0)
+		return ret;
 
 	return isc_wait_clk_stable(hw);
 }
@@ -138,8 +136,7 @@ static void isc_clk_unprepare(struct clk_hw *hw)
 
 	isc_wait_clk_stable(hw);
 
-	if (isc_clk->id == ISC_ISPCK)
-		pm_runtime_put_sync(isc_clk->dev);
+	pm_runtime_put_sync(isc_clk->dev);
 }
 
 static int isc_clk_enable(struct clk_hw *hw)
@@ -186,16 +183,13 @@ static int isc_clk_is_enabled(struct clk_hw *hw)
 	u32 status;
 	int ret;
 
-	if (isc_clk->id == ISC_ISPCK) {
-		ret = pm_runtime_resume_and_get(isc_clk->dev);
-		if (ret < 0)
-			return 0;
-	}
+	ret = pm_runtime_resume_and_get(isc_clk->dev);
+	if (ret < 0)
+		return 0;
 
 	regmap_read(isc_clk->regmap, ISC_CLKSR, &status);
 
-	if (isc_clk->id == ISC_ISPCK)
-		pm_runtime_put_sync(isc_clk->dev);
+	pm_runtime_put_sync(isc_clk->dev);
 
 	return status & ISC_CLK(isc_clk->id) ? 1 : 0;
 }
@@ -325,6 +319,9 @@ static int isc_clk_register(struct isc_device *isc, unsigned int id)
 	const char *parent_names[3];
 	int num_parents;
 
+	if (id == ISC_ISPCK && !isc->ispck_required)
+		return 0;
+
 	num_parents = of_clk_get_parent_count(np);
 	if (num_parents < 1 || num_parents > 3)
 		return -EINVAL;
diff --git a/drivers/media/platform/atmel/atmel-isc.h b/drivers/media/platform/atmel/atmel-isc.h
index 19cc60dfcbe0..2bfcb135ef13 100644
--- a/drivers/media/platform/atmel/atmel-isc.h
+++ b/drivers/media/platform/atmel/atmel-isc.h
@@ -178,6 +178,7 @@ struct isc_reg_offsets {
  * @hclock:		Hclock clock input (refer datasheet)
  * @ispck:		iscpck clock (refer datasheet)
  * @isc_clks:		ISC clocks
+ * @ispck_required:	ISC requires ISP Clock initialization
  * @dcfg:		DMA master configuration, architecture dependent
  *
  * @dev:		Registered device driver
@@ -252,6 +253,7 @@ struct isc_device {
 	struct clk		*hclock;
 	struct clk		*ispck;
 	struct isc_clk		isc_clks[2];
+	bool			ispck_required;
 	u32			dcfg;
 
 	struct device		*dev;
diff --git a/drivers/media/platform/atmel/atmel-sama5d2-isc.c b/drivers/media/platform/atmel/atmel-sama5d2-isc.c
index b66f1d174e9d..e29a9193bac8 100644
--- a/drivers/media/platform/atmel/atmel-sama5d2-isc.c
+++ b/drivers/media/platform/atmel/atmel-sama5d2-isc.c
@@ -454,6 +454,9 @@ static int atmel_isc_probe(struct platform_device *pdev)
 	/* sama5d2-isc - 8 bits per beat */
 	isc->dcfg = ISC_DCFG_YMBSIZE_BEATS8 | ISC_DCFG_CMBSIZE_BEATS8;
 
+	/* sama5d2-isc : ISPCK is required and mandatory */
+	isc->ispck_required = true;
+
 	ret = isc_pipeline_init(isc);
 	if (ret)
 		return ret;
@@ -476,22 +479,6 @@ static int atmel_isc_probe(struct platform_device *pdev)
 		dev_err(dev, "failed to init isc clock: %d\n", ret);
 		goto unprepare_hclk;
 	}
-
-	isc->ispck = isc->isc_clks[ISC_ISPCK].clk;
-
-	ret = clk_prepare_enable(isc->ispck);
-	if (ret) {
-		dev_err(dev, "failed to enable ispck: %d\n", ret);
-		goto unprepare_hclk;
-	}
-
-	/* ispck should be greater or equal to hclock */
-	ret = clk_set_rate(isc->ispck, clk_get_rate(isc->hclock));
-	if (ret) {
-		dev_err(dev, "failed to set ispck rate: %d\n", ret);
-		goto unprepare_clk;
-	}
-
 	ret = v4l2_device_register(dev, &isc->v4l2_dev);
 	if (ret) {
 		dev_err(dev, "unable to register v4l2 device.\n");
@@ -545,19 +532,35 @@ static int atmel_isc_probe(struct platform_device *pdev)
 	pm_runtime_enable(dev);
 	pm_request_idle(dev);
 
+	isc->ispck = isc->isc_clks[ISC_ISPCK].clk;
+
+	ret = clk_prepare_enable(isc->ispck);
+	if (ret) {
+		dev_err(dev, "failed to enable ispck: %d\n", ret);
+		goto cleanup_subdev;
+	}
+
+	/* ispck should be greater or equal to hclock */
+	ret = clk_set_rate(isc->ispck, clk_get_rate(isc->hclock));
+	if (ret) {
+		dev_err(dev, "failed to set ispck rate: %d\n", ret);
+		goto unprepare_clk;
+	}
+
 	regmap_read(isc->regmap, ISC_VERSION + isc->offsets.version, &ver);
 	dev_info(dev, "Microchip ISC version %x\n", ver);
 
 	return 0;
 
+unprepare_clk:
+	clk_disable_unprepare(isc->ispck);
+
 cleanup_subdev:
 	isc_subdev_cleanup(isc);
 
 unregister_v4l2_device:
 	v4l2_device_unregister(&isc->v4l2_dev);
 
-unprepare_clk:
-	clk_disable_unprepare(isc->ispck);
 unprepare_hclk:
 	clk_disable_unprepare(isc->hclock);
 
diff --git a/drivers/media/platform/atmel/atmel-sama7g5-isc.c b/drivers/media/platform/atmel/atmel-sama7g5-isc.c
index f2785131ff56..9c05acafd072 100644
--- a/drivers/media/platform/atmel/atmel-sama7g5-isc.c
+++ b/drivers/media/platform/atmel/atmel-sama7g5-isc.c
@@ -447,6 +447,9 @@ static int microchip_xisc_probe(struct platform_device *pdev)
 	/* sama7g5-isc RAM access port is full AXI4 - 32 bits per beat */
 	isc->dcfg = ISC_DCFG_YMBSIZE_BEATS32 | ISC_DCFG_CMBSIZE_BEATS32;
 
+	/* sama7g5-isc : ISPCK does not exist, ISC is clocked by MCK */
+	isc->ispck_required = false;
+
 	ret = isc_pipeline_init(isc);
 	if (ret)
 		return ret;
@@ -470,25 +473,10 @@ static int microchip_xisc_probe(struct platform_device *pdev)
 		goto unprepare_hclk;
 	}
 
-	isc->ispck = isc->isc_clks[ISC_ISPCK].clk;
-
-	ret = clk_prepare_enable(isc->ispck);
-	if (ret) {
-		dev_err(dev, "failed to enable ispck: %d\n", ret);
-		goto unprepare_hclk;
-	}
-
-	/* ispck should be greater or equal to hclock */
-	ret = clk_set_rate(isc->ispck, clk_get_rate(isc->hclock));
-	if (ret) {
-		dev_err(dev, "failed to set ispck rate: %d\n", ret);
-		goto unprepare_clk;
-	}
-
 	ret = v4l2_device_register(dev, &isc->v4l2_dev);
 	if (ret) {
 		dev_err(dev, "unable to register v4l2 device.\n");
-		goto unprepare_clk;
+		goto unprepare_hclk;
 	}
 
 	ret = xisc_parse_dt(dev, isc);
@@ -549,8 +537,6 @@ static int microchip_xisc_probe(struct platform_device *pdev)
 unregister_v4l2_device:
 	v4l2_device_unregister(&isc->v4l2_dev);
 
-unprepare_clk:
-	clk_disable_unprepare(isc->ispck);
 unprepare_hclk:
 	clk_disable_unprepare(isc->hclock);
 
-- 
2.25.1

