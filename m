Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45C0E2AB297
	for <lists+linux-media@lfdr.de>; Mon,  9 Nov 2020 09:41:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728462AbgKIIl1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Nov 2020 03:41:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726176AbgKIIl0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Nov 2020 03:41:26 -0500
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com [IPv6:2607:f8b0:4864:20::d42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D928C0613CF;
        Mon,  9 Nov 2020 00:41:26 -0800 (PST)
Received: by mail-io1-xd42.google.com with SMTP id p7so8956493ioo.6;
        Mon, 09 Nov 2020 00:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7btXjqBRuinpD7KiP3l3qzjmEFoY9IFXHxyguH0t/3M=;
        b=vE+TwcYjMnjl7AwZgEbE4ExgYLtEzLZ9W1b12PN/XLNI4hdFVJEqSNaLrYq4mSUvL7
         UgKnP1i5dxJ3kDif5t4HQiE0FPwh1LxyLOx5fSx4In0KbMRsn+MZrDNjHTLfwr7dotcO
         xXnXq8aGkjCMBOgz0PlJtjzZr/TwmZNrMcBTYHOy9nZgJH14mNG8Tj6hAaeNd5t40X7U
         BLyC9irvrGwNBIeXDt3+A8yyTUVjQD5lRDXq9wcMPMmIP5IOOQJX/nh3qUy7SoKkfV39
         d83cJyDyCveUE/SmLpStqBViRd5GPJ0FNASEEORHcEgKogLCV5J6Vs0w+9QitwI20Swe
         +x9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7btXjqBRuinpD7KiP3l3qzjmEFoY9IFXHxyguH0t/3M=;
        b=FxxdsbcNZRtqHssxXmSCgP3A6dRhu1qXNpLegnDvRJ3CU6RK3SBVn7hSa4GMLopw47
         8jvwiq2o5JDv+LmrF2ZbayLkDPmawd4xLxD6FV1F8v8K4tEdVsASiVMA/r//KUIE2ys4
         Ok6wOLofrAGlJPN1MuiFcYewTBmXKOSE3ZRZonhvezqHuamRPyg3wOg6FZ1NNkJq5KMP
         kRtlCkvyELRZcDWOloM1CuocYvKWhJ/xeedFpLZG1Mn7HAKPW0PLc/w664IPNjHDDUUF
         KuxFKd49FQQeyNog/TzD0cwFrWS3HplkIixjpNqx4NQ668v9ZiPwLZgiEyIV0xAoNjlp
         dbnQ==
X-Gm-Message-State: AOAM532v99sR4wpcFVMkqX4KSzoNBzwMl3+8XZinlBoPoNUMeELHJZl0
        w/5dZzPRfEknTcp8rfSVgWg=
X-Google-Smtp-Source: ABdhPJw6hiS0UuWmPf3RDP3SsSRa2LK8tkwaoyxOfK5zCkid0TToP32VMAetRrUoPeVzj38GlOn+CA==
X-Received: by 2002:a5d:9a19:: with SMTP id s25mr4307991iol.94.1604911285982;
        Mon, 09 Nov 2020 00:41:25 -0800 (PST)
Received: from localhost.localdomain ([156.146.54.75])
        by smtp.gmail.com with ESMTPSA id t15sm5475191ili.64.2020.11.09.00.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 00:41:25 -0800 (PST)
From:   Bhaskar Chowdhury <unixbhaskar@gmail.com>
To:     alexander.deucher@amd.com, christian.koenig@amd.com,
        airlied@linux.ie, daniel@ffwll.ch, amd-gfx@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        ray.huang@amd.com, nicholas.kazlauskas@amd.com, jdelvare@suse.de
Cc:     gregkh@linuxfoundation.org,
        Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: [PATCH] drivers: amdgpu: amdgpu_display.c: Fix a spelling  doens\'t  to doesn\'t
Date:   Mon,  9 Nov 2020 14:08:24 +0530
Message-Id: <20201109083824.14664-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

s/doens't/doesn't/p

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
index 7cc7af2a6822..a92cb137293a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
@@ -512,7 +512,7 @@ uint32_t amdgpu_display_supported_domains(struct amdgpu_device *adev,
 	 * to avoid hang caused by placement of scanout BO in GTT on certain
 	 * APUs. So force the BO placement to VRAM in case this architecture
 	 * will not allow USWC mappings.
-	 * Also, don't allow GTT domain if the BO doens't have USWC falg set.
+	 * Also, don't allow GTT domain if the BO doesn't have USWC falg set.
 	 */
 	if ((bo_flags & AMDGPU_GEM_CREATE_CPU_GTT_USWC) &&
 	    amdgpu_bo_support_uswc(bo_flags) &&
--
2.26.2

