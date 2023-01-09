Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D813663175
	for <lists+linux-media@lfdr.de>; Mon,  9 Jan 2023 21:25:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237559AbjAIUZx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Jan 2023 15:25:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237623AbjAIUZw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Jan 2023 15:25:52 -0500
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BF365E095
        for <linux-media@vger.kernel.org>; Mon,  9 Jan 2023 12:25:50 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id az20so4074455ejc.1
        for <linux-media@vger.kernel.org>; Mon, 09 Jan 2023 12:25:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TvCiZ+00/tLPSdTZ+JyOQWvRzzq3WpioY6XswRsIjcE=;
        b=YXrkFoOlhlNPJpKZ6GrvRy5UWIdgGZVNgWyjoBmoFw4UofvGA9VbBeyIYltY+TQhc+
         soA+g2ISh+T2HZm943jxY0lqELtSqvtz7q4O0Br7XNSs9iXPe47QueaMPk8nV4QAJ4bK
         ++okFJmHFZnXYFRzjiO2RuT5mvZl9QEXCSn2lQyayUvC7qb3flb+5X4H5Cu9opibIgNr
         cANgH2NMPATRKd46ERj6y0DIKPp1S4JCkFmTK/oqDN5gTR78RoccBxZCo/koWsIdEEPR
         Kbo5z+A2uUXusP3/rlbz9fRC3uqE/Zx79yb5jLiBSdnvCBmCYYv1KcPajvuVmwKk1DV2
         tAxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TvCiZ+00/tLPSdTZ+JyOQWvRzzq3WpioY6XswRsIjcE=;
        b=A0rj/TNLhYbFSxTxit0xVgOyUk46D++fC0At5OkAzxwynLMi3lX2hE182JCFSHL/51
         N+ebW6syAHERU4NfY8kccBjQQ7CHI9eAlBV7o8KoRw5JJBw0B3e52gbAPKiUwGLf/R2G
         0TSpitl3iERwztJpDfq4gV+XJITfHmjRTW6QuFIaT2OFIX6fTnxihOh0ZffGSgaJCTpp
         ExOsFvP8M/OH2KkvZZTyLulTX+A1MWOWqIiy5caBP48/f3DOEsZkrBBigXE9JqxRa878
         xF29VxBw3knGhO7bexKuHqf8IRJouAMhCyZ75XL3dIVl1bqON1bEfm3I4+m/CO7Sffe/
         ixvg==
X-Gm-Message-State: AFqh2kqPYpC2VPxIY9IUxVmgGUFnXZmSOqeapY/bRARUl0FHe3+0mNo/
        CCLVUebisUSQglHRDjM8svY=
X-Google-Smtp-Source: AMrXdXvxkgpcumhxzKoBkS6caYeFoU/VpPPpaY87c259wywv5CIfVAnpQ4Ew7Eqa5j8Z0/me5v//Zw==
X-Received: by 2002:a17:907:a2cd:b0:84d:4e03:1644 with SMTP id re13-20020a170907a2cd00b0084d4e031644mr2800578ejc.68.1673295949042;
        Mon, 09 Jan 2023 12:25:49 -0800 (PST)
Received: from localhost.localdomain (mm-32-70-120-178.brest.dynamic.pppoe.byfly.by. [178.120.70.32])
        by smtp.gmail.com with ESMTPSA id z20-20020a1709067e5400b00809e33ba33dsm4141106ejr.19.2023.01.09.12.25.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 12:25:48 -0800 (PST)
From:   Oleg Verych <olecom@gmail.com>
To:     linux-sunxi@lists.linux.dev (open list:ARM/Allwinner sunXi SoC support)
Cc:     Oleg Verych <olecom@gmail.com>, Maxime Ripard <mripard@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org (open list:ALLWINNER A10 CSI DRIVER),
        linux-sunxi <linux-sunxi@googlegroups.com>
Subject: [PATCH] media: sun4i-csi: Use CSI_INT_STA_REG name, fix typo in a comment
Date:   Mon,  9 Jan 2023 23:24:56 +0300
Message-Id: <20230109202457.3067-1-olecom@gmail.com>
X-Mailer: git-send-email 2.35.1.windows.2
In-Reply-To: <20230107083749.2419-1-olecom@gmail.com>
References: <20230107083749.2419-1-olecom@gmail.com>
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

