Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 347D13DF968
	for <lists+linux-media@lfdr.de>; Wed,  4 Aug 2021 03:52:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233841AbhHDBwl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Aug 2021 21:52:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229820AbhHDBwl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Aug 2021 21:52:41 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1316C06175F;
        Tue,  3 Aug 2021 18:52:28 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id mt6so810208pjb.1;
        Tue, 03 Aug 2021 18:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fSQgo07VJZLrzxtRhVpF2elOIx5PWfCaTzxcdQTI7sQ=;
        b=AH1zW7BE9omAKOjq4atorPk+57PqXqxm72okT/sJJeaB/KGSI/yVXGbo+or5iSV8DM
         Nzn+Op61BdpBBK2z0eQ56R+86cH/pdH1JvRsF2MLdZdLN9QyF40cAis3V+3r+gys6pLF
         Wt5nbPEidUbNwkSB0bSwwY/NkmoH+2qcmUVnwUGZ/MVha1n4bzf99cl4kCeR9U37tb6u
         9ETOoeec+DlA30Cp/wA7qihjWYeg+EISnWTAmlGvj/kipYID5haaaGyo4YUdfN4Eghv2
         1ckHyd5/COwgsJu8mDz2pcuozW/teLegKpb3Vkpb5WSx3f2bDQG3tuazJVz028oiSn8M
         YmSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fSQgo07VJZLrzxtRhVpF2elOIx5PWfCaTzxcdQTI7sQ=;
        b=g5W5GV0eghePopbpFN8w8vRVPZ5KlNtJZcISIMwzQZsi0SDr42L9rDEAAU6DCXR6vg
         5/FzY5lnpWcBGi1ZtK96dY8SDCMpOwZTqMr9zi7Rm26T/p7scyZS2fhgAnMFjUDukiPH
         chsUQKyenwVqtt0uOJsR5M6X1V/i2Wu/NY/hUAbCK2iT/83lylpC6GQBOj64uvQjcnW6
         fFDh09Jqn5UWQ9Pxu6SREOwSfnuuVnaVZMxiSX2PH3BiHMY7VOQtr4Vre1CSgoRV1ktl
         sGaQ7Y3nNrlyQpBoyXXTWeRX8HgCuTrcRnW++DifTTz5LYuLL3w0FEf2oGQ9KeCqSKdG
         Q8gw==
X-Gm-Message-State: AOAM530FC6s+U4rYYVg8dbPuwMNZx2uZSzaw5zWLoZq+HFwpEGTTjb6d
        73BUrmE2kBZPaz8Pg3DUje4=
X-Google-Smtp-Source: ABdhPJzyXDotjHwSv5EpTfdtG5zDwsdMySRsOZ7X/2I9Tj1ioD9a+FZjytRGdxDjmqtg3iLd1+amag==
X-Received: by 2002:a17:90a:ea8b:: with SMTP id h11mr18676578pjz.157.1628041948277;
        Tue, 03 Aug 2021 18:52:28 -0700 (PDT)
Received: from localhost.localdomain ([45.135.186.49])
        by smtp.gmail.com with ESMTPSA id b12sm496069pff.63.2021.08.03.18.52.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Aug 2021 18:52:27 -0700 (PDT)
From:   Tuo Li <islituo@gmail.com>
To:     alexander.deucher@amd.com, christian.koenig@amd.com,
        Xinhui.Pan@amd.com, airlied@linux.ie, daniel@ffwll.ch,
        sumit.semwal@linaro.org, airlied@redhat.com,
        Felix.Kuehling@amd.com, Oak.Zeng@amd.com, nirmoy.das@amd.com,
        tzimmermann@suse.de, Philip.Yang@amd.com
Cc:     amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, baijiaju1990@gmail.com,
        Tuo Li <islituo@gmail.com>, TOTE Robot <oslab@tsinghua.edu.cn>
Subject: [PATCH] drm/amdgpu: drop redundant null-pointer checks in amdgpu_ttm_tt_populate() and amdgpu_ttm_tt_unpopulate()
Date:   Tue,  3 Aug 2021 18:51:32 -0700
Message-Id: <20210804015132.29617-1-islituo@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The varialbe gtt in the function amdgpu_ttm_tt_populate() and
amdgpu_ttm_tt_unpopulate() is guaranteed to be not NULL in the context.
Thus the null-pointer checks are redundant and can be dropped.

Reported-by: TOTE Robot <oslab@tsinghua.edu.cn>
Signed-off-by: Tuo Li <islituo@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 3a55f08e00e1..719539bd6c44 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -1121,7 +1121,7 @@ static int amdgpu_ttm_tt_populate(struct ttm_device *bdev,
 	struct amdgpu_ttm_tt *gtt = (void *)ttm;
 
 	/* user pages are bound by amdgpu_ttm_tt_pin_userptr() */
-	if (gtt && gtt->userptr) {
+	if (gtt->userptr) {
 		ttm->sg = kzalloc(sizeof(struct sg_table), GFP_KERNEL);
 		if (!ttm->sg)
 			return -ENOMEM;
@@ -1146,7 +1146,7 @@ static void amdgpu_ttm_tt_unpopulate(struct ttm_device *bdev,
 	struct amdgpu_ttm_tt *gtt = (void *)ttm;
 	struct amdgpu_device *adev;
 
-	if (gtt && gtt->userptr) {
+	if (gtt->userptr) {
 		amdgpu_ttm_tt_set_user_pages(ttm, NULL);
 		kfree(ttm->sg);
 		ttm->sg = NULL;
-- 
2.25.1

