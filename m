Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC1D2380CE2
	for <lists+linux-media@lfdr.de>; Fri, 14 May 2021 17:27:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234684AbhENP2y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 May 2021 11:28:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231419AbhENP2u (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 May 2021 11:28:50 -0400
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 747FEC061574;
        Fri, 14 May 2021 08:27:38 -0700 (PDT)
Received: by mail-qk1-x72a.google.com with SMTP id a2so29052990qkh.11;
        Fri, 14 May 2021 08:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o3MbfhHMqR6RZ/tABsLXYCCJMCeOjvYQWOcgKDa5UEY=;
        b=ZFO8qT+igxKqjq8PUjvP1muLiH05uDD5WYBrxu/iQqZcXyItVn4hbNZaoqLjAk701P
         fthy1BHQUw/m/oD+9TPkggbWXqCybQ7nFKccsA+71qeznhG6diJAoYVzD0ZCdsuR1fQo
         y5Ggi9TblT1pJwevy8KxoF+E2AG+RTyKS3tn7pYLd6JhyF/+3pqUh2LyfsbluCBrEmmR
         IJPrZbxPIALvHCvtwKD+nP71WdKvJfuP9UauoscFmg7k0U018Dtk1f3pO37U2XGcKvDy
         QuBet7ELx6wjljuF2QtPyFdGqOke+C57M3ayd7fsvpv8Qc2UbtTqsjk7rt+n6zOyKSDV
         tr9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=o3MbfhHMqR6RZ/tABsLXYCCJMCeOjvYQWOcgKDa5UEY=;
        b=VMk7l8emhWkrCcnEGqHHGHL06PlJpBIG0vnH5cQaTcXxosglKgAFC99SWsLW+9cRfL
         +jvY1bDXkORJhrvUhXtQvC7wueGXf6QrD3fP3B+uZwdW/tUVodHLrilOQUgG/P3nXfit
         0/5xpDBz57K1qnalWmnG5naOb/qK//fRIEHjbuCGg9A61KL97PjOw4+/L77KvA8rRgV6
         1pe+ryDJVMQYugm5tWO4Tq7PGQmYlILoUhIfIRj89p2J8kiihLaKoehc8YBTdhX5H6wW
         Rljs5h2CE5yNI96b6jRsvRtmLyC2uG5BPA3KtqJs5M/vUqwyUiBfbpf3ndi6MLK+171H
         vbpw==
X-Gm-Message-State: AOAM5317JX/s9CUFs43j1+zMgN8zlp49XZWzRKwCssv3EQZWyOCqRq8W
        IdqsMU80abV+lBAQPx8acKqFdW9JcsA=
X-Google-Smtp-Source: ABdhPJwv6L/FlMKAmAhwcA4pvFa/j/o4K4J/XyF+oF1gA97E/UyVz3l0Xjjg+D5b4bgm3qz3CXsbVg==
X-Received: by 2002:a05:620a:448c:: with SMTP id x12mr12870831qkp.52.1621006057701;
        Fri, 14 May 2021 08:27:37 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b3sm3359782qtg.55.2021.05.14.08.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 May 2021 08:27:37 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] media: media/test_drivers: Drop unnecessary NULL check after container_of
Date:   Fri, 14 May 2021 08:27:34 -0700
Message-Id: <20210514152734.1363809-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The result of container_of() operations is never NULL unless the embedded
element is the first element of the structure. This is not the case here.
The NULL check is therefore unnecessary and misleading. Remove it.

This change was made automatically with the following Coccinelle script.

@@
type t;
identifier v;
statement s;
@@

<+...
(
  t v = container_of(...);
|
  v = container_of(...);
)
  ...
  when != v
- if (\( !v \| v == NULL \) ) s
...+>

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/media/test-drivers/vim2m.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/media/test-drivers/vim2m.c b/drivers/media/test-drivers/vim2m.c
index a24624353f9e..d714fe50afe5 100644
--- a/drivers/media/test-drivers/vim2m.c
+++ b/drivers/media/test-drivers/vim2m.c
@@ -624,11 +624,6 @@ static void device_work(struct work_struct *w)
 
 	curr_ctx = container_of(w, struct vim2m_ctx, work_run.work);
 
-	if (!curr_ctx) {
-		pr_err("Instance released before the end of transaction\n");
-		return;
-	}
-
 	vim2m_dev = curr_ctx->dev;
 
 	src_vb = v4l2_m2m_src_buf_remove(curr_ctx->fh.m2m_ctx);
-- 
2.25.1

