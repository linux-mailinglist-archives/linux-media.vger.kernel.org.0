Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED8D769BC2B
	for <lists+linux-media@lfdr.de>; Sat, 18 Feb 2023 22:16:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229840AbjBRVQN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 18 Feb 2023 16:16:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229862AbjBRVQI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 18 Feb 2023 16:16:08 -0500
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96F62166D4;
        Sat, 18 Feb 2023 13:15:58 -0800 (PST)
Received: by mail-pf1-x429.google.com with SMTP id d19so677208pfo.9;
        Sat, 18 Feb 2023 13:15:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vB/jSDrgA8UtJvwy1x7JONuOUUbXDB++h6MnIk8ZgSw=;
        b=RY8338mvWxXiFN2CHg5+oaY5dszy2q7o07Qhnr55aOsSYI1UpZ9OwXPS4r6AC+zw0z
         AHFmOk3Hbxodz45mKpw3txyokHhLFObqsRYOESIkanEVGU/zO88ihBC4hKU+bmDz6UHo
         /Stah/9tCU3K9tUengKlhXc60ylZa5igR/9a5B3Ys7ne8+MuuFKhsT/G8INfSUMoHfln
         7WKg3kwZOtwrLINCcgYDeUEE/+QSIojQUExKwBB1tVV4A8i7KCSoOFYLac70ytSfNu9j
         J8dpgpRM6lhjZ/U7MopMI1DjfnFLJKrNH2Vji6fkIhV8NP5Z8ePJHwUxigmCaL3i2O14
         HnSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vB/jSDrgA8UtJvwy1x7JONuOUUbXDB++h6MnIk8ZgSw=;
        b=xQEuDZO9WGkAOFcuQXCxS1XJ6iDqLU69XSXMgbR/MHwhDLklGekP2XNuaSUrl1Aqsi
         e89CeaYGOrhWWFQTbQ4z7gl8C/tXqXOh3F9yHRr3wGv5K5xrIWNuWuoNdwk2EsAxAtYh
         zWs+hscsZAIw1bWk+NDGbUbobbQluHQcIUKYQfrGTdnt7YTjiCDWdo63JciqULepoEzZ
         e+d+WIDTLjxjzqQMtykVXf+YVimHGXqEw67665nGF0JB7of6KmljI5f6/yhKuKUqV8yk
         ldxOG+d2oLugx2qIQgJsUsTuCEg447cspZmd8p6G3uaO5GUmQ0EbD/c2iq1Beb/R9tLe
         yjfw==
X-Gm-Message-State: AO0yUKXPVDGWEDzeUdq96xUw9GhIoVJKurn8A4PtEuRAECx1IWQPhj/V
        V+Xo+MCRBpVs4r4pMMYsLAA=
X-Google-Smtp-Source: AK7set8gwg9RY9ZxDGIcTqNc4nJv6+AbCIJFIayFXX1sjc6F4gyeFD+K5gkUhaBMvy5Kxx7y8xK0mQ==
X-Received: by 2002:a62:180d:0:b0:5a8:4de2:e94e with SMTP id 13-20020a62180d000000b005a84de2e94emr4528311pfy.33.1676754958081;
        Sat, 18 Feb 2023 13:15:58 -0800 (PST)
Received: from localhost (c-73-67-135-195.hsd1.or.comcast.net. [73.67.135.195])
        by smtp.gmail.com with ESMTPSA id w2-20020aa78582000000b005a8cc32b23csm3810199pfn.20.2023.02.18.13.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Feb 2023 13:15:57 -0800 (PST)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= 
        <ckoenig.leichtzumerken@gmail.com>,
        =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>,
        Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Pekka Paalanen <ppaalanen@gmail.com>,
        Simon Ser <contact@emersion.fr>,
        Rob Clark <robdclark@chromium.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Gustavo Padovan <gustavo@padovan.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        linux-media@vger.kernel.org (open list:SYNC FILE FRAMEWORK),
        linaro-mm-sig@lists.linaro.org (moderated list:DMA BUFFER SHARING
        FRAMEWORK), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 07/14] dma-buf/sw_sync: Add fence deadline support
Date:   Sat, 18 Feb 2023 13:15:50 -0800
Message-Id: <20230218211608.1630586-8-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230218211608.1630586-1-robdclark@gmail.com>
References: <20230218211608.1630586-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

This consists of simply storing the most recent deadline, and adding an
ioctl to retrieve the deadline.  This can be used in conjunction with
the SET_DEADLINE ioctl on a fence fd for testing.  Ie. create various
sw_sync fences, merge them into a fence-array, set deadline on the
fence-array and confirm that it is propagated properly to each fence.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/dma-buf/sw_sync.c    | 58 ++++++++++++++++++++++++++++++++++++
 drivers/dma-buf/sync_debug.h |  2 ++
 2 files changed, 60 insertions(+)

