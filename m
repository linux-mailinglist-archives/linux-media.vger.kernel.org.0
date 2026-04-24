Return-Path: <linux-media+bounces-59536-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OL9kNceA62lLNgAAu9opvQ
	(envelope-from <linux-media+bounces-59536-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 16:40:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD7546050B
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 16:40:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EEB5230701AD
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 14:36:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20A0B3DD530;
	Fri, 24 Apr 2026 14:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MkYEtM2a"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 726BB3DBD5A
	for <linux-media@vger.kernel.org>; Fri, 24 Apr 2026 14:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777041374; cv=none; b=EXU0wTJY+kQ0ioyHsfacXleXUAfA+A1OBazh14vYrRKeDynNwd4w73B/D7Md5ujHmE9j0kgR5ipCZkPQ0floNJ9O+nnW4A+5QnYi5ORAoL1+SQ78fuqGbZIr7FZfsfQ1/jDj7LwHzVJjPpBVPsZg/2Vt1IcpjGab5nTsitG39n8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777041374; c=relaxed/simple;
	bh=qmCZG3NsgyNnx//Q3I0cBUENxgZbXGkZyQVfNZJYt74=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qbeatc6JUY+Gy1SXsJyd5vGliP0uyeZzFiLpaRsEwjiFISqBKuvUNvub/FScrnD2mF8a9Q9YAtNPE+Xb3JsZXUnkSMwrZdKZsojnbfbrRZzwUvYnNJuZorkjkdpyB/k8bzmENFMIYyyWWsBpDn2AylOyRV2nOBZu3p40jD9HFj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MkYEtM2a; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-827270d50d4so7289149b3a.3
        for <linux-media@vger.kernel.org>; Fri, 24 Apr 2026 07:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777041373; x=1777646173; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fiYSxmjQt4BB8G17wfMVpfBYmyS+agHfH0aiwr6Qa6U=;
        b=MkYEtM2a7gBK98Dj4C2Ll/4viZRU0UwZPO+3sc95EqY/8zE6cUrPDrec0oyb9eE6Ns
         M9cw+MWGy0xbtZxmgCJaVswojnnX8dOotv3NDEqNrNjKGTkrtRRWG7JZf/xCy55p7am0
         8grjR6x06Blt8f6Q/zZ892nD07EuIlZHRObGQRYww2KIUHbnSHxCB5/sPNbmocUfSgqz
         kQkoFJ/II9vP5/cyXNY2kNT5CPfgMI0q26Vji9P58gRTYcnPMp6HlU6emUi40eUMHWp4
         YuycsCRof3TH5PZzTrbVDSatS1WfbRajST7iGdIJm0MV1iMt9eucbUz7JDI3ZaacAl1Z
         8TiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777041373; x=1777646173;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fiYSxmjQt4BB8G17wfMVpfBYmyS+agHfH0aiwr6Qa6U=;
        b=Jc40EVac1hT4aHE1Uump5Ilm/i2xKF+gzU5t8RMq6OGcDOBpu9wy37PwxjNFBVdEEM
         EnBwTE0UcZhuleLh3XrRaEKn9EFhFdaYXWNeO/BmcLWY5n+4CYxnfSiF9CBallnRsqqu
         pqp5sglmBlJxjQErGjvwCGXpsygP1s1Rm2rT75KK09iSJnA9Hj7HgPMBmO/nuZdH4HM2
         vmXv9sOzOXJlUFXMGPmTm/vq7n7m19wVfM2jQgzT3dFY8mg3pJsBemceTxiRB2QNKg+5
         rQJjo7q/WrSHGt6/CMXqE7TdO8jV5D0gURwdtlLVuk1ZEqvs+ipNuZOSb2MjqwlEv95p
         fwqQ==
X-Forwarded-Encrypted: i=1; AFNElJ8yGv9CBzT1h8rAFDUVhUOktG82JYuO5bdQurIzfuFUJQ7Pbeywjoxn8cL+b7TUL6FkDn0ghQckYQOKIg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwoLdCMFOWBZjsxiDHYI6HzGkXfh/k4uUHbYxzx1pkdqMp7TyT8
	zS2wJbssLoR21k+TrnR4m+n3lVe43gJQ0mvSEjLkGO6TTwzp5wH90zc=
X-Gm-Gg: AeBDiesDkVPXinx72F43iHnPgbqz3KneBCSwfiXdEDYVjS3kHUXSkLk4QNdeoljdyle
	LkMn2S01jU4nTB3ABURAf30ki1QRFC97whDq5rGF/lai/LGz5wwj1Aw0x3JOouDQwaeOu9wTx5R
	vgU3vvS7+q90sjSHg+oI27PhApqB/3YI6jic4pPji1qfc9q3jBq8A7wYRsVQHixM+eXShpypOTT
	n3v8/YAubPa9aIP8+fvcvcYAqjDgIlA8Ay5H+ghv2oN+6+42SVIJOwvRKEckBIUerLH4EL/WaKW
	WZl9M9qncJwBkYsRgu6VgHjcbHN/uiwiYxLCivnX2oLIKP5TCF2BvmmtzSihXLwVJhPzgpGsIeS
	JfGwkCZrZ65tH9umhk5JADiMd6yQH6G+2hcxINLWSXqg3G3fSrASAMnFVIXC1tpGUVEJjT78bco
	N32AWks6g0CzYs9G0aGY8YVghsecfEpcj2uG/H6dZWE7tkWD7L0XurmIp4i8b2x7DuKYBoZGN2i
	y+PL4wDjQ==
X-Received: by 2002:a05:6a00:4fcc:b0:82f:5034:77a4 with SMTP id d2e1a72fcca58-82f8c8409b4mr34482294b3a.21.1777041372626;
        Fri, 24 Apr 2026 07:36:12 -0700 (PDT)
Received: from localhost.localdomain ([1.226.165.54])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e9d35acsm24448401b3a.15.2026.04.24.07.36.10
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 24 Apr 2026 07:36:12 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Ettore Chimenti <ek5.chimenti@gmail.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Myeonghun Pak <mhun512@gmail.com>,
	linux-media@vger.kernel.org,
	stable@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: cec: seco: unregister adapter on IR probe failure
Date: Fri, 24 Apr 2026 23:36:01 +0900
Message-ID: <20260424143607.60807-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 3AD7546050B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59536-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mhun512@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

If secocec_ir_probe() fails after cec_register_adapter() succeeds,
probe returns an error and the driver remove callback is not called.
The current unwind path unregisters the notifier and then falls through
to cec_delete_adapter(), which violates the CEC adapter lifetime rules
after a successful registration.

Add a registered-adapter unwind path that unregisters the notifier and
the adapter instead.

Fixes: daef95769b3a ("media: seco-cec: add Consumer-IR support")
Cc: stable@vger.kernel.org
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/media/cec/platform/seco/seco-cec.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/cec/platform/seco/seco-cec.c b/drivers/media/cec/platform/seco/seco-cec.c
index b7bb49f023..97ed9654c7 100644
--- a/drivers/media/cec/platform/seco/seco-cec.c
+++ b/drivers/media/cec/platform/seco/seco-cec.c
@@ -649,7 +649,7 @@ static int secocec_probe(struct platform_device *pdev)
 
 	ret = secocec_ir_probe(secocec);
 	if (ret)
-		goto err_notifier;
+		goto err_unregister_adapter;
 
 	platform_set_drvdata(pdev, secocec);
 
@@ -657,6 +657,10 @@ static int secocec_probe(struct platform_device *pdev)
 
 	return ret;
 
+err_unregister_adapter:
+	cec_notifier_cec_adap_unregister(secocec->notifier, secocec->cec_adap);
+	cec_unregister_adapter(secocec->cec_adap);
+	goto err;
 err_notifier:
 	cec_notifier_cec_adap_unregister(secocec->notifier, secocec->cec_adap);
 err_delete_adapter:

