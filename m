Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97E1D2EE782
	for <lists+linux-media@lfdr.de>; Thu,  7 Jan 2021 22:17:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727063AbhAGVQM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Jan 2021 16:16:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726720AbhAGVQL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Jan 2021 16:16:11 -0500
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 421A3C0612F6
        for <linux-media@vger.kernel.org>; Thu,  7 Jan 2021 13:15:29 -0800 (PST)
Received: by mail-pg1-x534.google.com with SMTP id z21so6002367pgj.4
        for <linux-media@vger.kernel.org>; Thu, 07 Jan 2021 13:15:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/gCsWuNpJqoaKmXUbqD2yoFjbhOP/NQNls4IpQYcF/Q=;
        b=K8BGJ9oHdqpLDSsv4ZzOKEHEpyQXmBiqo3CQDjAFOiubf8uMAXb8rE+2Q+8w+MuenT
         r39dpZHy1UjTwLvLcHtkgKqx7m1yH/VZCVvUsyblpu4gsHE8oyEh27knqvqkNx99hfd/
         OdLjIgReRKvwFliH9XDPaVNHEjCr8ivL1CuAOS5SsvSCJwjtqzf9bEeTilTgDDB91z1d
         d8gKjlz+Dsl9OtsTbJ+dMP1JwATb4Hb+DNbBTib+6EpAlAhzwgHklh5i6ggogkXvBu0w
         Sl0lvmy8kDpa3UVvGMnYPvuuD5pjaQCOY4j8xR9yncAL6VXY3VpNQLEDm0Rk5MWF1r7S
         80MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/gCsWuNpJqoaKmXUbqD2yoFjbhOP/NQNls4IpQYcF/Q=;
        b=fhCuTzOuPvGzvETQekvROene/f7X4SJKGrY/eerqPfYT5b0hEfsdCo+BTJ3Ua1Iag5
         YPDP5E1iP1nLUrrOjIk1/RnQ+pjPF4INuztolIRW3QFVT/vhlu3UlfpFdVT7QvQeVmUW
         Q4gZbbv0OvITn/TV22Veexy7Y1z/OoL34Ls03uj9fs6KtKqPR3uj3MhBvpcBH23Za0JM
         lVhkV4+lUT8GCX2qh1NmRQ3bH8KpjVVrPBG3foc3hQe+gMeXo1Qi4CeYBW5hUf4MHZ8W
         b7Cb2u/Zoy3KR+t+R7PeepV3MpNIf2PwXsmlNU+3jZHu9Q6+hA9JBSUCAGFY/bZ1Ibk7
         rgJg==
X-Gm-Message-State: AOAM530uxHK6zWohRNQ7kkN26a0e8vWs6HfMMdrQTMMJKjTCsUHhTPb2
        BGeKnJdafS8Ec2v8t73qpy3rTQ==
X-Google-Smtp-Source: ABdhPJw+uBkf603u8DBtRcPFLax4GUhUMXlfkuBYTBlYX9IqNd80YY3GhmwaHOU9hi8B00BuqmRrDQ==
X-Received: by 2002:a65:6249:: with SMTP id q9mr3744816pgv.82.1610054128730;
        Thu, 07 Jan 2021 13:15:28 -0800 (PST)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id b6sm6574055pfd.43.2021.01.07.13.15.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jan 2021 13:15:27 -0800 (PST)
From:   John Stultz <john.stultz@linaro.org>
To:     lkml <linux-kernel@vger.kernel.org>
Cc:     John Stultz <john.stultz@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Liam Mark <lmark@codeaurora.org>,
        Laura Abbott <labbott@kernel.org>,
        Brian Starkey <Brian.Starkey@arm.com>,
        Hridya Valsaraju <hridya@google.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Sandeep Patil <sspatil@google.com>,
        Daniel Mentz <danielmentz@google.com>,
        Chris Goldsworthy <cgoldswo@codeaurora.org>,
        =?UTF-8?q?=C3=98rjan=20Eide?= <orjan.eide@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Simon Ser <contact@emersion.fr>,
        James Jones <jajones@nvidia.com>, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] dma-buf: system_heap: Make sure to return an error if we abort
Date:   Thu,  7 Jan 2021 21:15:23 +0000
Message-Id: <20210107211525.75951-1-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If we abort from the allocation due to a fatal_signal_pending(),
be sure we report an error so any return code paths don't trip
over the fact that the allocation didn't succeed.

Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Liam Mark <lmark@codeaurora.org>
Cc: Laura Abbott <labbott@kernel.org>
Cc: Brian Starkey <Brian.Starkey@arm.com>
Cc: Hridya Valsaraju <hridya@google.com>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Sandeep Patil <sspatil@google.com>
Cc: Daniel Mentz <danielmentz@google.com>
Cc: Chris Goldsworthy <cgoldswo@codeaurora.org>
Cc: Ørjan Eide <orjan.eide@arm.com>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Ezequiel Garcia <ezequiel@collabora.com>
Cc: Simon Ser <contact@emersion.fr>
Cc: James Jones <jajones@nvidia.com>
Cc: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Suggested-by: Suren Baghdasaryan <surenb@google.com>
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
 drivers/dma-buf/heaps/system_heap.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
index 17e0e9a68baf..405351aad2a8 100644
--- a/drivers/dma-buf/heaps/system_heap.c
+++ b/drivers/dma-buf/heaps/system_heap.c
@@ -363,8 +363,10 @@ static int system_heap_allocate(struct dma_heap *heap,
 		 * Avoid trying to allocate memory if the process
 		 * has been killed by SIGKILL
 		 */
-		if (fatal_signal_pending(current))
+		if (fatal_signal_pending(current)) {
+			ret = -EINTR;
 			goto free_buffer;
+		}
 
 		page = alloc_largest_available(size_remaining, max_order);
 		if (!page)
-- 
2.17.1

