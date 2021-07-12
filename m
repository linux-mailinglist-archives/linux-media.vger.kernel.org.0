Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1BF83C4330
	for <lists+linux-media@lfdr.de>; Mon, 12 Jul 2021 06:36:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231793AbhGLEjI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Jul 2021 00:39:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231663AbhGLEjC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Jul 2021 00:39:02 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EC8DC0613DD;
        Sun, 11 Jul 2021 21:36:13 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id p14-20020a17090ad30eb02901731c776526so9690412pju.4;
        Sun, 11 Jul 2021 21:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HkvtxDTuclRkRfTpFmPh6ccETrvYpVzoM2/E6X8XKUc=;
        b=TkFWuvGuG4fZZPRhLWtJVUChMTZQMKiDWsOjFEd94fJHPeV6SmiyctfD9zQTxnnJuK
         RMudC3sRYxeRIskkNkEFScXy9JAbOP57L9jHAfOq5En9oH00ZFlYZsZLs99yYdNAPPGb
         PRDe5Wos02fqSAxIM4RmBwr2gu/scHZaiW8JGlnQtmMUDLL3UGxKE280nxQHEgUdqsFj
         WOiiX5yZRDdaj1wMA6OKvjl1M1TudI5EPJcLXlAp5IgBgGVkbx/aWhmDNjLoSG3XQKXn
         HmhO8tjMlIYyZqLbqTU5oP0GfgMQNB1SgZ0Epx31nTeQWSLcUEY3ppZqFgaINLVhVvVE
         h0mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HkvtxDTuclRkRfTpFmPh6ccETrvYpVzoM2/E6X8XKUc=;
        b=psYE452FiSw4T5f2pbOihtmPKwlRF3p7qIReP03LS38Jql2OfXXjOxqqRpPfv05FJZ
         /y+7V4QrMQ/rPq0jgU1CNlLHPZGuNp0YfQ9qSJHIRuKKHm1aUpYATp5/WASyC2FfPGcK
         Xt7uRqQBnfA7oquQ6QY7elk2eVTCFW2iGCoXjamF8p4QaskUEe0/Gsx79z8srzoAeeuT
         hrKd0mduMJ9oGGjIdSwrAVw2IJk4yFyo3FicblViMaSgaZp83L/ox2DqyKKiZWKbTi+Z
         GSNi/z9Hbg5wFhqiUJ+jEDv25vKZulS5kOgzxp5RP5LpR9EtnFXTvbeXd27ORPxASCZ0
         2LoA==
X-Gm-Message-State: AOAM532xoym07pwjJpn6PSmM2lfX/qBNTjR9OTCCbK2OsUhXGB4ZwT2p
        Ya+C6MkWYSE1jzoAwmCthHc=
X-Google-Smtp-Source: ABdhPJwtA90cYSifrQJwTaSoHydI6hlJwqkehQwc9gGVWpl+Pq7yrX4poeQ4rY4gRfpeWFGPKJLnKw==
X-Received: by 2002:a17:902:fe8b:b029:129:7797:ff4d with SMTP id x11-20020a170902fe8bb02901297797ff4dmr37311850plm.17.1626064572731;
        Sun, 11 Jul 2021 21:36:12 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
        by smtp.gmail.com with ESMTPSA id n3sm14242764pfn.216.2021.07.11.21.36.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jul 2021 21:36:12 -0700 (PDT)
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
Subject: [PATCH v8 4/5] drm: serialize drm_file.master with a new spinlock
Date:   Mon, 12 Jul 2021 12:35:07 +0800
Message-Id: <20210712043508.11584-5-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210712043508.11584-1-desmondcheongzx@gmail.com>
References: <20210712043508.11584-1-desmondcheongzx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Currently, drm_file.master pointers should be protected by
drm_device.master_mutex when being dereferenced. This is because
drm_file.master is not invariant for the lifetime of drm_file. If
drm_file is not the creator of master, then drm_file.is_master is
false, and a call to drm_setmaster_ioctl will invoke
drm_new_set_master, which then allocates a new master for drm_file and
puts the old master.

Thus, without holding drm_device.master_mutex, the old value of
drm_file.master could be freed while it is being used by another
concurrent process.

