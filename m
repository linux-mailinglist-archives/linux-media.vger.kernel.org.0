Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 414A33B0AC1
	for <lists+linux-media@lfdr.de>; Tue, 22 Jun 2021 18:55:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231645AbhFVQ5i (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Jun 2021 12:57:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230338AbhFVQ5h (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Jun 2021 12:57:37 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01F50C061756
        for <linux-media@vger.kernel.org>; Tue, 22 Jun 2021 09:55:20 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id n23so13275342wms.2
        for <linux-media@vger.kernel.org>; Tue, 22 Jun 2021 09:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Pya40DVjcJj5BW1FVokXsLJJM2aJYidE6DU5AszPKcA=;
        b=TrbJ1ukWOdbGIkgGvvhbR2N8NeHcu7TL0jxDDmJksRr3u6CINrNYADW2XJ8Muxljzw
         +A5NwtlRHv5hIYq035iX3Ma+1HnPAfcbDN1AqBNatd7pmPZaCfwVTJZZ4xvn8IzmeFAX
         uEOra2eN8WhuvKynwlS+mfdADlAghXaEkZ7s0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Pya40DVjcJj5BW1FVokXsLJJM2aJYidE6DU5AszPKcA=;
        b=R9MsrLMkYS919CelPV7VOHqPDeSuXCA+7WdbuRJNvawKxzpPBsQerLMOMqst3y7gfo
         RnXn3yhiDfPX/EXACkUlW47reb2dAoUf9ueKgbACWANtkJHUK6XFV+5qQTNty4q2IjDN
         BG1yG+hjVKIMVgvsDH1/vmp6izof/rs9sVGDfo0DSH3hb/OQl8cw2kEktTFCEko0bwti
         Ca+XZMAT8pqNaRMJdsW7oLlW5Q9Rst9gQgcOS6lnKZTisKJjOi/54kO5XOplcXsKztIe
         4GOElZlSioU4nF47ERUxZ38OCNb/v+8RQGuQIRD1W4W9GXha3ZCVBiV7k/C6rV7Qqh2e
         7UZQ==
X-Gm-Message-State: AOAM531Rm1lviQFJ4C3SBbg2S3fz3o2buVk9KJT5Iru20HiGGeEMW4Z0
        hcTQofW9UOqpmezX3sQ1vmMi7a34yQyXLg==
X-Google-Smtp-Source: ABdhPJwScbI2igBwMthiteBhgJTlAyEs7MdGHzPT05OF2jHuLlFRzP0jfHfP+Bf1t2qvpRFNfoQxHA==
X-Received: by 2002:a05:600c:3658:: with SMTP id y24mr5564844wmq.6.1624380919402;
        Tue, 22 Jun 2021 09:55:19 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id l23sm3632342wmc.5.2021.06.22.09.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 09:55:18 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Dave Airlie <airlied@redhat.com>,
        Nirmoy Das <nirmoy.das@amd.com>,
        Deepak R Varma <mh12gx2825@gmail.com>,
        Chen Li <chenli@uniontech.com>,
        Kevin Wang <kevin1.wang@amd.com>, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
Subject: [PATCH 02/15] dma-buf: Switch to inline kerneldoc
Date:   Tue, 22 Jun 2021 18:54:58 +0200
Message-Id: <20210622165511.3169559-3-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0.rc2
In-Reply-To: <20210622165511.3169559-1-daniel.vetter@ffwll.ch>
References: <20210622165511.3169559-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Also review & update everything while we're at it.

This is prep work to smash a ton of stuff into the kerneldoc for
@resv.

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
 include/linux/dma-buf.h | 107 +++++++++++++++++++++++++++++++---------
 1 file changed, 83 insertions(+), 24 deletions(-)

diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index 92eec38a03aa..6d18b9e448b9 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -289,28 +289,6 @@ struct dma_buf_ops {
 
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
  * The attachment_uid member of @sysfs_entry is protected by dma_resv lock
  * and is incremented on each attach.
  *
@@ -324,24 +302,100 @@ struct dma_buf_ops {
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
@@ -349,7 +403,12 @@ struct dma_buf {
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
-- 
2.32.0.rc2

