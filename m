Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EAFC33D9D2
	for <lists+linux-media@lfdr.de>; Tue, 16 Mar 2021 17:51:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234349AbhCPQvD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Mar 2021 12:51:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231834AbhCPQut (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Mar 2021 12:50:49 -0400
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com [IPv6:2607:f8b0:4864:20::829])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DADBC06174A
        for <linux-media@vger.kernel.org>; Tue, 16 Mar 2021 09:50:48 -0700 (PDT)
Received: by mail-qt1-x829.google.com with SMTP id c6so12120678qtc.1
        for <linux-media@vger.kernel.org>; Tue, 16 Mar 2021 09:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=I6s/GWpB8z+vs2gEBc10WX3m9xHJZEKi5YaS8/i76Jc=;
        b=lCWfemKlgMKpTJ63c16cf4tdMsthgyjYCUQwoxMCMkkbkBqVJdraH9TCRxww6mgVuq
         4QsmmW6LK+sPH23JkEyUXqDFuV2138eQqaHQKo+mK39e5dwJ4xgtumqgQFDFmxf8+0aU
         ahrHwfJXHpJxbHcJQWmqr8N2yXfCKI73kYL99lTzvjMkPq+izynej0qFuMV0R+S56NyK
         GuhXXIziPoAwPGTux2VKlkqpJkYOfLJ1ykDW0qX2io+xcnjl1U45fLA+6ayrpkR7nPxI
         mpqgeurcWeGnznq6KD4wGbq3hL18fzEGRklKHYs71B6IYp4gl0KSanD8hhi+5Vjdv8RM
         uo+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=I6s/GWpB8z+vs2gEBc10WX3m9xHJZEKi5YaS8/i76Jc=;
        b=a5XnuSNsvvUhYr699PgZmtpSaeMmVo2i44LwNqJIJUHxN741Xh0tnu4cnQJUETD8tn
         bXiO2AXh3Ou+4sgo8qxHSfGShdBhJn0hwF6PVrqwTh5UDvL8ET1Y8mmWi4owikDCddvJ
         fb9Wbp6CNDjX+m04+r+pYc3+iQIq6VafzLzXEBYL1vRg8TMH3Jr1182bYdUEF1tTD9L1
         ZxvA8Mnosc3r/UTiUlSMRy6Tute1w+Yxgh+hXwRUV+6wIaEO3jRqrQxsg0Bdw+3b9E9E
         ew3vGtC9VVQ25gxdmotp019Up17aza1tYLDVwndkyR1SkKfyzgeYR7hIsh5rq5MWXfDj
         B5gQ==
X-Gm-Message-State: AOAM5332Kzb0/oYy80rBIstWciquaj2dEMsQ6U9DibuNrPRA/yVJ5o7R
        FI9X2uqnYkmaZSxdl1BC1Oc=
X-Google-Smtp-Source: ABdhPJxjKEiIkg2y9KpIGmWhcFJKajEbKhyMA+COJIBuMGXMI8piK4wxuPI/q+UTDxpwv4Tw5aDKVQ==
X-Received: by 2002:ac8:550b:: with SMTP id j11mr559821qtq.360.1615913447526;
        Tue, 16 Mar 2021 09:50:47 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:482:919::1000])
        by smtp.gmail.com with ESMTPSA id j1sm13572709qti.55.2021.03.16.09.50.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Mar 2021 09:50:47 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     p.zabel@pengutronix.de
Cc:     hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2] media: coda: Remove unneeded of_match_ptr()
Date:   Tue, 16 Mar 2021 13:50:39 -0300
Message-Id: <20210316165039.235735-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The coda driver only runs on i.MX, which is a DT-only platform, so
remove the unneeded of_match_ptr().

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v1:
- In the Subject: Removed --> Remove

 drivers/media/platform/coda/coda-common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/coda/coda-common.c b/drivers/media/platform/coda/coda-common.c
index 995e95272e51..ccb4d3f4804e 100644
--- a/drivers/media/platform/coda/coda-common.c
+++ b/drivers/media/platform/coda/coda-common.c
@@ -3317,7 +3317,7 @@ static struct platform_driver coda_driver = {
 	.remove	= coda_remove,
 	.driver	= {
 		.name	= CODA_NAME,
-		.of_match_table = of_match_ptr(coda_dt_ids),
+		.of_match_table = coda_dt_ids,
 		.pm	= &coda_pm_ops,
 	},
 };
-- 
2.25.1

