Return-Path: <linux-media+bounces-59849-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cAKzAsGv8GkfXQEAu9opvQ
	(envelope-from <linux-media+bounces-59849-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 15:01:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5855748570B
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 15:01:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B8B4B301AF1B
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 13:01:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 236E832ED2E;
	Tue, 28 Apr 2026 12:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ErnTEDRi"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE80B4418DB
	for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 12:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777381041; cv=none; b=OdE9kVatKfPe56fAX4HDfvdNgb1iA6/AiBNd6DwL0tDcyvGyyzDnKAJToHUywPJu4EPZDxpMS9/Yf+xASQTGD7xpiLaVbYlnZwsMlp+65SQGeHWYpjbGvsPGaBrxLq91RHziljIjKVpWupgw4F8HPc+P+dMUYUrJM2xVh9iuVbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777381041; c=relaxed/simple;
	bh=VqeLDQRLMKU7s+EZS+ig8a/zapOpnhK489qRigdsGcU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NTJWlhnEWSzi4qQvpEJvcZ76syf96lmVYZCBB6vokECSTSkgJHi255C2NPuDrT7Fal10GwqWIYggn9OcQyi1eZXhHonR4w8gvvhkmOT5KgperWvw3Akj6kLHBnGqdM+PRG30nkJxu4JqWxxj1EBlIlft+NgANSAzWWNqgC+fTU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ErnTEDRi; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2b24fcc2b5dso72322865ad.1
        for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 05:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777381036; x=1777985836; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9ZBVJ20UhMxUS07PwK3D+4nyCgSd/sgxQDWyRFPlgUE=;
        b=ErnTEDRiERA4qEU89zuDMOY8E+K0ICn72917+vcp5no0B2eiRCBOOcDQWNZpPrRJKe
         aB3fjwkxkxUYhXiiHax7hjK1wnoDGnuee/sq2ui5NRJekBjqCKBQkqkXGjKgEIC8PRLf
         Q58DDXHVBfwBBkqVO0fKW7iW6X31Bkv7YE82fPur4t08dYIqynf0iBZaNZqpSlJqZ9DI
         5Lcbehv2RVY1C5A9RwDZGF0w/8nsSf/x9GdgxtYcuZhfwFBmnLmu7b0/tG2o8yY980RN
         gUSKt1Wg8XYhnk8iEZbZvQXA/0/kiDPiFugnwZHvCu5Ok9Edbhg/a+tZya3OnNDs5iF0
         1Qog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777381036; x=1777985836;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ZBVJ20UhMxUS07PwK3D+4nyCgSd/sgxQDWyRFPlgUE=;
        b=fNbf8L6QfaGarpV5iVvgpRa0fLhtRG6NB8AKPLmvGDftmFaQyIU8TSWR6DBqR336xR
         fmzgDApz07PY4ZkB3w0ZCOIB7sOKiefrRs77Ts46W/Y08JdYYgQNceI8ePGpP8HU18vJ
         uf74en6xACvKxTmgl7mTZZhcdtzZzZifQpSAmjRwzNr/NBSxYzOc8Y98eeBoObLocABs
         +s0tcJPiyrLhAKaWhwiHxEoCOo0E7GqhCiDPpN/rQQsd2ywQVo28PsphKNQGH2LnE1Pn
         6cZqnw2lSrwbHJnrcJXEyGUAJxa47cx3PrhMC64BcBODX05XszP3+F617EXYMOn/bcNz
         ejlQ==
X-Forwarded-Encrypted: i=1; AFNElJ9W/KD1KOZ20bqu25OCvVoGC4ehBYk24x5aEE27GrwkacI3VN2HEiPoxV8Al3Pf3e5tnAC26xImxWNajQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9GXo5DdN+oYNhAdjqz+XoBv6T8Dmo6lBPARTgKDsdOrO3ETdL
	FJ19jFORUBgoQ5CSXQF4xR+W4QsFRvBFY/A8bYSaHjbf1JKUQPTPXmU=
X-Gm-Gg: AeBDiet4ONzlLnHXFFaVubIVVyxBX0hg+QeCg6PxYSPk3ocw2+LGO9DL+w14BlOAQFN
	QPq7M+EgCaNMDA9OdiA4DENCbmKYJnPUvWBbS5PFuVTAVRi9wdCCx5lTEHTBwysN1VMfwxeTO0/
	JY+uWWhnjvliH6X19M5NfOsSg+TJYkLD469FesVb0nTj0sYx4WVNkrzfHdgzwSX057tZxLxtkNX
	ON2cNP+F+EixYzB2n7pX+4gIfVncJro1uazzEu0eBbzZ6rgW49/0c1SnjyahKnJiGVqPGY5k8my
	wB1S5tWxgE/sPsOlyJIw1wZctlgnYnKkWcVGArymytBN2AMGlSY2XDd4N5IG/9dY0BwVFAdaG/8
	sVXeu+YRh0IQAqFzO9FxFk8e4bUZ+2kKHveK1ozwtORP05X8jhHSHCExgg+U4MLO83Mp5n81Nop
	pPde6lM4R5XmIu3O1oPZSbgwsM/yjknwnqhcd5PZtCfNQPpO7uAN0hLlu2lr+5eLrxV3mRE2WRh
	dNhjFo1W6AVlYY=
X-Received: by 2002:a17:903:1b2c:b0:2b2:a267:784a with SMTP id d9443c01a7336-2b97c47b88fmr29441165ad.24.1777381035694;
        Tue, 28 Apr 2026 05:57:15 -0700 (PDT)
Received: from localhost.localdomain ([1.226.165.54])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b97aca8b4esm26483825ad.73.2026.04.28.05.57.12
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 28 Apr 2026 05:57:15 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Myeonghun Pak <mhun512@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] media: rcar-vin: Clean up notifier on probe failure
Date: Tue, 28 Apr 2026 21:57:04 +0900
Message-ID: <20260428125708.93102-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 5855748570B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,glider.be,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59849-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mhun512@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

