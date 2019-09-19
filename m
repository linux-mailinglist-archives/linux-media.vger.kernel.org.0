Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D229B71AA
	for <lists+linux-media@lfdr.de>; Thu, 19 Sep 2019 04:53:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731036AbfISCx1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Sep 2019 22:53:27 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:37925 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730685AbfISCx1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Sep 2019 22:53:27 -0400
Received: by mail-ot1-f68.google.com with SMTP id e11so1764972otl.5
        for <linux-media@vger.kernel.org>; Wed, 18 Sep 2019 19:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FfOVvBN9pvMU4KWu4mwncJyTVRWcX9dwFxB5dHm6iDo=;
        b=pQ3cU/JNRH+InzAWTFGB1an519NCGxWciLOHdxTHVgcDhzQsbTk22gl5U33E3KSUqI
         dYyqtRKsaRrHGAY5UNc+QPkU2PNPUgTUiQFPAqDs0YhNgVQ3YVoQa6hrfWmqXr+ZMcdj
         D7tEmrd1202Rr8Hs1MobBfZ7V81OsWkG9oPjmU4BiSmC5s9whzjD7n0o6uZqecjA/iA0
         r/DdSI+wZk0pjA8Rumzs6qWT5Rb6lJuZJzUPofVPn5cnWEqdJ03CIL2JNSx40Tjp6Xun
         UeCR0BM28DSfEdyO1u8jpZn12cAHikM44gTrp02Pb6A4PNH2KYjMsCeFoi4ewnHosnVR
         dVFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FfOVvBN9pvMU4KWu4mwncJyTVRWcX9dwFxB5dHm6iDo=;
        b=KEO8CKfbGYxQF0e1zQ+5ZxsJHiz1yw63vkBFjnI2BOhZbIkPcHeEOymiJRr4X4Q8Gk
         zzrdiHP2rtoWSfbxu9i4ibGOcQVgsYUoJ1HtV0IZ9xJurZ9mRevt1LRxwfJp87tCRQR2
         Q5BlTv1CgIMybCZx5hCO/8q/6gFLTG6GPqBh773wr3fxtNfuq6E1CTdvAYMRPxIXFj5P
         COSUBqPAbQohs+KO1WuUX/yB3NiqLGwVwoXkPphOa6r6qjuWb+Yt2xPini+ijie1stkB
         HyoLRRJSBzmX72K691zl3ZGVDbEUlt3v0kmyim0GEmVfj6ZGVboXyptWy4PCDKCYmDqA
         yUTQ==
X-Gm-Message-State: APjAAAWtZrPC5YJk+HR4ffWcbOvjHSPo/vfIZXqL/p1KzGjjPaiApV5b
        9m1iXDl8sruUnlX/8kdHd4A5l29s
X-Google-Smtp-Source: APXvYqzZ2/c0Sr5hvKD7XrhnHOKvbFSmhKJ9u5jPTKuTlHSLTxW3MPYAg6nY2o/IavRPnuPOMGTiVw==
X-Received: by 2002:a05:6830:16da:: with SMTP id l26mr5230082otr.339.1568861606185;
        Wed, 18 Sep 2019 19:53:26 -0700 (PDT)
Received: from rYz3n.attlocal.net ([2600:1700:210:3790::48])
        by smtp.googlemail.com with ESMTPSA id g18sm2203757otg.24.2019.09.18.19.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2019 19:53:25 -0700 (PDT)
From:   Jiunn Chang <c0d1n61at3@gmail.com>
To:     linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Cc:     hverkuil@xs4all.nl
Subject: [PATCH v3] cec-follower: create analog channel frequencies
Date:   Wed, 18 Sep 2019 21:53:24 -0500
Message-Id: <20190919025324.277999-1-c0d1n61at3@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190917091323.48665-1-c0d1n61at3@gmail.com>
References: <20190917091323.48665-1-c0d1n61at3@gmail.com>
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

Changes since v1:
  - Add Wikipedia link for analog channel frequencies
  - Add spaces between { and }

Changes since v2:
  - Refactor lines numbers since a fix patch was needed for cec-tuner.cpp

---
 utils/cec-follower/cec-tuner.cpp | 80 ++++++++++++++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/utils/cec-follower/cec-tuner.cpp b/utils/cec-follower/cec-tuner.cpp
index bb727ae7..2303e6bb 100644
--- a/utils/cec-follower/cec-tuner.cpp
+++ b/utils/cec-follower/cec-tuner.cpp
@@ -7,6 +7,86 @@
 
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
+ * Analog channel frequencies are from Wikipedia:
+ *
+ * https://en.wikipedia.org/wiki/Television_channel_frequencies
+ */
+static unsigned int analog_freqs_khz[3][9][3] =
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
 static void reply_feature_abort(struct node *node, struct cec_msg *msg, __u8 reason = CEC_OP_ABORT_UNRECOGNIZED_OP)
 {
 	unsigned la = cec_msg_initiator(msg);
-- 
2.23.0

