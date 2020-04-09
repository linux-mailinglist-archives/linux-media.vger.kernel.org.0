Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93F011A3805
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2020 18:29:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726936AbgDIQ3T (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Apr 2020 12:29:19 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:41827 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726706AbgDIQ3T (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Apr 2020 12:29:19 -0400
Received: by mail-qt1-f194.google.com with SMTP id i3so367758qtv.8
        for <linux-media@vger.kernel.org>; Thu, 09 Apr 2020 09:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=9P7rafqbXxs9JOuSQyiPCNhemqH5gCU5YG9s65U6l4Y=;
        b=gI8YDLF2+vG87fxXOQmeYSh7sXfgmw4grvhCSbJbnpKOyxhk8+oxWLBHnwkrHIqA6n
         fxtJMx4eIHOaekJi0MknOGK5pDUiacsypOFfegnntrwhKen+9FiPp0AgnSwopTD/V9bq
         8WgVHCZ1TBokcBU1WTRMJAiSBIX/MpRRMq5beuP0iRrSnSM8dmk9DoBTTn+VhQt/viEy
         vvGQ3+DIJj/u8tb2Na2tXp6sMpJfEedAShd7p2vHmf8ZxAX6u+psZ5yUBE9Fdie/JNqZ
         BNvRitM47pmU7h2NQjRmiRUxn++SV+uqPDnPt//1s1tYUYceEMX3Qh1tb/gp/uZUn6ql
         itYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=9P7rafqbXxs9JOuSQyiPCNhemqH5gCU5YG9s65U6l4Y=;
        b=UeuHjcc08H+/99bthFHEahpn3dcrhJ88nTzsHTx+xh5FBxuvhr7JsS+8xVe/41UCoI
         5vVQXxG+zUPNS5Oagej7xGB2xkbb5lDBJ/ZpWiCgvhPRDwGRZpylaAtUZHOfr7PFr763
         JUZ4/r6/FMmRfvMmE5I/W6ntensWUXjJgu+DZF4KgheGHhx4ZGT8N0Ggv7gB2RFZNTUE
         zC2cCsn00u9t347h3BAF0HLxhBPDN7ePM5IdEH16kyKVnklIshnaK2hnf/y1fqJRui40
         LMyWimsnrUKtxcn+8lmjAo7Tn0TBPmS6iw1UtrAdZ6bw5XNDIKd/p2VJBCaQWRfTTb8E
         IZHw==
X-Gm-Message-State: AGi0PubLc05La5UukmnjGo59l98mi6whNqpgfqpBWcrO/JC2igMPpp2G
        peWdTu+WOT7EN2S3PTxAZxpQ9868YRo=
X-Google-Smtp-Source: APiQypLcDT86pEDmPyrMGti9u+Gkf2lUqsH3tBtD5la9rps3KMWA/sg6V75XXdzVDAFo/RGmW53z4Q==
X-Received: by 2002:ac8:5388:: with SMTP id x8mr147608qtp.21.1586449758637;
        Thu, 09 Apr 2020 09:29:18 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:482:5bb::3])
        by smtp.gmail.com with ESMTPSA id x66sm16980587qka.121.2020.04.09.09.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2020 09:29:17 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     hverkuil-cisco@xs4all.nl
Cc:     slongerbeam@gmail.com, p.zabel@pengutronix.de,
        linux-media@vger.kernel.org, Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 1/4] media: imx.rst: Fix the MIPI CSI-2 virtual channel
Date:   Thu,  9 Apr 2020 13:29:42 -0300
Message-Id: <20200409162945.3559-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The current instructions for imx6q-sabresd do not lead to functional
capture on OV5640 MIPI CSI-2.

The reason for this, as explained by Steve Longerbeam, is that OV5640 by
default transmits on virtual channel 0, not channel 1 as is given in the
instructions.

Adapt the instructions to use virtual channel 0 so that a working
camera setup can be achieved on imx6q-sabresd.

