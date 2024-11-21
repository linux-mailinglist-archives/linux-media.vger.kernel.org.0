Return-Path: <linux-media+bounces-21712-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 709F49D46B5
	for <lists+linux-media@lfdr.de>; Thu, 21 Nov 2024 05:27:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 375EB2833A3
	for <lists+linux-media@lfdr.de>; Thu, 21 Nov 2024 04:27:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CD001CB313;
	Thu, 21 Nov 2024 04:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="GnKNIoeg"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C0B14A0AA;
	Thu, 21 Nov 2024 04:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732163174; cv=none; b=pZjeRY/QDlpee7dO0X/y8MXEi8y0VpTb8fUL4iqly2j4IjWWGbG6mmULHfCT72WinNXJ0lCFgi9KPunA2QgQQjr0WNecAaEzXANI/PidWmIuTUnmjeitrQbUPJVilx8g1e0fLAzjANbEcZOgGSVx0SYsxXwXp/LhX3sqW3RNCqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732163174; c=relaxed/simple;
	bh=ck7bzPzFs8bYVuikk6zNFtTHiCWnawmfYq80NWJ1ZGQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=p1yn2Y/xx95p+Y3Lk6HcSimzu9Z6mA/9h8Pg42jic7Gs7OQDPw1QpHqrcBVoWaKQiUsk85uCH9WeCVrEQ7z5I1Bo/CntFf9C4T9sBtxYEWgY+ce+in2PgqSqpVa2F/A/zBRqSvoN8I555mK58jaypPKZXcEftc9n7kLop1MBSCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=GnKNIoeg; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: b9de6e7ca7c011ef99858b75a2457dd9-20241121
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=lI/K4ucl8KGgsqsmNWx6aKov8gDN64MnPlyw9H+LSEw=;
	b=GnKNIoegG9Rm8XJjX947Oipzo+PQaYedEaiS6SRZDwdrT4mUONXRRsseiCJTyDhVV/xY2/b3tT9zs1V9w1JOaHE1sxYhyN+hjp3OFjfOJgo3vf0A9S50JQqTveJV/ro36T1QRFuIziGiFe/Iai/OWX38O25uV4u7CHcmwdp9Zt0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.44,REQID:09e9c10f-c67a-4d5c-a1f9-f198fd4660c2,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:464815b,CLOUDID:c435d6fe-58af-4a77-b036-41f515d81476,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0,EDM:-3,IP
	:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,
	LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: b9de6e7ca7c011ef99858b75a2457dd9-20241121
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 855146494; Thu, 21 Nov 2024 12:26:06 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 21 Nov 2024 12:26:05 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 21 Nov 2024 12:26:05 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>
CC: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Moudy
 Ho <moudy.ho@mediatek.com>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-media@vger.kernel.org>, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
	Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH 8/8] media: mediatek: mdp3: Add pa_base due to CMDQ API change
Date: Thu, 21 Nov 2024 12:26:02 +0800
Message-ID: <20241121042602.32730-9-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20241121042602.32730-1-jason-jh.lin@mediatek.com>
References: <20241121042602.32730-1-jason-jh.lin@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N

To support non-subsys ID hardware on new SoCs, the CMDQ API has been
changed to include the pa_base parameter. This change accommodates
the new interface requirements.

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
---
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c | 4 ++--
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.h | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
index ea2ea119dd2a..a0836d3b0cb8 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
@@ -326,7 +326,7 @@ static int mdp_path_config_subfrm(struct mdp_cmdq_cmd *cmd,
 	for (index = 0; index < ctrl->num_sets; index++) {
 		set = &ctrl->sets[index];
 		cmdq_pkt_write_mask(&cmd->pkt, set->subsys_id, set->reg,
-				    set->value, 0xFFFFFFFF);
+				    (u16)set->reg, set->value, 0xFFFFFFFF);
 	}
 	/* Config sub-frame information */
 	for (index = (num_comp - 1); index >= 0; index--) {
@@ -382,7 +382,7 @@ static int mdp_path_config_subfrm(struct mdp_cmdq_cmd *cmd,
 	for (index = 0; index < ctrl->num_sets; index++) {
 		set = &ctrl->sets[index];
 		cmdq_pkt_write_mask(&cmd->pkt, set->subsys_id, set->reg,
-				    0, 0xFFFFFFFF);
+				    (u16)set->reg, 0, 0xFFFFFFFF);
 	}
 
 	return 0;
diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.h b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.h
index 3e5d2da1c807..ef36318e4742 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.h
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.h
@@ -10,7 +10,7 @@
 #include "mtk-mdp3-cmdq.h"
 
 #define MM_REG_WRITE_MASK(cmd, id, base, ofst, val, mask, ...)	\
-	cmdq_pkt_write_mask(&((cmd)->pkt), id,			\
+	cmdq_pkt_write_mask(&((cmd)->pkt), id, base,		\
 		(base) + (ofst), (val), (mask), ##__VA_ARGS__)
 
 #define MM_REG_WRITE(cmd, id, base, ofst, val, mask, ...)	\
@@ -52,7 +52,7 @@ do {								\
 #define MM_REG_POLL_MASK(cmd, id, base, ofst, val, _mask, ...)	\
 do {								\
 	typeof(_mask) (_m) = (_mask);				\
-	cmdq_pkt_poll_mask(&((cmd)->pkt), id,			\
+	cmdq_pkt_poll_mask(&((cmd)->pkt), id, base,		\
 		(base) + (ofst), (val), (_m), ##__VA_ARGS__);	\
 } while (0)
 
-- 
2.43.0


