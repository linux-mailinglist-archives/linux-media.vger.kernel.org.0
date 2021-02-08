Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47E9B314005
	for <lists+linux-media@lfdr.de>; Mon,  8 Feb 2021 21:12:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236671AbhBHULi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Feb 2021 15:11:38 -0500
Received: from retiisi.eu ([95.216.213.190]:57162 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236676AbhBHUKw (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 8 Feb 2021 15:10:52 -0500
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 0F4AA634C8D;
        Mon,  8 Feb 2021 22:08:34 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-kernel@vger.kernel.org
Cc:     linux-media@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Petr Mladek <pmladek@suse.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        dri-devel@lists.freedesktop.org, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Joe Perches <joe@perches.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: [PATCH v6 3/3] drm/fourcc: Switch to %p4cc format modifier
Date:   Mon,  8 Feb 2021 22:09:03 +0200
Message-Id: <20210208200903.28084-4-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210208200903.28084-1-sakari.ailus@linux.intel.com>
References: <20210208200903.28084-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Instead of constructing the FourCC code manually, use the %p4cc printk
modifier to print it. Also leave a message to avoid using this function.

The next step would be to convert the users to use %p4cc directly instead
and removing the function.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/gpu/drm/drm_fourcc.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
index 03262472059c..4ff40f2f27c0 100644
--- a/drivers/gpu/drm/drm_fourcc.c
+++ b/drivers/gpu/drm/drm_fourcc.c
@@ -30,11 +30,6 @@
 #include <drm/drm_device.h>
 #include <drm/drm_fourcc.h>
 
-static char printable_char(int c)
-{
-	return isascii(c) && isprint(c) ? c : '?';
-}
-
 /**
  * drm_mode_legacy_fb_format - compute drm fourcc code from legacy description
  * @bpp: bits per pixels
@@ -134,17 +129,12 @@ EXPORT_SYMBOL(drm_driver_legacy_fb_format);
  * drm_get_format_name - fill a string with a drm fourcc format's name
  * @format: format to compute name of
  * @buf: caller-supplied buffer
+ *
+ * Please use %p4cc printk format modifier instead of this function.
  */
 const char *drm_get_format_name(uint32_t format, struct drm_format_name_buf *buf)
 {
-	snprintf(buf->str, sizeof(buf->str),
-		 "%c%c%c%c %s-endian (0x%08x)",
-		 printable_char(format & 0xff),
-		 printable_char((format >> 8) & 0xff),
-		 printable_char((format >> 16) & 0xff),
-		 printable_char((format >> 24) & 0x7f),
-		 format & DRM_FORMAT_BIG_ENDIAN ? "big" : "little",
-		 format);
+	snprintf(buf->str, sizeof(buf->str), "%p4cc", &format);
 
 	return buf->str;
 }
-- 
2.29.2

