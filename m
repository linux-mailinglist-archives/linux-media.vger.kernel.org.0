Return-Path: <linux-media+bounces-49708-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D32DCE9785
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 11:52:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B6D7E30074BC
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 10:52:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51AA229D266;
	Tue, 30 Dec 2025 10:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jcpprTrE"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833ED2E1747
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 10:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767091947; cv=none; b=IC9NY7raoxl6imp9unpdAVXum1Btt2dWuCZ9WvJgBUtN0lSIgZ3BwBAR3SkRKI4CCf/vZcoEfh68GGSgWZSc+P1Z4pPGIEBSWnsIZBeNU/AwpTkZnfAlVms0DT3DygpQba5+WSztSsQvPhns5ZFAdMnxgbbWNTAIoku85JLc8hQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767091947; c=relaxed/simple;
	bh=oNqbvdMhedklJpaoH/qcQJPFXf8zQ/3v4j1cEu56h/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=irIK+Zt4TP5l9LQ+a4CxrEUNPSeYbmSGTNohtGCEZfiXx8zIFOYjkxR3QH/2bprhh+FFdKpCeSQJwDUV2LveYJCEDysEwsiy5ZHEAyc3ApPrmA3c7Ywjb2tWsVLl3dBEX5Zli5uXVWeQUlt0edb63+sFXbuL9S43QwSvoKE+RpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jcpprTrE; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767091946; x=1798627946;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oNqbvdMhedklJpaoH/qcQJPFXf8zQ/3v4j1cEu56h/Y=;
  b=jcpprTrExH43d21O1EXUWNbEJQfGP0bx6wr5ApdmsWZuSftIdxl8Ve/p
   x1J66qxTpV1NF5dKU66gHnfA8SUpfdz8xDsB7KCZ+hfH8cuyhT253A9Ul
   sqk+mMbFBOazK4heKfrEYr/MbAtot6QeG/5Rh3pvSWRFHo2/kgpaRw6u2
   N2V4zUL3u6FtV+pKBitaXO9qTEcoQglL9IXCywvchmAcmwyGuD2eDVcN0
   xxKn57AMNGJ4V3jO9XkOf3R1vH4plaFpYezO6bnR+I5r4D0gz7QFKd3j6
   2vYtCBcH4l84M6EtbRqY8cddL85wg35+MdYoHVeBoQEglMEXyRGVYE9Pj
   Q==;
X-CSE-ConnectionGUID: DVVDfd/1TA+806h9uRthhQ==
X-CSE-MsgGUID: bA4pYkwbT0qFDGmZU3NEFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="94148731"
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="94148731"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 02:52:21 -0800
X-CSE-ConnectionGUID: cv83v/SqQGKn4Y63nhKQug==
X-CSE-MsgGUID: uH/7976cSOyhXEkgvXUwFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="201186925"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.96])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 02:52:19 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 91458121E57;
	Tue, 30 Dec 2025 12:52:23 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vaXKw-0000000FQYZ-1Ess;
	Tue, 30 Dec 2025 12:52:22 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: bingbu.cao@linux.intel.com,
	tian.shu.qiu@intel.com,
	antti.laakso@linux.intel.com,
	mehdi.djait@linux.intel.com
Subject: [PATCH v2 09/13] media: ipu6: Obtain remote pad using media_pad_remote_pad_unique()
Date: Tue, 30 Dec 2025 12:52:18 +0200
Message-ID: <20251230105222.3676928-10-sakari.ailus@linux.intel.com>
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


