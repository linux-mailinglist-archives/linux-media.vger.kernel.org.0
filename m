Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF660747184
	for <lists+linux-media@lfdr.de>; Tue,  4 Jul 2023 14:38:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231406AbjGDMij (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jul 2023 08:38:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230232AbjGDMii (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jul 2023 08:38:38 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACC8FF7
        for <linux-media@vger.kernel.org>; Tue,  4 Jul 2023 05:38:37 -0700 (PDT)
Received: from uno.localdomain (85-160-42-71.reb.o2.cz [85.160.42.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B12A1D4A;
        Tue,  4 Jul 2023 14:37:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1688474272;
        bh=WoxWjyS8mgakFb7lTiM99yQ/NNJCkldsdfjOkMETbkE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=lGLLubW/Fg9ysbBovTa2bXd11dc6xznR6xTgU7W/oyPi63uvevyBLJaFP3KJh5Omp
         hSyT0LVmR8JtWefxuu/aheaTv82JQMaUGrTy6UeBpjEaEKa7R0TLV9SgXDWBxEqVlQ
         8AZurNB4XDp66+o7GzcMAMJXQuhecK3383p3VQt0=
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 1/2] Documentation: v4l: Flip handling for RAW sensors
Date:   Tue,  4 Jul 2023 14:38:18 +0200
Message-Id: <20230704123819.156418-2-jacopo.mondi@ideasonboard.com>
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

Document the requirement of notifying to userspace the possible
re-ordering of the color sample components when a vertical or horizontal
flip is applied to a RAW camera sensor.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 Documentation/driver-api/media/camera-sensor.rst | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/driver-api/media/camera-sensor.rst b/Documentation/driver-api/media/camera-sensor.rst
index 93f4f2536c25..7516d61a903d 100644
--- a/Documentation/driver-api/media/camera-sensor.rst
+++ b/Documentation/driver-api/media/camera-sensor.rst
@@ -173,3 +173,19 @@ V4L2_CID_VFLIP controls with the values programmed by the register sequences.
 The default values of these controls shall be 0 (disabled). Especially these
 controls shall not be inverted, independently of the sensor's mounting
 rotation.
+
+Flip handling for raw camera color sensors
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Applying vertical and horizontal flips on raw camera sensors inverts the color
+sample reading direction on the sensor's pixel array. This may cause the
+re-ordering of the color samples on the sensor's output frame. As an example, a
+raw camera sensor with a Bayer pattern color filter array with a native RGGB
+Bayer order will produce frames with GRBG component ordering when an horizontal
+flip is applied. Camera sensor drivers where inverting the reading order
+direction causes a re-ordering of the color components are requested to register
+the ``V4L2_CID_VFLIP`` and ``V4L2_CID_HFLIP`` controls with the
+``V4L2_CTRL_FLAG_MODIFY_LAYOUT`` flag enabled to notify userspace that enabling
+a flip can potentially change the output buffer content layout. Flips should
+also be taken into account when enumerating and handling media bus formats
+on the camera sensor source pads.
-- 
2.40.1

