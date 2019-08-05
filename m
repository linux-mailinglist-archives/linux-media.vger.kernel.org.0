Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71F428209C
	for <lists+linux-media@lfdr.de>; Mon,  5 Aug 2019 17:46:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728086AbfHEPqA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Aug 2019 11:46:00 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:38997 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727460AbfHEPqA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Aug 2019 11:46:00 -0400
Received: by mail-wr1-f67.google.com with SMTP id x4so31735092wrt.6
        for <linux-media@vger.kernel.org>; Mon, 05 Aug 2019 08:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=v306sfwUGIVnriTquF2KCh9r0qG80xENrZcYr3yv41A=;
        b=RPl/cWr4ICJ1bdX1iZkG7X25CTPpq5Ar/WW0HcJ9gh5rqtkdD6q+0gjm3pYy80LHB7
         ELw9Df1MB3ZM5DzXGQtjdAMPwyex8IiqdGKjuXDxFrQJJiog8knuUUCzGlQJkSJcylCN
         f6E625dTHPgYBXlqgrWGSayMZAOiXy9+KK4OP95Z7YdHJOXPvABdeursdLsGzp/xy5xx
         GN51bL/l/g3eajCja5cX2Mxp5mshzDQhFo/u1rKNq67lnuK0zeaPUW0EHObGBXr90fte
         cM1CkFfovDVjZ9WVP3wjmAgeQQhpPI9AXl0WHYSzW8KxOqc2Gwi+OhPu7VHmdfjfoovC
         YuMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=v306sfwUGIVnriTquF2KCh9r0qG80xENrZcYr3yv41A=;
        b=JZTRWp/uEvmwVW4nxb/gmnryw4SGL4mtKdkjIeqQOVzXNxthtLYBmSKgIap0zH8yIC
         HeDkPmaAnme9ACsvLvks9EdV/+gNoguYaFH9Z7CGNsRCrKgxVjQBja3IAzlKceBCdVzZ
         8KgWHMbbHFLS78N2f//d/18kPaczb1/t2oncn6goq/foYx40P+gwuXyBCHSFxw8gjN0Y
         YvRubR7WosUfEQ21iZfBW/VFO+6LPgbyO1xem79ZPeHC1pUrQBtyX4ZV6dVNxqaPedCG
         oYXsvCOEOe3dpxmeSlJTHkH70ogz5fWSPgwdCNZCxgzJTlLUz5/E0Z1OfKv0joBHBCVS
         pVdQ==
X-Gm-Message-State: APjAAAX5pb7Pt5rH8gKQuBgLR4Fe9qVwT7fO7h2GOAkDOJBaQJcaKWR9
        TMXzqlvzcKArUW5Db6AJgkc=
X-Google-Smtp-Source: APXvYqyiVh4JW9BAxeQmV7Ga2Y/xwkIkFOdeQDansqXZR5hzlhxtXw4izgVGV95M9bxc9zQCbGMijQ==
X-Received: by 2002:a5d:4090:: with SMTP id o16mr6149082wrp.292.1565019958047;
        Mon, 05 Aug 2019 08:45:58 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:fdbd:6233:4990:5a8d])
        by smtp.gmail.com with ESMTPSA id 91sm171836865wrp.3.2019.08.05.08.45.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Aug 2019 08:45:57 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     intel-gfx@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        chris@chris-wilson.co.uk
Subject: [PATCH 3/5] dma-buf: further relax reservation_object_add_shared_fence
Date:   Mon,  5 Aug 2019 17:45:52 +0200
Message-Id: <20190805154554.3476-3-christian.koenig@amd.com>
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

Other cores don't busy wait any more and we removed the last user of checking
the seqno for changes. Drop updating the number for shared fences altogether.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/reservation.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/dma-buf/reservation.c b/drivers/dma-buf/reservation.c
index d59207ca72d2..6eaca469005f 100644
--- a/drivers/dma-buf/reservation.c
+++ b/drivers/dma-buf/reservation.c
@@ -206,9 +206,6 @@ void reservation_object_add_shared_fence(struct reservation_object *obj,
 	fobj = reservation_object_get_list(obj);
 	count = fobj->shared_count;
 
-	preempt_disable();
-	write_seqcount_begin(&obj->seq);
-
 	for (i = 0; i < count; ++i) {
 
 		old = rcu_dereference_protected(fobj->shared[i],
@@ -226,9 +223,6 @@ void reservation_object_add_shared_fence(struct reservation_object *obj,
 	RCU_INIT_POINTER(fobj->shared[i], fence);
 	/* pointer update must be visible before we extend the shared_count */
 	smp_store_mb(fobj->shared_count, count);
-
-	write_seqcount_end(&obj->seq);
-	preempt_enable();
 	dma_fence_put(old);
 }
 EXPORT_SYMBOL(reservation_object_add_shared_fence);
-- 
2.17.1

