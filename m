Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 541EF36BDBD
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 05:30:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234149AbhD0DbD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Apr 2021 23:31:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232618AbhD0Dax (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Apr 2021 23:30:53 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14BA4C061574
        for <linux-media@vger.kernel.org>; Mon, 26 Apr 2021 20:30:09 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id b17so4389418pgh.7
        for <linux-media@vger.kernel.org>; Mon, 26 Apr 2021 20:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=vyiPV41MzNmZeqfqzN0W2Ub4X0nsL+/5GsLtJRkKDGg=;
        b=LUl5V2E4B6L81eoyP1GolpLbVl/cWvjahtprSfjcEOkOPCsWjtavG5W7XVsM7ZSjez
         vB2y3ZZ+77c+w5hbRqNeu/YhRfRLpclJ3gaSBj0kDdvcsvVYCVXPlot1qV0UFV90Pjx0
         pwJAQ+23BniEXrqyGCE657ZAVxofvbCl5iJtN++bhmcmev1+e+1XgqFiVCq9rFTecq8a
         arBfP1MHB/zKir0yGtQWlNFJ+MWVle9ZLPaW95Dz9k7JexezH8GdTbpWiBFSif0cAxHy
         J957aEm5KP2fMhN88iQiTWWwlSMa+TqEulglLxVNS2C+1JvZWme1oaJOEQH5dZh3cyqO
         P47Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=vyiPV41MzNmZeqfqzN0W2Ub4X0nsL+/5GsLtJRkKDGg=;
        b=i05ljW1V258SGy/sseaOVA2+/FVMS3VwTYPD2Q9DnUaj0J+FkS+3l689IBlRYuWl8W
         aKzX6jn4D2NbfCC05mb5dyGlrNZv2TuZV2JOzHaWPnMj2DhIwIWYbINZ4aMJa4mgF3I7
         S0uUC6L8mZTXfthavRMAqgzA0CqXiEHiNfkIqOTTy1HdNfGxwzCatWE3NuvtdQqeT52t
         XQjbsV/4iGbMPNv4ogxnpag2K4i0kmqOv5bgxLpkNwReVVVXUQJUTOPzIiPE1KJRmWVF
         kCJ/K3mVvh1/U6g7SBmQ3auDIWxxZrUM3PRdIJy8/bgzQsDlYwjwSsN33DxzGXfbQRX5
         5X3Q==
X-Gm-Message-State: AOAM53274ZsItmcDiPsQGL9U39oVAQM9t1Z/umySjhG21lQLmq6KKv9y
        CCwaAZqf4Vh6x/uhO4yedoZ9IUbWdZgj2Q==
X-Google-Smtp-Source: ABdhPJws0lf0EEpNdU7ejnPy64ap38xnOLW5FLKX5Viu1kauVn6I3H6jBb0C4IuRbd/O0x62omeAzw==
X-Received: by 2002:a63:2226:: with SMTP id i38mr19794055pgi.215.1619494208719;
        Mon, 26 Apr 2021 20:30:08 -0700 (PDT)
Received: from djbComp.hitronhub.home (S0106ac202ecb0523.gv.shawcable.net. [70.67.120.89])
        by smtp.gmail.com with ESMTPSA id jx20sm666851pjb.41.2021.04.26.20.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Apr 2021 20:30:08 -0700 (PDT)
From:   Deborah Brouwer <deborahbrouwer3563@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, Deborah Brouwer <deborahbrouwer3563@gmail.com>
Subject: [PATCH v3 1/2] cec-follower: increase precision of Audio Rate Control active sensing
Date:   Mon, 26 Apr 2021 20:29:47 -0700
Message-Id: <bf7ed6319a3014be8c614b7cd660959e99efed4f.1619492378.git.deborahbrouwer3563@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1619492378.git.deborahbrouwer3563@gmail.com>
References: <cover.1619492378.git.deborahbrouwer3563@gmail.com>
In-Reply-To: <cover.1619492378.git.deborahbrouwer3563@gmail.com>
References: <cover.1619492378.git.deborahbrouwer3563@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Measure the interval since the last audio rate control message in
nanoseconds instead of seconds. Increasing the precision catches audio
rate messages that are late by less than a second.

Signed-off-by: Deborah Brouwer <deborahbrouwer3563@gmail.com>
---
 utils/cec-follower/cec-processing.cpp | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/utils/cec-follower/cec-processing.cpp b/utils/cec-follower/cec-processing.cpp
index 93db4059..fcb55df2 100644
--- a/utils/cec-follower/cec-processing.cpp
+++ b/utils/cec-follower/cec-processing.cpp
@@ -29,8 +29,8 @@
 /* Time between each polling message sent to a device */
 #define POLL_PERIOD 15000
 
-/* The maximum interval in seconds between audio rate messages as defined in the spec */
-#define MAX_AUD_RATE_MSG_INTERVAL 2
+/* The maximum interval in nanoseconds between audio rate messages as defined in the spec */
+#define MAX_AUD_RATE_MSG_INTERVAL_NS (2 * 1000000000ULL)
 
 struct cec_enum_values {
 	const char *type_name;
@@ -241,8 +241,8 @@ static void aud_rate_msg_interval_check(__u64 ts_new, __u64 ts_old)
 	 * turned off the audio rate control.
 	 */
 	if (ts_old) {
-		unsigned interval = (ts_new - ts_old) / 1000000000;
-		if (interval > MAX_AUD_RATE_MSG_INTERVAL) {
+		__u64 interval = ts_new - ts_old;
+		if (interval > MAX_AUD_RATE_MSG_INTERVAL_NS) {
 			warn("The interval between Audio Rate Control messages was greater\n");
 			warn("than the Maxiumum Audio Rate Message Interval (2s).\n");
 		}
-- 
2.17.1

