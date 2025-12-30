Return-Path: <linux-media+bounces-49720-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D1ECACE9BF4
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 14:10:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EE489302F6AC
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 13:10:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E88486331;
	Tue, 30 Dec 2025 13:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wsls3aDf"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F103F1F419F
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 13:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767100213; cv=none; b=jm6XulD874Q2uyiIqc3h1Oa2VZ9ooFQBQXyFOudaSVPzwPBdQ/4U41IdGu3kI4Cf6CDfUugg1FGqgfPwFXW6IdGZZdy/J7QSXtrvVQWAZn8SjJZbmSQE5tnANePzo/YI9/ODWBbQhgOSVFTDWrIFX2g4Phq0klXeQsNnxH2mmKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767100213; c=relaxed/simple;
	bh=vX8m05+I0p2O44XwwUuoO4RPdTGFOCcT7xutx066X+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fa8hPm5Z/nhdyXQW2vZwSP6Tp5iAAJmG7t4WhctcMeYkg6CPz6CnaZXrILYBr4I7Xha773lQBWrjMo361CpiPOMq2MRIIvEzFnPnWsTbhmQe3RPPSEogYHcpC2lWbHVtHc5/7pby0rRFkXSzm5su7MFLFEhxdyc4R1EnijXDhvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wsls3aDf; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767100212; x=1798636212;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vX8m05+I0p2O44XwwUuoO4RPdTGFOCcT7xutx066X+Q=;
  b=Wsls3aDfT/M118P+H5wjXn3lPYKSv6v1N3KIoVyMDwbsf8aXxappazAn
   lr2Uh1r7ZS6p5YBwQCy//MV+7bDIZl6CnvcsLz3VIlLDbnd3Y44Hoe+QL
   13vQQVZgYUlDc+LKdjOz1iDkoHX8yPsX19/RwMz29QWTZUyS+n5qwbpiZ
   PeSsAYULKL2R4HumpbUsaz8KO0gIpUcqmy59L7nXp19NK08dtMOmmke93
   rGsaOUaqtwmvLqyyCgqSP/uqkYFpKiCU+mxMTB+5f0zAV6khAE+uiA31A
   8TYJrLIbXlFDywsAMmn7vlHNHB+fok5pp53dkX8s1AxSas0DDA/MIN3r9
   w==;
X-CSE-ConnectionGUID: JL3RcDkaS4WDnx3galUiIQ==
X-CSE-MsgGUID: fBNa1FsGRTu5uffyFcwYLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="72309257"
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="72309257"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 05:10:12 -0800
X-CSE-ConnectionGUID: QL6YWtEkTsmSf9uJM16zmQ==
X-CSE-MsgGUID: /AKE5dDfSnibfN+Cbqqh3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="231882148"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.96])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 05:10:10 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id A6F24121E5C;
	Tue, 30 Dec 2025 15:10:14 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vaZUL-00000000JcT-1b8i;
	Tue, 30 Dec 2025 15:10:13 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: bingbu.cao@linux.intel.com,
	tian.shu.qiu@intel.com,
	antti.laakso@linux.intel.com,
	mehdi.djait@linux.intel.com
Subject: [PATCH v3 10/13] media: ipu6: Obtain unique source pad from remote sub-device
Date: Tue, 30 Dec 2025 15:10:10 +0200
Message-ID: <20251230131013.75338-11-sakari.ailus@linux.intel.com>
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

Obtain unique source pad from a remote sub-device, instead of the first
one. This means that only one link may be active at stream start. There's
no functional change in practice, unless multiple CSI-2 transmitters are
directly connected to the receiver.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-video.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
index 919b77107cef..fb319d623a11 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
@@ -1205,10 +1205,10 @@ int ipu6_isys_setup_video(struct ipu6_isys_video *av,
 
 	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
 	asd = to_ipu6_isys_subdev(remote_sd);
-	source_pad = media_pad_remote_pad_first(&remote_pad->entity->pads[0]);
-	if (!source_pad) {
+	source_pad = media_pad_remote_pad_unique(&remote_pad->entity->pads[0]);
+	if (IS_ERR(source_pad)) {
 		dev_dbg(dev, "No external source entity\n");
-		return -ENODEV;
+		return PTR_ERR(source_pad);
 	}
 
 	*source_entity = source_pad->entity;
-- 
2.47.3


