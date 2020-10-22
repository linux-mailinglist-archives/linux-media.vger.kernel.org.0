Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9550296043
	for <lists+linux-media@lfdr.de>; Thu, 22 Oct 2020 15:47:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2900429AbgJVNrM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Oct 2020 09:47:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2508308AbgJVNrM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Oct 2020 09:47:12 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5410C0613CE
        for <linux-media@vger.kernel.org>; Thu, 22 Oct 2020 06:47:10 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id o1so1057400pjt.2
        for <linux-media@vger.kernel.org>; Thu, 22 Oct 2020 06:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1gypUtIc864PbkDDcPxNQEUh8zBoJi60ZtKxJZr3rhk=;
        b=BhFPvqZ2fI2InSAjrYY0zeX18fhNHww1+FQ/xSM5zKcowMhycbuWkOnfxAIq4PB4Er
         UOJF2GZM0pLpbcswZLc3aeYilTgEEmxUEGT0/k2CEEdmC3m5ftiWv8BJm10VuGQirQFT
         tk+IS1SS/s1WxJ+zcwFm5SZX4KFb/kcYL5onqjBP80vdQAiVFHIBwyJXNgb6uVUwdkfy
         EtQgkvNjRxzy5e109mcft/9UN0MFO0q3Sq8D2mLc65jjek86iE1AkevB8kdyhRlWYhsQ
         h7X8b8kWeuL8yLHrj6mOZa86q+dowjDyuKh3VA6Uv3YSEaEnUt2vXSiZa/M+UVXLUoGQ
         AeZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1gypUtIc864PbkDDcPxNQEUh8zBoJi60ZtKxJZr3rhk=;
        b=FEBgr+0IcZsYmGvtM/TGvII0RQlENFahuVDDalvN9bNGZL4qWekd/kNJ7xPLHQCafJ
         G74fuhuIuw056ksTrmniOfwykPKNvcebY4poI1Z/cqpuKhOBv7crle/ILOTWDqhrrNh2
         KFX7Y3uz6oG1V5Z9iaKu+1+cDF7n3HEnlT0K65F0x0ym+/cK1odVICYjFWtHpCokXdhT
         4U6gqAWu9LI95FIhn8JuwjhY0cQklhYEp2/gyz+ihCAtFyVKVF8cV2iOYkpxbDLLMNrK
         KDVV7FGfZLTL/YzHRprbMtwhLDa/3sNv3PCXmLfuhCpA64+U7m7BAFsbokj2osLbGNji
         dbew==
X-Gm-Message-State: AOAM532/IeifDN4FdgKvXhAC6+r0q2h2AGbV026onw9aA3U50vAjuey8
        1PbrbBGG2dU4u6LuRX/O1Rk=
X-Google-Smtp-Source: ABdhPJxgfTDPOdZuV7oWxSOXYyNciFXIQfbcH4Wjz4kzLnC7p5Iw7rt5cpaeGQoeis6/vilsflQLfw==
X-Received: by 2002:a17:902:a50f:b029:d6:da2:aaa7 with SMTP id s15-20020a170902a50fb02900d60da2aaa7mr2614665plq.42.1603374430254;
        Thu, 22 Oct 2020 06:47:10 -0700 (PDT)
Received: from adolin ([49.207.204.75])
        by smtp.gmail.com with ESMTPSA id b128sm2233467pga.80.2020.10.22.06.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2020 06:47:09 -0700 (PDT)
Date:   Thu, 22 Oct 2020 19:17:04 +0530
From:   Sumera Priyadarsini <sylphrenadin@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     outreachy-kernel@googlegroups.com, alexander.deucher@amd.com,
        christian.koenig@amd.com, airlied@linux.ie, daniel@ffwll.ch,
        melissa.srw@gmail.com, linux-media@vger.kernel.org,
        amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.or
Subject: [PATCH 3/5] gpu: drm: amdgpu: Replace snprintf() with sysfs_emit()
Message-ID: <864a0c5d7bc85d9eeaf1ca7b3db38b58e042471b.1603371258.git.sylphrenadin@gmail.com>
References: <cover.1603371258.git.sylphrenadin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1603371258.git.sylphrenadin@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Using snprintf() for show() methods holds the risk of buffer overrun
as snprintf() does not know the PAGE_SIZE maximum of the temporary
buffer used to output sysfs content.

Modify amdgpu_gtt_mgr.c to use sysfs_emit() instead which knows the
size of the temporary buffer.

Issue found with Coccinelle.

Signed-off-by: Sumera Priyadarsini <sylphrenadin@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
index 1721739def84..441e07ee1967 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
@@ -49,7 +49,7 @@ static ssize_t amdgpu_mem_info_gtt_total_show(struct device *dev,
 	struct amdgpu_device *adev = drm_to_adev(ddev);
 	struct ttm_resource_manager *man = ttm_manager_type(&adev->mman.bdev, TTM_PL_TT);
 
-	return snprintf(buf, PAGE_SIZE, "%llu\n",
+	return sysfs_emit(buf, PAGE_SIZE, "%llu\n",
 			man->size * PAGE_SIZE);
 }
 
@@ -68,7 +68,7 @@ static ssize_t amdgpu_mem_info_gtt_used_show(struct device *dev,
 	struct amdgpu_device *adev = drm_to_adev(ddev);
 	struct ttm_resource_manager *man = ttm_manager_type(&adev->mman.bdev, TTM_PL_TT);
 
-	return snprintf(buf, PAGE_SIZE, "%llu\n",
+	return sysfs_emit(buf, PAGE_SIZE, "%llu\n",
 			amdgpu_gtt_mgr_usage(man));
 }
 
-- 
2.25.1

