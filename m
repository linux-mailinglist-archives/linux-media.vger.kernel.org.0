Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A743345CAE
	for <lists+linux-media@lfdr.de>; Tue, 23 Mar 2021 12:23:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230341AbhCWLTf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Mar 2021 07:19:35 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:14071 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229728AbhCWLTU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Mar 2021 07:19:20 -0400
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4F4TMz4vT1zPkxX;
        Tue, 23 Mar 2021 19:16:47 +0800 (CST)
Received: from localhost.localdomain (10.175.102.38) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.498.0; Tue, 23 Mar 2021 19:19:07 +0800
From:   'w00385741 <weiyongjun1@huawei.com>
To:     <weiyongjun1@huawei.com>, Mirela Rabulea <mirela.rabulea@nxp.com>,
        "Mauro Carvalho Chehab" <mchehab@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        "Sascha Hauer" <s.hauer@pengutronix.de>
CC:     <linux-media@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <kernel-janitors@vger.kernel.org>, Hulk Robot <hulkci@huawei.com>
Subject: [PATCH -next] media: imx-jpeg: Fix return value check in mxc_jpeg_attach_pm_domains()
Date:   Tue, 23 Mar 2021 11:29:03 +0000
Message-ID: <20210323112903.1016831-1-weiyongjun1@huawei.com>
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

In case of error, the function device_link_add() returns NULL
pointer not ERR_PTR(). The IS_ERR() test in the return value
check should be replaced with NULL test.

Fixes: 2db16c6ed72c ("media: imx-jpeg: Add V4L2 driver for i.MX8 JPEG Encoder/Decoder")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/media/platform/imx-jpeg/mxc-jpeg.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/imx-jpeg/mxc-jpeg.c
index 2d29558f1864..9509eb9d939a 100644
--- a/drivers/media/platform/imx-jpeg/mxc-jpeg.c
+++ b/drivers/media/platform/imx-jpeg/mxc-jpeg.c
@@ -1943,8 +1943,8 @@ static int mxc_jpeg_attach_pm_domains(struct mxc_jpeg_dev *jpeg)
 						   DL_FLAG_STATELESS |
 						   DL_FLAG_PM_RUNTIME |
 						   DL_FLAG_RPM_ACTIVE);
-		if (IS_ERR(jpeg->pd_link[i])) {
-			ret = PTR_ERR(jpeg->pd_link[i]);
+		if (!jpeg->pd_link[i]) {
+			ret = -EINVAL;
 			goto fail;
 		}
 	}

