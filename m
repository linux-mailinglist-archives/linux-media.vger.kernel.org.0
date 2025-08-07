Return-Path: <linux-media+bounces-39049-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A4FB1D804
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 14:34:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A9ED55665AF
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 12:34:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4969126290;
	Thu,  7 Aug 2025 12:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lhNE06aa"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35299253951
	for <linux-media@vger.kernel.org>; Thu,  7 Aug 2025 12:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754570082; cv=none; b=OvKRr702LU8tR+ijm2SZkD+YJC2VfzPenvUhCwQ32iVcijOUREgg1ho7TdEoef9SQofEQdPerfBB/pqw7JzDLZH5NHUVKPsnrjJ8zjLah3C6V5GxT71+WEoUKBNd7S8j2bipYaruwRirS5LwOwj4SdTYh/BhcgNHypsnC7KnebQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754570082; c=relaxed/simple;
	bh=g7QEMtIWPEBQSZp2vElFlqk97m5Hye+7sOOvrGskdtQ=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=lqICLGmbSr6d09u91O+o+MKGws1QA18n7+uxwWThBgvRXgNTNuo1hHVwzv1OIkaHG0YblzRiNwqa2m4sdfFswJMscla/0WgjBowE+uoNJYtMMsqdFrvs8rjdQAR4yUSntuI+ayEH8Mv2+kb94PFvPAm2CqcT4nk39DtM+Y7Dn9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lhNE06aa; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754570079; x=1786106079;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=g7QEMtIWPEBQSZp2vElFlqk97m5Hye+7sOOvrGskdtQ=;
  b=lhNE06aa2IW7+pJFuI9Xb9RZ0g6iiQH0bRuVovB4piCgGhW1D/5YCx6U
   ph4BGHXjI6GE09Dvut1eL3WAW+zyuM4c0fLACSAHGkjMi+VNZ/jyxn1wQ
   N6fsEpj5QfvaFSTJyIpAMaaa5qnkXDm7RVYjCgmkXpl4J39xPT/qTF9zi
   aaSog6VLlnRAmeK21ptFinVk23QMws1wuqa9rjPA8H+eOg/K1q3U37qcu
   s2p8dtsBAwIA9ZnxOhznyPg2zY0KX6W9jSwvKpGONW7NTE+1lTLEhH+HS
   InRn9jdSWomQTmq7INHM5nL1F9PM4wtI3ROZv74gCk01mvDnxEdcL3IB/
   w==;
X-CSE-ConnectionGUID: sIYhFeUjTu+jsWg7nIn/Hg==
X-CSE-MsgGUID: 1I4yACgKQaOw/HKnTDf6xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="60744237"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="60744237"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 05:34:35 -0700
X-CSE-ConnectionGUID: 1qLFsRsVS4OD1q71ELOLLQ==
X-CSE-MsgGUID: eRYZWEZNSJicDEX+ssZa8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="165058760"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.255])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 05:34:35 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 7D11B11FC4D
	for <linux-media@vger.kernel.org>; Thu,  7 Aug 2025 15:34:32 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1ujzpI-008qq1-1E
	for linux-media@vger.kernel.org;
	Thu, 07 Aug 2025 15:34:32 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Subject: [PATCH 1/1] media: MAINTAINERS: Remove Stanislaw from IVCS and IPU6 reviewers
Date: Thu,  7 Aug 2025 15:34:32 +0300
Message-Id: <20250807123432.2109725-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Stanislaw's e-mail no longer works so remove him from IVSC and IPU6 driver
reviewers.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 MAINTAINERS | 2 --
 1 file changed, 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 24c557ee091d..f80caeeb8768 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12242,7 +12242,6 @@ F:	drivers/media/pci/intel/ipu6/
 INTEL IPU7 INPUT SYSTEM DRIVER
 M:	Sakari Ailus <sakari.ailus@linux.intel.com>
 R:	Bingbu Cao <bingbu.cao@intel.com>
-R:	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media.git
@@ -12537,7 +12536,6 @@ INTEL VISION SENSING CONTROLLER DRIVER
 M:	Sakari Ailus <sakari.ailus@linux.intel.com>
 R:	Bingbu Cao <bingbu.cao@intel.com>
 R:	Lixu Zhang <lixu.zhang@intel.com>
-R:	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media.git
-- 
2.39.5


