Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D4171187469
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2020 22:01:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732658AbgCPVBC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Mar 2020 17:01:02 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:52472 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732571AbgCPVBC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Mar 2020 17:01:02 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 377FC28A3BA
From:   Helen Koike <helen.koike@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org, linux-rockchip@lists.infradead.org,
        hans.verkuil@cisco.com, kernel@collabora.com,
        Helen Koike <helen.koike@collabora.com>
Subject: [PATCH v2 2/2] media: staging: rkisp1: cap: serialize start/stop stream
Date:   Mon, 16 Mar 2020 18:00:44 -0300
Message-Id: <20200316210044.595312-3-helen.koike@collabora.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200316210044.595312-1-helen.koike@collabora.com>
References: <20200316210044.595312-1-helen.koike@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In order to support simultaneous streaming from both capture devices,
start/stop vb2 calls need to be serialized to allow multiple concurrent
calls.

Signed-off-by: Helen Koike <helen.koike@collabora.com>
---

Changes in v2:
- Rebased with media/master

 drivers/staging/media/rkisp1/rkisp1-capture.c | 9 +++++++++
 drivers/staging/media/rkisp1/rkisp1-common.h  | 2 ++
 drivers/staging/media/rkisp1/rkisp1-dev.c     | 2 ++
 3 files changed, 13 insertions(+)

diff --git a/drivers/staging/media/rkisp1/rkisp1-capture.c b/drivers/staging/media/rkisp1/rkisp1-capture.c
index 967bd05b4507..f3c4f2a198ca 100644
--- a/drivers/staging/media/rkisp1/rkisp1-capture.c
+++ b/drivers/staging/media/rkisp1/rkisp1-capture.c
@@ -927,6 +927,8 @@ static void rkisp1_vb2_stop_streaming(struct vb2_queue *queue)
 	struct rkisp1_device *rkisp1 = cap->rkisp1;
 	int ret;
 
+	mutex_lock(&cap->rkisp1->stream_lock);
+
 	rkisp1_stream_stop(cap);
 	media_pipeline_stop(&node->vdev.entity);
 	ret = rkisp1_pipeline_sink_walk(&node->vdev.entity, NULL,
@@ -943,6 +945,8 @@ static void rkisp1_vb2_stop_streaming(struct vb2_queue *queue)
 		dev_err(rkisp1->dev, "power down failed error:%d\n", ret);
 
 	rkisp1_dummy_buf_destroy(cap);
+
+	mutex_unlock(&cap->rkisp1->stream_lock);
 }
 
 /*
@@ -987,6 +991,8 @@ rkisp1_vb2_start_streaming(struct vb2_queue *queue, unsigned int count)
 	struct media_entity *entity = &cap->vnode.vdev.entity;
 	int ret;
 
+	mutex_lock(&cap->rkisp1->stream_lock);
+
 	ret = rkisp1_dummy_buf_create(cap);
 	if (ret)
 		goto err_ret_buffers;
@@ -1016,6 +1022,8 @@ rkisp1_vb2_start_streaming(struct vb2_queue *queue, unsigned int count)
 		goto err_pipe_disable;
 	}
 
+	mutex_unlock(&cap->rkisp1->stream_lock);
+
 	return 0;
 
 err_pipe_disable:
@@ -1029,6 +1037,7 @@ rkisp1_vb2_start_streaming(struct vb2_queue *queue, unsigned int count)
 	rkisp1_dummy_buf_destroy(cap);
 err_ret_buffers:
 	rkisp1_return_all_buffers(cap, VB2_BUF_STATE_QUEUED);
+	mutex_unlock(&cap->rkisp1->stream_lock);
 
 	return ret;
 }
diff --git a/drivers/staging/media/rkisp1/rkisp1-common.h b/drivers/staging/media/rkisp1/rkisp1-common.h
index b291cc60de8e..4ec5aae9694a 100644
--- a/drivers/staging/media/rkisp1/rkisp1-common.h
+++ b/drivers/staging/media/rkisp1/rkisp1-common.h
@@ -247,6 +247,7 @@ struct rkisp1_debug {
  * @rkisp1_capture: capture video device
  * @stats: ISP statistics output device
  * @params: ISP input parameters device
+ * @stream_lock: lock to serialize start/stop streaming in capture devices.
  */
 struct rkisp1_device {
 	void __iomem *base_addr;
@@ -266,6 +267,7 @@ struct rkisp1_device {
 	struct rkisp1_params params;
 	struct media_pipeline pipe;
 	struct vb2_alloc_ctx *alloc_ctx;
+	struct mutex stream_lock;
 	struct rkisp1_debug debug;
 };
 
diff --git a/drivers/staging/media/rkisp1/rkisp1-dev.c b/drivers/staging/media/rkisp1/rkisp1-dev.c
index b1b3c058e957..3e3a3925b019 100644
--- a/drivers/staging/media/rkisp1/rkisp1-dev.c
+++ b/drivers/staging/media/rkisp1/rkisp1-dev.c
@@ -471,6 +471,8 @@ static int rkisp1_probe(struct platform_device *pdev)
 	dev_set_drvdata(dev, rkisp1);
 	rkisp1->dev = dev;
 
+	mutex_init(&rkisp1->stream_lock);
+
 	rkisp1->base_addr = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(rkisp1->base_addr))
 		return PTR_ERR(rkisp1->base_addr);
-- 
2.25.0

