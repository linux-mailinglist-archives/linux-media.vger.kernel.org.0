Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8261C2452BC
	for <lists+linux-media@lfdr.de>; Sat, 15 Aug 2020 23:54:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728435AbgHOVyo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 15 Aug 2020 17:54:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729095AbgHOVwc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 15 Aug 2020 17:52:32 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 568BDC08E871
        for <linux-media@vger.kernel.org>; Sat, 15 Aug 2020 03:37:56 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 3FD3829A68C
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org
Subject: [PATCH v2 02/14] media: staging: rkisp1: params: use rkisp1_param_set_bits to set reg in isr
Date:   Sat, 15 Aug 2020 12:37:22 +0200
Message-Id: <20200815103734.31153-3-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200815103734.31153-1-dafna.hirschfeld@collabora.com>
References: <20200815103734.31153-1-dafna.hirschfeld@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

replace a read and write of RKISP1_CIF_ISP_CTRL register
in the isr with the 'rkisp1_param_set_bits' function
that does that.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/staging/media/rkisp1/rkisp1-params.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/media/rkisp1/rkisp1-params.c b/drivers/staging/media/rkisp1/rkisp1-params.c
index 6d69df36c495..8d881f1df1e6 100644
--- a/drivers/staging/media/rkisp1/rkisp1-params.c
+++ b/drivers/staging/media/rkisp1/rkisp1-params.c
@@ -1199,7 +1199,6 @@ void rkisp1_params_isr(struct rkisp1_device *rkisp1)
 	struct rkisp1_params *params = &rkisp1->params;
 	struct rkisp1_params_cfg *new_params;
 	struct rkisp1_buffer *cur_buf = NULL;
-	u32 isp_ctrl;
 
 	spin_lock(&params->config_lock);
 	if (!params->is_streaming) {
@@ -1222,9 +1221,7 @@ void rkisp1_params_isr(struct rkisp1_device *rkisp1)
 	rkisp1_isp_isr_meas_config(params, new_params);
 
 	/* update shadow register immediately */
-	isp_ctrl = rkisp1_read(params->rkisp1, RKISP1_CIF_ISP_CTRL);
-	isp_ctrl |= RKISP1_CIF_ISP_CTRL_ISP_CFG_UPD;
-	rkisp1_write(params->rkisp1, isp_ctrl, RKISP1_CIF_ISP_CTRL);
+	rkisp1_param_set_bits(params, RKISP1_CIF_ISP_CTRL, RKISP1_CIF_ISP_CTRL_ISP_CFG_UPD);
 
 	spin_lock(&params->config_lock);
 	list_del(&cur_buf->queue);
-- 
2.17.1

