Return-Path: <linux-media+bounces-28851-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5A1A733F5
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 15:11:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E28833B5793
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 14:10:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6657C217F5D;
	Thu, 27 Mar 2025 14:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="NKbxoAz9"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA7621770C;
	Thu, 27 Mar 2025 14:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743084642; cv=pass; b=k1rFxJNS6fvdRj8J28UOKwtppW5NJ6O92Sw5VLVSbo0XsPu3Xom3MsO7YcP/zTnbuLs+Z78LP7Ppcffqwz0DwV9M8awp4M0KNLyl33mDJ0Tr03aEL4kSaDg5VXIWHQ8qSWZ8DbymOYg0qnbgxIuHALWAigJTcwwxGGQ4D/lT8uY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743084642; c=relaxed/simple;
	bh=2I0jbfIOFyC3rlWREtZbP7iXGq5fytZU/yKAbJ6gRyU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VVtaANuyJ0O6S4HEzbsUmOExwYiRsX2ndUzHhV5ptcyWpQDW/r+CeLxb/ah8hnwQGu7RfgiE0Ob2hPWsqfsL6kBMYy/C+6vuenvLq7KJo7wb+eVjeVnWYgdqpHC6orWckCd/JNXjs3RMR+3oPpoC00x6ZBE1PcwsZ+5med5y/98=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=NKbxoAz9; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1743084607; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Ix4ekuq6nF7aEqJgbNhX2cWRTGmSr2Eqjx1KwqwhAbVyOKNaBy7XZJoqDEynY/E52nSekItdp6qGyMtT/feSyufrswTcbZd4atwHeBGmqNFmW1VXivC9kWDJm09/Aqn42RrIS6uYybChK3W8j5ukB+JTQZHJ0SumZCNp3K6yjRY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1743084607; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=n6bkGovYDWEwPMuhmGO3/APdXBLQXfsjmkhnXRHkumk=; 
	b=IM1TyO7xLEJ1k1z0dlAlCttU+hcU+NDiy3hoc6NAUugupIcapU1/mEpJCZlV6znDeB+3Y3Ca//YJtxwbEt7OLb+l6ziJaBkPI4EjzHmDgjHGDH6cWEFYxAgUpLgSfbS4X/QFArnMF+ZJIJ/Sr1zmWlraTPKL65M4G8GK6tRtw3A=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1743084607;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=n6bkGovYDWEwPMuhmGO3/APdXBLQXfsjmkhnXRHkumk=;
	b=NKbxoAz9ZYyZbmjeP4irPQN8c5DHrGlePcnyfvXsLD+vG5SJbV+qJI2xyMfRX4q1
	ZzbvNr6LEvTpNxCsOtWSK4+MsHXYjfQ4DW2apwLrCnNFKLZ0uKyg4dNFdkd6Hkpd69m
	BPPKZY6Ie4TGNlXoqVdXlDHUCx1n0qH7HJdAvDj8=
Received: by mx.zohomail.com with SMTPS id 1743084604813824.3329284862294;
	Thu, 27 Mar 2025 07:10:04 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: ?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
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
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH v3 0/4] Panthor BO tagging and GEMS debug display
Date: Thu, 27 Mar 2025 14:08:33 +0000
Message-ID: <20250327140845.105962-1-adrian.larumbe@collabora.com>
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

Changelog:
 v3:
  - Replaced kfree() with kfree_const() when freeing a bo label
  - Rearranged functions for delaing with GEMs list adding and deleting
  - Changed Kernel BO labelling format not to include quotes
  - Return error in labelling ioctl when string length is too long


Adrián Larumbe (4):
  drm/panthor: Introduce BO labeling
  drm/panthor: Add driver IOCTL for setting BO labels
  drm/panthor: show device-wide list of DRM GEM objects over DebugFS
  drm/panthor: Display heap chunk entries in DebugFS GEMS file

 drivers/gpu/drm/panthor/panthor_device.c |   5 +
 drivers/gpu/drm/panthor/panthor_device.h |  11 ++
 drivers/gpu/drm/panthor/panthor_drv.c    |  66 ++++++++++
 drivers/gpu/drm/panthor/panthor_gem.c    | 158 +++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_gem.h    |  60 +++++++++
 drivers/gpu/drm/panthor/panthor_heap.c   |   3 +
 include/uapi/drm/panthor_drm.h           |  19 +++
 7 files changed, 322 insertions(+)

--
2.48.1

