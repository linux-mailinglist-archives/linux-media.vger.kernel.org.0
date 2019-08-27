Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 66BAD9DE66
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2019 09:07:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727999AbfH0HH3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Aug 2019 03:07:29 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:46918 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725943AbfH0HH3 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Aug 2019 03:07:29 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 25C7EF52D139BD0B3CB4;
        Tue, 27 Aug 2019 15:07:27 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.439.0; Tue, 27 Aug 2019
 15:07:20 +0800
From:   YueHaibing <yuehaibing@huawei.com>
To:     <mripard@kernel.org>, <mchehab@kernel.org>, <wens@csie.org>,
        <maxime.ripard@bootlin.com>, <sakari.ailus@linux.intel.com>
CC:     <linux-media@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next] media: sun6i: Make sun4i_csi_formats static
Date:   Tue, 27 Aug 2019 15:06:23 +0800
Message-ID: <20190827070623.15776-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix sparse warning:

drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c:21:31:
 warning: symbol 'sun4i_csi_formats' was not declared. Should it be static?

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c b/drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c
index 772b0fc..83a3a02 100644
--- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c
+++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c
@@ -18,7 +18,7 @@
 #define CSI_DEFAULT_WIDTH	640
 #define CSI_DEFAULT_HEIGHT	480
 
-const struct sun4i_csi_format sun4i_csi_formats[] = {
+static const struct sun4i_csi_format sun4i_csi_formats[] = {
 	/* YUV422 inputs */
 	{
 		.mbus		= MEDIA_BUS_FMT_YUYV8_2X8,
-- 
2.7.4


