Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCE843B1464
	for <lists+linux-media@lfdr.de>; Wed, 23 Jun 2021 09:07:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229928AbhFWHJa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Jun 2021 03:09:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229920AbhFWHJ2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Jun 2021 03:09:28 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 054D4C061574
        for <linux-media@vger.kernel.org>; Wed, 23 Jun 2021 00:07:12 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id bb10-20020a17090b008ab029016eef083425so3293993pjb.5
        for <linux-media@vger.kernel.org>; Wed, 23 Jun 2021 00:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EJj6mUp6jIJCvuPCLT992qCdwNG8Ls4bJyy4PxSwI0E=;
        b=dM9qDLz/tBySVu8MqeKUMVdoWAmMiO2GiCnHNcpJ+0KEt+I9DH0qXwwq8qt584Zxc4
         BG5Qr00RPQapN8igj0Olo/J1Wsr0T/4HLPrTFtMmHUFHCV9PI0XGqyhNYNm2fUeYAIOp
         y75duOZpdfB8Aox7qBVcAraH1cH1rfifVL8drs0ILCmmCmCKrR8u0c3TNHoggPBpEGMn
         lbKeoD5sssLv+6J8PrjvqHzy4Up8CkFd6cu+9DC3sp8MIVNPwMuEAvyFYZGB7GYUVrAI
         LTK6xdbI4I3hEbvImfdJmRoahAN8xhROC//i4mKaX/ortnC7hPiuECLd4cALpmZH942v
         TiOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EJj6mUp6jIJCvuPCLT992qCdwNG8Ls4bJyy4PxSwI0E=;
        b=eE1uaBDPpJl1fVurEWERcw/WgczUtvry6/zLr9iurt92CRiiWRWdah3NJsrdOGyH10
         8l97bP8INjo98jB+mnmkV7ZwzOvhosUJsKvPuTh6Ni9yrudQHKRezVE+LCLY6wS6wZPS
         Oi32lM3yujOkXn6EONXgNCswkJq6ZwkaPsA/zdD9MlovG2MDTqmxXgtsc3Uzln9OTz2n
         mX6XmDstRJRCYEJ/R6DrPQ/PYuehs2Cnvc6DkTWUtwQhMUBmmFP+NVqU6dvUCVww+IQL
         awGJmvSCvrLaBNZPl2mwitzUtaXmVA4rlq57o+XpdAFOPf9K4qCI5ZniMOOqj1JdbyVm
         7vsQ==
X-Gm-Message-State: AOAM533xcuBUFZQP6DjbkFxDBfW09taWfQkwxipKod2eNGi7Wsj3B8KU
        aqLg8KWCusXm/rDG47FleoBZSgecx0y3sQ==
X-Google-Smtp-Source: ABdhPJz2BNNWcGQbgRUQZwfFu9TYcCEOOM7lJLrRro/aVspSbBMJBYQ0u2VKtsNYHhFJdwBGbcEcKA==
X-Received: by 2002:a17:90b:238e:: with SMTP id mr14mr8152355pjb.70.1624432031182;
        Wed, 23 Jun 2021 00:07:11 -0700 (PDT)
Received: from ryzen.lan ([2001:470:1f05:79e::a89])
        by smtp.gmail.com with ESMTPSA id x5sm1348198pff.37.2021.06.23.00.07.09
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jun 2021 00:07:10 -0700 (PDT)
From:   Rosen Penev <rosenp@gmail.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH] remove pointless constructor
Date:   Wed, 23 Jun 2021 00:07:06 -0700
Message-Id: <20210623070706.17245-1-rosenp@gmail.com>
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

