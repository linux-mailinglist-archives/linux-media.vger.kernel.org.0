Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D48C24318E
	for <lists+linux-media@lfdr.de>; Thu, 13 Aug 2020 01:55:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726574AbgHLXz4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Aug 2020 19:55:56 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:60130 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726557AbgHLXz4 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Aug 2020 19:55:56 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1597276555; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=jmWOs7dUstJ+xpaEhBZheCFEL5CtWJqUMAkhh10xqGo=; b=W7EHw08z/jB1jowb4W3VEZMBVo6K18QutwUoEWnh3aKBUE8J5ojmd8cBlJT5sYEpy6vV5O8D
 LOC1VL6wSewgXrvojxNOkO7+zUxwa5QEYSR+2CLAXD1JVQAP3v0xriUCeN3k87PNwvQAX500
 f30jhzh+BL0Rv9QgyQokHHz2IOs=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI3ZjU0NiIsICJsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 5f3481862b87d6604943c0c3 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 12 Aug 2020 23:55:50
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C7632C4339C; Wed, 12 Aug 2020 23:55:49 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jordan-laptop.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B14B0C433C9;
        Wed, 12 Aug 2020 23:55:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B14B0C433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Gustavo Padovan <gustavo@padovan.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [RFC PATCH v1] dma-fence-array: Deal with sub-fences that are signaled late
Date:   Wed, 12 Aug 2020 17:55:44 -0600
Message-Id: <20200812235544.2289895-1-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is an RFC because I'm still trying to grok the correct behavior.

Consider a dma_fence_array created two two fence and signal_on_any is true.
A reference to dma_fence_array is taken for each waiting fence.

When the client calls dma_fence_wait() only one of the fences is signaled.
The client returns successfully from the wait and puts it's reference to
the array fence but the array fence still remains because of the remaining
un-signaled fence.

Now consider that the unsignaled fence is signaled while the timeline is being
destroyed much later. The timeline destroy calls dma_fence_signal_locked(). The
following sequence occurs:

1) dma_fence_array_cb_func is called

2) array->num_pending is 0 (because it was set to 1 due to signal_on_any) so the
callback function calls dma_fence_put() instead of triggering the irq work

3) The array fence is released which in turn puts the lingering fence which is
then released

4) deadlock with the timeline

I think that we can fix this with the attached patch. Once the fence is
signaled signaling it again in the irq worker shouldn't hurt anything. The only
gotcha might be how the error is propagated - I wasn't quite sure the intent of
clearing it only after getting to the irq worker.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
---

 drivers/dma-buf/dma-fence-array.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
index d3fbd950be94..b8829b024255 100644
--- a/drivers/dma-buf/dma-fence-array.c
+++ b/drivers/dma-buf/dma-fence-array.c
@@ -46,8 +46,6 @@ static void irq_dma_fence_array_work(struct irq_work *wrk)
 {
 	struct dma_fence_array *array = container_of(wrk, typeof(*array), work);
 
-	dma_fence_array_clear_pending_error(array);
-
 	dma_fence_signal(&array->base);
 	dma_fence_put(&array->base);
 }
@@ -61,10 +59,10 @@ static void dma_fence_array_cb_func(struct dma_fence *f,
 
 	dma_fence_array_set_pending_error(array, f->error);
 
-	if (atomic_dec_and_test(&array->num_pending))
-		irq_work_queue(&array->work);
-	else
-		dma_fence_put(&array->base);
+	if (!atomic_dec_and_test(&array->num_pending))
+		dma_fence_array_set_pending_error(array, f->error);
+
+	irq_work_queue(&array->work);
 }
 
 static bool dma_fence_array_enable_signaling(struct dma_fence *fence)
-- 
2.25.1

