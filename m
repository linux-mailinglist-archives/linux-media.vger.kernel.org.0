Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D966D4EA83E
	for <lists+linux-media@lfdr.de>; Tue, 29 Mar 2022 09:00:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232591AbiC2HBt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Mar 2022 03:01:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231715AbiC2HBs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Mar 2022 03:01:48 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6471332ECF
        for <linux-media@vger.kernel.org>; Tue, 29 Mar 2022 00:00:06 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id u26so19531415eda.12
        for <linux-media@vger.kernel.org>; Tue, 29 Mar 2022 00:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dfQADiC3SkhSpWiX7t32pPZIKom+fqM6C8ez0L8fdtk=;
        b=hXRlg+OY/KFL9cqLeqJvoC2sGQvHE5xTtCNjtPDKgWLr65aOTHptN3wyod8Pz0b8Lu
         mQtXgAnyqoAhvOkUpJeneZSu561r8ex/Jhzr1128NlTiUnUXRJ96C1mmo4c7MJxKI4Vl
         2wLcdh/q80uZYq/ZdDCs3yD3Ga096jU0L0FTB3iLTEKYEcPISZASbLUHSjyjw/EOYrMn
         2uq7wg9SqtRSvB5Eiy1yumrFrCGTYV9kqxTx6bvZ1cLXYpK+2AtaplXjpUo/ahDEgO0o
         bsx7sNU/6oThzEcNxULMyK/OfftSuk6DmLHEnevG6oCTf31AdKb5TEeD53y0+m34MVZM
         Ek5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dfQADiC3SkhSpWiX7t32pPZIKom+fqM6C8ez0L8fdtk=;
        b=ziFzShHWyd79NPAyXU1lBipL29WUmtEV4UGyvOkfPVYwkEVFzKmGfWLMlqzRRnU9lI
         24zHivQTsDs/F/SyJLSr/MvCeZ2SAcS2pKo/gQoxNvBKFAQnMnthicgsu8sjLOmE7rRT
         8hiYBDyKI48f/N3ROUapSs+iGOK1wSNvVUl4V4gGtN+4RkkMyK4smumI2b3G5s4gDpqh
         ArcT+A9v86w1SuNg9BBAu+sl0ss0t5hWhYWYZ9WhWrJnvhu/OhFrsy6BgJ3MjU128iWU
         hwrHkTgvhPoinLa0XMfQC5cZfaxfmyCuxQtIBnOX980X/UXtNWka8eRffl4EX+CANPU+
         hKyw==
X-Gm-Message-State: AOAM532s2NXBAJN9bFtkSEd4z/yx0drcwZFOTBmYLD/C8n9NwWYi7xIO
        rQZEm/EMqbeQIOVkUBvcfbszg6b28D0=
X-Google-Smtp-Source: ABdhPJxZys/k7C91gqwRakOcXoRfj8Dei6X9emGlvQ/rA5KyjiSrAjYJmv9BnrJjzK1G+BTm/kZSDw==
X-Received: by 2002:a50:eb8b:0:b0:419:a11c:8676 with SMTP id y11-20020a50eb8b000000b00419a11c8676mr2589983edr.267.1648537205019;
        Tue, 29 Mar 2022 00:00:05 -0700 (PDT)
Received: from able.fritz.box (p5b0eab60.dip0.t-ipconnect.de. [91.14.171.96])
        by smtp.gmail.com with ESMTPSA id gv9-20020a170906f10900b006d7128b2e6fsm6593250ejb.162.2022.03.29.00.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Mar 2022 00:00:04 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        ville.syrjala@linux.intel.com, daniel@ffwll.ch
Cc:     =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH 2/2] dma-buf: handle empty dma_fence_arrays gracefully
Date:   Tue, 29 Mar 2022 09:00:01 +0200
Message-Id: <20220329070001.134180-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220329070001.134180-1-christian.koenig@amd.com>
References: <20220329070001.134180-1-christian.koenig@amd.com>
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

A bug inside the new sync-file merge code created empty dma_fence_array instances.

Warn about that and handle those without crashing.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-fence-array.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
index 52b85d292383..5c8a7084577b 100644
--- a/drivers/dma-buf/dma-fence-array.c
+++ b/drivers/dma-buf/dma-fence-array.c
@@ -159,6 +159,8 @@ struct dma_fence_array *dma_fence_array_create(int num_fences,
 	struct dma_fence_array *array;
 	size_t size = sizeof(*array);
 
+	WARN_ON(!num_fences || !fences);
+
 	/* Allocate the callback structures behind the array. */
 	size += num_fences * sizeof(struct dma_fence_array_cb);
 	array = kzalloc(size, GFP_KERNEL);
@@ -231,6 +233,9 @@ struct dma_fence *dma_fence_array_first(struct dma_fence *head)
 	if (!array)
 		return head;
 
+	if (!array->num_fences)
+		return NULL;
+
 	return array->fences[0];
 }
 EXPORT_SYMBOL(dma_fence_array_first);
-- 
2.25.1

