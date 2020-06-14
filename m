Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DC341F8B7A
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2020 02:00:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728107AbgFOAAg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Jun 2020 20:00:36 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33330 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728102AbgFOAAf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Jun 2020 20:00:35 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A1383213F;
        Mon, 15 Jun 2020 02:00:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592179219;
        bh=I1s7PL16oEh+2YxhzZUSdi76+E+57T2kM03l2fUZguI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Uox9IePbKT3hO0er+uINq2EK9sOv6BP3jdmPVUmX1K0/NXBPHNFLYpK9R0O7g5Ap+
         ZVLwGQ+rkbAJlI242ROC16EBAqq3nR4y8uqaJYFvToLZR9GelnjBk5tP+dDh+t2XkJ
         dUKRnxnXq72c+OChcOft6PbiNkT1YBGVHRPXf2aI=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v1 022/107] media: ti-vpe: cal: Remove flags field from struct cal_dev
Date:   Mon, 15 Jun 2020 02:58:19 +0300
Message-Id: <20200614235944.17716-23-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
References: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The cal_dev flags field is a copy of data->flags. Use the latter and
remove the former.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index fcaf186e386b..c5bd9cd4f105 100644
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
@@ -2244,8 +2241,6 @@ static int cal_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	dev->flags = dev->data->flags;
-
 	/* set pseudo v4l2 device name so we can use v4l2_printk */
 	strscpy(dev->v4l2_dev.name, CAL_MODULE_NAME,
 		sizeof(dev->v4l2_dev.name));
@@ -2397,7 +2392,7 @@ static int cal_runtime_resume(struct device *dev)
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

