Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 315501DAD53
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2020 10:28:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726936AbgETI15 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 May 2020 04:27:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726925AbgETI14 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 May 2020 04:27:56 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38F51C061A0F
        for <linux-media@vger.kernel.org>; Wed, 20 May 2020 01:27:56 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id u22so1011156plq.12
        for <linux-media@vger.kernel.org>; Wed, 20 May 2020 01:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=y+8eNewBsXZJc60V3E/q/FW32E3cUEWT1BvYpjSBhUo=;
        b=DMhNCLfEDrDLgMLwU76zAF6e3ckXRQWQQ+5A5ODxvR04JcuL+CpFAL0NrMojrJBYTI
         BMxZsVlSVH9/v8XTcTr47ldDCI1sg6onhP5Fxl9iChzd6cXtMSQfXwR+9vLVipThCuJn
         Emes0RJhDfeQrnJzzNAjiDFEFJWQxqPFFxr5I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=y+8eNewBsXZJc60V3E/q/FW32E3cUEWT1BvYpjSBhUo=;
        b=VXKUwFjEs9jLOMhq/CTZG/pgluRfmAjfWt6olB13PHP06Ol/PXX+3tK6F4a4b3mebK
         HJTGEQ9WQZTLBV1smvfeHpTP7pEKy99W49VCQjEvODVnmajV1mc/gF1a/3sBe2e9huoz
         LiXGdV+alfHwSKtp3JT3tD3//DquFZM8jMARruoyVc6fRX+abQ/Lq6IntUhcV9D3hlCN
         Vwc7BffGaeepzC5WkD4tl1qIDS4O7DDzlChJCy+Hgwa0sFwVFLd5PNSelZrA9SesstYi
         QcFEFNhSDrguUzcamAdu5i4tP0bt8AqnUTBcibrGUTvG+a8MH7+xJPb/zmegRmlgZ4dP
         GvMA==
X-Gm-Message-State: AOAM532X+94m+QiBz+YatdGwW7Sk3/iOFcw8Nij5CbrsYA9nrIKDpe2+
        LR4ZW09RyViSL+7pmuqYHRhNSg==
X-Google-Smtp-Source: ABdhPJwmEIh+IVpXwAkL9L48f5LyrS5lTD2flWdhA+4+MshBuJ7AdRa5G6VqU1WNUSyN9onU36enBg==
X-Received: by 2002:a17:90b:80f:: with SMTP id bk15mr4108160pjb.51.1589963275724;
        Wed, 20 May 2020 01:27:55 -0700 (PDT)
Received: from acourbot.tok.corp.google.com ([2401:fa00:8f:203:93d9:de4d:e834:3086])
        by smtp.gmail.com with ESMTPSA id gg8sm1447775pjb.39.2020.05.20.01.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2020 01:27:55 -0700 (PDT)
From:   Alexandre Courbot <acourbot@chromium.org>
To:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Rui Wang <gtk_ruiwang@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Pi-Hsun Shih <pihsun@chromium.org>,
        Maoguang Meng <maoguang.meng@mediatek.com>
Cc:     linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Alexandre Courbot <acourbot@chromium.org>
Subject: [PATCH 04/10] media: mtk-vcodec: venc: handle firmware version field
Date:   Wed, 20 May 2020 17:27:17 +0900
Message-Id: <20200520082723.96136-5-acourbot@chromium.org>
X-Mailer: git-send-email 2.26.2.761.g0e0b3e54be-goog
In-Reply-To: <20200520082723.96136-1-acourbot@chromium.org>
References: <20200520082723.96136-1-acourbot@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Firmwares for encoders newer than MT8173 will include an ABI version
number in their initialization ack message. Add the capacity to manage
it and make initialization fail if the firmware ABI is of a version that
we don't support.

For MT8173, this ABI version field is reserved and thus undefined ; thus
ignore it on this chip. There should only be one firmware version available
for it anyway.

Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
---
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  8 ++++++
 .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  |  1 +
 .../media/platform/mtk-vcodec/venc_ipi_msg.h  |  9 ++++---
 .../media/platform/mtk-vcodec/venc_vpu_if.c   | 27 ++++++++++++++++---
 4 files changed, 38 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
index 45c8adfc6a0c..e7b155e7432e 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
@@ -300,13 +300,21 @@ struct mtk_vcodec_ctx {
 
 };
 
