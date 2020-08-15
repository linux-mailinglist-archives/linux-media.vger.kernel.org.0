Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84DF82452F2
	for <lists+linux-media@lfdr.de>; Sat, 15 Aug 2020 23:56:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728990AbgHOVwN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 15 Aug 2020 17:52:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728991AbgHOVwG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 15 Aug 2020 17:52:06 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F9CDC08E9A5
        for <linux-media@vger.kernel.org>; Sat, 15 Aug 2020 03:37:58 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id AC8D929A958
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org
Subject: [PATCH v2 06/14] media: staging: rkisp1: params: in the isr, return if buffer list is empty
Date:   Sat, 15 Aug 2020 12:37:26 +0200
Message-Id: <20200815103734.31153-7-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200815103734.31153-1-dafna.hirschfeld@collabora.com>
References: <20200815103734.31153-1-dafna.hirschfeld@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Currently the code in the isr checks if the buffer list is not
empty before referencing a buffer and then check again if the
buffer is not NULL. Instead we can save one 'if' statement by
returning if the buffers list is empty.
Also remove non-helpful inline doc 'get one empty buffer'

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/staging/media/rkisp1/rkisp1-params.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/rkisp1/rkisp1-params.c b/drivers/staging/media/rkisp1/rkisp1-params.c
index 6a76c586e916..86bbd01e18c7 100644
--- a/drivers/staging/media/rkisp1/rkisp1-params.c
+++ b/drivers/staging/media/rkisp1/rkisp1-params.c
@@ -1206,16 +1206,14 @@ void rkisp1_params_isr(struct rkisp1_device *rkisp1)
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
 	new_params = (struct rkisp1_params_cfg *)(cur_buf->vaddr[0]);
 
 	rkisp1_isp_isr_other_config(params, new_params);
-- 
2.17.1

