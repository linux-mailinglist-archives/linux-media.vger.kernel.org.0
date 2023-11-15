Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA9F67E20CA
	for <lists+linux-media@lfdr.de>; Mon,  6 Nov 2023 13:05:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231655AbjKFMFC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Nov 2023 07:05:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231648AbjKFMEw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Nov 2023 07:04:52 -0500
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0322CDF;
        Mon,  6 Nov 2023 04:04:43 -0800 (PST)
X-UUID: a84779427c9c11eea33bb35ae8d461a2-20231106
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=KxIbGqFlysglH5kHHcHmU7i2GT2Cu+bAx81hk7mcBxg=;
        b=gTGGL61CLCLtz/TdeQDF8frczo4N658B3fkczZE96cQQQA/PrkBLN0uSNn0+bBR6l8mxARTFXPGsCdHZpTyZr2rjZhxqLigPjP592UhTviSf7ePGzE1zseX0nwHZQQMTXHlBoMJshkweus0LbJAiS93F1x8hWNExIb4UKMd3f2M=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:98d3e511-7d08-4228-a910-e0237d4d8d35,IP:0,U
        RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
        :release,TS:-5
X-CID-META: VersionHash:364b77b,CLOUDID:dbb7bc5f-c89d-4129-91cb-8ebfae4653fc,B
        ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
        RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
        DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: a84779427c9c11eea33bb35ae8d461a2-20231106
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
        (envelope-from <yunfei.dong@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 545090691; Mon, 06 Nov 2023 20:04:37 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 6 Nov 2023 20:04:34 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 6 Nov 2023 20:04:33 +0800
From:   Yunfei Dong <yunfei.dong@mediatek.com>
To:     Jeffrey Kardatzke <jkardatzke@google.com>,
        "T . J . Mercier" <tjmercier@google.com>,
        John Stultz <jstultz@google.com>,
        Yong Wu <yong.wu@mediatek.com>,
        =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= 
        <nfraprado@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Nathan Hebert <nhebert@chromium.org>
CC:     Chen-Yu Tsai <wenst@chromium.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Fritz Koenig <frkoenig@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Steve Cho <stevecho@chromium.org>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v2,08/21] media: mediatek: vcodec: add tee client interface to communiate with optee-os
Date:   Mon, 6 Nov 2023 20:04:10 +0800
Message-ID: <20231106120423.23364-9-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231106120423.23364-1-yunfei.dong@mediatek.com>
References: <20231106120423.23364-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK:  N
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Open tee context to initialize the environment in order to communication
with optee-os, then open tee session as the communication pipeline for
lat and core to send data for hardware decode.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../platform/mediatek/vcodec/decoder/Makefile |   1 +
 .../vcodec/decoder/mtk_vcodec_dec_drv.h       |   5 +
 .../vcodec/decoder/mtk_vcodec_dec_optee.c     | 165 ++++++++++++++++++
 .../vcodec/decoder/mtk_vcodec_dec_optee.h     |  73 ++++++++
 4 files changed, 244 insertions(+)
 create mode 100644 drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_optee.c
 create mode 100644 drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_optee.h

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/Makefile b/drivers/media/platform/mediatek/vcodec/decoder/Makefile
index 904cd22def84..1624933dfd5e 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/Makefile
+++ b/drivers/media/platform/mediatek/vcodec/decoder/Makefile
@@ -21,5 +21,6 @@ mtk-vcodec-dec-y := vdec/vdec_h264_if.o \
 		mtk_vcodec_dec_stateful.o \
 		mtk_vcodec_dec_stateless.o \
 		mtk_vcodec_dec_pm.o \
+		mtk_vcodec_dec_optee.o \
 
 mtk-vcodec-dec-hw-y := mtk_vcodec_dec_hw.o
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
index 7e36b2c69b7d..7a320d1e37e8 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
@@ -11,6 +11,7 @@
 #include "../common/mtk_vcodec_dbgfs.h"
 #include "../common/mtk_vcodec_fw_priv.h"
 #include "../common/mtk_vcodec_util.h"
