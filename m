Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28E1B3EFDE9
	for <lists+linux-media@lfdr.de>; Wed, 18 Aug 2021 09:40:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238603AbhHRHlQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Aug 2021 03:41:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239245AbhHRHlM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Aug 2021 03:41:12 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D911C061796;
        Wed, 18 Aug 2021 00:40:38 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id o10so1327142plg.0;
        Wed, 18 Aug 2021 00:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=he3hjgMVhcOXzxQ8ZzPKGe5qy8qOVQuZUYfKXwOfAPg=;
        b=V3ChonAMDLG13W4R9mt1UZfcDRlf3NYYG5Rp6zwLe9hoPv7kNaLSz1SBaGSu4gacb2
         IG7pihFofk738zo0sUjjMECc8BKbXHoRFgXUaz+rksmgG1umJdIhslaO4DouScE25nrz
         QhQN0KBGfOlxOAV5gm+r9YxMmPtBF13v/W8YFP2iCl19RlJ5zdD+L2hOm2sa+1iKHZGz
         CgFFYbvwQ/FegyZK22MDmuuW+iQHHAazsx4WnIW9u2x3s0WyVCRHOYH7otiYZitptlk3
         7J02sZUKJx/5shMUykUIDn5WogVBsFWvX2MIVtWcImlFFB8LyqmG2vbSKdj3J6amSb+W
         /hSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=he3hjgMVhcOXzxQ8ZzPKGe5qy8qOVQuZUYfKXwOfAPg=;
        b=YBXT09Z4Mm9MZxnPeLB53s6OMQFtI4qCWuuEQTx5ZdV/0kTADHqdeiPwsZcDyA7nk0
         ej4+VNkKbgm9SzfQoIpRcQVAs0MW+VKHu7MUVpunVxU2/EUGpvbj9zbOW/TpiFCTFF5x
         hFtDIfAYc6TfbaDTJ2YO1oUyTSzW/CYula56SoKCIQZxQ+LRN/ITWQfDz2Ov26O+Wz5Y
         JqkmhbqE1ZezoGLqjm8oLWBYKiGEuDP5cVLJkpqDmB2HkQsTHgPp1sgplbbhHhG4WYOz
         BjfWenJVPyKCoxV3qliqtS9QlrrTq8Xigw6dSB448r6h5Pj1GRjSC1OZZPxndbuwj1kN
         kPGA==
X-Gm-Message-State: AOAM531GLsxjwe9JoD/VPUAOj+REPbmkdvMp9N6kfEgWYvzS8vHKNI3x
        3irW24mvyEMRqtcVBL2WlwA=
X-Google-Smtp-Source: ABdhPJykotiJspllqjLdDweoNoswYBNnKnCEjOlyfwnrSucYaBkYPe1fsbb0KtPlQEnYeO0NwCNLag==
X-Received: by 2002:a17:90a:b009:: with SMTP id x9mr7893927pjq.97.1629272437819;
        Wed, 18 Aug 2021 00:40:37 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
        by smtp.gmail.com with ESMTPSA id u3sm3886729pjr.2.2021.08.18.00.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 00:40:37 -0700 (PDT)
From:   Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To:     maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch,
        sumit.semwal@linaro.org, christian.koenig@amd.com, axboe@kernel.dk,
        oleg@redhat.com, tglx@linutronix.de, dvyukov@google.com,
        walter-zh.wu@mediatek.com
Cc:     Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        intel-gfx@lists.freedesktop.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, skhan@linuxfoundation.org,
        gregkh@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH v3 3/9] drm: check for null master in drm_is_current_master_locked
Date:   Wed, 18 Aug 2021 15:38:18 +0800
Message-Id: <20210818073824.1560124-4-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818073824.1560124-1-desmondcheongzx@gmail.com>
References: <20210818073824.1560124-1-desmondcheongzx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There is a window after calling drm_master_release, and before a file
is freed, where drm_file can have is_master set to true, but both the
drm_file and drm_device have no master.

This could result in wrongly approving permissions in
drm_is_current_master_locked. Add a check that fpriv->master is
non-NULl to guard against this scenario.

Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
---
 drivers/gpu/drm/drm_auth.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
index 8c0e0dba1611..f9267b21556e 100644
--- a/drivers/gpu/drm/drm_auth.c
+++ b/drivers/gpu/drm/drm_auth.c
@@ -66,7 +66,8 @@ static bool drm_is_current_master_locked(struct drm_file *fpriv)
 	lockdep_assert_once(lockdep_is_held(&fpriv->minor->dev->master_lookup_lock) ||
 			    lockdep_is_held(&fpriv->minor->dev->master_mutex));
 
-	return fpriv->is_master && drm_lease_owner(fpriv->master) == fpriv->minor->dev->master;
+	return (fpriv->is_master && fpriv->master &&
+		drm_lease_owner(fpriv->master) == fpriv->minor->dev->master);
 }
 
 /**
-- 
2.25.1

