Return-Path: <linux-media+bounces-50207-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 06DEED019C3
	for <lists+linux-media@lfdr.de>; Thu, 08 Jan 2026 09:43:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C10EA300009D
	for <lists+linux-media@lfdr.de>; Thu,  8 Jan 2026 08:43:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39647381713;
	Thu,  8 Jan 2026 08:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KaW/k6Tr"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9CDA273D8D
	for <linux-media@vger.kernel.org>; Thu,  8 Jan 2026 08:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767860268; cv=none; b=jWdH40r7DsFqa4HDzQCFCRTY9pD71jP2gxsAU4be8ckau9gxJrbDw+CE/d8SJqztx2w9+vokkLQoHMLUhTZjN4HXOHDq3xvgTEbyRs6cvosE3VsRePqVNBGFDOiite7xkzdf1rtQ2zma/iNHMUG3xSePgUP4aO5jaINImz0RQg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767860268; c=relaxed/simple;
	bh=ZvZlK63GIQRZxFh19EcgWrZzvlpqqCjES7pSW2JqP3w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lF+ojSYdEuOuqj1ePNLyQ+GSvvUKwiVs08shJbxlc0YInen2Y5IRqcspNhTPD6Nq8YZtdrMPKmhoL0KGJdg/JUx0um3OcTdaQod+l+4gjpv/uwCavI/hntqcOx7SG1vpiDMp9QxOY8/X6tRMS9WqvGEemFFyQP0yQQNViWIWBLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KaW/k6Tr; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767860260; x=1799396260;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZvZlK63GIQRZxFh19EcgWrZzvlpqqCjES7pSW2JqP3w=;
  b=KaW/k6TrqfWtXQa4AsWd2sPr4IrVEmCrAn/7FbfyXLSjN1kcyLm1+b+V
   l+EYo8YGrsROwqRFXFI1LSxDNUI+ixXl53fldK2JTrztRgnv43/JhR3Qe
   MPED5KHyI9sx+IGZ6qybINHzzlltAzKdF1Z7OlIxLRTilJ9mtaaKRMOVD
   00Qz2E4PfjESMBiVTlWXF1sNZ7bwvK82SEWnkcmX3c7eilh6Amne8XDuS
   bZl3tOQw8UE+QRGJJQgEhhO/LAtT1lXtQiKLUp7StktEUyzb+L6uG0Xk6
   PjiD+Tkfnk98GME5ZkrUMdvqZrRKCGUtJv85Mq19SaXxMfh56v8AO9C+6
   A==;
X-CSE-ConnectionGUID: RqnV/YBkQeCIjEbON8fk8w==
X-CSE-MsgGUID: 7CpvPcqKRrGqyZtuFvcV4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="72869938"
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="72869938"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 00:17:06 -0800
X-CSE-ConnectionGUID: 5SBf69K+QFirtzQXLs3dLw==
X-CSE-MsgGUID: elCpWOEdQYOm7rTpHAVxJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="233842986"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.211])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 00:17:05 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 81999121E99;
	Thu, 08 Jan 2026 10:17:13 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vdlCi-00000002HSt-0xOy;
	Thu, 08 Jan 2026 10:17:12 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: bingbu.cao@linux.intel.com,
	tian.shu.qiu@intel.com,
	antti.laakso@linux.intel.com,
	mehdi.djait@linux.intel.com
Subject: [PATCH v4 11/14] media: ipu6: Obtain unique source pad from remote sub-device
Date: Thu,  8 Jan 2026 10:17:08 +0200
Message-ID: <20260108081712.543704-12-sakari.ailus@linux.intel.com>
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

Obtain unique source pad from a remote sub-device, instead of the first
one. This means that only one link may be active at stream start. There's
no functional change in practice, unless multiple CSI-2 transmitters are
directly connected to the receiver.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-video.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
index 54d861aca008..1d58e321bda7 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
@@ -1204,10 +1204,10 @@ int ipu6_isys_setup_video(struct ipu6_isys_video *av,
 
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


