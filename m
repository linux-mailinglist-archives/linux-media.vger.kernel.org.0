Return-Path: <linux-media+bounces-65259-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NkT0OeYTNWrTmgYAu9opvQ
	(envelope-from <linux-media+bounces-65259-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 12:03:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8126A519D
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 12:03:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=fo2IlSev;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65259-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65259-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BD57F3025929
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 10:01:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19A8C369991;
	Fri, 19 Jun 2026 10:01:58 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D601635E1A4
	for <linux-media@vger.kernel.org>; Fri, 19 Jun 2026 10:01:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781863317; cv=none; b=uNldzqKykZHPtW5JMIUwO8GmKa2ZeyMOkj05CxL7knAUN4psXJChmU7tF8UaZ6kdN9U2Ozb0tifkr0JKuAHrx8krAy1QHnckvvcPogKVToUTw4e+LGRfdrYAjd6QdHEJE3E/ngoyyWCUjShKiYdUkolHs28bwRd+j/cBGeZOFCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781863317; c=relaxed/simple;
	bh=apJMaQ2p6envcCEw23Xo7n8N6yh6To6p+OhEp8lwWgI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K2lWGbVAWerGX8YGS7TBan77BsaoYv3MjP7DEVRKiN80DDCS4pxgYznboDOTqg6GoA6mKTshD8kWBZzQ5QR7CRX18gbiXYFRBqBMhY24oLsSNZBbPBe7nHiTCwM+x5et8ADvnrQMNujTxw5LVKUm5EmrQIemFgWHEQK2nZSuu7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fo2IlSev; arc=none smtp.client-ip=209.85.216.49
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-37c867bd3e0so939488a91.0
        for <linux-media@vger.kernel.org>; Fri, 19 Jun 2026 03:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781863313; x=1782468113; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TQcvmWYii3G9cXdp5rFmjeRSxU8rwATYYhoa7gjXrT4=;
        b=fo2IlSev25Oi0SB/PDuD+V6VGNnzA29ODsgm6USE3fslwUsD8UFeYegmPkNpAil5m/
         5SgWqRLqhKIs+qxiR1pj+b72EpR8QOYbfc9f/CdZEXRdfO5LhqqF+fU8I3uvmK1ToNKd
         TqX+RSJsqIrW974Y/9QzOYI54uUbnxvgEJS+OFq+uUWsgvmTKjCQD8bppIE8UhjprVQx
         FBlMKcvIgrl/+zrhnZm74P2z0zdI6ZdvXbI/LOg4OT376tDAQkuEp/rJ4yhboE6EwYjT
         pprn9nPrOP7or965ZGvgyTsSw0fyTimCEbtXC+IDiz/PV4JrcTbpgqCk6NVzPx7ufG1v
         k/0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781863313; x=1782468113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TQcvmWYii3G9cXdp5rFmjeRSxU8rwATYYhoa7gjXrT4=;
        b=HjyDkvCyopNITHB5a/xJDHeEUZY/gklYGQZptXp56uRLVsHrvjdD/OI8douPUP+Ffs
         JoXQdm+rbUWw46wx8dLUkTal1OlMF/dVlrToyhnw1J71z6yEuPcHHWvpcSEVF0MO3VOC
         kVtIEZRS0lbvW9iRRyk/YW7KkppSnvqJ2+mrwXiaVdTzf7gHWUn396AqI5i6RLvdPayx
         i78AGDq6b4PI1D4dlwx9pEIDiUyJVHWAswIqQRWsQWwgVEht+bZzac4zpNYbORGG4y3u
         a8x1Fp42/8EaZacS2IzZFPgljRwlRVD7nOX/23Vprdr8cprA+PuP87ZTi7tz0rCIHthq
         Y+PA==
X-Gm-Message-State: AOJu0Yw5uRkSWWhIMz9hvgYN1HcQ9E7Fi1j4SLnqFZ+yYI2aKGriZ/RJ
	BEvdVFnykGs2zFqBSmnORY5/f7PjAHDnUDuB2d1mnRZNNJfzFNB30S9UdOQ3Qq1Z
X-Gm-Gg: AfdE7ckr3I65uyrTgRSobVt4IR5nDpeqEsK4oFoLN1SdbT4D8DF3OO8D69TJqAfkLmu
	QENq1AL5VzzUey+Rfi2AQTjuM3NP0MDddRj/Zp5k7ivAasYbF8xEYznlnvGkeMX3Ex3LveNmFT0
	z5zTgceobJNRfxNfeR1qD45g9n6A17wPHPfSAtgkcJ3WOXgHBzOhPCUExDt9IYIjc9Dn7trgB8P
	fWsp8C59NVNS1zIKA53dpz+K/Q36N+hE20jYl4osA1EGVGHAUFQmw6rjRXlSgBh8nSd/hoOKWQR
	qdXIRhlKk3P9lE/IW4p4wz1zP1b+gvLW/scAzaM/Y3SPzGNJWPTJOdl4f90B8nR0UawlTrR8Lsc
	sn0VUe83bvVpucQVnN4e7ho9sHYKDqPBnr06se9LhAzUTHUUfvN/oH7QgdsAjx+JYRYs9szFJH0
	MNrdEz+912dgQx25IEqnI3QEWkSeGsz7uxqdX9xwIJHA==
X-Received: by 2002:a17:90b:3a4f:b0:36b:9798:4f6a with SMTP id 98e67ed59e1d1-37d15dfb55amr3780566a91.10.1781863312849;
        Fri, 19 Jun 2026 03:01:52 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.37])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37d1558b599sm2340902a91.7.2026.06.19.03.01.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 19 Jun 2026 03:01:50 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org
Cc: Biren Pandya <birenpandya@gmail.com>,
	Jacopo Mondi <jacopo+renesas@jmondi.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH 2/5] media: i2c: max9286: Add missing media_entity_cleanup()
Date: Fri, 19 Jun 2026 15:31:29 +0530
Message-ID: <20260619100126.22197-9-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260619100126.22197-7-birenpandya@gmail.com>
References: <20260619100126.22197-7-birenpandya@gmail.com>
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
	FREEMAIL_CC(0.00)[gmail.com,jmondi.org,ideasonboard.com,ragnatech.se,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65259-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:birenpandya@gmail.com,m:jacopo+renesas@jmondi.org,m:kieran.bingham+renesas@ideasonboard.com,m:laurent.pinchart+renesas@ideasonboard.com,m:niklas.soderlund+renesas@ragnatech.se,m:mchehab@kernel.org,m:jacopo@jmondi.org,m:kieran.bingham@ideasonboard.com,m:laurent.pinchart@ideasonboard.com,m:niklas.soderlund@ragnatech.se,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6C8126A519D

The probe error paths and unregister function are missing calls to
media_entity_cleanup(). Add them to prevent memory leaks if pads
are dynamically allocated.

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


