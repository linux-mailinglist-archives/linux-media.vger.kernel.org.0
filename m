Return-Path: <linux-media+bounces-1530-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 971FA802E59
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 10:17:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C6BB71C209E1
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 09:17:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A80CA14F92;
	Mon,  4 Dec 2023 09:17:25 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D3B010E;
	Mon,  4 Dec 2023 01:17:12 -0800 (PST)
X-UUID: b2dd1cfb302648d6995e901358889f68-20231204
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:f37ac697-bef6-4a90-bbfa-bc0369ecf577,IP:15,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:10
X-CID-INFO: VERSION:1.1.33,REQID:f37ac697-bef6-4a90-bbfa-bc0369ecf577,IP:15,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:10
X-CID-META: VersionHash:364b77b,CLOUDID:6c2143fd-4a48-46e2-b946-12f04f20af8c,B
	ulkID:231204164052U6WTZBVA,BulkQuantity:4,Recheck:0,SF:66|38|24|72|19|44|1
	02,TC:nil,Content:0,EDM:-3,IP:-2,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL
	:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FSD,TF_CID_SPAM_FSI
X-UUID: b2dd1cfb302648d6995e901358889f68-20231204
X-User: zengchi@kylinos.cn
Received: from localhost.localdomain [(116.128.244.169)] by mailgw
	(envelope-from <zengchi@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 895367361; Mon, 04 Dec 2023 17:16:58 +0800
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
Date: Mon,  4 Dec 2023 17:16:49 +0800
Message-Id: <20231204091649.3418987-1-zengchi@kylinos.cn>
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
 drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c | 5 +++--
 drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c | 5 +++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
index 8b1417ece96e..b0a045346bb7 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
@@ -1802,9 +1802,10 @@ static int wave5_vpu_open_dec(struct file *filp)
 	spin_lock_init(&inst->state_spinlock);
 
 	inst->codec_info = kzalloc(sizeof(*inst->codec_info), GFP_KERNEL);
-	if (!inst->codec_info)
+	if (!inst->codec_info) {
+		kfree(inst);
 		return -ENOMEM;
-
+	}
 	v4l2_fh_init(&inst->v4l2_fh, vdev);
 	filp->private_data = &inst->v4l2_fh;
 	v4l2_fh_add(&inst->v4l2_fh);
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
index f29cfa3af94a..bc94de9ea546 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
@@ -1546,9 +1546,10 @@ static int wave5_vpu_open_enc(struct file *filp)
 	inst->ops = &wave5_vpu_enc_inst_ops;
 
 	inst->codec_info = kzalloc(sizeof(*inst->codec_info), GFP_KERNEL);
-	if (!inst->codec_info)
+	if (!inst->codec_info) {
+		kfree(inst);
 		return -ENOMEM;
-
+	}
 	v4l2_fh_init(&inst->v4l2_fh, vdev);
 	filp->private_data = &inst->v4l2_fh;
 	v4l2_fh_add(&inst->v4l2_fh);
-- 
2.25.1


