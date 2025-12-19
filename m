Return-Path: <linux-media+bounces-49147-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CD98CCCF3EC
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 10:59:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E9E61305D1D0
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 09:58:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C7E82F7444;
	Fri, 19 Dec 2025 09:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NwhLyZSp"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2664A2F5A25
	for <linux-media@vger.kernel.org>; Fri, 19 Dec 2025 09:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766138322; cv=none; b=d5i4TZ0enJHi1om0FJIfb2bdv0Q5igvvIlvV6xqyBvTFRNGIFTSUIKOmIuw1SRv9VrFblH4uR7RmfjhxCdCssPkB+NqJvd8BLk8/poj/3KLgHKrrroNcyTjE57gFLgp75CCcAwBHxIqQtWVj09iOdTeQ/kSX8GSVMqB1mxtIeF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766138322; c=relaxed/simple;
	bh=oNqbvdMhedklJpaoH/qcQJPFXf8zQ/3v4j1cEu56h/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cQVpEQopXZ4CX4yqBQQgDYTcXermleNV26IcpG7MGlAfv+x4Tzxa2z42IFQJZcC1Ydl/Gz06FCuZBoQIkNI6BQAORhJAnw4WI3Mw4hfhijc8cTFC7TrsOH2lDQPrup6dnWn9LcyMXo9LltK55G0A9k8lS6iQvBwvXmDbg8wYg+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NwhLyZSp; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766138321; x=1797674321;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oNqbvdMhedklJpaoH/qcQJPFXf8zQ/3v4j1cEu56h/Y=;
  b=NwhLyZSplzgQnoL4cXk0IkvYMDFV8wv4CjyAlnNAFTDH7cxbfhD+ANz+
   UGV8VmdGMTovO84Cfvt/BhOQ+CBJEEkXvH0E5E0maNCIOMH4G4ZTFtTnf
   yWdhshXSm+jctV7NIdj+8zoZvJK+vFe2UQLDMcEzS8IrNIGJqpf00bU9k
   8uP7qrFSJQglU8Isc+7ToppC3bZsQLeAVl8QXwJDOuFIp7S34owKtZE5u
   J+Dx6kMrQsfvVIXeBU98y16VgKOev1QIorxrpOpvXr9IidLpJNt00V78W
   qh88UMMeFOrolJdbjW9DYVXhmIhLq4dkmYYf0qzWul1ZJzIFmz0cgsIXl
   A==;
X-CSE-ConnectionGUID: aeYzDAP6QiOPazgSc2nTcg==
X-CSE-MsgGUID: cjvWWOkYRmuXfOV0lfnkwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="71945162"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="71945162"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 01:58:37 -0800
X-CSE-ConnectionGUID: ocU3rUZxT8OPczg5mfqBsQ==
X-CSE-MsgGUID: Dkl0cQQTRfC8PhfL3Nyb5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="197973390"
Received: from rvuia-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.226])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 01:58:36 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 121E3121DB5;
	Fri, 19 Dec 2025 11:58:31 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vWXFl-0000000BsS1-3DS8;
	Fri, 19 Dec 2025 11:58:29 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: bingbu.cao@linux.intel.com,
	tian.shu.qiu@intel.com,
	antti.laakso@linux.intel.com,
	mehdi.djait@linux.intel.com
Subject: [PATCH 09/13] media: ipu6: Obtain remote pad using media_pad_remote_pad_unique()
Date: Fri, 19 Dec 2025 11:58:25 +0200
Message-ID: <20251219095829.2830843-10-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251219095829.2830843-1-sakari.ailus@linux.intel.com>
References: <20251219095829.2830843-1-sakari.ailus@linux.intel.com>
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


