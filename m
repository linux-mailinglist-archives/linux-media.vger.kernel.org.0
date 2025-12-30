Return-Path: <linux-media+bounces-49726-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CF10DCE9C03
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 14:11:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 184D2303A089
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 13:10:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37A7D21D3CA;
	Tue, 30 Dec 2025 13:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D75nKaHl"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9019B212FB3
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 13:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767100218; cv=none; b=P92He7zAsUET683OniF4R8wD04GtKcJYp9qailK27+/fOiYDhGGl97uCaeS0h119dL/C+DQYncUvNKeWxRYwtWkXQN2Garm6RTljKNM81n+Jq7Op2zsAXX6SGL90n+CyzDY0GJG73GX7c2Y/LXWF8wdHFDWZgK0gzoiOmKAc3hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767100218; c=relaxed/simple;
	bh=VH6fnBIfX1YSU5usVT2LT63sT5oiCSr7xo7t+FJRFgg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aJs5iZzH7DQTLyHZBHpbEQofrmSPVUWr+Ao2GfUhcPyFMdV/dQDtYWf/7NVBgfgz2i9KhBPF21QAVBYBoeMT77+c41txtYQoqfmcoUmIQKwMkxVUCsCyR+x/4veGEQYvYFHQuoccxSP6RSIPnk9Wn1Vr252GlcUABK9BPKpLtVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D75nKaHl; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767100217; x=1798636217;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VH6fnBIfX1YSU5usVT2LT63sT5oiCSr7xo7t+FJRFgg=;
  b=D75nKaHlXi+ol/0LbQChzee1e6rvlXjNyP2JKH68yE3YlUVQxF1bIPpR
   KQGI41LO23Nj8EybZEZUQ23px4PXZlZVFwQGhTpQX6K1Pme4bt9+xkHWZ
   Pvu6D226w3e6nZXPAEp6vHdgST0PE57OBhmlCdXgAt/jJPMRa1iE1sct4
   bauf9q+DlUGSTLNUsHY2lyhExGuA5CJDl3pBw0oOgh8Ej3+2Gs6vA/jPg
   t4VvMUJpn5Mcj9ohll954MIhLrkiqQwOIlZFEkNl9uBxV+Hy8NFHQY4FO
   kGsQPzHJtBsyHQj0B4rMVB3DAM1YdtI/rk0J568K2+Br0x05bvEC0uJ03
   A==;
X-CSE-ConnectionGUID: Mxa33YvVS/unAYYPQvYh8g==
X-CSE-MsgGUID: qVs1JCIBTmeLvPkJNrVydw==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="72309259"
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="72309259"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 05:10:12 -0800
X-CSE-ConnectionGUID: qsgo9FjTT1y4I7zIpVeRoQ==
X-CSE-MsgGUID: SQ2b0A9PQgaHb1s8U2T1GQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="231882149"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.96])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 05:10:10 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 9D3FA121DE8;
	Tue, 30 Dec 2025 15:10:14 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vaZUL-00000000JcB-1QC3;
	Tue, 30 Dec 2025 15:10:13 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: bingbu.cao@linux.intel.com,
	tian.shu.qiu@intel.com,
	antti.laakso@linux.intel.com,
	mehdi.djait@linux.intel.com
Subject: [PATCH v3 07/13] media: ipu6: Close firmware streams on streaming enable failure
Date: Tue, 30 Dec 2025 15:10:07 +0200
Message-ID: <20251230131013.75338-8-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251230131013.75338-1-sakari.ailus@linux.intel.com>
References: <20251230131013.75338-1-sakari.ailus@linux.intel.com>
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


