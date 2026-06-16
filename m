Return-Path: <linux-media+bounces-64959-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HSrfJ1DvMGrVYwUAu9opvQ
	(envelope-from <linux-media+bounces-64959-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 08:38:08 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id EEECB68C91D
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 08:38:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=m2Yz3XWR;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64959-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-64959-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 456F6300F77A
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 06:38:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E7A23EEAF9;
	Tue, 16 Jun 2026 06:38:03 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9CE3ECBED
	for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 06:38:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781591882; cv=none; b=uM+E9zBDKo/f7C3vQfnRmcgsgBe3s0Gpo+sEDsQriN/3Rz2tNhUwKw2S3JrDGZ25SbaZKxfvDBMzfXGuC36hAjWyy6cLWXTXMZKVM+q0OwcYA7lC/4UosurOHGMk9XyC/q/Mh6oJmCsZRciFY+m7rYFlK+gpNgjWLHZYLepf63s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781591882; c=relaxed/simple;
	bh=btIkIXXn864fEQMVWfkqCQPV3/nuHcEOithXtaAwfqw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W5ZIsqEBEBs1kMfK1cVOOP/3r5pUP2c2mZ3OYPxZMmbRxeuJu20+cez8tOS3QznTiwy2k9K2mwVEQGsev7izL4Nmc6mq8KQKH5dofNeq3gafW/+L8cYz0hEzaoD25N2Hzm/liZg86vQPN4vpCf1XVlhrvJX71yQp0/8z1WeOxPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m2Yz3XWR; arc=none smtp.client-ip=209.85.214.175
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2c132ac5ec2so41622945ad.1
        for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 23:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781591881; x=1782196681; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fWy2d5NXFNLsaFmC8EODzyXU08rXb/JNeRRY/4BT3to=;
        b=m2Yz3XWRsBnaDWlgTni2BRKjwvXLYakJw5kxrZUeVJ6EphawKLC6xfCKNOtb/6ngcI
         GZgX4UkzzHwvC5joGJso6TlEcpIyVW3NvQDzLDzo02d0pj6UN4NUaC5rkp2PEnw1IW3K
         K/KxZatJmhQwtcYUnaztwWe/YTytnaRfTQP1lG9njdh6Wt24gV1I1E5BeGv2ay2867yo
         RZgL6TxjhUeBFdMxPHEoSud7nij4oBuKu4kBULtHD2iu9coESVPR+aGEH17vtGLnYK2a
         pXYhuYE82loP0BnI8DoA2t8E++XQw6I5T+lvK8GsdRAUwsMnd4j/ju9P3ziyLr3dH5jc
         tw/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781591881; x=1782196681;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fWy2d5NXFNLsaFmC8EODzyXU08rXb/JNeRRY/4BT3to=;
        b=ncs2aSJFAMSvSHDZjCb9fDS0thNs0hlkLkS4249Y1geDtHIu9yIDHQpwPs5FcyFgz0
         8K8dMHsADmoOL9X9VOeU7TdACaHK36OlbYExVnOPgqGImmZxOFzxxEt+OszRDgKs98+G
         exWSQ02U6huKy6HnOzBr6Th8qZm819cxbScA8+ALstXbJ47rBWkv0VbMOhTcJJr4Cqbt
         /aHgjyZ8C+CZ8tqERnidtBLu5Qnj1GnxLlMsikYteck4jdgCcZ8gOoxH7v4KmFpa9NCm
         LhnWaWTRzedtUlu2fEKQT71oaVBmJfiLoOwl+Wxcj7xqlrtvDiDaoMlThvZ1dcAuUlJo
         Tj5g==
X-Gm-Message-State: AOJu0Yxm3rj6AUASyQ2X0ITuigmckBVXw829DRNRCUwUTVEP0EzORRss
	7zH6yb/OTZtmdaQ060+p5rr62CERt6oP1R3rYngnvdpfrMu0yTxE8y+b5in1wT3W
X-Gm-Gg: Acq92OHENc1ZO7WEG/GsEW8yhC/vH3i2SHMYnhjU8yrjub0vWHAxyx5WWe1++1kGSna
	fnDC6Yj5GloZxcnFDGm1E4cdVVguxI5tw/WVvn+SYIj4gQJvfAJvFzsH85DUOl2S28jMl3OjVqP
	9ObIhzC5hKgb8qZtCtQmrpGTmbWiSR7+bK7ECdWDJyk9m2E2UFDIfiZuUB14IoTrib7tabhIK0G
	NKBvu5ipf7AGulE+vVNmdHmylo1iXsqj8G34+HwSCjW91LLlV5E7syle3t7+CoQ1vfm7+SRrqNm
	2aaFxv4a86K0Y2Ka7hkBEHTBYKkEuOu/9syLkvcC/WJj7jj3zNVCaKHPKiMttMXrv+5mur5CpYy
	QtTmkztQB7uHVSrFlx/qAZzkm5Dld9sGEdfhppi/s55sFRWZXPHUa9Fq67DEg/EnX2iCJTVV7Hg
	Guwrwvz3YFdRNRCvRzJwOD/1k03S4mLeHA48O3AiRGBcGQI5mLj152
X-Received: by 2002:a17:903:f8e:b0:2c0:d8ee:7d66 with SMTP id d9443c01a7336-2c6642a221amr150179635ad.36.1781591880834;
        Mon, 15 Jun 2026 23:38:00 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.37])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4328a4c1fsm120743685ad.53.2026.06.15.23.37.57
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 15 Jun 2026 23:38:00 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	Biren Pandya <birenpandya@gmail.com>
Subject: [PATCH] media: v4l2-subdev: Fix Use-After-Free risk in fwnode pad matching
Date: Tue, 16 Jun 2026 12:07:54 +0530
Message-ID: <20260616063754.42163-1-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
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
	FREEMAIL_CC(0.00)[kernel.org,ideasonboard.com,linux.intel.com,vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64959-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:hverkuil+cisco@kernel.org,m:laurent.pinchart@ideasonboard.com,m:sakari.ailus@linux.intel.com,m:linux-kernel@vger.kernel.org,m:birenpandya@gmail.com,m:hverkuil@kernel.org,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EEECB68C91D

In v4l2_subdev_get_fwnode_pad_1_to_1(), fwnode_handle_put() is called immediately after fetching the endpoint's parent node. However, the pointer is subsequently passed into device_match_fwnode().

While device_match_fwnode() only performs a pointer comparison and does not dereference the pointer, passing a dangling pointer is a Use-After-Free violation. If the memory allocator immediately reuses the freed fwnode address for another node, the comparison will yield a false positive. Furthermore, static analysis and KASAN strictly flag passing dangling pointers to functions.

Fix this by replacing the manual fwnode_handle_put() with the __free(fwnode_handle) scoped guard, which guarantees the reference is safely held for the remainder of the function scope.

Fixes: 8fe784b9abb2 ("media: v4l2-subdev: add v4l2_subdev_get_fwnode_pad_1_to_1")

Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 831c69c958b8..24c95082ded5 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -8,6 +8,7 @@
  *	    Sakari Ailus <sakari.ailus@iki.fi>
  */
 
+#include <linux/cleanup.h>
 #include <linux/export.h>
 #include <linux/ioctl.h>
 #include <linux/leds.h>
@@ -1243,7 +1244,6 @@ const struct v4l2_file_operations v4l2_subdev_fops = {
 int v4l2_subdev_get_fwnode_pad_1_to_1(struct media_entity *entity,
 				      struct fwnode_endpoint *endpoint)
 {
-	struct fwnode_handle *fwnode;
 	struct v4l2_subdev *sd;
 
 	if (!is_media_entity_v4l2_subdev(entity))
@@ -1251,8 +1251,8 @@ int v4l2_subdev_get_fwnode_pad_1_to_1(struct media_entity *entity,
 
 	sd = media_entity_to_v4l2_subdev(entity);
 
-	fwnode = fwnode_graph_get_port_parent(endpoint->local_fwnode);
-	fwnode_handle_put(fwnode);
+	struct fwnode_handle *fwnode __free(fwnode_handle) =
+		fwnode_graph_get_port_parent(endpoint->local_fwnode);
 
 	if (device_match_fwnode(sd->dev, fwnode))
 		return endpoint->port;
-- 
2.50.1 (Apple Git-155)


