Return-Path: <linux-media+bounces-37520-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20259B02059
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 17:24:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 77A2C4A44C6
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 15:24:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CED92E7629;
	Fri, 11 Jul 2025 15:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hW2dfD53"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7D918E750
	for <linux-media@vger.kernel.org>; Fri, 11 Jul 2025 15:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752247462; cv=none; b=Q2kUYozPmkWrIyXDZhHWTKoAM+BBjSg22DoTdDCjN0ESpcfsmb73CF87zwXQvv/VlAjL//KkTwmtQs+T8/OfjOcFhztZMeU8EZxqsSJ2WG0AVMo24N5IIXVHObIiGPOZqqVg3LoVIc9/7ShYaPZ+yF4PNQGIcohXes9+zg4j3uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752247462; c=relaxed/simple;
	bh=yJ8TeCP7QMW8f3wQWNtyCH+5qgZS98VackQUFbcNjvQ=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=fb8GzQlQuuA7hVV4c+EjkKjGAnVtZet4XFXUIO3Tpn7CgRpBpKy/mnkZVI417GYJmpOSJQGxNd5sgbSZBbOvaJOMLPsuhVO154LUZke/r+1cwTIhO1XHTLIwaq2irDnvSSg0mjCmZSla4cTkeQivKHttOa6KwI8ri/uwYb9CitI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hW2dfD53; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D453C4CEED;
	Fri, 11 Jul 2025 15:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752247462;
	bh=yJ8TeCP7QMW8f3wQWNtyCH+5qgZS98VackQUFbcNjvQ=;
	h=Date:To:Cc:From:Subject:From;
	b=hW2dfD53S9CUsQFbyuoNwxonMfLSr6OIv9EJeyk5tIGKDzSMWyH4IZcey5I87TuvM
	 EHY4eBenZ9fAn2rkiW5rQ6LcH3F1cJxnglNyMxIG6XIwX24CFqPPI3DpctFS/4Sg8K
	 xDB2ke28kKCyAiMJP6AtP9JGWvQxQ5iXPuYTZuOOT1vQmoSnmqsiTVxTDSofDoOrv9
	 uRi8+5thI8IQUjy4Q+TYRbPeT08WoAS86gmSNUnZXHRagtiIFzZsvJFpGP41CdSzd8
	 nyADTZJdaMMfS3Ebylm4oyTqsdgNdLpUnY5TX8BVA+bTCpXXyNxLj6LZWItal4tp8O
	 hqmDqy1wny0xA==
Message-ID: <998c5fb0-8d32-496c-a1e2-cc9c1a73ede0@kernel.org>
Date: Fri, 11 Jul 2025 17:24:19 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, nl
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Ricardo Ribalda <ribalda@chromium.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
From: Hans de Goede <hansg@kernel.org>
Subject: [GIT PULL FOR v6.17] uvcvideo improvements
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Mauro, Hans,

Here is a UVC pull-request for 6.17, highlights:

- Use vb2 ioctl and fop helpers
- Invert granular pm logic and also apply granular pm to compat IOCTLs
- Add MSXU 1.5 / Microsoft UVC Payload Metadata support

Regards,

Hans


The following changes since commit a8598c7de1bcd94461ca54c972efa9b4ea501fb9:

  media: ipu7: Drop IPU8 PCI ID for now (2025-07-04 08:22:32 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/linux-media/users/uvc.git tags/next-media-uvc-20250711

for you to fetch changes up to bfbceedbc492d8d8b55e947c9e09c580fecf154d:

  media: uvcvideo: Use a count variable for meta_formats instead of 0 terminating (2025-07-11 15:49:39 +0200)

----------------------------------------------------------------
ucvvideo improvements

- Use vb2 ioctl and fop helpers
- Invert granular pm logic and also apply granular pm to compat IOCTLs
- Add MSXU 1.5 / Microsoft UVC Payload Metadata support

----------------------------------------------------------------
Hans Verkuil (1):
      media: uvcvideo: Use vb2 ioctl and fop helpers

Hans de Goede (1):
      media: uvcvideo: Use a count variable for meta_formats instead of 0 terminating

Ricardo Ribalda (11):
      media: uvcvideo: Handle locks in uvc_queue_return_buffers
      media: uvcvideo: Split uvc_stop_streaming()
      media: uvcvideo: Remove stream->is_streaming field
      media: uvcvideo: Turn on the camera if V4L2_EVENT_SUB_FL_SEND_INITIAL
      media: core: export v4l2_translate_cmd
      media: uvcvideo: uvc_v4l2_unlocked_ioctl: Invert PM logic
      media: uvcvideo: Do not mark valid metadata as invalid
      media: Documentation: Add note about UVCH length field
      media: uvcvideo: Introduce dev->meta_formats
      media: uvcvideo: Introduce V4L2_META_FMT_UVC_MSXU_1_5
      media: uvcvideo: Auto-set UVC_QUIRK_MSXU_META

 .../userspace-api/media/v4l/meta-formats.rst       |   1 +
 .../media/v4l/metafmt-uvc-msxu-1-5.rst             |  23 ++
 .../userspace-api/media/v4l/metafmt-uvc.rst        |   4 +-
 MAINTAINERS                                        |   1 +
 drivers/media/usb/uvc/uvc_ctrl.c                   |  10 +-
 drivers/media/usb/uvc/uvc_driver.c                 |  44 +--
 drivers/media/usb/uvc/uvc_metadata.c               | 122 +++++++-
 drivers/media/usb/uvc/uvc_queue.c                  | 201 +++---------
 drivers/media/usb/uvc/uvc_v4l2.c                   | 345 +++------------------
 drivers/media/usb/uvc/uvc_video.c                  |  12 +-
 drivers/media/usb/uvc/uvcvideo.h                   |  44 +--
 drivers/media/v4l2-core/v4l2-ioctl.c               |   6 +-
 include/linux/usb/uvc.h                            |   3 +
 include/media/v4l2-ioctl.h                         |   1 +
 include/uapi/linux/videodev2.h                     |   1 +
 15 files changed, 272 insertions(+), 546 deletions(-)
 create mode 100644 Documentation/userspace-api/media/v4l/metafmt-uvc-msxu-1-5.rst


