Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EAC635AACD
	for <lists+linux-media@lfdr.de>; Sat, 29 Jun 2019 14:16:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727069AbfF2MQe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 29 Jun 2019 08:16:34 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:41220 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726916AbfF2MQd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 29 Jun 2019 08:16:33 -0400
Received: by mail-qt1-f193.google.com with SMTP id d17so9464813qtj.8
        for <linux-media@vger.kernel.org>; Sat, 29 Jun 2019 05:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=6vyR68aIFR5VQwG5aNCPKb1XJnuGkPINWUgL53vw6MM=;
        b=o5O0s83X0UDaEVlelNF3x/g1wM6bDSzN7KonEO8Ige6RxcizVxwjbiKjZWe3w+wA2U
         fnEI+z+J1lqicZ9beOiOR5NDQbDnHtXTiZstRgzd1SAJXHZUWB7+Cztho4HSmNTznFvo
         wRNlrvAAw8Wdf+0EPg/FGw6NztnR68oFoKqAZxsrnmeoNULNF7wgmfLnRbE8rWloQJir
         ZHpJd6Mg+udP7YWCzj6i4Opdxqqqgcp+WzaAOFm06D4nFmmfWwZJHlIpmrD4DtZuUlGj
         XT1/HSfQEyYhfG+Tj8N2Ox4WejAPyJn0PVj1jwvjQi2/+DfBgVd0jlgj7AsF1hJY7xiO
         7kMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=6vyR68aIFR5VQwG5aNCPKb1XJnuGkPINWUgL53vw6MM=;
        b=nf1FnJNEx82gCXSA7RJu4WfRyMmwLddDauus9dBAW0076XGbFhZ4ZltUAJ9AjRFocX
         tUcggWjYjIKvKdUGjtjlXoTrB/u09cBe8R9AEaO0bRKGho+XEJtjMZRliJs+SKVsYN2A
         GFy6DqKTWOzsceW7kJK6h0ACZ6JdJRsG2/kq+1iLmnUMv+HVWn5X1fvAyfjUONZVK9/t
         tjX7rjHypEOBAjAhuF1zvfdGXP+qeMY2N87BSH7IhMeRoGrpTwqAzDzKL9WxlQ5sBy7n
         ZdotgKnuyCnw1NfhVlWn3atuWWO2THIsN0AFpr6Lwjx5/8kak2nyl0iXQTPHMYCJchlg
         sqhA==
X-Gm-Message-State: APjAAAUp6B9hsBdXVcn6fL/mL6qoAuTr+4JhZLZDuueF3rCBqjp2Fraj
        JDQjp+tPzeDHY+JVt36z4u4=
X-Google-Smtp-Source: APXvYqwUnn34LPLue34g9BkLUGq+0dtX1u/pn63210p7Dn30nomxZweRAPXR/2hEBPX0v1+bSsm8Qg==
X-Received: by 2002:ac8:768b:: with SMTP id g11mr12685114qtr.182.1561810592519;
        Sat, 29 Jun 2019 05:16:32 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:482:3c8:56cb:1049:60d2:137b])
        by smtp.gmail.com with ESMTPSA id l63sm2303845qkb.124.2019.06.29.05.16.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 29 Jun 2019 05:16:31 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     hverkuil@xs4all.nl
Cc:     sakari.ailus@iki.fi, rmfrfs@gmail.com, linux-media@vger.kernel.org,
        slongerbeam@gmail.com, p.zabel@pengutronix.de, mchehab@kernel.org,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] media: imx7.rst: Fix the references to the CSI multiplexer
Date:   Sat, 29 Jun 2019 09:16:23 -0300
Message-Id: <20190629121623.18069-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In imx7s.dtsi the node name for the CSI multiplexer is "csi-mux", not
"csi_mux", so fix all the references in the document.

This fixes the following error when the instructions are followed:

# media-ctl -l "'imx7-mipi-csis.0':1 -> 'csi_mux':1[1]"
Unable to parse link: Invalid argument (22)

