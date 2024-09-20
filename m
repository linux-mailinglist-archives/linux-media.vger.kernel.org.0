Return-Path: <linux-media+bounces-18424-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D098597DAD4
	for <lists+linux-media@lfdr.de>; Sat, 21 Sep 2024 01:45:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0057E1C2120A
	for <lists+linux-media@lfdr.de>; Fri, 20 Sep 2024 23:45:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FD5A18DF83;
	Fri, 20 Sep 2024 23:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="iM06yxcj"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0705824A3;
	Fri, 20 Sep 2024 23:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726875909; cv=pass; b=V7aGMawxxwr186X0s+fdAmAoXLOrDknzXsJYRfSs/OX3CbftrxB0CPsLmwSHU8xDsQnQdcK8iJGXy1qrZh5OYTaIZYXC+FAG/Hns0pfRKLjWRp2pRxjg/UgpeiR7KdNnHcS7BupmS1k3eY7P34v6GKxfnP6EpGpq5vd2P3BYgUU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726875909; c=relaxed/simple;
	bh=1T7z+mGEFlmOvD5OPsLiAVInf843C5TqGMiMNBnyim0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VrQqyz/4ElLnWzVHHZMcgp7OfGFucyE16eDfleJgAlH+QdEinacNVPGqFUClzpON79+osH4gfvveozeWdG+OtOsMfbnmUUpR3PJq7RAEEYUEVRXWhoZuDneeh1E//c4iLXVmct+8gjdc1f2WcwEMqun+3W+WNzqAWNQ1yrqJs8k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=iM06yxcj; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1726875889; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=QuCEg5/ueVOPDjE9PcUJYvJIFVlgZn2sXF8zMDGFkhy4bOAX/BHYCaWAKaohs7mMnMMH/Axr1xb4qFBG0mJ5IO3U3rtED9BYcKk6BWcoEGMdi6+j6LPz6+ohE3WTvWL9WYxfy5OnJhxohqvtO0OecwsbZg7S2+6tYrGvv8A2AxI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1726875889; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=G/bbd+beM7Cmac6zByeIX91R2EWVMgZvEyhHBVrUrAE=; 
	b=VLAEZK3jGir92eIH3FmVNd9STXMIs7/hw/4MO50q3keoloC7ohFBgujKxo5T795rY6TPRURpkLPsLgjjszPqfoD6aysCaZhS5t/zAGlh7ORjnPmJIbp2wXzsG6SUFOMAqeziCgy89n7MWPN9JS7sXSlHrqiQiqFtAzqJam5xUDY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1726875889;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=G/bbd+beM7Cmac6zByeIX91R2EWVMgZvEyhHBVrUrAE=;
	b=iM06yxcjttGljJTHIoAG1nbUhJwU2QzoacjxNzeKX3UZ6nNbLNYENIhXw5r87Fwf
	Q9Y/yhonWWF32eF54apqv+nAh8wxVk19mZb5TSSIu5QjRLU+YpW9/9P6US2zYU0pLHT
	vWRwG+yaZGAIYBCwZueAaMlHo5RtoxIfJIamubo8=
Received: by mx.zohomail.com with SMTPS id 1726875887789111.07864617797748;
	Fri, 20 Sep 2024 16:44:47 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= Boris Brezillon <"adrian.larumbe@collabora.comboris.brezillon"@collabora.com>,
	Steven Price <steven.price@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: kernel@collabora.com,
	=?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH v7 0/5] Support fdinfo runtime and memory stats on Panthor
Date: Sat, 21 Sep 2024 00:43:39 +0100
Message-ID: <20240920234436.207563-1-adrian.larumbe@collabora.com>
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
https://lore.kernel.org/dri-devel/20240913124857.389630-1-adrian.larumbe@collabora.com/

Changelog:
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


