Return-Path: <linux-media+bounces-24027-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CA90E9FBA30
	for <lists+linux-media@lfdr.de>; Tue, 24 Dec 2024 08:25:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF10F188583B
	for <lists+linux-media@lfdr.de>; Tue, 24 Dec 2024 07:25:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F3C718FDD8;
	Tue, 24 Dec 2024 07:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JB/iyRvo"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46CAC15B102
	for <linux-media@vger.kernel.org>; Tue, 24 Dec 2024 07:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735025098; cv=none; b=S6LXdXPXPk2ZAQZg5tpgOlLopof3hjG3rcsVPyU4O6zGRwVAlOT2h5CPQW3+Il9NLFLUOHaRz6c+5Qvwu5cdlooWUxzboyjH5Sa82EwkM98mFPTZPP73ION84qHy3pzbXQwFvV0FZRW9L57rO7cDwVMePyIHdAVeQ+6pWiRlnQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735025098; c=relaxed/simple;
	bh=9cZLG5L2vkdEDHKnH31YZBkU40Mvvp2J/3ooo59x45Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c/XZgGF8Ll6boPOFju93Qdmdp3PyLDISajDInatgdhmXMrchBiIk51rDwWBGcwxgwEQRUeO8wGxq6CxNHb8mPmkWNRLzer/GE3kM18QUoM+53dOaOA+96Jk4rL5nNaOV0ss36p3Bw8tbGaS1ILnrDWuapJ6bVj4pqdM78c4e+S8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JB/iyRvo; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2163bd70069so47791135ad.0
        for <linux-media@vger.kernel.org>; Mon, 23 Dec 2024 23:24:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1735025096; x=1735629896; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AE9nvfJslVj9qB/yCOxLUqgILFx3DJwfUeD0T7gDpl8=;
        b=JB/iyRvo9lcf0AJEefx2I49AOL80+IZ5EHaO8o+bsCBcOJvHOl2xdT/5KHUjWOOTT4
         fs4KPmi1M1JvNuaN6PlPVZCIkOYPjBcVoMpRGsffS/3yBXIcbXxnPhKOnnVZO1wTSlVj
         boKUGTExYAd003Cgpg2d/D8Gj3gngY1dmRNKs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735025096; x=1735629896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AE9nvfJslVj9qB/yCOxLUqgILFx3DJwfUeD0T7gDpl8=;
        b=KNlO0pNLxItK06dgjN9600ooUgZfluzVQH6uuQGimZ+dlNB2PFeQH9cQ3FH0wtPFmK
         Jv1najsWQ0yTFZx9Sy0MSFfHXAx3dCTsV/edWuOBGl3s4d8OthPNeXSyorvWYeTaVsDa
         24VSpcJPnRYXn6TjOOJduusAoG7p78ccscdbmZFK9KAxewRbMC4gM+XA02pfuTHEv3BM
         uQTB0c18aamjHYPYO/JLJ7OBAemLWTeBZr48N/MQ+e5KZsKms76nC5/mACrojgVXsRcn
         tGJfodaQ8GxKnBX0GeqLOrS5k4PZLLjcbcHkHnpUeSBUZiKomb+Tzbjd2t/GHYJMjrfH
         ejBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWccnvk6KHlP/Iv1OPq/Ep9E3om7J+j5VS8lTbNnmKYu1a8H0yoJ2piq37Ad4VPKwtEZmaw8iJrln0yvQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5V65xCIEUtDJ0wVGzaS4I+uIZt2LeDDgw505zFm3mJHUNuEmZ
	111r7q86msbx6JjSkHkhOlOE9eEbAfATa1pRjv/tsCMpyTsnEZ8il2LIT/+wjQ==
X-Gm-Gg: ASbGncsJB+T9UnaN7Jn6vB80qqsFSRgEebQUkGjzLJkCA66Q/8BYbkFbDnpPcU9icpl
	k6NvLcjUiR8+cHeqwnj7BbVN6p09b3ZSQlcVk+z6/SUr18OR4zrhcIySwkR27uyWrSwi+RnKYCh
	L71VVGMXnKFrxlOYf5pTlIpTO1wOV+0WkofxoXVJ5rSlTp2+Vk5/eRICHmjuCUPxCdWZPAw1roz
	ab9vBPXAcdBsWYWYhfnFUYIW3QVVlYOn2GHOcgrfYEo8ljJL439W7Z6Pi0=
X-Google-Smtp-Source: AGHT+IHKoKTL2NIALRxLrphqegLKe8K7HSq2hikZhf5VhPOyutofWJK6Rrh5cMHHc0VdChmeAIfuLw==
X-Received: by 2002:a17:902:ccc7:b0:215:94b0:9df4 with SMTP id d9443c01a7336-219e6f283aemr251758405ad.54.1735025096549;
        Mon, 23 Dec 2024 23:24:56 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:de21:da72:a349:25b2])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-219dca02b77sm84195355ad.242.2024.12.23.23.24.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Dec 2024 23:24:56 -0800 (PST)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	stable@vger.kernel.org,
	Nathan Hebert <nhebert@google.com>
Subject: [PATCHv3 1/2] media: venus: destroy hfi session after m2m_ctx release
Date: Tue, 24 Dec 2024 16:24:05 +0900
Message-ID: <20241224072444.2044956-2-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
In-Reply-To: <20241224072444.2044956-1-senozhatsky@chromium.org>
References: <20241224072444.2044956-1-senozhatsky@chromium.org>
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

Fixes: 45b1a1b348ec1 ("media: venus: sync with threaded IRQ during inst destruction")
Cc: stable@vger.kernel.org
Reported-by: Nathan Hebert <nhebert@google.com>
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


