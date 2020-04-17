Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41A781AE76B
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2020 23:16:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727919AbgDQVQq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Apr 2020 17:16:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726723AbgDQVQp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Apr 2020 17:16:45 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52E14C061A0C
        for <linux-media@vger.kernel.org>; Fri, 17 Apr 2020 14:16:44 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id 188so1669893pgj.13
        for <linux-media@vger.kernel.org>; Fri, 17 Apr 2020 14:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=itZwcVVIHhgjEICe2FG+zthfHUKDQn1/qPRwmfj157k=;
        b=Y+4PIegR6x8o67ASZRtIjRqeeHInJYu889OdqLkPwAyR9M8LSoUDtqZqT7KrzxZt42
         79RmNlDjhmw+v24tsKXQCrOjCuWdzc70gMpl3+NFZuuBlIBhIAiNveQJMvlRx56pnAxn
         MfnfgGHk9ZOmMPv+F7u8d8zPCkDcjX6ZBJna/i3au1EuywqrRJ5eI1QomrEys88sTgjL
         kjrxamIKHvRZd0ixpEcTtHXeQX9m9SR26Q29LyXotMbp8k4tWyYCD59eW5WWdImlz+yq
         kZtURkET+l3YObp2FdVoaAhREMsOa491wpmuqZBMP6JIm6N0oPvyGyQZd9jEOK1Igr88
         ZHzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=itZwcVVIHhgjEICe2FG+zthfHUKDQn1/qPRwmfj157k=;
        b=g+3SSNsUmy9Bbj4GBpMCwMv24DT2c7ArXV0R91c3WbIAUPmd9oq5/juiL6Pzcb0Tvj
         SMfJNU4YKm/4pQJ0d7nUMeZ4rC1SL7Ng9ye4s8Y+dMIj4AhemW8umk9GodpW49plSwc5
         N5WsN3Qi71KDAV4Y5Lh3ftaO0U9z/p4geE3NErYlJwX733AkB/V6W4j1q/nhCiMLoDSA
         9t4iRps3oBOB5JCOZ1f2ZJvAElaPqlJ0QC9WoSeKB6qnFMgULtsuVMKl+RKUVnv1XzPT
         W/c9AkVIjfvMkTwIx0W+qmbQ85t9gft90MDCxAU/Y6B7rpiBivbMEbzllq+UIXtXnsV3
         T/ow==
X-Gm-Message-State: AGi0PuYLPmnTkfTLyCKRyHYp7aYBB0DUGJHmHZMjDveuKxVU/H0tJPmw
        eipbQim/sVTVRElPgMqNum/MgwZOjZc=
X-Google-Smtp-Source: APiQypIL+thz7Z2lbtMjY5ONNa1ewTfE8OvqZsC0uSBvAP2EoCZE1qzX1qaOSvZ/mMi4HFJ42MSCQw==
X-Received: by 2002:a63:a70b:: with SMTP id d11mr5027298pgf.358.1587158203407;
        Fri, 17 Apr 2020 14:16:43 -0700 (PDT)
Received: from localhost.localdomain (astound-69-42-19-227.ca.astound.net. [69.42.19.227])
        by smtp.gmail.com with ESMTPSA id 80sm19413484pgb.45.2020.04.17.14.16.42
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2020 14:16:42 -0700 (PDT)
From:   Rosen Penev <rosenp@gmail.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH] toml: fix misleading identation
Date:   Fri, 17 Apr 2020 14:16:41 -0700
Message-Id: <20200417211641.4689-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.25.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Found with gcc's -Wmisleading-indentation

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 utils/common/toml.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/utils/common/toml.c b/utils/common/toml.c
index dc9868a2..68cebef9 100644
--- a/utils/common/toml.c
+++ b/utils/common/toml.c
@@ -1697,7 +1697,8 @@ int toml_rtots(const char* src_, toml_timestamp_t* ret)
         for (i = 0; i < 10; i++, p++) {
             int xx = *p;
             if (xx == '-') {
-                if (i == 4 || i == 7) continue; return -1;
+                if (i == 4 || i == 7) continue;
+                return -1;
             }
             if (! ('0' <= xx && xx <= '9')) return -1;
             val = val * 10 + (xx - '0');
@@ -1724,7 +1725,8 @@ int toml_rtots(const char* src_, toml_timestamp_t* ret)
     for (i = 0; i < 8; i++, p++) {
         int xx = *p;
         if (xx == ':') {
-            if (i == 2 || i == 5) continue; return -1;
+            if (i == 2 || i == 5) continue;
+            return -1;
         }
         if (! ('0' <= xx && xx <= '9')) return -1;
         val = val * 10 + (xx - '0');
-- 
2.25.2

