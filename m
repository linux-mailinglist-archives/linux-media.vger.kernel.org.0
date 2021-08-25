Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABADB3F7707
	for <lists+linux-media@lfdr.de>; Wed, 25 Aug 2021 16:23:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240863AbhHYOXp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Aug 2021 10:23:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241036AbhHYOXo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Aug 2021 10:23:44 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 014A0C061757;
        Wed, 25 Aug 2021 07:22:59 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id m4so3397503pll.0;
        Wed, 25 Aug 2021 07:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Hm7YjUyiFZ/KTSC9DbXmgQsGRHrND7m8Eh1agHCitnc=;
        b=k+GysfSjIWxaeFpMWXEW70CHCxabynmbSUFpULjFZkftd2rn6FzxdMF05C9LmNxWfe
         +d8hxVMq3yDhInnXryEtKfWPdPQLemk3KP756hoVvWEF2lpK85MdQbWHiK5LBDyeSzQm
         NI+u2Sg7V1Pktz0mX9zWclmqWf2vknHz1+RrG05KhgVEmvx1j+Fp6DUaPjVmINpVYZI4
         rcuV2WvIJUhQHoQamtttbWBb0HaLGRsmJ126qSUUqiORDC35rcqFD1PemBuRy+G1RLJt
         BWnjb+rlC6BzH1YfYwaEmo16PpPReYnF+h81OUWDneg7bqprFjaTnF7GMy5zCleuYv/s
         sLuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Hm7YjUyiFZ/KTSC9DbXmgQsGRHrND7m8Eh1agHCitnc=;
        b=Pgmy9h3hzTR2BQzjzoc3fqV4J1wgzqxJ95shynIdH6jvpYiSfBCgVSzzVL1K3Aizi8
         006ozT0Du0MjT02iup+wZTrs1DR6RvO3Y1kwqn8f3On9d0eBOxGZvHK9OgqWp6kZRGXk
         Px0Vp+6q2i1CueQZIcXxsFZpBwDs0yYpbpyq1V6d/5QTTn/Rtwi0vw0Q5ukGULALKySe
         qfSVWDnejOqr8jjxYXloldTgFH1XJ7kjDlJGi0iz2+4U3DJN4sB4hzLbz5vdM67mWjnv
         Rg0/be9f2+4WOXMfsSFhgE5rO71ImTgF3UbY9Kfbkda98Stflc5WuyvraHuGf8p3FVyI
         z1/A==
X-Gm-Message-State: AOAM530GKzZl4qLMvuijk1HVMZ/lztUBSyx0STwlh2XMK2hI3tQM6uMc
        HuxCYM77FiLyqd2DGXS/ygk=
X-Google-Smtp-Source: ABdhPJzIubD9FPop7NQZanviMDcIiYhCzOvMZbwQlFymS0HacFKXyrLLR/sMgaiXsFhxBSOVixneFw==
X-Received: by 2002:a17:902:b717:b029:11a:fae3:ba7c with SMTP id d23-20020a170902b717b029011afae3ba7cmr37665670pls.28.1629901378595;
        Wed, 25 Aug 2021 07:22:58 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
        by smtp.gmail.com with ESMTPSA id n3sm54431pfo.101.2021.08.25.07.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Aug 2021 07:22:58 -0700 (PDT)
From:   Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To:     maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch,
        sumit.semwal@linaro.org, christian.koenig@amd.com,
        jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
        rodrigo.vivi@intel.com, chris@chris-wilson.co.uk,
        ville.syrjala@linux.intel.com, matthew.auld@intel.com,
        dan.carpenter@oracle.com, tvrtko.ursulin@intel.com,
        matthew.d.roper@intel.com, lucas.demarchi@intel.com,
        karthik.b.s@intel.com, jose.souza@intel.com,
        manasi.d.navare@intel.com, airlied@redhat.com,
        aditya.swarup@intel.com, andrescj@chromium.org,
        linux-graphics-maintainer@vmware.com, zackr@vmware.com
Cc:     Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        intel-gfx@lists.freedesktop.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, skhan@linuxfoundation.org,
        gregkh@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH v7 1/7] drm: fix null ptr dereference in drm_master_release
Date:   Wed, 25 Aug 2021 22:21:59 +0800
Message-Id: <20210825142205.1376789-2-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210825142205.1376789-1-desmondcheongzx@gmail.com>
References: <20210825142205.1376789-1-desmondcheongzx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

drm_master_release can be called on a drm_file without a master, which
results in a null ptr dereference of file_priv->master->magic_map. The
three cases are:

1. Error path in drm_open_helper
  drm_open():
    drm_open_helper():
      drm_master_open():
        drm_new_set_master(); <--- returns -ENOMEM,
                                   drm_file.master not set
      drm_file_free():
        drm_master_release(); <--- NULL ptr dereference
                                   (file_priv->master->magic_map)

2. Error path in mock_drm_getfile
  mock_drm_getfile():
    anon_inode_getfile(); <--- returns error, drm_file.master not set
    drm_file_free():
      drm_master_release(); <--- NULL ptr dereference
                                 (file_priv->master->magic_map)

3. In drm_client_close, as drm_client_open doesn't set up a master

drm_file.master is set up in drm_open_helper through the call to
drm_master_open, so we mirror it with a call to drm_master_release in
drm_close_helper, and remove drm_master_release from drm_file_free to
avoid the null ptr dereference.

Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
---
 drivers/gpu/drm/drm_file.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index ed25168619fc..90b62f360da1 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -282,9 +282,6 @@ void drm_file_free(struct drm_file *file)
 
 	drm_legacy_ctxbitmap_flush(dev, file);
 
-	if (drm_is_primary_client(file))
-		drm_master_release(file);
-
 	if (dev->driver->postclose)
 		dev->driver->postclose(dev, file);
 
@@ -305,6 +302,9 @@ static void drm_close_helper(struct file *filp)
 	list_del(&file_priv->lhead);
 	mutex_unlock(&dev->filelist_mutex);
 
+	if (drm_is_primary_client(file_priv))
+		drm_master_release(file_priv);
+
 	drm_file_free(file_priv);
 }
 
-- 
2.25.1

