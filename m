Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B01C2494EED
	for <lists+linux-media@lfdr.de>; Thu, 20 Jan 2022 14:28:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234995AbiATN1x (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Jan 2022 08:27:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234789AbiATN1w (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Jan 2022 08:27:52 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87225C061574
        for <linux-media@vger.kernel.org>; Thu, 20 Jan 2022 05:27:52 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id i187-20020a1c3bc4000000b0034d2ed1be2aso20479778wma.1
        for <linux-media@vger.kernel.org>; Thu, 20 Jan 2022 05:27:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=h31cjV/G3NiOKdHvCZshrAV0bv4jMAoTVAYHVRjcuKk=;
        b=WnbqVfwzb4DPoRFDhQ9/ICG9WTPbw7OBhn0HLKpmPR/WnX6hjSExc4wBC5WXWZZEQG
         eP22+9nEUkH63Iyqek68ocIhQ6pCcP0cZZJbPFhXmdWCx4Vc0XCDRBY2k0/5NAyMIzKf
         4QXgu+BPUO2UC6rDU6cXiibusrHEXg7zaYc1VpX0RJs0IdUYyTrsrFc5WZMPh/jzh3/n
         05IFWTH4hffpALS/ZvFxVF+OCJyTev8sjceYDW6eAA2wYtVd5AksMlL+LVTzJiMuNsZt
         vEFpGgkpokQBL4JxQNOvky0c+m+QZgFy6bwB8e7RUDeUfH4YlE1Td7PcSf3FD29Bs2kr
         WEIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=h31cjV/G3NiOKdHvCZshrAV0bv4jMAoTVAYHVRjcuKk=;
        b=3m1Hawbwyc2Z01Q1YUy7+Imyq6jeZ5U56Xg4CMYeItg3oJpXxN3mu+szsmM23kbn5e
         OzJm1rjFeYkB1v2vK5np5HBFi72yS5LisCxLSyyI+ZEB8dJzg8xHpErQei6ZaXRsjb+n
         LOHhsVO4F8clJWEaYkxuK+mgCKTnc/1sxIwV5qrBswYCf/s98Q1+Rlbk8mveNv3tkRov
         u955YFF7H5FJBmDmat/PF0CIMdc+YYKSCh0wMghDlhP7Lzisf4Ngd1kyuqAK+/U8Vu8p
         ZD/PbAGidSJxTWMVy1vrDvzljjHWWQGOYSdKz6LOqayX5minYPpmfXY2b7nxtDRnCgiV
         z20A==
X-Gm-Message-State: AOAM5332jJnvNPrmXCdV7uajMcdIJUESoPGr9bKQRX8UiXWixTaTFjhh
        sOuhBSiSf6rwTESmnE2vkyc=
X-Google-Smtp-Source: ABdhPJy5EXLfElgIsYt5n+gjzWUyHJ0xgsDXAnXo7PfLLlJTqgMkEsQTYg+RB0XoOGHW5TGs5+SiwQ==
X-Received: by 2002:adf:fb4f:: with SMTP id c15mr32600110wrs.509.1642685271160;
        Thu, 20 Jan 2022 05:27:51 -0800 (PST)
Received: from abel.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
        by smtp.gmail.com with ESMTPSA id a9sm2658454wmm.32.2022.01.20.05.27.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jan 2022 05:27:50 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     sumit.semwal@linaro.org, gustavo@padovan.org,
        daniel.vetter@ffwll.ch, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 2/9] dma-buf: warn about dma_fence_array container rules
Date:   Thu, 20 Jan 2022 14:27:40 +0100
Message-Id: <20220120132747.2348-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220120132747.2348-1-christian.koenig@amd.com>
References: <20220120132747.2348-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

It's not allowed to nest another dma_fence container into a dma_fence_array
or otherwise we can run into recursion.

Warn about that when we create a dma_fence_array.

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/dma-buf/dma-fence-array.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
index 3e07f961e2f3..4bfbcb885bbc 100644
--- a/drivers/dma-buf/dma-fence-array.c
+++ b/drivers/dma-buf/dma-fence-array.c
@@ -176,6 +176,19 @@ struct dma_fence_array *dma_fence_array_create(int num_fences,
 
 	array->base.error = PENDING_ERROR;
 
+	/* dma_fence_array objects should never contain any other fence
+	 * containers or otherwise we run into recursion and potential kernel
+	 * stack overflow on operations on the dma_fence_array.
+	 *
+	 * The correct way of handling this is to flatten out the array by the
+	 * caller instead.
+	 *
+	 * Enforce this here by checking that we don't create a dma_fence_array
+	 * with any container inside.
+	 */
+	while (seqno--)
+		WARN_ON(dma_fence_is_container(fences[seqno]));
+
 	return array;
 }
 EXPORT_SYMBOL(dma_fence_array_create);
-- 
2.25.1

