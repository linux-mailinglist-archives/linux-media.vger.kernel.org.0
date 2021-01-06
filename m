Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 152A72EBE6E
	for <lists+linux-media@lfdr.de>; Wed,  6 Jan 2021 14:18:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726610AbhAFNR5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Jan 2021 08:17:57 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:9958 "EHLO
        szxga06-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726590AbhAFNR4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Jan 2021 08:17:56 -0500
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4D9qdB1wWkzhvnK;
        Wed,  6 Jan 2021 21:16:30 +0800 (CST)
Received: from ubuntu.network (10.175.138.68) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.498.0; Wed, 6 Jan 2021 21:17:08 +0800
From:   Zheng Yongjun <zhengyongjun3@huawei.com>
To:     <mchehab@kernel.org>, <linux-media@vger.kernel.org>,
        <devel@driverdev.osuosl.org>, <linux-kernel@vger.kernel.org>
CC:     <sakari.ailus@linux.intel.com>, <gregkh@linuxfoundation.org>,
        "Zheng Yongjun" <zhengyongjun3@huawei.com>
Subject: [PATCH -next] media: atomisp: use resource_size
Date:   Wed, 6 Jan 2021 21:17:37 +0800
Message-ID: <20210106131737.32571-1-zhengyongjun3@huawei.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.138.68]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use resource_size rather than a verbose computation on
the end and start fields.

Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
---
 drivers/staging/media/atomisp/pci/sh_css_params.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_params.c b/drivers/staging/media/atomisp/pci/sh_css_params.c
index 24fc497bd491..4a02948e5612 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_params.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_params.c
@@ -949,7 +949,7 @@ sh_css_set_black_frame(struct ia_css_stream *stream,
 
 	params = stream->isp_params_configs;
 	height = raw_black_frame->info.res.height;
-	width = raw_black_frame->info.padded_width,
+	width = raw_black_frame->info.padded_width;
 
 	ptr = raw_black_frame->data
 	+ raw_black_frame->planes.raw.offset;
@@ -1443,7 +1443,7 @@ static int sh_css_params_default_morph_table(
 	IA_CSS_ENTER_PRIVATE("");
 
 	step = (ISP_VEC_NELEMS / 16) * 128,
-	width = binary->morph_tbl_width,
+	width = binary->morph_tbl_width;
 	height = binary->morph_tbl_height;
 
 	tab = ia_css_morph_table_allocate(width, height);
-- 
2.22.0

