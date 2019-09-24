Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 01B28BD022
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2019 19:08:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409794AbfIXQm3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Sep 2019 12:42:29 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:50540 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405867AbfIXQm1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Sep 2019 12:42:27 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8OGgOff069325;
        Tue, 24 Sep 2019 11:42:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1569343344;
        bh=K7lDNtUuO5vpQIbYTqcQ/9ho+gI4TbiTgMLfOPWETG0=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=dW+YhmmPJnAkKdSdm2981TRlBsaVccrclDydSXt44NghdY12Si32jKyNwpD1eQY+5
         hGLkl39o2IxPdODAtXhsVaZU78NGc36W4P73GB7gJHXmbQ2FxX6oT7L7x+eScvWjjP
         87ddwsfgmb7fZJZczPQWutJTitMfQQSSEoXh6cpU=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8OGgOfC122076;
        Tue, 24 Sep 2019 11:42:24 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 24
 Sep 2019 11:42:18 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 24 Sep 2019 11:42:24 -0500
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8OGgCQZ073229;
        Tue, 24 Sep 2019 11:42:24 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
CC:     Prabhakar Lad <prabhakar.csengg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
Subject: [Patch v3 7/8] media: i2c: ov2659: Fix missing 720p register config
Date:   Tue, 24 Sep 2019 11:44:13 -0500
Message-ID: <20190924164414.21897-8-bparrot@ti.com>
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

The initial registers sequence is only loaded at probe
time. Afterward only the resolution and format specific
register are modified. Care must be taken to make sure
registers modified by one resolution setting are reverted
back when another resolution is programmed.

This was not done properly for the 720p case.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/i2c/ov2659.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/i2c/ov2659.c b/drivers/media/i2c/ov2659.c
index 0e026b810de5..23f161fd69bb 100644
--- a/drivers/media/i2c/ov2659.c
+++ b/drivers/media/i2c/ov2659.c
@@ -412,10 +412,14 @@ static struct sensor_register ov2659_720p[] = {
 	{ REG_TIMING_YINC, 0x11 },
 	{ REG_TIMING_VERT_FORMAT, 0x80 },
 	{ REG_TIMING_HORIZ_FORMAT, 0x00 },
+	{ 0x370a, 0x12 },
 	{ 0x3a03, 0xe8 },
 	{ 0x3a09, 0x6f },
 	{ 0x3a0b, 0x5d },
 	{ 0x3a15, 0x9a },
+	{ REG_VFIFO_READ_START_H, 0x00 },
+	{ REG_VFIFO_READ_START_L, 0x80 },
+	{ REG_ISP_CTRL02, 0x00 },
 	{ REG_NULL, 0x00 },
 };
 
-- 
2.17.1

