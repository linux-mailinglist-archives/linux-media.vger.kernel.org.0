Return-Path: <linux-media+bounces-56631-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WAHGOt36v2lFCQQAu9opvQ
	(envelope-from <linux-media+bounces-56631-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 22 Mar 2026 15:21:17 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3412E99DD
	for <lists+linux-media@lfdr.de>; Sun, 22 Mar 2026 15:21:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 45B00300E3B6
	for <lists+linux-media@lfdr.de>; Sun, 22 Mar 2026 14:21:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57663363C45;
	Sun, 22 Mar 2026 14:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="My5EvIwH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4AA35E947
	for <linux-media@vger.kernel.org>; Sun, 22 Mar 2026 14:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774189271; cv=none; b=JCq5gxp2U8nBlPQSkixEWLtl0bpZgJFmw+9WXdit4g4PZKZ7SjmJYSry82Qfk/RbAelQ8U1aUvP115DFLC7+99GfuAEy1TSeAxBJmKQdsDT5p2L31No1BwMZHK9by6mWMNmkJNW6Fwz434rpYf0BC7Llvh0q/j79JvK8ZnSONJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774189271; c=relaxed/simple;
	bh=iqw9joRcspZCH/8gMqnFSFCc4GCnkWYXmP5HtvqP8lg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JRtHOjC9JkhVXFqHEVonOQKkJNhZMFV536MqVjgK4ZXSs31VAGd/aOzYmh4CwIfN5udKmo12tMRReZ8QjPwWp8643Jg1JFF91TTlZgyALerL6xPfs3U0I7aa/8+cpE4WjYT63GGQD/WIZtBGQbZr0OZEYr9DjrtNBNAiEJY3D/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=My5EvIwH; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48558d6ef83so18673565e9.3
        for <linux-media@vger.kernel.org>; Sun, 22 Mar 2026 07:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774189269; x=1774794069; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=duit6oVlvEzPP5nc9GzgTOHOPo7U9Sp31ZgxaS7C5gQ=;
        b=My5EvIwHdA8DskPOVi/Sm6Y7NOKecjbZ0YvRoZRCsCEOAm5IOAuqp0mwRD9OI5QolM
         ReVz2DT0I0s5B8v2e6V756gwTx4gxu3DRt0yqgYvM1N2epl/2D4y2N4cv+lWH4AG4RoK
         DuX8IUnzx7Nwwsg1H6wr10N6k7BWhDNNpRgsA6dUrHKaKmaZVXlN8s4XdU1J/qb/4zKx
         hsuXuGUo5st8+Gy8O4ET7DfODv88ddBZQX4e9u0PmGnTuQmxlO0x9m6im8fLao7wEbIJ
         RLyRfQQ57jhsmPP35r3zKa1dKZYFedq4od7pM9qblT5/8hN7UdPsYIA/BCAvDjjNUi5c
         hrYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774189269; x=1774794069;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=duit6oVlvEzPP5nc9GzgTOHOPo7U9Sp31ZgxaS7C5gQ=;
        b=rFKnrfrXRpUAmfirXMysLBq9QS7HRUbDLv0/On+j5p6FiXMJMn7OJGeNUiiBAf0CaF
         QgX173Qjj8Pj+TMlgeCkWD7ZuarTojyDwvwuFot5Z5y2znhRdjo03BB0x+WHMz4fXi1t
         +apVBB3jv1gjHAgpw4oghJ3Hyt3/3rMcvAdd4jxrVf2kFCyrPcUuAzciQbDoLlL7axkC
         bU0+V75wmkpAtqMIdgJTa4s/yxeqqCefCdrEiMWmeY9MxcOJd0NouveNrKg5z6YO4xrZ
         S8bJyl+lOIuximS5jp6eEF+ock/Wy0x80yONnbq8Q2Y0sgMTs73OD/3wr5fq/ZnK/u6R
         zM3g==
X-Forwarded-Encrypted: i=1; AJvYcCWhMt5gTll9fVkwdHDmIArLkPYaqaWlgIwzrmE10ruZcDqlH4dXrV+ab6sXVhBTvHNDRdbnuBPRAAM46Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVPPC7DGzQmT3nw3K3q0OiteMVKMq3KPDg2n1Z2N1aSnzAyDJx
	YOX64j2zlvuu0ALPA74oBeJ5VKu4irIIPofBLHuGooUb3jItKqY+tXE=
X-Gm-Gg: ATEYQzzlJkZmrOIqX3hAZ4K332Nt2z84IVNMki+MMDzkzNAIZZJn4Yo3tzmzaSaORph
	Xf2iIAbvKMBo74ha5z0aS1VLovQ6kEP41O4pDx1jrLTA7brQK+FegAAuNlvS05oi1QuTZSdOF2U
	aR5OiK7B2SiZxqrrWD3RQuUWMdgR9jIAxZCvM99M5kPdCDX93X35hOyMUPHWAQlQoOQKFpS1mje
	rdV7yiyv3FeVKcr59Gi9pZ+03ZtbnMSuwE6z632q9LLiM9kKEet/SMfhum5yOvci0RPp2gYxBCm
	SYU1yq3AxBFN7Gf04uq64zZuo5nh4u+1DtDMlU4UcZ/xocuCyYBpLdVobyn7Uix8WBABtP1ZlwH
	1b2amoHdhWAdSjQ9IFI6w26GtmWlmmqnYSLNWJTzrpTxq6z5znYZ2JZaSa+SL153eVu1Xloz1iL
	Rm2sqRudlU8AdYjhbuJDAYD5iIxz2krXu2hEYd8xGQE9zvytRK/H9lP1Ug2DRlIJ3YRXYoqEk=
X-Received: by 2002:a05:600c:8b25:b0:480:6bef:63a0 with SMTP id 5b1f17b1804b1-486fee0d8cdmr138331555e9.21.1774189268766;
        Sun, 22 Mar 2026 07:21:08 -0700 (PDT)
Received: from hp-ubuntu.. ([41.249.139.113])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486ff109b95sm141340055e9.1.2026.03.22.07.21.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 07:21:08 -0700 (PDT)
From: Mohammed EL Kadiri <med08elkadiri@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: andy@kernel.org,
	sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mohammed EL Kadiri <med08elkadiri@gmail.com>
Subject: [PATCH] staging: atomisp: fix spelling mistake
Date: Sun, 22 Mar 2026 15:21:04 +0100
Message-ID: <20260322142104.41647-1-med08elkadiri@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,vger.kernel.org,lists.linux.dev,gmail.com];
	TAGGED_FROM(0.00)[bounces-56631-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[med08elkadiri@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4F3412E99DD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Correct the spelling of 'uninteruptible' to 'uninterruptible' in a
comment within system_global.h. This improves code readability and
searchability within the atomisp driver.

Signed-off-by: Mohammed EL Kadiri <med08elkadiri@gmail.com>
---
 drivers/staging/media/atomisp/pci/system_global.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/system_global.h b/drivers/staging/media/atomisp/pci/system_global.h
index e8a29f73d67a..bfa8682ee667 100644
--- a/drivers/staging/media/atomisp/pci/system_global.h
+++ b/drivers/staging/media/atomisp/pci/system_global.h
@@ -29,7 +29,7 @@
 #define DMA_DDR_TO_HMEM_WORKAROUND
 
 /*
- * The longest allowed (uninteruptible) bus transfer, does not
+ * The longest allowed (uninterruptible) bus transfer, does not
  * take stalling into account
  */
 #define HIVE_ISP_MAX_BURST_LENGTH	1024
-- 
2.43.0


