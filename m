Return-Path: <linux-media+bounces-29806-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 697F3A8334D
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 23:24:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D56B4175E29
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 21:23:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9139219A7D;
	Wed,  9 Apr 2025 21:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="Ccb2jbKs"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A282144B0;
	Wed,  9 Apr 2025 21:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744233810; cv=pass; b=jWwh7h1VKkyTABtoFp7u24MSJnMZlJ2YfGsq6TtkAh5OV6H1VZhocD0NvGgPhH1Sj/huEZkDAEs1CXu30yA0UJLenb6khzTI2pJU6/9BipwWLwiz5m1XL332psjIKBYJ/BmR9QeZHL10Pu7j5+wspRofOwbyzvS9oAmdEPA1Cyw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744233810; c=relaxed/simple;
	bh=/OHk8acnz8cW0VYDt/bTZP39BdRTGq3ZOtIifYd959U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Dtetx7MWISXFHj54BJn8qLfQE3VRC/wpsyDJGqZk7O5t8ofPGDEnOXrV9K36f2Tg0Ii/ByB4SE+FB0+sG+fq3yhBC0kzZ2zq2RlfV7cmktBlbXQr3OaZmFPJCR4vE4dWoqxW8idvTr5Fo70a2NwoMQhKZ08zscaIye8wbdeE9Kg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=Ccb2jbKs; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1744233774; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=RjHKEp8WSHtySVTIZL1UHaAi9p+b3pD2hRw8KNv/ZiQQUNeqnfGEWgIMJTJJUZs8bSa9Lcy99lT/O8RVGBFIJSS6Cn7PTSGBFoLjZUS4UyD1XSWrpKhXmLs8j4L27JXtunu75L7wgYNVP4l1JMkPdBzAqLnyYsLLoEPRw1gcSNU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1744233774; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=V5FUjgoiTygqR7CMcv8uAi3udMBMdnQJxLq1c2Z+zEU=; 
	b=V7hDf2jL8RZ2GWpnFUp85dxd0lq+o1MRZKTjSX17h5lIe4BgBwC0OpZJqs04qFzfCQl07/1a3oNtcUNEjKHjaCOTNgCrOS1dwPLc2qWYXo18Y6uPk9/Zf7f62B0p5pGjBmYyhZGRHsrTDZ4kcOigIfgC7iryRniPKSr6xh8GOeE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1744233774;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=V5FUjgoiTygqR7CMcv8uAi3udMBMdnQJxLq1c2Z+zEU=;
	b=Ccb2jbKsq+Y5Jr2aIc9EKqujtwQw5PXLgmIk4U/zsx6F86iuAb8M4eZ7F1nVy3uB
	3y7F6wAqBvwgglZjc6uo6sSNUYBBUECc1lKe4f0kPbJ7wUrB0xsjb/r31kr1ZOQNnpC
	EVOrE/oUhhKiaFN41wRlPHoZau8k6An6KlVMB/Tw=
Received: by mx.zohomail.com with SMTPS id 1744233772379460.9766127739156;
	Wed, 9 Apr 2025 14:22:52 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: kernel@collabora.com,
	=?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH v6 0/4] Panthor BO tagging and GEMS debug display
Date: Wed,  9 Apr 2025 22:22:18 +0100
Message-ID: <20250409212233.2036154-1-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch series is aimed at providing UM with detailed memory profiling
information in debug builds. It is achieved through a device-wide list of
DRM GEM objects, and also implementing the ability to label BO's from UM
through a new IOCTL.

The new debugfs file shows a list of driver DRM GEM objects in tabular mode.
To visualise it, cat sudo cat /sys/kernel/debug/dri/*.gpu/gems.
To test this functionality from UM, please refer to this Mesa patch series:
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/34224

Discussion of previous revision of this patch series can be found at:
https://lore.kernel.org/dri-devel/20250408222427.1214330-1-adrian.larumbe@collabora.com/T/#t

Changelog:
v6:
 - Replaced some mutex calls with scoped guards
 - Documented data size limits in the label ioctl
 - Simplified GEMS status flags treatment (Panthor doesn't use madvise)
 - Fixed some array size and string bugs
 - Improved the naming of GEM status and usage flags to reflect their meaning
 - Improved the formatting of the output table

v5:
 - Kept case and naming of kernel BO's consistent
 - Increased the driver minor after new ioctl
 - Now adds BO to debugfs GEMs list at GEM object creation time
 - No longer try to hide BO creator's name when it's a workqueue or modprobe
 - Reworked the procedure for printing GEM state and kernel BO flags
 - Turned kernel BO flags and GEM state flags into bit enums
 - Wait until BO state is marked as initialied for debugfs display

v4:
 - Labelled all kernel BO's, not just heap chunks.
 - Refactored DebugGFs GEMs list handling functions
 - Added debugfs GEMS node mask to tell different kinds of BO's

Adrián Larumbe (4):
  drm/panthor: Introduce BO labeling
  drm/panthor: Add driver IOCTL for setting BO labels
  drm/panthor: Label all kernel BO's
  drm/panthor: show device-wide list of DRM GEM objects over DebugFS

 drivers/gpu/drm/panthor/panthor_device.c |   5 +
 drivers/gpu/drm/panthor/panthor_device.h |  11 ++
 drivers/gpu/drm/panthor/panthor_drv.c    |  68 ++++++-
 drivers/gpu/drm/panthor/panthor_fw.c     |   8 +-
 drivers/gpu/drm/panthor/panthor_gem.c    | 229 ++++++++++++++++++++++-
 drivers/gpu/drm/panthor/panthor_gem.h    |  80 +++++++-
 drivers/gpu/drm/panthor/panthor_heap.c   |   6 +-
 drivers/gpu/drm/panthor/panthor_sched.c  |   9 +-
 include/uapi/drm/panthor_drm.h           |  23 +++
 9 files changed, 428 insertions(+), 11 deletions(-)

--
2.48.1

