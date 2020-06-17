Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3F451FD0E7
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2020 17:27:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726861AbgFQP1Q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Jun 2020 11:27:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:59328 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726758AbgFQP1Q (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Jun 2020 11:27:16 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.126])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B4D5F2089D;
        Wed, 17 Jun 2020 15:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592407635;
        bh=/X4RakAnjpaIbDFNGYOyhDIZuK7NZ/bC8ERbSOpBkvA=;
        h=From:To:Subject:Date:From;
        b=OwHTIF92HeRZSfkFxh2WikBaYElmr2tOOHq+wczjC8w+D4cMV7CFDdFe54ko9h8Cw
         Dhr2M4C7wCI7EcZ9CEkTPhLmWM1Wedkos9O0Vik5o4HG4GwngeltE7d/KUfN3bqXRQ
         2rxoLcoesbWfe5ZQwBS67fBoqoopB4p9q/EdA9WM=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH RESEND v2] media: samsung: Rename Samsung and Exynos to lowercase
Date:   Wed, 17 Jun 2020 17:27:09 +0200
Message-Id: <20200617152709.17756-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix up inconsistent usage of upper and lowercase letters in "Samsung"
and "Exynos" names.

"SAMSUNG" and "EXYNOS" are not abbreviations but regular trademarked
names.  Therefore they should be written with lowercase letters starting
with capital letter.

The lowercase "Exynos" name is promoted by its manufacturer Samsung
Electronics Co., Ltd., in advertisement materials and on website.

Although advertisement materials usually use uppercase "SAMSUNG", the
lowercase version is used in all legal aspects (e.g. on Wikipedia and in
privacy/legal statements on
https://www.samsung.com/semiconductor/privacy-global/).

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v1:
1. Move bindings change to separate patch.
---
 Documentation/admin-guide/media/fimc.rst          | 6 +++---
 Documentation/driver-api/media/drivers/tuners.rst | 2 +-
 drivers/media/platform/exynos4-is/media-dev.c     | 2 +-
 drivers/media/platform/s3c-camif/camif-core.c     | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/admin-guide/media/fimc.rst b/Documentation/admin-guide/media/fimc.rst
index 0b8ddc4a3008..56b149d9a527 100644
--- a/Documentation/admin-guide/media/fimc.rst
+++ b/Documentation/admin-guide/media/fimc.rst
@@ -2,7 +2,7 @@
 
 .. include:: <isonum.txt>
 
-The Samsung S5P/EXYNOS4 FIMC driver
+The Samsung S5P/Exynos4 FIMC driver
 ===================================
 
 Copyright |copy| 2012 - 2013 Samsung Electronics Co., Ltd.
@@ -19,7 +19,7 @@ drivers/media/platform/exynos4-is directory.
 Supported SoCs
 --------------
 
-S5PC100 (mem-to-mem only), S5PV210, EXYNOS4210
+S5PC100 (mem-to-mem only), S5PV210, Exynos4210
 
 Supported features
 ------------------
@@ -45,7 +45,7 @@ Media device interface
 ~~~~~~~~~~~~~~~~~~~~~~
 
 The driver supports Media Controller API as defined at :ref:`media_controller`.
-The media device driver name is "SAMSUNG S5P FIMC".
+The media device driver name is "Samsung S5P FIMC".
 
 The purpose of this interface is to allow changing assignment of FIMC instances
 to the SoC peripheral camera input at runtime and optionally to control internal
diff --git a/Documentation/driver-api/media/drivers/tuners.rst b/Documentation/driver-api/media/drivers/tuners.rst
index 7509be888909..d7924141c544 100644
--- a/Documentation/driver-api/media/drivers/tuners.rst
+++ b/Documentation/driver-api/media/drivers/tuners.rst
@@ -18,7 +18,7 @@ These differ mainly by the bandswitch byte.
 Tuner Manufacturers
 -------------------
 
-- SAMSUNG Tuner identification: (e.g. TCPM9091PD27)
+- Samsung Tuner identification: (e.g. TCPM9091PD27)
 
 .. code-block:: none
 
diff --git a/drivers/media/platform/exynos4-is/media-dev.c b/drivers/media/platform/exynos4-is/media-dev.c
index 9aaf3b8060d5..96e336b19cc3 100644
--- a/drivers/media/platform/exynos4-is/media-dev.c
+++ b/drivers/media/platform/exynos4-is/media-dev.c
@@ -1439,7 +1439,7 @@ static int fimc_md_probe(struct platform_device *pdev)
 	INIT_LIST_HEAD(&fmd->pipelines);
 	fmd->pdev = pdev;
 
-	strscpy(fmd->media_dev.model, "SAMSUNG S5P FIMC",
+	strscpy(fmd->media_dev.model, "Samsung S5P FIMC",
 		sizeof(fmd->media_dev.model));
 	fmd->media_dev.ops = &fimc_md_ops;
 	fmd->media_dev.dev = dev;
diff --git a/drivers/media/platform/s3c-camif/camif-core.c b/drivers/media/platform/s3c-camif/camif-core.c
index c6fbcd7036d6..92f43c0cbc0c 100644
--- a/drivers/media/platform/s3c-camif/camif-core.c
+++ b/drivers/media/platform/s3c-camif/camif-core.c
@@ -304,7 +304,7 @@ static int camif_media_dev_init(struct camif_dev *camif)
 	int ret;
 
 	memset(md, 0, sizeof(*md));
-	snprintf(md->model, sizeof(md->model), "SAMSUNG S3C%s CAMIF",
+	snprintf(md->model, sizeof(md->model), "Samsung S3C%s CAMIF",
 		 ip_rev == S3C6410_CAMIF_IP_REV ? "6410" : "244X");
 	strscpy(md->bus_info, "platform", sizeof(md->bus_info));
 	md->hw_revision = ip_rev;
-- 
2.17.1

