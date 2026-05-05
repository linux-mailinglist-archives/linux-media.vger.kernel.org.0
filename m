Return-Path: <linux-media+bounces-60354-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AFbdOteb+Wkn+QIAu9opvQ
	(envelope-from <linux-media+bounces-60354-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 09:27:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6C94C7E60
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 09:27:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E57E0300E000
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2026 07:27:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2183C3DD530;
	Tue,  5 May 2026 07:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ffdKtkUw"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5113DC4B3
	for <linux-media@vger.kernel.org>; Tue,  5 May 2026 07:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777966032; cv=none; b=RNSpk6VmshZVKmXHWtOzz2bVHdKGPDC/YIk+EqiyhiGLWM0laAKlK8eBp0mt1aPq0KColh3WQvoVhSTzM2ias+2OxFVZlpWLX5LUN/SEm63Xn2K3IO1PwrTPhqlsclsN3RaAVDbHOLKUC7Nq5roGvP8ruVltzpsXdbXb4GRQquc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777966032; c=relaxed/simple;
	bh=oJ7i70NzDzG1+8kPbDifF5QyLpTTn6bjo+g4ZqXwXK0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G5P/cQtc7sVvPfkmwx//StUpin6NCi3UV5aMznKmv3KchKMkVa2N51JzG+znYP9DocSAeViB+RSqMGXpdOcEEFZ+0aODI1VgOfNzYH9iJ72YdcdYfEaHnCukSj1cxuEMR4TABDiJQuvOAHzHTLCccYYyd/wFqM7qGnU8BA0PwUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ffdKtkUw; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-67bc6098640so5048449a12.0
        for <linux-media@vger.kernel.org>; Tue, 05 May 2026 00:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777966029; x=1778570829; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SijCf9pu+RbvD42v9n4+DJLBOaLCuGVTkAjrLhC796g=;
        b=ffdKtkUwCz4o6a9WlWfJU/h+GHDVzOcfDpYY7LfWF2jIHMVDJR9u8rggrS7OlK0ulH
         aaIo6C7juFU/10Ormu1yJVqsXH+gfzGvQBj+cZ5kDoe0pWF2VtF8xyXEzx+43Lb41i+R
         TtxQXZDnZaVW4Ko5ou4d9UskZXFpNAlOUBrd8beM3eSQZZa9B1N8qK5hB+/8hBU8Om8N
         IX/G5uBPRM9mfIDaedgYse0gHF00+U6GV4QxKpv95dC8zb7Dbl+pPiv3sabdnXMt3IG7
         QjufVb3W2xT/aedgJJBhRFuAa33z0zboYVq62UHhjXwKQKtB98gTj16TwukrSiYTjKiN
         V2xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777966029; x=1778570829;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SijCf9pu+RbvD42v9n4+DJLBOaLCuGVTkAjrLhC796g=;
        b=faQkW42VzTaKo+Yk4UWQB7BNA3ShA7aNcKdg2vfEFnpp0UmlvlHP5lJ5mxYwiNtMbG
         ik85H7yame54O8cqoNQRAASE3Q92/9n7XEQ+S1Iylsh0ta6UTaSXeE6H2Hs4A+S2ZnzX
         WUwf2w8PkdbQkJi/A6ex3zCekjeVOIqLShVyAqXPFOrfzVKgoVuh03jaVr4o27bMzWDD
         OmAUg8HYjd7GDNk31C/Bz9IziunNsDTCf2bP0EMcy/jR1VnuJ5EXxjhP5+rzBNs0PFk+
         5u0sO55SQ7wnNtBDdWq9ous2z/mog+HGC8Dy1je3lCWTjpi2p2tFBUOAUDmpuWoyG/Rr
         OtbA==
X-Forwarded-Encrypted: i=1; AFNElJ+SPGK47Kwwtgb3DslHKt3ALcjczYM+4IBaaa997K2ocjwV4Pdjq+44DwvBgg42Ikca3XcNqrlia15d1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZzxfMxrAHa/5ET/aC9FL4TwdTx5aWOf5MlBHQoSDBjVhMe3N9
	kPJDNy05p1lS7015B9P6ZH+9mRLTyCjGPconPsASyToiXnrLkazVTInH
X-Gm-Gg: AeBDiesknxXRy6QbPY1sKERi5QesTZEqiQYMwAFZ58kzOF5ChH9L+NSZyKXRpWeE5Xa
	lKvk/JEE4xJa3Kr073Ld2nLxyKGLpPgL2z4xR6TPKKNDXFMq32vZds/iP2/xNLIHRWA8U+jCC7C
	4wjI2jCItCxd4WLS2uX/d94eez4w4x26i29epCQb+8M+qZGd0AhGtd7ONQSeWYxeZIlC+QyvGvh
	WhyYPHrx6ccyRbyA87WCtf0o9dZfGNwLpbHlhBSnnGhNVf57JWgjY0adBjIQXGfdB7JxhUuqLoJ
	Rxqx7fqfIa35wgRqzllBOxRL28Ss0FpgoYJObLS6kAp5GqvDaiw8Mf04FfTqOlchlJjs20u+0l9
	3Fw4q+YPCHa3sSvY99QJPWejqmtSE5nDgvkVVxuPNPfyUviMGQS8b8gzuJ7Zv+hUdrzH/qJfT/n
	Lj0QoEYCv/K8/5sqaA89B7jjoeyuAwBj8y
X-Received: by 2002:a17:906:f049:b0:b9d:94e4:d35e with SMTP id a640c23a62f3a-bc40fa2f89cmr93636566b.29.1777966028971;
        Tue, 05 May 2026 00:27:08 -0700 (PDT)
Received: from avt74j0.. ([2a02:8109:8617:d700:a1d:902c:85c8:d272])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bc1dd343108sm208493166b.63.2026.05.05.00.27.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 00:27:08 -0700 (PDT)
From: Martin Hecht <mhecht73@gmail.com>
To: 
Cc: sakari.ailus@linux.intel.com,
	martin.hecht@avnet.eu,
	michael.roeder@avnet.eu,
	stable@vger.kernel.org,
	Martin Hecht <mhecht73@gmail.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] media: i2c: alvium: Fix: correct typo in alvium_set_ctrl_auto_exposure
