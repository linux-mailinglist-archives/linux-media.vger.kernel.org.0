Return-Path: <linux-media+bounces-8627-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3B6898380
	for <lists+linux-media@lfdr.de>; Thu,  4 Apr 2024 10:52:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 632571F230DC
	for <lists+linux-media@lfdr.de>; Thu,  4 Apr 2024 08:52:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71DC37350E;
	Thu,  4 Apr 2024 08:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OW4SUdRo"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 986DD73173
	for <linux-media@vger.kernel.org>; Thu,  4 Apr 2024 08:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712220726; cv=none; b=dzibwUYVTMJyfCJugpcVnWD2G97Z+hx/F7mh+AdSlxNLt8lbTzZGgJYDF7vXfshM81Y6DklPyUpCMABkM18j+isK1OwCfXoeSQN+zi6833hHD8WrM1bjNLXHTnnnqGkXu5mS2kLqk7YNOPNyWOH4mDUU+BRRkl0V+UsON1NItOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712220726; c=relaxed/simple;
	bh=KdSn5B2qTy6DmAM5PdwQDRlpL/V6iN+lu+lPT/42DFw=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mZCH3c2rG6i1B5e1idHU5QNRxTYO8wiuY/IEyIsW3Rl95XiKJD+Uz8BnCg0URbz/+xhZo91NZrIuxL4GVoHs26E0+VLX/FzJ8t5pjWun127rZ8RIwQlSsl9084ee4iI2BHauEraJ97JZmhuONJQe6g1+EpgToFoPheadvSow7Zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OW4SUdRo; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712220725; x=1743756725;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=KdSn5B2qTy6DmAM5PdwQDRlpL/V6iN+lu+lPT/42DFw=;
  b=OW4SUdRoR2f2DBsrHnWFbY5mqWTVLsM0YKZkAZnGeDUux5KGszotJjj1
   BuxfGtaIBBHBQ1n7skW0Dl2/khs9xf6THhGlGROmh61phHEO0jgoSfLA1
   P/d35CgNlGq1IfavxzzYNInNWlPc4P8MCwBKg3k04LyfNQxOoqQqEbVbp
   VUlPse06JF5EfmXPJSTIvGLLTQh5UzHn46ivDQibqY+qDNDYUqpvWJz0l
   BPt8FkMqV6AYEiu/7MbNwUMlubZ/jLnP5Cr9C5Uqxr2LDn8rTelYpMUpj
   TSZy+FW9cgU7Dl+wgJvX/O5jQ2nVAyuOflKYaNC4I2Vt0j67kxekrSB1e
   Q==;
X-CSE-ConnectionGUID: xjk3jB27RcuUQPvFo7cXHA==
X-CSE-MsgGUID: za1XTySUTBCSrJdjTS+twA==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="7658994"
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; 
   d="scan'208";a="7658994"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2024 01:51:49 -0700
X-CSE-ConnectionGUID: pgZ3hBoETO+M2iZTv6M8Hg==
X-CSE-MsgGUID: q3U7UbnISB+7/6stdvehMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; 
   d="scan'208";a="23186561"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2024 01:51:48 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id B1B0D11FC1A
	for <linux-media@vger.kernel.org>; Thu,  4 Apr 2024 11:51:45 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1rsIoz-001hON-2H
	for linux-media@vger.kernel.org;
	Thu, 04 Apr 2024 11:51:45 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Subject: [PATCH 2/3] media: dw9714: Update e-mail addresses
Date: Thu,  4 Apr 2024 11:51:34 +0300
Message-Id: <20240404085135.405104-3-sakari.ailus@linux.intel.com>
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

Remove inactive e-mail addresses.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/dw9714.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/dw9714.c b/drivers/media/i2c/dw9714.c
index 84d29bcf0ccd..0e88ce0ef8d7 100644
--- a/drivers/media/i2c/dw9714.c
+++ b/drivers/media/i2c/dw9714.c
@@ -310,8 +310,8 @@ module_i2c_driver(dw9714_i2c_driver);
 
 MODULE_AUTHOR("Tianshu Qiu <tian.shu.qiu@intel.com>");
 MODULE_AUTHOR("Jian Xu Zheng");
-MODULE_AUTHOR("Yuning Pu <yuning.pu@intel.com>");
-MODULE_AUTHOR("Jouni Ukkonen <jouni.ukkonen@intel.com>");
-MODULE_AUTHOR("Tommi Franttila <tommi.franttila@intel.com>");
+MODULE_AUTHOR("Yuning Pu");
+MODULE_AUTHOR("Jouni Ukkonen");
+MODULE_AUTHOR("Tommi Franttila");
 MODULE_DESCRIPTION("DW9714 VCM driver");
 MODULE_LICENSE("GPL v2");
-- 
2.39.2


