Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2CB82733B1
	for <lists+linux-media@lfdr.de>; Mon, 21 Sep 2020 22:39:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727435AbgIUUjC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Sep 2020 16:39:02 -0400
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:49684 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727388AbgIUUi6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Sep 2020 16:38:58 -0400
Received: from [78.134.51.148] (port=50434 helo=melee.fritz.box)
        by hostingweb31.netsons.net with esmtpa (Exim 4.93)
        (envelope-from <luca@lucaceresoli.net>)
        id 1kKSJq-0009Ai-RG; Mon, 21 Sep 2020 22:21:50 +0200
From:   Luca Ceresoli <luca@lucaceresoli.net>
To:     linux-media@vger.kernel.org
Cc:     Luca Ceresoli <luca@lucaceresoli.net>,
        linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jacopo Mondi <jacopo@jmondi.org>
Subject: [PATCH v2 4/4] media: docs: v4l2-subdev: move calling ops to a subsection
Date:   Mon, 21 Sep 2020 22:21:34 +0200
Message-Id: <20200921202134.9792-4-luca@lucaceresoli.net>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200921202134.9792-1-luca@lucaceresoli.net>
References: <20200921202134.9792-1-luca@lucaceresoli.net>
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
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Documentation on how to call the subdev ops is currently in the middle of
synchronous and asynchronous registration. Move it to a dedicated
subsection after the registration methods.

Also move the final paragraph "The advantage of using v4l2_subdev..." to
the beginning of the new section as it has an introductory content.

Suggested-by: Jacopo Mondi <jacopo@jmondi.org>
Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>

---

Changes in v2:
 - replaces the simpler patch 3/3 upon suggestion by Jacopo
---
 .../driver-api/media/v4l2-subdev.rst          | 88 ++++++++++---------
 1 file changed, 46 insertions(+), 42 deletions(-)

diff --git a/Documentation/driver-api/media/v4l2-subdev.rst b/Documentation/driver-api/media/v4l2-subdev.rst
index 3adcd881cae5..21ee54bbec77 100644
--- a/Documentation/driver-api/media/v4l2-subdev.rst
+++ b/Documentation/driver-api/media/v4l2-subdev.rst
@@ -182,7 +182,51 @@ You can unregister a sub-device using:
 Afterwards the subdev module can be unloaded and
 :c:type:`sd <v4l2_subdev>`->dev == ``NULL``.
 
-You can call an ops function either directly:
+In the **asynchronous** case subdevice probing can be invoked independently of
+the bridge driver availability. The subdevice driver then has to verify whether
+all the requirements for a successful probing are satisfied. This can include a
+check for a master clock availability. If any of the conditions aren't satisfied
+the driver might decide to return ``-EPROBE_DEFER`` to request further reprobing
+attempts. Once all conditions are met the subdevice shall be registered using
+the :c:func:`v4l2_async_register_subdev` function. Unregistration is
+performed using the :c:func:`v4l2_async_unregister_subdev` call. Subdevices
+registered this way are stored in a global list of subdevices, ready to be
+picked up by bridge drivers.
+
+Bridge drivers in turn have to register a notifier object. This is
+performed using the :c:func:`v4l2_async_notifier_register` call. To
+unregister the notifier the driver has to call
+:c:func:`v4l2_async_notifier_unregister`. The former of the two functions
+takes two arguments: a pointer to struct :c:type:`v4l2_device` and a
+pointer to struct :c:type:`v4l2_async_notifier`.
+
+Before registering the notifier, bridge drivers must do two things:
+first, the notifier must be initialized using the
+:c:func:`v4l2_async_notifier_init`. Second, bridge drivers can then
+begin to form a list of subdevice descriptors that the bridge device
+needs for its operation. Subdevice descriptors are added to the notifier
+using the :c:func:`v4l2_async_notifier_add_subdev` call. This function
+takes two arguments: a pointer to struct :c:type:`v4l2_async_notifier`,
+and a pointer to the subdevice descripter, which is of type struct
+:c:type:`v4l2_async_subdev`.
+
+The V4L2 core will then use these descriptors to match asynchronously
+registered subdevices to them. If a match is detected the ``.bound()``
+notifier callback is called. After all subdevices have been located the
+.complete() callback is called. When a subdevice is removed from the
+system the .unbind() method is called. All three callbacks are optional.
+
+Calling subdev operations
+~~~~~~~~~~~~~~~~~~~~~~~~~
+
+The advantage of using :c:type:`v4l2_subdev` is that it is a generic struct and
+does not contain any knowledge about the underlying hardware. So a driver might
+contain several subdevs that use an I2C bus, but also a subdev that is
+controlled through GPIO pins. This distinction is only relevant when setting
+up the device, but once the subdev is registered it is completely transparent.
+
+Once te subdev has been registered you can call an ops function either
+directly:
 
 .. code-block:: c
 
@@ -233,47 +277,7 @@ that needs it.
 If the sub-device needs to notify its v4l2_device parent of an event, then
 it can call ``v4l2_subdev_notify(sd, notification, arg)``. This macro checks
 whether there is a ``notify()`` callback defined and returns ``-ENODEV`` if not.
-Otherwise the result of the ``notify()`` call is returned.
-
-The advantage of using :c:type:`v4l2_subdev` is that it is a generic struct and
-does not contain any knowledge about the underlying hardware. So a driver might
-contain several subdevs that use an I2C bus, but also a subdev that is
-controlled through GPIO pins. This distinction is only relevant when setting
-up the device, but once the subdev is registered it is completely transparent.
-
-In the **asynchronous** case subdevice probing can be invoked independently of
-the bridge driver availability. The subdevice driver then has to verify whether
-all the requirements for a successful probing are satisfied. This can include a
-check for a master clock availability. If any of the conditions aren't satisfied
-the driver might decide to return ``-EPROBE_DEFER`` to request further reprobing
-attempts. Once all conditions are met the subdevice shall be registered using
-the :c:func:`v4l2_async_register_subdev` function. Unregistration is
-performed using the :c:func:`v4l2_async_unregister_subdev` call. Subdevices
-registered this way are stored in a global list of subdevices, ready to be
-picked up by bridge drivers.
-
-Bridge drivers in turn have to register a notifier object. This is
-performed using the :c:func:`v4l2_async_notifier_register` call. To
-unregister the notifier the driver has to call
-:c:func:`v4l2_async_notifier_unregister`. The former of the two functions
-takes two arguments: a pointer to struct :c:type:`v4l2_device` and a
-pointer to struct :c:type:`v4l2_async_notifier`.
-
-Before registering the notifier, bridge drivers must do two things:
-first, the notifier must be initialized using the
-:c:func:`v4l2_async_notifier_init`. Second, bridge drivers can then
-begin to form a list of subdevice descriptors that the bridge device
-needs for its operation. Subdevice descriptors are added to the notifier
-using the :c:func:`v4l2_async_notifier_add_subdev` call. This function
-takes two arguments: a pointer to struct :c:type:`v4l2_async_notifier`,
-and a pointer to the subdevice descripter, which is of type struct
-:c:type:`v4l2_async_subdev`.
-
-The V4L2 core will then use these descriptors to match asynchronously
-registered subdevices to them. If a match is detected the ``.bound()``
-notifier callback is called. After all subdevices have been located the
-.complete() callback is called. When a subdevice is removed from the
-system the .unbind() method is called. All three callbacks are optional.
+Otherwise the result of the ``notify()`` call is return
 
 V4L2 sub-device userspace API
 -----------------------------
-- 
2.28.0

