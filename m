Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F72642874D
	for <lists+linux-media@lfdr.de>; Mon, 11 Oct 2021 09:03:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234545AbhJKHF1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Oct 2021 03:05:27 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:33072 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S234496AbhJKHFJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Oct 2021 03:05:09 -0400
X-UUID: cf677207154248f1aa21ef1f95a8fabc-20211011
X-UUID: cf677207154248f1aa21ef1f95a8fabc-20211011
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
        (envelope-from <yunfei.dong@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 1131278991; Mon, 11 Oct 2021 15:03:08 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 11 Oct 2021 15:03:06 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 11 Oct 2021 15:03:05 +0800
From:   Yunfei Dong <yunfei.dong@mediatek.com>
To:     Yunfei Dong <yunfei.dong@mediatek.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tomasz Figa <tfiga@google.com>
CC:     Hsin-Yi Wang <hsinyi@chromium.org>,
        Fritz Koenig <frkoenig@chromium.org>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Irui Wang <irui.wang@mediatek.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v7, 14/15] media: mtk-vcodec: Add core dec and dec end ipi msg
Date:   Mon, 11 Oct 2021 15:02:46 +0800
Message-ID: <20211011070247.792-15-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211011070247.792-1-yunfei.dong@mediatek.com>
References: <20211011070247.792-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add core dec and dec end ipi msg: AP_IPIMSG_DEC_CORE/AP_IPIMSG_DEC_CORE_END.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../media/platform/mtk-vcodec/vdec_ipi_msg.h   |  4 ++++
 .../media/platform/mtk-vcodec/vdec_vpu_if.c    | 12 ++++++++++++
 .../media/platform/mtk-vcodec/vdec_vpu_if.h    | 18 ++++++++++++++++++
 3 files changed, 34 insertions(+)

diff --git a/drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h b/drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h
index 5f45a537beb4..9d8079c4f976 100644
--- a/drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h
+++ b/drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h
@@ -18,12 +18,16 @@ enum vdec_ipi_msgid {
 	AP_IPIMSG_DEC_END = 0xA002,
 	AP_IPIMSG_DEC_DEINIT = 0xA003,
 	AP_IPIMSG_DEC_RESET = 0xA004,
+	AP_IPIMSG_DEC_CORE = 0xA005,
+	AP_IPIMSG_DEC_CORE_END = 0xA006,
 
 	VPU_IPIMSG_DEC_INIT_ACK = 0xB000,
 	VPU_IPIMSG_DEC_START_ACK = 0xB001,
 	VPU_IPIMSG_DEC_END_ACK = 0xB002,
 	VPU_IPIMSG_DEC_DEINIT_ACK = 0xB003,
 	VPU_IPIMSG_DEC_RESET_ACK = 0xB004,
+	VPU_IPIMSG_DEC_CORE_ACK = 0xB005,
+	VPU_IPIMSG_DEC_CORE_END_ACK = 0xB006,
 };
 
 /**
diff --git a/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c b/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c
index 5dffc459a33d..bfd8e87dceff 100644
--- a/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c
+++ b/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c
@@ -85,6 +85,8 @@ static void vpu_dec_ipi_handler(void *data, unsigned int len, void *priv)
 		case VPU_IPIMSG_DEC_END_ACK:
 		case VPU_IPIMSG_DEC_DEINIT_ACK:
 		case VPU_IPIMSG_DEC_RESET_ACK:
+		case VPU_IPIMSG_DEC_CORE_ACK:
+		case VPU_IPIMSG_DEC_CORE_END_ACK:
 			break;
 
 		default:
@@ -191,11 +193,21 @@ int vpu_dec_start(struct vdec_vpu_inst *vpu, uint32_t *data, unsigned int len)
 	return err;
 }
 
+int vpu_dec_core(struct vdec_vpu_inst *vpu)
+{
+	return vcodec_send_ap_ipi(vpu, AP_IPIMSG_DEC_CORE);
+}
+
 int vpu_dec_end(struct vdec_vpu_inst *vpu)
 {
 	return vcodec_send_ap_ipi(vpu, AP_IPIMSG_DEC_END);
 }
 
+int vpu_dec_core_end(struct vdec_vpu_inst *vpu)
+{
+	return vcodec_send_ap_ipi(vpu, AP_IPIMSG_DEC_CORE_END);
+}
+
 int vpu_dec_deinit(struct vdec_vpu_inst *vpu)
 {
 	return vcodec_send_ap_ipi(vpu, AP_IPIMSG_DEC_DEINIT);
diff --git a/drivers/media/platform/mtk-vcodec/vdec_vpu_if.h b/drivers/media/platform/mtk-vcodec/vdec_vpu_if.h
index c2ed5b6cab8b..ae24b75d1649 100644
--- a/drivers/media/platform/mtk-vcodec/vdec_vpu_if.h
+++ b/drivers/media/platform/mtk-vcodec/vdec_vpu_if.h
@@ -82,4 +82,22 @@ int vpu_dec_deinit(struct vdec_vpu_inst *vpu);
  */
 int vpu_dec_reset(struct vdec_vpu_inst *vpu);
 
+/**
+ * vpu_dec_core - core start decoding, basically the function will be invoked once
+ *                 every frame.
+ *
+ * @vpu : instance for vdec_vpu_inst
+ */
+int vpu_dec_core(struct vdec_vpu_inst *vpu);
+
+/**
+ * vpu_dec_core_end - core end decoding, basically the function will be invoked once
+ *               when core HW decoding done and receive interrupt successfully. The
+ *               decoder in VPU will updata hardware information and deinit hardware
+ *               and check if there is a new decoded frame available to display.
+ *
+ * @vpu : instance for vdec_vpu_inst
+ */
+int vpu_dec_core_end(struct vdec_vpu_inst *vpu);
+
 #endif
-- 
2.25.1

