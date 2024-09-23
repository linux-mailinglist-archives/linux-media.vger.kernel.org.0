Return-Path: <linux-media+bounces-18482-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 221A5983A07
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2024 01:09:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 51BA31C2260E
	for <lists+linux-media@lfdr.de>; Mon, 23 Sep 2024 23:09:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19AD8126C09;
	Mon, 23 Sep 2024 23:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="UF/00oAN"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B5712D1FA;
	Mon, 23 Sep 2024 23:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727132982; cv=pass; b=CyR1w5Clms2WAM6DBkRtmu/xnMHbOgC+4jd6xNfWOm3KpT+UDTCprVH0KSk2ViojwqGartFZpBRIO/YRkG5mBU534x+WjpN7Hu3i/Byrl/eNRewc1/lh8DzNGTmTCXyzzFpGTQVX7N5+fkVRFrv3BwYaeMoYOP/2Tdt2Kuk3Y6g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727132982; c=relaxed/simple;
	bh=c06FO/kcN5ebzIo8Lxctzj0SeQk61xZa4CP6vGcIkP0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bLw8MC4x5RWMEKSn7OwBXnYZwRiVbzitvGoGbJ7P+GE4XReydFO0hcn5mts7oLf7xOxR1v/a7364S9CIQ0D+OTgev5sQc0vYfub3pAmednGFGQVVoeVikPQZ+MXsiPnaV7evNERNlKHY5vGPHaF4qSxS703HiNRamexfiP5wyUw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=UF/00oAN; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1727132966; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=FJ1NhH7uhig/MkZYlgjPcBD2ITFFRjkTTkCvTNt8aqGo0TP1LtNSzpsitJqDIPdmYBvaohSCE4LU31HrE7CAMbgKIeCd18hfo+jKtJXFaO2wNZxuBJCCxnrrY2kYj85v84WCn/QJpBXeqhQAhvInSndj6OrUpoq806f8C6plH4Y=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1727132966; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=EXwo6vgrQS8r/knP9TPY91FMXiIzo7plKOoU5Yr1Wgg=; 
	b=duJFrNW3xskG5n3NJAzBzlBQE8e4H5vTnE3v7u6T8l3640ZWcz7fQ0x4ZBkxZL//wjBtWjszpn63mSorw5WElg03yKCaDvyGA3AvTsxDo64Bo2gdwpbejwXti294yEqoGD9Ti2FkIlI0rd9AmOhJ+IGFxyqXwIkpQvYOn54QdW4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1727132966;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=EXwo6vgrQS8r/knP9TPY91FMXiIzo7plKOoU5Yr1Wgg=;
	b=UF/00oANFDVYlSsiKjV8pabqKMAMn1id+JyX9LW7lq9ahT+MoSYR40DrDhyGJuaa
	Ru6/QwyskRXp2mVf/Rpoou75+Ct1Ed2gYhzo2VFmJRygALmVTLSy6UIsYUre9hxxFmF
	nGbD9O8xMxk62UU5V+35tZjKiaf7RQgP4DuC4wJs=
Received: by mx.zohomail.com with SMTPS id 1727132963748614.7582038696082;
	Mon, 23 Sep 2024 16:09:23 -0700 (PDT)
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
Subject: [PATCH v8 0/5] Support fdinfo runtime and memory stats on Panthor
Date: Tue, 24 Sep 2024 00:06:20 +0100
Message-ID: <20240923230912.2207320-1-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch series enables userspace utilities like gputop and nvtop to query a
render context's fdinfo file and figure out rates of engine and memory utilisation.

Previous discussion can be found at
https://lore.kernel.org/dri-devel/20240920234436.207563-1-adrian.larumbe@collabora.com/

Changelog:
v8:
 - Fixed uninitialised stack variable bug that was triggering an invalid memory reference.
 - Added a few R-b tags to commits
v7:
 - Fixed some kernel test bot-reported documentation and sign mismatch errors.
 - Defined convenience macros for specifying CS instructions according to their profiled status.
 - Explicitly initialised instruction count for structure containing a job's
 instructions when calculating its amount of credits for the scheduler.
 - Some minor cosmetic nits. 
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
 Documentation/gpu/panthor.rst                 |  46 +++
 drivers/gpu/drm/panthor/panthor_devfreq.c     |  18 +-
 drivers/gpu/drm/panthor/panthor_device.h      |  36 ++
 drivers/gpu/drm/panthor/panthor_drv.c         |  73 ++++
 drivers/gpu/drm/panthor/panthor_gem.c         |  12 +
 drivers/gpu/drm/panthor/panthor_sched.c       | 384 +++++++++++++++---
 drivers/gpu/drm/panthor/panthor_sched.h       |   2 +
 8 files changed, 531 insertions(+), 50 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-panthor-profiling
 create mode 100644 Documentation/gpu/panthor.rst

-- 
2.46.0


