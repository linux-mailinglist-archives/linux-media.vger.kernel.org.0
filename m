Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E947F3FD32D
	for <lists+linux-media@lfdr.de>; Wed,  1 Sep 2021 07:45:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242051AbhIAFqp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Sep 2021 01:46:45 -0400
Received: from mx21.baidu.com ([220.181.3.85]:42288 "EHLO baidu.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230046AbhIAFql (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 1 Sep 2021 01:46:41 -0400
Received: from BJHW-Mail-Ex07.internal.baidu.com (unknown [10.127.64.17])
        by Forcepoint Email with ESMTPS id 5C518D4C053D243FE942;
        Wed,  1 Sep 2021 13:45:42 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BJHW-Mail-Ex07.internal.baidu.com (10.127.64.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Wed, 1 Sep 2021 13:45:42 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Wed, 1 Sep 2021 13:45:41 +0800
From:   Cai Huoqing <caihuoqing@baidu.com>
To:     <caihuoqing@baidu.com>
CC:     Neil Armstrong <narmstrong@baylibre.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Kevin Hilman" <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        "Martin Blumenstingl" <martin.blumenstingl@googlemail.com>,
        <linux-media@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH] media: cec: ao-cec: Make use of the helper function devm_platform_ioremap_resource()
Date:   Wed, 1 Sep 2021 13:45:35 +0800
Message-ID: <20210901054535.6215-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BJHW-Mail-Ex09.internal.baidu.com (10.127.64.32) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
X-Baidu-BdMsfe-DateCheck: 1_BJHW-Mail-Ex07_2021-09-01 13:45:42:259
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the devm_platform_ioremap_resource() helper instead of
calling platform_get_resource() and devm_ioremap_resource()
separately

Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
---
 drivers/media/cec/platform/meson/ao-cec-g12a.c | 4 +---
 drivers/media/cec/platform/meson/ao-cec.c      | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/media/cec/platform/meson/ao-cec-g12a.c b/drivers/media/cec/platform/meson/ao-cec-g12a.c
index 891533060d49..68fe6d6a8178 100644
--- a/drivers/media/cec/platform/meson/ao-cec-g12a.c
+++ b/drivers/media/cec/platform/meson/ao-cec-g12a.c
@@ -633,7 +633,6 @@ static int meson_ao_cec_g12a_probe(struct platform_device *pdev)
 {
 	struct meson_ao_cec_g12a_device *ao_cec;
 	struct device *hdmi_dev;
-	struct resource *res;
 	void __iomem *base;
 	int ret, irq;
 
@@ -664,8 +663,7 @@ static int meson_ao_cec_g12a_probe(struct platform_device *pdev)
 
 	ao_cec->adap->owner = THIS_MODULE;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	base = devm_ioremap_resource(&pdev->dev, res);
+	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base)) {
 		ret = PTR_ERR(base);
 		goto out_probe_adapter;
diff --git a/drivers/media/cec/platform/meson/ao-cec.c b/drivers/media/cec/platform/meson/ao-cec.c
index 09aff82c3773..6b440f0635d9 100644
--- a/drivers/media/cec/platform/meson/ao-cec.c
+++ b/drivers/media/cec/platform/meson/ao-cec.c
@@ -602,7 +602,6 @@ static int meson_ao_cec_probe(struct platform_device *pdev)
 {
 	struct meson_ao_cec_device *ao_cec;
 	struct device *hdmi_dev;
-	struct resource *res;
 	int ret, irq;
 
 	hdmi_dev = cec_notifier_parse_hdmi_phandle(&pdev->dev);
@@ -626,8 +625,7 @@ static int meson_ao_cec_probe(struct platform_device *pdev)
 
 	ao_cec->adap->owner = THIS_MODULE;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	ao_cec->base = devm_ioremap_resource(&pdev->dev, res);
+	ao_cec->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(ao_cec->base)) {
 		ret = PTR_ERR(ao_cec->base);
 		goto out_probe_adapter;
-- 
2.25.1

