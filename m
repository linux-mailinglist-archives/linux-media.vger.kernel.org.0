Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13676398DDB
	for <lists+linux-media@lfdr.de>; Wed,  2 Jun 2021 17:05:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232094AbhFBPHW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Jun 2021 11:07:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:37178 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231562AbhFBPHK (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Jun 2021 11:07:10 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id ECBE3613B1;
        Wed,  2 Jun 2021 15:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622646327;
        bh=+7eD8ire9eZTnXGswm7e8pAOBUmbjkyw9SqBn7O/068=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=LdzLIMEU27CqRpvn8MDydKwQa/VO5odpka7KgPTT+Gxb0EBF4jougb3tLo+lFYYaa
         JAgsM6SuA/sLW1TIclr93tBQbHiZLzsGeEi/6q08DeY4D2H87nUrYWE/A2LF/BhFyP
         28JqxX0spkNcEk0uLIUmfcYg9Qx//7JUugyGlhv2HQfWdRDO4rA3IFv4IEjIzohHvo
         SGJpTyg5F22Koxa+dRI0mtdfaawLuALCRHZXNVvWijUI2aUiWsO74YlRkTlaRTXidW
         TksTQesZQAm5WFqAJjPIFs+liYH2p/EGXpeNoboE8Z/MJq0HqpLX+2AGCJotjSDLwR
         CdtWfb95cnmYA==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1loSQu-006Wav-Vm; Wed, 02 Jun 2021 17:05:24 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Andrey Utkin <andrey.utkin@corp.bluecherry.net>,
        Anton Sviridenko <anton@corp.bluecherry.net>,
        Bluecherry Maintainers <maintainers@bluecherrydvr.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 6/6] media: pci: tw5864: avoid usage of some characters
Date:   Wed,  2 Jun 2021 17:05:23 +0200
Message-Id: <0b6f77961da3bd83c4c024b38fa45bc07b7719c2.1622646256.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1622646256.git.mchehab+huawei@kernel.org>
References: <cover.1622646256.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There are several comments on this driver using those chars:

	- U+2013 ('–'): EN DASH
	- U+2018 ('‘'): LEFT SINGLE QUOTATION MARK
	- U+2019 ('’'): RIGHT SINGLE QUOTATION MARK

They probably came from cut-and-pasting some texts found
elsewhere.

While there's nothing wrong on having those on comments in
C, it is better to use ASCII chars for those specific cases,
as the current variant doesn't really add any value.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/pci/tw5864/tw5864-reg.h | 62 +++++++++++++--------------
 1 file changed, 31 insertions(+), 31 deletions(-)

diff --git a/drivers/media/pci/tw5864/tw5864-reg.h b/drivers/media/pci/tw5864/tw5864-reg.h
index a74f30f2f78e..a26a439c4dc0 100644
--- a/drivers/media/pci/tw5864/tw5864-reg.h
+++ b/drivers/media/pci/tw5864/tw5864-reg.h
@@ -289,13 +289,13 @@
 /* OSD enable bit for each channel */
 #define TW5864_DSP_OSD_ENABLE 0x0228
 
-/* 0x0280 ~ 0x029c – Motion Vector for 1st 4x4 Block, e.g., 80 (X), 84 (Y) */
+/* 0x0280 ~ 0x029c - Motion Vector for 1st 4x4 Block, e.g., 80 (X), 84 (Y) */
 #define TW5864_ME_MV_VEC1 0x0280
-/* 0x02a0 ~ 0x02bc – Motion Vector for 2nd 4x4 Block, e.g., A0 (X), A4 (Y) */
+/* 0x02a0 ~ 0x02bc - Motion Vector for 2nd 4x4 Block, e.g., A0 (X), A4 (Y) */
 #define TW5864_ME_MV_VEC2 0x02a0
-/* 0x02c0 ~ 0x02dc – Motion Vector for 3rd 4x4 Block, e.g., C0 (X), C4 (Y) */
+/* 0x02c0 ~ 0x02dc - Motion Vector for 3rd 4x4 Block, e.g., C0 (X), C4 (Y) */
 #define TW5864_ME_MV_VEC3 0x02c0
-/* 0x02e0 ~ 0x02fc – Motion Vector for 4th 4x4 Block, e.g., E0 (X), E4 (Y) */
+/* 0x02e0 ~ 0x02fc - Motion Vector for 4th 4x4 Block, e.g., E0 (X), E4 (Y) */
 #define TW5864_ME_MV_VEC4 0x02e0
 
 /*
@@ -462,13 +462,13 @@
 
 #define TW5864_VLC_BUF 0x100c
 /* Define controls in register TW5864_VLC_BUF */
