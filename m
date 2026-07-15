Return-Path: <linux-media+bounces-67610-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id i5CmDloBV2rxEAEAu9opvQ
	(envelope-from <linux-media+bounces-67610-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 05:41:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 88C8575A5AD
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 05:41:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=UCJeeoXZ;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67610-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67610-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 97F2730F541B
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 03:38:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC2723B47DD;
	Wed, 15 Jul 2026 03:38:51 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35DBD25B08C
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 03:38:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784086727; cv=none; b=CZ3vU22uMVJRFGBe20uvSNMQiShV9tqggaxBACPCjH6PIZcnzk3QRGVNfutSU7Sz25nCxhNfoC/7y9qTAD7S/K9/FlsC+liSQiaLylbqbXaAGrPxnKCAoQ5k0teROT2Cf4KHo+XHn2beInU6jifdVE6BAJngS7zMIYCzfA7Diog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784086727; c=relaxed/simple;
	bh=JzjOso7/wwynAxHjmTNccaM/1TFx/LTbSs5RRtSmy/w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jTleLgv5cWgfVyCT5Yw6kBsZ5KyFrc/5/RCZLBzsVwpph/sxx4SEUU05B1+n+heUePrMBIwaiCGg2V7tGng8jSpMrks1aZEcKvuE/HJFmr1haoO+dX6tlVkiisTFI9SZlZdrvBCjbyREl8wPRted+fsSKBCltm0uesEtndnXszQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UCJeeoXZ; arc=none smtp.client-ip=209.85.216.50
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38e07ebd263so1275666a91.1
        for <linux-media@vger.kernel.org>; Tue, 14 Jul 2026 20:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784086715; x=1784691515; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NC0uBNFhos9Xnquc35vsABLKrcnqiNY5ZuQAYS1JZAo=;
        b=UCJeeoXZulm7k2Vr0CmjdyLODF+j1B+eZUoPiEQtO2AcTB5/pw8FTcBDiiOgzEeY/U
         ySt9elHtO3yU0jKF1QNBtkG188kub93MpGgG6PO06NxlE2whonlX8y8aqT+T2pHTkEUx
         OCQY3bYMZcfr4gw56oJeC56ynSZz7vgmohpSTgxBC2QXrMEUVweWBkgsTrPCGmHi4qhJ
         s+dAvbL5IajU492goTTiZ9BHIjn4qlUzhh8b6KEDZ3O97b3BwkQozv5bFo8FR5ZLY3ob
         CtfxO+BMyE0CKPPexL/UUkHWFUiu1YrddmeHmm6dToGyp6V6EvY9SHfKW3pSAxE8gw5q
         PE4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784086715; x=1784691515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NC0uBNFhos9Xnquc35vsABLKrcnqiNY5ZuQAYS1JZAo=;
        b=Anxevzu8+XSdDiwjo0L4RE+xF3h2UsoItbb4tl3Hi+S+3hwmMS/3qy4CsKMVw+KD+w
         snDbj7NIB8YLRP3NCogV/sSGvPi/iuXz0uibTvc5aik5naEzsHSUW64/cbHLwjVrrdlc
         rvbOVRqYhSXzRv2qWNopyoEpj901exMUIjujzz3ro9YKK/gt6PzFUs81EvE8qgAYrdO8
         QCS+3P+IvK2lONvjrvySjdPor18hazdyErKn+3sWQOYDPS2IyrANNJaSQBm1C2yexsCU
         wxSI02qRrg8jChVFphYx3gzOkD8slmj5+9md40Oxga9OAraAZK8nI15n1PI7+J3bs5Bj
         t3WQ==
X-Forwarded-Encrypted: i=1; AHgh+Roe8KTueBNIq96ODHK85ISsaCnNoR0NIbg/EdCA+94p3ruX+b/6c1leKGv6Ns76FeWuZOmnTDPL1NNztg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxXFOjOLZTrt/1J9KB0TbWbxwOtOekAFVTHzApKygO9jUxffAqH
	zmsQxFaqkw3ctE11ou/2ANfjFjdPMXwCcUvVIHRWUdfVW0Lzv5muxust
X-Gm-Gg: AfdE7cnzLI0pPKsiAmj1HEvAfDrZqEuAdn1JhuPKfCxeYZcRAovxNdtv+sfhv043Fve
	2pOFn5/k4Gcpw6AQUTJHx+ww8rqen/U/LmkF2EJ5U5sqAM/yUeEA8URrO14oyjTJquEi/bGCPTb
	CHf7Uw1mnbdixLeSjcd8bGXnph4MT6ofCdvVLhXepWecpBC4kolm+u6pi9zRiP+EyBH+wXyUSEl
	X4RYrcp7ghDrmJG0V4lOj6l2vqy9sGCjD+FB1DVhkCbNHmCsn1u4rvF0GyrynZyIccVQkJ+g+8n
	xSFj8RvlKbufjLDi4ZbGOXF9H7LMkSyvBUlvYEp6DJoIEeuNvhyr/BkaV36htvPtgKrwq5rxysN
	kEJWQkW5d0bt943TAeZQ3YWhBpNYZapFu4FsMN/JacLnMa03BnLsJoeFFiQdAp8CGB/8VaaJHS8
	dGL4oIRtIji8uWTp6bTs4qqebq+RT9TtchAcye7q59S0o=
X-Received: by 2002:a17:90b:1fc8:b0:37e:2005:6507 with SMTP id 98e67ed59e1d1-38dc75f4cf5mr14387980a91.15.1784086714915;
        Tue, 14 Jul 2026 20:38:34 -0700 (PDT)
Received: from localhost.localdomain ([49.207.223.101])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174a583bcsm91977889eec.19.2026.07.14.20.38.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 14 Jul 2026 20:38:34 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: mchehab@kernel.org,
	jacopo+renesas@jmondi.org,
	kieran.bingham+renesas@ideasonboard.com,
	laurent.pinchart+renesas@ideasonboard.com,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Biren Pandya <birenpandya@gmail.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [PATCH v2 2/5] media: i2c: max9286: Add missing media_entity_cleanup()
Date: Wed, 15 Jul 2026 09:08:21 +0530
Message-ID: <20260715033818.10967-9-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260715033818.10967-7-birenpandya@gmail.com>
References: <20260715033818.10967-7-birenpandya@gmail.com>
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
	FREEMAIL_CC(0.00)[gmail.com,ideasonboard.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67610-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:jacopo+renesas@jmondi.org,m:kieran.bingham+renesas@ideasonboard.com,m:laurent.pinchart+renesas@ideasonboard.com,m:niklas.soderlund+renesas@ragnatech.se,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:birenpandya@gmail.com,m:jacopo.mondi@ideasonboard.com,m:jacopo@jmondi.org,m:kieran.bingham@ideasonboard.com,m:laurent.pinchart@ideasonboard.com,m:niklas.soderlund@ragnatech.se,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,ideasonboard.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 88C8575A5AD

The remove function is missing a call to media_entity_cleanup(). Add it.

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/i2c/max9286.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index ac0712ce1e65..79eab9045e24 100644
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
@@ -1084,6 +1086,7 @@ static int max9286_v4l2_register(struct max9286_priv *priv)
 static void max9286_v4l2_unregister(struct max9286_priv *priv)
 {
 	v4l2_subdev_cleanup(&priv->sd);
+	media_entity_cleanup(&priv->sd.entity);
 	v4l2_ctrl_handler_free(&priv->ctrls);
 	v4l2_async_unregister_subdev(&priv->sd);
 	max9286_v4l2_notifier_unregister(priv);
-- 
2.50.1 (Apple Git-155)


