Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0AF919775D
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2020 11:01:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729828AbgC3JBf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Mar 2020 05:01:35 -0400
Received: from mga12.intel.com ([192.55.52.136]:39025 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729704AbgC3JBf (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Mar 2020 05:01:35 -0400
IronPort-SDR: hgu5gAFrnsjPJgxyQqiXSKTU3dFyv5m8SGuSsZLPw+kbpfZlr+IvVxfMszxG/Q1kpoTHTOgzAa
 0dadGoeGuUBw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2020 02:01:35 -0700
IronPort-SDR: 2iotQe0EytwfOoKVD70lxUGNBAzRb9uPtnKBqOuzAnxM+8HbwZH2cUMwzXZbwUtxCEZxddymO4
 SSgaHWIBqCig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,323,1580803200"; 
   d="scan'208";a="448199670"
Received: from ipu5-build.bj.intel.com ([10.238.232.196])
  by fmsmga005.fm.intel.com with ESMTP; 30 Mar 2020 02:01:34 -0700
From:   Bingbu Cao <bingbu.cao@intel.com>
To:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Cc:     sakari.ailus@linux.intel.com, tfiga@google.com,
        bingbu.cao@linux.intel.com, bingbu.cao@intel.com
Subject: [PATCH] media: doc-rst: add yavta test example in ipu3 docs
Date:   Mon, 30 Mar 2020 17:05:14 +0800
Message-Id: <1585559114-25762-1-git-send-email-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch add yavta test command in ipu3.rst as an example on how to
run simple ImgU test using yavta.

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
---
 Documentation/media/v4l-drivers/ipu3.rst | 13 +++++++++++++
 drivers/staging/media/ipu3/TODO          |  2 --
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/Documentation/media/v4l-drivers/ipu3.rst b/Documentation/media/v4l-drivers/ipu3.rst
index a694f49491f9..35417567417e 100644
--- a/Documentation/media/v4l-drivers/ipu3.rst
+++ b/Documentation/media/v4l-drivers/ipu3.rst
@@ -363,6 +363,19 @@ v4l2n --pipe=4 --load=/tmp/frame-#.bin --open=/dev/video4
 --output=/tmp/frames.3A --fmt=type:META_CAPTURE,?
 --reqbufs=count:1,type:META_CAPTURE --pipe=1,2,3,4 --stream=5
 
+You can also use yavta [#f2]_ command to do same thing as above:
+
+.. code-block:: none
+
+	yavta --data-prefix -Bcapture-mplane -c10 -n5 -I -s2592x1944 \
+	--file=frame-#.out-f NV12 /dev/video5 & \
+	yavta --data-prefix -Bcapture-mplane -c10 -n5 -I -s2592x1944 \
+	--file=frame-#.vf -f NV12 /dev/video6 & \
+	yavta --data-prefix -Bmeta-capture -c10 -n5 -I \
+	--file=frame-#.3a /dev/video7 & \
+	yavta --data-prefix -Boutput-mplane -c10 -n5 -I -s2592x1944 \
+	--file=/tmp/frame-in.cio2 -f IPU3_SGRBG10 /dev/video4
+
 where /dev/video4, /dev/video5, /dev/video6 and /dev/video7 devices point to
 input, output, viewfinder and 3A statistics video nodes respectively.
 
diff --git a/drivers/staging/media/ipu3/TODO b/drivers/staging/media/ipu3/TODO
index 52063b651810..4bcb665cb5f7 100644
--- a/drivers/staging/media/ipu3/TODO
+++ b/drivers/staging/media/ipu3/TODO
@@ -8,8 +8,6 @@ staging directory.
 - IPU3 driver documentation (Laurent)
   Comments on configuring v4l2 subdevs for CIO2 and ImgU.
 
-- Switch to yavta from v4l2n in driver docs.
-
 - Elaborate the functionality of different selection rectangles in driver
   documentation. This may require driver changes as well.
 
-- 
2.7.4

