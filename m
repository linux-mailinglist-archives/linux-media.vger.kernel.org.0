Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87B8340052F
	for <lists+linux-media@lfdr.de>; Fri,  3 Sep 2021 20:44:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350503AbhICSpj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Sep 2021 14:45:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350478AbhICSp0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Sep 2021 14:45:26 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2068C0613A3;
        Fri,  3 Sep 2021 11:44:20 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id n4so67338plh.9;
        Fri, 03 Sep 2021 11:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9nem1cpi4gOKpKGLCYjoRtQFtt8o9c5PZTImpcjZKvE=;
        b=LKAD83XB0VEg3l7w8sZ06HeYmjxV4js1ItmdE2f6y9JO4gI4Xl5oHH3qBHQbkY2e7Z
         kAA0mTLeqAxRybRes1bdaXCG8rrkjhf24fd+1uue33AfpYxDEBl9iMJSEehC4iIF7JcL
         PLogSYquqHGPPXzsLfP8RFJkjganM0XByZB/87im5Z60WzZqXz0EvZ6x1g82MSWj0xRO
         EkPjxSCyuDI8J7efwTyhQoxGg9Af+BA/93HQLJAlJKWEgzQUJ2sUXxfJbjg9t5/WA6lC
         YMxzBQFB7wEkVgSQlzGM/sg+MHzCAI9Ny2/b+3D14+W5oAw8kUoCQWrr0cRBhzLZzs5g
         pOlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9nem1cpi4gOKpKGLCYjoRtQFtt8o9c5PZTImpcjZKvE=;
        b=BeXJH+rC7q1jR27XaweLXv7ku5W8k94HshupAVXgLNb9ysJ3IkeWO2ZXQwGtVfFExj
         siy2bJsARl8uCbsbDdbx+nPoYbJLBUPUr90UvkNicT3HZzvEvh0gJgoIzPtPX+z7R0aY
         eVn2kbyBXLrQGv1aUtyIcXyXhcznNxm7SgmMgJxSog3+RaaVesFjBqXAKZ/ZWYMsztgJ
         CRUgkGYhaRLb1IAY1vQUksdIh+5uSjw2E8EFwQUqDrldnpizCF1CikM42uQ8BCoBG60W
         QLNp6VcBVYCsYLNRr1QhLKXZX+r5cp9nXHfEnuCp2SsKWu1c5Vxtx3LIirxB0QQC9eXj
         Z+5g==
X-Gm-Message-State: AOAM533sKgxjQZwweJwqFH0ELJmUafFt8FFrKZMGqW17epwJSuFewV4a
        TWQG+dAgL1Z6aZtP4kJN1Ws=
X-Google-Smtp-Source: ABdhPJyGjeGwkXqEh5bQxSbpscn/Ym2q9Q5yOoGAKWphqGneFJ1WnxAItza/IWMRqPXAEWacgfqekA==
X-Received: by 2002:a17:902:e801:b0:138:8b70:b374 with SMTP id u1-20020a170902e80100b001388b70b374mr239531plg.0.1630694660413;
        Fri, 03 Sep 2021 11:44:20 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id t186sm126836pfb.53.2021.09.03.11.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 11:44:19 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= 
        <ckoenig.leichtzumerken@gmail.com>,
        =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>,
        Pekka Paalanen <ppaalanen@gmail.com>,
        Rob Clark <robdclark@chromium.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Gustavo Padovan <gustavo@padovan.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        linux-media@vger.kernel.org (open list:SYNC FILE FRAMEWORK),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 8/9] dma-buf/sync_file: Add SET_DEADLINE ioctl
Date:   Fri,  3 Sep 2021 11:47:59 -0700
Message-Id: <20210903184806.1680887-9-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903184806.1680887-1-robdclark@gmail.com>
References: <20210903184806.1680887-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

The initial purpose is for igt tests, but this would also be useful for
compositors that wait until close to vblank deadline to make decisions
about which frame to show.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/dma-buf/sync_file.c    | 19 +++++++++++++++++++
 include/uapi/linux/sync_file.h | 20 ++++++++++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/drivers/dma-buf/sync_file.c b/drivers/dma-buf/sync_file.c
index 394e6e1e9686..f295772d5169 100644
--- a/drivers/dma-buf/sync_file.c
+++ b/drivers/dma-buf/sync_file.c
@@ -459,6 +459,22 @@ static long sync_file_ioctl_fence_info(struct sync_file *sync_file,
 	return ret;
 }
 
+static int sync_file_ioctl_set_deadline(struct sync_file *sync_file,
+					unsigned long arg)
+{
+	struct sync_set_deadline ts;
+
+	if (copy_from_user(&ts, (void __user *)arg, sizeof(ts)))
+		return -EFAULT;
+
+	if (ts.pad)
+		return -EINVAL;
+
+	dma_fence_set_deadline(sync_file->fence, ktime_set(ts.tv_sec, ts.tv_nsec));
+
+	return 0;
+}
+
 static long sync_file_ioctl(struct file *file, unsigned int cmd,
 			    unsigned long arg)
 {
@@ -471,6 +487,9 @@ static long sync_file_ioctl(struct file *file, unsigned int cmd,
 	case SYNC_IOC_FILE_INFO:
 		return sync_file_ioctl_fence_info(sync_file, arg);
 
+	case SYNC_IOC_SET_DEADLINE:
+		return sync_file_ioctl_set_deadline(sync_file, arg);
+
 	default:
 		return -ENOTTY;
 	}
diff --git a/include/uapi/linux/sync_file.h b/include/uapi/linux/sync_file.h
index ee2dcfb3d660..f67d4ffe7566 100644
--- a/include/uapi/linux/sync_file.h
+++ b/include/uapi/linux/sync_file.h
@@ -67,6 +67,18 @@ struct sync_file_info {
 	__u64	sync_fence_info;
 };
 
+/**
+ * struct sync_set_deadline - set a deadline on a fence
+ * @tv_sec:	seconds elapsed since epoch
+ * @tv_nsec:	nanoseconds elapsed since the time given by the tv_sec
+ * @pad:	must be zero
+ */
+struct sync_set_deadline {
+	__s64	tv_sec;
+	__s32	tv_nsec;
+	__u32	pad;
+};
+
 #define SYNC_IOC_MAGIC		'>'
 
 /**
@@ -95,4 +107,12 @@ struct sync_file_info {
  */
 #define SYNC_IOC_FILE_INFO	_IOWR(SYNC_IOC_MAGIC, 4, struct sync_file_info)
 
+
+/**
+ * DOC: SYNC_IOC_SET_DEADLINE - set a deadline on a fence
+ *
+ * Allows userspace to set a deadline on a fence, see dma_fence_set_deadline()
+ */
+#define SYNC_IOC_SET_DEADLINE	_IOW(SYNC_IOC_MAGIC, 5, struct sync_set_deadline)
+
 #endif /* _UAPI_LINUX_SYNC_H */
-- 
2.31.1

