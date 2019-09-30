Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 160D0C214D
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2019 15:04:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731267AbfI3NEr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Sep 2019 09:04:47 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:46414 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731233AbfI3NEo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Sep 2019 09:04:44 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8UD4cFB110324;
        Mon, 30 Sep 2019 08:04:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1569848678;
        bh=Xr4HzhjJUkeC5JJjlQ95EiC6/pbo6PahDZ4riJBggtk=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=ePIF9i8Bihsex48yuU/TfyJVX1tAuTUjrzw1jj7vX4NvefKpexCruG0ria2HSXSKX
         0CRIofmT/IzRoe28DqZgLxTOV1pMoQdTKLtZ3uNppum4+0/78UY6X5WO/zdKIRzTXv
         BC9LmrnaIUaujT9/eQQD7bNbfVv4vjiKntwlIFWU=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8UD4cZI057422;
        Mon, 30 Sep 2019 08:04:38 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 30
 Sep 2019 08:04:28 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 30 Sep 2019 08:04:28 -0500
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8UD4Zih115624;
        Mon, 30 Sep 2019 08:04:38 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>,
        Jyri Sarha <jsarha@ti.com>
Subject: [Patch v5 2/8] media: i2c: ov2659: Fix sensor detection to actually fail when device is not present
Date:   Mon, 30 Sep 2019 08:06:38 -0500
Message-ID: <20190930130644.8704-3-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190930130644.8704-1-bparrot@ti.com>
References: <20190930130644.8704-1-bparrot@ti.com>
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
Acked-by: Lad, Prabhakar <prabhakar.csengg@gmail.com>
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

