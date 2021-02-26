Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 403E0326A3B
	for <lists+linux-media@lfdr.de>; Fri, 26 Feb 2021 23:51:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230045AbhBZWuy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Feb 2021 17:50:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229863AbhBZWuw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Feb 2021 17:50:52 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3783DC06174A;
        Fri, 26 Feb 2021 14:50:12 -0800 (PST)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 591DB8C2;
        Fri, 26 Feb 2021 23:50:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1614379810;
        bh=m338KCSxr+6lpZlr2Hw3GyKsvcoDSYDUn5BOWKz1KzY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=XGNpWKYMilkBUWDLKCR5OqgNy1/6Lcm8j+/qgbnyPy66mYvzm/cw4fKO2nTzI5dww
         Dd9M1S0BeCnEnFXFt/+iYvEqFGH+l+1jZ/g2o1oNh9WGjdcCLUVtKSdYSFi4Venibf
         DJwojdd4uSOokY+cBFQjUSd6kKhok/6QN46Yf6d4=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH 2/2] media: v4l2-async: Safely unregister an non-registered async subdev
Date:   Sat, 27 Feb 2021 00:49:38 +0200
Message-Id: <20210226224938.18166-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210226224938.18166-1-laurent.pinchart@ideasonboard.com>
References: <20210226224938.18166-1-laurent.pinchart@ideasonboard.com>
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
index 37cc0263b273..2347b7ac54d4 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -750,6 +750,9 @@ EXPORT_SYMBOL(v4l2_async_register_subdev);
 
 void v4l2_async_unregister_subdev(struct v4l2_subdev *sd)
 {
+	if (list_is_null(&sd->async_list))
+		return;
+
 	mutex_lock(&list_lock);
 
 	__v4l2_async_notifier_unregister(sd->subdev_notifier);
-- 
Regards,

Laurent Pinchart

