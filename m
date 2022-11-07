Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A50461FFCD
	for <lists+linux-media@lfdr.de>; Mon,  7 Nov 2022 21:50:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233054AbiKGUuZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Nov 2022 15:50:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233050AbiKGUuW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Nov 2022 15:50:22 -0500
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB57F1E3D5
        for <linux-media@vger.kernel.org>; Mon,  7 Nov 2022 12:50:20 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 0ABC9FF811;
        Mon,  7 Nov 2022 20:50:17 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: [PATCH 1/3] Documentation: media: camera-sensor: Correct frame interval
Date:   Mon,  7 Nov 2022 21:49:57 +0100
Message-Id: <20221107204959.37691-2-jacopo@jmondi.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221107204959.37691-1-jacopo@jmondi.org>
References: <20221107204959.37691-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The formula to compute the frame interval uses the analogue crop
rectangle dimensions to compute the total frame size in conjunction with
blankings.

Horizontal and vertical blankings are realized by extending the time
interval during which no valid pixels are sent on the bus between
visible lines and between consecutive frames, whose size is smaller than
the analogue crop rectangle if any additional cropping or pixel
subsampling is applied on the sensor processing pipeline.

Correct the documentation to use the visible line length and frame
height instead of the analogue crop dimensions.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 Documentation/driver-api/media/camera-sensor.rst | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/Documentation/driver-api/media/camera-sensor.rst b/Documentation/driver-api/media/camera-sensor.rst
index c7d4891bd24e..bb7d62db4cd1 100644
--- a/Documentation/driver-api/media/camera-sensor.rst
+++ b/Documentation/driver-api/media/camera-sensor.rst
@@ -87,12 +87,11 @@ less all modern raw camera sensors.
 
 The frame interval is calculated using the following equation::
 
-	frame interval = (analogue crop width + horizontal blanking) *
-			 (analogue crop height + vertical blanking) / pixel rate
+	frame interval = (visible width + horizontal blanking) *
+			 (visibile height + vertical blanking) / pixel rate
 
 The formula is bus independent and is applicable for raw timing parameters on
-large variety of devices beyond camera sensors. Devices that have no analogue
-crop, use the full source image size, i.e. pixel array size.
+large variety of devices beyond camera sensors.
 
 Horizontal and vertical blanking are specified by ``V4L2_CID_HBLANK`` and
 ``V4L2_CID_VBLANK``, respectively. The unit of the ``V4L2_CID_HBLANK`` control
-- 
2.38.1

