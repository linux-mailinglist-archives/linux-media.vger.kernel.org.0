Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAB6735AEDF
	for <lists+linux-media@lfdr.de>; Sat, 10 Apr 2021 17:34:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234894AbhDJPec (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 10 Apr 2021 11:34:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234668AbhDJPe2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 10 Apr 2021 11:34:28 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6148DC06138A;
        Sat, 10 Apr 2021 08:34:14 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id y32so6023180pga.11;
        Sat, 10 Apr 2021 08:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=qX4w3/R5gyu1nyOBr6nqY6Pq1lONbt6TtVpQMcxrxzo=;
        b=CvBg96zzi7GeQh3a69+cPHyvHKKYjIwQi4fnjtfIXQGkFVlbFhzYIiNN/1TM3LWvwm
         MNgZOFyPkI08zGBNtDk9ka1l46lVc5rdt0AlqvDe6jKL2L9EtuKalGqXUvgmRflWzMuK
         wXOawuftgeW5k7cgAyaJsbwvziviPucD+aQX+St4oNFjHzpdCfn6jOGS2UOKqy3bNt9a
         2wrsPKIKy6qU8KEKNZksR3rdBbU42wh/yXnvPFCq9d+UQkuv7JtCXsICAIXfANVl5dY6
         ZwnsA6Y3ZGQPp25CdkTwKmW+9HdSaSLERK1zZVLmSgBn5XBvPQ8G7iI6XkXlIfEKefQf
         N9kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qX4w3/R5gyu1nyOBr6nqY6Pq1lONbt6TtVpQMcxrxzo=;
        b=pmpkIuOSH1jLsd392CAKKTzKfVEuk7bTSVqdy1UkLHQl0cDN0HN5StxKhUxleoGYYX
         +Ky5807PqFdk5169XjE6RrOtc1blN1EXizKGgg8Xx1Xwg2hEBYrw6hRes+nUqEuAZbKK
         Of0YRxfHtFIzoe8C78kSuBj+fRF12+EXklqPdSAG4CF4FefNsyhx4DZmFpTwE4e+7JRx
         zv4wQSF0OHaUW6pTH93jlxlFCg41juZ8vUDOku6B5d1lPnarc+PTYR9REc4JKWIwGssq
         2md9iBmyUcD7GFCm6H9N2TAxLqxKpl3QWCoBcQrvxYcJ3eiA1+CZ3IVlrzao5boOeEtf
         w+Zg==
X-Gm-Message-State: AOAM531B+KoUOby8/yxeXQtAita5PEFGTXhibABQcOeITx0QiPgg9OBv
        1LSlQhnp8jjQasfEKyUpuqA=
X-Google-Smtp-Source: ABdhPJwBRhcQuHiS0q+KiWQdp1BN2aQekg4Gv30go+bEOQiLRiJ1WRYFlxJ6u0c9fi/0VPOoJtPO4w==
X-Received: by 2002:a63:d309:: with SMTP id b9mr17755939pgg.96.1618068853892;
        Sat, 10 Apr 2021 08:34:13 -0700 (PDT)
Received: from kali ([103.141.87.254])
        by smtp.gmail.com with ESMTPSA id gm10sm5353205pjb.4.2021.04.10.08.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Apr 2021 08:34:13 -0700 (PDT)
Date:   Sat, 10 Apr 2021 21:04:05 +0530
From:   Mitali Borkar <mitaliborkar810@gmail.com>
To:     clabbe@baylibre.com, mchehab@kernel.org, gregkh@linuxfoundation.org
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
        mitali_s@me.iitr.ac.in
Subject: [PATCH v3 2/2] staging: media: zoran: align code appropriately
Message-ID: <bf18b0301f10dae2d2151839b02c3202093940b3.1618066787.git.mitaliborkar810@gmail.com>
References: <cover.1618066787.git.mitaliborkar810@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1618066787.git.mitaliborkar810@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Aligned the code properly by using tabs to make code neater and improve
readability.

Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
---
 drivers/staging/media/zoran/zr36057.h | 108 +++++++++++++-------------
 1 file changed, 54 insertions(+), 54 deletions(-)

diff --git a/drivers/staging/media/zoran/zr36057.h b/drivers/staging/media/zoran/zr36057.h
index 198d344a8879..db42f445248f 100644
--- a/drivers/staging/media/zoran/zr36057.h
+++ b/drivers/staging/media/zoran/zr36057.h
@@ -13,28 +13,28 @@
 /* Zoran ZR36057 registers */
 
 /* Video Front End, Horizontal Configuration Register */
-#define ZR36057_VFEHCR			0x000
+#define ZR36057_VFEHCR				0x000
 #define ZR36057_VFEHCR_HS_POL			BIT(30)
-#define ZR36057_VFEHCR_H_START		10
-#define ZR36057_VFEHCR_H_END		0
-#define ZR36057_VFEHCR_HMASK		0x3ff
+#define ZR36057_VFEHCR_H_START			10
+#define ZR36057_VFEHCR_H_END			0
+#define ZR36057_VFEHCR_HMASK			0x3ff
 
 /* Video Front End, Vertical Configuration Register */
-#define ZR36057_VFEVCR			0x004
+#define ZR36057_VFEVCR				0x004
 #define ZR36057_VFEVCR_VS_POL			BIT(30)
-#define ZR36057_VFEVCR_V_START		10
-#define ZR36057_VFEVCR_V_END		0
-#define ZR36057_VFEVCR_VMASK		0x3ff
+#define ZR36057_VFEVCR_V_START			10
+#define ZR36057_VFEVCR_V_END			0
+#define ZR36057_VFEVCR_VMASK			0x3ff
 
 /* Video Front End, Scaler and Pixel Format Register */
 #define ZR36057_VFESPFR			0x008
 #define ZR36057_VFESPFR_EXT_FL			BIT(26)
 #define ZR36057_VFESPFR_TOP_FIELD		BIT(25)
 #define ZR36057_VFESPFR_VCLK_POL		BIT(24)
-#define ZR36057_VFESPFR_H_FILTER	21
+#define ZR36057_VFESPFR_H_FILTER		21
 #define ZR36057_VFESPFR_HOR_DCM		14
 #define ZR36057_VFESPFR_VER_DCM		8
-#define ZR36057_VFESPFR_DISP_MODE	6
+#define ZR36057_VFESPFR_DISP_MODE		6
 #define ZR36057_VFESPFR_YUV422			(0 << 3)
 #define ZR36057_VFESPFR_RGB888			BIT(3)
 #define ZR36057_VFESPFR_RGB565			(2 << 3)
@@ -44,34 +44,34 @@
 #define ZR36057_VFESPFR_LITTLE_ENDIAN		BIT(0)
 
 /* Video Display "Top" Register */
-#define ZR36057_VDTR			0x00c
+#define ZR36057_VDTR				0x00c
 
 /* Video Display "Bottom" Register */
-#define ZR36057_VDBR			0x010
+#define ZR36057_VDBR				0x010
 
 /* Video Stride, Status, and Frame Grab Register */
-#define ZR36057_VSSFGR			0x014
-#define ZR36057_VSSFGR_DISP_STRIDE	16
+#define ZR36057_VSSFGR				0x014
+#define ZR36057_VSSFGR_DISP_STRIDE		16
 #define ZR36057_VSSFGR_VID_OVF			BIT(8)
 #define ZR36057_VSSFGR_SNAP_SHOT		BIT(1)
 #define ZR36057_VSSFGR_FRAME_GRAB		BIT(0)
 
 /* Video Display Configuration Register */
-#define ZR36057_VDCR			0x018
+#define ZR36057_VDCR				0x018
 #define ZR36057_VDCR_VID_EN			BIT(31)
-#define ZR36057_VDCR_MIN_PIX		24
+#define ZR36057_VDCR_MIN_PIX			24
 #define ZR36057_VDCR_TRITON			BIT(24)
 #define ZR36057_VDCR_VID_WIN_HT		12
-#define ZR36057_VDCR_VID_WIN_WID	0
+#define ZR36057_VDCR_VID_WIN_WID		0
 
 /* Masking Map "Top" Register */
-#define ZR36057_MMTR			0x01c
+#define ZR36057_MMTR				0x01c
 
 /* Masking Map "Bottom" Register */
-#define ZR36057_MMBR			0x020
+#define ZR36057_MMBR				0x020
 
 /* Overlay Control Register */
-#define ZR36057_OCR			0x024
+#define ZR36057_OCR				0x024
 #define ZR36057_OCR_OVL_ENABLE			BIT(15)
 #define ZR36057_OCR_MASK_STRIDE		0
 
@@ -83,42 +83,42 @@
 #define ZR36057_GPPGCR1			0x02c
 
 /* MPEG Code Source Address Register */
-#define ZR36057_MCSAR			0x030
+#define ZR36057_MCSAR				0x030
 
 /* MPEG Code Transfer Control Register */
-#define ZR36057_MCTCR			0x034
+#define ZR36057_MCTCR				0x034
 #define ZR36057_MCTCR_COD_TIME			BIT(30)
 #define ZR36057_MCTCR_C_EMPTY			BIT(29)
 #define ZR36057_MCTCR_C_FLUSH			BIT(28)
-#define ZR36057_MCTCR_COD_GUEST_ID	20
-#define ZR36057_MCTCR_COD_GUEST_REG	16
+#define ZR36057_MCTCR_COD_GUEST_ID		20
+#define ZR36057_MCTCR_COD_GUEST_REG		16
 
 /* MPEG Code Memory Pointer Register */
-#define ZR36057_MCMPR			0x038
+#define ZR36057_MCMPR				0x038
 
 /* Interrupt Status Register */
-#define ZR36057_ISR			0x03c
+#define ZR36057_ISR				0x03c
 #define ZR36057_ISR_GIRQ1			BIT(30)
 #define ZR36057_ISR_GIRQ0			BIT(29)
-#define ZR36057_ISR_COD_REP_IRQ			BIT(28)
+#define ZR36057_ISR_COD_REP_IRQ		BIT(28)
 #define ZR36057_ISR_JPEG_REP_IRQ		BIT(27)
 
 /* Interrupt Control Register */
-#define ZR36057_ICR			0x040
+#define ZR36057_ICR				0x040
 #define ZR36057_ICR_GIRQ1			BIT(30)
 #define ZR36057_ICR_GIRQ0			BIT(29)
-#define ZR36057_ICR_COD_REP_IRQ			BIT(28)
+#define ZR36057_ICR_COD_REP_IRQ		BIT(28)
 #define ZR36057_ICR_JPEG_REP_IRQ		BIT(27)
 #define ZR36057_ICR_INT_PIN_EN			BIT(24)
 
 /* I2C Bus Register */
-#define ZR36057_I2CBR			0x044
+#define ZR36057_I2CBR				0x044
 #define ZR36057_I2CBR_SDA			BIT(1)
 #define ZR36057_I2CBR_SCL			BIT(0)
 
 /* JPEG Mode and Control */
-#define ZR36057_JMC			0x100
-#define ZR36057_JMC_JPG				BIT(31)
+#define ZR36057_JMC				0x100
+#define ZR36057_JMC_JPG			BIT(31)
 #define ZR36057_JMC_JPG_EXP_MODE		(0 << 29)
 #define ZR36057_JMC_JPG_CMP_MODE		BIT(29)
 #define ZR36057_JMC_MJPG_EXP_MODE		(2 << 29)
@@ -132,56 +132,56 @@
 #define ZR36057_JMC_STLL_LIT_ENDIAN		BIT(0)
 
 /* JPEG Process Control */
-#define ZR36057_JPC			0x104
+#define ZR36057_JPC				0x104
 #define ZR36057_JPC_P_RESET			BIT(7)
-#define ZR36057_JPC_COD_TRNS_EN			BIT(5)
+#define ZR36057_JPC_COD_TRNS_EN		BIT(5)
 #define ZR36057_JPC_ACTIVE			BIT(0)
 
 /* Vertical Sync Parameters */
-#define ZR36057_VSP			0x108
-#define ZR36057_VSP_VSYNC_SIZE		16
-#define ZR36057_VSP_FRM_TOT		0
+#define ZR36057_VSP				0x108
+#define ZR36057_VSP_VSYNC_SIZE			16
+#define ZR36057_VSP_FRM_TOT			0
 
 /* Horizontal Sync Parameters */
-#define ZR36057_HSP			0x10c
+#define ZR36057_HSP				0x10c
 #define ZR36057_HSP_HSYNC_START		16
-#define ZR36057_HSP_LINE_TOT		0
+#define ZR36057_HSP_LINE_TOT			0
 
 /* Field Horizontal Active Portion */
-#define ZR36057_FHAP			0x110
-#define ZR36057_FHAP_NAX		16
-#define ZR36057_FHAP_PAX		0
+#define ZR36057_FHAP				0x110
+#define ZR36057_FHAP_NAX			16
+#define ZR36057_FHAP_PAX			0
 
 /* Field Vertical Active Portion */
-#define ZR36057_FVAP			0x114
-#define ZR36057_FVAP_NAY		16
-#define ZR36057_FVAP_PAY		0
+#define ZR36057_FVAP				0x114
+#define ZR36057_FVAP_NAY			16
+#define ZR36057_FVAP_PAY			0
 
 /* Field Process Parameters */
-#define ZR36057_FPP			0x118
+#define ZR36057_FPP				0x118
 #define ZR36057_FPP_ODD_EVEN			BIT(0)
 
 /* JPEG Code Base Address */
-#define ZR36057_JCBA			0x11c
+#define ZR36057_JCBA				0x11c
 
 /* JPEG Code FIFO Threshold */
-#define ZR36057_JCFT			0x120
+#define ZR36057_JCFT				0x120
 
 /* JPEG Codec Guest ID */
-#define ZR36057_JCGI			0x124
-#define ZR36057_JCGI_JPE_GUEST_ID	4
-#define ZR36057_JCGI_JPE_GUEST_REG	0
+#define ZR36057_JCGI				0x124
+#define ZR36057_JCGI_JPE_GUEST_ID		4
+#define ZR36057_JCGI_JPE_GUEST_REG		0
 
 /* GuestBus Control Register (2) */
-#define ZR36057_GCR2			0x12c
+#define ZR36057_GCR2				0x12c
 
 /* Post Office Register */
-#define ZR36057_POR			0x200
+#define ZR36057_POR				0x200
 #define ZR36057_POR_PO_PEN			BIT(25)
 #define ZR36057_POR_PO_TIME			BIT(24)
 #define ZR36057_POR_PO_DIR			BIT(23)
 
 /* "Still" Transfer Register */
-#define ZR36057_STR			0x300
+#define ZR36057_STR				0x300
 
 #endif
-- 
2.30.2

