Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B88F831C8A5
	for <lists+linux-media@lfdr.de>; Tue, 16 Feb 2021 11:21:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230019AbhBPKV2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Feb 2021 05:21:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229934AbhBPKVV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Feb 2021 05:21:21 -0500
Received: from hillosipuli.retiisi.eu (hillosipuli.retiisi.eu [IPv6:2a01:4f9:c010:4572::81:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 096E7C06174A;
        Tue, 16 Feb 2021 02:19:35 -0800 (PST)
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id B452A634C92;
        Tue, 16 Feb 2021 12:18:29 +0200 (EET)
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
Subject: [PATCH v8 1/4] lib/vsprintf: Add support for printing V4L2 and DRM fourccs
Date:   Tue, 16 Feb 2021 12:19:28 +0200
Message-Id: <20210216101931.2110-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210216101931.2110-1-sakari.ailus@linux.intel.com>
References: <20210216101931.2110-1-sakari.ailus@linux.intel.com>
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
Reviewed-by: Petr Mladek <pmladek@suse.com>
Reviewed-by: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 Documentation/core-api/printk-formats.rst | 18 +++++++++++
 lib/test_printf.c                         | 18 +++++++++++
 lib/vsprintf.c                            | 39 +++++++++++++++++++++++
 scripts/checkpatch.pl                     |  6 ++--
 4 files changed, 79 insertions(+), 2 deletions(-)

diff --git a/Documentation/core-api/printk-formats.rst b/Documentation/core-api/printk-formats.rst
index 160e710d992f..8267675ea95c 100644
--- a/Documentation/core-api/printk-formats.rst
+++ b/Documentation/core-api/printk-formats.rst
@@ -567,6 +567,24 @@ For printing netdev_features_t.
 
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
+	%p4cc	Y10  little-endian (0x20303159)
+	%p4cc	NV12 big-endian (0xb231564e)
+
 Thanks
 ======
 
diff --git a/lib/test_printf.c b/lib/test_printf.c
index 7d60f24240a4..8558ddbde692 100644
--- a/lib/test_printf.c
+++ b/lib/test_printf.c
@@ -647,6 +647,23 @@ static void __init fwnode_pointer(void)
 	software_node_unregister_nodes(softnodes);
 }
 
+static void __init fourcc_pointer(void)
+{
+	struct {
+		u32 code;
+		char *str;
+	} const try[] = {
+		{ 0x3231564e, "NV12 little-endian (0x3231564e)", },
+		{ 0xb231564e, "NV12 big-endian (0xb231564e)", },
+		{ 0x10111213, ".... little-endian (0x10111213)", },
+		{ 0x20303159, "Y10  little-endian (0x20303159)", },
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
@@ -692,6 +709,7 @@ test_pointer(void)
 	flags();
 	errptr();
 	fwnode_pointer();
+	fourcc_pointer();
 }
 
 static void __init selftest(void)
diff --git a/lib/vsprintf.c b/lib/vsprintf.c
index 3b53c73580c5..62c7224a5076 100644
--- a/lib/vsprintf.c
+++ b/lib/vsprintf.c
@@ -1733,6 +1733,42 @@ char *netdev_bits(char *buf, char *end, const void *addr,
 	return special_hex_number(buf, end, num, size);
 }
 
+static noinline_for_stack
+char *fourcc_string(char *buf, char *end, const u32 *fourcc,
+		    struct printf_spec spec, const char *fmt)
+{
+	char output[sizeof("0123 little-endian (0x01234567)")];
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
+		/* Print non-control ASCII characters as-is, dot otherwise */
+		*p++ = isascii(c) && isprint(c) ? c : '.';
+	}
+
+	strcpy(p, *fourcc & BIT(31) ? " big-endian" : " little-endian");
+	p += strlen(p);
+
+	*p++ = ' ';
+	*p++ = '(';
+	p = special_hex_number(p, output + sizeof(output) - 2, *fourcc, sizeof(u32));
+	*p++ = ')';
+	*p = '\0';
+
+	return string(buf, end, output, spec);
+}
+
 static noinline_for_stack
 char *address_val(char *buf, char *end, const void *addr,
 		  struct printf_spec spec, const char *fmt)
@@ -2162,6 +2198,7 @@ char *fwnode_string(char *buf, char *end, struct fwnode_handle *fwnode,
  *       correctness of the format string and va_list arguments.
  * - 'K' For a kernel pointer that should be hidden from unprivileged users
  * - 'NF' For a netdev_features_t
+ * - '4cc' V4L2 or DRM FourCC code, with endianness and raw numerical value.
  * - 'h[CDN]' For a variable-length buffer, it prints it as a hex string with
  *            a certain separator (' ' by default):
  *              C colon
@@ -2259,6 +2296,8 @@ char *pointer(const char *fmt, char *buf, char *end, void *ptr,
 		return restricted_pointer(buf, end, ptr, spec);
 	case 'N':
 		return netdev_bits(buf, end, ptr, spec, fmt);
+	case '4':
+		return fourcc_string(buf, end, ptr, spec, fmt);
 	case 'a':
 		return address_val(buf, end, ptr, spec, fmt);
 	case 'd':
diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 92e888ed939f..79858e07d023 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -6557,9 +6557,11 @@ sub process {
 					$specifier = $1;
 					$extension = $2;
 					$qualifier = $3;
-					if ($extension !~ /[SsBKRraEehMmIiUDdgVCbGNOxtf]/ ||
+					if ($extension !~ /[4SsBKRraEehMmIiUDdgVCbGNOxtf]/ ||
 					    ($extension eq "f" &&
-					     defined $qualifier && $qualifier !~ /^w/)) {
+					     defined $qualifier && $qualifier !~ /^w/) ||
+					    ($extension eq "4" &&
+					     defined $qualifier && $qualifier !~ /^cc/)) {
 						$bad_specifier = $specifier;
 						last;
 					}
-- 
2.29.2

