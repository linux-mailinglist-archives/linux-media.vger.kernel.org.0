Return-Path: <linux-media+bounces-41297-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D596FB3B331
	for <lists+linux-media@lfdr.de>; Fri, 29 Aug 2025 08:17:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F0DC16E7D1
	for <lists+linux-media@lfdr.de>; Fri, 29 Aug 2025 06:17:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E92AC23AB8A;
	Fri, 29 Aug 2025 06:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RIZJ8H+j"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9880F1DFE26
	for <linux-media@vger.kernel.org>; Fri, 29 Aug 2025 06:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756448267; cv=none; b=dzGQsSLRnuqRiaAJoaqO0MDrsfYwHUj0NlXnLoLciqw5OSZ0bQlEZU+Ao+vOiT9QhEgdcdsvNaleSkxVE4axTy8ANl1DC9sBK9Odgz8iNwfk5v0HiEcZhA9oZ7SWmekdqMkyQ7b913qINNMJFs5+VDeaU/dYIpV40aWugTrQjh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756448267; c=relaxed/simple;
	bh=DgfUU/WMAjw4QhZOxcYC6b5QdV+l8GIW4tQ8A9uXm6I=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=YmKB3UQDKZolNMHXdPQBHd6+VB3K6E/jgXsgjaETthxtkcrhfIEZmZtw0j+f4B+zPYCE2oJxyXnnsM9CywmfmgSu240Y9Z5Y45scnP32LD8BFFpK8J7P43oqAyzwYtD2PGPOhm1Ugjmskczz088kCZCoBMZUHn1IIkwIMIoCwp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RIZJ8H+j; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756448265; x=1787984265;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=DgfUU/WMAjw4QhZOxcYC6b5QdV+l8GIW4tQ8A9uXm6I=;
  b=RIZJ8H+jHvjLd73esZflTpHChVDbwbfpkFJe1/YXVqOIkemNze7GSRMF
   4Fqn2gL9y5o1Ju5zzNYAS/mfw89NkzGIpkgArbgICOobHmyRVINO2rLqr
   Fmec/mA7JLDlsXyHfYmJNuGgajyMmSxVmOFWPvrpNt4sEgMVgwhs8y085
   +LOsIfSayoeCdy428IhGLrDIppajDZTK87gh8OgUFCx0Lw3fvYQKakErq
   IMjCX6fJI6hvcclfGfyHu5v8hVt4+2nkxW3e3JAjizbBfDpvKMmk2Z82E
   sEoGrk2EVOpA2jVaDBQ1O3Mcu4YOkyfyXRFjv10z65aV2MYwRjj0xRN02
   g==;
X-CSE-ConnectionGUID: PxqpK5njQTC8lR2zHjNYdw==
X-CSE-MsgGUID: PqbS68geTIeoq+aP7x7sPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="76328677"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
   d="scan'208";a="76328677"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2025 23:17:45 -0700
X-CSE-ConnectionGUID: zqtK2dLQRKusrVHoaMllZw==
X-CSE-MsgGUID: JvQb4hwHT0+b4NcPfhvsFA==
X-ExtLoop1: 1
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.185])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2025 23:17:42 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 4D2CB121F51
	for <linux-media@vger.kernel.org>; Fri, 29 Aug 2025 09:17:40 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1ursQS-0000000H16n-1h9w
	for linux-media@vger.kernel.org;
	Fri, 29 Aug 2025 09:17:28 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Subject: [PATCH 1/1] media: ov02e10: Remove Jingjing's e-mail address
Date: Fri, 29 Aug 2025 09:17:28 +0300
Message-ID: <20250829061728.4055829-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Jingjing's e-mail address no longer works, remove it from the driver.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ov02e10.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov02e10.c b/drivers/media/i2c/ov02e10.c
index d74dc62e189d..4556d9445906 100644
--- a/drivers/media/i2c/ov02e10.c
+++ b/drivers/media/i2c/ov02e10.c
@@ -961,7 +961,7 @@ static struct i2c_driver ov02e10_i2c_driver = {
 
 module_i2c_driver(ov02e10_i2c_driver);
 
-MODULE_AUTHOR("Jingjing Xiong <jingjing.xiong@intel.com>");
+MODULE_AUTHOR("Jingjing Xiong");
 MODULE_AUTHOR("Hans de Goede <hdegoede@redhat.com>");
 MODULE_AUTHOR("Alan Stern <stern@rowland.harvard.edu>");
 MODULE_AUTHOR("Bryan O'Donoghue <bryan.odonoghue@linaro.org>");
-- 
2.47.2


