Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D931077F7FB
	for <lists+linux-media@lfdr.de>; Thu, 17 Aug 2023 15:44:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351578AbjHQNoG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Aug 2023 09:44:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351623AbjHQNn6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Aug 2023 09:43:58 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8DCE106
        for <linux-media@vger.kernel.org>; Thu, 17 Aug 2023 06:43:57 -0700 (PDT)
Received: from canpemm500007.china.huawei.com (unknown [172.30.72.54])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RRR2v1z7LzNmqS;
        Thu, 17 Aug 2023 21:40:23 +0800 (CST)
Received: from localhost (10.174.179.215) by canpemm500007.china.huawei.com
 (7.192.104.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Thu, 17 Aug
 2023 21:43:55 +0800
From:   Yue Haibing <yuehaibing@huawei.com>
To:     <mirela.rabulea@nxp.com>, <linux-imx@nxp.com>,
        <mchehab@kernel.org>, <shawnguo@kernel.org>,
        <s.hauer@pengutronix.de>, <kernel@pengutronix.de>,
        <festevam@gmail.com>, <hverkuil-cisco@xs4all.nl>,
        <ming.qian@nxp.com>, <yuehaibing@huawei.com>
CC:     <linux-media@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH -next] media: imx-jpeg: Remove unused declarations
Date:   Thu, 17 Aug 2023 21:43:54 +0800
Message-ID: <20230817134354.24936-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.179.215]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 canpemm500007.china.huawei.com (7.192.104.62)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

These are never implemented, remove them.

Signed-off-by: Yue Haibing <yuehaibing@huawei.com>
---
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h
index a2b4fb9e29e7..d579c804b047 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h
@@ -115,28 +115,17 @@ void print_cast_status(struct device *dev, void __iomem *reg,
 void print_wrapper_info(struct device *dev, void __iomem *reg);
 void mxc_jpeg_sw_reset(void __iomem *reg);
 int mxc_jpeg_enable(void __iomem *reg);
-void wait_frmdone(struct device *dev, void __iomem *reg);
 void mxc_jpeg_enc_mode_conf(struct device *dev, void __iomem *reg, u8 extseq);
 void mxc_jpeg_enc_mode_go(struct device *dev, void __iomem *reg, u8 extseq);
 void mxc_jpeg_enc_set_quality(struct device *dev, void __iomem *reg, u8 quality);
 void mxc_jpeg_dec_mode_go(struct device *dev, void __iomem *reg);
-int mxc_jpeg_get_slot(void __iomem *reg);
-u32 mxc_jpeg_get_offset(void __iomem *reg, int slot);
 void mxc_jpeg_enable_slot(void __iomem *reg, int slot);
 void mxc_jpeg_set_l_endian(void __iomem *reg, int le);
 void mxc_jpeg_enable_irq(void __iomem *reg, int slot);
 void mxc_jpeg_disable_irq(void __iomem *reg, int slot);
-int mxc_jpeg_set_input(void __iomem *reg, u32 in_buf, u32 bufsize);
-int mxc_jpeg_set_output(void __iomem *reg, u16 out_pitch, u32 out_buf,
-			u16 w, u16 h);
-void mxc_jpeg_set_config_mode(void __iomem *reg, int config_mode);
-int mxc_jpeg_set_params(struct mxc_jpeg_desc *desc,  u32 bufsize, u16
-			out_pitch, u32 format);
 void mxc_jpeg_set_bufsize(struct mxc_jpeg_desc *desc,  u32 bufsize);
 void mxc_jpeg_set_res(struct mxc_jpeg_desc *desc, u16 w, u16 h);
 void mxc_jpeg_set_line_pitch(struct mxc_jpeg_desc *desc, u32 line_pitch);
 void mxc_jpeg_set_desc(u32 desc, void __iomem *reg, int slot);
 void mxc_jpeg_clr_desc(void __iomem *reg, int slot);
-void mxc_jpeg_set_regs_from_desc(struct mxc_jpeg_desc *desc,
-				 void __iomem *reg);
 #endif
-- 
2.34.1

