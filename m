Return-Path: <linux-media+bounces-20054-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 915AC9AB54C
	for <lists+linux-media@lfdr.de>; Tue, 22 Oct 2024 19:41:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C54E6284970
	for <lists+linux-media@lfdr.de>; Tue, 22 Oct 2024 17:41:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B28221BF7FC;
	Tue, 22 Oct 2024 17:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jsYH1X9Y"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A209A1BDAB0
	for <linux-media@vger.kernel.org>; Tue, 22 Oct 2024 17:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729618849; cv=none; b=pwl4mRSoM/Gsc75EE+H7Zvkz4Lru3PKbD0saSxgvGoJE7LgJItw6FSpZL00JZMuBaYc0nEP8bK0wmb8hf412H9YP9SblHamyXol4sdbbd8U8nU57FhPhzN6ppIb9qqGg1GUWPCw1V+lLJD+m/rDyL3qfRFtcL4mi6ExyhN6r3i4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729618849; c=relaxed/simple;
	bh=lLem3laeKL8UeOhfLirfjJxHjmZMmH0EUmK6QvTIEx4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZBj7PzOx+SW+jDkQzf+aJiCQK+57pvafK69kXBoJ073jDy1v2P4bqXTWbHtctRvnqwvg1ElZHHaUJQjfGAKMHTu8U2FQBKYjKqdIKja8YFGQwOxikat+MlHeuwcQSk7Qt3UDMdr4ARvQbK4hhiheJuDSrHNAPl9jpPeuYMZG+CI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jsYH1X9Y; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-71eb1d0e3c2so2594138b3a.2
        for <linux-media@vger.kernel.org>; Tue, 22 Oct 2024 10:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729618847; x=1730223647; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wX3duO21HOsFDaiwe4mIm4X5Ap6AOGPc9nHXMPlpy5k=;
        b=jsYH1X9YY1HcPY7Dmnx+9tMf9GBPbryTe+9AYiZBDxXZpoYbOMo/60L0Or5Xpggllu
         BnXY4ni6KTnhhsOAQqSsms8Iai4vW7qCq+cYVrbSC6ZvShuJQ6c/xR1tMgHL8Zy/W/2h
         +YaCbV0DG2lTXBM8pQhe9IsavvQwRevgu4LLU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729618847; x=1730223647;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wX3duO21HOsFDaiwe4mIm4X5Ap6AOGPc9nHXMPlpy5k=;
        b=lEx6DvmqxdGkSKkJUwhF60BBRXvm1mfmsPntoaLqF4GZzn+nThIlw+DDctM+UoBlhs
         gBVo2bkNLLKbR8Y5h6qo3r6UdENicfUo5khju4BwXsmTqASR4oa5c8e4buAnqDeaf1f1
         HpnjFb0BY3p6dLEqVuRKD9rA/m3DVzGtQ1KkZ5btqTY9qERVv/Nnn+mocUzxjwyypiZr
         wTcQnLFPZHb3yp9+KoheoiMh6FpAGTJTx66X51+Ak37ngUQ6Qxaz4ygr90qtiQTluoAQ
         Wz4EegHpZD3X7QejyeFLVD4HqRmb8gCkUHKBOWNCULtGBJTGRJvZ82tkauTRCqnM6SAK
         sfdw==
X-Forwarded-Encrypted: i=1; AJvYcCVmVtLN2Q84y1ZRbe2CvRS1iodHL5v0F96w8Oy7tK5vcRGMuVUIvkOQrMcE6qzZHpYCm9pIzjHYI8LjRA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxljuQ0MUSTbkVm98unuckEVCQ1JNmXEIu08I/TLXom2CppLEWn
	tRTfAJruBTjVobdOrIMuoVuJtgcw/BnQwN+b9dA8hp9B81FATXovyzqCjg0/RA==
X-Google-Smtp-Source: AGHT+IHoREl6JeUhcssYmlq0ORHRKXFTwH0EtndpoCpy318oyfYCUkDthUhsNjBEGavkJtZb6ld5Iw==
X-Received: by 2002:a05:6a00:1303:b0:71d:f012:6ddc with SMTP id d2e1a72fcca58-72030be7339mr18366b3a.16.1729618846876;
        Tue, 22 Oct 2024 10:40:46 -0700 (PDT)
Received: from zipper.pdx.corp.google.com ([2a00:79e0:2e13:6:158a:d1d:c077:7770])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ec1312d6bsm4992423b3a.29.2024.10.22.10.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 10:40:46 -0700 (PDT)
From: Fritz Koenig <frkoenig@chromium.org>
Date: Tue, 22 Oct 2024 10:40:42 -0700
Subject: [PATCH v5 1/2] media: venus: Helper function for dynamically
 updating bitrate
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241022-submit-v5-1-552f0fec8cba@chromium.org>
References: <20241022-submit-v5-0-552f0fec8cba@chromium.org>
In-Reply-To: <20241022-submit-v5-0-552f0fec8cba@chromium.org>
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>
Cc: Nathan Hebert <nhebert@chromium.org>, linux-media@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Fritz Koenig <frkoenig@chromium.org>
X-Mailer: b4 0.15-dev-37811

Move the dynamic bitrate updating functionality to a separate function
so that it can be shared.

No functionality changes.

Signed-off-by: Fritz Koenig <frkoenig@chromium.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/venus/venc_ctrls.c | 34 +++++++++++++++-----------
 1 file changed, 20 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/venc_ctrls.c b/drivers/media/platform/qcom/venus/venc_ctrls.c
index d9d2a293f3ef..3e1f6f26eddf 100644
--- a/drivers/media/platform/qcom/venus/venc_ctrls.c
+++ b/drivers/media/platform/qcom/venus/venc_ctrls.c
@@ -67,12 +67,28 @@ static int venc_calc_bpframes(u32 gop_size, u32 conseq_b, u32 *bf, u32 *pf)
 	return 0;
 }
 
+static int dynamic_bitrate_update(struct venus_inst *inst, u32 bitrate,
+				  u32 layer_id)
+{
+	int ret = 0;
+
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
@@ -85,19 +101,9 @@ static int venc_op_s_ctrl(struct v4l2_ctrl *ctrl)
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
2.47.0.105.g07ac214952-goog


