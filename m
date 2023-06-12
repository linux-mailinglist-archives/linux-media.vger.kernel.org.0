Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8958772C09A
	for <lists+linux-media@lfdr.de>; Mon, 12 Jun 2023 12:53:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236256AbjFLKxf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Jun 2023 06:53:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235677AbjFLKxV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Jun 2023 06:53:21 -0400
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54B0EAD15;
        Mon, 12 Jun 2023 03:37:50 -0700 (PDT)
X-UUID: a5f1aae2090a11ee9cb5633481061a41-20230612
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=ag/ogO0fKzzP/rZ7bOztATw0TgAk/QxL0wKdHkzytbs=;
        b=KSVuB3pBmLBvrrAHjrm0+FcB84U5c47mvGZOqCFaVxjh5nGQxQWpcsGrvj9ftubPCMLPLjxKK9sX0vQEMCmKxYD6ST1nq5pkJEHkA7bl15S8yL79gtgUabM0hMKq4Ql8m29DAadNgqw9/+xRzROoIMCdlA6safbpr8KknM3Xlcw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.26,REQID:81819fd7-066f-4186-997e-14e423f2ebeb,IP:0,U
        RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
        release,TS:0
X-CID-META: VersionHash:cb9a4e1,CLOUDID:3e9a593e-7aa7-41f3-a6bd-0433bee822f3,B
        ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
        RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: a5f1aae2090a11ee9cb5633481061a41-20230612
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
        (envelope-from <yunfei.dong@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 1929309898; Mon, 12 Jun 2023 18:19:43 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 12 Jun 2023 18:19:41 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 12 Jun 2023 18:19:40 +0800
From:   Yunfei Dong <yunfei.dong@mediatek.com>
To:     =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= 
        <nfraprado@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Nathan Hebert <nhebert@chromium.org>
CC:     Yunfei Dong <yunfei.dong@mediatek.com>,
        Chen-Yu Tsai <wenst@chromium.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Fritz Koenig <frkoenig@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Steve Cho <stevecho@chromium.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v2] media: mediatek: vcodec: fix cancel_work_sync fail with fluster test
Date:   Mon, 12 Jun 2023 18:19:39 +0800
Message-ID: <20230612101939.20259-1-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-MTK:  N
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
        T_SCC_BODY_TEXT_LINE,T_SPF_TEMPERROR,UNPARSEABLE_RELAY autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Will cause below warning then reboot when exercising the decoder with
fluster on mt8192-asurada-spherion.

This deinit function is called on the v4l2 release callback, even though the
work might not have been initialized as that only happens if/when the codec
specific 'decode' callback is called (as a result of device_run m2m callback).

CPU: 5 PID: 2338 Comm: gst-launch-1.0 Tainted: G        W          6.4.0-rc5-next-20230607+ #475
Hardware name: Google Spherion (rev0 - 3) (DT)
pstate: 00400009 (nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : __flush_work.isra.0+0x23c/0x258
lr : __cancel_work_timer+0x14c/0x1c8
sp : ffff8000896e3b00
x29: ffff8000896e3b00 x28: ffff57c3d4079f80 x27: 0000000000000000
x26: ffff57c3d4079f80 x25: ffffb76395b59dc8 x24: 0000000000000001
x23: ffffb763928daab8 x22: ffff57c3d4079f80 x21: 0000000000000000
x20: ffffb763955f6778 x19: ffff57c3cf06f4a0 x18: 0000000000000000
x17: 000000040044ffff x16: 005000f2b5503510 x15: 0000000000000000
x14: ffff57c3c03a1f80 x13: ffffa0616a2fc000 x12: 000000003464d91d
x11: 0000000000000000 x10: 0000000000001b10 x9 : ffffb763928de61c
x8 : ffff57c3d407baf0 x7 : 0000000000000000 x6 : ffff57c3d4079f80
x5 : ffff57c3d4079f80 x4 : 0000000000000000 x3 : 0000000000000000
x2 : ffff8000896e3bf0 x1 : 0000000000000011 x0 : 0000000000000000
Call trace:
 __flush_work.isra.0+0x23c/0x258
 __cancel_work_timer+0x14c/0x1c8
 cancel_work_sync+0x1c/0x30
 vdec_msg_queue_deinit+0xac/0xc8
 vdec_h264_slice_deinit+0x64/0xb8
 vdec_if_deinit+0x3c/0x68
 mtk_vcodec_dec_release+0x20/0x40
 fops_vcodec_release+0x50/0xd8
 v4l2_release+0x7c/0x100
 __fput+0x80/0x270
 ____fput+0x18/0x30
 task_work_run+0x78/0xe0
 do_notify_resume+0x29c/0x7f8
 el0_svc+0xa4/0xb8
 el0t_64_sync_handler+0xc0/0xc8
 el0t_64_sync+0x1a8/0x1b0
---[ end trace 0000000000000000 ]---

Fixes: 297160d411e3 ("media: mediatek: vcodec: move core context from device to each instance")
Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
Reported-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
changed with v1:
- add Reported-by and Reviewed-by.
---
 drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c b/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c
index f555341ae708..04e6dc6cfa1d 100644
--- a/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c
+++ b/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c
@@ -233,7 +233,8 @@ void vdec_msg_queue_deinit(struct vdec_msg_queue *msg_queue,
 		kfree(lat_buf->private_data);
 	}
 
-	cancel_work_sync(&msg_queue->core_work);
+	if (msg_queue->wdma_addr.size)
+		cancel_work_sync(&msg_queue->core_work);
 }
 
 static void vdec_msg_queue_core_work(struct work_struct *work)
-- 
2.25.1

