Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 90BA01C30E
	for <lists+linux-media@lfdr.de>; Tue, 14 May 2019 08:16:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726238AbfENGOq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 May 2019 02:14:46 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:63578 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726394AbfENGOL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 May 2019 02:14:11 -0400
X-UUID: 10b2b51bd75a406a85eb64d29cb06f93-20190514
X-UUID: 10b2b51bd75a406a85eb64d29cb06f93-20190514
Received: from mtkcas09.mediatek.inc [(172.21.101.178)] by mailgw01.mediatek.com
        (envelope-from <stu.hsieh@mediatek.com>)
        (mhqrelay.mediatek.com ESMTP with TLS)
        with ESMTP id 874281062; Tue, 14 May 2019 14:13:56 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 14 May 2019 14:13:54 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 14 May 2019 14:13:54 +0800
From:   Stu Hsieh <stu.hsieh@mediatek.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, CK Hu <ck.hu@mediatek.com>
CC:     Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Stu Hsieh <stu.hsieh@mediatek.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>
Subject: [PATCH v3 04/13] [media] mtk-mipicsi: add the check for non-supported color format
Date:   Tue, 14 May 2019 14:13:41 +0800
Message-ID: <1557814430-9675-5-git-send-email-stu.hsieh@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1557814430-9675-1-git-send-email-stu.hsieh@mediatek.com>
References: <1557814430-9675-1-git-send-email-stu.hsieh@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: EAB881BC5B75B3FF29E97C0916E56D141406D08395B8A39BF2325F9392B3BE062000:8
X-MTK:  N
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch add the check for non-supported color format

Signed-off-by: Stu Hsieh <stu.hsieh@mediatek.com>
---
 .../media/platform/mtk-mipicsi/mtk_mipicsi.c  | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c b/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
index 9142564baf1d..9c65b96456c4 100644
--- a/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
+++ b/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
@@ -172,6 +172,20 @@ static void mtk_mipicsi_remove_device(struct soc_camera_device *icd)
 	(void)pm_runtime_put_sync(icd->parent);
 }
 
+static bool is_supported(const u32 pixformat)
+{
+	switch (pixformat) {
+	/* YUV422 */
+	case V4L2_PIX_FMT_YUYV:
+	case V4L2_PIX_FMT_UYVY:
+	case V4L2_PIX_FMT_YVYU:
+	case V4L2_PIX_FMT_VYUY:
+		return true;
+	}
+
+	return false;
+}
+
 static int mtk_mipicsi_set_fmt(struct soc_camera_device *icd,
 				struct v4l2_format *f)
 {
@@ -187,6 +201,12 @@ static int mtk_mipicsi_set_fmt(struct soc_camera_device *icd,
 	struct v4l2_mbus_framefmt *mf = &format.format;
 	int ret = 0;
 
+	if (!is_supported(pix->pixelformat)) {
+		dev_err(dev, "Format %x not support. set V4L2_PIX_FMT_YUYV as default\n",
+			pix->pixelformat);
+		pix->pixelformat = V4L2_PIX_FMT_YUYV;
+	}
+
 	xlate = soc_camera_xlate_by_fourcc(icd, pix->pixelformat);
 	if (xlate == NULL) {
 		dev_err(dev, "Format 0x%x not found\n", pix->pixelformat);
-- 
2.18.0

