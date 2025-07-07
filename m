Return-Path: <linux-media+bounces-36993-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C37EFAFB361
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 14:35:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 06CE73A500D
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 12:35:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DD4F29ACEC;
	Mon,  7 Jul 2025 12:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k3rdwYeU"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C8F4191499;
	Mon,  7 Jul 2025 12:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751891739; cv=none; b=Q9aPIxd652+dUXi666NXxkNiW2HeDYXeEffsUOk6rc4YOkO1zab4GNMXSv6hdfBBeXOi8Mr46eppiVY0Mq8vMuS6SphY0EOfip1qlL1+tKdwpVFBtqs+oB+QN89NKgDgrtIYL7WXzeJM/3kZ6kGXROCpAlt9QK9iTkbVMXX6Em4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751891739; c=relaxed/simple;
	bh=AMzaUSoJy5HuJsmRdDMekOD2Y59C75fgScMvtA7Ujcc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eXecvlugBZ+M+QC0WZD04vpY5cDWolcdEX6TRbuuBvT6fVX83P3K1dFQCLaf5n4cP7lvm3jx8XCp8lwG0wfVDbr9NOTMK+zRxNjT3HpABKDC+Mm5UKEG/J1F1UilqFzAETgpTTjHLOe6GYJGz9YfhJLcNqqrZgLqYo6/f81ESXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k3rdwYeU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1592DC4CEE3;
	Mon,  7 Jul 2025 12:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751891737;
	bh=AMzaUSoJy5HuJsmRdDMekOD2Y59C75fgScMvtA7Ujcc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=k3rdwYeUu75ztPB4K03rhaxVDR9iXgx82gdHw7RCP4nQcPbh6RKB2OrGeK8j7Ech0
	 7DYuk4whxaxnpqj/ysftMOqMaBpy/CR1nPjn9ffKsfT09tiNAdNjelZiv+DDf8mRt+
	 5xLH9xLDwhqmr4nA+F7Cq2zTuDQXJYyzWgOaYnW1lJWEFkrSq0DHkipTCGWdCgI7Q3
	 phC1Wuf1bL4pHaEdxYWxGndRsV7hoHehjFNIncd/tQ4M+JwU7iyIKiKIYD1Bm9K++a
	 sWhD3gk8fD8bC+SZSOMtSU0Fqv5x3m7/BM+4WzDOsO653SjJ7iDStYHNNCyATobltE
	 gpJ9Jyrt6rgQQ==
Message-ID: <470d3b4c-453b-4412-957f-f7cd9ab2e997@kernel.org>
Date: Mon, 7 Jul 2025 14:35:33 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/7] media: uvcvideo: Invert granular PM logic + PM fix
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 Hans Verkuil <hans@jjverkuil.nl>, Hans Verkuil <hans@hverkuil.nl>
References: <20250701-uvc-grannular-invert-v4-0-8003b9b89f68@chromium.org>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <20250701-uvc-grannular-invert-v4-0-8003b9b89f68@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 1-Jul-25 08:45, Ricardo Ribalda wrote:
> It makes more sense to have a list of the ioctls that need power than
> the other way around. This patchset takes care of this.
> 
> It also fixes one error in the PM logic introduced in a recent patchset.
> 
> To support CI I have included patches that are in uvc/for-next but not
> in media-committer:
> media: uvcvideo: Remove stream->is_streaming field
> media: uvcvideo: Split uvc_stop_streaming()
> media: uvcvideo: Handle locks in uvc_queue_return_buffers
> media: uvcvideo: Use vb2 ioctl and fop helpers
> Do not review them again.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Thank you for the new version.

I've pushed patches 5-7 to uvc/for-next now (1-4 are
already there).

I plan to send a pull-request with these changes this Thursday.

Regards,

Hans


> ---
> Changes in v4:
> - CTRL_MAP DO need the device powered. Thanks Laurent
> - CodeStyle
> - use EXPORT_SYMBOL_GPL
> - Link to v3: https://lore.kernel.org/r/20250630-uvc-grannular-invert-v3-0-abd5cb5c45b7@chromium.org
> 
> Changes in v3:
> - Rebase
> - Merge Invert PM patch with add support for compat ioctls
> - Export different core function
> - Inline the pm_ioctl patch
> - Fix typo in comment
> - Link to v2: https://lore.kernel.org/r/20250602-uvc-grannular-invert-v2-0-c871934ad880@chromium.org
> 
> Changes in v2. Thanks HdG:
> - Rebase fop
> - CodeStyle
> - Refactor SEND_INITIAL to avoid lis_del()
> - Squash "invert PM logic" and "unless is needed"
> - Link to v1: https://lore.kernel.org/r/20250528-uvc-grannular-invert-v1-0-d01581f9cc25@chromium.org
> 
> ---
> Hans Verkuil (1):
>       media: uvcvideo: Use vb2 ioctl and fop helpers
> 
> Ricardo Ribalda (6):
>       media: uvcvideo: Handle locks in uvc_queue_return_buffers
>       media: uvcvideo: Split uvc_stop_streaming()
>       media: uvcvideo: Remove stream->is_streaming field
>       media: uvcvideo: Turn on the camera if V4L2_EVENT_SUB_FL_SEND_INITIAL
>       media: core: export v4l2_translate_cmd
>       media: uvcvideo: uvc_v4l2_unlocked_ioctl: Invert PM logic
> 
>  drivers/media/usb/uvc/uvc_ctrl.c     |  10 +-
>  drivers/media/usb/uvc/uvc_driver.c   |  37 +---
>  drivers/media/usb/uvc/uvc_metadata.c |   8 +-
>  drivers/media/usb/uvc/uvc_queue.c    | 199 +++++---------------
>  drivers/media/usb/uvc/uvc_v4l2.c     | 345 +++++------------------------------
>  drivers/media/usb/uvc/uvcvideo.h     |  37 +---
>  drivers/media/v4l2-core/v4l2-ioctl.c |   5 +-
>  include/media/v4l2-ioctl.h           |   1 +
>  8 files changed, 112 insertions(+), 530 deletions(-)
> ---
> base-commit: 35392e855abf7d02ad3b061cbc75c7c7c37f0577
> change-id: 20250528-uvc-grannular-invert-19ad34c59391
> 
> Best regards,


