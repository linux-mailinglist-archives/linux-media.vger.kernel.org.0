Return-Path: <linux-media+bounces-64839-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uz/mG8XyLmqx6QQAu9opvQ
	(envelope-from <linux-media+bounces-64839-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 20:28:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D415681E30
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 20:28:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=qD4crf8J;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64839-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-64839-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 80C8B3001D5F
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 18:28:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F75C39EF20;
	Sun, 14 Jun 2026 18:28:17 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC073955F1
	for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 18:28:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781461696; cv=none; b=ZOKUdn7JzMHdxaq+aMGY/T1TAg9JZtP3IuyAD+6Qb3tmz/2JywDvrN7+V3xWqiVgJ/AARE82RWtGj2INpCqvdGNEOBTDBaQ6idW3nSu5EWVCnz7ke19q6DqZAfjYAQ9Ti6vym6B4sJSEer5UWB//8q/28Jjgtc7Id5Bzl+fERBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781461696; c=relaxed/simple;
	bh=aA2lvOsMnH2mO+/8YIqJPIcISuycGqquD9i2CRjJ1EM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VKXSapaWdEIgg4YB+AtBoCPdAGGBGFdYYkxZ9e6kFG8maWgxzqI/3JDBGXCoiymjCns1JpqaWxaq8QtO/8afD4j8l3IRXTji+x9pZ9H58WIVdfpbdc1KnD7+zzqh4ZIhLXlhYjvX8w0G4D7Jyt5GmirCKXRXvV+xWi79a7fo9mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qD4crf8J; arc=none smtp.client-ip=209.85.214.176
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2bf2247e38eso24186025ad.3
        for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 11:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781461695; x=1782066495; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bMvh30Es9oLlJJyrOQEw57Oa/27GiPIiQMoWeMBWI2Q=;
        b=qD4crf8JBrsuDQKmO5DmDHgrQ5JDGDUQSs1Fy0nD6gr8jM5YVG86FY4XCVSpU9jUWi
         0ly2TLXvyvcDyrsfFzfimrVTDxomO7dbwV3c3lq+hjOaQGYExXnvuntAzpzE03GDkalP
         huxt8CD5QDXMXXClA7/6qg/zckaKtXc7+qE60s0sd61MtqrH5HS2RRiN43LSUMqjO69E
         1UY/zkLcFr7qlWU6YYaAgGvlCYEbT8fT7PzClUOxuVtALRO1saf3PVcWP+OjuFnvc5fV
         o2tnHyP1mp/Mv1dGoE2nZUPuD8k4BV/Oxi2tfNGVdLVXGgOxvnsFO1ICDgPhkyPWH47h
         oSfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781461695; x=1782066495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bMvh30Es9oLlJJyrOQEw57Oa/27GiPIiQMoWeMBWI2Q=;
        b=abDwjhsKbV+MTMQpGsUj0XC07f2QqfXg7gMsZ25yKE/RwfLNa/AptN+Wg8Uu0AesOj
         2eCg8qDorjBgbaxVUuIsRmQh2jAJEtqeXu3BLvvDSav3ZPFgG6biV/y91oNbYzpTk2I3
         FIRbCWlh7aJgkS0GSnCKVpxBgqIhX74LAR6uAC5dgyJqP3TKEFBgsHhKJl9VqT2cZzEw
         ddg846e9siQoHBH+E/vF9gmrPBDkAgGi3rbEyPhDyRmS/GclQPsUnUtJr5EpvOsiVaJR
         gdRCW1mfQqmsS8fXqKBO03gqaR5ItkxEOrx78+sYdR3lNHXRVlV82WYSvyp2cKOlLGTJ
         fflw==
X-Gm-Message-State: AOJu0YzLht8c08cnpk83rru4m7GjvspzJerlmePLXgDmUdqPEI4R+W7l
	HyQSgo1fUFjITbh2QEnLR7a6zYy9Z+HBntYUbalWye7jEnhelkjoK++djmf177ST
X-Gm-Gg: Acq92OGFUfKFd5hNtxa0WbljNeRNwpPbZWk+sqg2loHDglfef6KHw0YL+HmJpJH0hvt
	wLZDo+A5LdAqbR6tq5vRxgEsMsAjrHMQajQ5hhEtSMxQGrVswr/rRJQT8E71RGkeXo8wxlLROke
	lNtUu569SS95qrY31V90SCPjguxG0OEHzRl6xJ2S5LVF8i6Vkg4zJIBs84qigngu64hdLwaS5NW
	sEE1YJkereRn6sFYf2jejV8SnufHPuCWDgKwmNU0a6NKE8cRvIjCZIrktn85SA0PZKqZzjCNBqX
	wlacXZFDfsyVEZaXOLGA53y+cyj7UBSuQdpEVn+K4ZWFRKoz2ZFbl2ZcRPdjJoYVSSgg0ppmYV/
	XCIUYb6yxYC9yl6Qs9gsffh43welddOPkZk8tvWh6U/zQs7L82Hey6sn6FLKn4uee/mjqXp48Ly
	DABGfmudcbJlPrWnnYC/+mMWJRv0N/Q2RZv8wFG/UX5heeOXJRFjA1
X-Received: by 2002:a17:902:e5c3:b0:2bd:6e1c:3ce with SMTP id d9443c01a7336-2c41235e47bmr135814325ad.20.1781461694875;
        Sun, 14 Jun 2026 11:28:14 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.37])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f2e5369sm79161335ad.9.2026.06.14.11.28.12
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 14 Jun 2026 11:28:14 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org
Cc: Biren Pandya <birenpandya@gmail.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v2 16/22] media: platform: hantro_drv: Add missing media_entity_cleanup()
Date: Sun, 14 Jun 2026 23:57:10 +0530
Message-ID: <20260614182714.7999-8-birenpandya@gmail.com>
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
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,collabora.com,pengutronix.de,kernel.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-64839-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:birenpandya@gmail.com,m:nicolas.dufresne@collabora.com,m:benjamin.gaignard@collabora.com,m:p.zabel@pengutronix.de,m:mchehab@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0D415681E30

