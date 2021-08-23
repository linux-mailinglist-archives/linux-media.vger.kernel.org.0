Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E57CE3F4F2C
	for <lists+linux-media@lfdr.de>; Mon, 23 Aug 2021 19:15:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231315AbhHWRQE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Aug 2021 13:16:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231403AbhHWRP7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Aug 2021 13:15:59 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F0F0C061575;
        Mon, 23 Aug 2021 10:15:17 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id 17so17244152pgp.4;
        Mon, 23 Aug 2021 10:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Hm7YjUyiFZ/KTSC9DbXmgQsGRHrND7m8Eh1agHCitnc=;
        b=Hu/UENdhdrmnyEohbXjETfe98nCnQf8T8kz+WnnhfYxirR40EcXoYicthiSNlyfrcb
         1lHg9PI3AXl9NLdgjZ4EU8M4i912WQf3ymjcc7aXDI0XLN1xmGz3rA6QVpw9gs5l2OpW
         86Y2Eedl3Q4JoMLcWHVKVgUIqzoizNTypNNak8pnpJrX4u5u/tg8fqh5/44/CYdTkLOA
         XSlamsA1X2jhY7mwMKM3nc21+0+ezmpLz0kILFICQ0ZQDaAXuEVCYgYkKPDlffhPTZWp
         BplkzcNDyd3p2Ln14BcgB/bX9pWtjtvpdL6stk05ncLvT8bR9N+WrzlyFE0GiiqN+DKJ
         zVug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Hm7YjUyiFZ/KTSC9DbXmgQsGRHrND7m8Eh1agHCitnc=;
        b=aZM8C3HUlGEXISFlGBRD2RB3SWQwy2lcHvn+Ge8cN/ofzOqNyes2TLEvddEstvKgx9
         KA+cpz6TUvPlqZZmgZlUem47O55EpEYYHC5elulxs89qK5bLrSp2HxvJf/ORYrKsTJ4F
         jgwUetqX/ZmZ4Ghb0f5XllfNsySPj50EE63efBpv90yTi0joyQaGx0yANix0ZBhOM+bA
         fJRpVUvjHEoM+vsM/cbKfsE2kh/gLe2m8B9/G5Lezm9lf1KGMfqdfI+WwqPhn8pTSSvA
         wpb2jIISBHsWVeOCzJi4lwdyTBbpEyl1YsBPkmsQan12HwmauXrQk+GyBBIlQ59EFdPT
         WdKg==
X-Gm-Message-State: AOAM533hWgl9JqhKqohmXAU5nvaDazgrGwn7Se0WU0mHjPVthmbpQrKv
        vilB32CqC69DKstIcnNhZcc=
X-Google-Smtp-Source: ABdhPJxBpFsyIM9dqaqeLqzsQR5HT/rpYYPihnEULHz191fxer+tshG8eCUcMaE58dbnOQ/FiYxw9w==
X-Received: by 2002:a65:5a8e:: with SMTP id c14mr32646227pgt.125.1629738916506;
        Mon, 23 Aug 2021 10:15:16 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
        by smtp.gmail.com with ESMTPSA id q4sm14290830pjd.52.2021.08.23.10.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Aug 2021 10:15:16 -0700 (PDT)
From:   Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To:     maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch,
        sumit.semwal@linaro.org, christian.koenig@amd.com
Cc:     Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        intel-gfx@lists.freedesktop.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, skhan@linuxfoundation.org,
        gregkh@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH v5 1/6] drm: fix null ptr dereference in drm_master_release
Date:   Tue, 24 Aug 2021 01:14:32 +0800
Message-Id: <20210823171437.829404-2-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210823171437.829404-1-desmondcheongzx@gmail.com>
References: <20210823171437.829404-1-desmondcheongzx@gmail.com>
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

