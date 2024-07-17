Return-Path: <linux-media+bounces-15082-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1E1933D70
	for <lists+linux-media@lfdr.de>; Wed, 17 Jul 2024 15:14:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 19F781C22BB4
	for <lists+linux-media@lfdr.de>; Wed, 17 Jul 2024 13:14:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2AD9180A69;
	Wed, 17 Jul 2024 13:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="QrZdavHX"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8285017F378;
	Wed, 17 Jul 2024 13:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721222080; cv=none; b=qkmWQq2FvzySz6i1eaFkI7ad3zo13VFqF8I0ruqCprVr+2ZglJ94RKOd3EdKE5QyeLItkLI8e4nv0jXVqeE2mQTZt9OlDoPO2w8ai1f4yro9S41isHwXCijF+T/3UPDd++C+zUWx3T6RWR/zoDiv2/UMjnxmwUGDNmeVTm7rYzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721222080; c=relaxed/simple;
	bh=ZxsGe7FlMMOHR0L4WkeMkpRyIJyPnZ5MwpJxdqYRlY0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PZ7pxfhQ6AS+8+TEEs6pWez0teUJvCOq7TAuVJruxrNdpjgGMA3UfQm0Pf1N7Fc87A7k9hzFrN6kpnrbV6JS38W7X1PbgMD/e6G3jU4K2D9aELOrhRdrsVB1sGjSS0YUurlFqmIj/m2sEwlBfydqXq7EGwT4O6OtQBozJIcxAgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=QrZdavHX; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1721222076;
	bh=ZxsGe7FlMMOHR0L4WkeMkpRyIJyPnZ5MwpJxdqYRlY0=;
	h=From:To:Cc:Subject:Date:From;
	b=QrZdavHXQYY+Gw9MbeLg9slFUujfN2ORzzN2xVUmq33vxKZdxnOkbgexeZTspfj49
	 t7FmYrgUC5On+343Wj+D/ZogtEl9MyB+TZ5bxOWavZfgJcy7Sr8lhXpQ+SKuxk1aW5
	 mJ8vNRTzQorPq17QQnXv4gj4HpIDwmOa3qzrEb93fXKpjTMvqWxXFMBLoom21YRLIT
	 76kRWn/JxJRDKfuXp/l6zfcFsrAhMHYspzE9y6ysN4xzdiCI517EbNowgUQkNJLTb8
	 TOHeUCz9J9RwMe20RrYoJXAg7b4vPXePH7vjEc2qlwFmnQYivxj3Hx6fp4QxeE3Bps
	 Sv1rYTRQf2tzA==
Received: from benjamin-XPS-13-9310.. (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 26C9D3780BC2;
	Wed, 17 Jul 2024 13:14:36 +0000 (UTC)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: mchehab@kernel.org,
	ezequiel@vanguardiasur.com.ar,
	hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v4 0/2] Enumerate all pixels formats
Date: Wed, 17 Jul 2024 15:14:28 +0200
Message-ID: <20240717131430.159727-1-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.43.0
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

An example of how it can be used in GStreamer to discover the
supported pixels formats for stateless decoder is available here:
https://gitlab.freedesktop.org/benjamin.gaignard1/gstreamer/-/commits/v4l2codecs_enum_all_supported_formats?ref_type=heads

changes in version 4:
- Explicitly document that the new flags are targeting mem2mem devices.

changes in version 3:
- Add a flag to inform userspace application that driver
  as take care of the flag.

changes in version 2:
- Clarify documentation.
- Only keep V4L2_FMT_FLAG_ALL_FORMATS flag in ioctl.

Benjamin

Benjamin Gaignard (2):
  media: videodev2: Add flags to unconditionnaly enumerate pixels
    formats
  media: verisilicon: Use V4L2_FMT_FLAG_ENUM_ALL_FORMATS flag

 .../media/v4l/dev-stateless-decoder.rst          |  6 ++++++
 .../userspace-api/media/v4l/vidioc-enum-fmt.rst  | 11 +++++++++++
 .../media/videodev2.h.rst.exceptions             |  2 ++
 drivers/media/platform/verisilicon/hantro_v4l2.c | 16 +++++++++++++---
 drivers/media/v4l2-core/v4l2-ioctl.c             |  3 +++
 include/uapi/linux/videodev2.h                   |  2 ++
 6 files changed, 37 insertions(+), 3 deletions(-)

-- 
2.43.0


