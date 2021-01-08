Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DD702EEF65
	for <lists+linux-media@lfdr.de>; Fri,  8 Jan 2021 10:21:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728169AbhAHJVo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Jan 2021 04:21:44 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:10044 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727529AbhAHJVn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Jan 2021 04:21:43 -0500
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DByHT2cqpzj5V8;
        Fri,  8 Jan 2021 17:20:05 +0800 (CST)
Received: from ubuntu.network (10.175.138.68) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.498.0; Fri, 8 Jan 2021 17:20:51 +0800
From:   Zheng Yongjun <zhengyongjun3@huawei.com>
To:     <mchehab@kernel.org>, <linux-media@vger.kernel.org>,
        <devel@driverdev.osuosl.org>, <linux-kernel@vger.kernel.org>
CC:     <sakari.ailus@linux.intel.com>, <gregkh@linuxfoundation.org>,
        "Zheng Yongjun" <zhengyongjun3@huawei.com>
Subject: [PATCH v2 -next] media: atomisp: convert comma to semicolon
Date:   Fri, 8 Jan 2021 17:21:35 +0800
Message-ID: <20210108092135.18706-1-zhengyongjun3@huawei.com>
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
 drivers/staging/media/atomisp/pci/sh_css_params.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_params.c b/drivers/staging/media/atomisp/pci/sh_css_params.c
index 24fc497bd491..9fad28b97201 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_params.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_params.c
@@ -949,7 +949,7 @@ sh_css_set_black_frame(struct ia_css_stream *stream,
 
 	params = stream->isp_params_configs;
 	height = raw_black_frame->info.res.height;
-	width = raw_black_frame->info.padded_width,
+	width = raw_black_frame->info.padded_width;
 
 	ptr = raw_black_frame->data
 	+ raw_black_frame->planes.raw.offset;
@@ -1442,8 +1442,8 @@ static int sh_css_params_default_morph_table(
 
 	IA_CSS_ENTER_PRIVATE("");
 
-	step = (ISP_VEC_NELEMS / 16) * 128,
-	width = binary->morph_tbl_width,
+	step = (ISP_VEC_NELEMS / 16) * 128;
+	width = binary->morph_tbl_width;
 	height = binary->morph_tbl_height;
 
 	tab = ia_css_morph_table_allocate(width, height);
-- 
2.22.0

