Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6AF84ED2BA
	for <lists+linux-media@lfdr.de>; Thu, 31 Mar 2022 06:35:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229606AbiCaEKg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 31 Mar 2022 00:10:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229735AbiCaEKQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 31 Mar 2022 00:10:16 -0400
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D9921480DC;
        Wed, 30 Mar 2022 20:43:49 -0700 (PDT)
X-UUID: f24d7e7d1dca462ebf738e23181e66f2-20220331
X-UUID: f24d7e7d1dca462ebf738e23181e66f2-20220331
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
        (envelope-from <yunfei.dong@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 559236251; Thu, 31 Mar 2022 10:48:57 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 31 Mar 2022 10:48:55 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 31 Mar 2022 10:48:53 +0800
From:   Yunfei Dong <yunfei.dong@mediatek.com>
To:     Yunfei Dong <yunfei.dong@mediatek.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tomasz Figa <tfiga@google.com>
CC:     George Sun <george.sun@mediatek.com>,
        Xiaoyong Lu <xiaoyong.lu@mediatek.com>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Fritz Koenig <frkoenig@chromium.org>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Irui Wang <irui.wang@mediatek.com>,
        Steve Cho <stevecho@chromium.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v8, 17/17] media: mediatek: vcodec: prevent kernel crash when rmmod mtk-vcodec-dec.ko
Date:   Thu, 31 Mar 2022 10:48:01 +0800
Message-ID: <20220331024801.29229-18-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220331024801.29229-1-yunfei.dong@mediatek.com>
References: <20220331024801.29229-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-MTK:  N
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If the driver support subdev mode, the parameter "dev->pm.dev" will be
NULL in mtk_vcodec_dec_remove. Kernel will crash when try to rmmod
mtk-vcodec-dec.ko.

[ 4380.702726] pc : do_raw_spin_trylock+0x4/0x80
[ 4380.707075] lr : _raw_spin_lock_irq+0x90/0x14c
[ 4380.711509] sp : ffff80000819bc10
[ 4380.714811] x29: ffff80000819bc10 x28: ffff3600c03e4000 x27: 0000000000000000
[ 4380.721934] x26: 0000000000000000 x25: 0000000000000000 x24: 0000000000000000
[ 4380.729057] x23: ffff3600c0f34930 x22: ffffd5e923549000 x21: 0000000000000220
[ 4380.736179] x20: 0000000000000208 x19: ffffd5e9213e8ebc x18: 0000000000000020
[ 4380.743298] x17: 0000002000000000 x16: ffffd5e9213e8e90 x15: 696c346f65646976
[ 4380.750420] x14: 0000000000000000 x13: 0000000000000001 x12: 0000000000000040
[ 4380.757542] x11: 0000000000000000 x10: 0000000000000000 x9 : 0000000000000000
[ 4380.764664] x8 : 0000000000000000 x7 : ffff3600c7273ae8 x6 : ffffd5e9213e8ebc
[ 4380.771786] x5 : 0000000000000000 x4 : 0000000000000001 x3 : 0000000000000000
[ 4380.778908] x2 : 0000000000000000 x1 : ffff3600c03e4000 x0 : 0000000000000208
[ 4380.786031] Call trace:
[ 4380.788465]  do_raw_spin_trylock+0x4/0x80
[ 4380.792462]  __pm_runtime_disable+0x2c/0x1b0
[ 4380.796723]  mtk_vcodec_dec_remove+0x5c/0xa0 [mtk_vcodec_dec]
[ 4380.802466]  platform_remove+0x2c/0x60
[ 4380.806204]  __device_release_driver+0x194/0x250
[ 4380.810810]  driver_detach+0xc8/0x15c
[ 4380.814462]  bus_remove_driver+0x5c/0xb0
[ 4380.818375]  driver_unregister+0x34/0x64
[ 4380.822288]  platform_driver_unregister+0x18/0x24
[ 4380.826979]  mtk_vcodec_dec_driver_exit+0x1c/0x888 [mtk_vcodec_dec]
[ 4380.833240]  __arm64_sys_delete_module+0x190/0x224
[ 4380.838020]  invoke_syscall+0x48/0x114
[ 4380.841760]  el0_svc_common.constprop.0+0x60/0x11c
[ 4380.846540]  do_el0_svc+0x28/0x90
[ 4380.849844]  el0_svc+0x4c/0x100
[ 4380.852975]  el0t_64_sync_handler+0xec/0xf0
[ 4380.857148]  el0t_64_sync+0x190/0x194
[ 4380.860801] Code: 94431515 17ffffca d503201f d503245f (b9400004)

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c
index a84df6596aaa..5da4572c5b14 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c
@@ -482,7 +482,8 @@ static int mtk_vcodec_dec_remove(struct platform_device *pdev)
 		video_unregister_device(dev->vfd_dec);
 
 	v4l2_device_unregister(&dev->v4l2_dev);
-	pm_runtime_disable(dev->pm.dev);
+	if (!dev->vdec_pdata->is_subdev_supported)
+		pm_runtime_disable(dev->pm.dev);
 	mtk_vcodec_fw_release(dev->fw_handler);
 	return 0;
 }
-- 
2.18.0

