Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 260942EABB7
	for <lists+linux-media@lfdr.de>; Tue,  5 Jan 2021 14:18:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729283AbhAENSB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jan 2021 08:18:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729174AbhAENSA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jan 2021 08:18:00 -0500
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com [IPv6:2607:f8b0:4864:20::829])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27215C061574;
        Tue,  5 Jan 2021 05:17:35 -0800 (PST)
Received: by mail-qt1-x829.google.com with SMTP id g24so20710441qtq.12;
        Tue, 05 Jan 2021 05:17:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jLhbRWXby6luGSFdzAvh4WkvKskLyAT83J5WUyy1B7g=;
        b=h47nmgU0rIwhajSpfHu3iTWzq30XXTCyDfCURIz5rXQNIRu6C7FopM/0vWUwwTmmyZ
         +vaowIcYOlJNYAVajvxvjIC1SV/MoypaMqtT5+zxoFAg5NuXq/+80VctTWUzUK0WYb+w
         a4IvfNrwIDt0sTgffUBa4ECerc3AD4xe1Z3MjJE3Ey8JfCsuhEJGFBvfEttmjQ1+RrZp
         n8xMASrLIDv003UlpTSxrt+VLhCHOnho52wF8o813HcnuTeAITQ+Ol66zNDRMHM+oubh
         otFYkYYcOaEoKrOX7+gpHHvRk7VD/jpVhavlJR9h5B5AXPYbf8IshQ7BVjsrXFMunIPf
         NbTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jLhbRWXby6luGSFdzAvh4WkvKskLyAT83J5WUyy1B7g=;
        b=b1Dz0vNSyxWhzdQ/ZCtRFsrVe7qAdW6b4xrw8MLcVq1774Xsi7FaFp5pD8riWz3WI9
         MOSsWFnXLmcT5vMK7PukdHbZLFqcc8u8h1mXPeoa56hoFt1qDo67NhK53urJt7/g/TNq
         qXIaDrChTMq8+oKun/e2Nvg1zAxMvVl12YN9xrY5D4poyvrVV9eTiOytdukyB/jd5PnB
         F2+ME3cIQDby+TNakyk6xhkKrwjdYeN3MQzOMwvnsn+YGINZg8BxKyPhonIx/YJo7Jth
         nzzJlepjpsgwOIHBgfZKEt3T+CtKfXOfm2tx12pbmR6QulY6559EfyWIcy+2jn4IeF/Q
         MWrg==
X-Gm-Message-State: AOAM531lv04aHrJClfDq3VWedgK2uZuPzKv/2OaCHZNqJFmSg+f1PHva
        YVrQ2XzMVApTjrbW2ulK+84T//L1tgedOg==
X-Google-Smtp-Source: ABdhPJyVzx47+ZOqsoJXupw8slUQFPMehE0nhfa36KTvI6eGYZb4pDueYzmJKn/d/uD3F22/U5vWEg==
X-Received: by 2002:ac8:1c92:: with SMTP id f18mr71741567qtl.234.1609852654400;
        Tue, 05 Jan 2021 05:17:34 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:77d4:6fb0:85b3:b6f7])
        by smtp.gmail.com with ESMTPSA id h16sm40697819qko.135.2021.01.05.05.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 05:17:33 -0800 (PST)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     mchehab@kernel.org, hverkuil@xs4all.nl
Cc:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4l-utils] test-media: add support for vidtv
Date:   Tue,  5 Jan 2021 10:17:25 -0300
Message-Id: <20210105131725.1191046-1-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>

Add support for vidtv at the test-media script so that automated testing
is possible. Proper compliance tests are still pending.

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 contrib/test/test-media | 72 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/contrib/test/test-media b/contrib/test/test-media
index 1c1d2e37b..86a2e081a 100755
--- a/contrib/test/test-media
+++ b/contrib/test/test-media
@@ -4,6 +4,7 @@
 #
 # Copyright 2019 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
 
+vidtv=0
 vivid=0
 vim2m=0
 vimc=0
@@ -51,6 +52,7 @@ if [ -z "$1" ]; then
 	echo "-32: use v4l2-ctl-32 and v4l2-compliance-32 to test the 32 bit compat layer"
 	echo
 	echo Test Targets:
+	echo "vidtv: test the vidtv driver"
 	echo "vivid: test the vivid driver"
 	echo "vim2m: test the vim2m driver"
 	echo "vimc: test the vimc driver"
@@ -96,6 +98,7 @@ while [ ! -z "$1" ]; do
 		fi
 		;;
 	all)
+		vidtv=1
 		vivid=1
 		vim2m=1
 		vimc=1
@@ -109,6 +112,9 @@ while [ ! -z "$1" ]; do
 		vimc=1
 		vicodec=1
 		;;
+	vidtv)
+		vidtv=1
+		;;
 	vivid)
 		vivid=1
 		;;
@@ -162,6 +168,72 @@ $v4l2_ctl -z platform:vivid-002 -d vivid-002-vid-out -o1 -x width=3840,height=21
 
 echo
 
+if [ $vidtv -eq 1 ]; then
+	rmmod vidtv 2&>/dev/null
+	modprobe vidtv
+	sleep 2
+	dmesg -n notice
+	echo
+
+	if ! media-ctl -d platform:vidtv -p ; then
+		echo "FAIL: the vidtv module failed to load" | tee -a $tmp
+		echo "Grand Total for vidtv: Succeeded: 0, Failed: 1, Warnings: 0" | tee -a $tmp
+		echo "Final Summary: 1, Succeeded: 0, Failed: 1, Warnings: 0"
+		rmmod vidtv
+		exit 0
+	fi
+
+	echo
+	echo
+	echo
+	echo
+	echo
+	echo
+	echo
+	echo
+	echo
+	echo unbind vidtv
+	echo
+	echo -n vidtv.0 >/sys/bus/platform/drivers/vidtv/unbind
+	sleep $unbind_time
+	echo
+	echo rebind vidtv
+	echo
+	echo -n vidtv.0 >/sys/bus/platform/drivers/vidtv/bind
+	sleep 1
+	echo
+	echo second unbind vidtv
+	echo
+	sleep 1
+	echo
+	echo -n vidtv.0 >/sys/bus/platform/drivers/vidtv/unbind
+	sleep $reunbind_time
+	echo
+	echo rmmod vidtv
+	echo
+	rmmod vidtv
+	sleep $rmmod_time
+	if [ $kmemleak -eq 1 ]; then
+		echo
+		echo kmemleak results for vidtv:
+		echo
+		echo scan >/sys/kernel/debug/kmemleak
+		cat /sys/kernel/debug/kmemleak
+		echo
+		echo end of kmemleak results
+		echo clear >/sys/kernel/debug/kmemleak
+	fi
+	echo
+	echo
+	echo
+	echo
+	echo
+	echo
+	echo
+	echo
+
+fi
+
 if [ $vivid -eq 1 ]; then
 	dmesg -n notice
 	echo
-- 
2.30.0

