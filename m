Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CA942EE956
	for <lists+linux-media@lfdr.de>; Thu,  7 Jan 2021 23:56:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727933AbhAGWz7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Jan 2021 17:55:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727865AbhAGWz7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Jan 2021 17:55:59 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB699C0612F4
        for <linux-media@vger.kernel.org>; Thu,  7 Jan 2021 14:55:18 -0800 (PST)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 22E67292;
        Thu,  7 Jan 2021 23:55:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1610060114;
        bh=u0z/eHyxvJRXLde5MI9DBhuv+3C5sM+VaCS08W/RFuI=;
        h=From:To:Cc:Subject:Date:From;
        b=dYnoYs+NVu4scVr/va6DaLXXzgqWOLRc+/duy5zkdt+/g2jTjs4sImFTi/PEMfWp2
         NKBuOD+bWbiDwhwUq3Ynr9LUnay+i80VgX1gdPS8c9H2BiRA0g2l/1gcyZi6gxKsAt
         R3FFy3y4j2GgJvuZuvP8ZoaRRg/qV97WFa/BzIF0=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH] media: v4l2-async: Safely unregister an non-registered async subdev
Date:   Fri,  8 Jan 2021 00:54:58 +0200
Message-Id: <20210107225458.4485-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Make the V4L2 async framework a bit more robust by allowing to
unregister a non-registered async subdev. Otherwise the
v4l2_async_cleanup() will attempt to delete the async subdev from the
subdev_list with the corresponding list_head not initialized.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-async.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index 8bde33c21ce4..fc4525c4a75f 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -750,6 +750,9 @@ EXPORT_SYMBOL(v4l2_async_register_subdev);
 
 void v4l2_async_unregister_subdev(struct v4l2_subdev *sd)
 {
+	if (!sd->async_list.next)
+		return;
+
 	mutex_lock(&list_lock);
 
 	__v4l2_async_notifier_unregister(sd->subdev_notifier);
-- 
Regards,

Laurent Pinchart

