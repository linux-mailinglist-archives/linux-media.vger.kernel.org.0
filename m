Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D026F505F
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2019 16:58:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726152AbfKHP6O (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Nov 2019 10:58:14 -0500
Received: from relay11.mail.gandi.net ([217.70.178.231]:49383 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727010AbfKHP6N (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Nov 2019 10:58:13 -0500
Received: from uno.lan (93-34-114-233.ip49.fastwebnet.it [93.34.114.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 12921100004;
        Fri,  8 Nov 2019 15:58:10 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tfiga@google.com, pavel@ucw.cz
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE
        (V4L/DVB))
Subject: [PATCH v5 08/11] media: v4l2-ctrls: Sort includes alphabetically
Date:   Fri,  8 Nov 2019 16:59:41 +0100
Message-Id: <20191108155944.1040883-9-jacopo@jmondi.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191108155944.1040883-1-jacopo@jmondi.org>
References: <20191108155944.1040883-1-jacopo@jmondi.org>
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
index 0293135833d8..97e97c8069c9 100644
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
2.23.0

