Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F77CADF51
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2019 21:23:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387744AbfIITXO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Sep 2019 15:23:14 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:5210 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729699AbfIITXN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Sep 2019 15:23:13 -0400
X-UUID: 9a45947d1da04b758e75888dfd57531f-20190910
X-UUID: 9a45947d1da04b758e75888dfd57531f-20190910
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw01.mediatek.com
        (envelope-from <frederic.chen@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 994838095; Tue, 10 Sep 2019 03:23:08 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 10 Sep 2019 03:23:05 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 10 Sep 2019 03:23:05 +0800
From:   <frederic.chen@mediatek.com>
To:     <hans.verkuil@cisco.com>,
        <laurent.pinchart+renesas@ideasonboard.com>, <tfiga@chromium.org>,
        <matthias.bgg@gmail.com>, <mchehab@kernel.org>
CC:     <yuzhao@chromium.org>, <zwisler@chromium.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <Sean.Cheng@mediatek.com>,
        <sj.huang@mediatek.com>, <christie.yu@mediatek.com>,
        <holmes.chiou@mediatek.com>, <frederic.chen@mediatek.com>,
        <Jerry-ch.Chen@mediatek.com>, <jungo.lin@mediatek.com>,
        <Rynn.Wu@mediatek.com>, <linux-media@vger.kernel.org>,
        <srv_heupstream@mediatek.com>, <devicetree@vger.kernel.org>,
        <shik@chromium.org>, <suleiman@chromium.org>,
        <Allan.Yang@mediatek.com>
Subject: [RFC PATCH V3 5/5] media: platform: mtk-mdp3: Add struct tuning_addr and img_sw_buffer
Date:   Tue, 10 Sep 2019 03:22:44 +0800
Message-ID: <20190909192244.9367-6-frederic.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190909192244.9367-1-frederic.chen@mediatek.com>
References: <20190909192244.9367-1-frederic.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: 074492E904B74088ADA67159AC5190E930A3C333F23B371DA799ACABE71B13B22000:8
X-MTK:  N
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Frederic Chen <frederic.chen@mediatek.com>

We added a struct tuning_addr which contains a field "present"
so that the driver can tell the firmware if we have user tuning
dataor not.

The strcut img_sw_buffer is also added. This struct has no cpu address
field and uses a handle instead so that we don't pass a cpu address
to co-processor.

Signed-off-by: Frederic Chen <frederic.chen@mediatek.com>
---
 drivers/media/platform/mtk-mdp3/mtk-img-ipi.h | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mtk-mdp3/mtk-img-ipi.h b/drivers/media/platform/mtk-mdp3/mtk-img-ipi.h
index 9fabe7e8b71d..f61e61faf636 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-img-ipi.h
+++ b/drivers/media/platform/mtk-mdp3/mtk-img-ipi.h
@@ -38,6 +38,12 @@ struct img_addr {
 	u32	iova;	/* Used by IOMMU HW access */
 } __attribute__ ((__packed__));
 
+struct tuning_addr {
+	u32	present;
+	u32	pa;	/* Used by CM4 access */
+	u32	iova;	/* Used by IOMMU HW access */
+} __attribute__ ((__packed__));
+
 struct img_sw_addr {
 	u64	va;	/* Used by APMCU access */
 	u32	pa;	/* Used by CM4 access */
@@ -105,16 +111,21 @@ struct img_ipi_frameparam {
 	u64		drv_data;
 	struct img_input	inputs[IMG_MAX_HW_INPUTS];
 	struct img_output	outputs[IMG_MAX_HW_OUTPUTS];
-	struct img_addr		tuning_data;
+	struct tuning_addr	tuning_data;
 	struct img_addr		subfrm_data;
 	struct img_sw_addr	config_data;
 	struct img_sw_addr  self_data;
 	/* u8		pq_data[]; */
 } __attribute__ ((__packed__));
 
+struct img_sw_buffer {
+	u64	handle;		/* Used by APMCU access */
+	u32	scp_addr;	/* Used by CM4 access */
+} __attribute__ ((__packed__));
+
 struct img_ipi_param {
 	u8	usage;
-	struct	img_sw_addr frm_param;
+	struct img_sw_buffer frm_param;
 } __attribute__ ((__packed__));
 
 struct img_frameparam {
-- 
2.18.0

