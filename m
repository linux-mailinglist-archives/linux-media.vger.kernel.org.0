Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B08AC1CAE88
	for <lists+linux-media@lfdr.de>; Fri,  8 May 2020 15:11:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728547AbgEHNKq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 May 2020 09:10:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:60476 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730522AbgEHNKl (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 8 May 2020 09:10:41 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 93AC0249DA;
        Fri,  8 May 2020 13:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588943440;
        bh=0V/wbv+b5jsi4lq2mG/sYRgYjKG8X51Xr2wTxp7q+Qg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=rvtQFNRCvETARY1n2LhZTueLeZwztyCwecl41AlWdjNh+WBCXXV9OwEvRiBVH7F4o
         pCVyDBOn0XiT/qOVcZP8p5bPKvw9pEJfu+UA2VjLquiUJmfTUrl7V6lLAqm4i3VGLs
         HslqvTykytEA5z9OG+NIkLl8JGyBpOBvlD4UzpMo=
Received: from mchehab by mail.kernel.org with local (Exim 4.93)
        (envelope-from <mchehab@kernel.org>)
        id 1jX2ly-000Z9H-GL; Fri, 08 May 2020 15:10:38 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v9 4/5] media: glossary.rst: add terms for MC-centric video-node-centric
Date:   Fri,  8 May 2020 15:10:36 +0200
Message-Id: <0c083fffe63499a9ce49d30f3c907668299401f1.1588943181.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1588943181.git.mchehab+huawei@kernel.org>
References: <cover.1588943181.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Now that we have a chapter describing hardware control, let's
add the terms used there to the glossary.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../userspace-api/media/glossary.rst          | 42 ++++++++++++++++---
 1 file changed, 37 insertions(+), 5 deletions(-)

diff --git a/Documentation/userspace-api/media/glossary.rst b/Documentation/userspace-api/media/glossary.rst
index 18a1ace00159..8cdb7900e994 100644
--- a/Documentation/userspace-api/media/glossary.rst
+++ b/Documentation/userspace-api/media/glossary.rst
@@ -69,6 +69,20 @@ Glossary
 
 	See https://en.wikipedia.org/wiki/Field-programmable_gate_array.
 
+    Hardware Component
+	A subset of the :term:`media hardware`. For example an :term:`I²C` or
+	:term:`SPI` device, or an :term:`IP block` inside a
+	:term:`SoC` or :term:`FPGA`.
+
+    Hardware Peripheral
+	A group of :term:`hardware components <hardware component>` that
+	together make a larger user-facing functional peripheral. For
+	instance the :term:`SoC` :term:`ISP` :term:`IP	block <ip block>`
+	and external camera sensors together make a camera hardware
+	peripheral.
+
+	Also known as :term:`peripheral`.
+
     I²C
 	**Inter-Integrated Circuit**
 
@@ -126,6 +140,14 @@ Glossary
 
 	See :ref:`media_controller`.
 
+    MC-Centric
+	:term:`V4L2 hardware` that requires a :term:`MC API`.
+
+	Such hardware have ``V4L2_CAP_IO_MC`` device_caps field unset
+	(see :ref:`VIDIOC_QUERYCAP`).
+
+	See :ref:`v4l2_hardware_control` for more details.
+
     Media Hardware
 	Subset of the hardware that is supported by the Linux Media API.
 
@@ -139,6 +161,9 @@ Glossary
 	control and input/output (I/O) operations specified by the
 	instructions on a single integrated circuit.
 
+    Peripheral
+	The same as :term:`hardware peripheral`.
+
     RC API
 	**Remote Controller API**
 
@@ -168,15 +193,22 @@ Glossary
 	The userspace API defined in :ref:`v4l2spec`, which is used to
 	control a V4L2 hardware.
 
+    V4L2 Device Node
+	A :term:`device node` that is associated to a V4L driver.
+
+	The V4L2 device node naming is specified at :ref:`v4l2_device_naming`.
+
     V4L2 Hardware
 	Part of a media hardware with is supported by the :term:`V4L2 API`.
 
     V4L2 Sub-device
 	V4L2 hardware components that aren't controlled by a
-	:term:`bridge driver`.
+	:term:`bridge driver`. See :ref:`subdev`.
 
-    V4L2 Sub-device API
-	Part of the :term:`V4L2 API` which control
-	:term:`V4L2 sub-devices <V4L2 Sub-device>`.
+    Video-node-Centric
+	V4L2 hardware that doesn't require a media controller to be used.
 
-	See :ref:`subdev`.
+	Such hardware have ``V4L2_CAP_IO_MC`` device_caps field unset
+	(see :ref:`VIDIOC_QUERYCAP`).
+
+	See :ref:`v4l2_hardware_control` for more details.
-- 
2.26.2

