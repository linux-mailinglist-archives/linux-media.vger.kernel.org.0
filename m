Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE9152C0400
	for <lists+linux-media@lfdr.de>; Mon, 23 Nov 2020 12:19:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728809AbgKWLT3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Nov 2020 06:19:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728808AbgKWLT2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Nov 2020 06:19:28 -0500
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6603DC061A4D
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2020 03:19:28 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id p22so17510856wmg.3
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2020 03:19:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Aak1C5AROsIvSC+gcDbF5DK1OJsF92xIrCqFvBLF46A=;
        b=zQXLmgbCPdBSYkDzMUUmb9OMYNzAd9s1IP7it3fe9XT/V9GoG2disqTb5wa/JjkWa9
         n/jZa6zxmCNpvPvcyz1r7faJ4gWimYqeWiS8C0RyVvKdGa6FjJU9OjP+8WMK2E3RyS8b
         Yc6Y9LLhLN5636l3WW191hBEQ/rQE68cFW1YNXywf6Zhc0g6ISACxJVVW6TwmToiGTpt
         g7zqnQbHkoKDVbbtUeoiFJP/Vlc+ey0E3AgWuX0QTviMzXHruZDJsUpseTRYgYmOhcYQ
         B8jLRV0eqvVTaCO6XCFInlj0sYY7pgadoxGh27YIK3rJB9D9KPGTFLGwFBm9A/bikrx6
         lLgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Aak1C5AROsIvSC+gcDbF5DK1OJsF92xIrCqFvBLF46A=;
        b=AxUzdZcP8ruXlHloHEMjxnUsqNZ2BNHmMtHxXiCCk6dVCCfjZD55PTrJ8tVS14EdYN
         D6wfHmgonbLM1M21M6PJt09oWhNuMCDgV9CSqJ4ZPnKqBG9Xj2dATEKSsmfV6U5JzdKe
         jweuQUz3uLaR5dVKTa/nY1zcQpgV701miM2DtzTUb//4gjXRwztwpVgl9rktWU676ZVX
         72UH73Ny8TcCiL3rpUEeGTmgOj20mAzZz2nb5nNeyImRB1PmigQLVUxd+aLCg+imikeZ
         D54nMQCruKt6PYuma4Ug2fyqaa0H4hDHE9zEEghl/dyfAj8OesCSpshJjACarZulE8Sa
         f0SA==
X-Gm-Message-State: AOAM531ivI+TpybVMojvLOAOoD9pFJpW8Pw3dO4aErLfTBrmCgIhGFis
        NIpWD8HdyEPXpIw+CMC92NEzqA==
X-Google-Smtp-Source: ABdhPJxzlhwbPFfCCCY4C6L4cRtqY3gatpejZGdMPL7K/CPJhYf3UqKcqEXab0w9gopVxgJ/0quHOg==
X-Received: by 2002:a1c:4c02:: with SMTP id z2mr11190930wmf.139.1606130367035;
        Mon, 23 Nov 2020 03:19:27 -0800 (PST)
Received: from dell.default ([91.110.221.218])
        by smtp.gmail.com with ESMTPSA id n9sm16317290wmd.4.2020.11.23.03.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2020 03:19:26 -0800 (PST)
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
Subject: [PATCH 03/40] drm/amd/amdgpu/amdgpu_ib: Provide docs for 'amdgpu_ib_schedule()'s 'job' param
Date:   Mon, 23 Nov 2020 11:18:42 +0000
Message-Id: <20201123111919.233376-4-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201123111919.233376-1-lee.jones@linaro.org>
References: <20201123111919.233376-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c:127: warning: Function parameter or member 'job' not described in 'amdgpu_ib_schedule'

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
 drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c
index c69af9b86cc60..024d0a563a652 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c
@@ -106,6 +106,7 @@ void amdgpu_ib_free(struct amdgpu_device *adev, struct amdgpu_ib *ib,
  * @ring: ring index the IB is associated with
  * @num_ibs: number of IBs to schedule
  * @ibs: IB objects to schedule
+ * @job: job to schedule
  * @f: fence created during this submission
  *
  * Schedule an IB on the associated ring (all asics).
-- 
2.25.1

