Return-Path: <linux-media+bounces-38541-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2FEBB13833
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 11:51:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8E27E161C9D
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 09:48:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB00726A1DD;
	Mon, 28 Jul 2025 09:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TIwags2d"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587F626A0EB
	for <linux-media@vger.kernel.org>; Mon, 28 Jul 2025 09:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753695869; cv=none; b=TGpHKP/cQHzieRnSa65CkPaTTZ3p5Vdw8C86XURog1djCJNyTUTosK8VgW6EXooD/XuJ1tau49DGdzxwoujHYMNsN7fQSEKxmb3k92q2lKscB0VXClgwRYzCCgij4YCQIvg/exVUavHpR7BxwiS30KMbBzIC7OLLYDyqU92xRAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753695869; c=relaxed/simple;
	bh=e45r0O8T8poThAjkV18EfA7DjlFVnQmtMJAQSk4a+/A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ocds59J6zdGme6uO7E8PO+YVvQ0I4m7AHll2ol1IYnhgs1ZbbJvwBSL13hn0OIyNEUABEB3fAQh2FQTB16dMt6aYd2FJi3j7GjJZTzQWAF4jVSvznPiJzOhrzXgCtxZ0UEPLRKa0YuzhHt2rP2WL7cvF/c2KdZt+eV4wKaFGF5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TIwags2d; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17926C116D0;
	Mon, 28 Jul 2025 09:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753695868;
	bh=e45r0O8T8poThAjkV18EfA7DjlFVnQmtMJAQSk4a+/A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TIwags2dh5PEk+uLVssdxoW53DkNsebTPjvMBVouHkPdbokxVU4Wg6W/HdJNh8fz3
	 MMMdxAtysEhgjlNll8MCfSa5mTCWfT1eLr/DFvEDaShCyJmU9cQY5OdT667N5XB29c
	 VYXn/u6aF1NErW9snvIRG5YDVqaYZ5tvSIf00vymNyqKcXKODKUFjhvSE0jEWMSje6
	 N/6eGlx4e9JsN6kMXLIhPVPl25Tb2Z4t1KW8k6huyINsc3v986zwBi15ZCCbi4qeJT
	 wAM3eTq/3AJE1I5bY5fodVj7gRInOMLi9YxzMk10hCrnqgZOZ3duHjfJk20UyfEgu/
	 Q1Pn0ajCBSOQg==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil@kernel.org>
Subject: [PATCH 6/8] media: include: update Hans Verkuil's email address
Date: Mon, 28 Jul 2025 11:41:55 +0200
Message-ID: <4393a53da52f31e69030f8c677077ba85a0d28fc.1753695717.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1753695717.git.hverkuil+cisco@kernel.org>
References: <cover.1753695717.git.hverkuil+cisco@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hans Verkuil <hverkuil@xs4all.nl>

Replace hverkuil@xs4all.nl by hverkuil@kernel.org.

Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
---
 include/dt-bindings/media/tvp5150.h | 2 +-
 include/linux/videodev2.h           | 2 +-
 include/media/drv-intf/cx25840.h    | 2 +-
 include/media/drv-intf/msp3400.h    | 2 +-
 include/media/i2c/bt819.h           | 2 +-
 include/media/i2c/cs5345.h          | 2 +-
 include/media/i2c/cs53l32a.h        | 2 +-
 include/media/i2c/m52790.h          | 2 +-
 include/media/i2c/mt9v011.h         | 2 +-
 include/media/i2c/saa7115.h         | 2 +-
 include/media/i2c/saa7127.h         | 2 +-
 include/media/i2c/tvaudio.h         | 2 +-
 include/media/i2c/upd64031a.h       | 2 +-
 include/media/i2c/upd64083.h        | 2 +-
 include/media/i2c/wm8775.h          | 2 +-
 include/media/v4l2-common.h         | 2 +-
 include/media/v4l2-ctrls.h          | 2 +-
 include/media/v4l2-device.h         | 2 +-
 include/media/v4l2-subdev.h         | 2 +-
 include/uapi/linux/ivtv.h           | 2 +-
 include/uapi/linux/videodev2.h      | 2 +-
 21 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/include/dt-bindings/media/tvp5150.h b/include/dt-bindings/media/tvp5150.h
