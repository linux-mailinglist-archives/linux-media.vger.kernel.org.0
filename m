Return-Path: <linux-media+bounces-64857-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0NmEAIAPL2qE7gQAu9opvQ
	(envelope-from <linux-media+bounces-64857-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 22:30:56 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 520096822D3
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 22:30:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=RCc2ohdZ;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64857-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64857-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0E4C33015899
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 20:29:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38C93325716;
	Sun, 14 Jun 2026 20:29:54 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9117324B32
	for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 20:29:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781468993; cv=none; b=fcigucugumO5Iq3dskeWjt2fbZKQVF5yc3NM0Zs/mknLoDj87uRR4/lUEMJH2LcNiEpL1R5wGjFnSXY+ileF9Jkrhjf9kGrMtp+9dv/A93x2wgfk+BtKqe52yynvw22xV/cTXVmiTqhKeawVhE2cMHjWocwdT8yGxt8AoYmmon8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781468993; c=relaxed/simple;
	bh=qYyTdVjxjeO2aiFYoZZTJEcpI1m70R4Y/UV0HurBj/U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OLNMRnONSwkXX9zlgqddLpgFkInVYnBzPC0+T9d8CbHV/a8tmYXcNgy4lWWrLtCO4AYfmtC+fAvSzT6COnq8V5ERdflybaCoZZmVhWyaq1eW7j1VE/HM3Zrsl2ET7ZnRPJcgY7oggU0Vwoi1HgPdIaXTKurzHaD7vHk3bE3C3DA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RCc2ohdZ; arc=none smtp.client-ip=209.85.216.52
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-36c68964315so1355217a91.2
        for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 13:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781468992; x=1782073792; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XYzsjy3SptXfm22V8AvtLVlbCZ+zSIqAEOCC79nGITQ=;
        b=RCc2ohdZlqAS5QmWp1cUSaWUpDDk1Dy0HcKPigDlJb1TT7T2b+tzSWJNmxcxlcdWv4
         KlLNf1zeSeKYljvwLH2t0bwXT15EW6byZ/t28F41lNKNcrYYRzw1XN1r33glaQpFQTXL
         wGg8hzFyTq6krcb2G7x74eBhIRLlXESpRVFNczD5Gb1k//0qHBHF/821yPyjjohoyKFy
         bpUGFG3BQ314ojfI1kMmD5nexhQOw7pGDeaMixAJ5RidIq15bepJ4HM5uEH8UZaaQtDx
         Z+L/gXJwMAS5aW7PKp2M7eI71hFRLrZ9aKrL3S/nGLbfIqeBmMswEpfswH7Wdith40Eu
         9uXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781468992; x=1782073792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XYzsjy3SptXfm22V8AvtLVlbCZ+zSIqAEOCC79nGITQ=;
        b=h7JxKTS2IMlAIuV3JX/M2l8r5VkRMmJdsEKKJFyfQ88X7ku3jwClq3AEKY2k5xth0d
         2szu+7kD3SstMl34e89wUqx6J6il1lHS6tpkWue0UoKs2yOXaWwMIlSKjnVTq5XqdFiG
         DAgcp6kwyhNALqcdqpbvAiQR2DWhCRt2nkjOEcddGohFZH/sWIo3urD7BeWarkGI1l1n
         AA8E1jFnsohLEhd5J8KJECp4sjUzI/yN83K2f1P6Iyn4Pza4dl1Hc8KVyb3bRYJcX/p2
         vFSQPzIaEEWrCYtNOG3sK/pqH2H2tz0EBhbn0WKY8XWF+viXVmoTogvD/GmGDhGwyFvG
         3Ulw==
X-Gm-Message-State: AOJu0YyifBSdigyidCs3w2XtLGwT93pyYNKRywSSwrleGJqLQ2TSRT8h
	vw9f7fJDS/tbbQRrxjSAqar0OwgfHyE8/DK5x7cfdBBC9ouuVZkKp2gt/6wRSQSX
X-Gm-Gg: Acq92OHFS9s2Dz+Fs5GYhB6ZmS1GP4wH3YB+DHzXoHd2OrQMpu+ksV09vOeyBkKxX5c
	ssA7wzhkxiqDinLb9I/iiXz57/MbNURV01pG8AArOBlJM7kpuC/fvQvfll3I5/v0gcztZg/Dj5M
	5fljLbn44XN5+zjc33HdtbHZ9bd95F2buXbjSjIWR3so4jQJTBQ9hASndGjZdUtI89ergsi84Ul
	lg3TVBVIGnZLQF9VefwH0mc0XF3EMOtH19/SmK2dBaQhLrNKeMhPdhwK0qpgObeUTigDb3MZ+PY
	qYVkbyuab6UsVZ6paNzMvgOUjlStvei+h7Bu86ZCQgBZRi8rLxtytZUjY6zCnL1/H5aEO7Zc+eB
	j6MCXYr2A9nzLPJPlrWhTWx8NqhOQuM/5FOzbVrsAhtAAyzhTefp/ZSTPmXE5aSBbfXW1TpJCNG
	gVgMEpbxkGyU5uiRN7afUK2EVuQVGhp6wdOyEMnwAVSwExavnE4btt3TuF2MTTbDc=
X-Received: by 2002:a17:90b:570b:b0:368:d839:28d5 with SMTP id 98e67ed59e1d1-37a040ad487mr11995483a91.18.1781468992127;
        Sun, 14 Jun 2026 13:29:52 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.37])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-379e8cc467csm5439828a91.2.2026.06.14.13.29.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 14 Jun 2026 13:29:51 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org
Cc: Biren Pandya <birenpandya@gmail.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v3 14/22] media: platform: cfe: Add missing media_entity_cleanup()
Date: Mon, 15 Jun 2026 01:58:14 +0530
Message-ID: <20260614202835.11977-15-birenpandya@gmail.com>
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
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,ideasonboard.com,raspberrypi.com,kernel.org,broadcom.com,linux.intel.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-64857-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:birenpandya@gmail.com,m:tomi.valkeinen@ideasonboard.com,m:kernel-list@raspberrypi.com,m:mchehab@kernel.org,m:florian.fainelli@broadcom.com,m:bcm-kernel-feedback-list@broadcom.com,m:naush@raspberrypi.com,m:sakari.ailus@linux.intel.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 520096822D3

The media_entity_pads_init() (or media_entity_init()) function initializes
the media entity, but the driver forgets to call media_entity_cleanup()
in the error paths and remove function. Add the missing calls to fix the
API violation and prevent potential future memory leaks.

Fixes: 6edb685abb2a ("media: raspberrypi: Add support for RP1-CFE")
Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/platform/raspberrypi/rp1-cfe/cfe.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
index 8375ed3e97b9..17c523d32db7 100644
--- a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
+++ b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
@@ -2039,6 +2039,7 @@ static int cfe_register_node(struct cfe_device *cfe, int id)
 	if (ret) {
 		cfe_err(cfe, "Unable to register video device %s\n",
 			vdev->name);
+		media_entity_cleanup(&vdev->entity);
 		return ret;
 	}
 
@@ -2064,6 +2065,7 @@ static void cfe_unregister_nodes(struct cfe_device *cfe)
 		if (check_state(cfe, NODE_REGISTERED, i)) {
 			clear_state(cfe, NODE_REGISTERED, i);
 			video_unregister_device(&node->video_dev);
+			media_entity_cleanup(&node->video_dev.entity);
 		}
 	}
 }
-- 
2.50.1 (Apple Git-155)


