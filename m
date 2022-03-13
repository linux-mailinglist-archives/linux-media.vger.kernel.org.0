Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB9294D76F2
	for <lists+linux-media@lfdr.de>; Sun, 13 Mar 2022 17:41:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233595AbiCMQm0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 13 Mar 2022 12:42:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232058AbiCMQmZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 13 Mar 2022 12:42:25 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7681415A17
        for <linux-media@vger.kernel.org>; Sun, 13 Mar 2022 09:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1647189675;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=bqoVTiTsGXXHBBRYe8M9hzomUWdwc4CvqTvtEGolwng=;
        b=Lx9Z0SLRwS/w7zAHj59wmtZFpcxoKT8E6yAtjErySoJXQe6ixq2WWx91G0Bna3WE4Wc0Y3
        KzHaXeyIglaiJYGQbnugrZQ5Wk9eK+B1QixA9yU6sFCfiDCQkJtZj4RUy8GVPoo98r4kpU
        0Q2iG53qZnTCUIk9lGvPSIy9KU0TVlg=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-581-jQuGhdGbMaSaiOpYM-Rreg-1; Sun, 13 Mar 2022 12:41:14 -0400
X-MC-Unique: jQuGhdGbMaSaiOpYM-Rreg-1
Received: by mail-oo1-f71.google.com with SMTP id o136-20020a4a2c8e000000b00321224df797so11182520ooo.20
        for <linux-media@vger.kernel.org>; Sun, 13 Mar 2022 09:41:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bqoVTiTsGXXHBBRYe8M9hzomUWdwc4CvqTvtEGolwng=;
        b=7m5Yt92vfjAfkAojZ45e9GlgyJUnY7+mJkAY8L5ri95ZJVJtfu6u3xp9TBuAomagEF
         yjhZpBR/3KQOTIMIgyhp24s58llcLX9rJCcCP3KmujWqH29iiRVLNQKo/c92OvFMNP/4
         Fc3mLf4rWnVDX68Jkrz98pmj21Z8luK/oIQzYAjsIDC5x94gvP+2gAp2UaACBRR1QqSW
         uEGIiZgjhqLfgVLBDsQaGM+AVzN+qQlLFGBPbcdEC5nBMW/XMHBFbQcNADGKO53pfUuZ
         x1+07TJCKZxsc2l9BmM90TyuKQlMVSTy2EP5ylgyfGQqvYzBTiZdADi76y6N0/tXTfzz
         edAQ==
X-Gm-Message-State: AOAM531wrhRBqnb69D8gg88iMtmsMYfpHc9LHujweTyZrwR1V8pfB0Nj
        IYhH/LCvUXmvbbJvSQGJRhCAE+2R/h2i1tIbT9dPBCKGTYMnE3I4Ewwmz/TpjjFtL+hztgjy3IN
        PWYMUONi0r6p76vY0Szbr5LE=
X-Received: by 2002:a4a:8c0a:0:b0:2dd:e256:88c8 with SMTP id u10-20020a4a8c0a000000b002dde25688c8mr8551828ooj.9.1647189673426;
        Sun, 13 Mar 2022 09:41:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwCOOpV5kTWBACRUlg4bObdEcMfOX5390WS3Kv1BpjVdmUqwie4T3pC2DQr7CUxkbwB6+ko/Q==
X-Received: by 2002:a4a:8c0a:0:b0:2dd:e256:88c8 with SMTP id u10-20020a4a8c0a000000b002dde25688c8mr8551818ooj.9.1647189673249;
        Sun, 13 Mar 2022 09:41:13 -0700 (PDT)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id q62-20020a4a3341000000b00320f8a179d0sm6160816ooq.30.2022.03.13.09.41.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Mar 2022 09:41:12 -0700 (PDT)
From:   trix@redhat.com
To:     jacopo@jmondi.org, mchehab@kernel.org, hverkuil-cisco@xs4all.nl
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tom Rix <trix@redhat.com>
Subject: [PATCH] media: i2c: cleanup comments
Date:   Sun, 13 Mar 2022 09:04:57 -0700
Message-Id: <20220313160457.1513543-1-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Tom Rix <trix@redhat.com>

For spdx, remove leading space

Replacements
parametrize to parameterize

Signed-off-by: Tom Rix <trix@redhat.com>
---
 include/media/i2c/mt9t112.h | 2 +-
 include/media/i2c/wm8775.h  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/media/i2c/mt9t112.h b/include/media/i2c/mt9t112.h
index e678b6ae8e2f5..825b4a169da81 100644
--- a/include/media/i2c/mt9t112.h
+++ b/include/media/i2c/mt9t112.h
@@ -1,4 +1,4 @@
-/*  SPDX-License-Identifier: GPL-2.0 */
+/* SPDX-License-Identifier: GPL-2.0 */
 /* mt9t112 Camera
  *
  * Copyright (C) 2009 Renesas Solutions Corp.
diff --git a/include/media/i2c/wm8775.h b/include/media/i2c/wm8775.h
index 83675817639e3..6ccdeb3817ab0 100644
--- a/include/media/i2c/wm8775.h
+++ b/include/media/i2c/wm8775.h
@@ -23,7 +23,7 @@
 
 struct wm8775_platform_data {
 	/*
-	 * FIXME: Instead, we should parametrize the params
+	 * FIXME: Instead, we should parameterize the params
 	 * that need different settings between ivtv, pvrusb2, and Nova-S
 	 */
 	bool is_nova_s;
-- 
2.26.3