Date: Tue,  5 May 2026 09:26:52 +0200
Message-ID: <20260505072658.1228578-1-mhecht73@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 8D6C94C7E60
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,avnet.eu,vger.kernel.org,gmail.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60354-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mhecht73@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]

write value for auto-exposure into register REG_BCRM_EXPOSURE_AUTO_RW
instead of wrong register REG_BCRM_WHITE_BALANCE_AUTO_RW.

Fixes: 0a7af872915e ("media: i2c: Add support for alvium camera")
Signed-off-by: Martin Hecht <mhecht73@gmail.com>
---
 drivers/media/i2c/alvium-csi2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/alvium-csi2.c b/drivers/media/i2c/alvium-csi2.c
index 955b7072a560..b62b45a4f2fc 100644
--- a/drivers/media/i2c/alvium-csi2.c
+++ b/drivers/media/i2c/alvium-csi2.c
@@ -1290,7 +1290,7 @@ static int alvium_set_ctrl_auto_exposure(struct alvium_dev *alvium, bool on)
 	struct device *dev = &alvium->i2c_client->dev;
 	int ret;
 
-	ret = alvium_write_hshake(alvium, REG_BCRM_WHITE_BALANCE_AUTO_RW,
+	ret = alvium_write_hshake(alvium, REG_BCRM_EXPOSURE_AUTO_RW,
 				  on ? 0x02 : 0x00);
 	if (ret) {
 		dev_err(dev, "Fail to set autoexposure reg\n");
-- 
2.43.0


