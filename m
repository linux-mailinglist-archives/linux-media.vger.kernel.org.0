Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 412371BA6FC
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2020 16:54:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728024AbgD0Oyv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Apr 2020 10:54:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727115AbgD0Oyv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Apr 2020 10:54:51 -0400
X-Greylist: delayed 174 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 27 Apr 2020 07:54:50 PDT
Received: from hillosipuli.retiisi.org.uk (hillosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::81:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0A1EC0610D5;
        Mon, 27 Apr 2020 07:54:50 -0700 (PDT)
Received: from lanttu.localdomain (lanttu.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::c1:2])
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTP id 0542A634C8B;
        Mon, 27 Apr 2020 17:53:58 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Petr Mladek <pmladek@suse.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-media@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com,
        mchehab@kernel.org,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Joe Perches <joe@perches.com>,
        Jani Nikula <jani.nikula@linux.intel.com>
Subject: [RESEND PATCH v3 1/1] lib/vsprintf: Add support for printing V4L2 and DRM fourccs
Date:   Mon, 27 Apr 2020 17:53:03 +0300
Message-Id: <20200427145303.29943-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a printk modifier %p4cc (for pixel format) for printing V4L2 and DRM
pixel formats denoted by fourccs. The fourcc encoding is the same for both
so the same implementation can be used.

Suggested-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
since v2:

- Add comments to explain why things are being done

- Print characters under 32 (space) as hexadecimals in parenthesis.

- Do not print spaces in the fourcc codes.

- Make use of a loop over the fourcc characters instead of
  put_unaligned_le32(). This is necessary to omit spaces in the output.

- Use DRM style format instead of V4L2. This provides the precise code as
  a numerical value as well as explicit endianness information.

- Added WARN_ON_ONCE() sanity checks. Comments on these are welcome; I'd
  expect them mostly be covered by the tests.

- Added tests for %p4cc in lib/test_printf.c

 Documentation/core-api/printk-formats.rst | 12 ++++
 lib/test_printf.c                         | 17 +++++
 lib/vsprintf.c                            | 86 +++++++++++++++++++++++
 3 files changed, 115 insertions(+)

diff --git a/Documentation/core-api/printk-formats.rst b/Documentation/core-api/printk-formats.rst
index 8ebe46b1af39..7aa0451e06fb 100644
--- a/Documentation/core-api/printk-formats.rst
+++ b/Documentation/core-api/printk-formats.rst
@@ -545,6 +545,18 @@ For printing netdev_features_t.
 
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
 Thanks
 ======
 
diff --git a/lib/test_printf.c b/lib/test_printf.c
index 2d9f520d2f27..a14754086707 100644
--- a/lib/test_printf.c
+++ b/lib/test_printf.c
@@ -624,6 +624,22 @@ static void __init fwnode_pointer(void)
 	software_node_unregister_nodes(softnodes);
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
@@ -668,6 +684,7 @@ test_pointer(void)
 	flags();
 	errptr();
 	fwnode_pointer();
+	fourcc_pointer();
 }
 
 static void __init selftest(void)
diff --git a/lib/vsprintf.c b/lib/vsprintf.c
index 7c488a1ce318..02e7906619c0 100644
--- a/lib/vsprintf.c
+++ b/lib/vsprintf.c
@@ -1721,6 +1721,89 @@ char *netdev_bits(char *buf, char *end, const void *addr,
 	return special_hex_number(buf, end, num, size);
 }
 
