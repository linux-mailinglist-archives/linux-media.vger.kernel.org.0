Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57AF31D35D4
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2020 18:03:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727798AbgENQCS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 May 2020 12:02:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726037AbgENQCS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 May 2020 12:02:18 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3E86C061A0C;
        Thu, 14 May 2020 09:02:17 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id fu13so12626173pjb.5;
        Thu, 14 May 2020 09:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=C6IvRtN+FXImMiEAs8A2fMZkmB99CF/cT6/38NcxCNk=;
        b=R/SrO4AGOxEw39v8EE9gI/3pOR7R759bM3BUOYetCjf9FoxCPt5Zyy0/pTYraBvMfw
         tiW2Oo3CLaigNdp9r7OJRJMmSyicGiCS6MWYboVBRwnngJsbX3DB+Co6wTCJXXx50UMc
         SNfaEESQIhhbxmKlmIiQuPbULNhFl581GEYiHboTS3aj1iw+cpIloVIZFHV+ju/fQ1yW
         5+qvF7emE78b/zC5CteHKh/zhu9P1QIZXS7zT7XWoXLJRdyc7Nt1xNC+ZjxRWZwSrlSr
         27AU9bmxf1PIHwrsoqirGPUGbAfvb50jNXbyqZBpFG+cpy0mjD9Zs6va87wLuxb/J0iw
         Cm9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=C6IvRtN+FXImMiEAs8A2fMZkmB99CF/cT6/38NcxCNk=;
        b=hRUUUKgmqieEKwCe5ZD+xObf8wfs7QZj0u4GqTkmqkCabiof0C0iKlcMdWDOXKaeo2
         Vwd6u9AA1A1fIvbTrux8x88BdJZzSNul6998DxsP7wEDVWQ4rDjgp7Qsl+Mn9CHArK7E
         nbBmcglG/ieR+5HdDcRNq6eRoG4N2QlBvbzqek7en+Gf1Ct4P2FwhMcQGjUG2I09CmF+
         ZheuvnLCQuiWH/KdtklceErwkxzJiJ9K4pASUNpY9IVvJILtj7dOWMRpOt9eJUFhBNeG
         7iCKkpUxzUHWp0559M3iIzbzXBehmNOjdzkZpUD0x8XVO/NgqhDOrgYuL5YJK+EfLjqb
         +TcQ==
X-Gm-Message-State: AOAM530/7vfr38WdJbzXKpbooSMnw7DQiaEzgtG+FNkNO4Uu9ioLZ6un
        xxKIsMnxmYqlsH+mis/ujuc=
X-Google-Smtp-Source: ABdhPJx4MO9bhdnqMD9u4GN34o4Rq/B4BqGC3/YaHCUpWsvX1irx2SDfUa8TZ9a1ZnGxRwOVb38jrw==
X-Received: by 2002:a17:902:d208:: with SMTP id t8mr4843979ply.324.1589472137261;
        Thu, 14 May 2020 09:02:17 -0700 (PDT)
Received: from localhost.localdomain ([2409:10:2e40:5100:6e29:95ff:fe2d:8f34])
        by smtp.gmail.com with ESMTPSA id y6sm18178691pjw.15.2020.05.14.09.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 09:02:16 -0700 (PDT)
From:   Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
To:     Hans Verkuil <hans.verkuil@cisco.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH v6 02/14] videobuf2: add cache management members
Date:   Fri, 15 May 2020 01:01:41 +0900
Message-Id: <20200514160153.3646-3-sergey.senozhatsky@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200514160153.3646-1-sergey.senozhatsky@gmail.com>
References: <20200514160153.3646-1-sergey.senozhatsky@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Sergey Senozhatsky <senozhatsky@chromium.org>

Extend vb2_buffer and vb2_queue structs with cache management
members.

V4L2 UAPI already contains two buffer flags which user-space,
supposedly, can use to control buffer cache sync:

- V4L2_BUF_FLAG_NO_CACHE_INVALIDATE
- V4L2_BUF_FLAG_NO_CACHE_CLEAN

None of these, however, do anything at the moment. This patch
set is intended to change it.

Since user-space cache management hints are supposed to be
implemented on a per-buffer basis we need to extend vb2_buffer
struct with two new members ->need_cache_sync_on_prepare and
->need_cache_sync_on_finish, which will store corresponding
user-space hints.

In order to preserve the existing behaviour, user-space cache
managements flags will be handled only by those drivers that
permit user-space cache hints. That's the purpose of vb2_queue
->allow_cache_hints member. Driver must set ->allow_cache_hints
during queue initialisation to enable cache management hints
mechanism.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 include/media/videobuf2-core.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
index 9e522bd2acc7..7f39d9fffc8c 100644
--- a/include/media/videobuf2-core.h
+++ b/include/media/videobuf2-core.h
@@ -263,6 +263,10 @@ struct vb2_buffer {
 	 *			after the 'buf_finish' op is called.
 	 * copied_timestamp:	the timestamp of this capture buffer was copied
 	 *			from an output buffer.
+	 * need_cache_sync_on_prepare: when set buffer's ->prepare() function
+	 *			performs cache sync/invalidation.
+	 * need_cache_sync_on_finish: when set buffer's ->finish() function
+	 *			performs cache sync/invalidation.
 	 * queued_entry:	entry on the queued buffers list, which holds
 	 *			all buffers queued from userspace
 	 * done_entry:		entry on the list that stores all buffers ready
@@ -273,6 +277,8 @@ struct vb2_buffer {
 	unsigned int		synced:1;
 	unsigned int		prepared:1;
 	unsigned int		copied_timestamp:1;
+	unsigned int		need_cache_sync_on_prepare:1;
+	unsigned int		need_cache_sync_on_finish:1;
 
 	struct vb2_plane	planes[VB2_MAX_PLANES];
 	struct list_head	queued_entry;
@@ -491,6 +497,9 @@ struct vb2_buf_ops {
  * @uses_requests: requests are used for this queue. Set to 1 the first time
  *		a request is queued. Set to 0 when the queue is canceled.
  *		If this is 1, then you cannot queue buffers directly.
+ * @allow_cache_hints: when set user-space can pass cache management hints in
+ *		order to skip cache flush/invalidation on ->prepare() or/and
+ *		->finish().
  * @lock:	pointer to a mutex that protects the &struct vb2_queue. The
  *		driver can set this to a mutex to let the v4l2 core serialize
  *		the queuing ioctls. If the driver wants to handle locking
@@ -567,6 +576,7 @@ struct vb2_queue {
 	unsigned int			requires_requests:1;
 	unsigned int			uses_qbuf:1;
 	unsigned int			uses_requests:1;
+	unsigned int			allow_cache_hints:1;
 
 	struct mutex			*lock;
 	void				*owner;
-- 
2.26.2

