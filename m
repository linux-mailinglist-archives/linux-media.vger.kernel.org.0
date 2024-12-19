Return-Path: <linux-media+bounces-23760-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05AA09F7363
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 04:34:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4B7861647C8
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 03:34:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6E5E86359;
	Thu, 19 Dec 2024 03:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KxecruQX"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5037886352
	for <linux-media@vger.kernel.org>; Thu, 19 Dec 2024 03:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734579237; cv=none; b=ANP1XkBERm45c/5iJqJ33WxksbKnEvXtcU39o10hmoIrPy67gRl4ZvQjdsUbX5dRPy0MaEYHzqOwsbEPiZKzQOFyCS12EU51VjesTC/0KHnmZXBk9ReS0HELjonlw3MhsgcYJA9BYHDgVvbsfR0cMZlVFZImfT39g8w2DiLuwZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734579237; c=relaxed/simple;
	bh=qdYu2BzMyzhgJhPqn1EdSg3rwRAPDPj53HneVzzCGaI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KDIrLEn3tKEFi2cvS3ywAmAbXPeBG/IAsxYBLeDqRcF0D1AHbvdxePiMD7CNbl8yZSsas3OF4RQoFpvPLB6B+rzBfNyfaJL3PTOOLqJmi6eRfb+BVho8IZ6NaNKkQcCQdFPkpbIl3OQZdle/LPL9s+ay28nb8nDb0gyLAGzrnsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=KxecruQX; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-7ee11ff7210so176800a12.1
        for <linux-media@vger.kernel.org>; Wed, 18 Dec 2024 19:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734579234; x=1735184034; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o3AwYnmz6MD7Ja4YJt8URQU0bT2UyVpGcn4xu/YwQmw=;
        b=KxecruQX+6HqQSDMcKNcSyHUwJWV17moFqHH1gYjX6B5Xsof9qdb/p+KKauwCVk5TF
         7+MjUwfbLIS8rrbt2ErONvqEHqwm+w6GvTmXtBoBCph+RiYI5wQJfayFs9J1OERnFtcF
         4zKAv9v1Hx0BLOgBo56xllplwtBhTWgg75t1w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734579234; x=1735184034;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o3AwYnmz6MD7Ja4YJt8URQU0bT2UyVpGcn4xu/YwQmw=;
        b=Vj2ULbOj5XFbiAtwYN87TWYbHhMMDKPN8yygTRqdrIDIsm2qI+9pg28/4NpZ+WStJi
         3nzsXGqLcv4+cTlQNvlE1rdoDpfEhQ3l18XcBBdcP2tGm3Tfd0ln3u7nhfT4tdBT8XVq
         5uDzXjH6rUgGtp5P8uZGP5aMfDUX0voR1OOiwRTT06HxedOjTfpkccQwlqrjESaY09Px
         k2wGoGJlFyslz6ZTSMP7D6BJnfDdbgTm0iSmpktdv7GiYPraw6Qyy/VCE+8yJuxHvV9z
         MmY/lYEvAPhYwMTWgqM/OGIVY37wop9d7aaUfXdD0sXpZMHl9m0sAfAHoyumQO78UxbR
         ATaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXL9j/zYpLZrumTBVtmgE6NkF4TIzCWgDFGAWHoOs5Ju5ziUD210ctMe2UYbtBGAjIz7M/eZvTcOTrS7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyxXUZNQMZGczI9YsLN7LqzC0AhcEuTMjtwvlMjIXBEUWm+ZG8u
	DKLB9jkBqMVBXTELJgQfsSruxaPcM6AEGgsfwS2N3TzrwODGpK7AyrG0dw+MFg==
X-Gm-Gg: ASbGncsDJ4HYx36L36WSHd3X7Bplt7sUbFSbeTNfsc5r35B+hpTaLqQS46hc1BWgfOl
	oOWNIcPPut08TwARkPFBr6mvbWPBeGthkigTTmlREMZFgQXkU/UZ3wI6TWEBS5cgQS9mjKeRMDJ
	lKSR/AsNuZzgKXeyF/sL4pymA3H5Fg5Kt1DDCuGsIlsBRe3paeVBN4RDTaWnI6OMg6LLcgpRM6T
	tR9uE2/DPdOa5UWeJtHe2lgUfbJE6BX7KUtrqQtyh12fu7xK9R/Tuw/fB0=
X-Google-Smtp-Source: AGHT+IGqFWc3fvzI/39Qa+QVM5tyy0L+HrHcLRtJpADNMNZKdEBBWgu/m2pG1W+XhQe+ganDTFzQag==
X-Received: by 2002:a17:902:e74f:b0:215:e98c:c5d9 with SMTP id d9443c01a7336-219d9671736mr23960605ad.18.1734579234562;
        Wed, 18 Dec 2024 19:33:54 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:5479:11c3:e91d:de6b])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-219dca0238bsm2712795ad.251.2024.12.18.19.33.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2024 19:33:54 -0800 (PST)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH] media: venc: destroy hfi session after m2m_ctx release
Date: Thu, 19 Dec 2024 12:32:56 +0900
Message-ID: <20241219033345.559196-1-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
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


