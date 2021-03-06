Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5822332F9BB
	for <lists+linux-media@lfdr.de>; Sat,  6 Mar 2021 12:33:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230191AbhCFLdJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 6 Mar 2021 06:33:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229888AbhCFLdD (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 6 Mar 2021 06:33:03 -0500
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A520C06175F;
        Sat,  6 Mar 2021 03:33:03 -0800 (PST)
Received: by mail-pl1-x642.google.com with SMTP id d11so2700509plo.8;
        Sat, 06 Mar 2021 03:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/fx6WZgqSrjuYPDTVZcWrwGq9E9g/m5mMZJZkpp59xk=;
        b=kH2wB7I9PrIkI/QXOpeCZAzddtwF0C+J1nXLA/2d3q61WoKQNVhnvTSm+TkMja7z8p
         xE/subkLSw06NJxGy+MuEY8Z8pivX+jAg6+omGLQ/jV6Pz3rW7IYsndsRNFkNXg5y/+c
         i+nGDbrAU+Hk5ViSGC7c4FmR8Q7IoMbln0wBM80Q/cH32UoIbv+SI0LMh9binPlLenrQ
         aEIUU3SVo+CJxwqKDWe0k+Ofo73t9bvX0C+5LWSbegy4q/VSGXBm/yRC7tM2SbfWhFw1
         9ZA0jizcNBZ2urevCUiHh+nMKhvF/9gd9kHF/0vKPtj98bh2TjsvUaBNCvWlKUIe9skU
         qOQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/fx6WZgqSrjuYPDTVZcWrwGq9E9g/m5mMZJZkpp59xk=;
        b=jIDLgqfJorRbFabo93k9ztADG0OxgTB0L3Fx+IJk3wxS0Hr9/gu8fiCSnXEedvs5oD
         W7mGQiuojvyJVavcZMHMqTdHyyec3fKPczxTIUipp4/yzppEwMak4tY6lHny24V9gnkR
         4sBKVvyfhZNUahVCPjRPUGgVY7XD5VFHUoJLZI1C7yB1jbXG04cq4suFLwMYJc8SaLaM
         kpPcRptHEC9oS+auANSIIDUCRzP/LP8hHQ4Ho0uUqU0oDsJTqn0/iOw215xqrjrbWh1h
         oxOhtMEyOTm3Q4SDxQo8VUG5e9WFequ7NZdHfHqmtWGmXXLcx9rjm3HMfO1PS47vZ5nq
         mxSQ==
X-Gm-Message-State: AOAM532DO0hPcWk507bvXsts33C3GuNYfoNCUvE35IjEPaWhqNP/gxaD
        NWpMZ74r207dLmgobEeI3Hc=
X-Google-Smtp-Source: ABdhPJx/g3BbbVaGbZa7LNVuZkgSOwDfPURgUCz4tuwJwhKwSHdP67mWEGPTz3W+Woc9Arv7W3Zufg==
X-Received: by 2002:a17:90a:d58a:: with SMTP id v10mr15477300pju.36.1615030382183;
        Sat, 06 Mar 2021 03:33:02 -0800 (PST)
Received: from localhost.localdomain ([178.236.46.205])
        by smtp.gmail.com with ESMTPSA id s26sm5460463pfd.5.2021.03.06.03.33.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Mar 2021 03:33:01 -0800 (PST)
From:   menglong8.dong@gmail.com
X-Google-Original-From: zhang.yunkai@zte.com.cn
To:     mchehab@kernel.org
Cc:     dwlsalmeida@gmail.com, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Zhang Yunkai <zhang.yunkai@zte.com.cn>
Subject: [PATCH] media:vidtv: remove duplicate include in vidtv_psi
Date:   Sat,  6 Mar 2021 03:32:55 -0800
Message-Id: <20210306113255.217387-1-zhang.yunkai@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Zhang Yunkai <zhang.yunkai@zte.com.cn>

'string.h' included in 'vidtv_psi.c' is duplicated.

Signed-off-by: Zhang Yunkai <zhang.yunkai@zte.com.cn>
---
 drivers/media/test-drivers/vidtv/vidtv_psi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_psi.c b/drivers/media/test-drivers/vidtv/vidtv_psi.c
index 47ed7907db8d..c11ac8dca73d 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_psi.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_psi.c
@@ -19,7 +19,6 @@
 #include <linux/ratelimit.h>
 #include <linux/slab.h>
 #include <linux/string.h>
-#include <linux/string.h>
 #include <linux/time.h>
 #include <linux/types.h>
 
-- 
2.25.1

