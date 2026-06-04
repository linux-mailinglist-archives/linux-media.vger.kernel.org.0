Return-Path: <linux-media+bounces-63736-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /H+qOo8HIWoD+gAAu9opvQ
	(envelope-from <linux-media+bounces-63736-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 07:05:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 639A363CE54
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 07:05:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=dQFRWz5L;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63736-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63736-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 948723036728
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2026 05:05:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE41E3BF698;
	Thu,  4 Jun 2026 05:05:10 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dl1-f66.google.com (mail-dl1-f66.google.com [74.125.82.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B30973BED33
	for <linux-media@vger.kernel.org>; Thu,  4 Jun 2026 05:05:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780549510; cv=none; b=ngeZSZPQXYscClXqpLPO+VyhENgUeI03j5LVsGxIQyEwDwBsIlK9Ix6Iz6wmTvX8ysAABHZOYWX+F/kU+BZAIN5wtgBFF3U3IuB+9GLqfWwd9VXIjmbjk3mIjeSzEMoBoSaGjaBs8MNgO+PI/y2l/87T3mMsCpvfvb+DeaeuOaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780549510; c=relaxed/simple;
	bh=dnE8BdEu8D6gluVtEh00lzqRho0kzmkfQZU+gpm7No8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=G8tu5Vl7Nk8sp5jcbv51hohBwYaB61QNDG4ZJYUAGW5T2T6518iFZtCSQGUC/TjYQRgdXCD08XagfHPFkklxu+py/K197+i/Ldz31XMYDsIMzr98f+xG6x+zaGaYAlhfB6YeqWlV8ilaEbpuZe2bUPkulCJee6oLs4g5qoKnRI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dQFRWz5L; arc=none smtp.client-ip=74.125.82.66
Received: by mail-dl1-f66.google.com with SMTP id a92af1059eb24-137dd51129bso851624c88.1
        for <linux-media@vger.kernel.org>; Wed, 03 Jun 2026 22:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780549508; x=1781154308; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=06B6FokD6dDE8gCXlJmq6IxYzkOZd47THRDOzv4mUrA=;
        b=dQFRWz5LmH4WzaegObCPZpJL4piG+gjLij9VabRjLp7CbIjow2VByaj/nUJkinqTpe
         3FB6D9ufT2pUv4KZ1Sxlq1X4Rv4kiiD9Y7Xz17b58N0JPTIUJJc54IIc/EmJJNcy37hw
         Yq0RRbgFHhi1EBpxz/LnOsBSuQT8gDjiljXE/qb08Vir0UQwY7T4K7J3v3Ayv/05ZreK
         kyGPdaJO9sIAzC7IknWFOM1BGB6jhvf8OxfvLMv/DPtPo1ZVC0iSBMzsgEySsoQF3PcK
         quR/LRfG/LgAJqmHkC4JcLeZ6U3S8zWF0o3N+qF8lkpJJdWguHSYQVrWknOnkMwE28ar
         cMIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780549508; x=1781154308;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=06B6FokD6dDE8gCXlJmq6IxYzkOZd47THRDOzv4mUrA=;
        b=lHpE2u6IqOQVbuhSSwjhUGG5S4GvRX6N5r+jhW4n6GX544zKe8w0P2TG9VthrUDwGI
         DpcuZiQPymSXceGns1kZtOdxSC+KbszgP2lEg3cqKDsuAvVS6iGKmdacWBA5e/K1un9S
         X8mTXyoEpQsRnOGb9jwO6wf9kyHYjOJH/NjFao0Mw1DnYA2xdocoXrv+WcDqw0GnkOK2
         e2QxQ8nQVm72Hsi/p7a/80KCMgiFciZHODQtxqsp7yyMFr8EzJ5kvy8GVpM5REBFpqEi
         mrOQDYnmySNkE//r4WYAoJ40NHerMlIxaXZo43jMR7uTsNyGyumPkhDsp53AXHwzZbvv
         53uQ==
X-Forwarded-Encrypted: i=1; AFNElJ/NQGHAYTP911joN45bCucBe2AzI5Uk+3cofbFHMV0MkxaD8Aodbn6Lza5IfaSs2jPoNjhlym8Cch/tLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyE+YP2nH0JoQEnSaJvoC2uMChd/yymA4J0s2fkcb4fB1tVnGSP
	pJ5896Omf9wS+GWGhpBDKyqOqzmZO7ayuOVmFEdQZJEt9E3mluKbG2L3
X-Gm-Gg: Acq92OEO8rKcqHuVfHDWXucvuJzmfPw21KgXd8DrVn5KecZBX0M84gQsGOnWikpXBzS
	f9vT0DWT7XwY23Xur88+24viVD4o2m8k7g/zp4EZ0FpovvAeqvPmz3vgtHs5iRRJq/jlbxJjDTx
	NgvCXmoyGdUWI4LTMG+498On0Q8QZx8YnIM3nXAwElDdql/L6VODE7+XLcMH/XO3ZWYylziXpny
	53xkt6UC7K+hQBALsOPJWwaLvRN+J+B9GEE1lQH4tQZ3Ua3l9PtCglVSq7WznZ6F+A0FdK2J+8N
	o3xewtfpi5aKovXTw/hvEjcE/zriWCF8dQc7vwIw0VFDHMm1wgK6VNmtzk55bjyEMXOBpS/V7tV
	uBGt8YzV3yg/sowIMgLKFXXDTqnblfey89/V2kpFUrWz2C3tv1KdkOls7x4kw2Sz/c0YXgQhIHp
	6/LXD6KaQ6m/orkcEq+tkBkToUA/vp+FSj95WWPKE5fMFy7Yq236yKYKVtXmpc/urJLw==
X-Received: by 2002:a05:7022:43a8:b0:137:f995:df25 with SMTP id a92af1059eb24-137f9a52465mr2528386c88.13.1780549507751;
        Wed, 03 Jun 2026 22:05:07 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137f5550bcdsm3414240c88.14.2026.06.03.22.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 22:05:07 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: vikash.garodia@oss.qualcomm.com
Cc: dikshita.agarwal@oss.qualcomm.com,
	abhinav.kumar@linux.dev,
	bod@kernel.org,
	mchehab@kernel.org,
	stefan.schmidt@linaro.org,
	hverkuil@kernel.org,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v2] media: qcom: iris: handle runtime PM resume failure in core deinit
Date: Thu,  4 Jun 2026 05:04:51 +0000
Message-Id: <20260604050451.41583-1-dennylin0707@gmail.com>
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
	FREEMAIL_CC(0.00)[oss.qualcomm.com,linux.dev,kernel.org,linaro.org,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-63736-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:stefan.schmidt@linaro.org,m:hverkuil@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dennylin0707@gmail.com,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 639A363CE54

Check the return value of pm_runtime_resume_and_get() in
iris_core_deinit().

If runtime PM resume fails, skip hardware power-off operations but
still perform software teardown and state transition. Also skip the
corresponding pm_runtime_put_sync() call to avoid unbalanced runtime
PM references.

Fixes: bb8a95aa038e ("media: iris: implement power management")
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
Changes in v2:
- Keep software teardown and state transition when runtime PM resume fails
- Skip only hardware power-off operations and pm_runtime_put_sync()

 drivers/media/platform/qcom/iris/iris_core.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_core.c b/drivers/media/platform/qcom/iris/iris_core.c
index dbaac01eb15a..bf3c7f722490 100644
--- a/drivers/media/platform/qcom/iris/iris_core.c
+++ b/drivers/media/platform/qcom/iris/iris_core.c
@@ -12,18 +12,24 @@
 
 void iris_core_deinit(struct iris_core *core)
 {
-	pm_runtime_resume_and_get(core->dev);
+	int ret;
+
+	ret = pm_runtime_resume_and_get(core->dev);
 
 	mutex_lock(&core->lock);
 	if (core->state != IRIS_CORE_DEINIT) {
 		iris_fw_unload(core);
-		iris_vpu_power_off(core);
+
+		if (!ret)
+			iris_vpu_power_off(core);
+
 		iris_hfi_queues_deinit(core);
 		core->state = IRIS_CORE_DEINIT;
 	}
 	mutex_unlock(&core->lock);
 
-	pm_runtime_put_sync(core->dev);
+	if (!ret)
+		pm_runtime_put_sync(core->dev);
 }
 
 static int iris_wait_for_system_response(struct iris_core *core)
-- 
2.34.1


