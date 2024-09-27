Return-Path: <linux-media+bounces-18710-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 43252988BA5
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2024 23:00:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7455D1C20EB9
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2024 21:00:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 578FD1C245F;
	Fri, 27 Sep 2024 21:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="krAQUj75"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DFA41C1AD0
	for <linux-media@vger.kernel.org>; Fri, 27 Sep 2024 21:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727470805; cv=none; b=nXrNDjlM1jHr939opJw5pCEA9nJCvV/FAhATv/JnJSFQhhzk/4Y1qU+c2OUlq6sx9hIbIi1UFrrnvIuYdZ0dh8by76tCrOwLwaOgMC4QEHz2f/6uP5dtBJt0nVzGJwrOtwljvyzAKtQcdmGuOKeie6Hq0kHmKxl/Z+ZgCNKBpB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727470805; c=relaxed/simple;
	bh=PCdYL1SMGRCFAYWdhz2V+NPO58LIE+WVYrE1+OWaaP8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dUklnO2/yN1cSrnblnii4oTj/mjk18ZRl/DCJ9rCfWYAUtCMIKqxxR1VFMA2hpuEsdkA78PZzQzRCX7Ohgew9yjlQ3McvBUB/r4aiB5xj2bWVFnuIKT/6jv0UZTR65uXHqLkb+LH3qjiI8mBNHz8i4SbdT6wh4diRbKNOyR5yYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=krAQUj75; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DD2D883D;
	Fri, 27 Sep 2024 22:58:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1727470713;
	bh=PCdYL1SMGRCFAYWdhz2V+NPO58LIE+WVYrE1+OWaaP8=;
	h=Date:From:To:Cc:Subject:From;
	b=krAQUj75raSS5z5BqVYXwTaowIuuKZL1zf/gZ9Qo0j0T+zBMaAwLC102i+Bgl8cVb
	 cMJVZW0lF8EzPBKmU3znALtTRC95FH1KV1SPUVEtsn77t0YmLv+ytH+dXOt2wNyA1i
	 Mc+zZY1jCXzSsqhLMOVNbYbXqVwbx3AJhS5fJyrs=
Date: Fri, 27 Sep 2024 23:59:59 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: =?utf-8?B?8J+Qpy1tZWRpYQ==?= <linux-media@vger.kernel.org>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [GIT PULL FOR v6.13] uvcvideo changes
Message-ID: <20240927205959.GA12322@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Hans, Mauro,

The following changes since commit 81ee62e8d09ee3c7107d11c8bbfd64073ab601ad:

  media: atomisp: Use clamp() in ia_css_eed1_8_vmem_encode() (2024-09-10 07:30:36 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git tags/next-media-uvc-20240927

for you to fetch changes up to 6086ab8196df1479caa35458b35512e763f1b88c:

  media: uvcvideo: Exit early if there is not int_urb (2024-09-27 19:22:45 +0300)

The CI pipeline ran with warnings, see
https://gitlab.freedesktop.org/linux-media/users/pinchartl/-/pipelines/1279622.
The checkpatch test warnings are fine, and the trust test warnings are
caused by a bug in the CI (the recent trees rename missed a file, see
https://gitlab.freedesktop.org/linux-media/media-ci/-/merge_requests/142
for the fix).

----------------------------------------------------------------
uvcvideo improvements:

- Fixes for race conditions and crashes with UVC invalid descriptors
- Support for new RGB565 pixel format
- Device quirks

----------------------------------------------------------------
David Given (2):
      media: uvcvideo: Add support for the D3DFMT_R5G6B5 pixmap type
      media: uvcvideo: Add a quirk for the Kaiweets KTI-W02 infrared camera

Dmitry Perchanov (3):
      media: v4l: Add luma 16-bit interlaced pixel format
      media: uvcvideo: Add luma 16-bit interlaced pixel format
      media: uvcvideo: RealSense D421 Depth module metadata

Ricardo Ribalda (4):
      media: uvcvideo: Force UVC version to 1.0a for 0408:4033
      media: uvcvideo: Refactor the status irq API
      media: uvcvideo: Avoid race condition during unregister
      media: uvcvideo: Exit early if there is not int_urb

Thadeu Lima de Souza Cascardo (1):
      media: uvcvideo: Require entities to have a non-zero unique ID

 .../userspace-api/media/v4l/pixfmt-y16i.rst        |  73 +++++++++++++
 .../userspace-api/media/v4l/yuv-formats.rst        |   1 +
 drivers/media/common/uvc.c                         |   8 ++
 drivers/media/usb/uvc/uvc_driver.c                 | 114 ++++++++++++++-------
 drivers/media/usb/uvc/uvc_status.c                 |  63 +++++++++++-
 drivers/media/usb/uvc/uvc_v4l2.c                   |  22 ++--
 drivers/media/usb/uvc/uvcvideo.h                   |  10 +-
 drivers/media/v4l2-core/v4l2-ioctl.c               |   1 +
 include/linux/usb/uvc.h                            |   6 ++
 include/uapi/linux/videodev2.h                     |   1 +
 10 files changed, 237 insertions(+), 62 deletions(-)
 create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-y16i.rst

-- 
Regards,

Laurent Pinchart

