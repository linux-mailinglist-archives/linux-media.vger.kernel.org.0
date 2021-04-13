Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85E5935E74E
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 21:50:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348136AbhDMTu7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Apr 2021 15:50:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348070AbhDMTu6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Apr 2021 15:50:58 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF272C06175F;
        Tue, 13 Apr 2021 12:50:36 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id y2so8820969plg.5;
        Tue, 13 Apr 2021 12:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=5ZGDzdErRxUI9IZb9UDQSjtRJN0GbJNSQ1BKBF0AUrw=;
        b=hk8h2YjLplijbEQDPc4TuZtwKYvcH4zIaE9SvYccXd/KEH9LK51WMG7pkm5qU5N4Tg
         pSzW+YoQP1luJyRswa+PcjV0B6MXBWiaikaU1kTcQiCchVuccbEGGf9SHADr/LtYQ7yI
         rs+zDLvuoVwc9eO6UTzcc4UbZG3JwThQbtppI0M/6geeSJzlR+mvVJMCEtBE/fIB1wCf
         Od8V+KKBzSe87Zrl9WfZ3GSSB0rnIzWxi/m65c5/vGs+/LZK7oqkYJTAk4J9lof3uWA1
         AM7LOSRNSyO9/PTWwKGj36thlfAlpITzkjl4/ur666Na/xW6gLsuBQOi9AZyGxUn+/3u
         iUyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5ZGDzdErRxUI9IZb9UDQSjtRJN0GbJNSQ1BKBF0AUrw=;
        b=GK/JF8ARjNlmSYOKZQHclUDMr3dncsc3iXq1XhPsi1A9Ef/EGJPitHF6C3rQBsA2OP
         /S9ez13a9Wla5UeCQWI6/CwQ8jxbcRZsaR3GUpiS/bVpvdMMG/Y+Wz8pBJJ+2It0ymSZ
         WIrcBwnOSkYMsfFxWkWEtLLxwhpPnbJb65gn77b11gY0y+mqE0YZBzBZpPoRtbHR/xYY
         fBHCGCgOG+PGHE3sukNc/h4gc1ZXGcgaY6Gz4uo5MNglIj0Lw/+4aXl8lA51+TVAjUWA
         aLHTQ3UDY9+yRN+gwbv5aq7hprJNEAUUmOdvELMU5KJdkmzXpjS+o6idx8bToPv2FJAs
         t8wQ==
X-Gm-Message-State: AOAM5327v8EzH0dmCGUFscx0/AIynSOM1fSr7XopomK1lmjWCv7T3QS0
        qVuaocdVHjYcDUXFONO1ZNc=
X-Google-Smtp-Source: ABdhPJzLqe1AbglUDX/HuJDiBH154/AfY1suTGxzZ46og/W+95u9GljHZU/5gahA7DWPMJGE064kXA==
X-Received: by 2002:a17:90b:1198:: with SMTP id gk24mr1722701pjb.73.1618343436303;
        Tue, 13 Apr 2021 12:50:36 -0700 (PDT)
Received: from kali ([103.141.87.253])
        by smtp.gmail.com with ESMTPSA id f13sm321739pfc.195.2021.04.13.12.50.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 12:50:35 -0700 (PDT)
Date:   Wed, 14 Apr 2021 01:20:31 +0530
From:   Mitali Borkar <mitaliborkar810@gmail.com>
To:     clabbe@baylibre.com, mchehab@kernel.org, gregkh@linuxfoundation.org
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
        mitali_s@me.iitr.ac.in
Subject: [PATCH v4 2/2] staging: media: zoran: add BIT() macro and align code
Message-ID: <fb60b20f7cdf3650d678fac4c0f1f364ac6984bf.1618342050.git.mitaliborkar810@gmail.com>
References: <cover.1618342050.git.mitaliborkar810@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1618342050.git.mitaliborkar810@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Added #include <linux/bitops.h> and replaced bit shifts by BIT() macro.
This BIT() macro from linux/bitops.h is used to define ZR36057_VFESPFR_* bitmasks.
Use of macro is better and neater. It maintains consistency.
Removed comments from the same line and added them to new line above the
blocks, aligned everything properly by using tabs to make code neater
and improve readability.
Reported by checkpatch.

Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
---

