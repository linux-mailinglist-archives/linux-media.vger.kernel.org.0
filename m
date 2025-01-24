Return-Path: <linux-media+bounces-25248-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 807C2A1AF1F
	for <lists+linux-media@lfdr.de>; Fri, 24 Jan 2025 04:46:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 58FE7188E6CF
	for <lists+linux-media@lfdr.de>; Fri, 24 Jan 2025 03:46:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96BE71D63E3;
	Fri, 24 Jan 2025 03:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="oeppm3fN"
X-Original-To: linux-media@vger.kernel.org
Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FDA229A5;
	Fri, 24 Jan 2025 03:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.22.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737690396; cv=none; b=AXHV7JWt6qYNM2+idbM/NDcq+Dz3yBQDmDSJi+yKpD09eL/q0p8x+dciCDRmIsTEGPu+v1ZXGuKh6pjqUw9zYMl29Z5OqvG62uSrec5m9EfagYjXQ6AHBRR/zDuzHc8kQxlvqFBir04jq8KRUxOAPpIMvGb9/ngFCxx0BoDkd9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737690396; c=relaxed/simple;
	bh=x+6krTd7vBQgTVLsNyLFew4GFFTmUkx39Ed9VosOlP8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u+4n24sCAc2otVmp+Mf9fuqMYIuZDxqWjuTEI8d6kNlgwn2Edo98t0cFaJwVCZ8THQZKRgO1J+EQX4qpXfZTkzwojyyj+lJfmpk0feXtmeIvCszjP+aoBNCWFTlObehss+ID+qECoOuvhAUoPR60X6Oqvlx+kPlO6tBP2h/Hoqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=oeppm3fN; arc=none smtp.client-ip=54.207.22.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1737690296;
	bh=rpIPGTJR+6Ypsg/wR4c/Se0s9WYINCWWZBdP/CEKFlM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=oeppm3fNQzalKrEjy7fTB3PQ4nk5Vce7QW78PyvFiieLwnzhWQzf7mmmgEGDSQdQq
	 x/NJspb+2Zfrq8Xwx2WXDYV7WewNKCD1HA8akglGuinnKMh4ILy5I4ERpmfC2vcJfL
	 pPVMBRtdwPoQRLk4K/UUotFotcyWL1fwcL7VMrH4=
X-QQ-mid: bizesmtpip2t1737690255txxspcz
X-QQ-Originating-IP: JZYAShpvOZMGv83Uhd9MjErUtp1TZm1lglHmhdFUi44=
Received: from avenger-OMEN-by-HP-Gaming-Lapto ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 24 Jan 2025 11:44:13 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 394355359938786983
From: WangYuli <wangyuli@uniontech.com>
To: hdegoede@redhat.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	wangyuli@uniontech.com,
	zhanjun@uniontech.com,
	guanwentao@uniontech.com,
	chenlinxuan@uniontech.com
Subject: [PATCH] media: atomisp: i2c: Remove unused macro definitions
Date: Fri, 24 Jan 2025 11:44:01 +0800
Message-ID: <78C4C3F9E650FD04+20250124034402.540943-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: NcJjCMiwxJCEMqFbS6hPlIlTtaLBmhwM1a4fwG8SXQPeqoiX3bBoh1Kq
	poXYGZ9wWa5jGoQNVIWm71ZPcS7duUVlLILasvDWTY2moP18h9polvyGwvUbm83v9A/iRXj
	9mloAkoJePnuR2a2o7NWRyi/FQmxNWxBt81XchomnuYCnJIVbiZikiPl0Ij1/UyVIJslmuT
	Ya+F3Nyu0t4LkXZXTFpFN86HEGUA0NeKxJuBf6c5rnwnN96zXxeQwYxDrAWZ9TbFEL1CbLB
	XVtbSLStOJSNhcYZkG1NVmDCdI3gTrnxXJf2stnVjvSIK8qloDNA5iGQ5bPNF+roOvKVq9I
	CGxHM/erkD2IwR+3c8tDWpBP4Ybu4BuXiAGSQzQSsuV94vEWczlWt63Zu+dTXvqR07rwGVZ
	VOzCxtNynMf5tp43DEpvKx39p9Dpej9M6IbMUaQjIkHZfS8LnYf+Ylc7gTomfvtkta1U4AO
	9IcZVkPQ7nF9yvn/k6XnHU9jDQasTXG0UTa10lXh96K//XUx6IJbA8Qw5vXOCixu740ie40
	DuO70u3yT6q/DWDaWSmU3GsLZNJG/xF461S1yj+cFqBqjZsvr+WiJhdCNUb+j7X73lLWy3l
	WiyWaR9+ccFjTmPWmuBbLzjeQ9t9p3vVPJsz3UZHFU5E+q59aKTV0UQV6fml60j4ULKdMpT
	H+u18/MLGDZ71q9EH46h6UQh407uW5YsF+gdttHL7RHQjMevkSmNnJBgJ4b1QhGX9QP3xWE
	KFDmBpHzHeCQ4JoZIkW1LtGRAz5iWQzLywoMSRrzo+OpbmjzqqRN9Dju+2GnPgHSIhMfmY0
	rKByag2nXOYA+CKLuUtURpYD9n8OLzxV5Acy7j7Qc/tgCxpHuB9Mmhh5MlIATd0qg4Mdu+n
	Emfz7GHldnPsc16CkmJZzmBlYAzI9ulV451GRxd1EA0fDuCXPhPmLTiTLvSxjx8IH+Jo8kw
	FUAfGCi8kKPsVSgvC7f2mczhs+tdFAayEwLfN9dw3xJBasofl6WW0N9bcWbrFbgts/4bVnP
	od8eO2BA==
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
X-QQ-RECHKSPAM: 0

