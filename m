Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F4AC17527C
	for <lists+linux-media@lfdr.de>; Mon,  2 Mar 2020 05:12:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726925AbgCBEMb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 1 Mar 2020 23:12:31 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:36434 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726775AbgCBEMb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 1 Mar 2020 23:12:31 -0500
Received: by mail-pj1-f65.google.com with SMTP id d7so883184pjw.1
        for <linux-media@vger.kernel.org>; Sun, 01 Mar 2020 20:12:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YrB85oXgJhPm+yjrRVrxS1vwiq4+Adj4zLtVRTDt1IY=;
        b=XqIhMNtbLPC20ZwxGlrkZD/qxwtoK++BXMtCphV5QLovF6Grd/E5Zw8z0k1h8LgD9G
         as4crmLVxevYfc9ajn7rFWoDyg1yswpuvDTToB3lDmBPNNirXwXnml7bt1ZQP4bQgTrY
         jfpUW698BM97X5gJcCgKv+ixr39NpERrknA38=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YrB85oXgJhPm+yjrRVrxS1vwiq4+Adj4zLtVRTDt1IY=;
        b=MsMZRmeSELU20j/Gq+QqmcH237JoHNb9m5OxQW3lsufjN6pECN914vBiavu+KgnfyZ
         prZtxBCognIoRgAWUD68fWwNuo/PE3PqsJXJUfvt6m/egxkjSBeWdpaKM0HeSaMbNAgb
         K1EiN/XsTw74yiAAa9i2p3L59Ol2jEvKRTdGn/YY7zfWTKADoyNLCJ/mYByTbS8Q1PaU
         q5ldKxDB11b0Wk2IEom/FUD2f+1DW8NyIflRLVkYF521b9UreGCa0OlTwIJihacRMQU2
         62aj86lD2OGAFX0TeiORFRPsPH1910Pw4bfvbHRpe2vkGoczxNX2bPl3Hla5oDwm+fbn
         Oc1Q==
X-Gm-Message-State: APjAAAVrErBca5EDSg9r1nzls4wR0f4Y6B6DhI8EJJmpJ8KE0rbybiuL
        ddiN5g1R0LDp+ALxBKoFmpe/eYFUjiA=
X-Google-Smtp-Source: APXvYqzD0LdRygbrs+muxMi8M08sNfLRRpnD5+s8MAmr+1S1rhkGzEDHXU8xd4ELsMDSGe81J9hLpA==
X-Received: by 2002:a17:90a:c301:: with SMTP id g1mr18796339pjt.88.1583122349094;
        Sun, 01 Mar 2020 20:12:29 -0800 (PST)
Received: from tigerii.tok.corp.google.com ([2401:fa00:8f:203:5bbb:c872:f2b1:f53b])
        by smtp.gmail.com with ESMTPSA id d82sm1698114pfd.187.2020.03.01.20.12.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2020 20:12:28 -0800 (PST)
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
Subject: [PATCHv4 01/11] videobuf2: add cache management members
Date:   Mon,  2 Mar 2020 13:12:03 +0900
Message-Id: <20200302041213.27662-2-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
In-Reply-To: <20200302041213.27662-1-senozhatsky@chromium.org>
References: <20200302041213.27662-1-senozhatsky@chromium.org>
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

