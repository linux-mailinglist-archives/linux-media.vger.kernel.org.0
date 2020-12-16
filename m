Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32D352DC123
	for <lists+linux-media@lfdr.de>; Wed, 16 Dec 2020 14:23:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726350AbgLPNWa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Dec 2020 08:22:30 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:10047 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726333AbgLPNW3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Dec 2020 08:22:29 -0500
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Cwwk22H1dzM3x2;
        Wed, 16 Dec 2020 21:20:58 +0800 (CST)
Received: from ubuntu.network (10.175.138.68) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.498.0; Wed, 16 Dec 2020 21:21:40 +0800
From:   Zheng Yongjun <zhengyongjun3@huawei.com>
To:     <mripard@kernel.org>, <mchehab@kernel.org>, <wens@csie.org>,
        <jernej.skrabec@siol.net>, <linux-media@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
CC:     Zheng Yongjun <zhengyongjun3@huawei.com>
Subject: [PATCH -next] media/platform/sunxi: convert comma to semicolon
Date:   Wed, 16 Dec 2020 21:22:12 +0800
Message-ID: <20201216132212.15152-1-zhengyongjun3@huawei.com>
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
 drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c b/drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c
index 8f4e254b6a41..1a2f65d83a6c 100644
--- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c
+++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c
@@ -363,7 +363,7 @@ int sun4i_csi_v4l2_register(struct sun4i_csi *csi)
 	vdev->lock = &csi->lock;
 
 	/* Set a default format */
-	csi->fmt.pixelformat = sun4i_csi_formats[0].fourcc,
+	csi->fmt.pixelformat = sun4i_csi_formats[0].fourcc;
 	csi->fmt.width = CSI_DEFAULT_WIDTH;
 	csi->fmt.height = CSI_DEFAULT_HEIGHT;
 	_sun4i_csi_try_fmt(csi, &csi->fmt);
-- 
2.22.0

