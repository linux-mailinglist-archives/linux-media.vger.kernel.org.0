Return-Path: <linux-media+bounces-50201-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 806ADD01AAD
	for <lists+linux-media@lfdr.de>; Thu, 08 Jan 2026 09:54:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1F4DB3790400
	for <lists+linux-media@lfdr.de>; Thu,  8 Jan 2026 08:42:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C083137F8BE;
	Thu,  8 Jan 2026 08:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SZsGLSDd"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA35B357A26
	for <linux-media@vger.kernel.org>; Thu,  8 Jan 2026 08:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767860253; cv=none; b=K9fLSXkDS0Wu2d8w8VvkasTTfwOuK3UP23j49pRWRWcg16djNYgXSTkD26nZj9x9jK8pqq9ufHpnGlq0/eO4dAab4WWfd+WjAWdk58ZPrpviue5BPmp0nwV+djYLNksgJiOZhXLZMZA47o313uhgmw8kw8rUg0yA2EB9ncl3fj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767860253; c=relaxed/simple;
	bh=oNqbvdMhedklJpaoH/qcQJPFXf8zQ/3v4j1cEu56h/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f2fg1thCHqkoHTCULaX6DeVECX+J5e54N1OrKy33HYL3XEUYKyCpW40Oc9HDkLyjANYPt0UW1fQpbUIIIPU0TtOrgtbIREqHATjJqEIsZ1ylbCxjJh1+w0q8S2iafZkYyQrz7QMmJcDo6ACCgf9nFtQ5sat9YrS7E/1w7dcDgnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SZsGLSDd; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767860248; x=1799396248;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oNqbvdMhedklJpaoH/qcQJPFXf8zQ/3v4j1cEu56h/Y=;
  b=SZsGLSDdyuOoTA6Ud1I7xdJQ2bD7EanHH2XbpXuTEuSbtLFu8ycHVaa+
   EUPSobdNa3vFR7RflyJhPFYlj5BG3EXuYQ1w1FJx8kk4O5l7Pzj1aFnTM
   bOUGRKLYHcKKRCobTHYqaOBIskJiLOopAzezg8VzZsBt49MJkhojoLN+w
   EgOrTa8Hv1mV6DHTH+yumyIyCcWZuGYlIBAtJnez3fqgbhSPH+KzmWBdh
   B3Ac5VyKp2l55K91PldGdXi6Cct2f40DBrkZd1LhAVLfXSG864FQNx+uV
   HIHEDyNZLJ9fFo2Z4M8j/qNEo4xH/2w9Ia8Ed/K4B5RjotUkiwWd4Nwqo
   Q==;
X-CSE-ConnectionGUID: 8a7r11x4Qu6oplsXXUmWjg==
X-CSE-MsgGUID: ERkTWwaTSxqVeZjrH9C2QQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="72869932"
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="72869932"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 00:17:06 -0800
X-CSE-ConnectionGUID: HBTSWgXaQ5aOAMtvAosUNA==
X-CSE-MsgGUID: zI0dbUAZQgeIk9UHn5iLlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="233842976"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.211])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 00:17:05 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 7EB37121E96;
	Thu, 08 Jan 2026 10:17:13 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vdlCi-00000002HSo-0tj6;
	Thu, 08 Jan 2026 10:17:12 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: bingbu.cao@linux.intel.com,
	tian.shu.qiu@intel.com,
	antti.laakso@linux.intel.com,
	mehdi.djait@linux.intel.com
Subject: [PATCH v4 10/14] media: ipu6: Obtain remote pad using media_pad_remote_pad_unique()
Date: Thu,  8 Jan 2026 10:17:07 +0200
Message-ID: <20260108081712.543704-11-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260108081712.543704-1-sakari.ailus@linux.intel.com>
References: <20260108081712.543704-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There's no reason to use media_entity_remote_source_pad_unique() as we
know our pads. Use media_pad_remote_pad_unique() instead.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
index 43a2a16a3c2a..7e539a0c6c92 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
@@ -88,7 +88,7 @@ s64 ipu6_isys_csi2_get_link_freq(struct ipu6_isys_csi2 *csi2)
 	if (!csi2)
 		return -EINVAL;
 
-	src_pad = media_entity_remote_source_pad_unique(&csi2->asd.sd.entity);
+	src_pad = media_pad_remote_pad_unique(&csi2->asd.sd.entity.pads[CSI2_PAD_SINK]);
 	if (IS_ERR(src_pad)) {
 		dev_err(&csi2->isys->adev->auxdev.dev,
 			"can't get source pad of %s (%pe)\n",
-- 
2.47.3


