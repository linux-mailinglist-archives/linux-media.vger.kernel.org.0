Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 065642B1C6A
	for <lists+linux-media@lfdr.de>; Fri, 13 Nov 2020 14:52:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726955AbgKMNuB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Nov 2020 08:50:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726929AbgKMNt5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Nov 2020 08:49:57 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4BCFC0617A7
        for <linux-media@vger.kernel.org>; Fri, 13 Nov 2020 05:49:53 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id 23so9964610wrc.8
        for <linux-media@vger.kernel.org>; Fri, 13 Nov 2020 05:49:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wz9PYnHV1aU7HpVwR+iBYjW10NIO6mvxzzKOFF06bog=;
        b=iKoC8B6k4QLo4AWSzbSH0Yrm7UKDvnSV0l7UwGmamQfyeBV2XLjR211KOhMkiXIisO
         IDz+WNVInujhwmf9aaXfhzFILS7NiSh3vsj5eF+RfyTdnaNmjnhOkPIfyoC1ApUGpwXy
         WjRZvxDpzJ4UQJA0JvtL3ym5KMN2kwldsYCptf3xhEPtJRtR4XPPDyYl5pqVLSMfUfhq
         DKcTM3MotgxZzP7gCG+T4LVpjHTH4qh5JMszYbGsrHS6tba1wEO/qGVRjpDHN7gpbP/n
         +OqfOZ0mM+GGy3ezTwuagbFHABQCfou0M/gz0pVp3T/IYK9BBrP4AQwSBVx84X7GP6hc
         aWbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wz9PYnHV1aU7HpVwR+iBYjW10NIO6mvxzzKOFF06bog=;
        b=Nn5WslmSMkiyjTzeqFd7e6qqT1SZg0tqX4IEDEOOsbq8/J7RSR0mODUbUFbryzN9wl
         iL8tErIhdU7+9GzGiW7JhxhpnJofDmkL+aUlJTNeO+kHICYBSuhyyoVXjuhaJ3tnibgC
         C5tX2VQ7F88uQcie3SHtdK/UqYcMN/+NMbesZwqQRumF/G7oIbl/0ZMMbLwjUSAnEhPg
         tg0k6A7tbPcFsLF8TXr88ijY1ypb+2K5aeJSpzMxs2LKHKr38bOaX1nm95V67m/PJhoL
         T+C24Ck/RGMlWRwohr6PeS4L0mjD+eIw4nHjTfptvDARBIXketKdV2WPelnLmuuueTCe
         xQSw==
X-Gm-Message-State: AOAM5329Rcb83u6J5i1iLFdCr/3PrV1bFbn07ush2ANxLyOgPK7pHkHs
        hEzeLgkazVJZO45VO/JdvFa7gA==
X-Google-Smtp-Source: ABdhPJy2NJmUUpRfSID2bkr8Mb/olrJXjNUbUo9Ig1eRSw/0S7/jC2WzJcmll/j0ffrezB2ZJdrzug==
X-Received: by 2002:adf:f808:: with SMTP id s8mr3615775wrp.257.1605275392170;
        Fri, 13 Nov 2020 05:49:52 -0800 (PST)
Received: from dell.default ([91.110.221.159])
        by smtp.gmail.com with ESMTPSA id t11sm4561614wrm.8.2020.11.13.05.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2020 05:49:51 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 08/40] drm/amd/amdgpu/amdgpu_ib: Fix some incorrect/incomplete function documentation
Date:   Fri, 13 Nov 2020 13:49:06 +0000
Message-Id: <20201113134938.4004947-9-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201113134938.4004947-1-lee.jones@linaro.org>
References: <20201113134938.4004947-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c:66: warning: Function parameter or member 'adev' not described in 'amdgpu_ib_get'
 drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c:66: warning: Function parameter or member 'vm' not described in 'amdgpu_ib_get'
 drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c:66: warning: Function parameter or member 'pool_type' not described in 'amdgpu_ib_get'
 drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c:66: warning: Excess function parameter 'ring' description in 'amdgpu_ib_get'
 drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c:125: warning: Function parameter or member 'ring' not described in 'amdgpu_ib_schedule'
 drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c:125: warning: Function parameter or member 'job' not described in 'amdgpu_ib_schedule'
 drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c:125: warning: Excess function parameter 'adev' description in 'amdgpu_ib_schedule'

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c
index 2f53fa0ae9a62..c69af9b86cc60 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c
@@ -52,8 +52,10 @@
 /**
  * amdgpu_ib_get - request an IB (Indirect Buffer)
  *
- * @ring: ring index the IB is associated with
+ * @adev: amdgpu_device pointer
+ * @vm: amdgpu_vm pointer
  * @size: requested IB size
+ * @pool_type: IB pool type (delayed, immediate, direct)
  * @ib: IB object returned
  *
  * Request an IB (all asics).  IBs are allocated using the
@@ -101,7 +103,7 @@ void amdgpu_ib_free(struct amdgpu_device *adev, struct amdgpu_ib *ib,
 /**
  * amdgpu_ib_schedule - schedule an IB (Indirect Buffer) on the ring
  *
- * @adev: amdgpu_device pointer
+ * @ring: ring index the IB is associated with
  * @num_ibs: number of IBs to schedule
  * @ibs: IB objects to schedule
  * @f: fence created during this submission
-- 
2.25.1

