Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49A8D517493
	for <lists+linux-media@lfdr.de>; Mon,  2 May 2022 18:38:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245618AbiEBQl1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 May 2022 12:41:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1386375AbiEBQlR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 May 2022 12:41:17 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BE4811A3F
        for <linux-media@vger.kernel.org>; Mon,  2 May 2022 09:37:43 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id k2so20242252wrd.5
        for <linux-media@vger.kernel.org>; Mon, 02 May 2022 09:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RsppMnZlvpz/PS1/TtGolLScNmUL2porbiCTAL7nvFU=;
        b=a8nOHOjENFk8Xqwt3xRBWqsEDbDkcxAnWu2DgN6ZDlTrGJ1q3k5MN1DjOQ2zViSQg4
         /pvQDUerSXJhjlxEWeERMaolbCrzCoqr56pyfb2TEL7vg+B7hOdMEIVTyYgxNOqqRQiV
         muLLlNRxADbcJZC0Xo7s+vNAzrLICHoUlxYFy64xxzxl8U7CmD+wchoGiqZyArMJGYyf
         m6y8dFfXLwy6xUJ3j6HJ9GsJN24zFxv3tC2YmECdIRGZlHnwRRNeMCFzeycRNMjZc5Rd
         FWhd8+2d5xbZspsYRjuRbwCa1ZanS8BMkagr654IsvWoWehrdkQCdAGIrfrQ0XnLSjlb
         NjGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RsppMnZlvpz/PS1/TtGolLScNmUL2porbiCTAL7nvFU=;
        b=KxC/l1eFbPYwLoYkY8rsSy4EWw/JBUX4Szfs4SDa5EXOQMNkuMJFUD5DJy6rlprJsj
         /pIotq5Kvb/HpD/k3rFuX9GxMRWV+Z7t40F4aqkkMBstEr/gA5CFfKUgtaQvSAwcYGPZ
         2zM/2YhhrGpfskFpd/tjTl+zsIvobhuw0zal/Ac9SC3eglsaECVBVWVQP1C1ZKJCOvft
         asd4hkbhb8K4ZVifx5Z11a1ON1ZenfGRi5EviqaTjq8E/3L0+Wprzns0mMfLUNEQDzxA
         0go1UzUWJD6gBcSmKaSCQeRqpZrx0Go1+PjKW49etw3vme3cuOhRzS7Shhgsb8hXUrbV
         EeLQ==
X-Gm-Message-State: AOAM530vISCmZDPN5/6NSoOM09h/TvMbrxmE4kg3XxUiX9er0h8t8ZOB
        jYmUBgqSaxmfj/Giq20gJAM=
X-Google-Smtp-Source: ABdhPJyTPKUM05Y+tnsze0dzaZtqnYwBQZsZfdgYGdtgR2xVTDvcPZhlwnNrXn5ccgWpn6iPCc00wA==
X-Received: by 2002:a5d:5228:0:b0:20a:d7e9:7ed8 with SMTP id i8-20020a5d5228000000b0020ad7e97ed8mr9472997wra.687.1651509462037;
        Mon, 02 May 2022 09:37:42 -0700 (PDT)
Received: from able.fritz.box (p57b0b9e1.dip0.t-ipconnect.de. [87.176.185.225])
        by smtp.gmail.com with ESMTPSA id p14-20020adfaa0e000000b0020c5253d8f6sm7294694wrd.66.2022.05.02.09.37.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 09:37:41 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     daniel@ffwll.ch, jason@jlekstrand.net, daniels@collabora.com,
        skhawaja@google.com, maad.aldabagh@amd.com, sergemetral@google.com,
        sumit.semwal@linaro.org, gustavo@padovan.org,
        Felix.Kuehling@amd.com, alexander.deucher@amd.com,
        tzimmermann@suse.de, tvrtko.ursulin@linux.intel.com,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
Cc:     =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH 10/15] drm: add user fence support for atomic out fences
Date:   Mon,  2 May 2022 18:37:17 +0200
Message-Id: <20220502163722.3957-11-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220502163722.3957-1-christian.koenig@amd.com>
References: <20220502163722.3957-1-christian.koenig@amd.com>
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

Add a new driver flag indicating support for user fences.

This flag is then used when creating out fences for atomic mode setting,
indicating that the mode set might depend on an user fence.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/drm_atomic_uapi.c | 8 ++++++++
 include/drm/drm_drv.h             | 7 +++++++
 2 files changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 434f3d4cb8a2..e2112c10569b 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -1111,6 +1111,7 @@ static int prepare_signaling(struct drm_device *dev,
 				  struct drm_out_fence_state **fence_state,
 				  unsigned int *num_fences)
 {
+	bool use_user_fence = drm_core_check_feature(dev, DRIVER_USER_FENCE);
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *crtc_state;
 	struct drm_connector *conn;
@@ -1120,6 +1121,7 @@ static int prepare_signaling(struct drm_device *dev,
 	if (arg->flags & DRM_MODE_ATOMIC_TEST_ONLY)
 		return 0;
 
+
 	for_each_new_crtc_in_state(state, crtc, crtc_state, i) {
 		s32 __user *fence_ptr;
 
@@ -1168,6 +1170,9 @@ static int prepare_signaling(struct drm_device *dev,
 			if (!fence)
 				return -ENOMEM;
 
+			if (use_user_fence)
+				set_bit(DMA_FENCE_FLAG_USER, &fence->flags);
+
 			ret = setup_out_fence(&f[(*num_fences)++], fence);
 			if (ret) {
 				dma_fence_put(fence);
@@ -1208,6 +1213,9 @@ static int prepare_signaling(struct drm_device *dev,
 		if (!fence)
 			return -ENOMEM;
 
+		if (use_user_fence)
+			set_bit(DMA_FENCE_FLAG_USER, &fence->flags);
+
 		ret = setup_out_fence(&f[(*num_fences)++], fence);
 		if (ret) {
 			dma_fence_put(fence);
diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index f6159acb8856..b2b8ea8d4a9e 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -94,6 +94,13 @@ enum drm_driver_feature {
 	 * synchronization of command submission.
 	 */
 	DRIVER_SYNCOBJ_TIMELINE         = BIT(6),
+	/**
+	 * @DRIVER_USER_FENCE:
+	 *
+	 * Drivers supports user fences and waiting for the before command
+	 * submission.
+	 */
+	DRIVER_USER_FENCE		= BIT(7),
 
 	/* IMPORTANT: Below are all the legacy flags, add new ones above. */
 
-- 
2.25.1

