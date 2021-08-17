Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E17C3EE71C
	for <lists+linux-media@lfdr.de>; Tue, 17 Aug 2021 09:25:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234633AbhHQH03 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Aug 2021 03:26:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233688AbhHQH03 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Aug 2021 03:26:29 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B20E6C061764
        for <linux-media@vger.kernel.org>; Tue, 17 Aug 2021 00:25:56 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id mq3so1221572pjb.5
        for <linux-media@vger.kernel.org>; Tue, 17 Aug 2021 00:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EJj6mUp6jIJCvuPCLT992qCdwNG8Ls4bJyy4PxSwI0E=;
        b=leQ3NDgm/xQY0Vifcy00MDK7q8H+0x3N05SRqLCrTJHnBkvVhOqvqaDwvDErUkmfsU
         WouvOWIHhZSY3Mr0jE9+FSarrei/bzvCfHBsMGiMNG4Df7YJYQlht70kVibF62jowVIT
         /gR3a1/bINAL7pZFYU/UkC2p2XakzIPjFB0XyNxbnEisp+WZ1evoaafKuRS6a620vUVG
         58NZd8HZWnGUKeMR+YXbp6WgumROwAXTlR7T6FdCvcNlmZ+fYUshycnr87EsAJVKcDIO
         llD1kjTey1x+tMnEbNBxxzJFwaxtJNmKWw7rxd8YwdKQxljwlHwxxjInp9BLBffKfOi8
         5ixQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EJj6mUp6jIJCvuPCLT992qCdwNG8Ls4bJyy4PxSwI0E=;
        b=BoNHo2E6MqKukFtBnOj4aY7Ti/1d0jjT60DLCz3TpoidZgiU8pQtKwjbkHr+eNPmnF
         SmfqbC94IP0BBdvJcifarN559ZLnlGX+WUU722BawF76kE+imMDd1MNWTgzyxdhMHSxk
         3cJ2BM4fOQWXS2iFRNF3Ax9jwYjxoSYGTxN7+ShkKZUa/8x1GPImSpeOEyED8l/lcoPh
         s5e9H1Q24t6Xu8bq5aX+wm820mKboN3CYz16tc9UZxQ/jYS3sKAJ88HC8OwoZ1f2SHVx
         Q25QItcO5LzQ0zBuiSFHk5aiRqKZ2eHxnRW4L0mJCKmlD7tiHGIhIs/leVAcVqeEOYVW
         6XVQ==
X-Gm-Message-State: AOAM531TTrtgBvS9jTwtNAuzLFtsqe5uBfEDYS+1NP8wRWm32ohOdMuQ
        UYNJT4AnMBvbWa9PDPGnqs298LqjUaU=
X-Google-Smtp-Source: ABdhPJyhYxPFXFaczhC+693lD2cMHG29E55wSeK4NtFLNTvZm2Ruv/gPBpA/7oB+qSPNDVKRePizmg==
X-Received: by 2002:a63:e807:: with SMTP id s7mr2225819pgh.200.1629185155808;
        Tue, 17 Aug 2021 00:25:55 -0700 (PDT)
Received: from ryzen.lan ([2001:470:1f05:79e::a89])
        by smtp.gmail.com with ESMTPSA id mr18sm1204916pjb.39.2021.08.17.00.25.55
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 00:25:55 -0700 (PDT)
From:   Rosen Penev <rosenp@gmail.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH] remove pointless constructor
Date:   Tue, 17 Aug 2021 00:25:54 -0700
Message-Id: <20210817072554.2782406-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The members can be initialized directly, allowing to remove the
onstructor.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 utils/v4l2-compliance/v4l2-test-buffers.cpp | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/utils/v4l2-compliance/v4l2-test-buffers.cpp b/utils/v4l2-compliance/v4l2-test-buffers.cpp
index a005fde61..2f01ed8f3 100644
--- a/utils/v4l2-compliance/v4l2-test-buffers.cpp
+++ b/utils/v4l2-compliance/v4l2-test-buffers.cpp
@@ -2453,8 +2453,6 @@ int testRequests(struct node *node, bool test_streaming)
 class BlockingThread
 {
 public:
-	BlockingThread() : done(false), running(false) {}
-
 	virtual ~BlockingThread()
 	{
 		stop();
@@ -2497,7 +2495,7 @@ public:
 		running = false;
 	}
 
-	std::atomic<bool> done;
+	std::atomic<bool> done{};
 
 private:
 	static void *startRoutine(void *arg)
@@ -2516,7 +2514,7 @@ private:
 	virtual void run() = 0;
 
 	pthread_t thread;
-	std::atomic<bool> running;
+	std::atomic<bool> running{};
 };
 
 class DqbufThread : public BlockingThread
-- 
2.31.1

