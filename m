Return-Path: <linux-media+bounces-64859-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MkryM44PL2qG7gQAu9opvQ
	(envelope-from <linux-media+bounces-64859-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 22:31:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 324836822DD
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 22:31:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=RZCYfwv7;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64859-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64859-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 663EE300FC55
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 20:30:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C828325726;
	Sun, 14 Jun 2026 20:30:02 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BBA03242BA
	for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 20:30:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781469001; cv=none; b=eN4NX03j/GOcwuIqcZ2wnZYiI7GGZ0M/IOvmykRycbjwm7V778VErx69mbP/HGjQ0zP/3TgM6KJluOyDN0zQXx3WGkAnJsgAOiN/cilKs19ujUJZC+M1AuSGtNIBtPC7Ey7PjYPDI2kwSkNmsl8PSERjT+l+RnKdF7WWKRVHssY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781469001; c=relaxed/simple;
	bh=aA2lvOsMnH2mO+/8YIqJPIcISuycGqquD9i2CRjJ1EM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M9mgZnGk9BsUJaorINsfxXIR5PTqcwpG+4TTYLzCIr2faeXf6XqOPB3vYkrJpfh/6D6EPF2EB5kFGZf4CaeY3dH76uKrclrsv/atqTz00TcPpuCrzhuasc1xBnBFsDlhQeIk8hqRj5D6SxxYk/Hl96mXqmNhjHut6t3ho1K46/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RZCYfwv7; arc=none smtp.client-ip=209.85.216.45
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-36bcf3d2565so1821181a91.3
        for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 13:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781469000; x=1782073800; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bMvh30Es9oLlJJyrOQEw57Oa/27GiPIiQMoWeMBWI2Q=;
        b=RZCYfwv70qbDsr2UWXyrIDnEaTXVRZB7avnqHov5eM9VJKh6Y2Qr9ZmgdpxUY8OToJ
         N/qXOhUji4M4pwSTFh1D82+FTCFjG5k2N00chFy91SuqA8qQPzkfJS7w+rgZrQdFHwFf
         pfzSLJXVNO4qTIp3uwyXdIgMfGwE15RMKaQInOZZVmNpWUZA8SFx64X1MetOPQYw8dc5
         rLhg4bNfsum4vHYYLETBJXV4dFW2PC6sGWVEeUgArJ7c4T8kLsUczF5EjDbCOkigI9/M
         8c4QTNEEvjJegGHgzhaJ3/mrB82cEq4mzk160mKIDNm1Qn0hPMBsuVul+7HE7o0IUG4C
         yu1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781469000; x=1782073800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bMvh30Es9oLlJJyrOQEw57Oa/27GiPIiQMoWeMBWI2Q=;
        b=G2nwFkmg0Uq7e7vkQhrWDkHWCD4UJRxj1XTeA8vn7Avk9UgQwGfMPr/Cf1Npbt+sKn
         bLIkcDziyPxDNOSPaQR1mQm733BJ9zSIyssHbmlnyUeJzGZ2xRsCyqLSkWjbxVHB2Y/+
         q52cNb/wvb1FsBhpl7ZMuaz/B9PAbVq/jRU20F9RPrCGDAYVBVpN+zY1iaqYWvfc4res
         gK6dNFLqK56WxcLe+dUrjzBiA9TCWFZtQgHp2YoBjvQNXaxl1OZliJdoNX42scxc3WWr
         +ffOSxoo+wYE1XFe67hFhFGOdicXIjqUzZBBvq/JkFUIqm1LEyAhCvCa2kpnXYZC3ZAL
         ZE2A==
X-Gm-Message-State: AOJu0YwfV4Vc+9Cy22Ho2kk8ocMCeum3xqgDdJMxymHFZxspSjJjha2i
	KF5g7k/2aZbc1Wkw3JkpEVYog2ITLFgFFnCy06u155/nYC3HkIcJJemXhO/VOW5V
X-Gm-Gg: Acq92OFFfM5tGY4qZmzT/pY9EkC2uph2YdGOwuzmK943PrnaCA7t8a7a4CkkdssB0Mq
	mEKyBFznsu64FtfcaWAjb14llz1hvqA/pRlnEC3ND/4lX/NC1bldlHX1738GPzLCB2HtVzxFQQ4
	tr18lYZGTZIMjbmnI/OzZSyIcerAzBhzadyCCKFqNO7xroX8lAK8D4+O4tXYuJWijUj7clJ+MJM
	X9B1Hfx+Qo3lllHQyp9+HqzxiuNfqJAZvo0oz77xho2hvJaAWuNiotCqRzqKRevcqwLK9bOI2Wk
	nejmxIBXDo04zAZUmC/QZ/s9gvgy/wzJyRRBIFS1PRPJK+wjatlu4tStr4C8DY6YfMDUzHPfG0t
	vygD8qnL8B90WBdIOHtdIupgrNjMa4jk5V4nRybLg7GPRXWjvVS8oy9M2tfd5dgNwpkAimB4l7R
	l57jb4BVvxS0kFakBz0ouBhO2sw3jpkBs/kZSFQ/urPs+Auh9bHigr
X-Received: by 2002:a17:90b:2f05:b0:368:6998:b4a9 with SMTP id 98e67ed59e1d1-37c2bc7c378mr7588388a91.11.1781469000018;
        Sun, 14 Jun 2026 13:30:00 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.37])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-379e8cc467csm5439828a91.2.2026.06.14.13.29.57
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 14 Jun 2026 13:29:59 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org
Cc: Biren Pandya <birenpandya@gmail.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v3 16/22] media: platform: hantro_drv: Add missing media_entity_cleanup()
Date: Mon, 15 Jun 2026 01:58:16 +0530
Message-ID: <20260614202835.11977-17-birenpandya@gmail.com>
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
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,collabora.com,pengutronix.de,kernel.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-64859-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 324836822DD

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


