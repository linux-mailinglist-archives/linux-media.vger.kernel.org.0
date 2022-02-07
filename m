Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B1F04AC578
	for <lists+linux-media@lfdr.de>; Mon,  7 Feb 2022 17:27:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344693AbiBGQVa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Feb 2022 11:21:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1387434AbiBGQLi (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Feb 2022 11:11:38 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EF5CC0401CC
        for <linux-media@vger.kernel.org>; Mon,  7 Feb 2022 08:11:38 -0800 (PST)
Received: from deskari.lan (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D8676340;
        Mon,  7 Feb 2022 17:11:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1644250289;
        bh=2uKOi2wB/8Ps4UfJEh2AVlAOWZkPL9Q+U0azc8OOJyA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=T+v3XTXQg0MWbkkqFH4fvkVE3IAhSx+LNExtT0sjlBBUA4XpF0qzdycarY196UfOF
         KdRRO3Ejy0EJeMTcjD+3xFf6ICgswVpho82AcrMXCrWHooHENa65E/jExk0UAFtsM7
         kzUNCL1PH/Rbf1Q3/uTiQzB1qauOFUQr97ulRTiM=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v3 6/7] media: Documentation: add documentation about subdev state
Date:   Mon,  7 Feb 2022 18:11:06 +0200
Message-Id: <20220207161107.1166376-7-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220207161107.1166376-1-tomi.valkeinen@ideasonboard.com>
References: <20220207161107.1166376-1-tomi.valkeinen@ideasonboard.com>
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
---
 .../driver-api/media/v4l2-subdev.rst          | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/Documentation/driver-api/media/v4l2-subdev.rst b/Documentation/driver-api/media/v4l2-subdev.rst
index 08ea2673b19e..6b14cc97afa3 100644
--- a/Documentation/driver-api/media/v4l2-subdev.rst
+++ b/Documentation/driver-api/media/v4l2-subdev.rst
@@ -518,6 +518,66 @@ The :c:func:`v4l2_i2c_new_subdev` function will call
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
+<v4l2-subdev-format-whence>` receive the correct state to operate on through the
+'state' parameter. The sub-device driver can access and modify the configuration
+ stored in the provided state after having locked the state by calling
+:c:func:`v4l2_subdev_lock_state()`. The driver must then call
+:c:func:`v4l2_subdev_unlock_state()` to unlock the state when done.
+
+Operations that do not receive a state parameter implicitly operate on the
+subdevice active state, which drivers can exclusively access by
+calling :c:func:`v4l2_subdev_lock_active_state()`. The sub-device active state
+must equally be released by calling :c:func:`v4l2_subdev_unlock_state()`.
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
 V4L2 sub-device functions and data structures
 ---------------------------------------------
 
-- 
2.25.1

