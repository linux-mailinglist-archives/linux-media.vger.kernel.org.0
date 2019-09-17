Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 696C4B4A1D
	for <lists+linux-media@lfdr.de>; Tue, 17 Sep 2019 11:13:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726798AbfIQJN1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Sep 2019 05:13:27 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:43844 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725825AbfIQJN0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Sep 2019 05:13:26 -0400
Received: by mail-oi1-f193.google.com with SMTP id t84so2180392oih.10
        for <linux-media@vger.kernel.org>; Tue, 17 Sep 2019 02:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JzbrH6hRP4QNwyAUC90+MQ1T9ilUhkBITP9d09YZB/Y=;
        b=Aesd7IgZPQgN6JU5zaL1ulG3dUm7IZitJg70GOcsCcy9hmGRG9H/AioOttwX5fix8q
         QNzAC2ptGrqnlPdg7lvkCi/sRwlEA6TQx4DeZ42gNCMudv9cJp11N2tW+g60DQ58fvFn
         GZhGsmKsd8Lix1m5sio1MpWvrVWlXPwUNAZqJNihlbrL146uhEvsK6FfO8Lqsp29Kv25
         /iMfeaPYSPxqXgXzCJmwcnbjVBA2oXBcnw94DkAZh0MUu8HECFQLY9kzkbxghACy9tT+
         LZiJeXwNYux76Xu1fzKfO3z3lVeluM+Tzk1QiR0ULJj5Gg5U9SyVErZRCibeMmQwHtGk
         o/xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JzbrH6hRP4QNwyAUC90+MQ1T9ilUhkBITP9d09YZB/Y=;
        b=g7OYl3GuysM7yzoFf00UAmpjr1ZsO1qBRBSgOhRbQQge2VbzWHbstdWkOULVhk7o6Z
         NiOR2jwIeebqukFf6qGpIclOFudVHRcnv4HqunjXuhA/T18izGAVYBZsu8BRH7Wesw3c
         FnOp2RqMlGAr/qKk4sK1xoWMFIg4y4lWL2u6yOmcYgEI1lKuJ31ag4D88c7tL9GTAATr
         FXpux/EnMcTuwTi20LXcwX146AGwn4c3B0eyGbLv50V7FuF2f5z14OIgT9094OSNLwox
         HRGCs4EbH+Tnmu0MPH1nHlTZhKqOQynR83g2Vhq6wh2mvU+/3S2jjjiz/PdK4PxPjMUM
         MsKQ==
X-Gm-Message-State: APjAAAVvvYQ48vI0qfUM+gUPpHq7DubvGdstmagLIWNwnIU11WjXp1KM
        tOtgpViNZT6XQbpcntHOwVDg3ICh
X-Google-Smtp-Source: APXvYqzZ4XABrhxajKNFvOU5E7mFOFAB26pytTJdrk8G6q+IAHOpVIUgHU/tbi6DWW2n1s2fAKP+xg==
X-Received: by 2002:aca:915:: with SMTP id 21mr1235231oij.63.1568711605335;
        Tue, 17 Sep 2019 02:13:25 -0700 (PDT)
Received: from rYz3n.attlocal.net ([2600:1700:210:3790::48])
        by smtp.googlemail.com with ESMTPSA id s3sm501497otd.26.2019.09.17.02.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2019 02:13:24 -0700 (PDT)
From:   Jiunn Chang <c0d1n61at3@gmail.com>
To:     linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Cc:     hverkuil@xs4all.nl
Subject: [PATCH v2] cec-follower: create analog channel frequencies
Date:   Tue, 17 Sep 2019 04:13:23 -0500
Message-Id: <20190917091323.48665-1-c0d1n61at3@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190916183835.132777-1-c0d1n61at3@gmail.com>
References: <20190916183835.132777-1-c0d1n61at3@gmail.com>
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

>8---------------------------------------------------------------------------8<

 utils/cec-follower/cec-tuner.cpp | 80 ++++++++++++++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/utils/cec-follower/cec-tuner.cpp b/utils/cec-follower/cec-tuner.cpp
index 5e794d71..912adcb9 100644
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
 void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, unsigned me)
 {
 	switch (msg.msg[1]) {
-- 
2.23.0

