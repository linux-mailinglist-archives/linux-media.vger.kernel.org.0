Return-Path: <linux-media+bounces-56437-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MGIvEaucvGnW1QIAu9opvQ
	(envelope-from <linux-media+bounces-56437-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 02:02:35 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DEAC52D48BB
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 02:02:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 202703019C95
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 01:02:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEEDB26B2D3;
	Fri, 20 Mar 2026 01:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sqi5d1zJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BADD1C549F
	for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 01:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773968552; cv=none; b=tRAT3qUfDn7Yz5P3UmZ66osJ9ORFOZnsADYtNX2AyWTzyZWa34wErnKjqVoXSdXyygNYSyB94fl5ye56Ut5UIXrLKgq6vM26qxtpkJbb5hYMB+eWvlpT5Wkv2gTAfVWzNrslJuRT2pv2Kzp9Z47f9SXlaHNpw2awsPkHKBsy/So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773968552; c=relaxed/simple;
	bh=Vh5pjJxp2yT8y0tn/k1xKB47I2/Z8ojhYGQ/wxotbs8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ya5gBNoEAzol1npScU6uzQJo9uNPn1uWIHtt6CCqWt+4XQJ0zteKC+TzTJDJYDU8jRdFH25vzTCPkuaax/BCHSset557kw3ShfLiUWD9YquBSl0G1euIAzcuhMpZW+XGcReAm5V1F6W4+f/LgVcAzzZ6BBlGevA47jFXCEvOm/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sqi5d1zJ; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c74f0c3fc16so93557a12.2
        for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 18:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773968550; x=1774573350; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9TEaSuf94kHQJXGS0lvQBFgQm5bEBhLEKg3Cl5LrF8Q=;
        b=Sqi5d1zJJ4kBt8j/Cm1nXLzmxbK9RY5RZVonfqwfi5yNjugsxutYQ03/+/ksHvXnEP
         R1I6mFv4/nNmQ0ZOvbuvnQbZ7DGJkhVoOc/gMf7KTuvDuvXO1AQ5py+chmtGEfU66JGO
         HMo6eJcEwYJJdIdDbCMYQCA4yYen5t3CDaXPmZI0/9pJMzAlutwyeHqx/NtcmHHbLOGS
         wXyWHA//8M+Mimj5Ak7bT6TV6EJBKSq26omVeWKcLo2VN6+BN/7YAdtmP4iavvknIzuc
         oGxcoasbMY36jYpNFOVajp5McyRIxkROvEjNtj0HjLdREqP3gonLx5iau+8c99Bk+imk
         IM5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773968550; x=1774573350;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9TEaSuf94kHQJXGS0lvQBFgQm5bEBhLEKg3Cl5LrF8Q=;
        b=tQeb0Rg0yvyubZd/YQsSKamoT3vwSpHf8kJQAtejDl3ZevWVJB7rbkqaslqf+Azh4Q
         dJwvONdiLq/8hrHlNuEt3lWS7eHk++yd20hta8YMtS1Bs6Vnrsy3unm9zMWlsLbTKHC+
         y0svhjfc+TUNtXeVOEpB9WHhqyPlto3HaXCd6xzSoQkInicjwRQEp1C/91BXJifPrRNp
         jxku41DNW6lfES9RcbS6wGdoJJ354PBuc2ptzV7+2O1x2JNJcE4Aiv/dz+0WBGj1lQ++
         718T6+3pwISCUVUlyYNb0/vPxhlkzt1b59JdyFeKbntI/Bs1R1dLST1YYal7pQx271qD
         jAFQ==
X-Gm-Message-State: AOJu0Yz7XIvYv/d9Tfs72j0y0hivN0kNHmMyhqkWpA5VuvaR1aiQ9HWE
	dJDJmIDFmHJNvNBeWNgAG4Y9S+Nzuhua/qdUdf+hs7xz4b6rQVlljZvnM05bF9ec
X-Gm-Gg: ATEYQzxx9myRi5n0BGj5ZRDYFG6pkPfsFzUj/s54E/z5AFIdxNEe4blSqPwH/RjawHr
	bgihp0+MGKTX5pwk+83di7Cho9YuV2YsrjsC8veEVV0hXkbRwWXUJZLZSkgpV9oh2s/xUOvrJAd
	5mlbgaaOn8kbdoKegvUJAdd88uICCdzQAeKqeVXgxNCpQoaXQYNuB40QqQq/Q3ym8P6d416Sega
	OsRR/oakKcMRA7nNAnBll5LrzK8ygAf6yHr1yxQTlfj64I9Z/Jx8x2Ya97QbeRZ3efi5IGoaOVm
	2BBxaAPB6ZlzAKWCAfOhWjdl0PRGWqpDz6fauIQ1wU+gOMFekAFlyPZysNTOY70bTYYAC2ZoAX/
	GIWXc5/dnRYgvi0sWvjSq8/ccDIqPbFYQNjgPHfuMHmwbsSjTKvko3pqFArpohA57qATONdsXQI
	1vrOizNbh2v3FgAdGuKRM9d+WKDYfXnjxtUkdX3v1js/CYRsetUAQsRj4=
X-Received: by 2002:a05:6a00:180e:b0:824:9bc5:e946 with SMTP id d2e1a72fcca58-82a8c39d91bmr935550b3a.46.1773968550097;
        Thu, 19 Mar 2026 18:02:30 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8bd])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b03aa5aa7sm398884b3a.1.2026.03.19.18.02.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 18:02:29 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be)?\b)
