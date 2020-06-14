Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 386BF1F8B92
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2020 02:01:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728148AbgFOABC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Jun 2020 20:01:02 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33340 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728140AbgFOABB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Jun 2020 20:01:01 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1224F214C;
        Mon, 15 Jun 2020 02:00:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592179229;
        bh=cJHRFlSxS1hopr/mnF10EtNbEzq5V9ILz4o5cQCXJns=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=UMCpX8jvDQCp3CtD8RtH2TRd22VVJ6OFOsoUos+1e3MAfzKeV1nMaPYbYUaIv2R7U
         ztW6EOFLe84lNfcl2UWqGNzFZ45iKoCG80SXLRyQmhWlI9lwR3RwEUpMAPDBh80Msv
         NN2Ge1/q3+imHKKxyQZZOwMi8qN2ynCt4E6xpDGo=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v1 042/107] media: ti-vpe: cal: Drop struct cal_dev v4l2_dev field
Date:   Mon, 15 Jun 2020 02:58:39 +0300
Message-Id: <20200614235944.17716-43-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
References: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The v4l2_dev field of the cal_dev structure is initialized but never
used. Drop it.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 681e846eb236..479ea9337f30 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -278,7 +278,6 @@ struct cal_dev {
 	void __iomem		*base;
 	struct resource		*res;
 	struct platform_device	*pdev;
-	struct v4l2_device	v4l2_dev;
 
 	const struct cal_data	*data;
 
@@ -2287,10 +2286,6 @@ static int cal_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	/* set pseudo v4l2 device name so we can use v4l2_printk */
-	strscpy(cal->v4l2_dev.name, CAL_MODULE_NAME,
-		sizeof(cal->v4l2_dev.name));
-
 	/* save pdev pointer */
 	cal->pdev = pdev;
 
-- 
Regards,

Laurent Pinchart

