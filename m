Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 690D020A438
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2020 19:43:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406868AbgFYRnJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Jun 2020 13:43:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406865AbgFYRnI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Jun 2020 13:43:08 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6D96C08C5DB
        for <linux-media@vger.kernel.org>; Thu, 25 Jun 2020 10:43:07 -0700 (PDT)
Received: from localhost.localdomain (p200300cb8737cf00e4140a231ed1025d.dip0.t-ipconnect.de [IPv6:2003:cb:8737:cf00:e414:a23:1ed1:25d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 049272A5765;
        Thu, 25 Jun 2020 18:43:05 +0100 (BST)
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org,
        tfiga@chromium.org
Subject: [PATCH 2/3] media: staging: rkisp1: params: don't release lock in isr before buffer is done
Date:   Thu, 25 Jun 2020 19:42:56 +0200
Message-Id: <20200625174257.22216-3-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200625174257.22216-1-dafna.hirschfeld@collabora.com>
References: <20200625174257.22216-1-dafna.hirschfeld@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In the irq handler 'rkisp1_params_isr', the lock 'config_lock'
should be held as long as the current buffer is used. Otherwise the
stop_streaming calback might remove it from the list and
pass it to userspace while it is referenced in the irq handler.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/staging/media/rkisp1/rkisp1-params.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/rkisp1/rkisp1-params.c b/drivers/staging/media/rkisp1/rkisp1-params.c
index 762c2259b807..bf006dbeee2d 100644
--- a/drivers/staging/media/rkisp1/rkisp1-params.c
+++ b/drivers/staging/media/rkisp1/rkisp1-params.c
@@ -1210,10 +1210,11 @@ void rkisp1_params_isr(struct rkisp1_device *rkisp1, u32 isp_mis)
 	if (!list_empty(&params->params))
 		cur_buf = list_first_entry(&params->params,
 					   struct rkisp1_buffer, queue);
-	spin_unlock(&params->config_lock);
 
-	if (!cur_buf)
+	if (!cur_buf) {
+		spin_unlock(&params->config_lock);
 		return;
+	}
 
 	new_params = (struct rkisp1_params_cfg *)(cur_buf->vaddr[0]);
 
@@ -1228,13 +1229,11 @@ void rkisp1_params_isr(struct rkisp1_device *rkisp1, u32 isp_mis)
 		isp_ctrl |= RKISP1_CIF_ISP_CTRL_ISP_CFG_UPD;
 		rkisp1_write(params->rkisp1, isp_ctrl, RKISP1_CIF_ISP_CTRL);
 
-		spin_lock(&params->config_lock);
 		list_del(&cur_buf->queue);
-		spin_unlock(&params->config_lock);
-
 		cur_buf->vb.sequence = frame_sequence;
 		vb2_buffer_done(&cur_buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
 	}
+	spin_unlock(&params->config_lock);
 }
 
 static const struct rkisp1_cif_isp_awb_meas_config rkisp1_awb_params_default_config = {
-- 
2.17.1

