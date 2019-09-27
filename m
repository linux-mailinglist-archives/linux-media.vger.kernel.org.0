Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ECDCBC0B49
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2019 20:35:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728325AbfI0Sfk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Sep 2019 14:35:40 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:57772 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728318AbfI0Sew (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Sep 2019 14:34:52 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8RIYpuY091568;
        Fri, 27 Sep 2019 13:34:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1569609291;
        bh=Wl9WKWiVjz3COoBDC8m081M/+rt6QZlNL6nsfzMtwNE=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=lRuDwH5d+t303JqA+BBs3d/Y2v+ANd4HRggwKL+aQYMN8zfVhpqNzQM9WBlnZY36K
         WGUO3ur5fvo+OsZmnUW1oHfmgzCp/TNny2f4+kPZg/NXxrxCQqJp/Uhhw/R7F9gauu
         PCVfns8O5sCjk466AyIVM8fXK5BvtYmbfxPENpLM=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8RIYp0O054096
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 27 Sep 2019 13:34:51 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 27
 Sep 2019 13:34:42 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 27 Sep 2019 13:34:50 -0500
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8RIYgbw073031;
        Fri, 27 Sep 2019 13:34:50 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
Subject: [Patch 09/16] media: ti-vpe: vpe: Make sure YUYV is set as default format
Date:   Fri, 27 Sep 2019 13:36:43 -0500
Message-ID: <20190927183650.31345-10-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190927183650.31345-1-bparrot@ti.com>
References: <20190927183650.31345-1-bparrot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

v4l2-compliance fails with this message:

   fail: v4l2-test-formats.cpp(672): \
	Video Capture Multiplanar: TRY_FMT(G_FMT) != G_FMT
   fail: v4l2-test-formats.cpp(672): \
	Video Output Multiplanar: TRY_FMT(G_FMT) != G_FMT
	...
   test VIDIOC_TRY_FMT: FAIL

Fixes: 94ed726e8e01 ("media: ti-vpe: Add support for NV21 format")

The default pixel format was setup as pointing to a specific offset in
the vpe_formats table assuming it was pointing to the V4L2_PIX_FMT_YUYV
entry. This became false after the addition on the NV21 format (see
above commid-id)

So instead of hard-coding an offset which might change over time we need
to use a lookup helper instead so we know the default will always be what
we intended.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 drivers/media/platform/ti-vpe/vpe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/ti-vpe/vpe.c b/drivers/media/platform/ti-vpe/vpe.c
index d3f1ae8b72fa..7aa83026fb6c 100644
--- a/drivers/media/platform/ti-vpe/vpe.c
+++ b/drivers/media/platform/ti-vpe/vpe.c
@@ -2321,7 +2321,7 @@ static int vpe_open(struct file *file)
 	v4l2_ctrl_handler_setup(hdl);
 
 	s_q_data = &ctx->q_data[Q_DATA_SRC];
-	s_q_data->fmt = &vpe_formats[2];
+	s_q_data->fmt = __find_format(V4L2_PIX_FMT_YUYV);
 	s_q_data->width = 1920;
 	s_q_data->height = 1080;
 	s_q_data->nplanes = 1;
-- 
2.17.1

