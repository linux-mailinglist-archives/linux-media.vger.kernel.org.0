Return-Path: <linux-media+bounces-29221-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51017A78D94
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 13:56:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 42181170ADE
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 11:56:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C6C9238D2F;
	Wed,  2 Apr 2025 11:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="ING4b2v2"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554B4235BFB;
	Wed,  2 Apr 2025 11:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743594944; cv=pass; b=gUufNaH3Cbatrkmeox09Bn7ijVKvLLQsCnBDCJwKFRNLHuW5ZrjrTyRNkANsK9KWKOXFXckbH5ENbTcvAUqLlU/c0c9jFxbe+luyJbNr1ymjcsphuVbYht2mkSwHKd20duzNMAJQkk2GwQgjXvaNwjftZGG9SSq28nqAvySK53M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743594944; c=relaxed/simple;
	bh=dyJeFJYs7KZgd0hGuPcwev7dmphLf6d468l2zUbdeHI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Gbo62dtcBmld9Lq1ANTk4WQrT0dZ+wttpikqq5cRncBfjC8/XAUWxpeVFaJ0ZsEY6vS/CnoBkOncDnpUdJohbzfq0dliidvwSTDL0rGQm6HXd599IcHGWUSEXqLsoacjLp6yC5PhHf2oUubCFN/zetRb19827aweg1JLM65Y42o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=ING4b2v2; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1743594916; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=TWbAZ0GuL4bb0ioqgLS5EFNyQXLo5Q+g4oLtUX4jkpSORY43djSHcBUuGsEqRJFpzKeKAklVByyALPvxWW8dOfPZBeKdy4iyJ2tb82HWDGTHl1WBOPlblAvAZDPhxZM7Ol9L6yfESF+xVmCITRGz7OCzKVOkquYf2Zm9apxjeCw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1743594916; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=fdb2gePj9volh90yF+EA/VsRgGfn41mWCZbj8hlhP5E=; 
	b=W5hEdy4LmbsdLqfB2mUKv0wqyfEKaAvfjY+aLBNpHO5TIgH5Qu4NhcwR18Gu8QF3SIruU21oyzjYODl1LKS8IJgO1au8r2Zk4aHSLV6nG1WGwiaEtnXhF5AYs09jLsGpDLOiensiYlXR+TGTaYzNc0Y2tUpUCNyQMg772kb9OhU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1743594916;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=fdb2gePj9volh90yF+EA/VsRgGfn41mWCZbj8hlhP5E=;
	b=ING4b2v2STBn5dJpZGDXGXDRo25gy1KhbHCb262ZqZngYibiM9QQPtlYqJDcFAc9
	jNqc+qF5PrHIVx5SqDIVYF1a/L3RZWydtl3joXTdCPPkCILXqR9fRN8MUPnyBc6LXRs
	ZiuVW5G2cFhyPNiE9mc2ee0ge5ZwL7Ih8yjuGqh8=
Received: by mx.zohomail.com with SMTPS id 1743594914170334.5265743347172;
	Wed, 2 Apr 2025 04:55:14 -0700 (PDT)
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
Subject: [PATCH v4 0/4] Panthor BO tagging and GEMS debug display
Date: Wed,  2 Apr 2025 12:54:25 +0100
Message-ID: <20250402115432.1469703-1-adrian.larumbe@collabora.com>
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
https://lore.kernel.org/dri-devel/20250327140845.105962-1-adrian.larumbe@collabora.com/

Changelog:

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
 drivers/gpu/drm/panthor/panthor_drv.c    |  66 ++++++++
 drivers/gpu/drm/panthor/panthor_fw.c     |   8 +-
 drivers/gpu/drm/panthor/panthor_gem.c    | 190 ++++++++++++++++++++++-
 drivers/gpu/drm/panthor/panthor_gem.h    |  56 ++++++-
 drivers/gpu/drm/panthor/panthor_heap.c   |   6 +-
 drivers/gpu/drm/panthor/panthor_sched.c  |   9 +-
 include/uapi/drm/panthor_drm.h           |  19 +++
 9 files changed, 360 insertions(+), 10 deletions(-)

--
2.48.1

