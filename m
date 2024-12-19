Return-Path: <linux-media+bounces-23761-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E259F73FE
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 06:38:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BEADD16B9BD
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 05:38:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E417C216612;
	Thu, 19 Dec 2024 05:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TXsXHTEZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F0A2165EE
	for <linux-media@vger.kernel.org>; Thu, 19 Dec 2024 05:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734586663; cv=none; b=hKGNEhgJ0IPtChbtAXSQQLAICRoQ4kerQuRHCTgM/VP8SPn2Po7OF6GsGeXXasv+bnf6yLMmMZ+ZsKR16ZzyWzo8CXSo/5ORGcYdC/b9+9qpBG4obYbKbthutYeTIf4QdO60k8PO0XECZpWvmG5SQsE9a9aCmOVH5gti82LRpH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734586663; c=relaxed/simple;
	bh=dMFCoKl8j4FH/8eXlAGGgiy7+lrqgUrPx0Dr/aA22A4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hvDkWcLZ0bbtOaoCiWqE86W0baSyhgHoKOiqrtkAzvQf/0/Dn4KEgxaRSuQSr2ZdIqO9P5619u1QXMaUZh80uw0YHs+LCToQZAnpCurs/8rTj5qgD4H+JoX3ulcLup1dyqNZrE7peo9Ij8TnGu7UDvsQA64kudE52h66icaifII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=TXsXHTEZ; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2ee67e9287fso364731a91.0
        for <linux-media@vger.kernel.org>; Wed, 18 Dec 2024 21:37:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734586661; x=1735191461; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Wn3NJnLnCIIAi7YjcEiBCUAPAzdJ5Obb2vhkb7cmKA=;
        b=TXsXHTEZz+8i8rlCA6mEodWfZgp7sekmG6yUql24RbmXIgWQ8PNMVpyPAEkouV16XM
         fCc0JgwHvWfcyy9uQj2Fw9rNNTSZ3vwZufvR+apV9z58U3GvnjwgeRzyek48BG0zjoa5
         8LvBBDcR9lv2v+byxz/ZlF4tPwJl/By0R54lo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734586661; x=1735191461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Wn3NJnLnCIIAi7YjcEiBCUAPAzdJ5Obb2vhkb7cmKA=;
        b=h//BgSN4Rt5vD0oOEcDWrDE3JySb+GxeSAVakQTX2udbmH2Icu8kSO5dSXHgPdUt/O
         98hWdktDKkqPs7FqFcJD3PCBhYynruBgxzuHsk83S5/qS9L63QbhLHWw/n8y0cQN8wBC
         L864ztXhxQ7BwBBGHua9E+diCZYPCexqP/k/bmASfp6vyCfc99IMeh6JQURQSGTRHj3W
         L4CVZyYo7L0ztPRMBCeF1zdgXE7qTTh1/SaNzmkQSP+rHrq7PtdZZUI/L+hZIiyL2rMH
         mCCOUf9xyE0YIBb5GxdR2e8Q2/Ag6iZv/Ae5FemBOZFLJzbHNo/xGxXVpdWCrdaM0Fbs
         QFAg==
X-Forwarded-Encrypted: i=1; AJvYcCUvnhGFI6dyXdwbjEFYkKSFU5DeqBjJLj6SdO5yVOUPjF54xyKUC4wTPHkTEvUR1nZDPKXbORKOVV+Z9w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwdMWCp6wx03DyjtTczeE3cRvtX9N9jtvfgdqpYUnX4Qm6Np3gW
	iyn0KtxpYHPdUwlt2Ajoj0QxxDw87E/ZNs3OUB8lz0vHrspBDlcqt951mIsWpA==
X-Gm-Gg: ASbGncsW2rWKIU9P9xNemfYH+5RjXpB7Lh+i9mVcF6jFW7u2Tv6h4cCtnGMndWtoPhn
	AP6mitEK28vXV20UxlvUNRqXOh1Znr/e5pMfcU8V0zJ/stf1Xp+wuhn6fX7KwSPDPFh54Hx4HMi
	DN2emfvI/8ceBU+OGac5FTPoxWR6MAwdvOTLdoTF6KQvJda+NNtCnyaKmahdrnI/NU1Z35Ltoxw
	VQa7NfPvmFLxCvCU5iwo+KbTwNJ7R2euCXwUQ14uoB2yxDq9Zj9D3em2Cc=
X-Google-Smtp-Source: AGHT+IEdvG+uasdZ1W4PcxNqxIKk8BfTf425UpPmgcIcIOiA1ibN8Q8K9PclAPCzYtQpJKJ0kK7ElQ==
X-Received: by 2002:a17:90b:1b48:b0:2ee:c9b6:c267 with SMTP id 98e67ed59e1d1-2f2e91e1183mr8717990a91.9.1734586661136;
        Wed, 18 Dec 2024 21:37:41 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:5479:11c3:e91d:de6b])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-2f4478ac7dbsm444615a91.50.2024.12.18.21.37.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2024 21:37:40 -0800 (PST)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	stable@vger.kernel.org
Subject: [PATCHv2] media: venc: destroy hfi session after m2m_ctx release
Date: Thu, 19 Dec 2024 14:37:08 +0900
Message-ID: <20241219053734.588145-1-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
In-Reply-To: <20241219033345.559196-1-senozhatsky@chromium.org>
References: <20241219033345.559196-1-senozhatsky@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This partially reverts commit that made hfi_session_destroy()
the first step of vdec/venc close().  The reason being is a
regression report when, supposedly, encode/decoder is closed
with still active streaming (no ->stop_streaming() call before
close()) and pending pkts, so isr_thread cannot find instance
and fails to process those pending pkts.  This was the idea
behind the original patch - make it impossible to use instance
under destruction, because this is racy, but apparently there
are uses cases that depend on that unsafe pattern.  Return to
the old (unsafe) behaviour for the time being (until a better
fix is found).

Fixes: 45b1a1b348ec ("media: venus: sync with threaded IRQ during inst destruction")
Cc: stable@vger.kernel.org
Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/media/platform/qcom/venus/core.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 2d27c5167246..807487a1f536 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -506,18 +506,14 @@ static __maybe_unused int venus_runtime_suspend(struct device *dev)
 void venus_close_common(struct venus_inst *inst)
 {
 	/*
-	 * First, remove the inst from the ->instances list, so that
-	 * to_instance() will return NULL.
-	 */
-	hfi_session_destroy(inst);
-	/*
-	 * Second, make sure we don't have IRQ/IRQ-thread currently running
+	 * Make sure we don't have IRQ/IRQ-thread currently running
 	 * or pending execution, which would race with the inst destruction.
 	 */
 	synchronize_irq(inst->core->irq);
 
 	v4l2_m2m_ctx_release(inst->m2m_ctx);
 	v4l2_m2m_release(inst->m2m_dev);
+	hfi_session_destroy(inst);
 	v4l2_fh_del(&inst->fh);
 	v4l2_fh_exit(&inst->fh);
 	v4l2_ctrl_handler_free(&inst->ctrl_handler);
-- 
2.47.1.613.gc27f4b7a9f-goog


