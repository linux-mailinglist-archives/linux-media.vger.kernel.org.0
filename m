Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FD5E1F8B8F
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2020 02:01:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728144AbgFOAA6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Jun 2020 20:00:58 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33340 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728139AbgFOAA5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Jun 2020 20:00:57 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5CE82214B;
        Mon, 15 Jun 2020 02:00:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592179227;
        bh=N2q6Th8QNA8ZUycCXas8hXEU7ytRhRjHhpco89GsOB0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ekzW8DkDPKxDarVwF/9AN0E46o99x52MW9ilSXwIvp/m1Yz5OCLvUA1ipQhx42zek
         TX/YISxq9pJC5/QiZ30eiCtRbS5XOlAsd5TuIo69ZhWs0vuAvTRYuuhxD5H2W2uZHu
         Ez/LSdH597sdQdEwXSKnBawvyPy24Y0HDTb643CE=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v1 038/107] media: ti-vpe: cal: Use correct device name for bus_info
Date:   Mon, 15 Jun 2020 02:58:35 +0300
Message-Id: <20200614235944.17716-39-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
References: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The v4l2_capability bus_info field, filled by the VIDIOC_QUERYCAP ioctl
handler, specifies the location of the device in the system. For
platform devices, V4L2 specifies that the value must be "platform:"
followed by the device name. Fix the cal_querycap() function to set the
right value.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 8576a4321e25..fdc8248ef44a 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -1284,7 +1284,7 @@ static int cal_querycap(struct file *file, void *priv,
 	strscpy(cap->card, CAL_MODULE_NAME, sizeof(cap->card));
 
 	snprintf(cap->bus_info, sizeof(cap->bus_info),
-		 "platform:%s", ctx->v4l2_dev.name);
+		 "platform:%s", dev_name(&ctx->cal->pdev->dev));
 	return 0;
 }
 
-- 
Regards,

Laurent Pinchart

