Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F1572740E2
	for <lists+linux-media@lfdr.de>; Tue, 22 Sep 2020 13:34:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726573AbgIVLeN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Sep 2020 07:34:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726454AbgIVLeN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Sep 2020 07:34:13 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA7D2C061755
        for <linux-media@vger.kernel.org>; Tue, 22 Sep 2020 04:34:12 -0700 (PDT)
Received: from guri.fritz.box (p200300c7cf13ec005877be1094b7a29d.dip0.t-ipconnect.de [IPv6:2003:c7:cf13:ec00:5877:be10:94b7:a29d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 4EFF629B498;
        Tue, 22 Sep 2020 12:34:10 +0100 (BST)
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org
Subject: [PATCH v3 02/12] media: staging: rkisp1: params: in the isr, return if buffer list is empty
Date:   Tue, 22 Sep 2020 13:33:52 +0200
Message-Id: <20200922113402.12442-3-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200922113402.12442-1-dafna.hirschfeld@collabora.com>
References: <20200922113402.12442-1-dafna.hirschfeld@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Currently the code in the isr checks if the buffer list is not
empty before referencing a buffer and then check again if the
buffer is not NULL. Instead we can save one 'if' statement by
returning if the buffers list is empty.
Also remove non-helpful inline doc 'get one empty buffer'

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Acked-by: Helen Koike <helen.koike@collabora.com>
---
 drivers/staging/media/rkisp1/rkisp1-params.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/rkisp1/rkisp1-params.c b/drivers/staging/media/rkisp1/rkisp1-params.c
index 85f3b340c3bf..8bd7cc622e4f 100644
--- a/drivers/staging/media/rkisp1/rkisp1-params.c
+++ b/drivers/staging/media/rkisp1/rkisp1-params.c
@@ -1198,16 +1198,14 @@ void rkisp1_params_isr(struct rkisp1_device *rkisp1)
 		return;
 	}
 
-	/* get one empty buffer */
-	if (!list_empty(&params->params))
-		cur_buf = list_first_entry(&params->params,
-					   struct rkisp1_buffer, queue);
-
-	if (!cur_buf) {
+	if (list_empty(&params->params)) {
 		spin_unlock(&params->config_lock);
 		return;
 	}
 
+	cur_buf = list_first_entry(&params->params,
+				   struct rkisp1_buffer, queue);
+
 	new_params = (struct rkisp1_params_cfg *)(cur_buf->vaddr);
 
 	rkisp1_isp_isr_other_config(params, new_params);
-- 
2.17.1

