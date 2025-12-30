Return-Path: <linux-media+bounces-49728-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 015DCCE9C06
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 14:11:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2B5923020CCB
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 13:10:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62F0E221271;
	Tue, 30 Dec 2025 13:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MMIAqAzN"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 383E221767D
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 13:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767100219; cv=none; b=gmeBo9/2Uts7QYpYV0sIKldx4sGYbapHfYKcbItAaA5cGAre0+DJyqSCUHYOpFoGcdWNQhssjr3WfpoayxjcRFPQGyXVTIaBVT/SsthzfVYCYNIIoSrqBOqoqgBX7i25FgVBdu+ox3WAnfmcoAhUf6iQrYCfBgFQzI1TNtftOfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767100219; c=relaxed/simple;
	bh=oNqbvdMhedklJpaoH/qcQJPFXf8zQ/3v4j1cEu56h/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i5F/0pzzdgNaBCj03z++4Z3dGFhdU4xH2IyV3HqgC6Cx/fTa1pWLB2GUmtUF9M2BQypnXrTNy+tyfXJ3GDVQGZH1BtMJ3uP6t1it1Cwv+Tk/7YSNyP3ypNaQDDFA83dWOMLtX1t9T2be9QMMkxM3QlrxNc/m+fjpK6uq0bD2Ox0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MMIAqAzN; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767100219; x=1798636219;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oNqbvdMhedklJpaoH/qcQJPFXf8zQ/3v4j1cEu56h/Y=;
  b=MMIAqAzN5mc5MmnVpUs/49fkTnKJVjCJtj1hcmdxbFpQ43mA5YvYjU3H
   075SAK/erOs8Uv6Uem+2vzH4BaiqGSlUiZ4B/uTKIUT5Be2oFQH2e4MfL
   J2MiAH4SSeCNhGpqGmW8VoqYjiDKkizgXjz90PJ1fZlSb9sX/Ny1Or2WZ
   fM4HoGoZdiOi95gxQtzZMlpJFnCzwnbPev9GqAmtpAoUvwu8WheUxZiuR
   RHw6pNLeN4DC/P/tgE1PQiGNjuWz6g12cik9EV8AoKbNDTckBTPRofrYz
   HrLymyWcyTn3MuuAu1fnF3/FOUsofLKOfZ80YaBfVdHDYxNhstITjXxNB
   g==;
X-CSE-ConnectionGUID: UhMN7+JcSoaCp3Ot6pUPlQ==
X-CSE-MsgGUID: licdGwGGTiC7YiwQanpLnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="72309261"
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="72309261"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 05:10:12 -0800
X-CSE-ConnectionGUID: vh+oQRTfQMmsr70/NrD8ww==
X-CSE-MsgGUID: WnptwYMWS2uYShtLC71iPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="231882155"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.96])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 05:10:10 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id A2B59121E57;
	Tue, 30 Dec 2025 15:10:14 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vaZUL-00000000JcO-1Xkf;
	Tue, 30 Dec 2025 15:10:13 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: bingbu.cao@linux.intel.com,
	tian.shu.qiu@intel.com,
	antti.laakso@linux.intel.com,
	mehdi.djait@linux.intel.com
Subject: [PATCH v3 09/13] media: ipu6: Obtain remote pad using media_pad_remote_pad_unique()
Date: Tue, 30 Dec 2025 15:10:09 +0200
Message-ID: <20251230131013.75338-10-sakari.ailus@linux.intel.com>
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

There's no reason to use media_entity_remote_source_pad_unique() as we
know our pads. Use media_pad_remote_pad_unique() instead.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
index 43a2a16a3c2a..7e539a0c6c92 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
@@ -88,7 +88,7 @@ s64 ipu6_isys_csi2_get_link_freq(struct ipu6_isys_csi2 *csi2)
 	if (!csi2)
 		return -EINVAL;
 
-	src_pad = media_entity_remote_source_pad_unique(&csi2->asd.sd.entity);
+	src_pad = media_pad_remote_pad_unique(&csi2->asd.sd.entity.pads[CSI2_PAD_SINK]);
 	if (IS_ERR(src_pad)) {
 		dev_err(&csi2->isys->adev->auxdev.dev,
 			"can't get source pad of %s (%pe)\n",
-- 
2.47.3