Delete obsolete macro definitions that are no longer in use in
mt9m114.h to improve code readability and maintainability.

Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 drivers/staging/media/atomisp/i2c/mt9m114.h | 105 +-------------------
 1 file changed, 3 insertions(+), 102 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/mt9m114.h b/drivers/staging/media/atomisp/i2c/mt9m114.h
index 97820db90827..9c4b85bea765 100644
--- a/drivers/staging/media/atomisp/i2c/mt9m114.h
+++ b/drivers/staging/media/atomisp/i2c/mt9m114.h
@@ -22,29 +22,15 @@
 #include "../include/linux/atomisp_platform.h"
 #include "../include/linux/atomisp.h"
 
-#define V4L2_IDENT_MT9M114 8245
-
-#define MT9P111_REV3
-#define FULLINISUPPORT
-
 /* #defines for register writes and register array processing */
 #define MISENSOR_8BIT		1
 #define MISENSOR_16BIT		2
 #define MISENSOR_32BIT		4
 
-#define MISENSOR_FWBURST0	0x80
-#define MISENSOR_FWBURST1	0x81
-#define MISENSOR_FWBURST4	0x84
-#define MISENSOR_FWBURST	0x88
-
 #define MISENSOR_TOK_TERM	0xf000	/* terminating token for reg list */
 #define MISENSOR_TOK_DELAY	0xfe00	/* delay token for reg list */
-#define MISENSOR_TOK_FWLOAD	0xfd00	/* token indicating load FW */
-#define MISENSOR_TOK_POLL	0xfc00	/* token indicating poll instruction */
 #define MISENSOR_TOK_RMW	0x0010  /* RMW operation */
 #define MISENSOR_TOK_MASK	0xfff0
-#define MISENSOR_AWB_STEADY	BIT(0)	/* awb steady */
-#define MISENSOR_AE_READY	BIT(3)	/* ae status ready */
 
 /* mask to set sensor read_mode via misensor_rmw_reg */
 #define MISENSOR_R_MODE_MASK	0x0330
@@ -55,99 +41,32 @@
 #define MISENSOR_FLIP_DIS	0
 
 /* bits set to set sensor read_mode via misensor_rmw_reg */
-#define MISENSOR_SKIPPING_SET	0x0011
-#define MISENSOR_SUMMING_SET	0x0033
 #define MISENSOR_NORMAL_SET	0x0000
 
 /* sensor register that control sensor read-mode and mirror */
 #define MISENSOR_READ_MODE	0xC834
-/* sensor ae-track status register */
-#define MISENSOR_AE_TRACK_STATUS	0xA800
-/* sensor awb status register */
-#define MISENSOR_AWB_STATUS	0xAC00
-/* sensor coarse integration time register */
-#define MISENSOR_COARSE_INTEGRATION_TIME 0xC83C
 
 /* registers */
-#define REG_SW_RESET                    0x301A
-#define REG_SW_STREAM                   0xDC00
-#define REG_SCCB_CTRL                   0x3100
-#define REG_SC_CMMN_CHIP_ID             0x0000
-#define REG_V_START                     0xc800 /* 16bits */
-#define REG_H_START                     0xc802 /* 16bits */
-#define REG_V_END                       0xc804 /* 16bits */
-#define REG_H_END                       0xc806 /* 16bits */
-#define REG_PIXEL_CLK                   0xc808 /* 32bits */
-#define REG_TIMING_VTS                  0xc812 /* 16bits */
 #define REG_TIMING_HTS                  0xc814 /* 16bits */
 #define REG_WIDTH                       0xC868 /* 16bits */
