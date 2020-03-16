Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B16F0187464
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2020 22:01:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732643AbgCPVA7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Mar 2020 17:00:59 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:52468 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732571AbgCPVA6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Mar 2020 17:00:58 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 0CE48291A70
From:   Helen Koike <helen.koike@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org, linux-rockchip@lists.infradead.org,
        hans.verkuil@cisco.com, kernel@collabora.com,
        Helen Koike <helen.koike@collabora.com>
Subject: [PATCH v2 1/2] media: staging: rkisp1: cap: fix return values from pm functions
Date:   Mon, 16 Mar 2020 18:00:43 -0300
Message-Id: <20200316210044.595312-2-helen.koike@collabora.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200316210044.595312-1-helen.koike@collabora.com>
References: <20200316210044.595312-1-helen.koike@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If no errors occurs, pm functions return usage counters, so they can
return positive numbers.
This happens when streaming from multiple capture devices (mainpath and
selfpath).

Fix simultaneous streaming from mainpath and selfpath by not failing
when pm usage counters returns a positive number.

Signed-off-by: Helen Koike <helen.koike@collabora.com>
---

Changes in v2:
- Rebased on media/master

 drivers/staging/media/rkisp1/rkisp1-capture.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/rkisp1/rkisp1-capture.c b/drivers/staging/media/rkisp1/rkisp1-capture.c
index 24fe6a7888aa..967bd05b4507 100644
--- a/drivers/staging/media/rkisp1/rkisp1-capture.c
+++ b/drivers/staging/media/rkisp1/rkisp1-capture.c
@@ -939,7 +939,7 @@ static void rkisp1_vb2_stop_streaming(struct vb2_queue *queue)
 
 	v4l2_pipeline_pm_put(&node->vdev.entity);
 	ret = pm_runtime_put(rkisp1->dev);
-	if (ret)
+	if (ret < 0)
 		dev_err(rkisp1->dev, "power down failed error:%d\n", ret);
 
 	rkisp1_dummy_buf_destroy(cap);
@@ -992,7 +992,7 @@ rkisp1_vb2_start_streaming(struct vb2_queue *queue, unsigned int count)
 		goto err_ret_buffers;
 
 	ret = pm_runtime_get_sync(cap->rkisp1->dev);
-	if (ret) {
+	if (ret < 0) {
 		dev_err(cap->rkisp1->dev, "power up failed %d\n", ret);
 		goto err_destroy_dummy;
 	}
-- 
2.25.0

