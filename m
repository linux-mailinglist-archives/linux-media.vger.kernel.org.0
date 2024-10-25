Return-Path: <linux-media+bounces-20309-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7609B007B
	for <lists+linux-media@lfdr.de>; Fri, 25 Oct 2024 12:51:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C648E1F2143F
	for <lists+linux-media@lfdr.de>; Fri, 25 Oct 2024 10:51:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 668A31F8F0E;
	Fri, 25 Oct 2024 10:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="b0S0/ROI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFDBE1F6688
	for <linux-media@vger.kernel.org>; Fri, 25 Oct 2024 10:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729853478; cv=none; b=JQ3sdbxg6CTuXqolLHemRZo+2ng+PrOKJCvwLx4UXvKrcFdU72iTRiqXAX8BZKeRlhj6Dh26JCvryUPaohEdD0MoQg/+RCMO0Czi4BWCi47gkqy2zBoOfDekVozQefr7TWwSUfSOYDI7IuVon6tq1rjH5XXggDVMfb0ApkrzTVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729853478; c=relaxed/simple;
	bh=RveC5jacooImmHBxMnm+SqvD0OPds08xgXiCC+fcXwY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UNS/ONJj5hQfCGHIijMCS/Pt7fsbX7+gFRtG+ibsruviVAb8i2TbFyYBJz516u+HWdA9W70Q+5kIqqpF9Mtgu/b27Zklr7NLYM/d0tUMEjlL6yWXo5c80vVM1dKVZ4Coyfs8G7oezvJvCUm99UPejrLcWYGn3zpKZzWQqbKkHXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=b0S0/ROI; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-208cf673b8dso15836745ad.3
        for <linux-media@vger.kernel.org>; Fri, 25 Oct 2024 03:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729853476; x=1730458276; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8O+PQVPJ/vy+FUOPeA37d+cZZmUqt00r3pyhnqMSbPI=;
        b=b0S0/ROILeow1iJnD8ZCF2KFrGjYDzHh665t662YB2KCXqvEpAD1aac+sXa2BrxPG6
         zoesVrPz/2ixHXGmTfmyLAYUyr4VvgBnaCHxQfSdAnsIVPc8kGKqjXJU8almX6qSWlfL
         dleKArHemmgHuwekTGEMVihUl3pCZfnq6D0b8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729853476; x=1730458276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8O+PQVPJ/vy+FUOPeA37d+cZZmUqt00r3pyhnqMSbPI=;
        b=f/WsRtwEW90iPnJokECqGuyN+9D6Y1xolA8M9sjvpmpu/UNnEcAVHFNKon2ZxV4mjC
         1Vgf+O+BdTleGVqBxh7sPx2HlA11W2yivGEooCkjuZlSOuAYvlAw1omkvOjRrRaeW+WM
         2B5SA5R6Hl0iMiLk1mFvSOSmDmZOPxDcQeWlKgD+hqtC/FivgS6JSdE+Dpb7WNBcCnDC
         VZeCcqvB9BkdN+iKzhwtmrNbWSwwj5oBne8TkMtbvokvsqemsgr54e9EKhrS1U3NaT5g
         nxfaqyVsH0rN9CjD53E6hG2SPChpswXWsSJ+5MNwDpJP2aTdKoEkA7qtrn48ieL1bodb
         VpaA==
X-Forwarded-Encrypted: i=1; AJvYcCVodvjighO8L8zRnj2YBqopmjAcrBcBp0rlS1rrsQmjhL151zXWR3jc1OpO3r0Z5XssiwfO4GJ0aS+oCA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxx1A1CauTXutLiZuHdv4gNaJ9y/zghSpUvoUeRSjrcQqhI7bLH
	/Z2qQ42/Xrj41D5/9ah0vj1Ux0jT71ngCyNRC4IKux3lh6+zjDGvfiILPAxTfg==
X-Google-Smtp-Source: AGHT+IFZfuxzfCsukd1NHY0fOBAqzPX1aKEEz99SK5/ea2onRaS1TSBdTnV3NHaIcYuANRhG9C0GdA==
X-Received: by 2002:a17:903:22ca:b0:20c:8a91:3b43 with SMTP id d9443c01a7336-20fb98ea228mr64638325ad.16.1729853476260;
        Fri, 25 Oct 2024 03:51:16 -0700 (PDT)
Received: from tigerii.tok.corp.google.com ([2401:fa00:8f:203:bd37:bccf:f3e:a9ef])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bc030809sm7326755ad.227.2024.10.25.03.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 03:51:15 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: Dikshita Agarwal <quic_dikshita@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Tomasz Figa <tfiga@google.com>
Subject: [PATCHv4 1/3] media: venus: fix enc/dec destruction order
Date: Fri, 25 Oct 2024 19:50:37 +0900
Message-ID: <20241025105104.723764-2-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
In-Reply-To: <20241025105104.723764-1-senozhatsky@chromium.org>
References: <20241025105104.723764-1-senozhatsky@chromium.org>
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


