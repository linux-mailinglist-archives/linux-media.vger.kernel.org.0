Return-Path: <linux-media+bounces-1523-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2724E802D62
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 09:41:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D74FA280DC5
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 08:41:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B22AFE542;
	Mon,  4 Dec 2023 08:41:14 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED7F985;
	Mon,  4 Dec 2023 00:41:04 -0800 (PST)
X-UUID: 94c43d4646274f73b49aa72bda893c9e-20231204
X-CID-UNFAMILIAR: 1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:dcb7f021-d129-4af6-8d07-a3f5b0d30702,IP:5,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:8,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:13
X-CID-INFO: VERSION:1.1.33,REQID:dcb7f021-d129-4af6-8d07-a3f5b0d30702,IP:5,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:8,FILE:0,BULK:0,RULE:Release_HamU,ACTION:r
	elease,TS:13
X-CID-META: VersionHash:364b77b,CLOUDID:6b04ca60-c89d-4129-91cb-8ebfae4653fc,B
	ulkID:231204164052U6WTZBVA,BulkQuantity:0,Recheck:0,SF:66|38|24|16|19|44|1
	02,TC:nil,Content:0,EDM:-3,IP:-2,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,CO
	L:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_USA,TF_CID_SPAM_FSD,TF_CID_SPAM_FSI
X-UUID: 94c43d4646274f73b49aa72bda893c9e-20231204
X-User: zengchi@kylinos.cn
Received: from localhost.localdomain [(116.128.244.169)] by mailgw
	(envelope-from <zengchi@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 1513602924; Mon, 04 Dec 2023 16:40:50 +0800
From: Zeng Chi <zengchi@kylinos.cn>
To: nas.chung@chipsnmedia.com,
	jackson.lee@chipsnmedia.com,
	mchehab@kernel.org,
	sebastian.fricke@collabora.com,
	nicolas.dufresne@collabora.com,
	hverkuil-cisco@xs4all.nl,
	bob.beckett@collabora.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zengchi@kylinos.cn
Subject: [PATCH] Fix memory leaks in wave5_vpu_open_enc() and wave5_vpu_open_dec()
Date: Mon,  4 Dec 2023 16:39:57 +0800
Message-Id: <20231204083957.2835095-1-zengchi@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes memory leaks on error escapes in wave5_vpu_open_enc()
and wave5_vpu_open_dec().

Fixes: 9707a6254a8a ("media: chips-media: wave5: Add the v4l2 layer")
Signed-off-by: Zeng Chi <zengchi@kylinos.cn>
---
 drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c | 4 +++-
 drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
index 8b1417ece96e..2d3e8a184f93 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
@@ -1792,8 +1792,10 @@ static int wave5_vpu_open_dec(struct file *filp)
 	int ret = 0;
 
 	inst = kzalloc(sizeof(*inst), GFP_KERNEL);
-	if (!inst)
+	if (!inst) {
+		kfree(inst);
 		return -ENOMEM;
+	}
 
 	inst->dev = dev;
 	inst->type = VPU_INST_TYPE_DEC;
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
index f29cfa3af94a..cbf6cb6e07aa 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
@@ -1537,8 +1537,10 @@ static int wave5_vpu_open_enc(struct file *filp)
 	int ret = 0;
 
 	inst = kzalloc(sizeof(*inst), GFP_KERNEL);
-	if (!inst)
+	if (!inst) {
+		kfree(inst);
 		return -ENOMEM;
+	}
 	v4l2_ctrl_hdl = &inst->v4l2_ctrl_hdl;
 
 	inst->dev = dev;
-- 
2.25.1


