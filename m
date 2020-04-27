Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A0681BAAAF
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2020 19:04:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726318AbgD0REu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Apr 2020 13:04:50 -0400
Received: from smtprelay0186.hostedemail.com ([216.40.44.186]:58026 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726295AbgD0REt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Apr 2020 13:04:49 -0400
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
        by smtpgrave05.hostedemail.com (Postfix) with ESMTP id EE6ED180295A1;
        Mon, 27 Apr 2020 17:04:48 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay04.hostedemail.com (Postfix) with ESMTP id 1AE11180A734F;
        Mon, 27 Apr 2020 17:04:48 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,,RULES_HIT:41:355:379:599:960:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1542:1593:1594:1711:1730:1747:1777:1792:2393:2538:2559:2562:2689:2828:3138:3139:3140:3141:3142:3355:3622:3865:3866:3868:3871:3872:3874:4321:4605:5007:6119:6120:6742:7875:7901:7903:7904:8603:9036:10004:10400:10848:11026:11232:11473:11658:11914:12043:12291:12296:12297:12555:12683:12740:12760:12895:12986:13255:13439:14093:14097:14659:14721:21080:21220:21451:21611:21627:21990:30012:30054:30091,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:2,LUA_SUMMARY:none
X-HE-Tag: cow00_c88ad9aa571f
X-Filterd-Recvd-Size: 4029
Received: from XPS-9350.home (unknown [47.151.136.130])
        (Authenticated sender: joe@perches.com)
        by omf14.hostedemail.com (Postfix) with ESMTPA;
        Mon, 27 Apr 2020 17:04:45 +0000 (UTC)
Message-ID: <be11c660467e8660ebbc311ec9b77b6b1b265e78.camel@perches.com>
Subject: Re: [RESEND PATCH v3 1/1] lib/vsprintf: Add support for printing
 V4L2 and DRM fourccs
From:   Joe Perches <joe@perches.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Petr Mladek <pmladek@suse.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-media@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com,
        mchehab@kernel.org,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Jani Nikula <jani.nikula@linux.intel.com>
Date:   Mon, 27 Apr 2020 10:04:44 -0700
In-Reply-To: <0c487ba493f4b4c0f68b3dfd23f14a080e4fb0c2.camel@perches.com>
References: <20200427145303.29943-1-sakari.ailus@linux.intel.com>
         <0c487ba493f4b4c0f68b3dfd23f14a080e4fb0c2.camel@perches.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 2020-04-27 at 09:02 -0700, Joe Perches wrote:
> On Mon, 2020-04-27 at 17:53 +0300, Sakari Ailus wrote:
> > Add a printk modifier %p4cc (for pixel format) for printing V4L2 and DRM
> > pixel formats denoted by fourccs. The fourcc encoding is the same for both
> > so the same implementation can be used.
> []
> > - Added WARN_ON_ONCE() sanity checks. Comments on these are welcome; I'd
> >   expect them mostly be covered by the tests.

perhaps this is simpler?
---
 lib/vsprintf.c | 43 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/lib/vsprintf.c b/lib/vsprintf.c
index 7c488a..3e1dbd7 100644
--- a/lib/vsprintf.c
+++ b/lib/vsprintf.c
@@ -1721,6 +1721,46 @@ char *netdev_bits(char *buf, char *end, const void *addr,
 	return special_hex_number(buf, end, num, size);
 }
 
+static noinline_for_stack
+char *fourcc_string(char *buf, char *end, const u32 *fourcc,
+		    struct printf_spec spec, const char *fmt)
+{
+	char output[sizeof("(xx)(xx)(xx)(xx) little-endian (0x01234567)")];
+	char *p = output;
+	int i;
+	u32 val;
+
+	if (check_pointer(&buf, end, fourcc, spec))
+		return buf;
+
+	if (fmt[1] != 'c' || fmt[2] != 'c')
+		return error_string(buf, end, "(%p4?)", spec);
+
+	val = *fourcc & ~BIT(31);
+
+	for (i = 0; i < 4; i++) {
+		unsigned char c = val >> (i * 8);
+
+		if (isascii(c) && isprint(c)) {
+			*p++ = c;
+		} else {
+			*p++ = '(';
+			p = hex_byte_pack(p, c);
+			*p++ = ')';
+		}
+	}
+
+	strcpy(p, *fourcc & BIT(31) ? "big endian" : "little endian");
+	p += strlen(p);
+	*p++ = ' ';
+	*p++ = '(';
+	p = special_hex_number(p, p + 10, val, 4);
+	*p++ = ')';
+	*p = 0;
+
+	return string(buf, end, output, spec);
+}
+
 static noinline_for_stack
 char *address_val(char *buf, char *end, const void *addr,
 		  struct printf_spec spec, const char *fmt)
@@ -2131,6 +2171,7 @@ char *fwnode_string(char *buf, char *end, struct fwnode_handle *fwnode,
  *       correctness of the format string and va_list arguments.
  * - 'K' For a kernel pointer that should be hidden from unprivileged users
  * - 'NF' For a netdev_features_t
+ * - '4cc' V4L2 or DRM FourCC code, with endianness and raw numerical value.
  * - 'h[CDN]' For a variable-length buffer, it prints it as a hex string with
  *            a certain separator (' ' by default):
  *              C colon
@@ -2223,6 +2264,8 @@ char *pointer(const char *fmt, char *buf, char *end, void *ptr,
 		return restricted_pointer(buf, end, ptr, spec);
 	case 'N':
 		return netdev_bits(buf, end, ptr, spec, fmt);
+	case '4':
+		return fourcc_string(buf, end, ptr, spec, fmt);
 	case 'a':
 		return address_val(buf, end, ptr, spec, fmt);
 	case 'd':

