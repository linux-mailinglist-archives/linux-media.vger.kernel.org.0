Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51D112994E9
	for <lists+linux-media@lfdr.de>; Mon, 26 Oct 2020 19:12:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1789269AbgJZSMt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Oct 2020 14:12:49 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:44010 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1783561AbgJZSMt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Oct 2020 14:12:49 -0400
Received: by mail-pl1-f195.google.com with SMTP id o9so5109767plx.10;
        Mon, 26 Oct 2020 11:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=5HO3BVg0bRzxOwVnCXHaH7lLzHwWVLX1pNvQSsPVR34=;
        b=rOPmEVV1mJNejym0bVuvH9D4QxMR/bgR/uiSbmV/sI7ehBqx9zE3tPQI3irbzRxDDd
         NVkrepuMoOB1w0rze3dUFqEABBGq17D70yo/wQS+XFRhJ1knlr0TapHWZeaLm0lLgVCk
         ajbJ95GkSBe22vslkDkxh0/mNDW9UCzxwEqwbcAtBcZ3rWDFT8cs/8wr40BP+cKqQAHf
         Xqaj+8TzKs8sGYoowwCqyFoKjAJxNF44AEdMxKebFyX5QZoG10rCJsWZXnAoU8L+BFA/
         TxvFoEMzVN/jfugVoIQqz07xC2kpg1KYm5gwFSxpUVe5PR3Uwti4rO2g8TWdiFD7Ja6N
         cmJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=5HO3BVg0bRzxOwVnCXHaH7lLzHwWVLX1pNvQSsPVR34=;
        b=hJjUPnzRcU0CDylnY5MTueLeZfswLbDbI3vHy+iIVLocsl9shvOH9lnvKKN9XNvi+4
         GPazkX8anEvfjSsw4Jsn6svgX8n1IfUEWRmx+F5jF7cE9sYbngaEf/65XuhfFMtR6QM4
         U/kXY6IKeebr/PZpO6b3fF6oLSb+TSEIzUay6w3moA9w4gLN15227F6pOdCZoIxJQnLF
         ggTat6JE4iYol9rRo6iMWogUbiz27N6iUa/xEdbuES/0w8Ubh0ovCIrZAig7vowGKRH4
         wiS23oahCeknW9r/XeWMfGF6LXpXy5RcpGltTauyGpuDPVMzF+lV8bzcP6uaHlWeh8HL
         sOdw==
X-Gm-Message-State: AOAM5334yd3ebPj/JmoRyf9FzSl+w2tm0eINznjS0xPArG253k8GqJT6
        CgveekQWjtgMhjwt8uIXAzI=
X-Google-Smtp-Source: ABdhPJw3MC9VJsJhf5LCjsccN1B3MXJSG0DukEpFAVyN8RH/TmAVMPOYgh2O/ngXwLl+nzdW6ZCrPw==
X-Received: by 2002:a17:90a:ca:: with SMTP id v10mr22381893pjd.18.1603735968845;
        Mon, 26 Oct 2020 11:12:48 -0700 (PDT)
Received: from adolin ([49.207.196.21])
        by smtp.gmail.com with ESMTPSA id m3sm7813796pfd.217.2020.10.26.11.12.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 11:12:48 -0700 (PDT)
Date:   Mon, 26 Oct 2020 23:42:42 +0530
From:   Sumera Priyadarsini <sylphrenadin@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     daniel@ffwll.ch, Felix.Kuehling@amd.com, alexander.deucher@amd.com,
        christian.koenig@amd.com, airlied@linux.ie,
        sumit.semwal@linaro.org, amd-gfx@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        outreachy-kernel@googlegroups.com, melissa.srw@gmail.com
Subject: [Outreachy][PATCH] drm/amdgpu: use true and false for bool
 initialisations
Message-ID: <20201026181242.76bf3b6gx2yx7hr7@adolin>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Bool initialisation should use 'true' and 'false' values instead of 0
and 1.

Modify amdgpu_amdkfd_gpuvm.c to initialise variable is_imported
to false instead of 0.

Issue found with Coccinelle.

Signed-off-by: Sumera Priyadarsini <sylphrenadin@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index 64d4b5ff95d6..ba4bd06bfcc5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -1288,7 +1288,7 @@ int amdgpu_amdkfd_gpuvm_free_memory_of_gpu(
 	struct ttm_validate_buffer *bo_list_entry;
 	unsigned int mapped_to_gpu_memory;
 	int ret;
-	bool is_imported = 0;
+	bool is_imported = false;
 
 	mutex_lock(&mem->lock);
 	mapped_to_gpu_memory = mem->mapped_to_gpu_memory;
-- 
2.25.1

