Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A420716FD14
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2020 12:15:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728138AbgBZLPp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Feb 2020 06:15:45 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:41657 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727882AbgBZLPp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Feb 2020 06:15:45 -0500
Received: by mail-pl1-f195.google.com with SMTP id t14so1162389plr.8
        for <linux-media@vger.kernel.org>; Wed, 26 Feb 2020 03:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mzosCDZ9YSkD/x4CCM+TaObJ9SD2EhDn00lJAJGOJhs=;
        b=hgGJv/4tzhQcLOBcc/oQKPAvgMG5HdG3R7vF6+dy0tfDt6DNt8vwlhTkLLQHQtgmew
         AdKqPhxNAFtkbDckat1++ysPaq5N/nin9ZBshKcLxhs6aUKDT7mPipfD+waTH0z7gmz5
         7Kp9AAwW5bwjbW2sBfXXtYN8pmHF1pPN00KjM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mzosCDZ9YSkD/x4CCM+TaObJ9SD2EhDn00lJAJGOJhs=;
        b=mVFEUzQ8ZhreNrjgfl3IC7lPaQ159Q6AtYqgUGY1DbWaFQJ/w6QV+qq8lZnefoH0UX
         w6BIOohWveRcmbjMATOyRZf0CgDUQ1Dql/UkDeSauGsX2ydkmVcrKrnMPojt/uyb7X3+
         TO3NW2OcUBOVeiEaFNe6o5QcO5fcxDBkvLCBPHXLhUgT1TQtidmXJJ9nCDQYopKdc0JP
         WO7fgKqnx9WPFeMsOnKPezuU1akE7OcrftePt3b8WG3JkFF28crO2X0qHzuYwO0sOS9k
         V8KVRffkkwjaPNBH91aToOquUPux+x6MOy5VwwenNpAKVGFYBZnqyevw4px6bNgDj5/Z
         ct2Q==
X-Gm-Message-State: APjAAAVxM4s7oIR/MWiQVkyDUlMn33DEynz6eLrFDMGKNBesuqR2TV1l
        D536R8vK0IhiXOW/bW0Z7jklWw==
X-Google-Smtp-Source: APXvYqybUJN72qIN2y1/NNv4gWlcpqoFsWdHco+b6//p64lA5aV0ddJ2Jev92l9odEBQqvrAMcPRlw==
X-Received: by 2002:a17:90b:3011:: with SMTP id hg17mr4562016pjb.90.1582715743951;
        Wed, 26 Feb 2020 03:15:43 -0800 (PST)
Received: from tigerii.tok.corp.google.com ([2401:fa00:8f:203:5bbb:c872:f2b1:f53b])
        by smtp.gmail.com with ESMTPSA id o22sm2429993pgj.58.2020.02.26.03.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2020 03:15:43 -0800 (PST)
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Hans Verkuil <hans.verkuil@cisco.com>,
        Tomasz Figa <tfiga@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pawel Osciak <posciak@chromium.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv3 01/11] videobuf2: add cache management members
Date:   Wed, 26 Feb 2020 20:15:19 +0900
Message-Id: <20200226111529.180197-2-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
In-Reply-To: <20200226111529.180197-1-senozhatsky@chromium.org>
References: <20200226111529.180197-1-senozhatsky@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

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
struct with two new memebers ->need_cache_sync_on_prepare and
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
index a2b2208b02da..4a19170672ac 100644
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
+ * 		order to skip cache flush/invalidation on ->prepare() or/and
+ * 		->finish().
  * @lock:	pointer to a mutex that protects the &struct vb2_queue. The
  *		driver can set this to a mutex to let the v4l2 core serialize
  *		the queuing ioctls. If the driver wants to handle locking
@@ -564,6 +573,7 @@ struct vb2_queue {
 	unsigned			requires_requests:1;
 	unsigned			uses_qbuf:1;
 	unsigned			uses_requests:1;
+	unsigned			allow_cache_hints:1;
 
 	struct mutex			*lock;
 	void				*owner;
-- 
2.25.0.265.gbab2e86ba0-goog

