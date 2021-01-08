Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81CDB2EEF6C
	for <lists+linux-media@lfdr.de>; Fri,  8 Jan 2021 10:23:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728234AbhAHJWj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Jan 2021 04:22:39 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:10410 "EHLO
        szxga07-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728183AbhAHJWi (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Jan 2021 04:22:38 -0500
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4DByJV33Vsz7Rs7;
        Fri,  8 Jan 2021 17:20:58 +0800 (CST)
Received: from ubuntu.network (10.175.138.68) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.498.0; Fri, 8 Jan 2021 17:21:46 +0800
From:   Zheng Yongjun <zhengyongjun3@huawei.com>
To:     <ezequiel@collabora.com>, <p.zabel@pengutronix.de>,
        <mchehab@kernel.org>, <linux-media@vger.kernel.org>,
        <linux-rockchip@lists.infradead.org>, <devel@driverdev.osuosl.org>,
        <linux-kernel@vger.kernel.org>
CC:     <gregkh@linuxfoundation.org>,
        Zheng Yongjun <zhengyongjun3@huawei.com>
Subject: [PATCH v2 -next] media: hantro: convert comma to semicolon
Date:   Fri, 8 Jan 2021 17:22:30 +0800
Message-ID: <20210108092230.18782-1-zhengyongjun3@huawei.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.138.68]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Replace a comma between expression statements by a semicolon.

Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
---
 drivers/staging/media/hantro/hantro_v4l2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/hantro/hantro_v4l2.c b/drivers/staging/media/hantro/hantro_v4l2.c
index b668a82d40ad..e1081c16f56a 100644
--- a/drivers/staging/media/hantro/hantro_v4l2.c
+++ b/drivers/staging/media/hantro/hantro_v4l2.c
@@ -316,7 +316,7 @@ hantro_reset_fmt(struct v4l2_pix_format_mplane *fmt,
 
 	fmt->pixelformat = vpu_fmt->fourcc;
 	fmt->field = V4L2_FIELD_NONE;
-	fmt->colorspace = V4L2_COLORSPACE_JPEG,
+	fmt->colorspace = V4L2_COLORSPACE_JPEG;
 	fmt->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
 	fmt->quantization = V4L2_QUANTIZATION_DEFAULT;
 	fmt->xfer_func = V4L2_XFER_FUNC_DEFAULT;
-- 
2.22.0

