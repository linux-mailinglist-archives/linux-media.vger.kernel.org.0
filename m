Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3ED67DC8B8
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2019 17:34:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2505142AbfJRPch (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Oct 2019 11:32:37 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:47732 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727211AbfJRPc1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Oct 2019 11:32:27 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9IFWP6X013435;
        Fri, 18 Oct 2019 10:32:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1571412746;
        bh=ADM1me0Put+VJ63c2ujPwgjbNLqYMOSh7Lbu/rGYcTk=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=I2LPEQU1bV7hd/Y2BmrBbXZUgz2+102padDSO4mPjDrrBI+GS50K/sLkSVpslCCrZ
         m+m8fU1NW0z7WANwRs/aLsr1QGnY6PKOwzFtQ/BYKDqNZZDByscZDe4aSCVbbCXXvr
         MmkXDvvLVYJwXMEVJ1tL+4Y+ZlThAQkaZhI11q6A=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9IFWPZY113363
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 18 Oct 2019 10:32:26 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 18
 Oct 2019 10:32:17 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 18 Oct 2019 10:32:17 -0500
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9IFW15W080266;
        Fri, 18 Oct 2019 10:32:25 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>, Rob Herring <robh+dt@kernel.org>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
Subject: [Patch 18/19] media: ti-vpe: cal: fix enum_mbus_code/frame_size subdev arguments
Date:   Fri, 18 Oct 2019 10:34:36 -0500
Message-ID: <20191018153437.20614-19-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191018153437.20614-1-bparrot@ti.com>
References: <20191018153437.20614-1-bparrot@ti.com>
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
index b55987ee70dd..6a404350edb3 100644
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

