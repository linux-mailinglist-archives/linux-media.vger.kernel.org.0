Return-Path: <linux-media+bounces-20327-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 199989B0A6A
	for <lists+linux-media@lfdr.de>; Fri, 25 Oct 2024 18:57:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7EBB7281604
	for <lists+linux-media@lfdr.de>; Fri, 25 Oct 2024 16:57:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0A6215ADAB;
	Fri, 25 Oct 2024 16:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dJC9tfZh"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664821FDFA8
	for <linux-media@vger.kernel.org>; Fri, 25 Oct 2024 16:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729875427; cv=none; b=O0hIhF4h7LKoRXIy4UR5gjfuPUI8La2dpkQzlHhmEQrhJhPHSrw+S5J2TxNhIOOy5cmr6JFEBntqX7ar0ZBdoV1+DOf6TxzuXaXFpOMd2XVOR9ei8oMWic1b/Ly1NFoI2vZSlM+NKZxEughbkzIt2VpmWUlYu2A5yLwTqtYNRG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729875427; c=relaxed/simple;
	bh=RveC5jacooImmHBxMnm+SqvD0OPds08xgXiCC+fcXwY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eb2wtBy2KJ3ukwcc21NW2t3GFuGLZnuN3Zimqklcj0wuLugV9Qu2ckM3USGxTwo6PB7FY7r/PI4TTfgXq1kWoK3rD8YT3Iv51p7jQCVL3fK53eJSbHWKMIJbjGKsdvNRn5S76DmOsZyBDAeTUlCmwhrNOXKDHHgPSbr7GxygkMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dJC9tfZh; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-7ea16c7759cso1176947a12.1
        for <linux-media@vger.kernel.org>; Fri, 25 Oct 2024 09:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729875425; x=1730480225; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8O+PQVPJ/vy+FUOPeA37d+cZZmUqt00r3pyhnqMSbPI=;
        b=dJC9tfZhS44WzqmnZqrGmUI34HmmcNlOYfKOhXa/vgD5xaLwbouWc0xz9+HAVMPGAm
         7ybH9WQiZJdm+W9Pr9v3f6EBwPIatQKZTAIVDr7qYJ21O4uAiGzEq/BfFQbk/GoQ1jll
         p/Gl9uAvBAgZrEIm7kk3xU0OTXaa+xd64QY2s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729875425; x=1730480225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8O+PQVPJ/vy+FUOPeA37d+cZZmUqt00r3pyhnqMSbPI=;
        b=tpu2B1mPwXAWPqsCxrXfT63+9Oi1/f/B6QBJ4dj+w9erbX0V4jVKYicbbv5YNUY/JV
         XWqYduqQ+3z6n2oxTDOql77HilL5LhhptCPykHUdhoGDgLahfd/9MwMV+GW3cSm9zNUX
         ZfklXL2Osx2w1TlsjcrG7DZl+urs4Ugd+QvTl6kuZJRumAXn7D8Ks9boP0IP5zhuIam7
         SMKFMen7XeLRy2GnjRr9hUofLPSjeiwFE2q167lgynWvmpmPrz5b1nrTf4fqD3k4XHp2
         QBE1M6m6roAx5E89410v2R87hexGA4+2NC/GTMNxpJyyi+a1y3NVLglt7Xnru8koZpX/
         i6gg==
X-Forwarded-Encrypted: i=1; AJvYcCW34ByPBDYnDqifr9mK9ncY5eEKCeHIKlcrvyHoM8l0T3A9rBzGpHX7Jy18eyT+mnYLFVojjwJkZJkKqQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2bb2gvHqHDT8D10YKxhCMoRI9/RljH9DLxcG3y/dekDRSn90G
	d8p9OQe3JlL8YYZxpaSPKBYKBf0lQ1zLRFOZcO1FLvvXr3mjoK57r3gysUipZg==
X-Google-Smtp-Source: AGHT+IH7rfguzduKr1bcBWzJK7+v3a3TINoVQscqXJeQZUt3/8c4xIaOMv18ZR2WsqaNoVrM7t4Llw==
X-Received: by 2002:a05:6a20:9f45:b0:1d9:111f:4b46 with SMTP id adf61e73a8af0-1d978b14665mr12866841637.12.1729875424739;
        Fri, 25 Oct 2024 09:57:04 -0700 (PDT)
Received: from tigerii.tok.corp.google.com ([2401:fa00:8f:203:bd37:bccf:f3e:a9ef])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7205791db5fsm1318970b3a.11.2024.10.25.09.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 09:57:04 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: Dikshita Agarwal <quic_dikshita@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Tomasz Figa <tfiga@google.com>
Subject: [PATCHv6 1/3] media: venus: fix enc/dec destruction order
Date: Sat, 26 Oct 2024 01:56:41 +0900
Message-ID: <20241025165656.778282-2-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
In-Reply-To: <20241025165656.778282-1-senozhatsky@chromium.org>
References: <20241025165656.778282-1-senozhatsky@chromium.org>
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


