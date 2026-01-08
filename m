Return-Path: <linux-media+bounces-50202-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9E0D01EE2
	for <lists+linux-media@lfdr.de>; Thu, 08 Jan 2026 10:49:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 877233791788
	for <lists+linux-media@lfdr.de>; Thu,  8 Jan 2026 08:42:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C491D3815DF;
	Thu,  8 Jan 2026 08:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KsTP424U"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B69D329C60
	for <linux-media@vger.kernel.org>; Thu,  8 Jan 2026 08:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767860255; cv=none; b=pm3b/96Z9fs6wror0Tvd2MBI9HsxYkDescGtKosYJURGoNxK/zo7u+WWm2s/3BPzQyQZwTT+KaLHlMquTfsF/lXBWqZuUJoXj66s6C7ef5o/OF8XQ8yQPZIvGYDK0FRtLmjWcmj9HsJRICsvS+7eKyQTj0Ci5XIViqYngv8bnbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767860255; c=relaxed/simple;
	bh=VH6fnBIfX1YSU5usVT2LT63sT5oiCSr7xo7t+FJRFgg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l9v/vxZSNLGtBVl93eos/VLBBcxGHglJdgCtzo95pCQVNSJkbnEpXkkAfJIOxR65anWJmOTBrTPKKxPG/ghwZ5XH2ERTdB8RnurBVMPiA0SN8ExaLIlKVqcOCy6FLz49skrK61ceiEytq8sX8xbalRFlNdyWVukBWc326tiYzrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KsTP424U; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767860250; x=1799396250;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VH6fnBIfX1YSU5usVT2LT63sT5oiCSr7xo7t+FJRFgg=;
  b=KsTP424USHAwawiP3784s9eCX8LHCSZW9+rQOdWKEkXL9SjvaFt9t80q
   ZN4Gt71WIUZkpuu+jdD8SCHYXM4YyWUknjlCzYnLsNT4PN0k1yjflE4WR
   TnhCEC3jFRvyBUEMOCI27uOt4tQqLMe8oUROerpT9ZRYMnMJ/LRET07sC
   HSfLtF/Z9K7DdXnIT1pe3/lhG+5xk47pkcDNjmESM7xZYKgP9L/L3bPNI
   47K79pvLI2mp208yR3nleynvGsCJxiNpig0yFa2gokTS4IP57NQLzPoA9
   n1JyXAyvvSCR4oX4Doy2+6pFkXMYDnGBeEi5cVATvxwnJKxFtJHOGTncz
   g==;
X-CSE-ConnectionGUID: 87M9pI2wS+ivsCTY4MW+OQ==
X-CSE-MsgGUID: Nw3jizNdR5iLQwl/XHFSwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="72869933"
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="72869933"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 00:17:06 -0800
X-CSE-ConnectionGUID: xsNBgARyQL6WFMorBselrA==
X-CSE-MsgGUID: 79SByOF3SCu7Xpx2L5LyPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="233842978"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.211])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 00:17:05 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 746AD121E4A;
	Thu, 08 Jan 2026 10:17:13 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vdlCi-00000002HSZ-0jLf;
	Thu, 08 Jan 2026 10:17:12 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: bingbu.cao@linux.intel.com,
	tian.shu.qiu@intel.com,
	antti.laakso@linux.intel.com,
	mehdi.djait@linux.intel.com
Subject: [PATCH v4 07/14] media: ipu6: Close firmware streams on streaming enable failure
Date: Thu,  8 Jan 2026 10:17:04 +0200
Message-ID: <20260108081712.543704-8-sakari.ailus@linux.intel.com>
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

When enabling streaming fails, the stream is stopped in firmware but not
closed. Do this to release resources on firmware side.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-video.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
index dec8f5ffcfa5..919b77107cef 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
@@ -1066,6 +1066,7 @@ int ipu6_isys_video_set_streaming(struct ipu6_isys_video *av, int state,
 
 out_media_entity_stop_streaming_firmware:
 	stop_streaming_firmware(av);
+	close_streaming_firmware(av);
 
 	return ret;
 }
-- 
2.47.3


