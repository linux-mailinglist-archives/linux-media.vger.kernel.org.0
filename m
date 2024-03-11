Return-Path: <linux-media+bounces-6813-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A996877FD0
	for <lists+linux-media@lfdr.de>; Mon, 11 Mar 2024 13:18:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1551BB2215B
	for <lists+linux-media@lfdr.de>; Mon, 11 Mar 2024 12:18:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EFCF3F8C3;
	Mon, 11 Mar 2024 12:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gHaztDSy"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD393C47B
	for <linux-media@vger.kernel.org>; Mon, 11 Mar 2024 12:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710159480; cv=none; b=X4lrW23Fn+XQuuE5zf50qeYT4UuoFm13i8H09OtfzGWDkfU8YLF8iZpXdHqx04TzvbjhsDR40/ghrAgUgVuXnwGT/RycL0WAiRmDqXdxCoMWDQnv/Gvrvh5UgPWPnNp1TeMDeOqyDfuiAuIuRraQdqofdlVNc40iH0pCY2pBQpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710159480; c=relaxed/simple;
	bh=0xx6Q39uhPU5Z+vTCWLPFFkgsVFlOlaoYKY/CLBK2lc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LUlsAGUy2fAhMBKWxczcNEkxkQdbzfjD2uoezXa+u02OqHk+Us2G/8gpRJrlhf7YGjHgyRDBT1bNs09kId9KvuVa2o1ua8OXHYKp4rHLvBb30k22xSL6KtslGUfaRF0Z+gPrSqjaAT/R+FPO9iPiNzVWOez6WjcjSlyOINeKmts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gHaztDSy; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710159478; x=1741695478;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=0xx6Q39uhPU5Z+vTCWLPFFkgsVFlOlaoYKY/CLBK2lc=;
  b=gHaztDSyXKjJjSWM/X0aLeJF8W3TCDHZUuU1AKwkvTIuWMwYIcmGAItf
   t24AXy0PQUsm2B9Eh4Nz+sdSd3TAqSYZxDlakYQ0KINoxoPbwx+LzaFni
   7DG5I5UZQ1+i5RniZG9/bxv/36ONcBMfj30aoxwK2g1AYRp2aMsi+/z5q
   ZimCPohlxgLI63nhiGVwoRPn3ZMMuUJdlC73peujcmtYlzZVs32CO8cRs
   sL2PjWz3mZQeDoufm20vGCpsJjZiwfrN2+evCdten4LtgQKsY4D6CmO8Y
   MGUyGrqHUFPBYU+XYsWe4QtFdmaG1aNF/wEXOOdgmQyxPQyD52pkY6d8C
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="4929919"
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; 
   d="scan'208";a="4929919"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2024 05:17:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; 
   d="scan'208";a="11239420"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2024 05:17:53 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 2E57B11F915;
	Mon, 11 Mar 2024 14:17:51 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1rjebH-005FBA-0V;
	Mon, 11 Mar 2024 14:17:51 +0200
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: jacopo.mondi@ideasonboard.com,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH 0/2] V4L2 async fixes
Date: Mon, 11 Mar 2024 14:17:39 +0200
Message-Id: <20240311121741.1249976-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi folks,

This set fixes a few issues in V4L2 async regarding error paths and uneven
calls to teardown functions. I ended up taking a fresh look at the code
after Alexander posted his patch (message id
20240307142452.3685103-1-alexander.stein@ew.tq-group.com).

Sakari Ailus (2):
  media: v4l: async: Don't set notifier's V4L2 device if registering
    fails
  media: v4l: async: Properly check for a notifier initialised or
    registered

 drivers/media/v4l2-core/v4l2-async.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

-- 
2.39.2


