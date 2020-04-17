Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3115B1AE765
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2020 23:14:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727771AbgDQVOd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Apr 2020 17:14:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726396AbgDQVOd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Apr 2020 17:14:33 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F398C061A0C
        for <linux-media@vger.kernel.org>; Fri, 17 Apr 2020 14:14:33 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id ay1so1417598plb.0
        for <linux-media@vger.kernel.org>; Fri, 17 Apr 2020 14:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N7oZ7Q6W/01Bcz3jas7FhpIEPe5zL7KRi4a1VsnzYVA=;
        b=WVUQs1MKROA7790autdM07M/Q2xP+gMlYxrLsafyoPThrhBSK1uZ8ChwJ0U6MHAUYD
         KhUvZ/Q3bdnldkbYjCUZOkSK4qpSDwT3eeDYmhrsEbH8mluv4GcimJCm+1hGXZUVuYOQ
         oNAB6w7HoUzh5RtgXMXN6h1w3bXnv/l+IMnuUnxmXxXHhpeuseyt28F4W8HiY3Ud6TDp
         ww4DeLcB6KGSaiSa0Q1dRpLAGgkskrqf0Fd8+qL7LgYsL0qII9EVmr0jgKxt/ayJbfP5
         y+rk1HjpAdFWvONVCS7q4AMyhtO0U+LEdLOVNmDWAYq9G9Qz1oIbCdObcHwphWYdNEsl
         DgEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N7oZ7Q6W/01Bcz3jas7FhpIEPe5zL7KRi4a1VsnzYVA=;
        b=sKO4XgWmH9WLE+fcReKL78TN8ynZFBid5ObsZJpLYwWZA0Rc+9OKtjEWPCMAn32Q+M
         gZsV/hRbTq1q7UJnlyrPYGE0G7ASy2TXx27GuLF1uf12wB39cBRYbcA4V6ZmAj1v/HO/
         B6JVsAk3rsFFxFjELkgYq6H9m5fXcSVuPTN9tHIyAtPZJwOiUU/iWxqXoyESKaIK6jM2
         ptpQbNK9ZNznBXQRyd4nmKwWqxpGJRiBxIVm0IXRi/05jlW+JWa5QrPyKQNOAbZOpxvk
         Furgc6llG6rEcyfqpjl63T4KPRm+EbmvRai1CSBRSWY7P95Ustd7X2eTgg3qBGxkQnli
         aZCQ==
X-Gm-Message-State: AGi0PuYQsghoGpUjav9ktt9YcQ+AGE6WJwtIgoOQNppS+GpI66khG0V4
        pMqjSUdarEKfnlIgJPdoInCORQTBwes=
X-Google-Smtp-Source: APiQypIJxafGktSuz3ZyMz4kGLZTY/ncMcFAt+ZHsFyQUjRYP9HtuEM1m9yu0MIhRBswuBx2ItuDsA==
X-Received: by 2002:a17:902:ed13:: with SMTP id b19mr5541188pld.254.1587158072453;
        Fri, 17 Apr 2020 14:14:32 -0700 (PDT)
