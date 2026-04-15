Return-Path: <linux-media+bounces-58833-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uMnNHje732mOYQAAu9opvQ
	(envelope-from <linux-media+bounces-58833-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 18:22:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E522406578
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 18:22:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8C1253088F46
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 16:21:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66B043BD64D;
	Wed, 15 Apr 2026 16:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dl+evy2Z"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF3B331A46
	for <linux-media@vger.kernel.org>; Wed, 15 Apr 2026 16:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776270072; cv=none; b=cv+wpacmy+0efnUtUh9f+aDBPdQeYl/LRLvayokKgM1IWLavx1IbmxryUcSXQh8Fxn6oxcqQHPsZGl/fNzBXrlsrymeM3cp1HSO3IUjXtOuespJ6nR8C0Su7qK4RDa203vLvS9xI8WhOELNMboGmYgZ7ks1JBR+vYN+hXtP073E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776270072; c=relaxed/simple;
	bh=SI2t19iU6EMEQBCp+j5wlbb1GUg+beuT+6A5OpnwZyw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sO8BGOVuldMKc8b8yBuUwy5oSuto6qk95U/f7om4HQanPfd/uTSzwlIJT8Of//g+T7NcKR/DdgWgnN3XNMG21V19K3mVezEWCwLn5CzyJepFQykImUaCCI1JkL/ws2g1T/LCrGPJu6shjlPdGRJ4u8P0UcxJUxlDWFVMZ0hbOa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dl+evy2Z; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-82f5dc076ddso1143730b3a.0
        for <linux-media@vger.kernel.org>; Wed, 15 Apr 2026 09:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776270071; x=1776874871; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M+8gw/M80WE6Bf1ljzJqEZsdPuf1OmLbEHX1VUQEqPA=;
        b=dl+evy2Z6eAvWVReyImIj0Z4Oad21laeZWGCXBsAaCbiLHIhtQVCOminoSKbd5WjCe
         n8JsnVNqr5oPKQGVPu7Yf5kj4lwixznS4LDfrvRnZKuPNUE6x7isYNnhSKG69SGO+1YH
         N8a+vYm53jOkeGpdW7VEv8EXYh71qZh9DxS1P7ahPB6dLUVu9Eu8aW7W6rn0GnH7MBwF
         7t1CjFRsZfuw3QuMNteoMxs18eddRqQwXP9Sppw5aZxO/Arqr/CDJcbeoEjG80nJCW4n
         aLr5tfUPCk6HnHdN+vpxN88g9/I1EgnJugt66sm6vPE48iMFcP91gLHVvsV1F2+ViOxI
         LJ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776270071; x=1776874871;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M+8gw/M80WE6Bf1ljzJqEZsdPuf1OmLbEHX1VUQEqPA=;
        b=kQ8pnRpI5kTRk0YTvmQ16E4wuh+EFIdOHGl/YvBq3M2ZVXtn75V9ioTZU4mA7VLqgt
         a76SxrFHlEPB3v8Qbm3HSPYzrNgWLOUJukdHt+yl8ht1qAnNwmc/JZGTETbZrwxMDO1M
         RXE+p61sWuRzSlk2lagJ+uEZbgeTU5dY0vpHoKh+UVnOBQ2IEi0rAS5zsNutr7N7ILjk
         adU7RYHTgw9tQAXhpu42kZHE/ru++NMCXlpR49Ntm5u60pptnLwz8dX43MefeYlvNBnT
         IRf4MS1YQgXgwI7Sc6zfpyPToV2DL/vx2g+10ejr6PnNcgK8N67gpqFpy7lfup1ujyB1
         1nFA==
X-Forwarded-Encrypted: i=1; AFNElJ+VbsBoI8ddwpuE/iZeKjP6M1Azu0U5LjBFB5vE2BlkQYp0dZCGYOUY41ybiWjwWwig4+JTRVmTw1Qgzw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yycfy4yKWo4GbRbkVpJsTjVbS871H7zdI0B76m2vNYdyFh8yYiI
	uAl3mcDCk1BPNuCan0l/MoqW4M4KKXDeEv7BfH3iifYbjMZcjQ5bpNLm
X-Gm-Gg: AeBDietMCYWnNjOnHndAOvx1ABcjGAI00HX0HGHSZG2+XUHThan9MXCQ0CmNXRW2vmF
	ABhBzGees6WQMxbXx45kiukkXBP3hNTFNjnKMtkXSeSQuDjjbELLW8V2jNa9vHotm29URrLbFc7
	pbCp6LlB4Xs3f3Jbm9pTm092RTY2qUCrVycWxG2OD/hAnRDfkzIePeM+2ZZwW3S4Mq5TqzKuEd/
	/9khCpyKMpryWESX8NQKWrZTr85/v1kwA2vt8Vdpl1piHEDKH6a5I6TU85zqeeu5I1No/qZuqIN
	DAy+t1pJuM92zKk0srEkE9Jg9IxMigwEMZvw6kUTLgId5ET7SnehUuSOrIcjUGUfZCXwg6cOGV7
	mwtQ/ebCGknib2rjfUj4AYFD9KM6iNX+/sBq/ya1q1FuJrE+nuPTfUIuM9GKdx5jz/hPvRq1Ygo
	XVzQbBYkRRb0S5H3FTlh7I9s/sgSa4AwQ0hu04IKlvV5Gq41E=
X-Received: by 2002:a05:6a00:92aa:b0:82f:4a4d:377e with SMTP id d2e1a72fcca58-82f4a4d8eb6mr10659269b3a.28.1776270071117;
        Wed, 15 Apr 2026 09:21:11 -0700 (PDT)
Received: from lgs.. ([2409:893d:1171:10e2:3836:7c38:e5c1:4b6b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f7106abbfsm1373845b3a.4.2026.04.15.09.21.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 09:21:10 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Dorcas Anono Litunya <anonolitunya@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] media: vivid: fix cleanup bugs in vivid_init()
Date: Thu, 16 Apr 2026 00:20:58 +0800
Message-ID: <20260415162058.3551246-1-lgs201920130244@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-58833-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lgs201920130244@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0E522406578
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When platform_device_register() fails in vivid_init(), the embedded
struct device in vivid_pdev has already been initialized by
device_initialize(), but the failure path jumps to free_output_strings
without dropping the device reference for the current platform device:

  vivid_init()
    -> platform_device_register(&vivid_pdev)
       -> device_initialize(&vivid_pdev.dev)
       -> setup_pdev_dma_masks(&vivid_pdev)
       -> platform_device_add(&vivid_pdev)

This leads to a reference leak when platform_device_register() fails.
Fix this by calling platform_device_put() before jumping to the common
cleanup path.

Also, the unreg_driver label incorrectly calls
platform_driver_register() instead of platform_driver_unregister(),
which breaks cleanup when workqueue creation fails after successful
driver registration. Fix that as well.

The reference leak was identified by a static analysis tool I developed
and confirmed by manual review. The incorrect cleanup call was found
during code inspection.

Fixes: f46d740fb0258 ("[media] vivid: turn this into a platform_device")
Fixes: d7c969f37515d ("media: vivid: Add 'Is Connected To' menu controls")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/media/test-drivers/vivid/vivid-core.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/test-drivers/vivid/vivid-core.c b/drivers/media/test-drivers/vivid/vivid-core.c
index c8bf9b4d406c..62cfb5feb2cf 100644
--- a/drivers/media/test-drivers/vivid/vivid-core.c
+++ b/drivers/media/test-drivers/vivid/vivid-core.c
@@ -2289,8 +2289,10 @@ static int __init vivid_init(void)
 		}
 	}
 	ret = platform_device_register(&vivid_pdev);
-	if (ret)
+	if (ret) {
+		platform_device_put(&vivid_pdev);
 		goto free_output_strings;
+	}
 	ret = platform_driver_register(&vivid_pdrv);
 	if (ret)
 		goto unreg_device;
@@ -2311,7 +2313,7 @@ static int __init vivid_init(void)
 destroy_hdmi_wq:
 	destroy_workqueue(update_hdmi_ctrls_workqueue);
 unreg_driver:
-	platform_driver_register(&vivid_pdrv);
+	platform_driver_unregister(&vivid_pdrv);
 unreg_device:
 	platform_device_unregister(&vivid_pdev);
 free_output_strings:
-- 
2.43.0