+#include "mtk_vcodec_dec_optee.h"
 #include "vdec_msg_queue.h"
 
 #define MTK_VCODEC_DEC_NAME	"mtk-vcodec-dec"
@@ -249,6 +250,8 @@ struct mtk_vcodec_dec_ctx {
  * @vdec_racing_info: record register value
  * @dec_racing_info_mutex: mutex lock used for inner racing mode
  * @dbgfs: debug log related information
+ *
+ * @optee_private: optee private data
  */
 struct mtk_vcodec_dec_dev {
 	struct v4l2_device v4l2_dev;
@@ -289,6 +292,8 @@ struct mtk_vcodec_dec_dev {
 	/* Protects access to vdec_racing_info data */
 	struct mutex dec_racing_info_mutex;
 	struct mtk_vcodec_dbgfs dbgfs;
+
+	struct mtk_vdec_optee_private *optee_private;
 };
 
 static inline struct mtk_vcodec_dec_ctx *fh_to_dec_ctx(struct v4l2_fh *fh)
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_optee.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_optee.c
new file mode 100644
index 000000000000..38d9c1c1785a
--- /dev/null
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_optee.c
@@ -0,0 +1,165 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2023 MediaTek Inc.
+ * Author: Yunfei Dong <yunfei.dong@mediatek.com>
+ */
+
+#include "mtk_vcodec_dec_drv.h"
+#include "mtk_vcodec_dec_optee.h"
+
+/*
+ * Randomly generated, and must correspond to the GUID on the TA side.
+ */
+static const uuid_t mtk_vdec_lat_uuid =
+	UUID_INIT(0xBC50D971, 0xD4C9, 0x42C4,
+		  0x82, 0xCB, 0x34, 0x3F, 0xB7, 0xF3, 0x78, 0x90);
+
+static const uuid_t mtk_vdec_core_uuid =
+	UUID_INIT(0xBC50D971, 0xD4C9, 0x42C4,
+		  0x82, 0xCB, 0x34, 0x3F, 0xB7, 0xF3, 0x78, 0x91);
+
+/*
+ * Check whether this driver supports decoder TA in the TEE instance,
+ * represented by the params (ver/data) of this function.
+ */
+static int mtk_vcodec_dec_optee_match(struct tee_ioctl_version_data *ver_data, const void *not_used)
+{
+	if (ver_data->impl_id == TEE_IMPL_ID_OPTEE)
+		return 1;
+	else
+		return 0;
+}
+
+int mtk_vcodec_dec_optee_private_init(struct mtk_vcodec_dec_dev *vcodec_dev)
+{
+	vcodec_dev->optee_private = devm_kzalloc(&vcodec_dev->plat_dev->dev,
+						 sizeof(*vcodec_dev->optee_private),
+						 GFP_KERNEL);
+	if (!vcodec_dev->optee_private)
+		return -ENOMEM;
+
+	vcodec_dev->optee_private->vcodec_dev = vcodec_dev;
+
+	atomic_set(&vcodec_dev->optee_private->tee_active_cnt, 0);
+	mutex_init(&vcodec_dev->optee_private->tee_mutex);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(mtk_vcodec_dec_optee_private_init);
+
+static int mtk_vcodec_dec_optee_init_hw_info(struct mtk_vdec_optee_private *optee_private,
+					     enum mtk_vdec_hw_id hardware_index)
+{
+	struct device *dev = &optee_private->vcodec_dev->plat_dev->dev;
+	struct tee_ioctl_open_session_arg session_arg;
+	struct mtk_vdec_optee_ca_info *ca_info;
+	int err = 0, session_func;
+
+	/* Open lat and core session with vdec TA. */
+	switch (hardware_index) {
+	case MTK_VDEC_LAT0:
+		export_uuid(session_arg.uuid, &mtk_vdec_lat_uuid);
+		session_func = MTK_VDEC_OPTEE_TA_LAT_SUBMIT_COMMAND;
+		ca_info = &optee_private->lat_ca;
+		break;
+	case MTK_VDEC_CORE:
+		export_uuid(session_arg.uuid, &mtk_vdec_core_uuid);
+		session_func = MTK_VDEC_OPTEE_TA_CORE_SUBMIT_COMMAND;
+		ca_info = &optee_private->core_ca;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	session_arg.clnt_login = TEE_IOCTL_LOGIN_PUBLIC;
+	session_arg.num_params = 0;
+
+	err = tee_client_open_session(optee_private->tee_vdec_ctx, &session_arg, NULL);
+	if (err < 0 || session_arg.ret != 0) {
+		dev_err(dev, MTK_DBG_VCODEC_STR "open vdec tee session fail hw_id:%d err:%x.\n",
+			hardware_index, session_arg.ret);
+		return -EINVAL;
+	}
+	ca_info->vdec_session_id = session_arg.session;
+	ca_info->hw_id = hardware_index;
+	ca_info->vdec_session_func = session_func;
+
+	dev_dbg(dev, MTK_DBG_VCODEC_STR "open vdec tee session hw_id:%d session_id=%x.\n",
+		hardware_index, ca_info->vdec_session_id);
+
+	return err;
+}
+
+static void mtk_vcodec_dec_optee_deinit_hw_info(struct mtk_vdec_optee_private *optee_private,
+						enum mtk_vdec_hw_id hw_id)
+{
+	struct mtk_vdec_optee_ca_info *ca_info;
+
+	if (hw_id == MTK_VDEC_LAT0)
+		ca_info = &optee_private->lat_ca;
+	else
+		ca_info = &optee_private->core_ca;
+
+	tee_client_close_session(optee_private->tee_vdec_ctx, ca_info->vdec_session_id);
+}
+
+int mtk_vcodec_dec_optee_open(struct mtk_vdec_optee_private *optee_private)
+{
+	struct device *dev = &optee_private->vcodec_dev->plat_dev->dev;
+	int ret;
+
+	mutex_lock(&optee_private->tee_mutex);
+	if (atomic_inc_return(&optee_private->tee_active_cnt) > 1) {
+		mutex_unlock(&optee_private->tee_mutex);
+		dev_dbg(dev, MTK_DBG_VCODEC_STR "already init vdec optee private data!\n");
+		return 0;
+	}
+
+	/* Open context with TEE driver */
+	optee_private->tee_vdec_ctx = tee_client_open_context(NULL, mtk_vcodec_dec_optee_match,
+							      NULL, NULL);
+	if (IS_ERR(optee_private->tee_vdec_ctx)) {
+		dev_err(dev, MTK_DBG_VCODEC_STR "optee vdec tee context failed.\n");
+		ret = PTR_ERR(optee_private->tee_vdec_ctx);
+		goto err_ctx_open;
+	}
+
+	ret = mtk_vcodec_dec_optee_init_hw_info(optee_private, MTK_VDEC_LAT0);
+	if (ret < 0)
+		goto err_lat_init;
+
+	if (IS_VDEC_LAT_ARCH(optee_private->vcodec_dev->vdec_pdata->hw_arch)) {
+		ret = mtk_vcodec_dec_optee_init_hw_info(optee_private, MTK_VDEC_CORE);
+		if (ret < 0)
+			goto err_core_init;
+	}
+
+	mutex_unlock(&optee_private->tee_mutex);
+	return 0;
+err_core_init:
+	mtk_vcodec_dec_optee_deinit_hw_info(optee_private, MTK_VDEC_LAT0);
+err_lat_init:
+	tee_client_close_context(optee_private->tee_vdec_ctx);
+err_ctx_open:
+
+	mutex_unlock(&optee_private->tee_mutex);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(mtk_vcodec_dec_optee_open);
+
+void mtk_vcodec_dec_optee_release(struct mtk_vdec_optee_private *optee_private)
+{
+	mutex_lock(&optee_private->tee_mutex);
+	if (!atomic_dec_and_test(&optee_private->tee_active_cnt)) {
+		mutex_unlock(&optee_private->tee_mutex);
+		return;
+	}
+
+	mtk_vcodec_dec_optee_deinit_hw_info(optee_private, MTK_VDEC_LAT0);
+	if (IS_VDEC_LAT_ARCH(optee_private->vcodec_dev->vdec_pdata->hw_arch))
+		mtk_vcodec_dec_optee_deinit_hw_info(optee_private, MTK_VDEC_CORE);
+
+	tee_client_close_context(optee_private->tee_vdec_ctx);
+	mutex_unlock(&optee_private->tee_mutex);
+}
+EXPORT_SYMBOL_GPL(mtk_vcodec_dec_optee_release);
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_optee.h b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_optee.h
new file mode 100644
index 000000000000..8b1dca49331e
--- /dev/null
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_optee.h
@@ -0,0 +1,73 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2023 MediaTek Inc.
+ * Author: Yunfei Dong <yunfei.dong@mediatek.com>
+ */
+
+#ifndef _MTK_VCODEC_DEC_OPTEE_H_
+#define _MTK_VCODEC_DEC_OPTEE_H_
+
+#include <linux/tee_drv.h>
+#include <linux/uuid.h>
+
+#include "mtk_vcodec_dec_drv.h"
+
+/* The TA ID implemented in this TA */
+#define MTK_VDEC_OPTEE_TA_LAT_SUBMIT_COMMAND  (0x10)
+#define MTK_VDEC_OPTEE_TA_CORE_SUBMIT_COMMAND  (0x20)
+
+#define MTK_OPTEE_MAX_TEE_PARAMS 4
+
+/**
+ * struct mtk_vdec_optee_ca_info - ca related param
+ * @vdec_session_id:   optee TA session identifier.
+ * @hw_id:             hardware index.
+ * @vdec_session_func: trusted application function id used specific to the TA.
+ */
+struct mtk_vdec_optee_ca_info {
+	u32 vdec_session_id;
+	enum mtk_vdec_hw_id hw_id;
+	u32 vdec_session_func;
+};
+
+/**
+ * struct mtk_vdec_optee_private - optee private data
+ * @vcodec_dev:     pointer to the mtk_vcodec_dev of the device
+ * @tee_vdec_ctx:   decoder TEE context handler.
+ * @lat_ca:         lat hardware information used to communicate with TA.
+ * @core_ca:        core hardware information used to communicate with TA.
+ *
+ * @tee_active_cnt: used to mark whether need to init optee
+ * @tee_mutex:      mutex lock used for optee
+ */
+struct mtk_vdec_optee_private {
+	struct mtk_vcodec_dec_dev *vcodec_dev;
+	struct tee_context *tee_vdec_ctx;
+
+	struct mtk_vdec_optee_ca_info lat_ca;
+	struct mtk_vdec_optee_ca_info core_ca;
+
+	atomic_t tee_active_cnt;
+	/* mutext used to lock optee open and release information. */
+	struct mutex tee_mutex;
+};
+
+/**
+ * mtk_vcodec_dec_optee_open - setup the communication channels with TA.
+ * @optee_private: optee private context
+ */
+int mtk_vcodec_dec_optee_open(struct mtk_vdec_optee_private *optee_private);
+
+/**
+ * mtk_vcodec_dec_optee_private_init - init optee parameters.
+ * @vcodec_dev: pointer to the mtk_vcodec_dev of the device
+ */
+int mtk_vcodec_dec_optee_private_init(struct mtk_vcodec_dec_dev *vcodec_dev);
+
+/**
+ * mtk_vcodec_dec_optee_release - close the communication channels with TA.
+ * @optee_private: optee private context
+ */
+void mtk_vcodec_dec_optee_release(struct mtk_vdec_optee_private *optee_private);
+
+#endif /* _MTK_VCODEC_FW_OPTEE_H_ */
-- 
2.18.0

