Return-Path: <linux-media+bounces-45176-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2F6BF9D18
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 05:21:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DE6F24FBDCF
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 03:21:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B2D52417C6;
	Wed, 22 Oct 2025 03:20:58 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E81B4233707;
	Wed, 22 Oct 2025 03:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761103257; cv=none; b=aMB1aeD7L94GTgeyGGLQaSrwIgcQCMmaIZ2+iEsBBol7NhAncUFhmu4x1cSTiNxq8FcWqH1bd2eP+H7x48wQfSdvSlpGw3uYFqgAr+NFHMK7G4mEaNlkUT/A1YuXNLeZfbONHNIh3f3dLE4YF+OQc8R4vFRsTLSEKDd5l12XL9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761103257; c=relaxed/simple;
	bh=7MM8TdXw/dlfEzZoJVWDWbl/KtQYs/xHAkKTtJILTe0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YurB2BtZQfWe0tdLs96EVhpRJErxRsIGivOrxvt2PcAwN1U7m4U504LilCBFQ/uU1ZZSDzeNULrkyOm68RwCugHrngzccJbP6DsMHPqVVRpU5TPOr7zd7K48R7OoCiWqcjmUbb+Gta8FfE3fF292hTgNjw6vNipQtjJ7rlxR/L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 1b0b7040aef611f0a38c85956e01ac42-20251022
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:6a4af70e-f909-4562-a161-433921a45577,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:f27cc5a1c2155e78c2ea9cddbf3cd6c4,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 1b0b7040aef611f0a38c85956e01ac42-20251022
X-User: tanze@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <tanze@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 187806986; Wed, 22 Oct 2025 11:20:48 +0800
From: tanze <tanze@kylinos.cn>
To: mchehab@kernel.org,
	mingo@kernel.org,
	hverkuil@kernel.org,
	tskd08@gmail.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tanze <tanze@kylinos.cn>
Subject: [PATCH v2 3/3] media: pt1: Optimize the code using vmalloc_array
Date: Wed, 22 Oct 2025 11:20:38 +0800
Message-Id: <20251022032038.422230-4-tanze@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251022032038.422230-1-tanze@kylinos.cn>
References: <20251022032038.422230-1-tanze@kylinos.cn>
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
index 121a4a92ea10..1ced093583ac 100644
--- a/drivers/media/pci/pt1/pt1.c
+++ b/drivers/media/pci/pt1/pt1.c
@@ -639,7 +639,7 @@ static int pt1_init_tables(struct pt1 *pt1)
 	if (!pt1_nr_tables)
 		return 0;
 
-	tables = vmalloc(array_size(pt1_nr_tables, sizeof(struct pt1_table)));
+	tables = vmalloc_array(pt1_nr_tables, sizeof(struct pt1_table));
 	if (tables == NULL)
 		return -ENOMEM;
 
-- 
2.25.1


