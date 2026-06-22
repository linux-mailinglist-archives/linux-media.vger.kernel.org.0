Return-Path: <linux-media+bounces-65400-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id D9hIC/SDOWqkugcAu9opvQ
	(envelope-from <linux-media+bounces-65400-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 20:50:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0766B1DFA
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 20:50:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=QX1daAnG;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65400-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-65400-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 876BD3031C21
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 18:50:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D533351C09;
	Mon, 22 Jun 2026 18:49:17 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8EF348C5C
	for <linux-media@vger.kernel.org>; Mon, 22 Jun 2026 18:49:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782154156; cv=none; b=qorBQtuHFRsTtS7nXccFi3PPcRBb+uzCX4le9CksniQtpEy2Zsi+88ZC3V8X2xIRM5YyA5/LnQmk4LgbLOrgauMgBsNH563727okFSaGKUwoaNW2MvYGcPN7nZYl0MSTB1k+QkW7MEjZyjlbcYGxLHg+5By0olMlVS2HqHASCoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782154156; c=relaxed/simple;
	bh=uQpQFEgVQRMZl9ga6dV8oBi/I0Inhusd5je+kblypos=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k7YmV6m2Lj1zXLgrn2ybCUh1YoM9tyfnBTL2j7GJ0mjIxwU/yiR0Bnqf99V2uBGR51rmfUYliRxKJUJmANSLRsD/uWKC8+bZrto5FEHGZ8AmVGdwj9xWlWw1YSoO1cr6cbsf8awOUTdOu1P3y0t9L0wYejV2km3Whj+6d2OnlW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QX1daAnG; arc=none smtp.client-ip=209.85.216.51
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-37d82f3a244so912551a91.2
        for <linux-media@vger.kernel.org>; Mon, 22 Jun 2026 11:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782154147; x=1782758947; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uVEg2i1Z7njPeqcdf/tSoRttZE7Mq1P1yGV0C9miEPg=;
        b=QX1daAnGY3pTURUg3sgNVDbljVTKceyHP+6oK5SYvyskHCJHviS5DwhL5L1zMX6mEj
         TXJxqqN5bkdyAOefzcfPCSQvTLF0gJbfsda8ZnuaZ2wvoMhG4+TTWg+9PG3SVYVtXfnw
         Htfl/u/l5knaVJposx9sbe5dvrwad9aFmwbi8UnTaIuICD4fR6ek8OxDdKBHngQjVOOf
         kAcTLmghDzjoQv6uPWIBItvPBL4w3nLic1vWgXy9WROqaxTg/5zD+Mw21aS/9+JRRJ5U
         V3WUKIf3+AspLLI3QZ9ViT7fRnxuExiK3Q5KxWI8xR24DKhZS4PzgqVAseCxCVyx3vAe
         lThw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782154147; x=1782758947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uVEg2i1Z7njPeqcdf/tSoRttZE7Mq1P1yGV0C9miEPg=;
        b=TBxDAgmtbCaMRtucfbFCWY2koJMDeJcB8t1wdccVtKsQ55shAdSpHPbZkF8kOgz/My
         Z2TeURmamwqVgL3OKcJkNvTiv+wb6qF/RdIafjthIA1YCXg30etH8fn0PynfER3LeajX
         aEHgffo1INLF1mYiSLSXdnnAdaVAGMnfwirv3kdrYSNXNEid7d7bhOqrtm9ALY2x1NY7
         faigUQDc/qmnbOO7M1D9HYejZQiDJ4ESSnslLNCJFeCxK/7VwcvhW5kE24fcRfcSU28O
         vAbRkb2BJQoIDmsQ48Ikb37QJLpJ5TbvBGVfqx/bFLekfcoSnIcWTI7uAkVbWN3zgRFc
         gAmA==
X-Forwarded-Encrypted: i=1; AHgh+RoF9mnFMfNjpnuTGqWT4S87CVRfNkWkCkHGN5ejamsHH6Axw7r+iBGcF5gfFRi4PBRv/HRMUaF2d4k5yQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2fl/OoPl674fsN8w2PsNhGZqo4UO/LK1vNH6OuZIgz2aXBxV0
	TuiC3HKjQMgRsloJ+UiGiv0K/HlZET3nyG0vTmMe6rkWt9RcSHTbq6BrxUL5QMIQ
X-Gm-Gg: AfdE7clOocUVQvnnUmcAjmjtvDSB2EGXHtcvk48AG7u0OnbTr3Bg0xzOlQNXQsfqfed
	EVNfwtjOnlAlz+Gj32f3ufC3BM4R216bWTweenyW7u2xSC/2LuP/K4KxTf8tn9ZXGW55mhweoOh
	wkgADKNXiNQrNP1LUdkOmVpHXsQnstWwOvQ57Xn0PUfqukN8VbkzcO1bjnAJl6HdbtmvOWxuGiF
	MjNVE3YlBeKuScnUQVJTqoVRi+R0KaEbS9dszTFy57v8XYQhY7vwywZsU/CK7NIn6hFVEfqOJ0L
	Hca/6sUYopKrM26bn56PXnNlIXLOR6Vt7JikP526gEJ/ESV8jVBCj7suGUMmGlUEezF4E9NwwM3
	+yp/rSwGtsA9HUSOGnCM1PaOfjSr5ZtuScqfqRflo7cNfpK8QuVUwqAMg4Tisqr7TZv8zBOPgYB
	M9IWg8x/7jkjA6GRyPXbxHe+gHgDwNj67KCjOelWML8g==
X-Received: by 2002:a17:90b:2687:b0:36a:d6dd:9fee with SMTP id 98e67ed59e1d1-37d4e438541mr9924052a91.12.1782154147217;
        Mon, 22 Jun 2026 11:49:07 -0700 (PDT)
Received: from localhost.localdomain ([49.207.234.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37d4f222bafsm7780517a91.7.2026.06.22.11.49.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 22 Jun 2026 11:49:06 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	birenpandya@gmail.com
Subject: [PATCH v2 4/5] media: i2c: mt9v011: Add missing media_entity_cleanup()
Date: Tue, 23 Jun 2026 00:18:45 +0530
Message-ID: <20260622184840.66226-11-birenpandya@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[jmondi.org,ideasonboard.com,ragnatech.se,linux.intel.com,vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65400-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:jacopo+renesas@jmondi.org,m:kieran.bingham+renesas@ideasonboard.com,m:laurent.pinchart+renesas@ideasonboard.com,m:niklas.soderlund+renesas@ragnatech.se,m:sakari.ailus@linux.intel.com,m:linux-kernel@vger.kernel.org,m:birenpandya@gmail.com,m:jacopo@jmondi.org,m:kieran.bingham@ideasonboard.com,m:laurent.pinchart@ideasonboard.com,m:niklas.soderlund@ragnatech.se,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0F0766B1DFA

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


