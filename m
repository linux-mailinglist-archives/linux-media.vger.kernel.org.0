Return-Path: <linux-media+bounces-23754-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 159E69F71E0
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 02:42:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A2B127A395A
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 01:41:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2155378F29;
	Thu, 19 Dec 2024 01:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qfIYHRux"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC467405A
	for <linux-media@vger.kernel.org>; Thu, 19 Dec 2024 01:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734572500; cv=none; b=kNGKQzmN0/ANxGJEnQr1V2sI3qtMMll+E+pEgulYYsUZdLvDE0AceVTsc2yzhtaQ2dhLmDW8Z9c64EXJW92PvmOY456Ky2VLTQhmEHzANs/BR+3+sqNT9roNYV8wjSU/Q5bKOulYGchjb1VspQm51ow/klPJaZhDG0N/kqZd1Wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734572500; c=relaxed/simple;
	bh=PJzoUz8spjAm5KOMPuroyGAvbNQNrZDw0HBkP4TCdbk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R71kbVjTTgRaJskDZU8uI9Rk34uGLAbWcDwCrbebwW9WhG3cqrSlQ5VKxq8faejmFOZclVBbNCpuWXybV4vhH6K9OGOAgoTf+645uiqbPT+khIHeAqtL6E/017e4+eMKsu/8Dfn++sKvYemBKGX2az0h1jMSYfOTDdSFWa2JP1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qfIYHRux; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9C12D415;
	Thu, 19 Dec 2024 02:40:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1734572458;
	bh=PJzoUz8spjAm5KOMPuroyGAvbNQNrZDw0HBkP4TCdbk=;
	h=Date:From:To:Cc:Subject:From;
	b=qfIYHRuxHpOASZaDGFrfbXXDPdJpvdXE22RAphVR4YJS/ZQPrONiaewvPGYBLrt2j
	 kdeEsa40ti6H8SnMnutAOkjg1rwDfmL0ZyTCE9ltunxn2cfNfhkpK7Zuat4fDYLS+v
	 7qlcP5zSIIFrXWD3bIzf7T91TM+mL+zXHbDX+E0Y=
Date: Thu, 19 Dec 2024 03:41:32 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>
Subject: [GIT PULL FOR v6.14] uvcvideo changes
Message-ID: <20241219014132.GN5518@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Mauro, Hans,

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/linux-media/users/uvc.git tags/next-media-uvc-20241219

for you to fetch changes up to 64cdf3e8e9a7dadc9413323b048bf151cee61ae9:

  media: uvcvideo: Announce the user our deprecation intentions (2024-12-19 02:50:36 +0200)

----------------------------------------------------------------
uvcvideo fixes and improvements

----------------------------------------------------------------
Benoit Sevens (1):
      media: uvcvideo: Refactor frame parsing code into a uvc_parse_frame function

Laurent Pinchart (2):
      media: uvcvideo: Fix double free in error path
      MAINTAINERS: Add missing file entries for the USB video class driver

Ricardo Ribalda (16):
      media: uvcvideo: Reorder uvc_status_init()
      media: uvcvideo: Fix crash during unbind if gpio unit is in use
      media: uvcvideo: Fix deadlock during uvc_probe
      media: uvcvideo: Fix event flags in uvc_ctrl_send_events
      media: uvcvideo: Support partial control reads
      media: uvcvideo: Add more logging to uvc_query_ctrl()
      media: uvcvideo: Remove duplicated cap/out code
      media: uvcvideo: Only save async fh if success
      media: uvcvideo: Remove redundant NULL assignment
      media: uvcvideo: Remove dangling pointers
      media: uvcvideo: Annotate lock requirements for uvc_ctrl_set
      media: uvcvideo: Flush the control cache when we get an event
      media: uvcvideo: Propagate buf->error to userspace
      media: uvcvideo: Invert default value for nodrop module param
      media: uvcvideo: Allow changing noparam on the fly
      media: uvcvideo: Announce the user our deprecation intentions

Xiong Nandi (1):
      media: uvcvideo: Use uvc_query_name in uvc_get_video_ctrl

 MAINTAINERS                        |   4 +
 drivers/media/usb/uvc/uvc_ctrl.c   |  88 ++++++++++--
 drivers/media/usb/uvc/uvc_driver.c | 280 +++++++++++++++++++++----------------
 drivers/media/usb/uvc/uvc_queue.c  |   9 +-
 drivers/media/usb/uvc/uvc_status.c |   8 +-
 drivers/media/usb/uvc/uvc_v4l2.c   | 164 ++++++----------------
 drivers/media/usb/uvc/uvc_video.c  |  32 ++++-
 drivers/media/usb/uvc/uvcvideo.h   |  14 +-
 8 files changed, 336 insertions(+), 263 deletions(-)

-- 
Regards,

Laurent Pinchart

