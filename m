Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DFA10EE887
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2019 20:32:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729815AbfKDTcl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Nov 2019 14:32:41 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:47652 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387401AbfKDTc2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Nov 2019 14:32:28 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA4JWRgX000935;
        Mon, 4 Nov 2019 13:32:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1572895947;
        bh=LTpdyqwlmlBN3as2Mlp96uTOs9xNBA7P2xgFNtJQZ6s=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=NuJrTiS3HRI8N9bfMxBe133BOEYETko5p2pgj8KHNA/7rpQrthxywQSTQj/z9Y+Z+
         BaWk3EC4tE5JKgIBEgY0OROUp9Ry4By5FtwS+BAQ1V5byoTboxB7LBgsTIn5Wev4Rh
         W7qRmwvoONcFG72bOjqwpo+cnNKuj/e1xz31uE00=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xA4JWRhD127232
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 4 Nov 2019 13:32:27 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 4 Nov
 2019 13:32:12 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 4 Nov 2019 13:32:12 -0600
Received: from ula0869644.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA4JVmdH096934;
        Mon, 4 Nov 2019 13:32:26 -0600
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
CC:     <linux-media@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Benoit Parrot <bparrot@ti.com>
Subject: [Patch v2 18/20] media: ti-vpe: cal: fix enum_mbus_code/frame_size subdev arguments
Date:   Mon, 4 Nov 2019 13:31:38 -0600
Message-ID: <20191104193140.31145-19-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191104193140.31145-1-bparrot@ti.com>
References: <20191104193140.31145-1-bparrot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Make sure that both enum_mbus_code() and enum_framesize() properly
populate the .which parameter member, otherwise -EINVAL is return
causing the subdev asynchronous registration handshake to fail.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/cal.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index cc5af830fa10..1b3b5438b76a 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -1500,6 +1500,7 @@ static int cal_enum_framesizes(struct file *file, void *fh,
 	fse.index = fsize->index;
 	fse.pad = 0;
 	fse.code = fmt->code;
+	fse.which = V4L2_SUBDEV_FORMAT_ACTIVE;
 
 	ret = v4l2_subdev_call(ctx->sensor, pad, enum_frame_size, NULL, &fse);
 	if (ret)
@@ -1840,6 +1841,7 @@ static int cal_async_bound(struct v4l2_async_notifier *notifier,
 
 		memset(&mbus_code, 0, sizeof(mbus_code));
 		mbus_code.index = j;
+		mbus_code.which = V4L2_SUBDEV_FORMAT_ACTIVE;
 		ret = v4l2_subdev_call(subdev, pad, enum_mbus_code,
 				       NULL, &mbus_code);
 		if (ret)
-- 
2.17.1

