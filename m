Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27C3F398CEF
	for <lists+linux-media@lfdr.de>; Wed,  2 Jun 2021 16:33:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231463AbhFBOfV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Jun 2021 10:35:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231381AbhFBOfR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Jun 2021 10:35:17 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20BDFC061763
        for <linux-media@vger.kernel.org>; Wed,  2 Jun 2021 07:33:34 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id l18-20020a1ced120000b029014c1adff1edso3916111wmh.4
        for <linux-media@vger.kernel.org>; Wed, 02 Jun 2021 07:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JvuBm7KpIXmVjvwi2OsKGMdogxy/zdINv8FqDSEvNYM=;
        b=nH1tswbv/dRTxAbMVL2oQ+YkAIasGdidijupRDL7c3sCfVwK+oNtIhOPL0xok9gzVW
         t5+ceR05rXZ7uMo2uFij6BvFfqXaDmi0JMWGswWKDBNIILG5hLPYn20T6fCzdxolvyPX
         +XTqGQ5X5YYinYoN2/mYvDaKDcYXM0/IDw799rIPSAk/3ROkjHPygpnIc7Z8qekh7XqF
         ANhYI2NCG0tckEoHP506uUWeO9SDw2dESxg+EJ8Be80RUywMFpYsHwunvITnn9pQm8V5
         0tiSbn6+yxv5bdePKcmjb5leSF3Dh/kD4YgCPLWnT+gapDJbriqm67BYzq1bujgpWvBm
         NwKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JvuBm7KpIXmVjvwi2OsKGMdogxy/zdINv8FqDSEvNYM=;
        b=jm3VJROXGvYxN8OMxS7QxJtiBqj17214mdGWgKGDAhcR7qUuN08TBK19q9U1khnLw8
         eezzBxznohrWBfLHhTbtI8MTOjH/ov7HLuDr3PAVPqZ/TNXT7CC0o7nGql+3GDzDwtBk
         5LPn1lIEbNWoVGj4y8I8PPulVhV0jzl7nYqCavBdu8NCgRhRsATU5tW7MStU5/q3Q+nw
         evxjkNhbpVohGzh0t4YbQL9Lkkn81utBvx0t/EAKRWDLRynkXf5CYQ6d9iqeI0k45dCj
         K8uB+jbmmhFZZnCQT4xYXRCPFW2oypdM/QeWSsEkgyyM46J21s+3KB3NJ7bus2D4WrwU
         c2xQ==
X-Gm-Message-State: AOAM533euYphMD/ZKaWRvb7Kv04Ytc806UExmktqRt3WO3JPyxKE4Hag
        G04biptMgjgQjI9eJplLHN9AAQ==
X-Google-Smtp-Source: ABdhPJyUgla3FFfynuCl+ad/SpJvdCBqRlxX5f3USSzH6/SPYgduUsfipkbdGBvQZ5pWNouc43kgzw==
X-Received: by 2002:a1c:41c5:: with SMTP id o188mr5498913wma.60.1622644412785;
        Wed, 02 Jun 2021 07:33:32 -0700 (PDT)
Received: from dell.default ([91.110.221.214])
        by smtp.gmail.com with ESMTPSA id o11sm132315wrq.93.2021.06.02.07.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 07:33:32 -0700 (PDT)
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
Subject: [RESEND 22/26] drm/vgem/vgem_drv: Standard comment blocks should not use kernel-doc format
Date:   Wed,  2 Jun 2021 15:32:56 +0100
Message-Id: <20210602143300.2330146-23-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210602143300.2330146-1-lee.jones@linaro.org>
References: <20210602143300.2330146-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/vgem/vgem_drv.c:47: warning: expecting prototype for This is vgem, a (non-hardware(). Prototype was for DRIVER_NAME() instead

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
2.31.1

