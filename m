Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14E6E4F7AD5
	for <lists+linux-media@lfdr.de>; Thu,  7 Apr 2022 11:01:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243521AbiDGJCC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Apr 2022 05:02:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243519AbiDGJB7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Apr 2022 05:01:59 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FC6F11DD18
        for <linux-media@vger.kernel.org>; Thu,  7 Apr 2022 02:00:00 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id r13so9444639ejd.5
        for <linux-media@vger.kernel.org>; Thu, 07 Apr 2022 02:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0ov3S8RZTCggS0GEzbXNpgrQxhDHVpnmFzd0+6eO884=;
        b=SoL7FLKQx/b0y1RqtsFfK/KKbCbxrAQgM0p11H+ohbXN7bbcetc864N7HTyFln1EV0
         EsdS3oa9agYsu401LN3KFheViE/A2LgRw+oEdD7NYVc+ztOtu5a2f/jbx6Y1ExVwKGjd
         ZzqqhVBgj/2xDnjIpSw27/txMKWaE9dUlg7L8htLVYbVEXWniv17Y73A4fd0kx5NDoqy
         7BCz0uXgSjdy8SLvDQwuPBnqIW9ZZP05RRPae63eKfix7qZ8voNf39OnUEQxfa1JRAMh
         jNiustN/xvluOU2fsd1DOESHsA4wIrrbUZ7BKMrLhbfTsBGszdy1PQIAMwWTxXfNMdzd
         OQ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0ov3S8RZTCggS0GEzbXNpgrQxhDHVpnmFzd0+6eO884=;
        b=CdYEE3AjtbWNfUWGSQloVYnWw7tvfdLmNgJzhIKPZfNJPUCKjKL37iG3RWplpF3wyH
         kZEKpGi4dHuQdChej7/uljg/8KIeu+2mQiriDgnJ6ktIvWhe72b35O6CkurVkUouYa5F
         yD789E+ViEmC0GSerAfwMwqP7J+GtA78hYy5v1dy/0mAcuoB4dGd+76xmPfdApZTn87P
         nsZW2O+wx+gC+TqTN4PakHViAK+EmGEAtqldm1Syr7lDAU3wsli8rHtXNvoTis1SaS5e
         EXsc6kht3BPNve4VRG2KYfpD9yUjyz1Z3whGKTnVbtN//i6ZPoYJ6tKg0OU2k9kKd78m
         VxEA==
X-Gm-Message-State: AOAM5310CatBNCLT0M+dlsLUz1suv/WDsZW9qrhQIwwhhKgHtrWUbSe/
        Qt9LIE9MC8njiZFXn4jlTrk=
X-Google-Smtp-Source: ABdhPJx5XXdRljepf+g/LnGaehJT/bMOkDj5bEiDu7hHb47Qc8rfGy+jdo3yes9DUgGAvINqso3pyA==
X-Received: by 2002:a17:907:6d9b:b0:6db:8eab:94e0 with SMTP id sb27-20020a1709076d9b00b006db8eab94e0mr12115593ejc.687.1649321998884;
        Thu, 07 Apr 2022 01:59:58 -0700 (PDT)
Received: from able.fritz.box (p57b0b9e1.dip0.t-ipconnect.de. [87.176.185.225])
        by smtp.gmail.com with ESMTPSA id h26-20020a170906111a00b006e778bd4fc8sm5186563eja.38.2022.04.07.01.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Apr 2022 01:59:58 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        intel-gfx@lists.freedesktop.org
Cc:     =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH 08/15] RDMA: use DMA_RESV_USAGE_KERNEL
Date:   Thu,  7 Apr 2022 10:59:39 +0200
Message-Id: <20220407085946.744568-9-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220407085946.744568-1-christian.koenig@amd.com>
References: <20220407085946.744568-1-christian.koenig@amd.com>
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

We only need to wait for kernel submissions here.

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/infiniband/core/umem_dmabuf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/infiniband/core/umem_dmabuf.c b/drivers/infiniband/core/umem_dmabuf.c
index f9901d273b8e..fce80a4a5147 100644
--- a/drivers/infiniband/core/umem_dmabuf.c
+++ b/drivers/infiniband/core/umem_dmabuf.c
@@ -68,7 +68,7 @@ int ib_umem_dmabuf_map_pages(struct ib_umem_dmabuf *umem_dmabuf)
 	 * the migration.
 	 */
 	return dma_resv_wait_timeout(umem_dmabuf->attach->dmabuf->resv,
-				     DMA_RESV_USAGE_WRITE,
+				     DMA_RESV_USAGE_KERNEL,
 				     false, MAX_SCHEDULE_TIMEOUT);
 }
 EXPORT_SYMBOL(ib_umem_dmabuf_map_pages);
-- 
2.25.1

