Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 573EE50FD86
	for <lists+linux-media@lfdr.de>; Tue, 26 Apr 2022 14:46:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244153AbiDZMtw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Apr 2022 08:49:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244125AbiDZMtt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Apr 2022 08:49:49 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5ACE16E852
        for <linux-media@vger.kernel.org>; Tue, 26 Apr 2022 05:46:40 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id k2so4878853wrd.5
        for <linux-media@vger.kernel.org>; Tue, 26 Apr 2022 05:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QWJNebhjBBDPg0cwekMSjS6qePRn97Mj0N6BUIsgDy0=;
        b=fW/mKAflpo7RWGocl/TrgqYK1m+lv3D25HAHRiow7NSCHvmDEw+UGqV2sp0vpmTJ8b
         ZCsaSg/i2tVNLQzDOMcrbC1IlrgRYG1L3Qj9ucb4cWeM0NvJBSK2ywHMzha5g4HOCDv/
         fcgL1aVCu2bEs7rX8/GmOMOWRTK5GoOV8h0+2TnKzK9eRzwSudRRbMxekQ+33+CvHBIY
         FXZmw7yNFBqi2fEEWLSQZmzwaWmloOIm3jJCLspSRjb98vsXApoSm4YX5usHNb5CXP9V
         3ssUP1M+LXFMrcuIqq9ksmQrqAwg1ndl9JAiFncDiNF8kqfsuqQx8bcmrrzcM5LNSLII
         qzww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QWJNebhjBBDPg0cwekMSjS6qePRn97Mj0N6BUIsgDy0=;
        b=uDnDFTPFG5i5iHKvZs/SE8k2jnwUwaSjrv37YcU2w6h2IMecV14g+7bX2UgXWF2fCw
         g+VQoQEKBX+69YagLygBelUmNk9I3MzRNevgyiKbzifVj8EMtusBGbDoS+BzcYdLBAQi
         UzOf1dTiglEssagSbe7EWXzwq0RtDpfqRkfCxOmSo4J2riNyYpaM5huAAxj5WGjq7QjL
         bkKsWTIqsUA0oDAnjwQr2F9hqX7xX8HQbk3nXFTkswF/sGv5atGpntUCbHdapdNv3/+T
         JPeMsNs55i+HlyZuuncgu+veHZ0RoIMvE+6c0185pKjixAS91DhDKcZtsN2bUBVTSrR5
         8mTw==
X-Gm-Message-State: AOAM533PoGSh19sNCLzTQvONzjbUOq8ApjDtiSyqaUS19mXkWkgSXxlD
        iJugQMU5frRVve8+qEiQeQolOWEJ0Js=
X-Google-Smtp-Source: ABdhPJy3I6knemy6thzL7TvwKzDO8Xk8r+AeuQt3EcSrgvCK5597hs0se5nJF+0rP6gmxMaGGx9efQ==
X-Received: by 2002:adf:e112:0:b0:206:d12:9c3a with SMTP id t18-20020adfe112000000b002060d129c3amr17784718wrz.391.1650977199474;
        Tue, 26 Apr 2022 05:46:39 -0700 (PDT)
Received: from able.fritz.box (p57b0b9e1.dip0.t-ipconnect.de. [87.176.185.225])
        by smtp.gmail.com with ESMTPSA id s10-20020adf978a000000b0020ae0154f1esm3641025wrb.5.2022.04.26.05.46.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Apr 2022 05:46:38 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     sumit.semwal@linaro.org, gustavo@padovan.org,
        daniel.vetter@ffwll.ch
Cc:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH 1/3] dma-buf/sync_file: cleanup fence merging a bit
Date:   Tue, 26 Apr 2022 14:46:35 +0200
Message-Id: <20220426124637.329764-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

krealloc_array() ignores attempts to reduce the array size, so the attempt
to save memory is completely pointless here.

Also move testing for the no fence case into sync_file_set_fence(), this
way we don't even touch the fence array when we don't have any fences.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/sync_file.c | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/drivers/dma-buf/sync_file.c b/drivers/dma-buf/sync_file.c
index 514d213261df..0fe564539166 100644
--- a/drivers/dma-buf/sync_file.c
+++ b/drivers/dma-buf/sync_file.c
@@ -157,9 +157,15 @@ static int sync_file_set_fence(struct sync_file *sync_file,
 	 * we already own a new reference to the fence. For num_fence > 1
 	 * we own the reference of the dma_fence_array creation.
 	 */
-	if (num_fences == 1) {
+
+	if (num_fences == 0) {
+		sync_file->fence = dma_fence_get_stub();
+		kfree(fences);
+
+	} else if (num_fences == 1) {
 		sync_file->fence = fences[0];
 		kfree(fences);
+
 	} else {
 		array = dma_fence_array_create(num_fences, fences,
 					       dma_fence_context_alloc(1),
@@ -261,19 +267,6 @@ static struct sync_file *sync_file_merge(const char *name, struct sync_file *a,
 		}
 	}
 
-	if (index == 0)
-		fences[index++] = dma_fence_get_stub();
-
-	if (num_fences > index) {
-		struct dma_fence **tmp;
-
-		/* Keep going even when reducing the size failed */
-		tmp = krealloc_array(fences, index, sizeof(*fences),
-				     GFP_KERNEL);
-		if (tmp)
-			fences = tmp;
-	}
-
 	if (sync_file_set_fence(sync_file, fences, index) < 0)
 		goto err_put_fences;
 
-- 
2.25.1

