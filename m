Return-Path: <linux-media+bounces-15412-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DAF493EE2F
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 09:13:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 340411C2094A
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 07:13:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C61A012A16D;
	Mon, 29 Jul 2024 07:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AjDappKg"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2089823DD;
	Mon, 29 Jul 2024 07:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722237082; cv=none; b=o1qsyb3/BtY6bsLSxrGTakXOSWXGhqzkhsT6i071al3TAK/d41/pnEVl5gEtuDqK6lmenhWd6CnuCGjVtjgZUm9irG9l1oFKinDQfVJ5OM1saZEiZI7Mhjj8cN2bELfjixpR4SxPclXHp3C94jo2AX5lKAzwOnLyaYobv7VQhl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722237082; c=relaxed/simple;
	bh=YILeD9rMP39z9Cqr5NMPsdNVhoIh4i+Ld6gEDp0GxYg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iRuFPt5A3KqrVMDTbgoe7bCNRf1u5ccMz88XH2dA31GeeoArTRn86QmS5gkT1RiA2GpxiIUG6wCkjYjZmCw2yX/g6WtPXw5NUr8GvodJUrSQ9EvCWDLpyeszoO2ydSUrMPmzjIT8l/BgYw6eDrjG+Xg4B6qWvueXUj+ITa8R+1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AjDappKg; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722237080; x=1753773080;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YILeD9rMP39z9Cqr5NMPsdNVhoIh4i+Ld6gEDp0GxYg=;
  b=AjDappKgvDYX+a25PxjeXwERlSioHLrBYdhuRKOkbTpqhwE7ZZi4NdSY
   enmBsWKGNIJAV+RnYOrpefabQ96NNbNM5VsFIDVscEhLv1Hy6acOOVd7W
   ZUppAKHBybiAKPJuEBacrjFCXbADWcviPLdxJL9unvSSWkjoCIun0ebJJ
   eOomt1AW9NRELmOqORzAun6lBfC5xPjj3E+oQvtyPbuKl6AFC3vDxFXHN
   cjj/oYZtbb1Yvo1mP+MZCnxISHhAHObh3L1RMb7DJ5TtQ05+zybtRWH/i
   CwKYrWID5GwqqluCbC/DdPFJkHqMDbGSw3PIcongdYp8NtzIhR74LUVPt
   A==;
X-CSE-ConnectionGUID: W31kJK7tQ8ee/p//RsUl9g==
X-CSE-MsgGUID: 7u65gfJ5QlSpAVSppNynLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11147"; a="31365721"
X-IronPort-AV: E=Sophos;i="6.09,245,1716274800"; 
   d="scan'208";a="31365721"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2024 00:10:41 -0700
X-CSE-ConnectionGUID: NoM92jOiQXSuluOiTu7NUQ==
X-CSE-MsgGUID: 49jZm+xwSyyvZiIRl12YcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,245,1716274800"; 
   d="scan'208";a="58729895"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2024 00:10:40 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 6A50B11F8A8;
	Mon, 29 Jul 2024 10:10:36 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1sYKWi-00Fq8n-1G;
	Mon, 29 Jul 2024 10:10:36 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Andreas Helbech Kleist <andreaskleist@gmail.com>
Subject: [PATCH 1/1] media: ipu6: Depend on AUXILIARY_BUS
Date: Mon, 29 Jul 2024 10:10:26 +0300
Message-Id: <20240729071026.3775341-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <202407161833.7BEFXejx-lkp@intel.com>
References: <202407161833.7BEFXejx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Auxiliary bus is optional, it needs to be selected by its users. Just do
that.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202407161833.7BEFXejx-lkp@intel.com/
Fixes: c70281cc83d6 ("media: intel/ipu6: add Kconfig and Makefile")
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/pci/intel/ipu6/Kconfig b/drivers/media/pci/intel/ipu6/Kconfig
index b7ab24b89836..c5389005dc37 100644
--- a/drivers/media/pci/intel/ipu6/Kconfig
+++ b/drivers/media/pci/intel/ipu6/Kconfig
@@ -10,6 +10,7 @@ config VIDEO_INTEL_IPU6
 	select MEDIA_CONTROLLER
 	select VIDEOBUF2_DMA_CONTIG
 	select V4L2_FWNODE
+	select AUXILIARY_BUS
 	help
 	  This is the 6th Gen Intel Image Processing Unit, found in Intel SoCs
 	  and used for capturing images and video from camera sensors.
-- 
2.39.2


