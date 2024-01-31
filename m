Return-Path: <linux-media+bounces-4505-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E3FC4843D34
	for <lists+linux-media@lfdr.de>; Wed, 31 Jan 2024 11:51:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9050D1F2B210
	for <lists+linux-media@lfdr.de>; Wed, 31 Jan 2024 10:51:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 833E16A022;
	Wed, 31 Jan 2024 10:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="giKRCS0C"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BEF969E09
	for <linux-media@vger.kernel.org>; Wed, 31 Jan 2024 10:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706698217; cv=none; b=KJj/HpfPM0TaWia5cCxpPZwvps4qpyxFtNRXc3xM+f3XJEZB9vsy7VqqxAm7LILXgNWy4eIIAZ6K89U5yZkA5aadhsFB0Va+Kl8eqZLS9fOigsaBc5tTU4d//9Tw0CGIU1gx3TE9qcqshc2SX3IVkl1NEZSVOJqSsw9d2qAeM2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706698217; c=relaxed/simple;
	bh=b8mB+f8jJw1/H6dkdSsBvkUGLOsbPiKIrAKPC1qyNiM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kO5r+QcxXGB66vBehAnV7+7Ba39Bl6QIyuRscMWX1F1X2JLC/sHvgUgAOPKjdq3BmipTKq1lwZa9++JY8KDniyNqA+jQ73ChbUeA98JGzE4XSR54DiIXEIQeezp1ZkXK3t+rXQ6s6aye35bnf/uLRwpOdXIrUxGttDKeS8DffUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=giKRCS0C; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1706698214;
	bh=b8mB+f8jJw1/H6dkdSsBvkUGLOsbPiKIrAKPC1qyNiM=;
	h=From:To:Cc:Subject:Date:From;
	b=giKRCS0CIKDWILqlRrVBatd0FKoFdnMqRlQpioSN38dJ73yrmD8Mys7y+jnom0chQ
	 wj5OiOCUxCRTl8DEi7NGwTM/eZdFW9p7Lv5v9c3wGZzru6T9CLWgXBCHLEqXNQjmPm
	 vZQ76f4qSXyIhzN5HgEzIvJrv4ndu55pR2jJAlEijbAOkLBS2g4u6y+cejbT33Autb
	 G583+GAVzJH0uGp2EodmmkZ9lgCfM0wCStL+HjXNPFIa/umzC+SeHPshXS13rom/Pa
	 LNAW3XXqJdZPdaN3Xpu+cY5H441mUUZAqv6iclNxZZuW90MYHK7mBVhZiIEPFddsQ7
	 Aokn+QxnTA2gw==
Received: from benjamin-XPS-13-9310.. (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 547E03781FCF;
	Wed, 31 Jan 2024 10:50:14 +0000 (UTC)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: hverkuil@xs4all.nl,
	mchehab@kernel.org,
	nicolas.dufresne@collabora.com
Cc: linux-media@vger.kernel.org,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v2 0/2] Enumerate all pixels formats
Date: Wed, 31 Jan 2024 11:50:06 +0100
Message-Id: <20240131105008.109457-1-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The goal of this series is to let userland applications enumerate
all the supported pixels formats of a stateless decoder without
setting all the possible codec-dependent control.
That offer a simplest solution for applications to discover
supported pixels formats and possibly let them doing smarter
choice between stateless decoders.

changes in version 2:
- Clarify documentation.
- Only keep V4L2_FMT_FLAG_ALL_FORMATS flag in ioctl.

Benjamin

Benjamin Gaignard (2):
  media: videodev2: Add V4L2_FMT_FLAG_ALL_FORMATS flag
  media: verisilicon: Use V4L2_FMT_FLAG_ALL_FORMATS flag

 .../media/v4l/dev-stateless-decoder.rst              |  4 ++++
 .../userspace-api/media/v4l/vidioc-enum-fmt.rst      |  5 +++++
 .../userspace-api/media/videodev2.h.rst.exceptions   |  1 +
 drivers/media/platform/verisilicon/hantro_v4l2.c     | 12 +++++++++---
 drivers/media/v4l2-core/v4l2-ioctl.c                 |  3 +++
 include/uapi/linux/videodev2.h                       |  1 +
 6 files changed, 23 insertions(+), 3 deletions(-)

-- 
2.40.1


