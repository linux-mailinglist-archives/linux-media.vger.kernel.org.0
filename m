Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CB101B65F9
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2020 23:10:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727814AbgDWVKz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Apr 2020 17:10:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727778AbgDWVKy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Apr 2020 17:10:54 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49DD3C09B042
        for <linux-media@vger.kernel.org>; Thu, 23 Apr 2020 14:10:53 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id z1so1918943pfn.3
        for <linux-media@vger.kernel.org>; Thu, 23 Apr 2020 14:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=mao265vqR3DSfNevTKL5tM2C8pyH2zCIE1IOHDhO9sY=;
        b=ap8WkfneMwYDbwaLUrB+PKEEQhK9MJRCSXn5c/EyFGJwhBgY+kYKFYor50/ae85HgG
         6yO4qFFUnW9Xg8M8bNb8Sw4LsYBiKiTNSrZ3MRHQd4AFllASxuHWrxkE8+XMiK3lnbLP
         2nC9whcAJyHrKv/OYNdJk4AU6IR+hL7CUga1/pwPTIV6snCeqKKzC8OcnsM1KFRP6u9e
         h/+G2zT1OcDzXBK+Qm7GuTU+78K91rFNA+ejlC7bVCkodz40h34y5+uRLMipYlaZdr+v
         +C1cnmlRfDSkRiG+1nzaVWUkEpc+vw2juM279GpQlTV9GHn7Cv3FisYN7CIu5J1bXwlA
         gJxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mao265vqR3DSfNevTKL5tM2C8pyH2zCIE1IOHDhO9sY=;
        b=jWkVKYBkizDfygqI03hxBMVfl5nW/gcmG0DPfTrjNwZz454Y9sYAtOHHl7n02FlxBp
         pdpdXZbOoBMr8Noc3PuHrpHjmHUUN981JjLlLw72cpvGvIPNyRLukfsHV38ApLnmJXd/
         2mklvmVp1VISasCbUMMw7rcz0/4KvXxgwhs1wmnRDi7NYZEj0tEnoihYQ9iJpKx9rI81
         j1bx4A0ZQ56XAQecf2y3TMxIVgTMHa8jHT9yDgm0YLsu+bXvmB3r/6RuNRWQUnnDeVVc
         KdB0Ik1mDc8QhM2/ZQHbx3vE8zQycth5plCA9OkxaPrpkJeBnaS6K8a9NgXq9V2Ta8nV
         reww==
X-Gm-Message-State: AGi0PubxdBGMMfMsW3axrQY/vvjhUV6gYEROO6XPrtGM8nxwsIL+wc6U
        6kfRy3yR6/FNsYft5gtVWmgvHRhZ
X-Google-Smtp-Source: APiQypKOrUnbtkuXnCCrAOzLyn5KVi6SQYaxF4U0inyJFffxjOv9u6Q055BGVc1ig0xDySWz53XZpQ==
X-Received: by 2002:a63:b954:: with SMTP id v20mr5503697pgo.100.1587676252620;
        Thu, 23 Apr 2020 14:10:52 -0700 (PDT)
Received: from localhost.localdomain (76-14-109-232.rk.wavecable.com. [76.14.109.232])
        by smtp.gmail.com with ESMTPSA id f21sm3563630pfn.71.2020.04.23.14.10.51
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2020 14:10:52 -0700 (PDT)
From:   Rosen Penev <rosenp@gmail.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 5/5] utils: fix double promotions
Date:   Thu, 23 Apr 2020 14:10:40 -0700
Message-Id: <20200423211040.14275-5-rosenp@gmail.com>
X-Mailer: git-send-email 2.25.3
In-Reply-To: <20200423211040.14275-1-rosenp@gmail.com>
References: <20200423211040.14275-1-rosenp@gmail.com>
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
index 0e497b2a..558f5d76 100644
--- a/utils/rds-ctl/rds-ctl.cpp
+++ b/utils/rds-ctl/rds-ctl.cpp
@@ -521,7 +521,7 @@ static void print_rds_statistics(const struct v4l2_rds_statistics *statistics)
 	printf("received blocks / received groups: %u / %u\n",
 		statistics->block_cnt, statistics->group_cnt);
 
-	float block_error_percentage = 0;
+	double block_error_percentage = 0;
 
 	if (statistics->block_cnt)
 		block_error_percentage =
@@ -530,7 +530,7 @@ static void print_rds_statistics(const struct v4l2_rds_statistics *statistics)
 		statistics->block_error_cnt,
 		block_error_percentage, statistics->group_error_cnt);
 
-	float block_corrected_percentage = 0;
+	double block_corrected_percentage = 0;
 
 	if (statistics->block_cnt)
 		block_corrected_percentage = (
diff --git a/utils/v4l2-compliance/v4l2-test-buffers.cpp b/utils/v4l2-compliance/v4l2-test-buffers.cpp
index 561a3376..26947724 100644
--- a/utils/v4l2-compliance/v4l2-test-buffers.cpp
+++ b/utils/v4l2-compliance/v4l2-test-buffers.cpp
@@ -2597,7 +2597,7 @@ static void streamFmt(struct node *node, __u32 pixelformat, __u32 w, __u32 h,
 	char hz[32] = "";
 
 	if (!frame_count)
-		frame_count = f ? static_cast<unsigned>(1.0f / fract2f(f)) : 10;
+		frame_count = f ? static_cast<unsigned>(1.0 / fract2f(f)) : 10;
 	node->g_fmt(fmt);
 	fmt.s_pixelformat(pixelformat);
 	fmt.s_width(w);
-- 
2.25.3