diff --git a/drivers/dma-buf/sw_sync.c b/drivers/dma-buf/sw_sync.c
index 348b3a9170fa..50f2638cccd3 100644
--- a/drivers/dma-buf/sw_sync.c
+++ b/drivers/dma-buf/sw_sync.c
@@ -52,12 +52,26 @@ struct sw_sync_create_fence_data {
 	__s32	fence; /* fd of new fence */
 };
 
+/**
+ * struct sw_sync_get_deadline - get the deadline of a sw_sync fence
+ * @tv_sec:	seconds elapsed since epoch (out)
+ * @tv_nsec:	nanoseconds elapsed since the time given by the tv_sec (out)
+ * @fence_fd:	the sw_sync fence fd (in)
+ */
+struct sw_sync_get_deadline {
+	__s64	tv_sec;
+	__s32	tv_nsec;
+	__s32	fence_fd;
+};
+
 #define SW_SYNC_IOC_MAGIC	'W'
 
 #define SW_SYNC_IOC_CREATE_FENCE	_IOWR(SW_SYNC_IOC_MAGIC, 0,\
 		struct sw_sync_create_fence_data)
 
 #define SW_SYNC_IOC_INC			_IOW(SW_SYNC_IOC_MAGIC, 1, __u32)
+#define SW_SYNC_GET_DEADLINE		_IOWR(SW_SYNC_IOC_MAGIC, 2, \
+		struct sw_sync_get_deadline)
 
 static const struct dma_fence_ops timeline_fence_ops;
 
@@ -171,6 +185,13 @@ static void timeline_fence_timeline_value_str(struct dma_fence *fence,
 	snprintf(str, size, "%d", parent->value);
 }
 
+static void timeline_fence_set_deadline(struct dma_fence *fence, ktime_t deadline)
+{
+	struct sync_pt *pt = dma_fence_to_sync_pt(fence);
+
+	pt->deadline = deadline;
+}
+
 static const struct dma_fence_ops timeline_fence_ops = {
 	.get_driver_name = timeline_fence_get_driver_name,
 	.get_timeline_name = timeline_fence_get_timeline_name,
@@ -179,6 +200,7 @@ static const struct dma_fence_ops timeline_fence_ops = {
 	.release = timeline_fence_release,
 	.fence_value_str = timeline_fence_value_str,
 	.timeline_value_str = timeline_fence_timeline_value_str,
+	.set_deadline = timeline_fence_set_deadline,
 };
 
 /**
@@ -387,6 +409,39 @@ static long sw_sync_ioctl_inc(struct sync_timeline *obj, unsigned long arg)
 	return 0;
 }
 
+static int sw_sync_ioctl_get_deadline(struct sync_timeline *obj, unsigned long arg)
+{
+	struct sw_sync_get_deadline data;
+	struct timespec64 ts;
+	struct dma_fence *fence;
+	struct sync_pt *pt;
+
+	if (copy_from_user(&data, (void __user *)arg, sizeof(data)))
+		return -EFAULT;
+
+	if (data.tv_sec || data.tv_nsec)
+		return -EINVAL;
+
+	fence = sync_file_get_fence(data.fence_fd);
+	if (!fence)
+		return -EINVAL;
+
+	pt = dma_fence_to_sync_pt(fence);
+	if (!pt)
+		return -EINVAL;
+
+	ts = ktime_to_timespec64(pt->deadline);
+	data.tv_sec  = ts.tv_sec;
+	data.tv_nsec = ts.tv_nsec;
+
+	dma_fence_put(fence);
+
+	if (copy_to_user((void __user *)arg, &data, sizeof(data)))
+		return -EFAULT;
+
+	return 0;
+}
+
 static long sw_sync_ioctl(struct file *file, unsigned int cmd,
 			  unsigned long arg)
 {
@@ -399,6 +454,9 @@ static long sw_sync_ioctl(struct file *file, unsigned int cmd,
 	case SW_SYNC_IOC_INC:
 		return sw_sync_ioctl_inc(obj, arg);
 
+	case SW_SYNC_GET_DEADLINE:
+		return sw_sync_ioctl_get_deadline(obj, arg);
+
 	default:
 		return -ENOTTY;
 	}
diff --git a/drivers/dma-buf/sync_debug.h b/drivers/dma-buf/sync_debug.h
index 6176e52ba2d7..2e0146d0bdbb 100644
--- a/drivers/dma-buf/sync_debug.h
+++ b/drivers/dma-buf/sync_debug.h
@@ -55,11 +55,13 @@ static inline struct sync_timeline *dma_fence_parent(struct dma_fence *fence)
  * @base: base fence object
  * @link: link on the sync timeline's list
  * @node: node in the sync timeline's tree
+ * @deadline: the most recently set fence deadline
  */
 struct sync_pt {
 	struct dma_fence base;
 	struct list_head link;
 	struct rb_node node;
+	ktime_t deadline;
 };
 
 extern const struct file_operations sw_sync_debugfs_fops;
-- 
2.39.1

