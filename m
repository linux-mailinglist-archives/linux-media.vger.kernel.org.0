Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F1276C9B25
	for <lists+linux-media@lfdr.de>; Mon, 27 Mar 2023 07:53:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232142AbjC0Fxq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Mar 2023 01:53:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231960AbjC0Fxn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Mar 2023 01:53:43 -0400
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AFD540FE;
        Sun, 26 Mar 2023 22:53:37 -0700 (PDT)
X-UUID: b39f3580cc6311eda9a90f0bb45854f4-20230327
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=1auQmDPlDWuWCFjiGD/N9g5k0v7IBBTaFSzN1WpWw/k=;
        b=I4g9lUUJ6liopajVZ9xSoTwPiUP0V8knCyDOcvhYxJErsHGBlKBAd8DpyZIBooirkOSLDUUDRY0l3ZC7iXoM2PAYCu72TRPMA9eyxcVaeD+DuHoEwsheWzoTK2uOkXfsRB1/ckelxoj+r2ybtcfhwF2GdsWL214TFN11pP9BMSE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:7ef16d35-8129-4562-8f37-93b7a1e47dd9,IP:0,U
        RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
        N:release,TS:-25
X-CID-META: VersionHash:120426c,CLOUDID:ac4203f7-ddba-41c3-91d9-10eeade8eac7,B
        ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
        RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: b39f3580cc6311eda9a90f0bb45854f4-20230327
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
        (envelope-from <yunfei.dong@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 1251969247; Mon, 27 Mar 2023 13:53:30 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Mon, 27 Mar 2023 13:53:29 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Mon, 27 Mar 2023 13:53:28 +0800
From:   Yunfei Dong <yunfei.dong@mediatek.com>
To:     Yunfei Dong <yunfei.dong@mediatek.com>,
        Chen-Yu Tsai <wenst@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= 
        <nfraprado@collabora.com>
CC:     Matthias Brugger <matthias.bgg@gmail.com>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Fritz Koenig <frkoenig@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Steve Cho <stevecho@chromium.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v3,1/7] media: mediatek: vcodec: Add debugfs interface to get debug information
Date:   Mon, 27 Mar 2023 13:53:09 +0800
Message-ID: <20230327055315.13936-2-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230327055315.13936-1-yunfei.dong@mediatek.com>
References: <20230327055315.13936-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK:  N
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        UNPARSEABLE_RELAY autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This will be useful when debugging specific issues related to kernel
in running status.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../media/platform/mediatek/vcodec/Makefile   |  6 ++++
 .../mediatek/vcodec/mtk_vcodec_dbgfs.c        | 33 +++++++++++++++++++
 .../mediatek/vcodec/mtk_vcodec_dbgfs.h        | 32 ++++++++++++++++++
 .../mediatek/vcodec/mtk_vcodec_dec_drv.c      |  2 ++
 .../platform/mediatek/vcodec/mtk_vcodec_drv.h |  4 +++
 5 files changed, 77 insertions(+)
 create mode 100644 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.c
 create mode 100644 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.h

diff --git a/drivers/media/platform/mediatek/vcodec/Makefile b/drivers/media/platform/mediatek/vcodec/Makefile
index 93e7a343b5b0..f6b750cf7077 100644
--- a/drivers/media/platform/mediatek/vcodec/Makefile
+++ b/drivers/media/platform/mediatek/vcodec/Makefile
@@ -44,3 +44,9 @@ endif
 ifneq ($(CONFIG_VIDEO_MEDIATEK_VCODEC_SCP),)
 mtk-vcodec-common-y += mtk_vcodec_fw_scp.o
 endif
