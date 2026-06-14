Return-Path: <linux-media+bounces-64856-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OmVTNlQPL2p+7gQAu9opvQ
	(envelope-from <linux-media+bounces-64856-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 22:30:12 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB226822C5
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 22:30:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=b848RYGA;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64856-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64856-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 38903300B45E
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 20:29:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5A0C324B32;
	Sun, 14 Jun 2026 20:29:48 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3093531F9B1
	for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 20:29:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781468988; cv=none; b=QHO32aAIJLP6VO/3DzPT4OePAy/NLqIgc0GN8l9h+i5aDSsNqp4ZSE3FCLM8LHmfdUmdhycdaCxgvqRG06kxhS3g3Cg85EZHXrea2GswZ2XjS8d3ouxsDuADro1sRmI8M6sn6pmx+FOzvYqHMwgWQVkXhr9rK2XpabBsm2D0so8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781468988; c=relaxed/simple;
	bh=v+NlPhRnEz29q2ng1IBN33RzgRhJ9diT1L1GgtXoWJI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aFW6SG6eMqWDp9u605MNKW09+UEgMwnI1xlJ7OXerWoECCG7M+BdTdoyr0HhKzUgU0Z3pVxJtOKywe3OzkcHeAYPziEPkOoiXtQBmO8iR4rhIu/0yFtQFURB+91WkCg1TNejrNFcwKyNIh0jkcb9eyFTG6xvxOoqo0i06SBCeNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b848RYGA; arc=none smtp.client-ip=209.85.216.48
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-36d98b68d68so1670856a91.2
        for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 13:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781468987; x=1782073787; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bH/cbjbZtv23kcj8ZeghVDFSxmFHRJh+heKgcvbBRj0=;
        b=b848RYGAnoog8Y3VnohAZNAVaM6z/ptHbkBvp4SCj1l0gvW8TEwlzaIBByGL5kg/P0
         pYXL8g5gh0Nmi1/BnnzrurStNCkhoNODuif4MOVtWm4XJnhayIOofLM8gFYgPZyZUdQE
         Hq3QMYTqgPbSG/r4/hdsMPC2stUyAazgRrExSBHOI2LcBwrf6+2vO4nvraRSfqNJgpNW
         y3/PYVKaaBgWdYAGVTn85aR9gda7ks4ITKm0oKAjvTwA9sZXuJa8EF5YxuL1+ntZeoOa
         YAQEZJOxGlLowKB7RdD9GBRlRF3osXXFGDI1PoLOhxNe/1+gcggpW9bppfs2QPvETKKX
         uCuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781468987; x=1782073787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bH/cbjbZtv23kcj8ZeghVDFSxmFHRJh+heKgcvbBRj0=;
        b=R5XxA/tHPaZ7R5rnKOVrjKQn8k9idV2pzRVHtwTr10GrSZDt/Ad5J6HRErb5fJpCwD
         K5+iTql3LKIxc9AendcEGDz0kSF+qLsYe4WQfFKmE2X6Fd9xTY9P3UWGkLoqbjM+bwTd
         bP4TTJ5mEUlasW4FnW3ZflvsXZQSqNJtbsDSuJzBWa1I3Yh9oDbrm6arvCV+FIC7HZzS
         sn9J2Uszz5zPK+/6RAO0kHsqwx0zuLNQCuDOap2H5MHT2aciEnhamqA3OYLo+e1Ek59+
         G0XFj+pewrHOCYsGpF6mRjZ9KVOTHRyPiJT87rgLvzQJM9M5zRuSKqyVnY1H1uJfnvwL
         OF0Q==
X-Gm-Message-State: AOJu0YzzVr/UdjUznUsxsGwGpzR4i/RasZp1C8DhN5CnqDY+37/U7Le6
	6lMVmI1kNap723+x4skTra4gSSd0PiEtXBvY8FhNhh4Ba38HbJ+qPEsHL/zTyavq
X-Gm-Gg: Acq92OHVFHvvT2mrvC9HrYjMV1GMxhxjoXVdMoNOYtU9L2evfLatMho5Zi5cDkIKXIY
	49x/3z9Sb1dujxsmUB2uWLDDzB7Jm8+YBciyVy9Br5TaO4gxeVR4QEuu9JllKN4KFFRF/7ikGUP
	ktyfkeCHUpSr8lqvJiNA4k+nm09/wc4K7MMY+piYOxJsB8JkotLTNTnYJPAfTWqNoeV2FRUcNLL
	O03Hyg66lOE4aRpkOoCUS4erj5pqchgnIAomuyT674VD/IvPDiqzMKu1JRzWw8VHnTjHKJXdQAL
	eb9vohwT+b/KnfgEBVbwEltRIxGpwb7zC827PN1s88fVpNNTtgAJUKsODxo0vikHijFKZ2zIH39
	2mHug56eQOdI+o/F8lXl8b7QNvw0+OEHqNUCwFeBtHt26HYzCPTlj4MfToYfBFoUwJbxSM6puv0
	J9isRC9AKZyb3dX/RnARZXTXDqsEXvAvqcklgaPIRRKtqR/w9GXz6J
X-Received: by 2002:a17:90b:2d4b:b0:368:ed26:15b2 with SMTP id 98e67ed59e1d1-37c2bc65207mr7762023a91.8.1781468986615;
        Sun, 14 Jun 2026 13:29:46 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.37])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-379e8cc467csm5439828a91.2.2026.06.14.13.29.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 14 Jun 2026 13:29:45 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org
