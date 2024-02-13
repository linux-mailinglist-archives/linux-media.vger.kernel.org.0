Return-Path: <linux-media+bounces-5068-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A199985315E
	for <lists+linux-media@lfdr.de>; Tue, 13 Feb 2024 14:08:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D39841C22D3C
	for <lists+linux-media@lfdr.de>; Tue, 13 Feb 2024 13:08:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BA5151028;
	Tue, 13 Feb 2024 13:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bi8eVLqG"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EDC950A6F
	for <linux-media@vger.kernel.org>; Tue, 13 Feb 2024 13:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707829714; cv=none; b=mUF9oPX1CzzlP88yO5vNHz+Mh69R/XLhduDEL+d895iNUvYI/a7lp6hb0upxffS3Kej6LMPAeGqmCookyPVhVG5nwKlme0j64vaU/9j6UAcyH97VNKGAYI2J88kYObEok1a31mjbTzYdFcMrIlUyx7vzTm7JF0PPi+6oFhgBqqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707829714; c=relaxed/simple;
	bh=dOhCsLh7yVfNpfTWyJKGunc8t7LfAL+lYrcSkF0ZIdM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mOFGqm6hi/0NOTUw623bf68+8zKqRMPk+0XyEMdIlcyQaMW1vm9mkt1PX8+9Sbyf2xPuhM2WAA6dxWpgbJ2QPWhN+aQaFSbDU7nlsJwY7Yxwy6jDrhHAuvzUz/j9ZmArPbn8TAxeDyZswfeuCcwpn5vICeZM/Hm0Ef+eRMapUQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bi8eVLqG; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707829713; x=1739365713;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dOhCsLh7yVfNpfTWyJKGunc8t7LfAL+lYrcSkF0ZIdM=;
  b=bi8eVLqGiW017ywTU4LItFpjhvkpLRQn/AGKE88vsNokI550/Az5vUuQ
   sU7nD0oM8qyR+J31UqzP0dSSsIUTqNYMit/xRiuU6FZYmidhkh/29b2O/
   KKG+01kxx8daR133tNnk5gxHMEmZfKfUkWhImYqvTGcyZNFGfx0fezuwU
   Qu6hcit3Cub1LahIHgmSPJ/09twRfH7oNgAJ3QQbmP6f1+ZLU23vnNHAR
   AfSUP0kP+5pkfN5K7P+iuoDsH+zFHJuvcwixp304C1qpt92SrRrKkiqRt
   fHmD99NS1S6/r3qQ1OZoTUPbsDjirISev7mRVb2pb2D9YzB7TKwfVzofB
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="1739940"
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; 
   d="scan'208";a="1739940"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 05:08:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; 
   d="scan'208";a="26061687"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 05:08:20 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 2AE1E11F855;
	Tue, 13 Feb 2024 15:08:17 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Hans de Goede <hdegoede@redhat.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Subject: [PATCH v2 1/4] media: ipu-bridge: Add ov01a10 in Dell XPS 9315
Date: Tue, 13 Feb 2024 15:08:12 +0200
Message-Id: <20240213130815.382792-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240213130815.382792-1-sakari.ailus@linux.intel.com>
References: <20240213130815.382792-1-sakari.ailus@linux.intel.com>
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


