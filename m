Return-Path: <linux-media+bounces-64845-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9EplJgsPL2px7gQAu9opvQ
	(envelope-from <linux-media+bounces-64845-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 22:28:59 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EC04C682295
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 22:28:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=c4Uwq1pb;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64845-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64845-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0B78B300A770
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 20:28:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA47931B10B;
	Sun, 14 Jun 2026 20:28:50 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F63CB67E
	for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 20:28:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781468930; cv=none; b=AQjNPNKQSxy+pE3HxLCiRW8U+/Zf/paYTd/qcnYVxDgLkEaHskgarnuJjcbvj67v2wN5C48VHhUMDsPxRVmocEFUub0k0DcRO6OU0WKgjS/QQPfc902BAfqGLAno7e67TPk85VnEQ5Saz9yqMwyToDsjRJ/Xv8PUEru/qYVc414=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781468930; c=relaxed/simple;
	bh=DybZqMDvfeC0vf4wJRSP5Idx3cOjlKYAUoaViXsxfVM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X+X0XhH2bQOxT5hWK9vHW81+ZchOmBTOyUCWSHxkJpv+1F2IqVpe8gug1X9i4BjNaeqc/U9zwdFge6PX8CIQHhgYlfw5tmShzz0ClFzABzd3PdUPYo/TkIsgNHmKJ0EOGnsvJXJBeyGxghhMnLTfj7Qy1LIZ0X90Fi+sYtgJtyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c4Uwq1pb; arc=none smtp.client-ip=209.85.216.45
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-36baeec21dcso1650110a91.3
        for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 13:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781468929; x=1782073729; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5xdBq7bfFoFs3H0cN+tvWvWnlbMmAQfwJXofXSw1uL8=;
        b=c4Uwq1pbeAJQ2kwtWWWjBI/U+NGpXJGB3h3rrW1o/r4Jn7NUjIT8yX+OtWTrU8FIiL
         nS+uo+Wy5F5wn7aJuniY0WDetZDzQq3WOpviXupb4XSIT7HOSDW3up3VfPRPILml5Anb
         epFHNCaZYY9CCdWyCBDUGAcJJs4xpO9tOqQS/9cGFxWkuNihjhW5hkcUT18b2DCxtjHo
         SVTAGcrHFICBpVtCxldRwhhyFrAzpzCEFqCPxCTYTy8NXQD3bryxqmaWd2JRQ0F8e16S
         jEedirSI+NerSp9yJpJ42bcjlAA8d2Pc5OsG6YuOvn35BJoSFZfPUPb0SSoX7HecsUmT
         AY3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781468929; x=1782073729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5xdBq7bfFoFs3H0cN+tvWvWnlbMmAQfwJXofXSw1uL8=;
        b=Kz9q0UA1019dOUICPXklMJCjFrMX+9lhPccTGdIll+soQBx5Kjg6ucdCF8JOwZBiSZ
         abJjzkDDdEoDX7m3zTclxKbnIp26EfbCDh3w9TlsqHL6TCdnF3Bqr9vwFQ8QylvrGozp
         vae2K0xW+1JSlJ+rxXkJ/xTsBvZkw9tJWneGeCfiN0b6wlJbG32pKxSYa5uIwvr7+b6n
         7eVFIHTHvYbsUmPxD8z4d8k16r2rpvMIRkewkQ9kxvyU6Lo4+plaKgTAIzYX4ACs1IVn
         Iing8+3wLcSXBeu2EOA5y2o6yEaT8SES6ST469BVFmzwZqncqyY8Ma97sq7WCuKVIwar
         G5lA==
X-Gm-Message-State: AOJu0YwA71MbG/vVbdHdreBFJvcG10/r8/OpmQZrPhmGMCfsIGELclyC
	Oh+keluBUdOMsOFqDEIORDcj53IsVkLiK0Dus1OKz86s4VYn8MguaPmYwV14HWPY
X-Gm-Gg: Acq92OFnNPNPn6jpM4cAkzYDzDFJMtHr0CFaJPQZFQkLSNn6lCjG2Mito7yiu76w/82
	wd5pHOCNkG7LO2g2KbaujJMDk3NtwkD0bmGEXtpi2KHXUhu+K8KHMcK61Io1rO+Nxp70pgdPRDw
	zIIS7OtvQo1XPAPsGUKk+iBolkud1TjTOSeSDWnZybKmPk4EEvPc/Z1TwFV9cbUmkSkMgi0mo66
	V0cxqMIl9jYYzV7e9IqOS6xNBRtxK4RTMmelLnDVP38xahZUS6TueRU/rkRErSyWLNBSf7QM5Ac
	SB+PWbpX7F7aC3vpGIlVG5b0EYKn6TQAPN3YSR6IQTdNUADUX58Ao/ptLcPYkWQcE3/9pcsgnqT
	X+YCufMAIFms35gJHg84k1mbM/m4/0NC7Haa68YNOKBVnywABlHTzcDatHzkcqAlKNstnIqcaYk
	Z+gsA6FK++D7Zw3Hvea+y23Umgu9KNU8W+yzVXZsh5K3+953mhmBMt
X-Received: by 2002:a17:90b:2d48:b0:368:78da:803 with SMTP id 98e67ed59e1d1-37a038e556fmr11174156a91.12.1781468928759;
        Sun, 14 Jun 2026 13:28:48 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.37])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-379e8cc467csm5439828a91.2.2026.06.14.13.28.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 14 Jun 2026 13:28:48 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org
Cc: Biren Pandya <birenpandya@gmail.com>,
	Jacopo Mondi <jacopo+renesas@jmondi.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v3 02/22] media: i2c: max9286: Add missing media_entity_cleanup()
Date: Mon, 15 Jun 2026 01:58:02 +0530
Message-ID: <20260614202835.11977-3-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260614202835.11977-1-birenpandya@gmail.com>
References: <20260614202835.11977-1-birenpandya@gmail.com>
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
	FREEMAIL_CC(0.00)[gmail.com,jmondi.org,ideasonboard.com,ragnatech.se,kernel.org,linux.intel.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64845-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:birenpandya@gmail.com,m:jacopo+renesas@jmondi.org,m:kieran.bingham+renesas@ideasonboard.com,m:laurent.pinchart+renesas@ideasonboard.com,m:niklas.soderlund+renesas@ragnatech.se,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:jacopo@jmondi.org,m:kieran.bingham@ideasonboard.com,m:laurent.pinchart@ideasonboard.com,m:niklas.soderlund@ragnatech.se,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EC04C682295

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


