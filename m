Return-Path: <linux-media+bounces-64808-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Ghs4EX/dLmr15AQAu9opvQ
	(envelope-from <linux-media+bounces-64808-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 18:57:35 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CABB6819AD
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 18:57:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=IJhReToZ;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64808-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64808-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 20A4630115A9
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 16:56:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7166B3955EC;
	Sun, 14 Jun 2026 16:56:49 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F9F2EEE84
	for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 16:56:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781456208; cv=none; b=Zqi3CPoU59bXpuLjmkp5Xz1BHYObo/sQglT9h3rJBnyhV5VVQ/X4xNOl/3CxS1V+hRe08SRLFbInfl+Fn5nImOBGbnT5M1ID/ijloRVOwvvcdmVL3lNXY+xZB15sF/ZbMHIp7ndpEN1Acf5Y6WKxUZDofvOi0z/S/mzAecJ+vtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781456208; c=relaxed/simple;
	bh=DybZqMDvfeC0vf4wJRSP5Idx3cOjlKYAUoaViXsxfVM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WEYz8/DGqfgFGfCuRJDh+5vAOZR4B0ahgpDP67kH6QkmnBP9wsQ4I53mI0n+M9bWz7K6DFL3WcKVE7ZXYsE5apiYL5SrVY78HQszvyw3f1nOQJeoNs6UJ8MWl2vdfWiPp5BPOUgBHO6gTWu3XDBRXW/YB73gOAxsQ2mzFevhIA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IJhReToZ; arc=none smtp.client-ip=209.85.214.176
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2c0c2d8b95bso19779285ad.1
        for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 09:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781456207; x=1782061007; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5xdBq7bfFoFs3H0cN+tvWvWnlbMmAQfwJXofXSw1uL8=;
        b=IJhReToZ6rjOF7AsmVuoHZf50cEbLIrG4PP87krKUTuaff6ejD+zfZwJE3JrpOZ096
         NJQMXzhp73pUUA8vD/7Gvf2dNk8oCH06gYdQERrEAKw15nqCf/VZUqO6sLLAUyRiPNzA
         uKOwvmLoqetP8T2Exu3LvFNAEv2VfdKa7m66WSFq+ehTk57WGwzOnqI1bZQPYy2R9Dkb
         MfJhEzq6MYzAjruWUb004gBKiM7PfM7IjE2viNJX7iL1axYZN9CWeTtN8+V49SKH88GO
         3twfkgB+HFaCMCYFFQGzNxAhqrCC3A44pmoOdHOBW+s/yO/qnUiP5Bb6ISWOMV0lyvVB
         kbGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781456207; x=1782061007;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5xdBq7bfFoFs3H0cN+tvWvWnlbMmAQfwJXofXSw1uL8=;
        b=q4/yTfSwC3QqU49JDajK7veUzNgc3UwYahWyUz/nMWJDBaP2GOLuPSIzX1cWQGmomH
         /5knJgEJ1riFsSThOpJ4B0opwySqFFRyRttlUO6xologpx7aIjc8Wal0UcHHdg9oYPZ5
         ANhpJ1Ep++67tm7BwSFdoSNHW0kPh8ODQ8C260KcXp575MDFHQ7pM8J7yTxLLLaeRjQs
         l2FLq/ldl9WMSqVBAB20uOHbxL4yIgZBmlKH0cUaUly8qPn7yTpuHkYJDQgWSX9iQkkF
         aR5aOEr0AEACK27Jwdw+gRqRmzYGPO6vUTwauLpBXFP+hU0YLSB2VNplgTZgAoo1DZIC
         49eQ==
X-Gm-Message-State: AOJu0Ywm30eTcJmSor3drPJrE5f8t//G1PABMgq3thoxyMZaY0NLgmdg
	N6M1tK/oIpIlgXoZBx6GC+U4ust/oJ5fF8SU3BFLfLEG6dj7TaPWrBpFnB/4N57f
X-Gm-Gg: Acq92OH5+fe25SBUMwiEO5DrxzpXwgTOX2279sJ8ZC6Pa45jXUMXeq6fPqwsJ4yYzqR
	L1UYYNTsD8S09lgwmtNSVz9zHRexnKcwhVzovz5ha0GlpF3siCeSxH78irSbOm68+go0hzEBuhe
	g9Priy792NEf+qqEqe0dKk7sx0/BEvo6Dk5UoHLdxze9T8Kx8T9i6ChgcO+XroVM30TVlE1AVBH
	AR4tHv7++or0ryuw4Uy66PHTm5dWHLGTUCDfWMc421+Wh3W2oWSnaP7QmT0HFmuDiiCBZ3VLejp
	wHNSfjLRX03WcAAZalcNRwyu4cyFtRpHi5JZyLn8nE/6+wwbiqwTnYONqTzwY8PAvtcM6ItnoLe
	TTzULB+77JQrGOojPmGhM8M+Zksp+JOSECQDfQn3WpnrspA8/D1NYGSKyJdbjHgLWMpLjsf0zQD
	tY7KG9pGNSltX7bR0SYjAG+xhnOYAefFHW9zPWLYXRXyJ0lnmTOd0f
X-Received: by 2002:a17:903:32c3:b0:2c4:397:b77f with SMTP id d9443c01a7336-2c664271a10mr86213895ad.18.1781456207188;
        Sun, 14 Jun 2026 09:56:47 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.37])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f2e5590sm85284025ad.14.2026.06.14.09.56.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 14 Jun 2026 09:56:46 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org
