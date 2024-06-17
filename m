Return-Path: <linux-media+bounces-13486-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C75E090BC27
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 22:28:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 37BFFB21A07
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 20:28:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DF6C191465;
	Mon, 17 Jun 2024 20:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="R1rWI6C3"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D199AF9F7
	for <linux-media@vger.kernel.org>; Mon, 17 Jun 2024 20:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718656107; cv=none; b=bczraWsJRC0zbkN0YZFiVAXbg2GYHRPpR1oxNcgd9cHoyYM756JLXW3BD+VogiQSii2VyBQPSZB1g4Sz5pMZwpb0QrxY1s+DUt6kHNJLGyed57sttbQIBB4ZnjIzH4b7zNlcDAPQcTyrcVfeVCj/wSA+4gTu73f1bEfjaXLnhq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718656107; c=relaxed/simple;
	bh=2i8mbunjboJwHXFlnnuu9wN0TsLJzR98LxO+1qyozP4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=uOAqxjRQv8HWcuuGYagZnyfyMCqYRUHicZ/gW0rt/oks+ml4L31Ar+tbX0U+PwaeU1V13yTZiK1la71q4R/vGYCfp1a0Rld6EYJhHvh84rfw+6Z8ZcL/2GgJh2cTx7uM7r4hXFWuO776oAZI6wPHUMtMoQlpNQCCSOtOcjmvrvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=R1rWI6C3; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5B4EB3E;
	Mon, 17 Jun 2024 22:28:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718656085;
	bh=2i8mbunjboJwHXFlnnuu9wN0TsLJzR98LxO+1qyozP4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=R1rWI6C32F8B98SEp0Mo+jERU2V/IxfrQEkc6pre2wRrPKfyktKeW68f84BNqyHLw
	 jNeJZsXeIYI3xb7s735GGN+D/RVZyjkjgKeX7aBQYwvXG6Gh4YrmHN400YHiqrhDs3
	 j2kt2TpjUTDs6DM96ZW1MMM9XRCh1RFqEIE7CwJw=
Date: Mon, 17 Jun 2024 23:28:00 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: =?utf-8?B?8J+Qpy1tZWRpYQ==?= <linux-media@vger.kernel.org>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Ricardo Ribalda <ribalda@chromium.org>
Subject: [GIT PULL v2 FOR v6.11] uvcvideo fixes and improvements
Message-ID: <20240617202800.GA19966@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240617184749.GB23867@pendragon.ideasonboard.com>

Hi Hans, Mauro,

The following changes since commit 91798162245991e26949ef62851719bb2177a9c2:

  media: v4l: add missing MODULE_DESCRIPTION() macros (2024-06-15 11:16:40 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git tags/media-next-uvc-20240617-2

for you to fetch changes up to 8c40efeda94108d65c52038ea82ee83b2fb933e2:

  media: uvcvideo: Remove mappings form uvc_device_info (2024-06-17 23:21:13 +0300)

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


