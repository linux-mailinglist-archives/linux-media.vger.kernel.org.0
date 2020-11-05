Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57ACE2A818E
	for <lists+linux-media@lfdr.de>; Thu,  5 Nov 2020 15:53:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731498AbgKEOwa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Nov 2020 09:52:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731365AbgKEOw0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Nov 2020 09:52:26 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA4EBC0613CF
        for <linux-media@vger.kernel.org>; Thu,  5 Nov 2020 06:52:24 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id p1so2074563wrf.12
        for <linux-media@vger.kernel.org>; Thu, 05 Nov 2020 06:52:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AjBPdz+8mpzbEfzyqGKPlE/9r69QMe/kgLbI+X7lVik=;
        b=tS6RccjZm9XFR5PPPsKzjHr+15rT9c+pyaaKa3oTIxSSg9rigM8R5GtZ2ZewHuhAV7
         AT0G632//S8OZXZ+wVHiTMC/QIX2O1WgL4uDqgp/PSws2NlL1q3zu7SXfBypJKiLlZeK
         txrVBNiBYyQqWcP2pUTDkip2KylIpRWprckhw71bLvqYqT0EOAC+LlAM6+2r4g7mSi1u
         YuaXoVDSY4HdHu+GwAbkn7hGmf6z8pWvKGsXczqFA5afKn9UlCZkPuUqQIdSTycoQbur
         +xgLPhv63tlBwL2YnXN9XED9/yi4orIo/qxH9gHJrKbkjb++yFurjXlMY6/z4VKiglFQ
         1enQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AjBPdz+8mpzbEfzyqGKPlE/9r69QMe/kgLbI+X7lVik=;
        b=DsttvnVLrlLyqayt7Kqul5ZZSGK1S6wrTs3o/CCNLRY6LwFN9fp0PHWJmMbeS7ZeBx
         IBsD6DLYyBvA+UHJEUvHa599mJfITylBOlzUQv+YW4sr+9s6HspS985B05e/fOI3ZwK6
         uaHs/ri3dNXr+STE9f5nKScqwBaNA4iEGHVrfm1FCw9hREvHoQ1sAqtcmKRRm+8sfwU6
         szC8+OTTIni/bD6hHTbeFFQ2grL/b9/J0J/ytGZRiG5K+v6C0YISzFKRFD7MqxN8EfjD
         xbpQFhnBJNNe2JgC9JTLo9vVBzxDELZ0eYA5ulukvoIzTlUYM1Uj1GUTTGmJW36g23x1
         TyjA==
X-Gm-Message-State: AOAM53134bA7m6xHilXZ9vFhWPsYoKSASlYEq5Zuta4MsjjqOmkALs/g
        wZtNy+lRwCemQ2yzgObQ2SxIaQ==
X-Google-Smtp-Source: ABdhPJyRWm95rr/rrX+vwzMrA+OAGQ0bPe8HoSoQw05klN+IufG2gMUpauu6wrD4P4hiQLXPg7q2Xg==
X-Received: by 2002:adf:9150:: with SMTP id j74mr3666874wrj.57.1604587943605;
        Thu, 05 Nov 2020 06:52:23 -0800 (PST)
Received: from dell.default ([91.110.221.242])
        by smtp.gmail.com with ESMTPSA id f5sm2631243wmh.16.2020.11.05.06.52.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2020 06:52:22 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Nirmoy Das <nirmoy.aiemd@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
Subject: [PATCH 07/19] gpu: drm: scheduler: sched_entity: Demote non-conformant kernel-doc headers
Date:   Thu,  5 Nov 2020 14:45:05 +0000
Message-Id: <20201105144517.1826692-8-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201105144517.1826692-1-lee.jones@linaro.org>
References: <20201105144517.1826692-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/scheduler/sched_entity.c:316: warning: Function parameter or member 'f' not described in 'drm_sched_entity_clear_dep'
 drivers/gpu/drm/scheduler/sched_entity.c:316: warning: Function parameter or member 'cb' not described in 'drm_sched_entity_clear_dep'
 drivers/gpu/drm/scheduler/sched_entity.c:330: warning: Function parameter or member 'f' not described in 'drm_sched_entity_wakeup'
 drivers/gpu/drm/scheduler/sched_entity.c:330: warning: Function parameter or member 'cb' not described in 'drm_sched_entity_wakeup'

Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Nirmoy Das <nirmoy.aiemd@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/scheduler/sched_entity.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index f8ec277a6aa85..c1ac3e4003c6f 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -308,7 +308,7 @@ void drm_sched_entity_destroy(struct drm_sched_entity *entity)
 }
 EXPORT_SYMBOL(drm_sched_entity_destroy);
 
-/**
+/*
  * drm_sched_entity_clear_dep - callback to clear the entities dependency
  */
 static void drm_sched_entity_clear_dep(struct dma_fence *f,
@@ -321,7 +321,7 @@ static void drm_sched_entity_clear_dep(struct dma_fence *f,
 	dma_fence_put(f);
 }
 
-/**
+/*
  * drm_sched_entity_clear_dep - callback to clear the entities dependency and
  * wake up scheduler
  */
-- 
2.25.1

