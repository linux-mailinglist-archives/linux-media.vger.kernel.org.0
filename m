Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 762B4215E85
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2020 20:38:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729892AbgGFShs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jul 2020 14:37:48 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45202 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729882AbgGFShs (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jul 2020 14:37:48 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7109C1959;
        Mon,  6 Jul 2020 20:37:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594060663;
        bh=swcxRnQOLhqiV0DECWLZ5aTqovlI8V9rpzd5gpzSzYo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=IQ8LSpPFNxN1VqSizNCKNLmNBxibNJ11+pbwUE2XCJ2T5UTjeObJgzbXfXDX1RSqj
         gKQZCzrRHRO625PkBIYI3KmICTETzq26rGBt9Pk8JQvyUpc+oPjIinup00A/ipLaL4
         0uoU7ktRuk8RiomsObhYTDCxrPAirZW7ceqMSGIc=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v2 022/108] media: ti-vpe: cal: Remove flags field from struct cal_dev
Date:   Mon,  6 Jul 2020 21:35:43 +0300
Message-Id: <20200706183709.12238-23-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
References: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The cal_dev flags field is a copy of data->flags. Use the latter and
remove the former.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/cal.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 89f6fd2e1300..d04caa4fa9cf 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -326,9 +326,6 @@ struct cal_dev {
 	struct platform_device	*pdev;
 	struct v4l2_device	v4l2_dev;
 
-	/* Controller flags for special cases */
-	unsigned int		flags;
-
 	const struct cal_data	*data;
 
 	/* Control Module handle */
@@ -2249,8 +2246,6 @@ static int cal_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	dev->flags = dev->data->flags;
-
 	/* set pseudo v4l2 device name so we can use v4l2_printk */
 	strscpy(dev->v4l2_dev.name, CAL_MODULE_NAME,
 		sizeof(dev->v4l2_dev.name));
@@ -2402,7 +2397,7 @@ static int cal_runtime_resume(struct device *dev)
 {
 	struct cal_dev *caldev = dev_get_drvdata(dev);
 
-	if (caldev->flags & DRA72_CAL_PRE_ES2_LDO_DISABLE) {
+	if (caldev->data->flags & DRA72_CAL_PRE_ES2_LDO_DISABLE) {
 		/*
 		 * Apply errata on both port everytime we (re-)enable
 		 * the clock
-- 
Regards,

Laurent Pinchart

