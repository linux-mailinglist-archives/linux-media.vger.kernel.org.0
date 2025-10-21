Return-Path: <linux-media+bounces-45133-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ABFD6BF716B
	for <lists+linux-media@lfdr.de>; Tue, 21 Oct 2025 16:32:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 63EB718A3544
	for <lists+linux-media@lfdr.de>; Tue, 21 Oct 2025 14:32:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D0752F2600;
	Tue, 21 Oct 2025 14:31:52 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D47EE33B964;
	Tue, 21 Oct 2025 14:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761057112; cv=none; b=d7AXrDp6vF1hrX7Wro3hMr2kt5jK6S0n2L35muFJXim68uiV/Z57oLsFAbS6biPSCPux8dRzA4fec+LLpzsnOC+AHD/oaQl0AP9asyEx4pQtFLJEqaVlzIpCyj8NOwxLcjYc1EaHwkpv4MdGzjcg3WQLIR9Zovn7Yorec1aTk4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761057112; c=relaxed/simple;
	bh=CUCX075AbhBvE1nIpdOiANlWY53e4C8r9FbOkbIkqzE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=B7NegN1orcesufbVEEiy6QpkWqEraf+W6IHv0OvSaG7wfgnzkqbEPYvOhJLWcaSeQRTPx0C7ZonF6NiilJOhNIrMShlAc9KApG2+W8WVaXyfzDl6qU50DHkry5x8xeIMU9d5mk8OV5Fsu8cH4STp3oTRkGa0r33zHRyfi+Wau04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: aa49a28eae8a11f0a38c85956e01ac42-20251021
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:53704863-c410-40f7-bddf-4c3525d708a0,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:26aec133cf1a768ef2d73ca3c494b95f,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: aa49a28eae8a11f0a38c85956e01ac42-20251021
X-User: tanze@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <tanze@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1025440286; Tue, 21 Oct 2025 22:31:43 +0800
From: tanze <tanze@kylinos.cn>
To: mchehab@kernel.org,
	mingo@kernel.org,
	hverkuil@kernel.org,
	tskd08@gmail.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tanze <tanze@kylinos.cn>
Subject: [PATCH 3/3] media: pt1: Optimize the code using vmalloc_array
Date: Tue, 21 Oct 2025 22:31:22 +0800
Message-Id: <20251021143122.268730-4-tanze@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251021143122.268730-1-tanze@kylinos.cn>
References: <20251021143122.268730-1-tanze@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change array_size() to vmalloc_array(), Due to vmalloc_array() is optimized better,
uses fewer instructions, and handles overflow more concisely

Signed-off-by: tanze <tanze@kylinos.cn>
---
 drivers/media/pci/pt1/pt1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/pt1/pt1.c b/drivers/media/pci/pt1/pt1.c
index 121a4a92ea10..963fa5e13d33 100644
--- a/drivers/media/pci/pt1/pt1.c
+++ b/drivers/media/pci/pt1/pt1.c
@@ -639,7 +639,7 @@ static int pt1_init_tables(struct pt1 *pt1)
 	if (!pt1_nr_tables)
 		return 0;
 
-	tables = vmalloc(array_size(pt1_nr_tables, sizeof(struct pt1_table)));
+	tables = vmalloc_array(sizeof(struct pt1_table), pt1_nr_tables);
 	if (tables == NULL)
 		return -ENOMEM;
 
-- 
2.25.1