index dda00c038530..ba34c420c303 100644
--- a/include/dt-bindings/media/tvp5150.h
+++ b/include/dt-bindings/media/tvp5150.h
@@ -2,7 +2,7 @@
 /*
     tvp5150.h - definition for tvp5150 inputs
 
-    Copyright (C) 2006 Hans Verkuil (hverkuil@xs4all.nl)
+    Copyright (C) 2006 Hans Verkuil (hverkuil@kernel.org)
 
 */
 
diff --git a/include/linux/videodev2.h b/include/linux/videodev2.h
index 219037f4c08d..9609cf365e8e 100644
--- a/include/linux/videodev2.h
+++ b/include/linux/videodev2.h
@@ -50,7 +50,7 @@
  *
  *	Author: Bill Dirks <bill@thedirks.org>
  *		Justin Schoeman
- *              Hans Verkuil <hverkuil@xs4all.nl>
+ *              Hans Verkuil <hverkuil@kernel.org>
  *		et al.
  */
 #ifndef __LINUX_VIDEODEV2_H
diff --git a/include/media/drv-intf/cx25840.h b/include/media/drv-intf/cx25840.h
index ba69bc525382..8b455d9dd5ca 100644
--- a/include/media/drv-intf/cx25840.h
+++ b/include/media/drv-intf/cx25840.h
@@ -3,7 +3,7 @@
 /*
  *   cx25840.h - definition for cx25840/1/2/3 inputs
  *
- *   Copyright (C) 2006 Hans Verkuil (hverkuil@xs4all.nl)
+ *   Copyright (C) 2006 Hans Verkuil (hverkuil@kernel.org)
  */
 
 #ifndef _CX25840_H_
diff --git a/include/media/drv-intf/msp3400.h b/include/media/drv-intf/msp3400.h
index d6dfae104a6f..853258ee6bbd 100644
--- a/include/media/drv-intf/msp3400.h
+++ b/include/media/drv-intf/msp3400.h
@@ -2,7 +2,7 @@
 /*
     msp3400.h - definition for msp3400 inputs and outputs
 
-    Copyright (C) 2006 Hans Verkuil (hverkuil@xs4all.nl)
+    Copyright (C) 2006 Hans Verkuil (hverkuil@kernel.org)
 
 */
 
diff --git a/include/media/i2c/bt819.h b/include/media/i2c/bt819.h
index 70aa46bd5182..2277a7eb9548 100644
--- a/include/media/i2c/bt819.h
+++ b/include/media/i2c/bt819.h
@@ -2,7 +2,7 @@
 /*
     bt819.h - bt819 notifications
 
-    Copyright (C) 2009 Hans Verkuil (hverkuil@xs4all.nl)
+    Copyright (C) 2009 Hans Verkuil (hverkuil@kernel.org)
 
 */
 
diff --git a/include/media/i2c/cs5345.h b/include/media/i2c/cs5345.h
index d41e4dca3fcc..39e1cf6c1a2f 100644
--- a/include/media/i2c/cs5345.h
+++ b/include/media/i2c/cs5345.h
@@ -2,7 +2,7 @@
 /*
     cs5345.h - definition for cs5345 inputs and outputs
 
-    Copyright (C) 2007 Hans Verkuil (hverkuil@xs4all.nl)
+    Copyright (C) 2007 Hans Verkuil (hverkuil@kernel.org)
 
 */
 
