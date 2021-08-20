Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A38343F29C7
	for <lists+linux-media@lfdr.de>; Fri, 20 Aug 2021 12:03:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238882AbhHTKEQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Aug 2021 06:04:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238857AbhHTKEQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Aug 2021 06:04:16 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C18B7C061757;
        Fri, 20 Aug 2021 03:03:38 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id hv22-20020a17090ae416b0290178c579e424so6872272pjb.3;
        Fri, 20 Aug 2021 03:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Hm7YjUyiFZ/KTSC9DbXmgQsGRHrND7m8Eh1agHCitnc=;
        b=RRV2JyZgw8WjZHw+NGUYxj0uYQ4too9agb5VqtdVkn47PSkI01SJ8WjRPtsiVTKUtk
         r+OhkYkzHTR+/VNwcA8rc4OexXEeKCDdjdVcU+h/lxslrEmtdQk3ZCa5J9o6SSmLK4c9
         kiVACl2KhEeIgFzOwmHOM7mnMrBt83HsnrSmWTklRanG9qOgXEmAm5/W/VXjwXZzrfr/
         qXHv4Ejm9aMXIcVdfVeRqFxEYWff+6KMRPYaFijWp8tEWHAhzft0TKL2uND6h4sdO7g6
         94dElz0+iAOPKxI9r4gBUAXbBXWY2dxnG8Y0iAjcc5m0kTTI4UvwTztBnktQTI6NbUvJ
         t+8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Hm7YjUyiFZ/KTSC9DbXmgQsGRHrND7m8Eh1agHCitnc=;
        b=qIWPJBAFZyvpUdpsyhs+q+ym4Yt6zWpsWnnYpy8eO3AyBud6TsOg22GrYa9SXvpbIE
         cJvhaGJ69k7KQ6sMIxAM/TPjDKrapvYQsrqCrjfx0YlRHZ6g2S0ntuhMQgD4yRQYwVQu
         ZAh6jBW7vWwA2+jO6ljatDf7IJ+jzb84fiyS2ghPv1+B9U/oK2r+e5ipehaC0f2UDYny
         WqlPG6FbCP2/XA/xZY49ZRDMVww/s1Gjql25wvhXtddmaegurrEOmVLw4Tb0QM+GQxpG
         d6TPtyXacFu/MI0rFZhAx8NZe7y0oqoT6uGVwZi/7MNsa6jaZbMZF8Z3uppFXHsGRevP
         JuYQ==
X-Gm-Message-State: AOAM533tvdnojRokvO61TlU9j+BLanpRE5LYz5mE2uQTe8aNKfVkyMqN
        o+ZFOee9qkBh0iRiZeraQF0=
X-Google-Smtp-Source: ABdhPJyAeCCNd+ZV72qw0T8ygRx7UffbRCyZoymA+AzlwiE7NY2E4dqxozaw/GJQAV5PfnujFnMZpQ==
X-Received: by 2002:a17:902:a503:b029:12b:2429:385e with SMTP id s3-20020a170902a503b029012b2429385emr15898527plq.64.1629453818332;
        Fri, 20 Aug 2021 03:03:38 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
        by smtp.gmail.com with ESMTPSA id i8sm6503876pfo.117.2021.08.20.03.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Aug 2021 03:03:37 -0700 (PDT)
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
Subject: [PATCH v4 1/5] drm: fix null ptr dereference in drm_master_release
Date:   Fri, 20 Aug 2021 18:02:47 +0800
Message-Id: <20210820100251.448346-2-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210820100251.448346-1-desmondcheongzx@gmail.com>
References: <20210820100251.448346-1-desmondcheongzx@gmail.com>
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

