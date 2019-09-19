Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 098C3B8297
	for <lists+linux-media@lfdr.de>; Thu, 19 Sep 2019 22:38:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392612AbfISUiR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Sep 2019 16:38:17 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:34846 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392547AbfISUh7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Sep 2019 16:37:59 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8JKbrtb011397;
        Thu, 19 Sep 2019 15:37:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568925473;
        bh=CrlXIhfT8xsTDmUmEr9Vo9usJitecelkTp/ShJS5Jrc=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=XXwpasjfQAONe77F/174265Xt3n68YsFeXjCN0ik+av0GGxCBYt6qy95dQip8YKzw
         Ww33GWb5QlUmxEJdPK+vs2zqqu2kAIbCXRnCG+lla8qe25bpdoM7kDvZQ8KaIj4hho
         leis+rweavQejPE/TNmgJ7AWDVD891KIF6J8FEH8=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8JKbrkI130715
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 19 Sep 2019 15:37:53 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 19
 Sep 2019 15:37:49 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 19 Sep 2019 15:37:48 -0500
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8JKboc1083029;
        Thu, 19 Sep 2019 15:37:52 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
CC:     Prabhakar Lad <prabhakar.csengg@gmail.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>,
        Jyri Sarha <jsarha@ti.com>
Subject: [Patch v2 2/7] media: i2c: ov2659: Fix sensor detection to actually fail when device is not present
Date:   Thu, 19 Sep 2019 15:39:50 -0500
Message-ID: <20190919203955.15125-3-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190919203955.15125-1-bparrot@ti.com>
References: <20190919203955.15125-1-bparrot@ti.com>
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