+
+ifneq ($(CONFIG_DEBUG_FS),)
+obj-$(CONFIG_VIDEO_MEDIATEK_VCODEC) += mtk-vcodec-dbgfs.o
+
+mtk-vcodec-dbgfs-y := mtk_vcodec_dbgfs.o
+endif
\ No newline at end of file
diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.c
new file mode 100644
index 000000000000..fb9edd379af5
--- /dev/null
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.c
@@ -0,0 +1,33 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2023 MediaTek Inc.
+ * Author: Yunfei Dong <yunfei.dong@mediatek.com>
+ */
+
+#include <linux/debugfs.h>
+
+#include "mtk_vcodec_dbgfs.h"
+#include "mtk_vcodec_drv.h"
+#include "mtk_vcodec_util.h"
+
+void mtk_vcodec_dbgfs_init(struct mtk_vcodec_dev *vcodec_dev)
+{
+	struct dentry *vcodec_root;
+
+	vcodec_dev->dbgfs.vcodec_root = debugfs_create_dir("vcodec-dec", NULL);
+	if (IS_ERR(vcodec_dev->dbgfs.vcodec_root))
+		dev_err(&vcodec_dev->plat_dev->dev, "create vcodec dir err:%d\n",
+			IS_ERR(vcodec_dev->dbgfs.vcodec_root));
+
+	vcodec_root = vcodec_dev->dbgfs.vcodec_root;
+}
+EXPORT_SYMBOL_GPL(mtk_vcodec_dbgfs_init);
+
+void mtk_vcodec_dbgfs_deinit(struct mtk_vcodec_dev *vcodec_dev)
+{
+	debugfs_remove_recursive(vcodec_dev->dbgfs.vcodec_root);
+}
+EXPORT_SYMBOL_GPL(mtk_vcodec_dbgfs_deinit);
+
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("Mediatek video codec driver");
diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.h b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.h
new file mode 100644
index 000000000000..5eec2211cbbe
--- /dev/null
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2023 MediaTek Inc.
+ * Author: Yunfei Dong <yunfei.dong@mediatek.com>
+ */
+
+#ifndef __MTK_VCODEC_DBGFS_H__
+#define __MTK_VCODEC_DBGFS_H__
+
+struct mtk_vcodec_dev;
+
+/**
+ * struct mtk_vcodec_dbgfs  - dbgfs information
+ * @vcodec_root: vcodec dbgfs entry
+ */
+struct mtk_vcodec_dbgfs {
+	struct dentry *vcodec_root;
+};
+
+#if defined(CONFIG_DEBUG_FS)
+void mtk_vcodec_dbgfs_init(struct mtk_vcodec_dev *vcodec_dev);
+void mtk_vcodec_dbgfs_deinit(struct mtk_vcodec_dev *vcodec_dev);
+#else
+static inline void mtk_vcodec_dbgfs_init(struct mtk_vcodec_dev *vcodec_dev)
+{
+}
+
+static inline void mtk_vcodec_dbgfs_deinit(struct mtk_vcodec_dev *vcodec_dev)
+{
+}
+#endif
+#endif
diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c
index 174a6eec2f54..de29b1fb0436 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c
@@ -431,6 +431,7 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 		mtk_v4l2_debug(0, "media registered as /dev/media%d", vfd_dec->minor);
 	}
 
+	mtk_vcodec_dbgfs_init(dev);
 	mtk_v4l2_debug(0, "decoder registered as /dev/video%d", vfd_dec->minor);
 
 	return 0;
@@ -505,6 +506,7 @@ static int mtk_vcodec_dec_remove(struct platform_device *pdev)
 	if (dev->vfd_dec)
 		video_unregister_device(dev->vfd_dec);
 
+	mtk_vcodec_dbgfs_deinit(dev);
 	v4l2_device_unregister(&dev->v4l2_dev);
 	if (!dev->vdec_pdata->is_subdev_supported)
 		pm_runtime_disable(dev->pm.dev);
diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h
index 9acab54fd650..a7e8bb3608ac 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h
@@ -16,6 +16,7 @@
 #include <media/v4l2-mem2mem.h>
 #include <media/videobuf2-core.h>
 
+#include "mtk_vcodec_dbgfs.h"
 #include "mtk_vcodec_util.h"
 #include "vdec_msg_queue.h"
 
@@ -470,6 +471,7 @@ struct mtk_vcodec_enc_pdata {
  * @dec_active_cnt: used to mark whether need to record register value
  * @vdec_racing_info: record register value
  * @dec_racing_info_mutex: mutex lock used for inner racing mode
+ * @dbgfs: debug log related information
  */
 struct mtk_vcodec_dev {
 	struct v4l2_device v4l2_dev;
@@ -520,6 +522,8 @@ struct mtk_vcodec_dev {
 	u32 vdec_racing_info[132];
 	/* Protects access to vdec_racing_info data */
 	struct mutex dec_racing_info_mutex;
+
+	struct mtk_vcodec_dbgfs dbgfs;
 };
 
 static inline struct mtk_vcodec_ctx *fh_to_ctx(struct v4l2_fh *fh)
-- 
2.18.0

