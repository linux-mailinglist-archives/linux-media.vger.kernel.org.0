Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C9FEFF5DEB
	for <lists+linux-media@lfdr.de>; Sat,  9 Nov 2019 08:55:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726467AbfKIHzH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 9 Nov 2019 02:55:07 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:45239 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726426AbfKIHzH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 9 Nov 2019 02:55:07 -0500
Received: by mail-pf1-f193.google.com with SMTP id z4so6653283pfn.12;
        Fri, 08 Nov 2019 23:55:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8W/ccs4K6JLyRSHC0w4jHHqe3aaM7BqlOGhm85RSpKQ=;
        b=ts2HKlm3K87ZbGksWlPcPsJ4QzLLELtYF8GQLUSvelNwK7bWI7JaSpHmJcE49Q4e3P
         osVqxUO21B3uhDZTbhGI3NNfKG2o/qv2YYH6t/S8Omto0he78smvgi5/cSUoI65ccOUh
         LOinOIccc2sG9kMQ80NC6XiowwjdMKrTminAt8GoaIs8Q7rG0LHHlugPn669FEECykYV
         XAQTdRPlOEOe+Ps8dbkO18Yi3HMNyN66miGW7t6OyQDEb1l68r2S1GtHUqH0p1L0d0de
         sBbv6inF33jCSc3zNLbQPFkidPXRDq7j85Dv0PN0/3iALLjrW5jD9Lff+Sz8xnH6Mi2d
         SFIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8W/ccs4K6JLyRSHC0w4jHHqe3aaM7BqlOGhm85RSpKQ=;
        b=nkpu0I1Yt7AlwAliYGrP5nGkQpapfz/STc4T3GDgquoXCYU5kEFTbSIc/t4azOFuBX
         D/jeoTEu1++VmcSzP/kTFc1eT/M3pJ+XcASJufGyFr1L2DqFFlhzgMR6eT+GmdG4MOny
         0DsXhYwq1ASGXDfaQUKnnF2EjwP+q3DDIF1rhpxwI/nJG/2JvZIvjuBpE0JEpOES6a7l
         3EIOwF9FPOMKv49ue7XoOCpvrh2LP8ihFmE1a8mL5vKuziz2cmq3ZIuDZh1REq0nHp0m
         exdakIdPtSHyMTTRdgECNIrxLLvYmO5TcToyxAZbq4hMwIwohwUC++C6GTm9rmOJnrEx
         PDNg==
X-Gm-Message-State: APjAAAXgIrs//tGsUBBlB7BK++KtTH5y4tc9lj3Mose/D6wpQWCUx6oQ
        XJIhK9IB6yTA1baIGrPhrBk=
X-Google-Smtp-Source: APXvYqzvIkEr+0McIp2ku2FoqIhKkDVz4iWr5q9gGRq6TtKEG/suLMgsx+PpnJIKRMOwA/F3YlZAhg==
X-Received: by 2002:a65:6098:: with SMTP id t24mr13477929pgu.95.1573286106695;
        Fri, 08 Nov 2019 23:55:06 -0800 (PST)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
        by smtp.gmail.com with ESMTPSA id p16sm9531415pfn.171.2019.11.08.23.55.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2019 23:55:06 -0800 (PST)
From:   Chuhong Yuan <hslester96@gmail.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chuhong Yuan <hslester96@gmail.com>
Subject: [PATCH] media: si470x-i2c: add missed operations in remove
Date:   Sat,  9 Nov 2019 15:54:57 +0800
Message-Id: <20191109075457.29930-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The driver misses calling v4l2_ctrl_handler_free and
v4l2_device_unregister in remove like what is done in probe failure.
Add the calls to fix it.

Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
---
 drivers/media/radio/si470x/radio-si470x-i2c.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/radio/si470x/radio-si470x-i2c.c b/drivers/media/radio/si470x/radio-si470x-i2c.c
index 7541698a0be1..f491420d7b53 100644
--- a/drivers/media/radio/si470x/radio-si470x-i2c.c
+++ b/drivers/media/radio/si470x/radio-si470x-i2c.c
@@ -482,6 +482,8 @@ static int si470x_i2c_remove(struct i2c_client *client)
 	if (radio->gpio_reset)
 		gpiod_set_value(radio->gpio_reset, 0);
 
+	v4l2_ctrl_handler_free(&radio->hdl);
+	v4l2_device_unregister(&radio->v4l2_dev);
 	return 0;
 }
 
-- 
2.23.0

