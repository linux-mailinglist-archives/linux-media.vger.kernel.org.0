Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86684257296
	for <lists+linux-media@lfdr.de>; Mon, 31 Aug 2020 06:17:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725810AbgHaERN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 Aug 2020 00:17:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725298AbgHaERM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 Aug 2020 00:17:12 -0400
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5897EC061573;
        Sun, 30 Aug 2020 21:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=l7zHHSgVYZKrffQxrdTFyOTG+QENbp5RKlVsgMYUtWU=; b=ayc5ubh3K4AA3qftWiN44cL37f
        OyZpAzP5TAzZrmsKdY56NEgKl5l91VuBgcyc73c4bmOyiP+nTxAiov7XbL71CbwH/eYjAfAZQDdd6
        EhftUKKJ0NxjX4GBv6pglPUGCubtQsl0GVzhSkimEoaRyU07aFkjr4A94fweSQY4QFOFBKWyyOdva
        L5qvlUiFQWetB7K8Fl6Y3f/odtBzptW/8btie+qhZlSfFZlEpDlKtZza1es8DmgJUu9NiK4v8Q52F
        ARyCFaCGJiiDBq9jtQFI/RYqpMFuTarRaZFDin4FXrYjSUmZ/8UMVOMtQAMetYS2KGjaaCAMc434k
        eorrJ4mw==;
Received: from [2601:1c0:6280:3f0:897c:6038:c71d:ecac] (helo=smtpauth.infradead.org)
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kCbFe-00063Z-0T; Mon, 31 Aug 2020 04:17:06 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Gustavo Padovan <gustavo@padovan.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] dma-buf: fix kernel-doc warning in <linux/dma-buf.h>
Date:   Sun, 30 Aug 2020 21:16:55 -0700
Message-Id: <20200831041655.29796-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix kernel-doc warning in <linux/dma-buf.h>:

../include/linux/dma-buf.h:330: warning: Function parameter or member 'name_lock' not described in 'dma_buf'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Gustavo Padovan <gustavo@padovan.org>
Cc: Christian König <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
---
 include/linux/dma-buf.h |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

--- lnx-59-rc3.orig/include/linux/dma-buf.h
+++ lnx-59-rc3/include/linux/dma-buf.h
@@ -283,6 +283,7 @@ struct dma_buf_ops {
  * @exp_name: name of the exporter; useful for debugging.
  * @name: userspace-provided name; useful for accounting and debugging,
  *        protected by @resv.
+ * @name_lock: spinlock to protect name access
  * @owner: pointer to exporter module; used for refcounting when exporter is a
  *         kernel module.
  * @list_node: node for dma_buf accounting and debugging.
@@ -311,7 +312,7 @@ struct dma_buf {
 	void *vmap_ptr;
 	const char *exp_name;
 	const char *name;
-	spinlock_t name_lock; /* spinlock to protect name access */
+	spinlock_t name_lock;
 	struct module *owner;
 	struct list_head list_node;
 	void *priv;
