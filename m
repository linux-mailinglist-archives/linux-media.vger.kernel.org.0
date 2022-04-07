Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 907CC4F7941
	for <lists+linux-media@lfdr.de>; Thu,  7 Apr 2022 10:16:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233508AbiDGIRU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Apr 2022 04:17:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241063AbiDGIRP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Apr 2022 04:17:15 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69E1B1DCCC9
        for <linux-media@vger.kernel.org>; Thu,  7 Apr 2022 01:15:16 -0700 (PDT)
Received: from deskari.lan (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 116C4880;
        Thu,  7 Apr 2022 10:15:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1649319310;
        bh=qg+wfCBvON+YzZspt4WVAWUBVPk3scWuwfLfXClVOn8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ayShkDiRYwtCuuwqF9//MuU9xTB0BNm0jdUUAdrKIu5dQpTm6R3RaX9pP2X6g7zJG
         uyYEzhBgglpzRuxdiFuB1ruej+98Ug8MEyG6YRaiZAzGqK6UiuE2m7NCKmVciz8qln
         /lTGhokm4F29kjiL51pMfMwuyGj5aCBUHg0HyOpQ=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v7 8/8] media: Documentation: add documentation about subdev state
Date:   Thu,  7 Apr 2022 11:14:24 +0300
Message-Id: <20220407081424.295870-9-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220407081424.295870-1-tomi.valkeinen@ideasonboard.com>
References: <20220407081424.295870-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
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
 .../driver-api/media/v4l2-subdev.rst          | 69 +++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/Documentation/driver-api/media/v4l2-subdev.rst b/Documentation/driver-api/media/v4l2-subdev.rst
index 08ea2673b19e..cf3b52bdbfb9 100644
--- a/Documentation/driver-api/media/v4l2-subdev.rst
+++ b/Documentation/driver-api/media/v4l2-subdev.rst
@@ -518,6 +518,75 @@ The :c:func:`v4l2_i2c_new_subdev` function will call
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
+While the V4L2 core passes the correct try or active state to the subdevice
+operations, many existing device drivers pass a NULL state when calling
+operations with :c:func:`v4l2_subdev_call()`. This legacy construct causes
+issues with subdevice drivers that let the V4L2 core manage the active state,
+as they expect to receive the appropriate state as a parameter. To help the
+conversion of subdevice drivers to a managed active state without having to
+convert all callers at the same time, an additional wrapper layer has been
+added to v4l2_subdev_call(), which handles the NULL case by geting and locking
+the callee's active state with :c:func:`v4l2_subdev_lock_and_get_active_state()`,
+and unlocking the state after the call.
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

