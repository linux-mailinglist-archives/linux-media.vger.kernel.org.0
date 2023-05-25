Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E7AF710219
	for <lists+linux-media@lfdr.de>; Thu, 25 May 2023 02:53:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229661AbjEYAxU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 May 2023 20:53:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229871AbjEYAxT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 May 2023 20:53:19 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59349119
        for <linux-media@vger.kernel.org>; Wed, 24 May 2023 17:53:18 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1ae8ecb4f9aso6717585ad.1
        for <linux-media@vger.kernel.org>; Wed, 24 May 2023 17:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1684975998; x=1687567998;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FUvMPTBA49tNIIepIZR4oNBjuNfKgUVXvOLcX8khE8M=;
        b=W2UjZt7xXNaPeh18Rot0pJP8kt7jDb1X4nnRAQ5Srl/FEom6b5LEmxbxqdIzGPa66O
         bJWsXKewY7BBUbcf0L9HR2jfVXcxzerNtb9m6G7a/tL53j0be+O7Azcai3o9ZeYvdVf3
         qxt4l/XxdKnfu0odskR1IHytfH1KM59yif948=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684975998; x=1687567998;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FUvMPTBA49tNIIepIZR4oNBjuNfKgUVXvOLcX8khE8M=;
        b=DGU5GiU+D9uzTSt9/TC8jgXVnxlOJ89bO67Cih03Oq/mV83HDXC1Q1Ja90Jp/Ye14V
         j8eBn15XhVqamYGVZabQzokJIczq0Q4xpgcTkou196I/Mcne53TAYrWW1VuFL1FuGg/V
         xHhrk1jcxXe6ZQOPYp5ZbWssscLQrvaeFcll0wUlHJRvIPPBWAr2UDwaXgM9F5k3mzsy
         PtWADpKcJf8ss8vhMk9S+wJlWArnE6fY0KMfKtBXgzlQ+4qoh9uFVRhvmqgt/LAJFwXS
         Zn7YgGwvZVW2aIcl4Pz/MyQZeNLMRxEXpPE56abwd1BS0KebS3txrk1lVuYrwFckPdkN
         P0FA==
X-Gm-Message-State: AC+VfDxs4u+zLHL/iwilC7NNv8vMRIsZ7ycYSxsHMj1Dvia+BHitsV7G
        eCWXvO8WiEAz8/N0yIlBdgxLOA==
X-Google-Smtp-Source: ACHHUZ6BPJrTMmE6q+3KwyvgvqUoCdmn2pOb0V2mUV/yq9VWTvL9ZaWdx8qqDZktiSGiZf9u3mKihg==
X-Received: by 2002:a17:903:1208:b0:1aa:feca:b616 with SMTP id l8-20020a170903120800b001aafecab616mr20911966plh.65.1684975997791;
        Wed, 24 May 2023 17:53:17 -0700 (PDT)
Received: from google.com (KD124209188001.ppp-bb.dion.ne.jp. [124.209.188.1])
        by smtp.gmail.com with ESMTPSA id j4-20020a170902c08400b001ac2f98e953sm60563pld.216.2023.05.24.17.53.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 17:53:16 -0700 (PDT)
Date:   Thu, 25 May 2023 09:53:12 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Vikash Garodia <quic_vgarodia@quicinc.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCHv3] media: venus: provide video device lock
Message-ID: <20230525005312.GC30543@google.com>
References: <20230524135737.2557837-1-senozhatsky@chromium.org>
 <20230524141312.2558810-1-senozhatsky@chromium.org>
 <2c732d80-1a18-7a34-03a8-16afb0de5ea2@linaro.org>
 <f9219cb0-2cac-bace-20f7-27005cd0e6f1@xs4all.nl>
 <83cd3dc7-455d-0f26-d2a8-3ebe92d9e33f@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <83cd3dc7-455d-0f26-d2a8-3ebe92d9e33f@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (23/05/24 22:06), Vikash Garodia wrote:
> > Instead the struct v4l2_m2m_ctx q_lock pointer, if set, will use that
> > mutex for all vb2 operations.
> > 
> > I think you can set it to the 'lock' mutex in struct venus_inst.
> 
> IIUC, the suggestion is to use the 'lock' in struct venus_inst while
> initializing the queue. This might lead to deadlock as the same lock is used
> during vb2 operations in driver. Might be introducing a new lock for this
> purpose in struct venus_inst would do, unless we are trying to serialize at
> video device (or core) context.