-#define REG_HEIGHT                      0xC86A /* 16bits */
 #define REG_EXPO_COARSE                 0x3012 /* 16bits */
-#define REG_EXPO_FINE                   0x3014 /* 16bits */
 #define REG_GAIN                        0x305E
-#define REG_ANALOGGAIN                  0x305F
-#define REG_ADDR_ACESSS                 0x098E /* logical_address_access */
-#define REG_COMM_Register               0x0080 /* command_register */
-
-#define SENSOR_DETECTED		1
-#define SENSOR_NOT_DETECTED	0
 
 #define I2C_RETRY_COUNT		5
 #define MSG_LEN_OFFSET		2
 
-#ifndef MIPI_CONTROL
-#define MIPI_CONTROL		0x3400	/* MIPI_Control */
-#endif
-
-/* GPIO pin on Moorestown */
-#define GPIO_SCLK_25		44
-#define GPIO_STB_PIN		47
-
-#define GPIO_STDBY_PIN		49   /* ab:new */
-#define GPIO_RESET_PIN		50
-
 /* System control register for Aptina A-1040SOC*/
 #define MT9M114_PID		0x0
 
 /* MT9P111_DEVICE_ID */
 #define MT9M114_MOD_ID		0x2481
 
-#define MT9M114_FINE_INTG_TIME_MIN 0
-#define MT9M114_FINE_INTG_TIME_MAX_MARGIN 0
-#define MT9M114_COARSE_INTG_TIME_MIN 1
-#define MT9M114_COARSE_INTG_TIME_MAX_MARGIN 6
-
 /* ulBPat; */
 
-#define MT9M114_BPAT_RGRGGBGB	BIT(0)
-#define MT9M114_BPAT_GRGRBGBG	BIT(1)
-#define MT9M114_BPAT_GBGBRGRG	BIT(2)
-#define MT9M114_BPAT_BGBGGRGR	BIT(3)
+#define MT9M114_BPAT_GRGRBGBG	BIT(0)
+#define MT9M114_BPAT_BGBGGRGR	BIT(1)
 
-#define MT9M114_FOCAL_LENGTH_NUM	208	/*2.08mm*/
 #define MT9M114_WAIT_STAT_TIMEOUT	100
-#define MT9M114_FLICKER_MODE_50HZ	1
-#define MT9M114_FLICKER_MODE_60HZ	2
-/*
- * focal length bits definition:
- * bits 31-16: numerator, bits 15-0: denominator
- */
-#define MT9M114_FOCAL_LENGTH_DEFAULT 0xD00064
-
-/*
- * current f-number bits definition:
- * bits 31-16: numerator, bits 15-0: denominator
- */
-#define MT9M114_F_NUMBER_DEFAULT 0x18000a
-
-/*
- * f-number range bits definition:
- * bits 31-24: max f-number numerator
- * bits 23-16: max f-number denominator
- * bits 15-8: min f-number numerator
- * bits 7-0: min f-number denominator
- */
-#define MT9M114_F_NUMBER_RANGE 0x180a180a
 
 /* Supported resolutions */
 enum {
@@ -158,29 +77,11 @@ enum {
 
 #define MT9M114_RES_960P_SIZE_H		1296
 #define MT9M114_RES_960P_SIZE_V		976
-#define MT9M114_RES_720P_SIZE_H		1280
-#define MT9M114_RES_720P_SIZE_V		720
-#define MT9M114_RES_576P_SIZE_H		1024
-#define MT9M114_RES_576P_SIZE_V		576
-#define MT9M114_RES_480P_SIZE_H		768
-#define MT9M114_RES_480P_SIZE_V		480
-#define MT9M114_RES_VGA_SIZE_H		640
-#define MT9M114_RES_VGA_SIZE_V		480
-#define MT9M114_RES_QVGA_SIZE_H		320
-#define MT9M114_RES_QVGA_SIZE_V		240
-#define MT9M114_RES_QCIF_SIZE_H		176
-#define MT9M114_RES_QCIF_SIZE_V		144
-
-#define MT9M114_RES_720_480p_768_SIZE_H 736
-#define MT9M114_RES_720_480p_768_SIZE_V 496
+
 #define MT9M114_RES_736P_SIZE_H 1296
 #define MT9M114_RES_736P_SIZE_V 736
 #define MT9M114_RES_864P_SIZE_H 1296
 #define MT9M114_RES_864P_SIZE_V 864
-#define MT9M114_RES_976P_SIZE_H 1296
-#define MT9M114_RES_976P_SIZE_V 976
-
-#define MT9M114_BIN_FACTOR_MAX			3
 
 #define MT9M114_DEFAULT_FIRST_EXP 0x10
 #define MT9M114_MAX_FIRST_EXP 0x302
-- 
2.45.2


