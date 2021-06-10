Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 847513A2A67
	for <lists+linux-media@lfdr.de>; Thu, 10 Jun 2021 13:36:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230469AbhFJLiZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Jun 2021 07:38:25 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:57079 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230457AbhFJLiV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Jun 2021 07:38:21 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id rIytl7kZmhqltrIz1lXjTn; Thu, 10 Jun 2021 13:36:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1623324984; bh=t22WTrW8+JFusXDdj4HAREjuuzOKT+rNXDu4SmLIBsg=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=WMMtmj/A0akY+PjekL+oyW7v5MtFJ7XfCWM/iv7vjgPS9bjb6HQBUpZy3+LlOnfsg
         LYFOWFi5EKpW4oQ22iWqbhrGjJQuO6u4vh9LzwLvoe/9APMWA4bT4G1waVAeEqjVKL
         6R+o57K+WmC9o1CncuRRwDXnfMmwhbPmwKIQCMp5+pyXiNf8iLkzaQlX0D44EQzD6d
         NlegKvOQlzkOl8T5+3nlBT+8rfLDm7DBJvKUp2h1hq0oPUyeV0a7Fnp9QUtdlBugAl
         TqogH3Yrc29Vm7hzY2iHDl+Wa7JykyDA2mFZQlBtLYDHvM5/J12qcoX/3DoKTjubho
         q5GAxeUMVF52A==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Yunfei Dong <yunfei.dong@mediatek.com>,
        Dikshita Agarwal <dikshita@codeaurora.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        John Cox <jc@kynesim.co.uk>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [RFC PATCHv2 08/11] v4l2-mem2mem.c: allow requests for capture queues
Date:   Thu, 10 Jun 2021 13:36:12 +0200
Message-Id: <20210610113615.785359-9-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210610113615.785359-1-hverkuil-cisco@xs4all.nl>
References: <20210610113615.785359-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfPnmug6ZXHlb/ZvmC4vbNHpxD73xFb4M0tsprMr6EdAuDd6oNWZt2PXVubXtTOyCb/7VEbxIceoKE0V2AfbWJPh9otbmfksO3D/oXia8aoOXFDH8ic97
 4tbXpucSAudlbehnxYyTSy42Jbr5n3ywcjq+0WLAAeSno+XW7IpFee8wqdTQlWwc7MfSSF0CCrEuuqzrYU1c18DJ5iixB4V78OH/jewuA/vpb53SvEU2JypW
 YQD07JXW85ijiW9dWVf7G/7LSIS2vO5pf+SsJXchHjqhjv70U+Q7crbvrkKE5JR9aJMFO1vsWkykfvKPIXZq4MD+B8JpH0Pel2U1/LS9tSkjtdWXcUGIJ2vc
 tMlf7ZqBUjOquByjzzQpkua+L+BIwfTQSLRBVtMZ+Q+vLN2c7bKwiFvxDnCxyt9mICqMxYBI
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Capture queues can support requests as well, so add support for this.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/v4l2-core/v4l2-mem2mem.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-core/v4l2-mem2mem.c
index 0d7c27a07224..e068ffa9006b 100644
--- a/drivers/media/v4l2-core/v4l2-mem2mem.c
+++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
@@ -20,6 +20,7 @@
 #include <media/v4l2-device.h>
 #include <media/v4l2-fh.h>
 #include <media/v4l2-event.h>
+#include <media/v4l2-ctrls.h>
 
 MODULE_DESCRIPTION("Mem to mem device framework for videobuf");
 MODULE_AUTHOR("Pawel Osciak, <pawel@osciak.com>");
@@ -1284,10 +1285,14 @@ void v4l2_m2m_request_queue(struct media_request *req)
 		if (vb2_request_object_is_buffer(obj)) {
 			/* Sanity checks */
 			vb = container_of(obj, struct vb2_buffer, req_obj);
-			WARN_ON(!V4L2_TYPE_IS_OUTPUT(vb->vb2_queue->type));
-			m2m_ctx_obj = container_of(vb->vb2_queue,
-						   struct v4l2_m2m_ctx,
-						   out_q_ctx.q);
+			if (V4L2_TYPE_IS_OUTPUT(vb->vb2_queue->type))
+				m2m_ctx_obj = container_of(vb->vb2_queue,
+							   struct v4l2_m2m_ctx,
+							   out_q_ctx.q);
+			else
+				m2m_ctx_obj = container_of(vb->vb2_queue,
+							   struct v4l2_m2m_ctx,
+							   cap_q_ctx.q);
 			WARN_ON(m2m_ctx && m2m_ctx_obj != m2m_ctx);
 			m2m_ctx = m2m_ctx_obj;
 		}
-- 
2.30.2

