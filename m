Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 329D876161
	for <lists+linux-media@lfdr.de>; Fri, 26 Jul 2019 10:54:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726514AbfGZIyx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Jul 2019 04:54:53 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:50063 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725945AbfGZIyx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Jul 2019 04:54:53 -0400
X-UUID: a03d0d82d18447fe8430d1072d1de8e4-20190726
X-UUID: a03d0d82d18447fe8430d1072d1de8e4-20190726
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw02.mediatek.com
        (envelope-from <gtk_ruiwang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0707 with TLS)
        with ESMTP id 891292867; Fri, 26 Jul 2019 16:54:45 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 26 Jul 2019 16:54:45 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 26 Jul 2019 16:54:45 +0800
From:   <gtk_ruiwang@mediatek.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Tomasz Figa <tfiga@chromium.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>
CC:     Longfei Wang <longfei.wang@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        gtk_ruiwang <gtk_ruiwang@mediatek.com>
Subject: media: mtk-vcodec: Handle H264 error bitstreams
Date:   Fri, 26 Jul 2019 16:54:33 +0800
Message-ID: <20190726085433.15612-1-gtk_ruiwang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: gtk_ruiwang <gtk_ruiwang@mediatek.com>

Error h264 bitstreams which picture info are out range of
decoder hardware specification, and no nal start code at the
beginning of the buffer, stop decoding and exit.

Signed-off-by: gtk_ruiwang <gtk_ruiwang@mediatek.com>
---
 .../platform/mtk-vcodec/vdec/vdec_h264_if.c      | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_if.c b/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_if.c
index c5f8f1fca44c..49aa85a9bb5a 100644
--- a/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_if.c
+++ b/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_if.c
@@ -29,6 +29,9 @@
 #define H264_MAX_FB_NUM				17
 #define HDR_PARSING_BUF_SZ			1024
 
+#define DEC_ERR_RET(ret)			((ret) >> 16)
+#define H264_ERR_NOT_VALID			3
+
 /**
  * struct h264_fb - h264 decode frame buffer information
  * @vdec_fb_va  : virtual address of struct vdec_fb
@@ -357,8 +360,11 @@ static int vdec_h264_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 	buf = (unsigned char *)bs->va;
 	buf_sz = bs->size;
 	nal_start_idx = find_start_code(buf, buf_sz);
-	if (nal_start_idx < 0)
+	if (nal_start_idx < 0) {
+		mtk_vcodec_err(inst, "invalid nal start code");
+		err = -EIO;
 		goto err_free_fb_out;
+	}
 
 	nal_start = buf[nal_start_idx];
 	nal_type = NAL_TYPE(buf[nal_start_idx]);
@@ -382,8 +388,14 @@ static int vdec_h264_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 	data[0] = buf_sz;
 	data[1] = nal_start;
 	err = vpu_dec_start(vpu, data, 2);
-	if (err)
+	if (err) {
+		if (err > 0 && (DEC_ERR_RET(err) == H264_ERR_NOT_VALID)) {
+			mtk_vcodec_err(inst, "- error bitstream - err = %d -",
+				       err);
+			err = -EIO;
+		}
 		goto err_free_fb_out;
+	}
 
 	*res_chg = inst->vsi->dec.resolution_changed;
 	if (*res_chg) {
-- 
2.18.0

