Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36C463622CE
	for <lists+linux-media@lfdr.de>; Fri, 16 Apr 2021 16:51:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244789AbhDPOip (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Apr 2021 10:38:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244589AbhDPOi2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Apr 2021 10:38:28 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9DA1C061756
        for <linux-media@vger.kernel.org>; Fri, 16 Apr 2021 07:38:02 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id e7so32475802edu.10
        for <linux-media@vger.kernel.org>; Fri, 16 Apr 2021 07:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=I7F+9DKjv4pSxsjZ8Q4NSxZmBv+NpIxPJbgx2acVLUU=;
        b=xUDIIJR/cLuzx29sMHGLZuOY6AlLTmEc1nYFSxBrGbSXcio6hSFL/Qj5My76RSIH9v
         2TVRPRZTGDZUYukol3Rrr41enxdOCl2w6ae1LlUjfQIp52cn4Hk2ugldcUdfREVUpYyz
         kZ6hBID8yhhVWiYsfLKSwy6p+Exx+V2kxGKoycf7iPUKdzeESN2WkGwvJXSEBud644PT
         I1eg02i76GgWn9puwVkudV9PSwN4mqxmZSc2KqQQyAigrLRsCAImTh+iComP6NC+Xxhc
         HL9krOFybdi4KocyKW5QMBdfBRmX3gL/dmsrCmFfgH13kdZ2wxyGx18f2ddaKZn4iXVK
         ppfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=I7F+9DKjv4pSxsjZ8Q4NSxZmBv+NpIxPJbgx2acVLUU=;
        b=sgSVoO0dcvW1Wmvxw1Yny7jmkOwXXjmQI3cCzW34P1B3+EWTVLh5FsbBogkVoG/4AL
         es2IKdS7Jup13fjtk2F8KHSV8vELMDB8ZNo/UkZwA0sgWJB/e+2m5EHlU/2fBIJrkGA9
         S8PEWHZJusorg+rcOu9uIowEaqyzjnByWrRaNQeKtsVoPYz1fWPydqbyQHxcQnuOm2uw
         SxboaHHTjl4tYyDGL7qmosiAuw0fKWaCjVrBMN2NPWW5X4yXvR+DutjzpYgA1UEWIQVd
         9fMwDRY6JXs5ndVXQLw324ssJlUpPGuFg6ev1go9bP3FyuxbUjN2cexOAZnlL7ETrb9a
         Nzhw==
X-Gm-Message-State: AOAM531Cwtkd22XhR8QWbzkbUB6a9L6iMUFomXJcJ/WTOlRc34tyIpRh
        hatPUccu7ScfIWbtYeLm9knjkA==
X-Google-Smtp-Source: ABdhPJwNxKANqCbAqE4qRNcZ6coZt9d+It6wnNQh5h1d63Ti//CSPf5MsoYyaoVv1NgeAQygdGWyLA==
X-Received: by 2002:a05:6402:3550:: with SMTP id f16mr10261727edd.134.1618583881703;
        Fri, 16 Apr 2021 07:38:01 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id j10sm1326523ejk.93.2021.04.16.07.38.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Apr 2021 07:38:01 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Adam Jackson <ajax@redhat.com>,
        Ben Widawsky <ben@bwidawsk.net>,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
Subject: [PATCH 30/40] drm/vgem/vgem_drv: Demote kernel-doc abuse
Date:   Fri, 16 Apr 2021 15:37:15 +0100
Message-Id: <20210416143725.2769053-31-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210416143725.2769053-1-lee.jones@linaro.org>
References: <20210416143725.2769053-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/vgem/vgem_drv.c:29: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst

Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: Adam Jackson <ajax@redhat.com>
Cc: Ben Widawsky <ben@bwidawsk.net>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/vgem/vgem_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vgem/vgem_drv.c b/drivers/gpu/drm/vgem/vgem_drv.c
index a0e75f1d5d016..bf38a7e319d14 100644
--- a/drivers/gpu/drm/vgem/vgem_drv.c
+++ b/drivers/gpu/drm/vgem/vgem_drv.c
@@ -25,7 +25,7 @@
  *	Ben Widawsky <ben@bwidawsk.net>
  */
 
-/**
+/*
  * This is vgem, a (non-hardware-backed) GEM service.  This is used by Mesa's
  * software renderer and the X server for efficient buffer sharing.
  */
-- 
2.27.0