rvin_group_notifier_init() initializes the group notifier before
parsing the graph and adding async connections. If parsing fails
after that point, the function returns without cleaning up the
notifier, leaving the async connections and their fwnode references
behind.

The Gen2/default probe path also fails to drop the group reference
when rvin_group_notifier_init() returns an error after
rvin_group_get() succeeded. Unlike a successful probe, .remove() is
not called for this path, so the probe error path must unwind it
directly.

Route notifier-init failures through a common cleanup path, clear
the cached async connection pointers after cleanup, and make the
default probe path mirror the CSI-2/ISP group unwind.

Fixes: 856b49c71ae5 ("media: rcar-vin: Merge all notifiers")
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 .../media/platform/renesas/rcar-vin/rcar-core.c    | 32 ++++++++++++++++++----
 1 file changed, 26 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
index c8d564aa1e..8ba8d49c3e 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
@@ -318,6 +318,20 @@ static const struct v4l2_async_notifier_operations rvin_group_notify_ops = {
 	.complete = rvin_group_notify_complete,
 };
 
+static void rvin_group_notifier_cleanup(struct rvin_group *group)
+{
+	v4l2_async_nf_cleanup(&group->notifier);
+
+	guard(mutex)(&group->lock);
+
+	for (unsigned int i = 0; i < RCAR_VIN_NUM; i++)
+		if (group->vin[i])
+			group->vin[i]->parallel.asc = NULL;
+
+	for (unsigned int i = 0; i < ARRAY_SIZE(group->remotes); i++)
+		group->remotes[i].asc = NULL;
+}
+
 static int rvin_group_parse_of(struct rvin_dev *vin, unsigned int port,
 			       unsigned int id)
 {
@@ -440,7 +454,7 @@ static int rvin_group_notifier_init(struct rvin_dev *vin, unsigned int port,
 		/* Parse local subdevice. */
 		ret = rvin_parallel_parse_of(vin->group->vin[i]);
 		if (ret)
-			return ret;
+			goto err_cleanup;
 
 		/* Parse shared subdevices. */
 		for (id = 0; id < max_id; id++) {
@@ -449,7 +463,7 @@ static int rvin_group_notifier_init(struct rvin_dev *vin, unsigned int port,
 
 			ret = rvin_group_parse_of(vin->group->vin[i], port, id);
 			if (ret)
-				return ret;
+				goto err_cleanup;
 		}
 	}
 
@@ -460,11 +474,14 @@ static int rvin_group_notifier_init(struct rvin_dev *vin, unsigned int port,
 	ret = v4l2_async_nf_register(&vin->group->notifier);
 	if (ret < 0) {
 		vin_err(vin, "Notifier registration failed\n");
-		v4l2_async_nf_cleanup(&vin->group->notifier);
-		return ret;
+		goto err_cleanup;
 	}
 
 	return 0;
+
+err_cleanup:
+	rvin_group_notifier_cleanup(vin->group);
+	return ret;
 }
 
 /* -----------------------------------------------------------------------------
@@ -1228,8 +1245,11 @@ static int rcar_vin_probe(struct platform_device *pdev)
 		break;
 	default:
 		ret = rvin_group_get(vin, rvin_parallel_setup_links, NULL);
-		if (!ret)
+		if (!ret) {
 			ret = rvin_group_notifier_init(vin, 0, 0);
+			if (ret)
+				rvin_group_put(vin);
+		}
 
 		if (vin->info->scaler)
 			vin->scaler = vin->info->scaler;
@@ -1264,7 +1284,7 @@ static void rcar_vin_remove(struct platform_device *pdev)
 
 	if (&vin->v4l2_dev == vin->group->notifier.v4l2_dev) {
 		v4l2_async_nf_unregister(&vin->group->notifier);
-		v4l2_async_nf_cleanup(&vin->group->notifier);
+		rvin_group_notifier_cleanup(vin->group);
 	}
 
 	rvin_group_put(vin);
-- 
2.49.0

