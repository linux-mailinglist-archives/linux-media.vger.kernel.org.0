Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35FF555074F
	for <lists+linux-media@lfdr.de>; Sun, 19 Jun 2022 00:23:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232543AbiFRWXE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 18 Jun 2022 18:23:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231599AbiFRWXE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 18 Jun 2022 18:23:04 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A1711111
        for <linux-media@vger.kernel.org>; Sat, 18 Jun 2022 15:23:03 -0700 (PDT)
Received: from tr.lan (ip-86-49-12-201.net.upcbroadband.cz [86.49.12.201])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id D24CC83F6A;
        Sun, 19 Jun 2022 00:23:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1655590982;
        bh=D4lrbWGTlccFJRtfr2+DOS0k/KRfnUq3vs2eNOmFpFU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=CT6SNvfVh2Vdp4Wcnyhn+U8sHgy1GALKKDn4yuRfLSvt/UdzFoejVCL5Sqw8YlzVE
         VEOyoZRAYDP8EE7hBTSWtNhN+IgcMPdVEVoQMUVuVtTlgWzUmemSILG2nWULRwjj0r
         qIJ6lqVMZ81ti+wClSt9Lj/uJCJHq7UpEmGIhCjaDZkIlUT7qBVexC2KLYQDy8UH5l
         PhLKJyQ3VM61L855yKPZgEObZNTf5XjlFBJYMI70XVKgtLP0qwiv5GoiFzFhBsgSK3
         gh1XU9U1y7o483l5MHW0eIEezCO8imy8qCX6T5Q8W3KHLi+MUXHlr3mysNV/Bt6unV
         BaZ/tEMeXLaaw==
From:   Marek Vasut <marex@denx.de>
To:     linux-media@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Stefan Riedmueller <s.riedmueller@phytec.de>
Subject: [PATCH 2/2] media: mt9p031: Add MT9P006 compatible
Date:   Sun, 19 Jun 2022 00:22:55 +0200
Message-Id: <20220618222255.478165-2-marex@denx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220618222255.478165-1-marex@denx.de>
References: <20220618222255.478165-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add compatible for MT9P006 sensor, which is older variant of MT9P031
and compatible with this driver.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Stefan Riedmueller <s.riedmueller@phytec.de>
---
 drivers/media/i2c/mt9p031.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
index d0706723e493c..a81d1ca058b9c 100644
--- a/drivers/media/i2c/mt9p031.c
+++ b/drivers/media/i2c/mt9p031.c
@@ -1234,6 +1234,7 @@ static int mt9p031_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id mt9p031_id[] = {
+	{ "mt9p006", MT9P031_MODEL_COLOR },
 	{ "mt9p031", MT9P031_MODEL_COLOR },
 	{ "mt9p031m", MT9P031_MODEL_MONOCHROME },
 	{ }
@@ -1242,6 +1243,7 @@ MODULE_DEVICE_TABLE(i2c, mt9p031_id);
 
 #if IS_ENABLED(CONFIG_OF)
 static const struct of_device_id mt9p031_of_match[] = {
+	{ .compatible = "aptina,mt9p006", },
 	{ .compatible = "aptina,mt9p031", },
 	{ .compatible = "aptina,mt9p031m", },
 	{ /* sentinel */ },
-- 
2.35.1

