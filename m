Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B34593A2A60
	for <lists+linux-media@lfdr.de>; Thu, 10 Jun 2021 13:36:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230455AbhFJLiU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Jun 2021 07:38:20 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:47265 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230250AbhFJLiT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Jun 2021 07:38:19 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id rIytl7kZmhqltrIyzlXjS8; Thu, 10 Jun 2021 13:36:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1623324982; bh=QsbpWKReDiIX9o1N5/wDONTFB+mPdzAq7M8dwkdvZGc=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=b9G3dJrDT2e7IVtbTbgN0e5xdo45z0QPTPxL4/8K19DQqWe2YUod07CY2E1AhMxpu
         dBglf7sT52e4TniayKBqserO8Ae6WXifNjaq/fegJ6W52IRmwde2ebEgO1TqPQ4vys
         vyDIp9ABRmebrHGwcjLXLH97h7GbvC8M9G7eDohGA2uhKtyj9Zs5tOaXNfbxy6DYgD
         0C7RR2C/L2yXuAR/UPfwzcaWQoCa0CnkBej7m9mbQWWWJ79uQ3lhL4GQtwSuUIIjC5
         xnykbymFsKRWbidKrDDVYIoVgTWOBu/ZsXgf881affzXiNGxTmwBe8KC+zrdgqjj4m
         OVr5d+28lbqMw==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Yunfei Dong <yunfei.dong@mediatek.com>,
        Dikshita Agarwal <dikshita@codeaurora.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        John Cox <jc@kynesim.co.uk>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [RFC PATCHv2 01/11] videodev2.h: add V4L2_CTRL_FLAG_DYNAMIC_ARRAY
Date:   Thu, 10 Jun 2021 13:36:05 +0200
Message-Id: <20210610113615.785359-2-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210610113615.785359-1-hverkuil-cisco@xs4all.nl>
References: <20210610113615.785359-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfBNfF+B7EUERI9OemAcDtF+Hp6YAXqza2NS5NHa0o/x6Gachu0hwD9towXnh46Z394DGW6lXEIkYU0nvqK56E+HfUXp+tJBGRliNYXo3/YxhLzmJJk62
 yhbDH7/Mb8pcNqjJ5LKRY7X4k3/F0syXO81H2v+N6b2UPs7k7ncln7VN9xPDVx5u6FmWjys0WwFEXhOfwafRk6VGb207Q4dTkCKc/wC6IOhqxpa7HnHo3zTo
 Yfb9Li8/Fp7zfxICfUM/1K2W8K7dbTLohBypKWWX+aXgL9WhnLCggZBCi99cBVQnRVr+ME6rbyoQMeJd4XDEr3q9JFRuHgS/zAjqwHOpXOaVlzPU3z+ywiqG
 yylAshY/mYk30GgdyAMgF+QyDqdd16jexjc06QDCO4kwkq8k+7looCjZ8OtvB6CwA7MMl3bP
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a new flag that indicates that this control is a dynamically sized
array. Also document this flag.

Currently dynamically sized arrays are limited to one dimensional arrays,
but that might change in the future if there is a need for it.

The initial use-case of dynamic arrays are stateless codecs. A frame
can be divided in many slices, so you want to provide an array containing
slice information for each slice. Typically the number of slices is small,
but the standard allow for hundreds or thousands of slices. Dynamic arrays
are a good solution since sizing the array for the worst case would waste
substantial amounts of memory.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 .../userspace-api/media/v4l/vidioc-queryctrl.rst          | 8 ++++++++
 include/uapi/linux/videodev2.h                            | 1 +
 2 files changed, 9 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
index 07e54029e1e9..a1a0dbff4a6f 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
@@ -601,6 +601,14 @@ See also the examples in :ref:`control`.
 	``V4L2_CTRL_FLAG_GRABBED`` flag when buffers are allocated or
 	streaming is in progress since most drivers do not support changing
 	the format in that case.
+    * - ``V4L2_CTRL_FLAG_DYNAMIC_ARRAY``
+      - 0x0800
+      - This control is a dynamically sized 1-dimensional array. It
+        behaves the same as a regular array, except that the number
+	of elements as reported by the ``elems`` field is between 1 and
+	``dims[0]``. So setting the control with a differently sized
+	array will change the ``elems`` field when the control is
+	queried afterwards.
 
 Return Value
 ============
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 9260791b8438..7222fc855d6b 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -1869,6 +1869,7 @@ struct v4l2_querymenu {
 #define V4L2_CTRL_FLAG_HAS_PAYLOAD	0x0100
 #define V4L2_CTRL_FLAG_EXECUTE_ON_WRITE	0x0200
 #define V4L2_CTRL_FLAG_MODIFY_LAYOUT	0x0400
+#define V4L2_CTRL_FLAG_DYNAMIC_ARRAY	0x0800
 
 /*  Query flags, to be ORed with the control ID */
 #define V4L2_CTRL_FLAG_NEXT_CTRL	0x80000000
-- 
2.30.2