Subject: [PATCH] media: em28xx: kzalloc + kcalloc to kzalloc_flex
Date: Thu, 19 Mar 2026 18:02:12 -0700
Message-ID: <20260320010212.31425-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-56437-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-0.966];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DEAC52D48BB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

There's no need to allocate these separately.

Add __counted_by for extra runtime analysis. Moved counting variable
allocation to right after allocation as required by __counted_by.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/media/usb/em28xx/em28xx-cards.c | 18 ++----------------
 drivers/media/usb/em28xx/em28xx.h       |  3 ++-
 2 files changed, 4 insertions(+), 17 deletions(-)

diff --git a/drivers/media/usb/em28xx/em28xx-cards.c b/drivers/media/usb/em28xx/em28xx-cards.c
index d7075ebabceb..c278e48b3428 100644
--- a/drivers/media/usb/em28xx/em28xx-cards.c
+++ b/drivers/media/usb/em28xx/em28xx-cards.c
@@ -3567,9 +3567,6 @@ void em28xx_free_device(struct kref *ref)
 	if (!dev->disconnected)
 		em28xx_release_resources(dev);
 
-	if (dev->ts == PRIMARY_TS)
-		kfree(dev->alt_max_pkt_size_isoc);
-
 	kfree(dev);
 }
 EXPORT_SYMBOL_GPL(em28xx_free_device);
@@ -3912,21 +3909,13 @@ static int em28xx_usb_probe(struct usb_interface *intf,
 	}
 
 	/* allocate memory for our device state and initialize it */
-	dev = kzalloc_obj(*dev);
+	dev = kzalloc_flex(*dev, alt_max_pkt_size_isoc, intf->num_altsetting);
 	if (!dev) {
 		retval = -ENOMEM;
 		goto err;
 	}
 
-	/* compute alternate max packet sizes */
-	dev->alt_max_pkt_size_isoc = kcalloc(intf->num_altsetting,
-					     sizeof(dev->alt_max_pkt_size_isoc[0]),
-					     GFP_KERNEL);
-	if (!dev->alt_max_pkt_size_isoc) {
-		kfree(dev);
-		retval = -ENOMEM;
-		goto err;
-	}
+	dev->num_alt = intf->num_altsetting;
 
 	/* Get endpoints */
 	for (i = 0; i < intf->num_altsetting; i++) {
@@ -4028,8 +4017,6 @@ static int em28xx_usb_probe(struct usb_interface *intf,
 			dev->dvb_ep_bulk ? " bulk" : "",
 			dev->dvb_ep_isoc ? " isoc" : "");
 
-	dev->num_alt = intf->num_altsetting;
-
 	if ((unsigned int)card[nr] < em28xx_bcount)
 		dev->model = card[nr];
 
@@ -4163,7 +4150,6 @@ static int em28xx_usb_probe(struct usb_interface *intf,
 	return 0;
 
 err_free:
-	kfree(dev->alt_max_pkt_size_isoc);
 	kfree(dev);
 
 err:
diff --git a/drivers/media/usb/em28xx/em28xx.h b/drivers/media/usb/em28xx/em28xx.h
index f3449c240d21..1c2f92927889 100644
--- a/drivers/media/usb/em28xx/em28xx.h
+++ b/drivers/media/usb/em28xx/em28xx.h
@@ -730,7 +730,6 @@ struct em28xx {
 	int packet_multiplier;	// multiplier for wMaxPacketSize, used for
 				// URB buffer size definition
 	int num_alt;		// number of alternative settings
-	unsigned int *alt_max_pkt_size_isoc; // array of isoc wMaxPacketSize
 	unsigned int analog_xfer_bulk:1;	// use bulk instead of isoc
 						// transfers for analog
 	int dvb_alt_isoc;	// alternate setting for DVB isoc transfers
@@ -772,6 +771,8 @@ struct em28xx {
 
 	struct em28xx	*dev_next;
 	int ts;
+
+	unsigned int alt_max_pkt_size_isoc[] __counted_by(num_alt); // array of isoc wMaxPacketSize
 };
 
 #define kref_to_dev(d) container_of(d, struct em28xx, ref)
-- 
2.53.0


