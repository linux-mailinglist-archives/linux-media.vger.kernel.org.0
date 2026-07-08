Return-Path: <linux-media+bounces-67043-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AaUpEJ92TmoJNQIAu9opvQ
	(envelope-from <linux-media+bounces-67043-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 18:11:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8189E7287BD
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 18:11:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=BWPvEA9O;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67043-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-67043-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B053D322ADA0
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 15:44:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54F72409293;
	Wed,  8 Jul 2026 15:44:36 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980D43F12DF
	for <linux-media@vger.kernel.org>; Wed,  8 Jul 2026 15:44:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783525475; cv=none; b=FJ1TAa0P9sm+PGFA3CvJEHzkwdp0AVR9y3AOhOTmTwAqvz2tDOpOvB/ciJT6V2I3tOUdbSew1cxYgFhtQSmuJa+02Ja0Ufs5tNuZY8zkp8BNHes6b04IFIzNArwQH2O9vbYG11OqNtR2uhsXwCR2sh3cU4Bf9P91SqXsYUFKByY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783525475; c=relaxed/simple;
	bh=Dj1OMxrAwOcaATK7Yw0zk+F7nLdCP6BeW65BWVUG9Bw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KEXKb4J4LaXAAMpZHWZdK4FjfgRf70YRcJF4JQsRZYKtTU7g6M/Q3VcMxjE2yc9EZ6hpk/ZVmxXnkQrtYT42ZLPXFWEvLKO0DGeuaV6HH5pQAogUXCL2PrzD+meKzuKvAamgCdYdPilNzAALRIdU1KwKI6AKwWqCjMgBDmRcjXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BWPvEA9O; arc=none smtp.client-ip=209.85.214.169
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cc7ef7ec27so11547155ad.1
        for <linux-media@vger.kernel.org>; Wed, 08 Jul 2026 08:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783525474; x=1784130274; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RLs6HG919lQIdIHJU5oQosncGb0LHNC2V65hfQ2rlQw=;
        b=BWPvEA9ODZkuEzZ6II/vkLEobXKWHvZgdLxRQaMlMj851mH0i38K5k9gWCpoWYAKEW
         aPiRjgiwzgN/L2LdsdQKcv7Wiv1O2rGYl9bbCUZ+QNVQK0jY8Yy1fQQH04ZIgyb3RulC
         OalFegLWU69rUxVzQk0ZlspX68Uk+y2HRT/JkARBqX3sidMvHRkVQt9ZWCSg3tZaTwSF
         prA+88YLQDwcaqkBoPlUU1cPIk1dZGdIIm/cFhoillLPgI3YckZLOBTx7toSLVeDrNuK
         Ql7I7aLTd9TccT6evUABni+bLmCg1XBvGvzFrdi/V58nITFGJdEQBUdBQs/2lcX786Dx
         mRRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783525474; x=1784130274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RLs6HG919lQIdIHJU5oQosncGb0LHNC2V65hfQ2rlQw=;
        b=eUPvYYpnzdr44v3GPitQAhptVJbYufPNTbZh120EdDBTdF+/SxsK8XeXdddo7pQZTz
         5uk8VdG+eFjdtxi/aSAibyPZTMvGG6dyOXorNDxP5drIANlOHaqgFc71wTyhk3u02W3B
         9YkHn2S6LyUlhtbubEpc05v9VnqBazSHK9lODKOGir2WHVnzQRImCXQ/IjjFHXjPbhKV
         Vssckp+v1IkG7tjNYbQhHZEwCVaxo0Q2lm5Ld5YaYSCwjgSO7WhENyhI4y5RPW+7KZp0
         FFN6Q89MnrQeNgBtSpUTVY862K7sj+/csv92U6Ji6Dm4XTEfTB4AqgaBk+sMAKOEnN97
         ksmg==
X-Forwarded-Encrypted: i=1; AHgh+RoF0c3nyIunMl9ozO6CFGUaGm4XbanC2HC2G4nwcaG/W6pOwYc3o5wPoI4ai5nS4ZlzC95W5nr2SEqIMQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwoBVHrdfF1DtEE/49R6RSR/CtxoCyrHHK3BFckqxHwaUx4cr1U
	Z5MlUbC8syz4x7BahIqBVZ557p4InBTDZDB6dFLPA6nGOygyNR1Ky8ok
X-Gm-Gg: AfdE7cnhp77iUEZ2iL7uznSKGlfJNHEDdl8sTqG7bwNE3DylEbE1/HOumCw+yGJh5ub
	Yd23BUp5boUHmMTGo0/Am39bA7/cValxh++uSKhd4gTwgFuOWwqbdtUwDJoHpIYy2E/r/jj/klo
	Ay6KWJKyw+u2zBHwM23KXSrsXQq6KO/BCiTr8ycvQVRHtdUFsspJj4mv/wSi4lcXIHba3Tus8OO
	CxsAYudWneiMp/MYV1pVkBWVN7286z7Yg/nw/n2w17lRuABBuHNxLIdV4ti5PUcXP2+LH2GpX+u
	JkOf0a6BkP/X2V523qNZdRaKyuA3509zjL79XaL/g4KPkNoAN+VpmA+ttOOYd9Bo/LMQi4nOMqe
	1YiBcBXrUveupqaCEW9mQ5STsyRlOo1GI9Wez4flYPGFOg89HzpFUHkI8ufKWul2Ztr7S/2NQwI
	oyHzDc7/GsFwHauB+Hw/u+g/VKVMKBKB6MNAcuK3g9cWUyRl30620WLQ==
X-Received: by 2002:a05:6a21:670b:b0:3c0:9c19:65b5 with SMTP id adf61e73a8af0-3c0bcc3ae41mr4057315637.61.1783525473909;
        Wed, 08 Jul 2026 08:44:33 -0700 (PDT)
Received: from localhost.localdomain ([49.207.223.101])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b6594f6a9sm22396749c88.5.2026.07.08.08.44.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 08 Jul 2026 08:44:33 -0700 (PDT)
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
Subject: [PATCH v4] media: i2c: rdacm21: Fix missing media_entity_cleanup()
Date: Wed,  8 Jul 2026 21:14:21 +0530
Message-ID: <20260708154420.51617-4-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260708154420.51617-3-birenpandya@gmail.com>
References: <20260708152929.50074-2-birenpandya@gmail.com>
 <20260708154420.51617-3-birenpandya@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67043-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:jacopo+renesas@jmondi.org,m:kieran.bingham+renesas@ideasonboard.com,m:laurent.pinchart+renesas@ideasonboard.com,m:niklas.soderlund+renesas@ragnatech.se,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:birenpandya@gmail.com,m:jacopo@jmondi.org,m:kieran.bingham@ideasonboard.com,m:laurent.pinchart@ideasonboard.com,m:niklas.soderlund@ragnatech.se,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8189E7287BD

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
Changes in v4:
- Rebased onto latest linux-media next branch to resolve a merge conflict in rdacm21.c (as reported by Media CI).

Changes in v3:
- Added a blank line after media_entity_cleanup() in the error path (Sakari).

Changes in v2:
- Fixed a bug in v1's probe error handling where media_entity_cleanup()
  could be called on an uninitialized entity.
- Added Signed-off-by tag which was missing in v1.
---
 drivers/media/i2c/rdacm21.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/rdacm21.c b/drivers/media/i2c/rdacm21.c
index bcab462708c70..531b71d0a94df 100644
--- a/drivers/media/i2c/rdacm21.c
+++ b/drivers/media/i2c/rdacm21.c
@@ -588,10 +588,13 @@ static int rdacm21_probe(struct i2c_client *client)
 
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
 error:
-- 
2.50.1 (Apple Git-155)


