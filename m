Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 628E81644C2
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2020 13:59:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727581AbgBSM7U (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Feb 2020 07:59:20 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:40443 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726622AbgBSM7T (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Feb 2020 07:59:19 -0500
Received: by mail-wr1-f68.google.com with SMTP id t3so405767wru.7
        for <linux-media@vger.kernel.org>; Wed, 19 Feb 2020 04:59:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=8j5/kNs2THmmZJqIvqiDhfvU0TM48N+fj+MtL6vI19M=;
        b=J4WuRD16ngxEYmlnmMZAPVtqDQR3v1UPhrNxwbM3kx6kfUAbP95toCxkG26rF22r/A
         YmWIuME+ClLuCKh3VUUGQHNXuoVNeMLjhQ3yCWwMufYEqHLYewCUfvRPiixifWVrdyqp
         qvhDZFNyGX+oZGNyvsWiMVYNRPPSbEdUTtnNMMpBlirxuT1XVmB6wd2iR4o3LfHQRQGK
         bIYXaasns0YTpZocppiC1WLyLOXpuUMNAiJsaPilNu1edG+BnBwkQC3hlQgnzerG7r6r
         wYD+UG1ftj33FpQVURyyfcaqSCo1VzofJmgTodBOCOFi71nOnEbG3trCNbmjhMsExJs+
         SLJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8j5/kNs2THmmZJqIvqiDhfvU0TM48N+fj+MtL6vI19M=;
        b=iJ9Coy5ZlK7DgQWigGJfvbz3fBpbiAOWUyZoyUHK1hg8BaDVapJaALVzF6iD6anxcv
         sCkTtPrMf7MSt9kWGhGUq6U3PuSIvjHdAoD7jMK7+4rXRcJIDTj6cT/m+iXWG/HHE3dn
         Qz4o9bsSl/q+wNw0m0d+Hb3ww5O7CnfbHHZHVMlAk5gS5xCZnGGoWBnFd9Ow3LT2CdKm
         koLaCDtIaMaxI08l/8DO9JByx6tC8osy5C1yNs4gJKVv6HoUtzRClZGgrr4E8csjpeOc
         QzjpTLSdLE8eZQZxbyYjXSFAGrUZ2+IT60Qlx241EyjOhK2/2d5YsePPRdOwYclNiiiD
         ab/w==
X-Gm-Message-State: APjAAAXK/yGTqJWU56Y+eFHBaKCh4qmXt70OeUyiIocgsAtcA6DPt3BJ
        tRp4weHNEhIUq8AsZJj5Lnc=
X-Google-Smtp-Source: APXvYqyccjbJFlo0ApV1/Ph6tQqkttn13pN8Qrc+oUbYn50TU/Ft80EhI7pYqS8u1nGZCY4dlwAULw==
X-Received: by 2002:a5d:4a89:: with SMTP id o9mr34478332wrq.32.1582117156928;
        Wed, 19 Feb 2020 04:59:16 -0800 (PST)
Received: from abel.fritz.box ([2a02:908:1252:fb60:90ea:9d7:18a3:895e])
        by smtp.gmail.com with ESMTPSA id h2sm3079024wrt.45.2020.02.19.04.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2020 04:59:16 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        daniel@ffwll.ch
Subject: [PATCH 7/7] dma-buf: make move_notify mandatory if importer_ops are provided
Date:   Wed, 19 Feb 2020 13:59:10 +0100
Message-Id: <20200219125910.89147-7-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200219125910.89147-1-christian.koenig@amd.com>
References: <20200219125910.89147-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This makes the move_notify callback mandatory when the importer_ops are
provided. Since amdgpu is now migrated it doesn't make much sense
anymore to allow this.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-buf.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 6d0a82d1b23d..f4ace9af2191 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -677,10 +677,12 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
 	struct dma_buf_attachment *attach;
 	int ret;
 
-	/* TODO: make move_notify mandatory if importer_ops are provided. */
 	if (WARN_ON(!dmabuf || !dev))
 		return ERR_PTR(-EINVAL);
 
+	if (WARN_ON(importer_ops && !importer_ops->move_notify))
+		return ERR_PTR(-EINVAL);
+
 	attach = kzalloc(sizeof(*attach), GFP_KERNEL);
 	if (!attach)
 		return ERR_PTR(-ENOMEM);
@@ -877,8 +879,7 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
 
 	if (dma_buf_is_dynamic(attach->dmabuf)) {
 		dma_resv_assert_held(attach->dmabuf->resv);
-		if (!attach->importer_ops->move_notify ||
-		    !IS_ENABLED(CONFIG_DMABUF_MOVE_NOTIFY)) {
+		if (!IS_ENABLED(CONFIG_DMABUF_MOVE_NOTIFY)) {
 			r = dma_buf_pin(attach);
 			if (r)
 				return ERR_PTR(r);
@@ -890,8 +891,7 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
 		sg_table = ERR_PTR(-ENOMEM);
 
 	if (IS_ERR(sg_table) && dma_buf_is_dynamic(attach->dmabuf) &&
-	    (!attach->importer_ops->move_notify ||
-	     !IS_ENABLED(CONFIG_DMABUF_MOVE_NOTIFY)))
+	     !IS_ENABLED(CONFIG_DMABUF_MOVE_NOTIFY))
 		dma_buf_unpin(attach);
 
 	if (!IS_ERR(sg_table) && attach->dmabuf->ops->cache_sgt_mapping) {
@@ -934,8 +934,7 @@ void dma_buf_unmap_attachment(struct dma_buf_attachment *attach,
 	attach->dmabuf->ops->unmap_dma_buf(attach, sg_table, direction);
 
 	if (dma_buf_is_dynamic(attach->dmabuf) &&
-	    (!attach->importer_ops->move_notify ||
-	     !IS_ENABLED(CONFIG_DMABUF_MOVE_NOTIFY)))
+	    !IS_ENABLED(CONFIG_DMABUF_MOVE_NOTIFY))
 		dma_buf_unpin(attach);
 }
 EXPORT_SYMBOL_GPL(dma_buf_unmap_attachment);
@@ -955,7 +954,7 @@ void dma_buf_move_notify(struct dma_buf *dmabuf)
 	dma_resv_assert_held(dmabuf->resv);
 
 	list_for_each_entry(attach, &dmabuf->attachments, node)
-		if (attach->importer_ops && attach->importer_ops->move_notify)
+		if (attach->importer_ops)
 			attach->importer_ops->move_notify(attach);
 }
 EXPORT_SYMBOL_GPL(dma_buf_move_notify);
-- 
2.17.1

