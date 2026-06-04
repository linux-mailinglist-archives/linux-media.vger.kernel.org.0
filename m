Return-Path: <linux-media+bounces-63699-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Jd4OJU3CIGqM7gAAu9opvQ
	(envelope-from <linux-media+bounces-63699-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 02:09:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D42DA63C002
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 02:09:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=S7XC5xPn;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63699-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63699-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 90F453033D2F
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2026 00:04:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57E9C1DFDE;
	Thu,  4 Jun 2026 00:04:38 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dl1-f67.google.com (mail-dl1-f67.google.com [74.125.82.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25C5C14A
	for <linux-media@vger.kernel.org>; Thu,  4 Jun 2026 00:04:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780531477; cv=none; b=ldSpsHJifSvurnhB93gEnKc5LmbKkgGRzKaN0iYivlvwoiEWWLEOTZzYqdWfmlB/vZsW0P3h1ZHwnQCNkntycoeJEDqvsFGaM3I+R+nqPob9FGDFbM3Qf3QCxb4ES0xFxzh50Qt5mD8qI3/paRdl2HvqjIwZQNvWM4xs8c60LPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780531477; c=relaxed/simple;
	bh=sUtwdzI6Op7SWh5I8V9HQ9/AfdxkQf244p6czHwyqJI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tM2aHiY6vJ/maB35CDqbZSBiMUAHDMI6UdmRPDOefqGcudD6kpCSSu4d82ERqYrpSJoDRgIbMPYgRJgCSiEYKqzMPFgCbFLoaYn7pNCkrQuyt2AdNuDWV+iV6m4e36FQPvbyxpz5vMm8czBffc0TBIGwo/Ynk+SN301IPD5zGQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S7XC5xPn; arc=none smtp.client-ip=74.125.82.67
Received: by mail-dl1-f67.google.com with SMTP id a92af1059eb24-137f18f45dbso94826c88.1
        for <linux-media@vger.kernel.org>; Wed, 03 Jun 2026 17:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780531476; x=1781136276; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ekbew6l2pxhPys6qdOCmqveSwR/YfCxmHaQqXJh0Rh4=;
        b=S7XC5xPnwl+4gyrbb3EJpfGQ87KorLt0lZ42POzDnGvWdCaptdKU6b/sEBTyrTf7D5
         1wpvTvEXotB0GhLye7pJ7N4jZ6a1N128QsLrdxFg+pw1jP82p2y6ADB8BUauU4WKxsZD
         mbLkAOk4idF1EBHF59N6T9xGn/vC0n1geeqg+yJE3xxcMvL6QeL7jVAG1uhc7cJ1MJYd
         lzamFEskgxSxhbIavChCVbS8z/+P5C9vYbbEG4rNOxmoCdtyig3WYBGqCa7L/z1wLC/N
         kkFkvaTivyUWUYrzkXrTxBB6DpjQ6Z9ol2HNK240h7IjC9BIZMY2jyO2H9v4mxgVTbZg
         xu0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780531476; x=1781136276;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ekbew6l2pxhPys6qdOCmqveSwR/YfCxmHaQqXJh0Rh4=;
        b=LyiX1KyFBqiYbhry6T52w3y+SZ+5n97F1bdmmljLLS2kqXE2DEKpoFeLIW5g/bbV4O
         TLvoXAs0XSZKpV/32c4zmLv/1GmrR5OKh5Tohdujxjnyur/qH9o333JHAvMFE0KLd4hi
         +HDjCrEb9105Lpqy7amG8NQZS0lU7WlKMmXxDLUwqt+mbUWNgVIjCGFyRN8yyDO+V9Fs
         Qs41fJThrk8OazxLbX74crD244pJyglXY/p9jvmF0DKDwJle762K9h2SvvCeMSZyWQzU
         hSd3Mr2qHn8NP1hSvQmMA6VDTAZN27GSz38xMZMAQd0B3wWd0G6v0EJXi/Tgb4l4oGap
         t9FQ==
X-Forwarded-Encrypted: i=1; AFNElJ/lokMT8qmjGJX0USlGT2ceDcZ35vDh/3ZpldlKj2uksYAZBb25/bTQa6jrb+wCTBCcDuplmEE9OnmFBA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9ebI8+cEDNTbEyAhtPc1DDk+7ThQhMm5CDRpjg6nfe+aSPiwt
	HVyFvMMnLyFFH9z8Lh80c+wbnKW31A+X/mBfZKOqUc/fGlbfoqtnMgUDhHlMsDUF
X-Gm-Gg: Acq92OGa3NYntHa2KT5QeItLLQRpvzYCG8quk0xUZTbKesA1HwlaDSD+yjNUiyI1JGI
	1mgucB1PWGUg5KdqoR1esgiUjFn4/PzpfRi+/pezdPIrGvWNn8bdiHWFY+fBv61dd6bwWm/TzXK
	i1Yejfd9d784IkF2nj1kVv4CjgNSQRSA7xLY4qG1lGIL5NgBOeBC0vOXYQD98inFA0tSo0ikNUu
	6yd3GzsvOnC985gKmzOPWPAJA49iOClbwCv2V7MyG60BG4hGfPBbCf5RUDvbxktuECcsqw0lq0X
	lO2/L1LWkNhJMZMBl5iqui1ibNkXMaJNXnt2aEqHcFAwMQ+fR+7D5o/VLaDxhzWUQLAtLkCVGOR
	3SzNwwGMQjY7DIE1JxHUI5vV2f8h8ihlLxeH9d7I1XiSqsTHpB4A4dIbLqsR93z+/PV6qBVsZ7q
	kypWN6GrL9uAnqF9j6z01iKVWVVbyYz3QLaICCcJZKgUEzc9Aj4U6VlwIW3CcW8Dlqtg==
X-Received: by 2002:a05:7300:320c:b0:2ed:e14:e956 with SMTP id 5a478bee46e88-3074fc018e6mr3475682eec.32.1780531475738;
        Wed, 03 Jun 2026 17:04:35 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074df77a0asm3862871eec.27.2026.06.03.17.04.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 17:04:35 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: vikash.garodia@oss.qualcomm.com
Cc: dikshita.agarwal@oss.qualcomm.com,
	abhinav.kumar@linux.dev,
	bod@kernel.org,
	mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH] media: qcom: iris: initialize managed OPP pointer
Date: Thu,  4 Jun 2026 00:04:14 +0000
Message-Id: <20260604000414.32530-1-dennylin0707@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,linux.dev,kernel.org,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-63699-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dennylin0707@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dennylin0707@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D42DA63C002

Initialize the __free(put_opp) managed OPP pointer to NULL.

This ensures the cleanup handler always sees a defined value and
avoids leaving the managed pointer uninitialized before assignment.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/media/platform/qcom/iris/iris_resources.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/media/platform/qcom/iris/iris_resources.c
index 773f6548370a..6b22f5cc88ca 100644
--- a/drivers/media/platform/qcom/iris/iris_resources.c
+++ b/drivers/media/platform/qcom/iris/iris_resources.c
@@ -61,7 +61,7 @@ int iris_unset_icc_bw(struct iris_core *core)
 
 int iris_opp_set_rate(struct device *dev, unsigned long freq)
 {
-	struct dev_pm_opp *opp __free(put_opp);
+	struct dev_pm_opp *opp __free(put_opp) = NULL;
 
 	opp = devfreq_recommended_opp(dev, &freq, 0);
 	if (IS_ERR(opp))
-- 
2.34.1


