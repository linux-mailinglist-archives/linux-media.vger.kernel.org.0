Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C371E3B8586
	for <lists+linux-media@lfdr.de>; Wed, 30 Jun 2021 16:55:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235675AbhF3O6W (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Jun 2021 10:58:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235177AbhF3O6W (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Jun 2021 10:58:22 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59BD3C061768;
        Wed, 30 Jun 2021 07:55:52 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id pf4-20020a17090b1d84b029016f6699c3f2so4479906pjb.0;
        Wed, 30 Jun 2021 07:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7TptsW5OQ3GR+u/tITdCBbefhDZ5KPjgj9kl0duGn/0=;
        b=jQMcYfmo4WOy762+XlXq7rREStvEn1K/QbSMcETHOaImZDMR6TV8ygdhXa4cDZQhA2
         SFEOD/Ken2OZVNKzwUGscD4H1Wn0L6dYPUVM3B+ON0AfnAhbAEeh8lb4Wu8C36bsnU59
         SA0z3caBP7tlt9vECTP+aPMUnQlX37E5u4gu0vG7NEn7J5zFwhqgVf+biiNr8aCnVBln
         bzCgj9RFB/v0jMtUFdOgjkhanDDI6HmeUoKdFqohEWrZKz8tf01y6CI/yXjVhp6OMaef
         3CwRMFzak934JJTSNqZdrAnmp3iTkOHLfRpmQhpmffIbDOtF8LQgDL8nJdEHtAWdbQAb
         mXlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7TptsW5OQ3GR+u/tITdCBbefhDZ5KPjgj9kl0duGn/0=;
        b=jJtLM5pD4ZTiKQNQ0x+yiH7VHOryo0uAYQ+r6kXrZZ2aQfeTRf7sHY4X04JTaWWnwZ
         xqZhHttXNym0bnXc7+byNamBLGqTv/gnhUnmF5wTTj4OuSDl41RxXByP9Ji/DnQaHbZW
         85SlxgXc1jiX+pxJ7W9E3mAmvdexiL26kXO4cMt6M26G+Vu+3MbaJipwD8G3VNJvMZkN
         lL4mJc1Z+c25QIjjATdvTsL4ZwF5EqjZPPvJXBZM/ahhvUS77jGqvP36SvpL+5q4P1uC
         ShzknBvaiZ8nYcpO3Kg/foeuTlCticJePAKd8Rp0owkS/rKFfFQ+q7OEmV3ZND68EUYP
         0D2w==
X-Gm-Message-State: AOAM532IPMc8wD+f+1I2VmgdrX1qlohE1UFrN9/ub3D30KMSelv9cA3i
        g0H5+KZxcID33oWEFZh6Fis=
X-Google-Smtp-Source: ABdhPJzlakShd++NdtFkoi8/aMmEkS+Gpz+BqRr8GgeXQvHyNR1eldpRvcZf+RI+EEcYEAP/mljnpw==
X-Received: by 2002:a17:90b:19d4:: with SMTP id nm20mr4798973pjb.134.1625064951982;
        Wed, 30 Jun 2021 07:55:51 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
        by smtp.gmail.com with ESMTPSA id d13sm7157234pjr.49.2021.06.30.07.55.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jun 2021 07:55:51 -0700 (PDT)
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
        emil.l.velikov@gmail.com
Subject: [PATCH v6 2/4] drm: avoid circular locks in __drm_mode_object_find
Date:   Wed, 30 Jun 2021 22:54:02 +0800
Message-Id: <20210630145404.5958-3-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210630145404.5958-1-desmondcheongzx@gmail.com>
References: <20210630145404.5958-1-desmondcheongzx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In a future patch, _drm_lease_held will dereference drm_file->master
only after making a call to drm_file_get_master which increments the
reference count of drm_file->master while holding a lock on
drm_device.master_mutex.

In preparation for this, the call to _drm_lease_held should be moved
out from the section locked by &dev->mode_config.idr_mutex. This
avoids inverting the lock hierarchy for
&dev->master_mutex --> &dev->mode_config.idr_mutex

Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
---
 drivers/gpu/drm/drm_mode_object.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_mode_object.c b/drivers/gpu/drm/drm_mode_object.c
index b26588b52795..63d35f1f98dd 100644
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
+		!_drm_lease_held(file_priv, obj->id)) {
+		drm_mode_object_put(obj);
+		obj = NULL;
+	}
+
 	return obj;
 }
 
-- 
2.25.1

