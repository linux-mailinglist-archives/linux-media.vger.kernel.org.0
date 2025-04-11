Return-Path: <linux-media+bounces-30031-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BDCC0A86138
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 17:05:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 94BA819E8CA5
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 15:05:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FF8E204840;
	Fri, 11 Apr 2025 15:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="Sm+UKc6a"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54951F4CA9;
	Fri, 11 Apr 2025 15:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744383882; cv=pass; b=Gd/03MpbKFc6ImiGHPpTH8SWHUW6toVaBJhZc51aLXR1ZEoT6U7p95ZHs3wch7UYpmrquRJGBQzV3zNI4TKxuleFYEdgWI67Nrdo0ab2J++VMr9ETKcKHEFSq7iomS3/yTxDwtxhaFHPv3q73qV+D8qOOC9shIsgcpkJOi37r78=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744383882; c=relaxed/simple;
	bh=PCotdSHlFD/3ExCsmykIzRSZdIa8tKB3tVJWpoTmuwk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Gx3Pj5CJ4vSDYW4QMH9aJUtAAIL7jn3ifmtLK+HpR77/Upab3ms0+HqI8i+aJu71uLHgqnbkrGIAjIrDkHmogjLo8yDJScs3aXNANEEyoxsBPTY0el+xTfl8YTGAMWXYBmJwPZe23dc2HRY/W3mZVGhDGYx2Vj8hSjz4ioBEmnU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=Sm+UKc6a; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1744383852; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=JbIELZ5HVOaXB8E3hyycOfIQ0cttdyFCWHdKH9wN54CzJoz7HysrSPT/UuW/BkUx8rmss7F3+Tk6DjgAzLuySJQk74l1VN01Ys0PUAZwfS0lI4b/Y+71K41OD6f63h1GPOD5r5H+qZ31ehaxKIywyYJDKIaSgtOqhD8CyfEB7O8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1744383852; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=hJU7RtOEpjvauYnpptgY/NOnrt4iNsj+/WuzVjWFgN0=; 
	b=Rg9YRJaX5+VH5n1nQ7ch5mSyBuvKeF/zVuuPuEGYVUcMfq4Vk5gKnYOM3z+GO3P+75zRxvXEphokdhDsetU6+LIVI9qs637TBoLyRTwL5YScGKS6YmFcewTKVgMWtlX+kU3doCqeXO4hUDBEywhx9NW6O2RRGBM7N8A0yqkSyg4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1744383852;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=hJU7RtOEpjvauYnpptgY/NOnrt4iNsj+/WuzVjWFgN0=;
	b=Sm+UKc6ahyFPmIZ2aUdipPdjXsxUMfU+A7Bm51VRS1uosIGFvCoUDzSeD+No6XZz
	pVHl6WOx+YoXSGSh/rIvpXg/e6z0Z9hnoiKTvA6xveXh59TvUE8N9FG2tsBbjZ3uZM1
	7Pt5VXO04/rtYLeEctIxduIu+CCSBwqTPsHUmpk0=
Received: by mx.zohomail.com with SMTPS id 17443838508591016.5289892434001;
	Fri, 11 Apr 2025 08:04:10 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: "To : Boris Brezillon" <boris.brezillon@collabora.com>,
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
Subject: [PATCH v7 0/4] Panthor BO tagging and GEMS debug display
Date: Fri, 11 Apr 2025 16:03:48 +0100
Message-ID: <20250411150357.3308921-1-adrian.larumbe@collabora.com>
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
https://lore.kernel.org/dri-devel/20250409212233.2036154-1-adrian.larumbe@collabora.com/T/#t

Changelog:
v7:
 - Improved formating of DebugFS GEM's status and usage flags
 - Deleted some spurious white spaces
 - Renamed usage flags setting function

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
 drivers/gpu/drm/panthor/panthor_gem.c    | 225 ++++++++++++++++++++++-
 drivers/gpu/drm/panthor/panthor_gem.h    |  80 +++++++-
 drivers/gpu/drm/panthor/panthor_heap.c   |   6 +-
 drivers/gpu/drm/panthor/panthor_sched.c  |   9 +-
 include/uapi/drm/panthor_drm.h           |  23 +++
 9 files changed, 424 insertions(+), 11 deletions(-)

--
2.48.1

