Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78A452C3153
	for <lists+linux-media@lfdr.de>; Tue, 24 Nov 2020 20:50:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726709AbgKXTrw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Nov 2020 14:47:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726599AbgKXToD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Nov 2020 14:44:03 -0500
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21AA6C061A4D
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2020 11:44:03 -0800 (PST)
Received: by mail-wm1-x342.google.com with SMTP id c198so90558wmd.0
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2020 11:44:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HQG7VvhLuLqLIiCO1wDsJUncEyILipv0iifGGhYNwBw=;
        b=ROnAYiAd5qDaRM6zlXai5MEWDhk655E2E+vwaBBQzU3vLw++RLC4/Jub4Bt3Hvy0HW
         pwVKhquuQdg0kk3tR1802CxvCaIcCwMmVQyiRfLJBffRMydYoXbNWu6QKx04FekT+/qp
         qoL59FYT3twrWeZa+Kd9U45wg7C8HeQReGIsbPxd3eF+kBkgnRVKLMICmYUZVZZcSKcB
         i3krnvNltBSKPhTsEx91aoglWLCC8evPXFNZ5CcQoBWLe40kKZ/NpidKAmX1NZFJSC5e
         3429CPqWQ2HYM51EEndQBWcN+40LTgM9aL9qXD4DJTS4i3u5d6Y7QaI4+o6IYnURuma3
         QtRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HQG7VvhLuLqLIiCO1wDsJUncEyILipv0iifGGhYNwBw=;
        b=q2lYPCsdO06Ry/Cu2XyM7tWcRQqXDsT5MDnWfxK7/h4YNyDg5PoO70Pg/j9AffCLhV
         1EIpnk8O5UHiVivPMbDALxUTogtmL5qSgcXoA6QDPyf6ql/9dMYLwGZLndSHNW8xc072
         OJ3gw0q9o9f/MI3V2YseVU6JSsvgKBx62qgcKXPW2VdSIIGpgPlg0ppBPPaPP5xmd10i
         Mij64e1I8te0NkLfIfcC1hb/iOPxCjyIf1upjxiWX4YBD84o+EYciK05nn/9vCP77e5p
         JYyFmJJxadqqTw53a4nZm8tQQU58Y/HQ+n1InSAXGZsl77aLAViTXs30nYk5LeFY0DqI
         Fl7w==
X-Gm-Message-State: AOAM530apKSTO4/NzXDBhzuQnfuybxy/fAmtFNiuy3YWNNDSdIztdXYr
        eokaNB1ydoCiSxflupMN9alo/AuMmUoReFl6
X-Google-Smtp-Source: ABdhPJxABCqmQpKoOyO33AaWgS8+y0qIF8skdrZlNoUJ266NV2fmZqe3GarA3FNS1UObzNFWwWwgCA==
X-Received: by 2002:a1c:4b10:: with SMTP id y16mr22750wma.10.1606247041886;
        Tue, 24 Nov 2020 11:44:01 -0800 (PST)
Received: from dell.default ([91.110.221.235])
        by smtp.gmail.com with ESMTPSA id d134sm200511wmd.8.2020.11.24.11.44.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2020 11:44:01 -0800 (PST)
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
Subject: [PATCH 02/40] drm/amd/amdgpu/gmc_v10_0: Suppy some missing function doc descriptions
Date:   Tue, 24 Nov 2020 19:37:46 +0000
Message-Id: <20201124193824.1118741-3-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201124193824.1118741-1-lee.jones@linaro.org>
References: <20201124193824.1118741-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c:278: warning: Function parameter or member 'vmhub' not described in 'gmc_v10_0_flush_gpu_tlb'
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c:278: warning: Function parameter or member 'flush_type' not described in 'gmc_v10_0_flush_gpu_tlb'
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c:371: warning: Function parameter or member 'flush_type' not described in 'gmc_v10_0_flush_gpu_tlb_pasid'
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c:371: warning: Function parameter or member 'all_hub' not described in 'gmc_v10_0_flush_gpu_tlb_pasid'

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
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
index d9399324be474..4887b0e66e975 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
@@ -270,6 +270,8 @@ static void gmc_v10_0_flush_vm_hub(struct amdgpu_device *adev, uint32_t vmid,
  *
  * @adev: amdgpu_device pointer
  * @vmid: vm instance to flush
+ * @vmhub: vmhub type
+ * @flush_type: the flush type
  *
  * Flush the TLB for the requested page table.
  */
@@ -362,6 +364,8 @@ static void gmc_v10_0_flush_gpu_tlb(struct amdgpu_device *adev, uint32_t vmid,
  *
  * @adev: amdgpu_device pointer
  * @pasid: pasid to be flush
+ * @flush_type: the flush type
+ * @all_hub: Used with PACKET3_INVALIDATE_TLBS_ALL_HUB()
  *
  * Flush the TLB for the requested pasid.
  */
-- 
2.25.1

