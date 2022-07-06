Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 23A065691B7
	for <lists+linux-media@lfdr.de>; Wed,  6 Jul 2022 20:28:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233420AbiGFS1i (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Jul 2022 14:27:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234139AbiGFS1g (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Jul 2022 14:27:36 -0400
Received: from mail-vk1-xa32.google.com (mail-vk1-xa32.google.com [IPv6:2607:f8b0:4864:20::a32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 263FC1055B
        for <linux-media@vger.kernel.org>; Wed,  6 Jul 2022 11:27:35 -0700 (PDT)
Received: by mail-vk1-xa32.google.com with SMTP id b5so7805033vkp.4
        for <linux-media@vger.kernel.org>; Wed, 06 Jul 2022 11:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gwI3B/pNe57ukV/bZE0Q4gbpZ46EhYOPKwpHR+DMozk=;
        b=3rvLnDYjlDgAD6tjeHhgDfzll8/87learjvs4vwZzZikbMzP5g45wL3sG3r9IjFxQo
         S7RxwQzGjMBsNt9zx5YODv4VurfvXp5AbuTQiTrAf+PaAaalad6KvP1vCbhbT39bsaK4
         eRid6zFuGSoCBzephrUkmOB6HPTzgz1R5XAtcc9iNIp7Sm/Jrz7Nfzq3UMZi5zIyhwrQ
         rM1MEq87lsdW3FrFfDQ19DkE4eoVTrZijFQOyIFNMrRlw5XedpF8dZNHIid3LVnL+e4G
         7QDQ8z0rXNmRz1+CpPQ6/qagXfdMfJN4VuyfH0XtJ88JhGlacyAw3N7FIgHGrjuYYxna
         FJ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gwI3B/pNe57ukV/bZE0Q4gbpZ46EhYOPKwpHR+DMozk=;
        b=Zc3fcufST/TkvnAJLD4XmCIXeDSlxfiIsKieEpRCdHESlwWM0lLgaXwm9bjpmR4hcW
         nLLVFQiAAJ6CCbC6bp8udUSzUVE8x5gOwO5igOIjp5Q1PCxcKR/OCHO7ET8XYB9dUfs1
         LXlnoap2FtfNboaSqcuiX2+RH42QTBDwMBopZ9rzEp5CSQqFusma9wNerCzOS6xzSkyi
         8vU4k3gq5+MCz12G11CidoQ57BifnK5T9ApPZoqbSClYoHKUy1328NBT1NHQRpMWZQ4d
         3GXUAWbPDGBISyAFsnpWqqBUywgzOb8mrWsbZKiOuZPPPytgW3bREgsWWnYkmttBplh0
         T4dw==
X-Gm-Message-State: AJIora/f/87gfvTxhV3sBzLp8MkkeaV1/pJIeDAsa9wImc/RnhT2DhK/
        82ml6S/sD0xGsCJ1Sm6mXsKxDTArrTlVb+EM
X-Google-Smtp-Source: AGRyM1v9RiWAEK11B6u6zMGoJ9dRE/OGrpnfiKi/Fn85mPh8O24xcD6ETQWvSfKzXZZJAWTTCG6LqA==
X-Received: by 2002:a1f:3296:0:b0:374:19b8:1df5 with SMTP id y144-20020a1f3296000000b0037419b81df5mr5446639vky.7.1657132054008;
        Wed, 06 Jul 2022 11:27:34 -0700 (PDT)
Received: from zeta-build.. ([190.190.187.68])
        by smtp.gmail.com with ESMTPSA id bl9-20020a056102508900b003563680212asm7445539vsb.27.2022.07.06.11.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 11:27:33 -0700 (PDT)
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tomasz Figa <tfiga@chromium.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: [PATCH 4/8] vicodec: Use vb2_find_buffer
Date:   Wed,  6 Jul 2022 15:26:53 -0300
Message-Id: <20220706182657.210650-5-ezequiel@vanguardiasur.com.ar>
X-Mailer: git-send-email 2.34.3
In-Reply-To: <20220706182657.210650-1-ezequiel@vanguardiasur.com.ar>
References: <20220706182657.210650-1-ezequiel@vanguardiasur.com.ar>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the newly introduced vb2_find_buffer API to get a vb2_buffer
given a buffer timestamp.

Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
---
 drivers/media/test-drivers/vicodec/vicodec-core.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/media/test-drivers/vicodec/vicodec-core.c b/drivers/media/test-drivers/vicodec/vicodec-core.c
index be43f7d32df9..1d1bee111732 100644
--- a/drivers/media/test-drivers/vicodec/vicodec-core.c
+++ b/drivers/media/test-drivers/vicodec/vicodec-core.c
@@ -280,17 +280,13 @@ static int device_process(struct vicodec_ctx *ctx,
 		 */
 		if (!(ntohl(ctx->state.header.flags) & V4L2_FWHT_FL_I_FRAME)) {
 			struct vb2_buffer *ref_vb2_buf;
-			int ref_buf_idx;
 			struct vb2_queue *vq_cap =
 				v4l2_m2m_get_vq(ctx->fh.m2m_ctx,
 						V4L2_BUF_TYPE_VIDEO_CAPTURE);
 
-			ref_buf_idx = vb2_find_timestamp(vq_cap,
-							 ctx->state.ref_frame_ts, 0);
-			if (ref_buf_idx < 0)
+			ref_vb2_buf = vb2_find_buffer(vq_cap, ctx->state.ref_frame_ts);
+			if (!ref_vb2_buf)
 				return -EINVAL;
-
-			ref_vb2_buf = vq_cap->bufs[ref_buf_idx];
 			if (ref_vb2_buf->state == VB2_BUF_STATE_ERROR)
 				ret = -EINVAL;
 			ctx->state.ref_frame.buf =
-- 
2.34.3