diff --git a/include/media/i2c/cs53l32a.h b/include/media/i2c/cs53l32a.h
index 52ceb2f916d3..777f667855cb 100644
--- a/include/media/i2c/cs53l32a.h
+++ b/include/media/i2c/cs53l32a.h
@@ -2,7 +2,7 @@
 /*
     cs53l32a.h - definition for cs53l32a inputs and outputs
 
-    Copyright (C) 2006 Hans Verkuil (hverkuil@xs4all.nl)
+    Copyright (C) 2006 Hans Verkuil (hverkuil@kernel.org)
 
 */
 
diff --git a/include/media/i2c/m52790.h b/include/media/i2c/m52790.h
index 3f214fa9bc64..cedaaf215273 100644
--- a/include/media/i2c/m52790.h
+++ b/include/media/i2c/m52790.h
@@ -2,7 +2,7 @@
 /*
     m52790.h - definition for m52790 inputs and outputs
 
-    Copyright (C) 2007 Hans Verkuil (hverkuil@xs4all.nl)
+    Copyright (C) 2007 Hans Verkuil (hverkuil@kernel.org)
 
 */
 
diff --git a/include/media/i2c/mt9v011.h b/include/media/i2c/mt9v011.h
index 41c00b3e7184..552839756e64 100644
--- a/include/media/i2c/mt9v011.h
+++ b/include/media/i2c/mt9v011.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /* mt9v011 sensor
  *
- * Copyright (C) 2011 Hans Verkuil <hverkuil@xs4all.nl>
+ * Copyright (C) 2011 Hans Verkuil <hverkuil@kernel.org>
  */
 
 #ifndef __MT9V011_H__
diff --git a/include/media/i2c/saa7115.h b/include/media/i2c/saa7115.h
index 0cd6080d7cb1..a607c91ef5f3 100644
--- a/include/media/i2c/saa7115.h
+++ b/include/media/i2c/saa7115.h
@@ -2,7 +2,7 @@
 /*
     saa7115.h - definition for saa7111/3/4/5 inputs and frequency flags
 
-    Copyright (C) 2006 Hans Verkuil (hverkuil@xs4all.nl)
+    Copyright (C) 2006 Hans Verkuil (hverkuil@kernel.org)
 
 */
 
diff --git a/include/media/i2c/saa7127.h b/include/media/i2c/saa7127.h
index 53ee999e6090..c81ee1743df1 100644
--- a/include/media/i2c/saa7127.h
+++ b/include/media/i2c/saa7127.h
@@ -2,7 +2,7 @@
 /*
     saa7127.h - definition for saa7126/7/8/9 inputs/outputs
 
-    Copyright (C) 2006 Hans Verkuil (hverkuil@xs4all.nl)
+    Copyright (C) 2006 Hans Verkuil (hverkuil@kernel.org)
 
 */
 
diff --git a/include/media/i2c/tvaudio.h b/include/media/i2c/tvaudio.h
index 42cd3206fb6c..206f42ed4e69 100644
--- a/include/media/i2c/tvaudio.h
+++ b/include/media/i2c/tvaudio.h
@@ -2,7 +2,7 @@
 /*
     tvaudio.h - definition for tvaudio inputs
 
-    Copyright (C) 2006 Hans Verkuil (hverkuil@xs4all.nl)
+    Copyright (C) 2006 Hans Verkuil (hverkuil@kernel.org)
 
 */
 
diff --git a/include/media/i2c/upd64031a.h b/include/media/i2c/upd64031a.h
index b6570abc84ef..d39b2b7f0cf3 100644
--- a/include/media/i2c/upd64031a.h
+++ b/include/media/i2c/upd64031a.h
@@ -2,7 +2,7 @@
 /*
  * upd64031a - NEC Electronics Ghost Reduction input defines
  *
- * 2006 by Hans Verkuil (hverkuil@xs4all.nl)
+ * 2006 by Hans Verkuil (hverkuil@kernel.org)
  */
 
 #ifndef _UPD64031A_H_
