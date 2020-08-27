Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7393F253EEA
	for <lists+linux-media@lfdr.de>; Thu, 27 Aug 2020 09:21:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728111AbgH0HV5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Aug 2020 03:21:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:55622 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728092AbgH0HVw (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Aug 2020 03:21:52 -0400
Received: from mail.kernel.org (ip5f5ad5a8.dynamic.kabel-deutschland.de [95.90.213.168])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4318722BF3;
        Thu, 27 Aug 2020 07:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598512912;
        bh=ut0KVfmGm8XdutWFr2zP/KNRnKFt2wtRlb9QfBuJG3s=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=HjqPmH6LDRMj/FloVZt+3N/mJhTks3OpG87osNvMM+dVjfdIkQNdmKxM3dmUuhbmR
         4zu67/BCGfhB10AXP/q9jxMECbrZl+vWL6EAkTm1U6ew6nZ1uDo4NAo7O1gQcWl//4
         N6VVQHnTtLclJ8BKHPamwFiN9wM12lwG1VQXakyM=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kBCEI-002s5E-8X; Thu, 27 Aug 2020 09:21:50 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Subject: [PATCH v10 1/4] media: open.rst: better document device node naming
Date:   Thu, 27 Aug 2020 09:21:45 +0200
Message-Id: <b2eec3a6928660ca6a0f18580725026771669787.1598512802.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1598512802.git.mchehab+huawei@kernel.org>
References: <cover.1598512802.git.mchehab+huawei@kernel.org>
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
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../userspace-api/media/v4l/open.rst          | 43 +++++++++++++++++--
 1 file changed, 40 insertions(+), 3 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/open.rst b/Documentation/userspace-api/media/v4l/open.rst
index 38046ef20141..332763053292 100644
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
+Where ``X`` is a non-negative number.
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

