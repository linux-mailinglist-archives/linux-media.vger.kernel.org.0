Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85D963B94F1
	for <lists+linux-media@lfdr.de>; Thu,  1 Jul 2021 18:54:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232511AbhGAQ5Z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Jul 2021 12:57:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229987AbhGAQ5Z (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Jul 2021 12:57:25 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 113A9C061762;
        Thu,  1 Jul 2021 09:54:54 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id 17so6200360pfz.4;
        Thu, 01 Jul 2021 09:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=a/frhO6FmtYyjDjb4pEipIaBwOJXfhDMByIQ78NnCHs=;
        b=TCW+FmOiZG+i+Z/ZlOr4Z4hcJh9xukuhv0/R3u0l56bjD/mt47x8ru3BiFnaysVube
         BOUcvz1JQgMxOHNt0IWw3jlnPvMxWXA1DfutI6KdoBQhgOpDF3ctqkcr+4i+xDB4xu5b
         yYgdSENSWRrO1Auokd1gD8y1w94GkqMSBdWRsTXZuJqY3x9dtRRLYuZ5nCZBiN2LiT/w
         9Rfo9A9aw1K0zLKHVq5WupUS16wTSTwPpmesf8COEpqYZULJvGvTyrK1CnWv/V+OaPvC
         mWaDw6zsuAuTEjutPfyaN3GDLdFd/GuWlGJ1zdqrLedQT3+rppzgkjbzWV+C+xPnWSL+
         xZ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=a/frhO6FmtYyjDjb4pEipIaBwOJXfhDMByIQ78NnCHs=;
        b=B20SnFDmdLTeWvURO1UIiz4yXVafCKnpu2Z2cGCLzeNQXq+0NCuEd7vqAZUG2R7B1h
         mHcNUvfifDCG2MZDPKHjdJqJLj1NqGcCCoCgznt/YH+SNl4h/jAlUJn8DXcuHozW+Ysp
         a8eOMgUt3QZmvMltOagQTJimU6+eLsJVHrSK9t6cYin9gd2mtpp0SjIaruPqEpksYOR0
         EqpNu3xwDPzuTwS3MFkpdIcTIrFi5LSCzEnzHbJpGmDuSXITPycllTCvRybSqd2P56cb
         KXJQZj/tCK5fFd/eY0mnn4qaBi+3GtqEgHKH+q7oPPnVgpZH+Llq2RdKH0BYTZKSyt+f
         B4og==
X-Gm-Message-State: AOAM533HJ7R6Q+lXvE3RhiH9nXQvRq0Akshv53pZFxVG4+2LdWWp06xn
        qrJP5x+8L8JX8EtTFMX0dgU=
X-Google-Smtp-Source: ABdhPJwE3OxMy8uOFmjcS/bajY7yrTC64aL5hOZ8sTBWSSVzlSL/vKTNf2leR7iswBH2WOcYCpq88g==
X-Received: by 2002:a63:65c5:: with SMTP id z188mr555583pgb.174.1625158493587;
        Thu, 01 Jul 2021 09:54:53 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
        by smtp.gmail.com with ESMTPSA id s20sm398738pgv.1.2021.07.01.09.54.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jul 2021 09:54:53 -0700 (PDT)
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
Subject: [PATCH v7 4/5] drm: serialize drm_file.master with a master lock
Date:   Fri,  2 Jul 2021 00:53:57 +0800
Message-Id: <20210701165358.19053-5-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210701165358.19053-1-desmondcheongzx@gmail.com>
References: <20210701165358.19053-1-desmondcheongzx@gmail.com>
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

To address this, we introduce a new mutex at the bottom of the lock
hierarchy that only serializes drm_file.master. With this change, the
value of drm_file.master changes only when both
drm_device.master_mutex and drm_file.master_lock are held. Hence, any
process holding either of those locks can ensure that the value of
drm_file.master will not change concurrently.

Since no lock depends on the new drm_file.master_lock, when
drm_file.master is dereferenced, but drm_device.master_mutex cannot be
held, we can safely protect the master pointer with
drm_file.master_lock.

Reported-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
---

Since our lock inversions were a result of dev->master_mutex being
used to serialize many other things, perhaps a finer grained lock will
solve the lockdep issues.

 drivers/gpu/drm/drm_auth.c | 10 ++++++++--
 drivers/gpu/drm/drm_file.c |  1 +
 include/drm/drm_file.h     | 12 +++++++++---
 3 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
index ab1863c5a5a0..fe5b6adc6133 100644
--- a/drivers/gpu/drm/drm_auth.c
+++ b/drivers/gpu/drm/drm_auth.c
@@ -169,11 +169,14 @@ static int drm_new_set_master(struct drm_device *dev, struct drm_file *fpriv)
 
 	WARN_ON(fpriv->is_master);
 	old_master = fpriv->master;
+	mutex_lock(&fpriv->master_lock);
 	fpriv->master = drm_master_create(dev);
 	if (!fpriv->master) {
 		fpriv->master = old_master;
+		mutex_unlock(&fpriv->master_lock);
 		return -ENOMEM;
 	}
+	mutex_unlock(&fpriv->master_lock);
 
 	fpriv->is_master = 1;
 	fpriv->authenticated = 1;
@@ -332,10 +335,13 @@ int drm_master_open(struct drm_file *file_priv)
 	 * any master object for render clients
 	 */
 	mutex_lock(&dev->master_mutex);
-	if (!dev->master)
+	if (!dev->master) {
 		ret = drm_new_set_master(dev, file_priv);
-	else
+	} else {
+		mutex_lock(&file_priv->master_lock);
 		file_priv->master = drm_master_get(dev->master);
+		mutex_unlock(&file_priv->master_lock);
+	}
 	mutex_unlock(&dev->master_mutex);
 
 	return ret;
diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index d4f0bac6f8f8..8ccadfa1c752 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -176,6 +176,7 @@ struct drm_file *drm_file_alloc(struct drm_minor *minor)
 	init_waitqueue_head(&file->event_wait);
 	file->event_space = 4096; /* set aside 4k for event buffer */
 
+	mutex_init(&file->master_lock);
 	mutex_init(&file->event_read_lock);
 
 	if (drm_core_check_feature(dev, DRIVER_GEM))
diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
index b81b3bfb08c8..88539f93fc8e 100644
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
+	 * &drm_device.master_mutex, and serialized by @master_lock.
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
+	struct mutex master_lock;
+
 	/** @pid: Process that opened this file. */
 	struct pid *pid;
 
-- 
2.25.1

