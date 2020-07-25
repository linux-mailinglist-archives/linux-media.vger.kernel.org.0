Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94C4222D5FA
	for <lists+linux-media@lfdr.de>; Sat, 25 Jul 2020 10:12:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726859AbgGYIMI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 25 Jul 2020 04:12:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726434AbgGYIMF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 25 Jul 2020 04:12:05 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 253B7C0619D3;
        Sat, 25 Jul 2020 01:12:04 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id y3so10208779wrl.4;
        Sat, 25 Jul 2020 01:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TRFUsEvAIwIIG2KAY4NjCWbxYEJg7r6BmKVKp0Gi2yM=;
        b=nzLoqfMczFTLnp7VZCsxCn6ym9umeuogSpyDW4VoSXpGuvh3HEZMvN5SeeTGOJ8nk3
         kacpbHNl+yp2k0yrn64XrQG2Mxf0XeUtcDcMcG4Wghx9IcAATqj4CtXPdJkWAPbrz/qH
         6vRVC0aMP1J5Ln6vlae357xnko8/QpcnV0oC/dfXlKBte2D/M0JTZSufUVu5L+D4hNXr
         MBT41KrbuB3Mvbc9aAKnIsJLiJdZmb5m7CTgCckBVd6HOBqJ1nuEAnTSqKuirROyX0a3
         LSapils+ZNbCcBBibOx9ePHn48i70yZpppp9HeWk9rhfie6ojT7tvvEm0JK8gHJB8NSV
         XVVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TRFUsEvAIwIIG2KAY4NjCWbxYEJg7r6BmKVKp0Gi2yM=;
        b=DeiQWG4pyB1P75QbvDH//eFDQNZlRzviDDC2zJDfdAIqJLo5pwK/ox5t0Nl+epd43s
         AA56+12kjqzVUIaHxm6GCIWXobFQZW4l7CYgZ5nKcpBttINudU+Zs4puHYYVN8mJjFRC
         fn0ndT0OyIMscKdwpTOvvik411uVJmFiNWxJFn2KuEFekZcjc0svNNVHrC5KQguQwjYa
         JOW+AfHqnl8P4bhGGJj1ZAMFC7woj4xPrn0eSn7WDVBEbtxX67dZd80AB6403mOtVN1K
         JhXog9A7Ib/k5+AnCGG4mu/aXxfdzgvrTXZA907nWTj2OB1KWTPO/Mvr9rj7wsNg2ul2
         +Uyw==
X-Gm-Message-State: AOAM533PZA6idarNo2njofUqjq/5aKAVVkfJbk37vFu+WVmoPJxLL2th
        cjf72oWG3QxUQrAcuGm0Xdw=
X-Google-Smtp-Source: ABdhPJySD3og+Iju9VNHRQIBr9aLMq24CYh9BJ7OlyhflnkZoLNa34NmB+mmp/mLOqUKONhg5SL8aQ==
X-Received: by 2002:adf:a3d0:: with SMTP id m16mr11194559wrb.232.1595664722950;
        Sat, 25 Jul 2020 01:12:02 -0700 (PDT)
Received: from localhost.localdomain (112.red-81-32-35.dynamicip.rima-tde.net. [81.32.35.112])
        by smtp.gmail.com with ESMTPSA id n12sm3645502wrg.77.2020.07.25.01.12.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2020 01:12:02 -0700 (PDT)
From:   Juan Antonio Aldea-Armenteros <juant.aldea@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Juan Antonio Aldea-Armenteros <juant.aldea@gmail.com>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] media: atomisp-mt9m114: replace fixed function names
Date:   Sat, 25 Jul 2020 10:11:08 +0200
Message-Id: <20200725081108.272643-1-juant.aldea@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There are a couple of debug messages using hardcoded function names
instead of the preferred __func__ magic constant.

Replace them:

WARNING: Prefer using '"%s...", __func__' to using 'misensor_rmw_reg', this function's name, in a string
215: FILE: ./media/atomisp/i2c/atomisp-mt9m114.c:215:
+       v4l2_err(client, "misensor_rmw_reg error exit, read failed\n");

WARNING: Prefer using '"%s...", __func__' to using 'misensor_rmw_reg', this function's name, in a string
236: FILE: ./media/atomisp/i2c/atomisp-mt9m114.c:236:
+       v4l2_err(client, "misensor_rmw_reg error exit, write failed\n");

Signed-off-by: Juan Antonio Aldea-Armenteros <juant.aldea@gmail.com>
---
 drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
index 0d60918a9b19..54c24bc2061d 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
@@ -212,7 +212,7 @@ misensor_rmw_reg(struct i2c_client *client, u16 data_length, u16 reg,
 
 	err = mt9m114_read_reg(client, data_length, reg, &val);
 	if (err) {
-		v4l2_err(client, "misensor_rmw_reg error exit, read failed\n");
+		v4l2_err(client, "%s exit, read failed\n", __func__);
 		return -EINVAL;
 	}
 
@@ -233,7 +233,7 @@ misensor_rmw_reg(struct i2c_client *client, u16 data_length, u16 reg,
 
 	err = mt9m114_write_reg(client, data_length, reg, val);
 	if (err) {
-		v4l2_err(client, "misensor_rmw_reg error exit, write failed\n");
+		v4l2_err(client, "%s error exit, write failed\n", __func__);
 		return -EINVAL;
 	}
 
-- 
2.27.0

