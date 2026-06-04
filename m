Return-Path: <linux-media+bounces-63751-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id D3tJOm4gIWpt/QAAu9opvQ
	(envelope-from <linux-media+bounces-63751-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 08:51:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B1AA63D599
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 08:51:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=JJvJjW8w;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63751-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63751-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 49CC630347C5
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2026 06:50:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A298E3CC7FB;
	Thu,  4 Jun 2026 06:50:18 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dl1-f66.google.com (mail-dl1-f66.google.com [74.125.82.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C0E3CC9E8
	for <linux-media@vger.kernel.org>; Thu,  4 Jun 2026 06:50:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780555818; cv=none; b=hLBGvQfvgvRbRMKILcJ/SpUGy8v3FuAzO3JPbLlsi35soaWCgaezeFUjW/Nx1BXG4YrL1iFuPGQ9q71vIYGEPUAkyYL+3Y3zF2IkeFzo9BfjT7QR7jyLRbtUhofMsy5SNel9aLtv+ngfVImyRECEbDFY7KeQHHRIJ2cT7U0xdBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780555818; c=relaxed/simple;
	bh=+Ly4pYV3+TJcfbNfIE1LR83GXUcV4sFL4Pbtrp10kBU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=b9R5PF+3efd4JzjkSQ81Vi/r1vUCEGEwFXD4ahOQGOx4AgTcY9elGeDYciGebxceFOA/+h/Ts0zgnYHI8Rh0QnkCis3guxslxU1aJX2ilSsSh1qdTzkm31ayXDaPT6uEgVkcQqcP+h7stoaGkl8ttzloPzVUXSY+uxBGobbOYJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JJvJjW8w; arc=none smtp.client-ip=74.125.82.66
Received: by mail-dl1-f66.google.com with SMTP id a92af1059eb24-137f0aa125bso982831c88.0
        for <linux-media@vger.kernel.org>; Wed, 03 Jun 2026 23:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780555816; x=1781160616; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s2BtRX6nWtdx+uHNReHkv6D9mlZBbHexReuAALl41Kk=;
        b=JJvJjW8wVVAftXF1iPleDSINC8QxFGIIfqeGejV/WeHIdqNf6UKegaVJomSIB1K0ac
         uwX3XL36eUc5gNqL647Tr0d85LbXE0iP/zOinHwrg7hjS8ZHu9LnluPjPXd5oUUSNkVL
         VXvGgQ/0lEVtcERKFfGmf6cN2qvCkpMW29gmusHxz3bV/ofrwgA5dVBtXiA6M2+5KLbI
         nBrAuvAdfCKXHkdUUQLcrtu8cnB4kw5GU50yIxZi3yEl/JRjdDW92oj/mCrfb+SB7IUe
         9Gz6/7Mq18SNsVi78E9jTy0AyQ7s/+15qr4kiJtKQh7AGi3M+6mcYEW7YxMG1JMLP8nP
         KYsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780555816; x=1781160616;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s2BtRX6nWtdx+uHNReHkv6D9mlZBbHexReuAALl41Kk=;
        b=kk0idEu61vB8vyaTbJOvHGLgGa2Ky10luHP1ZcJ+gtDuI60oTO75BtYoTRcKFi4iq+
         bKWsyABndKRPHmxx9VV9fN/pCDH8uP66e0FaRLoA9mWBCgzbxJDGocHJu3YuObiDWFCn
         0Ge8d81Pp4JtyMaBBlSoJk+G9CJup70ruyCZUY1j5T4IjdTOkVmUQ2LI8BcLuXiSYgmi
         mAtc5zxXZSD6Md/E+Ujc2YBCb2HltqtJZ+Y77G1ctSPqtMKoJKkbl23hfwikehwPzrax
         8nKPLDvpyw9GjyAq4iZJxDQgNJjx0O4EUSanl/QI7cfvR7svofir6qzGAQuM3Fzw2ETv
         O1Hw==
X-Forwarded-Encrypted: i=1; AFNElJ/y5pc+rxujfh04ogGKmiN+RjaLPHorVCqQWuRVnSiII8ZKA6/wlBXUX+Z+7TZjlMbORsttMv1OT4L83w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVWmHugjo+yAJgUDJtYGjJ9/5FZBVP9jE2ADNecF+ccjL2INui
	VRJn8J5rKUSnJGMrQHOJAaWdB6g2zHrZt451MmZ4oXswaan8wnorgHvdwZZzWpi3
X-Gm-Gg: Acq92OH/ffMJQesiU+uctI9BgbZc0I3k6eCLPefC6tmuRdZHQkQuH83QF8hIx+WnBej
	DBooPO6jl4xE1vPQHCsxzHs314bKPX9j7oCnxb6QjlQXWm1QrAeK9WBvtWrueLPaLb8fQh/U/AJ
	zUsXXRL3lN6RPCWBDdLh1qjD4miZyTNWRKNaAEesMAh1g/RwSfyOFX429J+q9Lom7RMCAeak5dW
	4J1VkvYSzk/6JKuMlhyEjjoeoWterQOADuSc6O8yahaSLKycf8KtjARi3sPkxe4DP81miK4LF9V
	zI7rOPZl/jto8wvfETbDWrUj0WVIXliYUOvzH24l08sYjJ+SCgugrNDyQs1oN3+MY5UuAMhDkAg
	F53MsK4TCT9MnLLLDVTo3+MQ/bm1DP7z0ij+Be3AsKWkZmntXsorOlVk/0E2zgvOLmmU2ubAVwn
	L7JmKbeVNM4fNwhQnWVSkjolzSpRhHofY9CgPs6TrZcMngo6UqBdfSnHxu4HM1jfAg6cC/5Ssfb
	BaV
X-Received: by 2002:a05:7022:117:b0:137:f49d:3388 with SMTP id a92af1059eb24-137f6bbb075mr3161829c88.21.1780555816143;
        Wed, 03 Jun 2026 23:50:16 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137f5539432sm4109780c88.9.2026.06.03.23.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 23:50:15 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: vikash.garodia@oss.qualcomm.com,
	dikshita.agarwal@oss.qualcomm.com
Cc: abhinav.kumar@linux.dev,
	bod@kernel.org,
	mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH] media: qcom: iris: guard IRQ handler with runtime PM check
Date: Thu,  4 Jun 2026 06:49:57 +0000
Message-Id: <20260604064957.44597-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[linux.dev,kernel.org,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-63751-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dennylin0707@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dennylin0707@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dennylin0707@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9B1AA63D599

Use pm_runtime_get_if_in_use() before accessing hardware
registers in the threaded IRQ handler. Skip interrupt processing
when the device is not in use.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_common.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.c b/drivers/media/platform/qcom/iris/iris_hfi_common.c
index 621c66593d88..ffb2e65f90f8 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_common.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_common.c
@@ -104,6 +104,11 @@ irqreturn_t iris_hfi_isr_handler(int irq, void *data)
 	if (!core)
 		return IRQ_NONE;
 
+	if (!pm_runtime_get_if_in_use(core->dev)) {
+		enable_irq(irq);
+		return IRQ_HANDLED;
+	}
+
 	mutex_lock(&core->lock);
 	pm_runtime_mark_last_busy(core->dev);
 	iris_vpu_clear_interrupt(core);
@@ -111,6 +116,8 @@ irqreturn_t iris_hfi_isr_handler(int irq, void *data)
 
 	core->hfi_response_ops->hfi_response_handler(core);
 
+	pm_runtime_put_autosuspend(core->dev);
+
 	if (!iris_vpu_watchdog(core, core->intr_status))
 		enable_irq(irq);
 
-- 
2.34.1


