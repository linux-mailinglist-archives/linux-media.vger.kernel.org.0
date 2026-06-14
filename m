Return-Path: <linux-media+bounces-64832-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LTG4N6XyLmql6QQAu9opvQ
	(envelope-from <linux-media+bounces-64832-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 20:27:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BEB681E11
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 20:27:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=HGZZ2NmR;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64832-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64832-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CF1933002B06
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 18:27:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26F9438F653;
	Sun, 14 Jun 2026 18:27:45 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E6F1B78F3
	for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 18:27:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781461664; cv=none; b=M3ckd8J2ceEhIiYxcLLpH1c8RZCYZSM34SqlrLpgYBdwSvSIUHJXxcNakK62TuFoXDUAnfgTMb33honZDp8zv/i2LJYmMTT694D86awOZ1G4QiHTgiMXMTDRO1IEI+zQDS/WN0+K0Lcj1sxfSHLBLUHS7VERYHCFseT2tkT3O+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781461664; c=relaxed/simple;
	bh=oOZX8tJWHQGL5f9MEbDgGUnsBGPeONiV4D2M7WIJ+as=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DucmPXY8ZJ96+z7HC0QQfbZRoRYvyY2RQSNPViuyJYuJ/94BA8qUh1sD1QmsTE2cbKBzW0MMw5FWJYCQd2v4qas6cOgyUtD5gmfN+yZm4LH7b7RLa/PS90bnWQkUwv+ynycBgsDS0+PGl/UxPyMzNkrpxHBifnzcN9eFtZvuyII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HGZZ2NmR; arc=none smtp.client-ip=209.85.214.172
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2c31212104cso10286195ad.2
        for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 11:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781461663; x=1782066463; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bxQNWBrgQJourTRbFCv9kGlMtIh+KL/+BYgFJE4hq+U=;
        b=HGZZ2NmR0VTiyZIOVdalio0rsjPHWpbYlbz5hxXvNtj33vZMcN7ZzwrBRdD9dwmNBj
         +ExokfhCcdiyDYJ+sTHKNyn07RwDXuGMB6HeQfWL++RR+Bfw1RPY+ebu9gz5OKuqd89D
         sAKH2fwtjgZOez5deNxqRxejVp0h2NSScx144kzRMy6AiHsVLKeRL7LXr23cB6ZWh5lQ
         GKb/UAo3D80Hd0TXm3ZfBLtJd/mPmSlgj7AozAriiUGrID5GrSB3Z8leDzLFrsfB7818
         n32pDljReNFavrNRorlk/g/l+qYl3QQpEDnXLp9FLqzsWhgo3AJ5hOTLuVz0wXqAWqnB
         zcHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781461663; x=1782066463;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bxQNWBrgQJourTRbFCv9kGlMtIh+KL/+BYgFJE4hq+U=;
        b=fxsbUZECbpfp5LRgp/08P9u63XONsIgd0j2KppwxzfUG969t3xq/muM9lFqNJ3gyvq
         aTY2JRFdWxPBImuynDvmclMao+AgoOd+qDzsIMpoopVGfcYqf0g4sMUACJQc7T5j2W+k
         xH5OyPGOC50HCMFvjYEnTkVgHV5Funf63GJf6VAycqTzs/DbqxRO6kvl37DO3iuP0gPa
         axk5uIMzMlbvIbSx4I7SmZQdn57gCdmKBRx9rHc/kHT6sjEVuyDfeZ2cMaKOVE+wqr0T
         tN50nb8IjWTOp4HUrn0bJLdTIqP7cj4v3yba16FQK/bBnGk4zWYFDfKTOGu7IqOditwV
         xybw==
X-Gm-Message-State: AOJu0YxldE41p7vRl/5elo++7bxUSmOequHuh7NmPe7nBy16Hshg3C4R
	bRq4lADGbVBrNxCw2pprJG67NNs50KpgHp3djhKJb8uAcSqQ7J97X6kCxiX/hKTI
X-Gm-Gg: Acq92OFAYmxVAXXzKCNsg8KUyMObFDSmKTX52rB4ug2wuj8i/gLIIVuVDpWtpirWULt
	Rdi/GPe93+7ALyqmUzYjGyJeuAdaBxlzZ8PCoAcV3YwhSqNo5yFwHcLulpGuq0Miw2NbesGdeiJ
	NyiWj6t5X/g8z6bDa36xdfzjAYA9Oow+kljH1MFkGww5xovZG8ghSr8dyAog+z3b924Y5822B0I
	fyA3DbNrKhd/5K/Hxf6Q0QvFLfnxD4YhqnkAhzGm9Sev5ZTCF5HM27lad2ACBtAVOehNKqm61HK
	GxI4FXSk85Xd0R+BB9tcAL0WFPo8xajdcVj4o7w2SlR34hnTz48a2QY6GLRysdMWLO4jTP0TXCO
	gpstBI+WaWQhvsQC8stjN8RL/c9djzRxS2mTx3XYXRarilPcGvYl8W747lOk5cEzJM5YBwP/QYk
	xrwXYzZS4BG2uPDEvImiC5PZ0H8iGECfEnUD62nWy+wf3kVlUyyzWa
X-Received: by 2002:a17:902:f789:b0:2c0:ccdb:e023 with SMTP id d9443c01a7336-2c664272087mr85247125ad.17.1781461662962;
        Sun, 14 Jun 2026 11:27:42 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.37])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f2e5369sm79161335ad.9.2026.06.14.11.27.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 14 Jun 2026 11:27:42 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org
Cc: Biren Pandya <birenpandya@gmail.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Hans Verkuil <hverkuil@kernel.org>
Subject: [PATCH v2 06/22] media: platform: stm32-csi: Add missing media_entity_cleanup()
Date: Sun, 14 Jun 2026 23:57:03 +0530
Message-ID: <20260614182714.7999-1-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,foss.st.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-64832-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:birenpandya@gmail.com,m:alain.volmat@foss.st.com,m:mchehab@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:hverkuil@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 74BEB681E11

Fixes: dcb0f4c16be5 ("media: stm32: csi: addition of the STM32 CSI driver")
The media_entity_pads_init() (or media_entity_init()) function initializes
the media entity, but the driver forgets to call media_entity_cleanup()
in the error paths and remove function. Add the missing calls to fix the
API violation and prevent potential future memory leaks.

Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/platform/st/stm32/stm32-csi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/st/stm32/stm32-csi.c b/drivers/media/platform/st/stm32/stm32-csi.c
index fd2b6dfbd44c..0847fd347d56 100644
--- a/drivers/media/platform/st/stm32/stm32-csi.c
+++ b/drivers/media/platform/st/stm32/stm32-csi.c
@@ -1060,6 +1060,7 @@ static int stm32_csi_probe(struct platform_device *pdev)
 
 err_cleanup:
 	v4l2_async_nf_cleanup(&csidev->notifier);
+	media_entity_cleanup(&csidev->sd.entity);
 	return ret;
 }
 
@@ -1068,6 +1069,7 @@ static void stm32_csi_remove(struct platform_device *pdev)
 	struct stm32_csi_dev *csidev = platform_get_drvdata(pdev);
 
 	v4l2_async_unregister_subdev(&csidev->sd);
+	media_entity_cleanup(&csidev->sd.entity);
 
 	pm_runtime_disable(&pdev->dev);
 }
-- 
2.50.1 (Apple Git-155)


