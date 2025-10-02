Return-Path: <linux-media+bounces-43621-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D82DBB3A25
	for <lists+linux-media@lfdr.de>; Thu, 02 Oct 2025 12:33:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 20C5E19C012E
	for <lists+linux-media@lfdr.de>; Thu,  2 Oct 2025 10:33:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 415BE30AD19;
	Thu,  2 Oct 2025 10:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GUbDjslb"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 278DA309F17
	for <linux-media@vger.kernel.org>; Thu,  2 Oct 2025 10:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759401183; cv=none; b=Zjo4D+vJvSCJN39P11zOxyuwN7++hkstTDo8H1m9DA9AS6/HKQOLpHMNIxxpbV00iOBQdh/YJXBa2glxLoY2Jh+2qvCwG5A9LU13uUifosFoqw12JQShDBTuBpOd1Pig8u7RIAgDK9g1doXuE2z4P1WVUGi62HWp7Wfo06g6a+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759401183; c=relaxed/simple;
	bh=DhDqJ7A4shMroAZ+uw2qmm9HZqnQEVGfCdD9KdzBKxk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M+hpWELh38jZ+U/g11llwRJsC87WJGQuIct+65yobT/URAqv5CAqyerqNfdtj/rfBIrKOxPoBKFVnTot89SREm/N5GMCsbU/EG4Mzm+C4H3VOw8zUMYr7M5KEU/D31H7RGlVEjP5DmpehCtGUfEWEgv8VjODrQpLlOn0EY2co5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GUbDjslb; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759401181; x=1790937181;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=DhDqJ7A4shMroAZ+uw2qmm9HZqnQEVGfCdD9KdzBKxk=;
  b=GUbDjslb4K0oY0hORstnxwpaYxcgNahvmJgRntFYBhc2y6UQZwq6zdQI
   jw+U+YL16qhAe1UE+IwhmkWtUiFcpXJNyqnFSjwoXYPh2HeTpO6FlX8Q9
   iC9byHmJ4vkxFYKizrDm3J4wRDsV4GEC+CLjOZjoIt8rGD9fwqYv3JygM
   ms89RkEfs4YFgnnLW/NCmS4bDMUXWrZO8OpkrsOd5OOf+xovkYU2qhb8w
   FXjKi6mQ5HpXiTRlHjgPFoRwlCmZhG4D+juZtX1+FKZeKD8p+/csvI/AV
   m4sPI6a9YmYL42jHWf0Ik2TdZEJiQIXx+4XaE3luVlh80Drtrv/1Ylcv/
   Q==;
X-CSE-ConnectionGUID: AJ1niVRQT+SroN6M+UNSkg==
X-CSE-MsgGUID: uJa8f21JSvWwknTGLVHUKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="49238076"
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; 
   d="scan'208";a="49238076"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2025 03:33:00 -0700
X-CSE-ConnectionGUID: wceaKg2uTg+OoYeZDpo2Lg==
X-CSE-MsgGUID: yKlD31tJTmulEOnocXlpfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; 
   d="scan'208";a="179457277"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.175])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2025 03:32:59 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id DAE3E121056;
	Thu, 02 Oct 2025 13:32:56 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1v4GcK-00000008jc7-23z1;
	Thu, 02 Oct 2025 13:32:56 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	hans@jjverkuil.nl
Subject: [PATCH 0/3] Switch to container_of_const() in macros
Date: Thu,  2 Oct 2025 13:32:52 +0300
Message-ID: <20251002103256.2081947-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This set switches to container_of_const(), in order to add constness check
for the users of macros obtaining a container struct of a struct field.

The good thing was that these patches didn't add any warnings but the
added checks will also prevent the issues from happening in the future,
too.

Sakari Ailus (3):
  media: v4l2-subdev: Make media_entity_to_v4l2_subdev() const-aware
  media: v4l2-dev: Make macros to obtain containers const-aware
  media: mc: Make macros to obtain containers const-aware

 include/media/media-entity.h | 10 +++++-----
 include/media/v4l2-dev.h     |  6 +++---
 include/media/v4l2-subdev.h  |  2 +-
 3 files changed, 9 insertions(+), 9 deletions(-)

-- 
2.47.3



