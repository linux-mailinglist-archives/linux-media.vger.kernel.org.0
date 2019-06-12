Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85ECB424FB
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2019 14:05:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437118AbfFLMFR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Jun 2019 08:05:17 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:36258 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436551AbfFLMFR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Jun 2019 08:05:17 -0400
Received: by mail-pg1-f195.google.com with SMTP id f21so2810956pgi.3;
        Wed, 12 Jun 2019 05:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2Sff4ua3deUoFnvuxLiF7YAw+tlu26eK2pltBahQlIM=;
        b=NBzl8rN/oAdi5zCjlv7rvRkehotFhdDepkjg+vDZhXE2PBPg4nQBNXqlJmq2U+KF4S
         kTD54SprA0aT+K4kEoHLZCd6eqqrV9yzUfLQc6euPqP1jipjpdSrWxvI0TojAalKo5Lo
         i2l/xMRZ2qDgmhxLrHkF425fsLUCOaK4xTCoRBz251ejL7b2ReCZgSL/wfrlSsO9iSqS
         MD+vObqwcFZwMkOF1ht7AupR9jamsODZCqCRaKVy6qWtTQmsp33tN6cb/yHLTLxXYozj
         Ur04IgsAU6GVoixxajT/6+KE54f/487NoF6wHAv7z3jWG2O2Ix90kdZ7JoGrq+otTevz
         SELA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2Sff4ua3deUoFnvuxLiF7YAw+tlu26eK2pltBahQlIM=;
        b=piAVM/oeNfaWYuSZlNMhT7JZp/sB1DZ0vpFDVM4gGdxulnPrNsDv0zM1R5Z/tuvLJC
         f1Djom1FrSex+s/reNnkt3tsEVbl7CpW7fpzEtk/GUFls+xvLs9TcsgJ31OyGbZNx4Y+
         ANmG4cilXk/zI8brm8pgEJcHiID03Qn2yrFkFiOCgiupt2VQXg1KXkMsQwc7jAAcmIem
         1M70OMmaDL4dCEoNpCK//Hb17Sz+iNnVBPtv/7ZnoupHLuMh5cw03GV4Vzz1jUi07j9+
         03bpJV1Hn3AYqLV0nW3Hrq1T8PrM/oi/0f7OPE0FcJTLxdqYmLNc0Q7BKujVnqwSLUC4
         OcIQ==
X-Gm-Message-State: APjAAAWhdtv1zWVJqgEKBNDFqzGVHGDAa47GA+SddWL94XBu8bO5AzrA
        frZwu1BIaiXYS3nIqMRmUSQ=
X-Google-Smtp-Source: APXvYqxCFL0ITppBmVjK6Osmr2Z/1tpzGxQLw+hH/Obl7KNjP2Ump9ilyp3gg4RCZTal1u9xzomuiA==
X-Received: by 2002:aa7:9a92:: with SMTP id w18mr56535444pfi.167.1560341116838;
        Wed, 12 Jun 2019 05:05:16 -0700 (PDT)
Received: from masabert (150-66-71-0m5.mineo.jp. [150.66.71.0])
        by smtp.gmail.com with ESMTPSA id e16sm5309606pga.11.2019.06.12.05.05.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Jun 2019 05:05:16 -0700 (PDT)
Received: by masabert (Postfix, from userid 1000)
        id DF87C2011BF; Wed, 12 Jun 2019 21:05:11 +0900 (JST)
From:   Masanari Iida <standby24x7@gmail.com>
To:     linux-kernel@vger.kernel.org, mchehab+samsung@kernel.org,
        ricardo.ribalda@gmail.com, linux-media@vger.kernel.org
Cc:     Masanari Iida <standby24x7@gmail.com>
Subject: [PATCH] media: imx214: Fix typo in module description of imx214
Date:   Wed, 12 Jun 2019 21:05:10 +0900
Message-Id: <20190612120510.839-1-standby24x7@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch fixes a spelling typo found in imx214.c

Signed-off-by: Masanari Iida <standby24x7@gmail.com>
---
 drivers/media/i2c/imx214.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
index 83e9961b0505..159a3a604f0e 100644
--- a/drivers/media/i2c/imx214.c
+++ b/drivers/media/i2c/imx214.c
@@ -1111,6 +1111,6 @@ static struct i2c_driver imx214_i2c_driver = {
 
 module_i2c_driver(imx214_i2c_driver);
 
-MODULE_DESCRIPTION("Sony IMX214 Camera drier");
+MODULE_DESCRIPTION("Sony IMX214 Camera driver");
 MODULE_AUTHOR("Ricardo Ribalda <ricardo.ribalda@gmail.com>");
 MODULE_LICENSE("GPL v2");
-- 
2.22.0

