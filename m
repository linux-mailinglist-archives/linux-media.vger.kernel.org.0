Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F9643E9F7A
	for <lists+linux-media@lfdr.de>; Thu, 12 Aug 2021 09:35:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234287AbhHLHfy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Aug 2021 03:35:54 -0400
Received: from mx2.ucr.edu ([138.23.62.3]:61504 "EHLO mx2.ucr.edu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231331AbhHLHfy (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Aug 2021 03:35:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=ucr.edu; i=@ucr.edu; q=dns/txt; s=selector3;
  t=1628753730; x=1660289730;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ih509MZfBFgCEEZtNiCc3rKR+7wk2Y1qBqpU/o2sR8I=;
  b=eDCsTpKc72Wmivex7Ucy89Rlaut7cU0I/4xn9a+jmt6S41qSOKeXFzGY
   OSEDq9mfExUsGJ1tIigFsmefjeR3Ri6VTQ41itXUXeNO/2eiN4U6VqitJ
   QirKSM0rzgcadzT9VXMIOLb0++RqfLyQqhTstq9niLgeRqANVV92a1clp
   wJJo5FTuoDCDS+1CGfmLPReOgj4brUNs+xZ33GR/ZQuMsdTviWqn/8Foe
   iWe18ZTUdKcBtvj9q250U+QZTUpk+0gevxnrfM4FpEQKa+gjRn56IRBl6
   NSqpu7/cXdsOYp4bQR5lTTkHWzx2EbeX+sS/xBPMc+BEFrtSvJ+qWaTfF
   g==;
IronPort-SDR: EI7ZyLpc7AynoceOZEzSxwd3BQrMRLQrk13mML6Teh7EwwB4hkD4+kQpKG+huEWeFI2i+3VukP
 n+IGwrkkPcXAPhSvOE5inY3HLUABM8SEv6wBd6aQaqMMSxaB99tgql0xS3XEQPsbcEGsv67BH1
 yHQrIgvzmaMWmjqaBckGCP6E4VUyFWoXxT8RkgJPbbVv00urkyKhM5mcTxZvIrTNbEv05OpQ0w
 gTafJE2HIXEq190sND8Hq+J/ad+hl5c/XaTIXIYewV08zkATiiYr3a2Y10rgo9RL5tfFUuCaGL
 xiGkcQUElibYsH/Zr1rvYS0A
X-IPAS-Result: =?us-ascii?q?A2GiAwDqzhRhh0bYVdFaHgE8DAILgW6DeVUWjUyTUYEah?=
 =?us-ascii?q?nyIaIF8AgkBAQENAQFBBAEBhFkCgmcCJTQJDgECBAEBAQEDAgMBAQEBAQEDA?=
 =?us-ascii?q?QEGAQEBAQEBBQQBAQIQAQEBAYEgC1kLY4FPgXkGBD2CNSmDZQkCAQMSFQsBR?=
 =?us-ascii?q?hBRNAEFARwZIjmCFgGDB54QgQQ9jDEygQGIHAEJDYFjCQEIgSiIf4RxJ4Ipg?=
 =?us-ascii?q?lCBM3WHb4JQBINqexOCKYFQAQEBkD0bgwYBi1iBJptyAQYCgw4cnjNFlUeRL?=
 =?us-ascii?q?LsuAgoHBhAjgT2CFTMaJYFsCoFBTQECAQIBDAIBAgECAQIBAggBAQKONY5XI?=
 =?us-ascii?q?TI4AgYLAQEDCYkMAQ?=
IronPort-PHdr: A9a23:sHxh3hIj86rJzmJOndmcuKFmWUAX0o4c3iYr45Yqw4hDbr6kt8y7e
 hCFvbM91hSZAc3y0LFts6LuqafuWGgNs96qkUspV9hybSIDktgchAc6AcSIWgXRJf/uaDEmT
 owZDAc2t360PlJIF8ngelbcvmO97SIIGhX4KAF5Ovn5FpTdgsipy+y+4Z7ebxtHiDe+br55M
 Qm7oxjWusQKm4VpN7w/ygHOontGeuRWwX1nKFeOlBvi5cm+4YBu/T1It/0u68BPX6P6f78lT
 bNDFzQpL3o15MzwuhbdSwaE+2YRXX8XkhpMBAjF8Q36U5LsuSb0quZxxC+XNtDtQLsqRTqt8
 btkSB7wiCcGKTE59n3Xitdth65fuR6tugBzz5LRbIyTMfp+f7jdfcgbRWpHUcZaSjJPDJqhZ
 IsBDuoOI+JYoJTgrFcKoxayGQygCeXoxTJUiHL6wbA23/09HQ3bwQcsG88CvXTRoNjzKawcU
 /26zLPQwDvDcf1YxDnz5ovPfB8jr/GDUr1+fNHNxUQsDQ7Jkk+dpZD5Mz6Ty+8Ds3Kb7+1lV
 e+3iWEnqgBwojiyxscrl4LGhYIVxUrF9S5kx4s0Jdy5SE5hbt6lDJdcqy+XOpBrQsw+WWFko
 jg1xaAbuZOieiUB1ZsoyQLFZfOdb4iI/gzsVPyXITpgmH9oZr2xiRa9/0W9y+DxVsm63UhXo
 yZbjtTBq24B2gLQ58WHRPZw8Uiv1DaR2w7c5exJIEQ5mLfFJpAvxrM9mZweulnAEC/ugEj6k
 rOae0E+9uWr6+nreKvqqoKdOoNuiAzyLrwiltG+DOk8KAQCQWaW9OSm2LH9/0D1WqtGguM4n
 6TfrZvUP94UprSjDA9Qyosj7hG/ACq439kAhnkHKU5FeAqAj4j0J1HCOPD4Aum7g1SriDprw
 urJPrzlApnUNnjDkqrtca9z60Ne1AY/199f55VTCrEOJPL8RFX9u8DfDh88KwC0wuDnB8th1
 o4GR26DHquUPLnRvFKI/O4jPfSAaY4PtDv/N/Qp//vugmU4mV8Zc6mpx5wXaHWgE/VmIkSZY
 WDjgtYdHWsWsAczV/Hqh0GYUTJJeXm9Qr886ikhCI26FYfDWpytgLuZ0Se/H51WYH1GC1+VH
 XftaYqLRvYMZziJL89/nTwLS6KhR5Ui1R6wrg/6zaRoLu7O9i0fr5Lj24s9yffUkEQD9C50E
 sPV4WGETikgj3EITj5uhPtXvEdnjFqPzP4r0LRjCdVP6qYRAU8BPpnGwrk/Vo2aZw==
IronPort-HdrOrdr: A9a23:NqEplqmroD4m6ShA2k77mMMx++rpDfIF3DAbv31ZSRFFG/FwWf
 re+cjzsiWE9Qr5N0tQ/uxoVJPwIk80sKQFmbX5Xo3SJjUOxlHYSr2KhLGKq1aBJ8S9zJ8n6U
 4JSclD4bbLfDxHZKjBkWuF+hUbreVvMprDuQ4T9RhQpHlRGthdBs5CZmimLnE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.84,315,1620716400"; 
   d="scan'208";a="170706997"
Received: from mail-pj1-f70.google.com ([209.85.216.70])
  by smtp2.ucr.edu with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 12 Aug 2021 00:35:29 -0700
Received: by mail-pj1-f70.google.com with SMTP id z23-20020a17090abd97b0290176898bbb9cso4364595pjr.8
        for <linux-media@vger.kernel.org>; Thu, 12 Aug 2021 00:35:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kccsi7K3Q0d7ZEGUYI767ae2qeNpNVR9x1RI+mNTwAU=;
        b=IYBuxUo4iCo0HZcACbXCeUa9tINKncM7x0dglf7W0M8ahXqJh3P6uCazL3Mcs5B42A
         GpDSiS61M3M71cMSwDwo8VhjoYe/eaDQ3txWQfUzb4wE0SKmYGwotioBjpgi38Yvy/TB
         4lUxDhnDH3VL8PPjC+oLWd9l6kC5VTbsaTTTmPym+o1SQrno92lcCjlIfODW9FIkgiff
         1r0fv6PPbJMVkbVZnD+qOQPoZ4aFGANZNC9tGwSsaAsmkG9JmFNzYygMJaQosTO9vJE8
         UF2HXAnLRuoDdOtLmZ/T4rYRIf1120zXTFHK2/Qg2sEGYcwgsu74/uwWw2XlNO1zsQi0
         Oicg==
X-Gm-Message-State: AOAM530KGvmldmkHwn2ehAfLLbwRZ3F7RTYlQrlAZH2nLtc6mK/EmmPC
        S+yTYVNmUdUJzkSEhkm1DujHMVNxSFyVXOn71uVA91tSHUWoT2z7QwTa7TNovDWL91mf1FNu2Hp
        UJKFH3ZhzlxX3slMejFDnJ3Ci
X-Received: by 2002:a17:90a:1d05:: with SMTP id c5mr15695403pjd.175.1628753727677;
        Thu, 12 Aug 2021 00:35:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwlN3QIKxpfS3sp2zQl+zNyzHUDzfrTSRi+p5FZ6+O5COzp/wL3UQAMaJrRFiVp810LR6P+ow==
X-Received: by 2002:a17:90a:1d05:: with SMTP id c5mr15695395pjd.175.1628753727504;
        Thu, 12 Aug 2021 00:35:27 -0700 (PDT)
Received: from kq.cs.ucr.edu (kq.cs.ucr.edu. [169.235.27.223])
        by smtp.googlemail.com with ESMTPSA id s5sm1879447pji.56.2021.08.12.00.35.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Aug 2021 00:35:27 -0700 (PDT)
From:   Yizhuo Zhai <yzhai003@ucr.edu>
Cc:     Yizhuo Zhai <yzhai003@ucr.edu>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Juan Antonio Aldea-Armenteros <juant.aldea@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4] media: atomisp: fix the uninitialized use and rename "retvalue"
Date:   Thu, 12 Aug 2021 00:34:46 -0700
Message-Id: <20210812073447.127193-1-yzhai003@ucr.edu>
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
Signed-off-by: Yizhuo Zhai <yzhai003@ucr.edu>
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

