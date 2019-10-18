Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1070FDC8B1
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2019 17:34:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2410703AbfJRPc1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Oct 2019 11:32:27 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:37128 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2410695AbfJRPcZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Oct 2019 11:32:25 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9IFWOKA064295;
        Fri, 18 Oct 2019 10:32:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1571412744;
        bh=5ZErgPTAHa8AtWbEG4acFfzKns2sK6aTZaCmYFQYBz8=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=d064I8aDyn0A3MO5XRNpvhdUqDCFHxXjiTJQ9yO2aANdhSa2RpfAOx6eQ4QEziWeg
         s63wVRnk+VdYCObU86Rr4Yn9A8SX4z8unSLsHexVpmPCJQKOwMyBRo0iL8tZfdbGb6
         dLqzT5mrpCoc1IyFtF2D5lOlUOVuBoYAXOdEPkMg=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9IFWOYj081108
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 18 Oct 2019 10:32:24 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 18
 Oct 2019 10:32:15 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 18 Oct 2019 10:32:15 -0500
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9IFW15V080266;
        Fri, 18 Oct 2019 10:32:24 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>, Rob Herring <robh+dt@kernel.org>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
Subject: [Patch 17/19] media: ti-vpe: cal: Fix a WARN issued when start streaming fails
Date:   Fri, 18 Oct 2019 10:34:35 -0500
Message-ID: <20191018153437.20614-18-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191018153437.20614-1-bparrot@ti.com>
References: <20191018153437.20614-1-bparrot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When start_streaming fails after the buffers have been queued we have to
make sure all buffers are returned to user-space properly otherwise a
v4l2 level WARN is generated.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/cal.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index a0ff67412410..b55987ee70dd 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -1702,10 +1702,15 @@ static int cal_start_streaming(struct vb2_queue *vq, unsigned int count)
 	return 0;
 
 err:
+	spin_lock_irqsave(&ctx->slock, flags);
+	vb2_buffer_done(&ctx->cur_frm->vb.vb2_buf, VB2_BUF_STATE_QUEUED);
+	ctx->cur_frm = NULL;
+	ctx->next_frm = NULL;
 	list_for_each_entry_safe(buf, tmp, &dma_q->active, list) {
 		list_del(&buf->list);
 		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_QUEUED);
 	}
+	spin_unlock_irqrestore(&ctx->slock, flags);
 	return ret;
 }
 
-- 
2.17.1

