Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 208AA3F46A0
	for <lists+linux-media@lfdr.de>; Mon, 23 Aug 2021 10:30:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235690AbhHWIao (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Aug 2021 04:30:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235460AbhHWIan (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Aug 2021 04:30:43 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C7A6C061575;
        Mon, 23 Aug 2021 01:30:01 -0700 (PDT)
Received: from localhost.localdomain (unknown [IPv6:2a01:e0a:4cb:a870:648a:6e9d:d5af:13ed])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id AFEA21F42270;
        Mon, 23 Aug 2021 09:29:58 +0100 (BST)
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl, jc@kynesim.co.uk,
        nicolas@ndufresne.ca
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH] media: hevc: fix pictures lists type
Date:   Mon, 23 Aug 2021 10:29:49 +0200
Message-Id: <20210823082949.237716-1-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The lists embedded Picture Order Count values which are s32 so their type
most be s32 and not u8.

Reported-by: John Cox <jc@kynesim.co.uk>
Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst | 6 +++---
 include/media/hevc-ctrls.h                                | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index 976d34445a24..db9859ddc8b2 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -3323,15 +3323,15 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
     * - __u8
       - ``num_poc_lt_curr``
       - The number of reference pictures in the long-term set.
-    * - __u8
+    * - __s32
       - ``poc_st_curr_before[V4L2_HEVC_DPB_ENTRIES_NUM_MAX]``
       - PocStCurrBefore as described in section 8.3.2 "Decoding process for reference
         picture set.
-    * - __u8
+    * - __s32
       - ``poc_st_curr_after[V4L2_HEVC_DPB_ENTRIES_NUM_MAX]``
       - PocStCurrAfter as described in section 8.3.2 "Decoding process for reference
         picture set.
-    * - __u8
+    * - __s32
       - ``poc_lt_curr[V4L2_HEVC_DPB_ENTRIES_NUM_MAX]``
       - PocLtCurr as described in section 8.3.2 "Decoding process for reference
         picture set.
diff --git a/include/media/hevc-ctrls.h b/include/media/hevc-ctrls.h
index 781371bff2ad..04cd62e77f25 100644
--- a/include/media/hevc-ctrls.h
+++ b/include/media/hevc-ctrls.h
@@ -219,9 +219,9 @@ struct v4l2_ctrl_hevc_decode_params {
 	__u8	num_poc_st_curr_before;
 	__u8	num_poc_st_curr_after;
 	__u8	num_poc_lt_curr;
-	__u8	poc_st_curr_before[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
-	__u8	poc_st_curr_after[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
-	__u8	poc_lt_curr[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
+	__s32	poc_st_curr_before[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
+	__s32	poc_st_curr_after[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
+	__s32	poc_lt_curr[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
 	__u64	flags;
 };
 
-- 
2.25.1

