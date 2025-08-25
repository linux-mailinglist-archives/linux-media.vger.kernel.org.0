Return-Path: <linux-media+bounces-40871-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E9085B336D8
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 08:54:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 84A213BBBF5
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 06:54:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68409288C2B;
	Mon, 25 Aug 2025 06:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XqVajXsn"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF90288526
	for <linux-media@vger.kernel.org>; Mon, 25 Aug 2025 06:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756104794; cv=none; b=Hhi2BbXPMhYzYTQyj6/h2/JXBijOMJEEsNGKFhz/88GMAr811DNsZsKvsHTZXmgwtoAtacVCJCdV9S0nwtaxhEOijrXpUVaMlXDWr3N2QzxB6pz6mQc0pslJds+XiMCw9sqUg0uOualV+YV4ZO82tHGeggnN5BDxkmRDdP3dRgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756104794; c=relaxed/simple;
	bh=CkdgjTorzN4imiQNtDk0/PxT5+pz8xRd1GTN1dAiKnk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IJh9mDroIdj02slWPuwpMVFCkkyh/oWiwQCeGJZLcdYMCZis3hwUC0Z+QzHeAxNMIClqWDcmM71A6kZwNVc9BeWobQGzm/Am0D7HoHEPrk/zlLva9CQs6PukNsfz6ijTyV7jbPqj2udi3S8Kv1/YSRVmD6YpvPUstdCwX4cDwiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XqVajXsn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31DFCC4CEF1;
	Mon, 25 Aug 2025 06:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756104794;
	bh=CkdgjTorzN4imiQNtDk0/PxT5+pz8xRd1GTN1dAiKnk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XqVajXsnAY6y8nNUlgYqdt9l6HsCVVVblmnZWbCqLwhU9loYGKpMH4EId38Qzrozk
	 0/7y52j8ZFbnMMH+Y78sxzRSfux2gytiDSnGtwq+KmFQFvc3rzuIFBLsVvaanjaw9t
	 z2GWkp9RauH9KbiZYs9j0yw3rcwm9SRH09FgzEME5tGtWsZcSGnDAj85K06PFbRCsv
	 +Q89lWh+iG2Q8qDR7m3akNAIMzX7jq472gOaoE+KSl2GEtUA/4ch6QzhYSacwL1vsJ
	 k3368mz0pO5YXBhimMlXAW3qoN0kywbZEbyq7g0+MaFjeHs4AixgZ81uh7En2hqr6i
	 P+BMh6b7PVVUw==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil@kernel.org>
Subject: [PATCH 6/8] media: include: update Hans Verkuil's email address
Date: Mon, 25 Aug 2025 08:51:53 +0200
Message-ID: <3eee97c5efcd77c1cc9bf51f89adaf0452d4bbbd.1756104715.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1756104715.git.hverkuil+cisco@kernel.org>
References: <cover.1756104715.git.hverkuil+cisco@kernel.org>
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
index 39dd0c78d70f..6d203025bc91 100644
--- a/include/media/v4l2-common.h
+++ b/include/media/v4l2-common.h
@@ -7,7 +7,7 @@
     Each ioctl begins with VIDIOC_INT_ to clearly mark that it is an internal
     define,
 
-    Copyright (C) 2005  Hans Verkuil <hverkuil@xs4all.nl>
+    Copyright (C) 2005  Hans Verkuil <hverkuil@kernel.org>
 
  */
 
diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index 4a294a5c7bdd..31fc1bee3797 100644
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


