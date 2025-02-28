Return-Path: <linux-media+bounces-27193-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 785FDA4924C
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2025 08:37:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA3F53A6175
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2025 07:37:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 810611CDFD4;
	Fri, 28 Feb 2025 07:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BR7vpNla"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 221601CAA9E;
	Fri, 28 Feb 2025 07:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740728220; cv=none; b=aFqpRqWa4JdJ0dp4sryKfc5NHQRj5jhAL/GknaklwNBjG61JjUue3Kxin42Wk/1KdtOJatC+RxdwcNjsAPoTWzX9cAKErLZK2KchHZFRy67uxYWiPNQV9rbMRUpcLnMQQJWDFDA5Ub6HgZT55aky0Ia5HjmQQzKvrLIA+TFnblU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740728220; c=relaxed/simple;
	bh=ed2DCzqGuQ7oYA4KGyuQboEdsEgBubtYVQfuHacbSo0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cfZ1s/tZMV6nBUFrn2fBtqXcRPhOTUUe+haa0vZt4a30DVYTlcz6BvPcPJTarYZqbVu2MbdBeZ+2Rvw3L15A4PNIZuDjhhJxCvnehYvCjIa7aQr9zS3KQgGBVym4I/tJdGeCm2rz+Bt/feKL8BR9pfnsLUnuIQdzH5SLtgSCKB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BR7vpNla; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740728219; x=1772264219;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ed2DCzqGuQ7oYA4KGyuQboEdsEgBubtYVQfuHacbSo0=;
  b=BR7vpNlagxbp3GpjPV5QAlOQQZAU+Og6wynjov/r4rTRnXYBlPJ/ogvy
   XUDswyrngMANSIU/XAKJ+9CuCh7T8bMAO02DjcChlfDWkwctviJPnW7cs
   66iMZz8KIndhTWA6Bv4zCWsqrgPTzfiUKaXYV3AUE6ru8MFLlo2DiFlUC
   Z3OlusTCXbDsmxo8arh+GYCxKh8ZJU+J7E/dcAphxoCCMzOmq9r0C1OZX
   ZbUbrCLMOEGmwWjYu1o8iq3Ts8FEPYoqPsgx64PFr+eARlFnQy7kEoRzI
   Y7Jo+bUEtRZvRlG+t2/tS5j04jIXai75xR6dHaiJ5BIZnYwtq+scxvOKu
   A==;
X-CSE-ConnectionGUID: lvg52S/kQO6SgCBBVN5M+Q==
X-CSE-MsgGUID: Fp5UDZUgQB6o3Wdjeiu80w==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="45298217"
X-IronPort-AV: E=Sophos;i="6.13,321,1732608000"; 
   d="scan'208";a="45298217"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 23:36:59 -0800
X-CSE-ConnectionGUID: jAEt4XPPSZO0gdN8GkuMvQ==
X-CSE-MsgGUID: Ap9EEkvISbm+tUEoFgtTeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="121387983"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
  by fmviesa003.fm.intel.com with ESMTP; 27 Feb 2025 23:36:55 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: eugen.hristev@linaro.org,
	mchehab@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	hugues.fruchet@foss.st.com,
	alain.volmat@foss.st.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	andriy.shevchenko@linux.intel.com,
	sakari.ailus@linux.intel.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v2 1/2] media: atmel-isi: use devm_kmemdup_array()
Date: Fri, 28 Feb 2025 13:06:48 +0530
Message-Id: <20250228073649.152157-2-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250228073649.152157-1-raag.jadav@intel.com>
References: <20250228073649.152157-1-raag.jadav@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert to use devm_kmemdup_array() and while at it, make the size robust
against type changes.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/media/platform/atmel/atmel-isi.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/atmel/atmel-isi.c b/drivers/media/platform/atmel/atmel-isi.c
index 0d1c39347529..7d8bec46af89 100644
--- a/drivers/media/platform/atmel/atmel-isi.c
+++ b/drivers/media/platform/atmel/atmel-isi.c
@@ -1072,16 +1072,12 @@ static int isi_formats_init(struct atmel_isi *isi)
 		return -ENXIO;
 
 	isi->num_user_formats = num_fmts;
-	isi->user_formats = devm_kcalloc(isi->dev,
-					 num_fmts, sizeof(struct isi_format *),
-					 GFP_KERNEL);
+	isi->user_formats = devm_kmemdup_array(isi->dev, isi_fmts, num_fmts,
+					       sizeof(isi_fmts[0]), GFP_KERNEL);
 	if (!isi->user_formats)
 		return -ENOMEM;
 
-	memcpy(isi->user_formats, isi_fmts,
-	       num_fmts * sizeof(struct isi_format *));
 	isi->current_fmt = isi->user_formats[0];
-
 	return 0;
 }
 
-- 
2.34.1


