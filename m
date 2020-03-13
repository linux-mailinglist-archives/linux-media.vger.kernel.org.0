Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 68F7D183ECD
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2020 02:47:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726486AbgCMBqp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Mar 2020 21:46:45 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:48524 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726423AbgCMBqp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Mar 2020 21:46:45 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id BA6EE296404
From:   Helen Koike <helen.koike@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org, linux-rockchip@lists.infradead.org,
        hans.verkuil@cisco.com, kernel@collabora.com,
        Helen Koike <helen.koike@collabora.com>
Subject: [PATCH 1/3] media: staging: rkisp1: cap: fix return values from pm functions
Date:   Thu, 12 Mar 2020 22:46:24 -0300
Message-Id: <20200313014626.3103091-2-helen.koike@collabora.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200313014626.3103091-1-helen.koike@collabora.com>
References: <20200313014626.3103091-1-helen.koike@collabora.com>
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

 drivers/staging/media/rkisp1/rkisp1-capture.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/rkisp1/rkisp1-capture.c b/drivers/staging/media/rkisp1/rkisp1-capture.c
index 524e0dd38c1b..97091e5a6e6c 100644
--- a/drivers/staging/media/rkisp1/rkisp1-capture.c
+++ b/drivers/staging/media/rkisp1/rkisp1-capture.c
@@ -938,11 +938,11 @@ static void rkisp1_vb2_stop_streaming(struct vb2_queue *queue)
 	rkisp1_return_all_buffers(cap, VB2_BUF_STATE_ERROR);
 
 	ret = v4l2_pipeline_pm_use(&node->vdev.entity, 0);
-	if (ret)
+	if (ret < 0)
 		dev_err(rkisp1->dev, "pipeline close failed error:%d\n", ret);
 
 	ret = pm_runtime_put(rkisp1->dev);
-	if (ret)
+	if (ret < 0)
 		dev_err(rkisp1->dev, "power down failed error:%d\n", ret);
 
 	rkisp1_dummy_buf_destroy(cap);
@@ -995,12 +995,12 @@ rkisp1_vb2_start_streaming(struct vb2_queue *queue, unsigned int count)
 		goto err_ret_buffers;
 
 	ret = pm_runtime_get_sync(cap->rkisp1->dev);
-	if (ret) {
+	if (ret < 0) {
 		dev_err(cap->rkisp1->dev, "power up failed %d\n", ret);
 		goto err_destroy_dummy;
 	}
 	ret = v4l2_pipeline_pm_use(entity, 1);
-	if (ret) {
+	if (ret < 0) {
 		dev_err(cap->rkisp1->dev, "open cif pipeline failed %d\n", ret);
 		goto err_pipe_pm_put;
 	}
-- 
2.25.0