+static noinline_for_stack
+char *fourcc_string(char *buf, char *end, const u32 *__fourcc,
+		    struct printf_spec spec, const char *fmt)
+{
+#define FOURCC_HEX_CHAR_STR		"(xx)"
+#define FOURCC_BIG_ENDIAN_STR		" big-endian"
+#define FOURCC_LITTLE_ENDIAN_STR	" little-endian"
+#define FOURCC_HEX_NUMBER		" (0x01234567)"
+#define FOURCC_STRING_MAX						\
+	FOURCC_HEX_CHAR_STR FOURCC_HEX_CHAR_STR FOURCC_HEX_CHAR_STR	\
+	FOURCC_HEX_CHAR_STR FOURCC_LITTLE_ENDIAN_STR FOURCC_HEX_NUMBER
+	struct printf_spec my_spec = {
+		.type = FORMAT_TYPE_UINT,
+		.field_width = 2,
+		.flags = SMALL,
+		.base = 16,
+		.precision = -1,
+	};
+	char __s[sizeof(FOURCC_STRING_MAX)];
+	char *s = __s;
+	unsigned int i;
+	/*
+	 * The 31st bit defines the endianness of the data, so save its printing
+	 * for later.
+	 */
+	u32 fourcc = *__fourcc & ~BIT(31);
+	int ret;
+
+	if (check_pointer(&buf, end, __fourcc, spec))
+		return buf;
+
+	if (fmt[1] != 'c' || fmt[2] != 'c')
+		return error_string(buf, end, "(%p4?)", spec);
+
+	for (i = 0; i < sizeof(fourcc); i++, fourcc >>= 8) {
+		unsigned char c = fourcc;
+
+		/* Weed out spaces */
+		if (c == ' ')
+			continue;
+
+		/* Print non-control characters as-is */
+		if (c > ' ') {
+			*s = c;
+			s++;
+			continue;
+		}
+
+		if (WARN_ON_ONCE(sizeof(__s) <
+				 (s - __s) + sizeof(FOURCC_HEX_CHAR_STR)))
+			break;
+
+		*s = '(';
+		s++;
+		s = number(s, s + 2, c, my_spec);
+		*s = ')';
+		s++;
+	}
+
+	ret = strscpy(s, *__fourcc & BIT(31) ? FOURCC_BIG_ENDIAN_STR
+					     : FOURCC_LITTLE_ENDIAN_STR,
+		      sizeof(__s) - (s - __s));
+	if (!WARN_ON_ONCE(ret < 0))
+		s += ret;
+
+	if (!WARN_ON_ONCE(sizeof(__s) <
+			  (s - __s) + sizeof(FOURCC_HEX_NUMBER))) {
+		*s = ' ';
+		s++;
+		*s = '(';
+		s++;
+		/* subtract parentheses and the space from the size */
+		special_hex_number(s, s + sizeof(FOURCC_HEX_NUMBER) - 3,
+				   *__fourcc, sizeof(u32));
+		s += sizeof(u32) * 2 + 2 /* 0x */;
+		*s = ')';
+		s++;
+		*s = '\0';
+	}
+
+	return string(buf, end, __s, spec);
+}
+
 static noinline_for_stack
 char *address_val(char *buf, char *end, const void *addr,
 		  struct printf_spec spec, const char *fmt)
@@ -2131,6 +2214,7 @@ char *fwnode_string(char *buf, char *end, struct fwnode_handle *fwnode,
  *       correctness of the format string and va_list arguments.
  * - 'K' For a kernel pointer that should be hidden from unprivileged users
  * - 'NF' For a netdev_features_t
+ * - '4cc' V4L2 or DRM FourCC code, with endianness and raw numerical value.
  * - 'h[CDN]' For a variable-length buffer, it prints it as a hex string with
  *            a certain separator (' ' by default):
  *              C colon
@@ -2223,6 +2307,8 @@ char *pointer(const char *fmt, char *buf, char *end, void *ptr,
 		return restricted_pointer(buf, end, ptr, spec);
 	case 'N':
 		return netdev_bits(buf, end, ptr, spec, fmt);
+	case '4':
+		return fourcc_string(buf, end, ptr, spec, fmt);
 	case 'a':
 		return address_val(buf, end, ptr, spec, fmt);
 	case 'd':
-- 
2.20.1

