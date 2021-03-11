Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFCC5336FC1
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 11:21:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232167AbhCKKUr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 05:20:47 -0500
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:58621 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232280AbhCKKU3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 05:20:29 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id KIQYlPLX0C40pKIQelKo4w; Thu, 11 Mar 2021 11:20:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1615458028; bh=uGvVBeq6ycOp13ZyFtQ3jaXCLHTR2CD+mwr8VWIvX24=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=QwyTz0LjYQS90nRQ8HerYdkzYHz8X/7ZhkFNJKUCcY47JkkCXLeWFA0OAa/ogx3E6
         QEOAINjZfCVr891wgxdeKPbuj8LKnRT1hST4ke4t+d57BysrvCYR97aklxif+84Zos
         9YmWZ5uJLlHYvrRZTJzIqvNHFPuUylLUa6frtRl/sxViee6ngH+EW223G1SaILqTYA
         tVMA09536ciIWsuzrzr/oDv5mKqCW+ptJK3V7wuXT7OF00fzhmc7fvyB7RWbShG/F8
         s9SPWwrfoAvtzztnsE0+0EqhfZLZXu7RlNBEByXwS6VlPUOAtQB+46EwrkFA98Jevm
         vNE8mTkccaGXg==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH 03/13] ti-vpe/cal.h: fix kernel-doc formatting
Date:   Thu, 11 Mar 2021 11:20:12 +0100
Message-Id: <20210311102022.96954-4-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210311102022.96954-1-hverkuil-cisco@xs4all.nl>
References: <20210311102022.96954-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfI2xPb/zUiB1u72ER64GdeqlP5VATSz1rK0PzXa8A/OqDFQ+9I+MEpAR3WYnAs21EYlBUZ6IxwHRH6xiF5pUwmHqHeW73aKBo1Cd+mE10150Hj0IjQg7
 ecQCpfUlobofQ4V2L0ZWzyWiBBpQFk0AB9QJ8+ZMYGJf2IQyv28zB5+HYc8rqQ7O6rPCkoVzKowBnfff9HGYHvNFMbYHTFG1bmMHgsyUq0hf0LvkLpZKHvIc
 gcFN6BeL+mporyfigEU2lOd7XyR5QGu+zrW9aTbDGESxUHE7UdyxaBkTeK7JjytN
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix inline struct member documentation, was missing the
'@memb:' prefix.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal.h | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.h b/drivers/media/platform/ti-vpe/cal.h
index d471b7f82519..7aaea82c6b42 100644
--- a/drivers/media/platform/ti-vpe/cal.h
+++ b/drivers/media/platform/ti-vpe/cal.h
@@ -84,35 +84,34 @@ struct cal_buffer {
 
 /**
  * struct cal_dmaqueue - Queue of DMA buffers
- * @active: Buffer being DMA'ed to for the current frame
  */
 struct cal_dmaqueue {
 	/**
-	 * Protects all fields in the cal_dmaqueue.
+	 * @lock: Protects all fields in the cal_dmaqueue.
 	 */
 	spinlock_t		lock;
 
 	/**
-	 * Buffers queued to the driver and waiting for DMA processing.
+	 * @queue: Buffers queued to the driver and waiting for DMA processing.
 	 * Buffers are added to the list by the vb2 .buffer_queue() operation,
 	 * and move to @pending when they are scheduled for the next frame.
 	 */
 	struct list_head	queue;
 	/**
-	 * Buffer provided to the hardware to DMA the next frame. Will move to
-	 * @active at the end of the current frame.
+	 * @pending: Buffer provided to the hardware to DMA the next frame.
+	 * Will move to @active at the end of the current frame.
 	 */
 	struct cal_buffer	*pending;
 	/**
-	 * Buffer being DMA'ed to for the current frame. Will be retired and
-	 * given back to vb2 at the end of the current frame if a @pending
-	 * buffer has been scheduled to replace it.
+	 * @active: Buffer being DMA'ed to for the current frame. Will be
+	 * retired and given back to vb2 at the end of the current frame if
+	 * a @pending buffer has been scheduled to replace it.
 	 */
 	struct cal_buffer	*active;
 
-	/** State of the DMA engine. */
+	/** @state: State of the DMA engine. */
 	enum cal_dma_state	state;
-	/** Wait queue to signal a @state transition to CAL_DMA_STOPPED. */
+	/** @wait: Wait queue to signal a @state transition to CAL_DMA_STOPPED. */
 	struct wait_queue_head	wait;
 };
 
-- 
2.30.1

