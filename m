Return-Path: <linux-media+bounces-16041-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 35DF994CBED
	for <lists+linux-media@lfdr.de>; Fri,  9 Aug 2024 10:13:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D40201F2258B
	for <lists+linux-media@lfdr.de>; Fri,  9 Aug 2024 08:13:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DECE918DF81;
	Fri,  9 Aug 2024 08:13:16 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876E7C8D1;
	Fri,  9 Aug 2024 08:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723191196; cv=none; b=guZGfXeOk0RqYqJLJkwFncBEqolbxajk4f4qLv5IDoywfJs+Wl6r2e0sIxlZc0FTUBnwzoJy9TgKfXVJ5uS0gUUuCrnOGiZDK1bQuTg+gh4LfqkbGZdv/orT3Be+gdukdbJMtPSuVMpi9ncs8XlDBsCLOKd7Bf/11nIEsiegZwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723191196; c=relaxed/simple;
	bh=RpUyfg+35lwNalGpQyOQYvnqsQ4KBrwOxcAMUgE1BOs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ID+G3oOkYhoLv1w6HgK5BAzdg0QeNDXVToTF6CIz5Oir1tKnmO4fGIVsBFPj+b2czIaSleKpFsegAkR1NTiHBWNiP4YFLoGLBtzU/j6OvIjFqkH686eOLVfx33hJJXzO77vaLuTJKS3XITjbJjC99vYkeMPJO2pvS7pNKfWiF3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C695C4AF0D;
	Fri,  9 Aug 2024 08:13:15 +0000 (UTC)
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: linux-input@vger.kernel.org,
	Erling Ljunggren <hljunggr@cisco.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 3/6] media: docs: Add V4L2_CAP_EDID
Date: Fri,  9 Aug 2024 09:57:35 +0200
Message-ID: <5b880a060574363d5ea351e20e0766abb476f6db.1723190258.git.hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1723190258.git.hverkuil-cisco@xs4all.nl>
References: <cover.1723190258.git.hverkuil-cisco@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Erling Ljunggren <hljunggr@cisco.com>

Add documentation for the new edid capability.

Signed-off-by: Erling Ljunggren <hljunggr@cisco.com>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 Documentation/userspace-api/media/v4l/biblio.rst      | 11 +++++++++++
 .../userspace-api/media/v4l/vidioc-querycap.rst       | 11 +++++++++++
 .../userspace-api/media/videodev2.h.rst.exceptions    |  1 +
 3 files changed, 23 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/biblio.rst b/Documentation/userspace-api/media/v4l/biblio.rst
index 72aef1759b60..35674eeae20d 100644
--- a/Documentation/userspace-api/media/v4l/biblio.rst
+++ b/Documentation/userspace-api/media/v4l/biblio.rst
@@ -334,6 +334,17 @@ VESA DMT
 
 :author:    Video Electronics Standards Association (http://www.vesa.org)
 
+.. _vesaeddc:
+
+E-DDC
+=====
+
+
+:title:     VESA Enhanced Display Data Channel (E-DDC) Standard
+:subtitle:  Version 1.3
+
+:author:    Video Electronics Standards Association (http://www.vesa.org)
+
 .. _vesaedid:
 
 EDID
diff --git a/Documentation/userspace-api/media/v4l/vidioc-querycap.rst b/Documentation/userspace-api/media/v4l/vidioc-querycap.rst
index 6c57b8428356..3d11d86d9cbf 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-querycap.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-querycap.rst
@@ -244,6 +244,17 @@ specification the ioctl returns an ``EINVAL`` error code.
       - 0x01000000
       - The device supports the :c:func:`read()` and/or
 	:c:func:`write()` I/O methods.
+    * - ``V4L2_CAP_EDID``
+      - 0x02000000
+      - The device stores the EDID for a video input, or retrieves the EDID for a video
+        output. It is a standalone EDID device, so no video streaming etc. will take place.
+
+        For a video input this is typically an eeprom that supports the
+        :ref:`VESA Enhanced Display Data Channel Standard <vesaeddc>`. It can be something
+        else as well, for example a micro controller.
+
+        For a video output this is typically read from an external device such as an
+        HDMI splitter accessed by a serial port.
     * - ``V4L2_CAP_STREAMING``
       - 0x04000000
       - The device supports the :ref:`streaming <mmap>` I/O method.
diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
index bdc628e8c1d6..d67fd4038d22 100644
--- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
+++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
@@ -197,6 +197,7 @@ replace define V4L2_CAP_META_OUTPUT device-capabilities
 replace define V4L2_CAP_DEVICE_CAPS device-capabilities
 replace define V4L2_CAP_TOUCH device-capabilities
 replace define V4L2_CAP_IO_MC device-capabilities
+replace define V4L2_CAP_EDID device-capabilities
 
 # V4L2 pix flags
 replace define V4L2_PIX_FMT_PRIV_MAGIC :c:type:`v4l2_pix_format`
-- 
2.43.0


