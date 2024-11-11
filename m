Return-Path: <linux-media+bounces-21233-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B869C364D
	for <lists+linux-media@lfdr.de>; Mon, 11 Nov 2024 02:57:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C54851F21A4B
	for <lists+linux-media@lfdr.de>; Mon, 11 Nov 2024 01:57:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DC9C42048;
	Mon, 11 Nov 2024 01:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="MXSdkMj1"
X-Original-To: linux-media@vger.kernel.org
Received: from out30-99.freemail.mail.aliyun.com (out30-99.freemail.mail.aliyun.com [115.124.30.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79BE64C66;
	Mon, 11 Nov 2024 01:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731290228; cv=none; b=RCMGzw3tOmlz//Jl8ZQRfrJFfq0fxk1DCsdNNiaDseCFrCi688Ma+2mZk6JfaeSGvJ7xDyqBVSynbXmmjbDlwefsR/imfKN+0LIvg2iJbaepanVaFsBPtFlc0CCmEKddH2tB0L7wft3oyWKuyfNf9wl3iu6VLvqMIIEjXVXSsLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731290228; c=relaxed/simple;
	bh=LPkW8IEQbM3znDtOXSds/ryJfmraGxYWL2jL3GAgJDY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Yebt1RCaXvZCYtviLSczpKiA03ofCjwfdUM62InRNw7KPGTm31UWpjY9MWs0X1FWQcg9DpR5c0WtZ86VPGs36y4PGKUWwFSCYr4kAhCF/4sYbb8PfQTvEq1ESSIuV+JZAfDrEklMD8caSuw09wWORl+Qikr2e0oD1hrTB83zXqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=MXSdkMj1; arc=none smtp.client-ip=115.124.30.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1731290222; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=FxgiHc8JqyD3222R99APSGMGrXQl2IZN/ouGTeW0TeQ=;
	b=MXSdkMj1pZ/8IYbkacc9chYnGPt2TCeSdZXa5EJLt/NOdZ1gng6FRNQGThOsRoV3Xbw7Yt8cdDrdITwXqD6IW3/hdiCCIdO/OsJlaKJg6ZeYMUTQi7yKXgvnYJZbm++mhZtsYpLO9SO6XlxU277tjGQb2R6AJ7fejaqZ/1mphzc=
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com fp:SMTPD_---0WJ3wh0X_1731290221 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 11 Nov 2024 09:57:02 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: sakari.ailus@linux.intel.com,
	bingbu.cao@intel.com,
	tian.shu.qiu@intel.com,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yang Li <yang.lee@linux.alibaba.com>,
	Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH -next] media: ipu6: Remove duplicated include in ipu6-dma.h
Date: Mon, 11 Nov 2024 09:56:59 +0800
Message-Id: <20241111015659.86760-1-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.32.0.3.g01195cf9f
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The header files linux/iova.h is included twice in ipu6-dma.h,
so one inclusion of each can be removed.

./drivers/media/pci/intel/ipu6/ipu6-dma.h: linux/iova.h is included more
than once.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=11791
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/media/pci/intel/ipu6/ipu6-dma.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-dma.h b/drivers/media/pci/intel/ipu6/ipu6-dma.h
index b51244add9e6..a902eec5c07a 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-dma.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-dma.h
@@ -7,7 +7,6 @@
 #include <linux/dma-map-ops.h>
 #include <linux/dma-mapping.h>
 #include <linux/iova.h>
-#include <linux/iova.h>
 #include <linux/scatterlist.h>
 #include <linux/types.h>
 
-- 
2.32.0.3.g01195cf9f


