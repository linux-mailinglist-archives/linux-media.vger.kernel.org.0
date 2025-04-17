Return-Path: <linux-media+bounces-30422-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4C0A914A6
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 09:01:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3B38E16DE67
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 07:01:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99694215F7C;
	Thu, 17 Apr 2025 07:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SA5bsKGm"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B99AC215040
	for <linux-media@vger.kernel.org>; Thu, 17 Apr 2025 07:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744873311; cv=none; b=Z5u4NDfG/rY0FWiU3Y6Atc4PxVOghSwrNkp58tFuhU3ol/7ZCqr8kBnG7GQxqfSOw3r0j/6oE4ezv2Wz6lb5tViqsKhafRlRQt5d19pLQMxjTMNLJjP+Y4aqL6ebcX9eIN34OrQGnRknGXpN8O5lvyIGPakS91sZ0mHrFdwRM2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744873311; c=relaxed/simple;
	bh=md0WZExddEKH8WWF7C4AhPr7K3wfHmcFCTUA7iey+cc=;
	h=From:To:Subject:Date:Message-Id:MIME-Version:Content-Type; b=dofmt3gLnxkitgoT5I9iZ30GWqFVasHfo0RHIFq188sb8aETSBx8fudkCmL5qRoS6V7KIIHd1l4osw+dLmzCmFqMp29Edswe7IzHeuLouJV/NncsJLULZp2g70FI3lxicwQ4q4w0mmNA4c4uT7S6YhK7/WCXegncoF0RHBXZBiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SA5bsKGm; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744873310; x=1776409310;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=md0WZExddEKH8WWF7C4AhPr7K3wfHmcFCTUA7iey+cc=;
  b=SA5bsKGmwedy//sW6vkQrUSLVNwgDDic0Nmw3tq5Vg4Ex3MtFhXK8AzC
   1+c57oXb7tBnjHXy3n9YpCZ5ygjQQNw3srSmvnn+c4QPI4nbYKwquzYo2
   rYsLGjL4RHQdQbmCYg66OJitmXO3jYD5nyT8cF8q/4f92hVmHUNgui8FR
   HdH0KUvOr2XvjFxTFryjmm4QEwdx4ipF3yJEwCYYMyK7EaVoztWihZYmO
   O0Uq6tY5A4XgGLZbCn0EDG6flgisJfxYzdqgj+pav5ZDfCPxysoJbfIpQ
   T9LXb2/qESO8V91A98/o1Fq0CH2554xLk5CfR6iVWATeXKaBknLFKggwN
   g==;
X-CSE-ConnectionGUID: 9osbZzSQTD+pDbaJcfOIQA==
X-CSE-MsgGUID: pARd1hFyTYWCWGaDOk5OhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="45580978"
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="45580978"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 00:01:49 -0700
X-CSE-ConnectionGUID: EM7Anuh5RaWDynVLkkKdXw==
X-CSE-MsgGUID: PidIRNSES0u6VctP2QfPew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="135883741"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 00:01:48 -0700
Received: from svinhufvud.lan (maa-artisokka.localdomain [192.168.240.50])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 2CDE311F9C2
	for <linux-media@vger.kernel.org>; Thu, 17 Apr 2025 10:01:45 +0300 (EEST)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Subject: [PATCH 0/5] CCS cleanups
Date: Thu, 17 Apr 2025 10:01:39 +0300
Message-Id: <20250417070144.130199-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi folks,

This set includes a few I²C access changes, including the removal of the
I²C retry hack (could be problematic for user space) as well as explicit
access retry after reset.

Sakari Ailus (5):
  media: ccs: Don't complain about missing "clock-frequency" property
  media: ccs: Try a little longer to access the sensor before giving up
  media: ccs: Use read_poll_timeout() in reset polling
  media: ccs: Remove I²C write retry hack
  media: ccs: Don't complain about lack of quirks

 drivers/media/i2c/ccs/ccs-core.c       | 54 +++++++++++---------------
 drivers/media/i2c/ccs/ccs-reg-access.c |  9 +----
 drivers/media/i2c/ccs/ccs.h            |  2 +
 3 files changed, 25 insertions(+), 40 deletions(-)

-- 
2.39.5


