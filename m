Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28CBA1AD9EA
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2020 11:31:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730218AbgDQJal (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Apr 2020 05:30:41 -0400
Received: from mga11.intel.com ([192.55.52.93]:8847 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730175AbgDQJak (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Apr 2020 05:30:40 -0400
IronPort-SDR: ADZzsRpHQbW94AmwZbr1Ii74sJSYSGtxCm4f1tWb/E4v6AWUxcgGIHA2/h5LziLrqp4jbw9aDf
 PUYW+ypXaw6A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2020 02:30:40 -0700
IronPort-SDR: NhYlKrkoToBtobL2VjP2EhiapmVmferMZgMtarg1CX4J5iYKuSuqNhF6LzckOXoVLYSuR2qObz
 BMQhhZ5oh7+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,394,1580803200"; 
   d="scan'208";a="257527310"
Received: from ipu5-build.bj.intel.com ([10.238.232.196])
  by orsmga006.jf.intel.com with ESMTP; 17 Apr 2020 02:30:37 -0700
From:   Bingbu Cao <bingbu.cao@intel.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        laurent.pinchart@ideasonboard.com
Cc:     tfiga@chromium.org, bingbu.cao@intel.com,
        bingbu.cao@linux.intel.com
Subject: [PATCH v2] media: ipu3.rst: add explanation for running mode
Date:   Fri, 17 Apr 2020 17:34:33 +0800
Message-Id: <1587116073-22406-1-git-send-email-bingbu.cao@intel.com>
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
index a694f49491f9..4d0e41aab47e 100644
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
+quality images. Besides, "STILL" mode need XNR3 to do noise reduction, hence
+"STILL" mode will need more power and memory bandwidth than "VIDEO" mode. TNR
+will be enabled in "VIDEO" mode and bypassed by "STILL" mode. ImgU is running at
+“VIDEO” mode by default, the user can use v4l2 control V4L2_CID_INTEL_IPU3_MODE
+(currently defined in drivers/staging/media/ipu3/include/intel-ipu3.h) to query
+and set the running mode. For user, there is no difference for buffer queueing
+between the "VIDEO" and "STILL" mode, mandatory input and main output node
+should be enabled and buffers need be queued, the statistics and the view-finder
+queues are optional.
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

