Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACF3E1D5BE2
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2020 23:50:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728032AbgEOVtD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 May 2020 17:49:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726266AbgEOVtD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 May 2020 17:49:03 -0400
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D05E5C061A0C;
        Fri, 15 May 2020 14:49:02 -0700 (PDT)
Received: by mail-qt1-x842.google.com with SMTP id b1so3337778qtt.1;
        Fri, 15 May 2020 14:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=llFN1b4IyM2NmP1m0ZO+FT2673CkYgwiHGyYGvoTCac=;
        b=V6JQzLS5IPik6GglApB4QLQr3Rk+BCjB8x+3A9tOoC3C3imphXlKmhUgrKAZxavmyx
         q4qe66XDQCBdVO1q8/ssUlVuQTgZ0rqGgiqsnhzlcFQIVnmY9UcSOI6+3qqKnBnqC/R4
         I7ntrrH1h1SDo7BQj/GX9PHIgd6mhuNRmcAuUDW8hNoZh9/kBHRToYXUUqJ0Fgygx4/Z
         gRAzFld1GON9AOXJ0hUTLYG/3Oos5EwISVfPUPLP28SyY1ImelHdCawfXHLpBj0DMi1/
         e65Kh79Nips7EtVciqldL3mrDRpB3lY5qtxDyBMwj0zH8/Wp2+PgBNi3fMEDiTvEvhf1
         x2Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=llFN1b4IyM2NmP1m0ZO+FT2673CkYgwiHGyYGvoTCac=;
        b=dtaBPAsfB1+chCm0m8tM5n9RSuPN8d3er1dEvF9oVRtt0EkBpJ5gGB8ZTV+XuRhBua
         vZdo8nG32gywxu2KYYOoQjiC9ju8fwdlM7VS4hfyehSo4mVi5+fFGg0awu/99YjgSp9B
         Tii8EzBt4kzZt53ggxZDv7hGDZ4Wi7DcN6gfsE9hOXo6Ah819pwB4YnK96xc9u1Etj6+
         4tKeeM4LlBLrzHhztZdI96GIf5XeRbhGORHAs8e1JpXvByJ/SQTmmOLTepdGNshyayuD
         gZ3lU1APPeVy4364DMCknt5UCsPlsH6qkrIr0IP9lSxT+67xfDFqTCUbeWNy2+dZJyQp
         tp1A==
X-Gm-Message-State: AOAM532KurXtYwMaHN8kyorfzkrS3EVPlnuPkrGJpXtMvRmGPsszajs9
        5HrGL2y1NQI/BJJwJ/ZqXnM=
X-Google-Smtp-Source: ABdhPJyK6pyDmQBPYu9OmmQLKHe4TfmPSRCircJ4ofbXp6a1jaBRckDdpXWQS4OLcC874uTz7KE1hA==
X-Received: by 2002:ac8:51c5:: with SMTP id d5mr5794502qtn.232.1589579341933;
        Fri, 15 May 2020 14:49:01 -0700 (PDT)
Received: from localhost.localdomain ([2804:18:700e:2692:8980:dd13:6be6:4050])
        by smtp.gmail.com with ESMTPSA id m21sm2495019qkh.50.2020.05.15.14.48.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2020 14:49:01 -0700 (PDT)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     mchehab+huawei@kernel.org, sean@mess.org,
        kstewart@linuxfoundation.org, allison@lohutok.net,
        tglx@linutronix.de
Cc:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        linux-media@vger.kernel.org, skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-kernel@vger.kernel.org
Subject: [RFC, WIP, v5 05/10] media: vidtv: add wrappers for memcpy and memset
Date:   Fri, 15 May 2020 18:48:10 -0300
Message-Id: <20200515214815.15514-6-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200515214815.15514-1-dwlsalmeida@gmail.com>
References: <20200515214815.15514-1-dwlsalmeida@gmail.com>
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
index 0000000000000..944f77625c12c
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
+#include <linux/types.h>
+#include <linux/string.h>
+#include <linux/printk.h>
+#include <linux/ratelimit.h>
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

