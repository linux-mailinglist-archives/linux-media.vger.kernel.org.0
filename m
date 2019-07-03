Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F9625E8E5
	for <lists+linux-media@lfdr.de>; Wed,  3 Jul 2019 18:29:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727242AbfGCQ24 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Jul 2019 12:28:56 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:33628 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727076AbfGCQ24 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Jul 2019 12:28:56 -0400
Received: by mail-pl1-f195.google.com with SMTP id c14so1536539plo.0;
        Wed, 03 Jul 2019 09:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=Mg8aQOqXcwmSKct5oBrTlUPuw3Ze+pDAH7aWTtXxQ9Q=;
        b=U2fecCCGPQNyiAAQn9Qy3DSZ5mDa469FzfTInyPqVzE5DqZmlxFEabavuR0QF2hDh0
         pVgxM9wBArSMarXrMZkqEus+wj6nRimWA+N0d0sZVFaFdts78X5ExBqKCPrPyuPb/yUi
         +LAwVEiZX9xkZyXx4O3EO8fzt7sDst4kdvQdcv2wudKzKJXuXle/6KaaQvonGCWfwAhU
         9oubTcybFOoqhZEOFNlNxZ5/UtiVLMkNV2qxbM85XGHbSmYB+Uu4HVC3Zf1jxjmP2Vax
         bjSKn5HITgg1yGNr3pj3LTeKDoG51I0vh9dFWYm7FE6wTpWDTR9oHV+7T4ymZomzuvFB
         F9rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Mg8aQOqXcwmSKct5oBrTlUPuw3Ze+pDAH7aWTtXxQ9Q=;
        b=Z1z+3gyfym8fMwURsTIWKjeGOtkRfLLlevxsSR7UFt8IAY/gvMDFB5e6CEP94DbGu4
         2y9OKHjZyfU1vFz5MH59yWCBHuuIUV+bq+uk7BivoU1TLui57bH7bp8VFmRk2FEf14k7
         Ycl5WFsAm6jh4aclPksCrxCe0zzNORJwkAjMCQ+yJ6ZjvZf+hCozwkvxN3ZMM2Qy4oAa
         16yXKfea8iaY+oHxtC6A9PmL3B0GOd+fn8DDbI3fhbn1PAMmUVtC0gID5XR8CirCcOHA
         6D1Q86i7I3rx2Q7jPvvB2VNwpVznZ94QhYCzyRYJbPzrVhKJKiOjS9tOdM6R/f8AFwDJ
         RWfA==
X-Gm-Message-State: APjAAAUKPC6SRNnJmFXr3NXBWaENguzwdE+qS02bzAtaec9/Ax1I330/
        BEjckHBWaxAh1W8NDQmTabE=
X-Google-Smtp-Source: APXvYqwmlbt+j7fly2K80DIrn4k4UHmqWWaQMZqFnB5vDjo83o53X00ERf34tg+UAEDXk15EhfDVmA==
X-Received: by 2002:a17:902:9897:: with SMTP id s23mr43116182plp.47.1562171335539;
        Wed, 03 Jul 2019 09:28:55 -0700 (PDT)
Received: from hfq-skylake.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
        by smtp.googlemail.com with ESMTPSA id h6sm3154759pfb.20.2019.07.03.09.28.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Jul 2019 09:28:55 -0700 (PDT)
From:   Fuqian Huang <huangfq.daxian@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Fuqian Huang <huangfq.daxian@gmail.com>
Subject: [PATCH v2 12/35] media/tuners: Use kmemdup rather than duplicating its implementation
Date:   Thu,  4 Jul 2019 00:28:48 +0800
Message-Id: <20190703162848.32415-1-huangfq.daxian@gmail.com>
X-Mailer: git-send-email 2.11.0
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

kmemdup is introduced to duplicate a region of memory in a neat way.
Rather than kmalloc/kzalloc + memcpy, which the programmer needs to
write the size twice (sometimes lead to mistakes), kmemdup improves
readability, leads to smaller code and also reduce the chances of mistakes.
Suggestion to use kmemdup rather than using kmalloc/kzalloc + memcpy.

Signed-off-by: Fuqian Huang <huangfq.daxian@gmail.com>
---
Changes in v2:
  - Fix a typo in commit message (memset -> memcpy)

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

