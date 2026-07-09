Return-Path: <linux-media+bounces-67128-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IV9ELO9nT2qCgAIAu9opvQ
	(envelope-from <linux-media+bounces-67128-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 11:20:47 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DEED72ED9C
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 11:20:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=PXQX+uCg;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67128-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-67128-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C8D7830589D9
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2026 09:19:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B308B406809;
	Thu,  9 Jul 2026 09:18:43 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21636404BC0
	for <linux-media@vger.kernel.org>; Thu,  9 Jul 2026 09:18:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783588722; cv=none; b=gCbXoLG03C1KDtfvhpTvD0Ub91wgwXLy40wcMJJTP1AVSOgS2uYfr7EGFFCmbQofZa1Y7XbSyGLKJx7VX7MTUoxiyhvKVTg9S8NwqZw9Mr8AHWxJsh/w4n9cFj1wTIS4yIZYENKquBbxhi9XmWukOwtMxSm6Ei8XrzbO4b3m+Nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783588722; c=relaxed/simple;
	bh=6aXmXSq8GQYanDP78vf5EjCk51ZJZSfKqMGIqlbuf6o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rx5HDUvPKMwIk2FbtwpBs5NwVgHjhEJiTe+D02fZyoPEqqEsgTrBclZ9ozSlcWRIMEef6y7lhlt/Wy9Y+YLFleOe+cAWYmqeBZszLmdXmi6QAvMZFHzONWgPclQOx24Qkh5O4TYGxoLHwZ3SZT/VlCxnSVbFDOqYi+rH6izsFMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PXQX+uCg; arc=none smtp.client-ip=209.85.215.170
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c85b73ffb52so965169a12.3
        for <linux-media@vger.kernel.org>; Thu, 09 Jul 2026 02:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783588719; x=1784193519; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zT2kkT7n4+UHqEX9mqNgvpGllnQYoMihdqd9pN3gqWE=;
        b=PXQX+uCgBTV3eKOiLdQLO1mqc6rmS369AFb5LzDua889t6+JOnWlO2Y/GVVl6kCjUP
         rQMIzu201AUnvmwUHPyYrsUyDDfx5Z3nsTXR/cV62lBfKDoPHVZ37EW9mJJQ55dumXTv
         OrCMuMPmxcc90XAiTCosWKGR/Tm+f6QDhHB1SnyuazLFRapT7w91odyLDynHus49P7eG
         B8z8XzLvDSRmHmdZdsAcH/eEgAVo7b9fDi6PIUHrfQkIyLMolYcZJf9bTbQEiga6pvHu
         WeFgtILO1TH3Xzzj5uf1XC/AxqQ4YQq0R4C+tVhID1A28UBuZcXAGMhRnl+F7Ti81/O6
         KMCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783588719; x=1784193519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zT2kkT7n4+UHqEX9mqNgvpGllnQYoMihdqd9pN3gqWE=;
        b=oD0VgbLPSnuHm6lxhXGQcCvQuLps8XW+I9inWTfh5IFFwOpkYH0JS9mswH/L/AUJ93
         dhixhY12DHRu5uzds1uwN80z44jcX9RaQdXYtuwnfVInD2kQiF57fqKQZWpX8lROcuFc
         E+j583sqZs9Kui31UVEYoAGTo5ciNfqy6opAZ5sFT7Xf3hfstPmsg3qQlWuYCeaMYNPc
         Z2/tiyyHPYzr8bAm3xRCe8jvbR4614l4AdjQ8KsGINlgTb4zZUhSkNHQsi5xo8J8LDyp
         DbhaAjbDaGks2jxWBYFGIlvp2uwOS/aHIdAHRipAF8nF2LmdmnjALs6zgAxDRVKZqart
         o0jQ==
X-Forwarded-Encrypted: i=1; AHgh+RqwCyTmaLADaiv8RA3vb/wtqdfjZuxWBUW5xNTkXMQaipuA5XMafpmNRcwdDXg+q0B3FdIu/LNi45m1fQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwkVyEU1oswNxxDZfAYegudGcARl+n7+Z+A7fkwCnRYDycVe7UJ
	DrF28X880eVrEV0o+Kzcvx8QTrWODlkY16xi2ErHLeSenf86YSoAiNKw/d7lHT4V
X-Gm-Gg: AfdE7ckcRuuxkjOvesBOVUKt0HGVqruHCqzu0euFRWyJrfioQ7G3T0zWuwl81T0Oc5q
	oKsngl3A8iGxIrPS0v9OXa2iiU7CBuYOhXv7th60UG5W0JRAmXjjzvw0Cl+juAhwNPsrZqR07fC
	9bOB0yW9uC5bNGee6NuAeJbj0MxRAdcRjgcd2+mGjDB8JvlOuZaJlwq8EinMuAqiLw5lvcqA75v
	UJ7YR123GDoN5Yxhb5ypQFkYlFOjiFwe/fZBjJvMHnXS+VbNPCknqu9VYtHOLxByaDttr428ku6
	/bRNNSZsArOTRUe1ATQ/KD7iQLTiPCIFQtTnLVS7MNXsCgq9nOHyAdmG3AoIgTe5GtG8MwEYlE8
	5nAkUeWUvw52ayf1wJIhiIVPAxeJK3+uJdjPfIMclTpeMyYOzaafg1XzneoLW2MkdXeHrFW99lO
	/vAjZHKyRD9wuPjG+6MauZD67zeAuygT+ThnsaE41AZM4d3mTWScpvPg==
X-Received: by 2002:a05:6a20:431a:b0:3bf:ab76:63d with SMTP id adf61e73a8af0-3c0bce1ae8bmr6548628637.11.1783588719122;
        Thu, 09 Jul 2026 02:18:39 -0700 (PDT)
Received: from localhost.localdomain ([49.207.223.101])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b6594f6a9sm29682728c88.5.2026.07.09.02.18.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 09 Jul 2026 02:18:38 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: jacopo.mondi+renesas@ideasonboard.com,
	Biren Pandya <birenpandya@gmail.com>
Subject: [PATCH v6 4/4] media: renesas: rzg2l-core: Add missing media_entity_cleanup()
Date: Thu,  9 Jul 2026 14:48:18 +0530
Message-ID: <20260709091813.67081-10-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260709091813.67081-6-birenpandya@gmail.com>
References: <20260709091813.67081-6-birenpandya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67128-lists,linux-media=lfdr.de];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[ideasonboard.com,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jacopo.mondi+renesas@ideasonboard.com,m:birenpandya@gmail.com,m:jacopo.mondi@ideasonboard.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6DEED72ED9C

The media initialization error path and the remove function fail to call
media_entity_cleanup() upon teardown.

While currently a no-op, calling media_entity_cleanup()
is an API requirement for entities initialized with
media_entity_pads_init() to prevent memory leaks.

Add the missing media_entity_cleanup() calls.

Additionally, rework the error path in rzg2l_cru_media_init() to use
an error_mc_parse label, ensuring that cleanup functions are invoked
and the unnecessary mutex lock is removed.

Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 .../media/platform/renesas/rzg2l-cru/rzg2l-core.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
index 3c5fbd857371c..ee555b01c3aa1 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
@@ -230,13 +230,17 @@ static int rzg2l_cru_media_init(struct rzg2l_cru_dev *cru)
 	media_device_init(mdev);
 
 	ret = rzg2l_cru_mc_parse_of_graph(cru);
-	if (ret) {
-		mutex_lock(&cru->mdev_lock);
-		cru->v4l2_dev.mdev = NULL;
-		mutex_unlock(&cru->mdev_lock);
-	}
+	if (ret)
+		goto error_mc_parse;
 
 	return 0;
+
+error_mc_parse:
+	media_device_cleanup(mdev);
+	cru->v4l2_dev.mdev = NULL;
+	media_entity_cleanup(&cru->vdev.entity);
+	mutex_destroy(&cru->mdev_lock);
+	return ret;
 }
 
 static int rzg2l_cru_probe(struct platform_device *pdev)
@@ -312,6 +316,7 @@ static void rzg2l_cru_remove(struct platform_device *pdev)
 	v4l2_async_nf_cleanup(&cru->notifier);
 
 	rzg2l_cru_video_unregister(cru);
+	media_entity_cleanup(&cru->vdev.entity);
 	media_device_cleanup(&cru->mdev);
 	mutex_destroy(&cru->mdev_lock);
 
-- 
2.50.1 (Apple Git-155)


