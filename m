Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26ADA72FF6F
	for <lists+linux-media@lfdr.de>; Wed, 14 Jun 2023 15:05:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244821AbjFNNFt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Jun 2023 09:05:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244465AbjFNNFr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Jun 2023 09:05:47 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B06D1BD4
        for <linux-media@vger.kernel.org>; Wed, 14 Jun 2023 06:05:46 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4f764e92931so1172749e87.2
        for <linux-media@vger.kernel.org>; Wed, 14 Jun 2023 06:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686747945; x=1689339945;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NpXYhh0i7/zZRYDxH3cRSLHICiT4WhBUrDQHv8jv/TY=;
        b=qlUG9/5FtENTa5fXIoKa0+kkYpdwqZlddkMKUS1eMk41OvnM03aOFTCm8C12VYu5UF
         e3hdlRmjofPpUDkqUnJoe3KTrF43HT36YctkAS5moAW4GK4EAZIWaH/xWK6dYf0DMJoq
         8BT/1YsT9/x4o6Nd0e9MsFT0pOUS4BU8BD8NyJrA4gG7wnkZPCwVW4z+LMt25x6Zp4ey
         ir0pUSpEHtIe4inXE5FyrgmbF8QrCzTiwjqzaWv+S6yCUJ0v/Ni6JfwZ96wMrmGJjGLM
         NWfSDV5SWfs9Y+taaKVh01aIaeu8WVmgxIdOlEEvjfKk3GzMJVjbWg2BKZ8mnJRBY3Jj
         BgZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686747945; x=1689339945;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NpXYhh0i7/zZRYDxH3cRSLHICiT4WhBUrDQHv8jv/TY=;
        b=SRng3+0qYHkjKnpqNeuFtY6VnXKj8c5+/8dUbnbQLtTH36wVDFlFxvcBYZaIyFppg3
         Ky019S0fGwIR7GMhbu1Xf0FiUKgafFGlvZfkmviJUfLzFdNzKPXMp7EoaNVNcC8pZJnU
         stb62bxojZdH/8xaELr47tzytSr3GsfAOeT7ph7ykKE/36+i5ynpzu7ewh4eE/alG8Fx
         VLClUeH1bA+tZ1NTJeaulHGZLUxxxFbaiyxWW5Z9VY/S42UMibo65koZ55jvp11S4uDo
         MT5CyAFi6Fxd/TSfSEDlNj/dq4cnltV/2esTIF+YPtri0cKuYgbefeUS6l7qBySmf78x
         REuQ==
X-Gm-Message-State: AC+VfDx4gVTwMUkE8oek74w92E5U9cdAmZvcSrleXJ/KU/DlhGwjoZBO
        B93xZ2S/2uqfN3ckrAIZekRX1w==
X-Google-Smtp-Source: ACHHUZ6K+MrBRSgvgD8L8TQx8zMgyRcFs1eYiYo6kMrefG96FrjoHSgnXbgGKRKIz+4j3Lk5P2pGIw==
X-Received: by 2002:a19:5045:0:b0:4f6:8156:f6e with SMTP id z5-20020a195045000000b004f681560f6emr5956110lfj.53.1686747944779;
        Wed, 14 Jun 2023 06:05:44 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id z15-20020a7bc7cf000000b003f6129d2e30sm17543647wmk.1.2023.06.14.06.05.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 06:05:43 -0700 (PDT)
Date:   Wed, 14 Jun 2023 16:05:39 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Yunfei Dong <yunfei.dong@mediatek.com>
Cc:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: [PATCH 1/4] media: mediatek: vcodec: fix potential double free
Message-ID: <ca491aaa-cfc4-4a84-b7fc-b64f3adc6550@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The "lat_buf->private_data" needs to be set to NULL to prevent a
double free.  How this would happen is if vdec_msg_queue_init() failed
twice in a row and on the second time it failed earlier than on the
first time.

The vdec_msg_queue_init() function has a loop which does:
	for (i = 0; i < NUM_BUFFER_COUNT; i++) {

Each iteration initializes one element in the msg_queue->lat_buf[] array
and then the clean up function vdec_msg_queue_deinit() frees each
element of the msg_queue->lat_buf[] array.  This clean up code relies
on the assumption that every element is either initialized or zeroed.
Leaving a freed pointer which is non-zero breaks the assumption.

Fixes: b199fe46f35c ("media: mtk-vcodec: Add msg queue feature for lat and core architecture")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c b/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c
index f555341ae708..92ac82eb444e 100644
--- a/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c
+++ b/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c
@@ -231,6 +231,7 @@ void vdec_msg_queue_deinit(struct vdec_msg_queue *msg_queue,
 			mtk_vcodec_mem_free(ctx, mem);
 
 		kfree(lat_buf->private_data);
+		lat_buf->private_data = NULL;
 	}
 
 	cancel_work_sync(&msg_queue->core_work);
-- 
2.39.2

