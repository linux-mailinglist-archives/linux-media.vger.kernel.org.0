Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F82D3DD470
	for <lists+linux-media@lfdr.de>; Mon,  2 Aug 2021 13:01:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233362AbhHBLBh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Aug 2021 07:01:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233421AbhHBLBa (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Aug 2021 07:01:30 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 832A1C06175F;
        Mon,  2 Aug 2021 04:01:21 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id t3so17088590plg.9;
        Mon, 02 Aug 2021 04:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9wyMs+rwX3ldqcYresSOjD4BweaQ/WnMH4Ky/VQDi2I=;
        b=Yc4FE9YjAWr9IC8sdF1L1QTKHbzv2l3QIYmiEecRKbBNneolptr9Pi3XzZU6rwfZCT
         8O0thjHeEkHK3L1/Txx+ji8Mr513dnL+bfZDMwJt3YYdHu/09mkh0DkeVbUXrIisv81F
         7YMYsvks+POltFmWXjm8TqCHeKU721PxvWx25P0sezJAC1cu2Kmi+w494F480GQ/FSHx
         ZSNFgsT45n6tUDl/ryzLi3U5pAvlm1nCCmxwKgvGjhO5XHayaPGgh8OVwCCgex6V1p10
         Isix8qFvOdtIwT36o1vcheb0yZayKW2fHYdpg9VklB8YLMQ+Gj0nlp/wRjfrxfM8ga9f
         KDHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9wyMs+rwX3ldqcYresSOjD4BweaQ/WnMH4Ky/VQDi2I=;
        b=haq3757bHnC46PBKVQOl1LfZgX2T3bK1FHU/+HHlqjZRE71VcY5XRZ+aDfFjxFty7i
         98Rp5pMWcnF5iMjEoFZF1r7zF7ldOvmPSFn7TQG/OHNUroYGXYxdC/HPTg2IE+IGMbdZ
         Pr8nkEM9QKTAvhgqAprQIaPJ6sFUH1CfFCT1khwdaHYxvVWjWB/NiV6b6pvrLhvIkaHW
         mcjCYT/AWs+852axmdDLf0QPoxypDd1xjOAYumYQFMRcCB5p6EmFI3m4/pgXWeQr4saq
         p2m5q8/GbhrGvVUFpEaVeTDBvsTKZGhpk4jxHn9PsTntCSLP6sCIY1NbDKQ8cTpm08Yj
         KPLA==
X-Gm-Message-State: AOAM532El1KyQUG7gvo0MRYm/9SjVvcVTJ/b1qhcnx400A5W80vKW0hN
        TLu5fWOygg8lpjIYKykn5LQ=
X-Google-Smtp-Source: ABdhPJw3Zis0PZJdPsYef4VhN3d7rrLIYlB75L7nQeFiLyBly19H2n3lL4vzH8obKhGcJddjQi2ppw==
X-Received: by 2002:a65:6a0a:: with SMTP id m10mr2267519pgu.145.1627902081017;
        Mon, 02 Aug 2021 04:01:21 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
        by smtp.gmail.com with ESMTPSA id v30sm9709158pgk.25.2021.08.02.04.01.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Aug 2021 04:01:20 -0700 (PDT)
From:   Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To:     maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch,
        peterz@infradead.org, mingo@redhat.com, will@kernel.org,
        longman@redhat.com, boqun.feng@gmail.com, sumit.semwal@linaro.org,
        christian.koenig@amd.com
Cc:     Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        intel-gfx@lists.freedesktop.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, skhan@linuxfoundation.org,
        gregkh@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: [RESEND PATCH v2 2/2] drm: add lockdep assert to drm_is_current_master_locked
Date:   Mon,  2 Aug 2021 18:59:57 +0800
Message-Id: <20210802105957.77692-3-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210802105957.77692-1-desmondcheongzx@gmail.com>
References: <20210802105957.77692-1-desmondcheongzx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In drm_is_current_master_locked, accessing drm_file.master should be
protected by either drm_file.master_lookup_lock or
drm_device.master_mutex. This was previously awkward to assert with
lockdep.

Following patch ("locking/lockdep: Provide lockdep_assert{,_once}()
helpers"), this assertion is now convenient. So we add in the
assertion and explain this lock design in the kerneldoc.

Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Acked-by: Boqun Feng <boqun.feng@gmail.com>
Acked-by: Waiman Long <longman@redhat.com>
Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 drivers/gpu/drm/drm_auth.c | 6 +++---
 include/drm/drm_file.h     | 4 ++++
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
index 9c24b8cc8e36..6f4d7ff23c80 100644
--- a/drivers/gpu/drm/drm_auth.c
+++ b/drivers/gpu/drm/drm_auth.c
@@ -63,9 +63,9 @@
 
 static bool drm_is_current_master_locked(struct drm_file *fpriv)
 {
-	/* Either drm_device.master_mutex or drm_file.master_lookup_lock
-	 * should be held here.
-	 */
+	lockdep_assert_once(lockdep_is_held(&fpriv->master_lookup_lock) ||
+			    lockdep_is_held(&fpriv->minor->dev->master_mutex));
+
 	return fpriv->is_master && drm_lease_owner(fpriv->master) == fpriv->minor->dev->master;
 }
 
diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
index 726cfe0ff5f5..a3acb7ac3550 100644
--- a/include/drm/drm_file.h
+++ b/include/drm/drm_file.h
@@ -233,6 +233,10 @@ struct drm_file {
 	 * this only matches &drm_device.master if the master is the currently
 	 * active one.
 	 *
+	 * To update @master, both &drm_device.master_mutex and
+	 * @master_lookup_lock need to be held, therefore holding either of
+	 * them is safe and enough for the read side.
+	 *
 	 * When dereferencing this pointer, either hold struct
 	 * &drm_device.master_mutex for the duration of the pointer's use, or
 	 * use drm_file_get_master() if struct &drm_device.master_mutex is not
-- 
2.25.1

