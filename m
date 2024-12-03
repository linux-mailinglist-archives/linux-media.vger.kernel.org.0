Return-Path: <linux-media+bounces-22526-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F579E193A
	for <lists+linux-media@lfdr.de>; Tue,  3 Dec 2024 11:27:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8CE22287A3C
	for <lists+linux-media@lfdr.de>; Tue,  3 Dec 2024 10:27:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D87831E1C2D;
	Tue,  3 Dec 2024 10:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jpO/fPz7"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879641E0B6C
	for <linux-media@vger.kernel.org>; Tue,  3 Dec 2024 10:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733221673; cv=none; b=aYzKZYgkwgfCof6ii04Nwc+V5K80w/BaANVk5+Y5nSsWECAw8DLjNTkPBUMNwgMYEcY7HuPs/YYGXQ5R4asXQpbtSGTu8MZZA6B5gpG8nqg+yE4qTVxv3flqwmFAMSww2vgtbZOSWAAjxW0rgIuh9fWWH3tVYs0FuJHq6xIqRJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733221673; c=relaxed/simple;
	bh=Z6dsnFNOllw0mE1ilykQO37/tJ1TyEymTHKQ4XLPt4Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=g0kgphLunagNm8busTkLzeDDnLRuPneSs04xxpfmIl+1ayj0z6KQF3TUCAEUj47FnSg7N5OygboeblVwa2uu2byu8XKjPe9/2Je3+PyCfVonKmxS2FGLQaSl/jhn37zlEJnclaPknWMQX6vtAkV+uOyw9KqIT2F724hhvwz4qXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jpO/fPz7; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733221672; x=1764757672;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Z6dsnFNOllw0mE1ilykQO37/tJ1TyEymTHKQ4XLPt4Y=;
  b=jpO/fPz7DRo1JHgC9JLdl0YuNEimIR+T+OuEfB8bBYLzKfZCaJIolVId
   jkoyyiAejDlYKxYMNLlZ8/YMxe0wgOl8AeYgE48P1S1Hc/9qtgIGS3SMy
   e4MoUJcP6ciZGxn/6jNaiWKQlgwxVElQfyQZtSdFIpoywy0HlNrTm9LvJ
   mMmJZj/WTggh6rEv1HG6UQi2zeOjWtZy2l70CHm9u6C4yH5i9IiRq9YOJ
   cAmAfGl8t2F/hDyRvZ8b0TCQKLYTX53wgCw8ZcEDaXnMOfBLfQk1yMVHb
   bkTM0gavWYdE4Pf5hl2zZfmA6yPpCixcI9d6iV8/BzBRGINVo44I3qLj8
   w==;
X-CSE-ConnectionGUID: vHWr8aykQy2guFIdetCCog==
X-CSE-MsgGUID: G8oVmxR2TiWMbJMUQt17CQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="43911812"
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; 
   d="scan'208";a="43911812"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 02:27:51 -0800
X-CSE-ConnectionGUID: xmWmfea/R5+MkzmyewhKvw==
X-CSE-MsgGUID: clOz/IuzSlqq15J//O9vnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; 
   d="scan'208";a="93059499"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 02:27:50 -0800
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 5D79E11F89A;
	Tue,  3 Dec 2024 12:27:47 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1tIQ8B-003ZPE-0z;
	Tue, 03 Dec 2024 12:27:47 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: david@ixit.cz
Subject: [PATCH 1/1] media: ccs: Clean up parsed CCS static data on parse failure
Date: Tue,  3 Dec 2024 12:27:37 +0200
Message-Id: <20241203102737.851076-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ccs_data_parse() releases the allocated in-memory data structure when the
parser fails, but it does not clean up parsed metadata that is there to
help access the actual data. Do that, in order to return the data
structure in a sane state.

Reported-by: David Heidelberg <david@ixit.cz>
Fixes: a6b396f410b1 ("media: ccs: Add CCS static data parser library")
Cc: stable@vger.kernel.org
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-data.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/i2c/ccs/ccs-data.c b/drivers/media/i2c/ccs/ccs-data.c
index 9d42137f4799..29c4fa70f739 100644
--- a/drivers/media/i2c/ccs/ccs-data.c
+++ b/drivers/media/i2c/ccs/ccs-data.c
@@ -974,6 +974,7 @@ int ccs_data_parse(struct ccs_data_container *ccsdata, const void *data,
 
 out_free:
 	kvfree(bin.base);
+	memset(ccsdata, 0, sizeof(*ccsdata);
 
 	return rval;
 }
-- 
2.39.5


