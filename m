Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20F7431CD60
	for <lists+linux-media@lfdr.de>; Tue, 16 Feb 2021 17:00:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229572AbhBPP7P (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Feb 2021 10:59:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229784AbhBPP7M (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Feb 2021 10:59:12 -0500
Received: from hillosipuli.retiisi.eu (hillosipuli.retiisi.eu [IPv6:2a01:4f9:c010:4572::81:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BAF5C061788;
        Tue, 16 Feb 2021 07:57:27 -0800 (PST)
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id B8B31634CCC;
        Tue, 16 Feb 2021 17:56:20 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-media@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-kernel@vger.kernel.org, Petr Mladek <pmladek@suse.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com,
        mchehab@kernel.org,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Joe Perches <joe@perches.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Daniel Vetter <daniel@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v9 4/4] drm: Remove drm_get_format_name()
Date:   Tue, 16 Feb 2021 17:57:23 +0200
Message-Id: <20210216155723.17109-5-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210216155723.17109-1-sakari.ailus@linux.intel.com>
References: <20210216155723.17109-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The %p4cc printk format modifier was recently added to print fourcc codes,
replacing drm_get_format_name(). The function is no longer needed, so
remove it.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Petr Mladek <pmladek@suse.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpu/drm/drm_fourcc.c | 25 -------------------------
 include/drm/drm_fourcc.h     |  1 -
 2 files changed, 26 deletions(-)

diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
index 03262472059c..5cf45aa6eedc 100644
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
@@ -130,26 +125,6 @@ uint32_t drm_driver_legacy_fb_format(struct drm_device *dev,
 }
 EXPORT_SYMBOL(drm_driver_legacy_fb_format);
 
-/**
- * drm_get_format_name - fill a string with a drm fourcc format's name
- * @format: format to compute name of
- * @buf: caller-supplied buffer
- */
-const char *drm_get_format_name(uint32_t format, struct drm_format_name_buf *buf)
-{
-	snprintf(buf->str, sizeof(buf->str),
-		 "%c%c%c%c %s-endian (0x%08x)",
-		 printable_char(format & 0xff),
-		 printable_char((format >> 8) & 0xff),
-		 printable_char((format >> 16) & 0xff),
-		 printable_char((format >> 24) & 0x7f),
-		 format & DRM_FORMAT_BIG_ENDIAN ? "big" : "little",
-		 format);
-
-	return buf->str;
-}
-EXPORT_SYMBOL(drm_get_format_name);
-
 /*
  * Internal function to query information for a given format. See
  * drm_format_info() for the public API.
diff --git a/include/drm/drm_fourcc.h b/include/drm/drm_fourcc.h
index 156b122c0ad5..3ea17b8a79d3 100644
--- a/include/drm/drm_fourcc.h
+++ b/include/drm/drm_fourcc.h
@@ -318,6 +318,5 @@ unsigned int drm_format_info_block_height(const struct drm_format_info *info,
 					  int plane);
 uint64_t drm_format_info_min_pitch(const struct drm_format_info *info,
 				   int plane, unsigned int buffer_width);
-const char *drm_get_format_name(uint32_t format, struct drm_format_name_buf *buf);
 
 #endif /* __DRM_FOURCC_H__ */
-- 
2.29.2

