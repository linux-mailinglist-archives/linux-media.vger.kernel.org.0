Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC6A6287341
	for <lists+linux-media@lfdr.de>; Thu,  8 Oct 2020 13:24:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729795AbgJHLXr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Oct 2020 07:23:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725871AbgJHLXr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Oct 2020 07:23:47 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9470C061755;
        Thu,  8 Oct 2020 04:23:46 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id x1so5457014eds.1;
        Thu, 08 Oct 2020 04:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=JsjjPHzjofiTjxIZU4zLpu7KElZkR0RdFNQVI4MgOuI=;
        b=Cf1RVSf2Wd5WKqBEQe/s36QG8XPfHBaG2UWWLmc7AROqUPPPQzryQaYWEUL3oqek8t
         bJAWEG3kKcAlgth9M38k2B/Nt+MG9IFqUTNhiYyms9eyVbvr8NcfwpPUj/XllhPiA0lR
         CEOK7HNJLYHG2ro7ZcBAavoxQL+en5L6fLiIqlSMlj8iywTFoAQE8nxzlrsyLbgjMxpi
         aofcNv/eTwnrxMk1doVKqyCl2Lzj63kYoISdf1LGyZfeO4qxt1PCfDKoVBAEDuVy+NFE
         Aa5I9mDCi/xhlOeDfBYRqyWBA93TrkNz+9HNhzXjHl+Z5vLOKICpcpqiYFyy5VDMaDh4
         4ZPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JsjjPHzjofiTjxIZU4zLpu7KElZkR0RdFNQVI4MgOuI=;
        b=IIaUkMpXCMrL5pKAm2RqqRZORERWa+aSKvmiM+bdas3S3HPFsKQtiDkJF2lkLf1vRC
         Y+6Rzr03yaaAFaJYjgn23QtRL/1ktFZL/praZLVqksABaJ3pvtlC0CXOiOisO7RfOsQx
         EacX/Lzxs2PmUa1HuMYPvrdkLZsinZNPWgIB/F2tovMwFWRbJUh2tP0wrfDbrRhLC+s/
         y8lJUfer63WSphgbXLF7G8h0nCeBkRrUfEVR6ndaIrLtUykRxp9SbC/x1PvYHROVbzYM
         PryXM/rsE8abaYfpB0E07wyAbMW6WpN/TeM0qg0x3da1TDOccurWooNwzGoAC1ImF5MX
         LKNw==
X-Gm-Message-State: AOAM531mFLHs3G0sS4mPisGkksbAUg/nInjT+xdautEHR11JERYUmntt
        2IhJuDIl13iMaNxrCT7Z2Po=
X-Google-Smtp-Source: ABdhPJwDRyJHE6THipTubGPFIEhicDT26J0ZkLEqMYptkgqx4YSyy8HXoku93odOoEECNMopX74sdQ==
X-Received: by 2002:aa7:c7c2:: with SMTP id o2mr8673537eds.366.1602156225590;
        Thu, 08 Oct 2020 04:23:45 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:4c64:a9a0:5e0:905a])
        by smtp.gmail.com with ESMTPSA id i20sm3529030edv.96.2020.10.08.04.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2020 04:23:45 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, chris@chris-wilson.co.uk,
        airlied@redhat.com, akpm@linux-foundation.org, daniel@ffwll.ch,
        sumit.semwal@linaro.org
Subject: [PATCH 2/4] drm/prime: document that use the page array is deprecated
Date:   Thu,  8 Oct 2020 13:23:40 +0200
Message-Id: <20201008112342.9394-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201008112342.9394-1-christian.koenig@amd.com>
References: <20201008112342.9394-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

We have reoccurring requests on this so better document that
this approach doesn't work and dma_buf_mmap() needs to be used instead.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/drm_prime.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index 4910c446db83..16fa2bfc271e 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -956,7 +956,7 @@ EXPORT_SYMBOL(drm_gem_prime_import);
 /**
  * drm_prime_sg_to_page_addr_arrays - convert an sg table into a page array
  * @sgt: scatter-gather table to convert
- * @pages: optional array of page pointers to store the page array in
+ * @pages: deprecated array of page pointers to store the page array in
  * @addrs: optional array to store the dma bus address of each page
  * @max_entries: size of both the passed-in arrays
  *
@@ -965,6 +965,11 @@ EXPORT_SYMBOL(drm_gem_prime_import);
  *
  * Drivers can use this in their &drm_driver.gem_prime_import_sg_table
  * implementation.
+ *
+ * Specifying the pages array is deprecated and strongly discouraged for new
+ * drivers. The pages array is only useful for page faults and those can
+ * corrupt fields in the struct page if they are not handled by the exporting
+ * driver.
  */
 int drm_prime_sg_to_page_addr_arrays(struct sg_table *sgt, struct page **pages,
 				     dma_addr_t *addrs, int max_entries)
-- 
2.17.1

