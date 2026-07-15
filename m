Return-Path: <linux-media+bounces-67612-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0a1TNLcBV2oAEQEAu9opvQ
	(envelope-from <linux-media+bounces-67612-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 05:42:47 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FCAD75A5BC
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 05:42:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=L3OYEyRA;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67612-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-67612-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0BB0F3047270
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 03:39:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99DCD3B42EB;
	Wed, 15 Jul 2026 03:39:04 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 840703AF640
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 03:38:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784086735; cv=none; b=lPDsLlhUQOrcsgYQckAASE+ZqDuR0svllK7sl1de4mVfjsUxTOaZuqJHh/WE30cYajDc6lFUnJytA9GGLW00Drpcc++fn/tmVPC/UzpIYzEuETv6fGx0Rf29lz4RaIqK99o95EcV5cg6Ub8O2fzHG7OF+Cm+LN2OZxMjmR55GCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784086735; c=relaxed/simple;
	bh=uQpQFEgVQRMZl9ga6dV8oBi/I0Inhusd5je+kblypos=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U0AU+3rytD+V13pCXB3hm1G5UY5a2Kai/CltsipkOQWkAhtnjko/hko+eWSV75d95QEjSAfrR8iN4hTZko6fhXIFY+ClVsEoDhH4hjD3Geoj5MrwwHQc70aRfj/pGbMs1md6S3e219/NNEFyCfn7V7BWWfo3QgeCeKtvBDpbn5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L3OYEyRA; arc=none smtp.client-ip=209.85.214.179
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ce9e39fccbso1647295ad.1
        for <linux-media@vger.kernel.org>; Tue, 14 Jul 2026 20:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784086723; x=1784691523; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uVEg2i1Z7njPeqcdf/tSoRttZE7Mq1P1yGV0C9miEPg=;
        b=L3OYEyRAIVPVafkkMRy/GidjojTCAxG35oX3cHwrR5D7d4ypPvfGPz84A4oDZ3aH1q
         HQRS5M/XS6G2wkdwHMIS9to6+TOHub/Kft4IS/Q7PQjRvwkidl+A4v6DThayTFF8R5bD
         Fo4cks2oeDpHYs+K/dhmMsbbfmxGzIiC22Lx3v7det0B5ixXmPfSyRMtcst5fZFyPIys
         6Jmh3ro2VlPM81iHVtTK0cJ44BkEgb/LCWVy5GE9O7r9qKlOYTaNbMSkjqJ9qIkO3s5n
         CWQlG9ty5mTShH76f07YjoX23mCyEUXDiiH9M2bDgk3Zd07vPyipzGMdEh8ypxN98+II
         xogg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784086723; x=1784691523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uVEg2i1Z7njPeqcdf/tSoRttZE7Mq1P1yGV0C9miEPg=;
        b=Kx36L2fjoMzo/LTZ12UzOnYyqbzBcw2AAtawW+7vN4ZkZp6QgGmWT33JfbR17GO9tM
         LGMqB+RoRAIvNrF5mr3rbzzspBg7wxQHMhWsoZRlvNtxsHOEd6K47k/2eXc5nZ5cyuVI
         384PEA6LssaSAJDU29EdJfm0CbqWLl3KgGovODcHOp6nFf0YUOkedpawkuf4071a93Zl
         abj6mCZFZaQOgvPOwZ9qgIwprzMUwUdTOIYbB03VKEcWf9+H2hVYT1M0np0fdS4Z6KpS
         TzcCHQ6iAxV3JWyre0WsifI/hf6P1mfMm0OJvOAL9QlEb44A9rY3vZ+A7NuE+IR493St
         PlVQ==
X-Forwarded-Encrypted: i=1; AHgh+RpNZXf2LpjES1Wlvv037493QIgw4r6T8FD7F83cclbsS3wtftqx6ZGSWCYthl9Jv08RRALqjMpC7iMKAw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7J7X3meglbSpZficIr9HNCa+3afQZC/cmoSciO/YAPvmSmO+4
	bF+cpF+LbkderTQpTqXgqAwTDHR47EjezDSOLLuIM1gKw5Cel2K3b/oD
X-Gm-Gg: AfdE7cldrJgyLCztp9VA0q6EDth601cnb8cg13SdHpX0/obNCgSyn14+8CvyaVkzZcR
	k6qNMIyo6kP6xkLL4un0G6alOfj+rZG0idv1VVHMW1pp394F1Q97EMpQ///xxQHbrUQbYlO9+IM
	zuWjdF/RCZPX4eGxERoi3RrA5gFxT34WiFCFctAZTghLsa/7ONKOIbg630DAncTrZT1/ZPEMQuN
	JwbSbYFvhngzSnLdSd5mO+d630TUAbbrrR2FQgT/n0+gHelTZ7mLPrxwNbQeUEMnJ30+N1B2O9f
	tIAmajnhDdXUzlqPydjPOrQiljFfqXxp/kHl3iZ8ioZVwQ9IZEdzq+h64284L9pt3OVEogrk+59
	wHEgRSXCzAonj3OSOJeK5vpCacXLDaEiXNIV8CIxd80v1NBfB8emGyiniFgyP1cFJlxkjAkL2oE
	pujoyGoR1Kh30vuH7T0rJpiXUHsE7TyxwgmnfaPGPq9BD+0GpUt/bYiw==
X-Received: by 2002:a05:6a20:d489:b0:3bd:1cfc:1b9b with SMTP id adf61e73a8af0-3c0f08f8997mr25664718637.10.1784086723094;
        Tue, 14 Jul 2026 20:38:43 -0700 (PDT)
Received: from localhost.localdomain ([49.207.223.101])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174a583bcsm91977889eec.19.2026.07.14.20.38.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 14 Jul 2026 20:38:42 -0700 (PDT)
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
Subject: [PATCH v2 4/5] media: i2c: mt9v011: Add missing media_entity_cleanup()
Date: Wed, 15 Jul 2026 09:08:23 +0530
Message-ID: <20260715033818.10967-11-birenpandya@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-67612-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:jacopo+renesas@jmondi.org,m:kieran.bingham+renesas@ideasonboard.com,m:laurent.pinchart+renesas@ideasonboard.com,m:niklas.soderlund+renesas@ragnatech.se,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:birenpandya@gmail.com,m:jacopo@jmondi.org,m:kieran.bingham@ideasonboard.com,m:laurent.pinchart@ideasonboard.com,m:niklas.soderlund@ragnatech.se,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2FCAD75A5BC

The remove function is missing a call to media_entity_cleanup(). Add it.

Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/i2c/mt9v011.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/i2c/mt9v011.c b/drivers/media/i2c/mt9v011.c
index 055b7915260a..b7ef8bff727d 100644
--- a/drivers/media/i2c/mt9v011.c
+++ b/drivers/media/i2c/mt9v011.c
@@ -520,6 +520,7 @@ static int mt9v011_probe(struct i2c_client *c)
 	    (version != MT9V011_REV_B_VERSION)) {
 		v4l2_info(sd, "*** unknown micron chip detected (0x%04x).\n",
 			  version);
+		media_entity_cleanup(&sd->entity);
 		return -EINVAL;
 	}
 
@@ -542,6 +543,7 @@ static int mt9v011_probe(struct i2c_client *c)
 
 		v4l2_err(sd, "control initialization error %d\n", ret);
 		v4l2_ctrl_handler_free(&core->ctrls);
+		media_entity_cleanup(&sd->entity);
 		return ret;
 	}
 	core->sd.ctrl_handler = &core->ctrls;
@@ -577,6 +579,7 @@ static void mt9v011_remove(struct i2c_client *c)
 
 	v4l2_device_unregister_subdev(sd);
 	v4l2_ctrl_handler_free(&core->ctrls);
+	media_entity_cleanup(&sd->entity);
 }
 
 /* ----------------------------------------------------------------------- */
-- 
2.50.1 (Apple Git-155)


