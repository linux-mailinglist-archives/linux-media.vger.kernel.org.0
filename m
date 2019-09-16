Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8293BB4070
	for <lists+linux-media@lfdr.de>; Mon, 16 Sep 2019 20:38:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390490AbfIPSii (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Sep 2019 14:38:38 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:41144 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726084AbfIPSii (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Sep 2019 14:38:38 -0400
Received: by mail-oi1-f196.google.com with SMTP id w17so625887oiw.8
        for <linux-media@vger.kernel.org>; Mon, 16 Sep 2019 11:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iD8YNUJPC+ni027Dp+djj+9OUAvTpsiwx48j+Waj0to=;
        b=fo0NtCT36giYq5JPrJsqIRVmQYN/oY3HjnkTxEgyaHwg0e96jfbKsa4DSty8Uec/lO
         ixMcUiFz/IbCoKtm04q9BxdwCeZJjwUWF6QmEEHD54G9FjGlGs6fXnD054GgRQnuXdVq
         7z0luecfCLqEsWsKQkd2vxWgoqOPdej58miLJcgfbRyiPDgrTkcPQib491zommN7q0ZW
         PMNw1kZh6T5gu0c5EzYOJbdEIScnmFASAJIyCAKVEOnUBjdPFrvCtapXcO/M6p7i9/7j
         um52SSrSA62K+Wbqd0HL1P1UBU0P1n+K/I2ZZ3x1znyOASIawe4NWyjbhM/qbKtQfslw
         l7ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iD8YNUJPC+ni027Dp+djj+9OUAvTpsiwx48j+Waj0to=;
        b=HqDE8gQT1COkuAKlb+3r3wgqsvHQuH6uwuJV0wOgb84bSjabBKmMAswq8w8HJcJdya
         lP3gApVZIwHNj4V4poNTkjbBUIX8Iu6ma8jCcaxe5XTLQ1Nih+vjfpVOGEuJ0fbVj4MY
         tMY3bx0CY0zdi4B1GGuTL4ST/K9V/L1nYbwBnvRHo/8SPiqzohV6Wgkp5+5tNVkWljSD
         YMEjZov0E9o0IjK0u7IsnkcH/8sYc3wNcwFg882N31X6Q08dZphC6N/8rYpd8bl1at4d
         w1TBuCDuu3Dcs/pboH1LPyP86EDksGoOw4gNpe9pgBRypILb7+7+L3TU5d3AWLYhDSwS
         eQ2w==
X-Gm-Message-State: APjAAAUCwx5Wo6jPRQfLN1WvQSGsHgrkFVWN20gjNIdcHr131Js3WJkB
        4H4l8gAbogycykPtA1jcVdf9VwPq
X-Google-Smtp-Source: APXvYqxS7ucr3xidyFnMyl1Jxd+cSsiHN9NZ9kPuaJypO1ssJaqTFVowqEGubYQjGO3KSF2NYriuqg==
X-Received: by 2002:aca:642:: with SMTP id 63mr610883oig.10.1568659117337;
        Mon, 16 Sep 2019 11:38:37 -0700 (PDT)
Received: from rYz3n.attlocal.net ([2600:1700:210:3790::40])
        by smtp.googlemail.com with ESMTPSA id 94sm13491478oty.44.2019.09.16.11.38.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2019 11:38:36 -0700 (PDT)
From:   Jiunn Chang <c0d1n61at3@gmail.com>
To:     linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Cc:     hverkuil@xs4all.nl
Subject: [PATCH] cec-follower: create analog channel frequencies
Date:   Mon, 16 Sep 2019 13:38:35 -0500
Message-Id: <20190916183835.132777-1-c0d1n61at3@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This frequency table will allow proper testing of tuner control.  There
are three frequencies per analog broadcast type and broadcast system, so
tuner increment and decrement can be tested.

Signed-off-by: Jiunn Chang <c0d1n61at3@gmail.com>
---
 utils/cec-follower/cec-tuner.cpp | 77 ++++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/utils/cec-follower/cec-tuner.cpp b/utils/cec-follower/cec-tuner.cpp
index 5e794d71..e0d58e6c 100644
--- a/utils/cec-follower/cec-tuner.cpp
+++ b/utils/cec-follower/cec-tuner.cpp
@@ -7,6 +7,83 @@
 
 #include "cec-follower.h"
 
+/*
+ * This table contains analog television channel frequencies in KHz.  There are
+ * a total of three frequencies per analog broadcast type and broadcast system.
+ *
+ * CEC 17 and CEC Table 31 of the 1.4 specification lists the available analog
+ * broadcast types and broadcast systems.
+ *
+ * The table is indexed by [ana_bcast_type][bcast_system][i].
+ *
+ */
+static unsigned int analog_freqs_khz[3][9][3] =
+{
+	// cable
+	{
+		// pal-bg
+		{471250, 479250, 487250},
+		// secam-lq
+		{615250, 623250, 631250},
+		// pal-m
+		{501250, 507250, 513250},
+		// ntsc-m
+		{519250, 525250, 531250},
+		// pal-i
+		{45750, 53750, 61750},
+		// secam-dk
+		{759250, 767250, 775250},
+		// secam-bg
+		{495250, 503250, 511250},
+		// secam-l
+		{639250, 647250, 655250},
+		// pal-dk
+		{783250, 791250, 799250}
+	},
+	// satellite
+	{
+		// pal-bg
+		{519250, 527250, 535250},
+		// secam-lq
+		{663250, 671250, 679250},
+		// pal-m
+		{537250, 543250, 549250},
+		// ntsc-m
+		{555250, 561250, 567250},
+		// pal-i
+		{175250, 183250, 191250},
+		// secam-dk
+		{807250, 815250, 823250},
+		// secam-bg
+		{543250, 551250, 559250},
+		// secam-l
+		{687250, 695250, 703250},
+		// pal-dk
+		{831250, 839250, 847250}
+	},
+	// terrestrial
+	{
+		// pal-bg
+		{567250, 575250, 583250},
+		// secam-lq
+		{711250, 719250, 727250},
+		// pal-m
+		{573250, 579250, 585250},
+		// ntsc-m
+		{591250, 597250, 603250},
+		// pal-i
+		{199250, 207250, 215250},
+		// secam-dk
+		{145250, 153250, 161250},
+		// secam-bg
+		{591250, 599250, 607250},
+		// secam-l
+		{735250, 743250, 751250},
+		// pal-dk
+		{169250, 177250, 185250}
+	}
+};
+
 void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, unsigned me)
 {
 	switch (msg.msg[1]) {
-- 
2.23.0

