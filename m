Return-Path: <linux-media+bounces-45177-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 03BEDBF9D1E
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 05:21:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C1DE74FDB54
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 03:21:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3916F234963;
	Wed, 22 Oct 2025 03:20:58 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05BAF350A2C;
	Wed, 22 Oct 2025 03:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761103257; cv=none; b=i5KoanKniwGlkij+UTXGFOhkLPwzDI4tdT/1VID5TApf42wBXzKGfUPVcFV+1dduiDh/lq4y/+3IvtA9PE8L3PbwH3Pq7/CpKDJMw1aCfO7xO5NG2Fd4pnhYMuM5H39TJtjD0bqNoJXKBhO3I+iIPzB3Ykdk9wJk0ydpbSuzCIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761103257; c=relaxed/simple;
	bh=Tk0UIaeVuYgC/POR7bQY27nRueEJ2y5yEPOsU9ay4h0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=I+gmm7GtfFlMuY7Qek5dCmWgQ7A8h48XeVFnDlhuJBg/hAkuXKn2sAS6j1sCgG+5+d8jOh/NKyJrHgVfWregpBoVM2uSt/kAvpAK38CQbVGv5bolLiKHwp4pUPgk9OLsEQvFqqhUUr9TjiKdFk8d9zHnsDE3xQuahIpxCOMQ44w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 19eeac18aef611f0a38c85956e01ac42-20251022
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:3354f910-db01-46cd-a174-6d7f22f0092f,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:a9d874c,CLOUDID:315ea231fb08d5c6e5726eb5b89914c1,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 19eeac18aef611f0a38c85956e01ac42-20251022
X-User: tanze@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <tanze@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 2027235998; Wed, 22 Oct 2025 11:20:46 +0800
From: tanze <tanze@kylinos.cn>
To: mchehab@kernel.org,
	mingo@kernel.org,
	hverkuil@kernel.org,
	tskd08@gmail.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tanze <tanze@kylinos.cn>
Subject: [PATCH v2 1/3] media: dvb-core: Optimize the code using vmalloc_array
Date: Wed, 22 Oct 2025 11:20:36 +0800
Message-Id: <20251022032038.422230-2-tanze@kylinos.cn>
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
 drivers/media/dvb-core/dmxdev.c    | 4 ++--
 drivers/media/dvb-core/dvb_demux.c | 9 +++++----
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/media/dvb-core/dmxdev.c b/drivers/media/dvb-core/dmxdev.c
index 151177e5a06d..8c6f5aafda1d 100644
--- a/drivers/media/dvb-core/dmxdev.c
+++ b/drivers/media/dvb-core/dmxdev.c
@@ -1414,8 +1414,8 @@ int dvb_dmxdev_init(struct dmxdev *dmxdev, struct dvb_adapter *dvb_adapter)
 	if (dmxdev->demux->open(dmxdev->demux) < 0)
 		return -EUSERS;
 
-	dmxdev->filter = vmalloc(array_size(sizeof(struct dmxdev_filter),
-					    dmxdev->filternum));
+	dmxdev->filter = vmalloc_array(dmxdev->filternum,
+				       sizeof(struct dmxdev_filter));
 	if (!dmxdev->filter)
 		return -ENOMEM;
 
diff --git a/drivers/media/dvb-core/dvb_demux.c b/drivers/media/dvb-core/dvb_demux.c
index 7c4d86bfdd6c..9d5600501cf8 100644
--- a/drivers/media/dvb-core/dvb_demux.c
+++ b/drivers/media/dvb-core/dvb_demux.c
@@ -1238,14 +1238,15 @@ int dvb_dmx_init(struct dvb_demux *dvbdemux)
 
 	dvbdemux->cnt_storage = NULL;
 	dvbdemux->users = 0;
-	dvbdemux->filter = vmalloc(array_size(sizeof(struct dvb_demux_filter),
-					      dvbdemux->filternum));
+	dvbdemux->filter = vmalloc_array(dvbdemux->filternum,
+					 sizeof(struct dvb_demux_filter));
 
 	if (!dvbdemux->filter)
 		return -ENOMEM;
 
-	dvbdemux->feed = vmalloc(array_size(sizeof(struct dvb_demux_feed),
-					    dvbdemux->feednum));
+	dvbdemux->feed = vmalloc_array(dvbdemux->feednum,
+				       sizeof(struct dvb_demux_feed));
+
 	if (!dvbdemux->feed) {
 		vfree(dvbdemux->filter);
 		dvbdemux->filter = NULL;
-- 
2.25.1