-/* VLC BK0 full status, write ‘1’ to clear */
+/* VLC BK0 full status, write '1' to clear */
 #define TW5864_VLC_BK0_FULL BIT(0)
-/* VLC BK1 full status, write ‘1’ to clear */
+/* VLC BK1 full status, write '1' to clear */
 #define TW5864_VLC_BK1_FULL BIT(1)
-/* VLC end slice status, write ‘1’ to clear */
+/* VLC end slice status, write '1' to clear */
 #define TW5864_VLC_END_SLICE BIT(2)
-/* VLC Buffer overflow status, write ‘1’ to clear */
+/* VLC Buffer overflow status, write '1' to clear */
 #define TW5864_DSP_RD_OF BIT(3)
 /* VLC string length in either buffer 0 or 1 at end of frame */
 #define TW5864_VLC_STREAM_LEN_SHIFT 4
@@ -476,7 +476,7 @@
 
 /* [15:0] Total coefficient number in a frame */
 #define TW5864_TOTAL_COEF_NO 0x1010
-/* [0] VLC Encoder Interrupt. Write ‘1’ to clear */
+/* [0] VLC Encoder Interrupt. Write '1' to clear */
 #define TW5864_VLC_DSP_INTR 0x1014
 /* [31:0] VLC stream CRC checksum */
 #define TW5864_VLC_STREAM_CRC 0x1018
@@ -494,7 +494,7 @@
  */
 #define TW5864_VLC_RD_BRST BIT(1)
 
-/* 0x2000 ~ 0x2ffc -- H264 Stream Memory Map */
+/* 0x2000 ~ 0x2ffc - H264 Stream Memory Map */
 /*
  * A word is 4 bytes. I.e.,
  * VLC_STREAM_MEM[0] address: 0x2000
@@ -506,7 +506,7 @@
 #define TW5864_VLC_STREAM_MEM_MAX_OFFSET 0x3ff
 #define TW5864_VLC_STREAM_MEM(offset) (TW5864_VLC_STREAM_MEM_START + 4 * offset)
 
-/* 0x4000 ~ 0x4ffc -- Audio Register Map */
+/* 0x4000 ~ 0x4ffc - Audio Register Map */
 /* [31:0] config 1ms cnt = Realtime clk/1000 */
 #define TW5864_CFG_1MS_CNT 0x4000
 
@@ -688,10 +688,10 @@
 
 /*
  * [1:0]
- * 2’b00 phase set to 180 degree
- * 2’b01 phase set to 270 degree
- * 2’b10 phase set to 0 degree
- * 2’b11 phase set to 90 degree
+ * 2'b00 phase set to 180 degree
+ * 2'b01 phase set to 270 degree
+ * 2'b10 phase set to 0 degree
+ * 2'b11 phase set to 90 degree
  */
 #define TW5864_I2C_PHASE_CFG 0x800c
 
@@ -826,7 +826,7 @@
 /* SPLL_IREF, SPLL_LPX4, SPLL_CPX4, SPLL_PD, SPLL_DBG */
 #define TW5864_SPLL 0x8028
 
-/* 0x8800 ~ 0x88fc -- Interrupt Register Map */
+/* 0x8800 ~ 0x88fc - Interrupt Register Map */
 /*
  * Trigger mode of interrupt source 0 ~ 15
  * 1 Edge trigger mode
@@ -909,7 +909,7 @@
 #define TW5864_INTR_I2C_DONE BIT(25)
 #define TW5864_INTR_AD BIT(26)
 
-/* 0x9000 ~ 0x920c -- Video Capture (VIF) Register Map */
+/* 0x9000 ~ 0x920c - Video Capture (VIF) Register Map */
 /*
  * H264EN_CH_STATUS[n] Status of Vsync synchronized H264EN_CH_EN (Read Only)
  * 1 Channel Enabled
@@ -1009,7 +1009,7 @@
 /* GPIO Output Enable of Group n */
 #define TW5864_GPIO_OEN (0xff << 8)
 
-/* 0xa000 ~ 0xa8ff – DDR Controller Register Map */
+/* 0xa000 ~ 0xa8ff - DDR Controller Register Map */
 /* DDR Controller A */
 /*
  * [2:0] Data valid counter after read command to DDR. This is the delay value
@@ -1111,7 +1111,7 @@
  */
 #define TW5864_DDR_B_OFFSET 0x0800
 
