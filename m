Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 82A56517497
	for <lists+linux-media@lfdr.de>; Mon,  2 May 2022 18:38:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1384381AbiEBQl3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 May 2022 12:41:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1386367AbiEBQlQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 May 2022 12:41:16 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C540111A28
        for <linux-media@vger.kernel.org>; Mon,  2 May 2022 09:37:40 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id x18so20291201wrc.0
        for <linux-media@vger.kernel.org>; Mon, 02 May 2022 09:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DjepyRyvA6mLg/4EFB+VBQwNzCxlgFJd+rSnwBXcAo4=;
        b=b9McOF0QAQ4Vl1Xixqh+MWtgKhqJVwn5xVup/ay+JwJWOdF4F9BUxMavHOaj/8S6Nh
         SdIUTeOUydNZ784Hwl1hjbrRa1iqlF3EFIu4jhNFxYHXtpm5gsCt7Z0dmwrog09TcyS9
         4D4sPCjynN1qp0m9VCtpp65oWPw1bE/QlKzw3oBmWsZyplJoEgktlSMI4ajRWnzURzVA
         CTiCssh6TAoEfw8Iz5ncjHIrKdoor3k9KKkcKIP9Lj2NEwvU09NeDBsHTJbf9rDSsUQa
         oZ+zLrz0fzr8Bc6PaKdaxIlWzjQtg5fEaVfv4ygePTgY8+nMUziiXz1JL3rb5oMuvpa5
         qYJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DjepyRyvA6mLg/4EFB+VBQwNzCxlgFJd+rSnwBXcAo4=;
        b=J1in8zqA3y0EH4DBdSKr5IE0jy/7UtoVneR2VdPIsrSD7EUpBFiAv3qaPweDKCT1sv
         lPnZEe9Ps2Vh7KI9V+wEUoG0KQ+9IRpzkVhEDc+sEyg91O06oBMTg7EbFuPvE+GFBJ9S
         5MCXqxNzCIkCzAp1qAlj+9gUjOxjmKic6++Rgkajzx0xcqHw3VUbvz/m6s6FHYFc01Nw
         yyFkUQIrwHYm8aWQZs2Vn3qSGPsd47LJQ6m7Fxwv0L99qZjjqlT967l3SAW4qo2jjXhU
         W9rSBniYhCV2C8qdMDXmUxpN8VYkrkbWfU7RP10+3sFo+TSbb6W23ab/VjC7RVB1+IOF
         8iFg==
X-Gm-Message-State: AOAM533X+UVq1ZRjV0wtzlXZwCXN6Ku+Sz8bVfKJxxdvDrr/0kQFc/eF
        PAiPWQtEpoqa1Ksm9SPnvbo=
X-Google-Smtp-Source: ABdhPJybrPRxtci7aY1OOebXO27jsS5DQk+XuP1Q+hwI5bUFAaGVwmOUHoqt5uQuXpdTVJ383HXw2A==
X-Received: by 2002:a5d:4205:0:b0:20a:e23c:a7f4 with SMTP id n5-20020a5d4205000000b0020ae23ca7f4mr10196022wrq.576.1651509459141;
        Mon, 02 May 2022 09:37:39 -0700 (PDT)
Received: from able.fritz.box (p57b0b9e1.dip0.t-ipconnect.de. [87.176.185.225])
        by smtp.gmail.com with ESMTPSA id p14-20020adfaa0e000000b0020c5253d8f6sm7294694wrd.66.2022.05.02.09.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 09:37:38 -0700 (PDT)
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
Subject: [PATCH 08/15] dma-buf: add support for polling on user fences
Date:   Mon,  2 May 2022 18:37:15 +0200
Message-Id: <20220502163722.3957-9-christian.koenig@amd.com>
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

Just also wait for user fences to signal when we wait for write fences.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-buf.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 79795857be3e..5558f4e555f8 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -225,6 +225,16 @@ static bool dma_buf_poll_add_cb(struct dma_resv *resv, bool write,
 		dma_fence_put(fence);
 	}
 
+	if (!write)
+		return false;
+
+	dma_resv_for_each_fence(&cursor, resv, DMA_RESV_USAGE_USER, fence) {
+		dma_fence_get(fence);
+		r = dma_fence_add_callback(fence, &dcb->cb, dma_buf_poll_cb);
+		if (!r)
+			return true;
+		dma_fence_put(fence);
+	}
 	return false;
 }
 
-- 
2.25.1

