Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0789255760
	for <lists+linux-media@lfdr.de>; Fri, 28 Aug 2020 11:17:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728932AbgH1JRL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Aug 2020 05:17:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:48530 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728362AbgH1JQy (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Aug 2020 05:16:54 -0400
Received: from mail.kernel.org (unknown [95.90.213.181])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 23AB1208CA;
        Fri, 28 Aug 2020 09:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598606213;
        bh=BINRLNO/WzZxpSvpKg/DSQZ1C+g7y3QuKMPwUQv2Ut8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=MDq9wP9RaZhC1OKHCjwVC9xegBqpCsydBihStMI8lok8cOKf7HZeSZ8HVYpT4/1yp
         ZrMsqbhxen+8KDCGh7K3YCoZSJUMQBTGvwlyze/LpBW8Pu4aqJSVXtn3RPYDBv9OpW
         J5pizsyGTfTN6ZK21TyMBJ9ChSQo9iBq0Zn2sveY=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kBaV9-0047AB-7a; Fri, 28 Aug 2020 11:16:51 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Subject: [PATCH v11 1/4] media: open.rst: better document device node naming
Date:   Fri, 28 Aug 2020 11:16:47 +0200
Message-Id: <7a33a2ad9d8ad46446971d3ef2a5bb780eb50c9d.1598606093.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1598606093.git.mchehab+huawei@kernel.org>
References: <cover.1598606093.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Right now, only kAPI documentation describes the device naming.
However, such description is needed at the uAPI too. Add it,
and describe how to get an unique identifier for a given device.

Acked-by: Hans Verkuil <hans.verkuil@cisco.com>
Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../userspace-api/media/v4l/open.rst          | 43 +++++++++++++++++--
 1 file changed, 40 insertions(+), 3 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/open.rst b/Documentation/userspace-api/media/v4l/open.rst
index 38046ef20141..7f1ff8a77059 100644
--- a/Documentation/userspace-api/media/v4l/open.rst
+++ b/Documentation/userspace-api/media/v4l/open.rst
@@ -14,12 +14,14 @@ Opening and Closing Devices
 ***************************
 
 
-Device Naming
-=============
+.. _v4l2_device_naming:
+
+V4L2 Device Node Naming
+=======================
 
 V4L2 drivers are implemented as kernel modules, loaded manually by the
 system administrator or automatically when a device is first discovered.
-The driver modules plug into the "videodev" kernel module. It provides
+The driver modules plug into the ``videodev`` kernel module. It provides
 helper functions and a common application interface specified in this
 document.
 
@@ -30,6 +32,41 @@ option CONFIG_VIDEO_FIXED_MINOR_RANGES. In that case minor numbers
 are allocated in ranges depending on the device node type (video, radio,
 etc.).
 
+The device nodes supported by the Video4Linux subsystem are:
+
+======================== ====================================================
+Default device node name Usage
+======================== ====================================================
+``/dev/videoX``		 Video and metadata for capture/output devices
+``/dev/vbiX``		 Vertical blank data (i.e. closed captions, teletext)
+``/dev/radioX``		 Radio tuners and modulators
+``/dev/swradioX``	 Software Defined Radio tuners and modulators
+``/dev/v4l-touchX``	 Touch sensors
+``/dev/v4l-subdevX``	 Video sub-devices (used by sensors and other
+			 components of the hardware peripheral)\ [#]_
+======================== ====================================================
+
+Where ``X`` is a non-negative integer.
+
+.. note::
+
+   1. The actual device node name is system-dependent, as udev rules may apply.
+   2. There is no guarantee that ``X`` will remain the same for the same
+      device, as the number depends on the device driver's probe order.
+      If you need an unique name, udev default rules produce
+      ``/dev/v4l/by-id/`` and ``/dev/v4l/by-path/`` directories containing
+      links that can be used uniquely to identify a V4L2 device node::
+
+	$ tree /dev/v4l
+	/dev/v4l
+	├── by-id
+	│   └── usb-OmniVision._USB_Camera-B4.04.27.1-video-index0 -> ../../video0
+	└── by-path
+	    └── pci-0000:00:14.0-usb-0:2:1.0-video-index0 -> ../../video0
+
+.. [#] **V4L2 sub-device nodes** (e. g. ``/dev/v4l-subdevX``) use a different
+       set of system calls, as covered at :ref:`subdev`.
+
 Many drivers support "video_nr", "radio_nr" or "vbi_nr" module
 options to select specific video/radio/vbi node numbers. This allows the
 user to request that the device node is named e.g. /dev/video5 instead
-- 
2.26.2

