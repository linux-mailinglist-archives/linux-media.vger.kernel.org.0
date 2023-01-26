Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EBDD767D979
	for <lists+linux-media@lfdr.de>; Fri, 27 Jan 2023 00:15:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233413AbjAZXPT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Jan 2023 18:15:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231557AbjAZXPQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Jan 2023 18:15:16 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85A6432528
        for <linux-media@vger.kernel.org>; Thu, 26 Jan 2023 15:15:15 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1pLBSX-0004JF-Hw; Fri, 27 Jan 2023 00:15:09 +0100
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1pLBSX-000fEv-RK; Fri, 27 Jan 2023 00:15:08 +0100
Received: from mgr by dude04.red.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1pLBSV-00EH82-LJ; Fri, 27 Jan 2023 00:15:07 +0100
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     laurent.pinchart@ideasonboard.com
Cc:     gregkh@linuxfoundation.org, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, linux-usb@vger.kernel.org,
        linux-media@vger.kernel.org, kernel@pengutronix.de,
        Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH v3 2/5] usb: uvc: move media/v4l2-uvc.h to usb/uvc.h
Date:   Fri, 27 Jan 2023 00:14:53 +0100
Message-Id: <20230126231456.3402323-3-m.grzeschik@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230126231456.3402323-1-m.grzeschik@pengutronix.de>
References: <20230126231456.3402323-1-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Since the headerfile is only used in usb devices it is better
placed with the other usb files.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
Tested-by: Daniel Scally <dan.scally@ideasonboard.com>
Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>

---
v1 -> v2: - added reviewed and tested tags
v2 -> v3: - no changes

 drivers/media/usb/uvc/uvc_ctrl.c              | 2 +-
 drivers/media/usb/uvc/uvc_driver.c            | 2 +-
 drivers/usb/gadget/function/uvc_v4l2.c        | 2 +-
 include/{media/v4l2-uvc.h => linux/usb/uvc.h} | 0
 4 files changed, 3 insertions(+), 3 deletions(-)
 rename include/{media/v4l2-uvc.h => linux/usb/uvc.h} (100%)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index c3aeba3fe31b12..5e9d3da862dd86 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -14,13 +14,13 @@
 #include <linux/slab.h>
 #include <linux/uaccess.h>
 #include <linux/usb.h>
+#include <linux/usb/uvc.h>
 #include <linux/videodev2.h>
 #include <linux/vmalloc.h>
 #include <linux/wait.h>
 #include <linux/workqueue.h>
 #include <linux/atomic.h>
 #include <media/v4l2-ctrls.h>
-#include <media/v4l2-uvc.h>
 
 #include "uvcvideo.h"
 
diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 11f3d716b5bf6a..edf8c4a201a8ab 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -14,6 +14,7 @@
 #include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/usb.h>
+#include <linux/usb/uvc.h>
 #include <linux/videodev2.h>
 #include <linux/vmalloc.h>
 #include <linux/wait.h>
@@ -21,7 +22,6 @@
 
 #include <media/v4l2-common.h>
 #include <media/v4l2-ioctl.h>
-#include <media/v4l2-uvc.h>
 
 #include "uvcvideo.h"
 
diff --git a/drivers/usb/gadget/function/uvc_v4l2.c b/drivers/usb/gadget/function/uvc_v4l2.c
index a189b08bba800d..7435df0cf2a847 100644
--- a/drivers/usb/gadget/function/uvc_v4l2.c
+++ b/drivers/usb/gadget/function/uvc_v4l2.c
@@ -11,6 +11,7 @@
 #include <linux/kernel.h>
 #include <linux/list.h>
 #include <linux/usb/g_uvc.h>
+#include <linux/usb/uvc.h>
 #include <linux/videodev2.h>
 #include <linux/vmalloc.h>
 #include <linux/wait.h>
@@ -18,7 +19,6 @@
 #include <media/v4l2-dev.h>
 #include <media/v4l2-event.h>
 #include <media/v4l2-ioctl.h>
-#include <media/v4l2-uvc.h>
 
 #include "f_uvc.h"
 #include "uvc.h"
diff --git a/include/media/v4l2-uvc.h b/include/linux/usb/uvc.h
similarity index 100%
rename from include/media/v4l2-uvc.h
rename to include/linux/usb/uvc.h
-- 
2.30.2

