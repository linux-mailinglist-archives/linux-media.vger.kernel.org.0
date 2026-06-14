Return-Path: <linux-media+bounces-64837-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id c2g4KNjyLmq06QQAu9opvQ
	(envelope-from <linux-media+bounces-64837-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 20:28:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A06681E33
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 20:28:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="iy/CA9I8";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64837-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64837-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3AB0530128C1
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 18:28:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBA0239BFF1;
	Sun, 14 Jun 2026 18:28:09 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F1531B78F3
	for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 18:28:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781461689; cv=none; b=cGui4vemgAamNOZ9dukKsRiHqbGEFsmI70SXR/caBcKaSOGfYZWCGsfbZ9XBwuUZCdmkjelWrAEeZMeAtcowMMXXMq9teEOjKr7sxOPx4fwtKACzIMJlvtb/v+3ribeKhP6g384FdQCYGP9LmbTVnoOqofiaNf/W55AsbftFE10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781461689; c=relaxed/simple;
	bh=P9YdI25xT1hmkBTY2atf61bLeIVgQtSN8Yp9Gz7mR6s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dciaRp2lyIdeNL47nKI/9Cp7pVevIP9x/HC7Oz3yKYLuFFUprlacuS7jrYLRqx669ikx2PooSngRiY/KGLpIKyuYVUK95In/E4SDzDcGNjNgeLlYfUjD0QCkPq0K1a18nyFDXxBWns3MjkQyC2r5IPfYABnCxACKPOOqExme4ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iy/CA9I8; arc=none smtp.client-ip=209.85.214.182
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2bf18c30bb2so19260455ad.0
        for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 11:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781461687; x=1782066487; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v/yXMOQz2Hp5A0p5Cnlk4wNtZtCpV6kUAXWb2AywhGY=;
        b=iy/CA9I80YXEz2I0sFmaD+C+WBPQ8ElyTBnUItUCwW6QuS8Xnenhy9VvW5Ze+tCaun
         x3cNfaQbKWbszoVn0RsqByhx3dcv98VgZ/mXrdqu/wi/o/ciow/8uzq26MG6Bjo3F+aZ
         xxW05fA859DFPkVfhX6QINGGHVIIBAiarus0a2EbR8V4gzqttqYmITq9FeOPSjrolvqy
         zA1QdmFr5n5Qs1PJCI/IYWVsuatEx6+afBTtI4BW4XBv7JGK3E67bwNWLYhRCnDfTIW7
         9BvE/Q5cXz1WLakjRZ63yar3Niy484IjZtok+8fuGPUiY0BB30Iq/UGoIopsXoGXdB1E
         gVGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781461687; x=1782066487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=v/yXMOQz2Hp5A0p5Cnlk4wNtZtCpV6kUAXWb2AywhGY=;
        b=MqdPtfkmB1WRuiOd+bQJjPg7a059salwLDs97bLPSj35U9kbZEFqBtc4KQ5V/lSGPz
         J51snNGG+dbn2w+wLYHEIA7EHOZ36FViy4Hk4zoNQoLHu2wQLecijt+c6n6FlCzOi0e/
         heRYhiyeSJ55v4NLhndd/hBSBvVp95RRfOMsxa/dLHTSed/riaOt12l4G5rDLyun8YJM
         deIOzYC6rh0SSwCgKGvrJhMPsLWla/+9uwkna9wjz1Ii2lP72NC3DLcJVpcLoGIvREs6
         hc6j3RVNAGOTJR9i+4I5e+T9dxEC9aDVbggT8Gd3Ce43LLo2H40iQeeQ7VaMF7DTghql
         kAcg==
X-Gm-Message-State: AOJu0YwZpN1HnjYHC2Stg7rxU6VVImRZLI0YkrzIOrRyUXtWLwtYHHII
	0Yom+OkujD1VsfDN2PmEvT4FtYcNyEINrUH73th8RfUvFpvIuU1qQ4/YV4ozSgbB
X-Gm-Gg: Acq92OEZig6eSpAnWtGUoNB5YJbfdU41k4XVe+IzBGdHe6J5z0ua4T5gx1Mhi/XHkUd
	XPd6eh/QFqxEjEKuIY4hR/FShT0UvvSL7xeLONEBD1mlSmGqhdZzzeLN56mbUBRSnC/5EquN1FO
	f4tploAQB5+/8LgeKifBs/W5Mat8jDJsV8xxXHrt4bAOLSui8lUGRwx77bfN808Yz2P4H1u1Cnu
	dq6knYOUKUgUh4xM59O8mFf3UCG3um1ddIZLCT/bvYUIu5Js9Fd2MxcmSuMgZ+8r8KqvSx3P2Yj
	joGd7P5PzdEDzkYZT/L/GHct7LVa5lD40z33WcAzeViqe1XEsOQRyKOV0AGdIUb1wdAmauXraDu
	N36R07xQyPnoBmpLUM98KfP+fhEKaCjo1Fx/SW8qxDwl1IbHB+S3Kk5xaqqIgYCjiLSKH3XPZ/e
	7QHYg4c1biuk7kUeS5cZequs26pyWBPZnTvB/AB8WiKxg5cKNJCcrw
X-Received: by 2002:a17:902:da8c:b0:2bf:1e59:d99 with SMTP id d9443c01a7336-2c6641cae2fmr83860175ad.8.1781461687492;
        Sun, 14 Jun 2026 11:28:07 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.37])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f2e5369sm79161335ad.9.2026.06.14.11.28.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 14 Jun 2026 11:28:07 -0700 (PDT)
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
Subject: [PATCH v2 14/22] media: platform: cfe: Add missing media_entity_cleanup()
Date: Sun, 14 Jun 2026 23:57:08 +0530
Message-ID: <20260614182714.7999-6-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260614182714.7999-1-birenpandya@gmail.com>
References: <20260614182714.7999-1-birenpandya@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,ideasonboard.com,raspberrypi.com,kernel.org,broadcom.com,linux.intel.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-64837-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:birenpandya@gmail.com,m:tomi.valkeinen@ideasonboard.com,m:kernel-list@raspberrypi.com,m:mchehab@kernel.org,m:florian.fainelli@broadcom.com,m:bcm-kernel-feedback-list@broadcom.com,m:naush@raspberrypi.com,m:sakari.ailus@linux.intel.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 18A06681E33

Fixes: 6edb685abb2a ("media: raspberrypi: Add support for RP1-CFE")
The media_entity_pads_init() (or media_entity_init()) function initializes
the media entity, but the driver forgets to call media_entity_cleanup()
in the error paths and remove function. Add the missing calls to fix the
API violation and prevent potential future memory leaks.

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


