Return-Path: <linux-media+bounces-52609-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +CmMAd6RjGlQrAAAu9opvQ
	(envelope-from <linux-media+bounces-52609-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 15:27:42 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B77912536F
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 15:27:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ED04F30D8F20
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 14:22:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B88212BDC3E;
	Wed, 11 Feb 2026 14:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RvqJEAWa"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5AB329BDAB
	for <linux-media@vger.kernel.org>; Wed, 11 Feb 2026 14:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770819766; cv=none; b=uq87JseP1MLsxpFCrb857n1o00lvOYjMgJnP8GodtwEcsqejDZNSA3o4iMcmgPFAp8wGgyqbZpJuhSagOYpPHd4Fu2DxrkfmoOB+YOEHSpAqkjrp9EEBjZfspr0igi/zT41lKSjDW8rBs4vAGSYxO1uAL2N/u8MwQxfRZc5V+Bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770819766; c=relaxed/simple;
	bh=Y6VzJoPNwC7JA2717m/vF6bR6Kk1n0xBDh7/ZtoqI5k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dnLtXjcGJsM6/PXTHenQ6uWzYSgdkptf35cIFgZwsucnrTNGeilOtmpoXUuM6qq+s7Egf4jIrWrjgFYgwAAerbKNFf3UffSSZO6+jtaLONy/wSGqztaSd+Je0HkPdLjr559HivWaFzJ+nkoKKdJ+BMYiXTZtWuWzBIIdxgGGnaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RvqJEAWa; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2aae146b604so25769295ad.3
        for <linux-media@vger.kernel.org>; Wed, 11 Feb 2026 06:22:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770819764; x=1771424564; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i2a0yu6RlT+zETdd3iQNLEBogdpR7mh/Nc5hRgZU3iE=;
        b=RvqJEAWa2B9kRAPs9IJRP5eCVNlQdGWvOVEBEEBBUwiXfxE3JbquaPbblRtJ4Uw4Ai
         eMFFRQd4ZT3ByW+vjmX+4+oPLMc4WuHuA3cw47qCF2U0sE0mouil1cQUFasmeAV905qn
         4FIYoHZQo7gbVLV3UaFha4YHxR2z0lqqaZYT/ppAgHmSZj3y2jGTbRyNRG6oN0A6CEXh
         3h2+9KYSlN0EmlXk/M5Xl+CU/KboRM0TMWSQdAsZzcVek6efMRv9y7Lb4IXwZXalLxDq
         wk2HMU0tE4U1aEstCFg95TyIU03uwDKgAaV4142p2kFiQTeOAF6qXmsEackeoc2seFVT
         ukYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770819764; x=1771424564;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i2a0yu6RlT+zETdd3iQNLEBogdpR7mh/Nc5hRgZU3iE=;
        b=W7CB6HlmmjuCVJzfnKGyrjGNKMzeK/6yikTxtTCTWgOIoKB5hsqID8KW+XDArbNf3s
         qidjdIqFdzGew/uvMvnfmIl3EEHoqWgVRBOrtuoVQf2zCMsEQadkibTNIldRyqyHuPiN
         wHL3bdnpuyIPBh+31roIfFyxj8mbEEhHGYJKJ/roSymImlmO930kWiltGuH7inuX+a0H
         DAaOuCfISn8bjVCQOxtlfpFoeUpMSdgk8GObirgGi7Gu4PXtFu8q16Mo2cdyC9Y+Nyq+
         A0+MDUaG97X3qUidw+qJZcaX/j41mXDpR9AewG80pTtz9QEqg9LFoEz5mFZvoEhBf/6B
         +lEA==
X-Forwarded-Encrypted: i=1; AJvYcCXMva94aY86GxXTbzX843l1JtMymgT/mcb3AJVOLN6m8++S+mq48qCRgiWNMCD/FO6p0V4ZkgH90HKTXg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx90Ryyvd67hQ4RRN+T7PQkbGQ6SEHFhMPmjBuxrhmlE40J2qo0
	syPV6ERqjTtmK8LA3qTqOiBsYhp+Elpkh63lBa39TG18LvLvjglpKFrF
X-Gm-Gg: AZuq6aI4OsHK8UOgH/uRYlISDIzKCGxnQ+aV0/LeoeKs4DXXuqD56g0za8KcJVUIuvD
	r7MVEiA0mXa1yzZVXEae2ybWsjOosHev4zeuKPAfXfTTEzj3xSQnAyYxtSl4LCRpzKJdt11qCSz
	TSEC5IBn3hBmU2z2b5JgFFPHfMaKpxBAL1ZeSURjc4qZOGty5zgbUdHGTbEAhUPi63vWFLjWEnd
	UWUhMq+X/G1r9eR4f4L7UgTi0P5uz1QjQjGiLup2X07/iUwYFFVAVZKNKQbXzjSARktsaRh5ejv
	bNPXYzXCBcMUDSsONmHCjZm+ErTyNUkfytRX26T4BhLhINqSWcz8cpNA4+x+iNTJNs33Pa1Y7Gi
	bJxQA3WbGrh+V0+1fVKfnNtL6pq+TgJTzMdRqfbnzhgEG3iD4D0qrK3iVo+hwWHkMJjZrKDi9sx
	MFTPtWRQPX/GMTYBI71gtPZ2MzfX4M7w8R5zXeFw==
X-Received: by 2002:a17:903:198e:b0:2aa:e238:e219 with SMTP id d9443c01a7336-2ab2ad2b696mr23330115ad.58.1770819764167;
        Wed, 11 Feb 2026 06:22:44 -0800 (PST)
Received: from fedora ([2409:40c1:201e:40f6:5d2e:7e5f:8687:4ec9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ab29998cd3sm23540505ad.85.2026.02.11.06.22.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 06:22:43 -0800 (PST)
From: Rajveer Chaudhari <rajveer.chaudhari.linux@gmail.com>
To: slongerbeam@gmail.com,
	p.zabel@pengutronix.de,
	Frank.Li@nxp.com,
	mchehab@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	gregkh@linuxfoundation.org
Cc: imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Rajveer Chaudhari <rajveer.chaudhari.linux@gmail.com>
Subject: [PATCH] staging: media: imx: remove unused header includes
Date: Wed, 11 Feb 2026 19:52:08 +0530
Message-ID: <20260211142208.112033-1-rajveer.chaudhari.linux@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52609-lists,linux-media=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,vger.kernel.org,lists.infradead.org,gmail.com];
	FREEMAIL_TO(0.00)[gmail.com,pengutronix.de,nxp.com,kernel.org,linuxfoundation.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rajveerchaudharilinux@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8B77912536F
X-Rspamd-Action: no action

Remove unused header includes from
imx-ic-prp.c
imx-ic-prpencvf.c
imx-media-capture.c
imx-media-csc-scaler.c
imx-media-dev.c
to reduce unnecessary dependencies and improve compilation time.

Signed-off-by: Rajveer Chaudhari <rajveer.chaudhari.linux@gmail.com>
---
 drivers/staging/media/imx/imx-ic-prp.c           | 1 -
 drivers/staging/media/imx/imx-ic-prpencvf.c      | 3 +--
 drivers/staging/media/imx/imx-media-capture.c    | 1 -
 drivers/staging/media/imx/imx-media-csc-scaler.c | 2 --
 drivers/staging/media/imx/imx-media-dev.c        | 1 -
 5 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/staging/media/imx/imx-ic-prp.c b/drivers/staging/media/imx/imx-ic-prp.c
index 2b80d54006b3..bba125234769 100644
--- a/drivers/staging/media/imx/imx-ic-prp.c
+++ b/drivers/staging/media/imx/imx-ic-prp.c
@@ -11,7 +11,6 @@
 #include <linux/delay.h>
 #include <linux/interrupt.h>
 #include <linux/module.h>
-#include <linux/sched.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <linux/timer.h>
diff --git a/drivers/staging/media/imx/imx-ic-prpencvf.c b/drivers/staging/media/imx/imx-ic-prpencvf.c
index 77360bfe081a..1b9dc5d86926 100644
--- a/drivers/staging/media/imx/imx-ic-prpencvf.c
+++ b/drivers/staging/media/imx/imx-ic-prpencvf.c
@@ -9,9 +9,8 @@
  * Copyright (c) 2012-2017 Mentor Graphics Inc.
  */
 #include <linux/delay.h>
-#include <linux/interrupt.h>
 #include <linux/module.h>
-#include <linux/sched.h>
+#include <linux/interrupt.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <linux/timer.h>
diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/staging/media/imx/imx-media-capture.c
index e9cef7af000a..860f93272bbf 100644
--- a/drivers/staging/media/imx/imx-media-capture.c
+++ b/drivers/staging/media/imx/imx-media-capture.c
@@ -5,7 +5,6 @@
  * Copyright (c) 2012-2016 Mentor Graphics Inc.
  */
 #include <linux/delay.h>
-#include <linux/fs.h>
 #include <linux/module.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
diff --git a/drivers/staging/media/imx/imx-media-csc-scaler.c b/drivers/staging/media/imx/imx-media-csc-scaler.c
index 0a27330f9790..d42652c51358 100644
--- a/drivers/staging/media/imx/imx-media-csc-scaler.c
+++ b/drivers/staging/media/imx/imx-media-csc-scaler.c
@@ -7,8 +7,6 @@
  */
 #include <linux/module.h>
 #include <linux/delay.h>
-#include <linux/fs.h>
-#include <linux/sched.h>
 #include <linux/slab.h>
 #include <video/imx-ipu-v3.h>
 #include <video/imx-ipu-image-convert.h>
diff --git a/drivers/staging/media/imx/imx-media-dev.c b/drivers/staging/media/imx/imx-media-dev.c
index a08389b99d14..a8f39319bd8a 100644
--- a/drivers/staging/media/imx/imx-media-dev.c
+++ b/drivers/staging/media/imx/imx-media-dev.c
@@ -4,7 +4,6 @@
  *
  * Copyright (c) 2016-2019 Mentor Graphics Inc.
  */
-#include <linux/fs.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <media/v4l2-async.h>
-- 
2.53.0


