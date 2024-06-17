Return-Path: <linux-media+bounces-13479-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E79F790BA15
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 20:48:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9B6E41C245A1
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 18:48:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F67C198A38;
	Mon, 17 Jun 2024 18:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="KtxyItUw"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10FF166312
	for <linux-media@vger.kernel.org>; Mon, 17 Jun 2024 18:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718650095; cv=none; b=GIa55IbVJFW5V6o/KBakQLJaZaSqRXgMA7WQ1gZu0Fqqi9zxoQQXcdfdEDFpoN/MkfFz5z6mc93SPhUOpErSoVGWbYbQQA1zmsLXo7TsTIZzaWEWGGAR667hM7jWsn9eES01RyUG3TKXGyelGvavgkRxAkDPqsskD3sHilv1iIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718650095; c=relaxed/simple;
	bh=Ard6r4DCpeIqRIoL/8snjOE0kG+4/w3gflE5kK/74FU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fFtyBcEBiC1BfxtOP2u45aqk1Vu6s7zAEQtJtBjfMlB+KeK7Bg992Yy6Z4nL6hinDox/rP8MB7/RXFL/rPiWskHbDidqaAtJ1Im+1HdV1ASn9TUVUN9JBGy4DJ/rIJBD2qineNsCHL/UVXaG6Enc78pR6VG5fooq/nZJVRg1u1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=KtxyItUw; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id ECF672D5;
	Mon, 17 Jun 2024 20:47:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718650074;
	bh=Ard6r4DCpeIqRIoL/8snjOE0kG+4/w3gflE5kK/74FU=;
	h=Date:From:To:Cc:Subject:From;
	b=KtxyItUwi1T0b4Mz+VWqymWvTJXPin6qpIWydGQLPkRV9L0WQ4DGSyZtVwhqrG/UH
	 iNcCxin5KshJubp2A16TZ3woZh0JQP3z1vphpnEWbPjAD6R/ELVq4Yr5heJk4mWqdu
	 VY3E8qcTo824siYAWwGq36FhIq7bNF1FoH2Z1AwA=
Date: Mon, 17 Jun 2024 21:47:49 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: =?utf-8?B?8J+Qpy1tZWRpYQ==?= <linux-media@vger.kernel.org>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Ricardo Ribalda <ribalda@chromium.org>
Subject: [GIT PULL FOR v6.11] uvcvideo fixes and improvements
Message-ID: <20240617184749.GB23867@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Hans, Mauro,

The following changes since commit 91798162245991e26949ef62851719bb2177a9c2:

  media: v4l: add missing MODULE_DESCRIPTION() macros (2024-06-15 11:16:40 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git tags/media-next-uvc-20240617

for you to fetch changes up to 3d93396243319946c75c1e1542363e53deeced45:

  media: uvcvideo: Remove mappings form uvc_device_info (2024-06-17 21:02:12 +0300)

----------------------------------------------------------------
uvcvideo fixes and improvements

----------------------------------------------------------------
Daniel Schaefer (1):
      media: uvcvideo: Override default flags

Laurent Pinchart (1):
      media: uvcvideo: Force UVC version to 1.0a for 0408:4035

Michal Pecio (1):
      media: uvcvideo: Fix the bandwdith quirk on USB 3.x

Oleksandr Natalenko (1):
      media: uvcvideo: Add quirk for invalid dev_sof in Logitech C920

Ricardo Ribalda (14):
      media: uvcvideo: Support timestamp lists of any size
      media: uvcvideo: Ignore empty TS packets
      media: uvcvideo: Quirk for invalid dev_sof in Logitech C922
      media: uvcvideo: Allow hw clock updates with buffers not full
      media: uvcvideo: Refactor clock circular buffer
      media: uvcvideo: Fix hw timestamp handling for slow FPS
      media: uvcvideo: Fix integer overflow calculating timestamp
      media: uvcvideo: Enforce alignment of frame and interval
      media: uvcvideo: Allow custom control mapping
      media: uvcvideo: Refactor Power Line Frequency limit selection
      media: uvcvideo: Probe the PLF characteristics
      media: uvcvideo: Cleanup version-specific mapping
      media: uvcvideo: Remove PLF device quirking
      media: uvcvideo: Remove mappings form uvc_device_info

 drivers/media/usb/uvc/uvc_ctrl.c   | 193 +++++++++++++++++++++----------------
 drivers/media/usb/uvc/uvc_driver.c | 160 ++++++------------------------
 drivers/media/usb/uvc/uvc_video.c  | 169 ++++++++++++++++++++++----------
 drivers/media/usb/uvc/uvcvideo.h   |  10 +-
 4 files changed, 261 insertions(+), 271 deletions(-)

-- 
Regards,

Laurent Pinchart

