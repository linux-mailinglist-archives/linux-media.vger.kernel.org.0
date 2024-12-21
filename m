Return-Path: <linux-media+bounces-23966-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69AF39F9DD6
	for <lists+linux-media@lfdr.de>; Sat, 21 Dec 2024 02:50:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C379516A38F
	for <lists+linux-media@lfdr.de>; Sat, 21 Dec 2024 01:50:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17525126C17;
	Sat, 21 Dec 2024 01:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=eurecom.fr header.i=@eurecom.fr header.b="TT0pHK6d"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.eurecom.fr (smtp.eurecom.fr [193.55.113.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A203A954;
	Sat, 21 Dec 2024 01:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.55.113.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734745819; cv=none; b=MdjUspEjH3MlwGauJ2WXHtgkoXMmpX5iyAcKv83s9x62uEIC3NjvLgz9J5rlTlhWAxh/t2hHF64RCBlvSMcinANbgaXEakvMyS1Wsvx7xPCTH+3vice/hq4eSIJIXyTbpBgLd80PQoUjXkBMS6QNpD9Bnv3CNO3drpJd6xh/Vw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734745819; c=relaxed/simple;
	bh=5IDVU51SNeoZnp//lT/l6a8Epq+tFpoKLrJCIJRj0qs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZmyL5ug+gIHPjKUWeMpV3CJkhAAgqzXPCa+l5lzbJdlbv/XxU2aIRtgMGaFtoX1MhpDVDjxpGUC+3k6Edp81+GcqtwvemH3eI56nzuioqapWUbf3rzY3Cjd1KC/x7/99wmGGdfXLhBBnrbvSeZmEcBpdVlXqK66AevebwYt4QT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=eurecom.fr; spf=pass smtp.mailfrom=eurecom.fr; dkim=pass (1024-bit key) header.d=eurecom.fr header.i=@eurecom.fr header.b=TT0pHK6d; arc=none smtp.client-ip=193.55.113.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=eurecom.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eurecom.fr
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=eurecom.fr; i=@eurecom.fr; q=dns/txt; s=default;
  t=1734745816; x=1766281816;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5IDVU51SNeoZnp//lT/l6a8Epq+tFpoKLrJCIJRj0qs=;
  b=TT0pHK6dYAoFL7JWnjdygfQ3IHAmC6bjNmEiRxwOxglmf0Z2PTzXjg+8
   2Sosla/Lrbb5A/7gWh2vvCuQJlDgNnsautYpZILFOHSaH83Vvy0iPY6WL
   1ka60T8dMsPuStmy9/MpGCt5DKST1a8BU4YA86LIgrEkvbJBeAnD+DJ7U
   M=;
X-CSE-ConnectionGUID: X3FM82FaStKN4+lB45fueA==
X-CSE-MsgGUID: e60d8hgsQXa1yrmNLVtuYg==
X-IronPort-AV: E=Sophos;i="6.12,252,1728943200"; 
   d="scan'208";a="28282602"
Received: from waha.eurecom.fr (HELO smtps.eurecom.fr) ([10.3.2.236])
  by drago1i.eurecom.fr with ESMTP; 21 Dec 2024 02:50:14 +0100
Received: from localhost.localdomain (88-183-119-157.subs.proxad.net [88.183.119.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtps.eurecom.fr (Postfix) with ESMTPSA id 378C124C8;
	Sat, 21 Dec 2024 02:50:14 +0100 (CET)
From: Ariel Otilibili <ariel.otilibili-anieli@eurecom.fr>
To: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Ariel Otilibili <ariel.otilibili-anieli@eurecom.fr>
Subject: [PATCH v2 1/1] saa7164: Remove unused values
Date: Sat, 21 Dec 2024 02:46:50 +0100
Message-ID: <20241221014951.1003440-2-ariel.otilibili-anieli@eurecom.fr>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241221014951.1003440-1-ariel.otilibili-anieli@eurecom.fr>
References: <20241220192735.957042-1-ariel.otilibili-anieli@eurecom.fr>
 <20241221014951.1003440-1-ariel.otilibili-anieli@eurecom.fr>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Coverity-IDs: 1269155, 1269156
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


