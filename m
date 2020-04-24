Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D1D81B70DD
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2020 11:30:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726882AbgDXJaq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Apr 2020 05:30:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726523AbgDXJap (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Apr 2020 05:30:45 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AFF4C09B045;
        Fri, 24 Apr 2020 02:30:45 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id 18so3317075pfv.8;
        Fri, 24 Apr 2020 02:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TrR6hu+KWMBem9LHeFisBnjrXsleHdt+kHq4K2nQnVk=;
        b=coQf79/tohbUyvHCkg30RJItibeQ8r6DiSTQdI28pRykvZRlJMWBf2Mq2XT8cr1Wfu
         DsF1AKRLnw17gIa/cpTj7rJAdgdH9jpzfGsPh2zXzNdsjDTfFGi10TMuzSERyjfr+ZsB
         AtxaWIXXXvZjoWmAJhgE0B3TOjRl2ZG3QqWEG23uab5j18CC9q2+S2n0FSonFHHARLDf
         xekRpukadUoTXeste5AsJI6qSQA/furPJXOi3jQE+lVw0X+eospkNS/C2Ib+6RlrFYZ1
         U6zv30Z9xptmVyQqDz1rUeBVe2McgCnNpyA/dsbVPYQNWeoDFDG59OLRR1dye6RjxY5R
         hkuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TrR6hu+KWMBem9LHeFisBnjrXsleHdt+kHq4K2nQnVk=;
        b=Px5I8Qv3wEDkrvvhTr8EqHVx52GCyiIJjde4YU1gGkw7ZPLQ7/qIrDKJRjLRSiZeiu
         t+vb4uYETqGFg6lxbJXcv2WEpSkuKVXdIQb7OBmKMFznd7fiJPpCPXQJ7fQUZDzAnE01
         c8vrClf/0dJmAMgsI+A2lsV8sQu+gcUWaWRaSZ1HKILdvKyyXUw1WsReh0IIdmHeaMrc
         jMGYJLIaMHDH2Qwdr17ftVCesAdeEjmpe/Pj4X+DqrzHbLodZyeEGh7rwswN7/s3p8Sj
         5UZa7nzNaXGOWoLXmYmTqrT7xeySJOzf2/wbkZoxchJXeQd70V/O2zcyKgltCXA4QYPT
         FxsA==
X-Gm-Message-State: AGi0PuY6DySr+UNQGifa1mn2OO1FQ7612qYBt0Xud87M9RVUzsLC2Q29
        3Qkt3EPEhOgNa9/tH3ozHu8=
X-Google-Smtp-Source: APiQypIjrsReeaTEieis94Y1UNkB6IbucDaHec7qMAvO0YLzzuyz4GRM81zPKZb67ReiT1RB/lJBIw==
X-Received: by 2002:aa7:9251:: with SMTP id 17mr8096696pfp.315.1587720644697;
        Fri, 24 Apr 2020 02:30:44 -0700 (PDT)
Received: from localhost.localdomain (146.85.30.125.dy.iij4u.or.jp. [125.30.85.146])
        by smtp.gmail.com with ESMTPSA id 185sm5541315pfv.9.2020.04.24.02.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2020 02:30:44 -0700 (PDT)
From:   Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
To:     Hans Verkuil <hans.verkuil@cisco.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv5 02/13] videobuf2: add cache management members
Date:   Fri, 24 Apr 2020 18:29:09 +0900
Message-Id: <20200424092920.4801-3-sergey.senozhatsky@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200424092920.4801-1-sergey.senozhatsky@gmail.com>
References: <20200424092920.4801-1-sergey.senozhatsky@gmail.com>
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

Only drivers that set ->allow_cache_hints during queue initialisation
will handle user-space cache management hints. Otherwise hints
will be ignored.

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