Also, since we are using an IC direct conversion pipeline, improve
the example by demonstrating colorspace and scaling.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v1:
- Demonstrate colorspace and scaling. (Steve)

 Documentation/media/v4l-drivers/imx.rst | 31 ++++++++++++-------------
 1 file changed, 15 insertions(+), 16 deletions(-)

diff --git a/Documentation/media/v4l-drivers/imx.rst b/Documentation/media/v4l-drivers/imx.rst
index 1246573c1019..b8df91f83f14 100644
--- a/Documentation/media/v4l-drivers/imx.rst
+++ b/Documentation/media/v4l-drivers/imx.rst
@@ -645,30 +645,29 @@ The OV5640 module connects to MIPI connector J5 (sorry I don't have the
 compatible module part number or URL).
 
 The following example configures a direct conversion pipeline to capture
-from the OV5640, transmitting on MIPI CSI-2 virtual channel 1. $sensorfmt
-can be any format supported by the OV5640. $sensordim is the frame
-dimension part of $sensorfmt (minus the mbus pixel code). $outputfmt can
-be any format supported by the ipu1_ic_prpenc entity at its output pad:
+from the OV5640, transmitting on MIPI CSI-2 virtual channel 0. It also
+shows colorspace conversion and scaling at IC output.
 
 .. code-block:: none
 
    # Setup links
    media-ctl -l "'ov5640 1-003c':0 -> 'imx6-mipi-csi2':0[1]"
-   media-ctl -l "'imx6-mipi-csi2':2 -> 'ipu1_csi1':0[1]"
-   media-ctl -l "'ipu1_csi1':1 -> 'ipu1_ic_prp':0[1]"
+   media-ctl -l "'imx6-mipi-csi2':1 -> 'ipu1_csi0_mux':0[1]"
+   media-ctl -l "'ipu1_csi0_mux':2 -> 'ipu1_csi0':0[1]"
+   media-ctl -l "'ipu1_csi0':1 -> 'ipu1_ic_prp':0[1]"
    media-ctl -l "'ipu1_ic_prp':1 -> 'ipu1_ic_prpenc':0[1]"
    media-ctl -l "'ipu1_ic_prpenc':1 -> 'ipu1_ic_prpenc capture':0[1]"
    # Configure pads
-   media-ctl -V "'ov5640 1-003c':0 [fmt:$sensorfmt field:none]"
-   media-ctl -V "'imx6-mipi-csi2':2 [fmt:$sensorfmt field:none]"
-   media-ctl -V "'ipu1_csi1':1 [fmt:AYUV32/$sensordim field:none]"
-   media-ctl -V "'ipu1_ic_prp':1 [fmt:AYUV32/$sensordim field:none]"
-   media-ctl -V "'ipu1_ic_prpenc':1 [fmt:$outputfmt field:none]"
-
-Streaming can then begin on "ipu1_ic_prpenc capture" node. The v4l2-ctl
-tool can be used to select any supported YUV or RGB pixelformat on the
-capture device node.
-
+   media-ctl -V "'ov5640 1-003c':0 [fmt:UYVY2X8/640x480]"
+   media-ctl -V "'imx6-mipi-csi2':1 [fmt:UYVY2X8/640x480]"
+   media-ctl -V "'ipu1_csi0_mux':2 [fmt:UYVY2X8/640x480]"
+   media-ctl -V "'ipu1_csi0':1 [fmt:AYUV32/640x480]"
+   media-ctl -V "'ipu1_ic_prp':1 [fmt:AYUV32/640x480]"
+   media-ctl -V "'ipu1_ic_prpenc':1 [fmt:ARGB8888_1X32/800x600]"
+   # Set a format at the capture interface
+   v4l2-ctl -d /dev/video1 --set-fmt-video=pixelformat=RGB3
+
+Streaming can then begin on "ipu1_ic_prpenc capture" node.
 
 Known Issues
 ------------
-- 
2.17.1

