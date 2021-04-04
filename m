Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62759353875
	for <lists+linux-media@lfdr.de>; Sun,  4 Apr 2021 16:24:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229918AbhDDOYX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 4 Apr 2021 10:24:23 -0400
Received: from aibo.runbox.com ([91.220.196.211]:51906 "EHLO aibo.runbox.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229633AbhDDOYX (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 4 Apr 2021 10:24:23 -0400
X-Greylist: delayed 2385 seconds by postgrey-1.27 at vger.kernel.org; Sun, 04 Apr 2021 10:24:22 EDT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=norwegianrockcat.com; s=selector1; h=Content-Transfer-Encoding:MIME-Version
        :Message-Id:Date:Subject:To:From;
        bh=kIrnzLyUPzvh/Tv0B6Qz6xxDa5pWQ3j2XYirUxZWSRs=; b=R/zV9wCRLyVogZxLItfSTMgxZV
        cRcJPfEay2R+VGalhy4EXsIbRz39nKLkipGsX7PXxp4Z4y8z/7y8Zk93L82yExxl+hC5uLMN9jf+e
        8WGYgYkcCPRWpQpBevQ6Ho3n6k+L+/qQ1QPiE3nrrB0qq/qE/3sOSsr4hEdY0Rh6cBI6Fi8ORT4PT
        ce9n1GleD3YKYqMpt8VDjWCDOIaX5487DiQT5KRgDJpK+oFnGH8YV1IZcMQ1/ZzUrylR5arVL1Ows
        Kq71jGYczCZ9frcI4tHbwfh0Z5J5yGjr+252l1XpUUggl8X0RxIifTRyBeevEa31XwmpzQ2U87r+2
        2P2PYrAg==;
Received: from [10.9.9.73] (helo=submission02.runbox)
        by mailtransmit02.runbox with esmtp (Exim 4.86_2)
        (envelope-from <trenton@norwegianrockcat.com>)
        id 1lT33H-0001Au-DU
        for linux-media@vger.kernel.org; Sun, 04 Apr 2021 15:44:31 +0200
Received: by submission02.runbox with esmtpsa  [Authenticated alias (786124)]  (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.90_1)
        id 1lT33H-00008P-2p
        for linux-media@vger.kernel.org; Sun, 04 Apr 2021 15:44:31 +0200
From:   Trenton Schulz <trenton@norwegianrockcat.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH] Rudimentary support for mi_media_detect_type on FreeBSD.
Date:   Sun,  4 Apr 2021 15:44:30 +0200
Message-Id: <20210404134430.4537-1-trenton@norwegianrockcat.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

FreeBSD doesn't have the same uevent and sys filesystem that Linux
does. So, use the VIDIOC_QUERYCAP ioctl to find out basic capabilities
for a device. The ioctl doesn't give us as much information, but it
gets things like webcams, VBIs, and radios. This is better than what
was there previously, which was returning unknown.

This makes some v4l-utils like v4l2-ctl a little more useful.

Signed-off-by: Trenton Schulz <trenton@norwegianrockcat.com>
---
 utils/common/media-info.cpp | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/utils/common/media-info.cpp b/utils/common/media-info.cpp
index 29a43fb3..3fed5a46 100644
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
@@ -90,6 +94,22 @@ media_type mi_media_detect_type(const char *device)
 	}
 
 	uevent_file.close();
+#else // Not Linux
+	int fd = open(device, O_RDONLY);
+	if (fd >= 0) {
+		struct v4l2_capability caps;
+		if (ioctl(fd, VIDIOC_QUERYCAP, &caps) == 0) {
+			if (caps.device_caps & V4L2_CAP_VIDEO_CAPTURE) {
+				return MEDIA_TYPE_VIDEO;
+			} else if (caps.device_caps & V4L2_CAP_VBI_CAPTURE) {
+				return MEDIA_TYPE_VBI;
+			} else if (caps.device_caps & V4L2_CAP_RADIO) {
+				return MEDIA_TYPE_RADIO;
+			}
+		}
+		close(fd);
+	}
+#endif
 	return MEDIA_TYPE_UNKNOWN;
 }
 
-- 
2.31.0

