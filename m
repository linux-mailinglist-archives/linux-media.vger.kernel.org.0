Return-Path: <linux-media+bounces-64830-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id w1B3IIvqLmpZ6AQAu9opvQ
	(envelope-from <linux-media+bounces-64830-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 19:53:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D71D8681D27
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 19:53:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=bN6d06Lj;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64830-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64830-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E472C300C599
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 17:53:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EF7E39E9D6;
	Sun, 14 Jun 2026 17:53:06 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE72C20DD51
	for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 17:53:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781459586; cv=none; b=KL1ZS+mOjQXJfm8si95yKvdnrZjbZkncNpSqO2LnlbgrStV9DZRKAPrrBRNeypyJF7ioANvkS4P0x4MTfwosE7K3m8+3MYhgSkmlZ/0SIpNW/S3jbHv+GtBNEBHhfWKGq0kqIw1gZJeL6MJsy8EVMAUktUCwmccooLqzPtIo/tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781459586; c=relaxed/simple;
	bh=JfLxLBxdggib/7lnvrpJzTMrJbA/f2/bHqYLdFpo+h8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i2JrS3eXE5xzXPZIpaL2VLshSwgxbyTCiIUbF0wUcPZjQEaEqI2ip93UVWA9TT12FaBadynEASiGZqRkmZJzIW0Erb4Td4c+FhaTqNXsgEvilgNwNY9FNhJhNxjf+gQ1KviOZ3wMW9E5ENrsvpk1DZcxe1UAmDFr7FqQdF3HiFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bN6d06Lj; arc=none smtp.client-ip=209.85.216.41
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-36b9d265355so1164624a91.2
        for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 10:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781459584; x=1782064384; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z5N60z2AagBSDrvxbJydn4T2vFG9hkBc7fVUcWps7xw=;
        b=bN6d06LjW2+nR537+A81dIWt1n1uvL9I7KRwQzKJtgO9UMRtZuqUjWP85I643BrLCK
         l7pSAjIe06D4HzIwMdI9Pc6EbxE084u4mZ/ZiwbqS/A/j+sJzaePn7B84/9x/l6ilGSm
         6INRdfcRNuJ7n27nd6NUH0wCLqBI5oWjAhghxodivrqIBC3Vsq2ysKxMAaa9OEXffRoH
         0/prcXqoiABBPGWrty84QrvQ6LguRnU/Zziw2EAyssm1P3oZY5NYhbPi7w7LejI0Xfkd
         PrVpPtOKEVEAaggLwM4JK4YFbQtJJIFOx6TvswkW/LpyAqJItc9gYW4YB2OATS/eHCvB
         TIXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781459584; x=1782064384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z5N60z2AagBSDrvxbJydn4T2vFG9hkBc7fVUcWps7xw=;
        b=frkmv++Sa3A8skMskhsR/Elsav8eZULffIUIAvpJV3dMxG6qGPaqpR/84+1+oDlBjh
         MXXv54LOdIcPoNw1RlQZTQdGlSLwrWKXVDnyzZO5ap+AteCV+moKqhM5ecS2TCWmTAMk
         bHKGHJbK1kmbPPnDOFtkbx7Dpwkp8BkCmZEgglzv/WT6T6/ohq8utYlNW10s1fi7SzaF
         WkkKTv0O+CdUPNU21Q+k+9GEVK/eZHRPpFvnVjzWhYEEcAgWtH9FRqm6HcgTcE9BJcgu
         AhCKnkrgkY/hNWfhnJey1FcWhtwL6SW5zsePGgjluIvZkIEgEl1WKaigyRRnPAqFRUPs
         IxjA==
X-Gm-Message-State: AOJu0YzhoVJCGuXEuwIsCXUMONMUhW93xBLw9HiGdtoy1AnpkQqIURP0
	L/nh6wNolVewg5453+WZ9Lq7E1S6go6FOmyfwpZXUraSKBltKqz31ZEllSKTipai
X-Gm-Gg: Acq92OEJQnUAJyUnMKsMZwT9gAlYF4Slz64VCavvH/ft8MLB07tQFLtZWTOtLRYoyIS
	DIc+I/vXeAGKvVqAUV5+fs0zmygw0lzkRRdOAWSiVN9AqDZjcyvB2/zFD+nqpL/OksDCuNKPd62
	5ndxdyrwQFXHV3/guOHOkYw/OKqbfZLkB/PPjWSOsAkYkQWGBVFn/mmHm439V/nixls6ftXwcrh
	zwmcF5cCya0FTD7+Brym+WfpCfUEFS9JNeEKuBK2GzxKK+kDrbA9U+myXQ+YP2jMCWqy7D4sBbj
	O4yk7YagbHothv5qMsieGHPIzYfFC3mYRBJVshutd39E7AK1R4go9ULrJS0qZq8tfWXraKyjl8J
	853ndB5/qrYNJWmgt19yzx/5JznHNaYXu3fZkAwa2A+Pc0Ej9V0lPBFoVYUbr2L/bFyN/XXo5LB
	f4D+z61QMkKudh34Vd7HmdrKsMq/0TShoNPTkds1xOPLrgKTu2dqdy
X-Received: by 2002:a17:90b:4d07:b0:369:e4d4:79c6 with SMTP id 98e67ed59e1d1-37a03ad61d9mr11934086a91.20.1781459584324;
        Sun, 14 Jun 2026 10:53:04 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.37])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a1eba8e9asm7913694a91.2.2026.06.14.10.53.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 14 Jun 2026 10:53:03 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org
