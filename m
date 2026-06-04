Return-Path: <linux-media+bounces-63741-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CmClFogRIWps+wAAu9opvQ
	(envelope-from <linux-media+bounces-63741-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 07:47:52 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EF15E63D13A
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 07:47:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=oEBePjpB;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63741-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-63741-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F2A7E301DD90
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2026 05:47:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D80F3CA4BD;
	Thu,  4 Jun 2026 05:47:42 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dy1-f196.google.com (mail-dy1-f196.google.com [74.125.82.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 057CA3CAA2E
	for <linux-media@vger.kernel.org>; Thu,  4 Jun 2026 05:47:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780552061; cv=none; b=pCA1OFav5QhjrncrcfjukCtntSnaHw1s010GmVz9N+ozQ/v6T74limSfNHk0ByWe48xVup7nwsuPgQSvwfXW5GOrOKT2TlUQfFqWgnFgX6KhQQjuMq9fDN6Tk6kzM374j6EpXSg6K4ULYRv6DT9QXpRx5e9UwMAG/UbcaLT2Lr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780552061; c=relaxed/simple;
	bh=tk4ZTLSpuBV0vLnGQm6/ub+TQu7Nzn9oYDC4nt7dZQk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=niRtS4i0QQA10SzE88ShCb5SQimNAdDYOM0tQDrGfQ69O1Br1A89UmH5uuO+cBQzld8mIfk9PjopkKaz3CrXS9dGjCqmLlt+jSgRQAFbCuhXkzhHegEGplQfz8NDcyp3GJyGoztjFKM79d6U2uEamziR9B26+frADzXucrX1z9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oEBePjpB; arc=none smtp.client-ip=74.125.82.196
Received: by mail-dy1-f196.google.com with SMTP id 5a478bee46e88-304e83724bfso321952eec.0
        for <linux-media@vger.kernel.org>; Wed, 03 Jun 2026 22:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780552057; x=1781156857; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IDh+0mmq2ElVGPP6otq5g/wG5tXqB5OPCZKxXb0oguQ=;
        b=oEBePjpBofeiZ/bVIHOgXUzMV0eaD1P52ppCE+JAzC079K382LTBAUcXjn2mzb4zZU
         4CMtPbo6VOP7IIw1itbuxh4j/wC+KzmF4GhwZRnBwKn5yfYlXmmmBtfm6LdQxlfzRH+r
         l/Z4MktgoXf5ytvxX2DCRNVlspJtQ5KE1vdY/ubnX4+vYB6hdp1BO237dRw1L3/Ss8KZ
         XtlmlHBw0dt26X6ZposJohTVCoMs8SiOfZU2Zc0yZVhHuxyYysyC4/V0hG3egWLtVgHO
         cD5Vcbi6b6MWp0HMfMF5B5+URnnMklRGLgnz6N6lT7z4szdOYqZBKg9cjDfcdDocYGf8
         QMvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780552057; x=1781156857;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IDh+0mmq2ElVGPP6otq5g/wG5tXqB5OPCZKxXb0oguQ=;
        b=qdjTFfc+iWAcADzNDFf9z4ZBudQpaUQfHFMKk/vIGX+PVHNERHDCwc7/rh8TGaiWC+
         GC8Ar2wFDv5Wzpu9V6ap66Hq7NucRrJpAg357ixzfxetDYOquh3U8Txx6iBfqUTZhiA6
         F3aDZMMs/tWLmxcjAyl7GsEBlBRpXtpFcVRiJIc8VHuTtB6O5nsajwuuvR23YCcP+tZ7
         MBWegY/6RGS+2TO/kz8Pt9KcxXliIOfWYp6nn+VJZjTR1ARuOGVLhBa/PSFUqRjLEax/
         K+lCUPnpjAXZIPaOLNYKocXEbolLp//GOTxsBb1daSOgt6wPQqxH+SBRf3kWK4EK4Htv
         U8tQ==
X-Forwarded-Encrypted: i=1; AFNElJ8cQzJz/VKx0avZL4v99bb6/TSf1sOubNnT4ptUaUkUNC9U7lI73Ve+TTit9oVEWRVuWXkrJVjsVvB++g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6UhOojEavMPJRNx1vjZg/JPsnAmqn/oHxDJ+0JUb4IUCTKA0j
	8jbejb9DJEqYasbJS82YortScsuhPP6ieTNWVGgN037AXMR26W1BoD4i
X-Gm-Gg: Acq92OHryDjhzo9zbiIbnQJI/Tv8U0NnxRr2B2HVOXSnFhn/uFRCZ5W/rmyQzgRkXE3
	X3v7yoBCZzgF3PjaSvlCW/IAJR5yn/1elhVlTMIEYgyAhur2CG/gSTeWjtS9phPnwOWxWiOCLb/
	WZ5PLiO2OrpZKJHngFzJ+E8SQ5HtTdIMoHZ2KHICtMEpC+zVKeuxfkAsMIsSbHEmlFHqFa+yin8
	m+OsIW4xedsjrNASd6rD38MmAS3bpafHQvqnG4ck5REoQMD7qp61FqCkL/jmfI/pOAJdczoSQR/
	vSaSQLIWwxQIKUec+5pUUe74HB7dPqn0onfaaOxVlrrPfJNqn2itpGxYiNi8z63lFU79UDMeuOm
	jSM49NMrbFd077aMLplekfG92Gcs1eqxSQmRqDuEy5TATwo/VlWL2QbL9MoM6iD7bef3T0z+HW4
	zey2ykel2ZNf62qkoARz1KQJkxfbowSbG9Q2KsRzaRGrQG8ITzZGcYhP5MSsD3DcWpo0rvRcdR6
	irg
X-Received: by 2002:a05:7300:a897:b0:304:819f:5029 with SMTP id 5a478bee46e88-3074fa65ae8mr3324341eec.2.1780552056888;
        Wed, 03 Jun 2026 22:47:36 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074db55f60sm5565455eec.6.2026.06.03.22.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 22:47:36 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: vikash.garodia@oss.qualcomm.com,
	bod@kernel.org,
	mchehab@kernel.org
Cc: abhinav.kumar@linux.dev,
	stefan.schmidt@linaro.org,
	hverkuil@kernel.org,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH] media: qcom: iris: cancel sys error work on driver removal
Date: Thu,  4 Jun 2026 05:47:08 +0000
Message-Id: <20260604054708.42426-1-dennylin0707@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[linux.dev,linaro.org,kernel.org,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-63741-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:bod@kernel.org,m:mchehab@kernel.org,m:abhinav.kumar@linux.dev,m:stefan.schmidt@linaro.org,m:hverkuil@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dennylin0707@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dennylin0707@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dennylin0707@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EF15E63D13A

Cancel sys_error_handler before tearing down the driver.

The delayed work may still be pending when iris_remove()
runs. Since iris_core is allocated with devm_kzalloc(),
allowing the work to execute after driver removal could
result in accessing freed memory.

Fixes: fb583a214337 ("media: iris: introduce host firmware interface with necessary hooks")
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/media/platform/qcom/iris/iris_probe.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index ddaacda523ec..1a740542bc81 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -192,6 +192,8 @@ static void iris_remove(struct platform_device *pdev)
 	if (!core)
 		return;
 
+	cancel_delayed_work_sync(&core->sys_error_handler);
+
 	iris_core_deinit(core);
 
 	video_unregister_device(core->vdev_dec);
-- 
2.34.1


