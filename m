Return-Path: <linux-media+bounces-67611-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cGVVBe4AV2rfEAEAu9opvQ
	(envelope-from <linux-media+bounces-67611-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 05:39:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 71DB475A578
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 05:39:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=JzQTd4Dx;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67611-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-67611-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 933163043EC1
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 03:39:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A99EC3B531A;
	Wed, 15 Jul 2026 03:38:58 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C05EE3AE1A2
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 03:38:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784086730; cv=none; b=g1GUghMRT1KTURY9hRTybca9u8ctcgASz9Df8nNV00OgejxlGnSGLH7eAYxJr6J4FNI6HP/5U4rJs0OA9Hmf2GcmTOwlETUljr10l84H2Zi6LC59V3f9vuEM4HvSakaVMQIEKZrezTSxgxXhk31k8rnEHLOa6jv7xa6m6FB2bVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784086730; c=relaxed/simple;
	bh=bRZRmeuak8UGKeftukzPu9pf5prdsKVf2Hg9qG80Lio=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PseFmBZxGaO51NONR9MGIIyyLDRVD4gzZ6EErcGtAE5jWn4mSLOBNWnQO7p251WDz82CAVvXqNehUwAVW3wSqInqJu1/7FgJOPy60MIWNfvxJiRrUMKw33QvJB9F9gzDyguh/znt2Sz/S0jaADqyTJugDvQwPoEyARiNV40CNgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JzQTd4Dx; arc=none smtp.client-ip=209.85.214.182
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cad4170e8eso61042575ad.3
        for <linux-media@vger.kernel.org>; Tue, 14 Jul 2026 20:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784086719; x=1784691519; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I4LF8M4ghb+YPtxRjEmX1qyfcwiqHlXNeKROLqcS8Yw=;
        b=JzQTd4DxuTApcV54AOKr4PfKm8P+l56qDtbM3IW62zd60nGx8WWeTjIqYIRYStJCis
         TDO/ow5hlubks3TNgQtYVcO7DfrROdudGEFAD7DSsnV78vYJYnSSEy3pEA/makPVfM/k
         jhtz5lSQgRHzg4QruHxAMIue56tHjBhlEhFlvQboaoiBJXKRDbHeGuN0ouhvQ1om9rHX
         MDAzoaNNjoaB9buOcjYXyN41bJof/Lli9WDlvTlDWfLe9E/1vq+K/o8L0OQeSW7HfzeR
         7ggfNjfkpEOllpRWElvB93uH2zoViCzB7HlLgDh1Il+27G9JLA3OooREJ7KeyYiFRQ+a
         +KrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784086719; x=1784691519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I4LF8M4ghb+YPtxRjEmX1qyfcwiqHlXNeKROLqcS8Yw=;
        b=KmuyiwmxCV9v6UNuM7MAyalR1MnoOtXVkKhMaf550dIov5tG3ukNjv3tTJZJYEk5t+
         eCmtEONrmevdJhwF1Zh+n109FtdCHHk7wsHT6bY2NE+/Co0Ur+ydri3nNdl4nu3JMeqW
         X0swzZszF9a+4+j9asZJ42vou3A1wWVOtk5c4wvXGDsB5tgCk1MuGROL11HnInCfDh12
         KSvFd11BETR4aY3I8K0/0CPk3LV60CxuF1EXOO/oC02rgA9zayi8WT/fp7O+2mhvB9aZ
         tTI1LU8rrQ7Elqqt5PSqBUJt9MwOgYMYRi0VuI3TJDeMaChz/khvi/jX4bQRlOP/vs1w
         HJxw==
X-Forwarded-Encrypted: i=1; AHgh+RokHgeN6zNF7JvBbDCHpJX9YA516/K3VWeOjFdg8sXnGMfXPBhy6sJ7UtPJMUpjcq9BRoUroWc65Ak2NA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwLg84noLSQN8VOTONuy6RKwK7lcpmXlurz5rPRpUvgcL1eFRWz
	6seauXE0xABBqdc9g9Khezpn9c1AB9nv/7Bk5T6aRkR/nQRZY8EToFM9
X-Gm-Gg: AfdE7cmMyvsxGQC0eSSpBnWfmbmBwriZ/og2estCsB/AqIJOlGJdShf/oCExW5FBnzM
	wvMZUv+ZW7EMmduvaIKgW78iJ9nTpir1LfPfQDxppp+iNd0fLR3ak9GYsZ21oHA91KB9NPhdzgU
	Djsp/2c/l9catUrFope5PwtXOfJM16+hSyjwAF/IKIa4ifbKg+8mpEmvbtRb68LEbwYinfSg7CA
	4rnq7kTq+R1vplLu7JWuLMyBQqCQtUE5mYPrXSV2QPJ6s6EAMbmq2mW7jt35bRwxlf999grnnkP
	gQDCEsPm/FXiwFIMGMHfoRtsELnvrwpH5oSiyXJYCsTH48LoboxMyJTGc/qXV5g7GUnTRaJZ94l
	WhbO006ukSN6m/MhdGt1u1c3zuhCdLx5gp0aXs/oAxReyef1c6fPDEkW1/6+noUZyBcGhX3FSst
	y+iz7Q5EXS66s6p0GxRlLHiOBjtPgWtDLV6e/jnZJ181U=
X-Received: by 2002:a05:6a20:e68b:b0:3b4:6f7e:d0f4 with SMTP id adf61e73a8af0-3c356f75ea9mr6242435637.15.1784086719025;
        Tue, 14 Jul 2026 20:38:39 -0700 (PDT)
Received: from localhost.localdomain ([49.207.223.101])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174a583bcsm91977889eec.19.2026.07.14.20.38.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 14 Jul 2026 20:38:38 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: mchehab@kernel.org,
	jacopo+renesas@jmondi.org,
	kieran.bingham+renesas@ideasonboard.com,
	laurent.pinchart+renesas@ideasonboard.com,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Biren Pandya <birenpandya@gmail.com>
Subject: [PATCH v2 3/5] media: i2c: msp3400-driver: Add missing media_entity_cleanup()
Date: Wed, 15 Jul 2026 09:08:22 +0530
Message-ID: <20260715033818.10967-10-birenpandya@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-67611-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:jacopo+renesas@jmondi.org,m:kieran.bingham+renesas@ideasonboard.com,m:laurent.pinchart+renesas@ideasonboard.com,m:niklas.soderlund+renesas@ragnatech.se,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:birenpandya@gmail.com,m:jacopo@jmondi.org,m:kieran.bingham@ideasonboard.com,m:laurent.pinchart@ideasonboard.com,m:niklas.soderlund@ragnatech.se,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: 71DB475A578

The remove function and the probe error path are missing calls to
media_entity_cleanup(). Add them.

Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/i2c/msp3400-driver.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/i2c/msp3400-driver.c b/drivers/media/i2c/msp3400-driver.c
index 4c0b0ad68c08..48c60050c5d7 100644
--- a/drivers/media/i2c/msp3400-driver.c
+++ b/drivers/media/i2c/msp3400-driver.c
@@ -717,6 +717,7 @@ static int msp_probe(struct i2c_client *client)
 	if (state->rev1 == -1 || (state->rev1 == 0 && state->rev2 == 0)) {
 		dev_dbg_lvl(&client->dev, 1, msp_debug,
 				"not an msp3400 (cannot read chip version)\n");
+		media_entity_cleanup(&sd->entity);
 		return -ENODEV;
 	}
 
@@ -812,6 +813,7 @@ static int msp_probe(struct i2c_client *client)
 		int err = hdl->error;
 
 		v4l2_ctrl_handler_free(hdl);
+		media_entity_cleanup(&sd->entity);
 		return err;
 	}
 
@@ -865,6 +867,7 @@ static void msp_remove(struct i2c_client *client)
 	msp_reset(client);
 
 	v4l2_ctrl_handler_free(&state->hdl);
+	media_entity_cleanup(&state->sd.entity);
 }
 
 /* ----------------------------------------------------------------------- */
-- 
2.50.1 (Apple Git-155)


