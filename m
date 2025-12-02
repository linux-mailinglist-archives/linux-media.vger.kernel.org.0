Return-Path: <linux-media+bounces-48031-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A97D2C9A8B8
	for <lists+linux-media@lfdr.de>; Tue, 02 Dec 2025 08:49:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 629863A42A2
	for <lists+linux-media@lfdr.de>; Tue,  2 Dec 2025 07:49:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27F852BE642;
	Tue,  2 Dec 2025 07:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UA/Qt0OQ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FCC11D514E
	for <linux-media@vger.kernel.org>; Tue,  2 Dec 2025 07:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764661740; cv=none; b=EjOGHuDk3VEL6TNrUJRQWh+mTwUeGg1iUwLyIQZrOFE+p+aRWkwqmDv/Xi0oxJT+t7JggAybRlk4nFVXvCECywwXFAlHqluja90YxJdwAtiYb8HibMclWhoEnrPXjYx3Sfl8CcP+PNR6ObhXIIoKz28gWXyIBb1iPugS1+UePg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764661740; c=relaxed/simple;
	bh=+cFcHW6eYj96FZWnT2p801s9dHvUzU9OZxYKWgrmYw8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VKAwlLMc50R9HSlLUx9ij9J3fdF27PsNMyDhkBn+RmGmT1NxHZjzKh5BhUiJID2Ohuxuyf+uLojyGHfyOEV3GSCoXCRWi9cjnE6hkDfbmjTU5anreV9D24ZX72FWpAZdA5jDIxIIar7Bj/luyNawQpq/lHq2g8Bt0iGUYAccVds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UA/Qt0OQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA4DDC4CEF1;
	Tue,  2 Dec 2025 07:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764661740;
	bh=+cFcHW6eYj96FZWnT2p801s9dHvUzU9OZxYKWgrmYw8=;
	h=From:To:Cc:Subject:Date:From;
	b=UA/Qt0OQGxgrSWHDwsb7xrEDbyiy8Uzx42qxitpktyF8URZHKpZCa7OowafPEq+Qj
	 AEEJmcpi8/8gfqWNGdJjEuofSKFx51kfea09AlmjbICMA5GhyLXOvFCvA8q2IbxfZg
	 Px4RebC9Edud4jzkXY9tvXKpGH54KljoaUKdiFr2TFNWYkDcwmlQLLbXIukE8KW0iU
	 Qq6dtOf+CT0sfYrgPVrnzDcpM5BlLhv07i37PZvKBq8VTmDwL64M51WAQHO4FRuXNj
	 Ck89KveanIISqtTTiC7XBNrp4zoxJGSRag+En5EAsLrpVMzqxKQvUkPC1WD1YRyP/Y
	 JWZAVvI43YscQ==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	laurent.pinchart@ideasonboard.com
Subject: [PATCHv2 00/11] media: omap3isp: v4l2-compliance fixes
Date: Tue,  2 Dec 2025 08:48:01 +0100
Message-ID: <cover.1764661692.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When I worked on the patch series to remove the vb2 wait_prepare/finish
callbacks, I had to test that series on my Beagle xM board with a
Leopard Imaging li5m03 camera.

Since I wanted to use v4l2-compliance to test the vb2 change, I first had
to fix a bunch of other compliance problems in this driver so it would
actually be able to run the streaming tests.

This series contains the fixes I made to get to that point.

It depends on one sensor driver fix (posted separately):

https://patchwork.linuxtv.org/project/linux-media/patch/554fb9d7-374b-4868-b91b-959b8fd69b4d@kernel.org/

This series doesn't fix all compliance problems, but at least it is
a lot better now.

Regards,

        Hans

Changes since v1:
- Simplify isp_video_enum_format by checking for duplicate pixelformats
- Drop -ENOTTY to -EINVAL change in isp_video_try_format.

Hans Verkuil (11):
  media: omap3isp: add V4L2_CAP_IO_MC and don't set bus_info
  media: omap3isp: isp_video_mbus_to_pix/pix_to_mbus fixes
  media: omap3isp: implement enum_fmt_vid_cap/out
  media: omap3isp: use V4L2_COLORSPACE_SRGB instead of _JPEG
  media: omap3isp: set initial format
  media: omap3isp: rework isp_video_try/set_format
  media: omap3isp: implement create/prepare_bufs
  media: omap3isp: better VIDIOC_G/S_PARM handling
  media: omap3isp: support ctrl events for isppreview
  media: omap3isp: ispccp2: always clamp in ccp2_try_format()
  media: omap3isp: isppreview: always clamp in preview_try_format()

 drivers/media/platform/ti/omap3isp/ispccp2.c  |   2 +-
 .../media/platform/ti/omap3isp/isppreview.c   |  25 +--
 .../media/platform/ti/omap3isp/ispresizer.c   |   2 +-
 drivers/media/platform/ti/omap3isp/ispvideo.c | 178 +++++++++++++-----
 4 files changed, 146 insertions(+), 61 deletions(-)

-- 
2.51.0


