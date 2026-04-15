Return-Path: <linux-media+bounces-58824-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uEKmCb2t32lCXwAAu9opvQ
	(envelope-from <linux-media+bounces-58824-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 17:24:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C61F7405DCD
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 17:24:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B36373040B07
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 15:24:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7DF43DA7D6;
	Wed, 15 Apr 2026 15:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L3TBPJCp"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A0303D88EC
	for <linux-media@vger.kernel.org>; Wed, 15 Apr 2026 15:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776266641; cv=none; b=CkpA+oBrV0uEkGgyBp2dNuMafnmf+ooxCuWgohWnjpAXsuQEHrx9VvtapwAQbkazJIzjwd7SWnpwJhhKDPRIvFlMPkXjnA+F9yI1ppY8SZSIJvSXZoxFz4eH22ElBUe7Q82wxl8EpqPEVbyAU5c45eJbUYfGUPUbTpaRQji+J2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776266641; c=relaxed/simple;
	bh=zWofefXAMoBIMWD0yGiB+cnjkunx6Q6U1CvnfYTDYNs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DUrwB8OaT3mi3KxBDukpOX10l6g0LdqFcxK3b3auaIEFmC5kaq1Oh9fz0etJ3v+4vlt2B+irdi6c/wNSF5JfCclD7HXx03WCmjJkEQSSgqbCjmjCJzoN7sBeXF5CVOgyFfG5Ue641Ok1TsKmD6M/eTShDydcMM30QNJRsT8YW8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L3TBPJCp; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c79467f11abso1726211a12.2
        for <linux-media@vger.kernel.org>; Wed, 15 Apr 2026 08:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776266639; x=1776871439; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8ZxxH/dKWsV+bGW+MZF3EUGH4YsLgoDpr4lfqL5yS18=;
        b=L3TBPJCpp/Tri7IHqe7wXCwNlJ916xtl+IkLVFM3pwoHYGtIM4TU2GTE/VjRHbl3NC
         lu7LZPtqKEPJX2HLao3vJfGXpsFCAB1mn/8FjopnF83yXrV0/RT+XaiidawAvlKJC5bP
         i2WuOan9R4ZT0C2yOPB0PTyJUb2sF6ZVZloqWF1a7zFq+cw6xeBYDadCp/T6ZSHi50u/
         2iEXNmuaEs5hcbhOvQgOqHuXVjhVWqXYEOiX/Zfj5i4oAQEEIBYzAZrrSCNk+GSNDN6d
         4gm0BsyaXOyV1T6flOw/f1IgPRTMN7G4uF6Xb5kKRIavC12VuUYRdc2GShE4f38Q9NxB
         c4Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776266639; x=1776871439;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ZxxH/dKWsV+bGW+MZF3EUGH4YsLgoDpr4lfqL5yS18=;
        b=rAea/NC+baSs0mDXBqDIDf8T24rh++3BgJrLluSNW13w0w11/7eprXOXvcCSMH+G4d
         SzlPYl4jH9vkNfTHA2P27Z0icSA5XElnUCJ/ey66c/vNB4Th/uhEWuuqB71aoOSgdbPc
         ca1MrZtmWOEVxUIPLMx8j9OqqC+RN18s8U4RmY8CrW23RDT4KGsypLVEUWrphlkpQmKv
         p3Gl7eWqIWSGl7WdD9f4kLnPoN7oC9Lmr+ZhhYLhGLZJs0iNSyY36x0gjZSfK2B47GR6
         yAUvAuMWi0gcLFInvkCxW474c3hsdOBOj9Ax+iAIxG7ob5KhaASX02Ayttg9vB9HiF0c
         dG/g==
X-Forwarded-Encrypted: i=1; AFNElJ8ArdGMT6mS14VPXECklRI4wL2LYchQM5WN3lOWh3cvY0gQRgeh4v1l7I0b865cVZCprh8ZPdwONMHzHg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/sQazi+i7fy1RD3uFjVidZo8G16KMRpohTfEnDDTVFVlc5FxJ
	x6OGM9+g+khSsKEbM4J8n13CXR09S7/cxrigln/B3hL2AcNiPRtVAItl
X-Gm-Gg: AeBDievLZdE0SgqS6Y+FckCecvfW3muTixZGJsgmMI8F4kZjlyWIhWrEthX9hMTzIh+
	eWBgLZ5qk9jZdc4PRDeG+VeRVeLBN/5ZgdQahOeAPfdS33qzPTBogVcdbiMnfKm0pzRmoRPQ/8e
	XTw4nUy7BCkB0qmWu2k/GG3N6cxRojXZxTj29PYEgLQbiEW9ZhJne8eP8Bskt6KBagpf9Ezqo1D
	e0tvhEit/khBfCJvtTiT6P6wg/zA18jgRWVtUBTVfq3zQvjB7TG40xdQ04okw9qf9D7pZAY0Rke
	OA67lZ+667kNQ8nn81YD+FSg9Nc+MiaA13Bhk0KLOf/IiMikYjTPAyR3Ku81S2QdIoxW34+uQ3D
	b7Su1aU7CdYE9jMDxLV8r5fKFB8WtMdhSNP/JBexw2Atn/AM4zBLpqT1pP5F2CNNqpQ41p4/2tq
	XVImSMBXdupeoh81uP+wG9huKNA7XgKb/Bkj3/Ubujkg==
X-Received: by 2002:a05:6a20:7d9b:b0:398:b16f:7045 with SMTP id adf61e73a8af0-39fe3f5d036mr23819827637.29.1776266639449;
        Wed, 15 Apr 2026 08:23:59 -0700 (PDT)
Received: from lgs.. ([2409:893d:1179:9a96:408e:b322:d944:7204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f6744c923sm2433719b3a.52.2026.04.15.08.23.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 08:23:58 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Keiichi Watanabe <keiichiw@chromium.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] media: vicodec: fix reference leak on failed device registration
Date: Wed, 15 Apr 2026 23:23:43 +0800
Message-ID: <20260415152343.3398025-1-lgs201920130244@gmail.com>
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-58824-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lgs201920130244@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-0.996];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C61F7405DCD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When platform_device_register() fails in vicodec_init(), the embedded
struct device in vicodec_pdev has already been initialized by
device_initialize(), but the failure path returns the error without
dropping the device reference for the current platform device:

  vicodec_init()
    -> platform_device_register(&vicodec_pdev)
       -> device_initialize(&vicodec_pdev.dev)
       -> setup_pdev_dma_masks(&vicodec_pdev)
       -> platform_device_add(&vicodec_pdev)

This leads to a reference leak when platform_device_register() fails.
Fix this by calling platform_device_put() before returning the error.

The issue was identified by a static analysis tool I developed and
confirmed by manual review.

Fixes: 256bf813ba39f ("media: vicodec: add the virtual codec driver")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/media/test-drivers/vicodec/vicodec-core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/test-drivers/vicodec/vicodec-core.c b/drivers/media/test-drivers/vicodec/vicodec-core.c
index 318e8330f16a..bf9a75feee93 100644
--- a/drivers/media/test-drivers/vicodec/vicodec-core.c
+++ b/drivers/media/test-drivers/vicodec/vicodec-core.c
@@ -2238,8 +2238,10 @@ static int __init vicodec_init(void)
 	int ret;
 
 	ret = platform_device_register(&vicodec_pdev);
-	if (ret)
+	if (ret) {
+		platform_device_put(&vicodec_pdev);
 		return ret;
+	}
 
 	ret = platform_driver_register(&vicodec_pdrv);
 	if (ret)
-- 
2.43.0


