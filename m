Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37DF638295B
	for <lists+linux-media@lfdr.de>; Mon, 17 May 2021 12:06:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236256AbhEQKHK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 May 2021 06:07:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236179AbhEQKFN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 May 2021 06:05:13 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4206EC061761
        for <linux-media@vger.kernel.org>; Mon, 17 May 2021 03:02:47 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id 62so2199910wmb.3
        for <linux-media@vger.kernel.org>; Mon, 17 May 2021 03:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Bpx7SqeP8/+wq3aw7X4zecQZwJxMIWNvj7++G2X5dp8=;
        b=mp0NamdXwnPysUvAWrbD9gE/QMkyTNbKaTbgtT3xbE0LnmajxkIt4Cfvur9opyxKKs
         GEZ0woRXX2e/35WTliYIguXmO482lcCY6jVpoH2N5kAP2SvSJcSDTeLsSPwuoFD2f0ks
         +DOZ8hWve2J3CDAcjJou0J0nGNkp1Imqhrk70shM8RE7gxIPdY8hZaBMdBaoEASlslGZ
         JQ2JAbZAPpqDbtAlEhzqR4Hv5JLGrNEmwdofJe4y8FTb2S+6Yht0vMZeXjCpBuRyK92c
         Ms6YHtZ18dpzwtkV8LcTj+eMMA6gpPuSqWtmezKAuW1wBl56Zt5vh67XnT09wq9CXRbD
         /9dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Bpx7SqeP8/+wq3aw7X4zecQZwJxMIWNvj7++G2X5dp8=;
        b=Geloq2GhFWV7MdBqKYofwNvMjeOc7RvuLIhC1MEwZ9Mu37Q50XbdKd6DbBgfjJs4K/
         HYNfNp50RUwTEtSBJcCC7rMR0sg0m+E8Kov+sZf4vQwZH+Os0TvyUPZsJKzjsbmIvJkW
         8F/t2HmYHAayINTzjCIe4n5OaAJTOJq576+/ROn4eLw6kcq0xsnut5iUqBsx9wARcVgD
         PnbQEP9dAlVx7Wo59iZ3DRMPkQYahDDcDzVEDM7HfG/1Pati+kfGxdwlQZ+lOSc2VXQv
         6vbd2nBTtYXhuDO0P8i0ll87Gy+JerGN0IGP2dyAMHL5SuN/Yhb0UU8GMKUMf2DG9hol
         cq/Q==
X-Gm-Message-State: AOAM5332UmjP51dVWIlGJnA+VqUMvFzv3Y5ZsnxhdN3LAaLv9cVRLxpo
        t7/JwnrQ1/7BxTOUKuxWhszX2tIH3DqhOA==
X-Google-Smtp-Source: ABdhPJzTRp932dcmoW79Iu2eaFlUvunV6L50IyVSXp21R9+WvggbT6bgOU6t2D3Suf1mQc1XMnGHzA==
X-Received: by 2002:a7b:c012:: with SMTP id c18mr22911241wmb.94.1621245765035;
        Mon, 17 May 2021 03:02:45 -0700 (PDT)
Received: from cluck.pitowers.org ([93.93.133.154])
        by smtp.gmail.com with ESMTPSA id f12sm10373292wre.88.2021.05.17.03.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 03:02:44 -0700 (PDT)
From:   David Plowman <david.plowman@raspberrypi.com>
To:     linux-media@vger.kernel.org
Cc:     David Plowman <david.plowman@raspberrypi.com>
Subject: [PATCH 2/2] media: v4l2-ctrls: Document V4L2_CID_NOTIFY_GAIN_XXX controls
Date:   Mon, 17 May 2021 11:02:40 +0100
Message-Id: <20210517100240.3323-3-david.plowman@raspberrypi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210517100240.3323-1-david.plowman@raspberrypi.com>
References: <20210517100240.3323-1-david.plowman@raspberrypi.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add documentation for each of the controls

V4L2_CID_NOTIFY_GAIN_RED
V4L2_CID_NOTIFY_GAIN_GREENR
V4L2_CID_NOTIFY_GAIN_BLUE
V4L2_CID_NOTIFY_GAIN_GREENB

These controls are required by sensors that need to know what colour
gains will be applied to pixels by downstream processing (such as by
an ISP), though the sensor does not apply these gains itself.

Signed-off-by: David Plowman <david.plowman@raspberrypi.com>
---
 .../media/v4l/ext-ctrls-image-source.rst      | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
index de43f5c8486d..f824d6c36ae8 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
@@ -72,3 +72,31 @@ Image Source Control IDs
     * - __u32
       - ``height``
       - Height of the area.
+
+``V4L2_CID_NOTIFY_GAIN_RED (integer)``
+    Notify the sensor what gain will be applied to red pixels by the
+    subsequent processing (such as by an ISP). The sensor is merely
+    informed of this value in case it performs processing that requires
+    it, but it is not applied to the output pixels themselves. The
+    units are determined by the sensor driver.
+
+``V4L2_CID_NOTIFY_GAIN_GREENR (integer)``
+    Notify the sensor what gain will be applied to green pixels (on
+    red rows) by subsequent processing (such as by an ISP). The sensor
+    is merely informed of this value in case it performs processing
+    that requires it, but it is not applied to the output pixels
+    themselves. The units are determined by the sensor driver.
+
+``V4L2_CID_NOTIFY_GAIN_BLUE (integer)``
+    Notify the sensor what gain will be applied to blue pixels by the
+    subsequent processing (such as by an ISP). The sensor is merely
+    informed of this value in case it performs processing that requires
+    it, but it is not applied to the output pixels themselves. The
+    units are determined by the sensor driver.
+
+``V4L2_CID_NOTIFY_GAIN_GREENB (integer)``
+    Notify the sensor what gain will be applied to green pixels (on
+    blue rows) by subsequent processing (such as by an ISP). The sensor
+    is merely informed of this value in case it performs processing
+    that requires it, but it is not applied to the output pixels
+    themselves. The units are determined by the sensor driver.
-- 
2.17.1

