Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B373466D288
	for <lists+linux-media@lfdr.de>; Tue, 17 Jan 2023 00:05:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235144AbjAPXFt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Jan 2023 18:05:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235214AbjAPXFW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Jan 2023 18:05:22 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6B8B2E0DC
        for <linux-media@vger.kernel.org>; Mon, 16 Jan 2023 15:04:28 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id f25-20020a1c6a19000000b003da221fbf48so6895622wmc.1
        for <linux-media@vger.kernel.org>; Mon, 16 Jan 2023 15:04:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qdVquD9u0NlEIO5cxWzYGboFvm6XlfypUwKZRUXYZtU=;
        b=Sm9E8gs8hjOMEkBjEH8SiQK6HB1Pg74vnMqjGhwc8mhvKNPIvRqzqQYwt2xSF6VHKC
         Js6NIpcPf3k+9A9SEvyhRJtmn16QdBUuaek1SZbQUUfLOYkRcKoKYhuK68oRincqS7oy
         TPfKH6FMpvD61/rdUxN3pE/QsxNWftr/e90/yDvQt5lrNxYPG/NXhYzWGxJVJRY4VVW9
         uNm43uSJ3UaHSenG3juhn3L5lH3FnG4bS+Qbt2if7Rzg99Yu22MDl72wFpcpoArZJqiR
         Lw+O7hIpijwqybvKATWNkZFGBm8Iw49HoPaZpOVjMprh0Ij0wiJKL777QBD9FOt4HY1m
         iapg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qdVquD9u0NlEIO5cxWzYGboFvm6XlfypUwKZRUXYZtU=;
        b=1w0LCwn/m+ilpL0szqcM9qvwKD+BsdpnuYM2AD6Z1hRzhwbwLOc2peTMxCbq4VsL8x
         CZ05qSaC/5t71V/V/obqHzdm0CSGv5N1O5aqselHCBrOb+kJLW7CmNbjL0JFc0IR9jGa
         YmFqMNsPEZpy47IWZxxG36rGMzJyYkYtKM+ipet3ZQnhsXnHgYAoITTznNVSCvbDtlmv
         hURaFKpfvi5QLVIrDmnndXcWzGZsCbpP6crCEY6BQ8SGZfUuCCayfry8Bsn/hPqkO3yJ
         V/ZJhX5/dCPRI5WzXnBrhiPDQmW+9RqlGSqYvHmmmrCNdyfGKFQpJDEKTgPBsdtFZWLO
         MRLQ==
X-Gm-Message-State: AFqh2ko5BZdGBKAJYCT0/8G99WGRGnb7VFN05d4rzcrSgfpfio3t7v6L
        IbnuMUF8yEVdrz71co+UO18=
X-Google-Smtp-Source: AMrXdXvbGJ9u2q+SZPhf5sOM6tVLv6nSoLpDEyC3UaL6ha+NwHD2966GBjROJX23QYHvcuXzivpQCA==
X-Received: by 2002:a05:600c:a690:b0:3d5:64bf:ccb8 with SMTP id ip16-20020a05600ca69000b003d564bfccb8mr999617wmb.12.1673910267014;
        Mon, 16 Jan 2023 15:04:27 -0800 (PST)
Received: from localhost.localdomain (mm-88-61-120-178.brest.dynamic.pppoe.byfly.by. [178.120.61.88])
        by smtp.gmail.com with ESMTPSA id n7-20020a05600c4f8700b003c6bd12ac27sm39136685wmq.37.2023.01.16.15.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jan 2023 15:04:26 -0800 (PST)
From:   Oleg Verych <olecom@gmail.com>
To:     linux-sunxi@lists.linux.dev (open list:ARM/Allwinner sunXi SoC support)
Cc:     Oleg Verych <olecom@gmail.com>, Maxime Ripard <mripard@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        linux-media@vger.kernel.org (open list:ALLWINNER A10 CSI DRIVER),
        linux-sunxi <linux-sunxi@googlegroups.com>
Subject: [PATCH] media: sun4i-csi: Use CSI_INT_STA_REG name, fix typo in a comment
Date:   Tue, 17 Jan 2023 02:03:23 +0300
Message-Id: <20230116230323.4718-1-olecom@gmail.com>
X-Mailer: git-send-email 2.35.1.windows.2
In-Reply-To: <Y8WgY74zWjF3kvln@valkosipuli.retiisi.eu>
References: <Y8WgY74zWjF3kvln@valkosipuli.retiisi.eu>
MIME-Version: 1.0
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

Fix interrupt status register offset usage to be a defined name
CSI_INT_STA_REG (= 0x34) instead of a plain number.

Additionally fix a typo in a comment of the same file.

Signed-off-by: Oleg Verych <olecom@gmail.com>

---
 drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c b/drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c
index a3e826a75..95b5633b7 100644
--- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c
+++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c
@@ -245,7 +245,7 @@ static int sun4i_csi_start_streaming(struct vb2_queue *vq, unsigned int count)
 	 * We need a scratch buffer in case where we'll not have any
 	 * more buffer queued so that we don't error out. One of those
 	 * cases is when you end up at the last frame to capture, you
-	 * don't havea any buffer queued any more, and yet it doesn't
+	 * don't have any buffer queued any more, and yet it doesn't
 	 * really matter since you'll never reach the next buffer.
 	 *
 	 * Since we support the multi-planar API, we need to have a
@@ -311,7 +311,7 @@ static int sun4i_csi_start_streaming(struct vb2_queue *vq, unsigned int count)
 	writel(CSI_BUF_CTRL_DBE, csi->regs + CSI_BUF_CTRL_REG);
 
 	/* Clear the pending interrupts */
-	writel(CSI_INT_FRM_DONE, csi->regs + 0x34);
+	writel(CSI_INT_FRM_DONE, csi->regs + CSI_INT_STA_REG);
 
 	/* Enable frame done interrupt */
 	writel(CSI_INT_FRM_DONE, csi->regs + CSI_INT_EN_REG);
-- 
2.20.1

