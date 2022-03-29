Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E2FD4EA840
	for <lists+linux-media@lfdr.de>; Tue, 29 Mar 2022 09:00:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233249AbiC2HBx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Mar 2022 03:01:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230505AbiC2HBs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Mar 2022 03:01:48 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A1BA329A7
        for <linux-media@vger.kernel.org>; Tue, 29 Mar 2022 00:00:05 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id c62so19552886edf.5
        for <linux-media@vger.kernel.org>; Tue, 29 Mar 2022 00:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=m7nYYw9QbO9lD8x13zqrVQagOe2TVYJPaNjC3VlVpmg=;
        b=oVVVbZAR3MY5o2TmQnqB7eeOwx96uFW5NEkAXRefmX4Uff6MftBOHgTmGpAVRXOS+v
         L6UP/uT7RPa1+SNNqPTfInEV8RmSDIEQC62rICCbUdny5Mr3su6Kifi/CUJoCF1NhqDU
         eckFYmhXvqknkono3r/AVr3r2IBqyGbaqJ9f7tt+dm5ydKqgxJ5C4kLg4ZVs5swTD0l+
         rc0bi77SC0G+ubbt3wbvLxOO+XzBRzgvkS/cl6nuXzfufOKcN5eUUHkktLpVclgMHwnl
         t/fnQSUxcXtmv5cjGc88ADdzOPFhqgzmZqGH3GiN5jiAfCRflOQXbuncxjCsfhusxbiO
         ZbHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=m7nYYw9QbO9lD8x13zqrVQagOe2TVYJPaNjC3VlVpmg=;
        b=Nx4n4QOahC2TNxY2Gv66FfgsnYX82RZ/IrjWiwXg89Mrt97lVDMpcScry3VimOkQRv
         MtnI+zNmt1qvpDIOVb+16PU2H0G3VXyWTkW+FBBQNrZ1qCZwySj5uN1uWAWai74KxyRw
         qUHCqyA0wxg9kHVug52oiqZyNeVarNkoxpq71j95kkqnsWIJwG519GsHRcj2IfYqyDBG
         yOkOETtQvKtG0ijIKztjPWxdFhWsIqtg5r+Bx27ybcOiZ2pDnpGUXI58s2ylJJ9Fljyb
         Twn01IISdqJKmPWaP6d17+9Ug1GZMoCqxPAZ/GEIarUWvaCHtPm25FLXI+jGtktMQp8t
         T3oQ==
X-Gm-Message-State: AOAM531vsH6PdUeZsZxawRmFXw9E0Jx8GRYPoYibSFsanSENNObMdsNI
        3/sRkqphEMCOhjXYN1KGn+hGdIJpr3Q=
X-Google-Smtp-Source: ABdhPJwGoMU0Av/z3ii/A11iC+7ue7IwhIP52CrYOTJ7GqwhFFeYIZfyq9d8SzNMbBtauOSBP3Ah+A==
X-Received: by 2002:a50:8707:0:b0:41a:68df:1a6e with SMTP id i7-20020a508707000000b0041a68df1a6emr2640201edb.31.1648537203881;
        Tue, 29 Mar 2022 00:00:03 -0700 (PDT)
Received: from able.fritz.box (p5b0eab60.dip0.t-ipconnect.de. [91.14.171.96])
        by smtp.gmail.com with ESMTPSA id gv9-20020a170906f10900b006d7128b2e6fsm6593250ejb.162.2022.03.29.00.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Mar 2022 00:00:03 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        ville.syrjala@linux.intel.com, daniel@ffwll.ch
Cc:     =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH 1/2] dma-buf/sync-file: fix logic error in new fence merge code
Date:   Tue, 29 Mar 2022 09:00:00 +0200
Message-Id: <20220329070001.134180-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When the array is empty because everything is signaled we can't use
add_fence() to add something because that would filter the signaled
fence again.

Signed-off-by: Christian König <christian.koenig@amd.com>
Fixes: 519f490db07e ("dma-buf/sync-file: fix warning about fence containers")
---
 drivers/dma-buf/sync_file.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma-buf/sync_file.c b/drivers/dma-buf/sync_file.c
index b8dea4ec123b..514d213261df 100644
--- a/drivers/dma-buf/sync_file.c
+++ b/drivers/dma-buf/sync_file.c
@@ -262,7 +262,7 @@ static struct sync_file *sync_file_merge(const char *name, struct sync_file *a,
 	}
 
 	if (index == 0)
-		add_fence(fences, &index, dma_fence_get_stub());
+		fences[index++] = dma_fence_get_stub();
 
 	if (num_fences > index) {
 		struct dma_fence **tmp;
-- 
2.25.1

