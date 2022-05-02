Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4E4D517492
	for <lists+linux-media@lfdr.de>; Mon,  2 May 2022 18:38:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1386324AbiEBQlZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 May 2022 12:41:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1386360AbiEBQlQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 May 2022 12:41:16 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABC1911A1B
        for <linux-media@vger.kernel.org>; Mon,  2 May 2022 09:37:37 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id p189so8550670wmp.3
        for <linux-media@vger.kernel.org>; Mon, 02 May 2022 09:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PRrPoRHHMVUrb5lC6MPjlnCl9PCZ8HWYoNk/YFcFCiA=;
        b=OFQtewjT9fUvoHtYhMh7ANDq7xj4P0vsSbip4Q75b1Jkvyrxh/SM6AfiC/QKQHlypQ
         BX3BabqqMqdEzeYcj/nmpBY8Qxda0a9wsD8qsf2abkJ9mVB3r/rb+a7ICk3TaZcsRmnL
         dQKrmgE86iyIPqEuj8wwM0OXSjKut2YO2B5QqjhlFueiv4aJPmMENk3j6XyH7ujbFMEv
         OH81rUOKEhpDhUw+i9TE0Srq5nIIY6RYcRHGA9C9StT0gyacz6dqsNe0apbB5sffIyR1
         fT64bVj5tN0+FlGD0PPb34H5aCF853+ixTuYl2rpgHw5gNGfz3AIPbSZ57U2W5UpWxFP
         WBzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PRrPoRHHMVUrb5lC6MPjlnCl9PCZ8HWYoNk/YFcFCiA=;
        b=R6gbaAPY70TUjnZPikKwv8Mfz0ExqYU40kZBSn798IklJUJvhJqB+zzjEYp+ken0PA
         RaJ2qez9mPJmiIFJgQlaNlYMy0eSeweXssPtTxBZQcJYqfX8Mm03DURzbpGNiSSeDIOB
         uzMTcPHec3TOOUj7R8zc/yBLTGSu3X+ib/4t/Ge7Z+HRBH1rD9HaitdgKaHH9Sb9GuZp
         ZEgkO30qblmBcDkyMGyimv0vVxgvSIKkF20iU//CM1auNVLBp7oWOYEFRNh2+whjrGrr
         elOHSAfGZSO3bR8yfLfzcSPAP7mzZ0dJ7rNjN0dVjpPOihR33flYsX5Lvh34A0nXFkTn
         df2w==
X-Gm-Message-State: AOAM5317d86akbGx6ggeusiqqOihbWIHZLCy413F/sgdMIs36nDP3Aad
        k76CoD8+SI0JR7p7A7zvVLs=
X-Google-Smtp-Source: ABdhPJyEr5vbAcRX0+Jtvnnc+Wf7OKzoanJfhrmTHwUjGX/+TujJY43ARrVlFK4RKL5kjt6QWDMlHQ==
X-Received: by 2002:a05:600c:4eca:b0:394:1e7d:af41 with SMTP id g10-20020a05600c4eca00b003941e7daf41mr15271560wmq.151.1651509456178;
        Mon, 02 May 2022 09:37:36 -0700 (PDT)
Received: from able.fritz.box (p57b0b9e1.dip0.t-ipconnect.de. [87.176.185.225])
        by smtp.gmail.com with ESMTPSA id p14-20020adfaa0e000000b0020c5253d8f6sm7294694wrd.66.2022.05.02.09.37.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 09:37:35 -0700 (PDT)
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
Subject: [PATCH 06/15] dma-buf: add user fence support to dma_fence_merge()
Date:   Mon,  2 May 2022 18:37:13 +0200
Message-Id: <20220502163722.3957-7-christian.koenig@amd.com>
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

Just make sure that we forward the user fence status to the output
whenever any of the inputs are an user fence.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-fence-unwrap.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/dma-buf/dma-fence-unwrap.c b/drivers/dma-buf/dma-fence-unwrap.c
index 87ee2efced10..dd3c43aba8f1 100644
--- a/drivers/dma-buf/dma-fence-unwrap.c
+++ b/drivers/dma-buf/dma-fence-unwrap.c
@@ -66,17 +66,19 @@ struct dma_fence *__dma_fence_merge(unsigned int num_fences,
 {
 	struct dma_fence_array *result;
 	struct dma_fence *tmp, **array;
+	bool user_fence = false;
 	unsigned int i, count;
 
 	count = 0;
 	for (i = 0; i < num_fences; ++i) {
+		user_fence |= test_bit(DMA_FENCE_FLAG_USER, &fences[i]->flags);
 		dma_fence_unwrap_for_each(tmp, &iter[i], fences[i])
 			if (!dma_fence_is_signaled(tmp))
 				++count;
 	}
 
 	if (count == 0)
-		return dma_fence_get_stub(false);
+		return dma_fence_get_stub(user_fence);
 
 	if (count > INT_MAX)
 		return NULL;
@@ -129,11 +131,12 @@ struct dma_fence *__dma_fence_merge(unsigned int num_fences,
 	} while (tmp);
 
 	if (count == 0) {
-		tmp = dma_fence_get_stub(false);
+		tmp = dma_fence_get_stub(user_fence);
 		goto return_tmp;
 	}
 
-	if (count == 1) {
+	if (count == 1 &&
+	    test_bit(DMA_FENCE_FLAG_USER, &array[0]->flags) == user_fence) {
 		tmp = array[0];
 		goto return_tmp;
 	}
@@ -145,6 +148,8 @@ struct dma_fence *__dma_fence_merge(unsigned int num_fences,
 		tmp = NULL;
 		goto return_tmp;
 	}
+	if (user_fence)
+		set_bit(DMA_FENCE_FLAG_USER, &result->base.flags);
 	return &result->base;
 
 return_tmp:
-- 
2.25.1

