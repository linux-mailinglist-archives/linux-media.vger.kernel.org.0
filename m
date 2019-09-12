Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 26DE8B0F43
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2019 14:58:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731882AbfILM6J (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Sep 2019 08:58:09 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:38566 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731772AbfILM6I (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Sep 2019 08:58:08 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8CCw7TD042544;
        Thu, 12 Sep 2019 07:58:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568293087;
        bh=CrlXIhfT8xsTDmUmEr9Vo9usJitecelkTp/ShJS5Jrc=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=FCs5YVDdwMjvzmLbuAJ8onj1lCG3H8rgu7IfOcBvbSIRmSroPKTifJJQaFgg/exWv
         KE5bphx07HB9FwBXyn132v0rWsI1kOmY8ZmGLbuRsdIB7cxCkN3z3exGkTwjI3N+nb
         Ud2Q9bNWgooCZI+ti7xLdUPnzjy+Fl3j4UQCFTo0=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8CCw7V2033470;
        Thu, 12 Sep 2019 07:58:07 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 12
 Sep 2019 07:58:06 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 12 Sep 2019 07:58:06 -0500
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8CCw4Zg095654;
        Thu, 12 Sep 2019 07:58:06 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
CC:     Prabhakar Lad <prabhakar.csengg@gmail.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>,
        Jyri Sarha <jsarha@ti.com>
Subject: [Patch 2/6] media: i2c: ov2659: Fix sensor detection to actually fail when device is not present
Date:   Thu, 12 Sep 2019 08:00:03 -0500
Message-ID: <20190912130007.4469-3-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190912130007.4469-1-bparrot@ti.com>
References: <20190912130007.4469-1-bparrot@ti.com>
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

