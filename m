Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C23E1355A7E
	for <lists+linux-media@lfdr.de>; Tue,  6 Apr 2021 19:38:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235017AbhDFRia (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Apr 2021 13:38:30 -0400
Received: from aibo.runbox.com ([91.220.196.211]:39520 "EHLO aibo.runbox.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233683AbhDFRia (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 6 Apr 2021 13:38:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=norwegianrockcat.com; s=selector1; h=Content-Transfer-Encoding:MIME-Version
        :Content-Type:References:In-Reply-To:Date:To:From:Subject:Message-ID;
        bh=OmkJj7i/fnCD/azACeePXAgdQQKREnvW/RKqBeEdUQM=; b=XlgfGdAcx12FEGpF07Ox5RtxMY
        1YrJntObw2OmD1yXd+dPNCJk/h+rEqwblLgsUt+Y0UOOoaynCIVEiLgDWFSaNQnqHm6eRwVHjskHU
        p555ewnMgCgTIPlzi8m96X2/x2pFeK3z/BNTPKgTm/p24ROVGLBP+Y8R0E2uo/XIXyBSYdQAcPJYf
        jtDBiWnfg9Cfc4pKWRnJ8UC2G4ioCwG4UpwY5zL1hW7k5JCW4h4WJoNtETeEg2echo/sOY/Pe+I7R
        XLq6fnesQFYMK1As3yftONOgEA8IYWfWb7eqedPZO/C1cfOoF4vr79HNkAQRKfkwoy0mYoZEt6G6I
        CjnAB0CQ==;
Received: from [10.9.9.73] (helo=submission02.runbox)
        by mailtransmit03.runbox with esmtp (Exim 4.86_2)
        (envelope-from <trenton@norwegianrockcat.com>)
        id 1lTpee-0008Ms-Us; Tue, 06 Apr 2021 19:38:21 +0200
Received: by submission02.runbox with esmtpsa  [Authenticated alias (786124)]  (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.90_1)
        id 1lTpeK-0004iH-0m; Tue, 06 Apr 2021 19:38:00 +0200
Message-ID: <ec62c0dda69ba04f04de2320946f95b16b9b0e5d.camel@norwegianrockcat.com>
Subject: Re: [PATCH] Rudimentary support for mi_media_detect_type on FreeBSD.
From:   Trenton Schulz <trenton@norwegianrockcat.com>
To:     Hans Petter Selasky <hps@selasky.org>, linux-media@vger.kernel.org
Date:   Tue, 06 Apr 2021 19:38:00 +0200
In-Reply-To: <bd4512b4d1cfc03273b44b0a166607f311081e86.camel@norwegianrockcat.com>
References: <20210404134430.4537-1-trenton@norwegianrockcat.com>
         <055d59d5-da2f-0f42-9ae0-328ce1ac51cc@selasky.org>
         <bd4512b4d1cfc03273b44b0a166607f311081e86.camel@norwegianrockcat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2 FreeBSD GNOME Team
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

And of course, we don't need the second close.

FreeBSD doesn't have the same uevent and sys filesystem that Linux
does. So, use the VIDIOC_QUERYCAP ioctl to find out basic capabilities
for a device. The ioctl doesn't give us as much information, but it
gets things like webcams, VBIs, and radios. This is better than what
was there previously, which was returning unknown.

This makes some v4l-utils like v4l2-ctl a little more useful.

Signed-off-by: Trenton Schulz <trenton@norwegianrockcat.com>
---
 utils/common/media-info.cpp | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/utils/common/media-info.cpp b/utils/common/media-info.cpp
index 29a43fb3..6138eda4 100644
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
@@ -90,6 +94,23 @@ media_type mi_media_detect_type(const char *device)
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
+	}
+#endif
 	return MEDIA_TYPE_UNKNOWN;
 }
 
-- 
2.30.1



