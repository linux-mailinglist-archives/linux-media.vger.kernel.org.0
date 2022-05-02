Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9CD0D517495
	for <lists+linux-media@lfdr.de>; Mon,  2 May 2022 18:38:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380588AbiEBQl2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 May 2022 12:41:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1386380AbiEBQlR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 May 2022 12:41:17 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E05F911C0B
        for <linux-media@vger.kernel.org>; Mon,  2 May 2022 09:37:44 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id i5so20218853wrc.13
        for <linux-media@vger.kernel.org>; Mon, 02 May 2022 09:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KjkQ0JRQZyD+wsFR0t4oPn4rUlqhN8HCr5sJCzpjRmE=;
        b=XRFyPBX826gX+6Sf6EdgjzVcDAEC57cWAnpTUJSiNbTAuYlcDJqotYTXcL4OCIZhKK
         rGrruKwqySetpI5UYY3c8MrVsrYSkCQLOpxEzdboo9Q3r0Nlqe0Xu6KecryhvSGhaa53
         /ALxzRnKwxCTsSUwi/t+VQAtFWy5YxseyD5HM/82srioDn+fYu6wEihksTJo4ja5Ahyt
         5aTJtt+xiPZ1jQwB/Z137YFORgQkslcu+pdrKfbC5AEvSmvA5ShFJfsbwdOD6aix9GVg
         9jwEfBxqiry31YlDKCDDNUjfPrZyXALr1nE9yv5ntYzzHvYbRz3QDLkMwnTv7gCUSx6V
         q1+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KjkQ0JRQZyD+wsFR0t4oPn4rUlqhN8HCr5sJCzpjRmE=;
        b=NYaovfUiABphkH57HY5D+nDx35mO+33K8pScAhzoL+29RWb+/Z4AtrIDg7GxAyIjwD
         uR6+K3iCA7pRoebIp/6kF2acaGQXcRq0x4V54KHcK0TKYnXnZDSLcmU0tkesfmEQeV5k
         135KUME04iGvg97qa+0R7CFKWYA4IV6AvdI/4xFefZnO6AXjtl+k5MHx4ign6mzsdaJn
         Ga22n/TWf1ZLXanS/ZW7rcU5lZmeUCkc5gjyFln/+M8Bm0+M+c1JlGG9rm2r+FIu9PdR
         HMqgPfjh5BGLMDOxSdvyRzF4SGJfGLxwvjffjdzMyo2xBmoity/HXXnu2figuepgad+g
         qzQw==
X-Gm-Message-State: AOAM533nkZfaSFOK/HiO8mMFz+xVyI/e2c+yR6HMvsB63XKwxU5Jz+1D
        animEHEZ8bdJe8k2hvnVTL8=
X-Google-Smtp-Source: ABdhPJwIO4JMf3a/FHinF4NCDxZum5bVjIfSGJInrAQPVDJEyndnzfd420zGEtBXfAqSUovvsyyOEg==
X-Received: by 2002:a05:6000:2c9:b0:20c:64c9:4b7a with SMTP id o9-20020a05600002c900b0020c64c94b7amr3727596wry.325.1651509463426;
        Mon, 02 May 2022 09:37:43 -0700 (PDT)
Received: from able.fritz.box (p57b0b9e1.dip0.t-ipconnect.de. [87.176.185.225])
        by smtp.gmail.com with ESMTPSA id p14-20020adfaa0e000000b0020c5253d8f6sm7294694wrd.66.2022.05.02.09.37.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 09:37:42 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     daniel@ffwll.ch, jason@jlekstrand.net, daniels@collabora.com,
        skhawaja@google.com, maad.aldabagh@amd.com, sergemetral@google.com,
        sumit.semwal@linaro.org, gustavo@padovan.org,
        Felix.Kuehling@amd.com, alexander.deucher@amd.com,
        tzimmermann@suse.de, tvrtko.ursulin@linux.intel.com,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
Cc:     =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH 11/15] drm: add user fence support for atomic in fences
Date:   Mon,  2 May 2022 18:37:18 +0200
Message-Id: <20220502163722.3957-12-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220502163722.3957-1-christian.koenig@amd.com>
References: <20220502163722.3957-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When the DRIVER_USER_FENCE flag is set we grab the user fence from the
sync file instead of the normal one.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/drm_atomic_uapi.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index e2112c10569b..d1b13657e2ae 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -517,7 +517,10 @@ static int drm_atomic_plane_set_property(struct drm_plane *plane,
 		if (U642I64(val) == -1)
 			return 0;
 
-		state->fence = sync_file_get_fence(val);
+		if (drm_core_check_feature(dev, DRIVER_USER_FENCE))
+			state->fence = sync_file_get_user_fence(val);
+		else
+			state->fence = sync_file_get_fence(val);
 		if (!state->fence)
 			return -EINVAL;
 
-- 
2.25.1

