Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62CE21C6E47
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2020 12:23:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728930AbgEFKXA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 May 2020 06:23:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:47562 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726354AbgEFKW7 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 6 May 2020 06:22:59 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 126522068E;
        Wed,  6 May 2020 10:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588760579;
        bh=bVT++xGeBIALzytE0FVZzuQCS5ohlHxqVEbtaWtmVUE=;
        h=From:To:Cc:Subject:Date:From;
        b=1EUoQVjuwjltOwoGyPGogrhUHOlS4+UZ0BfRc6uEggPaRUyDFbRcYfqwo7r4Rxyhp
         xUz+ylLunqdv8OamRnQ9ZAjq+Wh045ueDkkuNGx8M1eVKtR8VAl9X+BGp5rWrAVouA
         uQzaUHXwZIkf8vaQZiOS2YMmeYUGHy5rgKsvw9Pk=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jWHCb-002tSm-2I; Wed, 06 May 2020 12:22:57 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Alexandre Courbot <acourbot@chromium.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Maxime Jourdan <mjourdan@baylibre.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH] media: vidioc-enum-fmt.rst: make the ENUM_FMT text clearer
Date:   Wed,  6 May 2020 12:22:56 +0200
Message-Id: <a1c4af7c4925ce3d6cd96f6416da65a4ec0702bb.1588760571.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There are simply too many information at the same paragraph
when explaining the differences between MC and non-MC
centred devices.

Also, while using the V4L2_CAP_IO_MC flag to distinguish
it more formal, media developers understand the differences
as "MC-centric" and "video-node centric". So, add an alias
to make the text clearer for the targeted audience.

Fixes: e5b6b07a1b45 ("media: v4l2: Extend VIDIOC_ENUM_FMT to support MC-centric devices")
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../media/v4l/vidioc-enum-fmt.rst             | 41 ++++++++++++-------
 1 file changed, 26 insertions(+), 15 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst b/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
index 9694111772a2..aef6a69625b9 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
@@ -48,21 +48,32 @@ one until ``EINVAL`` is returned. If applicable, drivers shall return
 formats in preference order, where preferred formats are returned before
 (that is, with lower ``index`` value) less-preferred formats.
 
-If the driver doesn't advertise the ``V4L2_CAP_IO_MC`` :ref:`capability
-<device-capabilities>`, applications shall initialize the ``mbus_code`` field
-to zero and drivers shall ignore the value of the field.  Drivers shall
-enumerate all image formats. The enumerated formats may depend on the active
-input or output of the device.
-
-If the driver advertises the ``V4L2_CAP_IO_MC`` :ref:`capability
-<device-capabilities>`, applications may initialize the ``mbus_code`` field to
-a valid :ref:`media bus format code <v4l2-mbus-pixelcode>`. If the
-``mbus_code`` field is not zero, drivers shall restrict enumeration to only the
-image formats that can produce (for video output devices) or be produced from
-(for video capture devices) that media bus code.  Regardless of the value of
-the ``mbus_code`` field, the enumerated image formats shall not depend on the
-active configuration of the video device or device pipeline. Enumeration shall
-otherwise operate as previously described.
+1) If the driver doesn't advertise the ``V4L2_CAP_IO_MC`` :ref:`capability
+   <device-capabilities>` (also known as a 'video node centric' driver)
+
+   Applications shall initialize the ``mbus_code`` field to zero and drivers
+   shall ignore the value of the field.
+
+   Drivers shall enumerate all image formats.
+
+   .. note::
+
+      After switching input or output the list of enumerated image
+      formats may be different.
+
+2) If the driver advertises the ``V4L2_CAP_IO_MC`` :ref:`capability
+   <device-capabilities>` (also known as a 'MC-centric' driver)
+
+   Applications may initialize the ``mbus_code`` field to a valid
+   :ref:`media bus format code <v4l2-mbus-pixelcode>`.
+
+   If the ``mbus_code`` field is not zero, drivers shall restrict enumeration
+   to only the image formats that can produce (for video output devices) or
+   be produced from (for video capture devices) that media bus code.
+   Regardless of the value of the ``mbus_code`` field, the enumerated image
+   formats shall not depend on the active configuration of the video device
+   or device pipeline. Enumeration shall otherwise operate as previously
+   described.
 
 
 .. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
-- 
2.25.4

