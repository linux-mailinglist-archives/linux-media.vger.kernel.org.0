Return-Path: <linux-media+bounces-8626-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0AA89837F
	for <lists+linux-media@lfdr.de>; Thu,  4 Apr 2024 10:52:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CBE38B24D32
	for <lists+linux-media@lfdr.de>; Thu,  4 Apr 2024 08:52:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2C5F73189;
	Thu,  4 Apr 2024 08:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aTIoZdj4"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 347A271B4C
	for <linux-media@vger.kernel.org>; Thu,  4 Apr 2024 08:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712220726; cv=none; b=tVz0dsxAB2h+csUcVr0HROkcLtTRNGTxS8vwG/7tRWSvzjGupZ9QOE1SmaodkoXnrz0ATgn+0iZZ7IbhZ8l6Px2FfaFrnmlRRVqSIxRZnTvddHcmeOnJNWuFA+QnHhz971o4fCAH4KPUTnKAf1Y1lEFUv9xh9+QFFLHL2892MNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712220726; c=relaxed/simple;
	bh=diNu3uSPZWqExNHdcaI8ZYcKsPAJ1dTU2R1yJZt7piU=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SsWHeYtvBd+obJFJwutwEYma+YZZ8rqLegEjwi/UkLglOFHVq0djP/QupcAUPaLxMx5XeVM4n3dpLM8aRakrOVwyb5dP0rtwW66iPpuHHWc5fW6bzPpjq/2CsvLnwdW23gT2sMb/A0jJUrq/zgP06XTzizAI6IcSjFn2Y8ccVP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aTIoZdj4; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712220724; x=1743756724;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=diNu3uSPZWqExNHdcaI8ZYcKsPAJ1dTU2R1yJZt7piU=;
  b=aTIoZdj4TgHmvShj8zLmqFn/DncnthOLNaEU9mfeK4HTiIFI8nmAGJRH
   beuekZTeQitB7yB5S/IV/UfGB/B2zBZj4DZiSYafOD1nHQr7YJj9CJMju
   w3cmEntsH5IdLAweEwvR+Gq8LB9BITT6ifpI7FnjaRx8EEcryX+dEnb4C
   KfLKm2OGs5E6tW0TxBoWxzqr0m32zlmgUzIfqbMXNvqo4sgGH49d0gh6d
   oPOg1WdoXr+Uv7v2hkeZxpIq4K/ZO31BMXlax7MQvNlxDTaQxpR8juPq4
   c6Vgo52teWMPb+KSaEoT3QePmiIPOwTSKh0z49L1eGIKOaM2btungQsGV
   A==;
X-CSE-ConnectionGUID: X0RVkXA2TXKxd2YGXrh0cw==
X-CSE-MsgGUID: JOQ7FSuCQxGxRELLyyk6BQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="7658993"
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; 
   d="scan'208";a="7658993"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2024 01:51:49 -0700
X-CSE-ConnectionGUID: 4nAKTZYiQoOe91k99UiEnw==
X-CSE-MsgGUID: AAE2VeG4Si6XYlR4GhSwOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; 
   d="scan'208";a="23186560"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2024 01:51:48 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id B655C120701
	for <linux-media@vger.kernel.org>; Thu,  4 Apr 2024 11:51:45 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1rsIoz-001hOR-2L
	for linux-media@vger.kernel.org;
	Thu, 04 Apr 2024 11:51:45 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Subject: [PATCH 3/3] staging: media: ipu3-imgu: Update e-mail addresses
Date: Thu,  4 Apr 2024 11:51:35 +0300
Message-Id: <20240404085135.405104-4-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240404085135.405104-1-sakari.ailus@linux.intel.com>
References: <20240404085135.405104-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove e-mail addresses no longer in use.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/staging/media/ipu3/ipu3.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/ipu3/ipu3.c b/drivers/staging/media/ipu3/ipu3.c
index 18ca22c3018a..215884b3e922 100644
--- a/drivers/staging/media/ipu3/ipu3.c
+++ b/drivers/staging/media/ipu3/ipu3.c
@@ -853,10 +853,10 @@ static struct pci_driver imgu_pci_driver = {
 
 module_pci_driver(imgu_pci_driver);
 
-MODULE_AUTHOR("Tuukka Toivonen <tuukka.toivonen@intel.com>");
+MODULE_AUTHOR("Tuukka Toivonen");
 MODULE_AUTHOR("Tianshu Qiu <tian.shu.qiu@intel.com>");
-MODULE_AUTHOR("Jian Xu Zheng <jian.xu.zheng@intel.com>");
-MODULE_AUTHOR("Yuning Pu <yuning.pu@intel.com>");
+MODULE_AUTHOR("Jian Xu Zheng");
+MODULE_AUTHOR("Yuning Pu");
 MODULE_AUTHOR("Yong Zhi <yong.zhi@intel.com>");
 MODULE_LICENSE("GPL v2");
 MODULE_DESCRIPTION("Intel ipu3_imgu PCI driver");
-- 
2.39.2


