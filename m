Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2385355A12
	for <lists+linux-media@lfdr.de>; Tue,  6 Apr 2021 19:13:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244345AbhDFRNu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Apr 2021 13:13:50 -0400
Received: from aibo.runbox.com ([91.220.196.211]:36130 "EHLO aibo.runbox.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233879AbhDFRNt (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 6 Apr 2021 13:13:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=norwegianrockcat.com; s=selector1; h=Content-Transfer-Encoding:MIME-Version
        :Content-Type:References:In-Reply-To:Date:To:From:Subject:Message-ID;
        bh=L0vt7I6EDLY1Iscvk2l74j8EMpWx4FaCvIpbe7sp3zY=; b=mJedZBSMr8+VspoT1jP0wtoZiu
        LLYQsy/FiGsncSuaJj/rOc2Vs0ypZtJ7TnRQe2pIrA5VT6Gk1GPlgUag2+Fr1pGvxi63PtLdOIUUw
        uOrfH5TmR52tB+jQbX3sIWiz1yAIEXwB/Syob8c2s10nuROqibKRZI+WEeDN+EefUtj/+VNflU05U
        2MyeVHAy6FkkCIjvoOJdfoUPIYZoTx4kZjHvg5mOVxMm2S4OserucchupU68WePNzEdHp514uXZn6
        MD6G7/Hu6TEhDxcc1GsaapRKgdQeJ3PWpxAtJDn2Sprpk+rJc5FzDl+4e6CvOrdCuExhJpJqhMjxr
        Z/V2oEdw==;
Received: from [10.9.9.74] (helo=submission03.runbox)
        by mailtransmit02.runbox with esmtp (Exim 4.86_2)
        (envelope-from <trenton@norwegianrockcat.com>)
        id 1lTpGl-0003ek-LL; Tue, 06 Apr 2021 19:13:39 +0200
Received: by submission03.runbox with esmtpsa  [Authenticated alias (786124)]  (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.90_1)
        id 1lTpGV-0002ZW-Sl; Tue, 06 Apr 2021 19:13:23 +0200
Message-ID: <bd4512b4d1cfc03273b44b0a166607f311081e86.camel@norwegianrockcat.com>
Subject: Re: [PATCH] Rudimentary support for mi_media_detect_type on FreeBSD.
From:   Trenton Schulz <trenton@norwegianrockcat.com>
To:     Hans Petter Selasky <hps@selasky.org>, linux-media@vger.kernel.org
Date:   Tue, 06 Apr 2021 19:13:22 +0200
In-Reply-To: <055d59d5-da2f-0f42-9ae0-328ce1ac51cc@selasky.org>
References: <20210404134430.4537-1-trenton@norwegianrockcat.com>
         <055d59d5-da2f-0f42-9ae0-328ce1ac51cc@selasky.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2 FreeBSD GNOME Team
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thank you for the catch. Patch is updated.
FreeBSD doesn't have the same uevent and sys filesystem that Linux
does. So, use the VIDIOC_QUERYCAP ioctl to find out basic capabilities
for a device. The ioctl doesn't give us as much information, but it
gets things like webcams, VBIs, and radios. This is better than what
was there previously, which was returning unknown.

This makes some v4l-utils, like v4l2-ctl, a little more useful.

Signed-off-by: Trenton Schulz <trenton@norwegianrockcat.com>
---
 utils/common/media-info.cpp | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/utils/common/media-info.cpp b/utils/common/media-info.cpp
index 29a43fb3..299591bf 100644
--- a/utils/common/media-info.cpp
+++ b/utils/common/media-info.cpp
@@ -17,6 +17,10 @@
 #include <linux/media.h>
 
 #include <media-info.h>
+#ifndef __linux__
+#include <linux/videodev2.h>
+#include <fcntl.h>
+#endif
 
 static std::string num2s(unsigned num, bool is_hex = true)
 {
@@ -54,7 +58,7 @@ media_type mi_media_detect_type(const char *device)
 
 	if (stat(device, &sb) == -1)
 		return MEDIA_TYPE_CANT_STAT;
-
+#ifdef __linux__
 	std::string uevent_path("/sys/dev/char/");
 
 	uevent_path += num2s(major(sb.st_rdev), false) + ":" +
@@ -90,6 +94,24 @@ media_type mi_media_detect_type(const char *device)
 	}
 
 	uevent_file.close();
+#else // Not Linux
+	int fd = open(device, O_RDONLY);
+	if (fd >= 0) {
+		struct v4l2_capability caps;
+		int error = ioctl(fd, VIDIOC_QUERYCAP, &caps);
+		close(fd);
+		if (error == 0) {
+			if (caps.device_caps & V4L2_CAP_VIDEO_CAPTURE)
{
+				return MEDIA_TYPE_VIDEO;
+			} else if (caps.device_caps &
V4L2_CAP_VBI_CAPTURE) {
+				return MEDIA_TYPE_VBI;
+			} else if (caps.device_caps & V4L2_CAP_RADIO)
{
+				return MEDIA_TYPE_RADIO;
+			}
+		}
+		close(fd);
+	}
+#endif
 	return MEDIA_TYPE_UNKNOWN;
 }
 
-- 
2.30.1



