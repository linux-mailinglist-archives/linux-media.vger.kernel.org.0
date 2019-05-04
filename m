Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0463413AA5
	for <lists+linux-media@lfdr.de>; Sat,  4 May 2019 16:40:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726776AbfEDOkb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 4 May 2019 10:40:31 -0400
Received: from mail-qk1-f194.google.com ([209.85.222.194]:41017 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726217AbfEDOkb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 4 May 2019 10:40:31 -0400
Received: by mail-qk1-f194.google.com with SMTP id g190so1383071qkf.8;
        Sat, 04 May 2019 07:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=OePHcTegD5FLNIpc+vZjgQ+IKj2BBIUebfiBxqKweyI=;
        b=FLCAnSnHKbtHJ1ga9WGXoatBWU3wYfNRq3deo+PSUpVVFaEeWRz566/5zy4EdNqs63
         wsT+k1KW1T/Swpv8FCu2gSYikebTicNhSc1uFzohPI+fO/8WhlvIoC/qoOd8JGECZvXy
         IR8diozMrXZS+9aecD8Df49wCaTK4Ge2FM3i55sFtLfCSaISOAiKIefBm+CR4vGDpI3E
         i4nonlwnK8FlS1BHuaCpKlYmJzYjdZ601ovh7+KOpgwf3u1ngm/c7I8CTOyFiBnKsqRl
         Kv+zh+BHs9jnlLbukYGhbYdhCwtSpKO59inB5JeXvE6kMdDT/ktn7wpBrC1+ADka6obD
         ShTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=OePHcTegD5FLNIpc+vZjgQ+IKj2BBIUebfiBxqKweyI=;
        b=CpkHTU0LIKTvI9i3WjJEQheOtIXdG+VuzDX7z+1kY28qaRvtXknF1gCNqS6zeDnUje
         Mz0mHyQj+Xjdhgc5BWSUxfYkyukbSA//oGvx8cN5yjlOsGQT+r0VW4btKrHeUDw/YDE3
         QPZt0uxDM3R4dH45Z23itgED1BFd93GQFNn4r9wqXNypVeqsnkn/A0L1/zPo8sRTJUf7
         fw/55wjqABtA9S6WnLPlhu0OevmOXi+PeHUbET3MTx5n6Nk8HMrWCv+jhXQ3BafuigwM
         gO4khVxmh0JhpOSGsH3zKwibyDd7ESCx2DsNzz59qRmRhktMYtdLvW+dexrC0zL6cHXE
         Ctcg==
X-Gm-Message-State: APjAAAUHSjcU4DKao4e4QUwZFB/M1C4GlX72g3Yia18w0mNdQb/N/LC/
        B7KgaGhTeLKAsBm6fN/+u5o=
X-Google-Smtp-Source: APXvYqzt09i2kWVAA3JhTqrCDNqjs97k05edJmZeC/YcOODs8ZqqkL7mAnOnz2nKyj5x+pJ1nejA3A==
X-Received: by 2002:a37:80c6:: with SMTP id b189mr12790321qkd.144.1556980830333;
        Sat, 04 May 2019 07:40:30 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:482:3c8:56cb:1049:60d2:137b])
        by smtp.gmail.com with ESMTPSA id 67sm2536815qtc.29.2019.05.04.07.40.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 04 May 2019 07:40:29 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     hverkuil-cisco@xs4all.nl
Cc:     rui.silva@linaro.org, slongerbeam@gmail.com,
        p.zabel@pengutronix.de, linux-media@vger.kernel.org,
        sebastien.szymanski@armadeus.com, otavio@ossystems.com.br,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 3/8] media: imx7-media-csi: Use devm_platform_ioremap_resource()
Date:   Sat,  4 May 2019 11:40:21 -0300
Message-Id: <20190504144027.31920-2-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190504144027.31920-1-festevam@gmail.com>
References: <20190504144027.31920-1-festevam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use devm_platform_ioremap_resource() to simplify the code a bit.

While at it, propagate the real error value in case of 
devm_platform_ioremap_resource() failure.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index 3e02cfa2f07c..e0286c322fad 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -1188,7 +1188,6 @@ static int imx7_csi_probe(struct platform_device *pdev)
 	struct device_node *node = dev->of_node;
 	struct imx_media_dev *imxmd;
 	struct imx7_csi *csi;
-	struct resource *res;
 	int ret;
 
 	csi = devm_kzalloc(&pdev->dev, sizeof(*csi), GFP_KERNEL);
@@ -1204,17 +1203,16 @@ static int imx7_csi_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	csi->irq = platform_get_irq(pdev, 0);
-	if (!res || csi->irq < 0) {
+	if (csi->irq < 0) {
 		dev_err(dev, "Missing platform resources data\n");
 		return -ENODEV;
 	}
 
-	csi->regbase = devm_ioremap_resource(dev, res);
+	csi->regbase = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(csi->regbase)) {
 		dev_err(dev, "Failed platform resources map\n");
-		return -ENODEV;
+		return PTR_ERR(csi->regbase);
 	}
 
 	spin_lock_init(&csi->irqlock);
-- 
2.17.1

