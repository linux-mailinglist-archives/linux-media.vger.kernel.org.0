Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B38D91848B
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2019 06:34:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725907AbfEIEek (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 May 2019 00:34:40 -0400
Received: from mx08-00376f01.pphosted.com ([91.207.212.86]:49121 "EHLO
        mx08-00376f01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725822AbfEIEek (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 9 May 2019 00:34:40 -0400
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
        by mx08-00376f01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x494XFBm003700;
        Thu, 9 May 2019 05:34:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=dk201812; bh=TUGJ2U0A2v399my7K+20ZfwrAtvVzXgUK8GFLa6dde4=;
 b=L96NZE2espTAXuQoSBjx6LHFL6m+wMKsIOpCTvYicbx9oKxHqxl9GRbtKux7Zto3fA8P
 g0+w8MKUIT7kdqCK2NAB1m9WeH/XpLlCk0W5vKgohHQYF2Yr42zdWs5jI0Tu481bm7OO
 hLKqQEQAWoM4UXG0pNxG+KNZPL+xKhhj6bKkXmfn58qqhKhLJ68mB818uNMSOFgyf88Q
 yv8cxuMywhwTG2i3cJ3w99z8dNFrXPhBMFigePXPHG1gc+jCjJHZ7I1qM1TH3jFjEhCO
 bbrZmEJY98hdOYxKB6Zsxdfa1XCL/Le73loxywaGPRaCTqBkPJZCxk2u65FBc1A94RFK CA== 
Received: from hhmail02.hh.imgtec.org ([217.156.249.195])
        by mx08-00376f01.pphosted.com with ESMTP id 2scb9h03fr-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Thu, 09 May 2019 05:34:28 +0100
Received: from michael-imgtec.tp.imgtec.org (10.80.17.22) by
 hhmail02.hh.imgtec.org (10.100.10.21) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Thu, 9 May 2019 05:34:26 +0100
From:   Michael Yang <michael.yang@imgtec.com>
To:     <sumit.semwal@linaro.org>
CC:     <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <gustavo@padovan.org>, <linux-media@vger.kernel.org>,
        <linaro-mm-sig@lists.linaro.org>, <michael.yang@imgtec.com>,
        <gregkh@linuxfoundation.org>
Subject: [PATCH] sync_file: Return reasonable timestamp when merging signaled fences
Date:   Thu, 9 May 2019 12:34:11 +0800
Message-ID: <1557376451-20164-1-git-send-email-michael.yang@imgtec.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1554710495-6646-1-git-send-email-michael.yang@imgtec.com>
References: <1554710495-6646-1-git-send-email-michael.yang@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.17.22]
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If all the sync points were signaled in both fences a and b,
there was only one sync point in merged fence which is a_fence[0].
The Fence structure in android framework might be confused about
timestamp if there were any sync points which were signaled after
a_fence[0]. It might be more reasonable to use timestamp of last signaled
sync point to represent the merged fence.
The issue can be found from EGL extension ANDROID_get_frame_timestamps.
Sometimes the return value of EGL_READS_DONE_TIME_ANDROID is head of
the return value of EGL_RENDERING_COMPLETE_TIME_ANDROID.
That means display/composition had been completed before rendering
was completed that is incorrect.

Some discussion can be found at:
https://android-review.googlesource.com/c/kernel/common/+/907009

Signed-off-by: Michael Yang <michael.yang@imgtec.com>
---
Hi,
I didn't get response since I previously sent this a month ago.
Could someone have a chance to look at it please?
Thanks.
 drivers/dma-buf/sync_file.c | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/dma-buf/sync_file.c b/drivers/dma-buf/sync_file.c
index 4f6305c..d46bfe1 100644
--- a/drivers/dma-buf/sync_file.c
+++ b/drivers/dma-buf/sync_file.c
@@ -274,8 +274,29 @@ static struct sync_file *sync_file_merge(const char *name, struct sync_file *a,
 	for (; i_b < b_num_fences; i_b++)
 		add_fence(fences, &i, b_fences[i_b]);
 
-	if (i == 0)
-		fences[i++] = dma_fence_get(a_fences[0]);
+	/* If all the sync pts were signaled, then adding the sync_pt who
+	 * was the last signaled to the fence.
+	 */
+	if (i == 0) {
+		struct dma_fence *last_signaled_sync_pt = a_fences[0];
+		int iter;
+
+		for (iter = 1; iter < a_num_fences; iter++) {
+			if (ktime_compare(last_signaled_sync_pt->timestamp,
+				a_fences[iter]->timestamp) < 0) {
+				last_signaled_sync_pt = a_fences[iter];
+			}
+		}
+
+		for (iter = 0; iter < b_num_fences; iter++) {
+			if (ktime_compare(last_signaled_sync_pt->timestamp,
+				b_fences[iter]->timestamp) < 0) {
+				last_signaled_sync_pt = b_fences[iter];
+			}
+		}
+
+		fences[i++] = dma_fence_get(last_signaled_sync_pt);
+	}
 
 	if (num_fences > i) {
 		nfences = krealloc(fences, i * sizeof(*fences),
-- 
2.7.4

