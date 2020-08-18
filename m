Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 437432487CF
	for <lists+linux-media@lfdr.de>; Tue, 18 Aug 2020 16:37:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726905AbgHROhg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Aug 2020 10:37:36 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:38815 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727898AbgHROhX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Aug 2020 10:37:23 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 82jnkV8V2uuXO82jqkcewD; Tue, 18 Aug 2020 16:37:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1597761442; bh=yowpVdKO5MyYTAx4yrm7Q3hYm6oTujLlFHx2wjf3l2E=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=kl9+qFdPeOymJ56dsYFd9U+AJpO/PlIzDEO2r8fehWdTX7/zRv5UbvGbk0n6MGNRg
         abrP4W9p7dhy37rTA9bbpPLixnCKTtfvrBz/mpPs/+dXZSymOVzMA+mX6AamuItg/i
         wuhcPM+S0OtkGzmW8+xgH6cnCd9G3s0lnidNv+ySUajk4QMGjxOmcQ2V+IJa0IUrzi
         rbWhCzsMXDOxwmElDSvcXtv4gutPbetRjXIplIDWyWoop9Ue5nCOCy/nhQmi1RfgCQ
         wpYLyFri0xj+IGY3NcVLOlk9UhncsA3ZUxp4jNhFUbOGuhZC13B/jpteaQHYywZNYR
         7kf71lRkiE62g==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Yunfei Dong <yunfei.dong@mediatek.com>,
        Dikshita Agarwal <dikshita@codeaurora.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv2 11/12] vim2m: support read-only requests on the capture queue
Date:   Tue, 18 Aug 2020 16:37:18 +0200
Message-Id: <20200818143719.102128-12-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200818143719.102128-1-hverkuil-cisco@xs4all.nl>
References: <20200818143719.102128-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfP7+giVF2yARMvQzXdrB71WPzNzQPnB2vBNV1zfb1go6qlHWCQCw4uRfchZzAtnyfp0sjerWlDwxlnd+NRkCSGe+Ssx86NCHGizcu7rYZjJtzqBclj53
 r5W8DV3IokiHycHwkfLGx7GvawPyJu7LvgeL0v+J5Zub5V9htD1Y7Lvh9xeGR9Cd4EmXY/ZOgOaWpXOFuskI4fyg06+A9NTsUNGJHKcnAJEnkBnNbpMlquh6
 RSPY9OPI6N0AfK25Z0Ua34xg2WwfPoGnKMLfHaEK/11FnxpdlEvGGMBQWw4nEX0/ro4KOZzEG/+iGxGiB8Qu7HaGmA2IF0gVJ8N25ZZqX0btdRWZiCCj9pku
 dZHPYtPI
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Added support for read-only requests on the capture queue
in order to test this feature.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/test-drivers/vim2m.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/media/test-drivers/vim2m.c b/drivers/media/test-drivers/vim2m.c
index b73de65c0006..7c738b9fd637 100644
--- a/drivers/media/test-drivers/vim2m.c
+++ b/drivers/media/test-drivers/vim2m.c
@@ -602,7 +602,11 @@ static void device_run(void *priv)
 	src_buf = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
 	dst_buf = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
 
-	/* Apply request controls if any */
+	/*
+	 * Apply request controls if any.
+	 * The dst_buf queue has read-only requests, so no need to
+	 * setup any controls for that buffer.
+	 */
 	v4l2_ctrl_request_setup(src_buf->vb2_buf.req_obj.req,
 				&ctx->hdl);
 
@@ -611,6 +615,8 @@ static void device_run(void *priv)
 	/* Complete request controls if any */
 	v4l2_ctrl_request_complete(src_buf->vb2_buf.req_obj.req,
 				   &ctx->hdl);
+	v4l2_ctrl_request_complete(dst_buf->vb2_buf.req_obj.req,
+				   &ctx->hdl);
 
 	/* Run delayed work, which simulates a hardware irq  */
 	schedule_delayed_work(&ctx->work_run, msecs_to_jiffies(ctx->transtime));
@@ -1143,6 +1149,8 @@ static int queue_init(void *priv, struct vb2_queue *src_vq,
 	dst_vq->mem_ops = &vb2_vmalloc_memops;
 	dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
 	dst_vq->lock = &ctx->vb_mutex;
+	dst_vq->supports_requests = true;
+	dst_vq->supports_ro_requests = true;
 
 	return vb2_queue_init(dst_vq);
 }
-- 
2.27.0

