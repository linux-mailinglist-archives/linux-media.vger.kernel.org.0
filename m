Return-Path: <linux-media+bounces-24841-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00588A13A12
	for <lists+linux-media@lfdr.de>; Thu, 16 Jan 2025 13:41:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 201B1166DEF
	for <lists+linux-media@lfdr.de>; Thu, 16 Jan 2025 12:41:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F07171DE892;
	Thu, 16 Jan 2025 12:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GlBnsPPz"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A393519259A
	for <linux-media@vger.kernel.org>; Thu, 16 Jan 2025 12:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737031286; cv=none; b=cWR/yEi6J2QBOYurppKR5RF54SrrmEo6Bz6JnTyVTQ8u3RCS9wHj2IKR0De2bPjAIW5738yRx59W5n28oF3oAyYBYAdGjrEmvHIVWSW+AIyh160HX375qTnbEbHJqKp/VhaFJhzUQ9m3y6CfcAFkrwJCtR4dtFQl8mLlBxl+7Us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737031286; c=relaxed/simple;
	bh=SZoOQUKwQqiTLcZ26edgdxKQrZcQrPcVo/EavtdkLM4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=AI6SpXrPgcTJwnuDFN25Liwg4FKvtv8UAQ80gO5GGDupY80T46k+Iv+LZjOZc5qKY0iCUb2YYyfZ0EnHeU/wO/xoQ93LXCkQEKuyZjT03DW2MvkFCVcl3txWWlUX3CTdZypMlFSWu57f27pWT3Zqo4ZVFJ5zOfwrhxaLx8CPQh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GlBnsPPz; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737031284; x=1768567284;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=SZoOQUKwQqiTLcZ26edgdxKQrZcQrPcVo/EavtdkLM4=;
  b=GlBnsPPzQaQwlw3OFeJCYztma9dpkiGZ2GrFa1DjagEYXZpR4AQpu5Tk
   418OuoYBwdZzboZIKp5TQRTV4uxGjEcoH7vY/PkpEX5zWPTeMMbTjYVVr
   9QzZzFdF0mSTBps2W+aiJchprfu4D13IMLlAtfzvxAa6qOAvOUsYzqsKD
   zWupMPJkcqUvCfStPJ3ZWJ2rmrKTz7kPI2F8M33aQM8mJgUKwBt1N1LZ7
   by+fBvSpcREZNbj2qCQe6by8MrLLNE6LKdZ7mkV+Y9SqIdvIPpky2Gwld
   divLF+alfFqHELQsur09mQy8bIx5/dWeugIbBlABDLjcpkeNpch7VuaIr
   Q==;
X-CSE-ConnectionGUID: evGBRfiBTU+rtchemrJPIg==
X-CSE-MsgGUID: q7V5/b/BQhW3aK5+XHEs1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="37568953"
X-IronPort-AV: E=Sophos;i="6.13,209,1732608000"; 
   d="scan'208";a="37568953"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2025 04:41:24 -0800
X-CSE-ConnectionGUID: BFTn8BY3SJqBPLvPp4xbVA==
X-CSE-MsgGUID: zVpPjYxrTiypwgc2Dythog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,209,1732608000"; 
   d="scan'208";a="106025355"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2025 04:41:23 -0800
Received: from svinhufvud.intel.com (maa-artisokka.localdomain [192.168.240.50])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 0EEAF11F944;
	Thu, 16 Jan 2025 14:41:18 +0200 (EET)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Tianshu Qiu <tian.shu.qiu@intel.com>
Subject: [PATCH 0/4] Camera sensor driver PM fixes
Date: Thu, 16 Jan 2025 14:41:14 +0200
Message-Id: <20250116124118.42130-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello everyone,

Here are a few patches to fix (runtime) PM handling in the example sensor
drivers. These should probably be backported but they don't seem to
backport very far without conflicts. As these are almost all on error
paths, I'm not sure how much effort it makes sense to put on this as
no-one has reported issues in the past either.

Sakari Ailus (4):
  media: i2c: ccs: Set the device's runtime PM status correctly in
    remove
  media: i2c: ccs: Set the device's runtime PM status correctly in probe
  media: i2c: imx219: Rectify runtime PM handling in probe and remove
  media: i2c: imx319: Rectify runtime PM handling probe and remove

 drivers/media/i2c/ccs/ccs-core.c |  6 ++++--
 drivers/media/i2c/imx219.c       | 13 ++++++++-----
 drivers/media/i2c/imx319.c       |  9 ++++++---
 3 files changed, 18 insertions(+), 10 deletions(-)


base-commit: 73ea5f5031499252f43ad046de42a9c6efea81b6
-- 
2.39.5