However, it is not always possible to lock drm_device.master_mutex to
dereference drm_file.master. Through the fbdev emulation code, this
might occur in a deep nest of other locks. But drm_device.master_mutex
is also the outermost lock in the nesting hierarchy, so this leads to
potential deadlocks.

To address this, we introduce a new spin lock at the bottom of the
lock hierarchy that only serializes drm_file.master. With this change,
the value of drm_file.master changes only when both
drm_device.master_mutex and drm_file.master_lookup_lock are
held. Hence, any process holding either of those locks can ensure that
the value of drm_file.master will not change concurrently.

Since no lock depends on the new drm_file.master_lookup_lock, when
drm_file.master is dereferenced, but drm_device.master_mutex cannot be
held, we can safely protect the master pointer with
drm_file.master_lookup_lock.

Reported-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
---
 drivers/gpu/drm/drm_auth.c | 17 +++++++++++------
 drivers/gpu/drm/drm_file.c |  1 +
 include/drm/drm_file.h     | 12 +++++++++---
 3 files changed, 21 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
index ab1863c5a5a0..30a239901b36 100644
--- a/drivers/gpu/drm/drm_auth.c
+++ b/drivers/gpu/drm/drm_auth.c
@@ -164,16 +164,18 @@ static void drm_set_master(struct drm_device *dev, struct drm_file *fpriv,
 static int drm_new_set_master(struct drm_device *dev, struct drm_file *fpriv)
 {
 	struct drm_master *old_master;
+	struct drm_master *new_master;
 
 	lockdep_assert_held_once(&dev->master_mutex);
 
 	WARN_ON(fpriv->is_master);
 	old_master = fpriv->master;
-	fpriv->master = drm_master_create(dev);
-	if (!fpriv->master) {
-		fpriv->master = old_master;
+	new_master = drm_master_create(dev);
+	if (!new_master)
 		return -ENOMEM;
-	}
+	spin_lock(&fpriv->master_lookup_lock);
+	fpriv->master = new_master;
+	spin_unlock(&fpriv->master_lookup_lock);
 
 	fpriv->is_master = 1;
 	fpriv->authenticated = 1;
@@ -332,10 +334,13 @@ int drm_master_open(struct drm_file *file_priv)
 	 * any master object for render clients
 	 */
 	mutex_lock(&dev->master_mutex);
-	if (!dev->master)
+	if (!dev->master) {
 		ret = drm_new_set_master(dev, file_priv);
-	else
+	} else {
+		spin_lock(&file_priv->master_lookup_lock);
 		file_priv->master = drm_master_get(dev->master);
+		spin_unlock(&file_priv->master_lookup_lock);
+	}
 	mutex_unlock(&dev->master_mutex);
 
 	return ret;
diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index d4f0bac6f8f8..ceb1a9723855 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -176,6 +176,7 @@ struct drm_file *drm_file_alloc(struct drm_minor *minor)
 	init_waitqueue_head(&file->event_wait);
 	file->event_space = 4096; /* set aside 4k for event buffer */
 
+	spin_lock_init(&file->master_lookup_lock);
 	mutex_init(&file->event_read_lock);
 
 	if (drm_core_check_feature(dev, DRIVER_GEM))
diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
index b81b3bfb08c8..9b82988e3427 100644
--- a/include/drm/drm_file.h
+++ b/include/drm/drm_file.h
@@ -226,15 +226,21 @@ struct drm_file {
 	/**
 	 * @master:
 	 *
-	 * Master this node is currently associated with. Only relevant if
-	 * drm_is_primary_client() returns true. Note that this only
-	 * matches &drm_device.master if the master is the currently active one.
+	 * Master this node is currently associated with. Protected by struct
+	 * &drm_device.master_mutex, and serialized by @master_lookup_lock.
+	 *
+	 * Only relevant if drm_is_primary_client() returns true. Note that
+	 * this only matches &drm_device.master if the master is the currently
+	 * active one.
 	 *
 	 * See also @authentication and @is_master and the :ref:`section on
 	 * primary nodes and authentication <drm_primary_node>`.
 	 */
 	struct drm_master *master;
 
+	/** @master_lock: Serializes @master. */
+	spinlock_t master_lookup_lock;
+
 	/** @pid: Process that opened this file. */
 	struct pid *pid;
 
-- 
2.25.1

