Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F32521CC264
	for <lists+linux-media@lfdr.de>; Sat,  9 May 2020 17:29:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727106AbgEIP3O (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 9 May 2020 11:29:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726013AbgEIP3N (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 9 May 2020 11:29:13 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97702C061A0C
        for <linux-media@vger.kernel.org>; Sat,  9 May 2020 08:29:13 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id AA4A3260E88
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org
Cc:     helen.koike@collabora.com, dafna.hirschfeld@collabora.com,
        ezequiel@collabora.com, dafna3@gmail.com, kernel@collabora.com,
        hverkuil@xs4all.nl, sakari.ailus@linux.intel.com,
        mchehab@kernel.org, laurent.pinchart@ideasonboard.com
Subject: [PATCH 1/2] media: staging: rkisp1 stats: set a measure flag with '|=' instead of '='
Date:   Sat,  9 May 2020 17:29:03 +0200
Message-Id: <20200509152904.26348-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The flag RKISP1_CIF_ISP_STAT_AFM_FIN that indicates a type of
statistics is mistakenly set with '=' instead of '|='
this might set off previous flags.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/staging/media/rkisp1/rkisp1-stats.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/rkisp1/rkisp1-stats.c b/drivers/staging/media/rkisp1/rkisp1-stats.c
index 6dfcbdc3deb8..8351bda0be03 100644
--- a/drivers/staging/media/rkisp1/rkisp1-stats.c
+++ b/drivers/staging/media/rkisp1/rkisp1-stats.c
@@ -253,7 +253,7 @@ static void rkisp1_stats_get_afc_meas(struct rkisp1_stats *stats,
 	struct rkisp1_device *rkisp1 = stats->rkisp1;
 	struct rkisp1_cif_isp_af_stat *af;
 
-	pbuf->meas_type = RKISP1_CIF_ISP_STAT_AFM_FIN;
+	pbuf->meas_type |= RKISP1_CIF_ISP_STAT_AFM_FIN;
 
 	af = &pbuf->params.af;
 	af->window[0].sum = rkisp1_read(rkisp1, RKISP1_CIF_ISP_AFM_SUM_A);
-- 
2.17.1

