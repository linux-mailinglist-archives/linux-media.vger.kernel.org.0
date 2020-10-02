Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56071281AF8
	for <lists+linux-media@lfdr.de>; Fri,  2 Oct 2020 20:42:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387688AbgJBSme (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Oct 2020 14:42:34 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:52462 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726386AbgJBSme (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Oct 2020 14:42:34 -0400
Received: from guri.fritz.box (p200300c7cf13ec00987cfa6c93a91dfa.dip0.t-ipconnect.de [IPv6:2003:c7:cf13:ec00:987c:fa6c:93a9:1dfa])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 4307829DEF5;
        Fri,  2 Oct 2020 19:42:31 +0100 (BST)
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org
Subject: [PATCH 2/6] media: staging: rkisp1: params: in stop_streaming, use list_splice_init to move the buffers
Date:   Fri,  2 Oct 2020 20:42:18 +0200
Message-Id: <20201002184222.7094-3-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201002184222.7094-1-dafna.hirschfeld@collabora.com>
References: <20201002184222.7094-1-dafna.hirschfeld@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Currently the code uses 'list_cut_position' to move the
buffers to a temporary list. Replace it with
'list_splice_init'. This is nicer since we don't need
to access params.prev. Also, replace INIT_LIST_HEAD
with the simpler LIST_HEAD.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/staging/media/rkisp1/rkisp1-params.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/rkisp1/rkisp1-params.c b/drivers/staging/media/rkisp1/rkisp1-params.c
index 986d293201e6..cb9f3332a9a0 100644
--- a/drivers/staging/media/rkisp1/rkisp1-params.c
+++ b/drivers/staging/media/rkisp1/rkisp1-params.c
@@ -1462,9 +1462,7 @@ static void rkisp1_params_vb2_stop_streaming(struct vb2_queue *vq)
 {
 	struct rkisp1_params *params = vq->drv_priv;
 	struct rkisp1_buffer *buf;
-	struct list_head tmp_list;
-
-	INIT_LIST_HEAD(&tmp_list);
+	LIST_HEAD(tmp_list);
 
 	/*
 	 * we first move the buffers into a local list 'tmp_list'
@@ -1473,7 +1471,7 @@ static void rkisp1_params_vb2_stop_streaming(struct vb2_queue *vq)
 	 */
 	spin_lock_irq(&params->config_lock);
 	params->is_streaming = false;
-	list_cut_position(&tmp_list, &params->params, params->params.prev);
+	list_splice_init(&params->params, &tmp_list);
 	spin_unlock_irq(&params->config_lock);
 
 	list_for_each_entry(buf, &tmp_list, queue)
-- 
2.17.1

