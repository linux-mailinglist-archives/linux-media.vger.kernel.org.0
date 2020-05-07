Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D58F1C93D7
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2020 17:10:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727978AbgEGPJv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 May 2020 11:09:51 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:33003 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727975AbgEGPJu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 May 2020 11:09:50 -0400
Received: from localhost.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id D87EF200009;
        Thu,  7 May 2020 15:09:47 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org
Cc:     Jacopo Mondi <jacopo@jmondi.org>, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, sakari.ailus@linux.intel.com,
        andrey.konovalov@linaro.org, laurent.pinchart@ideasonboard.com
Subject: [PATCH v7 1/6] Documentation: media: Update sub-device API intro
Date:   Thu,  7 May 2020 17:12:48 +0200
Message-Id: <20200507151253.2951492-2-jacopo@jmondi.org>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200507151253.2951492-1-jacopo@jmondi.org>
References: <20200507151253.2951492-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Update the V4L2 sub-device userspace API introduction to provide more
details on why complex devices might want to register devnodes for the
connected subdevices.

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 Documentation/driver-api/media/v4l2-subdev.rst | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/driver-api/media/v4l2-subdev.rst b/Documentation/driver-api/media/v4l2-subdev.rst
index 29e07e23f8885..41ccb3e5c7075 100644
--- a/Documentation/driver-api/media/v4l2-subdev.rst
+++ b/Documentation/driver-api/media/v4l2-subdev.rst
@@ -275,8 +275,13 @@ system the .unbind() method is called. All three callbacks are optional.
 V4L2 sub-device userspace API
 -----------------------------
 
-Beside exposing a kernel API through the :c:type:`v4l2_subdev_ops` structure,
-V4L2 sub-devices can also be controlled directly by userspace applications.
+Bridge drivers traditionally expose one or multiple video nodes to userspace,
+and control subdevices through the :c:type:`v4l2_subdev_ops` operations in
+response to video node operations. This hides the complexity of the underlying
+hardware from applications. For complex devices, finer-grained control of the
+device than what the video nodes offer may be required. In those cases, bridge
+drivers that implement :ref:`the media controller API <media_controller>` may
+opt for making the subdevice operations directly accessible from userpace.
 
 Device nodes named ``v4l-subdev``\ *X* can be created in ``/dev`` to access
 sub-devices directly. If a sub-device supports direct userspace configuration
-- 
2.26.1

