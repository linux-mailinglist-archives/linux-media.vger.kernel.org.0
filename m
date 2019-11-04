Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA709EE87E
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2019 20:32:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387404AbfKDTc2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Nov 2019 14:32:28 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:46578 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728332AbfKDTc1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Nov 2019 14:32:27 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA4JWPim028812;
        Mon, 4 Nov 2019 13:32:25 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1572895945;
        bh=XuDz5zltJdPOanphlXO9gU3+lQuD1vCuvpkmFKFlIdk=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=Psbk0mQ4RSVqCjPAnJeNypRU0flxQJeqs7Y08uJwPEEhvYbcO4aRfNRnzFXCt+Jal
         grnldHjkpHN6mZWXDU+0ajLQhXtTWPxdRK51vtaQj64MjrZcCZ/st3H17pOkdsGl3E
         UP1YKLQ+Tu2HsBS/1Y1IkBLEi4zWqDTiVm4Uj0K4=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xA4JWPBo060280
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 4 Nov 2019 13:32:25 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 4 Nov
 2019 13:32:11 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 4 Nov 2019 13:32:10 -0600
Received: from ula0869644.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA4JVmdG096934;
        Mon, 4 Nov 2019 13:32:25 -0600
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
CC:     <linux-media@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Benoit Parrot <bparrot@ti.com>
Subject: [Patch v2 17/20] media: ti-vpe: cal: Fix a WARN issued when start streaming fails
Date:   Mon, 4 Nov 2019 13:31:37 -0600
Message-ID: <20191104193140.31145-18-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191104193140.31145-1-bparrot@ti.com>
References: <20191104193140.31145-1-bparrot@ti.com>
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
index 20160845014e..cc5af830fa10 100644
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

