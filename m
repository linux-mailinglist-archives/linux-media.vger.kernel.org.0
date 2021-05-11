Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0D5437A6FC
	for <lists+linux-media@lfdr.de>; Tue, 11 May 2021 14:44:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231586AbhEKMp5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 May 2021 08:45:57 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:35982 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230315AbhEKMp4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 May 2021 08:45:56 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14BCifrQ033227;
        Tue, 11 May 2021 07:44:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1620737081;
        bh=rnLxLj7u+SRLP5C+EjI1XluTvjiwwG/phu5Ue2Vyc5o=;
        h=From:To:CC:Subject:Date;
        b=WkEK4G8UxDxAtcIk6gW/8aa83MBphi8eovNJOxd/BmA0yF0TP+HSlUoVCHE+FofTu
         b62t2BTWAr9KMCBz9kI61bXVoYBtog5CMUIZe5vgWwmoZZE+9aRsGvFpNkK7/PNw1z
         FQoBZekF+mCmxwkaT5VjoxbSezLL1gaAjWw1tdK4=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14BCifir115752
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 11 May 2021 07:44:41 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 11
 May 2021 07:44:40 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 11 May 2021 07:44:40 -0500
Received: from pratyush-OptiPlex-790.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14BCicYt110487;
        Tue, 11 May 2021 07:44:38 -0500
From:   Pratyush Yadav <p.yadav@ti.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     Pratyush Yadav <p.yadav@ti.com>
Subject: [PATCH] media: i2c: ov5648: Plug runtime pm counter leak
Date:   Tue, 11 May 2021 18:14:37 +0530
Message-ID: <20210511124437.9930-1-p.yadav@ti.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When the stream is being enabled, the runtime pm usage counter is
incremented. Then if ov5648_sw_standby() fails, the function returns
error without decrementing the counter, leaking it.

Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
---

Hi,

I spotted this when converting OV5640 driver to use runtime PM using
this driver as reference. I only have a very surface level understanding
of runtime PM system as of now so please review with that in mind.

This patch is only compile-tested since I don't have the hardware with
me.

 drivers/media/i2c/ov5648.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov5648.c b/drivers/media/i2c/ov5648.c
index 3ecb4a3e8773..6aa2c950f505 100644
--- a/drivers/media/i2c/ov5648.c
+++ b/drivers/media/i2c/ov5648.c
@@ -2143,8 +2143,12 @@ static int ov5648_s_stream(struct v4l2_subdev *subdev, int enable)
 	ret = ov5648_sw_standby(sensor, !enable);
 	mutex_unlock(&sensor->mutex);

-	if (ret)
+	if (ret) {
+		if (enable)
+			pm_runtime_put(sensor->dev);
+
 		return ret;
+	}

 	state->streaming = !!enable;

--
2.30.0

