Return-Path: <linux-media+bounces-65319-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id S3rQFbt/N2puOQcAu9opvQ
	(envelope-from <linux-media+bounces-65319-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 21 Jun 2026 08:07:55 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CE94B6AA492
	for <lists+linux-media@lfdr.de>; Sun, 21 Jun 2026 08:07:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Ijv4ieai;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65319-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-65319-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DD8F63010276
	for <lists+linux-media@lfdr.de>; Sun, 21 Jun 2026 06:07:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE11925B0AF;
	Sun, 21 Jun 2026 06:07:39 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C1771A680E
	for <linux-media@vger.kernel.org>; Sun, 21 Jun 2026 06:07:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782022059; cv=none; b=I5+JkdE9LChJ9NLAtxIbNyHUbmcBjZXIT/8RZsuSLN03QQInjvV33I93wwrMDuRfEzcw7S921ptkbSVuSRDKH6X7qPRdThm7b9KAcv/4YGrtZ/oUk2MDZsCuPsd7XcSv7/BieXTAaAiXsY9Gp9vstx04UJQJ/n2C7M/MDZ/TM0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782022059; c=relaxed/simple;
	bh=wgl87edwgI8AlgxS9mEVK8AftyYr5Z4dXGC/oo8DfYs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S4oX7xzs2rhb4tFIpYBl6YKg3dv3P4ogwy4jYljY/A4z20q2TOrHMliveg6BiCfzYKlMN9Me9KYunaXlTi9b+MGFVasYFFf3yZSkRCnplQkckKt+rSJadtw6KhncW46tEdkqUz9maVDX5sIEJDENdpWV6ixNuJ+N+w56q0t/pN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ijv4ieai; arc=none smtp.client-ip=209.85.214.170
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2bf125989f2so20684085ad.3
        for <linux-media@vger.kernel.org>; Sat, 20 Jun 2026 23:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782022056; x=1782626856; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uTEWs9Ifv38deSq90LJ7l6ArZp1UX383BprXX7Gzyqk=;
        b=Ijv4ieaiqqXZTcV+2BG0ROpGjO2POFumz7VEuD8g4tTycwPzKXaLhZyngXA4pTGFiE
         oswpj+x0ztRB0wthQvUEVetgcj9KJrzK5BXp0uYqoEWYfWBGDx91eIVi0naZl3vCwi5G
         LdKiuVcF1OEdzv6SB5seOwBZb2j2xFbmQMvg6icBV4ctRHu1Fv/SmiatY0PWSx9avAE6
         sP1b1fkL2xoMk1oGRW6K6iNlKeFcHyKgBIj74EJh0BmBKNXUPmhq+QiN4MlmczaYONyB
         s/U6iK2tgQDa02Hrc9rg09f2YyPTTyFIQPF8cJIaAdqEWS7GiWWK1pOZFA/L0w2FAXr+
         1W8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782022056; x=1782626856;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uTEWs9Ifv38deSq90LJ7l6ArZp1UX383BprXX7Gzyqk=;
        b=CpunlXvX6URnFTa1mbGjF4SSRsHqqzfBfZiHUv2prLmZlj//NoYcdWVOP1pl0qvDo5
         C4FEGwHLrLeTq1jQuxpPN2fUzRM61a9yXWHdShsZRXsaWBxSxiRLbIZuE3SAif+8lY7H
         F/WuH4xNJ81h5D30DQLk4DY4tWiOvaeg9yQYWSlftz6nUHIlsRPDSnVMOq+/eDgnuKU3
         /LqJmOpCu98EQNBXfwwmeaPWlg6e07Tzxud3HJwRsR2T3JjM14AxRQBbzUPXRoomvz8w
         CKzRt2cODEukO2/GNZ7JrNyc8DqU1rGD/4yAUHZz3hWXjd7kjAyYLX1TSo2voT5jIfv5
         FKtQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp2yzqJdlE/9I5J0L1msDJjCCcvMoHh7GlWehMkOque0RFjFoLWBcs4pGJ7S1fIN1/lLWsDxEZzsQ3wYA==@vger.kernel.org
X-Gm-Message-State: AOJu0YysmilxBxFvP8ep/y7SP+f5EJO7iw2zRYGiEkJJVVLEuwT/ng6w
	qww77mEwqmCsBMDSdNrYI70Dowr6cqUNaf1yTX0r6nd9OqzHvR7v7kgSvflxIX84
X-Gm-Gg: AfdE7cmKYt34lJ+Hado9sMiayMLsHX3IDRpY1BzuOP+lIRms3G87PiCPih+WZbN2EyY
	6ZvX4yFaezCGCJ7SwaAf6x72CzIsYktK6pjDYZCtSCpIy6qeRrpbEn1J+3GXRVLq7i8nq6E6Zcp
	UtSqozVgonPxm715HSqx7W/xXKumF8TcqFHuIT37QPscgOOFTJvDk1yKCmKYA+xdxX19FujMkAF
	/DOgJ43o60d0762MaMDXc+jPXShv7ZMlIZm5xDpSgY9w7TeE8I3yJW23f3BClad0+bqHpvw/1wp
	ueTyGr98vSvJJNrxyjixk+ytgKTC14e5StcXgJaOyLw001az3SlBwltabw5ywIkG2QDPybXMXC4
	EPsaqLnVbUw8kMGkkGg5v8TDHbgtCdlpqR0JpCCaW3fdq4kRp6DPyHK49QAh7Q5R0uUUQNXaO4W
	GWF8f8lE4HTSb9I/21wbWxclHM/Dum28HQsersSfqK7A==
X-Received: by 2002:a17:902:ea01:b0:2c0:a9b3:bdc6 with SMTP id d9443c01a7336-2c718f65036mr104593205ad.30.1782022056278;
        Sat, 20 Jun 2026 23:07:36 -0700 (PDT)
Received: from localhost.localdomain ([49.207.234.96])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7444a9c4fsm38668765ad.75.2026.06.20.23.07.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 20 Jun 2026 23:07:35 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: Jacopo Mondi <jacopo+renesas@jmondi.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org (open list:RDACM21 Camera Sensor),
	linux-kernel@vger.kernel.org (open list)
Cc: Biren Pandya <birenpandya@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] media: i2c: rdacm21: Fix missing media_entity_cleanup()
Date: Sun, 21 Jun 2026 11:37:06 +0530
Message-ID: <20260621060709.54396-2-birenpandya@gmail.com>
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
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65319-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:jacopo+renesas@jmondi.org,m:kieran.bingham+renesas@ideasonboard.com,m:laurent.pinchart+renesas@ideasonboard.com,m:niklas.soderlund+renesas@ragnatech.se,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:birenpandya@gmail.com,m:stable@vger.kernel.org,m:jacopo@jmondi.org,m:kieran.bingham@ideasonboard.com,m:laurent.pinchart@ideasonboard.com,m:niklas.soderlund@ragnatech.se,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CE94B6AA492

