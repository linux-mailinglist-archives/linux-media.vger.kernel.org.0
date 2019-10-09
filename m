Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 376ABD0ED7
	for <lists+linux-media@lfdr.de>; Wed,  9 Oct 2019 14:33:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730933AbfJIMc7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Oct 2019 08:32:59 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:43818 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727029AbfJIMc7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Oct 2019 08:32:59 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x99CWfZZ083947;
        Wed, 9 Oct 2019 07:32:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570624361;
        bh=wy74BV+gADxjYq84q/3icEqfPmppjgnaKhtU7G9oYJM=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=yuh5FDLTaWIkFnM/ECeh1Gucupgc11l0TsYvbWxZxIrVMv/ua5k3ONVZoGs4CTwRS
         3Mq04p2jAnku+Djw/x8Y6NjxtbwjwlN+fgHc6TTBVTQklkEeaTMQH8ShUL5vmrFPg4
         gaONubkEn9so8UAclt9I6Rtuymp0Hg9Kh4DNI1Fw=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x99CWf4p090522
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 9 Oct 2019 07:32:41 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 9 Oct
 2019 07:32:37 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 9 Oct 2019 07:32:37 -0500
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x99CWbNS081004;
        Wed, 9 Oct 2019 07:32:40 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil@xs4all.nl>
CC:     Jacopo Mondi <jacopo@jmondi.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Benoit Parrot <bparrot@ti.com>
Subject: [Patch v4 3/3] media: ov5640: Make 2592x1944 mode only available at 15 fps
Date:   Wed, 9 Oct 2019 07:35:10 -0500
Message-ID: <20191009123510.19106-4-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191009123510.19106-1-bparrot@ti.com>
References: <20191009123510.19106-1-bparrot@ti.com>
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
Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/i2c/ov5640.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 065c9b61ecbd..5e495c833d32 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -1611,6 +1611,11 @@ ov5640_find_mode(struct ov5640_dev *sensor, enum ov5640_frame_rate fr,
 	    !(mode->hact == 640 && mode->vact == 480))
 		return NULL;
 
+	/* 2592x1944 only works at 15fps max */
+	if ((mode->hact == 2592 && mode->vact == 1944) &&
+	    fr > OV5640_15_FPS)
+		return NULL;
+
 	return mode;
 }
 
-- 
2.17.1

