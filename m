Return-Path: <linux-media+bounces-42488-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3B1B561BE
	for <lists+linux-media@lfdr.de>; Sat, 13 Sep 2025 17:15:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9FBB51BC3F16
	for <lists+linux-media@lfdr.de>; Sat, 13 Sep 2025 15:15:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 486BD2F0689;
	Sat, 13 Sep 2025 15:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DacbyG/X"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F7601FBCA7
	for <linux-media@vger.kernel.org>; Sat, 13 Sep 2025 15:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757776526; cv=none; b=Skw24dY89Ohb+T8KKl6jLvjGvJC3cSFiJh079UyG2HtFTyYRJrYLd5efK5WczKg5mGvTBAqX6LGE7m3nnCJLCGzvAGp3hsBQ6DnqTNSIX7bPtvBVbDswfVRAsr13bnxwBdgKdP+tr2vwpNwvwQD7sTDEnGBCB5gksM4E6nTrO7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757776526; c=relaxed/simple;
	bh=l9zzPYLM90GOvMlNHMT02xw+SBlYJHbjQGhrt/WjSLo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iL4f8YPDi5Of4WebBNJ/jirkD6B00wSCm44jn4tvM/A1uw8MN4J02vMpC1MOvPbrywm6gsmEb9AtqMqx3eR9L6IECJxVuMYCbU1tjNbkcaGdzxo5w9ogu4+RWTcIo31NsTcUixOy/5rryYXR5LjZNvGtxLjLbJEmYObhUIqDVnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=DacbyG/X; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 2C600A8F;
	Sat, 13 Sep 2025 17:14:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1757776443;
	bh=l9zzPYLM90GOvMlNHMT02xw+SBlYJHbjQGhrt/WjSLo=;
	h=Date:From:To:Cc:Subject:From;
	b=DacbyG/XCsbcG8esf5NSajfkFcWEiTts3DDMvbTAIlCytv4wqwWFt8+5/3y4+wdhL
	 mFXuBbAApxGWXOmDpq0WNpp2/kNciL7sMDfbUzJP0E0KbB2VVfWdpfYn/RQKqcOpRo
	 nXYKgna+6SOLja+LsXB65ccaDPWzbeCMk6fVFJ1k=
Date: Sat, 13 Sep 2025 18:14:53 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hans@jjverkuil.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, Hans de Goede <hansg@kernel.org>,
	Darshan Rathod <darshanrathod475@gmail.com>,
	Desnes Nunes <desnesn@redhat.com>,
	Michal Pecio <michal.pecio@gmail.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
Subject: [GIT PULL FOR v6.18] uvcvideo changes
Message-ID: <20250913151453.GA461@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Hans, Mauro,

The following changes since commit ecba852dc9f4993f4f894ea1f352564560e19a3e:

  media: redrat3: use int type to store negative error codes (2025-09-11 08:46:10 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/linux-media/users/uvc.git tags/next-media-uvc-20250913

for you to fetch changes up to 43796cd8493e4abd10851449bef95b7aa9d73258:

  media: uvcvideo: Mark invalid entities with id UVC_INVALID_ENTITY_ID (2025-09-13 17:47:15 +0300)

There are a few CI failures
(https://gitlab.freedesktop.org/linux-media/users/uvc/-/pipelines/1509824),
all in the media-patchstyle job:

- "Committer ... is not the last SoB"

  I ignore those. They would require reordering trailers if Hans or I
  need to rebase branches, as that can change the committer. It's
  important to ensure the committer has a SoB line, but not that it's
  the last. I think that check should be dropped from CI (or rather
  replaced by a check that ensures the SoB is present).

- "Commit ... needs to provide a reason to avoid the nomination to stable"

  False positive, due to the CI script requiring
  "<stable+noautosel@kernel.org>" while "stable+noautosel@kernel.org" is
  also valid.

There's also a "WARNING: Reported-by: should be immediately followed by
Closes: with a URL to the report". That's not an oversight, I can't add
a Closes: tag as the report wasn't public in this case.

----------------------------------------------------------------
Changes to the uvcvideo driver:

- Simplify locking by dropping redundant mutex
- Improve log messages for multi-function devices
- Support the Chrome OS XU IQ_PROFILE control
- Fix incorrect behaviour with buggy (or malicious) devices using
  non-unique entity IDs
- Miscellaneous improvements (including cosmetic changes and comments
  improvements)

----------------------------------------------------------------
Darshan Rathod (1):
      media: uvcvideo: Fix assignment in if condition

Desnes Nunes (1):
      media: uvcvideo: Avoid variable shadowing in uvc_ctrl_cleanup_fh

Laurent Pinchart (3):
      media: uvcvideo: Drop unneeded memset() in meta device ioctl handlers
      media: uvcvideo: Add missing curly braces
      media: uvcvideo: Move MSXU_CONTROL_METADATA definition to header

Michal Pecio (1):
      media: uvcvideo: Shorten the transfer size non compliance message

Ricardo Ribalda (7):
      media: uvcvideo: Fix comments in uvc_meta_detect_msxu
      media: uvcvideo: Drop stream->mutex
      media: uvcvideo: Move video_device under video_queue
      media: uvcvideo: Use intf instead of udev for printks
      media: uvcvideo: Do not re-reference dev->udev
      media: uvcvideo: Run uvc_ctrl_init_ctrl for all controls
      media: uvcvideo: Support UVC_CROSXU_CONTROL_IQ_PROFILE

Thadeu Lima de Souza Cascardo (1):
      media: uvcvideo: Mark invalid entities with id UVC_INVALID_ENTITY_ID

 drivers/media/usb/uvc/uvc_ctrl.c     |  56 ++++++++++++-----
 drivers/media/usb/uvc/uvc_driver.c   | 115 ++++++++++++++++++++---------------
 drivers/media/usb/uvc/uvc_entity.c   |   4 +-
 drivers/media/usb/uvc/uvc_metadata.c |  49 +++++++--------
 drivers/media/usb/uvc/uvc_status.c   |   7 ++-
 drivers/media/usb/uvc/uvc_v4l2.c     |  43 +++----------
 drivers/media/usb/uvc/uvc_video.c    |  10 +--
 drivers/media/usb/uvc/uvcvideo.h     |  16 ++---
 include/linux/usb/uvc.h              |  22 +++++++
 9 files changed, 173 insertions(+), 149 deletions(-)

-- 
Regards,

Laurent Pinchart

