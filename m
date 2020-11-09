Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC5BA2AC6F0
	for <lists+linux-media@lfdr.de>; Mon,  9 Nov 2020 22:21:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731197AbgKIVTY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Nov 2020 16:19:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731022AbgKIVTX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Nov 2020 16:19:23 -0500
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A825C0613CF
        for <linux-media@vger.kernel.org>; Mon,  9 Nov 2020 13:19:22 -0800 (PST)
Received: by mail-wm1-x344.google.com with SMTP id t67so902392wmt.5
        for <linux-media@vger.kernel.org>; Mon, 09 Nov 2020 13:19:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mzXhCpiCwfXhn5UZVrUN8y55iF7Guz7qLR0QXW6Magc=;
        b=E9yOQdMhotNG/FmE2dQJiD0qZR2wVPwJ5vehlHuLTLfjg1jR9o5wsvjApIc0HsAoaZ
         8qkna1nD8pDl/vM/3OBHtp/FmUb2nst5uLUBWgGS6fKuFHw/7kaia+s30iU85HXrgJ2d
         W+AsyMp7+7a2eiwEY49kWaRTKHSfjRPq/fnNRWjEYHm29TrLP53ZF7vB0FubYev+Fb2b
         Zh7m6Bpat6KyzNntvJ5HdJsheSg03sQOSHUslkzMUOhFnBsVIscuSdJVUrqOivIRbb21
         wGeWuPmoWkWfZSKBsErebYJ/J5S6cHJnNh+7AOgnAtr0I/PNy+e4jUw2i/WQqXZ1HpP8
         BmOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mzXhCpiCwfXhn5UZVrUN8y55iF7Guz7qLR0QXW6Magc=;
        b=Z7aj46DY/YC3s0vfhh2SAhXYKUOuqLPp4aEbGdHzUmZdcJe+1v77GGi7AgbtrW6SyB
         YUTeompQKQf7/tyqNxqc441RHriOv61TKfMdvtz1v22pz3qMXPwvHYDgLIQELxb0kp06
         ODTVrJs2fcqhV4CUaHetD9+OoedjLeqht6KFRIhxZ7Z7OZzNwjkLO0dHJoUQjOYHCgKD
         Ct7Jc0ojxo4a0YcPnqBZWJB5/qDScswSY+RtFdRGGzkrPpdEgUCGAvieru0NIhJDAFKt
         Uxg2cZ91B0RbOZgUHaxrtzJw0HKRTBpJ522zIzbtJtDrYU47hqB0DiuqvSH1//leD/fV
         iybQ==
X-Gm-Message-State: AOAM530uKK2iI9bJsWFSuoiZMTJ8Y/P7+N5c+L/dof4BQC9wDZPQ8Kyg
        Qdy+zD7G4vSSbDF8hBVSyqOFTw==
X-Google-Smtp-Source: ABdhPJz7gosq03zFigv4Og0US7gk4Sex1qokBiUld+OMUY44DLZUxJaFKrfBrf69+FZ+3dQiMYRZLQ==
X-Received: by 2002:a7b:c5c3:: with SMTP id n3mr1133832wmk.44.1604956761276;
        Mon, 09 Nov 2020 13:19:21 -0800 (PST)
Received: from dell.default ([91.110.221.139])
        by smtp.gmail.com with ESMTPSA id 71sm15170630wrm.20.2020.11.09.13.19.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 13:19:20 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        report to <xorg-driver-ati@lists.x.org>,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 07/20] drm/radeon/radeon_display: Remove unused variable 'mod'
Date:   Mon,  9 Nov 2020 21:18:42 +0000
Message-Id: <20201109211855.3340030-8-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201109211855.3340030-1-lee.jones@linaro.org>
References: <20201109211855.3340030-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/radeon/radeon_display.c: In function ‘radeon_div’:
 drivers/gpu/drm/radeon/radeon_display.c:1094:11: warning: variable ‘mod’ set but not used [-Wunused-but-set-variable]

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: report to <xorg-driver-ati@lists.x.org>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/radeon/radeon_display.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_display.c b/drivers/gpu/drm/radeon/radeon_display.c
index bd60f16fd0d78..78fceedfd9255 100644
--- a/drivers/gpu/drm/radeon/radeon_display.c
+++ b/drivers/gpu/drm/radeon/radeon_display.c
@@ -1091,11 +1091,9 @@ void radeon_compute_pll_avivo(struct radeon_pll *pll,
 /* pre-avivo */
 static inline uint32_t radeon_div(uint64_t n, uint32_t d)
 {
-	uint64_t mod;
-
 	n += d / 2;
 
-	mod = do_div(n, d);
+	do_div(n, d);
 	return n;
 }
 
-- 
2.25.1