While at it, provide the "media-ctl -p" output from 5.2 kernel
version, so that users can see a more updated output.

Fixes: fa88fbdafb4a ("media: imx7.rst: add documentation for i.MX7 media driver")
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 Documentation/media/v4l-drivers/imx7.rst | 127 +++++++++++------------
 1 file changed, 63 insertions(+), 64 deletions(-)

diff --git a/Documentation/media/v4l-drivers/imx7.rst b/Documentation/media/v4l-drivers/imx7.rst
index fe411f65c01c..ab9e17d111bf 100644
--- a/Documentation/media/v4l-drivers/imx7.rst
+++ b/Documentation/media/v4l-drivers/imx7.rst
@@ -41,7 +41,7 @@ data from MIPI CSI-2 camera sensor. It has one source pad, corresponding to the
 virtual channel 0. This module is compliant to previous version of Samsung
 D-phy, and supports two D-PHY Rx Data lanes.
 
-csi_mux
+csi-mux
 -------
 
 This is the video multiplexer. It has two sink pads to select from either camera
@@ -56,7 +56,7 @@ can interface directly with Parallel and MIPI CSI-2 buses. It has 256 x 64 FIFO
 to store received image pixel data and embedded DMA controllers to transfer data
 from the FIFO through AHB bus.
 
-This entity has one sink pad that receives from the csi_mux entity and a single
+This entity has one sink pad that receives from the csi-mux entity and a single
 source pad that routes video frames directly to memory buffers. This pad is
 routed to a capture device node.
 
@@ -81,14 +81,14 @@ an output of 800x600, and BGGR 10 bit bayer format:
 
    # Setup links
    media-ctl -l "'ov2680 1-0036':0 -> 'imx7-mipi-csis.0':0[1]"
-   media-ctl -l "'imx7-mipi-csis.0':1 -> 'csi_mux':1[1]"
-   media-ctl -l "'csi_mux':2 -> 'csi':0[1]"
+   media-ctl -l "'imx7-mipi-csis.0':1 -> 'csi-mux':1[1]"
+   media-ctl -l "'csi-mux':2 -> 'csi':0[1]"
    media-ctl -l "'csi':1 -> 'csi capture':0[1]"
 
    # Configure pads for pipeline
    media-ctl -V "'ov2680 1-0036':0 [fmt:SBGGR10_1X10/800x600 field:none]"
-   media-ctl -V "'csi_mux':1 [fmt:SBGGR10_1X10/800x600 field:none]"
-   media-ctl -V "'csi_mux':2 [fmt:SBGGR10_1X10/800x600 field:none]"
+   media-ctl -V "'csi-mux':1 [fmt:SBGGR10_1X10/800x600 field:none]"
+   media-ctl -V "'csi-mux':2 [fmt:SBGGR10_1X10/800x600 field:none]"
    media-ctl -V "'imx7-mipi-csis.0':0 [fmt:SBGGR10_1X10/800x600 field:none]"
    media-ctl -V "'csi':0 [fmt:SBGGR10_1X10/800x600 field:none]"
 
@@ -97,64 +97,63 @@ the resolutions supported by the sensor.
 
 .. code-block:: none
 
