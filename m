Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50B241B33FB
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2020 02:37:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726061AbgDVAhj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Apr 2020 20:37:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726012AbgDVAhi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Apr 2020 20:37:38 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1993C0610D5
        for <linux-media@vger.kernel.org>; Tue, 21 Apr 2020 17:37:38 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id x26so203956pgc.10
        for <linux-media@vger.kernel.org>; Tue, 21 Apr 2020 17:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=b4qN33twK9Pm4HfbghORT03LplAOhJxJw2HuMucg0WI=;
        b=TbaTvr6FKclQFCewjuMuOdGQYyQjBBARHOhYyakRTZdGLUw/rBrwESkgkuOdfk0mxa
         ZANiGAs3m/rGV/zMr5D0/hokm4AioasfB9t9s5fXhzBjo9ciapkt3hTAWxR/y4bZtJ+V
         fSuOZpOnm6+e8TNN5b4wwPwpLapcDq0zw12WOnyHmKaKLJa4FKgMBi0gPFy186PXLrMm
         ttLgfnIxzC8I1bzHhCR6kLCazfq7cxtZMapAL2r7CLmM89HCrnap7TrdMcOw3TkslOFt
         0XzIj/WkBlWQH7K2DL1My8bQh4kCSlwHZ/Pfkf5BF7Gf59QShPZXWyEaYsqq31tEzLFe
         9X0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=b4qN33twK9Pm4HfbghORT03LplAOhJxJw2HuMucg0WI=;
        b=DKg6EarwbvE5a2klzCEyJ83dL+XZQh68aBXU/lL24Iqql6rcQs1zbGou3kbfIJoyd7
         9f6J0T7SMb7mQkmgQhZ29/xTd3zyza7tFm8exDhxPRJeCJG6dxr009Ke6Ciz/dlb17RQ
         AOOj49R7il8m3ggzVcZG530g82ROkZQt5OvAAS4rdwFQ8Z+hMph4OTvEvuxEc/yVfiRZ
         x1UfpuEA48hUcmcn0Gx2SwjWciT+9NLP++OnqihJ6a50ZZxVhu4RLybZ7INssrDikkz2
         ioklI8ncoeTsJZ0+M6XkQusWwoOBb3us4LD6pXZXuagufs9jhEFhtuz7WOZarPJG+Wxq
         PxCw==
X-Gm-Message-State: AGi0PuYA2MZSzOMXrQMbn112D1n7Hhcs5cQF4XYo6wG72shrOvMjRdgF
        tcVhj4ok8HkftNfSn0Lx/HJUYJ1F
X-Google-Smtp-Source: APiQypKntyEfvElKLtkTqe0MkykBvlG0gwmhUuXztTtREq+3jmuZB6KGdWPczTuAfZR8hHE75c7VUw==
X-Received: by 2002:a63:da10:: with SMTP id c16mr1879983pgh.208.1587515857878;
        Tue, 21 Apr 2020 17:37:37 -0700 (PDT)
Received: from localhost.localdomain (76-14-109-232.rk.wavecable.com. [76.14.109.232])
        by smtp.gmail.com with ESMTPSA id y16sm1359676pfp.45.2020.04.21.17.37.36
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2020 17:37:37 -0700 (PDT)
From:   Rosen Penev <rosenp@gmail.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 01/12] utils: fix compilation with C++98
Date:   Tue, 21 Apr 2020 17:37:24 -0700
Message-Id: <20200422003735.3891-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.25.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 utils/cec-compliance/cec-test.cpp | 4 ++--
 utils/rds-ctl/rds-ctl.cpp         | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/utils/cec-compliance/cec-test.cpp b/utils/cec-compliance/cec-test.cpp
index 032ff5ad..cc07998a 100644
--- a/utils/cec-compliance/cec-test.cpp
+++ b/utils/cec-compliance/cec-test.cpp
@@ -908,7 +908,7 @@ static int tuner_ctl_test(struct node *node, unsigned me, unsigned la, bool inte
 		cec_msg_give_tuner_device_status(&msg, true, CEC_OP_STATUS_REQ_ONCE);
 		fail_on_test(!transmit_timeout(node, &msg));
 		fail_on_test(timed_out_or_abort(&msg));
-		info = {};
+		memset(&info, 0, sizeof(info));
 		cec_ops_tuner_device_status(&msg, &info);
 		if (!memcmp(&info, &info_vec[0], sizeof(info)))
 			break;
@@ -935,7 +935,7 @@ static int tuner_ctl_test(struct node *node, unsigned me, unsigned la, bool inte
 		cec_msg_give_tuner_device_status(&msg, true, CEC_OP_STATUS_REQ_ONCE);
 		fail_on_test(!transmit_timeout(node, &msg));
 		fail_on_test(timed_out_or_abort(&msg));
-		info = {};
+		memset(&info, 0, sizeof(info));
 		cec_ops_tuner_device_status(&msg, &info);
 		if (memcmp(&info, &(*iter), sizeof(info))) {
 			log_tuner_service(info);
diff --git a/utils/rds-ctl/rds-ctl.cpp b/utils/rds-ctl/rds-ctl.cpp
index 0511fe5d..0e497b2a 100644
--- a/utils/rds-ctl/rds-ctl.cpp
+++ b/utils/rds-ctl/rds-ctl.cpp
@@ -918,7 +918,7 @@ static void get_options(const int fd, const int capabilities, struct v4l2_freque
 				printf("\tFrequency range      : %.1f MHz - %.1f MHz\n",
 					 vt.rangelow / 16.0, vt.rangehigh / 16.0);
 			printf("\tSignal strength/AFC  : %ld%%/%d\n",
-				std::lround(vt.signal / 655.35), vt.afc);
+				lround(vt.signal / 655.25), vt.afc);
 			printf("\tCurrent audio mode   : %s\n", audmode2s(vt.audmode));
 			printf("\tAvailable subchannels: %s\n",
 					rxsubchans2s(vt.rxsubchans).c_str());
-- 
2.25.2

