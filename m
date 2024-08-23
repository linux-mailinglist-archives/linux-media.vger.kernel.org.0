Return-Path: <linux-media+bounces-16626-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D57EF95C467
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2024 06:53:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 822992846FA
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2024 04:53:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6A8844C76;
	Fri, 23 Aug 2024 04:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KBuQJzG8"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29B0C21345
	for <linux-media@vger.kernel.org>; Fri, 23 Aug 2024 04:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724388830; cv=none; b=Aipg8RgrI+VqdGbXRHL8gZ5soH/yRwgyY4SVhQAYUlCUwbW2ORrrMbZYq9V8gmRJfnpF/J5sEsNn5baGrChPHOI0O5qdnqHZJcxTCBvKuW+ZREjHM1IIzi5rVxmd7ba/nNWlNCy0f/XsC596V7tJ3EHhrgRzR+8v60RIWMRKjro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724388830; c=relaxed/simple;
	bh=d9L7/lV4Kt9lym5oQQscqo5CWq7fOrsysd5To5snw/s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=FGY8ffM1RVVX/+hpj12JORadhA+p0CNO1YWW9nOO1SubP7hnQnF29vasiy2PWoHrTxVgJps8D5SfjKHWl2NVQmirS6XeYYTd5udwAC5JPTnN4cXgQwa/fbiNHgVvv15p/oC1hOCCkpR96nFUuQc++1581AtCgLAP7QPVk1+/PtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KBuQJzG8; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724388828; x=1755924828;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=d9L7/lV4Kt9lym5oQQscqo5CWq7fOrsysd5To5snw/s=;
  b=KBuQJzG8OosKYvWwYgP4zpxpJF9f8muOvckPvleys0fQ/4SuMbYAFKfk
   ve00ZNdT6byIId+5d3kVjnKS4oEVLxcnMqLsdy9Y8eAfHffs1JLh3OvpA
   ubujFee6iBNbmV0SFOPzmXQnBOYo8peiarcoIXqe/M+FUOkXqBbXgx1LE
   thai1vKqWypRakT4w5sYQq+cFQnLMWD4Y8t5+nd5IUPxBsEO96YbLeEVJ
   mkft5vCDBTVcz71saMusvrJ0ytnzNhvl/00fRHTzTVd8uWgMDVV7cLI1U
   x/Jx9msyT2TeNS7UYHSWmGqceHdFJmo1S8N7hl9bNYnCBsVohvQUohAuz
   Q==;
X-CSE-ConnectionGUID: JsLezObEScqHVCcrjXAVtQ==
X-CSE-MsgGUID: 2QvniFDNScyWS7UqmaUUjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="26709246"
X-IronPort-AV: E=Sophos;i="6.10,169,1719903600"; 
   d="scan'208";a="26709246"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 21:53:47 -0700
X-CSE-ConnectionGUID: uLUonQBMSiC3S6bOu4HglA==
X-CSE-MsgGUID: DzIOh/MORva5BbhCtHg5fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,169,1719903600"; 
   d="scan'208";a="66608947"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 21:53:47 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com,
	sumit.semwal@linaro.org,
	christian.koenig@amd.com,
	daniel@ffwll.ch
Subject: [PATCH v3 0/2] Replace dma-fence chain with dma-fence array for media GT TLB invalidation 
Date: Thu, 22 Aug 2024 21:54:41 -0700
Message-Id: <20240823045443.2132118-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Third try, requires spliting out dma fence array alloc and arm into new
functions to avoid memory allocations under notifier lock.

Matt 

Matthew Brost (2):
  dma-buf: Split out dma fence array create into alloc and arm functions
  drm/xe: Use dma-fence array for media GT TLB invalidations in PT code

 drivers/dma-buf/dma-fence-array.c | 81 ++++++++++++++++++++++---------
 drivers/gpu/drm/xe/xe_pt.c        | 34 +++++++++----
 include/linux/dma-fence-array.h   |  7 +++
 3 files changed, 90 insertions(+), 32 deletions(-)

-- 
2.34.1


