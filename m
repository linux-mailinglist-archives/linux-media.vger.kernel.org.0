Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D6281ABAA1
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2020 09:59:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440792AbgDPH6k (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Apr 2020 03:58:40 -0400
Received: from gofer.mess.org ([88.97.38.141]:36333 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2441051AbgDPH6j (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Apr 2020 03:58:39 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 2345811A002; Thu, 16 Apr 2020 08:58:37 +0100 (BST)
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [PATCH] Removed nested functions to support building with clang
Date:   Thu, 16 Apr 2020 08:58:36 +0100
Message-Id: <20200416075837.13363-1-sean@mess.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Signed-off-by: Sean Young <sean@mess.org>
---
 utils/common/ir-encode.c | 336 ++++++++++++++++++++-------------------
 1 file changed, 170 insertions(+), 166 deletions(-)

diff --git a/utils/common/ir-encode.c b/utils/common/ir-encode.c
index e4fde403..b3757e12 100644
--- a/utils/common/ir-encode.c
+++ b/utils/common/ir-encode.c
@@ -29,23 +29,24 @@
 
 #define NS_TO_US(x) (((x)+500)/1000)
 
+static const int nec_unit = 562500;
+
+static void nec_add_byte(unsigned *buf, int *n, unsigned bits)
+{
+	int i;
+	for (i=0; i<8; i++) {
+		buf[(*n)++] = NS_TO_US(nec_unit);
+		if (bits & (1 << i))
+			buf[(*n)++] = NS_TO_US(nec_unit * 3);
+		else
+			buf[(*n)++] = NS_TO_US(nec_unit);
+	}
+}
+
 static int nec_encode(enum rc_proto proto, unsigned scancode, unsigned *buf)
 {
-	const int nec_unit = 562500;
 	int n = 0;
 
-	void add_byte(unsigned bits)
-	{
-		int i;
-		for (i=0; i<8; i++) {
-			buf[n++] = NS_TO_US(nec_unit);
-			if (bits & (1 << i))
-				buf[n++] = NS_TO_US(nec_unit * 3);
-			else
-				buf[n++] = NS_TO_US(nec_unit);
-		}
-	}
-
 	buf[n++] = NS_TO_US(nec_unit * 16);
 	buf[n++] = NS_TO_US(nec_unit * 8);
 
@@ -53,22 +54,22 @@ static int nec_encode(enum rc_proto proto, unsigned scancode, unsigned *buf)
 	default:
 		return 0;
 	case RC_PROTO_NEC:
-		add_byte(scancode >> 8);
-		add_byte(~(scancode >> 8));
-		add_byte(scancode);
-		add_byte(~scancode);
+		nec_add_byte(buf, &n, scancode >> 8);
+		nec_add_byte(buf, &n, ~(scancode >> 8));
+		nec_add_byte(buf, &n, scancode);
+		nec_add_byte(buf, &n, ~scancode);
 		break;
 	case RC_PROTO_NECX:
-		add_byte(scancode >> 16);
-		add_byte(scancode >> 8);
-		add_byte(scancode);
-		add_byte(~scancode);
+		nec_add_byte(buf, &n, scancode >> 16);
+		nec_add_byte(buf, &n, scancode >> 8);
+		nec_add_byte(buf, &n, scancode);
+		nec_add_byte(buf, &n, ~scancode);
 		break;
 	case RC_PROTO_NEC32:
-		add_byte(scancode >> 16);
-		add_byte(scancode >> 24);
-		add_byte(scancode);
-		add_byte(scancode >> 8);
+		nec_add_byte(buf, &n, scancode >> 16);
+		nec_add_byte(buf, &n, scancode >> 24);
+		nec_add_byte(buf, &n, scancode);
+		nec_add_byte(buf, &n, scancode >> 8);
 		break;
 	}
 
@@ -104,102 +105,103 @@ static int jvc_encode(enum rc_proto proto, unsigned scancode, unsigned *buf)
 	return 35;
 }
 
-static int sanyo_encode(enum rc_proto proto, unsigned scancode, unsigned *buf)
+static const int sanyo_unit = 562500;
+
+static void sanyo_add_bits(unsigned **buf, int bits, int count)
 {
-	const int sanyo_unit = 562500;
-
-	void add_bits(int bits, int count)
-	{
-		int i;
-		for (i=0; i<count; i++) {
-			*buf++ = NS_TO_US(sanyo_unit);
-
-			if (bits & (1 << i))
-				*buf++ = NS_TO_US(sanyo_unit * 3);
-			else
-				*buf++ = NS_TO_US(sanyo_unit);
-		}
+	int i;
+	for (i=0; i<count; i++) {
+		*(*buf)++ = NS_TO_US(sanyo_unit);
+
+		if (bits & (1 << i))
+			*(*buf)++ = NS_TO_US(sanyo_unit * 3);
+		else
+			*(*buf)++ = NS_TO_US(sanyo_unit);
 	}
+}
 
+static int sanyo_encode(enum rc_proto proto, unsigned scancode, unsigned *buf)
+{
 	*buf++ = NS_TO_US(sanyo_unit * 16);
 	*buf++ = NS_TO_US(sanyo_unit * 8);
 
-	add_bits(scancode >> 8, 13);
-	add_bits(~(scancode >> 8), 13);
-	add_bits(scancode, 8);
-	add_bits(~scancode, 8);
+	sanyo_add_bits(&buf, scancode >> 8, 13);
+	sanyo_add_bits(&buf, ~(scancode >> 8), 13);
+	sanyo_add_bits(&buf, scancode, 8);
+	sanyo_add_bits(&buf, ~scancode, 8);
 
 	*buf = NS_TO_US(sanyo_unit);
 
 	return 87;
 }
 
-static int sharp_encode(enum rc_proto proto, unsigned scancode, unsigned *buf)
+static const int sharp_unit = 40000;
+
+static void sharp_add_bits(unsigned **buf, int bits, int count)
 {
-	const int sharp_unit = 40000;
-
-	void add_bits(int bits, int count)
-	{
-		int i;
-		for (i=0; i<count; i++) {
-			*buf++ = NS_TO_US(sharp_unit * 8);
-
-			if (bits & (1 << i))
-				*buf++ = NS_TO_US(sharp_unit * 50);
-			else
-				*buf++ = NS_TO_US(sharp_unit * 25);
-		}
+	int i;
+	for (i=0; i<count; i++) {
+		*(*buf)++ = NS_TO_US(sharp_unit * 8);
+
+		if (bits & (1 << i))
+			*(*buf)++ = NS_TO_US(sharp_unit * 50);
+		else
+			*(*buf)++ = NS_TO_US(sharp_unit * 25);
 	}
+}
 
-	add_bits(scancode >> 8, 5);
-	add_bits(scancode, 8);
-	add_bits(1, 2);
+static int sharp_encode(enum rc_proto proto, unsigned scancode, unsigned *buf)
+{
+	sharp_add_bits(&buf, scancode >> 8, 5);
+	sharp_add_bits(&buf, scancode, 8);
+	sharp_add_bits(&buf, 1, 2);
 
 	*buf++ = NS_TO_US(sharp_unit * 8);
 	*buf++ = NS_TO_US(sharp_unit * 1000);
 
-	add_bits(scancode >> 8, 5);
-	add_bits(~scancode, 8);
-	add_bits(~1, 2);
+	sharp_add_bits(&buf, scancode >> 8, 5);
+	sharp_add_bits(&buf, ~scancode, 8);
+	sharp_add_bits(&buf, ~1, 2);
 	*buf++ = NS_TO_US(sharp_unit * 8);
 
 	return (13 + 2) * 4 + 3;
 }
 
-static int sony_encode(enum rc_proto proto, unsigned scancode, unsigned *buf)
-{
-	const int sony_unit = 600000;
-	int n = 0;
+static const int sony_unit = 600000;
 
-	void add_bits(int bits, int count)
-	{
-		int i;
-		for (i=0; i<count; i++) {
-			if (bits & (1 << i))
-				buf[n++] = NS_TO_US(sony_unit * 2);
-			else
-				buf[n++] = NS_TO_US(sony_unit);
+static void sony_add_bits(unsigned *buf, int *n, int bits, int count)
+{
+	int i;
+	for (i=0; i<count; i++) {
+		if (bits & (1 << i))
+			buf[(*n)++] = NS_TO_US(sony_unit * 2);
+		else
+			buf[(*n)++] = NS_TO_US(sony_unit);
 
-			buf[n++] = NS_TO_US(sony_unit);
-		}
+		buf[(*n)++] = NS_TO_US(sony_unit);
 	}
+}
+
+static int sony_encode(enum rc_proto proto, unsigned scancode, unsigned *buf)
+{
+	int n = 0;
 
 	buf[n++] = NS_TO_US(sony_unit * 4);
 	buf[n++] = NS_TO_US(sony_unit);
 
 	switch (proto) {
 	case RC_PROTO_SONY12:
-		add_bits(scancode, 7);
-		add_bits(scancode >> 16, 5);
+		sony_add_bits(buf, &n, scancode, 7);
+		sony_add_bits(buf, &n, scancode >> 16, 5);
 		break;
 	case RC_PROTO_SONY15:
-		add_bits(scancode, 7);
-		add_bits(scancode >> 16, 8);
+		sony_add_bits(buf, &n, scancode, 7);
+		sony_add_bits(buf, &n, scancode >> 16, 8);
 		break;
 	case RC_PROTO_SONY20:
-		add_bits(scancode, 7);
-		add_bits(scancode >> 16, 5);
-		add_bits(scancode >> 8, 8);
+		sony_add_bits(buf, &n, scancode, 7);
+		sony_add_bits(buf, &n, scancode >> 16, 5);
+		sony_add_bits(buf, &n, scancode >> 8, 8);
 		break;
 	default:
 		return 0;
@@ -209,39 +211,40 @@ static int sony_encode(enum rc_proto proto, unsigned scancode, unsigned *buf)
 	return n - 1;
 }
 
-static int rc5_encode(enum rc_proto proto, unsigned scancode, unsigned *buf)
-{
-	const unsigned int rc5_unit = 888888;
-	unsigned n = 0;
+static const unsigned int rc5_unit = 888888;
 
-	void advance_space(unsigned length)
-	{
-		if (n % 2)
-			buf[n] += length;
-		else
-			buf[++n] = length;
-	}
+static void rc5_advance_space(unsigned *buf, unsigned *n, unsigned length)
+{
+	if (*n % 2)
+		buf[*n] += length;
+	else
+		buf[++(*n)] = length;
+}
 
-	void advance_pulse(unsigned length)
-	{
-		if (n % 2)
-			buf[++n] = length;
-		else
-			buf[n] += length;
-	}
+static void rc5_advance_pulse(unsigned *buf, unsigned *n, unsigned length)
+{
+	if (*n % 2)
+		buf[++(*n)] = length;
+	else
+		buf[*n] += length;
+}
 
-	void add_bits(int bits, int count)
-	{
-		while (count--) {
-			if (bits & (1 << count)) {
-				advance_space(NS_TO_US(rc5_unit));
-				advance_pulse(NS_TO_US(rc5_unit));
-			} else {
-				advance_pulse(NS_TO_US(rc5_unit));
-				advance_space(NS_TO_US(rc5_unit));
-			}
+static void rc5_add_bits(unsigned *buf, unsigned *n, int bits, int count)
+{
+	while (count--) {
+		if (bits & (1 << count)) {
+			rc5_advance_space(buf, n, NS_TO_US(rc5_unit));
+			rc5_advance_pulse(buf, n, NS_TO_US(rc5_unit));
+		} else {
+			rc5_advance_pulse(buf, n, NS_TO_US(rc5_unit));
+			rc5_advance_space(buf, n, NS_TO_US(rc5_unit));
 		}
 	}
+}
+
+static int rc5_encode(enum rc_proto proto, unsigned scancode, unsigned *buf)
+{
+	unsigned n = 0;
 
 	buf[n] = NS_TO_US(rc5_unit);
 
@@ -249,24 +252,24 @@ static int rc5_encode(enum rc_proto proto, unsigned scancode, unsigned *buf)
 	default:
 		return 0;
 	case RC_PROTO_RC5:
-		add_bits(!(scancode & 0x40), 1);
-		add_bits(0, 1);
-		add_bits(scancode >> 8, 5);
-		add_bits(scancode, 6);
+		rc5_add_bits(buf, &n, !(scancode & 0x40), 1);
+		rc5_add_bits(buf, &n, 0, 1);
+		rc5_add_bits(buf, &n, scancode >> 8, 5);
+		rc5_add_bits(buf, &n, scancode, 6);
 		break;
 	case RC_PROTO_RC5_SZ:
-		add_bits(!!(scancode & 0x2000), 1);
-		add_bits(0, 1);
-		add_bits(scancode >> 6, 6);
-		add_bits(scancode, 6);
+		rc5_add_bits(buf, &n, !!(scancode & 0x2000), 1);
+		rc5_add_bits(buf, &n, 0, 1);
+		rc5_add_bits(buf, &n, scancode >> 6, 6);
+		rc5_add_bits(buf, &n, scancode, 6);
 		break;
 	case RC_PROTO_RC5X_20:
-		add_bits(!(scancode & 0x4000), 1);
-		add_bits(0, 1);
-		add_bits(scancode >> 16, 5);
-		advance_space(NS_TO_US(rc5_unit * 4));
-		add_bits(scancode >> 8, 6);
-		add_bits(scancode, 6);
+		rc5_add_bits(buf, &n, !(scancode & 0x4000), 1);
+		rc5_add_bits(buf, &n, 0, 1);
+		rc5_add_bits(buf, &n, scancode >> 16, 5);
+		rc5_advance_space(buf, &n, NS_TO_US(rc5_unit * 4));
+		rc5_add_bits(buf, &n, scancode >> 8, 6);
+		rc5_add_bits(buf, &n, scancode, 6);
 		break;
 	}
 
@@ -274,40 +277,41 @@ static int rc5_encode(enum rc_proto proto, unsigned scancode, unsigned *buf)
 	return (n % 2) ? n : n + 1;
 }
 
-static int rc6_encode(enum rc_proto proto, unsigned scancode, unsigned *buf)
-{
-	const unsigned int rc6_unit = 444444;
-	unsigned n = 0;
+static const unsigned int rc6_unit = 444444;
 
-	void advance_space(unsigned length)
-	{
-		if (n % 2)
-			buf[n] += length;
-		else
-			buf[++n] = length;
-	}
+static void rc6_advance_space(unsigned *buf, unsigned *n, unsigned length)
+{
+	if (*n % 2)
+		buf[*n] += length;
+	else
+		buf[++(*n)] = length;
+}
 
-	void advance_pulse(unsigned length)
-	{
-		if (n % 2)
-			buf[++n] = length;
-		else
-			buf[n] += length;
-	}
+static void rc6_advance_pulse(unsigned *buf, unsigned *n, unsigned length)
+{
+	if (*n % 2)
+		buf[++(*n)] = length;
+	else
+		buf[*n] += length;
+}
 
-	void add_bits(unsigned bits, unsigned count, unsigned length)
-	{
-		while (count--) {
-			if (bits & (1 << count)) {
-				advance_pulse(length);
-				advance_space(length);
-			} else {
-				advance_space(length);
-				advance_pulse(length);
-			}
+static void rc6_add_bits(unsigned *buf, unsigned *n,
+			 unsigned bits, unsigned count, unsigned length)
+{
+	while (count--) {
+		if (bits & (1 << count)) {
+			rc6_advance_pulse(buf, n, length);
+			rc6_advance_space(buf, n, length);
+		} else {
+			rc6_advance_space(buf, n, length);
+			rc6_advance_pulse(buf, n, length);
 		}
 	}
+}
 
+static int rc6_encode(enum rc_proto proto, unsigned scancode, unsigned *buf)
+{
+	unsigned n = 0;
 	buf[n++] = NS_TO_US(rc6_unit * 6);
 	buf[n++] = NS_TO_US(rc6_unit * 2);
 	buf[n] = 0;
@@ -316,25 +320,25 @@ static int rc6_encode(enum rc_proto proto, unsigned scancode, unsigned *buf)
 	default:
 		return 0;
 	case RC_PROTO_RC6_0:
-		add_bits(8, 4, NS_TO_US(rc6_unit));
-		add_bits(0, 1, NS_TO_US(rc6_unit * 2));
-		add_bits(scancode, 16, NS_TO_US(rc6_unit));
+		rc6_add_bits(buf, &n, 8, 4, NS_TO_US(rc6_unit));
+		rc6_add_bits(buf, &n, 0, 1, NS_TO_US(rc6_unit * 2));
+		rc6_add_bits(buf, &n, scancode, 16, NS_TO_US(rc6_unit));
 		break;
 	case RC_PROTO_RC6_6A_20:
-		add_bits(14, 4, NS_TO_US(rc6_unit));
-		add_bits(0, 1, NS_TO_US(rc6_unit * 2));
-		add_bits(scancode, 20, NS_TO_US(rc6_unit));
+		rc6_add_bits(buf, &n, 14, 4, NS_TO_US(rc6_unit));
+		rc6_add_bits(buf, &n, 0, 1, NS_TO_US(rc6_unit * 2));
+		rc6_add_bits(buf, &n, scancode, 20, NS_TO_US(rc6_unit));
 		break;
 	case RC_PROTO_RC6_6A_24:
-		add_bits(14, 4, NS_TO_US(rc6_unit));
-		add_bits(0, 1, NS_TO_US(rc6_unit * 2));
-		add_bits(scancode, 24, NS_TO_US(rc6_unit));
+		rc6_add_bits(buf, &n, 14, 4, NS_TO_US(rc6_unit));
+		rc6_add_bits(buf, &n, 0, 1, NS_TO_US(rc6_unit * 2));
+		rc6_add_bits(buf, &n, scancode, 24, NS_TO_US(rc6_unit));
 		break;
 	case RC_PROTO_RC6_6A_32:
 	case RC_PROTO_RC6_MCE:
-		add_bits(14, 4, NS_TO_US(rc6_unit));
-		add_bits(0, 1, NS_TO_US(rc6_unit * 2));
-		add_bits(scancode, 32, NS_TO_US(rc6_unit));
+		rc6_add_bits(buf, &n, 14, 4, NS_TO_US(rc6_unit));
+		rc6_add_bits(buf, &n, 0, 1, NS_TO_US(rc6_unit * 2));
+		rc6_add_bits(buf, &n, scancode, 32, NS_TO_US(rc6_unit));
 		break;
 	}
 
-- 
2.25.2

