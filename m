Return-Path: <linux-media+bounces-66596-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BvHSOPtISWoY0AAAu9opvQ
	(envelope-from <linux-media+bounces-66596-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 04 Jul 2026 19:55:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 412A4708221
	for <lists+linux-media@lfdr.de>; Sat, 04 Jul 2026 19:55:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=OhKr1X54;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66596-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66596-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5DEA0302F0F9
	for <lists+linux-media@lfdr.de>; Sat,  4 Jul 2026 17:54:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65BEF3749F7;
	Sat,  4 Jul 2026 17:54:01 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99EA423815B
	for <linux-media@vger.kernel.org>; Sat,  4 Jul 2026 17:53:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783187640; cv=none; b=D4YJFLyvtgBRHmuNvTOMHrkiJqBNfgrh34qVEpwhe5OJHcwUJ3DsFQMOE4joRHgCmCGfSvUniPMZPXLL0HdfDfgvyWFG3yKb5NMt6xIq4dYCWuSGysdnMyJhC5T73D2UAljqbfrmnkq/W3ISgTXXpy0DIVqQSwAGoNt0U2cPTXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783187640; c=relaxed/simple;
	bh=9qmog2n5b0kAnBBF60IWPrMQr/t9YzSmnsx8p6G1sFM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AfiPmEvFmH2MO0figmmblzeMjpqIK8H4j4SIg70ya1+rErZlvKPe0hY9XFDrH/7D2l6F9OCLZaWrzkVKzceOW3g/e7B3PMozKYZrcCGmyvL8ZCuSNt8ZZ2VMugELQtfnuLUsncHxAdWtGSYGo8XKqKjuokDAWexuBUTtmpMV29g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OhKr1X54; arc=none smtp.client-ip=209.85.214.171
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ca64c3ce5fso16325865ad.3
        for <linux-media@vger.kernel.org>; Sat, 04 Jul 2026 10:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783187639; x=1783792439; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3npAVWjav7GMHxuMuHgdC6XUpyNeQBqQ4x3PSl9Xjcs=;
        b=OhKr1X5411Narl3bPGM01P5mhfwhl/nl5VOoXQJAcsmFmzWAUV/DLfdm/LUj52ANua
         526qoSFaF5f3D1FTpz8PAj4suiUFWzICuwn8ceMermik0jjjMsrGCnFVk3c2Ul/7SM+n
         imks+OBKOzB6nG7d5O9w8ys+P3gMjBaeccnTDV20o11rXz94jmOLSxqoyUR1uT7EmZCQ
         yJC1wxmzX2BduEIKWcg/JUgt4g4a/aIQdMzT6+UOR7ZhMv3nmoItNwpy5n5D5EJ9p+wu
         Cv1nDo7nbgL8ffL9r1d03OG1aR9yWf+JVflaP0QfrbFvyrG+6x3aC1PxEqhUMgAmF02t
         IfnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783187639; x=1783792439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3npAVWjav7GMHxuMuHgdC6XUpyNeQBqQ4x3PSl9Xjcs=;
        b=sQZvjHSyP4hJKup/vs9zlB77C9FcHnYJhUy27kiZwoSKx/INlhzDbtCiqoHhD+YW1Q
         pIWdzEFmYwaUaRqHIwQG/kEoxo5Gh+64BLA4RWTqaw98AuSpLo5FjQwIUzpLMqyuTQe3
         h6KKUsMiAwH0QJBQG1W/WIO3rGombEESZgfVLlJgpfs1l7mAOnjoeG0HWVV0hkxVsC3u
         LYc+TE4hpdHr3LpbYo9ycOFxsVnat/+15HTNAMPcxIgF/6qeIbLrVkQdKGdEQrV16riH
         GrnQJCMJOZTfvC90vWKdt9hwwwkkmPLhfSB+Fq+ys7ug+gN8C9MsN6wKNKEAHIxb7aL2
         9/LQ==
X-Gm-Message-State: AOJu0YxqF5umVPYhFhZ+Ii4cGArQa6WqSADiZdXes/fqEs/b3X1dM6Zf
	MhLMxxZ0Xc+uXoLSjSIvjMSRsGEoRKkogS8Fl6ceoyJIVfIbi5e2/1JMfXqCkV1U
X-Gm-Gg: AfdE7clXhqMU058T27IUFRyAS4ICcqZX3VTMONIjcVkMaUlni5CPPNhNm5ntdf79jYg
	qRoXsq1R6V3uJeZ7SHrEYCLlawZdqK4Z41TlKdijiui/vlCaPBrjFgZxFobwBS9IBwOX/t+yBtW
	ygeXisa3sNksbwvsbFhGTmIEPQzFog6d0ttzgADc+bsEPoqqggSvvqJUGu1mO6W+SYBN92EWnzi
	tY0ndvktAPZsP01hnI++dbCFOuJOnzbs4o+inIlNP0QjkdUrAFqa5BnVqtKi0YI4Ia5FOo49ibc
	zJV/1RjKz7LYXlbvm9HydT81H+8nObeQw1j/kaxjOCBt7OBTkXhh8uqNHMMWhYLFGaaInClfUAU
	HamZJN53aNJbH19RzZjfwtadk+N77ri+ldwWrGlQS0de+SB5bxRVk+2znHv4UgNVGdwVmSEw6S3
	tzOJKTVyzg3u4eJtq2dRl4KsmRqrqbYKabCEp8EHdO2zU=
X-Received: by 2002:a17:90b:48c6:b0:37f:9ce3:ca93 with SMTP id 98e67ed59e1d1-3829f8e55d2mr4357875a91.28.1783187638891;
        Sat, 04 Jul 2026 10:53:58 -0700 (PDT)
Received: from localhost.localdomain ([49.207.223.101])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f39e07e0bsm15588749eec.30.2026.07.04.10.53.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 04 Jul 2026 10:53:58 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	niklas.soderlund@ragnatech.se,
	mchehab@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	laurent.pinchart@ideasonboard.com,
	jacopo.mondi@ideasonboard.com,
	Biren Pandya <birenpandya@gmail.com>
Subject: [PATCH v3 2/4] media: renesas: csisp: Add missing media_entity_cleanup()
Date: Sat,  4 Jul 2026 23:16:41 +0530
Message-ID: <20260704174638.66302-8-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260704174638.66302-6-birenpandya@gmail.com>
References: <20260704174638.66302-6-birenpandya@gmail.com>
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,ragnatech.se,kernel.org,glider.be,gmail.com,ideasonboard.com];
	TAGGED_FROM(0.00)[bounces-66596-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:niklas.soderlund@ragnatech.se,m:mchehab@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:laurent.pinchart@ideasonboard.com,m:jacopo.mondi@ideasonboard.com,m:birenpandya@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 412A4708221

The probe error path and the remove function fail to call
media_entity_cleanup() upon teardown.

While currently a no-op in most cases, calling media_entity_cleanup()
is an API requirement for entities initialized with media_entity_pads_init()
to prevent memory leaks.

Add the missing media_entity_cleanup() calls. Furthermore, introduce a
dedicated error_entity label in the probe error path to ensure the cleanup
is only invoked if media_entity_pads_init() has successfully completed.
Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/platform/renesas/rcar-isp/csisp.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/rcar-isp/csisp.c b/drivers/media/platform/renesas/rcar-isp/csisp.c
index 8fb2cc3b5650..61558a71ee35 100644
--- a/drivers/media/platform/renesas/rcar-isp/csisp.c
+++ b/drivers/media/platform/renesas/rcar-isp/csisp.c
@@ -539,7 +539,7 @@ static int risp_probe(struct platform_device *pdev)
 
 	ret = v4l2_subdev_init_finalize(&isp->subdev);
 	if (ret)
-		goto error_notifier;
+		goto error_entity;
 
 	ret = v4l2_async_register_subdev(&isp->subdev);
 	if (ret < 0)
@@ -551,6 +551,8 @@ static int risp_probe(struct platform_device *pdev)
 
 error_subdev:
 	v4l2_subdev_cleanup(&isp->subdev);
+error_entity:
+	media_entity_cleanup(&isp->subdev.entity);
 error_notifier:
 	v4l2_async_nf_unregister(&isp->notifier);
 	v4l2_async_nf_cleanup(&isp->notifier);
@@ -569,6 +571,7 @@ static void risp_remove(struct platform_device *pdev)
 
 	v4l2_async_unregister_subdev(&isp->subdev);
 	v4l2_subdev_cleanup(&isp->subdev);
+	media_entity_cleanup(&isp->subdev.entity);
 
 	pm_runtime_disable(&pdev->dev);
 }
-- 
2.50.1 (Apple Git-155)


