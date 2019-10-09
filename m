Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 76D06D0EDC
	for <lists+linux-media@lfdr.de>; Wed,  9 Oct 2019 14:34:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731212AbfJIMdN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Oct 2019 08:33:13 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:43882 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727029AbfJIMdN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Oct 2019 08:33:13 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x99CWdd4083942;
        Wed, 9 Oct 2019 07:32:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570624359;
        bh=HZi+rs8ENuxYEE6OvcFdO/MHKKRliGPvQQJaNf0P2po=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=lG7epsJZ7VnxXSzC9rXBqAj1i7IwdGidpmrbCmcq6gh+e6CBpJisVwkMxcp8tIGLU
         TjwEAvSJMYhd6JU2uIMAIboOGnVAh6wR+DvleYxxbH2vcvqeqmxivLnB16BjH1JUGF
         CEz0oBTylFjAecKHEtFqBy1e6mZF3xEO8TZ0SAPg=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x99CWdsI068779
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 9 Oct 2019 07:32:39 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 9 Oct
 2019 07:32:36 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 9 Oct 2019 07:32:36 -0500
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x99CWbNR081004;
        Wed, 9 Oct 2019 07:32:39 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil@xs4all.nl>
CC:     Jacopo Mondi <jacopo@jmondi.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Benoit Parrot <bparrot@ti.com>
Subject: [Patch v4 2/3] media: ov5640: Fix 1920x1080 mode to remove extra enable/disable
Date:   Wed, 9 Oct 2019 07:35:09 -0500
Message-ID: <20191009123510.19106-3-bparrot@ti.com>
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

In the 1920x1080 register array an extra pair of reset ctrl disable
re-enable was causing unwanted init delays.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/i2c/ov5640.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index b93b61baace5..065c9b61ecbd 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -490,7 +490,6 @@ static const struct reg_value ov5640_setting_720P_1280_720[] = {
 };
 
 static const struct reg_value ov5640_setting_1080P_1920_1080[] = {
-	{0x3008, 0x42, 0, 0},
 	{0x3c07, 0x08, 0, 0},
 	{0x3c09, 0x1c, 0, 0}, {0x3c0a, 0x9c, 0, 0}, {0x3c0b, 0x40, 0, 0},
 	{0x3814, 0x11, 0, 0},
@@ -518,7 +517,7 @@ static const struct reg_value ov5640_setting_1080P_1920_1080[] = {
 	{0x3a0e, 0x03, 0, 0}, {0x3a0d, 0x04, 0, 0}, {0x3a14, 0x04, 0, 0},
 	{0x3a15, 0x60, 0, 0}, {0x4407, 0x04, 0, 0},
 	{0x460b, 0x37, 0, 0}, {0x460c, 0x20, 0, 0}, {0x3824, 0x04, 0, 0},
-	{0x4005, 0x1a, 0, 0}, {0x3008, 0x02, 0, 0},
+	{0x4005, 0x1a, 0, 0},
 };
 
 static const struct reg_value ov5640_setting_QSXGA_2592_1944[] = {
-- 
2.17.1

