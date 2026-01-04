Return-Path: <linux-media+bounces-49864-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F3BAACF0AE0
	for <lists+linux-media@lfdr.de>; Sun, 04 Jan 2026 07:45:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 18219300AC6F
	for <lists+linux-media@lfdr.de>; Sun,  4 Jan 2026 06:45:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2757D262FC0;
	Sun,  4 Jan 2026 06:45:43 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20C619A2A3;
	Sun,  4 Jan 2026 06:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767509142; cv=none; b=SAo+ZNGed836MIvbOdOrDaDa+seM6OfP//It0NdaK2eRL50fFHUHO3dk5kioc0qC/Yev+uw/y2vyOPnX2IkZm38l0WF79HhKah5VYqthH9/6q2t45pMLhShIOpsxWNR8X6FQ0w7cJSkoc3xZjNoSxmNki/k5OPn749SEz8k4v2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767509142; c=relaxed/simple;
	bh=pS0o/Vb9czcEyfRh9pak6KHtqlkn7FHMMqpS/ZNMn90=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dX2KayvVmjEKFW5wx3yurIurboFhEuZ987J0ch5CQwxMWekV0oLz72BbLgVTuHSmiI108G79BLXa2+JtPtCmcCUs2TxlDpbK2fEUjJA2eawUuc6/+3c2aoHUjZA8qUZRQJRUMNHigxx5V/Ei1Ju1S86uX263LMjjj/8Jr+GG1+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: f2594b36e93811f0a38c85956e01ac42-20260104
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:5184e65c-b13f-4299-8130-231ea9e52270,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:5d86e8ddbe03e2d7aabc6ced315f68e3,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|898,TC:nil,Content:0|15|50,EDM:-
	3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,A
	V:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f2594b36e93811f0a38c85956e01ac42-20260104
X-User: chenchangcheng@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <chenchangcheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 560756885; Sun, 04 Jan 2026 14:45:24 +0800
From: Chen Changcheng <chenchangcheng@kylinos.cn>
To: laurent.pinchart@ideasonboard.com,
	hansg@kernel.org,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Changcheng <chenchangcheng@kylinos.cn>
Subject: [PATCH] media: uvcvideo: Use scope-based cleanup helper
Date: Sun,  4 Jan 2026 14:45:20 +0800
Message-Id: <20260104064520.115462-1-chenchangcheng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the manual kfree() with __free(kfree) annotation for data
references. This aligns the code with the latest kernel style.

No functional change intended.

Signed-off-by: Chen Changcheng <chenchangcheng@kylinos.cn>
---
 drivers/media/usb/uvc/uvc_video.c | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index 2094e059d7d3..1ee06d597431 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -291,7 +291,7 @@ static int uvc_get_video_ctrl(struct uvc_streaming *stream,
 	struct uvc_streaming_control *ctrl, int probe, u8 query)
 {
 	u16 size = uvc_video_ctrl_size(stream);
-	u8 *data;
+	u8 *data __free(kfree) = NULL;
 	int ret;
 
 	if ((stream->dev->quirks & UVC_QUIRK_PROBE_DEF) &&
@@ -317,8 +317,7 @@ static int uvc_get_video_ctrl(struct uvc_streaming *stream,
 			"supported. Enabling workaround.\n");
 		memset(ctrl, 0, sizeof(*ctrl));
 		ctrl->wCompQuality = le16_to_cpup((__le16 *)data);
-		ret = 0;
-		goto out;
+		return 0
 	} else if (query == UVC_GET_DEF && probe == 1 && ret != size) {
 		/*
 		 * Many cameras don't support the GET_DEF request on their
@@ -328,15 +327,13 @@ static int uvc_get_video_ctrl(struct uvc_streaming *stream,
 		uvc_warn_once(stream->dev, UVC_WARN_PROBE_DEF, "UVC non "
 			"compliance - GET_DEF(PROBE) not supported. "
 			"Enabling workaround.\n");
-		ret = -EIO;
-		goto out;
+		return -EIO;
 	} else if (ret != size) {
 		dev_err(&stream->intf->dev,
 			"Failed to query (%s) UVC %s control : %d (exp. %u).\n",
 			uvc_query_name(query), probe ? "probe" : "commit",
 			ret, size);
-		ret = (ret == -EPROTO) ? -EPROTO : -EIO;
-		goto out;
+		return (ret == -EPROTO) ? -EPROTO : -EIO;
 	}
 
 	ctrl->bmHint = le16_to_cpup((__le16 *)&data[0]);
@@ -371,18 +368,15 @@ static int uvc_get_video_ctrl(struct uvc_streaming *stream,
 	 * format and frame descriptors.
 	 */
 	uvc_fixup_video_ctrl(stream, ctrl);
-	ret = 0;
 
-out:
-	kfree(data);
-	return ret;
+	return 0;
 }
 
 static int uvc_set_video_ctrl(struct uvc_streaming *stream,
 	struct uvc_streaming_control *ctrl, int probe)
 {
 	u16 size = uvc_video_ctrl_size(stream);
-	u8 *data;
+	u8 *data __free(kfree) = NULL;
 	int ret;
 
 	data = kzalloc(size, GFP_KERNEL);
@@ -419,7 +413,6 @@ static int uvc_set_video_ctrl(struct uvc_streaming *stream,
 		ret = -EIO;
 	}
 
-	kfree(data);
 	return ret;
 }
 

base-commit: 805f9a061372164d43ddef771d7cd63e3ba6d845
-- 
2.25.1


