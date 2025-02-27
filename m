Return-Path: <linux-media+bounces-27166-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F5DA480A8
	for <lists+linux-media@lfdr.de>; Thu, 27 Feb 2025 15:13:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0CB4A189B0F2
	for <lists+linux-media@lfdr.de>; Thu, 27 Feb 2025 14:06:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FBD523C384;
	Thu, 27 Feb 2025 14:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LVSEiLsb"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 755E423AE79;
	Thu, 27 Feb 2025 14:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740665009; cv=none; b=KjvFVJTI+lwOHoiTXvJ2YKUX6tCZQCYpGS/xKNdNhtTWKgTn8mQdER37XHFPgxpRwtPiPsakiGfunSTa/Hr+kwOp+hBJJmIK03ukCt0+TPGIZ1KZIYzvgLxVvYaI89UO2B0B47VxHfbTrgvkJY7u31BiH7KckiOkHjZR7yNm5/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740665009; c=relaxed/simple;
	bh=W7j6pUw/4PAZdtwF8PROLode/MZ9q3ImqlsqxtKfh8Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=t6xYRJaTaEFeOKFQ5EdKspMuA7LDHhEf5IoRXeGUHS5rdHx1bF4PmpsaF1hiErqisdrPsp7qAJutMpz95iqZiEErtDgmKsb4Oy5H+vCAaOX27dhFWr82sNSKXdFP4kdDQM3EK2BqnZ9BO9ZMKE4E7hni7sKoKgR1ewqk5kI9DJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LVSEiLsb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8305AC4CEE7;
	Thu, 27 Feb 2025 14:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740665008;
	bh=W7j6pUw/4PAZdtwF8PROLode/MZ9q3ImqlsqxtKfh8Q=;
	h=From:To:Cc:Subject:Date:From;
	b=LVSEiLsbs/01+Ko8YuihPFlFfBCKeYS+Ffr7/ZtkSKwA+jsLWV6M+cFqrByJ9skzx
	 swzdP6GdWBGXgFSoYjdgU7IG2UKEyEMl+lHdL7sVh2o/1IAtId5UtRsGL7YyZDFPD3
	 5CazvBHRnQUxIYdsu+fqA+He52UWQYa8OYHa+mEO8dNDFNOMhPKMvPLmxNhfuiZDbv
	 /klsEjqYxdbeoAAyKZA/wAejyPs3x15TWw6k1HmMpfILVRByed7xncxHMoYRKW9e30
	 GnJZ4U6LdfQQgecjjI6ZptGecIOLaQ0sW7pmQA9QrCz+V0vfYdMsfJivH/HLNuuave
	 mUlLsCrmp/Erw==
From: Arnd Bergmann <arnd@kernel.org>
To: Hans Verkuil <hverkuil@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: cec: tda9950: add back i2c dependency
Date: Thu, 27 Feb 2025 15:02:46 +0100
Message-Id: <20250227140301.3062217-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

drivers/media/cec/i2c/tda9950.c: In function 'tda9950_write_range':
drivers/media/cec/i2c/tda9950.c:92:15: error: implicit declaration of function 'i2c_transfer' [-Wimplicit-function-declaration]
   92 |         ret = i2c_transfer(client->adapter, &msg, 1);
      |               ^~~~~~~~~~~~
drivers/media/cec/i2c/tda9950.c: In function 'tda9950_probe':
drivers/media/cec/i2c/tda9950.c:391:14: error: implicit declaration of function 'i2c_check_functionality' [-Wimplicit-function-declaration]
  391 |         if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
      |              ^~~~~~~~~~~~~~~~~~~~~~~

Fixes: caa6f4a75e9f ("media: cec: move driver for TDA9950 from drm/i2c")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/media/cec/i2c/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/cec/i2c/Kconfig b/drivers/media/cec/i2c/Kconfig
index b9d21643eef1..c31abc26f602 100644
--- a/drivers/media/cec/i2c/Kconfig
+++ b/drivers/media/cec/i2c/Kconfig
@@ -16,6 +16,7 @@ config CEC_CH7322
 
 config CEC_NXP_TDA9950
 	tristate "NXP Semiconductors TDA9950/TDA998X HDMI CEC"
+	depends on I2C
 	select CEC_NOTIFIER
 	select CEC_CORE
 	default DRM_I2C_NXP_TDA998X
-- 
2.39.5


