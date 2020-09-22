Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FD9D2740E7
	for <lists+linux-media@lfdr.de>; Tue, 22 Sep 2020 13:34:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726613AbgIVLeQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Sep 2020 07:34:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726607AbgIVLeP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Sep 2020 07:34:15 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23950C0613D0
        for <linux-media@vger.kernel.org>; Tue, 22 Sep 2020 04:34:15 -0700 (PDT)
Received: from guri.fritz.box (p200300c7cf13ec005877be1094b7a29d.dip0.t-ipconnect.de [IPv6:2003:c7:cf13:ec00:5877:be10:94b7:a29d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 90D2B29B4B3;
        Tue, 22 Sep 2020 12:34:11 +0100 (BST)
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org
Subject: [PATCH v3 05/12] media: staging: rkisp1: params: set vb.sequence to be the isp's frame_sequence + 1
Date:   Tue, 22 Sep 2020 13:33:55 +0200
Message-Id: <20200922113402.12442-6-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200922113402.12442-1-dafna.hirschfeld@collabora.com>
References: <20200922113402.12442-1-dafna.hirschfeld@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The params isr is called when the ISP finishes processing a frame
(RKISP1_CIF_ISP_FRAME). Configurations performed in the params isr
will be applied on the next frame. Since frame_sequence is updated
on the vertical sync signal, we should use frame_sequence + 1 as
the vb.sequence of the params buffer to indicate to userspace on
which frame these parameters are being applied.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Acked-by: Helen Koike <helen.koike@collabora.com>
---
changes since v2:
rephrase commit message and inline doc as suggested by Helen.
---
 drivers/staging/media/rkisp1/rkisp1-params.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/rkisp1/rkisp1-params.c b/drivers/staging/media/rkisp1/rkisp1-params.c
index e8049a50575f..24a49368df22 100644
--- a/drivers/staging/media/rkisp1/rkisp1-params.c
+++ b/drivers/staging/media/rkisp1/rkisp1-params.c
@@ -1213,7 +1213,14 @@ static void rkisp1_params_apply_params_cfg(struct rkisp1_params *params,
 
 void rkisp1_params_isr(struct rkisp1_device *rkisp1)
 {
-	unsigned int frame_sequence = atomic_read(&rkisp1->isp.frame_sequence);
+	/*
+	 * This isr is called when the ISR finishes processing a frame (RKISP1_CIF_ISP_FRAME).
+	 * Configurations performed here will be applied on the next frame.
+	 * Since frame_sequence is updated on the vertical sync signal, we should use
+	 * frame_sequence + 1 here to indicate to userspace on which frame these parameters
+	 * are being applied.
+	 */
+	unsigned int frame_sequence = atomic_read(&rkisp1->isp.frame_sequence) + 1;
 	struct rkisp1_params *params = &rkisp1->params;
 
 	spin_lock(&params->config_lock);
-- 
2.17.1

