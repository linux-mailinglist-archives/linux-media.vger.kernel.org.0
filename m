Return-Path: <linux-media+bounces-49707-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC2CCE9782
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 11:52:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D06F33007487
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 10:52:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 076A62DC34B;
	Tue, 30 Dec 2025 10:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QYLQEwKh"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE392E11A6
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 10:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767091946; cv=none; b=sVUUPfqXjEAGUGv25bCiWDObKosWpP9WWAhluNlFenMW05BilQdBSzAsAyAA4s3cogiQMrBWamRmvOtCH4NIIxV56QLFHkEn2SUGIznZv4n49u0VePp/ZrPwrA7Lg5N0bLUIRStToBxl/Qniwf+3nCjNfucYsZhl2EHfJkOswHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767091946; c=relaxed/simple;
	bh=VH6fnBIfX1YSU5usVT2LT63sT5oiCSr7xo7t+FJRFgg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rdhYfdKMWEtOGS9S9akbGKbKEDpmgD4DnSJKiTGxofpNHiMu6egukh4DtbbOY2KA2+z6+z5giK4+G+/FhR8nlIifaQ4QEt40OLWecgzCd/P6uPCooEHVYbHL8gjhEf5T43MtzyJ/UTl1VQt8fUvLqTmAuf7yAkrNyUL9naR93J8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QYLQEwKh; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767091945; x=1798627945;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VH6fnBIfX1YSU5usVT2LT63sT5oiCSr7xo7t+FJRFgg=;
  b=QYLQEwKhLpmLueP0w2dZA2HwFqP+o7CF/a72hw5U4hvaM/4wa9LdMWoc
   46DEy7cwAgTergSOi+IKrpKoK/wYHFT6jL6vtZalOhOe+HlxTsEvnbOow
   WXlDegkXg0xLeL89Ag7NV0X0W7M250y5FPkNPJgHmplXd6J+fyS80PvNK
   Ieng/5BdNvt1rjD2Hnz3oOEUgADOOQP13nSt14GIh+DmtGZFH6FKX+KTz
   ZOk1n0OCt/+HSsYimnnZ8PsZg1DbJ+OxghrYeUxtgm/6hvYPJ3gXA+M8E
   AOwcc4AocgTlCACuY2P2sDLcqlc03SiFoIoltiZr9Zzv0tr6swrUY+QWZ
   g==;
X-CSE-ConnectionGUID: pbx5fDhvTIe/p9fSyR/k2Q==
X-CSE-MsgGUID: OmVEjRS/R2OC+lUiOUb5zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="94148729"
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="94148729"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 02:52:21 -0800
X-CSE-ConnectionGUID: 20bJtiMCRGCZYP8rJbzLRA==
X-CSE-MsgGUID: B51lZXYsS4KllfCH634Pzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="201186921"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.96])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 02:52:19 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 8C157121DE8;
	Tue, 30 Dec 2025 12:52:23 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vaXKw-0000000FQYP-18ix;
	Tue, 30 Dec 2025 12:52:22 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: bingbu.cao@linux.intel.com,
	tian.shu.qiu@intel.com,
	antti.laakso@linux.intel.com,
	mehdi.djait@linux.intel.com
Subject: [PATCH v2 07/13] media: ipu6: Close firmware streams on streaming enable failure
Date: Tue, 30 Dec 2025 12:52:16 +0200
Message-ID: <20251230105222.3676928-8-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251230105222.3676928-1-sakari.ailus@linux.intel.com>
References: <20251230105222.3676928-1-sakari.ailus@linux.intel.com>
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


