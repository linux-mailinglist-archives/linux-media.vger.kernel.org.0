Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3797E61D88
	for <lists+linux-media@lfdr.de>; Mon,  8 Jul 2019 13:05:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730237AbfGHLFZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Jul 2019 07:05:25 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:8910 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727662AbfGHLFZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 Jul 2019 07:05:25 -0400
X-UUID: a150150cc7f04f8baf7de15bd4742239-20190708
X-UUID: a150150cc7f04f8baf7de15bd4742239-20190708
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw01.mediatek.com
        (envelope-from <frederic.chen@mediatek.com>)
        (mhqrelay.mediatek.com ESMTP with TLS)
        with ESMTP id 1317092747; Mon, 08 Jul 2019 19:05:18 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 8 Jul 2019 19:05:16 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 8 Jul 2019 19:05:17 +0800
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
Subject: [RFC PATCH V2 6/6] media: platform: mtk-mdp3: Add struct tuning_addr to identify user tuning data
Date:   Mon, 8 Jul 2019 19:05:00 +0800
Message-ID: <20190708110500.7242-7-frederic.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190708110500.7242-1-frederic.chen@mediatek.com>
References: <20190708110500.7242-1-frederic.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Frederic Chen <frederic.chen@mediatek.com>

We added a struct tuning_addr which contains a field "present"
so that the driver can tell the firmware if we have user tuning
dataor not.

Signed-off-by: Frederic Chen <frederic.chen@mediatek.com>
---
 drivers/media/platform/mtk-mdp3/mtk-img-ipi.h | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mtk-mdp3/mtk-img-ipi.h b/drivers/media/platform/mtk-mdp3/mtk-img-ipi.h
index 9fabe7e8b71d..0944fe911d97 100644
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
@@ -105,7 +111,7 @@ struct img_ipi_frameparam {
 	u64		drv_data;
 	struct img_input	inputs[IMG_MAX_HW_INPUTS];
 	struct img_output	outputs[IMG_MAX_HW_OUTPUTS];
-	struct img_addr		tuning_data;
+	struct tuning_addr	tuning_data;
 	struct img_addr		subfrm_data;
 	struct img_sw_addr	config_data;
 	struct img_sw_addr  self_data;
-- 
2.18.0

