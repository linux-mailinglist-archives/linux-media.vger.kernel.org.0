Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA0103349CD
	for <lists+linux-media@lfdr.de>; Wed, 10 Mar 2021 22:25:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231636AbhCJVZA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Mar 2021 16:25:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232021AbhCJVYy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Mar 2021 16:24:54 -0500
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 076B7C061574
        for <linux-media@vger.kernel.org>; Wed, 10 Mar 2021 13:24:54 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id c10so41612330ejx.9
        for <linux-media@vger.kernel.org>; Wed, 10 Mar 2021 13:24:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kFBg87ijSxxVPs8Wk0QUC0fPYC45Xs1lujcO09zuX4Y=;
        b=OOErMVU/1Bm6q9bVhwGYYHCobPdZO//5Sp+14H4IOKY6LxqKMSwN/AzibSv1flMzcw
         HDEswuCLpodBdD1/mC0SFjcUCUg284ozVTliLxSReTYRMoTfy8POV0vQnDZ7nDnv/4Il
         ksAY5Ln2lsEbMfbjK+WdOVm9OUjDvoihcIiIs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kFBg87ijSxxVPs8Wk0QUC0fPYC45Xs1lujcO09zuX4Y=;
        b=na0AsFJvNMHMYi23bK5uq7qpBUpDs1+GGfE6iROSBJj8Qi/Uh2qKilP+ReLHBCW7mp
         /sH0JcatdeW2AFlQ4wLDw7HtzV7UcHqx2Lh8BfELj3D2dpZBgNz/ACcbypNrKeo03Ok9
         kFsM603dlrSKPQu3ssqtJj8EzfxuWWzDftaSmuL7WR851V+vUcBehETB37UJLuZxuhhA
         SN+xVYimzMvXbqeMMQbhDSJuWWgH07D/XgSzevz8UdCUs6fr6mBcfvJOS2dEkldnt2m7
         Nk18tqq3vzz/uHvoZmzyXcNme3iSDLo3WRoh6NTCe77taNpfYEqSk/2OO+nY36lHKMTB
         o4QQ==
X-Gm-Message-State: AOAM5303IYOlrogU5q0VIhHemleOtAkRb34mFcinl4khNfsDcSsZ7Cte
        oEQ/8b1EBETt/Nl3rJCkSval0Q==
X-Google-Smtp-Source: ABdhPJyBcbwfkamTCNah3HRnsZKJoZfBSZopo2obM61f9OAITBWIvSWLj8y9VcQ3dsvF56xTeHEnvQ==
X-Received: by 2002:a17:906:229b:: with SMTP id p27mr397385eja.287.1615411492846;
        Wed, 10 Mar 2021 13:24:52 -0800 (PST)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id w18sm320563ejn.23.2021.03.10.13.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 13:24:52 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH] v4l2-compliance: Fix V4L2_CTRL_WHICH_DEF_VAL in multi_classes
Date:   Wed, 10 Mar 2021 22:24:50 +0100
Message-Id: <20210310212450.1220416-1-ribalda@chromium.org>
X-Mailer: git-send-email 2.30.1.766.gb4fecdf3b7-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If there are multiple classes, the ioctl should fail.

Fixes: 0884b19adada ("v4l2-compliance: add test for V4L2_CTRL_WHICH_DEF_VAL")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 utils/v4l2-compliance/v4l2-test-controls.cpp | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/utils/v4l2-compliance/v4l2-test-controls.cpp b/utils/v4l2-compliance/v4l2-test-controls.cpp
index 9a68b7e847b0..79982bc15054 100644
--- a/utils/v4l2-compliance/v4l2-test-controls.cpp
+++ b/utils/v4l2-compliance/v4l2-test-controls.cpp
@@ -793,7 +793,10 @@ int testExtendedControls(struct node *node)
 	ctrls.which = V4L2_CTRL_WHICH_DEF_VAL;
 	fail_on_test(!doioctl(node, VIDIOC_S_EXT_CTRLS, &ctrls));
 	fail_on_test(!doioctl(node, VIDIOC_TRY_EXT_CTRLS, &ctrls));
-	fail_on_test(doioctl(node, VIDIOC_G_EXT_CTRLS, &ctrls));
+	if (multiple_classes)
+		fail_on_test(!doioctl(node, VIDIOC_G_EXT_CTRLS, &ctrls));
+	else
+		fail_on_test(doioctl(node, VIDIOC_G_EXT_CTRLS, &ctrls));
 	return 0;
 }
 
-- 
2.30.1.766.gb4fecdf3b7-goog

