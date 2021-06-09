Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1450B3A138B
	for <lists+linux-media@lfdr.de>; Wed,  9 Jun 2021 13:55:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239557AbhFIL5P (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Jun 2021 07:57:15 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:37341 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239571AbhFIL5O (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Jun 2021 07:57:14 -0400
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id A0FCB20000C;
        Wed,  9 Jun 2021 11:55:18 +0000 (UTC)
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Sebastian Reichel <sre@kernel.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: [PATCH 2/2] media: v4l2-async: Make subdev notifier cleanup conditional
Date:   Wed,  9 Jun 2021 13:54:57 +0200
Message-Id: <20210609115457.822085-2-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210609115457.822085-1-paul.kocialkowski@bootlin.com>
References: <20210609115457.822085-1-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

A dedicated subdev notified is registered when using the helper
dedicated to sensors (v4l2_async_register_subdev_sensor_common),
but this is not the case when a driver uses v4l2_async_register_subdev
directly.

As a result, add a conditional check to deal with the dedicated subdev
notifier only when necessary at the async subdev unregister step
(and avoid operating on/freeing an unallocated notifier).

Fixes: aef69d54755d ("media: v4l: fwnode: Add a convenience function for registering sensors")
Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
---
 drivers/media/v4l2-core/v4l2-async.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index cd9e78c63791..e0f4f7551ff3 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -780,10 +780,12 @@ void v4l2_async_unregister_subdev(struct v4l2_subdev *sd)
 
 	mutex_lock(&list_lock);
 
-	__v4l2_async_notifier_unregister(sd->subdev_notifier);
-	__v4l2_async_notifier_cleanup(sd->subdev_notifier);
-	kfree(sd->subdev_notifier);
-	sd->subdev_notifier = NULL;
+	if (sd->subdev_notifier) {
+		__v4l2_async_notifier_unregister(sd->subdev_notifier);
+		__v4l2_async_notifier_cleanup(sd->subdev_notifier);
+		kfree(sd->subdev_notifier);
+		sd->subdev_notifier = NULL;
+	}
 
 	if (sd->asd) {
 		struct v4l2_async_notifier *notifier = sd->notifier;
-- 
2.31.1

