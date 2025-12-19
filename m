Return-Path: <linux-media+bounces-49149-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2198ECCF3F5
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 11:00:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2323030656E8
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 09:58:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9E912F5A22;
	Fri, 19 Dec 2025 09:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AHkP0GMw"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 612022F6199
	for <linux-media@vger.kernel.org>; Fri, 19 Dec 2025 09:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766138324; cv=none; b=bDgi8wzMfnhUrsBlZdPE3ndyEJjJOQUix3wk4pPbnsXZFZDrmUSL1Zv7ayUkdS0iYqlqrwUGWvOGaYYre3ajfG20sD5huW9wkIMWCnkeHvXdrZ/+9DLGni3myREFtceP3o+nhBZqY58iyM0I762P0Y9V6zoa5DMocx4LAQv2nmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766138324; c=relaxed/simple;
	bh=vX8m05+I0p2O44XwwUuoO4RPdTGFOCcT7xutx066X+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k3dDDE1UVEIaEBXh7g8qFU2vM9sGboewxCyabgOs2JtKWNmTBJWG3dRqD7gyOjViFIgZrWiwJvcvB7OuOGbXbMFXZ0twSgQDiPQbBhGK4X7hsxgzGgwlKLZ7X488p4+oU7L1yaYLGUbocigLV8+6wS8iUhLVMZGntWqOqG+bGDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AHkP0GMw; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766138321; x=1797674321;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vX8m05+I0p2O44XwwUuoO4RPdTGFOCcT7xutx066X+Q=;
  b=AHkP0GMwhYS2LMww0ALhq/dOZKaF4ut10QXWBiHi/xO5CsOK7+ekQKMK
   brnl13kowctuVV4AmVYPq1J/f3ygWquMQ9itBHTXdQUJUhh/34GeLvGr6
   /QoPQBEPxzPFsrQo6synytsjA13gbUZb1IfWdGSXiQjQZfcLPu6gz9QxM
   xXxXh/JwCDIw7J6Y5DmxPHUUGO96gqi27dwMgKMBhTvSgvJGHASQ/rca7
   MC9TGmBlGcK62Xe1eYfT82c0tLwpI7Fxke3NUOy0qJa8eqZoxEKNR9hN4
   iMqdE18JYT+kZqTPyy51Q3i9wZR/tDhHBgM5J14OZxBO94sIYfFcz0QK4
   A==;
X-CSE-ConnectionGUID: DD+KxfT4SS6vw9DaNQ9cQg==
X-CSE-MsgGUID: N6drEk8VTW+f8itOYGp3PQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="71945164"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="71945164"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 01:58:37 -0800
X-CSE-ConnectionGUID: wWyDwhQzSwOnldOUDbavCg==
X-CSE-MsgGUID: m2/VrByqS1O2mpIYJVZ01g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="197973394"
Received: from rvuia-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.226])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 01:58:36 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 14BB9121DB6;
	Fri, 19 Dec 2025 11:58:31 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vWXFl-0000000BsS5-3GOd;
	Fri, 19 Dec 2025 11:58:29 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: bingbu.cao@linux.intel.com,
	tian.shu.qiu@intel.com,
	antti.laakso@linux.intel.com,
	mehdi.djait@linux.intel.com
Subject: [PATCH 10/13] media: ipu6: Obtain unique source pad from remote sub-device
Date: Fri, 19 Dec 2025 11:58:26 +0200
Message-ID: <20251219095829.2830843-11-sakari.ailus@linux.intel.com>
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


