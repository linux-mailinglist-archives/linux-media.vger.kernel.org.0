Return-Path: <linux-media+bounces-21466-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23AAB9CFBFC
	for <lists+linux-media@lfdr.de>; Sat, 16 Nov 2024 02:28:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D660228782B
	for <lists+linux-media@lfdr.de>; Sat, 16 Nov 2024 01:28:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 753F118FDDC;
	Sat, 16 Nov 2024 01:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="TpdXh1eE"
X-Original-To: linux-media@vger.kernel.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2D6802;
	Sat, 16 Nov 2024 01:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731720521; cv=none; b=NaTVNDzsjFW2tgrAVaC9xt74nITtJNaH9sR4tszq1LjfWLKZAkInRX8a14ClJYAMzEJ0jLXmEgozEyNRe/KvNCgzyN45UXsVlFJimXq2oSbSB8MYnkFZGTmkAmvYD8ZyDCYCzr8dgPjfVJMZ3Gbx8lSONg3FdWRLdVWcI7aNEkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731720521; c=relaxed/simple;
	bh=dV3gE/Fce2fEyDTyKSUD8M4cTij8y1YTIeT44VzlWn4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Rk+ijHWCHcOBHZjQUCP6qq7V2bOn5DoD1H+MQnUqeAELp/i8ZgJT2VEgPvlVuHE+5zuxg1gT1jZPkFDyoWilvyHq9BLzMotN51MBh3TSilzBxSNREp0KMybXx2J+AqjpplHQJRcPpMqfzKJeOxq24cu/AEKwFGJFFUn19ROVoMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=TpdXh1eE; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=0P3tBtXNpyEwEzMGSGyCB4PLtgx+5VH11spzu16y6tU=; b=TpdXh1eEobegRTQr
	QYeBT//gbrcjPUmBZWLhhB+pS2AYN52qclAj3XdzNuUa0oY51pSSvsh0l1Z6JqyIGadOwYXuGwzpx
	vcN2x61NBkBmRCyeQwrqvg6l2FnRED7cgtBWBhbpsNt+xeNqI8XBAbcpPgW238uqQZEpd4u6hj69R
	qHA1efOYKyCEb1gdrBfY3nGs0yWqP6oFyu+GmjxKaip48eUxwDBGRC8P8zObxIbvM3nuUAQmaQXlF
	VRMc2TLqnHS12simcTtrLsNjkhMFWbyF1HCu0yuI8p9gYZ8BnRt/HhkkQouYPMxHuMzs38crk734j
	wvYVlpiMaUJ3zUgwFg==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1tC7bx-000Fd6-2k;
	Sat, 16 Nov 2024 01:28:29 +0000
From: linux@treblig.org
To: s.nawrocki@samsung.com,
	mchehab@kernel.org,
	krzk@kernel.org,
	alim.akhtar@samsung.com
Cc: linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] media: platform: exynos4-is: Remove unused fimc_is_param_strerr
Date: Sat, 16 Nov 2024 01:28:28 +0000
Message-ID: <20241116012828.359002-1-linux@treblig.org>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

fimc_is_param_strerr() was added in 2013 by
commit 9a761e436843 ("[media] exynos4-is: Add Exynos4x12 FIMC-IS driver")
but has never been called.

Remove it.

(The other possibility might be to add a call maybe in fimc-is-param ?)

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 .../samsung/exynos4-is/fimc-is-errno.c        | 131 ------------------
 .../samsung/exynos4-is/fimc-is-errno.h        |   1 -
 2 files changed, 132 deletions(-)

diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-is-errno.c b/drivers/media/platform/samsung/exynos4-is/fimc-is-errno.c
index 7a48fad1df16..ac67a04e5eeb 100644
--- a/drivers/media/platform/samsung/exynos4-is/fimc-is-errno.c
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-is-errno.c
@@ -12,137 +12,6 @@
 
 #include "fimc-is-errno.h"
 
