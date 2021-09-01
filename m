Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F41BF3FD930
	for <lists+linux-media@lfdr.de>; Wed,  1 Sep 2021 14:03:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243873AbhIAMDr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Sep 2021 08:03:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243926AbhIAMDp (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Sep 2021 08:03:45 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62244C061760
        for <linux-media@vger.kernel.org>; Wed,  1 Sep 2021 05:02:48 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id d26so4230695wrc.0
        for <linux-media@vger.kernel.org>; Wed, 01 Sep 2021 05:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kvjkshBsZL+MRjib8570PI/tuRb4iFlF0PaMehLZjJ4=;
        b=dzSvn4RHJttKFOSm64mEroR9IRoIt9UyaGH17DQXq7LbKzUI44YaM4wVrBG4fUM76S
         V9WFpFC6vjx5iF4Wn21HwjhrbT1YgPr8EpBw4TZWvNmD+4E65GjR1IQ6pJtLYclnt80u
         Qr1ebxChCighqupPu5X32f6XSuKwrZ84IpgHwh41vcvkxRPwViQnwF5ufaIY6wnGqqg8
         5IKo6JQ4AZoyhczqpjlPRRmDGNX16SNKabaInV4ozPj+wRuLtLukddB8mUQXLjWQBGkf
         jeDuQn4hp6dmCOmxeg7w7q0VkXXQElXCDwVu2cv1tGIGafl7bsGxK33y5esn5gQBkORC
         A/rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kvjkshBsZL+MRjib8570PI/tuRb4iFlF0PaMehLZjJ4=;
        b=k1MZfCoeKRfeBTSGZ3SgJNZQ2DJLIo+F2a2EILVXtBd2AVqK1CWPFmKDMkwEGpdX5E
         qiGZQwIqmom1Xk7L+gSY0NzynY2GcXufiXqbPu0nwOnoiIHP4+bgPvaHGy5EqsKH/ZY8
         qInyYNNpFTdvOlcoRxt7Z9suM+9U+DUaeKFCQcfYeTlcAfnCPQQXNz5y1FE3mwRlJJUh
         dA3NxYfOE23htH0mpUmBXhzf3jLUHvd47s0ejHi2mnhrtMhKxW9wd4RcFMd1tOfVzUEu
         T02/RfQpRU0zQZnGZd8Cp366DvCiQnjj/IRbMIDfd9f1SBSv8aztBGvQK4UsFQabeJWg
         YuJw==
X-Gm-Message-State: AOAM5312XSZjYQVvOxesJKOHY3zxr3oIhXBVlMamnHw8bnluQNHzYrLn
        Jr3lOoUjNHHS6ui2qa3bbVU=
X-Google-Smtp-Source: ABdhPJxLTeJ8VsgxsRlNO8XS7iVSjRXV9946sSFr+9mkf0DaEKe11SupLqOFNweo1Y+23uPd10G1Vg==
X-Received: by 2002:adf:9151:: with SMTP id j75mr37560030wrj.68.1630497767071;
        Wed, 01 Sep 2021 05:02:47 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id l7sm5641336wmj.9.2021.09.01.05.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Sep 2021 05:02:46 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     dri-devel@lists.freedesktop.org
Cc:     daniel@ffwll.ch, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
Subject: [PATCH 1/2] dma-buf: clarify dma_fence_ops->wait documentation
Date:   Wed,  1 Sep 2021 14:02:39 +0200
Message-Id: <20210901120240.7339-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210901120240.7339-1-christian.koenig@amd.com>
References: <20210901120240.7339-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This callback is pretty much deprecated and should not be used by new implementations.

Clarify that in the documentation as well.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 include/linux/dma-fence.h | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index 6ffb4b2c6371..a44e42b86c2a 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -214,19 +214,15 @@ struct dma_fence_ops {
 	 * Custom wait implementation, defaults to dma_fence_default_wait() if
 	 * not set.
 	 *
-	 * The dma_fence_default_wait implementation should work for any fence, as long
-	 * as @enable_signaling works correctly. This hook allows drivers to
-	 * have an optimized version for the case where a process context is
-	 * already available, e.g. if @enable_signaling for the general case
-	 * needs to set up a worker thread.
+	 * Deprecated and should not be used by new implementations. Only used
+	 * by existing implementations which need special handling for their
+	 * hardware reset procedure.
 	 *
 	 * Must return -ERESTARTSYS if the wait is intr = true and the wait was
 	 * interrupted, and remaining jiffies if fence has signaled, or 0 if wait
 	 * timed out. Can also return other error values on custom implementations,
 	 * which should be treated as if the fence is signaled. For example a hardware
 	 * lockup could be reported like that.
-	 *
-	 * This callback is optional.
 	 */
 	signed long (*wait)(struct dma_fence *fence,
 			    bool intr, signed long timeout);
-- 
2.25.1

