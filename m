Return-Path: <linux-media+bounces-5117-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FEDF8544DC
	for <lists+linux-media@lfdr.de>; Wed, 14 Feb 2024 10:18:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2CA21283983
	for <lists+linux-media@lfdr.de>; Wed, 14 Feb 2024 09:18:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3CE7125BC;
	Wed, 14 Feb 2024 09:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DSgunlxE"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9301310A35
	for <linux-media@vger.kernel.org>; Wed, 14 Feb 2024 09:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707902292; cv=none; b=aFg6UKzs8Q+OcHUIYOa3HqR4pSy5H5Oh1ZkBSeda6CA8DQUIai/PgG21YF7yTe+0FWsX6jmF1DBc732CeMP9d4vkdnllN2A9K+6flULfKmnW4zuZ8CRhN5ivrsJO6YGQidiqkoEP0O5znQgg2piy5bOnlq1yd2uMRXcZ2IXjjbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707902292; c=relaxed/simple;
	bh=dOhCsLh7yVfNpfTWyJKGunc8t7LfAL+lYrcSkF0ZIdM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Epy2r3sF1sOL7sxHVW5kBq1Zp0cT6cwnm1dFS7T/+Zf3EfVzqkFCLPwFrRlZSpSvX0MwS4cedPOAvfijNTXeZLWFRH071FKfzqxC6bm8XfMV5/itHcf9MtGFg/y9EwZw2nFs/LqegjvX7r6iQIEZNq3mX5q9cZIAZrWXCpXrO8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DSgunlxE; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707902290; x=1739438290;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dOhCsLh7yVfNpfTWyJKGunc8t7LfAL+lYrcSkF0ZIdM=;
  b=DSgunlxE4iYjh5hoPklzC/vzzX2ObnZXu3fcOESof5CJ+j14rsF4TacY
   O2Y7w43YLiQy8EoXXWFumoTPqJALiCP3yKCdaJ+hq7koimSASiRn6vbCe
   byt8e19DazPtxs1mjkyJr2SsB9wqQFiZQnk2w+NDxAV1V7C5TL50e7msI
   tPsXsvKtvS2jW+w9vZgBiAblf79YvtABcBQndzn9NaqeckQkBYV35y1py
   53KR+iWKaOQv8OqWGF5H1OSuRgp9vzOSMzXoQmVwioReL6TLwTGx8wjR4
   pEXmkBFxcwU3Bi6w6XGy7h0lbbUcqmDOr6wbpEEeuCFf0WW66CYkvNL8Q
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="2301708"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="2301708"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2024 01:18:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="935605011"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="935605011"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2024 01:18:04 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 5CE2D11FA12;
	Wed, 14 Feb 2024 11:17:55 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Hans de Goede <hdegoede@redhat.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Subject: [PATCH v3 1/5] media: ipu-bridge: Add ov01a10 in Dell XPS 9315
Date: Wed, 14 Feb 2024 11:17:50 +0200
Message-Id: <20240214091754.399340-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240214091754.399340-1-sakari.ailus@linux.intel.com>
References: <20240214091754.399340-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Omnivision ov01a10 sensor used in Dell XPS 9315, and use the driver
default frequency.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index f980e3125a7b..b2cf80d62ba2 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -60,6 +60,8 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	IPU_SENSOR_CONFIG("OVTIDB10", 1, 560000000),
 	/* GalaxyCore GC0310 */
 	IPU_SENSOR_CONFIG("INT0310", 0),
+	/* Omnivision ov01a10 */
+	IPU_SENSOR_CONFIG("OVTI01A0", 1, 400000000),
 };
 
 static const struct ipu_property_names prop_names = {
-- 
2.39.2