diff --git a/include/media/i2c/upd64083.h b/include/media/i2c/upd64083.h
index 17fb7b5201cc..72cf547c25fc 100644
--- a/include/media/i2c/upd64083.h
+++ b/include/media/i2c/upd64083.h
@@ -2,7 +2,7 @@
 /*
  * upd6408x - NEC Electronics 3-Dimensional Y/C separation input defines
  *
- * 2006 by Hans Verkuil (hverkuil@xs4all.nl)
+ * 2006 by Hans Verkuil (hverkuil@kernel.org)
  */
 
 #ifndef _UPD64083_H_
diff --git a/include/media/i2c/wm8775.h b/include/media/i2c/wm8775.h
index 6ccdeb3817ab..a02695ee3a58 100644
--- a/include/media/i2c/wm8775.h
+++ b/include/media/i2c/wm8775.h
@@ -2,7 +2,7 @@
 /*
     wm8775.h - definition for wm8775 inputs and outputs
 
-    Copyright (C) 2006 Hans Verkuil (hverkuil@xs4all.nl)
+    Copyright (C) 2006 Hans Verkuil (hverkuil@kernel.org)
 
 */
 
diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
index 0a43f56578bc..0a4295660a92 100644
--- a/include/media/v4l2-common.h
+++ b/include/media/v4l2-common.h
@@ -7,7 +7,7 @@
     Each ioctl begins with VIDIOC_INT_ to clearly mark that it is an internal
     define,
 
-    Copyright (C) 2005  Hans Verkuil <hverkuil@xs4all.nl>
+    Copyright (C) 2005  Hans Verkuil <hverkuil@kernel.org>
 
  */
 
diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index c32c46286441..3b4d3b054a59 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -2,7 +2,7 @@
 /*
  *  V4L2 controls support header.
  *
- *  Copyright (C) 2010  Hans Verkuil <hverkuil@xs4all.nl>
+ *  Copyright (C) 2010  Hans Verkuil <hverkuil@kernel.org>
  */
 
 #ifndef _V4L2_CTRLS_H
diff --git a/include/media/v4l2-device.h b/include/media/v4l2-device.h
index dd897a362f36..25f69b1b8db0 100644
--- a/include/media/v4l2-device.h
+++ b/include/media/v4l2-device.h
@@ -2,7 +2,7 @@
 /*
     V4L2 device support header.
 
-    Copyright (C) 2008  Hans Verkuil <hverkuil@xs4all.nl>
+    Copyright (C) 2008  Hans Verkuil <hverkuil@kernel.org>
 
  */
 
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 5dcf4065708f..da7c796797e0 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -2,7 +2,7 @@
 /*
  *  V4L2 sub-device support header.
  *
- *  Copyright (C) 2008  Hans Verkuil <hverkuil@xs4all.nl>
+ *  Copyright (C) 2008  Hans Verkuil <hverkuil@kernel.org>
  */
 
 #ifndef _V4L2_SUBDEV_H
diff --git a/include/uapi/linux/ivtv.h b/include/uapi/linux/ivtv.h
index e74f18642b11..c9241f7271c4 100644
--- a/include/uapi/linux/ivtv.h
+++ b/include/uapi/linux/ivtv.h
@@ -2,7 +2,7 @@
 /*
     Public ivtv API header
     Copyright (C) 2003-2004  Kevin Thayer <nufan_wfk at yahoo.com>
-    Copyright (C) 2004-2007  Hans Verkuil <hverkuil@xs4all.nl>
+    Copyright (C) 2004-2007  Hans Verkuil <hverkuil@kernel.org>
 
     This program is free software; you can redistribute it and/or modify
     it under the terms of the GNU General Public License as published by
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 3dd9fa45dde1..5e53a0292059 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -51,7 +51,7 @@
  *
  *	Author: Bill Dirks <bill@thedirks.org>
  *		Justin Schoeman
- *              Hans Verkuil <hverkuil@xs4all.nl>
+ *              Hans Verkuil <hverkuil@kernel.org>
  *		et al.
  */
 #ifndef _UAPI__LINUX_VIDEODEV2_H
-- 
2.47.2


