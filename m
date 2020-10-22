Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 276BE296034
	for <lists+linux-media@lfdr.de>; Thu, 22 Oct 2020 15:41:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2507999AbgJVNk4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Oct 2020 09:40:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2503436AbgJVNk4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Oct 2020 09:40:56 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D2A6C0613CE;
        Thu, 22 Oct 2020 06:40:53 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id j5so592780plk.7;
        Thu, 22 Oct 2020 06:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6ARfb7CCtAyGQWozbpcu69TiW9MOgZYC7V52jr9EMdI=;
        b=cPArrMKj7xSwULJAYitN0m6vC7G/wTwv5trn8fq+nwf0A+2hp5LU49pAbuMhjjeNRv
         fccwBKY40gL96fMEFCrheOhs7geOIGvy7bVVSiZb4TMh4d4+F5geRTxSuZJZ70PQlJbl
         jsiGe1Txe6jSe3uD8rQo5YbSLjz9pGZZWV6R8BiMnBJXhF7UUdTOm46R+31AxuvTjs8f
         4vG70Oj+1gjW8V8CgysBCTnZOVSLzF1KzDbUBCBO/FFxF/jhtqBUeM7IYE1nzUP+YPj1
         KYWxc2DLWI7L4c9F3cvB8q3/pRjebyP3rk0NZq4DzfnO71JrJupHUchu1cnsxLwnxa3y
         INBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6ARfb7CCtAyGQWozbpcu69TiW9MOgZYC7V52jr9EMdI=;
        b=uiw5gO+c1W1f1lG0ljp5OGHvdvP5n6Eyc8bBeN1LWaMpO4079VYQZPLooxZhEosnZF
         eV9RWPbZllz58UVTnyOGViHvuDSs/RIHT3C/1tJSZ5jaL+G7SlM59oOMFU3u2mzXxQpe
         RQkG0w/UZz7FVWSGUq1U5u6bYTWijbWl6/MfTdsyH+wtOQbSmP4yWNeXsuRwx/1IV2PD
         f1FdIpI4fgrO5JqF44PWu5FtSsn/vOwpXgQUjThQQCYdKNzvthtXpfQFpsCrlCbUfDQL
         vAgCPgRH4+ABYgohh+GuaKcH0Kb0dPJE3FkT9NwneA9hv8Z+IFZYQrlV58gzxiIIfNLC
         kGmg==
X-Gm-Message-State: AOAM531gTSNPytr20GeezB+9HvUSTEO+w/17hHROV39bR9E9cWjrBDAN
        WwiOVJWEILruYtaaEf0Uj4g=
X-Google-Smtp-Source: ABdhPJzyGexTbAbgzpbd2h8qNCbpH2i7VtqXeR1WWd3CGgsd3u1tqGNz/XhtoLwDvWQSXW1MYy0t5w==
X-Received: by 2002:a17:90a:7d12:: with SMTP id g18mr2448814pjl.89.1603374053035;
        Thu, 22 Oct 2020 06:40:53 -0700 (PDT)
Received: from adolin ([49.207.204.75])
        by smtp.gmail.com with ESMTPSA id j20sm2384100pgl.40.2020.10.22.06.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2020 06:40:52 -0700 (PDT)
Date:   Thu, 22 Oct 2020 19:10:47 +0530
From:   Sumera Priyadarsini <sylphrenadin@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     outreachy-kernel@googlegroups.com, alexander.deucher@amd.com,
        christian.koenig@amd.com, airlied@linux.ie, daniel@ffwll.ch,
        melissa.srw@gmail.com, linux-media@vger.kernel.org,
        amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] gpu: drm: amdgpu: Replace snprintf() with sysfs_emit()
Message-ID: <c9fbe2e2c31fae2fea867940a888c68becc993bd.1603371258.git.sylphrenadin@gmail.com>
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

Modify amdgpu_atombios.c to use sysfs_emit() instead which knows the
size of the temporary buffer.

Issue found with Coccinelle.

Signed-off-by: Sumera Priyadarsini <sylphrenadin@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c
index 469352e2d6ec..3c19862c94c7 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c
@@ -1947,7 +1947,7 @@ static ssize_t amdgpu_atombios_get_vbios_version(struct device *dev,
 	struct amdgpu_device *adev = drm_to_adev(ddev);
 	struct atom_context *ctx = adev->mode_info.atom_context;
 
-	return snprintf(buf, PAGE_SIZE, "%s\n", ctx->vbios_version);
+	return sysfs_emit(buf, PAGE_SIZE, "%s\n", ctx->vbios_version);
 }
 
 static DEVICE_ATTR(vbios_version, 0444, amdgpu_atombios_get_vbios_version,
-- 
2.25.1

