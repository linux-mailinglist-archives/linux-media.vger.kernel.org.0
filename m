Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E16841A0666
	for <lists+linux-media@lfdr.de>; Tue,  7 Apr 2020 07:15:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727081AbgDGFPR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Apr 2020 01:15:17 -0400
Received: from mga01.intel.com ([192.55.52.88]:55653 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726876AbgDGFPQ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 7 Apr 2020 01:15:16 -0400
IronPort-SDR: kfeDF+lUw6K9u7wGQg1UhXTE1a8nOSmLp9hxJCav9E1/K0qxHKiD3mmmmE19uupjwd9W9zT6wz
 xsdwRQkDCilQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2020 22:15:16 -0700
IronPort-SDR: zVPnbL9SxB9Cs5PwOZQ8psqcxZgzVWUX3J010EGHmhG4t+EdiOvIVGFbhR68ohXW3iL6jeLC71
 oXInmi179/iQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,353,1580803200"; 
   d="scan'208";a="452318814"
Received: from ipu5-build.bj.intel.com ([10.238.232.196])
  by fmsmga006.fm.intel.com with ESMTP; 06 Apr 2020 22:15:14 -0700
From:   Bingbu Cao <bingbu.cao@intel.com>
To:     linux-media@vger.kernel.org
Cc:     sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
        tfiga@chromium.org, bingbu.cao@intel.com,
        bingbu.cao@linux.intel.com
Subject: [PATCH] media: ipu3.rst: add explanation for running mode
Date:   Tue,  7 Apr 2020 13:19:02 +0800
Message-Id: <1586236742-7176-1-git-send-email-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add some explanation of the ImgU running mode and add more information
about firmware selection and running mode usage.

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
---
 Documentation/media/v4l-drivers/ipu3.rst | 27 +++++++++++++++++++++++----
 drivers/staging/media/ipu3/TODO          |  4 ----
 2 files changed, 23 insertions(+), 8 deletions(-)

diff --git a/Documentation/media/v4l-drivers/ipu3.rst b/Documentation/media/v4l-drivers/ipu3.rst
index a694f49491f9..f49f70fbb5bb 100644
--- a/Documentation/media/v4l-drivers/ipu3.rst
+++ b/Documentation/media/v4l-drivers/ipu3.rst
@@ -231,12 +231,31 @@ Configuring the Intel IPU3
 The IPU3 ImgU pipelines can be configured using the Media Controller, defined at
 :ref:`media_controller`.
 
-Firmware binary selection
+Running mode and firmware binary selection
 -------------------------
+ImgU works based on firmware, currently the ImgU firmware support run 2 pipes in
+time-sharing with single input frame data. Each pipe can run at certain mode -
+"VIDEO" or "STILL", "VIDEO" mode is commonly used for video frames capture, and
+"STILL" is used for still frame capture. However, you can also select "VIDEO" to
+capture still frames if you want to capture images with less system load and
+power. For "STILL" mode, ImgU will try to use smaller BDS factor and output
+larger bayer frame for further YUV processing than "VIDEO" mode to get high
+quality images. Besides, "STILL" mode need some more hardware blocks and image
+processing such as XNR, hence "STILL" mode will need more power and memory
+bandwidth than "VIDEO" mode. TNR will be enabled in "VIDEO" mode and bypassed by
+"STILL" mode. ImgU is running at “VIDEO” mode by default, the user can use v4l2
+control V4L2_CID_INTEL_IPU3_MODE (currently defined in
+drivers/staging/media/ipu3/include/intel-ipu3.h) to query and set the running
+mode. For user, there is no difference for buffer queueing between the "VIDEO"
+and "STILL" mode, mandatory input and main output node should be enabled and
+buffers need be queued, the statistics and the view-finder queues are optional.
+
+The firmware binary will be selected according to current running mode, such log
+"using binary if_to_osys_striped " or "using binary if_to_osys_primary_striped"
+could be observed if you enable the ImgU dynamic debug, the binary
+if_to_osys_striped is selected for "VIDEO" and the binary
+"if_to_osys_primary_striped" is selected for "STILL".
 
-The firmware binary is selected using the V4L2_CID_INTEL_IPU3_MODE, currently
-defined in drivers/staging/media/ipu3/include/intel-ipu3.h . "VIDEO" and "STILL"
-modes are available.
 
 Processing the image in raw Bayer format
 ----------------------------------------
diff --git a/drivers/staging/media/ipu3/TODO b/drivers/staging/media/ipu3/TODO
index 52063b651810..af3f79194d7b 100644
--- a/drivers/staging/media/ipu3/TODO
+++ b/drivers/staging/media/ipu3/TODO
@@ -12,7 +12,3 @@ staging directory.
 
 - Elaborate the functionality of different selection rectangles in driver
   documentation. This may require driver changes as well.
-
-- Document different operation modes, and which buffer queues are relevant
-  in each mode. To process an image, which queues require a buffer an in
-  which ones is it optional?
-- 
2.7.4

