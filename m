Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C84B215E97
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2020 20:38:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729917AbgGFSiJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jul 2020 14:38:09 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45202 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729914AbgGFSiI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jul 2020 14:38:08 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5EF50197C;
        Mon,  6 Jul 2020 20:37:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594060673;
        bh=ZGBi77bxSJsb2b4toj7r2+s7jT393Bxp9shYivb7fdM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=tLWIcAosw1Qcu53y0Q8cYhbB63gfawMLDgDrM45fYu6EWGBVYdo4ufbTWuaKKgAFP
         BZkjY1f90loPIEW6VkhJJjMEK9uag8u3khRlWi3os+YBPrP0Du0oGik+1xqd2mbI7I
         LGRShxDfrNfib/JTuTnRciadkgQHjO3v1EJXF2HY=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v2 039/108] media: ti-vpe: cal: Use correct device name for bus_info
Date:   Mon,  6 Jul 2020 21:36:00 +0300
Message-Id: <20200706183709.12238-40-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
References: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
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
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/cal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index ac23c41230fb..028479498c07 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -1290,7 +1290,7 @@ static int cal_querycap(struct file *file, void *priv,
 	strscpy(cap->card, CAL_MODULE_NAME, sizeof(cap->card));
 
 	snprintf(cap->bus_info, sizeof(cap->bus_info),
-		 "platform:%s", ctx->v4l2_dev.name);
+		 "platform:%s", dev_name(&ctx->cal->pdev->dev));
 	return 0;
 }
 
-- 
Regards,

Laurent Pinchart

