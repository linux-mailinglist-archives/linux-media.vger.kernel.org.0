Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 931725E50F
	for <lists+linux-media@lfdr.de>; Wed,  3 Jul 2019 15:15:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726870AbfGCNPZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Jul 2019 09:15:25 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:45090 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726574AbfGCNPZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Jul 2019 09:15:25 -0400
Received: by mail-pg1-f193.google.com with SMTP id o13so1226413pgp.12;
        Wed, 03 Jul 2019 06:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=qooSid70lMcYt0OO4gci/DU9ncaTYbon/PmkzObaKRU=;
        b=HJsdtNedrav2KMHe/Bl6Ap51Ys3ovO6XfrTzTNsye9Y457/2fbjlOG0kFudvMxxSBn
         VDWBgaE4ol56IBB5aPiaGd6bYNI1L/x4LxLcexJ3bxTJCfa3xtBFObt7Uqw0MOW6Ym8G
         6VJO2O/9XnZrb3+c6PgBL20ta/wNcfhA12msOglzH5vSOr+I1tOoqdIm6L1DdgjxdPl2
         KYSXDitCrdsfRIpwUG0xm1Fw2rLZRHtQcLRJ1K0dCfWtMzJ/CQcg+AXkOlMzGVCVySKm
         ViMCqFOnqiHXaNTn4qI7E2PnOzrzwpHKF59mxMHHEYYv7riZthmmkfIUt1xR8GX4WNJp
         LsmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=qooSid70lMcYt0OO4gci/DU9ncaTYbon/PmkzObaKRU=;
        b=Nmam3+PcJVAIC9wnQBqxiVgg6ED/BMKGxhjDRERPx9PCaxRmF/rWJm8EwE4Hl7KJOy
         KfqRxIi1zg7eZ5JqKHpDnTXiYLcplwW43eTmZAzC532m4X+NDt5TFEdz87gKQtaJBDYA
         lhVZFQEPCFKIQqeBTJ+wuWBu4gzyBiML8qZTb3phuysr42B9/XcE0S9XTgqot9Hyxhps
         ntTvTM9WQ+m2CcPZhSHboJORW14e1SFbNXQkrQ2KJkTFsNPPuCP+EIkZW7bkjBVUzojT
         pcLRMdW5sgBgzw23CsQxgMGzK14XhDRpPnoo66C9hEpR0Ou/zltkb+Wi4LXnBsYiiSvj
         joEQ==
X-Gm-Message-State: APjAAAXXBTE43/PCLt5ZY2TMxfTCTyHh4MJbeLOEPZknvWWXuMN7D5UA
        ErI9xgZJIvj3jCo8mMFl0dYXObZ2d28=
X-Google-Smtp-Source: APXvYqztpl50bO3+ze/gJb3ynvjwOMz6kO+0vitZEp8keiL2eRxTe9n9X4Z7TtDmdWsD0aJ+kvkhuw==
X-Received: by 2002:a17:90a:9604:: with SMTP id v4mr12521080pjo.66.1562159724403;
        Wed, 03 Jul 2019 06:15:24 -0700 (PDT)
Received: from hfq-skylake.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
        by smtp.googlemail.com with ESMTPSA id i126sm2440595pfb.32.2019.07.03.06.15.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Jul 2019 06:15:23 -0700 (PDT)
From:   Fuqian Huang <huangfq.daxian@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Fuqian Huang <huangfq.daxian@gmail.com>
Subject: [PATCH 11/30] media/tuners: Use kmemdup rather than duplicating its implementation
Date:   Wed,  3 Jul 2019 21:15:14 +0800
Message-Id: <20190703131514.25177-1-huangfq.daxian@gmail.com>
X-Mailer: git-send-email 2.11.0
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

kmemdup is introduced to duplicate a region of memory in a neat way.
Rather than kmalloc/kzalloc + memset, which the programmer needs to
write the size twice (sometimes lead to mistakes), kmemdup improves
readability, leads to smaller code and also reduce the chances of mistakes.
Suggestion to use kmemdup rather than using kmalloc/kzalloc + memset.

Signed-off-by: Fuqian Huang <huangfq.daxian@gmail.com>
---
 drivers/media/tuners/tuner-xc2028.c | 3 +--
 drivers/media/tuners/xc4000.c       | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/tuners/tuner-xc2028.c b/drivers/media/tuners/tuner-xc2028.c
index aa6861dcd3fd..574c3bb135d7 100644
--- a/drivers/media/tuners/tuner-xc2028.c
+++ b/drivers/media/tuners/tuner-xc2028.c
@@ -381,7 +381,7 @@ static int load_all_firmwares(struct dvb_frontend *fe,
 			goto corrupt;
 		}
 
-		priv->firm[n].ptr = kzalloc(size, GFP_KERNEL);
+		priv->firm[n].ptr = kmemdup(p, size, GFP_KERNEL);
 		if (priv->firm[n].ptr == NULL) {
 			tuner_err("Not enough memory to load firmware file.\n");
 			rc = -ENOMEM;
@@ -394,7 +394,6 @@ static int load_all_firmwares(struct dvb_frontend *fe,
 			       type, (unsigned long long)id, size);
 		}
 
-		memcpy(priv->firm[n].ptr, p, size);
 		priv->firm[n].type = type;
 		priv->firm[n].id   = id;
 		priv->firm[n].size = size;
diff --git a/drivers/media/tuners/xc4000.c b/drivers/media/tuners/xc4000.c
index 43925e219d81..d9606738ce43 100644
--- a/drivers/media/tuners/xc4000.c
+++ b/drivers/media/tuners/xc4000.c
@@ -812,7 +812,7 @@ static int xc4000_fwupload(struct dvb_frontend *fe)
 			goto corrupt;
 		}
 
-		priv->firm[n].ptr = kzalloc(size, GFP_KERNEL);
+		priv->firm[n].ptr = kmemdup(p, size, GFP_KERNEL);
 		if (priv->firm[n].ptr == NULL) {
 			printk(KERN_ERR "Not enough memory to load firmware file.\n");
 			rc = -ENOMEM;
@@ -826,7 +826,6 @@ static int xc4000_fwupload(struct dvb_frontend *fe)
 			       type, (unsigned long long)id, size);
 		}
 
-		memcpy(priv->firm[n].ptr, p, size);
 		priv->firm[n].type = type;
 		priv->firm[n].id   = id;
 		priv->firm[n].size = size;
-- 
2.11.0

