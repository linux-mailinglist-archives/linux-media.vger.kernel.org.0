Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E45E38209B
	for <lists+linux-media@lfdr.de>; Mon,  5 Aug 2019 17:45:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728058AbfHEPp7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Aug 2019 11:45:59 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:40635 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727259AbfHEPp7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Aug 2019 11:45:59 -0400
Received: by mail-wr1-f67.google.com with SMTP id r1so84861114wrl.7
        for <linux-media@vger.kernel.org>; Mon, 05 Aug 2019 08:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=rLPPYENgOoc631NZg5ylujQ9Ww/Oy03mgWH9mA4Vfho=;
        b=uUMttogETRTbgFeSAW6AxRt+C/hSaMGFvi3mp332QoCPwvz8IWurSQBJyJZOR7bOeh
         t3ZG8sKWLHmomyK1KkW6laa+1rkPlb2s6S7QLjGuLHIGU6mFCWzgKyX03MYFGac/PX3f
         3FnoVZBhJNwniqasz7bjYzRcYHCGc7RShvCwvYl0KzWBYFpbx0kyIORqWht2191zBDHz
         Y3CTXzhkS44iwXBeQLT+vO4Z5kzpL6G5vo9DrLaozfCFZvMs+Wn9RBp8yQaEa0EJxXMd
         qPMg93CgzwNyEG7odpHdapiM1CXQ7Ke1wCd5xjdaY8/jfeVjVAiB9Ij2vv4o2WHx0ycg
         FPkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rLPPYENgOoc631NZg5ylujQ9Ww/Oy03mgWH9mA4Vfho=;
        b=G4GeJ8Ujej8hiPxTJ+mRMAJ0TgYOqBIZWbO+pm5nW3PX4T4GnAusjojbEd0CVK+iyX
         uBMNhANH4i265PyqITa4ujsjHBsSKGfgJMxfV4+vaLHd1cWNHv2ZkLFPHrBHOScbhmir
         /QRc/m32C2/6bPN2xwn9O6IOYApRZp0cT+Ipu9Bk2/oyPoTtSjgtQ48vKf36xVpyh7DL
         XZL7wrNcNu19oR9KY+aEsueEmXfYzTv/OczyJRINkMav8bvo8sIr00AvBr0v1JmwU3vQ
         kzO/A4i5Eq4NOMHT9P/JV3CdvRBBnD528940890jkiXOdJwfIqQlI8yDuPE1NhGCdkhe
         1qnw==
X-Gm-Message-State: APjAAAWsMSSCsdGeojAj6+/bZlPRzsM2n/yX04dEDCxOfidTsHSh47hI
        6W6DjTot4L5A00xmtmHzRUBsJ45J
X-Google-Smtp-Source: APXvYqzBprTtDw6edlmqIDiUmJARW7G/OtGF/lCyUR20zOiLqI+2QZmZi/Tqpnx0vU3E2ILqGfvMww==
X-Received: by 2002:a5d:564e:: with SMTP id j14mr1799712wrw.1.1565019957178;
        Mon, 05 Aug 2019 08:45:57 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:fdbd:6233:4990:5a8d])
        by smtp.gmail.com with ESMTPSA id 91sm171836865wrp.3.2019.08.05.08.45.56
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Aug 2019 08:45:56 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     intel-gfx@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        chris@chris-wilson.co.uk
Subject: [PATCH 2/5] dma-buf: fix busy wait for new shared fences
Date:   Mon,  5 Aug 2019 17:45:51 +0200
Message-Id: <20190805154554.3476-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190805154554.3476-1-christian.koenig@amd.com>
References: <20190805154554.3476-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When reservation_object_add_shared_fence is replacing an old fence with a new
one we should not drop the old one before the new one is in place.

Otherwise other cores can busy wait for the new one to appear.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/reservation.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/dma-buf/reservation.c b/drivers/dma-buf/reservation.c
index c71b85c8c159..d59207ca72d2 100644
--- a/drivers/dma-buf/reservation.c
+++ b/drivers/dma-buf/reservation.c
@@ -196,6 +196,7 @@ void reservation_object_add_shared_fence(struct reservation_object *obj,
 					 struct dma_fence *fence)
 {
 	struct reservation_object_list *fobj;
+	struct dma_fence *old;
 	unsigned int i, count;
 
 	dma_fence_get(fence);
@@ -209,18 +210,16 @@ void reservation_object_add_shared_fence(struct reservation_object *obj,
 	write_seqcount_begin(&obj->seq);
 
 	for (i = 0; i < count; ++i) {
-		struct dma_fence *old_fence;
 
-		old_fence = rcu_dereference_protected(fobj->shared[i],
-						      reservation_object_held(obj));
-		if (old_fence->context == fence->context ||
-		    dma_fence_is_signaled(old_fence)) {
-			dma_fence_put(old_fence);
+		old = rcu_dereference_protected(fobj->shared[i],
+						reservation_object_held(obj));
+		if (old->context == fence->context ||
+		    dma_fence_is_signaled(old))
 			goto replace;
-		}
 	}
 
 	BUG_ON(fobj->shared_count >= fobj->shared_max);
+	old = NULL;
 	count++;
 
 replace:
@@ -230,6 +229,7 @@ void reservation_object_add_shared_fence(struct reservation_object *obj,
 
 	write_seqcount_end(&obj->seq);
 	preempt_enable();
+	dma_fence_put(old);
 }
 EXPORT_SYMBOL(reservation_object_add_shared_fence);
 
-- 
2.17.1

