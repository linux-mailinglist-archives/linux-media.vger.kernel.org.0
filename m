Return-Path: <linux-media+bounces-29021-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A3ECA75F2A
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 09:02:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C4FB1167D5A
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 07:02:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 957551BD00C;
	Mon, 31 Mar 2025 07:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kdlUrIdJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87FEC19CCFA;
	Mon, 31 Mar 2025 07:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743404538; cv=none; b=DN1CpkhgglzQfmIHfYY+2iYIbu9YWyfa/097GTUGqCIrItnAyNfUa0txH03abGa9o0PoD3/k9D17e2OMdK4ybzpuTdZ8vRkusM7UZVIa8reOE+ge/Hji7rTm2dor/DPldABJG1sT1zlbkyR080iNozf9FH7kSDMCgVupDKN/NQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743404538; c=relaxed/simple;
	bh=QZUWgig6ECiNyC1biPgDIk1sxNX13g+iWsLFUbwMDY0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QJ75tuL2vR4YZhHbudBx6rvHgM3qqJYkOJLGkjA2/Yhk06rCkDpJA3b55Rc1AVD5olpjkV6kX8TzCCQqp/7Sie2CBxiwKsgkxEa++SGM0VWrHAk/nnYQOam0EahNh4kwB+DOmDmhPOSn/D1AzxR26aHRjut2hEE4NcgSXOg4rdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kdlUrIdJ; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743404537; x=1774940537;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=QZUWgig6ECiNyC1biPgDIk1sxNX13g+iWsLFUbwMDY0=;
  b=kdlUrIdJnwiHuSwykSBRQ+LGILtPRMvcyYEykEoAVSw4L0+yWVWEEnqt
   mi0KW995P61ba77gKn7XalPxO+on8kTruUX5zddS5+PydPufoK3rHxfCS
   X5Fccwxhrk403G/H9l5LqQinb8MAZP2nH4hzkNgHFNm5vmu+kdsGBvlKP
   4d+VJiJDVerDC+l1nnKQ3cmEUHlj9tk7xgcekUnru4FnowAiobzU4Db0v
   4kDfbp6uULOEAL5KSCbnT1E8uXt75Y5PRHx9vbRYdSLojlaD5ZvKisX3a
   RwTwdW5LJfIOcml3xhzpXI5PQ4ROExjdgJaShWFtl/cOseGvcwJIU/LPN
   Q==;
X-CSE-ConnectionGUID: 91HDqZGJTi6wZxj3z7W+kA==
X-CSE-MsgGUID: MW/oe54jTJqxgXnN1WKolA==
X-IronPort-AV: E=McAfee;i="6700,10204,11389"; a="56058070"
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; 
   d="scan'208";a="56058070"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 00:02:12 -0700
X-CSE-ConnectionGUID: boewxL5nQXO8bkdk0EM61g==
X-CSE-MsgGUID: bqgp5GgJTWqBVsFXVPsZUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; 
   d="scan'208";a="131104449"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa004.fm.intel.com with ESMTP; 31 Mar 2025 00:02:03 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 2A57C1B4; Mon, 31 Mar 2025 10:02:02 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] media: i2c: ds90ub9x3: Remove unneeded of_gpio_n_cells assignment
Date: Mon, 31 Mar 2025 10:02:00 +0300
Message-ID: <20250331070200.3985562-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The default for of_gpio_n_cells is 2, no need to assign the same
in the user.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/media/i2c/ds90ub913.c | 1 -
 drivers/media/i2c/ds90ub953.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/media/i2c/ds90ub913.c b/drivers/media/i2c/ds90ub913.c
index fd2d2d5272bf..834df8d508e6 100644
--- a/drivers/media/i2c/ds90ub913.c
+++ b/drivers/media/i2c/ds90ub913.c
@@ -216,7 +216,6 @@ static int ub913_gpiochip_probe(struct ub913_data *priv)
 	gc->direction_output = ub913_gpio_direction_out;
 	gc->set = ub913_gpio_set;
 	gc->of_xlate = ub913_gpio_of_xlate;
-	gc->of_gpio_n_cells = 2;
 
 	ret = gpiochip_add_data(gc, priv);
 	if (ret) {
diff --git a/drivers/media/i2c/ds90ub953.c b/drivers/media/i2c/ds90ub953.c
index 46569381b332..1cd5ac7157e4 100644
--- a/drivers/media/i2c/ds90ub953.c
+++ b/drivers/media/i2c/ds90ub953.c
@@ -420,7 +420,6 @@ static int ub953_gpiochip_probe(struct ub953_data *priv)
 	gc->get = ub953_gpio_get;
 	gc->set = ub953_gpio_set;
 	gc->of_xlate = ub953_gpio_of_xlate;
-	gc->of_gpio_n_cells = 2;
 
 	ret = gpiochip_add_data(gc, priv);
 	if (ret) {
-- 
2.47.2


