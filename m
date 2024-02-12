Return-Path: <linux-media+bounces-4963-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 253B8850FA1
	for <lists+linux-media@lfdr.de>; Mon, 12 Feb 2024 10:19:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 58E3C1C20F37
	for <lists+linux-media@lfdr.de>; Mon, 12 Feb 2024 09:19:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC60210A05;
	Mon, 12 Feb 2024 09:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mc8HkeT3"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA9E5101C2
	for <linux-media@vger.kernel.org>; Mon, 12 Feb 2024 09:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707729566; cv=none; b=iEvPrNruSD7UWZxY/4sCanhwMM7+jH7RTsBfdpQjZYhYCtPV+X89Lj3JB0ZKBylkA97S3/mUePeerIeM3xtk/1kMEYCZys+IjMgKcQIVOJ2XfXJYNtOxmKJUeEJ5EQykFgvOKFtRSVdSHylRDlHAx2kfjb4hmeiY8P7PKiXgDGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707729566; c=relaxed/simple;
	bh=sDVDBilUG7U3nkLDJpSYvx/9/Y91MsoRi0MTLRqfWCY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZGlQHJEqW8LrJgjreNaBbYT+XfqLH0rGUkkXZ6BZQtXXr1Djr4lWXp48efJ/Mgh/acFwENwk7Yz4wnn8o+1vOzHg8EGfLMcBdVACE+8mz75/fOUSzQ7iN53f8hcYOK/ivNs9hi9s501n4U8B3PqEBI7Idwxm4wNRkOjqdna1LoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mc8HkeT3; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707729565; x=1739265565;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sDVDBilUG7U3nkLDJpSYvx/9/Y91MsoRi0MTLRqfWCY=;
  b=Mc8HkeT33hoNJjGj/URbPAwpE2M8hIrs3K/TVL3uHnYBB7ecWkBnEEM7
   jAjRZhg5jGZvw1snJU53iX3/sjbfZG/obzjc9OK7kFQDO4c+H9HdFlKQ8
   0aHAHOh7rFSMPG0A8vF3zifk/a2J7EFa8hO/LgU6pxesW2+JgmlwSoQjU
   CTiqcL1b4X8Jy5vLUYrbqy0rmrvveSvpsBXy3eTsPsFfwTPCozwFxpy3x
   Xhoa1ZNbnLMeEY9Bz1li56Vd8wje5iu+4t2zDFZzMijHSq6002cq/w2i1
   cPfsIUeDuL29jTJ9TdCmw9haBO36Y9zkeMqdjj9sC9EgGlZcN88djU8ex
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10981"; a="5533292"
X-IronPort-AV: E=Sophos;i="6.05,262,1701158400"; 
   d="scan'208";a="5533292"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2024 01:19:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,262,1701158400"; 
   d="scan'208";a="2739965"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2024 01:19:21 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 7048B11F9DB;
	Mon, 12 Feb 2024 11:19:18 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Hans de Goede <hdegoede@redhat.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Subject: [PATCH 1/2] media: ipu-bridge: Add ov01a10 in Dell XPS 9315
Date: Mon, 12 Feb 2024 11:19:16 +0200
Message-Id: <20240212091917.342715-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240212091917.342715-1-sakari.ailus@linux.intel.com>
References: <20240212091917.342715-1-sakari.ailus@linux.intel.com>
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