Cc: Biren Pandya <birenpandya@gmail.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH v2 2/3] media: platform: rcar-vin: Add missing media_entity_cleanup() + fix UAF
Date: Sun, 14 Jun 2026 23:22:11 +0530
Message-ID: <20260614175221.6619-2-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260614175221.6619-1-birenpandya@gmail.com>
References: <20260614175221.6619-1-birenpandya@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64830-lists,linux-media=lfdr.de];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,ragnatech.se,kernel.org,glider.be];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:birenpandya@gmail.com,m:niklas.soderlund@ragnatech.se,m:mchehab@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D71D8681D27

This patch adds a missing call to media_entity_cleanup() in the
probe error path and remove function to properly release media entities.

Additionally, it fixes a severe Use-After-Free vulnerability in
rvin_group_notify_complete(). If the registration of one of the
video nodes (or the subsequent link setup) failed, the function
returned directly. This skipped the cleanup of previously
registered video nodes and the media_device, exposing them to
userspace.

If the probe function then aborted and tore down the parent
structures, any subsequent userspace access to the stranded
/dev/videoX nodes would result in a Use-After-Free.

This patch adds a proper cascading rollback block to unregister
the video devices and the media device before returning the error.

Signed-off-by: Biren Pandya <birenpandya@gmail.com>
Assisted-by: Claude:claude-opus-4-8
---
 drivers/media/platform/renesas/rcar-vin/rcar-core.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
index c8d564aa1eba..b8e4c8be431d 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
@@ -219,7 +219,7 @@ static int rvin_group_notify_complete(struct v4l2_async_notifier *notifier)
 	ret = v4l2_device_register_subdev_nodes(&vin->v4l2_dev);
 	if (ret) {
 		vin_err(vin, "Failed to register subdev nodes\n");
-		return ret;
+		goto err_unregister_media;
 	}
 
 	/* Register all video nodes for the group. */
@@ -228,11 +228,24 @@ static int rvin_group_notify_complete(struct v4l2_async_notifier *notifier)
 		    !video_is_registered(&vin->group->vin[i]->vdev)) {
 			ret = rvin_v4l2_register(vin->group->vin[i]);
 			if (ret)
-				return ret;
+				goto err_unregister_vdevs;
 		}
 	}
 
-	return vin->group->link_setup(vin->group);
+	ret = vin->group->link_setup(vin->group);
+	if (ret)
+		goto err_unregister_vdevs;
+
+	return 0;
+
+err_unregister_vdevs:
+	for (i = 0; i < RCAR_VIN_NUM; i++) {
+		if (vin->group->vin[i] && video_is_registered(&vin->group->vin[i]->vdev))
+			rvin_v4l2_unregister(vin->group->vin[i]);
+	}
+err_unregister_media:
+	media_device_unregister(&vin->group->mdev);
+	return ret;
 }
 
 static void rvin_group_notify_unbind(struct v4l2_async_notifier *notifier,
@@ -1250,6 +1263,7 @@ static int rcar_vin_probe(struct platform_device *pdev)
 	rvin_id_put(vin);
 err_dma:
 	rvin_dma_unregister(vin);
+	media_entity_cleanup(&vin->vdev.entity);
 
 	return ret;
 }
@@ -1274,6 +1288,7 @@ static void rcar_vin_remove(struct platform_device *pdev)
 	rvin_id_put(vin);
 
 	rvin_dma_unregister(vin);
+	media_entity_cleanup(&vin->vdev.entity);
 }
 
 static DEFINE_SIMPLE_DEV_PM_OPS(rvin_pm_ops, rvin_suspend, rvin_resume);

