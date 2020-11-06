Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A53592A9F7F
	for <lists+linux-media@lfdr.de>; Fri,  6 Nov 2020 22:50:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728821AbgKFVup (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Nov 2020 16:50:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728774AbgKFVuM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Nov 2020 16:50:12 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B39EC0613CF
        for <linux-media@vger.kernel.org>; Fri,  6 Nov 2020 13:50:12 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id p1so2767317wrf.12
        for <linux-media@vger.kernel.org>; Fri, 06 Nov 2020 13:50:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/vzXOfe3LQJ1tPjw4mGTlBd2Hha/B9WB2NE4h+LPHsM=;
        b=CTrg6Tx6WbaAEcip1oP69BTNYGApk3DcwyCdUIuDQ2NDdnRBvWJ1vAX/ZU360Uj2H3
         z2RJwZ1+S16zy979ZmaON1OE5ShHP9tn4UZpPgSmyA/uBIfj1vjmH+jWAjbfh3kcAI+N
         vT9asDh4Mu/wxBCF1XvL2esu1JYbTTLz+JNFFGMzs0UJu4zl3JLxby5TvA9gZghh1n8E
         xgYZIZKANmxc4y1D04xef/nQe3Mc/WsFTjsItHINOS2+gcjAGg4rCIRkTLtMqCjztxQv
         AImujyKOROsE+WUyTvErplm6dKHsfOgyEv5JJ1hSVPExxmbbHfSR6B+4fSicdViUancm
         iJig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/vzXOfe3LQJ1tPjw4mGTlBd2Hha/B9WB2NE4h+LPHsM=;
        b=pbsZfN80t7y2OU0tEBvX9dbbvboLjJ0ouq2Hm6KJyD/RTv6DcVqWpIpZi3fnwj0Dok
         x9nSuTl3GvOI1t59Ju1tF+XZC/NI5HhrS73EctryhDNAMKrAqk0xIM1mH68OCUGlNtWq
         2i3q1r4VWSibJMn7QnAjxY4AKqtY8mFtKVMgM/GfZhs/X1h3VGhoKq8DmSoqlzP53O3o
         Ek9hlbLzMMr/nuyDSNe0OD4xhtApmKF//9EACmyCuFO1fPCpqB/NWuJOXNnSAaI3Is1I
         rItUJoOmImzrn6uV6dKw6DJq6lcDNUvnqDZLIUm7tcck8ISoNriguilZOpnhM+JoT2Lq
         k42g==
X-Gm-Message-State: AOAM533Rv0oihmCPyb0+2Jg3b/xEZeOha5p0hae0USlJv9E7kZDLpQ2Z
        8V7IBlK6a0PQLYF2IqH7R7bPtw==
X-Google-Smtp-Source: ABdhPJxQroqDiuh4YZmo0CrJXSKpglFCwdy1Ztrmqj30qO0MXpAppEYJtzGiZ8+5YyyQWuEL8dUjvA==
X-Received: by 2002:adf:e551:: with SMTP id z17mr4904423wrm.374.1604699411021;
        Fri, 06 Nov 2020 13:50:11 -0800 (PST)
Received: from dell.default ([91.110.221.236])
        by smtp.gmail.com with ESMTPSA id t199sm3981084wmt.46.2020.11.06.13.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2020 13:50:10 -0800 (PST)
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
Subject: [PATCH 14/19] drm/amd/amdgpu/amdgpu_device: Provide documentation for 'reg_addr' params
Date:   Fri,  6 Nov 2020 21:49:44 +0000
Message-Id: <20201106214949.2042120-15-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201106214949.2042120-1-lee.jones@linaro.org>
References: <20201106214949.2042120-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:594: warning: Function parameter or member 'reg_addr' not described in 'amdgpu_device_indirect_rreg'
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:624: warning: Function parameter or member 'reg_addr' not described in 'amdgpu_device_indirect_rreg64'

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
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 300fcade4a2b1..63374d12e00fe 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -585,6 +585,7 @@ void amdgpu_mm_wdoorbell64(struct amdgpu_device *adev, u32 index, u64 v)
  * @adev: amdgpu_device pointer
  * @pcie_index: mmio register offset
  * @pcie_data: mmio register offset
+ * @reg_addr: indirect register address to read from
  *
  * Returns the value of indirect register @reg_addr
  */
@@ -615,6 +616,7 @@ u32 amdgpu_device_indirect_rreg(struct amdgpu_device *adev,
  * @adev: amdgpu_device pointer
  * @pcie_index: mmio register offset
  * @pcie_data: mmio register offset
+ * @reg_addr: indirect register address to read from
  *
  * Returns the value of indirect register @reg_addr
  */
-- 
2.25.1

