Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 684983E8905
	for <lists+linux-media@lfdr.de>; Wed, 11 Aug 2021 05:54:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233408AbhHKDym (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Aug 2021 23:54:42 -0400
Received: from mx-lax3-2.ucr.edu ([169.235.156.37]:19595 "EHLO
        mx-lax3-2.ucr.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233182AbhHKDyl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Aug 2021 23:54:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=ucr.edu; i=@ucr.edu; q=dns/txt; s=selector3;
  t=1628654059; x=1660190059;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=+r6J+pkHEbVFSGHQElxJnDO6jFts9TCA3QpIXRznslM=;
  b=qS2Qg/T9bs1E5OqJAYnxBh3q1eGCCZzGcVakfxMFdm8ubDyYxm2KjIUA
   FM2mTVi7ZpcJv2AEpxknor8NIkWaZTbo/kJyYhNJg0AXpuSekgl/VURtK
   mbI8t8ThnQ7UBgFCAeyoHD72R4vnpOidw8rEJ3Al2wg7mOrWTG3vzqIno
   NkrBlqAu9l38ud5CzcKrLqWM18JKsk2IyRkPmG3hZUl87Xao4AvDZ1mWX
   aGovB+Y7U67NM9JbKdSFL9pPqLOni2NJt5iiKHZn4+lCLT0fWAR7IMCJl
   kOsIfPpBHpPfc8Es80iUQugsBoE8Uu/yOal4Wkta8nszZHVPOCG1WqSzz
   g==;
IronPort-SDR: bYoPRlr+sdXP8GeVmKd3WAUPDst5PnPe3s/lYEfrP7lxDXe5s8zff7Rdg3kWNH4cZ6JcJ479q1
 8aGiNY5TaePUnSZXsnYvXapUM4rU+B8+Fb6Z9Z+IKDWhcZ7g4MANHTj8XehquAMeypZ2gG0uJ4
 lWGa6zQzUjzdx9rl2UiW5bI1IjCNFlCd91vV3QRYGgBhf5BgN0ZhSBkeWFc1rSdm1I83/XSCKs
 Ncs1oqo+bOoXdEKFbed7+4GQOim8/fZslIzKGzi2OOOYy63yVSCsmI8jzyyKtJpx5o1AJia0B6
 0J0dl9IePWlJMBKQOy5pZ02t
X-IPAS-Result: =?us-ascii?q?A2ESCwCjSBNhf0jYVdFaHAEBATwBAQQEAQECAQEHAQGBb?=
 =?us-ascii?q?gKDd1UWjUyIaoplgRqGfIhogXwCCQEBAQ0BARITHAQBAYRYAoJkAiU0CQ4BA?=
 =?us-ascii?q?gQBAQEBAwIDAQEBAQEBAwEBBgEBAQEBAQUEAQECEAEBgSILWQtjgU+BeQYEP?=
 =?us-ascii?q?YI1KYNlCQIBAxIVUhAgMTQBBQEcGSI5ghYBgwedHYEEPYwxMoEBiBYBCQ2BY?=
 =?us-ascii?q?wkBCIEoAYh9hHEngimCUIEzdYdvglAEg1t7E4IpgVABAQGQOhuDBgGLUYEmm?=
 =?us-ascii?q?3EBBgKDDhyeMUWVRZEquyoCCgcGECOBPYIVMxolgWwKgUFNAQIBAgEMAgECA?=
 =?us-ascii?q?QIBAgECCAEBAp0LITI4AgYLAQEDCYh4AQ?=
IronPort-PHdr: A9a23:ZP0eNBCW8P/4CWbvBArsUyQUrEMY04WdBeb1wqQuh78GSKm/5ZOqZ
 BWZua81yg+RFtuKo9t/yMPu+5j6XmIB5ZvT+FsjS7drEyE/tMMNggY7C9SEA0CoZNTjbig9A
 dgQHAQ9pyLzPkdaAtvxaEPPqXOu8zESBg//NQ1oLejpB4Lelcu62/6u95HJYAhEmDWxbLJ2I
 R6rsQjfq84ajJd4JK0s0BXJuHxIe+pXxWNsO12emgv369mz8pB+7Sleouot+MFcX6r0eaQ4V
 qFYAy89M28p/s3rtALMQhWJ63ABT2gZiBtIAwzC7BHnQpf8tzbxu+Rh1CWGO8D9UKs5Uiq+4
 ah1VBDoiT8HNz8n/2HRlsxwl79QrBa4qxBi34LYfISZOfx7fqPcZtMaXmtBXsBeVydcHI2yd
 pYED+QAPelGq4nyukYFoR+wCAWwAe/izDhHi2P40KEmzugtCB3K0BE9FN4KrXjZrND5OaEPW
 u630abI1y3OYfNI1zng5obGcRcvrvOCXb9rbcbd1VMiGx/fg1mMtYDoOS6e2OQXs2ic6uptT
 eCgi28mqgFxvzivwdonhYrJho0Py1DP6CJ0wYY0JN24UkF7YMKoHIdeuiyBKot5XtkiT3t2t
 ykn170LoJi2dzUFx5o73RDQceCHc5SW7RL5UuacOSt0iXZ4dLywmRq88VWsxvDzWMe63ltHo
 CpInsXCuH0RyxDe5MeKR/V/80qh2DuB2Bzf5O5GLE0qlKfVJJ4szLA2m5EOskrDBjf7lFvqg
 KKSbEkp+eil5/75brn7p5KQLY15hh/mPqgzm8GyBf40PhYAUmWb4+iwyr/u8VfnTLlUgPA7l
 LTSvorAKsQBvKG5BhdY0oMk6xmiETiryM8YnXwbLFJdfxKHkpTpN0nOIP/mCfe/hEyhkDJxy
 PDHOr3tG43NLnrenLv4c7Zw6VBQxBA8zdBY4JJUBbUBL+zpVkDts9zYCwc1Mw2yw+n5FNVwz
 p0SVX6LD6ODM67fsUWE6vwyL+SNfoMYuijxJ+Ag5/H0jH85nVEdfbOu3ZsScH25HvVnI0WDb
 nrtntsNDWkHsxEjTOP2kl2OSyBcaGuvX64k/DE0FJqmDZvfRoCqmLGB2Ca7HptLZmFJE1yMF
 GnneJiFW/gWcy+SPMBhnSIeVbS7SI8uywuutAnkxLpjNObU/TcYtZ2wnPZv4OiGpBAg9SFzR
 /ad2mDFG3BmnmoJH2dt9L10uwpwxkrVgvswuOBRCdEGv6ABaQw9L5OJirEnY+0=
IronPort-HdrOrdr: A9a23:gQGrUam2iFhm6MxOrBmCyMe5xpjpDfIR3DAbv31ZSRFFG/FwWf
 re+cjzuiWE7wr5NEtQ+uxofZPwOU80i6QFh7X5VI3KNGKHhILrFvAY0WKL+Vzd8kbFh4pgPM
 lbAspD4R7LYGSST/yR3OB1KbkdKaG8gdmVbC7loxlQcT0=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.84,311,1620716400"; 
   d="scan'208";a="59655352"
Received: from mail-pj1-f72.google.com ([209.85.216.72])
  by smtp-lax3-2.ucr.edu with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 10 Aug 2021 20:54:18 -0700
Received: by mail-pj1-f72.google.com with SMTP id 2-20020a17090a1742b0290178de0ca331so728719pjm.1
        for <linux-media@vger.kernel.org>; Tue, 10 Aug 2021 20:54:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=lSccYX79bCga8PfiO71I5eGOlFYRkHyS4P+krasVmlI=;
        b=gsKJ+OMuzNeFhMBnl7cnGfd5E/vIynXPQC466chv3nWZcQ3l4qh+e50zxGQ9ulMb8Q
         V5hvcspx3nN2s8cbTW6wUyOKWFMXGxxMM7Ug9Ebvph3sqPIugf1h3k3SaB3qQevR75lm
         1t1hJlZRHPg/pTXtlj+J02mdZtkK9caOlPu3/AxAWFpezl+EfvmbN/YYGqecuR6cNFoB
         Dj+kvSanx4rg04HOTmjSBIWytyXxY/4VmlFY9p77xfPBrSwS5GUOajUGxhgKsNTcz8St
         Ar1REzWeMBVO4oycBoL/vB1RoeDRV2yHxPZ1Q0AbvR+tZDVvawW7g0LvaO5NEfk88/sH
         LaAA==
X-Gm-Message-State: AOAM533J5wYlzkQaWM9KNHvtWFT3DF58vuQ3SyCnAmU4rDx5H42RBuvC
        y6mhhbmmCXU93h/4eQkcT33DsdUVeb+Av9u4jZJf/h1qRU87RQyePdS57OzXlwe+f8nCeBEkKR6
        71MR2G2KN0d5jgRrxABBylfOw
X-Received: by 2002:a17:90b:f17:: with SMTP id br23mr8156310pjb.60.1628654057100;
        Tue, 10 Aug 2021 20:54:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwqbNjbWkU4ar3037qpQVx+m8hnhLSTWWK+YqOhqq7Z85m2c+hqh7j8OGYm44oN3HtAPxORMg==
X-Received: by 2002:a17:90b:f17:: with SMTP id br23mr8156299pjb.60.1628654056896;
        Tue, 10 Aug 2021 20:54:16 -0700 (PDT)
Received: from kq.cs.ucr.edu (kq.cs.ucr.edu. [169.235.27.223])
        by smtp.googlemail.com with ESMTPSA id 143sm21100364pfx.1.2021.08.10.20.54.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Aug 2021 20:54:16 -0700 (PDT)
From:   Yizhuo Zhai <yzhai003@ucr.edu>
Cc:     Yizhuo <yzhai003@ucr.edu>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Juan Antonio Aldea-Armenteros <juant.aldea@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4] media: atomisp: fix the uninitialized use and rename "retvalue"
Date:   Tue, 10 Aug 2021 20:54:03 -0700
Message-Id: <20210811035405.17382-1-yzhai003@ucr.edu>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210723003607.64179-1-yzhai003@ucr.edu>
References: <20210723003607.64179-1-yzhai003@ucr.edu>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Yizhuo <yzhai003@ucr.edu>

Inside function mt9m114_detect(), variable "retvalue" could
be uninitialized if mt9m114_read_reg() returns error, however, it
is used in the later if statement, which is potentially unsafe.

The local variable "retvalue" is renamed to "model" to avoid
confusion.

Fixes: ad85094b293e ("Revert "media: staging: atomisp: Remove driver"")
Signed-off-by: Yizhuo Zhai<yzhai003@ucr.edu>
---
 drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
index f5de81132177..77293579a134 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
@@ -1533,16 +1533,19 @@ static struct v4l2_ctrl_config mt9m114_controls[] = {
 static int mt9m114_detect(struct mt9m114_device *dev, struct i2c_client *client)
 {
 	struct i2c_adapter *adapter = client->adapter;
-	u32 retvalue;
+	u32 model;
+	int ret;
 
 	if (!i2c_check_functionality(adapter, I2C_FUNC_I2C)) {
 		dev_err(&client->dev, "%s: i2c error", __func__);
 		return -ENODEV;
 	}
-	mt9m114_read_reg(client, MISENSOR_16BIT, (u32)MT9M114_PID, &retvalue);
-	dev->real_model_id = retvalue;
+	ret = mt9m114_read_reg(client, MISENSOR_16BIT, MT9M114_PID, &model);
+	if (ret)
+		return ret;
+	dev->real_model_id = model;
 
-	if (retvalue != MT9M114_MOD_ID) {
+	if (model != MT9M114_MOD_ID) {
 		dev_err(&client->dev, "%s: failed: client->addr = %x\n",
 			__func__, client->addr);
 		return -ENODEV;
-- 
2.17.1

