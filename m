Return-Path: <linux-media+bounces-26891-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2552A43540
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 07:30:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 16E517AB872
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 06:28:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5843C25742D;
	Tue, 25 Feb 2025 06:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="ndpeIz2E"
X-Original-To: linux-media@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0AC2561CE;
	Tue, 25 Feb 2025 06:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740464950; cv=none; b=XddXexYd4act4fYH8Q/gaQuNTKIate8VX189Sqr9HCYsE4U0qXzu0DW7QttTcR+9w36JLAom1rXne9Q35MFqV6dQPf7PmBw2iVYKvn77zkHpiwbpYvB7IcVLq1oexzyy+Q/rduK1FfQ6ZT3k7hcl5ZWe0Cn+4FhadDTYXVs2apU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740464950; c=relaxed/simple;
	bh=7eUL0jBzz1cYq9mjHiINOryJSNbEueKGpRbHgX5oi8o=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QtQOW3FDz87sqSsoPvx4AawYlIRUL/6ZEistm04FUxYw7ja7YhSQmtZxqKiHfPyIGN4p/18ASgBopLcrXDoKsuILCwpG2FfrQq4sL2lR11rMqBbrSi5k52ADK20OEInY/PhrLmQgT4Y6LEklnoo0nE9o0Tmmhq9DbQtwDY8k4z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=ndpeIz2E; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1740464950; x=1772000950;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=7eUL0jBzz1cYq9mjHiINOryJSNbEueKGpRbHgX5oi8o=;
  b=ndpeIz2EzU+Y9kFDcSX3PWuKV6q6rqF8zbobDpN/fi+A1GKtxBh3EnJP
   SmVJR0JYa/dOAMno8kACrgzgKfDu/tUQs71+tRzUXH7YufKq6wLUxqcoQ
   5tu64Py5blh6wePd5GxD0KZ4WaAaqZfEFC+0I0pjg8VD1IkS0Iac2owJc
   +6pqUOPQFqerqzMzHaeoY6EYx9PRmFbD6qpbciR5ZEEGrQPgIgJXphzjG
   8trfkUdMf9g7rs36H5R+8T+Q7F9/MXl7/FarVcUP+Yywtsvo4fduzZOjz
   upr753/ECHNqecj9l7l0cveSQNxrcVTON/RQlMYAspCcmgE7OPSnVQIhH
   w==;
X-CSE-ConnectionGUID: ADVUi8D6REKc6zSlr8EjjA==
X-CSE-MsgGUID: 791BDBPURFWqQnKqq+1Tdg==
X-IronPort-AV: E=Sophos;i="6.13,313,1732604400"; 
   d="scan'208";a="38087707"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 24 Feb 2025 23:29:03 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 24 Feb 2025 23:28:20 -0700
Received: from microchip1-OptiPlex-9020.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 24 Feb 2025 23:28:16 -0700
From: shravan kumar <shravan.chippa@microchip.com>
To: <sakari.ailus@linux.intel.com>, <mchehab@kernel.org>
CC: <kieran.bingham@ideasonboard.com>, <linux-media@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <conor.dooley@microchip.com>,
	<valentina.fernandezalanis@microchip.com>, <praveen.kumar@microchip.com>,
	<shravan.chippa@microchip.com>
Subject: [PATCH V5 0/2] media: i2c: imx334: Add support for 1280x720 & 640x480 resolutions
Date: Tue, 25 Feb 2025 11:56:33 +0530
Message-ID: <20250225062635.3566513-1-shravan.chippa@microchip.com>
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
v4 -> v5:
Divided the patch into two separate patches:
- One for common register array values with existing resolutions
- Another for new modes supporting 640x480 and 1280x720 resolutions

v3 -> v4:
In response to the review request, the dependency of the common register value array
on the 445M link frequency has been eliminated. Although I do not have a test setup for 
4k resolution at an 819M link frequency, I have made adjustments based on the IMX334 
data sheet, the latest 4k resolution, and the common register value array. 
Additionally, the 4k resolution has been switched to master mode to ensure consistency
with other resolutions that also use master mode.

v2 -> v3:
removied blank lines reported by media CI robot 

v1 -> v2:
Optimized the resolution arrays by added common register
array

---

Shravan Chippa (2):
  media: i2c: imx334: Optimized 4k and 2k mode register arrays
  media: i2c: imx334: add modes for 720p and 480p resolutions

 drivers/media/i2c/imx334.c | 214 +++++++++++++++++++------------------
 1 file changed, 109 insertions(+), 105 deletions(-)

-- 
2.34.1


