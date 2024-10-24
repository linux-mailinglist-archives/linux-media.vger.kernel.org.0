Return-Path: <linux-media+bounces-20159-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84DEC9ADBF7
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2024 08:18:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F719283F8B
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2024 06:18:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64D3C189BB3;
	Thu, 24 Oct 2024 06:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="caaqhoYP"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC5B178362
	for <linux-media@vger.kernel.org>; Thu, 24 Oct 2024 06:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729750700; cv=none; b=s3Fc+MVupdbdbNNn/HBwxl/yqZZbHs+q0V5EHn0HMVCWMZcWvi1JjFoH/94qT90APppEFGD8NzZd7Csbs9ejJOLMC4npEo4DPMIKQ0hO4cKwGCH5J7EdUoZXAj+KEctUnjulXn3docFt6l16+bQiBwZGmsmg4E26ki0+hkpTgJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729750700; c=relaxed/simple;
	bh=7z9sHxgUCVQsKNY4lmElaeG64+AQ4cWLqv6Rm4s1p+A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dq36kAfKQPUPIUpEUkle8NuKVfMHyx9WPydN13CnnQA1KX184vdhiNnLzEcvnitrF972hfqaDrYeZVcWk1EuLZxr/S57Zf80MjQB9KPDFXaXalzZmVG2w2mVZ70pcrLuz3NApg4dQ+ry2/VqtxEPM3ONhiPQZnTneVpD0aPnru0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=caaqhoYP; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-208cf673b8dso3954175ad.3
        for <linux-media@vger.kernel.org>; Wed, 23 Oct 2024 23:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729750698; x=1730355498; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+19Hn+S445I40H+rmXiB2PRnlZs/Gsckku970IfQUmM=;
        b=caaqhoYP0Wev1FhzaxoPs8PJWPqMZNiOihGHddvy/KeAjreAp+1+K/BryCooDTLmPS
         jthhkbY3OFQH5w+D1u7bm0aC8Jx301L/oJo1NeNvXQegYXgmYesUFck8KYg1Br0SwCAU
         BbYfJJmztELdq5QOOmMowo3TDTpPW0yaXGb2s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729750698; x=1730355498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+19Hn+S445I40H+rmXiB2PRnlZs/Gsckku970IfQUmM=;
        b=Jn2S/jrLQf7i3UW+Bb6prWcpsztz0305P0avNbSQZ+v0CxjTBRrulcwZ+5BmIPzzrY
         SNj2/n/9e69RaGDRqO7TJ6JtDnbenDhhYxfNjUN3HLyJF7jvwyjfmpPTucMhwLUYfMHr
         aMPi18jMXpdIWJFXSN1UjTV1BTBWKMMSY0VxkrFsnpW0YEfvLRzvMQJaqrYIpx9gL7Bg
         /mazqPi3p/9mv0nsGO2NzHKBAlFPdOmPBWsZrDei0GBn12UPpQe35Pkg6KhqsUXbEq3l
         TiOlzoCXGr0l0fYoUVsr5/w1aUKiywmH2dJUlVTUyzMTg1BnCTZ4xA+sYdqkNTYkMy4L
         gOqg==
X-Forwarded-Encrypted: i=1; AJvYcCXCHnzFtcgwpeIbgvmyL5qT05xuBtY32KMUmwr7RptDM3FQIgccCmgtjbjtwCFCDW6s4YQfuLr2oEgiwA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwgQf/ajhHw5cisOogC38kgIorQWlD7OxkSiL7QPxgiEv0qs4/4
	/fd1Csx5OpSboB0kXGmLKUEUTqd+rDV0yOWk8SUwCTrzjMtZzoTd3qzPUUUD6A==
X-Google-Smtp-Source: AGHT+IEsNHH0EoO6f5BiY/wXlSMMNw525wj+rM1OLWKEmamuWM7is6+1JYX7vZrU540bLU4VLMEiAg==
X-Received: by 2002:a17:902:d50c:b0:20c:f27f:fcc with SMTP id d9443c01a7336-20fb99eb524mr7690235ad.44.1729750698382;
        Wed, 23 Oct 2024 23:18:18 -0700 (PDT)
Received: from tigerii.tok.corp.google.com ([2401:fa00:8f:203:9422:d958:f749:9a30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7f0bd561sm66418885ad.179.2024.10.23.23.18.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 23:18:18 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Tomasz Figa <tfiga@google.com>
Subject: [PATCHv2 1/2] media: venus: fix enc/dec destruction order
Date: Thu, 24 Oct 2024 15:16:57 +0900
Message-ID: <20241024061809.400260-2-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
In-Reply-To: <20241024061809.400260-1-senozhatsky@chromium.org>
References: <20241024061809.400260-1-senozhatsky@chromium.org>
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

Suggested-by: Tomasz Figa <tfiga@google.com>
Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
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


