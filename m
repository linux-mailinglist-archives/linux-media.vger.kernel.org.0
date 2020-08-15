Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00B5D2452F3
	for <lists+linux-media@lfdr.de>; Sat, 15 Aug 2020 23:56:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729431AbgHOV4v (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 15 Aug 2020 17:56:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728976AbgHOVwM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 15 Aug 2020 17:52:12 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D9EFC08EAD1
        for <linux-media@vger.kernel.org>; Sat, 15 Aug 2020 03:37:58 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 0BD3729A962
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org
Subject: [PATCH v2 08/14] media: staging: rkisp1: params: set vb.sequence to be the isp's frame_sequence + 1
Date:   Sat, 15 Aug 2020 12:37:28 +0200
Message-Id: <20200815103734.31153-9-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200815103734.31153-1-dafna.hirschfeld@collabora.com>
References: <20200815103734.31153-1-dafna.hirschfeld@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The params isr is called when a frame is out of the isp. The parameters
are applied immediately since the isr updates the shadow registers.
Therefore the params are first applied on the next frame.
We want the vb.sequence to be the frame that the params are applied to.
So we set vb.sequence to be the isp's frame_sequence + 1

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/staging/media/rkisp1/rkisp1-params.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/rkisp1/rkisp1-params.c b/drivers/staging/media/rkisp1/rkisp1-params.c
index 134b5c9a94c1..4b4391c0a2a0 100644
--- a/drivers/staging/media/rkisp1/rkisp1-params.c
+++ b/drivers/staging/media/rkisp1/rkisp1-params.c
@@ -1220,7 +1220,14 @@ void rkisp1_params_apply_params_cfg(struct rkisp1_params *params, unsigned int f
 
 void rkisp1_params_isr(struct rkisp1_device *rkisp1)
 {
-	unsigned int frame_sequence = atomic_read(&rkisp1->isp.frame_sequence);
+	/*
+	 * The params isr is called when a frame is out of the isp. The parameters
+	 * are applied immediately since the isr updates the shadow registers.
+	 * Therefore the params are first applied on the next frame.
+	 * We want the vb.sequence to be the frame that the params are applied to.
+	 * So we set vb.sequence to be the isp's frame_sequence + 1
+	 */
+	unsigned int frame_sequence = atomic_read(&rkisp1->isp.frame_sequence) + 1;
 	struct rkisp1_params *params = &rkisp1->params;
 
 	spin_lock(&params->config_lock);
-- 
2.17.1

