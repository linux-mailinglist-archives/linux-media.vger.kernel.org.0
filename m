Return-Path: <linux-media+bounces-19805-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C4D9A2E32
	for <lists+linux-media@lfdr.de>; Thu, 17 Oct 2024 22:05:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 478AE1C215A6
	for <lists+linux-media@lfdr.de>; Thu, 17 Oct 2024 20:05:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24AF42281E2;
	Thu, 17 Oct 2024 20:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KB1u3RJ8"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F3D227B80
	for <linux-media@vger.kernel.org>; Thu, 17 Oct 2024 20:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729195496; cv=none; b=d2rLW756yidrhBBiOwmyIiXYbokp+sTDnRH5EUfNK8mVc5Z4STB2+FBqSwpQmGhWyOpfy/WLl4n2Mrxj0+PipcKw25hQS+/rW8/J4tKcAahdEbOGdaW1y72LsYBKZyAtSfX9dqBr+nqkzQ45Q0wP58rfz3TwaRPULguAnzstSu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729195496; c=relaxed/simple;
	bh=i7sFO9JgUncK4+2BlaPMkoSHyIae7c3UHjJksnNmA7k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ART5PUNkj4Pgx260yp1aHvDBD+348zOCN0E+bcYPuGWFn4kahKbvKihmebYiJ4hc0jRw4/tKiQOIRmi+1i5ozUCJzmJaoamOfCdDE3VIHJXCB/Nmnd14bQMxHNwAl0V8rGKrTPyGha6QqmalWXxCLlHlKls+H5VyOur/b6khIB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=KB1u3RJ8; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2e30fb8cb07so1047278a91.3
        for <linux-media@vger.kernel.org>; Thu, 17 Oct 2024 13:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729195491; x=1729800291; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=usMSdKeptnG7ur7TVHyDplRNxOUvxLx0LIpwZM+f2fM=;
        b=KB1u3RJ84tLiiVCjQ2JDF4Ey7lVdhTXKIQXRPGyW/Vk/slNrS6IbBjIGEizzV/hhtt
         jWNeTn7jBGdtgTl6DeRK+J2OcK4Pt1kcRBP5TbHLpFa8HlCoZnYryEeZrZYAKT1K5beQ
         Bx1RIIr6hve1ZuUNi1i+Dfxqm+I/1acKeX2BQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729195491; x=1729800291;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=usMSdKeptnG7ur7TVHyDplRNxOUvxLx0LIpwZM+f2fM=;
        b=C0wmg5fcBcQhsJ3JfEI/x8NAMLmxCKI3EdmmgQZOoUSK8bkg6wll2IPVvgw6ul/jAk
         CQTQ5kaEhdDuAg2CZoycpf1GgZmgRAQK4MV5XJdr/+X0G3LRA3ZQmWWHvf+Eojml6hDX
         KFy3kBofOsgwFi96gY9AtV+sbqvFpGSRja4o1qxGL8E/qwIPIfUYofUyqUwl7+LHuPrb
         NKZgE7nVG4d/5BIIkCUTLYN5lVN0KhHXIWEcwrNeAU2YcVy/mfaMZFdS08GFbrbh4q6Y
         imMUA/OvCbQvb6GzHayW3z7ipI/k9uBZwrgljRjTvdpE201VFzgmindE/TFLWTTs16uI
         3k9g==
X-Forwarded-Encrypted: i=1; AJvYcCW/aVYquyxBm7gRb847VPxsmmA3sVV/6SfJq2q0+waSeNMpUXaHhPwIfMF+R6nq+y6OrG1GTQ/nhwMN5A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyYbC5Ll3rzus+uiCm4Mj0Px8K9Z7m1dIJaZqmdaU69hmI4Ov9Z
	6z50k2D3KrYYyp2y3a5R4UnBhn2DZ8xokHAbA+PBrvqZJGJ2jKaRv+grE9ndsLDRlnSPwPotagk
	=
X-Google-Smtp-Source: AGHT+IG28PbY56IoTsp4T0yBURVl1jqVtYGXY/1+pYGLu8KDfB4yM4GH6HSfnkh2AmLC7tKXvr72Ug==
X-Received: by 2002:a17:90b:4c52:b0:2e2:8c75:b45 with SMTP id 98e67ed59e1d1-2e56171a966mr176562a91.11.1729195491345;
        Thu, 17 Oct 2024 13:04:51 -0700 (PDT)
Received: from zipper.pdx.corp.google.com ([2a00:79e0:2e13:6:ab92:55d4:ae5d:528a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e56129dccesm110088a91.38.2024.10.17.13.04.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 13:04:50 -0700 (PDT)
From: Fritz Koenig <frkoenig@chromium.org>
Date: Thu, 17 Oct 2024 13:04:30 -0700
Subject: [PATCH v4 1/2] media: venus: Helper function for dynamically
 updating bitrate
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241017-submit-v4-1-d852bc7f7fdc@chromium.org>
References: <20241017-submit-v4-0-d852bc7f7fdc@chromium.org>
In-Reply-To: <20241017-submit-v4-0-d852bc7f7fdc@chromium.org>
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
2.47.0.rc1.288.g06298d1525-goog


