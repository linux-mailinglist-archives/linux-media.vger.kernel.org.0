Return-Path: <linux-media+bounces-65398-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ditrIjyEOWq3ugcAu9opvQ
	(envelope-from <linux-media+bounces-65398-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 20:51:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F1E6B1E30
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 20:51:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=SX6pfWmo;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65398-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65398-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8F5053064E16
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 18:49:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 097A2346E51;
	Mon, 22 Jun 2026 18:49:02 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BDF2314A73
	for <linux-media@vger.kernel.org>; Mon, 22 Jun 2026 18:49:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782154141; cv=none; b=p0oRoCZpoSbdUo5sNLW14i/8KUYIdgedGfzOaCjU8OpqbtCGBOt+C7qBSCxpwzcQ7e+JlGxvKXCZDDUHBUuELF9kWtJOSjsxfXBUmqis2pWjBZCB7JhI7/DaLxUyKYmn830HhJcS62tEM1nD0/E9hBni6FuN3na4lddzfb3EgG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782154141; c=relaxed/simple;
	bh=JzjOso7/wwynAxHjmTNccaM/1TFx/LTbSs5RRtSmy/w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M7MKkEG1cTmAkGruyeM86Bp0GyeDIKFJZGh5ftkmDXIZkL+W1SzgLKK4r1ehHab6mwlUmPytT0tZaP+FZsjb+M8VSkUArVqaOu8hCc1u+2AQt/1YhBI6VDvyn3xdrz7jQP6QwxVLoNghdzL7i3qYrCz1BXKZg6ObwDukgbFagMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SX6pfWmo; arc=none smtp.client-ip=209.85.216.51
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-36b9d265355so2616854a91.2
        for <linux-media@vger.kernel.org>; Mon, 22 Jun 2026 11:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782154140; x=1782758940; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NC0uBNFhos9Xnquc35vsABLKrcnqiNY5ZuQAYS1JZAo=;
        b=SX6pfWmoneTPI+VmKqRzEJV8DkrXbNHaIc7AD2HAr5sFbw9nKXST7RQmnrQwGvf6Ap
         vS1LMJhBbOSiE5J9YjXYdgexSVJuIBk0+rkDClPnowfqxUBbvut2lrRPq5Qrj9YQlS1S
         66buH7UGZDzeq3ujFIQx199qIIgni0sEkVSv6hw6DDIRzrXWIbHbLyPbvIbc48m9eE0U
         wH2bJ5fk0Lz88i+k/Su7WDbPRIIIdya8UfZVbyPaDGRUejKwWvUSM6ioQEfZFuwfo7LM
         jeQgXVOnmpvG9KqB/Bch1amxJ9X5YhKtduTdU9e636LnHqOQc8xbB1WEB8nj91MBscKi
         DPDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782154140; x=1782758940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NC0uBNFhos9Xnquc35vsABLKrcnqiNY5ZuQAYS1JZAo=;
        b=lzt8YsJD56TX33o6JrftRBKzrcLy2QjQtxDKX4MPNOCllf/5DPN07yEuAHHN6rAgvk
         gBfQv+J+BCDRw2yuIS1zk8Wx+lRFykEySXZuGCKMtRr0o8/2coufcK9VQWTXUU/IV7Aa
         RLGfthNq6WokG6LoFrG8g73CYIn/OYLsA/JZ4Q7mQqYBaZGp/ptSFuhkikudQStrjmqL
         SUtOqNgxSrK7/xOEnaXakJpn2MXETPIt9uDRikWWxPR1jDIRFwNPPI1c45O9kKxyI2ve
         6rBZv15ucWxmApjEU4XI32kx/Ms9iZSe4GiN5zfzaV3yc89n6SpWuYMKKYvBXJGU5sOI
         Ol0w==
X-Forwarded-Encrypted: i=1; AHgh+RqNsikgiH7fIGxkCGdb19jBmWnn1NXG5kNq0+bpdD7SKcNituiMKJO3eLza4rmnOHoVRG6P+eBPtIjkLw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzdLHYgSKbmbQfKSucKL0VkdTVZqpHeBJb1XB2mt6hWsKz94xyG
	ux2Z0oAkcupayUDTivmGqUcPAzGvt/0NUosECsElY5BhiNm6hj2jYVM8
X-Gm-Gg: AfdE7cl01OYY5/BBZ+6Qy4L9yyp3PgyLdRTSekwtDkG772vtnHokX1R8h1sx5/DyGjF
	1tMLa3nytwSTpMBxs2bofnY/j1/Hk+K5rDugdRoLg4pP6zbJa8irZOzQm7Op3x4hy6QpNSqhrzF
	OsrPaWU0V0lzpbflTIwIWjEXaQCJUWyFDnAshSniPGUrFuKUQPt0fkjXXRYn+RxRHRhwFgan4WO
	RZ6O9ozeeBO4uNRilp+Ax3Tfuh9u7UDvgqYI+ve5eHz5G0vxlvnDDaX8qcrYGE4LhxlGrg05qHg
	4ZF+SE2IlFtzIcsqI5ggbaEWUj/g0Iwuc+ZiChaQfgvm2K7+egVHQ5TldXyRez0opKGDvjyGes9
	Nnq3Ez67XNKBkQZSX/R+zvhZ/sTfZzPoEpYUzxpwrt+EFykcpxdUfx+lXcxzLXAaZnRYVPevcjI
	GAKFoTDfOfDwKg+sTTxedMGS5BdUQpNFAWNyObEVoDTA==
X-Received: by 2002:a17:90b:2d84:b0:37d:afda:faeb with SMTP id 98e67ed59e1d1-37dafdafb5fmr2996097a91.20.1782154139657;
        Mon, 22 Jun 2026 11:48:59 -0700 (PDT)
Received: from localhost.localdomain ([49.207.234.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37d4f222bafsm7780517a91.7.2026.06.22.11.48.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 22 Jun 2026 11:48:59 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	birenpandya@gmail.com,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [PATCH v2 2/5] media: i2c: max9286: Add missing media_entity_cleanup()
Date: Tue, 23 Jun 2026 00:18:43 +0530
Message-ID: <20260622184840.66226-9-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260622184840.66226-7-birenpandya@gmail.com>
References: <20260622184840.66226-7-birenpandya@gmail.com>
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
	FREEMAIL_CC(0.00)[jmondi.org,ideasonboard.com,ragnatech.se,linux.intel.com,vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65398-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:jacopo+renesas@jmondi.org,m:kieran.bingham+renesas@ideasonboard.com,m:laurent.pinchart+renesas@ideasonboard.com,m:niklas.soderlund+renesas@ragnatech.se,m:sakari.ailus@linux.intel.com,m:linux-kernel@vger.kernel.org,m:birenpandya@gmail.com,m:jacopo.mondi@ideasonboard.com,m:jacopo@jmondi.org,m:kieran.bingham@ideasonboard.com,m:laurent.pinchart@ideasonboard.com,m:niklas.soderlund@ragnatech.se,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,ideasonboard.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D6F1E6B1E30

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


