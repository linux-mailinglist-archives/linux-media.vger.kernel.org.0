Return-Path: <linux-media+bounces-20279-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ABADD9AF86F
	for <lists+linux-media@lfdr.de>; Fri, 25 Oct 2024 05:48:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2EF361F230B1
	for <lists+linux-media@lfdr.de>; Fri, 25 Oct 2024 03:48:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17AA91B3945;
	Fri, 25 Oct 2024 03:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YwR3rIDx"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 867E31B0F36
	for <linux-media@vger.kernel.org>; Fri, 25 Oct 2024 03:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729828005; cv=none; b=hYfht4fxD7THEl8VGbve7mOaWhvtc2YY45FnEcoQvcgRXJeXOBIswzBEBd5Ppvxp9Uk5VxHPSXI4v6ByX72lO8IjmO7vJrlyCzljLVDwm5QSZxAXx33Vq++cPFTQwe7dZFKk1ma3seKR4BL8xy1C+sXTJM7pBdR7RtWMYgu25V0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729828005; c=relaxed/simple;
	bh=RveC5jacooImmHBxMnm+SqvD0OPds08xgXiCC+fcXwY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CnZxPE0q/zc1d+TvvkheA7CypHJNc0+fT4Dcc9MAz92GEpFM3iYCfbfUVNuqgTXiPDp9QJAOPNSl037CkGbSYHy4ekHLFzgBYVHN6+xq7+Mt/WY/SUg5cvSWarNspoVe/FYEKOOTwwkZzUpAgWa9eC7/6piw3+H2j1NGvfPKVDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YwR3rIDx; arc=none smtp.client-ip=209.85.166.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-83abe7fc77eso61924539f.0
        for <linux-media@vger.kernel.org>; Thu, 24 Oct 2024 20:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729828002; x=1730432802; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8O+PQVPJ/vy+FUOPeA37d+cZZmUqt00r3pyhnqMSbPI=;
        b=YwR3rIDx6H3v5vaAmwICnAPpFKUDKeKxZmJ1a4wiMPJ8UkDOo2imzAW5hpRjDbG26n
         6yaSWqwjwlEdRREwCelRyoLxrb3hqiJcImJBT4Wi4QpT+hO1Q/FVaEQedKbA+RbLWSl6
         +tnuDboUEYrzAVP24kED6+hFlTjxZ6utLcqh0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729828002; x=1730432802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8O+PQVPJ/vy+FUOPeA37d+cZZmUqt00r3pyhnqMSbPI=;
        b=rg+JMpWG1X99zY1g1e6eehMbe7cqIL5jIjrTRdlaWbXKLIfOW/M1DIMlsE07lQxuBu
         W0xDx7FkVzXkIVDgCuhmjd5AgxqIoC24t0c4FmNlCvIxJ6zqdlWPEvjwJbctp+PMgi7K
         M9bb/Zw+Ypp/+ry//0ij3EwcxMYiDJrlKMY45i6obg9anQrBEu7W1q1q5/yF5jBIeaNm
         M0BqqEHqM5iBDctAReQrZaWXGZwUoSIB06DWiaSlDbC454U8THkFiFs5NoOG4bJorIyG
         p2d7ZsCAIORUrfVmAxYNqu/8cKbukAU7k4Xr5J4/DNoQUZwmIqxynVi+W/RqlM4EUV/R
         49Jg==
X-Gm-Message-State: AOJu0Yw3E8fnbpBhvzjisZxYBQDR2KgQKqIBUbI2ImDu1vgnvNchXCPE
	TMUQ3PL8OReJl0QiaQeyTOAeFkhTurv/3dSg30ejrgurvzl5x+lpxZt5gDIIYQ==
X-Google-Smtp-Source: AGHT+IGOPFQzDR92JPbaLzlIZmINd7ceSB06dZyb4vu4bdqgz6NHoI1NwRh9nQR+0y/T4/8AO6Q5DQ==
X-Received: by 2002:a05:6e02:1b03:b0:3a3:4122:b56e with SMTP id e9e14a558f8ab-3a4de840a0bmr43776365ab.26.1729828002698;
        Thu, 24 Oct 2024 20:46:42 -0700 (PDT)
Received: from tigerii.tok.corp.google.com ([2401:fa00:8f:203:c7f5:2aa6:333b:bb6d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7edc8696bbbsm185197a12.49.2024.10.24.20.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 20:46:42 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Tomasz Figa <tfiga@google.com>
Subject: [PATCHv3 1/3] media: venus: fix enc/dec destruction order
Date: Fri, 25 Oct 2024 12:46:12 +0900
Message-ID: <20241025034629.660047-2-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
In-Reply-To: <20241025034629.660047-1-senozhatsky@chromium.org>
References: <20241025034629.660047-1-senozhatsky@chromium.org>
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


