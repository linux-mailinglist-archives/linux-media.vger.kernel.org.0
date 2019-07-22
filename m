Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D1AC66F8CC
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2019 07:22:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726888AbfGVFWG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Jul 2019 01:22:06 -0400
Received: from gofer.mess.org ([88.97.38.141]:60223 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725795AbfGVFWF (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Jul 2019 01:22:05 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 398BD6078A; Mon, 22 Jul 2019 06:22:04 +0100 (BST)
Date:   Mon, 22 Jul 2019 06:22:04 +0100
From:   Sean Young <sean@mess.org>
To:     John G <johngo7470@yahoo.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: scancodes identified as invalid
Message-ID: <20190722052203.xi2z3jwbya4kbzx4@gofer.mess.org>
References: <5370cd2b-f699-7831-e040-4b27e7f0cdaa@xnet.com>
 <20190721193607.hi3ipvxyedlhii3p@gofer.mess.org>
 <1981366943.5122868.1563752034290@mail.yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1981366943.5122868.1563752034290@mail.yahoo.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On Sun, Jul 21, 2019 at 11:33:54PM +0000, John G wrote:
>  Hi Sean, 
> 
> Thank you for the reply and the links! (difficult to find with Google)
> 
> >  I'm not sure what the nec1 protocol is exactly. This sounds like a AnalysIR invention.
> 
> Actually, NEC1 is noted at irdb.tk (IR code database) - AnalysIR identifies it as NEC, though probably should be more specifically identified as nec32.
> 
> 
> > So for nec any value between 0 and 0xffff is valid; necx it is 0 to 0xffffff and nec32 it is 0 to 0xffffffff.
> 
> So then nec32 should accept a 32bit value, so it would seem I have nec32 codes...  
> 
> So then why do "ir-ctl -S nec32:0x20df10ef" and "ir-ctl -S nec32:0x02FD48B7" return an invalid scancode error?  
> 
> What's also peculiar, is that some 32-bit codes work -  "ir-ctl -S nec32:0x800f0410" transmits with no problem.
> Could there be a snafu in the scancode check for nec32?

So nec can repeat the address and command bits in inverted form, but
ir-ctl does not want them in the scancode if they can be removed. Currently
it just says "invalid scancode" which is not helpful really.

nec32:0x02FD48B7 can be simplified into nec:0x0248 so it does not accept it.
I think ir-ctl should be much better on this. How about this patch.

Thanks,

Sean


From c94336a86c6f34315ffd934186b43e5524193b01 Mon Sep 17 00:00:00 2001
From: Sean Young <sean@mess.org>
Date: Mon, 22 Jul 2019 06:15:37 +0100
Subject: [PATCH v4l-utils] ir-ctl: show user how scancodes should be presented

Currently ir-ctl just says the scancode is invalid, which is not
very clear.

Signed-off-by: Sean Young <sean@mess.org>
---
 utils/common/ir-encode.c | 68 ++++++++++++++++++++++++++++++++--------
 utils/common/ir-encode.h |  2 +-
 utils/ir-ctl/ir-ctl.c    | 10 ++----
 3 files changed, 58 insertions(+), 22 deletions(-)

diff --git a/utils/common/ir-encode.c b/utils/common/ir-encode.c
index 93c88501..670ede11 100644
--- a/utils/common/ir-encode.c
+++ b/utils/common/ir-encode.c
@@ -21,6 +21,7 @@
 #include <stdint.h>
 #include <stdlib.h>
 #include <ctype.h>
+#include <stdio.h>
 
 #include <linux/lirc.h>
 
@@ -427,22 +428,63 @@ unsigned protocol_scancode_mask(enum rc_proto proto)
 	return protocols[proto].scancode_mask;
 }
 
-bool protocol_scancode_valid(enum rc_proto p, unsigned s)
+void protocol_scancode_valid(enum rc_proto *p, unsigned *s)
 {
-	if (s & ~protocols[p].scancode_mask)
-		return false;
-
-	if (p == RC_PROTO_NECX) {
-		return (((s >> 16) ^ ~(s >> 8)) & 0xff) != 0;
-	} else if (p == RC_PROTO_NEC32) {
-		return (((s >> 24) ^ ~(s >> 16)) & 0xff) != 0;
-	} else if (p == RC_PROTO_RC6_MCE) {
-		return (s & 0xffff0000) == 0x800f0000;
-	} else if (p == RC_PROTO_RC6_6A_32) {
-		return (s & 0xffff0000) != 0x800f0000;
+	enum rc_proto p2 = *p;
+	unsigned s2 = *s;
+
+	// rc6_mce is rc6_6a_32 with vendor code 0x800f and
+	if (*p == RC_PROTO_RC6_MCE && (*s & 0xffff0000) != 0x800f0000) {
+		p2 = RC_PROTO_RC6_6A_32;
+		s2 = 0x800f0000 + (*s & 0x7fff);
+		fprintf(stderr, "warning: rc6_mce:0x%08x should be written as rc6_6a_32:%082x\n", *s, s2);
+	} else if (*p == RC_PROTO_RC6_6A_32 && (*s & 0xffff0000) == 0x800f0000) {
+		p2 = RC_PROTO_RC6_MCE;
+	} else if (*p == RC_PROTO_NEC || *p == RC_PROTO_NECX || *p == RC_PROTO_NEC32) {
+		// nec scancodes may repeat the address and command
+		// in inverted form; the inverted values are not in the
+		// scancode.
+
+		// can 24 bit scancode be represented as 16 bit value
+		if (*s > 0x0000ffff && *s <= 0x00ffffff) {
+			if ((((*s >> 16) ^ ~(*s >> 8)) & 0xff) != 0) {
+				// is it necx
+				p2 = RC_PROTO_NECX;
+			} else {
+				// or regular nec
+				s2 = ((*s >> 8) & 0xff00) | (*s & 0x00ff);
+				p2 = RC_PROTO_NEC;
+			}
+		// can 32 bit scancode be represented as 24 or 16 bit value
+		} else if (*s > 0x00ffffff) {
+			if (((((*s >> 24) ^ ~(*s >> 16)) & 0xff) == 0) &&
+			    ((((*s >> 8) ^ ~(*s >> 0)) & 0xff) == 0)) {
+				// is it nec
+				s2 = ((*s >> 16) & 0xff00) |
+				     ((*s >> 8) & 0x00ff);
+				p2 = RC_PROTO_NEC;
+			} else if (((((*s >> 24) ^ ~(*s >> 16)) & 0xff) == 0) &&
+			    ((((*s >> 8) ^ ~(*s >> 0)) & 0xff) != 0)) {
+				// is it nec-x
+				s2 = ((*s >> 16) & 0xffff00) |
+				     ((*s >> 8) & 0x0000ff);
+				p2 = RC_PROTO_NECX;
+			} else {
+				// or regular nec
+				p2 = RC_PROTO_NEC32;
+			}
+		}
 	}
 
-	return true;
+	s2 &= protocols[p2].scancode_mask;
+
+	if (*p != p2 || *s != s2) {
+		fprintf(stderr, "warning: %s:0x%x should be written as %s:0x%x\n",
+			protocol_name(*p), *s,
+			protocol_name(p2), s2);
+		*p = p2;
+		*s = s2;
+	}
 }
 
 bool protocol_encoder_available(enum rc_proto proto)
diff --git a/utils/common/ir-encode.h b/utils/common/ir-encode.h
index 7202c2d8..df595354 100644
--- a/utils/common/ir-encode.h
+++ b/utils/common/ir-encode.h
@@ -7,7 +7,7 @@
 bool protocol_match(const char *name, enum rc_proto *proto);
 unsigned protocol_carrier(enum rc_proto proto);
 unsigned protocol_max_size(enum rc_proto proto);
-bool protocol_scancode_valid(enum rc_proto proto, unsigned scancode);
+void protocol_scancode_valid(enum rc_proto *proto, unsigned *scancode);
 unsigned protocol_scancode_mask(enum rc_proto proto);
 bool protocol_encoder_available(enum rc_proto proto);
 unsigned protocol_encode(enum rc_proto proto, unsigned scancode, unsigned *buf);
diff --git a/utils/ir-ctl/ir-ctl.c b/utils/ir-ctl/ir-ctl.c
index 03c2791d..82ac0dee 100644
--- a/utils/ir-ctl/ir-ctl.c
+++ b/utils/ir-ctl/ir-ctl.c
@@ -265,10 +265,7 @@ static struct file *read_file(struct arguments *args, const char *fname)
 				return NULL;
 			}
 
-			if (!protocol_scancode_valid(proto, scancode)) {
-				fprintf(stderr, _("error: %s:%d: invalid scancode '%s' for protocol '%s'\n"), fname, lineno, scancodestr, protocol_name(proto));
-				return NULL;
-			}
+			protocol_scancode_valid(&proto, &scancode);
 
 			if (len + protocol_max_size(proto) >= LIRCBUF_SIZE) {
 				fprintf(stderr, _("error: %s:%d: too much IR for one transmit\n"), fname, lineno);
@@ -380,10 +377,7 @@ static struct file *read_scancode(const char *name)
 		return NULL;
 	}
 
-	if (!protocol_scancode_valid(proto, scancode)) {
-		fprintf(stderr, _("error: invalid scancode '%s' for protocol '%s'\n"), p + 1, protocol_name(proto));
-		return NULL;
-	}
+	protocol_scancode_valid(&proto, &scancode);
 
 	f = malloc(sizeof(*f));
 	if (f == NULL) {
-- 
2.21.0

