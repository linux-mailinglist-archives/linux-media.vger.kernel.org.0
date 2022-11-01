Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED5FE61545E
	for <lists+linux-media@lfdr.de>; Tue,  1 Nov 2022 22:40:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230450AbiKAVkd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Nov 2022 17:40:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229591AbiKAVkc (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Nov 2022 17:40:32 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEF281E725;
        Tue,  1 Nov 2022 14:40:31 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id k15so6603174pfg.2;
        Tue, 01 Nov 2022 14:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iWEKtw3qUiAawaOxdqPs0umv7nzkxV855xae9pF938c=;
        b=VZJNFuV6OqUqkfyPaVBqFRI+HviyopjecL9O6a9KR4Dnv8fxfloSbQqHTlU5JDSJOZ
         Pcaf0S6s8TcGkbxtKETFXAKgbzTe/IXDkokGzWw0acAPUzDDYfblLW7lLXrvM2LC0/vI
         x84dmhX0CRy3+gkufw6qBK8XWvFITUYtX0NmO61tuNL1Jjjzln3Np3G1vqLZGXwh9zId
         7OaeIm9GBk+PK8wQ+66P7wutixk0nL26IhFmix49TwTXFN+2+pWTVTT+4K5uyteDmKpn
         JuC0iT2Lrr+kGhVth0CVFVoI3rZc/YIVMeaLh2Sofc9hoEVbmuOpZEvkL+vtSlk6+Fzx
         qNUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iWEKtw3qUiAawaOxdqPs0umv7nzkxV855xae9pF938c=;
        b=tr6E7QgsSN4VYeMf+/CeenMG7bRMIRgUyzb8cc5RZ2DKI+GN0kMvAWWuyrvTaPYwSe
         UTtt3rVI7yEoKzQIC/xd54I2RnehpocTUgWmw2WR57BtD608EEk0rFDVOm900xUk2ojE
         LcaqfMV5Ba23XcYKOhqfkV8/Ih56odpmMe9EOCbbWxue45SR3uA+iUK45M7xux/E6W2h
         csfY1RYp0gA//6PVFo/tmt6cX9NYVP4M2vtVBuQfQDY2hHbhiX25zokrfoq4SwuZg6B2
         q8g5b4Szt5J9MA8m7tIfptHwOW9t42zXpSHqyj5Yh72BHfTf0OCaQRriP8t+po9dBNu0
         /CGA==
X-Gm-Message-State: ACrzQf3fF0FgBWJn93EbsNjGpiLqJ46hoUVnf+VcsDejrex52OeVfQN5
        ej9um/91ZrXDrrCn1QqPyuY=
X-Google-Smtp-Source: AMsMyM7F+3y0j+vNfiWFgdOKBUcgGGtop7epjSDL2dB/w16YWgkhYtADtESEPfIDnchwayqwxrOtJg==
X-Received: by 2002:a05:6a00:224c:b0:56c:40ff:7709 with SMTP id i12-20020a056a00224c00b0056c40ff7709mr21623319pfu.59.1667338831058;
        Tue, 01 Nov 2022 14:40:31 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
        by smtp.gmail.com with ESMTPSA id y5-20020aa78f25000000b005544229b992sm6964575pfr.22.2022.11.01.14.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 14:40:30 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        linux-kernel@vger.kernel.org (open list),
        linux-media@vger.kernel.org (open list:DMA BUFFER SHARING FRAMEWORK),
        linaro-mm-sig@lists.linaro.org (moderated list:DMA BUFFER SHARING
        FRAMEWORK)
Subject: [PATCH] drm/msm: Remove exclusive-fence hack
Date:   Tue,  1 Nov 2022 14:40:51 -0700
Message-Id: <20221101214051.159988-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

The workaround was initially necessary due to dma_resv having only a
single exclusive fence slot, yet whe don't necessarily know what order
the gpu scheduler will schedule jobs.  Unfortunately this workaround
also has the result of forcing implicit sync, even when userspace does
not want it.

However, since commit 047a1b877ed4 ("dma-buf & drm/amdgpu: remove
dma_resv workaround") the workaround is no longer needed.  So remove
it.  This effectively reverts commit f1b3f696a084 ("drm/msm: Don't
break exclusive fence ordering")

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 5599d93ec0d2..cc48f73adadf 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -334,8 +334,7 @@ static int submit_fence_sync(struct msm_gem_submit *submit, bool no_implicit)
 		if (ret)
 			return ret;
 
-		/* exclusive fences must be ordered */
-		if (no_implicit && !write)
+		if (no_implicit)
 			continue;
 
 		ret = drm_sched_job_add_implicit_dependencies(&submit->base,
-- 
2.38.1

