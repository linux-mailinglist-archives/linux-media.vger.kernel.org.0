Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFFFF1DAB62
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2020 09:06:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726821AbgETHEF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 May 2020 03:04:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726714AbgETHED (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 May 2020 03:04:03 -0400
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98AC1C061A0E;
        Wed, 20 May 2020 00:04:03 -0700 (PDT)
Received: by mail-qk1-x72e.google.com with SMTP id i14so2532425qka.10;
        Wed, 20 May 2020 00:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=B45hogykBorpQm91C/FLYv1RqOa4QVoaffagDFE18Qs=;
        b=p/lyKf/Gdc+2iVQRO4CL5QgtxU90uvVYQTbXEtDJ+qJkmEBdaHBzZtg3EYouUtnqDv
         KX2OGCe9H50xiuG+xKF1wH7SqNELgTrbP2RYwvBz02CJFpY0vjJWF8oQqAB9I2H1wOlP
         7X4ha9uaAyBX4eTHzApnO71O8pp+lba37+gc7wCW2szngDosTNGKkLGYrYMMYKZCNFLF
         S61Vyck5CVkVVEFJUuqJog26l/S2luLWpWPps1mtevZcnEG1AuGGVZ26PtNzgU553sqM
         RXywEVAS29Cfen0buKuwimEi7TGKP9xThToFZIYl3QXzeA9jfGwt1n2p7dca09hqpFDk
         cMHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=B45hogykBorpQm91C/FLYv1RqOa4QVoaffagDFE18Qs=;
        b=VWTx79N9XXNVY7oeFKXqt7M9Hi2opvrjfk+WAMLWgqBkoyezBmWZhv9FbYFlhru9A8
         Fg5Lj6b+w24AG9c9Pjyx3dJUDWOXcUybtt5TqmyTQLfCO4tdeuSRsUVQSD8KOwBKQjt/
         KyU3I92QekisimnEPGTIUOwLS4kgEfHEJM678vbu3vLN6axvUyy7QvPYmI86bLq2zsRH
         4HlP5rmTAZ/KIA+A3cJfjdsM8T0XvVW9Vfcu63o8K93vVsx07K8gRgnO8fjjXXiKgH9K
         kBJO6WYCsU+w/yWTIh3flWu+iM0T0ZK5EvFfm7aOf4gbZn1dycGb3m5UHdwmFuSeS592
         dL3g==
X-Gm-Message-State: AOAM530jRN4MnDEl+9b/SVy6w3/HJIbY6MB8/OSi8rI6N+CgTQI1VUIb
        BeqnMitBCHED4q3+huuT9Gk=
X-Google-Smtp-Source: ABdhPJx/lvWZHJwUMrKvIsNzP2GHGpkP7hzzOjMX5m5YuAIDHeHmG50gFRYcLQ/uu8woz2yFi3/vhQ==
X-Received: by 2002:a37:6e42:: with SMTP id j63mr3198105qkc.495.1589958242727;
        Wed, 20 May 2020 00:04:02 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
        by smtp.gmail.com with ESMTPSA id i23sm1598893qke.65.2020.05.20.00.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2020 00:04:01 -0700 (PDT)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     mchehab+huawei@kernel.org, sean@mess.org,
        kstewart@linuxfoundation.org, allison@lohutok.net,
        tglx@linutronix.de
Cc:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        linux-media@vger.kernel.org, skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-kernel@vger.kernel.org
Subject: [RFC, WIP, v6 05/10] media: vidtv: add wrappers for memcpy and memset
Date:   Wed, 20 May 2020 04:03:29 -0300
Message-Id: <20200520070334.1778751-6-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200520070334.1778751-1-dwlsalmeida@gmail.com>
References: <20200520070334.1778751-1-dwlsalmeida@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>

A lot of code in this driver is for serializing structures. This is
error prone.

Therefore, prevent buffer overflows by wrapping memcpy and memset,
comparing the requested length against the buffer size.

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 .../media/test-drivers/vidtv/vidtv_common.c   | 86 +++++++++++++++++++
 .../media/test-drivers/vidtv/vidtv_common.h   | 27 ++++++
 2 files changed, 113 insertions(+)
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_common.c
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_common.h

diff --git a/drivers/media/test-drivers/vidtv/vidtv_common.c b/drivers/media/test-drivers/vidtv/vidtv_common.c
new file mode 100644
index 0000000000000..6810212087c17
--- /dev/null
+++ b/drivers/media/test-drivers/vidtv/vidtv_common.c
@@ -0,0 +1,86 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * The Virtual DVB test driver serves as a reference DVB driver and helps
+ * validate the existing APIs in the media subsystem. It can also aid
+ * developers working on userspace applications.
+ *
+ * Written by Daniel W. S. Almeida <dwlsalmeida@gmail.com>
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ":%s, %d: " fmt, __func__, __LINE__
+
+#include <linux/printk.h>
+#include <linux/ratelimit.h>
+#include <linux/string.h>
+#include <linux/types.h>
+
+#include "vidtv_common.h"
+
+/**
+ * vidtv_memcpy() - wrapper routine to be used by MPEG-TS
+ *	generator, in order to avoid going past the
+ *	output buffer.
+ * @to:	Starting element to where a MPEG-TS packet will
+ *	be copied.
+ * @to_offset:	Starting position of the @to buffer to be filled.
+ * @to_size:	Size of the @to buffer.
+ * @from:	Starting element of the buffer to be copied.
+ * @len:	Number of elements to be copy from @from buffer
+ *	into @to+ @to_offset buffer.
+ *
+ * Note:
+ *	Real digital TV demod drivers should not have memcpy
+ *	wrappers. We use it here because emulating MPEG-TS
+ *	generation at kernelspace requires some extra care.
+ *
+ * Return:
+ *	Returns the number of bytes written
+ */
+u32 vidtv_memcpy(void *to,
+		 size_t to_offset,
+		 size_t to_size,
+		 const void *from,
+		 size_t len)
+{
+	if (unlikely(to_offset + len > to_size)) {
+		pr_err_ratelimited("overflow detected, skipping. Try increasing the buffer size\n");
+		return 0;
+	}
+
+	memcpy(to + to_offset, from, len);
+	return len;
+}
+
+/**
+ * vidtv_memset() - wrapper routine to be used by MPEG-TS
+ *	generator, in order to avoid going past the
+ *	output buffer.
+ * @to:	Starting element to set
+ * @to_offset:	Starting position of the @to buffer to be filled.
+ * @to_size:	Size of the @to buffer.
+ * @from:	Starting element of the buffer to be copied.
+ * @ten:	Number of elements to be copy from @from buffer
+ *	into @to+ @to_offset buffer.
+ *
+ * Note:
+ *	Real digital TV demod drivers should not have memset
+ *	wrappers. We use it here because emulating MPEG-TS
+ *	generation at kernelspace requires some extra care.
+ *
+ * Return:
+ *	Returns the number of bytes written
+ */
+u32 vidtv_memset(void *to,
+		 size_t to_offset,
+		 size_t to_size,
+		 const int c,
+		 size_t len)
+{
+	if (unlikely(to_offset + len > to_size)) {
+		pr_err_ratelimited("overflow detected, skipping. Try increasing the buffer size\n");
+		return 0;
+	}
+
+	memset(to + to_offset, c, len);
+	return len;
+}
diff --git a/drivers/media/test-drivers/vidtv/vidtv_common.h b/drivers/media/test-drivers/vidtv/vidtv_common.h
new file mode 100644
index 0000000000000..a3cb303cc7423
--- /dev/null
+++ b/drivers/media/test-drivers/vidtv/vidtv_common.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * The Virtual DVB test driver serves as a reference DVB driver and helps
+ * validate the existing APIs in the media subsystem. It can also aid
+ * developers working on userspace applications.
+ *
+ * Written by Daniel W. S. Almeida <dwlsalmeida@gmail.com>
+ */
+
+#ifndef VIDTV_COMMON_H
+#define VIDTV_COMMON_H
+
+#include <linux/types.h>
+
+u32 vidtv_memcpy(void *to,
+		 size_t to_offset,
+		 size_t to_size,
+		 const void *from,
+		 size_t len);
+
+u32 vidtv_memset(void *to,
+		 size_t to_offset,
+		 size_t to_size,
+		 int c,
+		 size_t len);
+
+#endif // VIDTV_COMMON_H
-- 
2.26.2

