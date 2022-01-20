Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C808494EF3
	for <lists+linux-media@lfdr.de>; Thu, 20 Jan 2022 14:28:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236149AbiATN16 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Jan 2022 08:27:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235180AbiATN14 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Jan 2022 08:27:56 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67FC3C06161C
        for <linux-media@vger.kernel.org>; Thu, 20 Jan 2022 05:27:56 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id p18so12065239wmg.4
        for <linux-media@vger.kernel.org>; Thu, 20 Jan 2022 05:27:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=32x746+aqRVJfpOzq5mPUyMArnAKR0oshZjP3RNr6L8=;
        b=JB6DFT7fG55XAcBP0OpH10Gqzt7WQT8AwDJYXLHgPSdp5fcULgThwB66aca6ixgPFl
         8OCZPZh8swjc4+SOdWbQgKRJreT9q7vbCMQj1OPIOZi557SH0U4fwxzs01a724XMZ0vF
         nA5s20pHhMVs4ukENqvjHmD8Ju9TZa+vHN6PD2xYnyo1n0Btgv63Om6SjJ1ZuqwrNaMZ
         jVSX13Tc5ZBUHH1oVsNTvBLkcPIPzTX40mIWyS2CXcg/daA2a8gj74tPuQrOwtvLUiXa
         xC5yl3QyI1h6tPy+UxKTJe8pEHl9c6fHxgfAJx7ejbCW8MMAa5anwSZFgiBru4L8unHR
         Ss6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=32x746+aqRVJfpOzq5mPUyMArnAKR0oshZjP3RNr6L8=;
        b=MW6mhJwv7N93jj4sir1YkuBT+mqRGqad/SEYVRqaM3YvU0Z+9nlZvwWELbUUrDRmPj
         5x4FM7vx8t6BlDnLa+JOxWDa87ahc57Iug291hZTNj4ol8J1vuGtm9xLh64fmIu3GGh0
         0HbHAZqn2D5LJSY+Asfzi2raIZjtc61luc/6JkYgsvI/nR/XdDibB/8D2+qKaJO56LVs
         6ap0kzajvJtcMA4ucdk5X5rpPlDW7DbDpFFccLVyrxElV3zZHkh8XgB4UlwFKqxAU2i8
         39ihktC9GQUJrdCpQtbprCysCG2gShuq2hDSLUAWz0vLGGffmWzHNWexANs/3NHXiZ8V
         Qkow==
X-Gm-Message-State: AOAM533jkLQYQwMj4Vg4xWhfQXk4aD5xWdGxBajE30Q0PwQODnP944lu
        q7WyUll2hIGTLhVCDrUMQoVaW+atjtE=
X-Google-Smtp-Source: ABdhPJywJHgOVOLmBR5mzG5JMri0mseBaYfO5Sp+REkszykHT5ZEgC/018YsFmyAizxsvuQDoewpVA==
X-Received: by 2002:adf:904d:: with SMTP id h71mr33249269wrh.569.1642685275081;
        Thu, 20 Jan 2022 05:27:55 -0800 (PST)
Received: from abel.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
        by smtp.gmail.com with ESMTPSA id a9sm2658454wmm.32.2022.01.20.05.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jan 2022 05:27:54 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     sumit.semwal@linaro.org, gustavo@padovan.org,
        daniel.vetter@ffwll.ch, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 7/9] drm/amdgpu: use dma_fence_chain_contained
Date:   Thu, 20 Jan 2022 14:27:45 +0100
Message-Id: <20220120132747.2348-8-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220120132747.2348-1-christian.koenig@amd.com>
References: <20220120132747.2348-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Instead of manually extracting the fence.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
index f7d8487799b2..40e06745fae9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
@@ -261,10 +261,9 @@ int amdgpu_sync_resv(struct amdgpu_device *adev, struct amdgpu_sync *sync,
 
 	dma_resv_for_each_fence(&cursor, resv, true, f) {
 		dma_fence_chain_for_each(f, f) {
-			struct dma_fence_chain *chain = to_dma_fence_chain(f);
+			struct dma_fence *tmp = dma_fence_chain_contained(f);
 
-			if (amdgpu_sync_test_fence(adev, mode, owner, chain ?
-						   chain->fence : f)) {
+			if (amdgpu_sync_test_fence(adev, mode, owner, tmp)) {
 				r = amdgpu_sync_fence(sync, f);
 				dma_fence_put(f);
 				if (r)
-- 
2.25.1

