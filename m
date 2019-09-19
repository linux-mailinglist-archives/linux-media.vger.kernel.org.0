Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E566B805C
	for <lists+linux-media@lfdr.de>; Thu, 19 Sep 2019 19:47:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391104AbfISRrM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Sep 2019 13:47:12 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:37242 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391091AbfISRrL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Sep 2019 13:47:11 -0400
Received: by mail-ot1-f68.google.com with SMTP id k32so3869813otc.4
        for <linux-media@vger.kernel.org>; Thu, 19 Sep 2019 10:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=e/h8OYApTZAz9y14DRVpzYnRe4cI2DBg+NcTA827KGE=;
        b=HxR7JA8sJ46nHpoKeZZSCOrqqmFA6KG17Baw7mCONW/FSQh1gvlcmJ0Ou/rOX5m8L6
         hHSYCyhpcoHsi/xbG6MzL3dd6/ymk3KdKioAgBDQhiB3R43J1ijNMkLpb5crCARHTwR2
         eYLfGsM6Mmtg5zleElCdEC67lbtBgO6FF9gijl70ofv8sg6yWcNurP7kyB/50re/BF+1
         jRbzyTtV3gFCS8Ym+bGy8wbpDJD+hFDRCchCX2+Ckqya59CR7QqhRnhKaBpkjcLyqRf5
         FG4I8qGYa/Fp6JiOoWpwsvVufeiJbQ8IN03WqhjjYAqAYAojwR7wTeIM9Yc4nJKgA5qZ
         7Vgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=e/h8OYApTZAz9y14DRVpzYnRe4cI2DBg+NcTA827KGE=;
        b=eJfc7z9MP59ckMsqUbnas1FjgHiTZPjSQf+7oqknKlNj89+J6SprkL2YI+2n8dhgdA
         3rb9tC+x59y9RK7K4Xzvl01J86M9PX/cOphJfN9sYt+FxQQu6davEewxLmydKrJZ8W+a
         kjG4KZkanRWKiKmLHn3mMeRlPKBC5CorFbIKhJ7TLBZlOU2yyuUnge9o77MM/WprP5gi
         wW1/+ZyR7iMJ1YZBilQni9I5bKcuclpbSONoD0fino3GdycEPLQgJxwuIrxLMU86VMVA
         +GuB0rJ93fuwcSS9+ru7jnqRaXpcxnge5bLlgZkUfHSVLLxf5oFvzLWKPpth912iPB/s
         rvrA==
X-Gm-Message-State: APjAAAWCwxwQOZTjbddlVNzfVFu9zWI2+uhiCIovAOg9+T7CTMB+o3fT
        x3jWSs9plWNjV9VisYl/a8QJRpLC
X-Google-Smtp-Source: APXvYqwR+zeTOUpGpBZRuIxbyHLVCgw4LSit5H1KJvWKKXj5O5WZ9P6goG41eDdlKEF3pzmnfI11HA==
X-Received: by 2002:a05:6830:214d:: with SMTP id r13mr7292753otd.121.1568915229666;
        Thu, 19 Sep 2019 10:47:09 -0700 (PDT)
Received: from rYz3n.attlocal.net ([2600:1700:210:3790::48])
        by smtp.googlemail.com with ESMTPSA id e5sm3033680otr.81.2019.09.19.10.47.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2019 10:47:08 -0700 (PDT)
From:   Jiunn Chang <c0d1n61at3@gmail.com>
To:     linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Cc:     hverkuil@xs4all.nl
Subject: [PATCH v4] cec-follower: create analog channel frequencies
Date:   Thu, 19 Sep 2019 12:47:01 -0500
Message-Id: <20190919174702.140335-2-c0d1n61at3@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190919025324.277999-1-c0d1n61at3@gmail.com>
References: <20190919025324.277999-1-c0d1n61at3@gmail.com>
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

Changes made since v1:
  - Add Wikipedia link for analog channel frequencies
  - Add spaces between { and }

Changes made since v2:
  - Add reply_feature_abort() to cec-tuner.cpp
  - Refactor lines numbers since a fix patch was needed for cec-tuner.cpp

Changes made since v3:
  - Remove reply_feature_abort() from cec-tuner.cpp
  - Add macro for NUM_ANALOG_FREQS
  - Refactor lines numbers since a fix patch was needed for cec-tuner.cpp

---
 utils/cec-follower/cec-tuner.cpp | 82 ++++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/utils/cec-follower/cec-tuner.cpp b/utils/cec-follower/cec-tuner.cpp
index a1e349bd..bdeda342 100644
--- a/utils/cec-follower/cec-tuner.cpp
+++ b/utils/cec-follower/cec-tuner.cpp
@@ -7,6 +7,88 @@
 
 #include "cec-follower.h"
 
+#define NUM_ANALOG_FREQS	3
+
+/*
+ * This table contains analog television channel frequencies in KHz.  There are
+ * a total of three frequencies per analog broadcast type and broadcast system.
+ *
+ * CEC 17 and CEC Table 31 of the 1.4 specification lists the available analog
+ * broadcast types and broadcast systems.
+ *
+ * The table is indexed by [ana_bcast_type][bcast_system][NUM_ANALOG_FREQS].
+ *
+ * Analog channel frequencies are from Wikipedia:
+ *
+ * https://en.wikipedia.org/wiki/Television_channel_frequencies
+ */
+static unsigned int analog_freqs_khz[3][9][NUM_ANALOG_FREQS] =
+{
+	// cable
+	{
+		// pal-bg
+		{ 471250, 479250, 487250 },
+		// secam-lq
+		{ 615250, 623250, 631250 },
+		// pal-m
+		{ 501250, 507250, 513250 },
+		// ntsc-m
+		{ 519250, 525250, 531250 },
+		// pal-i
+		{ 45750, 53750, 61750 },
+		// secam-dk
+		{ 759250, 767250, 775250 },
+		// secam-bg
+		{ 495250, 503250, 511250 },
+		// secam-l
+		{ 639250, 647250, 655250 },
+		// pal-dk
+		{ 783250, 791250, 799250 }
+	},
+	// satellite
+	{
+		// pal-bg
+		{ 519250, 527250, 535250 },
+		// secam-lq
+		{ 663250, 671250, 679250 },
+		// pal-m
+		{ 537250, 543250, 549250 },
+		// ntsc-m
+		{ 555250, 561250, 567250 },
+		// pal-i
+		{ 175250, 183250, 191250 },
+		// secam-dk
+		{ 807250, 815250, 823250 },
+		// secam-bg
+		{ 543250, 551250, 559250 },
+		// secam-l
+		{ 687250, 695250, 703250 },
+		// pal-dk
+		{ 831250, 839250, 847250 }
+	},
+	// terrestrial
+	{
+		// pal-bg
+		{ 567250, 575250, 583250 },
+		// secam-lq
+		{ 711250, 719250, 727250 },
+		// pal-m
+		{ 573250, 579250, 585250 },
+		// ntsc-m
+		{ 591250, 597250, 603250 },
+		// pal-i
+		{ 199250, 207250, 215250 },
+		// secam-dk
+		{ 145250, 153250, 161250 },
+		// secam-bg
+		{ 591250, 599250, 607250 },
+		// secam-l
+		{ 735250, 743250, 751250 },
+		// pal-dk
+		{ 169250, 177250, 185250 }
+	}
+};
+
 void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, unsigned me)
 {
 	bool is_bcast = cec_msg_is_broadcast(&msg);
-- 
2.23.0

