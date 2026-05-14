Return-Path: <linux-media+bounces-61627-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yEulCpMlBmqmfgIAu9opvQ
	(envelope-from <linux-media+bounces-61627-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 21:42:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DAC2546715
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 21:42:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0DD503037179
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 19:42:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 655F63AE198;
	Thu, 14 May 2026 19:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=worksmobile.com header.i=@worksmobile.com header.b="UHTw4OSX";
	dkim=pass (1024-bit key) header.d=korea.ac.kr header.i=@korea.ac.kr header.b="LCU8KKmq"
X-Original-To: linux-media@vger.kernel.org
Received: from cvsmtppost102.wmail.worksmobile.com (cvsmtppost102.wmail.worksmobile.com [125.209.209.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A68630648A
	for <linux-media@vger.kernel.org>; Thu, 14 May 2026 19:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=125.209.209.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778787721; cv=none; b=ZCVzvtruAPQsLFLORE1ATkISdEItdJafXSyzUQkd1+YqOQ3Xy1Byfc8BADWlqwU2FIw/JJrNsQ/ZjQRZylCNlJ4V7NguiIsyQpOSrttmv+M0qCbNackbZ9iJA2vKlK1J0snfhUSc3PaIFLhohYgRUwps/gKg0PbxkB1eTi561uY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778787721; c=relaxed/simple;
	bh=BrkiWYlXRuwCbsC4kJBtE8pYjnIvwC1tTPopuZzeBaU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Wn4IsbH5i9iX6xPWbsGyzgtLl8rpbHyThNEI4A6wm3BsQRJ8fTb0BCvEZwIwDEbYJZq5ESABpUbW1pFI2K8/A719dffHleN+AsRzc2PhincJ0Uhp3I1d830mkHDmvZ/BbOlRd5Of7BIzIz3nL4qFl8eF7h1lK3zMaU/SYv1+8aQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=korea.ac.kr; spf=pass smtp.mailfrom=korea.ac.kr; dkim=pass (2048-bit key) header.d=worksmobile.com header.i=@worksmobile.com header.b=UHTw4OSX; dkim=pass (1024-bit key) header.d=korea.ac.kr header.i=@korea.ac.kr header.b=LCU8KKmq; arc=none smtp.client-ip=125.209.209.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=korea.ac.kr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=worksmobile.com;
	s=s20171120; t=1778787110;
	bh=BrkiWYlXRuwCbsC4kJBtE8pYjnIvwC1tTPopuZzeBaU=;
	h=From:To:Subject:Date:Message-Id:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=UHTw4OSXVapxlj77y4OlnUMj4rXpn0G09GH/lGKK4o8bdVnTsHmSzbm40Ao/RpbpS
	 12GxKzXsdCTklN3UDrHjR+BhJdKc3s2HAre4P8usWqRQBr/Jd70RwJHLynBPHvsJzg
	 vIwRrjg1AcqwuqOAKTFyqIpjfOeJwK2ot77BT4qR5BoJ4SEylFb6tYjd7iYW5CCn1R
	 iQaQFQTkx5z9NxJrge4rs6pdkg7HFgNpPnfp8M+Fj0t9xO4aLDCjN0tV3qatTQlR15
	 Kgu0re7lr6XruD895cZtY7B//bw+ygS212yPVzuLhIuEmuH/1W188BYuKSLvCIsfvH
	 860oNKel8ocPA==
Received: from cvsendbo001.wmail ([10.113.20.163])
  by cvsmtppost102.wmail.worksmobile.com with ESMTP id ekn-x8X6RMaOG28bijZHbQ
  for <linux-media@vger.kernel.org>;
  Thu, 14 May 2026 19:31:50 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=korea.ac.kr;
	s=naverworks; t=1778787110;
	bh=BrkiWYlXRuwCbsC4kJBtE8pYjnIvwC1tTPopuZzeBaU=;
	h=From:To:Subject:Date:Message-Id:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=LCU8KKmqmoYTh6J+D5j4cAsDUs56Zf13FubjdDTHtYp4fRB4QbceUUltdwFjTmAjm
	 xQMibhLIV9T9KF+TfdfpbNxQkISEppCRK8zQhe3gBvj3ys3B3BRKxH+0FD4p358AVX
	 nfkmdCmcaXQbY31DqBpHbkGDC7Buhl5ROBZmlN7w=
X-Session-ID: kofb2z09QhisUCsQXLddww
X-Works-Send-Opt: penljAIYjHm/FqM9FqJYFxMqFNwYjAg=
X-Works-Smtp-Source: AZK9Fq2XFqJZ+HmmKxbd+6E=
Received: from s2lab05.. ([163.152.163.130])
  by jvnsmtp401.gwmail.worksmobile.com with ESMTP id kofb2z09QhisUCsQXLddww
  for <multiple recipients>
  (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
  Thu, 14 May 2026 19:31:50 -0000
From: Ingyu Jang <ingyujang25@korea.ac.kr>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-media@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: rp1-cfe: Use IS_ERR() check for media_entity_remote_source_pad_unique()
Date: Fri, 15 May 2026 04:31:48 +0900
Message-Id: <20260514193148.2357371-1-ingyujang25@korea.ac.kr>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 5DAC2546715
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[korea.ac.kr,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[worksmobile.com:s=s20171120,korea.ac.kr:s=naverworks];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61627-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ingyujang25@korea.ac.kr,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[worksmobile.com:+,korea.ac.kr:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[worksmobile.com:dkim,korea.ac.kr:email,korea.ac.kr:mid,korea.ac.kr:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

media_entity_remote_source_pad_unique() returns either a valid struct
media_pad pointer or an error pointer (ERR_PTR(-ENOTUNIQ) or
ERR_PTR(-ENOLINK)); it never returns NULL. The current NULL check
therefore never triggers, and the "pad not connected" error path is
unreachable.

Replace the NULL check with an IS_ERR() check so the validation
actually detects malformed media graphs.

Signed-off-by: Ingyu Jang <ingyujang25@korea.ac.kr>
---
 drivers/media/platform/raspberrypi/rp1-cfe/cfe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
index 8375ed3e97b9f..91e9fa0341e06 100644
--- a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
+++ b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
@@ -1779,7 +1779,7 @@ static int cfe_video_link_validate(struct media_link *link)
 		link->source->entity->name, link->source->index,
 		link->sink->entity->name, link->sink->index);
 
-	if (!media_entity_remote_source_pad_unique(link->sink->entity)) {
+	if (IS_ERR(media_entity_remote_source_pad_unique(link->sink->entity))) {
 		cfe_err(cfe, "video node %s pad not connected\n", vd->name);
 		return -ENOTCONN;
 	}
-- 
2.34.1


