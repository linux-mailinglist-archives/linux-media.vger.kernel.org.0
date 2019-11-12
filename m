Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA2B2F9333
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2019 15:52:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727539AbfKLOvw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Nov 2019 09:51:52 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:41716 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726932AbfKLOvG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Nov 2019 09:51:06 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xACEp3D4105849;
        Tue, 12 Nov 2019 08:51:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1573570263;
        bh=Kz//oUf4WIP8xnfwf4GShSnNctOp7R5oQzxTr03LSd0=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=LE18E4LC+M6QiBBCgqRDflQ/cev7+uAR1FOiqhKJPaa+Eud/dVCIggy19Y/qJHhbI
         X36mnh0tT0GDf3ojQ/muZfSLfZcHeEBMMSAITiXtcNl+pOnmPg+lvIUlWveyX755bJ
         RxavYQIjFQqjZZBiSFBb1fO6u+y8z/xyTb0PpKbc=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xACEp3ck059155
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 12 Nov 2019 08:51:03 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 12
 Nov 2019 08:50:46 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 12 Nov 2019 08:50:46 -0600
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xACEokf4068428;
        Tue, 12 Nov 2019 08:51:03 -0600
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
Subject: [RESEND Patch v3 18/20] media: ti-vpe: cal: Fix a WARN issued when start streaming fails
Date:   Tue, 12 Nov 2019 08:53:45 -0600
Message-ID: <20191112145347.23519-19-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191112145347.23519-1-bparrot@ti.com>
References: <20191112145347.23519-1-bparrot@ti.com>
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
index 091119bee8fc..92a54d59d433 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -1695,10 +1695,15 @@ static int cal_start_streaming(struct vb2_queue *vq, unsigned int count)
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