Received: from localhost.localdomain (astound-69-42-19-227.ca.astound.net. [69.42.19.227])
        by smtp.gmail.com with ESMTPSA id 22sm11028159pfb.132.2020.04.17.14.14.31
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2020 14:14:31 -0700 (PDT)
From:   Rosen Penev <rosenp@gmail.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH] treewide: add extra {} to initialization
Date:   Fri, 17 Apr 2020 14:14:30 -0700
Message-Id: <20200417211430.4296-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.25.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Found with clang-tidy's clang-diagnostic-missing-braces

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 utils/cec-follower/cec-processing.cpp     | 12 ++++++------
 utils/v4l2-compliance/v4l2-test-debug.cpp |  2 +-
 utils/v4l2-ctl/v4l2-ctl-common.cpp        |  2 +-
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/utils/cec-follower/cec-processing.cpp b/utils/cec-follower/cec-processing.cpp
index df1d95c4..58af25a1 100644
--- a/utils/cec-follower/cec-processing.cpp
+++ b/utils/cec-follower/cec-processing.cpp
@@ -729,22 +729,22 @@ static void processMsg(struct node *node, struct cec_msg &msg, unsigned me)
 		const struct short_audio_desc supported_formats[] = {
 			{ 2, SAD_FMT_CODE_AC3,
 			  SAD_SAMPLE_FREQ_MASK_32 | SAD_SAMPLE_FREQ_MASK_44_1,
-			  64, 0, 0 },
+			  {64}, 0, 0 },
 			{ 4, SAD_FMT_CODE_AC3,
 			  SAD_SAMPLE_FREQ_MASK_32,
-			  32, 0, 0 },
+			  {32}, 0, 0 },
 			{ 4, SAD_FMT_CODE_ONE_BIT_AUDIO,
 			  SAD_SAMPLE_FREQ_MASK_48 | SAD_SAMPLE_FREQ_MASK_192,
-			  123, 0, 0 },
+			  {123}, 0, 0 },
 			{ 8, SAD_FMT_CODE_EXTENDED,
 			  SAD_SAMPLE_FREQ_MASK_96,
-			  0, 0, SAD_EXT_TYPE_DRA },
+			  {0}, 0, SAD_EXT_TYPE_DRA },
 			{ 2, SAD_FMT_CODE_EXTENDED,
 			  SAD_SAMPLE_FREQ_MASK_176_4,
-			  SAD_FRAME_LENGTH_MASK_960 | SAD_FRAME_LENGTH_MASK_1024, 1, SAD_EXT_TYPE_MPEG4_HE_AAC_SURROUND },
+			  {SAD_FRAME_LENGTH_MASK_960 | SAD_FRAME_LENGTH_MASK_1024}, 1, SAD_EXT_TYPE_MPEG4_HE_AAC_SURROUND },
 			{ 2, SAD_FMT_CODE_EXTENDED,
 			  SAD_SAMPLE_FREQ_MASK_44_1,
-			  SAD_BIT_DEPTH_MASK_16 | SAD_BIT_DEPTH_MASK_24, 0, SAD_EXT_TYPE_LPCM_3D_AUDIO },
+			  {SAD_BIT_DEPTH_MASK_16 | SAD_BIT_DEPTH_MASK_24}, 0, SAD_EXT_TYPE_LPCM_3D_AUDIO },
 		};
 
 		__u8 num_descriptors, audio_format_id[4], audio_format_code[4];
diff --git a/utils/v4l2-compliance/v4l2-test-debug.cpp b/utils/v4l2-compliance/v4l2-test-debug.cpp
index e7f375b6..3f43e661 100644
--- a/utils/v4l2-compliance/v4l2-test-debug.cpp
+++ b/utils/v4l2-compliance/v4l2-test-debug.cpp
@@ -37,7 +37,7 @@
 int testRegister(struct node *node)
 {
 	struct v4l2_dbg_register reg;
-	struct v4l2_dbg_chip_info chip = { 0 };
+	struct v4l2_dbg_chip_info chip = {};
 	int ret;
 	int uid = getuid();
 
diff --git a/utils/v4l2-ctl/v4l2-ctl-common.cpp b/utils/v4l2-ctl/v4l2-ctl-common.cpp
index aee2551b..e3c2602c 100644
--- a/utils/v4l2-ctl/v4l2-ctl-common.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-common.cpp
@@ -924,7 +924,7 @@ void common_set(cv4l_fd &_fd)
 			    qc.flags & V4L2_CTRL_FLAG_UPDATE)
 				use_ext_ctrls = true;
 			if (qc.flags & V4L2_CTRL_FLAG_HAS_PAYLOAD) {
-				struct v4l2_ext_controls ctrls = { 0, 1 };
+				struct v4l2_ext_controls ctrls = { {0}, 1 };
 				unsigned divide[V4L2_CTRL_MAX_DIMS] = { 0 };
 				ctrl_subset subset;
 				long long v;
-- 
2.25.2

