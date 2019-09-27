Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2DE7AC0B99
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2019 20:45:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728501AbfI0SpU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Sep 2019 14:45:20 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:46746 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728477AbfI0SpU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Sep 2019 14:45:20 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8RIjJHu094639;
        Fri, 27 Sep 2019 13:45:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1569609919;
        bh=ZkL2CWEO79hER3mS3ff0HKdkey2wqW3jLAeLx0uw2eg=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=touNx2n6L+JwLcT6CdOQugO8JuR8HZ5dReSQdWFmQjbYFf48XCpgi+fWVZc7hsdcm
         Fg6l+5PiWRTImK57nRQ58Sly/NlogWQagTjdLKxBvmrUozZNgYooLhp7WJRWhCuRKK
         OufN4rmRCEjmwMkoYhHDXCCiFGXeaUy5JT6oZkHQ=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8RIjJPX005512
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 27 Sep 2019 13:45:19 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 27
 Sep 2019 13:45:19 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 27 Sep 2019 13:45:11 -0500
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8RIjEVZ122194;
        Fri, 27 Sep 2019 13:45:18 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
Subject: [Patch v4 4/8] media: i2c: ov2659: fix s_stream return value
Date:   Fri, 27 Sep 2019 13:47:18 -0500
Message-ID: <20190927184722.31989-5-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190927184722.31989-1-bparrot@ti.com>
References: <20190927184722.31989-1-bparrot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In ov2659_s_stream() return value for invoked function should be checked
and propagated.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/i2c/ov2659.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov2659.c b/drivers/media/i2c/ov2659.c
index f77320e8a60d..cd4625432264 100644
--- a/drivers/media/i2c/ov2659.c
+++ b/drivers/media/i2c/ov2659.c
@@ -1187,10 +1187,13 @@ static int ov2659_s_stream(struct v4l2_subdev *sd, int on)
 		goto unlock;
 	}
 
-	ov2659_set_pixel_clock(ov2659);
-	ov2659_set_frame_size(ov2659);
-	ov2659_set_format(ov2659);
-	ov2659_set_streaming(ov2659, 1);
+	ret = ov2659_set_pixel_clock(ov2659);
+	if (!ret)
+		ret = ov2659_set_frame_size(ov2659);
+	if (!ret)
+		ret = ov2659_set_format(ov2659);
+	if (!ret)
+		ov2659_set_streaming(ov2659, 1);
 	ov2659->streaming = on;
 
 unlock:
-- 
2.17.1

