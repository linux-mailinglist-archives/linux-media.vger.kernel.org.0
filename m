Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CB5F3E9E2B
	for <lists+linux-media@lfdr.de>; Thu, 12 Aug 2021 07:56:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234367AbhHLF4W (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Aug 2021 01:56:22 -0400
Received: from mx-lax3-2.ucr.edu ([169.235.156.37]:30951 "EHLO
        mx-lax3-2.ucr.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231287AbhHLF4W (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Aug 2021 01:56:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=ucr.edu; i=@ucr.edu; q=dns/txt; s=selector3;
  t=1628747757; x=1660283757;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Dih/syqAoRh+zFSVP5ghlcBWDYRkM3algk3/KHqQrKw=;
  b=ej/DfU9Fhh5uniQAmRCTRSUeWeYGk1AA6HE8EL2IRzifNFPMAeVvbleS
   k6Ch4gxyY+8Hjd0HOuvY8tVyt1MlkmAMiQ0NjY36YLQTO0QtQEExSBoqs
   g0seFU6WRJvOfR9DZ2Ez6a3AWHHLYEUnQO0ZmgI+s4SalCXEekJkcRosL
   c39kRqKomYGohRtxNvbJ/ObLqiyf1dnu+CR34IUUFXKhnrFEf0UDZ8DYI
   yfJ76VvUCKgqsdIHNhPlOuN4+RBs9hCQaqwAKNRhXuPuVg7j4Uvz/Jno0
   I6w3/UY0ZnPWRTdIjMics7nmglbtGwtNe5eOVNQ5063L1xn46jh6UrM2p
   Q==;
IronPort-SDR: Wt7FCwfRruqRm+DOHTYtYUgp91DE2Ur+5ut6QGfRS6oFoW9bDyRyENrOZJNBLt7TZAenQ4prRI
 KgO6CcaPZcqdOjknasETUuOp+lPeo1zQkMGS+Jp8FJ7TYJLIKUvyYmRat9eOI2PC5+AnJNlgWe
 Qowne8FeoGtw9wQ19ShmfIfecZeDk+PpVqbA+5L3o4yG7IN9FndtIi72oo8iSdGkrtD1LInzsR
 4h9kQHTDesfdssktOs8V4lLJbEPdwMr493srBxOmCaO3WjDMpDHKyHOsKr9G6VQQ7j8Ss2nhce
 QvTm0lMXx9fV1Ic9DEZGtYr6
X-IPAS-Result: =?us-ascii?q?A2EnDQDLthRhhUfYVdFaHAEBATwBAQQEAQECAQEHAQGBb?=
 =?us-ascii?q?gKDd1UWjUyTUYEahnyIaIF8AgkBAQENAQESExwEAQGEWQKCZwIlNAkOAQIEA?=
 =?us-ascii?q?QEBAQMCAwEBAQEBAQMBAQYBAQEBAQEFBAEBAhABAQEBgSALWQtjgU+BeQYEP?=
 =?us-ascii?q?YI1KYNlCQIBAxIVCwFGEFE0AQUBHBkiOYIWAYMHnh2BBD2MMTKBAYgcAQkNg?=
 =?us-ascii?q?WMJAQiBKAGIfoRxJ4IpglCBM3WHb4JQBINqexOCKYFQAQEBkDobgwYBi1WBJ?=
 =?us-ascii?q?ptxAQYCgw4cnjNFlUWRK7stAgoHBhAjgT2CFTMaJYFsCoFBTQECAQIBDAIBA?=
 =?us-ascii?q?gECAQIBAggBAQKONY5XITI4AgYLAQEDCYkWAQ?=
IronPort-PHdr: A9a23:tEpEyh2w9XxGvWuKsmDObwQyDhhOgF0UFjAc5pdvsb9SaKPrp82kY
 BaHo6U3xw+VFazgqNt8w9LMtK7hXWFSqb2gi1slNKJ2ahkelM8NlBYhCsPWQWfyLfrtcjBoV
 J8aDAwt8H60K1VaF9jjbFPOvHKy8SQSGhLiPgZpO+j5AIHfg9qr2+yo+JDffQpEiTmybLhvM
 Bi4sALdu9UMj4B/MKgx0BzJonVJe+RS22xlIE+Ykgj/6Mmt4pNt6jxctP09+cFOV6X6ZLk4Q
 qdDDDs6KWA15dbkugfFQACS+3YTSGQWkh5PAwjY8BH3W4r6vyXmuuZh3iSRINb7Rq4oVzu88
 6hrSQfoiCYZOD4/7GHXkdF7gKZCrB68uxBz34vYbYeQNPp/ZaPdZtIaRWxOXs1MSSJPG563b
 4UOD+UfOeZXspT2q18AoBeiAAWhAuTgxyNGi3PqwKE2yvgtHRzb1wAkAt4DsHHYodPoP6kQT
 O+11rHFwzXdYf1L1znz64/GfRIvof6DUrx9atbdxEo1Gg/ZlFictZDpMjWI3eoNqWib6O9gW
 PqthG4mqgBxoiWvxsAxgYbKhoIa0FHE/jh+zYc1JNy4SFR0Yd+4HJdMuSyXLJZ2Td84Q21yp
 ik116AGtIe9cSMXx5sp2wTRZOabc4iU/B3jTuCRLC9kiX97d7yxhxm8/FWhx+D8Vse5zktHo
 jRZn9TRqHwAyR/e58iJR/Zy8Ums2SiD2Q/c5+xFJU05iLTWJZAlz7M/kJcYrEfNHjfulUnok
 KObcl8o9+uo5uj9fLnqu56RO5V2hw3jKqgih82yDOAiPgQQUWWW+f6w2KPh8EHjXrlGkPM7n
 6/Eu57AP8sbvLS2AwpN34Ym7BawEimp3cwDnXkCMFJFYBWHj5X1O13WIPD3E/O/g1O0nTdu3
 f/GP7nhDozVLnjBjbvtZLh95kxBxAYpwtBf4JVUCr4FIP3tQEP+qNvYDhohPwy1xeboFsl92
 5sAVW6TBqKVKqDfvF+S6u4xPuWBZZUZtTTgJ/Q94v7hl345mVsTfamz2psXbWi1H/RnIkWZe
 3Xsg8sNHXsEswclUezllEeCXSRNaHmvQqIw/is7B56+DYffWoCth6SM3CO6Hp1Qe2BHBUmAE
 XL2eIqZWvcDcjmfItFukjMaT7itUYwh2g+0tA/81bVnKvDY+ioCtZLsh5Bb/erWwCAz5zxpC
 Iyv02iMBzVljGMBRmduh4hiqlY7x1ueh/sry8dEHMBesqsaGjwxMoTRmqknVrjP
IronPort-HdrOrdr: A9a23:ua0POK8DyzLwEtqGvPBuk+DxI+orL9Y04lQ7vn2ZhyYlF/Bw8P
 re4cjzuiWE7wr5NEtQ+uxofZPwOU80lqQFm7X5Q43SOjUO0VHAROoD0WKh+UyaJ8SXzI9gPM
 xbAsxD4bPLfDpHZAXBjTVQ0exL/DBKys+VbJ/lvg5QpMhRB89d0zs=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.84,315,1620716400"; 
   d="scan'208";a="59886539"
Received: from mail-pj1-f71.google.com ([209.85.216.71])
  by smtp-lax3-2.ucr.edu with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 11 Aug 2021 22:55:55 -0700
Received: by mail-pj1-f71.google.com with SMTP id gt7-20020a17090af2c7b02901773c999dcbso3449662pjb.6
        for <linux-media@vger.kernel.org>; Wed, 11 Aug 2021 22:55:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rubSw9FCX3UYPP3qCFnQoWoTCnQrhAdQYI5e/tU4EqY=;
        b=beEVdD+W/hmDk8fyG/sR3+MALIQH0G1uu4qnFR8QfeSpmEi88Q6+dgZrIXIY9GnCIU
         KSl2/47dpkAOONdKkQpcl8C5WaxR6HIrkrKOqSeAW/SJPt4/E7EWMXB1w+AZ5IoQBbKd
         HEVeZuV2bkQlSenFH9+NQKah1d5O6L5dq5U46xiCijr7YwlKDLikb7zWarX7iNvax5kU
         JcVNhMf1pz3M14cM1RKduI3IEb0WFRQfdW2U8tlct4QlM2jnIksNeU8C8xUEyaLfj11j
         rYOImL1qmuHI5UWVrbME8eDkzNqLB2SPxZq7Ty9UQYe5CEHhGOVTGdeCRkq83iUStfzj
         s+Bw==
X-Gm-Message-State: AOAM5301sOc3MVWX6PK9/K5dnc4uGFVw16bTHT11CHIqrmQeGFakH086
        fTbnq82jcL3Jw+CgZMjVPYejcY4nw2La20+mzQ9uvY/V4YzwwqRhs9jkRvRCPdw6zJEgX+7EKuQ
        qYRmfV4SOtK4lLvxogNmvirQ2
X-Received: by 2002:a63:83c1:: with SMTP id h184mr2410939pge.37.1628747754102;
        Wed, 11 Aug 2021 22:55:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxOygrKV5WhARieKOIood/QYvjnnVnFyEKRNwCN5hxkQkZt74kl1r/JcDId5gGmRbEWFlUyOw==
X-Received: by 2002:a63:83c1:: with SMTP id h184mr2410923pge.37.1628747753894;
        Wed, 11 Aug 2021 22:55:53 -0700 (PDT)
Received: from kq.cs.ucr.edu (kq.cs.ucr.edu. [169.235.27.223])
        by smtp.googlemail.com with ESMTPSA id j6sm1659165pfn.107.2021.08.11.22.55.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Aug 2021 22:55:53 -0700 (PDT)
From:   Yizhuo Zhai <yzhai003@ucr.edu>
Cc:     Yizhuo Zhai <yzhai003@ucr.edu>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Juan Antonio Aldea-Armenteros <juant.aldea@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4] media: atomisp: fix the uninitialized use and rename "retvalue"
Date:   Wed, 11 Aug 2021 22:54:17 -0700
Message-Id: <20210812055421.44450-1-yzhai003@ucr.edu>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210723003607.64179-1-yzhai003@ucr.edu>
References: <20210723003607.64179-1-yzhai003@ucr.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

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
2.25.1

