Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 620E61A134A
	for <lists+linux-media@lfdr.de>; Tue,  7 Apr 2020 20:05:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726339AbgDGSFK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Apr 2020 14:05:10 -0400
Received: from mail-qv1-f45.google.com ([209.85.219.45]:34031 "EHLO
        mail-qv1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726277AbgDGSFK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Apr 2020 14:05:10 -0400
Received: by mail-qv1-f45.google.com with SMTP id s18so2311894qvn.1
        for <linux-media@vger.kernel.org>; Tue, 07 Apr 2020 11:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=xcQMc8rMnI+c/5L4XTggg1iFo5j1UQx4frRe1PfEPBU=;
        b=Y3TzKxku3/YJyc+7yZUlHhMeHEqgmaOlJsu+Zj/uVwAU/MXaCYRsAChsVVnPKLEK76
         Xaj0cowYW2Ay6Y0pMkfNXaNevCQXCOsk5ihtzzIBs4osTyb5ZNSWvAIfOHUXwK+m8VKU
         +e80TlcyFG2MtbfY5Mj9dUMgcNTNxW5pY7su3tdq/3s8SR/hKpC+2VQ3QDfrhUT86Y0F
         OmyKmBzGGDEieMSMtinWi2hnFNJnruLW2YOdKIycQyh8nobgedKQYm09bq7iOGTq/WYC
         D7pCK+ToQI7BfNZFalR1/5AXlqRlBPrwmaQoXvewdIjDt0nbIYtPwXbufiN+6lxO/7Hv
         9RNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=xcQMc8rMnI+c/5L4XTggg1iFo5j1UQx4frRe1PfEPBU=;
        b=OeesLBX9fdug5wOB69zHMnr9AZbURaZqNhsLksKBksS277Cpd9Cd66FgK0aT1cNcsS
         wKop5+Nitmw1aA15YgMkgvftoVkudQ2yz4JFM585PQZgs8qik2yOTtqL58JmNmkzpJhi
         IEZm+aEJwyhza/Ne6q5PV+SbdEKUajv7Ito/XEXSJTJV0xy7DqH8dbpsQAO+R7kF65rH
         RimqDYv/8f+3M2cFEzd9XP07BkJQ2f3Drv2wVSrhy1w9k1FFk9L/W6ov8+UNY+CarWfO
         b2Z2IgzHhT/ltwce8Xd2zuQgoCgB3cOVGDBUuz6UMUfDrIWC2Jjn0q8Z5NpxY/FGnKbp
         oKDA==
X-Gm-Message-State: AGi0PubsMz2yKqlePm0SBLb54H+BsSK5k60gkwc/TDcDBLFyaRN1hSF6
        gj9gov9gHjaro6McLSd/b18=
X-Google-Smtp-Source: APiQypJCwkKOpbpoOSk+T+j66uE9qomwQFuQfSYQ45YATOESHOBIVwbTaeh5e9bV0hWrx13TskY8Qw==
X-Received: by 2002:a05:6214:1367:: with SMTP id c7mr3366934qvw.22.1586282708473;
        Tue, 07 Apr 2020 11:05:08 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:482:5bb::4])
        by smtp.gmail.com with ESMTPSA id p186sm11420506qkb.71.2020.04.07.11.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2020 11:05:07 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     slongerbeam@gmail.com
Cc:     p.zabel@pengutronix.de, linux-media@vger.kernel.org,
        Fabio Estevam <festevam@gmail.com>
Subject: [RFC] media: imx.rst: Fix the links/pads configuration for imx6qsabresd
Date:   Tue,  7 Apr 2020 15:05:34 -0300
Message-Id: <20200407180534.2871-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The current instructions do not lead to functional capture on
a i.MX6Q sabresd board.

Fix the instructions so that users can get the OV5640 camera to
work by default.

Tested by two methods:

1. Using v4l2-ctl:

# v4l2-ctl --stream-mmap -d /dev/video0

2. Using a Gstreamer pipeline that captures from the camera and direct
the image to the display:

# gst-launch-1.0 v4l2src ! kmssink

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Hi Steve,

Were the instructions written based on a i.MX6DL sabresd?

I don't have access to a i.MX6DL sabresd board to confirm if they
are still working, but I noticed that these instructions do not work on
a i.MX6Q sabresd board, so that's why I modified it and now the capture
works fine here.

Please advise.

Thanks

 Documentation/media/v4l-drivers/imx.rst | 24 ++++++++++--------------
 1 file changed, 10 insertions(+), 14 deletions(-)

diff --git a/Documentation/media/v4l-drivers/imx.rst b/Documentation/media/v4l-drivers/imx.rst
index 1246573c1019..0588060ead27 100644
--- a/Documentation/media/v4l-drivers/imx.rst
+++ b/Documentation/media/v4l-drivers/imx.rst
@@ -645,27 +645,23 @@ The OV5640 module connects to MIPI connector J5 (sorry I don't have the
 compatible module part number or URL).
 
 The following example configures a direct conversion pipeline to capture
-from the OV5640, transmitting on MIPI CSI-2 virtual channel 1. $sensorfmt
-can be any format supported by the OV5640. $sensordim is the frame
-dimension part of $sensorfmt (minus the mbus pixel code). $outputfmt can
-be any format supported by the ipu1_ic_prpenc entity at its output pad:
+from the OV5640, transmitting on MIPI CSI-2 virtual channel 1:
 
 .. code-block:: none
 
    # Setup links
    media-ctl -l "'ov5640 1-003c':0 -> 'imx6-mipi-csi2':0[1]"
-   media-ctl -l "'imx6-mipi-csi2':2 -> 'ipu1_csi1':0[1]"
-   media-ctl -l "'ipu1_csi1':1 -> 'ipu1_ic_prp':0[1]"
-   media-ctl -l "'ipu1_ic_prp':1 -> 'ipu1_ic_prpenc':0[1]"
-   media-ctl -l "'ipu1_ic_prpenc':1 -> 'ipu1_ic_prpenc capture':0[1]"
+   media-ctl -l "'imx6-mipi-csi2':1 -> 'ipu1_csi0_mux':[1]"
+   media-ctl -l "'ipu1_csi0_mux':2 -> 'ipu1_csi0':[1]"
+   media-ctl -l "'ipu1_csi0':2 -> 'ipu1_csi0 capture':0[1]"
+
    # Configure pads
-   media-ctl -V "'ov5640 1-003c':0 [fmt:$sensorfmt field:none]"
-   media-ctl -V "'imx6-mipi-csi2':2 [fmt:$sensorfmt field:none]"
-   media-ctl -V "'ipu1_csi1':1 [fmt:AYUV32/$sensordim field:none]"
-   media-ctl -V "'ipu1_ic_prp':1 [fmt:AYUV32/$sensordim field:none]"
-   media-ctl -V "'ipu1_ic_prpenc':1 [fmt:$outputfmt field:none]"
+   media-ctl -V "'ov5640 1-003c':0 [fmt:UYVY2X8/640x480 field:none]"
+   media-ctl -V "'imx6-mipi-csi2':2 [fmt:UYVY2X8/640x480 field:none]"
+   media-ctl -V "'ipu1_csi0_mux':0[fmt:UYVY2X8/640x480]"
+   media-ctl -V "'ipu1_csi0':0[fmt:UYVY2X8/640x480]"
 
-Streaming can then begin on "ipu1_ic_prpenc capture" node. The v4l2-ctl
+Streaming can then begin on "ipu1_csi0 capture" node. The v4l2-ctl
 tool can be used to select any supported YUV or RGB pixelformat on the
 capture device node.
 
-- 
2.17.1

