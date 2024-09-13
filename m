Return-Path: <linux-media+bounces-18251-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B10B3978067
	for <lists+linux-media@lfdr.de>; Fri, 13 Sep 2024 14:49:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EB9C21C2163F
	for <lists+linux-media@lfdr.de>; Fri, 13 Sep 2024 12:49:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9722C1DA61F;
	Fri, 13 Sep 2024 12:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="FfJDb/J1"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708451DA2F5;
	Fri, 13 Sep 2024 12:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726231770; cv=pass; b=K4Qw/A44aZtw2XYPC94AGIoJ1VunDPh+1/D4aAB9wTSj/uKGOR8blo/gNEktNjWVh+oT2jvA61rtjuVVlguFs8NQABpiBLr2zhAtPjwUgD7+Ml/EQY9TBE7mOA23sFDSzE9gBk3SxtcnaBj5mHqroyksxKG2PB1fuGFLHGlvQS0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726231770; c=relaxed/simple;
	bh=RyodbfDvOfQeLlmTG10oiCaIpl9uv05a7oTN/9sphdk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KWcbFUT7ad2sjeXMqTLF+AuxDXJRq43W72XfvTGO2q/8ECLTIDcKuMFtOwrokZ+8puwlWZOmzj+xOuQ6ubyxqXgjeVlByc/PNec/dcUA3gee3bH8Lawe3LW0bGgSMjtom0k2sKjZ8nC/FjtSqQdPCtm/n/JajEjkO4KkvFqYnKU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=FfJDb/J1; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1726231751; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=BNPYSzWVCMOmo/hTyJKoZ5FIjbNSu0BhXNE3L2T/dVdGB5Pzc8siPkbF+pmRVzirwnvw+QYJ3xicim0Qz5zFCrnkZAzJDPaZrICPDZXH7WeOCetrwVDvvM4mw8xnoiDfjL/qihg70uqRCbRhWOjYw81P5BL1PA1X+yeiKNVBabo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1726231751; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=X1FWXYkdFTAZTf7isrudo8jAfS0TveWzA+M9/g9zXoA=; 
	b=lc6BtIYv0u4t58KRvKlOiMt1BIe80S+PN37HbZE21CyovpWHYohszS7vTUf6W1kdxIUDNSEp3i4pgdCvK8dYusem49OTM2OzMU1sQWYVEh8fmsYY+8LjdaMtHZ09qvinhVmwlowgpCv4t7heirQDLVXsxbVtCO8KcI+ikvLlmHc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1726231751;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=X1FWXYkdFTAZTf7isrudo8jAfS0TveWzA+M9/g9zXoA=;
	b=FfJDb/J1ZBv/QpN/TkmJEaWuLtnbuQ5hkLKa6W6APF94Ld1VQ/nbabYifYT1t30y
	TJLVY/BP4t5+zPtFbe5hap5wODVyRJXuNaTU5KseK1uw+gQCSC5nVijUuFsthOcutZB
	+Ie4iiOG1YijPkIZ/xjBI1a+CBKFpiTNZU2Kkv4g=
Received: by mx.zohomail.com with SMTPS id 1726231750315208.30409114526583;
	Fri, 13 Sep 2024 05:49:10 -0700 (PDT)
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
Subject: [PATCH v6 0/5] Support fdinfo runtime and memory stats on Panthor
Date: Fri, 13 Sep 2024 13:42:08 +0100
Message-ID: <20240913124857.389630-1-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch series enables userspace utilities like gputop and nvtop to
query a render context's fdinfo file and figure out rates of engine
and memory utilisation.

Previous discussion can be found at
https://lore.kernel.org/dri-devel/20240903202541.430225-1-adrian.larumbe@collabora.com/

Changelog:
v6:
 - Addressed some nits and style issues.
 - Enforced static assert equality of instruction buffer when calculating job
 credits or copying them into the ringbuffer.
 - Added explanation to the way in which job credits and profiled job size is done.
 - Broke down fdinfo enablement patch into two, one of them dealing with adding
 support for calculating the current and top operating device frequencies
 - Fixed race at the time drm file-wide profiling stats are gathered from groups.
v5:
 - Moved profiling information slots into a per-queue BO and away from syncobjs.
 - Decide on size of profiling slots BO from size of CS for minimal profiled job
 - Turn job and device profiling flag into a bit mask so that individual metrics
 can be enabled separately.
 - Shrunk ringbuffer slot size to that of a cache line.
 - Track profiling slot indeces separately from the job's queue ringbuffer's
 - Emit CS instructions one by one and tag them depending on profiling mask
 - New helper for calculating job credits depending on profiling flags
 - Add Documentation file for sysfs profiling knob
 - fdinfo will only show engines or cycles tags if these are respectively enabled.
v4:
 - Fixed wrong assignment location for frequency values in Panthor's devfreq
 - Removed the last two commits about registering size of internal BO's
 - Rearranged patch series so that sysfs knob is done last and all the previous
 time sampling and fdinfo show dependencies are already in place
v3:
 - Fixed some nits and removed useless bounds check in panthor_sched.c
 - Added support for sysfs profiling knob and optional job accounting
 - Added new patches for calculating size of internal BO's
v2:
 - Split original first patch in two, one for FW CS cycle and timestamp
 calculations and job accounting memory management, and a second one
 that enables fdinfo.
 - Moved NUM_INSTRS_PER_SLOT to the file prelude
 - Removed nelem variable from the group's struct definition.
 - Precompute size of group's syncobj BO to avoid code duplication.
 - Some minor nits.

Adrián Larumbe (5):
  drm/panthor: introduce job cycle and timestamp accounting
  drm/panthor: record current and maximum device clock frequencies
  drm/panthor: add DRM fdinfo support
  drm/panthor: enable fdinfo for memory stats
  drm/panthor: add sysfs knob for enabling job profiling

 .../testing/sysfs-driver-panthor-profiling    |  10 +
 Documentation/gpu/panthor.rst                 |  46 ++
 drivers/gpu/drm/panthor/panthor_devfreq.c     |  18 +-
 drivers/gpu/drm/panthor/panthor_device.h      |  36 ++
 drivers/gpu/drm/panthor/panthor_drv.c         |  73 ++++
 drivers/gpu/drm/panthor/panthor_gem.c         |  12 +
 drivers/gpu/drm/panthor/panthor_sched.c       | 393 ++++++++++++++++--
 drivers/gpu/drm/panthor/panthor_sched.h       |   2 +
 8 files changed, 545 insertions(+), 45 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-panthor-profiling
 create mode 100644 Documentation/gpu/panthor.rst

-- 
2.46.0


