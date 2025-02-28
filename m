Return-Path: <linux-media+bounces-27214-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C05E2A49785
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2025 11:35:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E288C16EF51
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2025 10:35:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CED4025F7AF;
	Fri, 28 Feb 2025 10:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="wELiVF8e"
X-Original-To: linux-media@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0512025B690;
	Fri, 28 Feb 2025 10:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740738949; cv=none; b=GlXXs3X+8YlOF0h4f6tmPAK7uvFilBR9U57pFPhm+9OqBuTto4s3WkBhwHzG9cNbXkrN3hCzZfNGRYfVuVJaHYsrOjWO1wpt3udrkv3LXfdJ60SZWX+hxptqDKKFM5DgCHXZOl0UbXHdFoikiRtO/fg9DnMsCnbD9LU1MdNBlDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740738949; c=relaxed/simple;
	bh=a9IBjOplfxK19K3Os9trJjGItNJktLYEi6hhTepcrVc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=F5VWgzSRTXhELyvfqBTlttRPzIR3lWLjr+YQlQGKehuf/QQtSv3D3UK0JJtE0Y+nNE+xUEWFFscKQs2lad5LQkZEBj7cQwTMpbnddH5VlaY6N9oEV0IEWmMcwIrmu53MFUS3g/IXEPNdNbIShjbtXHgokoO8D1TtKkn1fSg9GmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=wELiVF8e; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1740738947; x=1772274947;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=a9IBjOplfxK19K3Os9trJjGItNJktLYEi6hhTepcrVc=;
  b=wELiVF8eTHXF/agvzkMeYMpUqP7GQ14RSgpzYDMkNx6uK1oBKTvaxlu9
   rEuiIJ3lgUJ0wAAuourOOzjzNSWEQL2BSTCj8PtHdBwuRDIbq7ZL9Fd9Y
   FTmDvR0wvBwLLwJ4/e+ZB2Aw+6IkzehGX7jgUZlu80+Fw7qi/+IiPCa8i
   bGN0ZCdfdNwV4M4PzsiON8vgLj2rwFxSkntS4TanFFtDHQBv5OZ4naNqu
   VrsN8qlg8wicBnnsw4S+ETDjnauiMl90pB7TCQ5qJqbgiatv4qPceayh0
   WF+7iYTp8Xm3LnCOAlPPVNDU2xLMoInR2EjbxooI+18m+ssvIpqJbCWRE
   g==;
X-CSE-ConnectionGUID: EGT8tc8wQVmSwiJ/XsSdqg==
X-CSE-MsgGUID: FVVm8VD3R9WfABB5j9XRcQ==
X-IronPort-AV: E=Sophos;i="6.13,322,1732604400"; 
   d="scan'208";a="38683418"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 28 Feb 2025 03:35:46 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 28 Feb 2025 03:35:16 -0700
Received: from microchip1-OptiPlex-9020.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Fri, 28 Feb 2025 03:35:13 -0700
From: shravan kumar <shravan.chippa@microchip.com>
To: <sakari.ailus@linux.intel.com>, <mchehab@kernel.org>
CC: <kieran.bingham@ideasonboard.com>, <linux-media@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <conor.dooley@microchip.com>,
	<valentina.fernandezalanis@microchip.com>, <praveen.kumar@microchip.com>,
	<shravan.chippa@microchip.com>
Subject: [PATCH V6 0/3] media: i2c: imx334: Add support for 1280x720 & 640x480 resolutions
Date: Fri, 28 Feb 2025 16:03:29 +0530
Message-ID: <20250228103332.3647098-1-shravan.chippa@microchip.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Shravan Chippa <shravan.chippa@microchip.com>

Changelog:
v5 -> v6:
split the patches from two to three
1) Optimized the resolution arrays by integrating a common register array
2) 3840x2160 mode restored with reset values of imx334
3) 1280x720@30 and 640x480@30 resolutions 

v4 -> v5:
Divided the patch into two separate patches:
- One for common register array values with existing resolutions
- Another for new modes supporting 640x480 and 1280x720 resolutions

v3 -> v4:
In response to the review request, the dependency of the common register
value array on the 445M link frequency has been eliminated.
Although I do not have a test setup for 4k resolution at an 819M link frequency,
I have made adjustments based on the IMX334 data sheet, the latest 4k resolution, 
and the common register value array. Additionally, the 4k resolution has been
switched to master mode to ensure consistency with other resolutions that also
use master mode.

v2 -> v3:
removied blank lines reported by media CI robot 

v1 -> v2:
Optimized the resolution arrays by added common register
array


Shravan Chippa (3):
  media: i2c: imx334: Optimized 4k and 2k mode register arrays
  media: i2c: imx334: update mode_3840x2160_regs array
  media: i2c: imx334: add modes for 720p and 480p resolutions

 drivers/media/i2c/imx334.c | 204 +++++++++++++++++++------------------
 1 file changed, 103 insertions(+), 101 deletions(-)

-- 
2.34.1