Something like this?

Video device has to provide a lock so that __video_do_ioctl()
can serialize IOCTL calls. Introduce a dedicated venus_inst
mutex (which is set a ctx ->q_lock) for the purpose of vb2
operations synchronization.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/media/platform/qcom/venus/core.h | 2 ++
 drivers/media/platform/qcom/venus/vdec.c | 4 ++++
 drivers/media/platform/qcom/venus/venc.c | 3 +++
 3 files changed, 9 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 4f81669986ba..6ac5236d6888 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -389,6 +389,7 @@ enum venus_inst_modes {
  * @sequence_out:	a sequence counter for output queue
  * @m2m_dev:	a reference to m2m device structure
  * @m2m_ctx:	a reference to m2m context structure
+ * @ctx_queue_lock:	a lock to serialize video device ioctl calls
  * @state:	current state of the instance
  * @done:	a completion for sync HFI operation
  * @error:	an error returned during last HFI sync operation
@@ -460,6 +461,7 @@ struct venus_inst {
 	u32 sequence_out;
 	struct v4l2_m2m_dev *m2m_dev;
 	struct v4l2_m2m_ctx *m2m_ctx;
+	struct mutex ctx_queue_lock;
 	unsigned int state;
 	struct completion done;
 	unsigned int error;
diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 51a53bf82bd3..2caeba5b6378 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -1641,6 +1641,7 @@ static int vdec_open(struct file *file)
 	INIT_LIST_HEAD(&inst->internalbufs);
 	INIT_LIST_HEAD(&inst->list);
 	mutex_init(&inst->lock);
+	mutex_init(&inst->ctx_queue_lock);
 
 	inst->core = core;
 	inst->session_type = VIDC_SESSION_TYPE_DEC;
@@ -1684,8 +1685,10 @@ static int vdec_open(struct file *file)
 		goto err_m2m_release;
 	}
 
+
 	v4l2_fh_init(&inst->fh, core->vdev_dec);
 
+	inst->m2m_ctx->q_lock = &inst->ctx_queue_lock;
 	inst->fh.ctrl_handler = &inst->ctrl_handler;
 	v4l2_fh_add(&inst->fh);
 	inst->fh.m2m_ctx = inst->m2m_ctx;
@@ -1716,6 +1719,7 @@ static int vdec_close(struct file *file)
 	ida_destroy(&inst->dpb_ids);
 	hfi_session_destroy(inst);
 	mutex_destroy(&inst->lock);
+	mutex_destroy(&inst->ctx_queue_lock);
 	v4l2_fh_del(&inst->fh);
 	v4l2_fh_exit(&inst->fh);
 
diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index 4666f42feea3..4292b299f014 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -1443,6 +1443,7 @@ static int venc_open(struct file *file)
 	INIT_LIST_HEAD(&inst->internalbufs);
 	INIT_LIST_HEAD(&inst->list);
 	mutex_init(&inst->lock);
+	mutex_init(&inst->ctx_queue_lock);
 
 	inst->core = core;
 	inst->session_type = VIDC_SESSION_TYPE_ENC;
@@ -1483,6 +1484,7 @@ static int venc_open(struct file *file)
 
 	v4l2_fh_init(&inst->fh, core->vdev_enc);
 
+	inst->m2m_ctx->q_lock = &inst->ctx_queue_lock;
 	inst->fh.ctrl_handler = &inst->ctrl_handler;
 	v4l2_fh_add(&inst->fh);
 	inst->fh.m2m_ctx = inst->m2m_ctx;
@@ -1512,6 +1514,7 @@ static int venc_close(struct file *file)
 	venc_ctrl_deinit(inst);
 	hfi_session_destroy(inst);
 	mutex_destroy(&inst->lock);
+	mutex_destroy(&inst->ctx_queue_lock);
 	v4l2_fh_del(&inst->fh);
 	v4l2_fh_exit(&inst->fh);
 
-- 
2.40.1.698.g37aff9b760-goog

