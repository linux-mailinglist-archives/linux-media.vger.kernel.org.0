Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 363BFDEA94
	for <lists+linux-media@lfdr.de>; Mon, 21 Oct 2019 13:15:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728184AbfJULPa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Oct 2019 07:15:30 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:52494 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728119AbfJULPa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Oct 2019 07:15:30 -0400
Received: by mail-wm1-f66.google.com with SMTP id r19so12868090wmh.2
        for <linux-media@vger.kernel.org>; Mon, 21 Oct 2019 04:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=7c5Qzq9KoeAeHZDAZpUJnWCjxxzWTWUy42GlQzoDXV0=;
        b=HSOPmb5Mmgc4EWngj+Xfe3rtVV7heQZosok7UrRHMB33Pd7lRsZqElsgybATdAb1Di
         6rzbSIh81Xiz0aLQSg6daozUrYKexTTIXpBjFfJKtyEnwJ1ybuVQE/GirIvb1SlWe89+
         dkFS8MMOG4DtJGguTymO7Ewcl/PI60apRJIEkohJp3OkEpLrbhbuPyoIHH1snw+etvPV
         HWdyu0LyGdOOIYBPHpNbRIf/+eS9aFU71au4MVPyk/mmm8fJuiFHq6ETd960GQGYDWzV
         nc0o+6UTIDgbo/iIyijmnRyNwdJk7syJ2cJouwk2yf7W/9PoXxDYZi5nFapyHQPIevcQ
         6Evw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7c5Qzq9KoeAeHZDAZpUJnWCjxxzWTWUy42GlQzoDXV0=;
        b=rS1ypOR8IrmNW6sG4bng1PhqYqWS1Er2qDDXoyQWLkcW8HiiUcrwRA/3XuxxERZpc1
         E6GjAak6rYC37+l4eYUKM8213FXWeFZVcd5bRDak4wOzWfRYad4vStzjGmUapryEfjZJ
         k6XyojW3hTihJ3d2K1oWKV+u/OEyToWB50E9AxC+BYVFD4sJsnJi6tSlBZJsZ4qqwr7v
         gPfXY88ookGkm+1N4IA8JVSm/GcWjkt13bdD6xWPDUo2Df+ln+ers89GzDUFMM/CHf9c
         ld6Lm29dWo09moyMHc2H5E/2ZiaCESPNZHpH9Q5Sr3XOiOs5Egzam6tdZmZmvJUdK0xz
         R8GQ==
X-Gm-Message-State: APjAAAXATZB2plyHnqp6aTXTXliw1vnXcK3h4tKAXDv+mapHTuPqs1Yd
        e9ooAUgVl2EAAukeH3b6hoY=
X-Google-Smtp-Source: APXvYqxW81KRS6pTbAx1n00iEXUv6tQFsMzKCBICUSmt+H08oQcDhMvCeGT/1W/4ZZq6o1rbXHhWtQ==
X-Received: by 2002:a1c:e912:: with SMTP id q18mr19108187wmc.29.1571656528599;
        Mon, 21 Oct 2019 04:15:28 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:c194:dd41:4bef:70cc])
        by smtp.gmail.com with ESMTPSA id l9sm13152415wme.45.2019.10.21.04.15.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2019 04:15:28 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     dri-devel@lists.freedesktop.org, sumit.semwal@linaro.org,
        linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
        intel-gfx@lists.freedesktop.org, daniel@ffwll.ch
Subject: [PATCH 2/4] dma-buf: stop using the dmabuf->lock so much
Date:   Mon, 21 Oct 2019 13:15:22 +0200
Message-Id: <20191021111524.14793-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191021111524.14793-1-christian.koenig@amd.com>
References: <20191021111524.14793-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The attachment list is now protected by the dma_resv object.
So we can drop holding this lock to allow concurrent attach
and detach operations.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-buf.c | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 753be84b5fd6..c736e67ae1a1 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -685,8 +685,6 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
 	attach->dmabuf = dmabuf;
 	attach->dynamic_mapping = dynamic_mapping;
 
-	mutex_lock(&dmabuf->lock);
-
 	if (dmabuf->ops->attach) {
 		ret = dmabuf->ops->attach(dmabuf, attach);
 		if (ret)
@@ -696,8 +694,6 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
 	list_add(&attach->node, &dmabuf->attachments);
 	dma_resv_unlock(dmabuf->resv);
 
-	mutex_unlock(&dmabuf->lock);
-
 	/* When either the importer or the exporter can't handle dynamic
 	 * mappings we cache the mapping here to avoid issues with the
 	 * reservation object lock.
@@ -726,7 +722,6 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
 
 err_attach:
 	kfree(attach);
-	mutex_unlock(&dmabuf->lock);
 	return ERR_PTR(ret);
 
 err_unlock:
@@ -776,14 +771,12 @@ void dma_buf_detach(struct dma_buf *dmabuf, struct dma_buf_attachment *attach)
 			dma_resv_unlock(attach->dmabuf->resv);
 	}
 
-	mutex_lock(&dmabuf->lock);
 	dma_resv_lock(dmabuf->resv, NULL);
 	list_del(&attach->node);
 	dma_resv_unlock(dmabuf->resv);
 	if (dmabuf->ops->detach)
 		dmabuf->ops->detach(dmabuf, attach);
 
-	mutex_unlock(&dmabuf->lock);
 	kfree(attach);
 }
 EXPORT_SYMBOL_GPL(dma_buf_detach);
@@ -1247,14 +1240,6 @@ static int dma_buf_debug_show(struct seq_file *s, void *unused)
 		   "size", "flags", "mode", "count", "ino");
 
 	list_for_each_entry(buf_obj, &db_list.head, list_node) {
-		ret = mutex_lock_interruptible(&buf_obj->lock);
-
-		if (ret) {
-			seq_puts(s,
-				 "\tERROR locking buffer object: skipping\n");
-			continue;
-		}
-
 		seq_printf(s, "%08zu\t%08x\t%08x\t%08ld\t%s\t%08lu\t%s\n",
 				buf_obj->size,
 				buf_obj->file->f_flags, buf_obj->file->f_mode,
@@ -1307,7 +1292,6 @@ static int dma_buf_debug_show(struct seq_file *s, void *unused)
 
 		count++;
 		size += buf_obj->size;
-		mutex_unlock(&buf_obj->lock);
 	}
 
 	seq_printf(s, "\nTotal %d objects, %zu bytes\n", count, size);
-- 
2.17.1

