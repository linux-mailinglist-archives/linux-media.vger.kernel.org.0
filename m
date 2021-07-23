Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B9803D3A44
	for <lists+linux-media@lfdr.de>; Fri, 23 Jul 2021 14:33:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234805AbhGWLwU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Jul 2021 07:52:20 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:55002 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234864AbhGWLvo (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Jul 2021 07:51:44 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1627043504; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=wysabhsQt0sSAqX5dRirGa+wnwar64nTD29qqOFcFoM=; b=csfJkIUsTKOy8c5zs/g/4SVJgDOK+7dR4/N2Kpz2xWTzNmRcJMeH8aM3MwY4fj4Tb6w/cLdp
 2/VlRkJKgawYoEaT/qWatR/CVymM8TuPKAptfoENp+L3Ivd5mFFqHyzWdO0lQ8miWndSAii+
 tQM2BzgNQQ/+6VndrvUdy2aA1lE=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI3ZjU0NiIsICJsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 60fab697b653fbdadd2df866 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 23 Jul 2021 12:31:19
 GMT
Sender: charante=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 8FC5FC433D3; Fri, 23 Jul 2021 12:31:18 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from hu-charante-hyd.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: charante)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5A739C433F1;
        Fri, 23 Jul 2021 12:31:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5A739C433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=charante@codeaurora.org
From:   Charan Teja Reddy <charante@codeaurora.org>
To:     sumit.semwal@linaro.org, christian.koenig@amd.com
Cc:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
        vinmenon@codeaurora.org,
        Charan Teja Reddy <charante@codeaurora.org>
Subject: [PATCH] dma-buf: WARN on dmabuf release with pending attachments
Date:   Fri, 23 Jul 2021 18:01:08 +0530
Message-Id: <1627043468-16381-1-git-send-email-charante@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

It is expected from the clients to follow the below steps on an imported
dmabuf fd:
a) dmabuf = dma_buf_get(fd) // Get the dmabuf from fd
b) dma_buf_attach(dmabuf); // Clients attach to the dmabuf
   o Here the kernel does some slab allocations, say for
dma_buf_attachment and may be some other slab allocation in the
dmabuf->ops->attach().
c) Client may need to do dma_buf_map_attachment().
d) Accordingly dma_buf_unmap_attachment() should be called.
e) dma_buf_detach () // Clients detach to the dmabuf.
   o Here the slab allocations made in b) are freed.
f) dma_buf_put(dmabuf) // Can free the dmabuf if it is the last
reference.

Now say an erroneous client failed at step c) above thus it directly
called dma_buf_put(), step f) above. Considering that it may be the last
reference to the dmabuf, buffer will be freed with pending attachments
left to the dmabuf which can show up as the 'memory leak'. This should
at least be reported as the WARN().

Signed-off-by: Charan Teja Reddy <charante@codeaurora.org>
---
 drivers/dma-buf/dma-buf.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 511fe0d..733c8b1 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -79,6 +79,7 @@ static void dma_buf_release(struct dentry *dentry)
 	if (dmabuf->resv == (struct dma_resv *)&dmabuf[1])
 		dma_resv_fini(dmabuf->resv);
 
+	WARN_ON(!list_empty(&dmabuf->attachments));
 	module_put(dmabuf->owner);
 	kfree(dmabuf->name);
 	kfree(dmabuf);
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a
member of the Code Aurora Forum, hosted by The Linux Foundation

