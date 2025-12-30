Return-Path: <linux-media+bounces-49705-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7481FCE9797
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 11:53:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9A1E43036410
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 10:52:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5FDA2BDC28;
	Tue, 30 Dec 2025 10:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jnGszfi+"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CEC82DC320
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 10:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767091945; cv=none; b=oVU/VjCppFcczvB14PlhRdkAAu8RRjEBKHRQAnmj/a3B2FQHHKHgobu3QW8Xrsc62DcQJP6v68oDdenqHnHaBSA6KCTuvqhEN3Jhi1ckgZyiqZW6aU0ccPYdspP15Zrl8zAdo43mdKzInzjtuVPYVxH25oFvsZmsBzinh7VlPu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767091945; c=relaxed/simple;
	bh=vX8m05+I0p2O44XwwUuoO4RPdTGFOCcT7xutx066X+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KS9AnsCoAtIobA95KBlZVzni8fJlFQwE10R32GvoRKftSDBdp3zIBReG1dERRv50vFXto6Qh4RR1PhEyKnz2fvpOMgMsR5WhKwoD0t5MzeCXuvVXYXIK9GK4+CTUUDk2NUGkdmbKff2jAcggkf/pD7BVHJwELa5N8KACR6LIo08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jnGszfi+; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767091943; x=1798627943;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vX8m05+I0p2O44XwwUuoO4RPdTGFOCcT7xutx066X+Q=;
  b=jnGszfi+y/d881D4oSl02Q9+HIYcyjsHLZhrtTtyK48xajTZtcd9S7xN
   m+QzHT2S8bntAFFeerhP8TPvodpSvAfdUn9X0Gkmtp2qRWPPvmQhXuPEk
   FX4BJHjWYZRRKMi8zB1su8TlWxIgNJKDiZNqZtAFm5+aiG1qNEvJU9pz6
   WO13XEqlqwwnGXGKH/l5OG7UsmTlBumpm2gJzU9xKV+f10BKWzh6JYlq3
   LYkFjwqJ2fF8/SSYLP5/Ph9hcu8w1puGhFgIuC1G53WEMgZvC6yGxEPPY
   mkvYgHiIag+yKKdWZ5e/Mf6Vunduw+x6r/1HhzZTyE+rXa9bOQNSIrY+g
   Q==;
X-CSE-ConnectionGUID: egyTa6v+RpyTkYa/K3DwlQ==
X-CSE-MsgGUID: ZAApGShwSjKgPrdn3P+XDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="94148727"
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="94148727"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 02:52:21 -0800
X-CSE-ConnectionGUID: ww4gIGApRfSS/TcwFOVSaQ==
X-CSE-MsgGUID: 8enJRx5eRYyDI356d5RgtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="201186918"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.96])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 02:52:19 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 945D5121E5C;
	Tue, 30 Dec 2025 12:52:23 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vaXKw-0000000FQYe-1Huo;
	Tue, 30 Dec 2025 12:52:22 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: bingbu.cao@linux.intel.com,
	tian.shu.qiu@intel.com,
	antti.laakso@linux.intel.com,
	mehdi.djait@linux.intel.com
Subject: [PATCH v2 10/13] media: ipu6: Obtain unique source pad from remote sub-device
Date: Tue, 30 Dec 2025 12:52:19 +0200
Message-ID: <20251230105222.3676928-11-sakari.ailus@linux.intel.com>
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


