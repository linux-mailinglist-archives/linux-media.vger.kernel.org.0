Return-Path: <linux-media+bounces-15484-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C59C693FE4A
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 21:32:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E87741C22533
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 19:32:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5549187858;
	Mon, 29 Jul 2024 19:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="moMBXe6u"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24D415B555
	for <linux-media@vger.kernel.org>; Mon, 29 Jul 2024 19:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722281555; cv=none; b=GcNW3cVYbXjpWZ3NIdX5/CiEorrRFVfpJ/pKJKg4SO2/tjCyz5/64iUSZHUeKnRKmOSWNueUcn+B47JjADkn3oiTBAdntWfEvvF2L6kGagslyLlOADcOrYkBfJgqowADmbLfQ53Fz/vXwDeipVsqyYBELCoZA6MXborBGAd5cGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722281555; c=relaxed/simple;
	bh=dS4paJRd+FnTxi5KMww6xVqqBMWNFPBaS+a9evtXShs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=etl/IWsWyNKjnDBDHTa95AZ/Yz5ZeQ0KPkdmLK2X7r4R1H7mzmSzN27sQ3iDnDtEcwOvrxUPIdkRT60rAYsA0RHMTVbycDg5vGQ/wRhDwjD9opW8fuKLYOb6g4E4xB302wyAB3Egwh8JyrbYpCS3SZ0PmthRCCwKJ38ACWL3vzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=moMBXe6u; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1fd66cddd07so22744675ad.2
        for <linux-media@vger.kernel.org>; Mon, 29 Jul 2024 12:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1722281553; x=1722886353; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6cyD7v3Bb/QfCec3YwhycSMF/Uutpw6nqnCmheziynI=;
        b=moMBXe6uhl/j5QDI795nX4mZ10dsY9EVsOiIbSx6j2OFOtg6TUmJNnafFrQyBQQ60O
         MxMaJPMkQG24mVcrwH/uXhGJ5aYC77uB3rNwvObxLE+5K7N27fQIXou9NQih4SjPqzYp
         XX/+2pEpyy+BOlzGiswq4dKdmzoaoRQakzprw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722281553; x=1722886353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6cyD7v3Bb/QfCec3YwhycSMF/Uutpw6nqnCmheziynI=;
        b=oT5P6jiKW5CEQ/zEMFv6RakVPDODwzHUY6ifcqRkeyzt3nDKNUFY4wsrqharPsLX5h
         Rda1VEt2ldmqNrGuoXILWOxMMjiC8TuC2G77sIW4UkuJPfFRcoJRV3GCBfgqRoeg7OF4
         DyZwQ1tsYCan60U110Ta1EUsB8pKYcXYaSLELmOyUNlCs3Tn1uwK7dM98Lh5TdXJ+Ufd
         Oy+zYDl9hWyhH4Y3+Egkk0WBvVFd8aBAcOFdX6QWuEg3wGho97LQQjRt8x9zxaQ85dpE
         LnaOL0UEq+v8H3i1Rk7MH4hM+Z1jEfVAVfsXa0IbhRHm0Z5C1JVXasjQIs+gUE/+A+x3
         F77A==
X-Gm-Message-State: AOJu0Yy7/NPQOsttcwkHsHBiZG6uTd3pp1l1tS0gee+/0NJRhscoww2u
	6gcVLE6GmEUOBF/OBM39puua3C9jSouWpSxXfV/s9b+7+aAPPC/7oKi24ZG3MbYNMfkf2+50wpg
	=
X-Google-Smtp-Source: AGHT+IHVt0RmNyrPncbt03o1Gtk3ZHU126LmZwoWj8QmY44wo607z03A+W9EhSqOksN1P9Fbsp7lTg==
X-Received: by 2002:a17:902:ce86:b0:1fc:71fb:10d6 with SMTP id d9443c01a7336-1ff04805c4bmr75795745ad.6.1722281552963;
        Mon, 29 Jul 2024 12:32:32 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e13:6:5aa6:a2c1:9047:7da2])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-1fed7d29228sm89066865ad.106.2024.07.29.12.32.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jul 2024 12:32:32 -0700 (PDT)
From: Fritz Koenig <frkoenig@chromium.org>
To: linux-media@vger.kernel.org
Cc: mchehab@kernel.org,
	stanimir.k.varbanov@gmail.com,
	quic_vgarodia@quicinc.com,
	bryan.odonoghue@linaro.org,
	Fritz Koenig <frkoenig@chromium.org>
Subject: [PATCH v2 2/3] media: venus: Helper function for dynamically updating bitrate
Date: Mon, 29 Jul 2024 12:19:11 -0700
Message-ID: <20240729193219.1260463-3-frkoenig@chromium.org>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
In-Reply-To: <20240729193219.1260463-1-frkoenig@chromium.org>
References: <20240729193219.1260463-1-frkoenig@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the dynamic bitrate updating functionality to a separate function
so that it can be shared.

No functionality changes.

Signed-off-by: Fritz Koenig <frkoenig@chromium.org>
---
v2:
- update commit message

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


