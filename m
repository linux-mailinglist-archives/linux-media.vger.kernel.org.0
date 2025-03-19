Return-Path: <linux-media+bounces-28479-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30CDFA68C72
	for <lists+linux-media@lfdr.de>; Wed, 19 Mar 2025 13:11:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C2AF53BEDE0
	for <lists+linux-media@lfdr.de>; Wed, 19 Mar 2025 12:10:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10721255255;
	Wed, 19 Mar 2025 12:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="exGxulmC"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A2B254AED
	for <linux-media@vger.kernel.org>; Wed, 19 Mar 2025 12:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742386250; cv=none; b=tNJbB045AWn/bi30EGqHeOfNeWw/e3Jc/MFaI+kVD9MnILb/VuKd9waLNiY3PYx0Halxo+6kizeZUE72XvZmezBzBO+MC7vr12Nbjbs1DzPfI6qI6HxPPKnd/JGSbBFt/PLaRkttDFQ5YLM+If+a4IriWFzghTKHmqdx65NHJfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742386250; c=relaxed/simple;
	bh=egk5hB1kXPu7HwYnheUW6i4e0OFow0W+xziB7evk0tI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=eS6B2sTfg41ZI9+ArkGsLR38xgVlGo89lPaOyiawaf+BDPcHZ/Qi+FPdAmQsRX1v7Ufwb16ZhuRMRvW5HKsdQ8e7QjGqD8PQC8+zzd2nzB+eFm5+OGQjEnwzAZ/3i1WD9XR8HdWUnXv+JlTsVyPscI++4OBwBae/1UVVXBpLRFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=exGxulmC; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742386249; x=1773922249;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=egk5hB1kXPu7HwYnheUW6i4e0OFow0W+xziB7evk0tI=;
  b=exGxulmCVKsgGTN7/TdCgRc9mylNlbxz9xqJHYxBnPOkwwfgk1sJpNyB
   2bTv234c5ruFvc4CNU/WxxCpSHWjhrwltxdUtEpFAmWkd+65cVN3JGAJG
   Vcfn4JeWzde25DZtRVVIbt3UUwR93ZC4ap+C2JVP9w60j5xI8DotUbvMA
   MB2s704qV5+SIDIPg0SB+Y8u9fUs3/c7IwDvYpmpaP1zrc8LOJyUTw695
   QqOoURs7RtOOkrEh6Q/ke9/TiPZAFZcTaE8NJ+uRxBnms4/96YimgKbO+
   ybv7C/zOXFgqkzE5jjJe2fDFlhtsIgjg6SG3pfRRpP2b/zqKQbqVvE4k9
   g==;
X-CSE-ConnectionGUID: rjhglHvJQ6mT75qiwJiQlA==
X-CSE-MsgGUID: 1+1/n8shSzy+osTxYzLpSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11377"; a="53785884"
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; 
   d="scan'208";a="53785884"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2025 05:10:49 -0700
X-CSE-ConnectionGUID: vKNqE35MRS+AufNm6EkPCQ==
X-CSE-MsgGUID: 3lX12Qw+R8m7svdMYtcqEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; 
   d="scan'208";a="123086635"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost) ([10.245.81.118])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2025 05:10:48 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Subject: [PATCH v2 0/5] media: intel/ipu6: Cleanups and small refactor
Date: Wed, 19 Mar 2025 13:10:39 +0100
Message-Id: <20250319121044.113705-1-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some clenaups and abstract buf ready function away from FW interface
to make it reusable with ipu7.

v1 -> v2:
 - spelling fixes
 - remove redundant ()
 - do not change addr to dma_addr in patch 4 - fixes wrong usage of %pad
   reported by CI

Stanislaw Gruszka (5):
  media: intel/ipu6: Add missing new line character in error message
  media: intel/ipu6: Make two functions static
  media: intel/ipu6: Use timestamp value directly
  media: intel/ipu6: Abstract buf ready function
  media: intel/ipu6: Remove unused dev field from ipu6_isys_queue

 .../media/pci/intel/ipu6/ipu6-isys-queue.c    | 45 ++++++++++---------
 .../media/pci/intel/ipu6/ipu6-isys-queue.h    |  5 ---
 2 files changed, 25 insertions(+), 25 deletions(-)

-- 
2.34.1


