Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 075CB3F72FD
	for <lists+linux-media@lfdr.de>; Wed, 25 Aug 2021 12:26:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239743AbhHYK05 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Aug 2021 06:26:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239037AbhHYK04 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Aug 2021 06:26:56 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8415C061757;
        Wed, 25 Aug 2021 03:26:10 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id j1so16217624pjv.3;
        Wed, 25 Aug 2021 03:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Hm7YjUyiFZ/KTSC9DbXmgQsGRHrND7m8Eh1agHCitnc=;
        b=Pv0sswx6KV/D8D8iLbEXpPK6gv6aPKlPhIuzZJ538pPeg7Zu19TY2wFsCnnGME4d82
         wCDwEjmR57/22LqSFLhTLalvNlddN72iu5RGqZrxtJl4Fm/MA/ibi4rEWki8bFcw3BZq
         FhIwjTU+7TZyifAU4oNOykCJaqfkvPBIyvN9eu4oRtpntdky0i+q6RqOUjNOd54ff2NJ
         Go8JXSz8cs/llxPn+HAJ5wIDBK4Ku56pJ+mqopZWjQsMcfatXngrcnj1jHP8unbdVhmx
         4j9/RJPaZz/Ktx88hAYLUV4Iy0xMOHPut0EeJGi4IiFpqPgd9ShegS092J+LAhKieWB9
         39EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Hm7YjUyiFZ/KTSC9DbXmgQsGRHrND7m8Eh1agHCitnc=;
        b=iof4KWK33bsFiHExUgAHSA5Qa22dscSf8wxSgccoHhZGkWBPJterpNS1EL4sFRWcNB
         4vOoLOdPRY1m2IcHUmd+x8UDK6vdlvBT1bbZ9yld/UprydrKyRgWsmGXTsYnHP1GphM3
         V/tUk+5q2ihzys/vxD55eCNiUK842oxjWyuHyLBnYZiwBLRcbzBf2atWWMA+3OvilCVq
         IvKcVWtQ8eZTZuboe9u7OmZiKxwg7BzDVslMcES/2iEyekbFDK79HMMHrGi16ltJ+WyI
         AW3dl4PljF9VKepC2odgb+wAR45I+C2hReXBsAQN5eSX5p0k5FNJJiPbSbB5+8wJl81m
         7Ucw==
X-Gm-Message-State: AOAM533A/BSZR7sM6sZXcFL9ih/fEhexbpVD84sTcP+Hlz7zmGWLK/ZG
        duhAXhL0cMkSoRBgA1wfjtw=
X-Google-Smtp-Source: ABdhPJwk7uNf/Z8KNv7UeYe6/0UZgwLP4fBmgUIJNZd8m2slwG3kkkKx214CBAj66cPPHJFhaxKJjw==
X-Received: by 2002:a17:902:c950:b029:12d:2ada:9ef7 with SMTP id i16-20020a170902c950b029012d2ada9ef7mr37392203pla.61.1629887170492;
        Wed, 25 Aug 2021 03:26:10 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
        by smtp.gmail.com with ESMTPSA id t42sm10228377pfg.30.2021.08.25.03.26.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Aug 2021 03:26:10 -0700 (PDT)
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
Subject: [PATCH v6 1/7] drm: fix null ptr dereference in drm_master_release
Date:   Wed, 25 Aug 2021 18:24:05 +0800
Message-Id: <20210825102411.1084220-2-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210825102411.1084220-1-desmondcheongzx@gmail.com>
References: <20210825102411.1084220-1-desmondcheongzx@gmail.com>
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

