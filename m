Return-Path: <linux-media+bounces-17491-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E28496A844
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2024 22:26:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 87B361C2412D
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2024 20:26:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 083611CF7DD;
	Tue,  3 Sep 2024 20:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="dJ/cNATT"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56461DC745;
	Tue,  3 Sep 2024 20:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725395174; cv=pass; b=jSF/78jZuwuMDWjcTubGEl2DN8scrAaBZ//5PjgAKIii6Ryl6smIjn8tL26x/BhYjIU4kN7GvVnSbaXxE3ulK7s/pGbYFu3aEtt/6ZdakyevBbzXmdLXZAbv3bzm9cp3NWD/P02goX6xNg/5cy02w7KumBW7bZJJEXeORmgH1J8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725395174; c=relaxed/simple;
	bh=eONqblHUqLOYxvKD7I+HpEBVfQ2jBkc6t4nHnNtGips=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lXcCdhxW2tmGXTJOW71wj9Varl7Wsoe7t+cVKD/iBZlDZrKmHccTxkm5qG0OaxZs02mM5FTJY9FyQ6jcGb/FRBdcYxnPllFpjt1v6+ejB44Z2H0yIXKEApd1FAqL0+4R9PP/+LZuyWT9kwONODCyrCZ1g74fM4y6jpN+8xpi+UI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=dJ/cNATT; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Delivered-To: boris.brezillon@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1725395154; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ihknZ9/C8xEnHl13kF7bnFNYggJQ+QnFf+CPN+nf2nVhd0zEky7K9KLRYu7yd64eeIrj8aiUwwEMkCbnpu08dLTrW2x0/xK8C6Ns4ezvunCfReE1ZYnc+Pch9LWhnn/jqgd+XcsuSAawoAKcqXbV+ZzgKzu4zEpUskAYJp6IXII=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1725395154; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=kMPq6Wpp/4Y0fXJ4YcbXeFmAq98BeEdY1hnubqWC3+U=; 
	b=dcxt7o3U7aOEwJd6npND3jxuS7Lw0Ik3ngQ40XXm8tLqOljMdG2FDxOOQe2PVfYSj95xTcuVsdO8xWIOsbcZ/L9XEGGF/FplpD6nRPvLsl7LKDmwG+iOTZ+usJsFVq0d2hFc7S3vEyEWCfOIi/M/AWdbkz22EWd/x70Fdsx1GCE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1725395154;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=kMPq6Wpp/4Y0fXJ4YcbXeFmAq98BeEdY1hnubqWC3+U=;
	b=dJ/cNATTLmtoCjD/DcPbLI9HZjXPRO8mdrbXt14sambmW8M/BENzczzeRZnIZHIS
	x3edJilGshIqXUudx0zcPFc5iV/UYzpQVTDxBVh33jckCBEOl/v5FUmEEhIRDnvSTlM
	5GWC0TNu/nc1h7goHkBkglC0TtqGMaB3FMNzEyNU=
Received: by mx.zohomail.com with SMTPS id 1725395153456225.88044740277735;
	Tue, 3 Sep 2024 13:25:53 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: kernel@collabora.com,
	=?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH v5 0/4] Support fdinfo runtime and memory stats on Panthor
Date: Tue,  3 Sep 2024 21:25:34 +0100
Message-ID: <20240903202541.430225-1-adrian.larumbe@collabora.com>
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
https://lore.kernel.org/dri-devel/20240716201302.2939894-1-adrian.larumbe@collabora.com/

Changelog:
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

Adrián Larumbe (4):
  drm/panthor: introduce job cycle and timestamp accounting
  drm/panthor: add DRM fdinfo support
  drm/panthor: enable fdinfo for memory stats
  drm/panthor: add sysfs knob for enabling job profiling

 Documentation/gpu/panthor.rst             |  46 +++
 drivers/gpu/drm/panthor/panthor_devfreq.c |  18 +-
 drivers/gpu/drm/panthor/panthor_device.h  |  36 +++
 drivers/gpu/drm/panthor/panthor_drv.c     |  74 +++++
 drivers/gpu/drm/panthor/panthor_gem.c     |  12 +
 drivers/gpu/drm/panthor/panthor_sched.c   | 372 +++++++++++++++++++---
 6 files changed, 513 insertions(+), 45 deletions(-)
 create mode 100644 Documentation/gpu/panthor.rst

-- 
2.46.0


