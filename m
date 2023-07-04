Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E00E747186
	for <lists+linux-media@lfdr.de>; Tue,  4 Jul 2023 14:38:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231449AbjGDMim (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jul 2023 08:38:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231446AbjGDMil (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jul 2023 08:38:41 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4327FE70
        for <linux-media@vger.kernel.org>; Tue,  4 Jul 2023 05:38:40 -0700 (PDT)
Received: from uno.localdomain (85-160-42-71.reb.o2.cz [85.160.42.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 80B5710A0;
        Tue,  4 Jul 2023 14:37:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1688474273;
        bh=aJ9KpbxKud37T7zSYo2vPYryYEpWMdd6S7B3dt8klM0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SPM0yOh8cENV4WYzAZqeX9YPY4n08yN3YLIthLrIWERrO2GooDPdX/4iojqR6yyxZ
         vsGAMovKDyvoctnQZyH0UqhfkAsnnbkLKbDBb3eyI7e2oU8Xorcg9Ic6gtzje9c5CV
         co8G6W2KKjus1lRpkyZFOGXl80E+6GHn2LyKOS6c=
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 2/2] Documentation: v4l: Exposure/gain for camera sensor
Date:   Tue,  4 Jul 2023 14:38:19 +0200
Message-Id: <20230704123819.156418-3-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230704123819.156418-1-jacopo.mondi@ideasonboard.com>
References: <20230704123819.156418-1-jacopo.mondi@ideasonboard.com>
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

Document the suggested way to exposure controls for exposure and gain
for camera sensor drivers.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 .../driver-api/media/camera-sensor.rst        | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/Documentation/driver-api/media/camera-sensor.rst b/Documentation/driver-api/media/camera-sensor.rst
index 7516d61a903d..fb70d55f6671 100644
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
+analogue and digital gain control functions. Analogue gain is a multiplier
+factor applied to all color channels on the pixel array before they get
+converted in the digital domain. It should be made controllable by
+registering the ``V4L2_CID_ANALOGUE_GAIN`` control, expressed as a device
+specific gain code. Digital gain control is optional and should be exposed to
+applications by registering ``V4L2_CID_DIGITAL_GAIN``. Camera sensor drivers are
+discouraged from using ``V4L2_CID_GAIN`` as it doesn't allow differentiation of
+analogue vs digital gain.
-- 
2.40.1

