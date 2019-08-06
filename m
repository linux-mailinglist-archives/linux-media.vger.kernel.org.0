Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85A1483861
	for <lists+linux-media@lfdr.de>; Tue,  6 Aug 2019 20:04:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726877AbfHFSEh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Aug 2019 14:04:37 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:45651 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726713AbfHFSEh (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Aug 2019 14:04:37 -0400
Received: by mail-pg1-f196.google.com with SMTP id o13so41976744pgp.12;
        Tue, 06 Aug 2019 11:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=0sEXZ1dMAlmGbbU8M9+e6+pMeR/YjA8tbgOYXYL4lFY=;
        b=ZdctHFTh+NO1eMxwRtcXMkHZYb8PlxhD82kI0ZatBueh9oqehXDd2rGPR0cwVBg/B+
         F6wfNWTpRo2pZsK1+9t0FyH3HEcmR+83ue3VgCLY9qxIPlkKkFM9b0Yl7RPTyziPFd7m
         2HRFfKjSetYKbRSGzeQ+I00XgHJBuo+HAQYUmSB3zrB0y6rrW/XCJaWEvk99YrCR3ZjX
         Vmrj5ihRM/kO0UrkjCsvgF/a48u9lxPMVYSV4QlXRBbI70yvrAMc9j8ql4iAolHK3TDd
         O1hD6TwCdv8i2D4cxSfzyYkfpyhWrmYsShqKbDPjFFMT7qrovPjEGvpmHRbophr4FLg4
         senQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=0sEXZ1dMAlmGbbU8M9+e6+pMeR/YjA8tbgOYXYL4lFY=;
        b=WZ8sEZCF4J9D3QaXjQwGPO62F3aAL6JLUgxlWeI82vIsW2mHWgtHRDnC8NJJYzXxve
         DkZtiXEfH6JYhgr9fNlARJI0rzeEAkyVf48Mmaqpvg5ZNqPbo8oRhaGjKqkhuSYWNbWO
         Y5AxSR9YrVqHNVk4+5XhpqMITkuj25plWqj7ibfLV59Djj52kdKagDs6s3V5weR2q1YB
         zzD4HmtJsXENVUM6z6gEDM6gJ8aTzBxW1K/gnxG6kIfZiu8nC8Q7Qw38NQQUNRNnvkDe
         sjZ/+j8ug2CyP6ny4666KdjldwiKD2/pLJdpk/VRIob3yS2hHwFvYMDgHuY7oygVyoyQ
         PqGg==
X-Gm-Message-State: APjAAAVQpwX/MsG5U1sNjC06MbNj0L1MHiSrJomZI5Q+tBQXGDbj/Tii
        A3K/ilwYwQGspNjdQPGZf0I=
X-Google-Smtp-Source: APXvYqzB7Shv+p5WaACzxxViLf9tzWnCIYSvG9H25sFhcQqPWQqufwddPxjzWnw9CQM6c4zSPVleJw==
X-Received: by 2002:a62:d0:: with SMTP id 199mr4763174pfa.253.1565114676527;
        Tue, 06 Aug 2019 11:04:36 -0700 (PDT)
Received: from localhost.localdomain.localdomain ([218.189.25.30])
        by smtp.gmail.com with ESMTPSA id r27sm102611532pgn.25.2019.08.06.11.04.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 06 Aug 2019 11:04:35 -0700 (PDT)
From:   Xinpeng Liu <danielliu861@gmail.com>
To:     sumit.semwal@linaro.org, gustavo@padovan.org
Cc:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
        Xinpeng Liu <danielliu861@gmail.com>
Subject: [PATCH] fence: checking for NULL pointer after dereferencing it.
Date:   Wed,  7 Aug 2019 02:04:24 +0800
Message-Id: <1565114664-10785-1-git-send-email-danielliu861@gmail.com>
X-Mailer: git-send-email 1.8.3.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

drivers/dma-buf/dma-fence.c:131 in function dma_fence_signal_locked,
if (WARN_ON(!fence)) should be before lockdep_assert_held(fence->lock);
otherwise there is not any meaning.

Signed-off-by: Xinpeng Liu <danielliu861@gmail.com>
---
 drivers/dma-buf/dma-fence.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index 59ac96e..0b11063 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -131,10 +131,9 @@ int dma_fence_signal_locked(struct dma_fence *fence)
 	struct dma_fence_cb *cur, *tmp;
 	int ret = 0;
 
-	lockdep_assert_held(fence->lock);
-
 	if (WARN_ON(!fence))
 		return -EINVAL;
+	lockdep_assert_held(fence->lock);
 
 	if (test_and_set_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags)) {
 		ret = -EINVAL;
-- 
1.8.3.1

