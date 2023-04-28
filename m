Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68F7E6F1B5E
	for <lists+linux-media@lfdr.de>; Fri, 28 Apr 2023 17:22:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346374AbjD1PWS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Apr 2023 11:22:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346362AbjD1PWP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Apr 2023 11:22:15 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A37C59EC
        for <linux-media@vger.kernel.org>; Fri, 28 Apr 2023 08:22:06 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-63b7096e2e4so89232b3a.2
        for <linux-media@vger.kernel.org>; Fri, 28 Apr 2023 08:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1682695326; x=1685287326;
        h=to:from:cc:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=caI/sHVT/dTUUx0xQxA5OglgAof96u9NCT1oMhdGQaE=;
        b=5APyf6IaypaSkGY423y9+DPeUGw/pS9mWf0RNl9FSvjT5eY85AYkO0vuEqmn6+PbmB
         N44kIwjbQ/iJ3XG5KBfY/LnO2US7f4zTavypYXXn9iRDiPebS974vKgT2dkFbOZRnNV2
         SgxItQl1WSkuiGfgmvDeA8PbqkTVxNWdj4FyWwl0ydTHjBB/D4Yh6AAiO14AliS8XH9p
         RioJwh/qeYHLjwuzxktLhAUDByYqkZtPycybZWffcNAzgGYOuLDdYGV1+xi6sNnMrBlt
         HNpaTK84O8G89QTEB9PHpBImcwtHus94gCZqcqLV3sAyGDvrYKQN0g0yuCbNKD+ZJGoc
         RASw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682695326; x=1685287326;
        h=to:from:cc:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=caI/sHVT/dTUUx0xQxA5OglgAof96u9NCT1oMhdGQaE=;
        b=HfU/a2vZhKsbLEZy/8rkViYEUTNI5IVDHzxPCXsz/8Gt+ZWz32hhH507Y3Agw2mEpE
         ErTquPk8JJNXMI5weCSM26MarnzRgC0TEcXm4R+vlb0KWl+epza0Uvx6eeQ+dx9CE3J/
         TZEx2XPgE7u4h/BceBhBa57pzdQ2hoTH5J0xgnRqJNhgJjD1H994JQ1v7XtGF2742gFw
         z6DQpZ8pOTbsr+df+ILIDYiqvvfNCKZRzZ48ONYzUpuKTtc4NyPkWE2nUmkJFHVUDIq1
         H8KZYVlHDSEpI1bZbEvogf7uO2EFcWcXkuqq/H0q+lrsxsDGgsc8yXFcSn2ff2+6c/qf
         7T3Q==
X-Gm-Message-State: AC+VfDwVr+i9xe4OVGFirW5Q9Pt030LQhZcGgpRJJYz/0QfEGMrRtAPx
        XhtwMNQA7HUGyE2lzXhK1iBm6A==
X-Google-Smtp-Source: ACHHUZ6/efZ/rcgv/8VUwngpwdMqOcBS3udtbsJyGQSkIuylo0aBwAi2TntMSWjNfbB8F8WaVCH7sA==
X-Received: by 2002:a05:6a20:12c4:b0:f3:3ab1:e34a with SMTP id v4-20020a056a2012c400b000f33ab1e34amr7546009pzg.29.1682695325779;
        Fri, 28 Apr 2023 08:22:05 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id y7-20020a056a00190700b0063f1430dd57sm13135014pfi.49.2023.04.28.08.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Apr 2023 08:22:05 -0700 (PDT)
Subject: [PATCH 2/2] media: nxp: imx8-isi: Fix undefined config warnings
Date:   Fri, 28 Apr 2023 08:21:56 -0700
Message-Id: <20230428152156.22840-3-palmer@rivosinc.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230428152156.22840-1-palmer@rivosinc.com>
References: <20230428152156.22840-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc:     laurent.pinchart@ideasonboard.com, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux@rivosinc.com, Palmer Dabbelt <palmer@rivosinc.com>
From:   Palmer Dabbelt <palmer@rivosinc.com>
To:     mchehab@kernel.org
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Palmer Dabbelt <palmer@rivosinc.com>

These show up as warnings related to the implicit 0 for undefined
macros.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
index db538f3d88ec..6d3417bf72cf 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
@@ -30,7 +30,7 @@ static inline void mxc_isi_write(struct mxc_isi_pipe *pipe, u32 reg, u32 val)
 void mxc_isi_channel_set_inbuf(struct mxc_isi_pipe *pipe, dma_addr_t dma_addr)
 {
 	mxc_isi_write(pipe, CHNL_IN_BUF_ADDR, dma_addr);
-#if CONFIG_ARCH_DMA_ADDR_T_64BIT
+#if defined(CONFIG_ARCH_DMA_ADDR_T_64BIT)
 	if (pipe->isi->pdata->has_36bit_dma)
 		mxc_isi_write(pipe, CHNL_IN_BUF_XTND_ADDR, dma_addr >> 32);
 #endif
@@ -48,7 +48,7 @@ void mxc_isi_channel_set_outbuf(struct mxc_isi_pipe *pipe,
 		mxc_isi_write(pipe, CHNL_OUT_BUF1_ADDR_Y, dma_addrs[0]);
 		mxc_isi_write(pipe, CHNL_OUT_BUF1_ADDR_U, dma_addrs[1]);
 		mxc_isi_write(pipe, CHNL_OUT_BUF1_ADDR_V, dma_addrs[2]);
-#if CONFIG_ARCH_DMA_ADDR_T_64BIT
+#if defined(CONFIG_ARCH_DMA_ADDR_T_64BIT)
 		if (pipe->isi->pdata->has_36bit_dma) {
 			mxc_isi_write(pipe, CHNL_Y_BUF1_XTND_ADDR,
 				      dma_addrs[0] >> 32);
@@ -63,7 +63,7 @@ void mxc_isi_channel_set_outbuf(struct mxc_isi_pipe *pipe,
 		mxc_isi_write(pipe, CHNL_OUT_BUF2_ADDR_Y, dma_addrs[0]);
 		mxc_isi_write(pipe, CHNL_OUT_BUF2_ADDR_U, dma_addrs[1]);
 		mxc_isi_write(pipe, CHNL_OUT_BUF2_ADDR_V, dma_addrs[2]);
-#if CONFIG_ARCH_DMA_ADDR_T_64BIT
+#if defined(CONFIG_ARCH_DMA_ADDR_T_64BIT)
 		if (pipe->isi->pdata->has_36bit_dma) {
 			mxc_isi_write(pipe, CHNL_Y_BUF2_XTND_ADDR,
 				      dma_addrs[0] >> 32);
-- 
2.40.0

