Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69A48296049
	for <lists+linux-media@lfdr.de>; Thu, 22 Oct 2020 15:48:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2900453AbgJVNsD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Oct 2020 09:48:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2900448AbgJVNsC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Oct 2020 09:48:02 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75501C0613CE;
        Thu, 22 Oct 2020 06:48:02 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id l2so1000157pjt.5;
        Thu, 22 Oct 2020 06:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=U432S97cU+kXrslvGgog8CihEs2p/DakYW0kgHJLU04=;
        b=rYwjb2xkkh0hxJWaPtOnGa4hSe5DuH6RLUZsZBwxA6M+Z3ZP+laaYWty/n+xFUh7CT
         x62XiY4/BFnQkTugiegwK2EiFTnJxllQ/XJKCth8g5mxJ93KuTm6ClHqTZ8sBEI+L1hq
         C/X1pxD7EjWrJ4/3qk4xaMAAEFtZKDHCo7Sjpb7ezoHZNY5/k26tuFpTDDtl4JTmW4v0
         3+QVKvhFHvha8uUUEE7iCJl2d90+KRDbgRLvBeKbJ2RylZwbMd1l+gVJSnmaRTiDjFb1
         N/sk7fU/JL99mAX5kVZbQ+JYnhO6HLzCtiGv1N1tQoIOymoGU077WXHGYycWfasE6u12
         yQnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=U432S97cU+kXrslvGgog8CihEs2p/DakYW0kgHJLU04=;
        b=scdaVRKj04/9RKKn9LHS9nZqbgokIAbbV5MG3HV/FySLRyEP+KtMgiS2XJHZ+Gh4S9
         b4/L2RcBUtkinrpI36SQM5mGnaq7bv9BWtRCxDuVhG3UNIasJYZnMx0Qca2pHuj3iyNv
         hWdi5oIYe5IFjwZvMRkFjmB+KoIyFuXMyXpd4AhzFqqNygvxHf5lqzJWATYmqAj77Xzs
         0/fuSHmZHCAJkKGX1XHrjNOj+ryCrJdEuUHa73lTcVct/622l54Lw/N2nw7E5ITEInNo
         0tVyQL6JGJOvc2EnwP1wTG+TyS/cEa+RHEMdFpEYrlc4V4B7FjqzHXRU8TNqVkN3iEyT
         O8Yg==
X-Gm-Message-State: AOAM530vhCT4Eb70JuBVPUhvpk7ZW5H954U0bOz1awTtTt1p/ytbZPgA
        NjC/xrwNE1NplAFDUtAlj+Vfi1bGnCM2Rw==
X-Google-Smtp-Source: ABdhPJwM3YcRS24T5SIMczPQMewNzH1W31xII0vjX1FFvHeMteycQ8Cm7A31YkVKAcu0jmw+NBB7Tg==
X-Received: by 2002:a17:902:e983:b029:d5:f469:60c0 with SMTP id f3-20020a170902e983b02900d5f46960c0mr2536227plb.61.1603374481995;
        Thu, 22 Oct 2020 06:48:01 -0700 (PDT)
Received: from adolin ([49.207.204.75])
        by smtp.gmail.com with ESMTPSA id g17sm2357979pfu.130.2020.10.22.06.47.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2020 06:48:01 -0700 (PDT)
Date:   Thu, 22 Oct 2020 19:17:56 +0530
From:   Sumera Priyadarsini <sylphrenadin@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     outreachy-kernel@googlegroups.com, alexander.deucher@amd.com,
        christian.koenig@amd.com, airlied@linux.ie, daniel@ffwll.ch,
        melissa.srw@gmail.com, linux-media@vger.kernel.org,
        amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] gpu: drm: amdgpu: Replace snprintf() with sysfs_emit()
Message-ID: <f6107f3e467f1906abdcc33d35f13cf54f7e5a96.1603371258.git.sylphrenadin@gmail.com>
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

Modify amdgpu_psp.c to use sysfs_emit() instead which knows the
size of the temporary buffer.

Issue found with Coccinelle.

Signed-off-by: Sumera Priyadarsini <sylphrenadin@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
index d6c38e24f130..4d1d1e1b005d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
@@ -2621,7 +2621,7 @@ static ssize_t psp_usbc_pd_fw_sysfs_read(struct device *dev,
 		return ret;
 	}
 
-	return snprintf(buf, PAGE_SIZE, "%x\n", fw_ver);
+	return sysfs_emit(buf, PAGE_SIZE, "%x\n", fw_ver);
 }
 
 static ssize_t psp_usbc_pd_fw_sysfs_write(struct device *dev,
-- 
2.25.1

