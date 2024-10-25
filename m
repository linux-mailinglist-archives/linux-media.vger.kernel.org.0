Return-Path: <linux-media+bounces-20319-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 816FD9B0377
	for <lists+linux-media@lfdr.de>; Fri, 25 Oct 2024 15:12:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B37BD1C21433
	for <lists+linux-media@lfdr.de>; Fri, 25 Oct 2024 13:12:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D4531F7540;
	Fri, 25 Oct 2024 13:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="XsHwaYKQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D72F1632E2
	for <linux-media@vger.kernel.org>; Fri, 25 Oct 2024 13:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729861932; cv=none; b=cT3E0gikjcpU0XyxE6pFiKUasNpF/4kcTJddUnibGE2T3idmU9rHBbI4NvDcItisOytm2EC/POv0Oioo/g4GOxp8jTJzjkqblpBjnG6s9BlYCpvbT7ThzbrmmIZCcAurLwjTd89XUWWkDmm1kg5FKlS2H8i09SSoSARMwGNqoqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729861932; c=relaxed/simple;
	bh=RveC5jacooImmHBxMnm+SqvD0OPds08xgXiCC+fcXwY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FfWeDoXG+87nSLXbtPiShviC94FbLy9tRuqoGpEXSt85+5RFlSbDCIsG3FseWaFCxfRLnqm7kOBqm1op5sHm/1EvyKSkqIEfW4dS97lG7PVEOIwMoVJ65YODXi2YtEF5suq4R2fRzWTZnxOna21gOhOk7f8rQYzciYZj1d7mGN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=XsHwaYKQ; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2e2cc47f1d7so1357211a91.0
        for <linux-media@vger.kernel.org>; Fri, 25 Oct 2024 06:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729861929; x=1730466729; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8O+PQVPJ/vy+FUOPeA37d+cZZmUqt00r3pyhnqMSbPI=;
        b=XsHwaYKQO/wOMvGlj+XHPA6dkSafH+5vYS9CoLt0fnTplYsew8r+p3lNRfJru/IQB9
         Xh8+adatigmmq9f7bkV/UtEkeFWPrQC7riTIwKigqnzV0PIZq1fJujylA4X/ud+oKE97
         A1uSyEZT2saEpHHod2S4xy0Ge1Y3fD3Qetn+4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729861929; x=1730466729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8O+PQVPJ/vy+FUOPeA37d+cZZmUqt00r3pyhnqMSbPI=;
        b=IJS4h/7oU8rs9dvFc9oAYuHJkMGGK0P82iD4SH+KPzO2wWYphfP8ZjJY/Lod1rOFNp
         07dkegpN1m9XgfOMBHCnwd6p1hEGfTPYU+MFl0UjbakmgCw6ukM1fzBgO0DVO7QWbiBT
         Ewq+EyGPmkkQQBUznKwCOQK89jgCR1ShPPTvk7GUgtmEgaSpPWZtumNGjsYPs7uZdEe3
         wUqwn3smS3p5tW589TPAmJzuPskZihWzrJsj9sC7T0Gsl1Sx5Vd5NbPzhN1oEf+goJJK
         HDQxotgZE0Yv6t1IQc8J1HytXS0j5gt49vP0ueggqwH1w3I2idNCTvPdJ9Y6YL+tQ8H1
         wR6A==
X-Forwarded-Encrypted: i=1; AJvYcCUFkchLCaU0XDhKNYlCSgOTMWcayS/gGxhS6vdCD+ygWSO77hnjZAvhx/eaN772XflYCAj4UzH4ZNlweA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyvGg9kj6dFxzCa12iXbL827JJgK0Qcgy7WEqSwo6STMBsFTIvd
	9SqCUBBG3T5kQS+rYCOxIrIcuQZvFXRbgPEnLj7dcZtxN64nFDxytTedMpMxzw==
X-Google-Smtp-Source: AGHT+IHb6CaPZzY4kiz1STIwYzefqAd98TECBpUtE/ewzpfQRIJG3J6EvKjfQDl89ZLKApDYRrV2LA==
X-Received: by 2002:a17:90a:fd04:b0:2e2:b719:d582 with SMTP id 98e67ed59e1d1-2e77e6405f5mr8391434a91.14.1729861929179;
        Fri, 25 Oct 2024 06:12:09 -0700 (PDT)
Received: from tigerii.tok.corp.google.com ([2401:fa00:8f:203:bd37:bccf:f3e:a9ef])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e8e3556517sm1364203a91.8.2024.10.25.06.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 06:12:08 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: Dikshita Agarwal <quic_dikshita@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Tomasz Figa <tfiga@google.com>
Subject: [PATCHv5 1/3] media: venus: fix enc/dec destruction order
Date: Fri, 25 Oct 2024 22:11:49 +0900
Message-ID: <20241025131200.747889-2-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
In-Reply-To: <20241025131200.747889-1-senozhatsky@chromium.org>
References: <20241025131200.747889-1-senozhatsky@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We destroy mutex-es too early as they are still taken in
v4l2_fh_exit()->v4l2_event_unsubscribe()->v4l2_ctrl_find().

We should destroy mutex-es right before kfree().  Also
do not vdec_ctrl_deinit() before v4l2_fh_exit().

Fixes: 7472c1c69138 ("[media] media: venus: vdec: add video decoder files")
Suggested-by: Tomasz Figa <tfiga@google.com>
Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/venus/vdec.c | 7 ++++---
 drivers/media/platform/qcom/venus/venc.c | 6 +++---
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 6252a6b3d4ba..0013c4704f03 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -1752,13 +1752,14 @@ static int vdec_close(struct file *file)
 	cancel_work_sync(&inst->delayed_process_work);
 	v4l2_m2m_ctx_release(inst->m2m_ctx);
 	v4l2_m2m_release(inst->m2m_dev);
-	vdec_ctrl_deinit(inst);
 	ida_destroy(&inst->dpb_ids);
 	hfi_session_destroy(inst);
-	mutex_destroy(&inst->lock);
-	mutex_destroy(&inst->ctx_q_lock);
 	v4l2_fh_del(&inst->fh);
 	v4l2_fh_exit(&inst->fh);
+	vdec_ctrl_deinit(inst);
+
+	mutex_destroy(&inst->lock);
+	mutex_destroy(&inst->ctx_q_lock);
 
 	vdec_pm_put(inst, false);
 
diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index 322a7737e2c7..6a26a6592424 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -1519,14 +1519,14 @@ static int venc_close(struct file *file)
 
 	v4l2_m2m_ctx_release(inst->m2m_ctx);
 	v4l2_m2m_release(inst->m2m_dev);
-	venc_ctrl_deinit(inst);
 	hfi_session_destroy(inst);
-	mutex_destroy(&inst->lock);
-	mutex_destroy(&inst->ctx_q_lock);
 	v4l2_fh_del(&inst->fh);
 	v4l2_fh_exit(&inst->fh);
+	venc_ctrl_deinit(inst);
 
 	inst->enc_state = VENUS_ENC_STATE_DEINIT;
+	mutex_destroy(&inst->lock);
+	mutex_destroy(&inst->ctx_q_lock);
 
 	venc_pm_put(inst, false);
 
-- 
2.47.0.163.g1226f6d8fa-goog


