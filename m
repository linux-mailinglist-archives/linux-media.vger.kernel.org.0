Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A3553B94EC
	for <lists+linux-media@lfdr.de>; Thu,  1 Jul 2021 18:54:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229948AbhGAQ5N (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Jul 2021 12:57:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229987AbhGAQ5M (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Jul 2021 12:57:12 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AF8FC061764;
        Thu,  1 Jul 2021 09:54:41 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id h4so6654845pgp.5;
        Thu, 01 Jul 2021 09:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Hk4Axk4+PmQOI0kATUy1MHuqhx98yhhLacEznPnufxU=;
        b=H5rk+QATHNu5kWtOMCyeQz/AqNtlWNfFVGjFlMSoUBVtW225R0Q/PpLFURKeg94mhQ
         rCIY/kSGGHM+x+dNKOFQIgDVfOKr4dw5QWs3JWWI8vMeEOvEmNyN6sbCXGx7gVpi1nAU
         XPtNr1lZa4yWS+MxXHtIvRzzjLp43ZnK0c7Oqo7FgyxxPaxJiNnXTyTWvsEvN3i9y81F
         FsoBj0sgLAWBaYINyfki4KJxQoGpxQfYTrRmFT1R7lA4cMtPbMbS0OILbsjFnU10owY7
         rj2vUNJz4nHI7wqLayeYTaqLJG2U8Rt/ykXrT4Rqt6dvDc3/vJaVg83yUHe7sLMpYFxW
         zrRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Hk4Axk4+PmQOI0kATUy1MHuqhx98yhhLacEznPnufxU=;
        b=s73ymXK7elR1UIluAiVHh4BYWAbnSfVfMYUwon0VFog6OYxmCq0Z2c3Tuq1Bucl5Cm
         /02kgmk4ff1VMpYoSu49ytR2pGl9uBkQWxHCDrD82vg6WxGuPdCwTIkOpOwv7GA520QJ
         R3T2wSW1rMFUCQDVbCmAjSqBnaBYZucqyFDyKfwG40qeAkmxPVnfZIUZ6N/BTM7ZQ/SW
         UfckCivsyv4fKIzYjTxJEd0lzdVMQcBkqEKXPBoVsJzjSbkj1RA7Snjsgp2Yj5ouPTUa
         F7GaPqW7jp2ew7spy9Z2VcmJx9hpWoMcwUpGFadxQ4hJR8oVmpo5h3LL9TnsmNimMhl8
         VRMQ==
X-Gm-Message-State: AOAM5332jBbgMJSN8fMtWhsFeTMyJ/KKB8y3S43zp37YnfEvABWld6uL
        QklOMQe10wujVWBXEqSykYE=
X-Google-Smtp-Source: ABdhPJwcM4liZfM+/eMxIjvaqJ/4EedP/LLrwHGWzOdveO0AGD90Ae9rpc+eu//8ByUsW1tLKWLiGQ==
X-Received: by 2002:a62:8847:0:b029:30d:4c44:7e99 with SMTP id l68-20020a6288470000b029030d4c447e99mr947138pfd.64.1625158480703;
        Thu, 01 Jul 2021 09:54:40 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
        by smtp.gmail.com with ESMTPSA id s20sm398738pgv.1.2021.07.01.09.54.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jul 2021 09:54:40 -0700 (PDT)
From:   Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To:     maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch,
        sumit.semwal@linaro.org, christian.koenig@amd.com
Cc:     Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
        dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, skhan@linuxfoundation.org,
        gregkh@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        emil.l.velikov@gmail.com, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH v7 2/5] drm: separate locks in __drm_mode_object_find
Date:   Fri,  2 Jul 2021 00:53:55 +0800
Message-Id: <20210701165358.19053-3-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210701165358.19053-1-desmondcheongzx@gmail.com>
References: <20210701165358.19053-1-desmondcheongzx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In a future patch, _drm_lease_held will dereference drm_file->master
only after making a call to drm_file_get_master. This will increment
the reference count of drm_file->master while holding onto a new
drm_file.master_lock.

In preparation for this, the call to _drm_lease_held should be moved
out from the section locked by &dev->mode_config.idr_mutex. This
avoids creating new lock hierarchies between
&dev->mode_config.idr_mutex and &drm_file->master_lock.

Reported-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
---
 drivers/gpu/drm/drm_mode_object.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_mode_object.c b/drivers/gpu/drm/drm_mode_object.c
index b26588b52795..83e35ff3b13a 100644
--- a/drivers/gpu/drm/drm_mode_object.c
+++ b/drivers/gpu/drm/drm_mode_object.c
@@ -146,16 +146,18 @@ struct drm_mode_object *__drm_mode_object_find(struct drm_device *dev,
 	if (obj && obj->id != id)
 		obj = NULL;
 
-	if (obj && drm_mode_object_lease_required(obj->type) &&
-	    !_drm_lease_held(file_priv, obj->id))
-		obj = NULL;
-
 	if (obj && obj->free_cb) {
 		if (!kref_get_unless_zero(&obj->refcount))
 			obj = NULL;
 	}
 	mutex_unlock(&dev->mode_config.idr_mutex);
 
+	if (obj && drm_mode_object_lease_required(obj->type) &&
+	    !_drm_lease_held(file_priv, obj->id)) {
+		drm_mode_object_put(obj);
+		obj = NULL;
+	}
+
 	return obj;
 }
 
-- 
2.25.1

