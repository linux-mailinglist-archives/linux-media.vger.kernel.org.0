Return-Path: <linux-media+bounces-67042-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gPHaBBt2TmroNAIAu9opvQ
	(envelope-from <linux-media+bounces-67042-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 18:08:59 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B8A728759
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 18:08:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=NBvz52N1;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67042-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-67042-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C467D318A06A
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 15:44:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 789E8409275;
	Wed,  8 Jul 2026 15:44:32 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3CE23D3332
	for <linux-media@vger.kernel.org>; Wed,  8 Jul 2026 15:44:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783525471; cv=none; b=sGV4vXAr3e3CTcs9xPs1sd6OuzzVEwVUZEc87mLNMoilR9FCZhp0bcozYoDWEWbqHC4UZNNJPDm+P+Ng6wjCDquddeaJhK0C05WnZ2OLhQqDl4LH51fKOInHZxfVqPbkCVs4zbKGoRA7yprcRL38RgwJKlTuZ5mLcw15zdWYu3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783525471; c=relaxed/simple;
	bh=r0C975gZeLL09EA1IabRWPXvWapcmgn9/xuO28lAiBo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X9aZzknU33QjLudcTcGQrH+N8fHuUw0s30BApcWcCHi8kRkvDVxICBIqWcofYqwdDh4aMVobYrXkeAxDI9g2NWtYgv1w5IlS34thn1Q/i/dY4mpuwY5ub47v6bGcPobB/KgJfM3N7cEEv5qTGSA2UZY+eA0MXqpEKnEZmqfKSgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NBvz52N1; arc=none smtp.client-ip=209.85.210.175
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8453427d3f4so812107b3a.3
        for <linux-media@vger.kernel.org>; Wed, 08 Jul 2026 08:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783525469; x=1784130269; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BFn8FejBTCJP0/oL6vRiRzlMdIriUbrnaDXU1TC7Ulg=;
        b=NBvz52N1tjR1oBpvqZtZrDbBQPCOeb85A+JXCZ0/3A77dR+0Do5aWOAe4MNowOR86p
         vNzPK0fA5KQNZMGVfhqPPhUz2aBaEKvDG9kJDqU3OcRRMsl7IUU44ZmVgHkRoX7Rla3U
         oSR6/U08AyG7padmlzP7Zc9Mcs7FTgykSRGHWOPqIkLCDh2iBqnrLnG6WNaMm42WmTtV
         mO3uP8RENiFe3sNgYgob8rrjJUktY4nLwhinEQyUbApc2MpxG097yE5TDMPhOvWLLSRw
         2FKHs12W+1SKTOP1nzgaby0rrHxIMAVSb0MW+rK/fPbB0PoDh0knV7b4J4ZIo7eyDEDd
         w2AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783525469; x=1784130269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BFn8FejBTCJP0/oL6vRiRzlMdIriUbrnaDXU1TC7Ulg=;
        b=GtV2KOnPMaMpAkkgYxUbaKxMcwfQ6jyT/CornDt3IHUFzb/nRi38fWdOqsQNQZRiic
         XmLYgqVk0n+4wIgMe4G8fhrMaCVfotCo8KlocgurRLuntNO9gqcwSe2kJJtnfquSAlr0
         aCBoCK0WrGavsagZAB30hzHV3UUFn5Fo5LFUnavVjdtUzRA6F5uNsVpvyg2lri6rfpBw
         +VCPc5qYiuzbuCpyj7+PnUPflxqa1JMB0iWXzV5bcdG0/Do9HWh2xplWHU4hcOHUG9ne
         Q/B8Uk7ORqJDXLbKK8ZhjdihVnBcjn4rxO566k+cEe0S2L7RDWzSHhs6TFm6KwdCeNDD
         lkVw==
X-Forwarded-Encrypted: i=1; AHgh+RrJL/4d6WGLAN8en1oQTrqD9NTVXybimm2TWfg1ad5z1+/x4aJ5nqn9S9MGmpOLyMYV7R21HqobQP8BGw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyjK+AYaqyISMCZXqpIO4NRUDrTHFMemmEsPQLw+gChQC1lVlbc
	9zBDhbIDZiiwZk48Y223vgn+aGjnFBjqR3vegmmjQtgh4OxuMo4I1F+j
X-Gm-Gg: AfdE7cnmGSbrGnPw8ffff4z1o1hdhWGf2YXXEExJ2K89r53MUuPw/iNB1mj+ApcQ6Ak
	cAbhY02aRO9IQ32lME8peFDliIx0X52Io2RFSYzHG4yykjvJh9RKFvEgJHNjX2eZhp00UlOk7Xi
	i4S9uakoVRzHF5bDeors4zSR3LXrsml2h+xNAExYbfMKKjyKEc68wMuBzMsO9koPPW66WdLwCCV
	5GZ8/ajAaRQW3xKB0LdUyZ5MDlJc2q8F6+R0lL9sIbP/m+u1cDIl+C6EFsQQVnIFlASJftZwwF2
	A1PSt60L8WlOwswIy5vmABMBos+W+wjkA8BBDooU5cR2MWnyTL6/VoWUH0K3PPOBjhxHL00En3w
	Adbu9p6RGm6J3bsjQZmpiVjvxvXyRWEsH6Tv2QKckALJPd+T+ocSsReq0Sn05is25jXXe/iifyB
	j3pDwx7xdggDbWecSlXOfJmHRqruCEpAJsWE7Y+cT/83w=
X-Received: by 2002:a05:6a20:a10e:b0:3bf:7c02:c46f with SMTP id adf61e73a8af0-3c0bcf49b7dmr3872548637.14.1783525469246;
        Wed, 08 Jul 2026 08:44:29 -0700 (PDT)
Received: from localhost.localdomain ([49.207.223.101])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b6594f6a9sm22396749c88.5.2026.07.08.08.44.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 08 Jul 2026 08:44:28 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: jacopo+renesas@jmondi.org,
	kieran.bingham+renesas@ideasonboard.com,
	laurent.pinchart+renesas@ideasonboard.com,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Biren Pandya <birenpandya@gmail.com>
Subject: [PATCH v3] media: i2c: rdacm21: Fix missing media_entity_cleanup()
Date: Wed,  8 Jul 2026 21:14:20 +0530
Message-ID: <20260708154420.51617-3-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260708152929.50074-2-birenpandya@gmail.com>
References: <20260708152929.50074-2-birenpandya@gmail.com>
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
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67042-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:jacopo+renesas@jmondi.org,m:kieran.bingham+renesas@ideasonboard.com,m:laurent.pinchart+renesas@ideasonboard.com,m:niklas.soderlund+renesas@ragnatech.se,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:birenpandya@gmail.com,m:jacopo@jmondi.org,m:kieran.bingham@ideasonboard.com,m:laurent.pinchart@ideasonboard.com,m:niklas.soderlund@ragnatech.se,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 77B8A728759

If an error occurs after media_entity_pads_init() is called, the media
entity is left uncleaned, potentially leaking resources or leaving it
in an invalid state. Similarly, the remove path misses the cleanup.

Add a dedicated error_entity_cleanup label so that media_entity_cleanup()
is only invoked on the error path when media_entity_pads_init() has
actually succeeded. Also add media_entity_cleanup() to rdacm21_remove()
to ensure proper resource release on driver unload.

Fixes: a59f853b3b4b ("media: i2c: Add driver for RDACM21 camera module")
Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
Changes in v3:
- Added a blank line after media_entity_cleanup() in the error path (Sakari).

Changes in v2:
- Fixed a bug in v1's probe error handling where media_entity_cleanup()
  could be called on an uninitialized entity.
- Added Signed-off-by tag which was missing in v1.
---
 drivers/media/i2c/rdacm21.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/rdacm21.c b/drivers/media/i2c/rdacm21.c
index 41d4242a9b583..5cf159eb8891c 100644
--- a/drivers/media/i2c/rdacm21.c
+++ b/drivers/media/i2c/rdacm21.c
@@ -588,13 +588,15 @@ static int rdacm21_probe(struct i2c_client *client)
 
 	ret = v4l2_async_register_subdev(&dev->sd);
 	if (ret)
-		goto error_free_ctrls;
+		goto error_entity_cleanup;
 
 	return 0;
 
+error_entity_cleanup:
+	media_entity_cleanup(&dev->sd.entity);
+
 error_free_ctrls:
 	v4l2_ctrl_handler_free(&dev->ctrls);
-	media_entity_cleanup(&dev->sd.entity);
 error:
 	i2c_unregister_device(dev->isp);
 
-- 
2.50.1 (Apple Git-155)


