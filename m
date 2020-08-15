Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78B5A2452E0
	for <lists+linux-media@lfdr.de>; Sat, 15 Aug 2020 23:56:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729377AbgHOV4E (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 15 Aug 2020 17:56:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729043AbgHOVwP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 15 Aug 2020 17:52:15 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0A08C094244
        for <linux-media@vger.kernel.org>; Sat, 15 Aug 2020 03:38:00 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 1CA0A29A7CE
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org
Subject: [PATCH v2 12/14] media: staging: rkisp1: stats: protect write to 'is_streaming' in start_streaming cb
Date:   Sat, 15 Aug 2020 12:37:32 +0200
Message-Id: <20200815103734.31153-13-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200815103734.31153-1-dafna.hirschfeld@collabora.com>
References: <20200815103734.31153-1-dafna.hirschfeld@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The field stats->is_streaming is written in 'start_streaming' callback
without the stats->lock protection.
The isr might run together with the callback so 'spin_lock_irq'
should be used.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/staging/media/rkisp1/rkisp1-stats.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/media/rkisp1/rkisp1-stats.c b/drivers/staging/media/rkisp1/rkisp1-stats.c
index 52417b388854..c86beba709db 100644
--- a/drivers/staging/media/rkisp1/rkisp1-stats.c
+++ b/drivers/staging/media/rkisp1/rkisp1-stats.c
@@ -157,7 +157,9 @@ rkisp1_stats_vb2_start_streaming(struct vb2_queue *queue, unsigned int count)
 {
 	struct rkisp1_stats *stats = queue->drv_priv;
 
+	spin_lock_irq(&stats->lock);
 	stats->is_streaming = true;
+	spin_unlock_irq(&stats->lock);
 
 	return 0;
 }
-- 
2.17.1

