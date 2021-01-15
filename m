Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E2F62F83E0
	for <lists+linux-media@lfdr.de>; Fri, 15 Jan 2021 19:17:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388574AbhAOSRo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Jan 2021 13:17:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728537AbhAOSRn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Jan 2021 13:17:43 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98DF0C0617BF
        for <linux-media@vger.kernel.org>; Fri, 15 Jan 2021 10:16:47 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id 6so2912779wri.3
        for <linux-media@vger.kernel.org>; Fri, 15 Jan 2021 10:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8ouoNyIGf3M12ncW8jNmga8ZhB/umTlAexno2+hm9vw=;
        b=PN4ofpG3AFQIY2HDhtrxDHd3v0+xd4onwEz7G2/zC+rhfE4HirmzmL3jcXLpUYXBOi
         1hKzvGAxrSr6Dv8cDtBOLdA7LW3HUMbsDnWopgDjwrGvgzeyJHyJwJWkktXJjDTKYn5x
         6sdobPOvJJIR/TrcLU+En4Nb4Sqr3ym2MpFPjZERoM0EqXn73uEydbCIdma4dh+mEVpS
         9T/msFV3PGGbNj49yLhdVehCCKoHHScJgdSAS89oR4U37UhK/tfSoY4zcAxgsB3IEg6M
         gagHknlc1GH0nljzwa8FvQWUO/kBx3xMgu49tE3RqzKT+TqiG4u92puwvRgzcDEP2/vs
         8tag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8ouoNyIGf3M12ncW8jNmga8ZhB/umTlAexno2+hm9vw=;
        b=ijoFAQtc33C5jm6CiE+iPFNhyMc1qpMCquNIgtxpfBu8XB6DGIDYe+5HiwgqMvLps8
         dU0AM3pqPdOkTZkRjKJpoQ6SPM9yq5753ScKqevJ4FAjmpLiNHneR+cv4gNSfBslIDPn
         8EScNTffgxKrWTQLuH6SF1s8+ZeHBSiDCTuZZZ+pZs1QWcB0zjYS9wav8RsGIcVb+OEm
         Ce9qbH7bezKRGmbd/BqngnQ1/BLugpdKdE0uL6UV1lY/JfX2pNMlYCr9SB2EI0z6cKNL
         DH6ikx2V/lmZl8rsuLz2lANl6QnR4VBDsOmng/XCgBZWaz2k9iU8EkC9HDzqFzByqDOJ
         xsPQ==
X-Gm-Message-State: AOAM532H0PsGgnmAmjjEKOwSOA7MdwRxL4yxT+z6iHBxwnLkaeeAXrKX
        bvgv7Dzx3qra0Wr9X+Y2QXou/Q==
X-Google-Smtp-Source: ABdhPJypPfWiZJEwtJ8E9isJbQjNIe0ev/rxFYQX2OcbRtBc5hQl2j1aWEaiYzfS5p/hRAPbYrpcgA==
X-Received: by 2002:adf:ef49:: with SMTP id c9mr10087109wrp.172.1610734606342;
        Fri, 15 Jan 2021 10:16:46 -0800 (PST)
Received: from dell.default ([91.110.221.158])
        by smtp.gmail.com with ESMTPSA id b133sm14405979wme.33.2021.01.15.10.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jan 2021 10:16:45 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        VMware Graphics <linux-graphics-maintainer@vmware.com>,
        Roland Scheidegger <sroland@vmware.com>,
        Zack Rusin <zackr@vmware.com>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Dave Airlie <airlied@redhat.com>,
        Rob Clark <rob.clark@linaro.org>,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
Subject: [PATCH 29/29] drm/vmwgfx/ttm_object: Reorder header to immediately precede its struct
Date:   Fri, 15 Jan 2021 18:16:01 +0000
Message-Id: <20210115181601.3432599-30-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210115181601.3432599-1-lee.jones@linaro.org>
References: <20210115181601.3432599-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Also add missing description for 'refcount'

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/vmwgfx/ttm_object.c:60: error: Cannot parse struct or union!

Cc: VMware Graphics <linux-graphics-maintainer@vmware.com>
Cc: Roland Scheidegger <sroland@vmware.com>
Cc: Zack Rusin <zackr@vmware.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Rob Clark <rob.clark@linaro.org>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/vmwgfx/ttm_object.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/ttm_object.c b/drivers/gpu/drm/vmwgfx/ttm_object.c
index b3fdc630497cb..112394dd0ab6a 100644
--- a/drivers/gpu/drm/vmwgfx/ttm_object.c
+++ b/drivers/gpu/drm/vmwgfx/ttm_object.c
@@ -42,6 +42,14 @@
  */
 
 
+#define pr_fmt(fmt) "[TTM] " fmt
+
+#include <linux/list.h>
+#include <linux/spinlock.h>
+#include <linux/slab.h>
+#include <linux/atomic.h>
+#include "ttm_object.h"
+
 /**
  * struct ttm_object_file
  *
@@ -55,16 +63,9 @@
  *
  * @ref_hash: Hash tables of ref objects, one per ttm_ref_type,
  * for fast lookup of ref objects given a base object.
+ *
+ * @refcount: reference/usage count
  */
-
-#define pr_fmt(fmt) "[TTM] " fmt
-
-#include <linux/list.h>
-#include <linux/spinlock.h>
-#include <linux/slab.h>
-#include <linux/atomic.h>
-#include "ttm_object.h"
-
 struct ttm_object_file {
 	struct ttm_object_device *tdev;
 	spinlock_t lock;
-- 
2.25.1

