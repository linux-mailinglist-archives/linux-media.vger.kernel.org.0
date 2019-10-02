Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C4DC0C8A2F
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2019 15:49:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728107AbfJBNtc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Oct 2019 09:49:32 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:32894 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728102AbfJBNta (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Oct 2019 09:49:30 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x92DnTMF033263;
        Wed, 2 Oct 2019 08:49:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570024169;
        bh=Lsv3CynxT1kV96mwsveg3FYq/dwgSUzVOlWSLR+kDp4=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=Qm4K/ER6s05wyTEK7fEU8sYbKvDDg+dk7DWbGLlgjP1wKxr1mSI6DelBSWMPH7x1u
         WkbQzn8wtzGiWFCZxJLOqOZ/TwEBipO4DLVn1qRrSX5MHNVr3LMn/fRHkTjgJ8rmJP
         WgDS7yRbOPNnf/LyrKZA3Zdf45l9XexbcDmJFTY0=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x92DnTF9120706
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 2 Oct 2019 08:49:29 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 2 Oct
 2019 08:49:18 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 2 Oct 2019 08:49:18 -0500
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x92DnOmB035733;
        Wed, 2 Oct 2019 08:49:28 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
Subject: [Patch v2 3/3] media: ov5640: Make 2592x1944 mode only available at 15 fps
Date:   Wed, 2 Oct 2019 08:51:34 -0500
Message-ID: <20191002135134.12273-4-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191002135134.12273-1-bparrot@ti.com>
References: <20191002135134.12273-1-bparrot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The sensor data sheet clearly state that 2592x1944 only works at 15 fps
make sure we don't try to miss configure the pll out of acceptable
range.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/i2c/ov5640.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 103a4e8f88e1..d5b0be2c7a0a 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -1613,6 +1613,11 @@ ov5640_find_mode(struct ov5640_dev *sensor, enum ov5640_frame_rate fr,
 	    !(mode->hact == 640 && mode->vact == 480))
 		return NULL;
 
+	/* 2592x1944 only works at 15fps */
+	if (fr != OV5640_15_FPS &&
+	    (mode->hact == 2592 && mode->vact == 1944))
+		return NULL;
+
 	return mode;
 }
 
-- 
2.17.1

