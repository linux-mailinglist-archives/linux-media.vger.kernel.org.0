Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB77A1C2286
	for <lists+linux-media@lfdr.de>; Sat,  2 May 2020 05:23:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727866AbgEBDWy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 May 2020 23:22:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726439AbgEBDWx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 1 May 2020 23:22:53 -0400
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com [IPv6:2607:f8b0:4864:20::741])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C193C061A0C;
        Fri,  1 May 2020 20:22:53 -0700 (PDT)
Received: by mail-qk1-x741.google.com with SMTP id c63so11238441qke.2;
        Fri, 01 May 2020 20:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wLSxbksYe7vFAl+dAChpvHeW8F9QhUMpS/+xzmVyhR4=;
        b=PKcEoF52OoEQuSEvPnG7/F79zFA430vYjff3uLEaOAC77ileYYAVSA3SXQsDIKw+M3
         HcDrfcuFrS/QUQDnpcCexhoyiNE6QsrA6UfmN9q4uiJTghyxQeUsPDShKXdG/o3qdYrU
         9zeUjwc62srL/KTat/i1wO8BwvcelbUaGQUnZ4LmUpjrXbThKdrTP0i33IZVSfiIXT7W
         S7hxlYaUwhbEEaJkdnH+zwPfiAqI8DD3GGTLqEd6e0e9T+MDbfP3IVSDoTgMEDF0h/HM
         tsdL8nF1s3fr3RLhxwQybv0usgeJCk5BKLikcnCnJv0EdFROOp9pOVkcxoG2XGRwlTWj
         Ndbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wLSxbksYe7vFAl+dAChpvHeW8F9QhUMpS/+xzmVyhR4=;
        b=V3mLbD60WRWf4qNzGMP1GktEV163Dy6SnWCzoujOz95kUAod7rEzseGZayu1ny6sqH
         rbNdU3yTMootGxTpd/wXWWoZvNuZ00c4VBnuzmhoUYDU96gv+L6mvLQMensxkW8eL4XZ
         U1dPRBZJwy0KxDoL+14HTZv16MQtAO/9Ja8BsKayzrpz1acl5eq4M4OEyuJRM6t8K3jz
         3cpXEDNo5zl7woFNNKIkgMOihK98ZWpZ9o/CTNGoMHbgGnt6PBa5F7yslBMwze38R8RT
         FHnPzszQtnMRzLFibIv3xlQdWOThux+EqlGdG1Mp5eQEJ/+fMzFiQ1o4LygpZFuiKU7C
         hUlg==
X-Gm-Message-State: AGi0PuZBdnisxXNGt00hFAcK1AZkqJUPUzLna1TZdRk3qe+ZhlAzOZfh
        Shhqn30sD1yQ2et28LU1UQg=
X-Google-Smtp-Source: APiQypJb3IAWNuPS7msR8bj0xvAODcxZmScGMJAQQ2/JpuoFHKaMLO78YDuwxGvzgaCnE85MOVC0nw==
X-Received: by 2002:a37:792:: with SMTP id 140mr6325361qkh.58.1588389772555;
        Fri, 01 May 2020 20:22:52 -0700 (PDT)
Received: from localhost.localdomain ([2804:18:602b:723a:1b2a:57a1:a611:34ed])
        by smtp.gmail.com with ESMTPSA id c41sm4410399qta.96.2020.05.01.20.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2020 20:22:52 -0700 (PDT)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     mchehab+huawei@kernel.org, sean@mess.org,
        kstewart@linuxfoundation.org, allison@lohutok.net,
        tglx@linutronix.de
Cc:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        linux-media@vger.kernel.org, skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-kernel@vger.kernel.org
Subject: [RFC, WIP, v4 06/11] media: vidtv: add wrappers for memcpy and memset
Date:   Sat,  2 May 2020 00:22:11 -0300
Message-Id: <20200502032216.197977-7-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200502032216.197977-1-dwlsalmeida@gmail.com>
References: <20200502032216.197977-1-dwlsalmeida@gmail.com>
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
 drivers/media/test-drivers/vidtv/Makefile     |  3 ++
 .../media/test-drivers/vidtv/vidtv_common.c   | 44 +++++++++++++++++++
 .../media/test-drivers/vidtv/vidtv_common.h   | 28 ++++++++++++
 3 files changed, 75 insertions(+)
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_common.c
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_common.h

diff --git a/drivers/media/test-drivers/vidtv/Makefile b/drivers/media/test-drivers/vidtv/Makefile
index a9f1993dd5443..9ea9485d42189 100644
--- a/drivers/media/test-drivers/vidtv/Makefile
+++ b/drivers/media/test-drivers/vidtv/Makefile
@@ -1,3 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 
+vidtv_demod-objs := vidtv_common.o
+vidtv_bridge-objs := vidtv_common.o
+
 obj-$(CONFIG_DVB_VIDTV)	+= vidtv_tuner.o vidtv_demod.o vidtv_bridge.o
diff --git a/drivers/media/test-drivers/vidtv/vidtv_common.c b/drivers/media/test-drivers/vidtv/vidtv_common.c
new file mode 100644
index 0000000000000..28f10630499a9
--- /dev/null
+++ b/drivers/media/test-drivers/vidtv/vidtv_common.c
@@ -0,0 +1,44 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * The Virtual DVB test driver serves as a reference DVB driver and helps
+ * validate the existing APIs in the media subsystem. It can also aid
+ * developers working on userspace applications.
+ *
+ * Written by Daniel W. S. Almeida <dwlsalmeida@gmail.com>
+ */
+
+#include <linux/types.h>
+#include <linux/string.h>
+#include <linux/printk.h>
+
+u32 vidtv_memcpy(void *to,
+		 const void *from,
+		 size_t len,
+		 u32 offset,
+		 u32 buf_sz)
+{
+	if (buf_sz && offset + len > buf_sz) {
+		pr_err("%s: overflow detected, skipping. Try increasing the buffer size",
+		       __func__);
+		return 0;
+	}
+
+	memcpy(to, from, len);
+	return len;
+}
+
+u32 vidtv_memset(void *to,
+		 int c,
+		 size_t len,
+		 u32 offset,
+		 u32 buf_sz)
+{
+	if (buf_sz && offset + len > buf_sz) {
+		pr_err("%s: overflow detected, skipping. Try increasing the buffer size",
+		       __func__);
+		return 0;
+	}
+
+	memset(to, c, len);
+	return len;
+}
diff --git a/drivers/media/test-drivers/vidtv/vidtv_common.h b/drivers/media/test-drivers/vidtv/vidtv_common.h
new file mode 100644
index 0000000000000..64072c010dc66
--- /dev/null
+++ b/drivers/media/test-drivers/vidtv/vidtv_common.h
@@ -0,0 +1,28 @@
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
+#include <media/dvb_frontend.h>
+
+u32 vidtv_memcpy(void *to,
+		 const void *from,
+		 size_t len,
+		 u32 offset,
+		 u32 buf_sz);
+
+u32 vidtv_memset(void *to,
+		 int c,
+		 size_t len,
+		 u32 offset,
+		 u32 buf_sz);
+
+#endif // VIDTV_COMMON_H
-- 
2.26.2

