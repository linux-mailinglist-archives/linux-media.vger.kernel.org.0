Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 97D5943843
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2019 17:05:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732594AbfFMPET (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Jun 2019 11:04:19 -0400
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:52035 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732472AbfFMOSq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Jun 2019 10:18:46 -0400
Received: from [109.168.11.45] (port=39754 helo=pc-ceresoli.dev.aim)
        by hostingweb31.netsons.net with esmtpa (Exim 4.92)
        (envelope-from <luca@lucaceresoli.net>)
        id 1hbQYs-0005He-3L; Thu, 13 Jun 2019 16:18:42 +0200
From:   Luca Ceresoli <luca@lucaceresoli.net>
To:     linux-media@vger.kernel.org
Cc:     Luca Ceresoli <luca@lucaceresoli.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: [PATCH 6/9] media: docs: v4l2-controls: add links to functions
Date:   Thu, 13 Jun 2019 16:18:23 +0200
Message-Id: <20190613141826.26775-6-luca@lucaceresoli.net>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190613141826.26775-1-luca@lucaceresoli.net>
References: <20190613141826.26775-1-luca@lucaceresoli.net>
MIME-Version: 1.0
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

This section lacks links to functions. Add one to simplify reading.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 Documentation/media/kapi/v4l2-controls.rst | 67 +++++++++++-----------
 1 file changed, 35 insertions(+), 32 deletions(-)

diff --git a/Documentation/media/kapi/v4l2-controls.rst b/Documentation/media/kapi/v4l2-controls.rst
index 5281c9b1fd66..41c0fd4009e9 100644
--- a/Documentation/media/kapi/v4l2-controls.rst
+++ b/Documentation/media/kapi/v4l2-controls.rst
@@ -114,7 +114,7 @@ For sub-device drivers:
 
 2) Add controls:
 
-You add non-menu controls by calling v4l2_ctrl_new_std:
+You add non-menu controls by calling :c:func:`v4l2_ctrl_new_std`:
 
 .. code-block:: none
 
@@ -122,7 +122,8 @@ You add non-menu controls by calling v4l2_ctrl_new_std:
 			const struct v4l2_ctrl_ops *ops,
 			u32 id, s32 min, s32 max, u32 step, s32 def);
 
-Menu and integer menu controls are added by calling v4l2_ctrl_new_std_menu:
+Menu and integer menu controls are added by calling
+:c:func:`v4l2_ctrl_new_std_menu`:
 
 .. code-block:: none
 
@@ -131,7 +132,7 @@ Menu and integer menu controls are added by calling v4l2_ctrl_new_std_menu:
 			u32 id, s32 max, s32 skip_mask, s32 def);
 
 Menu controls with a driver specific menu are added by calling
-v4l2_ctrl_new_std_menu_items:
+:c:func:`v4l2_ctrl_new_std_menu_items`:
 
 .. code-block:: none
 
@@ -141,7 +142,7 @@ v4l2_ctrl_new_std_menu_items:
                        s32 skip_mask, s32 def, const char * const *qmenu);
 
 Integer menu controls with a driver specific menu can be added by calling
-v4l2_ctrl_new_int_menu:
+:c:func:`v4l2_ctrl_new_int_menu`:
 
 .. code-block:: none
 
@@ -149,7 +150,8 @@ v4l2_ctrl_new_int_menu:
 			const struct v4l2_ctrl_ops *ops,
 			u32 id, s32 max, s32 def, const s64 *qmenu_int);
 
-These functions are typically called right after the v4l2_ctrl_handler_init:
+These functions are typically called right after the
+:c:func:`v4l2_ctrl_handler_init`:
 
 .. code-block:: none
 
@@ -188,33 +190,34 @@ These functions are typically called right after the v4l2_ctrl_handler_init:
 		return err;
 	}
 
-The v4l2_ctrl_new_std function returns the v4l2_ctrl pointer to the new
-control, but if you do not need to access the pointer outside the control ops,
-then there is no need to store it.
-
-The v4l2_ctrl_new_std function will fill in most fields based on the control
-ID except for the min, max, step and default values. These are passed in the
-last four arguments. These values are driver specific while control attributes
-like type, name, flags are all global. The control's current value will be set
-to the default value.
-
-The v4l2_ctrl_new_std_menu function is very similar but it is used for menu
-controls. There is no min argument since that is always 0 for menu controls,
-and instead of a step there is a skip_mask argument: if bit X is 1, then menu
-item X is skipped.
-
-The v4l2_ctrl_new_int_menu function creates a new standard integer menu
-control with driver-specific items in the menu. It differs from
-v4l2_ctrl_new_std_menu in that it doesn't have the mask argument and takes
-as the last argument an array of signed 64-bit integers that form an exact
-menu item list.
-
-The v4l2_ctrl_new_std_menu_items function is very similar to
-v4l2_ctrl_new_std_menu but takes an extra parameter qmenu, which is the driver
-specific menu for an otherwise standard menu control. A good example for this
-control is the test pattern control for capture/display/sensors devices that
-have the capability to generate test patterns. These test patterns are hardware
-specific, so the contents of the menu will vary from device to device.
+The :c:func:`v4l2_ctrl_new_std` function returns the v4l2_ctrl pointer to
+the new control, but if you do not need to access the pointer outside the
+control ops, then there is no need to store it.
+
+The :c:func:`v4l2_ctrl_new_std` function will fill in most fields based on
+the control ID except for the min, max, step and default values. These are
+passed in the last four arguments. These values are driver specific while
+control attributes like type, name, flags are all global. The control's
+current value will be set to the default value.
+
+The :c:func:`v4l2_ctrl_new_std_menu` function is very similar but it is
+used for menu controls. There is no min argument since that is always 0 for
+menu controls, and instead of a step there is a skip_mask argument: if bit
+X is 1, then menu item X is skipped.
+
+The :c:func:`v4l2_ctrl_new_int_menu` function creates a new standard
+integer menu control with driver-specific items in the menu. It differs
+from v4l2_ctrl_new_std_menu in that it doesn't have the mask argument and
+takes as the last argument an array of signed 64-bit integers that form an
+exact menu item list.
+
+The :c:func:`v4l2_ctrl_new_std_menu_items` function is very similar to
+v4l2_ctrl_new_std_menu but takes an extra parameter qmenu, which is the
+driver specific menu for an otherwise standard menu control. A good example
+for this control is the test pattern control for capture/display/sensors
+devices that have the capability to generate test patterns. These test
+patterns are hardware specific, so the contents of the menu will vary from
+device to device.
 
 Note that if something fails, the function will return NULL or an error and
 set ctrl_handler->error to the error code. If ctrl_handler->error was already
-- 
2.21.0

