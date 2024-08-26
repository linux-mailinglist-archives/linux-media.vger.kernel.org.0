Return-Path: <linux-media+bounces-16842-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E5195F733
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 18:54:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3724728280F
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 16:54:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C074D198851;
	Mon, 26 Aug 2024 16:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n0SWsW1g"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 970DE197A9B
	for <linux-media@vger.kernel.org>; Mon, 26 Aug 2024 16:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724691250; cv=none; b=pCs1u+71fVHG2WyU21gqjqYPhjQgEsirqRy7SEGE66CTxd7CIwmPkOQe1yhuq1r+IIDUoN/bv9mqLD3oFcxbAoJf5e0BBfWGD1DA+kfObMdBfwJTmDB/vdC5qkulM/F9CDSGBmdtvGu9oa5UdfiKERCtfOUoSq1JR7YxkQd75Ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724691250; c=relaxed/simple;
	bh=LvArmQnZXiV/9offcQASnBb0M3kGsYTydM6w4NxLWOQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=NOAQDOhQq1XfEl5Tvt3VNOtiTFM393VugdiT3yiSnxOM/f7KElKG2+QmKeFSqlRV/8OXjHe8p6U6TkkqwHnfRY8rJz1HNNUELJK6LfMjdoo0E0p+98xX+sevzSm64DY94JKnbKXWcI29wrcvqjtjHcYyQIUY2YhpsHrB/+cJGfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n0SWsW1g; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724691249; x=1756227249;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=LvArmQnZXiV/9offcQASnBb0M3kGsYTydM6w4NxLWOQ=;
  b=n0SWsW1guIhiuvlz+GRIbQHTndi3L46gb35KTxH3z7uBmDzuueKOeyO4
   YdQepKjBUsP7u9iaxx/z4eEfZE++0FZDcJEKJ2kdfvv7obTRnQ4MV8FQe
   ArwyZVtJxrp/XjAiFqWM/pW/Q5cjB3SWajHUkMtJ4vCJ/nPzpoZlvTUNu
   Iti2vnffP5yhjQLiA1jmK5BsS4WxkWwsmNaLV4VYAX+QA9FvPY6RZQHSA
   lXEGg9lfJXycjRgFT77NMEr5Cq7AezCgFId4igWLTHZjrba10Dkgb7X0X
   aSa9E0I/4GvcRESGc82rIMkSVYp6hmX9K3jIB5tHVwQpeljojaBMPeJW7
   g==;
X-CSE-ConnectionGUID: AsRHP2YYTF6bp2eE2hh/hA==
X-CSE-MsgGUID: 4ji+snUvR5eiYPg1e2mItQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="26923441"
X-IronPort-AV: E=Sophos;i="6.10,178,1719903600"; 
   d="scan'208";a="26923441"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 09:54:08 -0700
X-CSE-ConnectionGUID: 2AKpoP1eRburEKP6d1qjhA==
X-CSE-MsgGUID: SefX8QP2QWKuK3rQLvIB6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,178,1719903600"; 
   d="scan'208";a="62563498"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 09:54:07 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com,
	sumit.semwal@linaro.org,
	christian.koenig@amd.com
Subject: [PATCH 0/2] Split out dma fence array and invalidate media_gt TLBs in PT code
Date: Mon, 26 Aug 2024 09:54:54 -0700
Message-Id: <20240826165456.2491477-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Respin of [1] [2] based on CI and review feedback.

Matt

Matthew Brost (2):
  dma-buf: Split out dma fence array create into alloc and arm
  drm/xe: Invalidate media_gt TLBs in PT code

 drivers/dma-buf/dma-fence-array.c |  19 +++--
 drivers/gpu/drm/xe/xe_pt.c        | 117 ++++++++++++++++++++++++------
 include/linux/dma-fence-array.h   |   9 +--
 3 files changed, 109 insertions(+), 36 deletions(-)

-- 
2.34.1


