Return-Path: <linux-media+bounces-27289-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 291C0A4AE22
	for <lists+linux-media@lfdr.de>; Sat,  1 Mar 2025 23:22:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 937C87A2A34
	for <lists+linux-media@lfdr.de>; Sat,  1 Mar 2025 22:21:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 646031E832A;
	Sat,  1 Mar 2025 22:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="RWnJ1W7V"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03CA12B2DA
	for <linux-media@vger.kernel.org>; Sat,  1 Mar 2025 22:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740867749; cv=none; b=W8+WKwg3WoW1Ydkpq7ehUFhT6JvlKniNvedQzN1N9kKvW6cw2FbsMkljLUkaQvYLes+4Fh2NRl+++jvC7e8gHC+LdNLzmGMZOZZ9SINEJNHe1VnHROzdGBLwg1yRUNR6JgQUr3LukKZPLXgxSFPD663PEdEeNeLIqfmIK8l/yzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740867749; c=relaxed/simple;
	bh=A+rsZqUPeWUKSK+WhNRVxC/E2KIltROwMEgY3A1SpH0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Oq66ouDYePNi8Mv7S2IZogmHE65fHNjdzl0WOa/mFpH+2UhzfB36Cm9uyLE3cqcf8KKPYRiqqqQhkgrXuENUlmhTG8ggZNHQJa/K24DMSww+YNR+crdva3/vE3rUpmj6i4pnKyH62DYuL2/dcBzHXgdJRa7zHzcswNeASUvdybI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=RWnJ1W7V; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B6C82520;
	Sat,  1 Mar 2025 23:20:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1740867655;
	bh=A+rsZqUPeWUKSK+WhNRVxC/E2KIltROwMEgY3A1SpH0=;
	h=Date:From:To:Cc:Subject:From;
	b=RWnJ1W7VpCQ7K2pgwpZ295pJxfjTN2auoiuEuBHY2DDauHzTXxqabKg5KVEGyDJRN
	 81H0z/JTCECDRSUEOuXhPeONBsq+FjKLhDS7YE2YWjKt58BzyFa1PwHt/fHqbkApK7
	 cVTCuUJVEWRdhxJdgP3eraBiETb1rP/d+uWCBxJE=
Date: Sun, 2 Mar 2025 00:22:07 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Ricardo Ribalda <ribalda@chromium.org>, linux-media@vger.kernel.org
Subject: [GIT PULL FOR v6.15] uvcvideo improvements
Message-ID: <20250301222207.GA15528@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Mauro, Hans,

(This time CC'ing linux-media)

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/linux-media/users/uvc.git tags/next-media-uvc-20250301

for you to fetch changes up to 1e7ce5414ea8548c450f06dc0f4a5124bac12d3e:

  media: uvcvideo: Drop the uvc_driver structure (2025-02-23 21:31:12 +0200)

----------------------------------------------------------------
uvcvideo improvements:

- Support for UVC 1.5 Region of Interest (ROI) control
- Quirk for Actions UVC05 device
- Misc cleanup

----------------------------------------------------------------
Hans Verkuil (1):
      media: v4l2-ctrls: add support for V4L2_CTRL_WHICH_MIN/MAX_VAL

Laurent Pinchart (1):
      media: uvcvideo: Drop the uvc_driver structure

Ricardo Ribalda (11):
      media: uvcvideo: Handle uvc menu translation inside uvc_get_le_value
      media: uvcvideo: Handle uvc menu translation inside uvc_set_le_value
      media: uvcvideo: refactor uvc_ioctl_g_ext_ctrls
      media: uvcvideo: uvc_ioctl_(g|s)_ext_ctrls: handle NoP case
      media: uvcvideo: Support any size for mapping get/set
      media: uvcvideo: Factor out clamping from uvc_ctrl_set
      media: uvcvideo: Factor out query_boundaries from query_ctrl
      media: uvcvideo: let v4l2_query_v4l2_ctrl() work with v4l2_query_ext_ctrl
      media: uvcvideo: Introduce uvc_mapping_v4l2_size
      media: uvcvideo: Add sanity check to uvc_ioctl_xu_ctrl_map
      media: uvcvideo: Add quirk for Actions UVC05

Yunke Cao (6):
      media: v4l2_ctrl: Add V4L2_CTRL_TYPE_RECT
      media: vivid: Add a rectangle control
      media: uvcvideo: add support for compound controls
      media: uvcvideo: support V4L2_CTRL_WHICH_MIN/MAX_VAL
      media: uvcvideo: implement UVC v1.5 ROI
      media: uvcvideo: document UVC v1.5 ROI

 .../userspace-api/media/drivers/uvcvideo.rst       |  64 ++
 .../userspace-api/media/v4l/vidioc-g-ext-ctrls.rst |  26 +-
 .../userspace-api/media/v4l/vidioc-queryctrl.rst   |  14 +
 .../userspace-api/media/videodev2.h.rst.exceptions |   4 +
 drivers/media/i2c/imx214.c                         |   4 +-
 drivers/media/platform/qcom/venus/venc_ctrls.c     |   9 +-
 drivers/media/test-drivers/vivid/vivid-ctrls.c     |  34 +
 drivers/media/usb/uvc/uvc_ctrl.c                   | 799 ++++++++++++++++-----
 drivers/media/usb/uvc/uvc_driver.c                 |  44 +-
 drivers/media/usb/uvc/uvc_v4l2.c                   |  85 +--
 drivers/media/usb/uvc/uvcvideo.h                   |  32 +-
 drivers/media/v4l2-core/v4l2-ctrls-api.c           |  54 +-
 drivers/media/v4l2-core/v4l2-ctrls-core.c          | 167 ++++-
 drivers/media/v4l2-core/v4l2-ioctl.c               |   4 +-
 include/media/v4l2-ctrls.h                         |  38 +-
 include/uapi/linux/usb/video.h                     |   1 +
 include/uapi/linux/uvcvideo.h                      |  13 +
 include/uapi/linux/v4l2-controls.h                 |   7 +
 include/uapi/linux/videodev2.h                     |   5 +
 19 files changed, 1088 insertions(+), 316 deletions(-)

-- 
Regards,

Laurent Pinchart

