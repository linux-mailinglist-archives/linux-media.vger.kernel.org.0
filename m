Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 932F435C6DC
	for <lists+linux-media@lfdr.de>; Mon, 12 Apr 2021 14:57:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241537AbhDLM5o (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Apr 2021 08:57:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241506AbhDLM5n (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Apr 2021 08:57:43 -0400
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBE0CC061574;
        Mon, 12 Apr 2021 05:57:25 -0700 (PDT)
Received: by mail-qk1-x72f.google.com with SMTP id d15so146109qkc.9;
        Mon, 12 Apr 2021 05:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=/Yq9d2p6Dmjcfhw+4JZIGQuxSwEH4EO4U1BZYPvkJ9c=;
        b=urmL14Laq0tJ/p2X3M+69nR4OCrVPy9daFTXyz7TxnocV5Qn8QOhPrQNglT5LzFtNV
         YeiIwDK20XJ1x1C8CyKnld1NFEw7xIQs4fnyE/CbfsUlfCjYZmp2rNBkkV9QEGSm3bsj
         PI6suYzl8Fw5RBbKh4UYDwk8SYvj6FZhkukw/yEkPBAgKZ0zXMrcOaNr49i2McqwJ4cx
         Csqv+qyNP8E1t4jKXSQrbSzc8bF6XHGQyKvrIju8eb5Tvxuq4hgf9ZSOHeutev+ye4be
         Qhs1/VRYOOMIUFJmcLpMvia55UmH5ErENZ7kj32P0DP8Ctbh01+th6T49ohI5LugHCBT
         GDzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=/Yq9d2p6Dmjcfhw+4JZIGQuxSwEH4EO4U1BZYPvkJ9c=;
        b=DeARfBI63sIwM0jY9gD9BmsKOppLRFyZO8SOvW37dkUe/tfMPSTItrIUIFu1lg/KAW
         xQNfW+i3VDF7I2DCOWqfx1DqNYYL+8dJ4Xb7rAMlB3/cuqtLlLq8V0wqgBZjAE1K/PKH
         u2y3Fic3KFhGGMMqF65ZFIKjbaZ/8QOy+l4WpdRNXu34pSiNTB5xwTF7Hqkb+QSVSkjD
         eV6fOV+sIhvOCg8dW2kiV8e/S+Z1Zs44sekmSMm6eM9W2ch0ls12u4tLlAr71Y6BsGPP
         2n3O45fVIH4DWJ+Ujt2jXNg9uJhmC6BW+EHObiifwi3AbK54/rAJogRKCe3AtU5t/RUO
         b5UQ==
X-Gm-Message-State: AOAM5303u+xoVE83iMnPdwhVZvUAQhoWWJh4OSNRMEqVSa+Ze3xvTFT1
        lH0XOoFZc+icaOw8q2whBFo=
X-Google-Smtp-Source: ABdhPJyWVx2VXGGwz7hzJEZCw89pwMLXlUMe2dFH8Kbw2eFSK0mXKW3AgmvNbVm9VqD+AWTkAXH4nQ==
X-Received: by 2002:a37:274f:: with SMTP id n76mr26839351qkn.15.1618232245054;
        Mon, 12 Apr 2021 05:57:25 -0700 (PDT)
Received: from focaruja ([2001:1284:f016:a037:476a:dfcd:f18f:9ad5])
        by smtp.gmail.com with ESMTPSA id x4sm1406354qkp.78.2021.04.12.05.57.24
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Mon, 12 Apr 2021 05:57:24 -0700 (PDT)
Date:   Mon, 12 Apr 2021 09:57:22 -0300
From:   Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Subject: [Outreachy kernel][PATCH 4/4 v2] staging: media: omap4iss: Replace
 macro function by static inline function in file iss_resizer.c
Message-ID: <431dab7622963701c1d8ba8033bed5aaca11be70.1618231618.git.alinesantanacordeiro@gmail.com>
References: <cover.1618231618.git.alinesantanacordeiro@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1618231618.git.alinesantanacordeiro@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Replace macro function by static inline function.
Issue suggested by Julia.

Signed-off-by: Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
---

Changes since v1:
 - Insert file path in commit message
 - Remove trailing space left during modification
 
 drivers/staging/media/omap4iss/iss_resizer.c | 126 ++++++++++++++-------------
 1 file changed, 65 insertions(+), 61 deletions(-)

diff --git a/drivers/staging/media/omap4iss/iss_resizer.c b/drivers/staging/media/omap4iss/iss_resizer.c
index 3b6875c..80ca44d 100644
--- a/drivers/staging/media/omap4iss/iss_resizer.c
+++ b/drivers/staging/media/omap4iss/iss_resizer.c
@@ -30,13 +30,17 @@ static const unsigned int resizer_fmts[] = {
  *
  * Also prints other debug information stored in the RESIZER module.
  */
-#define RSZ_PRINT_REGISTER(iss, name)\
-	dev_dbg(iss->dev, "###RSZ " #name "=0x%08x\n", \
-		iss_reg_read(iss, OMAP4_ISS_MEM_ISP_RESIZER, RSZ_##name))
+static inline rsz_print_register(iss, name)
+{
+	dev_dbg(iss->dev, "###RSZ " #name "=0x%08x\n",
+		iss_reg_read(iss, OMAP4_ISS_MEM_ISP_RESIZER, RSZ_##name));
+}
 
-#define RZA_PRINT_REGISTER(iss, name)\
-	dev_dbg(iss->dev, "###RZA " #name "=0x%08x\n", \
-		iss_reg_read(iss, OMAP4_ISS_MEM_ISP_RESIZER, RZA_##name))
+static inline rza_print_register(iss, name)
+{
+	dev_dbg(iss->dev, "###RZA " #name "=0x%08x\n",
+		iss_reg_read(iss, OMAP4_ISS_MEM_ISP_RESIZER, RZA_##name));
+}
 
 static void resizer_print_status(struct iss_resizer_device *resizer)
 {
@@ -44,61 +48,61 @@ static void resizer_print_status(struct iss_resizer_device *resizer)
 
 	dev_dbg(iss->dev, "-------------RESIZER Register dump-------------\n");
 
-	RSZ_PRINT_REGISTER(iss, SYSCONFIG);
-	RSZ_PRINT_REGISTER(iss, IN_FIFO_CTRL);
-	RSZ_PRINT_REGISTER(iss, FRACDIV);
-	RSZ_PRINT_REGISTER(iss, SRC_EN);
-	RSZ_PRINT_REGISTER(iss, SRC_MODE);
-	RSZ_PRINT_REGISTER(iss, SRC_FMT0);
-	RSZ_PRINT_REGISTER(iss, SRC_FMT1);
-	RSZ_PRINT_REGISTER(iss, SRC_VPS);
-	RSZ_PRINT_REGISTER(iss, SRC_VSZ);
-	RSZ_PRINT_REGISTER(iss, SRC_HPS);
-	RSZ_PRINT_REGISTER(iss, SRC_HSZ);
-	RSZ_PRINT_REGISTER(iss, DMA_RZA);
-	RSZ_PRINT_REGISTER(iss, DMA_RZB);
-	RSZ_PRINT_REGISTER(iss, DMA_STA);
-	RSZ_PRINT_REGISTER(iss, GCK_MMR);
-	RSZ_PRINT_REGISTER(iss, GCK_SDR);
-	RSZ_PRINT_REGISTER(iss, IRQ_RZA);
-	RSZ_PRINT_REGISTER(iss, IRQ_RZB);
-	RSZ_PRINT_REGISTER(iss, YUV_Y_MIN);
-	RSZ_PRINT_REGISTER(iss, YUV_Y_MAX);
-	RSZ_PRINT_REGISTER(iss, YUV_C_MIN);
-	RSZ_PRINT_REGISTER(iss, YUV_C_MAX);
-	RSZ_PRINT_REGISTER(iss, SEQ);
-
-	RZA_PRINT_REGISTER(iss, EN);
-	RZA_PRINT_REGISTER(iss, MODE);
-	RZA_PRINT_REGISTER(iss, 420);
-	RZA_PRINT_REGISTER(iss, I_VPS);
-	RZA_PRINT_REGISTER(iss, I_HPS);
-	RZA_PRINT_REGISTER(iss, O_VSZ);
-	RZA_PRINT_REGISTER(iss, O_HSZ);
-	RZA_PRINT_REGISTER(iss, V_PHS_Y);
-	RZA_PRINT_REGISTER(iss, V_PHS_C);
-	RZA_PRINT_REGISTER(iss, V_DIF);
-	RZA_PRINT_REGISTER(iss, V_TYP);
-	RZA_PRINT_REGISTER(iss, V_LPF);
-	RZA_PRINT_REGISTER(iss, H_PHS);
-	RZA_PRINT_REGISTER(iss, H_DIF);
-	RZA_PRINT_REGISTER(iss, H_TYP);
-	RZA_PRINT_REGISTER(iss, H_LPF);
-	RZA_PRINT_REGISTER(iss, DWN_EN);
-	RZA_PRINT_REGISTER(iss, SDR_Y_BAD_H);
-	RZA_PRINT_REGISTER(iss, SDR_Y_BAD_L);
-	RZA_PRINT_REGISTER(iss, SDR_Y_SAD_H);
-	RZA_PRINT_REGISTER(iss, SDR_Y_SAD_L);
-	RZA_PRINT_REGISTER(iss, SDR_Y_OFT);
-	RZA_PRINT_REGISTER(iss, SDR_Y_PTR_S);
-	RZA_PRINT_REGISTER(iss, SDR_Y_PTR_E);
-	RZA_PRINT_REGISTER(iss, SDR_C_BAD_H);
-	RZA_PRINT_REGISTER(iss, SDR_C_BAD_L);
-	RZA_PRINT_REGISTER(iss, SDR_C_SAD_H);
-	RZA_PRINT_REGISTER(iss, SDR_C_SAD_L);
-	RZA_PRINT_REGISTER(iss, SDR_C_OFT);
-	RZA_PRINT_REGISTER(iss, SDR_C_PTR_S);
-	RZA_PRINT_REGISTER(iss, SDR_C_PTR_E);
+	rsz_print_register(iss, SYSCONFIG);
+	rsz_print_register(iss, IN_FIFO_CTRL);
+	rsz_print_register(iss, FRACDIV);
+	rsz_print_register(iss, SRC_EN);
+	rsz_print_register(iss, SRC_MODE);
+	rsz_print_register(iss, SRC_FMT0);
+	rsz_print_register(iss, SRC_FMT1);
+	rsz_print_register(iss, SRC_VPS);
+	rsz_print_register(iss, SRC_VSZ);
+	rsz_print_register(iss, SRC_HPS);
+	rsz_print_register(iss, SRC_HSZ);
+	rsz_print_register(iss, DMA_RZA);
+	rsz_print_register(iss, DMA_RZB);
+	rsz_print_register(iss, DMA_STA);
+	rsz_print_register(iss, GCK_MMR);
+	rsz_print_register(iss, GCK_SDR);
+	rsz_print_register(iss, IRQ_RZA);
+	rsz_print_register(iss, IRQ_RZB);
+	rsz_print_register(iss, YUV_Y_MIN);
+	rsz_print_register(iss, YUV_Y_MAX);
+	rsz_print_register(iss, YUV_C_MIN);
+	rsz_print_register(iss, YUV_C_MAX);
+	rsz_print_register(iss, SEQ);
+
+	rza_print_register(iss, EN);
+	rza_print_register(iss, MODE);
+	rza_print_register(iss, 420);
+	rza_print_register(iss, I_VPS);
+	rza_print_register(iss, I_HPS);
+	rza_print_register(iss, O_VSZ);
+	rza_print_register(iss, O_HSZ);
+	rza_print_register(iss, V_PHS_Y);
+	rza_print_register(iss, V_PHS_C);
+	rza_print_register(iss, V_DIF);
+	rza_print_register(iss, V_TYP);
+	rza_print_register(iss, V_LPF);
+	rza_print_register(iss, H_PHS);
+	rza_print_register(iss, H_DIF);
+	rza_print_register(iss, H_TYP);
+	rza_print_register(iss, H_LPF);
+	rza_print_register(iss, DWN_EN);
+	rza_print_register(iss, SDR_Y_BAD_H);
+	rza_print_register(iss, SDR_Y_BAD_L);
+	rza_print_register(iss, SDR_Y_SAD_H);
+	rza_print_register(iss, SDR_Y_SAD_L);
+	rza_print_register(iss, SDR_Y_OFT);
+	rza_print_register(iss, SDR_Y_PTR_S);
+	rza_print_register(iss, SDR_Y_PTR_E);
+	rza_print_register(iss, SDR_C_BAD_H);
+	rza_print_register(iss, SDR_C_BAD_L);
+	rza_print_register(iss, SDR_C_SAD_H);
+	rza_print_register(iss, SDR_C_SAD_L);
+	rza_print_register(iss, SDR_C_OFT);
+	rza_print_register(iss, SDR_C_PTR_S);
+	rza_print_register(iss, SDR_C_PTR_E);
 
 	dev_dbg(iss->dev, "-----------------------------------------------\n");
 }
-- 
2.7.4

