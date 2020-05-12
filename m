Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C49B1CF3FD
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2020 14:06:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729593AbgELMGK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 May 2020 08:06:10 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:35082 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729524AbgELMGJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 May 2020 08:06:09 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 2EDE92A20C9
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org,
        laurent.pinchart@ideasonboard.com
Subject: [PATCH 3/5] media: staging: rkisp1: stats: use spin_lock_irqsave for irq_lock
Date:   Tue, 12 May 2020 14:05:20 +0200
Message-Id: <20200512120522.25960-4-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200512120522.25960-1-dafna.hirschfeld@collabora.com>
References: <20200512120522.25960-1-dafna.hirschfeld@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Currently 'spin_lock' is used in order to lock the 'irq_lock'.
This should be replaced with 'spin_lock_irqsave' since it is
used in the irq handler.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/staging/media/rkisp1/rkisp1-stats.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/rkisp1/rkisp1-stats.c b/drivers/staging/media/rkisp1/rkisp1-stats.c
index 12998db955e6..5578fdeb8a18 100644
--- a/drivers/staging/media/rkisp1/rkisp1-stats.c
+++ b/drivers/staging/media/rkisp1/rkisp1-stats.c
@@ -403,9 +403,10 @@ void rkisp1_stats_isr(struct rkisp1_stats *stats, u32 isp_ris)
 	struct rkisp1_device *rkisp1 = stats->rkisp1;
 	struct rkisp1_isp_readout_work *work;
 	unsigned int isp_mis_tmp = 0;
+	unsigned long flags;
 	u32 val;
 
-	spin_lock(&stats->irq_lock);
+	spin_lock_irqsave(&stats->irq_lock, flags);
 
 	val = RKISP1_STATS_MEAS_MASK;
 	rkisp1_write(rkisp1, val, RKISP1_CIF_ISP_ICR);
@@ -435,7 +436,7 @@ void rkisp1_stats_isr(struct rkisp1_stats *stats, u32 isp_ris)
 	}
 
 unlock:
-	spin_unlock(&stats->irq_lock);
+	spin_unlock_irqrestore(&stats->irq_lock, flags);
 }
 
 static void rkisp1_init_stats(struct rkisp1_stats *stats)
-- 
2.17.1

