Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AFC4E67C1A6
	for <lists+linux-media@lfdr.de>; Thu, 26 Jan 2023 01:29:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236278AbjAZA34 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Jan 2023 19:29:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236298AbjAZA3o (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Jan 2023 19:29:44 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 551F143457
        for <linux-media@vger.kernel.org>; Wed, 25 Jan 2023 16:28:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674692931;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=JbyYoo+iTg/7s516SgITKP/ggW6rCx9usz1BqFXsKhg=;
        b=Ox2HPXAL4gaTS65NoPT365CGTga2f/U/ma6DHusamY1h/gRqjGS+Ysn+D5TKn3XSnugkpe
        C5/fHeiSOwbCTdbBXrJoYDdRkLwOGKIhHozVj0MwjOG3pImpDlfYlHrx88AB7qKGHh7yV0
        F3DmSywfB6riJyE5tkRP7SDJbvRIQxo=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-79-2eSca8CWPp6Xp6otfW2rAg-1; Wed, 25 Jan 2023 19:28:50 -0500
X-MC-Unique: 2eSca8CWPp6Xp6otfW2rAg-1
Received: by mail-ej1-f72.google.com with SMTP id gn31-20020a1709070d1f00b0087024adbba2so211457ejc.20
        for <linux-media@vger.kernel.org>; Wed, 25 Jan 2023 16:28:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JbyYoo+iTg/7s516SgITKP/ggW6rCx9usz1BqFXsKhg=;
        b=sZhtYcjQY7hqzeSlt0E2qoKgzMbXXM7GWIM4z/evMSyLMPGifpX2vKaMmnZY4ITLpf
         UgrXiPOA/02Q+QVCzTPSCuKxB3vZy6ovSrlT32nKWH07KJCvf1YxKZrzFMai0ox1CNPy
         Hhwz/C9tn6945M934bfsGyqDmNQmhv3rANkRzzyop89Ly5LlJzg1uaJ/vBV2eOpFR8K6
         CNUMSfWgOG8pe/O0tlor4h299Q8skxvSr0KU58AislRpT8s6FSNUzhwkpddsHgEN7cxb
         Sx75SsTiubLt9Bpu/G1agUgaBAHxyDc38rz+a6DFQ+UDfdpSntLssvn6SAxfiLdbWZ1h
         D2aA==
X-Gm-Message-State: AFqh2kqR3zieaDDCTp4IKcRY130qsdmLZftcZB1gHNC1prnqAWMRSnRL
        AOogU2nhO9+34n9re5rXgIoWuv8oWofexLJcsLWmoSWt/R0Yoc6vo6pYW4zzsMlvcx80G3quPLs
        m+Q7QOFidiI64unWdvvvUVkU=
X-Received: by 2002:a05:6402:5419:b0:463:9193:404a with SMTP id ev25-20020a056402541900b004639193404amr36659378edb.21.1674692929038;
        Wed, 25 Jan 2023 16:28:49 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvGz2LNpp1BEszvXNVD/n0jXIZ8CQsApiWD0Hl3aVbSLJvpgJWIyT48ddPBP9ROdENyzemY5A==
X-Received: by 2002:a05:6402:5419:b0:463:9193:404a with SMTP id ev25-20020a056402541900b004639193404amr36659373edb.21.1674692928896;
        Wed, 25 Jan 2023 16:28:48 -0800 (PST)
Received: from pollux.. ([2a02:810d:4b3f:de78:642:1aff:fe31:a15c])
        by smtp.gmail.com with ESMTPSA id j15-20020aa7de8f000000b0049622a61f8fsm3009706edv.30.2023.01.25.16.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 16:28:48 -0800 (PST)
From:   Danilo Krummrich <dakr@redhat.com>
To:     christian.koenig@amd.com, Arvind.Yadav@amd.com,
        sumit.semwal@linaro.org, gustavo@padovan.org
Cc:     dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@redhat.com>
Subject: [PATCH] dma-buf: actually set signaling bit for private sub fences
Date:   Thu, 26 Jan 2023 01:28:44 +0100
Message-Id: <20230126002844.339593-1-dakr@redhat.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In dma_fence_allocate_private_stub() set the signaling bit of the newly
allocated private stub fence rather than the signaling bit of the
shared dma_fence_stub.

Fixes: c85d00d4fd8b ("dma-buf: set signaling bit for the stub fence")
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/dma-buf/dma-fence.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index 406b4e26f538..0de0482cd36e 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -167,7 +167,7 @@ struct dma_fence *dma_fence_allocate_private_stub(void)
 		       0, 0);
 
 	set_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
-		&dma_fence_stub.flags);
+		&fence->flags);
 
 	dma_fence_signal(fence);
 
-- 
2.39.1

