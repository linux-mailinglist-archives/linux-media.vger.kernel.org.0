Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7347A3F0721
	for <lists+linux-media@lfdr.de>; Wed, 18 Aug 2021 16:52:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239608AbhHROw6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Aug 2021 10:52:58 -0400
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120]:53694
        "EHLO smtp-relay-canonical-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239503AbhHROw5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Aug 2021 10:52:57 -0400
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id EEE2F418F6
        for <linux-media@vger.kernel.org>; Wed, 18 Aug 2021 14:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1629298341;
        bh=C63KvaJ+cWhAEINSiaxTGMz7FLf9euvtefJ5UKJKvuw=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=Cf1hQJqU5ksYONZ5cTTUkNEOKPmgZ/u1JD5SQdzpvfbtv025NwXmnxR27O6Vt0/aM
         Nb8O3K995JgzWEJ/qr+iVBHX7JLPXkJXLU1hOLaKUt0kIz9jt3T7qF8jP4HLNXua9P
         JKAg1MOFC1AZFaB/GfJi6tSLsy6FaMBBDQziQ7TCC90k+Ze7TZz5ekNzYs70nPz/BH
         2v9j5EJoDVnkj4Wgy59IKyYl2PdQImUIwizOdITuDSbLXJHChMa3GNrrNAHux3ui+s
         AX5YBfiLfg4/ycY8AvA6oJ/C9Yc+gcT4bLlfR3zyNtYxhpmdHH3faviAWwhe9RBBol
         +i6PqaBHMkEjQ==
Received: by mail-pj1-f71.google.com with SMTP id e2-20020a17090a3b8200b001791a53ce87so1423289pjc.0
        for <linux-media@vger.kernel.org>; Wed, 18 Aug 2021 07:52:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=C63KvaJ+cWhAEINSiaxTGMz7FLf9euvtefJ5UKJKvuw=;
        b=ZgajhiF9iTtBQDX+0iD23OJOuxzUz2Okpr3iQOz6SSUatWiOP1FCsuLXRSiJy+5YzI
         9vynhYFCEKKj/6jLj43JA6Lvcqm1xeT7C/C6La82BuUan1cnnxzx+BQHlgWt9rVaIKqy
         ge7rNBG/OPLMUJaO2pTZgTvP70Uj1k6WdodPDanAy0hGvQJfLVQsweMK1uKP3UtHFlMD
         lZV7W2CSvStn+gewubrcJxNiq0SWRkS8Qn5SRO03u2ckJOl85r28z9UE2hrrw0af3HzY
         lTUwr7JD43DNavYDBwAI4bq1gwtkXV0kp1UmsC+bO3A3BxZnhfg4rq2ScUJSqZDQfRQT
         mTEA==
X-Gm-Message-State: AOAM533vrAHvK1rrJjU/XbFBsr/dyjewJ6v3sa8MFrmywjF75mGoQTJJ
        xMDqhA4YqCgmQ7aRDP0LTTuUcCefAwHduaYmHSNr20CGcxgpEM2iJNKyQHVIkAsYVZO4e006o8d
        +tP/UEaEcZED5nXMte0AmJmTUlEAdDLQN142+oXX3
X-Received: by 2002:a17:90a:f314:: with SMTP id ca20mr10053541pjb.210.1629298339357;
        Wed, 18 Aug 2021 07:52:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzIX0xUNdP8jrpWXr9FRIo/5CxYkCcC18au0WkZhrfprpv1h8lb2dEHNI4DzTUBH3RtKFQesg==
X-Received: by 2002:a17:90a:f314:: with SMTP id ca20mr10053525pjb.210.1629298339084;
        Wed, 18 Aug 2021 07:52:19 -0700 (PDT)
Received: from localhost.localdomain ([69.163.84.166])
        by smtp.gmail.com with ESMTPSA id 73sm7331pfz.73.2021.08.18.07.52.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 07:52:18 -0700 (PDT)
From:   Tim Gardner <tim.gardner@canonical.com>
To:     linux-kernel@vger.kernel.org
Cc:     tim.gardner@canonical.com, stable@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH] drm/i915/gem: Avoid NULL dereference in __i915_gem_object_lock()
Date:   Wed, 18 Aug 2021 08:51:59 -0600
Message-Id: <20210818145159.12402-1-tim.gardner@canonical.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Coverity warns of a possible NULL dereference:

Both dma_resv_lock_interruptible() and dma_resv_lock() can return -EDEADLK. Protect
against a NULL dereference by checking for NULL before saving the object pointer. This
is consistent with previous checks for ww==NULL.

Addresses-Coverity: ("Dereference after null check")

Cc: stable@vger.kernel.org
Fixes: 80f0b679d6f0683f23cf98a511af3e44dd509472 ("drm/i915: Add an implementation for i915_gem_ww_ctx locking, v2.")
Cc: kernel-janitors@vger.kernel.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
Signed-off-by: Tim Gardner <tim.gardner@canonical.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_object.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
index 48112b9d76df..3391ca4f662a 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
@@ -187,7 +187,7 @@ static inline int __i915_gem_object_lock(struct drm_i915_gem_object *obj,
 	if (ret == -EALREADY)
 		ret = 0;
 
-	if (ret == -EDEADLK) {
+	if (ret == -EDEADLK && ww) {
 		i915_gem_object_get(obj);
 		ww->contended = obj;
 	}
-- 
2.33.0

