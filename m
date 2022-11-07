Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 724A561FFCF
	for <lists+linux-media@lfdr.de>; Mon,  7 Nov 2022 21:50:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233062AbiKGUu1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Nov 2022 15:50:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233056AbiKGUu0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Nov 2022 15:50:26 -0500
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB6BA1E3D5
        for <linux-media@vger.kernel.org>; Mon,  7 Nov 2022 12:50:23 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 5E2CBFF80C;
        Mon,  7 Nov 2022 20:50:21 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: [PATCH 3/3] documentation: media: camera_sensor: Update exposure on blanking change
Date:   Mon,  7 Nov 2022 21:49:59 +0100
Message-Id: <20221107204959.37691-4-jacopo@jmondi.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221107204959.37691-1-jacopo@jmondi.org>
References: <20221107204959.37691-1-jacopo@jmondi.org>
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

The maximum achieable exposure time in a camera sensor is usually
bound by the total frame height (visible + blankings) minus a fixed
sensor-speific offset.

When the vertical blanking control value is changed, the exposure
control limits should be updated as well.

Add this to the camera sensor documentation.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 .../driver-api/media/camera-sensor.rst        | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/Documentation/driver-api/media/camera-sensor.rst b/Documentation/driver-api/media/camera-sensor.rst
index 31f74f85ebc5..76206c7647d6 100644
--- a/Documentation/driver-api/media/camera-sensor.rst
+++ b/Documentation/driver-api/media/camera-sensor.rst
@@ -179,3 +179,36 @@ used to obtain device's power state after the power state transition:
 The function returns a non-zero value if it succeeded getting the power count or
 runtime PM was disabled, in either of which cases the driver may proceed to
 access the device.
+
+Resetting exposure on vertical blanking update
+""""""""""""""""""""""""""""""""""""""""""""""
+
+The sensor exposure time, specified by the ``V4L2_CID_EXPOSURE`` control, is
+usually limited by a maximum value which is equal to maximum vertical blankings
+minus a known offset usually specified in the chip programming manual.
+
+When a new ``V4L2_CID_VBLANK`` value is applied, regardless of it being actually
+programmed to the hardware or not, the limits of the ``V4L2_CID_EXPOSURE``
+control should be updated as well.
+
+The typical coding pattern that realizes that in the ``.s_ctrl`` callback
+handler is:
+
+.. code-block:: c
+
+	static int s_ctrl(struct v4l2_ctrl *ctrl)
+	{
+		int exp_max;
+
+		switch (ctrl->id) {
+		case V4L2_CID_VBLANK:
+			exp_max = sensor->fmt.height + ctrl->val - 4;
+			__v4l2_ctrl_modify_range(sensor->ctrls.exposure,
+			sensor->ctrls.exposure->minimum,
+			exp_max, sensor->ctrls.exposure->step,
+			sensor->ctrls.exposure->default_value);
+			break;
+		}
+
+		if (!pm_runtime_get_if_in_use(&sensor->i2c_client->dev))
+			return 0;
-- 
2.38.1