Cc: Biren Pandya <birenpandya@gmail.com>,
	Jacopo Mondi <jacopo+renesas@jmondi.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 02/22] media: i2c: max9286: Add missing media_entity_cleanup()
Date: Sun, 14 Jun 2026 22:25:39 +0530
Message-ID: <20260614165630.3896-3-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260614165630.3896-1-birenpandya@gmail.com>
References: <20260614165630.3896-1-birenpandya@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,jmondi.org,ideasonboard.com,ragnatech.se,linux.intel.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64808-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:birenpandya@gmail.com,m:jacopo+renesas@jmondi.org,m:kieran.bingham+renesas@ideasonboard.com,m:laurent.pinchart+renesas@ideasonboard.com,m:niklas.soderlund+renesas@ragnatech.se,m:sakari.ailus@linux.intel.com,m:linux-kernel@vger.kernel.org,m:jacopo@jmondi.org,m:kieran.bingham@ideasonboard.com,m:laurent.pinchart@ideasonboard.com,m:niklas.soderlund@ragnatech.se,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9CABB6819AD

The media_entity_pads_init() function initializes the media entity, but
the driver forgets to call media_entity_cleanup() in the error paths
and remove function. Add the missing calls to fix the API violation and
prevent potential future memory leaks.

Fixes: 66d8c9d2422d ("media: i2c: Add MAX9286 driver")
Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/i2c/max9286.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index ac0712ce1e65..31598fa34c6c 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -1062,7 +1062,7 @@ static int max9286_v4l2_register(struct max9286_priv *priv)
 	priv->sd.state_lock = priv->ctrls.lock;
 	ret = v4l2_subdev_init_finalize(&priv->sd);
 	if (ret)
-		goto err_async;
+		goto err_entity;
 
 	ret = v4l2_async_register_subdev(&priv->sd);
 	if (ret < 0) {
@@ -1074,6 +1074,8 @@ static int max9286_v4l2_register(struct max9286_priv *priv)
 
 err_subdev:
 	v4l2_subdev_cleanup(&priv->sd);
+err_entity:
+	media_entity_cleanup(&priv->sd.entity);
 err_async:
 	v4l2_ctrl_handler_free(&priv->ctrls);
 	max9286_v4l2_notifier_unregister(priv);
@@ -1087,6 +1089,7 @@ static void max9286_v4l2_unregister(struct max9286_priv *priv)
 	v4l2_ctrl_handler_free(&priv->ctrls);
 	v4l2_async_unregister_subdev(&priv->sd);
 	max9286_v4l2_notifier_unregister(priv);
+	media_entity_cleanup(&priv->sd.entity);
 }
 
 /* -----------------------------------------------------------------------------
-- 
2.50.1 (Apple Git-155)


