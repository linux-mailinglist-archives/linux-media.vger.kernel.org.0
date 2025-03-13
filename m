Return-Path: <linux-media+bounces-28122-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BFFCA5F06A
	for <lists+linux-media@lfdr.de>; Thu, 13 Mar 2025 11:17:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9376F3B0E59
	for <lists+linux-media@lfdr.de>; Thu, 13 Mar 2025 10:17:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF1CD1FBCA6;
	Thu, 13 Mar 2025 10:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="igCYlQp4"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C731C5D59
	for <linux-media@vger.kernel.org>; Thu, 13 Mar 2025 10:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741861070; cv=none; b=spMJBjyU8fsxWs8qNndaPzQC2WK6SrxEp8gewMV3RXdd6OAHXb2YhsP7QoZL65OIK0szPxiXQLmY/VY5cKURQPwui3aBmKEwCL0dOMYsee/S1qXb+LaDDEYaDe/Yf+VwFPeDgcG25zU6ES8NCJF2bG2n2EHyC1H0+uyClWfNVkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741861070; c=relaxed/simple;
	bh=/pWhupl+YEG+5KAOdMbcX/EeTLmKAEg52Ue3JfoDHuo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FL2mb3NbJasXRPbcXC/HOFnNsmMmWcmaUTG8RNqtggQsc9kiJlM4st+nz4p1lkwFUYGvtNasU+7MIutdmp9/QnVhnhBXYWfTxCkfjrJUsda6QI/Zwl0NhmzQk/fuV3+POKc7C75IRJGvN+HOYIgr3OwWMheA42SSVILuoiJAuVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=igCYlQp4; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741861069; x=1773397069;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=/pWhupl+YEG+5KAOdMbcX/EeTLmKAEg52Ue3JfoDHuo=;
  b=igCYlQp4eIRSrxNStTaxMIWc29TTuu/CwSRsX+AEn97uSS8xo1b5+dKa
   /S3YRrs2MMkQDqD0dXy/jyOTTaN9YOhfZdWmEiwlT7qugLwt45EpnwwVf
   83TpwK6nuQyvMUJxc+qGkDo1LwbahaNE1o+sYJld6zLaHPrLHhytuHwG1
   8+PTuA4NNpBVHpOTZse7SiD0uc2w6bYvoh4NiGDhTXUwK9qKqc0kDJzt6
   mzO68/gc9418wooPaNmnqXnfrMsruMWmEfaoxOdHDVGcN/GPEUbeGiVDx
   qnayFkOxlX6MjDT8CO+tWPWzmUb1WrCgn+MrTI5vc5SlydpwBoPIAasR2
   A==;
X-CSE-ConnectionGUID: gAS3v8oLQIylpczUJNX2ew==
X-CSE-MsgGUID: m1T719jlSW28n2CxEWnmww==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="42700004"
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; 
   d="scan'208";a="42700004"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2025 03:17:48 -0700
X-CSE-ConnectionGUID: raDftaqLR7GRORSwoIDhDg==
X-CSE-MsgGUID: KlYA0RdwTBKANnmjoNXNdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; 
   d="scan'208";a="158070720"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost) ([10.245.81.114])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2025 03:17:46 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Subject: [PATCH v2 0/3]  media: intel/ipu6: minor cleanups
Date: Thu, 13 Mar 2025 11:17:41 +0100
Message-Id: <20250313101744.128564-1-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Few small cleanups.

v1 -> v2: fix coding style in patch 3

Stanislaw Gruszka (3):
  media: intel/ipu6: Remove unused IPU6_BUS_NAME
  media: intel/ipu6: Remove ipu6_buttress_ctrl started field
  media: intel/ipu6: Constify ipu6_buttress_ctrl structure

 drivers/media/pci/intel/ipu6/ipu6-bus.c      | 2 +-
 drivers/media/pci/intel/ipu6/ipu6-bus.h      | 6 ++----
 drivers/media/pci/intel/ipu6/ipu6-buttress.c | 6 ++----
 drivers/media/pci/intel/ipu6/ipu6-buttress.h | 5 ++---
 4 files changed, 7 insertions(+), 12 deletions(-)

-- 
2.34.1


