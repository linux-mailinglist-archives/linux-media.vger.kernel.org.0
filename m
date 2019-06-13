Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB48F43851
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2019 17:05:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732926AbfFMPEz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Jun 2019 11:04:55 -0400
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:43572 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732471AbfFMOSn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Jun 2019 10:18:43 -0400
Received: from [109.168.11.45] (port=39754 helo=pc-ceresoli.dev.aim)
        by hostingweb31.netsons.net with esmtpa (Exim 4.92)
        (envelope-from <luca@lucaceresoli.net>)
        id 1hbQYr-0005He-Rc; Thu, 13 Jun 2019 16:18:41 +0200
From:   Luca Ceresoli <luca@lucaceresoli.net>
To:     linux-media@vger.kernel.org
Cc:     Luca Ceresoli <luca@lucaceresoli.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: [PATCH 5/9] media: docs: v4l2-controls: rearrange control initialization sequence
Date:   Thu, 13 Jun 2019 16:18:22 +0200
Message-Id: <20190613141826.26775-5-luca@lucaceresoli.net>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190613141826.26775-1-luca@lucaceresoli.net>
References: <20190613141826.26775-1-luca@lucaceresoli.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id: luca+lucaceresoli.net/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The code snippet showing how to add controls to the driver’s top-level
struct is present twice, but only the second time it is split in the V4L2
and subdev cases. Consolidate everything at the beginning.

Also remove the "Where foo->bar is of type struct baz" sentences, this
obvious from the code.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 Documentation/media/kapi/v4l2-controls.rst | 40 +++++++++-------------
 1 file changed, 17 insertions(+), 23 deletions(-)

diff --git a/Documentation/media/kapi/v4l2-controls.rst b/Documentation/media/kapi/v4l2-controls.rst
index 0c3f486727ed..5281c9b1fd66 100644
--- a/Documentation/media/kapi/v4l2-controls.rst
+++ b/Documentation/media/kapi/v4l2-controls.rst
@@ -52,15 +52,29 @@ Basic usage for V4L2 and sub-device drivers
 
 1.1) Add the handler to your driver's top-level struct:
 
+For V4L2 drivers:
+
 .. code-block:: none
 
 	struct foo_dev {
+		...
+		struct v4l2_device v4l2_dev;
 		...
 		struct v4l2_ctrl_handler ctrl_handler;
 		...
 	};
 
-	struct foo_dev *foo;
+For sub-device drivers:
+
+.. code-block:: none
+
+	struct foo_dev {
+		...
+		struct v4l2_subdev sd;
+		...
+		struct v4l2_ctrl_handler ctrl_handler;
+		...
+	};
 
 1.2) Initialize the handler:
 
@@ -74,43 +88,23 @@ information. It is a hint only.
 
 1.3) Hook the control handler into the driver:
 
-1.3.1) For V4L2 drivers do this:
+For V4L2 drivers:
 
 .. code-block:: none
 
-	struct foo_dev {
-		...
-		struct v4l2_device v4l2_dev;
-		...
-		struct v4l2_ctrl_handler ctrl_handler;
-		...
-	};
-
 	foo->v4l2_dev.ctrl_handler = &foo->ctrl_handler;
 
-Where foo->v4l2_dev is of type struct v4l2_device.
-
 Finally, remove all control functions from your v4l2_ioctl_ops (if any):
 vidioc_queryctrl, vidioc_query_ext_ctrl, vidioc_querymenu, vidioc_g_ctrl,
 vidioc_s_ctrl, vidioc_g_ext_ctrls, vidioc_try_ext_ctrls and vidioc_s_ext_ctrls.
 Those are now no longer needed.
 
-1.3.2) For sub-device drivers do this:
+For sub-device drivers:
 
 .. code-block:: none
 
-	struct foo_dev {
-		...
-		struct v4l2_subdev sd;
-		...
-		struct v4l2_ctrl_handler ctrl_handler;
-		...
-	};
-
 	foo->sd.ctrl_handler = &foo->ctrl_handler;
 
-Where foo->sd is of type struct v4l2_subdev.
-
 1.4) Clean up the handler at the end:
 
 .. code-block:: none
-- 
2.21.0

