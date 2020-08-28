Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC9C7255763
	for <lists+linux-media@lfdr.de>; Fri, 28 Aug 2020 11:17:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728912AbgH1JRK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Aug 2020 05:17:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:48546 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728548AbgH1JQy (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Aug 2020 05:16:54 -0400
Received: from mail.kernel.org (unknown [95.90.213.181])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3D68520C56;
        Fri, 28 Aug 2020 09:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598606213;
        bh=qf3s74BFMfzPaXEhkWfFmaoIcsmrt/xu5Ve7JjjrqSI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=o/uh8mxaO6aCUHIiw2fwZiZV736BMezCvVZ65ayjQd+uNMxyLAfU1Wnnke7NimkcA
         JQwQYJ0gDv34xBMFZlJvL3TtZzLXKFS3l0DYmV2BPolWYsMIfobj6knnDaF602uTJS
         eMwJpIuapVR7lg5zsX0f3IVpajA3zGxemaSiEKvM=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kBaV9-0047AH-Ap; Fri, 28 Aug 2020 11:16:51 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Subject: [PATCH v11 4/4] media: open.rst: document mc-centric and video-node-centric
Date:   Fri, 28 Aug 2020 11:16:50 +0200
Message-Id: <99929cf3d951ff9dbe0e70e9380dfb2c13408869.1598606093.git.mchehab+huawei@kernel.org>
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

When we added support for omap3, back in 2010, we added a new
type of V4L2 devices that aren't fully controlled via the V4L2
device node.

Yet, we have never clearly documented in the V4L2 specification
the differences between the two types.

Let's document them based on the the current implementation.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../userspace-api/media/v4l/open.rst          | 59 +++++++++++++++++--
 1 file changed, 53 insertions(+), 6 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/open.rst b/Documentation/userspace-api/media/v4l/open.rst
index 4928f636c576..d20f98969294 100644
--- a/Documentation/userspace-api/media/v4l/open.rst
+++ b/Documentation/userspace-api/media/v4l/open.rst
@@ -13,6 +13,53 @@
 Opening and Closing Devices
 ***************************
 
+.. _v4l2_hardware_control:
+
+Controlling a hardware peripheral via V4L2
+==========================================
+
+Hardware that is supported using the V4L2 uAPI often consists of multiple
+devices or peripherals, each of which have their own driver.
+
+The bridge driver exposes one or more V4L2 device nodes
+(see :ref:`v4l2_device_naming`).
+
+There are other drivers providing support for other components of
+the hardware, which may also expose device nodes, called V4L2 sub-devices.
+
+When such V4L2 sub-devices are exposed, they allow controlling those
+other hardware components - usually connected via a serial bus (like
+I²C, SMBus or SPI). Depending on the bridge driver, those sub-devices
+can be controlled indirectly via the bridge driver or explicitly via
+the :ref:`Media Controller <media_controller>` and via the
+:ref:`V4L2 sub-devices <subdev>`.
+
+The devices that require the use of the
+:ref:`Media Controller <media_controller>` are called **MC-centric**
+devices. The devices that are fully controlled via V4L2 device nodes
+are called **video-node-centric**.
+
+Userspace can check if a V4L2 hardware peripheral is MC-centric by
+calling :ref:`VIDIOC_QUERYCAP` and checking the
+:ref:`device_caps field <device-capabilities>`.
+
+If the device returns ``V4L2_CAP_IO_MC`` flag at ``device_caps``,
+then it is MC-centric, otherwise, it is video-node-centric.
+
+It is required for MC-centric drivers to identify the V4L2
+sub-devices and to configure the pipelines via the
+:ref:`media controller API <media_controller>` before using the peripheral.
+Also, the sub-devices' configuration shall be controlled via the
+:ref:`sub-device API <subdev>`.
+
+.. note::
+
+   A video-node-centric may still provide media-controller and
+   sub-device interfaces as well.
+
+  However, in that case the media-controller and the sub-device
+  interfaces are read-only and just provide information about the
+  device. The actual configuration is done via the video nodes.
 
 .. _v4l2_device_naming:
 
@@ -109,7 +156,7 @@ Related Devices
 Devices can support several functions. For example video capturing, VBI
 capturing and radio support.
 
-The V4L2 API creates different nodes for each of these functions.
+The V4L2 API creates different V4L2 device nodes for each of these functions.
 
 The V4L2 API was designed with the idea that one device node could
 support all functions. However, in practice this never worked: this
@@ -119,17 +166,17 @@ switching a device node between different functions only works when
 using the streaming I/O API, not with the
 :ref:`read() <func-read>`/\ :ref:`write() <func-write>` API.
 
-Today each device node supports just one function.
+Today each V4L2 device node supports just one function.
 
 Besides video input or output the hardware may also support audio
 sampling or playback. If so, these functions are implemented as ALSA PCM
 devices with optional ALSA audio mixer devices.
 
 One problem with all these devices is that the V4L2 API makes no
-provisions to find these related devices. Some really complex devices
-use the Media Controller (see :ref:`media_controller`) which can be
-used for this purpose. But most drivers do not use it, and while some
-code exists that uses sysfs to discover related devices (see
+provisions to find these related V4L2 device nodes. Some really complex
+hardware use the Media Controller (see :ref:`media_controller`) which can
+be used for this purpose. But several drivers do not use it, and while some
+code exists that uses sysfs to discover related V4L2 device nodes (see
 libmedia_dev in the
 `v4l-utils <http://git.linuxtv.org/cgit.cgi/v4l-utils.git/>`__ git
 repository), there is no library yet that can provide a single API
-- 
2.26.2

