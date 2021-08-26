Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 848753F8DF1
	for <lists+linux-media@lfdr.de>; Thu, 26 Aug 2021 20:39:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243300AbhHZSja (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Aug 2021 14:39:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243241AbhHZSj3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Aug 2021 14:39:29 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3B0BC061757
        for <linux-media@vger.kernel.org>; Thu, 26 Aug 2021 11:38:41 -0700 (PDT)
Received: from localhost.localdomain (unknown [IPv6:2804:14c:485:504a:f5aa:2721:8538:a2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: festevam@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 065218311A;
        Thu, 26 Aug 2021 20:38:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1630003118;
        bh=b8QFrq1K95xpghvDAxRqMcGidmkl+Au4xJoOTuoBHYE=;
        h=From:To:Cc:Subject:Date:From;
        b=BSAaXCaIHe+Ft7901zEScnD5XKPYlcthGtZrew7ixx6ttPPaSXFAAWYgfYJ0Y5cXF
         HnDbYc1nyC4efvUxW4XTgLxjqeU+hg7+WR4DET3V6GiqY3V2YDfkbC7RfxsBBh3B/6
         W1f/fD83FpthIg8kGDbgktgfotLhwYTnuGTHufQs6kkKl/BRxxI8e/U1qv/qK9VoBp
         fQaKLXfIo23XQPDplyuUCJMuMNx2bmTA0Dd7kT0jrGtfeuzP38piM3M0XXdQ1FAjSc
         YS2gyqRr1ChkOZ2IyVHEA6O0KxWf7+ZJbL/Ed+wwtjpdo/GQ2z42t+QAAbmNtciDdB
         3QYiA4B4AsANQ==
From:   Fabio Estevam <festevam@denx.de>
To:     hverkuil-cisco@xs4all.nl
Cc:     mchehab+huawei@kernel.org, rmfrfs@gmail.com,
        laurent.pinchart@ideasonboard.com, linux-media@vger.kernel.org,
        sebastien.szymanski@armadeus.com, Fabio Estevam <festevam@denx.de>
Subject: [PATCH 1/2] media: imx7.rst: Provide an example for imx6ull-evk capture
Date:   Thu, 26 Aug 2021 15:38:18 -0300
Message-Id: <20210826183819.105804-1-festevam@denx.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

imx6ull-evk has a parallel OV5640 sensor.

Provide an example for imx6ull-evk capture to improve the document.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 Documentation/admin-guide/media/imx7.rst | 60 ++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/Documentation/admin-guide/media/imx7.rst b/Documentation/admin-guide/media/imx7.rst
index 1e442c97da47..4785ae8ac978 100644
--- a/Documentation/admin-guide/media/imx7.rst
+++ b/Documentation/admin-guide/media/imx7.rst
@@ -155,6 +155,66 @@ the resolutions supported by the sensor.
 	                [fmt:SBGGR10_1X10/800x600@1/30 field:none colorspace:srgb]
 	                -> "imx7-mipi-csis.0":0 [ENABLED]
 
+i.MX6ULL-EVK with OV5640
+------------------------
+
+On this platform a parallel OV5640 sensor is connected to the CSI port.
+The following example configures a video capture pipeline with an output
+of 640x480 and UYVY8_2X8 format:
+
+.. code-block:: none
+
+   # Setup links
+   media-ctl -l "'ov5640 1-003c':0 -> 'csi':0[1]"
+   media-ctl -l "'csi':1 -> 'csi capture':0[1]"
+
+   # Configure pads for pipeline
+   media-ctl -v -V "'ov5640 1-003c':0 [fmt:UYVY8_2X8/640x480 field:none]"
+
+After this streaming can start:
+
+.. code-block:: none
+
+   gst-launch-1.0 -v v4l2src device=/dev/video1 ! video/x-raw,format=UYVY,width=640,height=480 ! v4l2convert ! fbdevsink
+
+.. code-block:: none
+
+	# media-ctl -p
+	Media controller API version 5.14.0
+
+	Media device information
+	------------------------
+	driver          imx7-csi
+	model           imx-media
+	serial
+	bus info
+	hw revision     0x0
+	driver version  5.14.0
+
+	Device topology
+	- entity 1: csi (2 pads, 2 links)
+	            type V4L2 subdev subtype Unknown flags 0
+	            device node name /dev/v4l-subdev0
+	        pad0: Sink
+	                [fmt:UYVY8_2X8/640x480 field:none colorspace:srgb xfer:srgb ycbcr:601 quantization:full-range]
+	                <- "ov5640 1-003c":0 [ENABLED,IMMUTABLE]
+	        pad1: Source
+	                [fmt:UYVY8_2X8/640x480 field:none colorspace:srgb xfer:srgb ycbcr:601 quantization:full-range]
+	                -> "csi capture":0 [ENABLED,IMMUTABLE]
+
+	- entity 4: csi capture (1 pad, 1 link)
+	            type Node subtype V4L flags 0
+	            device node name /dev/video1
+	        pad0: Sink
+	                <- "csi":1 [ENABLED,IMMUTABLE]
+
+	- entity 10: ov5640 1-003c (1 pad, 1 link)
+	             type V4L2 subdev subtype Sensor flags 0
+	             device node name /dev/v4l-subdev1
+	        pad0: Source
+	                [fmt:UYVY8_2X8/640x480@1/30 field:none colorspace:srgb xfer:srgb ycbcr:601 quantization:full-range]
+	                -> "csi":0 [ENABLED,IMMUTABLE]
+
 References
 ----------
 
-- 
2.25.1

