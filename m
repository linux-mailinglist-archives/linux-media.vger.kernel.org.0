Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3364345CAC
	for <lists+linux-media@lfdr.de>; Tue, 23 Mar 2021 12:23:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230287AbhCWLTe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Mar 2021 07:19:34 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:14013 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbhCWLTL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Mar 2021 07:19:11 -0400
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4F4TNQ5x8jzwQ8Z;
        Tue, 23 Mar 2021 19:17:10 +0800 (CST)
Received: from localhost.localdomain (10.175.102.38) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.498.0; Tue, 23 Mar 2021 19:18:59 +0800
From:   'w00385741 <weiyongjun1@huawei.com>
To:     <weiyongjun1@huawei.com>, Mirela Rabulea <mirela.rabulea@nxp.com>,
        "Mauro Carvalho Chehab" <mchehab@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        "Sascha Hauer" <s.hauer@pengutronix.de>
CC:     <linux-media@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <kernel-janitors@vger.kernel.org>, Hulk Robot <hulkci@huawei.com>
Subject: [PATCH -next] media: imx-jpeg: Fix error return code in mxc_jpeg_probe()
Date:   Tue, 23 Mar 2021 11:28:55 +0000
Message-ID: <20210323112855.1016779-1-weiyongjun1@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type:   text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
X-Originating-IP: [10.175.102.38]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Wei Yongjun <weiyongjun1@huawei.com>

Fix to return negative error code from the error handling
case instead of 0, as done elsewhere in this function.

Fixes: 2db16c6ed72c ("media: imx-jpeg: Add V4L2 driver for i.MX8 JPEG Encoder/Decoder")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/media/platform/imx-jpeg/mxc-jpeg.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/imx-jpeg/mxc-jpeg.c
index 2d29558f1864..70b9b61fbf88 100644
--- a/drivers/media/platform/imx-jpeg/mxc-jpeg.c
+++ b/drivers/media/platform/imx-jpeg/mxc-jpeg.c
@@ -2022,12 +2022,14 @@ static int mxc_jpeg_probe(struct platform_device *pdev)
 	jpeg->m2m_dev = v4l2_m2m_init(&mxc_jpeg_m2m_ops);
 	if (IS_ERR(jpeg->m2m_dev)) {
 		dev_err(dev, "failed to register v4l2 device\n");
+		ret = PTR_ERR(jpeg->m2m_dev);
 		goto err_m2m;
 	}
 
 	jpeg->dec_vdev = video_device_alloc();
 	if (!jpeg->dec_vdev) {
 		dev_err(dev, "failed to register v4l2 device\n");
+		ret = -ENOMEM;
 		goto err_vdev_alloc;
 	}
 	if (mode == MXC_JPEG_ENCODE)

