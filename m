Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 391445D375
	for <lists+linux-media@lfdr.de>; Tue,  2 Jul 2019 17:49:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727242AbfGBPtX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Jul 2019 11:49:23 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:58400 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727236AbfGBPtV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Jul 2019 11:49:21 -0400
Received: from turingmachine.home (unknown [IPv6:2804:431:c7f4:61e7:d711:794d:1c68:5ed3])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tonyk)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 6926826056D;
        Tue,  2 Jul 2019 16:49:18 +0100 (BST)
From:   =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, hverkuil@xs4all.nl, helen.koike@collabora.com,
        kernel@collabora.com, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@collabora.com>
Subject: [PATCH 7/7] media: vimc.rst: Add output device
Date:   Tue,  2 Jul 2019 12:47:52 -0300
Message-Id: <20190702154752.14939-8-andrealmeid@collabora.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190702154752.14939-1-andrealmeid@collabora.com>
References: <20190702154752.14939-1-andrealmeid@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add information about the output device. Remove wrong information about
what the capture exposes.

Signed-off-by: André Almeida <andrealmeid@collabora.com>
---
 Documentation/media/v4l-drivers/vimc.rst | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/Documentation/media/v4l-drivers/vimc.rst b/Documentation/media/v4l-drivers/vimc.rst
index 4628b12d417f..ccc04101ea51 100644
--- a/Documentation/media/v4l-drivers/vimc.rst
+++ b/Documentation/media/v4l-drivers/vimc.rst
@@ -4,7 +4,8 @@ The Virtual Media Controller Driver (vimc)
 ==========================================
 
 The vimc driver emulates complex video hardware using the V4L2 API and the Media
-API. It has a capture device and three subdevices: sensor, debayer and scaler.
+API. It has a capture device, an output device and three subdevices: sensor,
+debayer and scaler.
 
 Topology
 --------
@@ -40,6 +41,7 @@ of commands fits for the default topology:
         v4l2-ctl -z platform:vimc -d "RGB/YUV Capture" -v width=1920,height=1440
         v4l2-ctl -z platform:vimc -d "Raw Capture 0" -v pixelformat=BA81
         v4l2-ctl -z platform:vimc -d "Raw Capture 1" -v pixelformat=BA81
+        v4l2-ctl -z platform:vimc -e "RGB/YUV Input" -v width=640,height=480
 
 Subdevices
 ----------
@@ -74,7 +76,13 @@ vimc-capture:
 	Exposes:
 
 	* 1 Pad sink
-	* 1 Pad source
+
+vimc-output:
+        Exposes node /dev/videoX to allow userspace to send frames to the
+        stream.
+        Exposes:
+
+        * 1 Source sink
 
 Module options
 ---------------
-- 
2.22.0

