Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD0EC4E5FD9
	for <lists+linux-media@lfdr.de>; Thu, 24 Mar 2022 09:01:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348776AbiCXIDG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Mar 2022 04:03:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348765AbiCXIDA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Mar 2022 04:03:00 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06E1B91AE1
        for <linux-media@vger.kernel.org>; Thu, 24 Mar 2022 01:01:29 -0700 (PDT)
Received: from deskari.lan (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4EC6FFEF;
        Thu, 24 Mar 2022 09:01:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1648108883;
        bh=IYPnR8Ge+MaF3C77/TcHMv1Px3XrYK0N0px0pN+CAN0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=E7o2B/Yjr+xtNoZiJY4wMqnxOMomc6AMpFtgy6tmkTwsxIe/qIUhi2okqKDazE2jF
         mYFZydJ/DF+v8Vtam40FmG7owhpl2qp5ljP5VzA8EMLYCfKG5QRQ4p1/CEOuGxLSxy
         dx6iXXG7H7pRYLtFacUBfgiG8Ev0EMYQSzozxFZA=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v6 8/8] media: Documentation: add documentation about subdev state
Date:   Thu, 24 Mar 2022 10:00:30 +0200
Message-Id: <20220324080030.216716-9-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220324080030.216716-1-tomi.valkeinen@ideasonboard.com>
References: <20220324080030.216716-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add documentation about centrally managed subdev state.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../driver-api/media/v4l2-subdev.rst          | 75 +++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/Documentation/driver-api/media/v4l2-subdev.rst b/Documentation/driver-api/media/v4l2-subdev.rst
index 08ea2673b19e..7fa950b1bff0 100644
--- a/Documentation/driver-api/media/v4l2-subdev.rst
+++ b/Documentation/driver-api/media/v4l2-subdev.rst
@@ -518,6 +518,81 @@ The :c:func:`v4l2_i2c_new_subdev` function will call
 :c:type:`i2c_board_info` structure using the ``client_type`` and the
 ``addr`` to fill it.
 
+Centrally managed subdev active state
+-------------------------------------
+
+Traditionally V4L2 subdev drivers maintained internal state for the active
+device configuration. This is often implemented as e.g. an array of struct
+v4l2_mbus_framefmt, one entry for each pad, and similarly for crop and compose
+rectangles.
+
+In addition to the active configuration, each subdev file handle has an array of
+struct v4l2_subdev_pad_config, managed by the V4L2 core, which contains the try
+configuration.
+
+To simplify the subdev drivers the V4L2 subdev API now optionally supports a
+centrally managed active configuration represented by
+:c:type:`v4l2_subdev_state`. One instance of state, which contains the active
+device configuration, is stored in the sub-device itself as part of
+the :c:type:`v4l2_subdev` structure, while the core associates a try state to
+each open file handle, to store the try configuration related to that file
+handle.
+
+Sub-device drivers can opt-in and use state to manage their active configuration
+by initializing the subdevice state with a call to v4l2_subdev_init_finalize()
+before registering the sub-device. They must also call v4l2_subdev_cleanup()
+to release all the allocated resources before unregistering the sub-device.
+The core automatically allocates and initializes a state for each open file
+handle to store the try configurations and frees it when closing the file
+handle.
+
+V4L2 sub-device operations that use both the :ref:`ACTIVE and TRY formats
+<v4l2-subdev-format-whence>` receive the correct state to operate on through
+the 'state' parameter. The state must be locked and unlocked by the
+caller by calling :c:func:`v4l2_subdev_lock_state()` and
+:c:func:`v4l2_subdev_unlock_state()`. The caller can do so by calling the subdev
+operation through the :c:func:`v4l2_subdev_call_state_active()` macro.
+
+Operations that do not receive a state parameter implicitly operate on the
+subdevice active state, which drivers can exclusively access by
+calling :c:func:`v4l2_subdev_lock_and_get_active_state()`. The sub-device active
+state must equally be released by calling :c:func:`v4l2_subdev_unlock_state()`.
+
+Drivers must never manually access the state stored in the :c:type:`v4l2_subdev`
+or in the file handle without going through the designated helpers.
+
+While the V4L2 core passes the correct try or active state to the
+subdevice operations, some existing device drivers pass a NULL state
+when calling operations with :c:func:`v4l2_subdev_call()`. This legacy
+construct causes issues with subdevice drivers that let the V4L2 core
+manage the active state, as they expect to receive the appropriate state
+as a parameter. To help the conversion of subdevice drivers to a managed
+active state without having to convert all callers at the same time, the
+:c:func:`v4l2_subdev_lock_and_return_state()` helper function can be
+used by subdevice drivers to retrieve the active state if a NULL state
+is passed to the subdevice operation.
+
+:c:func:`v4l2_subdev_lock_and_return_state()` should only be used when porting
+an existing driver to the new state management when it cannot be guaranteed
+that the current callers will pass the state properly. The function prints a
+notice when the passed state is NULL to encourage the porting of the callers
+to the new state management.
+
+The whole subdev state is in reality split into three parts: the
+v4l2_subdev_state, subdev controls and subdev driver's internal state. In the
+future these parts should be combined into a single state. For the time being
+we need a way to handle the locking for these parts. This can be accomplished
+by sharing a lock. The v4l2_ctrl_handler already supports this via its 'lock'
+pointer and the same model is used with states. The driver can do the following
+before calling v4l2_subdev_init_finalize():
+
+.. code-block:: c
+
+	sd->ctrl_handler->lock = &priv->mutex;
+	sd->state_lock = &priv->mutex;
+
+This shares the driver's private mutex between the controls and the states.
+
 V4L2 sub-device functions and data structures
 ---------------------------------------------
 
-- 
2.25.1

