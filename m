Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E6E2774D76D
	for <lists+linux-media@lfdr.de>; Mon, 10 Jul 2023 15:23:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231637AbjGJNXL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Jul 2023 09:23:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231320AbjGJNXJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Jul 2023 09:23:09 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D937BE2
        for <linux-media@vger.kernel.org>; Mon, 10 Jul 2023 06:23:04 -0700 (PDT)
Received: from uno.LocalDomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 179FDDA7;
        Mon, 10 Jul 2023 15:22:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1688995327;
        bh=QKpNeSKW5e8AbrpNtPSuMYB/au8vcmPe2kyEIMgFs1U=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=nLLOmg5Y8lJU0JjR+G9pqAFHvIOuSrvaH/bPECJbbI0bD0GHD/UdYhUDUGJg+h3on
         DumMjCSY1K+H4hgXVbs96N+fRN0z0jewcYPIjhKt1riYfLuHE5IjBFmyKMAnD7pplW
         /y8hpi93pO1UHq8o5FUYGk1OwBTSgNODJ2kall20=
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v3 2/2] Documentation: v4l: Exposure/gain for camera sensor
Date:   Mon, 10 Jul 2023 15:22:40 +0200
Message-Id: <20230710132240.7864-3-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230710132240.7864-1-jacopo.mondi@ideasonboard.com>
References: <20230710132240.7864-1-jacopo.mondi@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Document the suggested way to exposure controls for exposure and gain
for camera sensor drivers.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 .../driver-api/media/camera-sensor.rst        | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/Documentation/driver-api/media/camera-sensor.rst b/Documentation/driver-api/media/camera-sensor.rst
index cd915ca119ea..67fe77b1edb9 100644
--- a/Documentation/driver-api/media/camera-sensor.rst
+++ b/Documentation/driver-api/media/camera-sensor.rst
@@ -189,3 +189,30 @@ the ``V4L2_CID_VFLIP`` and ``V4L2_CID_HFLIP`` controls with the
 a flip can potentially change the output buffer content layout. Flips should
 also be taken into account when enumerating and handling media bus formats
 on the camera sensor source pads.
+
+Exposure and Gain Control
+-------------------------
+
+Camera sensor drivers that allow applications to control the image exposure
+and gain should do so by exposing dedicated controls to applications.
+
+Exposure time is controlled by registering the ``V4L2_CID_EXPOSURE`` control.
+The control definition does not specify a unit to allow maximum flexibility
+for multiple device types, but when used for camera sensor drivers it should be
+expressed in unit of lines whenever possible.
+
+To convert lines into units of time, the total line length (visible and
+not visible pixels) has to be divided by the pixel rate::
+
+        line duration = total line length / pixel rate
+                      = (image width + horizontal blanking) / pixel rate
+
+Camera sensor driver should try whenever possible to distinguish between the
+analogue and digital gain control functions. Analogue gain is a multiplication
+factor applied to all color channels on the pixel array before they get
+converted into the digital domain. It should be made controllable by
+registering the ``V4L2_CID_ANALOGUE_GAIN`` control, expressed as a device
+specific gain code. Digital gain control is optional and should be exposed to
+applications by registering ``V4L2_CID_DIGITAL_GAIN``. Camera sensor drivers are
+discouraged from using ``V4L2_CID_GAIN`` as it doesn't allow differentiation of
+analogue vs digital gain.
-- 
2.40.1

