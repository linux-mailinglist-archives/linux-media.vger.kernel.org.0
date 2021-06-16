Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23A993A94EC
	for <lists+linux-media@lfdr.de>; Wed, 16 Jun 2021 10:27:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231481AbhFPI3I (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Jun 2021 04:29:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231468AbhFPI3I (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Jun 2021 04:29:08 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C22AC06175F
        for <linux-media@vger.kernel.org>; Wed, 16 Jun 2021 01:27:01 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id s15so1512945edt.13
        for <linux-media@vger.kernel.org>; Wed, 16 Jun 2021 01:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=bAUQPXbSkvT19k/XhsYs0cmL8Bgj7Ny0WAGbdIQQDHQ=;
        b=HxP9msOguWQ3QrHteS08n9aIIpmSVL0B0jsiRk4MJRbL7uofgZCKCoapjNf/2kiwdk
         6Pb3l1Fc9AAZ/VCA3EHdMq5afGHtPvdGX2GUQdVJ0cKXTwGUpQJWgaUhzC0OOXYMGMs2
         JbdyCuOMZpj8iV/WG+xz7zoV7SR38QcnQ9FBNgOimACUD0REuMD5SPbZyBucGx/w2Vpj
         gDk4kQBGE5BXa6AxcD7Q5IgG8RSE/JYkxUGv+IjtKZYbgR5iko6rgwhIsOid1X8SXd9o
         RfsKcaUNJD8eByyW4wemDj68FQ/qrYOOCUsR3cTTWq04Y1TPeEorHNbttrukQnr3h8k0
         wXbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bAUQPXbSkvT19k/XhsYs0cmL8Bgj7Ny0WAGbdIQQDHQ=;
        b=rRAsqSQM9hqKy5+Bde7TU4o6/4XDDKrPokS0fxc0foWXM4CFOc17RMDH8oA5/bpjyW
         4DloIlanXtYZ4vjtpGfADpvX2HGNproE7AvVjeHUg8zoF0ClZwMMyJGJ+wtGjqWdbNl0
         axe9vTNH/NjuX+NspYMfBgKTFwdPqoR8x0riMmpjcRUrUOP0oOTqyC6jpuVPwnzGS9tW
         J4jypXGRWpYXssWUNThFgcMt+njsTGe+MJbpU3tn7y97xdn7aWcLnSYP6PCEjIL/N1ii
         aziaZZA/v+ndwVsVEyU5soRJedXO10WmzceJr63WXhSRqyrxpjjkzazXTdEFB1Rhublo
         CM3g==
X-Gm-Message-State: AOAM530Abzf6On8zsBDaVfN05MrT6z5KuKJzfVfxUq/mbp8w/DDHq1Bq
        eXxb0YqHx/2qrslMJ2IL9ZY=
X-Google-Smtp-Source: ABdhPJwuv9+M+3+hOg8rwV487BVcNbOkILX2dYfgDgwmpTEez1b9S9OjYK3Etjby1E1nrcMXGLnRog==
X-Received: by 2002:aa7:cd77:: with SMTP id ca23mr2794529edb.259.1623832019927;
        Wed, 16 Jun 2021 01:26:59 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:8b88:17a4:582b:121f])
        by smtp.gmail.com with ESMTPSA id v7sm1152639edx.38.2021.06.16.01.26.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 01:26:59 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
        sumit.semwal@linaro.org
Subject: [PATCH 1/7] dma-buf: add some more kerneldoc to dma_resv_add_shared_fence
Date:   Wed, 16 Jun 2021 10:26:49 +0200
Message-Id: <20210616082655.111001-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210616082655.111001-1-christian.koenig@amd.com>
References: <20210616082655.111001-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Explicitly document that code can't assume that shared fences
signal after the exclusive fence.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-resv.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index f26c71747d43..4ab02b6c387a 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -235,7 +235,10 @@ EXPORT_SYMBOL(dma_resv_reset_shared_max);
  * @fence: the shared fence to add
  *
  * Add a fence to a shared slot, obj->lock must be held, and
- * dma_resv_reserve_shared() has been called.
+ * dma_resv_reserve_shared() has been called. The shared fences can signal in
+ * any order and there is especially no guarantee that shared fences signal
+ * after the exclusive one. Code relying on any signaling order is broken and
+ * needs to be fixed.
  */
 void dma_resv_add_shared_fence(struct dma_resv *obj, struct dma_fence *fence)
 {
-- 
2.25.1

