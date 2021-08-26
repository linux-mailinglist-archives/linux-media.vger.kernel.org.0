Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F3B83F802F
	for <lists+linux-media@lfdr.de>; Thu, 26 Aug 2021 04:02:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237096AbhHZCDE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Aug 2021 22:03:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237024AbhHZCDC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Aug 2021 22:03:02 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F5ADC0613C1;
        Wed, 25 Aug 2021 19:02:16 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id u11-20020a17090adb4b00b00181668a56d6so1195447pjx.5;
        Wed, 25 Aug 2021 19:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Hm7YjUyiFZ/KTSC9DbXmgQsGRHrND7m8Eh1agHCitnc=;
        b=eL86sOSM38lNhD9QERUYW9QJOWqzwM9yMC5ODYSiS76jzKuzhpocylCwBl3NYLBrhn
         CeZZ4obH8pfh7ioTZINC44g6DS/7JTSqG0kgSxGe9myG/dr2y8wVsOgoBI+/pKmRnBeM
         I3kuQlSagQ+4bgPn4qboJAwIyFgI3YNHtEYvxollzFxBLnnpDmI8mUFXPVAMvkAjB15T
         8BYytvAIw9PXoJ7uR0L0hE+3UX56DgQ39jwoAEkDoqWst2RDm09ZvG7KzJxL69ttDEfN
         1moZPEAzMaCIbqb/GuJFOkzzdjqLI0J/MayaGM/DIJ+Il2kFxUyqRptnbPkIYceKYwfM
         hWdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Hm7YjUyiFZ/KTSC9DbXmgQsGRHrND7m8Eh1agHCitnc=;
        b=DK0LBr/iGhfI9rmWFN1IJIM9iEIWFnFg5dY3TT/GbRNiT1sGF1V20NMqti5VgsRFDU
         DdaFhSCfa9VStQhr1ZNrhx3YDV1TpnYv9zKvhEBK8S3swlsqfBfyAxALqnf5FG4k+1DW
         /B5kLlmPL/VZhh+OXcs5lc9vlhiH8L+fk8+VE67VUCbO6DzUKAee4crIaRn00pbbat2L
         /hLjpNNf3ApI76HITvv5pPqBSt2QO0WeiXq7Um+cXqpc9nHKvxljA8Vk7fOBjgvkuPH7
         cWT1eZpDd6OcJuNqEcxNcsqheQ/tPQCaAHOUb0PdvOXMD51RglDjLkhsUOLDhPAVvAY0
         +ujg==
X-Gm-Message-State: AOAM532uVt5rHgT3Jkw0iNTYYCOyjNB3jL8khFmZ4olir1aibF+U8dtT
        GINuACS2aI7wLb4GVjaT3aE=
X-Google-Smtp-Source: ABdhPJxe7t5OmIkGit7oUHWuu+mWVsnNAK5sHRclsy4or+MfmMDi12IoLs2rUt7azoHz5WvKKkFx+w==
X-Received: by 2002:a17:902:e891:b029:12d:6824:9d28 with SMTP id w17-20020a170902e891b029012d68249d28mr1344605plg.23.1629943335829;
        Wed, 25 Aug 2021 19:02:15 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
        by smtp.gmail.com with ESMTPSA id i11sm721973pjj.19.2021.08.25.19.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Aug 2021 19:02:15 -0700 (PDT)
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
Subject: [PATCH v8 1/7] drm: fix null ptr dereference in drm_master_release
Date:   Thu, 26 Aug 2021 10:01:16 +0800
Message-Id: <20210826020122.1488002-2-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210826020122.1488002-1-desmondcheongzx@gmail.com>
References: <20210826020122.1488002-1-desmondcheongzx@gmail.com>
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

