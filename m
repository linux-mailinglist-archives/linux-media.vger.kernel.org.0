Return-Path: <linux-media+bounces-28093-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C82D6A5E2E8
	for <lists+linux-media@lfdr.de>; Wed, 12 Mar 2025 18:41:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DFBC27A941F
	for <lists+linux-media@lfdr.de>; Wed, 12 Mar 2025 17:40:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D29A0254B02;
	Wed, 12 Mar 2025 17:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mj5k6x/r"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A42084D13;
	Wed, 12 Mar 2025 17:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741801290; cv=none; b=i5Z9JkxnNp3vbZmDP2YWQ7jGLn/dyPjTcHgkdMgWG1riFcnKOv2PVDCXVYgUO109OHz8od4svFmGT+WKKw9I1xpuTklGSm23W1QV4wr26GuX9qNpjQ5LkkFOSquYCTqVCXv5+DtEI2qLpIz7qqLfNTneA1OhlZ4CE8DC0BUzPq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741801290; c=relaxed/simple;
	bh=c7ULQ/YDFwbkluQJyxGwnd4AkGdM/+B4VTGHdwHtUNY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lYat9Es2W0tuQ3S/AJzapKyTtITYJ6PkQyF1ehNMcq8C9RDGeNIa6WCZ42Afhomtb/6IStRCMsK8zkUeKydalv+FziioaJwHHDkuD+4ILC5AHbaiajLTNafczoLA7YNdDq85vrnWk1czCa/nqf73/EXqQf3/MSf/tEJKGoY4MKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mj5k6x/r; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741801289; x=1773337289;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=c7ULQ/YDFwbkluQJyxGwnd4AkGdM/+B4VTGHdwHtUNY=;
  b=mj5k6x/r0FKFEiro1Ilja5Pldh5bnak2u0QLDwsLGwuxv2/QJtSYfcP1
   Q6D20YuoFuu2cirHC+BWgJa0AcV9jEAE5s1Aur8/IPG+hBzTFzFeFaoqa
   XqAyaMO60sMY599tVJmJA14QLXIbeEnwEdeStUZz4OPg4vTQOcDQLUUK8
   peIKVUGnRHBE6Of19VBzUcG84dnBZ6aRQdARxzSfwuQ0Mg+LUc3MWwJlZ
   /PJqNq/4+HaQzdKxwsMNiE4NHinKoW9ojZ/qCXPt3wrpfQ3XFHpA+7zp/
   dbbv/Xa+KWkQx/GWEcuOx285PKS5CywRk9+RLajz77Ju7UEtojpCOMMxk
   Q==;
X-CSE-ConnectionGUID: mHMdWo93RDqxDrkmM+fftg==
X-CSE-MsgGUID: Lqv86uQGT/m6WygMgx9iHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="42929799"
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; 
   d="scan'208";a="42929799"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 10:41:28 -0700
X-CSE-ConnectionGUID: ZNU3wkhQRRqlx/aZ1FE8ew==
X-CSE-MsgGUID: NkeiyPnNQDaYoqJAqq4+7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; 
   d="scan'208";a="120515680"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa006.fm.intel.com with ESMTP; 12 Mar 2025 10:41:25 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 9B8001F2; Wed, 12 Mar 2025 19:41:24 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] media: i2c: ds90ub960: Remove of_node assignment
Date: Wed, 12 Mar 2025 19:41:23 +0200
Message-ID: <20250312174123.4111661-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Remove of_node assignment which duplicates fwnode in struct i2c_board_info.
In general drivers must not set both, it's quite confusing. The I²C core
will consider fwnode with a priority and of_node is subject to remove from
above mentioned data structure.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/media/i2c/ds90ub960.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index 5dde8452739b..5afdbbad9ff4 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -1682,7 +1682,6 @@ static int ub960_rxport_add_serializer(struct ub960_data *priv, u8 nport)
 	struct device *dev = &priv->client->dev;
 	struct ds90ub9xx_platform_data *ser_pdata = &rxport->ser.pdata;
 	struct i2c_board_info ser_info = {
-		.of_node = to_of_node(rxport->ser.fwnode),
 		.fwnode = rxport->ser.fwnode,
 		.platform_data = ser_pdata,
 	};
-- 
2.47.2


