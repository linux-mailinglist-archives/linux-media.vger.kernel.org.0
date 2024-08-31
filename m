Return-Path: <linux-media+bounces-17267-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E33A6966F8A
	for <lists+linux-media@lfdr.de>; Sat, 31 Aug 2024 07:54:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9A6B71F237D1
	for <lists+linux-media@lfdr.de>; Sat, 31 Aug 2024 05:54:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAE1115099B;
	Sat, 31 Aug 2024 05:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Y//BSKwY"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD503A1AC;
	Sat, 31 Aug 2024 05:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725083658; cv=none; b=iCCbjTtthmHfB2Ve0hJl2VzE+CEHpWSiSp68N/2YKxf6rR8xXcNhPdvhNNjZI81WG0cM2vVIK3PQO+oRqehmdec7Gk7vNZVK3gqk0uCmm9dn4KPp+9+lmZP4VJpCVos9Au0izsLwqjLl/7qxb79bgo3Gc70zt/WsuRuTddxY+FQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725083658; c=relaxed/simple;
	bh=46CWCYGgXcLQiP8Q6eri/gSsgZHk2pXwEM7RnSPHPV8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=I0EkT0mdZ6BMrVj0DA9VXsKFsr46YpvIK5dv+tOj71PWyo4E2KfDpFyCxkQZLs7+pI+1pXs52dOA6/Hf49Wkuoqr10mQSUv/G3EFQzK3InBmNJ3JvEJsUnRWgRzxQVQhWEvhBC/kYYaNVygB6NsNL0z7cOILXL86HjLyqcQkcLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=Y//BSKwY; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 70242086675d11ef8b96093e013ec31c-20240831
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=f8Rpa4fFBhx9DDbPlfi2ydRSRTedbWnSRs5nS3M9bNU=;
	b=Y//BSKwYxcrkxLUn+VqZh1J4qvu8JUUWGhAz0sn+WnfQxDfghJcb4KZ9FZ3by4JO5Sv/uXTWyPnSKbHKbP3dIyWItGxeHYmfcR5rL54z0fbxTDepaEISjnbXwYgRY/Z/4r/vZN2BIT2S3+al423o2jO0N4QI0KJGv0LAb8IPFuY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:62338217-638e-43c2-8aea-4b1800372d76,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:6dc6a47,CLOUDID:a40738bf-d7af-4351-93aa-42531abf0c7b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 70242086675d11ef8b96093e013ec31c-20240831
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <zhi.mao@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1267638708; Sat, 31 Aug 2024 13:54:08 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sat, 31 Aug 2024 13:54:08 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sat, 31 Aug 2024 13:54:07 +0800
From: Zhi Mao <zhi.mao@mediatek.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<shengnan.wang@mediatek.com>, <yaya.chang@mediatek.com>,
	<teddy.chen@mediatek.com>, <yunkec@chromium.org>, <10572168@qq.com>,
	<ot_xiaofeiw.wang@mediatek.com>, Zhi Mao <zhi.mao@mediatek.com>
Subject: [PATCH] media: i2c: improve suspend/resume switch performance for GT9769 VCM driver
Date: Sat, 31 Aug 2024 13:52:09 +0800
Message-ID: <20240831055328.22482-1-zhi.mao@mediatek.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

Chromebook camera AP can switch between video and photo mode,
the behavior corresponding to VCM is suspend and resume,
it will cause camera preview is not smooth during switching operation.
We use autosuspend function can fix this issue.

Signed-off-by: Zhi Mao <zhi.mao@mediatek.com>
---
 drivers/media/i2c/dw9768.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/dw9768.c b/drivers/media/i2c/dw9768.c
index 18ef2b35c9aa..7449d29df901 100644
--- a/drivers/media/i2c/dw9768.c
+++ b/drivers/media/i2c/dw9768.c
@@ -374,7 +374,7 @@ static int dw9768_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 
 static int dw9768_close(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 {
-	pm_runtime_put(sd->dev);
+	pm_runtime_put_sync_autosuspend(sd->dev);
 
 	return 0;
 }
@@ -490,6 +490,7 @@ static int dw9768_probe(struct i2c_client *client)
 		goto err_power_off;
 	}
 
+	pm_runtime_use_autosuspend(dev);
 	pm_runtime_idle(dev);
 
 	return 0;
-- 
2.46.0