The media_entity_pads_init() (or media_entity_init()) function initializes
the media entity, but the driver forgets to call media_entity_cleanup()
in the error paths and remove function. Add the missing calls to fix the
API violation and prevent potential future memory leaks.

Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/platform/verisilicon/hantro_drv.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
index 2e81877f640f..ad71c0402ef3 100644
--- a/drivers/media/platform/verisilicon/hantro_drv.c
+++ b/drivers/media/platform/verisilicon/hantro_drv.c
@@ -771,8 +771,10 @@ static int hantro_register_entity(struct media_device *mdev,
 		return ret;
 
 	ret = media_device_register_entity(mdev, entity);
-	if (ret)
+	if (ret) {
+		media_entity_cleanup(entity);
 		return ret;
+	}
 
 	return 0;
 }
@@ -860,12 +862,13 @@ static int hantro_attach_func(struct hantro_dev *vpu,
 
 err_rel_entity2:
 	media_device_unregister_entity(&func->sink);
-
+	media_entity_cleanup(&func->sink);
 err_rel_entity1:
 	media_device_unregister_entity(&func->proc);
-
+	media_entity_cleanup(&func->proc);
 err_rel_entity0:
 	media_device_unregister_entity(&func->vdev.entity);
+	media_entity_cleanup(&func->vdev.entity);
 	return ret;
 }
 
@@ -878,6 +881,9 @@ static void hantro_detach_func(struct hantro_func *func)
 	media_device_unregister_entity(&func->sink);
 	media_device_unregister_entity(&func->proc);
 	media_device_unregister_entity(&func->vdev.entity);
+	media_entity_cleanup(&func->sink);
+	media_entity_cleanup(&func->proc);
+	media_entity_cleanup(&func->vdev.entity);
 }
 
 static int hantro_add_func(struct hantro_dev *vpu, unsigned int funcid)
-- 
2.50.1 (Apple Git-155)


