Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E8239DDF43
	for <lists+linux-media@lfdr.de>; Sun, 20 Oct 2019 17:50:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726482AbfJTPuD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 20 Oct 2019 11:50:03 -0400
Received: from gofer.mess.org ([88.97.38.141]:48393 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726467AbfJTPuC (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 20 Oct 2019 11:50:02 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id B7E77C6373; Sun, 20 Oct 2019 16:50:01 +0100 (BST)
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [PATCH v4l-utils] ir-keytable: bpf: improve rsc imon pointer decoder
Date:   Sun, 20 Oct 2019 16:50:01 +0100
Message-Id: <20191020155001.12778-1-sean@mess.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Sometimes the remotes sends 4 bits rather than 5. This makes the pointer
much more reliable.

Signed-off-by: Sean Young <sean@mess.org>
---
 utils/keytable/bpf_protocols/imon_rsc.c | 66 +++++++++++++------------
 1 file changed, 35 insertions(+), 31 deletions(-)

diff --git a/utils/keytable/bpf_protocols/imon_rsc.c b/utils/keytable/bpf_protocols/imon_rsc.c
index e395b09c..14c4ec37 100644
--- a/utils/keytable/bpf_protocols/imon_rsc.c
+++ b/utils/keytable/bpf_protocols/imon_rsc.c
@@ -9,7 +9,6 @@
 
 enum state {
 	STATE_INACTIVE,
-	STATE_HEADER_SPACE,
 	STATE_BITS_SPACE,
 	STATE_BITS_PULSE,
 };
@@ -33,7 +32,7 @@ struct bpf_map_def SEC("maps") decoder_state_map = {
 // an int, so that the compiler emits a mov immediate for the address
 // but uses it as an int. The bpf loader replaces the relocation with the
 // actual value (either overridden or taken from the data segment).
-int margin = 250;
+int margin = 325;
 
 #define BPF_PARAM(x) (int)(&(x))
 
@@ -68,7 +67,7 @@ int bpf_decoder(unsigned int *sample)
 	case STATE_INACTIVE:
 		if (pulse && (eq_margin(duration, 2000) ||
 			      eq_margin(duration, 3250))) {
-			s->state = STATE_HEADER_SPACE;
+			s->state = STATE_BITS_SPACE;
 			s->bits = 0;
 			s->count = 0;
 		}
@@ -80,48 +79,53 @@ int bpf_decoder(unsigned int *sample)
 		else
 			s->state = STATE_INACTIVE;
 		break;
-	case STATE_HEADER_SPACE:
-		if (!pulse && eq_margin(duration, 1875)) {
-			s->state = STATE_BITS_PULSE;
-			break;
-		}
+
 	case STATE_BITS_SPACE:
 		if (pulse) {
 			s->state = STATE_INACTIVE;
 			break;
 		}
 
-		if (s->count == 4) {
+		if (duration > 2400) {
 			int x = 0, y = 0;
-			switch (s->bits) {
-			case 0:  x = 0;  y = -4; break;
-			case 8:  x = 0;  y =  4; break;
-			case 4:  x = 4;  y =  0; break;
-			case 12: x = -4; y =  0; break;
-
-			case 2:  x = 4;  y = -4; break;
-			case 10: x = -4; y =  4; break;
-			case 6:  x = 4;  y =  4; break;
-			case 14: x = -4; y = -4; break;
-
-			case  1: x = 4;  y = -2; break;
-			case  9: x = -4; y =  2; break;
-			case  5: x = 2;  y =  4; break;
-			case 13: x = -2; y = -4; break;
-
-			case 3:  x = 2;  y = -4; break;
-			case 11: x = -2; y =  4; break;
-			case 7:  x = 4;  y =  2; break;
-			case 15: x = -4; y = -2; break;
+
+			if (!(s->count == 5 || s->count == 4)) {
+				s->state = STATE_INACTIVE;
+				break;
 			}
+
+			switch (s->bits & 0x0f) {
+			case 0x0: x =  0; y = -4; break;
+			case 0x1: x =  0; y =  4; break;
+			case 0x2: x =  4; y =  0; break;
+			case 0x3: x = -4; y =  0; break;
+
+			case 0x4: x =  4; y = -4; break;
+			case 0x5: x = -4; y =  4; break;
+			case 0x6: x =  4; y =  4; break;
+			case 0x7: x = -4; y = -4; break;
+
+			case 0xc: x =  4; y = -2; break;
+			case 0xd: x = -4; y =  2; break;
+			case 0xe: x =  2; y =  4; break;
+			case 0xf: x = -2; y = -4; break;
+
+			case 0x8: x =  2; y = -4; break;
+			case 0x9: x = -2; y =  4; break;
+			case 0xa: x =  4; y =  2; break;
+			case 0xb: x = -4; y = -2; break;
+			}
+
 			bpf_rc_pointer_rel(sample, x, y);
 
 			s->state = STATE_INACTIVE;
 			break;
 		}
 
-		if (eq_margin(duration, 1700))
-			s->bits |= 1 << s->count;
+		s->bits <<= 1;
+
+		if (eq_margin(duration, 1800))
+			s->bits |= 1;
 		else if (!eq_margin(duration, 625)) {
 			s->state = STATE_INACTIVE;
 			break;
-- 
2.23.0

