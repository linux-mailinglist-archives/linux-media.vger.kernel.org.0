Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30D9B2AC6AE
	for <lists+linux-media@lfdr.de>; Mon,  9 Nov 2020 22:10:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730764AbgKIVJ5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Nov 2020 16:09:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725946AbgKIVJ5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Nov 2020 16:09:57 -0500
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com [IPv6:2607:f8b0:4864:20::841])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1046FC0613CF;
        Mon,  9 Nov 2020 13:09:57 -0800 (PST)
Received: by mail-qt1-x841.google.com with SMTP id g15so3361194qtq.13;
        Mon, 09 Nov 2020 13:09:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/0XocD5P4X8PutfEBTr0iQ6o7VPBilDjyKi4NGpWaVc=;
        b=NGhqvmdqdeTsnOAPi1e5Vd1qdGimaQPD+OZZ7kiZ5p5sQGqAxeqoBFwYejrxi1j2WP
         f9gXR9FS5Ko+gq0afQJcfyyerPqO9NQuLqIRyJOPGK/al3votarLB9dVrDkf9rfE6pzB
         nSbwZOgoA4nrUiQpTZI6dh8NaHw9y19ug1V0x6EfqKJzIL4JaJ78FpaO1ljI8BCKNJQC
         qL5peFy7bg0NzjWgIYZkSmWO0tcV4Nu6HgVInMnWr97rfXw71KU6qw6ADW3PZ+6a/aer
         o4rX/XGWDDvd64WvJZto4lQdfbtjGV7/9r8jXQvDI79wWemK2m9AUTtm8RZQHj9grU8W
         IGeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/0XocD5P4X8PutfEBTr0iQ6o7VPBilDjyKi4NGpWaVc=;
        b=BMqKGXRoQDjN4CHoW1w6Uhh3W+eNOEX22689xz0TWVcf09/DKJaHxQX45e9vOwFPsW
         g/MKk90FqwOZrVKyWEV9EMeTO20Hp+N1Avq1PKjQj5fFO+IpWduqovHg+lvfzaj95dca
         nD6HxDFwgTnSKhOAL9+6HAZc8EkcPU9RL+2VnGv15Dda6+f7t6xpxFMgo+edQWt5xyI2
         0PWGLdCTZC1FOlA8qrWZSKcPONaa9UsegLj2rqYX/awl1bu0JXd28ewKm/QpVH5ebo+W
         dcbSwFriLUzGNgtxVusq4+U9upsnwZU3XH5PEhKxk8V/lzHv+80OmWQ9AC76Jv8dQamf
         Uwig==
X-Gm-Message-State: AOAM532TjTYb2qEhEvYB9VjrzjIuB7DzILT4LlonzYiQKxkH9YyAQLnO
        1Lwq8DTv6lQPpeBgElN8WSw=
X-Google-Smtp-Source: ABdhPJweV+Szh+PkEAYXoXyjTozPf81Tox2F7Dj/v1OFpc1GcHYkrXzj/rpBR38tMgQhU19OWI65SQ==
X-Received: by 2002:ac8:5649:: with SMTP id 9mr14720827qtt.379.1604956196346;
        Mon, 09 Nov 2020 13:09:56 -0800 (PST)
Received: from localhost.localdomain ([156.146.36.180])
        by smtp.gmail.com with ESMTPSA id o21sm7161000qko.9.2020.11.09.13.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 13:09:55 -0800 (PST)
From:   Bhaskar Chowdhury <unixbhaskar@gmail.com>
To:     alexander.deucher@amd.com, christian.koenig@amd.com,
        airlied@linux.ie, daniel@ffwll.ch, jdelvare@suse.de,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
Cc:     Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: [PATCH] drivers: amdgpu: amdgpu_display: Fixed the spelling of falg to flag
Date:   Tue, 10 Nov 2020 02:37:25 +0530
Message-Id: <20201109210725.24668-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

s/falg/flag/p

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
index 2e8a8b57639f..9223502c1e5b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
@@ -509,7 +509,7 @@ uint32_t amdgpu_display_supported_domains(struct amdgpu_device *adev,
 	 * to avoid hang caused by placement of scanout BO in GTT on certain
 	 * APUs. So force the BO placement to VRAM in case this architecture
 	 * will not allow USWC mappings.
-	 * Also, don't allow GTT domain if the BO doens't have USWC falg set.
+	 * Also, don't allow GTT domain if the BO doens't have USWC flag set.
 	 */
 	if ((bo_flags & AMDGPU_GEM_CREATE_CPU_GTT_USWC) &&
 	    amdgpu_bo_support_uswc(bo_flags) &&
--
2.26.2

