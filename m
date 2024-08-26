Return-Path: <linux-media+bounces-16845-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16CC495F754
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 19:01:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C60AC282F24
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 17:01:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3E8D198A1B;
	Mon, 26 Aug 2024 17:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LRDZ/nE0"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20DAA18891B
	for <linux-media@vger.kernel.org>; Mon, 26 Aug 2024 17:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724691652; cv=none; b=ucFOJ51E4xLzesXZuKdugoEMBFwqMjLrXJD5Pzsj7Lsb1/ryN9NBwYXkSjKV4i7CQNHn7EClbFfvIHbkNuIsp7xHYol+8ebtWfAxhWA8QuagtCEDnOEQORhAbIATLIajjpq8b5zR4KIll60sqsFdTVZ5ogWhryr1A1yfuhQswlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724691652; c=relaxed/simple;
	bh=2m7gLVc40hKZK9gXAV0BKvSP+20Bds0cGQ5HurMwdd8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=cEFf7i0T72etvBpE4fUYVx48gnsdGJUFJ3mxmyUq0k0kdNRtocWFhMIXOgV1QsNqUu/A/zkiVK3y3tauO2ir13XyhGci01wa9by45jct/vCe22q2gB9DntyF+BdAKOrHHm0+KQS9v0bs0J0sPBQIo7nsdCBFuOjj2jLoV17kwIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LRDZ/nE0; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724691650; x=1756227650;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=2m7gLVc40hKZK9gXAV0BKvSP+20Bds0cGQ5HurMwdd8=;
  b=LRDZ/nE0TQo8R7K8xGTLMz27rmLc9J8/5NynDasAR3vw6jeCGtYT9NNr
   dcvoA52AE3k79cvfjnDS9vhIkZXRBOEoLR+5WS60EZ/s3+C47AavERssw
   E5SrcgOh9Aqou0uPPZUk+YVhRpqRnIJbdQZeIr+pY6bhKFu/BVncYlxjf
   GWvjbeL9vMGsWDbrUZo2Tz4mL0y7kw1ONcUB4D5Wb5zor/qWmS5tQCT5m
   ozYUXYsHPwTn89GgCwchD2uQoWjpEknva1kQ3+YjpEW8ZYRRWmCK4L2JX
   jEbj2+GJwyeBUqy5jeczUnEgfSnpbocZ2PwoDprBr6NwuuFKU7vYfOkL0
   Q==;
X-CSE-ConnectionGUID: LrdZTBOfTFewuXxLgiXaew==
X-CSE-MsgGUID: OOoT7N5lRWKy46Kgko0ESg==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="22997991"
X-IronPort-AV: E=Sophos;i="6.10,178,1719903600"; 
   d="scan'208";a="22997991"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 10:00:50 -0700
X-CSE-ConnectionGUID: UNkgGQhJQGSon3ON/q/2PA==
X-CSE-MsgGUID: yVOB4ODqQWmFPaCCRi2Pvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,178,1719903600"; 
   d="scan'208";a="62247116"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 10:00:49 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com,
	sumit.semwal@linaro.org,
	christian.koenig@amd.com
Subject: [PATCH v2 0/2] Split out dma fence array and invalidate media_gt TLBs in PT code
Date: Mon, 26 Aug 2024 10:01:42 -0700
Message-Id: <20240826170144.2492062-1-matthew.brost@intel.com>
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

v2:
 - Send correct code

Matt

Matthew Brost (2):
  dma-buf: Split out dma fence array create into alloc and arm functions
  drm/xe: Invalidate media_gt TLBs in PT code

 drivers/dma-buf/dma-fence-array.c |  78 ++++++++++++++------
 drivers/gpu/drm/xe/xe_pt.c        | 117 ++++++++++++++++++++++++------
 include/linux/dma-fence-array.h   |   6 ++
 3 files changed, 159 insertions(+), 42 deletions(-)

-- 
2.34.1


