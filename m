Return-Path: <linux-media+bounces-5373-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 408538596CD
	for <lists+linux-media@lfdr.de>; Sun, 18 Feb 2024 13:00:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C86472819E1
	for <lists+linux-media@lfdr.de>; Sun, 18 Feb 2024 12:00:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B509363412;
	Sun, 18 Feb 2024 12:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="KLpdFM5j"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A1974F1F2
	for <linux-media@vger.kernel.org>; Sun, 18 Feb 2024 12:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708257612; cv=none; b=EaFaK3qmqjOQ5eMoNQtuG92SBBqCWen1r4J4u/cuxJZnUtfizOI9QQAMVJtP8RR58NxJCwFoplnmscfzfY3xEKe4qW0DLxI7JTbXPHVwLsqdm1rNxOgZBALLTet4xCEZlPG8SZotnvQnaTj6lPki23TIMmBZ7KRXINZowjpV1kY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708257612; c=relaxed/simple;
	bh=LX0nfUNzfzdG/Z2dVwSK9TixrhCUzU7OK9fxv9/S5io=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Zzx0S+3R9eTB4HcCsWildroeHXqkz7dCJR+m/jV3Rxq2WtAUx18LchCSbkVUAD0u/Q3W1jFdMXYyqxH4weXznyU1oPOGZ+OlZ4F0pNVIyUN5AzTROR4vOG1HNj3/BVsx8D+XjT/ru5flezvQ7kwjaekYShIU+PRNKVmYbBjohDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=KLpdFM5j; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 3d333582ce5511ee9e680517dc993faa-20240218
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=TzhRI4cypCmqunSRf1qOngM5HMg8RqcBPftI0z984+k=;
	b=KLpdFM5j/y1cbr8/sYiFZx3Xt+l1UD17FTPCEAUmkSI44URW1a5pxJ0ZqFrHx17mXy6EFQ733h8d42nf7AYCR0cLfvBcY2otAiN6FOLQ3eg8CsH9c8uw/FEJQMODsEZtM7Oj3B3q6E6g2DHvL9dbKX4aTn42jdK8nNCSt+PCzV0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:f9763aae-29ad-42bb-809c-a4be6d8bfaed,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6f543d0,CLOUDID:fd778480-4f93-4875-95e7-8c66ea833d57,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 3d333582ce5511ee9e680517dc993faa-20240218
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1952062091; Sun, 18 Feb 2024 19:59:58 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sun, 18 Feb 2024 19:59:57 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sun, 18 Feb 2024 19:59:56 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, Tiffany Lin
	<tiffany.lin@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, "Maoguang
 Meng" <maoguang.meng@mediatek.com>, Longfei Wang <longfei.wang@mediatek.com>
CC: Irui Wang <irui.wang@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-media@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH] media: mediatek: vcodec: Handle VP9 superframe bitstream with 8 sub-frames
Date: Sun, 18 Feb 2024 19:59:54 +0800
Message-ID: <20240218115954.4038-1-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--5.750200-8.000000
X-TMASE-MatchedRID: IJfQKf6xjE6Ue16iAyR+HGwjJ4TFeU1ujiWciALpTNN85Y+z3ulenvlY
	oV6p/cSxNZAOTDwYVno1wOHlbbYzTen2wHlv5vGungIgpj8eDcAZ1CdBJOsoY8RB0bsfrpPIHm9
	ggFVoCcDdytBPL+XPG4A3JHtlS20dOtydYzqtvffie0XCVPLtzLJc3JXqjnqNftwZ3X11IV0=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--5.750200-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP:
	F2090AF9C4AD7B26B2E5A28458883101736AB5C245AFA98C059F16668B64FC452000:8
X-MTK: N

The VP9 bitstream has 8 sub-frames into one superframe, the superframe
index validate failed when reach 8, modify the index checking so that the
last sub-frame can be decoded normally.

Signed-off-by: Irui Wang <irui.wang@mediatek.com>
---
 .../media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_if.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_if.c
index 55355fa70090..4a9ced7348ee 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_if.c
@@ -526,7 +526,7 @@ static void vp9_swap_frm_bufs(struct vdec_vp9_inst *inst)
 	/* if this super frame and it is not last sub-frame, get next fb for
 	 * sub-frame decode
 	 */
-	if (vsi->sf_frm_cnt > 0 && vsi->sf_frm_idx != vsi->sf_frm_cnt - 1)
+	if (vsi->sf_frm_cnt > 0 && vsi->sf_frm_idx != vsi->sf_frm_cnt)
 		vsi->sf_next_ref_fb_idx = vp9_get_sf_ref_fb(inst);
 }
 
@@ -735,7 +735,7 @@ static void get_free_fb(struct vdec_vp9_inst *inst, struct vdec_fb **out_fb)
 
 static int validate_vsi_array_indexes(struct vdec_vp9_inst *inst,
 		struct vdec_vp9_vsi *vsi) {
-	if (vsi->sf_frm_idx >= VP9_MAX_FRM_BUF_NUM - 1) {
+	if (vsi->sf_frm_idx >= VP9_MAX_FRM_BUF_NUM) {
 		mtk_vdec_err(inst->ctx, "Invalid vsi->sf_frm_idx=%u.", vsi->sf_frm_idx);
 		return -EIO;
 	}
-- 
2.18.0


