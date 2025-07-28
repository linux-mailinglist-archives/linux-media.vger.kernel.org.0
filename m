Return-Path: <linux-media+bounces-38550-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AB904B13851
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 11:54:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BA731188C625
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 09:50:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5A2C25C70C;
	Mon, 28 Jul 2025 09:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IoxMSiYU"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F25F25BF1B
	for <linux-media@vger.kernel.org>; Mon, 28 Jul 2025 09:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753696116; cv=none; b=Tdm2oVO+iMBgkP4oipFBqntDRYMcQsL21kGwwRCk/65xnrZD4cIdaFHMXRFb3zSajUe+0TdGdAAklSPCXTHcrlNOQqlTHWTjLTerwpyli+J5Qoij7x/odmOUj53MR4S4xmDe+6+EFgz0EO8JGaJ+JRL0h37+2pknFHfGWaty8nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753696116; c=relaxed/simple;
	bh=qZg2/LYsRsQTQiB/YX8vIi262DQkCGE1cUmVOrbmQPs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FdcPpGvPHjkCYPG8r+NClJ7kO20aWHZle8Cxa+AnIJKuOaEdSXMYu0uHm6Nf3lfF9dfRRifNmq6p9ycymgBcPy64iXNJMMVz0l6zLaBOVdDiYoVPRMw2C4LIAsENUhplJ7HU79F6/xJnYz1ypFoIKCwrTzdFfCqNgWemdoZDvFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IoxMSiYU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42F1EC4CEE7;
	Mon, 28 Jul 2025 09:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753696116;
	bh=qZg2/LYsRsQTQiB/YX8vIi262DQkCGE1cUmVOrbmQPs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IoxMSiYUJUCHAYD6uOxcvMHG3gv36Urf2IGK0kuzjhvDwO8P6HBZTmbw31cweVXPS
	 a3JtQnAwwyoP5pP91b4KPc0kuz0yInllZwZdKDjF2wQkMfjjr6wKOR4MCP5pziP38y
	 rSrAjCQEYX9GG3RqkXbmiTh3bplt1XqSRoIDlB5KK4d9d3qsL1y51SEOh3bKnsVTw6
	 GxRxE4JoNrLBTNwsSfj/GWkfkKyA8FVUAv1J50ZhZvzo7UshATgf7ap/bRHwUfTVvX
	 XkW2lM50CyzbO3D6RmusWgjs+guqA0FGUVxVlTDmZwwW3hOZImplmKHD0+/HJ7dIqQ
	 ikJUfFIfh9JwQ==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil@kernel.org>
Subject: [PATCHv2 6/8] media: include: update Hans Verkuil's email address
Date: Mon, 28 Jul 2025 11:47:01 +0200
Message-ID: <9849ffddc5f00835c8be6bec1fe42e3673a51e07.1753696023.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1753696022.git.hverkuil+cisco@kernel.org>
References: <cover.1753696022.git.hverkuil+cisco@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hans Verkuil <hverkuil@kernel.org>

Replace hverkuil@xs4all.nl by hverkuil@kernel.org.

Signed-off-by: Hans Verkuil <hverkuil@kernel.org>
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


