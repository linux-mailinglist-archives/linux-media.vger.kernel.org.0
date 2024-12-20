Return-Path: <linux-media+bounces-23962-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 689E99F9A77
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 20:28:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A80CF1636B9
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 19:28:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1823022258B;
	Fri, 20 Dec 2024 19:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=eurecom.fr header.i=@eurecom.fr header.b="Vi3eGXd8"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.eurecom.fr (smtp.eurecom.fr [193.55.113.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A70221478;
	Fri, 20 Dec 2024 19:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.55.113.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734722888; cv=none; b=HzB57GWhybUUez0oXBTaSkaTAs4OTrzWWzJRCNGTMoxgnF1UxoVpPJPE/+i24qeKqKVMFcKsX8h26X2lgQrBBsv5BxilznSAH5Zje0uueQf4UgX++1QKnmFkbOGOYPt9ivmIQv0aAPJx4JjJZcZvCLN5RCC9ACwvK1Z8g0mcCYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734722888; c=relaxed/simple;
	bh=5mTFwZbXCMXmjJmUl3O3jzrg24sQPN24Os9PM8GBJ78=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mjv2a8ehkzRmlBgzk7kAAwEWylD2654uKbpD5e3vQS03F0WCwTdHM0scPMb/vy5s9+xJodE8K12GvELw3hGQI5Oegg1+P2d13uomYbq2p0f9oiikdEmAFlG80oeqs/rvVJcKP3hA26C/qImUkujnL1xxxR35TcwJZmbhbLPZdvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=eurecom.fr; spf=pass smtp.mailfrom=eurecom.fr; dkim=pass (1024-bit key) header.d=eurecom.fr header.i=@eurecom.fr header.b=Vi3eGXd8; arc=none smtp.client-ip=193.55.113.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=eurecom.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eurecom.fr
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=eurecom.fr; i=@eurecom.fr; q=dns/txt; s=default;
  t=1734722886; x=1766258886;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5mTFwZbXCMXmjJmUl3O3jzrg24sQPN24Os9PM8GBJ78=;
  b=Vi3eGXd8OgaFnZlMPLiah2xp6BYnpuoWdfn4HJKH/jgXP/ToXqZi8hMB
   Vjz/CTyhx3BVrk6LHmiMyR/41mN45KCRGOYQMqsvSe1gdnaOxawHCPWl8
   12RRZ1LBLgE69lJ8zwGLU96rc48YoURPGYlRLZgb5qM0MgrpNB8qLa6Mk
   c=;
X-CSE-ConnectionGUID: Bq3/8z98QNelQ06Fe9kOlQ==
X-CSE-MsgGUID: ueH7VkOkR8q0p2apm5Usdw==
X-IronPort-AV: E=Sophos;i="6.12,251,1728943200"; 
   d="scan'208";a="28281145"
Received: from waha.eurecom.fr (HELO smtps.eurecom.fr) ([10.3.2.236])
  by drago1i.eurecom.fr with ESMTP; 20 Dec 2024 20:28:05 +0100
Received: from localhost.localdomain (88-183-119-157.subs.proxad.net [88.183.119.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtps.eurecom.fr (Postfix) with ESMTPSA id 78E0A24B1;
	Fri, 20 Dec 2024 20:28:05 +0100 (CET)
From: Ariel Otilibili <ariel.otilibili-anieli@eurecom.fr>
To: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Ariel Otilibili <ariel.otilibili-anieli@eurecom.fr>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH 1/1] saa7164: Remove unused values
Date: Fri, 20 Dec 2024 20:26:31 +0100
Message-ID: <20241220192735.957042-2-ariel.otilibili-anieli@eurecom.fr>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241220192735.957042-1-ariel.otilibili-anieli@eurecom.fr>
References: <20241220192735.957042-1-ariel.otilibili-anieli@eurecom.fr>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Coverity-IDs: 1269155, 1269156
Fixes: 11bd27b2e7ab ("[media] saa7164: Add missing saa7164-vbi.c file")
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: Ariel Otilibili <ariel.otilibili-anieli@eurecom.fr>
---
 drivers/media/pci/saa7164/saa7164-vbi.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/pci/saa7164/saa7164-vbi.c b/drivers/media/pci/saa7164/saa7164-vbi.c
index a6738baab688..ac958a5fca78 100644
--- a/drivers/media/pci/saa7164/saa7164-vbi.c
+++ b/drivers/media/pci/saa7164/saa7164-vbi.c
@@ -77,9 +77,7 @@ static int saa7164_vbi_buffers_alloc(struct saa7164_port *port)
 	/* TODO: NTSC SPECIFIC */
 	/* Init and establish defaults */
 	params->samplesperline = 1440;
-	params->numberoflines = 12;
 	params->numberoflines = 18;
-	params->pitch = 1600;
 	params->pitch = 1440;
 	params->numpagetables = 2 +
 		((params->numberoflines * params->pitch) / PAGE_SIZE);
-- 
2.47.1


