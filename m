Return-Path: <linux-media+bounces-34831-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C35ADA3A2
	for <lists+linux-media@lfdr.de>; Sun, 15 Jun 2025 22:38:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 67AC23A8834
	for <lists+linux-media@lfdr.de>; Sun, 15 Jun 2025 20:38:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84A6027BF7E;
	Sun, 15 Jun 2025 20:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ppD+Mc9K"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61DAE29A2
	for <linux-media@vger.kernel.org>; Sun, 15 Jun 2025 20:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750019920; cv=none; b=Sqfind3Kjh8ECeMug2/yJE9O04hfsH/FGqeyjy5d25Npk/A5Gx4enDJ2nQwFZ00fuuwWuxXMjhlF00XYKYB9erJSEmWSZhbFlTY1PeONvTImwOw597uXfsOPkDv6mW6JsX/UeuPx5lLgpEp/g6w98d+xcmyvJBgrQCD3+7cb4fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750019920; c=relaxed/simple;
	bh=ZxX15PCxk1eBknJ+IhTzr4APt9m9IGorWS/ZUAI0Ylc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EKqPqBXW+tpxmDtkgzBRyTRlAQYIvCWQlmp7fYA9rJol/ZZ6loXn9CFhsRrdru5nJCb+g3uiTJeiXSk7NMLq3s2jV247KmzSO8ZyS80/fnl/dQ5ZywFU9tGECz6StxGEb804UXuR8jcNMCTt/DrBeF3Kdzo8aQE2c7oV7EeSxbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ppD+Mc9K; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 23F7A8BE;
	Sun, 15 Jun 2025 22:38:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750019906;
	bh=ZxX15PCxk1eBknJ+IhTzr4APt9m9IGorWS/ZUAI0Ylc=;
	h=Date:From:To:Cc:Subject:From;
	b=ppD+Mc9KILXxAvBTZNEi8MYSFrmVClv31opI6/hlEmG+VqNW81Dz2/GhoGwRbxmzS
	 72kfUmwkkGfClzdcdxoiSOKAjSeA/w9PgvpW8dBUotpKfX5m1SzrIhB3g1YY80xaQB
	 PlWVMAHAJijIF0y6ODzjgc2+c93E6aAiTcYvDkns=
Date: Sun, 15 Jun 2025 23:38:23 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hans@jjverkuil.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, chenchangcheng <chenchangcheng@kylinos.cn>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Youngjun Lee <yjjuny.lee@samsung.com>,
	Hans de Goede <hansg@kernel.org>
Subject: [GIT PULL FOR v6.17] uvcvideo improvements
Message-ID: <20250615203823.GA32454@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/linux-media/users/uvc.git tags/next-media-uvc-20250615

for you to fetch changes up to 1fa3e1b57448e056305210a51ec6981e186cfc8f:

  media: uvcvideo: Fix 1-byte out-of-bounds read in uvc_parse_format() (2025-06-15 23:04:04 +0300)

----------------------------------------------------------------
Improvements to the uvcvideo driver:

- Fix bandwidth issue with buggy devices
- Add quirks for new device
- Fix out-of-bounds read
- Miscellaneous refactoring and cleanup

----------------------------------------------------------------
Ricardo Ribalda (6):
      media: uvcvideo: Set V4L2_CTRL_FLAG_DISABLED during queryctrl errors
      media: uvcvideo: Populate all errors in uvc_probe()
      media: uvcvideo: Refactor uvc_ctrl_set_handle()
      media: uvcvideo: Refactor uvc_queue_streamon
      media: uvcvideo: Refactor uvc_v4l2_compat_ioctl32
      media: uvcvideo: Add quirk for HP Webcam HD 2300

Youngjun Lee (1):
      media: uvcvideo: Fix 1-byte out-of-bounds read in uvc_parse_format()

chenchangcheng (1):
      media: uvcvideo: Fix bandwidth issue for Alcor camera

 drivers/media/usb/uvc/uvc_ctrl.c   | 123 ++++++++++++++++++++++++-------------
 drivers/media/usb/uvc/uvc_driver.c |  30 +++++----
 drivers/media/usb/uvc/uvc_v4l2.c   |  29 +++++----
 drivers/media/usb/uvc/uvc_video.c  |   9 +++
 drivers/media/usb/uvc/uvcvideo.h   |   2 +
 5 files changed, 125 insertions(+), 68 deletions(-)

-- 
Regards,

Laurent Pinchart

