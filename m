Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7EE1D632BD4
	for <lists+linux-media@lfdr.de>; Mon, 21 Nov 2022 19:15:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229622AbiKUSPj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Nov 2022 13:15:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229628AbiKUSPh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Nov 2022 13:15:37 -0500
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 223ABC051E
        for <linux-media@vger.kernel.org>; Mon, 21 Nov 2022 10:15:35 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id C20CEC0009;
        Mon, 21 Nov 2022 18:15:32 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: [PATCH v2 1/2] documentation: media: camera_sensor: Document blankings handling
Date:   Mon, 21 Nov 2022 19:15:14 +0100
Message-Id: <20221121181515.34008-2-jacopo@jmondi.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221121181515.34008-1-jacopo@jmondi.org>
References: <20221121181515.34008-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,WEIRD_QUOTING autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When a new image format is applied on the sensor it is necessary to
update the vertical and horizontal blanking limits, to comply with the
new visibile sizes.

Add that part to the documentation of camera sensor subdevices.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 .../driver-api/media/camera-sensor.rst        | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/Documentation/driver-api/media/camera-sensor.rst b/Documentation/driver-api/media/camera-sensor.rst
index c7d4891bd24e..382ea4ecebd4 100644
--- a/Documentation/driver-api/media/camera-sensor.rst
+++ b/Documentation/driver-api/media/camera-sensor.rst
@@ -108,6 +108,39 @@ The first entity in the linear pipeline is the pixel array. The pixel array may
 be followed by other entities that are there to allow configuring binning,
 skipping, scaling or digital crop :ref:`v4l2-subdev-selections`.
 
+Blankings initialization and reconfiguration
+""""""""""""""""""""""""""""""""""""""""""""
+
+The value used to initialize the vertical and horizontal blanking controls
+should be selected in order to realize, in association with the driver default
+format and default pixel rate, a reasonable frame rate output, usually one of
+the standard 15, 30 or 60 frame per second.
+
+When a new frame size is applied on the subdevice, sensor drivers are required
+to update the limits of their blankings controls.
+
+The V4L2 control framework provides the ``v4l2_ctrl_modify_range()`` function
+(and the unlocked ``__v4l2_ctrl_modify_range()`` counterpart) to assist drivers
+in re-computing the controls limits.
+
+The new limits for the controls should be re-calculated using the newly
+configured size:
+
+.. code-block:: c
+
+	#define SENSOR_MAX_VTS          <see sensor documentation>
+
+	max_vblank = SENSOR_MAX_VTS - (analogue crop height);
+	ret = __v4l2_ctrl_modify_range(sensor->ctrls.vblank,
+				       sensor->ctrls.vblank->minimum,
+				       max_vblank, sensor->ctrls.vblank->step,
+				       sensor->ctrls.vblank->minimum);
+
+The minimum value could potentially change as well.
+
+The control default value is reset to the control's minimum and the V4L2
+control framework automatically clamps the control's value in the new limits.
+
 USB cameras etc. devices
 ~~~~~~~~~~~~~~~~~~~~~~~~
 
-- 
2.38.1

