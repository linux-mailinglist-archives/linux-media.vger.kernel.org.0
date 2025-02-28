Return-Path: <linux-media+bounces-27216-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B0AA4978A
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2025 11:36:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D5E6D170612
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2025 10:36:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC0ED260377;
	Fri, 28 Feb 2025 10:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="co9KAQNj"
X-Original-To: linux-media@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE88725F7B1;
	Fri, 28 Feb 2025 10:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740738951; cv=none; b=QrodKNmW5x05BOTYPKqca/gCS1ufzhEIzN8y/NB0qKpqRjObh4soeYDIJVMUuC7Y057FbhRO3vWhS0oTXcsYOLh9UTgX9V4WHrQTLrK6RdC6NI0OIzbhPWe9touxZLLZIX3VdGnJUGbknDcScmZs8nAdlBj0OGyVpHC8tQLf86M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740738951; c=relaxed/simple;
	bh=/TumYJ27asLfRd0rL1BGVsrzFLAGEEw+uglJkmEtiLM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e6cXJ6WQGYLHVrpsa2ohwQ/9xOi8LrD8LNoLqQB27E4Nc7tyvCAxv+d8c/rtMFPbTGI0kUZafbg8/Qu5PhiCiPr82aqH5yghqLKK/UwRnytl8SFWSpObZdDT/l0XJUAuMjhumZ+1mFFAstD4/tOp3u/k840XHNCZ9LrxpzJRYtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=co9KAQNj; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1740738950; x=1772274950;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/TumYJ27asLfRd0rL1BGVsrzFLAGEEw+uglJkmEtiLM=;
  b=co9KAQNjQzz/QhA0CFaYHQlKdIefmaAEY0PZAuaBvhOAXS5soet016HA
   /xXnp4gxZfpDBvUQnNf9KV1y7u/fNIolcoFDcDdvF2kQiVWo5lNkhhIKq
   jQS5vjrb4kwuqnWGMDFugR8zaisrb9MCfR/6n+SLzyI58Cy+l/RB5U0JQ
   nO9mTPDkN+RkhYMnZFkxAGVuG9TfQ0B0S8lUaUUfz0rrXhHe4VEGtkfVS
   c1brbR0Ydi7ydN79GJsiLgGRcGFehVn3XgEwQXpZMQeaO7b0JuN7ItyiU
   44Txs+5e8gwL2+SMmhvJzeFgWl1qZgvMngE9QzrySHd6Dg53v3/K0YDJS
   Q==;
X-CSE-ConnectionGUID: EGT8tc8wQVmSwiJ/XsSdqg==
X-CSE-MsgGUID: K36VVCg3QmabpI5NCU1q5g==
X-IronPort-AV: E=Sophos;i="6.13,322,1732604400"; 
   d="scan'208";a="38683421"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 28 Feb 2025 03:35:46 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 28 Feb 2025 03:35:23 -0700
Received: from microchip1-OptiPlex-9020.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Fri, 28 Feb 2025 03:35:20 -0700
From: shravan kumar <shravan.chippa@microchip.com>
To: <sakari.ailus@linux.intel.com>, <mchehab@kernel.org>
CC: <kieran.bingham@ideasonboard.com>, <linux-media@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <conor.dooley@microchip.com>,
	<valentina.fernandezalanis@microchip.com>, <praveen.kumar@microchip.com>,
	<shravan.chippa@microchip.com>
Subject: [PATCH V6 2/3] media: i2c: imx334: update mode_3840x2160_regs array
Date: Fri, 28 Feb 2025 16:03:31 +0530
Message-ID: <20250228103332.3647098-3-shravan.chippa@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250228103332.3647098-1-shravan.chippa@microchip.com>
References: <20250228103332.3647098-1-shravan.chippa@microchip.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Shravan Chippa <shravan.chippa@microchip.com>

The 3840x2160 mode operates with the imx334 reset values.
If we switch to other modes and then return to the 3840x2160 mode,
it should function correctly. so updated the mode_3840x2160_regs
array with the imx334 reset values.

Signed-off-by: Shravan Chippa <shravan.chippa@microchip.com>
---
 drivers/media/i2c/imx334.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c
index a800f2203592..f80a8ce8f9c5 100644
--- a/drivers/media/i2c/imx334.c
+++ b/drivers/media/i2c/imx334.c
@@ -344,6 +344,12 @@ static const struct imx334_reg mode_3840x2160_regs[] = {
 	{0x302d, 0x00},
 	{0x302e, 0x00},
 	{0x302f, 0x0f},
+	{0x3074, 0xb0},
+	{0x3075, 0x00},
+	{0x308e, 0xb1},
+	{0x308f, 0x00},
+	{0x30d8, 0x20},
+	{0x30d9, 0x12},
 	{0x3076, 0x70},
 	{0x3077, 0x08},
 	{0x3090, 0x70},
-- 
2.34.1


