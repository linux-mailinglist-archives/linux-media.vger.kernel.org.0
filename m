Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6982919AD56
	for <lists+linux-media@lfdr.de>; Wed,  1 Apr 2020 16:05:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732872AbgDAOFZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Apr 2020 10:05:25 -0400
Received: from retiisi.org.uk ([95.216.213.190]:59294 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732791AbgDAOFZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 1 Apr 2020 10:05:25 -0400
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTP id 51CD1634C87;
        Wed,  1 Apr 2020 17:04:41 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Petr Mladek <pmladek@suse.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-media@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com,
        mchehab@kernel.org,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>
Subject: [PATCH 1/1] lib/vsprintf: Add support for printing V4L2 and DRM fourccs
Date:   Wed,  1 Apr 2020 17:05:22 +0300
Message-Id: <20200401140522.966-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a printk modifier %ppf (for pixel format) for printing V4L2 and DRM
pixel formats denoted by 4ccs. The 4cc encoding is the same for both so
the same implementation can be used.

Suggested-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 Documentation/core-api/printk-formats.rst | 11 +++++++++
 lib/vsprintf.c                            | 29 +++++++++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/Documentation/core-api/printk-formats.rst b/Documentation/core-api/printk-formats.rst
index 8ebe46b1af39..b6249f513c09 100644
--- a/Documentation/core-api/printk-formats.rst
+++ b/Documentation/core-api/printk-formats.rst
@@ -545,6 +545,17 @@ For printing netdev_features_t.
 
 Passed by reference.
 
+V4L2 and DRM fourcc code (pixel format)
+---------------------------------------
+
+::
+
+	%ppf
+
+Print a 4cc code used by V4L2 or DRM.
+
+Passed by reference.
+
 Thanks
 ======
 
diff --git a/lib/vsprintf.c b/lib/vsprintf.c
index 7c488a1ce318..b39f0ac317c5 100644
--- a/lib/vsprintf.c
+++ b/lib/vsprintf.c
@@ -1721,6 +1721,32 @@ char *netdev_bits(char *buf, char *end, const void *addr,
 	return special_hex_number(buf, end, num, size);
 }
 
+static noinline_for_stack
+char *pixel_format_string(char *buf, char *end, const u32 *fourcc,
+			  struct printf_spec spec, const char *fmt)
+{
+	char ch[2] = { 0 };
+	unsigned int i;
+
+	if (check_pointer(&buf, end, fourcc, spec))
+		return buf;
+
+	switch (fmt[1]) {
+	case 'f':
+		for (i = 0; i < sizeof(*fourcc); i++) {
+			ch[0] = *fourcc >> (i << 3);
+			buf = string(buf, end, ch, spec);
+		}
+
+		if (*fourcc & BIT(31))
+			buf = string(buf, end, "-BE", spec);
+
+		return buf;
+	default:
+		return error_string(buf, end, "(%pp?)", spec);
+	}
+}
+
 static noinline_for_stack
 char *address_val(char *buf, char *end, const void *addr,
 		  struct printf_spec spec, const char *fmt)
@@ -2131,6 +2157,7 @@ char *fwnode_string(char *buf, char *end, struct fwnode_handle *fwnode,
  *       correctness of the format string and va_list arguments.
  * - 'K' For a kernel pointer that should be hidden from unprivileged users
  * - 'NF' For a netdev_features_t
+ * - 'pf' V4L2 or DRM pixel format.
  * - 'h[CDN]' For a variable-length buffer, it prints it as a hex string with
  *            a certain separator (' ' by default):
  *              C colon
@@ -2223,6 +2250,8 @@ char *pointer(const char *fmt, char *buf, char *end, void *ptr,
 		return restricted_pointer(buf, end, ptr, spec);
 	case 'N':
 		return netdev_bits(buf, end, ptr, spec, fmt);
+	case 'p':
+		return pixel_format_string(buf, end, ptr, spec, fmt);
 	case 'a':
 		return address_val(buf, end, ptr, spec, fmt);
 	case 'd':
-- 
2.20.1