+enum mtk_chip {
+	MTK_MT8173,
+};
+
 /**
  * struct mtk_vcodec_enc_pdata - compatible data for each IC
  *
+ * @chip: chip this encoder is compatible with
+ *
  * @uses_ext: whether the encoder uses the extended firmware messaging format
  * @has_lt_irq: whether the encoder uses the LT irq
  */
 struct mtk_vcodec_enc_pdata {
+	enum mtk_chip chip;
+
 	bool uses_ext;
 	bool has_lt_irq;
 };
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
index 922bc8883811..c1365209263e 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
@@ -378,6 +378,7 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 }
 
 static const struct mtk_vcodec_enc_pdata mt8173_pdata = {
+	.chip = MTK_MT8173,
 	.has_lt_irq = true,
 };
 
diff --git a/drivers/media/platform/mtk-vcodec/venc_ipi_msg.h b/drivers/media/platform/mtk-vcodec/venc_ipi_msg.h
index 4cafbf92d9cd..31a3c76f7d0d 100644
--- a/drivers/media/platform/mtk-vcodec/venc_ipi_msg.h
+++ b/drivers/media/platform/mtk-vcodec/venc_ipi_msg.h
@@ -131,16 +131,17 @@ struct venc_vpu_ipi_msg_common {
  * @venc_inst:	AP encoder instance (struct venc_vp8_inst/venc_h264_inst *)
  * @vpu_inst_addr:	VPU encoder instance addr
  *			(struct venc_vp8_vsi/venc_h264_vsi *)
- * @reserved:	reserved for future use. vpu is running in 32bit. Without
- *		this reserved field, if kernel run in 64bit. this struct size
- *		will be different between kernel and vpu
+ * @venc_abi_version:	ABI version of the firmware. Kernel can use it to
+ *			ensure that it is compatible with the firmware.
+ *			For MT8173 the value of this field is undefined and
+ *			should not be used.
  */
 struct venc_vpu_ipi_msg_init {
 	uint32_t msg_id;
 	uint32_t status;
 	uint64_t venc_inst;
 	uint32_t vpu_inst_addr;
-	uint32_t reserved;
+	uint32_t venc_abi_version;
 };
 
 /**
diff --git a/drivers/media/platform/mtk-vcodec/venc_vpu_if.c b/drivers/media/platform/mtk-vcodec/venc_vpu_if.c
index 6c77bf025172..472503701003 100644
--- a/drivers/media/platform/mtk-vcodec/venc_vpu_if.c
+++ b/drivers/media/platform/mtk-vcodec/venc_vpu_if.c
@@ -4,6 +4,7 @@
  * Author: PoChun Lin <pochun.lin@mediatek.com>
  */
 
+#include "mtk_vcodec_drv.h"
 #include "mtk_vcodec_fw.h"
 #include "venc_ipi_msg.h"
 #include "venc_vpu_if.h"
@@ -15,6 +16,23 @@ static void handle_enc_init_msg(struct venc_vpu_inst *vpu, const void *data)
 	vpu->inst_addr = msg->vpu_inst_addr;
 	vpu->vsi = mtk_vcodec_fw_map_dm_addr(vpu->ctx->dev->fw_handler,
 					     msg->vpu_inst_addr);
+
+	/* Firmware version field value is unspecified on MT8173. */
+	if (vpu->ctx->dev->venc_pdata->chip == MTK_MT8173)
+		return;
+
+	/* Check firmware version. */
+	mtk_vcodec_debug(vpu, "firmware version: 0x%x\n",
+			 msg->venc_abi_version);
+	switch (msg->venc_abi_version) {
+	case 1:
+		break;
+	default:
+		mtk_vcodec_err(vpu, "unhandled firmware version 0x%x\n",
+			       msg->venc_abi_version);
+		vpu->failure = 1;
+		break;
+	}
 }
 
 static void handle_enc_encode_msg(struct venc_vpu_inst *vpu, const void *data)
@@ -35,6 +53,11 @@ static void vpu_enc_ipi_handler(void *data, unsigned int len, void *priv)
 	mtk_vcodec_debug(vpu, "msg_id %x inst %p status %d",
 			 msg->msg_id, vpu, msg->status);
 
+	vpu->signaled = 1;
+	vpu->failure = (msg->status != VENC_IPI_MSG_STATUS_OK);
+	if (vpu->failure)
+		goto failure;
+
 	switch (msg->msg_id) {
 	case VPU_IPIMSG_ENC_INIT_DONE:
 		handle_enc_init_msg(vpu, data);
@@ -51,9 +74,7 @@ static void vpu_enc_ipi_handler(void *data, unsigned int len, void *priv)
 		break;
 	}
 
-	vpu->signaled = 1;
-	vpu->failure = (msg->status != VENC_IPI_MSG_STATUS_OK);
-
+failure:
 	mtk_vcodec_debug_leave(vpu);
 }
 
-- 
2.26.2.761.g0e0b3e54be-goog

