Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 325FD2ADFAA
	for <lists+linux-media@lfdr.de>; Tue, 10 Nov 2020 20:33:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732867AbgKJTdb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Nov 2020 14:33:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731780AbgKJTbh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Nov 2020 14:31:37 -0500
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97B19C0613D4
        for <linux-media@vger.kernel.org>; Tue, 10 Nov 2020 11:31:36 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id a65so4311297wme.1
        for <linux-media@vger.kernel.org>; Tue, 10 Nov 2020 11:31:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sNPdGWABv4jG6EjCUZH3w6oQTK+ox++FdPmHOUbRD6w=;
        b=fASKJQ1F2LCs/AXSrcItfdLVqsf0CAL2+ISvgcB4CsEelSk6mnK06tXoPNySTK7MHU
         1TEc5IRZOgZd6Q+mBlBBeCLeVUEo7SuJqHyCRR9YXaMmYcLXdhPNTgxIFrRW+Mh/TBVy
         2R0rZoZXmlUx7+E+do7U1FoKSGq6OyO/n8XM74q9QAJN8kiU3gqLtgxe7Twd8VZ0ZQr6
         BzEzhavEf5cCFsfsimr552j4Kqo7jIJ3YNsiNF2ht4DN0WNJJ+eSrIcXid5p/sbfUHdb
         MVorhUAzWurm5GkOqUYzYaThJsDwVkA5gWpGY6HJZZItFJohZ6GAEU17mxG6lF2296+z
         FhqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sNPdGWABv4jG6EjCUZH3w6oQTK+ox++FdPmHOUbRD6w=;
        b=DcHsQO7cIk+Ij4NnpLN80AMHg3VI+rRWoYmGgimFi3FmsreUUhg7r1vHQ09Gedck1E
         /5D69PpQ3rCtckvEt2VIgRt1RlFbWtu79vacGLTfbw0cXa2MTif+dztCfClXizN26Xvi
         WnMsjfiCqvoSidRc4HKRx6SpfFViqFP+AwDlqGkjg4crAn+VmyF2+VgGysukflnNhNX1
         o6Dmx4clVPtPGvDYsjy/jrmXmX0OZ0ew20XMIt57AsUSHWQU8o/9YlIkXHesedpbd66U
         DETDVaSVfp0DT74NrN1O4rWXPhehzY74L2Qvp+iZUQK2tLc9PwqmMFPTT2Ap24o2gaGy
         hJmA==
X-Gm-Message-State: AOAM533itna6iPazYtuajRN0ppwS2R7xmQMA9zZuJZYBEMlIsVYpoa9c
        WUsO3+sPmUE0K19Z7wxQ8ODi6A==
X-Google-Smtp-Source: ABdhPJwbSyUwCQvxoTz0sM425fPOU7xGkt033a2qrUmzUxTVV2GqCTMp1AIaiNCG/Jfa0ilVVhAaOA==
X-Received: by 2002:a1c:b041:: with SMTP id z62mr713702wme.183.1605036695387;
        Tue, 10 Nov 2020 11:31:35 -0800 (PST)
Received: from dell.default ([91.110.221.139])
        by smtp.gmail.com with ESMTPSA id 30sm17635335wrs.84.2020.11.10.11.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2020 11:31:34 -0800 (PST)
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
Subject: [PATCH 15/30] drm/radeon/cik_sdma: Demote vague attempt at kernel-doc
Date:   Tue, 10 Nov 2020 19:30:57 +0000
Message-Id: <20201110193112.988999-16-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201110193112.988999-1-lee.jones@linaro.org>
References: <20201110193112.988999-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/radeon/cik_sdma.c:949: warning: Function parameter or member 'ring' not described in 'cik_dma_vm_flush'
 drivers/gpu/drm/radeon/cik_sdma.c:949: warning: Function parameter or member 'vm_id' not described in 'cik_dma_vm_flush'
 drivers/gpu/drm/radeon/cik_sdma.c:949: warning: Function parameter or member 'pd_addr' not described in 'cik_dma_vm_flush'

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
 drivers/gpu/drm/radeon/cik_sdma.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/radeon/cik_sdma.c b/drivers/gpu/drm/radeon/cik_sdma.c
index 68403e77756d3..3c709ebe8d1ab 100644
--- a/drivers/gpu/drm/radeon/cik_sdma.c
+++ b/drivers/gpu/drm/radeon/cik_sdma.c
@@ -936,11 +936,9 @@ void cik_sdma_vm_pad_ib(struct radeon_ib *ib)
 		ib->ptr[ib->length_dw++] = SDMA_PACKET(SDMA_OPCODE_NOP, 0, 0);
 }
 
-/**
+/*
  * cik_dma_vm_flush - cik vm flush using sDMA
  *
- * @rdev: radeon_device pointer
- *
  * Update the page table base and flush the VM TLB
  * using sDMA (CIK).
  */
-- 
2.25.1

