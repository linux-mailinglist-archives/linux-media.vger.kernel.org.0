Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C4D31A2212
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2020 14:31:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728733AbgDHMb5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Apr 2020 08:31:57 -0400
Received: from mail-qk1-f195.google.com ([209.85.222.195]:39990 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728207AbgDHMb4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Apr 2020 08:31:56 -0400
Received: by mail-qk1-f195.google.com with SMTP id z15so2906304qki.7
        for <linux-media@vger.kernel.org>; Wed, 08 Apr 2020 05:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=9ltAP/cIyjU7SzMHZMqNA6IC/+PEcup1EeNOp7ZdocY=;
        b=JFWj55x/kWt2eAeYw2u523v410Z4bjCSJW68Lp9NF0xNDjECNV3bwrsDe00CZujkYB
         xGm5OjuXdxd5mpGbxa7iJTET9FdIpE8yga6Z5SDIfJYtVcO8/FCMdDngh1e37extj5ik
         Ma9ZldBp3wnHmc+TqS0mVG/a5n93FQ6hsKxQWzIvnrXHp2BF4vpxOun05zAnLW6IfJIv
         IfyQco66P4r6XYKLHReYsDi/8/VeZkQ5hr21jJHZEyF8WbC/Y4N8YvLyx5yYW9G1wwck
         3hBNvixqmrcfh0QFQI8v4fU0HU3Rv3UwpGK7njRfq9GYM/mhXln/UQToKpNToWRklWkb
         RVtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=9ltAP/cIyjU7SzMHZMqNA6IC/+PEcup1EeNOp7ZdocY=;
        b=URoULSpMUTDOUYMHQgtvg8rRe9ohbnaF6wShXZbt2IkjB7czvPJkeQ4JrPm/MlZm7R
         hNbCT0I15elPMSPx8OmBPUzjV5SpQs8a/p4RqbfsFrNIi0QAZrXVTnpqiRD09nk4CeMB
         q9KNWGxbUy+paum9Rk4Egdbzifi7CyCyD3B/sFa5gFtE2yPPBE+s6xK8Ibf/1qAX2UaH
         wXYwaH987OrxW1mzvysfbzQTzAtc2GUlBYi5elRYbGKNZEpYUwy0uOtz+POuvCztCRHj
         XaNcLH1CB7iPg+lEukpqhfhmIUVe2BJH596B/isaEGoKb7jmfbJK80yRxlEYu4v1bkvE
         sPhQ==
X-Gm-Message-State: AGi0PuaIUBskkGYTi59DV1ZtK/A7c+mA81TuI+uZCxFUzNbxAIW+pgPE
        PbMI3zmN6HvpyqZRJo3g6TR8JwR0upo=
X-Google-Smtp-Source: APiQypJTbWpmR28ak2B844lZZPDHfs9qQ81M582qqa6YGMil6QfBHYlQvq4h9ZkhJdmVOMTCYF8mzg==
X-Received: by 2002:a37:34d:: with SMTP id 74mr7422893qkd.438.1586349115404;
        Wed, 08 Apr 2020 05:31:55 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:482:5bb::4])
        by smtp.gmail.com with ESMTPSA id z40sm9120377qtj.45.2020.04.08.05.31.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2020 05:31:54 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     hverkuil-cisco@xs4all.nl
Cc:     slongerbeam@gmail.com, p.zabel@pengutronix.de,
        linux-media@vger.kernel.org, Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 4/4] media: imx.rst: Provide streaming examples for imx6q-sabresd
Date:   Wed,  8 Apr 2020 09:32:15 -0300
Message-Id: <20200408123215.2531-4-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200408123215.2531-1-festevam@gmail.com>
References: <20200408123215.2531-1-festevam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Improve the documentation by providing examples on how to test camera
capture on imx6q-sabresd via v4l2-ctl and Gstreamer. 

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 Documentation/media/v4l-drivers/imx.rst | 42 +++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/Documentation/media/v4l-drivers/imx.rst b/Documentation/media/v4l-drivers/imx.rst
index 37b944f12d93..c872cc84d9fc 100644
--- a/Documentation/media/v4l-drivers/imx.rst
+++ b/Documentation/media/v4l-drivers/imx.rst
@@ -670,6 +670,28 @@ Streaming can then begin on "ipu1_ic_prpenc capture" node. The v4l2-ctl
 tool can be used to select any supported YUV or RGB pixelformat on the
 capture device node.
 
+In order to determine what is the /dev/video node correspondent to
+"ipu1_ic_prpenc":
+
+.. code-block:: none
+
+   # dmesg | grep ipu1_ic_prpenc | grep Registered
+   ipu1_ic_prpenc: Registered ipu1_ic_prpenc capture as /dev/video1
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
 The following example configures unprocessed video capture pipeline to
 capture from the OV5640, transmitting on MIPI CSI-2 virtual channel 0:
 
@@ -690,6 +712,26 @@ Streaming can then begin on "ipu1_csi0 capture" node. The v4l2-ctl
 tool can be used to select any supported YUV or RGB pixelformat on the
 capture device node.
 
+In order to determine what is the /dev/video node correspondent to "ipu1_csi0":
+
+.. code-block:: none
+
+   # dmesg | grep ipu1_csi0 | grep Registered
+   ipu1_csi0: Registered ipu1_csi0 capture as /dev/video0
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
 
 Known Issues
 ------------
-- 
2.17.1