Cc: Biren Pandya <birenpandya@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>
Subject: [PATCH v3 13/22] media: platform: rzg2l-cru: Add missing media_entity_cleanup() + fix UAF
Date: Mon, 15 Jun 2026 01:58:13 +0530
Message-ID: <20260614202835.11977-14-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260614202835.11977-1-birenpandya@gmail.com>
References: <20260614202835.11977-1-birenpandya@gmail.com>
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
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,ideasonboard.com,bp.renesas.com,glider.be];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64856-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:birenpandya@gmail.com,m:mchehab@kernel.org,m:laurent.pinchart+renesas@ideasonboard.com,m:tommaso.merciai.xr@bp.renesas.com,m:hverkuil+cisco@kernel.org,m:geert+renesas@glider.be,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:biju.das.jz@bp.renesas.com,m:laurent.pinchart@ideasonboard.com,m:hverkuil@kernel.org,m:geert@glider.be,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3CB226822C5

This patch adds a missing call to media_entity_cleanup() in the
probe error path and remove function to properly release media entities.

Additionally, it fixes a severe Use-After-Free vulnerability in
rzg2l_cru_group_notify_complete(). If media_create_pad_link()
failed after successfully registering the video device and IP subdev,
the function returned directly without unregistering them.

If the probe function then tore down the parent structures, any
subsequent userspace access to the stranded video node would result
in a Use-After-Free.

This patch adds a cascading rollback block to unregister the video
device and IP subdev on failure.

Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
index 3c5fbd857371..3ccd895c09fe 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
@@ -50,12 +50,12 @@ static int rzg2l_cru_group_notify_complete(struct v4l2_async_notifier *notifier)
 	ret = v4l2_device_register_subdev_nodes(&cru->v4l2_dev);
 	if (ret) {
 		dev_err(cru->dev, "Failed to register subdev nodes\n");
-		return ret;
+		goto err_unregister_ip_subdev;
 	}
 
 	ret = rzg2l_cru_video_register(cru);
 	if (ret)
-		return ret;
+		goto err_unregister_ip_subdev;
 
 	/*
 	 * CRU can be connected either to CSI2 or PARALLEL device
@@ -71,7 +71,7 @@ static int rzg2l_cru_group_notify_complete(struct v4l2_async_notifier *notifier)
 	if (ret) {
 		dev_err(cru->dev, "Error creating link from %s to %s\n",
 			source->name, sink->name);
-		return ret;
+		goto err_unregister_video;
 	}
 	cru->ip.remote = cru->csi.subdev;
 
@@ -84,10 +84,16 @@ static int rzg2l_cru_group_notify_complete(struct v4l2_async_notifier *notifier)
 	if (ret) {
 		dev_err(cru->dev, "Error creating link from %s to %s\n",
 			source->name, sink->name);
-		return ret;
+		goto err_unregister_video;
 	}
 
 	return 0;
+
+err_unregister_video:
+	rzg2l_cru_video_unregister(cru);
+err_unregister_ip_subdev:
+	rzg2l_cru_ip_subdev_unregister(cru);
+	return ret;
 }
 
 static void rzg2l_cru_group_notify_unbind(struct v4l2_async_notifier *notifier,
@@ -300,6 +306,7 @@ static int rzg2l_cru_probe(struct platform_device *pdev)
 
 error_dma_unregister:
 	rzg2l_cru_dma_unregister(cru);
+	media_entity_cleanup(&cru->vdev.entity);
 
 	return ret;
 }
@@ -316,6 +323,7 @@ static void rzg2l_cru_remove(struct platform_device *pdev)
 	mutex_destroy(&cru->mdev_lock);
 
 	rzg2l_cru_dma_unregister(cru);
+	media_entity_cleanup(&cru->vdev.entity);
 }
 
 static const u16 rzg3e_cru_regs[] = {

