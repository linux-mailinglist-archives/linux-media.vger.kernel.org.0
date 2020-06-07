Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A455F1F0D09
	for <lists+linux-media@lfdr.de>; Sun,  7 Jun 2020 18:31:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727920AbgFGQbO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 7 Jun 2020 12:31:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726683AbgFGQbJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 7 Jun 2020 12:31:09 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94D7EC08C5C6
        for <linux-media@vger.kernel.org>; Sun,  7 Jun 2020 09:31:08 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id n23so17498693ljh.7
        for <linux-media@vger.kernel.org>; Sun, 07 Jun 2020 09:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Rt6ATyUj+kngO18ntOXAOOJDegUILp5okUOOJZj7u30=;
        b=ml+4gVbeQHnwks5Iuv1jZCzoHDKLU/b9ovZ9dwJFwQrqiRoSpHXMs18iuG9+NtJiMd
         +Lg5g9KGMG/7imFtj2Drlv+VawBL7qCRfUi3wwnO22W/NN7TNRV+e2UgNm49HMqn7pMq
         VekBB4R5QnczjNrBjx0DQuOEMgygxoqJhh7PyspGiwcKh08+hk+pdqNSz4LrnX/I/h7m
         lY5uwVFqM/O6ITPZcXYb5hmMHlg++05bzStAZrgsRrs0zGuUZisYjqHhBJm05srSn5PS
         0AL/s8Xnbl9sGY5s1qZEvydkYDc0Us9ET1mG6mc6h92tH1usT1ItACDMm+hy+Z9B0beH
         M6+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Rt6ATyUj+kngO18ntOXAOOJDegUILp5okUOOJZj7u30=;
        b=WDg+pe+GbsHbgqPu2ssfZWEw7JWIVxw1KpAtDbCDET6lTfCP/OXkDqtumRyGXShj2S
         NYxWBH4zodk3tLK3MCX4S/19RIIjBG574D4MfcRfbm9kNOXQXMV7MhVX72bCc9+RsP09
         8nqpjR7YjzYlNFlmNXKpJ6tnJJoSqHIqV11jtxkQ6hepqLk9I8YHD2r//Gs98IG7lauG
         m+YDRAu+uJ4j91RflwV4zaDb+7Vt7P4Gc1Ua+kjIUuB4sKnQP70iwk/jA0Ma/1A6q7nh
         NrRNPSuo0in4CpoInJ0adQkQpxFLYuhqBIPfO27XYTATHaeml1Iw5pXffLILmgXu+5qL
         QyuA==
X-Gm-Message-State: AOAM531sHWTKNQl9XQhCrmJ+WcerFrZCRQXfmW+MLdXWA+3Tqlr/8tNO
        ljzG4DLbffjGKxfLvmQ9LWfLPQ==
X-Google-Smtp-Source: ABdhPJzAvsjh6tvRZCxTeM3UyEofF++E+CgDNsgqVLM63SFDjmzic+mxo9+95tiJJjm8CU13LJYNeg==
X-Received: by 2002:a2e:584e:: with SMTP id x14mr9077902ljd.106.1591547467090;
        Sun, 07 Jun 2020 09:31:07 -0700 (PDT)
Received: from localhost.localdomain (37-144-159-139.broadband.corbina.ru. [37.144.159.139])
        by smtp.googlemail.com with ESMTPSA id l7sm1726511ljj.55.2020.06.07.09.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2020 09:31:06 -0700 (PDT)
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
To:     mchehab@kernel.org, sakari.ailus@iki.fi,
        manivannan.sadhasivam@linaro.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        c.barrett@framos.com, a.brela@framos.com, peter.griffin@linaro.org,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Subject: [PATCH v4 09/10] media: i2c: imx290: Move the settle time delay out of loop
Date:   Sun,  7 Jun 2020 19:30:24 +0300
Message-Id: <20200607163025.8409-10-andrey.konovalov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200607163025.8409-1-andrey.konovalov@linaro.org>
References: <20200607163025.8409-1-andrey.konovalov@linaro.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

The 10ms settle time is needed only at the end of all consecutive
register writes. So move the delay to outside of the for loop of
imx290_set_register_array().

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
---
 drivers/media/i2c/imx290.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index fd147fac5ef2..02001c1b0dfc 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -404,11 +404,11 @@ static int imx290_set_register_array(struct imx290 *imx290,
 		ret = imx290_write_reg(imx290, settings->reg, settings->val);
 		if (ret < 0)
 			return ret;
-
-		/* Settle time is 10ms for all registers */
-		msleep(10);
 	}
 
+	/* Provide 10ms settle time */
+	msleep(10);
+
 	return 0;
 }
 
-- 
2.17.1

