Return-Path: <linux-media+bounces-32132-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D828AB13C4
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 14:46:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5105F9810DB
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 12:46:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 234992AF19;
	Fri,  9 May 2025 12:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="uAYSXEnL"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7766139B
	for <linux-media@vger.kernel.org>; Fri,  9 May 2025 12:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746794793; cv=none; b=FDXgIlmB/pZ74RLksledK0PHS3dW/TALsFWdvBSIMpXAoscIzG5FeDAuFsEb0TuUxkEpJffUi+WGEX2iwL+z42VblSsC8CqglTgGyPnO8eBIMmyEywA17odQtN74vvjDHk/31I8yS/w74mTbZlUXivVUThB0A+UxXUBQOhxWaSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746794793; c=relaxed/simple;
	bh=/KsyqZP3DVf956iJhaDVlb3BcZ2ZbYVFBTB3TNGW2us=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TJd0d8+VRfjVf+/hwhhVc4p46QnwuHX6H1E5MmM0TeJN4LHPwlmZya64v1izfujf33SOBdClngOZlnnETlPCkrqcMKIdoyHWrGt9S6Br45cskrH+iRAEJUZR/hqp82vgW+3X3t/oo6STXfDLyFihhVjHftaHJlnV4o4Fqiv/mU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=uAYSXEnL; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (noh63-h01-176-133-119-130.dsl.sta.abo.bbox.fr [176.133.119.130])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6EF488DB;
	Fri,  9 May 2025 14:46:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1746794771;
	bh=/KsyqZP3DVf956iJhaDVlb3BcZ2ZbYVFBTB3TNGW2us=;
	h=Date:From:To:Cc:Subject:From;
	b=uAYSXEnLFRoJ/Bc3sljTMAORdPRhQyczT76B4379by+2yytFdwjwx6GRu5SVyvpXG
	 i6WfCXIrqxY7s0GCZJ/C7NjvAtEV7RZmHKz2bAYrcKLPWnifMEu6dpwvnZdBKwPlw6
	 WckYG1EwosDix1NFfNnm1cWsqR3CEijEasaMdIZs=
Date: Fri, 9 May 2025 14:46:15 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hans@jjverkuil.nl>
Cc: linux-media@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
	Ricardo Ribalda <ribalda@chromium.org>
Subject: [GIT PULL FOR v6.16] uvcvideo improvements
Message-ID: <20250509124615.GA12452@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Mauro, Hans,

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/linux-media/users/pinchartl.git tags/next-media-uvc-20250509

for you to fetch changes up to 9882222fa76450e545aeb625522ced7a78ff79a0:

  media: uvcvideo: Use dev_err_probe for devm_gpiod_get_optional (2025-04-07 15:31:55 +0200)

----------------------------------------------------------------
uvcvideo improvements:

- Granular power saving
- Controls cache sync fix
- GPIO deferred probe error fix

----------------------------------------------------------------
Ricardo Ribalda (10):
      media: uvcvideo: Keep streaming state in the file handle
      media: uvcvideo: Create uvc_pm_(get|put) functions
      media: uvcvideo: Increase/decrease the PM counter per IOCTL
      media: uvcvideo: Make power management granular
      media: uvcvideo: Do not turn on the camera for some ioctls
      media: uvcvideo: Return the number of processed controls
      media: uvcvideo: Send control events for partial succeeds
      media: uvcvideo: Rollback non processed entities on error
      media: uvcvideo: Fix deferred probing error
      media: uvcvideo: Use dev_err_probe for devm_gpiod_get_optional

 drivers/media/usb/uvc/uvc_ctrl.c   |  91 +++++++++++++++++++++--------
 drivers/media/usb/uvc/uvc_driver.c |  38 ++++++++----
 drivers/media/usb/uvc/uvc_v4l2.c   | 117 +++++++++++++++++++++++++++++--------
 drivers/media/usb/uvc/uvcvideo.h   |   5 ++
 4 files changed, 190 insertions(+), 61 deletions(-)

-- 
Regards,

Laurent Pinchart

