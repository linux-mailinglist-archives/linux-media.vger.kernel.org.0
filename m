Return-Path: <linux-media+bounces-45174-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF1C7BF9D0C
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 05:21:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C4853BD894
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 03:21:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7523238C2A;
	Wed, 22 Oct 2025 03:20:56 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D912224B14;
	Wed, 22 Oct 2025 03:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761103256; cv=none; b=A7uiTeOKGG7TxsOa7LgpqzwhaGGt4VLG5Kj9QBOERH9dYELjsayeuKw8G23AJ31AF20tX0waG8O1TkIH4IEp7XdaxdjqalUS2ZeLOa/uivBJAig5DDSPnZwSOmJtfN3O4gzdGD+DMy+HOpcYpu9uTiSpfoHY3jCxeeV4Dz5eXbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761103256; c=relaxed/simple;
	bh=YdLKtH3nSvJ2FRH927bjvlIRqiQz4MVoODxObDVo4w0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WaNsljvWaFXoShV+9inRyXhFomLV4XdGQ8lMyRGF1R1iKNfBdviIHDPXsxps+Wgwlzd8iCoj1eTYix2JUUd/gLQzul0ydyl9+gTERphjaS/y/882+Bl4g0HCPi3wtjI0dB9D+t8BgFjYA0T6GJYsyoE40hFYEZxoWLvLs8QXcfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 1a7ffa9caef611f0a38c85956e01ac42-20251022
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:fe96fcbe-59de-4abb-b873-3b0bc69d2b4f,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:bb3d869b3d190755b33d93cdf8180cdf,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 1a7ffa9caef611f0a38c85956e01ac42-20251022
X-User: tanze@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <tanze@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 281365987; Wed, 22 Oct 2025 11:20:47 +0800
From: tanze <tanze@kylinos.cn>
To: mchehab@kernel.org,
	mingo@kernel.org,
	hverkuil@kernel.org,
	tskd08@gmail.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tanze <tanze@kylinos.cn>
Subject: [PATCH v2 2/3] media: vivid: Optimize the code using vmalloc_array
Date: Wed, 22 Oct 2025 11:20:37 +0800
Message-Id: <20251022032038.422230-3-tanze@kylinos.cn>
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
 drivers/media/test-drivers/vivid/vivid-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/test-drivers/vivid/vivid-core.c b/drivers/media/test-drivers/vivid/vivid-core.c
index 86506be36acb..ef71d76e7397 100644
--- a/drivers/media/test-drivers/vivid/vivid-core.c
+++ b/drivers/media/test-drivers/vivid/vivid-core.c
@@ -1864,7 +1864,7 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
 		goto free_dev;
 
 	/* load the edid */
-	dev->edid = vmalloc(array_size(256, 128));
+	dev->edid = vmalloc_array(256, 128);
 	if (!dev->edid)
 		goto free_dev;
 
-- 
2.25.1


