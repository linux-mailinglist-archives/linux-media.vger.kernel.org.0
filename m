Return-Path: <linux-media+bounces-19482-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9F499B06D
	for <lists+linux-media@lfdr.de>; Sat, 12 Oct 2024 05:28:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6664F1C21D26
	for <lists+linux-media@lfdr.de>; Sat, 12 Oct 2024 03:28:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67BD486277;
	Sat, 12 Oct 2024 03:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="MN0sCtGM"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64FE61799F;
	Sat, 12 Oct 2024 03:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728703725; cv=none; b=LlkWKqbnF9J0RkkHzwK3G+Vlkv4Qu2Zr/Stg9NChEjLPJJvJUt9jI6Ey0w+qkTplrVUEOUB8z2Z6KdpFeDLqeWaI43Y6egR8P59R8kcBQYtSKiHQxoxiGYY7NOSm7Kv+mtGn8FhXELn+meI6s+ut5CBg3OTs6gz8kjnK6OAewdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728703725; c=relaxed/simple;
	bh=7ctOgIZmfG1KHaGSho2VVl7rmGf1OWyxSXjOCOivKk4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=r6AmH3uys7itZ0kLex5YW7mvhprKKDiVDmPec+M1zXe0ayznJotGFO/EbDw2FXodakBlVGKcNJpC49Jq1Lg4mdJazmOH4wruGSTjY8rzRs9Son7nd027f0J9VROv84dpft6Pzrph/GxHzCPH3eTZ7qPam8IgZeYwbdqFkQdW5ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=MN0sCtGM; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 0dd5d56a884a11ef8b96093e013ec31c-20241012
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=jEOM+uWSPEOPR7VEwN5kEOeIKQrT8FMXpA4LyF1Zbig=;
	b=MN0sCtGMSy0CvrFl9CUzyumePRyEXWE47BgfPLh41ezOBc33QFKF07qhy99mAIVzmuZ2abj51w2SkXD0FXfHFQ4XiWHDOARakkCLNuQNy/asyIBM3q6HfbVVj6OGRtUUcfO0rE3CjB28u8j/DS+pg0hoUHwRYOIqi7bz2MCgQmU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:1e27be3f-bd9a-44bb-a9c5-061b052b9c42,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:6dc6a47,CLOUDID:d7fd1e65-444a-4b47-a99a-591ade3b04b2,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 0dd5d56a884a11ef8b96093e013ec31c-20241012
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <zhi.mao@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 725462293; Sat, 12 Oct 2024 11:28:31 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sat, 12 Oct 2024 11:28:29 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sat, 12 Oct 2024 11:28:28 +0800
From: Zhi Mao <zhi.mao@mediatek.com>
To: <fshao@chromium.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, "Mauro
 Carvalho Chehab" <mchehab@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<shengnan.wang@mediatek.com>, <yaya.chang@mediatek.com>,
	<teddy.chen@mediatek.com>, <yunkec@chromium.org>, <10572168@qq.com>,
	<ot_xiaofeiw.wang@mediatek.com>, Zhi Mao <zhi.mao@mediatek.com>
Subject: [PATCH] media: i2c: dw9768: Use runtime PM autosuspend
Date: Sat, 12 Oct 2024 11:25:53 +0800
Message-ID: <20241012032805.23545-1-zhi.mao@mediatek.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--0.971100-8.000000
X-TMASE-MatchedRID: ys/FpHHmWmyiwkztVCsqbymjEOrcO6AyTJDl9FKHbrleiHO/WPO/+/4f
	ZVz77tXZ4vM1YF6AJbbGJQ3BiiLAggtuKBGekqUpnH7sbImOEBR7VdEbWjzSg1/RgROefpJJv/j
	eH367KZ9mU104S42Oids+iaVjws45LPkTHGoONYy7DBs4v5OL2nWfSzpWW4iP2JbScDz7h7fyNp
	7g4PXe0BXsxz6ujBxUq1f8XSkHBUmNJXmEMVvLtpRMZUCEHkRt
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--0.971100-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP:
	723C8014F5CA88C1ABFCEC0A728BE8073CCBC88D59AB5644A8EB391FFF02A60D2000:8
X-MTK: N

Use runtime PM autosuspend function to avoid rapid power state bouncing.

Signed-off-by: Zhi Mao <zhi.mao@mediatek.com>
---
 drivers/media/i2c/dw9768.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/dw9768.c b/drivers/media/i2c/dw9768.c
index 18ef2b35c9aa..9d39198a9ad4 100644
--- a/drivers/media/i2c/dw9768.c
+++ b/drivers/media/i2c/dw9768.c
@@ -374,7 +374,8 @@ static int dw9768_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 
 static int dw9768_close(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 {
-	pm_runtime_put(sd->dev);
+	pm_runtime_mark_last_busy(sd->dev);
+	pm_runtime_put_autosuspend(sd->dev);
 
 	return 0;
 }
@@ -490,6 +491,8 @@ static int dw9768_probe(struct i2c_client *client)
 		goto err_power_off;
 	}
 
+	pm_runtime_set_autosuspend_delay(dev, 1000);
+	pm_runtime_use_autosuspend(dev);
 	pm_runtime_idle(dev);
 
 	return 0;
-- 
2.46.0


