Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F09B074640A
	for <lists+linux-media@lfdr.de>; Mon,  3 Jul 2023 22:29:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230294AbjGCU3d (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Jul 2023 16:29:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229947AbjGCU3b (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Jul 2023 16:29:31 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1ADCE4E
        for <linux-media@vger.kernel.org>; Mon,  3 Jul 2023 13:29:30 -0700 (PDT)
Received: from uno.localdomain (85-160-45-219.reb.o2.cz [85.160.45.219])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 662642589;
        Mon,  3 Jul 2023 22:28:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1688416125;
        bh=uckIxM5HxR8qadxd/UPKRwAvbaP6BUyy7y77anqZB4I=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fd33aeSLnm9j6jLVqzPi5e59UK/e7yjz5TiybVsMn9NRm5ZDaQMXEKhq8+NH2Vj/h
         7r5sshY1tURZEI494lR302SJY06C/4DYCPVudfWPZF+xt3azzPFcSXMLg7NDGE5+nL
         GSfOlX6mc/JvUyYbYguqC9vzkzRYwCM6MnlS7B3w=
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH 2/2] Documentation: v4l: Exposure/gain for camera sensor
Date:   Mon,  3 Jul 2023 22:29:10 +0200
Message-Id: <20230703202910.31142-3-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230703202910.31142-1-jacopo.mondi@ideasonboard.com>
References: <20230703202910.31142-1-jacopo.mondi@ideasonboard.com>
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

Document the suggested way to exposure controls for exposure and gain
for camera sensor drivers.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 .../driver-api/media/camera-sensor.rst        | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/driver-api/media/camera-sensor.rst b/Documentation/driver-api/media/camera-sensor.rst
index ee4a7fe5f72a..dfe8f35aecea 100644
--- a/Documentation/driver-api/media/camera-sensor.rst
+++ b/Documentation/driver-api/media/camera-sensor.rst
@@ -189,3 +189,22 @@ the ``V4L2_CID_VFLIP`` and ``V4L2_CID_HFLIP`` controls with the
 a flip can potentially change the output buffer content layout. Flips should
 also be taken into account when enumerating and handling media bus formats
 on the camera sensor source pads.
+
+Exposure and Gain Control
+-------------------------
+
+Camera sensor drivers that allows applications to control the image exposure
+and gain should do so by exposing dedicated controls to applications.
+
+Exposure time is controlled by registering the ``V4L2_CID_EXPOSURE`` control.
+The control definition does not specify a unit to allow maximum flexibility
+for multiple device types, but when used for camera sensor driver it should be
+expressed in unit of lines whenever possible.
+
+Camera sensor driver should try whenever possible to distinguish between the
+analogue and digital gain control functions. Analogue gain is a multiplier
+factor applied to all color channels on the pixel array before they get
+converted in the digital domain. It should be be made controllable by
+registering the ``V4L2_CID_ANALOGUE_GAIN`` control, expressed as a device
+specific gain code. Digital gain control is optional and should be exposed to
+applications by registering ``V4L2_CID_DIGITAL_GAIN``. Camera sensor drivers are
-- 
2.40.1

