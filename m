Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 539961A3808
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2020 18:29:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726975AbgDIQ33 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Apr 2020 12:29:29 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:39380 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726706AbgDIQ33 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Apr 2020 12:29:29 -0400
Received: by mail-qt1-f194.google.com with SMTP id o10so378294qtr.6
        for <linux-media@vger.kernel.org>; Thu, 09 Apr 2020 09:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=OtJZwSLn11Kwe6u9NgIgEbPCDkD2EDEfs9ZSWlyMdWI=;
        b=G7v8XEQtn17XM27gcCLBlbLPG7CWbnJjGNjvSNgbus3YQki8QH5nyw5pC66JhevNje
         5OmPksvHFAM9VRCmT7mnZFVB6Drw1W90b4vjfvkI+Pmrb2JGkMcvSonSESplpXgNFnXZ
         WdIPTPOAABnXlKXV1DkpTEasijRQIUB8WPYhf0qfSeEXPNTK5hj++4OTK2e3czdUsTgm
         D0qi1ZeOaEKcwSSUvA8fqOCkSPXysMELrG4HIE5/b4zGCwRhauwu7Fo8Tv66YvSIPbDN
         aTAPnH1kBrMQmaNSgrkLWyEyYCKFivUXaQ3oh4ZW8BRAsVap0Qo5LCWY9dyAcHzOb2Rc
         C0Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=OtJZwSLn11Kwe6u9NgIgEbPCDkD2EDEfs9ZSWlyMdWI=;
        b=A7lfU6B00a0vomlK//vMSWkxPyHV2xUhfQJwgy263WBRn6ZzBwMXALgQW/PQwy+wF1
         LRFvXgDcsLSeo/IBjH7qVRYZ8DEc6Rsecd8O7K2HKU4m/zlMcVN5FT8e8zZ0SrQeuh11
         CMJ2irVf0u/J1XNX1SFbT/HOLS+txyHqHN359qDaRBhscdNFfR49TFYc818aRZJ9Bkb3
         kHH12+6UekOat9OrKcFgElBUUs5QLP17vPEdyZUniUxfigKpSckkN/zYxz+1rz6Bp9La
         +V6Cidz3dX/pdi2So6+Bd1py8xuhH732x9g0UMLCoxt5rmWiZXankGqgqT/u2EiNbqaS
         8+eg==
X-Gm-Message-State: AGi0PuasFpE2ikSoHLuQI23wbwWQZuvVGOcszCYcaY341cRgFsIMmjQk
        X4vRe+ClM+j1BUpIhjz0P8Q=
X-Google-Smtp-Source: APiQypJ/CHF2S0Snyamz4vJ/WQ9hrwa8UOQT53NGoiNYMSmVMYLEgX/nGSBWvri02/tNoEl0+JTFew==
X-Received: by 2002:ac8:22ad:: with SMTP id f42mr164508qta.292.1586449767154;
        Thu, 09 Apr 2020 09:29:27 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:482:5bb::3])
        by smtp.gmail.com with ESMTPSA id x66sm16980587qka.121.2020.04.09.09.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2020 09:29:26 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     hverkuil-cisco@xs4all.nl
Cc:     slongerbeam@gmail.com, p.zabel@pengutronix.de,
        linux-media@vger.kernel.org, Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 4/4] media: imx.rst: Provide streaming examples for imx6q-sabresd
Date:   Thu,  9 Apr 2020 13:29:45 -0300
Message-Id: <20200409162945.3559-4-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200409162945.3559-1-festevam@gmail.com>
References: <20200409162945.3559-1-festevam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Improve the documentation by providing examples on how to test camera
capture on imx6q-sabresd via v4l2-ctl and Gstreamer.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v1:
- Use media-ctl -e to determine the video node. (Steve)

 Documentation/media/v4l-drivers/imx.rst | 45 +++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/Documentation/media/v4l-drivers/imx.rst b/Documentation/media/v4l-drivers/imx.rst
index 955d27582e10..025f21def7dc 100644
--- a/Documentation/media/v4l-drivers/imx.rst
+++ b/Documentation/media/v4l-drivers/imx.rst
@@ -664,6 +664,28 @@ Streaming can then begin on "ipu1_csi0 capture" node. The v4l2-ctl
 tool can be used to select any supported pixelformat on the capture
 device node.
 
+To determine what is the /dev/video node correspondent to
+"ipu1_csi0 capture":
+
+.. code-block:: none
+
+   media-ctl -e "ipu1_csi0 capture"
+   /dev/video0
+
+/dev/video0 is the streaming element in this case.
+
+Starting the streaming via v4l2-ctl:
+
+.. code-block:: none
+
+   v4l2-ctl --stream-mmap -d /dev/video0
+
+Starting the streaming via Gstreamer and sending the content to the display:
+
+.. code-block:: none
+
+   gst-launch-1.0 v4l2src device=/dev/video0 ! kmssink
+
 The following example configures a direct conversion pipeline to capture
 from the OV5640, transmitting on MIPI CSI-2 virtual channel 0. It also
 shows colorspace conversion and scaling at IC output.
@@ -689,6 +711,29 @@ shows colorspace conversion and scaling at IC output.
 
 Streaming can then begin on "ipu1_ic_prpenc capture" node.
 
+To determine what is the /dev/video node correspondent to
+"ipu1_ic_prpenc capture":
+
+.. code-block:: none
+
+   media-ctl -e "ipu1_ic_prpenc capture"
+   /dev/video1
+
+
+/dev/video1 is the streaming element in this case.
+
+Starting the streaming via v4l2-ctl:
+
+.. code-block:: none
+
+   v4l2-ctl --stream-mmap -d /dev/video1
+
+Starting the streaming via Gstreamer and sending the content to the display:
+
+.. code-block:: none
+
+   gst-launch-1.0 v4l2src device=/dev/video1 ! kmssink
+
 Known Issues
 ------------
 
-- 
2.17.1

