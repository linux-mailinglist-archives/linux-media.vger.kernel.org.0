Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B667517486
	for <lists+linux-media@lfdr.de>; Mon,  2 May 2022 18:37:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1386312AbiEBQlW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 May 2022 12:41:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1386343AbiEBQlO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 May 2022 12:41:14 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7909E1115F
        for <linux-media@vger.kernel.org>; Mon,  2 May 2022 09:37:33 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id ay11-20020a05600c1e0b00b0038eb92fa965so11115024wmb.4
        for <linux-media@vger.kernel.org>; Mon, 02 May 2022 09:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jUPHAg5HbOj5ZN0WpYBsRJzMWzX/NFrcan6CKY2q7Ro=;
        b=K7kMi4HoE2Uh2vRrakSayQJE7aYVhjY9a5nwoadZ3BkU27oHo0Jx+EH8p9F1l+bwgN
         ougnq1m4Szq7vMRihB5chu9Z+ZAhMYo31EpJpgiEkXEFpJhONW9SJpvbLVTAB5PwPVI3
         gbJU1+PbvJ+nchom3hU+DdengngN/5Bt+DlU/qbiM1NW0su5lLTtTrUHRHaesf3vGLSc
         UOhd7WzqMspEwHYiwLE4lMMhu+ZuVlV3H03VpVIVwDWGktR9kADp5GtEhgNmI0j9NHYG
         5rZXer7PFDQr0n34gDRy9kaG7Q1lojECDnwbVLXefC9iMs89qUCExq9fJ6BQxKyi4Or3
         ziwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jUPHAg5HbOj5ZN0WpYBsRJzMWzX/NFrcan6CKY2q7Ro=;
        b=JHIZTL50iSgTud+DVSze2l3ZobsBcYk8kbnlzZTPyHPIH2gPJ4HBw5XSOnCpq+5Smg
         2029mhLzKzni67Z3KXNVH0XprPC5viKf8HHFFQe2RLzPGKGwpexwxFT/2zgSGXDz6uq2
         vBWPgeonZSp5+jQkcvXbd9w3YAzXEpTB+PgUBkfwHbDuGoGSAsvAvqNjc933HBELU0ti
         wTZIE6y4XrtFNb6BWb2DsjfuUhlsuqQA2MW0CFvOXi5o7JEkM3XGewq8fbB0Nf0G8Fp/
         wb/I57B8h/wrVNe6Hyvjkmp1E5N/2hTFB4zXPQfwfgfNgqeEl5E4dfaU9Fo9NVXWUhYg
         Ny0Q==
X-Gm-Message-State: AOAM532YR3zu27eKz53bcrem1pWJnkM98yka8rmtXvohwEkziBbZpgxf
        oXRg6AU+h4lH/J4KCqlgG9c=
X-Google-Smtp-Source: ABdhPJzPFdaPya/zgXl5sjQHQZoAs93P8c4u5VO/8cqCZV7P/ZBXkmF61G4yVvAvs5c6L70nsPZecg==
X-Received: by 2002:a7b:c4d8:0:b0:393:fecd:2718 with SMTP id g24-20020a7bc4d8000000b00393fecd2718mr11612189wmk.23.1651509451818;
        Mon, 02 May 2022 09:37:31 -0700 (PDT)
Received: from able.fritz.box (p57b0b9e1.dip0.t-ipconnect.de. [87.176.185.225])
        by smtp.gmail.com with ESMTPSA id p14-20020adfaa0e000000b0020c5253d8f6sm7294694wrd.66.2022.05.02.09.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 09:37:31 -0700 (PDT)
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
Subject: [PATCH 03/15] dma-buf: add user fence support to dma_fence_array
Date:   Mon,  2 May 2022 18:37:10 +0200
Message-Id: <20220502163722.3957-4-christian.koenig@amd.com>
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

When any of the fences inside the array is an user fence the whole array
is considered to be an user fence as well.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-fence-array.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
index 5c8a7084577b..de196b07d36d 100644
--- a/drivers/dma-buf/dma-fence-array.c
+++ b/drivers/dma-buf/dma-fence-array.c
@@ -189,8 +189,13 @@ struct dma_fence_array *dma_fence_array_create(int num_fences,
 	 * Enforce this here by checking that we don't create a dma_fence_array
 	 * with any container inside.
 	 */
-	while (num_fences--)
-		WARN_ON(dma_fence_is_container(fences[num_fences]));
+	while (num_fences--) {
+		struct dma_fence *f = fences[num_fences];
+
+		WARN_ON(dma_fence_is_container(f));
+		if (test_bit(DMA_FENCE_FLAG_USER, &f->flags))
+			set_bit(DMA_FENCE_FLAG_USER, &array->base.flags);
+	}
 
 	return array;
 }
-- 
2.25.1