-/* 0xb004 ~ 0xb018 – HW version/ARB12 Register Map */
+/* 0xb004 ~ 0xb018 - HW version/ARB12 Register Map */
 /* [15:0] Default is C013 */
 #define TW5864_HW_VERSION 0xb004
 
@@ -1145,7 +1145,7 @@
 /* ARB12 maximum value of time out counter (default 15"h1FF) */
 #define TW5864_ARB12_TIME_OUT_CNT 0x7fff
 
-/* 0xb800 ~ 0xb80c -- Indirect Access Register Map */
+/* 0xb800 ~ 0xb80c - Indirect Access Register Map */
 /*
  * Spec says:
  * In order to access the indirect register space, the following procedure is
@@ -1177,7 +1177,7 @@
 /* [31:0] Data used to read/write indirect register space */
 #define TW5864_IND_DATA 0xb804
 
-/* 0xc000 ~ 0xc7fc -- Preview Register Map */
+/* 0xc000 ~ 0xc7fc - Preview Register Map */
 /* Mostly skipped this section. */
 /*
  * [15:0] Status of Vsync Synchronized PCI_PV_CH_EN (Read Only)
@@ -1192,12 +1192,12 @@
  */
 #define TW5864_PCI_PV_CH_EN 0xc004
 
-/* 0xc800 ~ 0xc804 -- JPEG Capture Register Map */
+/* 0xc800 ~ 0xc804 - JPEG Capture Register Map */
 /* Skipped. */
-/* 0xd000 ~ 0xd0fc -- JPEG Control Register Map */
+/* 0xd000 ~ 0xd0fc - JPEG Control Register Map */
 /* Skipped. */
 
-/* 0xe000 ~ 0xfc04 – Motion Vector Register Map */
+/* 0xe000 ~ 0xfc04 - Motion Vector Register Map */
 
 /* ME Motion Vector data (Four Byte Each) 0xe000 ~ 0xe7fc */
 #define TW5864_ME_MV_VEC_START 0xe000
@@ -1231,7 +1231,7 @@
  */
 #define TW5864_MPI_DDR_SEL2 BIT(15)
 
-/* 0x18000 ~ 0x181fc – PCI Master/Slave Control Map */
+/* 0x18000 ~ 0x181fc - PCI Master/Slave Control Map */
 #define TW5864_PCI_INTR_STATUS 0x18000
 /* Define controls in register TW5864_PCI_INTR_STATUS */
 /* vlc done */
@@ -1400,11 +1400,11 @@
 #define TW5864_VLC_STREAM_BASE_ADDR 0x18080
 /* MV stream base address */
 #define TW5864_MV_STREAM_BASE_ADDR 0x18084
-/* 0x180a0 – 0x180bc: audio burst base address. Skipped. */
-/* 0x180c0 ~ 0x180dc – JPEG Push Mode Buffer Base Address. Skipped. */
-/* 0x18100 – 0x1817c: preview burst base address. Skipped. */
+/* 0x180a0 ~ 0x180bc: audio burst base address. Skipped. */
+/* 0x180c0 ~ 0x180dc: JPEG Push Mode Buffer Base Address. Skipped. */
+/* 0x18100 ~ 0x1817c: preview burst base address. Skipped. */
 
-/* 0x80000 ~ 0x87fff -- DDR Burst RW Register Map */
+/* 0x80000 ~ 0x87fff - DDR Burst RW Register Map */
 #define TW5864_DDR_CTL 0x80000
 /* Define controls in register TW5864_DDR_CTL */
 #define TW5864_BRST_LENGTH_SHIFT 2
@@ -1516,7 +1516,7 @@
  * Vertical Sharpness Control. Writable.
  * 0 = None (default)
  * 7 = Highest
- * **Note: VSHP must be set to ‘0’ if COMB = 0
+ * **Note: VSHP must be set to '0' if COMB = 0
  */
 #define TW5864_INDIR_VIN_1_VSHP 0x07
 
@@ -1595,7 +1595,7 @@
 #define TW5864_INDIR_VIN_9_CNTRST(channel) (0x009 + channel * 0x010)
 
 /*
- * These bits control the brightness. They have value of –128 to 127 in 2's
+ * These bits control the brightness. They have value of -128 to 127 in 2's
  * complement form. Positive value increases brightness. A value 0 has no
  * effect on the data. The default is 00h.
  */
-- 
2.31.1

