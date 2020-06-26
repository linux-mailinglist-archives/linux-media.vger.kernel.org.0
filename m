Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F79920AE8A
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2020 10:51:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725905AbgFZIvw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Jun 2020 04:51:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725792AbgFZIvw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Jun 2020 04:51:52 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEECEC08C5C1
        for <linux-media@vger.kernel.org>; Fri, 26 Jun 2020 01:51:51 -0700 (PDT)
Received: from localhost.localdomain (p200300cb8737cf00e1b48557745ca459.dip0.t-ipconnect.de [IPv6:2003:cb:8737:cf00:e1b4:8557:745c:a459])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 214CA2A59B1;
        Fri, 26 Jun 2020 09:51:50 +0100 (BST)
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org,
        tfiga@chromium.org
Subject: [PATCH v2 2/4] media: staging: rkisp1: stats: replace spin_lock_irqsave with spin_lock_irq
Date:   Fri, 26 Jun 2020 10:51:39 +0200
Message-Id: <20200626085141.7646-3-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200626085141.7646-1-dafna.hirschfeld@collabora.com>
References: <20200626085141.7646-1-dafna.hirschfeld@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The function 'rkisp1_stats_vb2_stop_streaming' runs in user context
therefore it is enough to use spin_lock_irq

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/staging/media/rkisp1/rkisp1-stats.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/rkisp1/rkisp1-stats.c b/drivers/staging/media/rkisp1/rkisp1-stats.c
index b19a6d9cdd4d..d4f0df4342e0 100644
--- a/drivers/staging/media/rkisp1/rkisp1-stats.c
+++ b/drivers/staging/media/rkisp1/rkisp1-stats.c
@@ -152,13 +152,12 @@ static void rkisp1_stats_vb2_stop_streaming(struct vb2_queue *vq)
 {
 	struct rkisp1_stats *stats = vq->drv_priv;
 	struct rkisp1_buffer *buf;
-	unsigned long flags;
 	unsigned int i;
 
 	/* Make sure no new work queued in isr before draining wq */
-	spin_lock_irqsave(&stats->irq_lock, flags);
+	spin_lock_irq(&stats->irq_lock);
 	stats->is_streaming = false;
-	spin_unlock_irqrestore(&stats->irq_lock, flags);
+	spin_unlock_irq(&stats->irq_lock);
 
 	drain_workqueue(stats->readout_wq);
 
-- 
2.17.1

