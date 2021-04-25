Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2FDE36A9C7
	for <lists+linux-media@lfdr.de>; Mon, 26 Apr 2021 00:54:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231435AbhDYWzK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 25 Apr 2021 18:55:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231247AbhDYWzK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 25 Apr 2021 18:55:10 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CDF9C061574
        for <linux-media@vger.kernel.org>; Sun, 25 Apr 2021 15:54:30 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id q10so38852228pgj.2
        for <linux-media@vger.kernel.org>; Sun, 25 Apr 2021 15:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=dWeumecOlzaTnNiLr/75eCpPCCfDMWcbNrYIXDgpfzU=;
        b=QOsTw+jGybkpPfShXgI1yzdlvSRcKYziG5DnLju7iOqRdFytL+e35iGFAQ812rgRrM
         GaLC3oHsjCMoJpUnCA4yBj6QUijNCc1Kh0qIvPc0DGM6ZYbVfKEoWj4B2wGmdQdZER3I
         sO497T10PLvxNc432VEXZHj0tYjAi5mD3ts8UtON6jL/hT2JjmvsFWq/D+Z6KH/HNbnV
         LX7f6iarxHoVjKot0MBpsYpRiRDJzWawtgg/CfdAYooCj2Jiu7pQOwCuAZfVGHy+vwCB
         4uFhUSXJAEGDva6KjQeIu3mt6x5vlucLVj/4450HIg6F9S1xnW7cGj7SAEwq1mifN8NC
         5GUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=dWeumecOlzaTnNiLr/75eCpPCCfDMWcbNrYIXDgpfzU=;
        b=ieWwiLWwISu2E/be7xqhHafhluo6N8WmkkrVss5BxF/2j6aa6xhlj03obRiz5ob7ci
         Z9XlPA6Q0AZ56TyUJopnsTLk1SWZtjVfVZdbB+YYPej+ZXqKPsSd1hlu6dtk9BN/Tou3
         ct2mXQtKuP8iWYP+fliQwWPy/6S/9RTTmNBBeXa7jyt0ifJ1GgwzGovW5RdzVnMsQISW
         HvwK6nYVNuaEWrfAgOxYHBBBZV6Cq3D2JBBrUYAuQAm+eqmRibkGUKoaG575E7eJSMXh
         w+mzggYxo2uUn2iIeuVGi53yTVm6VgmDldKdbFqfJvleeMwA7xwv+yhnxBv1ksa5cqKd
         dl7w==
X-Gm-Message-State: AOAM5304kf01xoby5VWRKiH7ZJVVQE2SroqjA83k5uuch9JkjS9fCSRQ
        iLn1IVZzSDL8V35uRN9e0oKMFeqf22MjWA==
X-Google-Smtp-Source: ABdhPJw+GmtBGNAWixVMxQo07P07V5FLR12vcCXTQKrmqvjO0YtPIoIJQn8YOUDZKdBj/NgIaRLxqw==
X-Received: by 2002:a63:7a4e:: with SMTP id j14mr11132516pgn.18.1619391269970;
        Sun, 25 Apr 2021 15:54:29 -0700 (PDT)
Received: from djbComp.hitronhub.home (S0106ac202ecb0523.gv.shawcable.net. [70.67.120.89])
        by smtp.gmail.com with ESMTPSA id s22sm9504207pfe.150.2021.04.25.15.54.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Apr 2021 15:54:29 -0700 (PDT)
From:   Deborah Brouwer <deborahbrouwer3563@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, Deborah Brouwer <deborahbrouwer3563@gmail.com>
Subject: [PATCH v2 1/2] cec-follower: increase precision of Audio Rate Control active sensing
Date:   Sun, 25 Apr 2021 15:54:06 -0700
Message-Id: <359f2292a67679b5dab5d9d1fda280bc80f34c40.1619389023.git.deborahbrouwer3563@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1619389023.git.deborahbrouwer3563@gmail.com>
References: <cover.1619389023.git.deborahbrouwer3563@gmail.com>
In-Reply-To: <cover.1619389023.git.deborahbrouwer3563@gmail.com>
References: <cover.1619389023.git.deborahbrouwer3563@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Measure the interval since the last audio rate control message in
nanoseconds instead of seconds. Increasing the precision catches audio
rate messages that are late by less than a second.

Signed-off-by: Deborah Brouwer <deborahbrouwer3563@gmail.com>
---
 utils/cec-follower/cec-processing.cpp | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/utils/cec-follower/cec-processing.cpp b/utils/cec-follower/cec-processing.cpp
index 93db4059..243c9d09 100644
--- a/utils/cec-follower/cec-processing.cpp
+++ b/utils/cec-follower/cec-processing.cpp
@@ -29,8 +29,8 @@
 /* Time between each polling message sent to a device */
 #define POLL_PERIOD 15000
 
-/* The maximum interval in seconds between audio rate messages as defined in the spec */
-#define MAX_AUD_RATE_MSG_INTERVAL 2
+/* The maximum interval in nanoseconds between audio rate messages as defined in the spec */
+#define MAX_AUD_RATE_MSG_INTERVAL 2000000000
 
 struct cec_enum_values {
 	const char *type_name;
@@ -241,7 +241,8 @@ static void aud_rate_msg_interval_check(__u64 ts_new, __u64 ts_old)
 	 * turned off the audio rate control.
 	 */
 	if (ts_old) {
-		unsigned interval = (ts_new - ts_old) / 1000000000;
+		__u64 interval = ts_new - ts_old;
+
 		if (interval > MAX_AUD_RATE_MSG_INTERVAL) {
 			warn("The interval between Audio Rate Control messages was greater\n");
 			warn("than the Maxiumum Audio Rate Message Interval (2s).\n");
-- 
2.17.1

