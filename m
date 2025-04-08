Return-Path: <linux-media+bounces-29693-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94591A81881
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 00:28:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F32E616E0F8
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 22:27:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C0CF2580ED;
	Tue,  8 Apr 2025 22:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="TjzHiFy1"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1518B2561D3;
	Tue,  8 Apr 2025 22:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744151121; cv=pass; b=p1hi4NgKLDV/OrmkkZ3QtezeKyB9alukFNTghaqiQpnDS5zC7fgPj8lvh97NJxmOe0aQHLg8/QfUC8nKcBAkhqAIpMkUIqQYquKE1vHo28QBRPMfPgACEsAzkOE4UYIQC3r3y1ffTsuayiT3czVkiuFBOkpL+XZO8vm+kuwAmh0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744151121; c=relaxed/simple;
	bh=fPUXfPrlZVfotF0mXj6UzQVp8fh7ZUkf1EzFg0e6SMc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=l7wfzzoZ95irue+Vg7O+PLDowjDX54800hxevCVU6B9q5zdhrkdQlYybip9Xkz5OXQXlXx7zun/Wj2acwi0I6lK44TRURee8EApNThvsmaiX0UZg501oVcIeLHW2Hub7CR4CqJEh2cHB2pbXSbnDi5Q67iKFJsUcRbwA9fmvjF8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=TjzHiFy1; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1744151081; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=hw50jNZobz49LxtYadbqaOWjdrqUt5jDp6gEJ2zYqzzBTpwk1xwpza6p2DFj78Ux0X5o9g/lw9YrGaoZiXZtEUUp1TyG9YbsTclQwQgLmCeHrxLjxy3daZ8taIhpOpTq1gaooOxnUv+k130Mz8SC37roMKrFmGRXhKWMAXESiFo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1744151081; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=GJj2+HH15+BohAlwSH5EisMA0Tu8jvT9Yx4DuyqrWe0=; 
	b=bjaaSPibUq+BV77+odD2wp0tY4qhTfJ4oP/AcZx/K5L2WmMyxCZK3KWgO/4C/GTZ/Ut6WtfXDZWuvHp2AvM2T8fpx+oMhZmrCfQehDEr7qIRngRFsuH4csZ4UYXTmSNAz6DURqEzO+ymXSsn24pfwYyr4FZzW79zRd7Q4CJJGJI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1744151081;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=GJj2+HH15+BohAlwSH5EisMA0Tu8jvT9Yx4DuyqrWe0=;
	b=TjzHiFy1tRg8/MjD1Kce4ZdsWeUxMGBwlz3q3yuL6KBjF7N46w8bhgSJmoQJiwjP
	D0lb4eGGNTK1VnH17wQtdhjKiUjm+FkAceLSUGQSREQqLsmbWjPtHdO6AF9x3b3lC8U
	QhKu233f4b6gZQVgeEQcYn0QUVV8UsLDpSYqfyYQ=
Received: by mx.zohomail.com with SMTPS id 1744151079511376.76312363545844;
	Tue, 8 Apr 2025 15:24:39 -0700 (PDT)
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
Subject: [PATCH v5 0/4] Panthor BO tagging and GEMS debug display
Date: Tue,  8 Apr 2025 23:24:20 +0100
Message-ID: <20250408222427.1214330-1-adrian.larumbe@collabora.com>
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
https://lore.kernel.org/dri-devel/20250402115432.1469703-1-adrian.larumbe@collabora.com/

Changelog:
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
 drivers/gpu/drm/panthor/panthor_drv.c    |  68 +++++++-
 drivers/gpu/drm/panthor/panthor_fw.c     |   8 +-
 drivers/gpu/drm/panthor/panthor_gem.c    | 210 ++++++++++++++++++++++-
 drivers/gpu/drm/panthor/panthor_gem.h    |  86 +++++++++-
 drivers/gpu/drm/panthor/panthor_heap.c   |   6 +-
 drivers/gpu/drm/panthor/panthor_sched.c  |   9 +-
 include/uapi/drm/panthor_drm.h           |  19 ++
 9 files changed, 411 insertions(+), 11 deletions(-)

--
2.48.1

