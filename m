Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6D572B196D
	for <lists+linux-media@lfdr.de>; Fri, 13 Nov 2020 11:59:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726275AbgKMK7p (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Nov 2020 05:59:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726176AbgKMK7p (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Nov 2020 05:59:45 -0500
Received: from hillosipuli.retiisi.eu (hillosipuli.retiisi.eu [IPv6:2a01:4f9:c010:4572::81:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED2FAC0613D1;
        Fri, 13 Nov 2020 02:59:44 -0800 (PST)
Received: from lanttu.localdomain (lanttu.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::c1:2])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id E5203634C24;
        Fri, 13 Nov 2020 12:57:55 +0200 (EET)
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
Subject: [PATCH v5 1/1] lib/vsprintf: Add support for printing V4L2 and DRM fourccs
Date:   Fri, 13 Nov 2020 12:54:41 +0200
Message-Id: <20201113105441.1427-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a printk modifier %p4cc (for pixel format) for printing V4L2 and DRM
pixel formats denoted by fourccs. The fourcc encoding is the same for both
so the same implementation can be used.

Suggested-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
since v4:

- Use correct destination for error string (was broken in v4)

- Remove unneeded comment "/* subtract parenthesis and the space from the
  size */".

 Documentation/core-api/printk-formats.rst | 16 +++++++
 lib/test_printf.c                         | 17 ++++++++
 lib/vsprintf.c                            | 51 +++++++++++++++++++++++
 3 files changed, 84 insertions(+)

diff --git a/Documentation/core-api/printk-formats.rst b/Documentation/core-api/printk-formats.rst
index 6d26c5c6ac48..080262d2e030 100644
--- a/Documentation/core-api/printk-formats.rst
+++ b/Documentation/core-api/printk-formats.rst
@@ -565,6 +565,22 @@ For printing netdev_features_t.
 
 Passed by reference.
 
+V4L2 and DRM FourCC code (pixel format)
+---------------------------------------
+
+::
+
+	%p4cc
+
+Print a FourCC code used by V4L2 or DRM, including format endianness and
+its numerical value as hexadecimal.
+
+Passed by reference.
+
+Examples::
+
+	%p4cc	BG12 little-endian (0x32314742)
+
 Thanks
 ======
 
diff --git a/lib/test_printf.c b/lib/test_printf.c
index 7ac87f18a10f..7fb042542660 100644
--- a/lib/test_printf.c
+++ b/lib/test_printf.c
@@ -649,6 +649,22 @@ static void __init fwnode_pointer(void)
 	software_node_unregister(&softnodes[0]);
 }
 
+static void __init fourcc_pointer(void)
+{
+	struct {
+		u32 code;
+		char *str;
+	} const try[] = {
+		{ 0x20104646, "FF(10) little-endian (0x20104646)", },
+		{ 0xa0104646, "FF(10) big-endian (0xa0104646)", },
+		{ 0x10111213, "(13)(12)(11)(10) little-endian (0x10111213)", },
+	};
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(try); i++)
+		test(try[i].str, "%p4cc", &try[i].code);
+}
+
 static void __init
 errptr(void)
 {
@@ -694,6 +710,7 @@ test_pointer(void)
 	flags();
 	errptr();
 	fwnode_pointer();
+	fourcc_pointer();
 }
 
 static void __init selftest(void)
diff --git a/lib/vsprintf.c b/lib/vsprintf.c
index 14c9a6af1b23..b07ee5b7de06 100644
--- a/lib/vsprintf.c
+++ b/lib/vsprintf.c
@@ -1733,6 +1733,54 @@ char *netdev_bits(char *buf, char *end, const void *addr,
 	return special_hex_number(buf, end, num, size);
 }
 
+static noinline_for_stack
+char *fourcc_string(char *buf, char *end, const u32 *fourcc,
+		    struct printf_spec spec, const char *fmt)
+{
+	char output[sizeof("(xx)(xx)(xx)(xx) little-endian (0x01234567)")];
+	char *p = output;
+	unsigned int i;
+	u32 val;
+
+	if (fmt[1] != 'c' || fmt[2] != 'c')
+		return error_string(buf, end, "(%p4?)", spec);
+
+	if (check_pointer(&buf, end, fourcc, spec))
+		return buf;
+
+	val = *fourcc & ~BIT(31);
+
+	for (i = 0; i < sizeof(*fourcc); i++) {
+		unsigned char c = val >> (i * 8);
+
+		/* Weed out spaces */
+		if (c == ' ')
+			continue;
+
+		/* Print non-control ASCII characters as-is */
+		if (isascii(c) && isprint(c)) {
+			*p++ = c;
+			continue;
+		}
+
+		*p++ = '(';
+		p = hex_byte_pack(p, c);
+		*p++ = ')';
+	}
+
+	strcpy(p, *fourcc & BIT(31) ? " big-endian" : " little-endian");
+	p += strlen(p);
+
+	*p++ = ' ';
+	*p++ = '(';
+	p = special_hex_number(p, output + sizeof(output) - 2, *fourcc,
+			       sizeof(u32));
+	*p++ = ')';
+	*p = '\0';
+
+	return string(buf, end, output, spec);
+}
+
 static noinline_for_stack
 char *address_val(char *buf, char *end, const void *addr,
 		  struct printf_spec spec, const char *fmt)
@@ -2162,6 +2210,7 @@ char *fwnode_string(char *buf, char *end, struct fwnode_handle *fwnode,
  *       correctness of the format string and va_list arguments.
  * - 'K' For a kernel pointer that should be hidden from unprivileged users
  * - 'NF' For a netdev_features_t
+ * - '4cc' V4L2 or DRM FourCC code, with endianness and raw numerical value.
  * - 'h[CDN]' For a variable-length buffer, it prints it as a hex string with
  *            a certain separator (' ' by default):
  *              C colon
@@ -2259,6 +2308,8 @@ char *pointer(const char *fmt, char *buf, char *end, void *ptr,
 		return restricted_pointer(buf, end, ptr, spec);
 	case 'N':
 		return netdev_bits(buf, end, ptr, spec, fmt);
+	case '4':
+		return fourcc_string(buf, end, ptr, spec, fmt);
 	case 'a':
 		return address_val(buf, end, ptr, spec, fmt);
 	case 'd':
-- 
2.27.0

