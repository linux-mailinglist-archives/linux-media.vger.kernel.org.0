Return-Path: <linux-media+bounces-65392-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hxmEAct1OWpXtgcAu9opvQ
	(envelope-from <linux-media+bounces-65392-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 19:50:03 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB726B1978
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 19:50:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=ZRpNs5Yw;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65392-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65392-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8912A305543C
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 17:47:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9050340A7D;
	Mon, 22 Jun 2026 17:47:55 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 235901DF75B
	for <linux-media@vger.kernel.org>; Mon, 22 Jun 2026 17:47:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782150475; cv=none; b=YtP8iRm5mj+A3f7EssQ/M3h7wjBSWV4SyXzTL4vV7tgQNMpdBJjSLIxKW8Kyqemo2pmr64ht2DzcokXRblBNGgNNxlgO5xpgtFvMFU3tfxfL+0GzpCxLOQMrEdwrDt1CnIpP8FmH/42Xyk2WhJ0Dxsisy6RYN8QLgAN63s4ABqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782150475; c=relaxed/simple;
	bh=NksJrIeD8lUlfpaXVsma3zynL1bBdCnNO7bkXDr5m1Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aQugUgCTc9QWvdX1qxdZh8bTOP9bNxvHV0dUFbxjhYbWxZfbPuzdAHdw/v+6HDyLjx5QnbswEBVKLhwEb2CqWdWQJ4i6aHu2V3t1CABNhYO7vkg3jFbRG11jgyXAzKvzLQPNwwyyhuNdnvdUURte5KTN1WxoKAfhhYV1WTPDKb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZRpNs5Yw; arc=none smtp.client-ip=209.85.216.45
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-37d826e9811so799480a91.1
        for <linux-media@vger.kernel.org>; Mon, 22 Jun 2026 10:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782150473; x=1782755273; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TrgsOhM9xL0CFmd9NiKbaw3nrUyE0hULzQX60yKknAQ=;
        b=ZRpNs5YwI9a4QpOrcMYTE23sxuRyWK/Wu719+IfEVdXeWgO7KpK3NRo6jtii9nZecV
         2xTo0blhsJqvnbuZEDbLKG64f9m20fBng+gE0itWaw3IpqLFnqyy8z+pgctF4zf5dngW
         0w/TRItlalpR9g2JM6EVs8wDgmieyX8NYFKN/CMnRjA6HGmkUKXk84r8guKzBi0XnDZu
         w1KQ4oXGzOxWZYLJxdkQA54FbfM1g23BgeQql30ptAE/BRddm9YdMqd2X66xhG2pes98
         /zFcYTWlQ9wG1iq8jb3z5HmC89zvMbcsD5bDZIzXb8TpFCPCrOwuy8MA3xAb4a9Coxbp
         HOtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782150473; x=1782755273;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TrgsOhM9xL0CFmd9NiKbaw3nrUyE0hULzQX60yKknAQ=;
        b=BY1PF7UL2MZvFaf8PvAotYNomrw4Anvoo2YXWkMT6PBbonwTEAblMdbLMrgcNcOGP8
         cFE10wKlxaZu722uq9anZjzgoyUYSos3Mmbo2i7tjEBANEvDm+fzrrS3Uh6IrqFnN/81
         /EbvpP38RSWFrHRkZsRkAEzSG6m8qUuxSaE6v6nFzJP0n4so7lmW9f9k1thBwRVjg488
         CLrDzWCYgHS2QSNJ98e5Cv3gnElJoWutGBvbxoCcOzLEfkXdjWKM96xU5oWIWbVIUPM+
         SqC4pz6GR8LVPGGgMrspbbgGZL6y06zXxtFuNuMYhigJ3n+e/UR+FLdq5fLRAkekH09w
         9+iQ==
X-Gm-Message-State: AOJu0YyEGOb6mnE5j0ri70ScELEoitPXLMEXPwK1M+T8EAleWhRYsKNl
	LOrbemjqg5FpnQ/aDWDSYLf41cBfAXVoobJvM10UO4ABnRqjoPPzf7qqB6gqMAre
X-Gm-Gg: AfdE7clGpQZl4rNgDVnRvTQfbln94zsZIS2HJefdcx8zn4a3kjPbwPJBlcborK4xJ/O
	rgCgvcKUtDL/bbkQs1pNfg8o3gmO+m6gYvbgD1GwAlgQNaJQ3FF8MEAFsdDgd9TI8kOUp5LIToR
	td1XzY4aYkiLCBuDpOf3joSwQWkzwbt+3Wq8hV8N7mlSZxbMzktt1q0s63p/EiPCdztjMFr5gxj
	X0IQXxk9Fe6xC/cW0vjciw0xHPNxtfPBY3tI/jIa/aNripk5eTx1219xtxt+98iOKcnAbjVykfT
	+HAVnZuicS1vPnsvUPOV6wqbEuO25WoeCW1b1l4MqE9GEE9zQ5HC0sxC3ePM4eZFHAfj6PgYnez
	01M5rdxTmb9jQ+O8DN3Dw2CrGyNQoVogUZXxdDVDvX0GFop6PHXyuhgUVYfxPRIgnlq8Urd6/Gi
	tt/xsnOJM+LNl6ZYVbUw31nWefuwMxqXP3kLbMfYiRoA==
X-Received: by 2002:a17:90b:17cd:b0:37d:83f8:dff4 with SMTP id 98e67ed59e1d1-37d83f8e00bmr6136540a91.4.1782150473412;
        Mon, 22 Jun 2026 10:47:53 -0700 (PDT)
Received: from localhost.localdomain ([49.207.234.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37d15df815csm11306913a91.15.2026.06.22.10.47.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 22 Jun 2026 10:47:53 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org
Cc: jacopo.mondi@ideasonboard.com,
	laurent.pinchart@ideasonboard.com,
	kieran.bingham+renesas@ideasonboard.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Biren Pandya <birenpandya@gmail.com>,
	Jacopo Mondi <jacopo+renesas@jmondi.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v3] media: i2c: rdacm21: Fix missing media_entity_cleanup()
Date: Mon, 22 Jun 2026 23:17:43 +0530
Message-ID: <20260622174743.61315-2-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
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
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[ideasonboard.com,kernel.org,linux.intel.com,vger.kernel.org,gmail.com,jmondi.org,ragnatech.se];
	TAGGED_FROM(0.00)[bounces-65392-lists,linux-media=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:jacopo.mondi@ideasonboard.com,m:laurent.pinchart@ideasonboard.com,m:kieran.bingham+renesas@ideasonboard.com,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:birenpandya@gmail.com,m:jacopo+renesas@jmondi.org,m:laurent.pinchart+renesas@ideasonboard.com,m:niklas.soderlund+renesas@ragnatech.se,m:kieran.bingham@ideasonboard.com,m:jacopo@jmondi.org,m:niklas.soderlund@ragnatech.se,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2600:3c0a:e001:db::12fc:5321:from];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[100.90.174.1:received,209.85.216.45:received,49.207.234.96:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3DB726B1978

If an error occurs after media_entity_pads_init() is called, the media
entity is left uncleaned, potentially leaking resources or leaving it
in an invalid state. Similarly, the remove path misses the cleanup.

Add a dedicated error_entity_cleanup label so that media_entity_cleanup()
is only invoked on the error path when media_entity_pads_init() has
actually succeeded. Also add media_entity_cleanup() to rdacm21_remove()
to ensure proper resource release on driver unload.

Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
Changes in v3:
- Added a dedicated error_entity_cleanup label so the cleanup is
  only called if pads initialization succeeds (per Jacopo Mondi).
- Removed Cc stable tag.

 drivers/media/i2c/rdacm21.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/rdacm21.c b/drivers/media/i2c/rdacm21.c
index bcab462708c7..ece8a410e7ce 100644
--- a/drivers/media/i2c/rdacm21.c
+++ b/drivers/media/i2c/rdacm21.c
@@ -588,10 +588,12 @@ static int rdacm21_probe(struct i2c_client *client)
 
 	ret = v4l2_async_register_subdev(&dev->sd);
 	if (ret)
-		goto error_free_ctrls;
+		goto error_entity_cleanup;
 
 	return 0;
 
+error_entity_cleanup:
+	media_entity_cleanup(&dev->sd.entity);
 error_free_ctrls:
 	v4l2_ctrl_handler_free(&dev->ctrls);
 error:
@@ -606,6 +608,7 @@ static void rdacm21_remove(struct i2c_client *client)
 
 	v4l2_async_unregister_subdev(&dev->sd);
 	v4l2_ctrl_handler_free(&dev->ctrls);
+	media_entity_cleanup(&dev->sd.entity);
 	i2c_unregister_device(dev->isp);
 }
 
-- 
2.50.1 (Apple Git-155)


