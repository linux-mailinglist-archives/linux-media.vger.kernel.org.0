Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 389143B1E7E
	for <lists+linux-media@lfdr.de>; Wed, 23 Jun 2021 18:19:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229926AbhFWQVh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Jun 2021 12:21:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229726AbhFWQVg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Jun 2021 12:21:36 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B3A0C061574
        for <linux-media@vger.kernel.org>; Wed, 23 Jun 2021 09:19:19 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id ot9so3888097ejb.8
        for <linux-media@vger.kernel.org>; Wed, 23 Jun 2021 09:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cO1vJz5pucDouo6X9nWZ3NnckMomg2MFYmOs4y5pkK4=;
        b=DDCIl7hcJY4ZO4Z513KKDraLBQhvHBFR7V7PcQgwkC9h1HodRqSx7sm8LZKM6bEVC9
         WOayaqmWTq3+JXKAiy5bErOphH/Qd10hwxfJ2x7ehnbQyoSsrVkduUnnXA0koCzIOrQn
         tBGcVmg6448ZIHIYUY2YhukxUFoJTB+3HSijE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cO1vJz5pucDouo6X9nWZ3NnckMomg2MFYmOs4y5pkK4=;
        b=hOZvvGHADu/0VFNOxQoyfSBrMElOnnV+5wafl9mTa7hNCdkXFfwgIHh/hq88REwyJ+
         Ax8LHmJZxwsf3LXaGzBtaYpDVy1WtQx4suP7oga1sbPE3DReSuAkYkar8HkIKQ3HgOur
         nAJSgG2ZNA6HwIfNjQ4RC87ifZB4RyCGtkD0W7Cog5+VqRneYKaSPWJlfRtVQDUvMPrw
         8Fo6TvdQml+KMI5bPorR/p3T8mVXW46vJiCfBpkMi2D0bw9E03Kvj2BjOXcnUubSo9Z7
         0weR6GHjZ53NJDGhWXAVtbnpte2WrmZC+OfMUcuj59A4bTzA/0eCIgA4c6Xy6gAc5vJ9
         j3Eg==
X-Gm-Message-State: AOAM533l5YrQLIuk/pQ0cQe4ZaHMkAdiBYqUYaDOBJX29BP+bv035rgo
        Cqlw1zE5FyWjhj5gv7STAUJLPg==
X-Google-Smtp-Source: ABdhPJwKsMbsDP0Bcv38UaSZ4GVVy38OY+3qXIada2qcpL3Cx8ePFIJRMy9XGPeKjAnrgyRYyPhRQg==
X-Received: by 2002:a17:907:2d8b:: with SMTP id gt11mr903565ejc.80.1624465157754;
        Wed, 23 Jun 2021 09:19:17 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id ee47sm285539edb.51.2021.06.23.09.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jun 2021 09:19:17 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Alex Deucher <alexander.deucher@amd.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Dave Airlie <airlied@redhat.com>,
        Nirmoy Das <nirmoy.das@amd.com>,
        Deepak R Varma <mh12gx2825@gmail.com>,
        Chen Li <chenli@uniontech.com>,
        Kevin Wang <kevin1.wang@amd.com>, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
Subject: [PATCH] dma-buf: Switch to inline kerneldoc
Date:   Wed, 23 Jun 2021 18:17:12 +0200
Message-Id: <20210623161712.3370885-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0.rc2
In-Reply-To: <20210622165511.3169559-3-daniel.vetter@ffwll.ch>
References: <20210622165511.3169559-3-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Also review & update everything while we're at it.

This is prep work to smash a ton of stuff into the kerneldoc for
@resv.

v2: Move the doc for sysfs_entry.attachment_uid to the right place too
(Sam)

Acked-by: Christian König <christian.koenig@amd.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Nirmoy Das <nirmoy.das@amd.com>
Cc: Deepak R Varma <mh12gx2825@gmail.com>
Cc: Chen Li <chenli@uniontech.com>
Cc: Kevin Wang <kevin1.wang@amd.com>
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
---
 include/linux/dma-buf.h | 116 +++++++++++++++++++++++++++++++---------
 1 file changed, 90 insertions(+), 26 deletions(-)

diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index 92eec38a03aa..81cebf414505 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -289,30 +289,6 @@ struct dma_buf_ops {
 
 /**
  * struct dma_buf - shared buffer object
- * @size: size of the buffer; invariant over the lifetime of the buffer.
- * @file: file pointer used for sharing buffers across, and for refcounting.
- * @attachments: list of dma_buf_attachment that denotes all devices attached,
- *               protected by dma_resv lock.
- * @ops: dma_buf_ops associated with this buffer object.
- * @lock: used internally to serialize list manipulation, attach/detach and
- *        vmap/unmap
- * @vmapping_counter: used internally to refcnt the vmaps
- * @vmap_ptr: the current vmap ptr if vmapping_counter > 0
- * @exp_name: name of the exporter; useful for debugging.
- * @name: userspace-provided name; useful for accounting and debugging,
- *        protected by @resv.
- * @name_lock: spinlock to protect name access
- * @owner: pointer to exporter module; used for refcounting when exporter is a
- *         kernel module.
- * @list_node: node for dma_buf accounting and debugging.
- * @priv: exporter specific private data for this buffer object.
- * @resv: reservation object linked to this dma-buf
- * @poll: for userspace poll support
- * @cb_excl: for userspace poll support
- * @cb_shared: for userspace poll support
- * @sysfs_entry: for exposing information about this buffer in sysfs.
- * The attachment_uid member of @sysfs_entry is protected by dma_resv lock
- * and is incremented on each attach.
  *
  * This represents a shared buffer, created by calling dma_buf_export(). The
  * userspace representation is a normal file descriptor, which can be created by
@@ -324,24 +300,100 @@ struct dma_buf_ops {
  * Device DMA access is handled by the separate &struct dma_buf_attachment.
  */
 struct dma_buf {
+	/**
+	 * @size:
+	 *
+	 * Size of the buffer; invariant over the lifetime of the buffer.
+	 */
 	size_t size;
+
+	/**
+	 * @file:
+	 *
+	 * File pointer used for sharing buffers across, and for refcounting.
+	 * See dma_buf_get() and dma_buf_put().
+	 */
 	struct file *file;
+
+	/**
+	 * @attachments:
+	 *
+	 * List of dma_buf_attachment that denotes all devices attached,
+	 * protected by &dma_resv lock @resv.
+	 */
 	struct list_head attachments;
+
+	/** @ops: dma_buf_ops associated with this buffer object. */
 	const struct dma_buf_ops *ops;
+
+	/**
+	 * @lock:
+	 *
+	 * Used internally to serialize list manipulation, attach/detach and
+	 * vmap/unmap. Note that in many cases this is superseeded by
+	 * dma_resv_lock() on @resv.
+	 */
 	struct mutex lock;
+
+	/**
+	 * @vmapping_counter:
+	 *
+	 * Used internally to refcnt the vmaps returned by dma_buf_vmap().
+	 * Protected by @lock.
+	 */
 	unsigned vmapping_counter;
+
+	/**
+	 * @vmap_ptr:
+	 * The current vmap ptr if @vmapping_counter > 0. Protected by @lock.
+	 */
 	struct dma_buf_map vmap_ptr;
+
+	/**
+	 * @exp_name:
+	 *
+	 * Name of the exporter; useful for debugging. See the
+	 * DMA_BUF_SET_NAME IOCTL.
+	 */
 	const char *exp_name;
+
+	/**
+	 * @name:
+	 *
+	 * Userspace-provided name; useful for accounting and debugging,
+	 * protected by dma_resv_lock() on @resv and @name_lock for read access.
+	 */
 	const char *name;
+
+	/** @name_lock: Spinlock to protect name acces for read access. */
 	spinlock_t name_lock;
+
+	/**
+	 * @owner:
+	 *
+	 * Pointer to exporter module; used for refcounting when exporter is a
+	 * kernel module.
+	 */
 	struct module *owner;
+
+	/** @list_node: node for dma_buf accounting and debugging. */
 	struct list_head list_node;
+
+	/** @priv: exporter specific private data for this buffer object. */
 	void *priv;
+
+	/**
+	 * @resv:
+	 *
+	 * Reservation object linked to this dma-buf.
+	 */
 	struct dma_resv *resv;
 
-	/* poll support */
+	/** @poll: for userspace poll support */
 	wait_queue_head_t poll;
 
+	/** @cb_excl: for userspace poll support */
+	/** @cb_shared: for userspace poll support */
 	struct dma_buf_poll_cb_t {
 		struct dma_fence_cb cb;
 		wait_queue_head_t *poll;
@@ -349,10 +401,22 @@ struct dma_buf {
 		__poll_t active;
 	} cb_excl, cb_shared;
 #ifdef CONFIG_DMABUF_SYSFS_STATS
-	/* for sysfs stats */
+	/**
+	 * @sysfs_entry:
+	 *
+	 * For exposing information about this buffer in sysfs. See also
+	 * `DMA-BUF statistics`_ for the uapi this enables.
+	 */
 	struct dma_buf_sysfs_entry {
 		struct kobject kobj;
 		struct dma_buf *dmabuf;
+
+		/**
+		 * @sysfs_entry.attachment_uid:
+		 *
+		 * This is protected by the dma_resv_lock() on @resv and is
+		 * incremented on each attach.
+		 */
 		unsigned int attachment_uid;
 		struct kset *attach_stats_kset;
 	} *sysfs_entry;
-- 
2.32.0.rc2

