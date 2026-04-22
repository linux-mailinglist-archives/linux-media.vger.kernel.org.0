Return-Path: <linux-media+bounces-59276-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YKkqISBp6GlZKAIAu9opvQ
	(envelope-from <linux-media+bounces-59276-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 08:22:24 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2922C4425F0
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 08:22:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 47CCC3052A0C
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 06:20:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8CBE2D8DDF;
	Wed, 22 Apr 2026 06:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q6/8FAa5"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED55286417
	for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 06:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776838809; cv=none; b=k+B3KsJASVBskKutBSAiu6LRPhJgGBDm9DbHvI1P6jD0P8EHzRhEM6OHlIpV8XKxDxGdca36o7O/7E5gryGJBXYY+t/SKEz+J9zH2IqYkpquqA6XVIisaSF09TQmxrhlsBV5zBpr1djfHilTNxfTi2dnIsO8VzKpx2bO55nhni8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776838809; c=relaxed/simple;
	bh=62ziIt/IPA7GFwdkYJHiXxDdUjlAJ8QH7KWSz0/iBGY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s98dkUb1rpW6QjOk6JZdgzNXdYy0XDR1q3yrD3sMUnLoRM5MhVw9S4/aVWpCLnAmqSMhpb3mmXYcO7n/k8shx6guWq1pjOMHpkxGHqzsjmMvZKhQ09JaV5piDkqN+WFdC4vKUW7w8iNn1Xc6OCdcCcipHjjt4j+1hN52mEVFOik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q6/8FAa5; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-35da9c0c007so4606255a91.2
        for <linux-media@vger.kernel.org>; Tue, 21 Apr 2026 23:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776838807; x=1777443607; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D9ExnrylaUifhraiDuvmiibs6vGtay8V+DWLv2OsyZs=;
        b=q6/8FAa5jDd90+QgYDPwqG7IVD2P9nwqzZogGRUKFaTAHYSFGkXXajwWAdcTpodhEV
         2KznVRnQ0zNmDr8n1FvPvlY6I1Zv1A8FiCt/Fy89i80hNyzVamuBojODXEfMt5fXUMLe
         Vf24ZJHFqmY7UxjzW53sD7b41Igbu7kjvclfs+G1aH8zU8YU36RfN3JYLVaHlHOmx9Qp
         F0zlwYHpANy8yM2+jt6+a0OpGw/tWVJE7xjFRhstfTr6VTAGRijUTjZWJZW45TQEXlY/
         IMEU8ETLv9shmdotK5Ml0j0tx7sZPNrtOnAK4LvqaF8SltGAFIa7NEugoUhPdYwg1cmu
         bl1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776838807; x=1777443607;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D9ExnrylaUifhraiDuvmiibs6vGtay8V+DWLv2OsyZs=;
        b=HQNBcNLxqLA5jdJccPKyLWZD/ZgPswL8zjj98uehhx22BWMKAgpGV6REar/H+QoHhl
         CsYs4FUKZoTy5iO2Vk4EF1qLYgLud6MqOIVX1eStHfQAkURS+N4+nI5d6k01DsPJeFFS
         Rgehk4fdaWql/RvPlhEILSbOkp3nUT4YQ+P08uQAPcpQ+U8V3GzNEE9cknQ11yG2VUfF
         C7DcQUDC25yU9TIPyWuzCUbp2zM2drfBBj1War1p7lo9A9HhX1r5BuCFIN6uWjO2v5qx
         Xc2Kxf3ovZAf5D5Qtre4H1kkIds4pozmoHq9K4H9v77LKEh5oot5xpD8jo8TfVy5hKq8
         MUQw==
X-Forwarded-Encrypted: i=1; AFNElJ/Q7KnZDCLD6YVNzIPivoIbE2AGorBLv6yDApSFQD/lH6277Nfo1W4suBs5XQTq8rZTOYg24lbCFGWLxg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxmdCL9GAcVS8VnKWrlVlhu3NkAQuIAzP/zGPIfSPXnph6H6OBD
	rUcwd7N86kUAbrCa1dsFVoKdfJaoNi7aVQfA1COrigAd9LNesOqyL+V7
X-Gm-Gg: AeBDiet4PmSgTOBKdgrlawvmLaVsawYr9Tci0jQ+ZSLZUM/2jDg8dFDwvfSvJSxPAgU
	pNt2XNapfUJEGVloNFbjcYewRYjTqgdl3vAFVMv3deDYJsgtbQAcBDHCnCtEml3AsjtAu9jwuKF
	qexYNIGZ//3IDQHqNPfpDEqA2Rq20kX0371/2GcwSSdkM/b4k3g5hiD2jntuk7bnMZ9J7cfTg9b
	tX/gaFb1uQJbE7jazTW9mAmlfrIW4CXGNX8Vil3FF2sKeqxYi+nPAPEdJW11DTVpkPbt8u+eoHX
	KWVtydbf+gNAy25orB+Ze0kSIxPOnCzYVhDQoL1WZkieKxWm93xBwyvpii8Vqn6IK8b4YMtzVey
	MuNxdbCX7VH6yWYbMItwb5n66JRpAMEBZvk8/o0oYgkz+OUJ5dtYIVF7lqmWuXw0b9NhRcWn3md
	rxtoehfh0jW+NVh4WFGTFCvxvOHMzVRht9P5rEzxHRUI8FcNb0KPfWQ6MMfBtUkXaLpHp8FFoRa
	ceFCMGcS6lSu2kjVwMq2tNlHvPPRyTKoscTeXW4PVFs0DWKXnOi1onQjWRdRTAPOrNoMWNi
X-Received: by 2002:a17:903:1d2:b0:2b2:41a9:8e10 with SMTP id d9443c01a7336-2b5f9f4e110mr230390895ad.23.1776838807124;
        Tue, 21 Apr 2026 23:20:07 -0700 (PDT)
Received: from HPVictus15 ([2401:4900:1cb1:c66e:4923:54b9:776d:c8c7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab0cf81sm150926775ad.43.2026.04.21.23.20.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 23:20:06 -0700 (PDT)
From: Sajja Easwar Sai <eshwarsajja20@gmail.com>
To: sakari.ailus@linux.intel.com
Cc: bingbu.cao@intel.com,
	tian.shu.qiu@intel.com,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	yong.zhi@intel.com,
	tfiga@chromium.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	iryuken@duck.com,
	Sajja Easwar Sai <eshwarsajja20@gmail.com>
Subject: [PATCH] staging: media: ipu3: fix out-of-bounds access in imgu_map_node()
Date: Wed, 22 Apr 2026 11:49:51 +0530
Message-ID: <20260422061951.352746-1-eshwarsajja20@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[intel.com,kernel.org,linuxfoundation.org,chromium.org,vger.kernel.org,lists.linux.dev,duck.com,gmail.com];
	TAGGED_FROM(0.00)[bounces-59276-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[eshwarsajja20@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2922C4425F0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

imgu_map_node() walks imgu_node_map[] looking for a CSS queue ID. When
no match is found the loop exits with i == IMGU_NODE_NUM, which is one
past the end of every array that is indexed by node id.  The value is
returned without any bounds check, so callers that use it immediately
as an array subscript produce out-of-bounds reads.

The most critical caller is the threaded IRQ handler
imgu_isr_threaded(), where b->queue comes directly from firmware; a
malformed or buggy firmware return could therefore trigger a kernel
oops.

Harden the code in three steps:
 1. Add a WARN_ON() inside imgu_map_node() so the 'not-found' sentinel
    is made explicit and any future regression surfaces immediately.
 2. Guard imgu_isr_threaded(): skip the affected buffer and emit a
    dev_err() rather than indexing imgu_node_map[] out of bounds.
 3. Guard imgu_dummybufs_init(): continue the loop if the lookup fails
    (this cannot happen today, but protects against future queue-table
    changes).

Fixes: 7fc7af649ca7 ("media: staging/intel-ipu3: Add imgu top level pci device driver")
Signed-off-by: Sajja Easwar Sai <eshwarsajja20@gmail.com>
---
diff --git a/drivers/staging/media/ipu3/ipu3.c b/drivers/staging/media/ipu3/ipu3.c
index 84c4d0bf027d..b231e7246f52 100644
--- a/drivers/staging/media/ipu3/ipu3.c
+++ b/drivers/staging/media/ipu3/ipu3.c
@@ -62,6 +62,12 @@ unsigned int imgu_map_node(struct imgu_device *imgu, unsigned int css_queue)
 		if (imgu_node_map[i].css_queue == css_queue)
 			break;
 
+	/*
+	 * If no entry matched, i == IMGU_NODE_NUM which is one past the end
+	 * of every array indexed by node id.  Callers must check for this
+	 * sentinel before using the returned value as an array index.
+	 */
+	WARN_ON(i >= IMGU_NODE_NUM);
 	return i;
 }
 
@@ -115,6 +121,8 @@ static int imgu_dummybufs_init(struct imgu_device *imgu, unsigned int pipe)
 	/* Allocate a dummy buffer for each queue where buffer is optional */
 	for (i = 0; i < IPU3_CSS_QUEUES; i++) {
 		node = imgu_map_node(imgu, i);
+		if (node >= IMGU_NODE_NUM)
+			continue;
 		if (!imgu_pipe->queue_enabled[node] || i == IMGU_QUEUE_MASTER)
 			continue;
 
@@ -535,6 +543,12 @@ static irqreturn_t imgu_isr_threaded(int irq, void *imgu_ptr)
 		}
 
 		node = imgu_map_node(imgu, b->queue);
+		if (node >= IMGU_NODE_NUM) {
+			dev_err(&imgu->pci_dev->dev,
+				"dequeued buffer with unknown css queue %u, skipping\n",
+				b->queue);
+			continue;
+		}
 		pipe = b->pipe;
 		dummy = imgu_dummybufs_check(imgu, b, pipe);
 		if (!dummy)