-const char *fimc_is_param_strerr(unsigned int error)
-{
-	switch (error) {
-	case ERROR_COMMON_CMD:
-		return "ERROR_COMMON_CMD: Invalid Command";
-	case ERROR_COMMON_PARAMETER:
-		return "ERROR_COMMON_PARAMETER: Invalid Parameter";
-	case ERROR_COMMON_SETFILE_LOAD:
-		return "ERROR_COMMON_SETFILE_LOAD: Illegal Setfile Loading";
-	case ERROR_COMMON_SETFILE_ADJUST:
-		return "ERROR_COMMON_SETFILE_ADJUST: Setfile isn't adjusted";
-	case ERROR_COMMON_SETFILE_INDEX:
-		return "ERROR_COMMON_SETFILE_INDEX: Invalid setfile index";
-	case ERROR_COMMON_INPUT_PATH:
-		return "ERROR_COMMON_INPUT_PATH: Input path can be changed in ready state";
-	case ERROR_COMMON_INPUT_INIT:
-		return "ERROR_COMMON_INPUT_INIT: IP can not start if input path is not set";
-	case ERROR_COMMON_OUTPUT_PATH:
-		return "ERROR_COMMON_OUTPUT_PATH: Output path can be changed in ready state (stop)";
-	case ERROR_COMMON_OUTPUT_INIT:
-		return "ERROR_COMMON_OUTPUT_INIT: IP can not start if output path is not set";
-	case ERROR_CONTROL_BYPASS:
-		return "ERROR_CONTROL_BYPASS";
-	case ERROR_OTF_INPUT_FORMAT:
-		return "ERROR_OTF_INPUT_FORMAT: Invalid format  (DRC: YUV444, FD: YUV444, 422, 420)";
-	case ERROR_OTF_INPUT_WIDTH:
-		return "ERROR_OTF_INPUT_WIDTH: Invalid width (DRC: 128~8192, FD: 32~8190)";
-	case ERROR_OTF_INPUT_HEIGHT:
-		return "ERROR_OTF_INPUT_HEIGHT: Invalid bit-width (DRC: 8~12bits, FD: 8bit)";
-	case ERROR_OTF_INPUT_BIT_WIDTH:
-		return "ERROR_OTF_INPUT_BIT_WIDTH: Invalid bit-width (DRC: 8~12bits, FD: 8bit)";
-	case ERROR_DMA_INPUT_WIDTH:
-		return "ERROR_DMA_INPUT_WIDTH: Invalid width (DRC: 128~8192, FD: 32~8190)";
-	case ERROR_DMA_INPUT_HEIGHT:
-		return "ERROR_DMA_INPUT_HEIGHT: Invalid height (DRC: 64~8192, FD: 16~8190)";
-	case ERROR_DMA_INPUT_FORMAT:
-		return "ERROR_DMA_INPUT_FORMAT: Invalid format (DRC: YUV444 or YUV422, FD: YUV444,422,420)";
-	case ERROR_DMA_INPUT_BIT_WIDTH:
-		return "ERROR_DMA_INPUT_BIT_WIDTH: Invalid bit-width (DRC: 8~12bits, FD: 8bit)";
-	case ERROR_DMA_INPUT_ORDER:
-		return "ERROR_DMA_INPUT_ORDER: Invalid order(DRC: YYCbCr,YCbYCr,FD:NO,YYCbCr,YCbYCr,CbCr,CrCb)";
-	case ERROR_DMA_INPUT_PLANE:
-		return "ERROR_DMA_INPUT_PLANE: Invalid plane (DRC: 3, FD: 1, 2, 3)";
-	case ERROR_OTF_OUTPUT_WIDTH:
-		return "ERROR_OTF_OUTPUT_WIDTH: Invalid width (DRC: 128~8192)";
-	case ERROR_OTF_OUTPUT_HEIGHT:
-		return "ERROR_OTF_OUTPUT_HEIGHT: Invalid height (DRC: 64~8192)";
-	case ERROR_OTF_OUTPUT_FORMAT:
-		return "ERROR_OTF_OUTPUT_FORMAT: Invalid format (DRC: YUV444)";
-	case ERROR_OTF_OUTPUT_BIT_WIDTH:
-		return "ERROR_OTF_OUTPUT_BIT_WIDTH: Invalid bit-width (DRC: 8~12bits, FD: 8bit)";
-	case ERROR_DMA_OUTPUT_WIDTH:
-		return "ERROR_DMA_OUTPUT_WIDTH";
-	case ERROR_DMA_OUTPUT_HEIGHT:
-		return "ERROR_DMA_OUTPUT_HEIGHT";
-	case ERROR_DMA_OUTPUT_FORMAT:
-		return "ERROR_DMA_OUTPUT_FORMAT";
-	case ERROR_DMA_OUTPUT_BIT_WIDTH:
-		return "ERROR_DMA_OUTPUT_BIT_WIDTH";
-	case ERROR_DMA_OUTPUT_PLANE:
-		return "ERROR_DMA_OUTPUT_PLANE";
-	case ERROR_DMA_OUTPUT_ORDER:
-		return "ERROR_DMA_OUTPUT_ORDER";
-
-	/* Sensor Error(100~199) */
-	case ERROR_SENSOR_I2C_FAIL:
-		return "ERROR_SENSOR_I2C_FAIL";
-	case ERROR_SENSOR_INVALID_FRAMERATE:
-		return "ERROR_SENSOR_INVALID_FRAMERATE";
-	case ERROR_SENSOR_INVALID_EXPOSURETIME:
-		return "ERROR_SENSOR_INVALID_EXPOSURETIME";
-	case ERROR_SENSOR_INVALID_SIZE:
-		return "ERROR_SENSOR_INVALID_SIZE";
-	case ERROR_SENSOR_INVALID_SETTING:
-		return "ERROR_SENSOR_INVALID_SETTING";
-	case ERROR_SENSOR_ACTUATOR_INIT_FAIL:
-		return "ERROR_SENSOR_ACTUATOR_INIT_FAIL";
-	case ERROR_SENSOR_INVALID_AF_POS:
-		return "ERROR_SENSOR_INVALID_AF_POS";
-	case ERROR_SENSOR_UNSUPPORT_FUNC:
-		return "ERROR_SENSOR_UNSUPPORT_FUNC";
-	case ERROR_SENSOR_UNSUPPORT_PERI:
-		return "ERROR_SENSOR_UNSUPPORT_PERI";
-	case ERROR_SENSOR_UNSUPPORT_AF:
-		return "ERROR_SENSOR_UNSUPPORT_AF";
-
-	/* ISP Error (200~299) */
-	case ERROR_ISP_AF_BUSY:
-		return "ERROR_ISP_AF_BUSY";
-	case ERROR_ISP_AF_INVALID_COMMAND:
-		return "ERROR_ISP_AF_INVALID_COMMAND";
-	case ERROR_ISP_AF_INVALID_MODE:
-		return "ERROR_ISP_AF_INVALID_MODE";
-
-	/* DRC Error (300~399) */
-	/* FD Error  (400~499) */
-	case ERROR_FD_CONFIG_MAX_NUMBER_STATE:
-		return "ERROR_FD_CONFIG_MAX_NUMBER_STATE";
-	case ERROR_FD_CONFIG_MAX_NUMBER_INVALID:
-		return "ERROR_FD_CONFIG_MAX_NUMBER_INVALID";
-	case ERROR_FD_CONFIG_YAW_ANGLE_STATE:
-		return "ERROR_FD_CONFIG_YAW_ANGLE_STATE";
-	case ERROR_FD_CONFIG_YAW_ANGLE_INVALID:
-		return "ERROR_FD_CONFIG_YAW_ANGLE_INVALID\n";
-	case ERROR_FD_CONFIG_ROLL_ANGLE_STATE:
-		return "ERROR_FD_CONFIG_ROLL_ANGLE_STATE";
-	case ERROR_FD_CONFIG_ROLL_ANGLE_INVALID:
-		return "ERROR_FD_CONFIG_ROLL_ANGLE_INVALID";
-	case ERROR_FD_CONFIG_SMILE_MODE_INVALID:
-		return "ERROR_FD_CONFIG_SMILE_MODE_INVALID";
-	case ERROR_FD_CONFIG_BLINK_MODE_INVALID:
-		return "ERROR_FD_CONFIG_BLINK_MODE_INVALID";
-	case ERROR_FD_CONFIG_EYES_DETECT_INVALID:
-		return "ERROR_FD_CONFIG_EYES_DETECT_INVALID";
-	case ERROR_FD_CONFIG_MOUTH_DETECT_INVALID:
-		return "ERROR_FD_CONFIG_MOUTH_DETECT_INVALID";
-	case ERROR_FD_CONFIG_ORIENTATION_STATE:
-		return "ERROR_FD_CONFIG_ORIENTATION_STATE";
-	case ERROR_FD_CONFIG_ORIENTATION_INVALID:
-		return "ERROR_FD_CONFIG_ORIENTATION_INVALID";
-	case ERROR_FD_CONFIG_ORIENTATION_VALUE_INVALID:
-		return "ERROR_FD_CONFIG_ORIENTATION_VALUE_INVALID";
-	case ERROR_FD_RESULT:
-		return "ERROR_FD_RESULT";
-	case ERROR_FD_MODE:
-		return "ERROR_FD_MODE";
-	default:
-		return "Unknown";
-	}
-}
-
 const char *fimc_is_strerr(unsigned int error)
 {
 	error &= ~IS_ERROR_TIME_OUT_FLAG;
diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-is-errno.h b/drivers/media/platform/samsung/exynos4-is/fimc-is-errno.h
index 809e117331c0..fa8204ffec7b 100644
--- a/drivers/media/platform/samsung/exynos4-is/fimc-is-errno.h
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-is-errno.h
@@ -240,6 +240,5 @@ enum fimc_is_error {
 };
 
 const char *fimc_is_strerr(unsigned int error);
-const char *fimc_is_param_strerr(unsigned int error);
 
 #endif /* FIMC_IS_ERR_H_ */
-- 
2.47.0


