Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99118B0F48
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2019 14:58:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731915AbfILM6M (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Sep 2019 08:58:12 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:35312 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731910AbfILM6L (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Sep 2019 08:58:11 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8CCwAqE014047;
        Thu, 12 Sep 2019 07:58:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568293090;
        bh=J/5uW7KRpsUpfSMQlstWDXtrP8QXw05kf78LqIypcQY=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=gVBfHIPoSXdnAiVNs8w8BRYCv6UJogteU4bMHEEJlyb7GdNrqxw7Ca6zFaX6INwCW
         RKSLMC61YFNi4cDiwszOO8L693lAJWPI/gxJm6aZTMpslDtqNrNLSwdY/70OuNp7F7
         UkgYDP7sSd2d90cv+DS9oTIlfqmITlZgTQ1CqNfY=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8CCw9X9103520
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 12 Sep 2019 07:58:10 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 12
 Sep 2019 07:58:09 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 12 Sep 2019 07:58:09 -0500
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8CCw4Zj095654;
        Thu, 12 Sep 2019 07:58:09 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
CC:     Prabhakar Lad <prabhakar.csengg@gmail.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
Subject: [Patch 5/6] media: i2c: ov2659: Fix missing 720p register config
Date:   Thu, 12 Sep 2019 08:00:06 -0500
Message-ID: <20190912130007.4469-6-bparrot@ti.com>
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
index c64f73bef336..fbe624457fbc 100644
--- a/drivers/media/i2c/ov2659.c
+++ b/drivers/media/i2c/ov2659.c
@@ -423,10 +423,14 @@ static struct sensor_register ov2659_720p[] = {
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

