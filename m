Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 55476BCCD2
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2019 18:43:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404296AbfIXQmV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Sep 2019 12:42:21 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:46972 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403972AbfIXQmU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Sep 2019 12:42:20 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8OGgHVf064244;
        Tue, 24 Sep 2019 11:42:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1569343337;
        bh=CrlXIhfT8xsTDmUmEr9Vo9usJitecelkTp/ShJS5Jrc=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=ya6PGwhL0OIY9ijNTBjXKklkJzo8ly5GYJyuSbdi20o+btsEUWWeYgaMwuuxdHONL
         W9f8mErcpbOY8nykgzs5D3em1+5fBK5GU98ds+nDEal76ltOJNBwzaJ72Kel5Kzm73
         qJ248985Pb0KXZfxsNNckHyIKwxZmbpdbA0TQVo0=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8OGgH50048832
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 24 Sep 2019 11:42:17 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 24
 Sep 2019 11:42:10 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 24 Sep 2019 11:42:10 -0500
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8OGgCQU073229;
        Tue, 24 Sep 2019 11:42:16 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
CC:     Prabhakar Lad <prabhakar.csengg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>,
        Jyri Sarha <jsarha@ti.com>
Subject: [Patch v3 2/8] media: i2c: ov2659: Fix sensor detection to actually fail when device is not present
Date:   Tue, 24 Sep 2019 11:44:08 -0500
Message-ID: <20190924164414.21897-3-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190924164414.21897-1-bparrot@ti.com>
References: <20190924164414.21897-1-bparrot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Make sure that if the expected sensor device id register
is not recognized properly the failure is propagated
up so devices are not left partially initialized.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
Signed-off-by: Jyri Sarha <jsarha@ti.com>
---
 drivers/media/i2c/ov2659.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov2659.c b/drivers/media/i2c/ov2659.c
index 17573257097d..efbe6dc720e2 100644
--- a/drivers/media/i2c/ov2659.c
+++ b/drivers/media/i2c/ov2659.c
@@ -1330,11 +1330,12 @@ static int ov2659_detect(struct v4l2_subdev *sd)
 		unsigned short id;
 
 		id = OV265X_ID(pid, ver);
-		if (id != OV2659_ID)
+		if (id != OV2659_ID) {
 			dev_err(&client->dev,
 				"Sensor detection failed (%04X, %d)\n",
 				id, ret);
-		else {
+			ret = -ENODEV;
+		} else {
 			dev_info(&client->dev, "Found OV%04X sensor\n", id);
 			ret = ov2659_init(sd, 0);
 		}
-- 
2.17.1

