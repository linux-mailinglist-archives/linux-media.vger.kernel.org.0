Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BDD61B3405
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2020 02:37:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726423AbgDVAhu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Apr 2020 20:37:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726420AbgDVAht (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Apr 2020 20:37:49 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 129A0C0610D6
        for <linux-media@vger.kernel.org>; Tue, 21 Apr 2020 17:37:49 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id a32so109268pje.5
        for <linux-media@vger.kernel.org>; Tue, 21 Apr 2020 17:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=miQ/fH2B66il6X0HrxWYtKaAyXX+ke6TTpDcvQf6v8Y=;
        b=Yajt77S1r8jsG4S1fYf79jhqNDpDlqchtOVR2r85rOUlj47bkAUHrglpY5L2+toSH9
         PHcHjOpCB1+0EQuiqsSkZRLoJz0IW3AqKTCItjyn5QqOHNehh/49IJvtqxrhCY1vOqt6
         BQgunLOfTRGRnQhoMCgu6bJSJPYxPfFO1jU0lvUssPPrlUku+v6u6v/OPhlEtw+iMrda
         nsS74QrBFjBZ3Y6VGEvVOCJHyYldOwfRjk0sSvDg8ZgvbRUo9Ct+uH0zX/k3ZPWw2ui6
         zSz1u67vmynSzQaKUMIGetoACXD6zJxCUC6lnwBEuJVgK1u2dCLNDnzzMhX/rQDpRFp5
         tm3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=miQ/fH2B66il6X0HrxWYtKaAyXX+ke6TTpDcvQf6v8Y=;
        b=oFjiIj+z9zG9Dhg5IhiwU3BIzbMwOeZehcRlNZqrVJ1ZTIMxm7igLRXNfKEUqyaQAl
         TC0rTGiNmvcmLEnWU0fD4qCfmqjPFhBDZz9N6WIVmthUfCHqbNSm28JMjdI4//6STASZ
         f5bI8Q0zt6kPuk233T33UKkzupwqCXDv2/FmkSXAzTjfm3R7DeBiTr/ZE8QjUNQ4NdLH
         VWAwLfRy78Lec+DVEHZHIy8S3CVn7r9VYzxKfthEk4qwOYxhRoNtPcHIv5YCOhWpZh1V
         F371gOiFAU8p08IrVUtHKOc2Wd8Q7vq39oTyMMc4SHf+7ugijpPKiE33ucwSXIK0jtdD
         v38w==
X-Gm-Message-State: AGi0PuZMdGq7rxdHT3hUdltHegS6opmGNLdI5aiUObtwZ9VDfniJ3tic
        p8972ZLfTWKeE5ecsXIzPzmWDrHa
X-Google-Smtp-Source: APiQypLs+HTSKXyl5zlA9Fx1vWbUHdU4md6P4GpsP6Yan5X12/sxYYV5fA5VOhVEmlJyaSYfO12HFA==
X-Received: by 2002:a17:90a:a2d:: with SMTP id o42mr8616040pjo.164.1587515868305;
        Tue, 21 Apr 2020 17:37:48 -0700 (PDT)
Received: from localhost.localdomain (76-14-109-232.rk.wavecable.com. [76.14.109.232])
        by smtp.gmail.com with ESMTPSA id y16sm1359676pfp.45.2020.04.21.17.37.47
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2020 17:37:47 -0700 (PDT)
From:   Rosen Penev <rosenp@gmail.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 11/12] utils: fix double promotions
Date:   Tue, 21 Apr 2020 17:37:34 -0700
Message-Id: <20200422003735.3891-11-rosenp@gmail.com>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <20200422003735.3891-1-rosenp@gmail.com>
References: <20200422003735.3891-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Found with -Wdouble-promotion

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 utils/rds-ctl/rds-ctl.cpp                   | 4 ++--
 utils/v4l2-compliance/v4l2-test-buffers.cpp | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/utils/rds-ctl/rds-ctl.cpp b/utils/rds-ctl/rds-ctl.cpp
index cc1d3bf7..cd6ece38 100644
--- a/utils/rds-ctl/rds-ctl.cpp
+++ b/utils/rds-ctl/rds-ctl.cpp
@@ -528,7 +528,7 @@ static void print_rds_statistics(const struct v4l2_rds_statistics *statistics)
 			(static_cast<float>(statistics->block_error_cnt) / statistics->block_cnt) * 100.0f;
 	printf("block errors / group errors: %u (%3.2f%%) / %u \n",
 		statistics->block_error_cnt,
-		block_error_percentage, statistics->group_error_cnt);
+		(double)block_error_percentage, statistics->group_error_cnt);
 
 	float block_corrected_percentage = 0;
 
@@ -536,7 +536,7 @@ static void print_rds_statistics(const struct v4l2_rds_statistics *statistics)
 		block_corrected_percentage = (
 			static_cast<float>(statistics->block_corrected_cnt) / statistics->block_cnt) * 100.0f;
 	printf("corrected blocks: %u (%3.2f%%)\n",
-		statistics->block_corrected_cnt, block_corrected_percentage);
+		statistics->block_corrected_cnt, (double)block_corrected_percentage);
 	for (int i = 0; i < 16; i++)
 		printf("Group %02d: %u\n", i, statistics->group_type_cnt[i]);
 }
diff --git a/utils/v4l2-compliance/v4l2-test-buffers.cpp b/utils/v4l2-compliance/v4l2-test-buffers.cpp
index 87c2e523..abf39cc7 100644
--- a/utils/v4l2-compliance/v4l2-test-buffers.cpp
+++ b/utils/v4l2-compliance/v4l2-test-buffers.cpp
@@ -2597,7 +2597,7 @@ static void streamFmt(struct node *node, __u32 pixelformat, __u32 w, __u32 h,
 	char hz[32] = "";
 
 	if (!frame_count)
-		frame_count = f ? (unsigned)(1.0f / fract2f(f)) : 10;
+		frame_count = f ? (unsigned)(1.0 / fract2f(f)) : 10;
 	node->g_fmt(fmt);
 	fmt.s_pixelformat(pixelformat);
 	fmt.s_width(w);
-- 
2.25.2

