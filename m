Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2BED9711FF9
	for <lists+linux-media@lfdr.de>; Fri, 26 May 2023 08:30:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236460AbjEZGad (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 May 2023 02:30:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229694AbjEZGac (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 May 2023 02:30:32 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 656E712E
        for <linux-media@vger.kernel.org>; Thu, 25 May 2023 23:30:31 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-25394160fd3so381573a91.3
        for <linux-media@vger.kernel.org>; Thu, 25 May 2023 23:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1685082631; x=1687674631;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nR7KzXl7P2YYRV8RdliFiqyMRwyWSc20uYe2AWZIokA=;
        b=RslI4Xl6EXb20x3XdHATLuUOZM3nkwNRXegmeopl7KFsaU+gbDrID+RqLlDuKceiPo
         v7CKg5twEAtX9c0mrwHaxqN1ojtrGQiynb/sARipfmPGmwUVDNz9CY5uSD7y+fkZOu2L
         EhgxHUgwxKnqANTA4lngnIh9dRntEKZB7Apec=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685082631; x=1687674631;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nR7KzXl7P2YYRV8RdliFiqyMRwyWSc20uYe2AWZIokA=;
        b=gUhV3LP57CyB1wO631iS1HxJ4+yA0tvGmEN7BlufOxC7ggRQGTnACU5ZELy1JK0J8H
         uCaCFusjcnvPrbNePqOsikPVg3DZywevlCnfki5a5KPAPCRA2ejZj/C/cLZktDA84YxX
         fOM2S6wbi1XMhNCgtUnz/WhLZI/oD+cYc/gMtJoSzpWSPhxA2D3sCMHkAClk6Dbx+94h
         zNE8D/MZMevt8WbSpxoY4NPW7NKcH0+wlCGyC6JPGMfz5g2IQejiy6M3it0o8tze55HY
         hM6PwqLF9pDTKzPg6Mswix7CgSN3Aupy+XRXaIhVb0U7PO8eI/lQ9w3LH/mLKrD7saRW
         ZQnA==
X-Gm-Message-State: AC+VfDzFUvm4DcfJxhkrQrebIqB3QdFCFHs7mO4bES6of1moRGau1b5C
        imwlrdv8GAFDywuYLorEkNhuhA==
X-Google-Smtp-Source: ACHHUZ78p2BDYZsP+vuO5r/lYtUcwgTw4aNxMb5oKTX9eK2AItc1jo5dGEnT2aW1Vb28XRICcqdcbg==
X-Received: by 2002:a17:90a:498a:b0:253:6db6:18be with SMTP id d10-20020a17090a498a00b002536db618bemr1216340pjh.14.1685082630825;
        Thu, 25 May 2023 23:30:30 -0700 (PDT)
Received: from tigerii.tok.corp.google.com ([2401:fa00:8f:203:54ba:3de1:6fc1:4b25])
        by smtp.gmail.com with ESMTPSA id j10-20020a17090ae60a00b00246774a9addsm3877001pjy.48.2023.05.25.23.30.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 23:30:30 -0700 (PDT)
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv4] media: venus: provide ctx queue lock for ioctl synchronization
Date:   Fri, 26 May 2023 15:29:34 +0900
Message-ID: <20230526063024.2827883-1-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.41.0.rc0.172.g3f132b7071-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Video device has to provide a lock so that __video_do_ioctl()
can serialize IOCTL calls. Introduce a dedicated venus_inst
mutex for the purpose of vb2 operations synchronization.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/media/platform/qcom/venus/core.h | 2 ++
 drivers/media/platform/qcom/venus/vdec.c | 4 ++++
 drivers/media/platform/qcom/venus/venc.c | 4 ++++
 3 files changed, 10 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 4f81669986ba..06ed7b0d3262 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -389,6 +389,7 @@ enum venus_inst_modes {
  * @sequence_out:	a sequence counter for output queue
  * @m2m_dev:	a reference to m2m device structure
  * @m2m_ctx:	a reference to m2m context structure
+ * @ctx_q_lock:	a lock to serialize video device ioctl calls
  * @state:	current state of the instance
  * @done:	a completion for sync HFI operation
  * @error:	an error returned during last HFI sync operation
@@ -460,6 +461,7 @@ struct venus_inst {
 	u32 sequence_out;
 	struct v4l2_m2m_dev *m2m_dev;
 	struct v4l2_m2m_ctx *m2m_ctx;
+	struct mutex ctx_q_lock;
 	unsigned int state;
 	struct completion done;
 	unsigned int error;
diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 51a53bf82bd3..be3f8c4cda08 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -1609,6 +1609,7 @@ static int m2m_queue_init(void *priv, struct vb2_queue *src_vq,
 	src_vq->allow_zero_bytesused = 1;
 	src_vq->min_buffers_needed = 0;
 	src_vq->dev = inst->core->dev;
+	src_vq->lock = &inst->ctx_q_lock;
 	ret = vb2_queue_init(src_vq);
 	if (ret)
 		return ret;
@@ -1623,6 +1624,7 @@ static int m2m_queue_init(void *priv, struct vb2_queue *src_vq,
 	dst_vq->allow_zero_bytesused = 1;
 	dst_vq->min_buffers_needed = 0;
 	dst_vq->dev = inst->core->dev;
+	dst_vq->lock = &inst->ctx_q_lock;
 	return vb2_queue_init(dst_vq);
 }
 
@@ -1641,6 +1643,7 @@ static int vdec_open(struct file *file)
 	INIT_LIST_HEAD(&inst->internalbufs);
 	INIT_LIST_HEAD(&inst->list);
 	mutex_init(&inst->lock);
+	mutex_init(&inst->ctx_q_lock);
 
 	inst->core = core;
 	inst->session_type = VIDC_SESSION_TYPE_DEC;
@@ -1716,6 +1719,7 @@ static int vdec_close(struct file *file)
 	ida_destroy(&inst->dpb_ids);
 	hfi_session_destroy(inst);
 	mutex_destroy(&inst->lock);
+	mutex_destroy(&inst->ctx_q_lock);
 	v4l2_fh_del(&inst->fh);
 	v4l2_fh_exit(&inst->fh);
 
diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index 4666f42feea3..8b86873f2458 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -1395,6 +1395,7 @@ static int m2m_queue_init(void *priv, struct vb2_queue *src_vq,
 	src_vq->allow_zero_bytesused = 1;
 	src_vq->min_buffers_needed = 1;
 	src_vq->dev = inst->core->dev;
+	src_vq->lock = &inst->ctx_q_lock;
 	if (inst->core->res->hfi_version == HFI_VERSION_1XX)
 		src_vq->bidirectional = 1;
 	ret = vb2_queue_init(src_vq);
@@ -1411,6 +1412,7 @@ static int m2m_queue_init(void *priv, struct vb2_queue *src_vq,
 	dst_vq->allow_zero_bytesused = 1;
 	dst_vq->min_buffers_needed = 1;
 	dst_vq->dev = inst->core->dev;
+	dst_vq->lock = &inst->ctx_q_lock;
 	return vb2_queue_init(dst_vq);
 }
 
@@ -1443,6 +1445,7 @@ static int venc_open(struct file *file)
 	INIT_LIST_HEAD(&inst->internalbufs);
 	INIT_LIST_HEAD(&inst->list);
 	mutex_init(&inst->lock);
+	mutex_init(&inst->ctx_q_lock);
 
 	inst->core = core;
 	inst->session_type = VIDC_SESSION_TYPE_ENC;
@@ -1512,6 +1515,7 @@ static int venc_close(struct file *file)
 	venc_ctrl_deinit(inst);
 	hfi_session_destroy(inst);
 	mutex_destroy(&inst->lock);
+	mutex_destroy(&inst->ctx_q_lock);
 	v4l2_fh_del(&inst->fh);
 	v4l2_fh_exit(&inst->fh);
 
-- 
2.41.0.rc0.172.g3f132b7071-goog

