Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2764B598F1
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2019 13:01:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726801AbfF1LBK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Jun 2019 07:01:10 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:39486 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726476AbfF1LBK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Jun 2019 07:01:10 -0400
Received: by mail-qt1-f196.google.com with SMTP id i34so5741800qta.6
        for <linux-media@vger.kernel.org>; Fri, 28 Jun 2019 04:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=IXdo8o25DUwbkBOacyMkHs8NXaNzyi8ZQ44w0wRRY+k=;
        b=oHgWFQqjFKlaKSTvkFPGNEOIIooE1+k51krQBpezd1aCYd5+uu/K1IbRuWGFNeRPp0
         2wYV5lCq8slOC9ODsdug14Yi9RgWm1CVZPtCazI/5nRvr2SSniwvpSxEw7Nhy8OLo/r1
         mlltnErzun3xetjAemWULwFddbumtzS5I4a1P7RYw0ypQNXej9YVtA3ODpI9psnE2VMw
         sIPkPqjhyDag57JBv16C4b+ppyKAY7J4+OfFxR/bvz5bm6kv4QhrCDFclRxA3LO/PW9i
         7e54rtciFgOlLyqSgYLEJD0bXQtHITO7D9p7JThvdrPK5HwCe/8w913DAGDCk10ctLIL
         tXZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=IXdo8o25DUwbkBOacyMkHs8NXaNzyi8ZQ44w0wRRY+k=;
        b=T52i7Y38llDIO/+UErUXBPXJMbBMJX8WY4UzSvdX3dzpvM7mAEr94GTXG81hlApopT
         3EtW1Wfbi7p2QJ+YqTaFFOZG5yQI3zvNnOQlP6lelncVQaQwkh5GnUM50nP0riYCr2Sy
         DqRBfeFoUAjz/qwlSWbTXN+lS555/KaX3Qk3HaLEf9kH0b6rYMYK2QHh1DNwVad8v8b3
         3VJkvpCwRsG77QlSY9azjazSR8mjPmx53btE/jAbylLhiE86eQjPIZJLzQHYdMSeQScY
         mWg2NANH/GOfuc7YVcB9vOgXnktCMF2SNBSLlTCPeMkKKpJRF7mBcyR+M12sOe+oZTXb
         eH4g==
X-Gm-Message-State: APjAAAUAoh7cPnv/hB5vA3FW8RdZcMf1QQvtchKmQaPc1S7eMU/mxVzI
        EqGltpbGUc0uKDOZzunPw44=
X-Google-Smtp-Source: APXvYqylk4MCnQYQArPkurO8zXexZPG2CA3+1OeEbDivIqMDER7dbtBBmUf8C/q/pg1nyMB3REu+pA==
X-Received: by 2002:a0c:bd86:: with SMTP id n6mr7454973qvg.183.1561719669403;
        Fri, 28 Jun 2019 04:01:09 -0700 (PDT)
Received: from fabio-Latitude-E5450.am.freescale.net ([2804:14c:482:3c8:56cb:1049:60d2:137b])
        by smtp.gmail.com with ESMTPSA id x205sm825971qka.56.2019.06.28.04.01.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 28 Jun 2019 04:01:08 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     sakari.ailus@iki.fi
Cc:     slongerbeam@gmail.com, jacopo@jmondi.org,
        linux-media@vger.kernel.org, mchehab@kernel.org,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 2/2] media: i2c: ov5640: Fix the order for enabling regulators
Date:   Fri, 28 Jun 2019 08:00:35 -0300
Message-Id: <20190628110035.23930-2-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190628110035.23930-1-festevam@gmail.com>
References: <20190628110035.23930-1-festevam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

According to the OV5640 datasheet the following sequence needs to be
followed when powering the OV5640 supplies:

- DOVDD
- AVDD
- DVDD

So follow this order inside the ov5640_supply_name[] array, so that
the regulator_bulk() functions can enable the regulator in the
correct sequence. 

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/media/i2c/ov5640.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index afe7920557a8..4cd246812ae2 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -158,8 +158,8 @@ static const int ov5640_framerates[] = {
 /* regulator supplies */
 static const char * const ov5640_supply_name[] = {
 	"DOVDD", /* Digital I/O (1.8V) supply */
-	"DVDD",  /* Digital Core (1.5V) supply */
 	"AVDD",  /* Analog (2.8V) supply */
+	"DVDD",  /* Digital Core (1.5V) supply */
 };
 
 #define OV5640_NUM_SUPPLIES ARRAY_SIZE(ov5640_supply_name)
-- 
2.17.1

