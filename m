Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 678F213AA4
	for <lists+linux-media@lfdr.de>; Sat,  4 May 2019 16:40:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726647AbfEDOk2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 4 May 2019 10:40:28 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:35135 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726217AbfEDOk1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 4 May 2019 10:40:27 -0400
Received: by mail-qt1-f196.google.com with SMTP id e5so10060372qtq.2;
        Sat, 04 May 2019 07:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=XBwAXDcmDgX0kUshD3oX+4mA2FacWSdfBk0R5YYOPXI=;
        b=mpVNicx0/PdEOYFoPk1IlwGxfVGyf06VnpVQuEnztgb4J/0fUXUmBWGx2L1Tu3NiOK
         cH/ZKUskfvLDVEBFC+graKrBFIfT+aNUwhR5S7XSVe0aoScP0iyG4M6V+mCVzdptGFNB
         svlO9xbNycvEpfPmtUAarNuy+vsIR/5BWjilPaxeAOt6o+2JewrJLaPsbjq/RD2kna+b
         JVmjqP2jzrCoYBgDYsJJhHmOHnr2TUklhnpcwFlkkTNtp16PMQfRTEXMVv6diBGYbU3F
         mgf9wX8BLnWyvgGwu0diIu26jCd+mlHejRJ0bpR2bdU4KJYm215p1mBXwfI1V2qyGOOR
         ZB8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=XBwAXDcmDgX0kUshD3oX+4mA2FacWSdfBk0R5YYOPXI=;
        b=oXTsbYJfTB3nxx4ksU4m0Hg+hKCtNEIkQj0kGkQ4LbylzepG/JygElT7essYGBvjBx
         fsRP82zLuXe0kQjJGDxT66B8HtY/xVPNodet5uaFhQBGZ9pLR0vVBO5EceIDI3f0O94e
         4fVpxs5BNm4/UOsVi/XJxbu0fZLx/eCEErtS7g2GOvmgLdG1WCAfn60I+jF/CyoBW29g
         2Pt81i5WMkg6Bp1cAy3tV62ZBaVb6lZPOXns8Esw/x+V4oMsFJnCJYhmHg0jEU8WYg8z
         Uy9qs/BzL8htijFb8MkXLX6tCcFkslTRLQxTyswLyzNxNovdOz4hVLT9UJqYVG9KmQQJ
         54jg==
X-Gm-Message-State: APjAAAVlwnxiFt3QTrHpXsyJqQmZnPOuUVq3xeOk67WX6TMUhCvZG5aL
        JyJ+0clSxhTg0kDLrv4PXSQ=
X-Google-Smtp-Source: APXvYqwB2DNeqRiD37TbKyG0CWA3VfmLr/CMaXELLEFcYWOYqFjIUGzjhYhM90nLOhOMh/JLvwE6JA==
X-Received: by 2002:ac8:2bcc:: with SMTP id n12mr13846968qtn.53.1556980826495;
        Sat, 04 May 2019 07:40:26 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:482:3c8:56cb:1049:60d2:137b])
        by smtp.gmail.com with ESMTPSA id 67sm2536815qtc.29.2019.05.04.07.40.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 04 May 2019 07:40:25 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     hverkuil-cisco@xs4all.nl
Cc:     rui.silva@linaro.org, slongerbeam@gmail.com,
        p.zabel@pengutronix.de, linux-media@vger.kernel.org,
        sebastien.szymanski@armadeus.com, otavio@ossystems.com.br,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 2/8] media: imx7-media-csi: Acquire a single clock
Date:   Sat,  4 May 2019 11:40:20 -0300
Message-Id: <20190504144027.31920-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As per the i.MX7D Reference Manual only the MCLK is used for
the CSI block, so only handle this single clock.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 51 ++++------------------
 1 file changed, 8 insertions(+), 43 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index 18eb5d3ecf10..3e02cfa2f07c 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -152,8 +152,6 @@
 #define CSI_CSICR18		0x48
 #define CSI_CSICR19		0x4c
 
-static const char * const imx7_csi_clk_id[] = {"axi", "dcic", "mclk"};
-
 struct imx7_csi {
 	struct device *dev;
 	struct v4l2_subdev sd;
@@ -180,9 +178,7 @@ struct imx7_csi {
 
 	void __iomem *regbase;
 	int irq;
-
-	int num_clks;
-	struct clk_bulk_data *clks;
+	struct clk *mclk;
 
 	/* active vb2 buffers to send to video dev sink */
 	struct imx_media_buffer *active_vb2_buf[2];
@@ -204,20 +200,6 @@ struct imx7_csi {
 #define imx7_csi_reg_write(_csi, _val, _offset) \
 	__raw_writel(_val, (_csi)->regbase + (_offset))
 
-static void imx7_csi_clk_enable(struct imx7_csi *csi)
-{
-	int ret;
-
-	ret = clk_bulk_prepare_enable(csi->num_clks, csi->clks);
-	if (ret < 0)
-		dev_err(csi->dev, "failed to enable clocks\n");
-}
-
-static void imx7_csi_clk_disable(struct imx7_csi *csi)
-{
-	clk_bulk_disable_unprepare(csi->num_clks, csi->clks);
-}
-
 static void imx7_csi_hw_reset(struct imx7_csi *csi)
 {
 	imx7_csi_reg_write(csi,
@@ -413,7 +395,7 @@ static void imx7_csi_init(struct imx7_csi *csi)
 	if (csi->is_init)
 		return;
 
-	imx7_csi_clk_enable(csi);
+	clk_prepare_enable(csi->mclk);
 	imx7_csi_hw_reset(csi);
 	imx7_csi_init_interface(csi);
 	imx7_csi_dmareq_rff_enable(csi);
@@ -429,7 +411,7 @@ static void imx7_csi_deinit(struct imx7_csi *csi)
 	imx7_csi_hw_reset(csi);
 	imx7_csi_init_interface(csi);
 	imx7_csi_dmareq_rff_disable(csi);
-	imx7_csi_clk_disable(csi);
+	clk_disable_unprepare(csi->mclk);
 
 	csi->is_init = false;
 }
@@ -1200,24 +1182,6 @@ static int imx7_csi_parse_endpoint(struct device *dev,
 	return fwnode_device_is_available(asd->match.fwnode) ? 0 : -EINVAL;
 }
 
-static int imx7_csi_clocks_get(struct imx7_csi *csi)
-{
-	struct device *dev = csi->dev;
-	int i;
-
-	csi->num_clks = ARRAY_SIZE(imx7_csi_clk_id);
-	csi->clks = devm_kcalloc(dev, csi->num_clks, sizeof(*csi->clks),
-				 GFP_KERNEL);
-
-	if (!csi->clks)
-		return -ENOMEM;
-
-	for (i = 0; i < csi->num_clks; i++)
-		csi->clks[i].id = imx7_csi_clk_id[i];
-
-	return devm_clk_bulk_get(dev, csi->num_clks, csi->clks);
-}
-
 static int imx7_csi_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1233,10 +1197,11 @@ static int imx7_csi_probe(struct platform_device *pdev)
 
 	csi->dev = dev;
 
-	ret = imx7_csi_clocks_get(csi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to get clocks");
-		return -ENODEV;
+	csi->mclk = devm_clk_get(&pdev->dev, "mclk");
+	if (IS_ERR(csi->mclk)) {
+		ret = PTR_ERR(csi->mclk);
+		dev_err(dev, "Failed to get mclk: %d", ret);
+		return ret;
 	}
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-- 
2.17.1

