Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E4317E17B
	for <lists+linux-media@lfdr.de>; Thu,  1 Aug 2019 19:56:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730959AbfHAR4F (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Aug 2019 13:56:05 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:35082 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727508AbfHAR4F (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Aug 2019 13:56:05 -0400
Received: by mail-qt1-f193.google.com with SMTP id d23so71189423qto.2
        for <linux-media@vger.kernel.org>; Thu, 01 Aug 2019 10:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=UXJJHcR+1pZrYag7d+Rq7LpFshNrVftJBn/whn+VgNo=;
        b=J/+XNOwunsrE1bHlgk7oQFL8sfotNPEDVctLKsWAMYc8cqj3uTNkTvcCIvYDQJmPb4
         n2p2GlJPTW6kLlMOxtfpFIWh0whAu2VX8YsQL+li1SZO6G71TSNMxrnHmdjA4vqRR9v6
         92USJvt7lBjyW5CFOCcZL/U075vGtm1lnhszaJ3TOHmKi6qyg+dF8lkwGH5wqfBnPnpQ
         ebjh9evYjMpBd+xlYLHbPy14dApCQGES2ID+lNI4+of/sHnNUnMYqJ33oFDQr1Xo7EzY
         RT1oxr+U673JSFfcEdHRhze7UlA0l1gbRGwmx1xHy8Wrzz+QK9gYy4G1YdoCGBFGqheX
         rrHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=UXJJHcR+1pZrYag7d+Rq7LpFshNrVftJBn/whn+VgNo=;
        b=MZ2S4cfUDtQJaDUwB8fIRkGDOHaA+akYJ7T2jvtRS5ayyu8NqXT6iYWprVPDEpUSfB
         61nFZxSMd6plVST/9ODLjVlpTzLE0c5peCE9CPw9/MlwBIkJSk1i8YaaNpEh57ZOOnum
         5ACFbOm4qDJMBcyKqO8Cs5LEWnA5wnrxJOHU0wjzs4ZnEi0/54OKrmMumQTsRW3X9Svw
         bKn0EZY32vZtDLjDxXCyKpN1sU3zPNDS681xYUAVtfH2d0naQWczXwRPdXbYG+tEh9QA
         KV7fVSZhPehMguoIUtLqyv383BvNvI0EEempTNW8FzxBZnww+tzvLo+WZgHk4Vw/1XFW
         kYkA==
X-Gm-Message-State: APjAAAUEqqTNa4/G/2QwL7/5TcGSbhYKqO03XsWu6m8Qdj8GQTtxZEIN
        kCIsZwLSqwDbP5jAnhMpjU8=
X-Google-Smtp-Source: APXvYqxouNHwhFu2wJCR5yQiHzx0QzIMUI8CTGfxVobc7xZ7ycfpHrlClrIie18B+8rLayIhZgzH5g==
X-Received: by 2002:ac8:768b:: with SMTP id g11mr94100519qtr.182.1564682164208;
        Thu, 01 Aug 2019 10:56:04 -0700 (PDT)
Received: from fabio-Latitude-E5450.am.freescale.net ([177.221.114.206])
        by smtp.gmail.com with ESMTPSA id 39sm39662893qts.41.2019.08.01.10.56.00
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 01 Aug 2019 10:56:03 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     sakari.ailus@iki.fi
Cc:     hverkuil@xs4all.nl, rmfrfs@gmail.com, mchehab@kernel.org,
        linux-media@vger.kernel.org, Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2] media: imx7.rst: Fix the references to the CSI multiplexer
Date:   Thu,  1 Aug 2019 14:56:11 -0300
Message-Id: <20190801175611.22441-1-festevam@gmail.com>
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
Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>
---
Changes since v1:
- Make sure "make htmldocs" generates a proper HTML document without
build warnings (Mauro)

 Documentation/media/v4l-drivers/imx7.rst | 127 +++++++++++------------
 1 file changed, 63 insertions(+), 64 deletions(-)

diff --git a/Documentation/media/v4l-drivers/imx7.rst b/Documentation/media/v4l-drivers/imx7.rst
index fe411f65c01c..1e442c97da47 100644
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
+	# media-ctl -p
+	Media controller API version 5.2.0
+
+	Media device information
+	------------------------
+	driver          imx7-csi
+	model           imx-media
+	serial
+	bus info
+	hw revision     0x0
+	driver version  5.2.0
+
+	Device topology
+	- entity 1: csi (2 pads, 2 links)
+	            type V4L2 subdev subtype Unknown flags 0
+	            device node name /dev/v4l-subdev0
+	        pad0: Sink
+	                [fmt:SBGGR10_1X10/800x600 field:none colorspace:srgb xfer:srgb ycbcr:601 quantization:full-range]
+	                <- "csi-mux":2 [ENABLED]
+	        pad1: Source
+	                [fmt:SBGGR10_1X10/800x600 field:none colorspace:srgb xfer:srgb ycbcr:601 quantization:full-range]
+	                -> "csi capture":0 [ENABLED]
+
+	- entity 4: csi capture (1 pad, 1 link)
+	            type Node subtype V4L flags 0
+	            device node name /dev/video0
+	        pad0: Sink
+	                <- "csi":1 [ENABLED]
+
+	- entity 10: csi-mux (3 pads, 2 links)
+	             type V4L2 subdev subtype Unknown flags 0
+	             device node name /dev/v4l-subdev1
+	        pad0: Sink
+	                [fmt:Y8_1X8/1x1 field:none]
+	        pad1: Sink
+	               [fmt:SBGGR10_1X10/800x600 field:none]
+	                <- "imx7-mipi-csis.0":1 [ENABLED]
+	        pad2: Source
+	                [fmt:SBGGR10_1X10/800x600 field:none]
+	                -> "csi":0 [ENABLED]
+
+	- entity 14: imx7-mipi-csis.0 (2 pads, 2 links)
+	             type V4L2 subdev subtype Unknown flags 0
+	             device node name /dev/v4l-subdev2
+	        pad0: Sink
+	                [fmt:SBGGR10_1X10/800x600 field:none]
+	                <- "ov2680 1-0036":0 [ENABLED]
+	        pad1: Source
+	                [fmt:SBGGR10_1X10/800x600 field:none]
+	                -> "csi-mux":1 [ENABLED]
+
+	- entity 17: ov2680 1-0036 (1 pad, 1 link)
+	             type V4L2 subdev subtype Sensor flags 0
+	             device node name /dev/v4l-subdev3
+	        pad0: Source
+	                [fmt:SBGGR10_1X10/800x600@1/30 field:none colorspace:srgb]
+	                -> "imx7-mipi-csis.0":0 [ENABLED]
 
 References
 ----------
-- 
2.17.1

