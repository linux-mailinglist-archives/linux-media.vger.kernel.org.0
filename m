Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A9DA18A419
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2020 21:48:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727282AbgCRUsO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Mar 2020 16:48:14 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:36485 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726893AbgCRUsN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Mar 2020 16:48:13 -0400
X-Originating-IP: 2.224.242.101
Received: from localhost.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 234D120002;
        Wed, 18 Mar 2020 20:48:07 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tfiga@google.com, pavel@ucw.cz
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE
        (V4L/DVB)), libcamera-devel@lists.libcamera.org
Subject: [PATCH v7 08/11] media: v4l2-ctrls: Sort includes alphabetically
Date:   Wed, 18 Mar 2020 21:50:31 +0100
Message-Id: <20200318205034.949531-9-jacopo@jmondi.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200318205034.949531-1-jacopo@jmondi.org>
References: <20200318205034.949531-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Before adding a new include directive, sort the existing ones in
alphabetical order.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/v4l2-core/v4l2-ctrls.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index e0aa24e8ad84..4951a373015b 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -9,14 +9,14 @@
 #define pr_fmt(fmt) "v4l2-ctrls: " fmt
 
 #include <linux/ctype.h>
+#include <linux/export.h>
 #include <linux/mm.h>
 #include <linux/slab.h>
-#include <linux/export.h>
-#include <media/v4l2-ioctl.h>
-#include <media/v4l2-device.h>
 #include <media/v4l2-ctrls.h>
-#include <media/v4l2-event.h>
 #include <media/v4l2-dev.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-ioctl.h>
 
 #define dprintk(vdev, fmt, arg...) do {					\
 	if (!WARN_ON(!(vdev)) && ((vdev)->dev_debug & V4L2_DEV_DEBUG_CTRL)) \
-- 
2.25.1