-    root@imx7s-warp:~# media-ctl -p
-    Media controller API version 4.17.0
-
-    Media device information
-    ------------------------
-    driver          imx-media
-    model           imx-media
-    serial
-    bus info
-    hw revision     0x0
-    driver version  4.17.0
-
-    Device topology
-    - entity 1: csi (2 pads, 2 links)
-		type V4L2 subdev subtype Unknown flags 0
-		device node name /dev/v4l-subdev0
-	    pad0: Sink
-		    [fmt:SBGGR10_1X10/800x600 field:none]
-		    <- "csi_mux":2 [ENABLED]
-	    pad1: Source
-		    [fmt:SBGGR10_1X10/800x600 field:none]
-		    -> "csi capture":0 [ENABLED]
-
-    - entity 4: csi capture (1 pad, 1 link)
-		type Node subtype V4L flags 0
-		device node name /dev/video0
-	    pad0: Sink
-		    <- "csi":1 [ENABLED]
-
-    - entity 10: csi_mux (3 pads, 2 links)
-		type V4L2 subdev subtype Unknown flags 0
-		device node name /dev/v4l-subdev1
-	    pad0: Sink
-		    [fmt:unknown/0x0]
-	    pad1: Sink
-		    [fmt:unknown/800x600 field:none]
-		    <- "imx7-mipi-csis.0":1 [ENABLED]
-	    pad2: Source
-		    [fmt:unknown/800x600 field:none]
-		    -> "csi":0 [ENABLED]
-
-    - entity 14: imx7-mipi-csis.0 (2 pads, 2 links)
-		type V4L2 subdev subtype Unknown flags 0
-		device node name /dev/v4l-subdev2
-	    pad0: Sink
-		    [fmt:SBGGR10_1X10/800x600 field:none]
-		    <- "ov2680 1-0036":0 [ENABLED]
-	    pad1: Source
-		    [fmt:SBGGR10_1X10/800x600 field:none]
-		    -> "csi_mux":1 [ENABLED]
-
-    - entity 17: ov2680 1-0036 (1 pad, 1 link)
-		type V4L2 subdev subtype Sensor flags 0
-		device node name /dev/v4l-subdev3
-	    pad0: Source
-		    [fmt:SBGGR10_1X10/800x600 field:none]
-		    -> "imx7-mipi-csis.0":0 [ENABLED]
-
+# media-ctl -p
+Media controller API version 5.2.0
+
+Media device information
+------------------------
+driver          imx7-csi
+model           imx-media
+serial
+bus info
+hw revision     0x0
+driver version  5.2.0
+
+Device topology
+- entity 1: csi (2 pads, 2 links)
+            type V4L2 subdev subtype Unknown flags 0
+            device node name /dev/v4l-subdev0
+        pad0: Sink
+                [fmt:SBGGR10_1X10/800x600 field:none colorspace:srgb xfer:srgb ycbcr:601 quantization:full-range]
+                <- "csi-mux":2 [ENABLED]
+        pad1: Source
+                [fmt:SBGGR10_1X10/800x600 field:none colorspace:srgb xfer:srgb ycbcr:601 quantization:full-range]
+                -> "csi capture":0 [ENABLED]
+
+- entity 4: csi capture (1 pad, 1 link)
+            type Node subtype V4L flags 0
+            device node name /dev/video0
+        pad0: Sink
+                <- "csi":1 [ENABLED]
+
+- entity 10: csi-mux (3 pads, 2 links)
+             type V4L2 subdev subtype Unknown flags 0
+             device node name /dev/v4l-subdev1
+        pad0: Sink
+                [fmt:Y8_1X8/1x1 field:none]
+        pad1: Sink
+                [fmt:SBGGR10_1X10/800x600 field:none]
+                <- "imx7-mipi-csis.0":1 [ENABLED]
+        pad2: Source
+                [fmt:SBGGR10_1X10/800x600 field:none]
+                -> "csi":0 [ENABLED]
+
+- entity 14: imx7-mipi-csis.0 (2 pads, 2 links)
+             type V4L2 subdev subtype Unknown flags 0
+             device node name /dev/v4l-subdev2
+        pad0: Sink
+                [fmt:SBGGR10_1X10/800x600 field:none]
+                <- "ov2680 1-0036":0 [ENABLED]
+        pad1: Source
+                [fmt:SBGGR10_1X10/800x600 field:none]
+                -> "csi-mux":1 [ENABLED]
+
+- entity 17: ov2680 1-0036 (1 pad, 1 link)
+             type V4L2 subdev subtype Sensor flags 0
+             device node name /dev/v4l-subdev3
+        pad0: Source
+                [fmt:SBGGR10_1X10/800x600@1/30 field:none colorspace:srgb]
+                -> "imx7-mipi-csis.0":0 [ENABLED]
 
 References
 ----------
-- 
2.17.1