If an error occurs after media_entity_pads_init() is called, the media
entity is left uncleaned, potentially leaking resources or leaving it
in an invalid state. Similarly, the remove path misses the cleanup.

Add media_entity_cleanup() to both the error path in rdacm21_probe()
and the rdacm21_remove() function to ensure proper resource release.

Fixes: a59f853b3b4b ("media: i2c: Add driver for RDACM21 camera module")
Cc: stable@vger.kernel.org
Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/i2c/rdacm21.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/i2c/rdacm21.c b/drivers/media/i2c/rdacm21.c
index bcab462708c7..41d4242a9b58 100644
--- a/drivers/media/i2c/rdacm21.c
+++ b/drivers/media/i2c/rdacm21.c
@@ -594,6 +594,7 @@ static int rdacm21_probe(struct i2c_client *client)
 
 error_free_ctrls:
 	v4l2_ctrl_handler_free(&dev->ctrls);
+	media_entity_cleanup(&dev->sd.entity);
 error:
 	i2c_unregister_device(dev->isp);
 
@@ -606,6 +607,7 @@ static void rdacm21_remove(struct i2c_client *client)
 
 	v4l2_async_unregister_subdev(&dev->sd);
 	v4l2_ctrl_handler_free(&dev->ctrls);
+	media_entity_cleanup(&dev->sd.entity);
 	i2c_unregister_device(dev->isp);
 }
 
-- 
2.50.1 (Apple Git-155)