Changes from v3:- No changes.
Changes from v2:- Aligned the code using tabs.
Changes from v1:- Aligned the code using tabs and readjusted the
comments line. 

 drivers/staging/media/zoran/zr36057.h | 312 ++++++++++++++------------
 1 file changed, 172 insertions(+), 140 deletions(-)

diff --git a/drivers/staging/media/zoran/zr36057.h b/drivers/staging/media/zoran/zr36057.h
index a2a75fd9f535..f51e9ea2c3d3 100644
--- a/drivers/staging/media/zoran/zr36057.h
+++ b/drivers/staging/media/zoran/zr36057.h
@@ -7,148 +7,180 @@
 
 #ifndef _ZR36057_H_
 #define _ZR36057_H_
+#include <linux/bitops.h>
 
 /* Zoran ZR36057 registers */
 
-#define ZR36057_VFEHCR          0x000	/* Video Front End, Horizontal Configuration Register */
-#define ZR36057_VFEHCR_HS_POL             BIT(30)
-#define ZR36057_VFEHCR_H_START           10
-#define ZR36057_VFEHCR_H_END		0
-#define ZR36057_VFEHCR_HMASK		0x3ff
-
-#define ZR36057_VFEVCR          0x004	/* Video Front End, Vertical Configuration Register */
-#define ZR36057_VFEVCR_VS_POL             BIT(30)
-#define ZR36057_VFEVCR_V_START           10
-#define ZR36057_VFEVCR_V_END		0
-#define ZR36057_VFEVCR_VMASK		0x3ff
-
-#define ZR36057_VFESPFR         0x008	/* Video Front End, Scaler and Pixel Format Register */
-#define ZR36057_VFESPFR_EXT_FL            BIT(26)
-#define ZR36057_VFESPFR_TOP_FIELD         BIT(25)
-#define ZR36057_VFESPFR_VCLK_POL          BIT(24)
-#define ZR36057_VFESPFR_H_FILTER         21
-#define ZR36057_VFESPFR_HOR_DCM          14
-#define ZR36057_VFESPFR_VER_DCM          8
-#define ZR36057_VFESPFR_DISP_MODE        6
-#define ZR36057_VFESPFR_YUV422          (0 << 3)
-#define ZR36057_VFESPFR_RGB888          (1 << 3)
-#define ZR36057_VFESPFR_RGB565          (2 << 3)
-#define ZR36057_VFESPFR_RGB555          (3 << 3)
-#define ZR36057_VFESPFR_ERR_DIF          (1 << 2)
-#define ZR36057_VFESPFR_PACK24          (1 << 1)
-#define ZR36057_VFESPFR_LITTLE_ENDIAN    (1 << 0)
-
-#define ZR36057_VDTR            0x00c	/* Video Display "Top" Register */
-
-#define ZR36057_VDBR            0x010	/* Video Display "Bottom" Register */
-
-#define ZR36057_VSSFGR          0x014	/* Video Stride, Status, and Frame Grab Register */
-#define ZR36057_VSSFGR_DISP_STRIDE       16
-#define ZR36057_VSSFGR_VID_OVF            BIT(8)
-#define ZR36057_VSSFGR_SNAP_SHOT          BIT(1)
-#define ZR36057_VSSFGR_FRAME_GRAB         BIT(0)
-
-#define ZR36057_VDCR            0x018	/* Video Display Configuration Register */
-#define ZR36057_VDCR_VID_EN               BIT(31)
-#define ZR36057_VDCR_MIN_PIX             24
-#define ZR36057_VDCR_TRITON              BIT(24)
-#define ZR36057_VDCR_VID_WIN_HT           12
-#define ZR36057_VDCR_VID_WIN_WID          0
-
-#define ZR36057_MMTR            0x01c	/* Masking Map "Top" Register */
-
-#define ZR36057_MMBR            0x020	/* Masking Map "Bottom" Register */
-
-#define ZR36057_OCR             0x024	/* Overlay Control Register */
-#define ZR36057_OCR_OVL_ENABLE            BIT(15)
-#define ZR36057_OCR_MASK_STRIDE          0
-
-#define ZR36057_SPGPPCR         0x028	/* System, PCI, and General Purpose Pins Control Register */
-#define ZR36057_SPGPPCR_SOFT_RESET	 BIT(24)
-
-#define ZR36057_GPPGCR1         0x02c	/* General Purpose Pins and GuestBus Control Register (1) */
-
-#define ZR36057_MCSAR           0x030	/* MPEG Code Source Address Register */
-
-#define ZR36057_MCTCR           0x034	/* MPEG Code Transfer Control Register */
-#define ZR36057_MCTCR_COD_TIME            BIT(30)
-#define ZR36057_MCTCR_C_EMPTY             BIT(29)
-#define ZR36057_MCTCR_C_FLUSH             BIT(28)
-#define ZR36057_MCTCR_COD_GUEST_ID	20
-#define ZR36057_MCTCR_COD_GUEST_REG	16
-
-#define ZR36057_MCMPR           0x038	/* MPEG Code Memory Pointer Register */
-
-#define ZR36057_ISR             0x03c	/* Interrupt Status Register */
-#define ZR36057_ISR_GIRQ1                BIT(30)
-#define ZR36057_ISR_GIRQ0                BIT(29)
-#define ZR36057_ISR_COD_REP_IRQ            BIT(28)
-#define ZR36057_ISR_JPEG_REP_IRQ           BIT(27)
-
-#define ZR36057_ICR             0x040	/* Interrupt Control Register */
-#define ZR36057_ICR_GIRQ1                BIT(30)
-#define ZR36057_ICR_GIRQ0                BIT(29)
-#define ZR36057_ICR_COD_REP_IRQ            BIT(28)
-#define ZR36057_ICR_JPEG_REP_IRQ           BIT(27)
-#define ZR36057_ICR_INT_PIN_EN             BIT(24)
-
-#define ZR36057_I2CBR           0x044	/* I2C Bus Register */
-#define ZR36057_I2CBR_SDA		 BIT(1)
-#define ZR36057_I2CBR_SCL		 BIT(0)
-
-#define ZR36057_JMC             0x100	/* JPEG Mode and Control */
-#define ZR36057_JMC_JPG                  BIT(31)
-#define ZR36057_JMC_JPG_EXP_MODE          (0 << 29)
-#define ZR36057_JMC_JPG_CMP_MODE           BIT(29)
-#define ZR36057_JMC_MJPG_EXP_MODE         (2 << 29)
-#define ZR36057_JMC_MJPG_CMP_MODE         (3 << 29)
-#define ZR36057_JMC_RTBUSY_FB            BIT(6)
-#define ZR36057_JMC_GO_EN                BIT(5)
-#define ZR36057_JMC_SYNC_MSTR             BIT(4)
-#define ZR36057_JMC_FLD_PER_BUFF         BIT(3)
-#define ZR36057_JMC_VFIFO_FB             BIT(2)
-#define ZR36057_JMC_CFIFO_FB             BIT(1)
-#define ZR36057_JMC_STLL_LIT_ENDIAN       BIT(0)
-
-#define ZR36057_JPC             0x104	/* JPEG Process Control */
-#define ZR36057_JPC_P_RESET              BIT(7)
-#define ZR36057_JPC_COD_TRNS_EN            BIT(5)
-#define ZR36057_JPC_ACTIVE               BIT(0)
-
-#define ZR36057_VSP             0x108	/* Vertical Sync Parameters */
-#define ZR36057_VSP_VSYNC_SIZE           16
-#define ZR36057_VSP_FRM_TOT              0
-
-#define ZR36057_HSP             0x10c	/* Horizontal Sync Parameters */
-#define ZR36057_HSP_HSYNC_START          16
-#define ZR36057_HSP_LINE_TOT             0
-
-#define ZR36057_FHAP            0x110	/* Field Horizontal Active Portion */
-#define ZR36057_FHAP_NAX                16
-#define ZR36057_FHAP_PAX                0
-
-#define ZR36057_FVAP            0x114	/* Field Vertical Active Portion */
-#define ZR36057_FVAP_NAY                16
-#define ZR36057_FVAP_PAY                0
-
-#define ZR36057_FPP             0x118	/* Field Process Parameters */
-#define ZR36057_FPP_ODD_EVEN             BIT(0)
-
-#define ZR36057_JCBA            0x11c	/* JPEG Code Base Address */
-
-#define ZR36057_JCFT            0x120	/* JPEG Code FIFO Threshold */
-
-#define ZR36057_JCGI            0x124	/* JPEG Codec Guest ID */
-#define ZR36057_JCGI_JPE_GUEST_ID         4
-#define ZR36057_JCGI_JPE_GUEST_REG        0
-
-#define ZR36057_GCR2            0x12c	/* GuestBus Control Register (2) */
-
-#define ZR36057_POR             0x200	/* Post Office Register */
-#define ZR36057_POR_PO_PEN                BIT(25)
-#define ZR36057_POR_PO_TIME               BIT(24)
-#define ZR36057_POR_PO_DIR                BIT(23)
-
-#define ZR36057_STR             0x300	/* "Still" Transfer Register */
+/* Video Front End, Horizontal Configuration Register */
+#define ZR36057_VFEHCR				0x000
+#define ZR36057_VFEHCR_HS_POL			BIT(30)
+#define ZR36057_VFEHCR_H_START			10
+#define ZR36057_VFEHCR_H_END			0
+#define ZR36057_VFEHCR_HMASK			0x3ff
+
+/* Video Front End, Vertical Configuration Register */
+#define ZR36057_VFEVCR				0x004
+#define ZR36057_VFEVCR_VS_POL			BIT(30)
+#define ZR36057_VFEVCR_V_START			10
+#define ZR36057_VFEVCR_V_END			0
+#define ZR36057_VFEVCR_VMASK			0x3ff
+
+/* Video Front End, Scaler and Pixel Format Register */
+#define ZR36057_VFESPFR			0x008
+#define ZR36057_VFESPFR_EXT_FL			BIT(26)
+#define ZR36057_VFESPFR_TOP_FIELD		BIT(25)
+#define ZR36057_VFESPFR_VCLK_POL		BIT(24)
+#define ZR36057_VFESPFR_H_FILTER		21
+#define ZR36057_VFESPFR_HOR_DCM		14
+#define ZR36057_VFESPFR_VER_DCM		8
+#define ZR36057_VFESPFR_DISP_MODE		6
+#define ZR36057_VFESPFR_YUV422			(0 << 3)
+#define ZR36057_VFESPFR_RGB888			BIT(3)
+#define ZR36057_VFESPFR_RGB565			(2 << 3)
+#define ZR36057_VFESPFR_RGB555			(3 << 3)
+#define ZR36057_VFESPFR_ERR_DIF		BIT(2)
+#define ZR36057_VFESPFR_PACK24			BIT(1)
+#define ZR36057_VFESPFR_LITTLE_ENDIAN		BIT(0)
+
+/* Video Display "Top" Register */
+#define ZR36057_VDTR				0x00c
+
+/* Video Display "Bottom" Register */
+#define ZR36057_VDBR				0x010
+
+/* Video Stride, Status, and Frame Grab Register */
+#define ZR36057_VSSFGR				0x014
+#define ZR36057_VSSFGR_DISP_STRIDE		16
+#define ZR36057_VSSFGR_VID_OVF			BIT(8)
+#define ZR36057_VSSFGR_SNAP_SHOT		BIT(1)
+#define ZR36057_VSSFGR_FRAME_GRAB		BIT(0)
+
+/* Video Display Configuration Register */
+#define ZR36057_VDCR				0x018
+#define ZR36057_VDCR_VID_EN			BIT(31)
+#define ZR36057_VDCR_MIN_PIX			24
+#define ZR36057_VDCR_TRITON			BIT(24)
+#define ZR36057_VDCR_VID_WIN_HT		12
+#define ZR36057_VDCR_VID_WIN_WID		0
+
+/* Masking Map "Top" Register */
+#define ZR36057_MMTR				0x01c
+
+/* Masking Map "Bottom" Register */
+#define ZR36057_MMBR				0x020
+
+/* Overlay Control Register */
+#define ZR36057_OCR				0x024
+#define ZR36057_OCR_OVL_ENABLE			BIT(15)
+#define ZR36057_OCR_MASK_STRIDE		0
+
+/* System, PCI, and General Purpose Pins Control Register */
+#define ZR36057_SPGPPCR			0x028
+#define ZR36057_SPGPPCR_SOFT_RESET		BIT(24)
+
+/* General Purpose Pins and GuestBus Control Register (1) */
+#define ZR36057_GPPGCR1			0x02c
+
+/* MPEG Code Source Address Register */
+#define ZR36057_MCSAR				0x030
+
+/* MPEG Code Transfer Control Register */
+#define ZR36057_MCTCR				0x034
+#define ZR36057_MCTCR_COD_TIME			BIT(30)
+#define ZR36057_MCTCR_C_EMPTY			BIT(29)
+#define ZR36057_MCTCR_C_FLUSH			BIT(28)
+#define ZR36057_MCTCR_COD_GUEST_ID		20
+#define ZR36057_MCTCR_COD_GUEST_REG		16
+
+/* MPEG Code Memory Pointer Register */
+#define ZR36057_MCMPR				0x038
+
+/* Interrupt Status Register */
+#define ZR36057_ISR				0x03c
+#define ZR36057_ISR_GIRQ1			BIT(30)
+#define ZR36057_ISR_GIRQ0			BIT(29)
+#define ZR36057_ISR_COD_REP_IRQ		BIT(28)
+#define ZR36057_ISR_JPEG_REP_IRQ		BIT(27)
+
+/* Interrupt Control Register */
+#define ZR36057_ICR				0x040
+#define ZR36057_ICR_GIRQ1			BIT(30)
+#define ZR36057_ICR_GIRQ0			BIT(29)
+#define ZR36057_ICR_COD_REP_IRQ		BIT(28)
+#define ZR36057_ICR_JPEG_REP_IRQ		BIT(27)
+#define ZR36057_ICR_INT_PIN_EN			BIT(24)
+
+/* I2C Bus Register */
+#define ZR36057_I2CBR				0x044
+#define ZR36057_I2CBR_SDA			BIT(1)
+#define ZR36057_I2CBR_SCL			BIT(0)
+
+/* JPEG Mode and Control */
+#define ZR36057_JMC				0x100
+#define ZR36057_JMC_JPG			BIT(31)
+#define ZR36057_JMC_JPG_EXP_MODE		(0 << 29)
+#define ZR36057_JMC_JPG_CMP_MODE		BIT(29)
+#define ZR36057_JMC_MJPG_EXP_MODE		(2 << 29)
+#define ZR36057_JMC_MJPG_CMP_MODE		(3 << 29)
+#define ZR36057_JMC_RTBUSY_FB			BIT(6)
+#define ZR36057_JMC_GO_EN			BIT(5)
+#define ZR36057_JMC_SYNC_MSTR			BIT(4)
+#define ZR36057_JMC_FLD_PER_BUFF		BIT(3)
+#define ZR36057_JMC_VFIFO_FB			BIT(2)
+#define ZR36057_JMC_CFIFO_FB			BIT(1)
+#define ZR36057_JMC_STLL_LIT_ENDIAN		BIT(0)
+
+/* JPEG Process Control */
+#define ZR36057_JPC				0x104
+#define ZR36057_JPC_P_RESET			BIT(7)
+#define ZR36057_JPC_COD_TRNS_EN		BIT(5)
+#define ZR36057_JPC_ACTIVE			BIT(0)
+
+/* Vertical Sync Parameters */
+#define ZR36057_VSP				0x108
+#define ZR36057_VSP_VSYNC_SIZE			16
+#define ZR36057_VSP_FRM_TOT			0
+
+/* Horizontal Sync Parameters */
+#define ZR36057_HSP				0x10c
+#define ZR36057_HSP_HSYNC_START		16
+#define ZR36057_HSP_LINE_TOT			0
+
+/* Field Horizontal Active Portion */
+#define ZR36057_FHAP				0x110
+#define ZR36057_FHAP_NAX			16
+#define ZR36057_FHAP_PAX			0
+
+/* Field Vertical Active Portion */
+#define ZR36057_FVAP				0x114
+#define ZR36057_FVAP_NAY			16
+#define ZR36057_FVAP_PAY			0
+
+/* Field Process Parameters */
+#define ZR36057_FPP				0x118
+#define ZR36057_FPP_ODD_EVEN			BIT(0)
+
+/* JPEG Code Base Address */
+#define ZR36057_JCBA				0x11c
+
+/* JPEG Code FIFO Threshold */
+#define ZR36057_JCFT				0x120
+
+/* JPEG Codec Guest ID */
+#define ZR36057_JCGI				0x124
+#define ZR36057_JCGI_JPE_GUEST_ID		4
+#define ZR36057_JCGI_JPE_GUEST_REG		0
+
+/* GuestBus Control Register (2) */
+#define ZR36057_GCR2				0x12c
+
+/* Post Office Register */
+#define ZR36057_POR				0x200
+#define ZR36057_POR_PO_PEN			BIT(25)
+#define ZR36057_POR_PO_TIME			BIT(24)
+#define ZR36057_POR_PO_DIR			BIT(23)
+
+/* "Still" Transfer Register */
+#define ZR36057_STR				0x300
 
 #endif
-- 
2.30.2

