Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C8CC30A49D
	for <lists+linux-media@lfdr.de>; Mon,  1 Feb 2021 10:48:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232593AbhBAJsr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Feb 2021 04:48:47 -0500
Received: from retiisi.eu ([95.216.213.190]:60090 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232290AbhBAJsr (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 1 Feb 2021 04:48:47 -0500
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 7B5EE634C92;
        Mon,  1 Feb 2021 11:46:47 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     djrscally@gmail.com
Subject: [PATCH 1/1] Documentation: media: camera-sensor: The unit of hblank is pixels
Date:   Mon,  1 Feb 2021 11:39:14 +0200
Message-Id: <20210201093914.12994-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The unit of the horizontal blanking control on raw sensors is pixels, not
lines. Document this correctly.

Fixes: e4cf8c58af75 ("media: Documentation: media: Document how to write camera sensor drivers")
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 Documentation/driver-api/media/camera-sensor.rst | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/driver-api/media/camera-sensor.rst b/Documentation/driver-api/media/camera-sensor.rst
index 3fc378b3b269..9c863e3a79ba 100644
--- a/Documentation/driver-api/media/camera-sensor.rst
+++ b/Documentation/driver-api/media/camera-sensor.rst
@@ -94,9 +94,10 @@ large variety of devices beyond camera sensors. Devices that have no analogue
 crop, use the full source image size, i.e. pixel array size.
 
 Horizontal and vertical blanking are specified by ``V4L2_CID_HBLANK`` and
-``V4L2_CID_VBLANK``, respectively. The unit of these controls are lines. The
-pixel rate is specified by ``V4L2_CID_PIXEL_RATE`` in the same sub-device. The
-unit of that control is Hz.
+``V4L2_CID_VBLANK``, respectively. The unit of the ``V4L2_CID_HBLANK`` control
+is pixels and the unit of the ``V4L2_CID_VBLANK`` is lines. The pixel rate is
+specified by ``V4L2_CID_PIXEL_RATE`` in the same sub-device. The unit of that
+control is Hz.
 
 Register list based drivers need to implement read-only sub-device nodes for the
 purpose. Devices that are not register list based need these to configure the
-- 
2.29.2

