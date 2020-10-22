Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF28829603D
	for <lists+linux-media@lfdr.de>; Thu, 22 Oct 2020 15:43:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2508124AbgJVNnS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Oct 2020 09:43:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2444568AbgJVNnS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Oct 2020 09:43:18 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55817C0613CE;
        Thu, 22 Oct 2020 06:43:18 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id l2so993814pjt.5;
        Thu, 22 Oct 2020 06:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=TGoYs6NX+Ndx+a6z9ojq9tBbYhFNYgIJY1nftO258C4=;
        b=qBR9uUxUlHyzRD3U5yeOPNh2DDGVG9brz1blZmpia4NszHbmZ+F9wNVuaJbexA1L3Q
         /eGsZj1/Hj54rAPm6L5LilmL59AZk5K6sjXGE8XLjUje8GMErvT7f0RzBBIzt4bwDR7y
         CP+A1Is9IT0EVEitSCNGlmmmWZ1WHvAnd9ZTIrd0lM1wHSdXPkBVZXAwsdEj9CGOq1+W
         NYw767H1SD7DlQEa3Anp0F9TqIkNbjTargZkMcF5AbXQTTIJzXX/4ocvGZ8e6tajgd05
         OjcAKZCIrST80Fh562Wu+2NAvSfyTI7JHowQpGGjfI3hDZXxM6o91V6d4cuWtjIsgJxz
         Im2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TGoYs6NX+Ndx+a6z9ojq9tBbYhFNYgIJY1nftO258C4=;
        b=n0uLpqj266RQsqSYfa6/dF8LbActyUGakq7NdGpR7kM6Cy+SdmFr37OaGSU/KReeOr
         JuZ0Qi5EutUoskQpxGMGQBgZ2izrrKuIk2Bg7e0O1j7nApEEbroXvbhznx0xpaKSs2Xp
         mSmuLxfh1X1seB+cxW9iaoM8HAGnieWgCeIywGyLDWD5MtqwQkX7SJueSt2TKFkjbrhs
         mmXLKuSC1gxDR5Bg502Yo8AASMpE9AYRiu+lGQSLhIrKqzS/nDXpgPWXXoGdVsQjQgKs
         ZaHAAut52A59e+7+MO1VBsuQiBKqvY0fejyHeOBOXAF0Cb6nEg8cdLkHQwr9SdiOgjVi
         7WrQ==
X-Gm-Message-State: AOAM532tnIAJ3dA/+mMiub0AytKeUPBxiOIxGKxvGh+NZzs+sJHVjMiw
        sGdGaXxqxFsztpOc7bNuWfk=
X-Google-Smtp-Source: ABdhPJysdrkf3tgIA1nwdFfO7BIZMe8vhpQ/9lzdcbY6lgA87r33Xb+5yzfTvWg4NA6sI3LSJUyyRw==
X-Received: by 2002:a17:902:a3c9:b029:d5:df0c:f217 with SMTP id q9-20020a170902a3c9b02900d5df0cf217mr2465001plb.59.1603374197886;
        Thu, 22 Oct 2020 06:43:17 -0700 (PDT)
Received: from adolin ([49.207.204.75])
        by smtp.gmail.com with ESMTPSA id l18sm2404726pfd.210.2020.10.22.06.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2020 06:43:17 -0700 (PDT)
Date:   Thu, 22 Oct 2020 19:13:11 +0530
From:   Sumera Priyadarsini <sylphrenadin@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     outreachy-kernel@googlegroups.com, alexander.deucher@amd.com,
        christian.koenig@amd.com, airlied@linux.ie, daniel@ffwll.ch,
        melissa.srw@gmail.com, linux-media@vger.kernel.org,
        amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] gpu: drm: amdgpu: Replace snprintf() with sysfs_emit()
Message-ID: <78546ad9343ddf1b0f8bc300a3c8ae9a0dcb0ef9.1603371258.git.sylphrenadin@gmail.com>
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

Modify amdgpu_device.c to use sysfs_emit() instead which knows the
size of the temporary buffer.

Issue found with Coccinelle.

Signed-off-by: Sumera Priyadarsini <sylphrenadin@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index f7307af76452..7eef6b20578f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -135,7 +135,7 @@ static ssize_t amdgpu_device_get_pcie_replay_count(struct device *dev,
 	struct amdgpu_device *adev = drm_to_adev(ddev);
 	uint64_t cnt = amdgpu_asic_get_pcie_replay_count(adev);
 
-	return snprintf(buf, PAGE_SIZE, "%llu\n", cnt);
+	return sysfs_emit(buf, PAGE_SIZE, "%llu\n", cnt);
 }
 
 static DEVICE_ATTR(pcie_replay_count, S_IRUGO,
@@ -159,7 +159,7 @@ static ssize_t amdgpu_device_get_product_name(struct device *dev,
 	struct drm_device *ddev = dev_get_drvdata(dev);
 	struct amdgpu_device *adev = drm_to_adev(ddev);
 
-	return snprintf(buf, PAGE_SIZE, "%s\n", adev->product_name);
+	return sysfs_emit(buf, PAGE_SIZE, "%s\n", adev->product_name);
 }
 
 static DEVICE_ATTR(product_name, S_IRUGO,
@@ -181,7 +181,7 @@ static ssize_t amdgpu_device_get_product_number(struct device *dev,
 	struct drm_device *ddev = dev_get_drvdata(dev);
 	struct amdgpu_device *adev = drm_to_adev(ddev);
 
-	return snprintf(buf, PAGE_SIZE, "%s\n", adev->product_number);
+	return sysfs_emit(buf, PAGE_SIZE, "%s\n", adev->product_number);
 }
 
 static DEVICE_ATTR(product_number, S_IRUGO,
@@ -203,7 +203,7 @@ static ssize_t amdgpu_device_get_serial_number(struct device *dev,
 	struct drm_device *ddev = dev_get_drvdata(dev);
 	struct amdgpu_device *adev = drm_to_adev(ddev);
 
-	return snprintf(buf, PAGE_SIZE, "%s\n", adev->serial);
+	return sysfs_emit(buf, PAGE_SIZE, "%s\n", adev->serial);
 }
 
 static DEVICE_ATTR(serial_number, S_IRUGO,
-- 
2.25.1

