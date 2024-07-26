Return-Path: <linux-media+bounces-15368-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AA04D93DA39
	for <lists+linux-media@lfdr.de>; Fri, 26 Jul 2024 23:38:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4F1651F21E0E
	for <lists+linux-media@lfdr.de>; Fri, 26 Jul 2024 21:38:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A67F14A08E;
	Fri, 26 Jul 2024 21:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Ys3O3a3J"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E0D38F82
	for <linux-media@vger.kernel.org>; Fri, 26 Jul 2024 21:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722029921; cv=none; b=gnxf9mo8sUB8pEpSBo18Tgw/p8ffNOKMFJYcVowbjGRv22iJn+uEz2sKoN0UlFeKTaFIkJDZcusA/ewweDQbr9ydLtB1HO0jMb2neQY4mU9q5ED+15f0L7xfAN4a+auFTrR8tondYhrk4/pIy04IDRc75UoTTD8CdJNDyhv/sIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722029921; c=relaxed/simple;
	bh=pV2TBQaGdixjGwH+oJG3YzX7SlTJCkTxalTLk8WhOYc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DUR1dUfYqsGKUc8N5MzJojJLNoNvODawXPXbV7pWqBm5u3YlR3Ht35yUnJIaBCh7YcGsKSNXL4Dqd8dntxGycnggVFYgtbISdXvsAEsT1YMuqvxWPnuJIqZvHHM5QiVA3XarBC3HAsftObrEyAwjT1LZRH3wKmXp1CHvbrSZ1sE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Ys3O3a3J; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1fc491f9b55so10780765ad.3
        for <linux-media@vger.kernel.org>; Fri, 26 Jul 2024 14:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1722029919; x=1722634719; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VjVld0ybdTG4WIhOEqYa1EWntc1VB2xqhtGCedFQD6I=;
        b=Ys3O3a3JxfJdoI86+DvA2cM1JQ500YtRP46G6YE76XoHCI5bp8QdwXiS+gx4v98g7Q
         8qR9ZxBHD7ziHVRgcnYsoIhZ8LnoAsRLJEf+ONpT2Ps+YnBBtOjQCZp6a6J7aggF9q5T
         +A5486c8NAuo9WNow7523kroby6YEcTaGZAo8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722029919; x=1722634719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VjVld0ybdTG4WIhOEqYa1EWntc1VB2xqhtGCedFQD6I=;
        b=gd0JXdc70+EJeFWIQwHxYcfdIN5JVWK3+nZfqLSII96JPJzAwImGVm67eN0hvyHXeO
         uRdGLDzAgq/033M8DQIT5cVyUGA/3Q8Yy7lTfvQDDof4IrfIPMgbog4PwPtFfofFN+oB
         BaFQn3sB1y8Sej1E2/CTS4uCU52reA/KNV44Zq+fnQP7xdSmOATEOp6TAJ85g9bE13kq
         sZKqihyJY1nTa+ZiYrFivr7BI6rRiJnth0coMxbWSuGjvSMsouv90i1eQKtfdtFhX/N7
         d93L7ZkGyu7cGFtChJ5N5Y1HZe7iy4HV8BMo9CSK65gLOp1pUSjm+LN32zAgFcKY7oKk
         7KmQ==
X-Gm-Message-State: AOJu0Yw5m3kpmw1aYo22pWiy01lUdALWSbmxV1GqNvmNp6gp+7+yMnJ5
	8LBPNPDSHNfHzHe0H1Uo/Xh6V9U9x3IL7ZyFe/wpJo4Wla22xF16lnKDMZZVm2IIYLKa+HflLMQ
	=
X-Google-Smtp-Source: AGHT+IHWUhU9eDGdSJ9r+tpRvnH1GFfWwvX/T6MGDiUAYQ4RyyFBlqV4iFu++AiHQ0dea19upUm6vQ==
X-Received: by 2002:a17:902:e805:b0:1fa:7e0:d69a with SMTP id d9443c01a7336-1ff048e228bmr10698445ad.46.1722029919528;
        Fri, 26 Jul 2024 14:38:39 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e13:6:197c:4043:3e17:8623])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-1fed7ee2f21sm37597325ad.154.2024.07.26.14.38.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jul 2024 14:38:39 -0700 (PDT)
From: Fritz Koenig <frkoenig@chromium.org>
To: linux-media@vger.kernel.org
Cc: mchehab@kernel.org,
	stanimir.k.varbanov@gmail.com,
	quic_vgarodia@quicinc.com,
	bryan.odonoghue@linaro.org,
	Fritz Koenig <frkoenig@chromium.org>
Subject: [PATCH 2/3] media: venus: Helper function for dynamically updating bitrate
Date: Fri, 26 Jul 2024 14:38:10 -0700
Message-ID: <20240726213811.562200-2-frkoenig@chromium.org>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
In-Reply-To: <20240726213811.562200-1-frkoenig@chromium.org>
References: <20240726213811.562200-1-frkoenig@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

---
 .../media/platform/qcom/venus/venc_ctrls.c    | 33 +++++++++++--------
 1 file changed, 19 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/venc_ctrls.c b/drivers/media/platform/qcom/venus/venc_ctrls.c
index d9d2a293f3ef..6304cc97d37f 100644
--- a/drivers/media/platform/qcom/venus/venc_ctrls.c
+++ b/drivers/media/platform/qcom/venus/venc_ctrls.c
@@ -67,12 +67,27 @@ static int venc_calc_bpframes(u32 gop_size, u32 conseq_b, u32 *bf, u32 *pf)
 	return 0;
 }
 
+static int dynamic_bitrate_update(struct venus_inst *inst, u32 bitrate,
+				  u32 layer_id)
+{
+	int ret = 0;
+	mutex_lock(&inst->lock);
+	if (inst->streamon_out && inst->streamon_cap) {
+		u32 ptype = HFI_PROPERTY_CONFIG_VENC_TARGET_BITRATE;
+		struct hfi_bitrate brate = { .bitrate = bitrate, .layer_id = layer_id };
+
+		ret = hfi_session_set_property(inst, ptype, &brate);
+	}
+	mutex_unlock(&inst->lock);
+
+	return ret;
+}
+
 static int venc_op_s_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct venus_inst *inst = ctrl_to_inst(ctrl);
 	struct venc_controls *ctr = &inst->controls.enc;
 	struct hfi_enable en = { .enable = 1 };
-	struct hfi_bitrate brate;
 	struct hfi_ltr_use ltr_use;
 	struct hfi_ltr_mark ltr_mark;
 	u32 bframes;
@@ -85,19 +100,9 @@ static int venc_op_s_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 	case V4L2_CID_MPEG_VIDEO_BITRATE:
 		ctr->bitrate = ctrl->val;
-		mutex_lock(&inst->lock);
-		if (inst->streamon_out && inst->streamon_cap) {
-			ptype = HFI_PROPERTY_CONFIG_VENC_TARGET_BITRATE;
-			brate.bitrate = ctr->bitrate;
-			brate.layer_id = 0;
-
-			ret = hfi_session_set_property(inst, ptype, &brate);
-			if (ret) {
-				mutex_unlock(&inst->lock);
-				return ret;
-			}
-		}
-		mutex_unlock(&inst->lock);
+		ret = dynamic_bitrate_update(inst, ctr->bitrate, 0);
+		if (ret)
+			return ret;
 		break;
 	case V4L2_CID_MPEG_VIDEO_BITRATE_PEAK:
 		ctr->bitrate_peak = ctrl->val;
-- 
2.46.0.rc1.232.g9752f9e123-goog


