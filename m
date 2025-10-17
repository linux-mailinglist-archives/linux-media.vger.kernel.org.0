Return-Path: <linux-media+bounces-44891-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1A3BE8F46
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 15:40:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F107E1884030
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 13:39:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A5032F6909;
	Fri, 17 Oct 2025 13:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YAxHSipC"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C845A2F6903
	for <linux-media@vger.kernel.org>; Fri, 17 Oct 2025 13:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760708310; cv=none; b=Cwfw+74HTlr1Vdmxg2sgRwvV4te+jityPf0Giw+yPXZ6RcrSffD2BB/V7JslGJ6eWaLxEGIORpd5F0Gtf16CHTfvVX6o1NOM+h/DMz+ihXLmlRcMpOmmhvcKyCeN7V1VIvlEwzR0sKJFVTSOJpBZF1FBsXTUU3Gpe532NPdM450=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760708310; c=relaxed/simple;
	bh=lb5IMAkwmYyeA/aloxtFyzqaoIOWSoW+c6CHfKFA3C0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W7V/uH2Dn8D7MRFMpq5aro+1tugH5rXl7sNmev1hyFUqVuy2beG4pVE7mdOAKz1TvtdVdXMFBTMKIOgqd8hsOH33zcise1XjHKCX4eAyory3I+hEXlhMqwgsBHDvpfslsOfi/ocX3AU7EQjQrjEGcP5pfM830kTWo2gf3MUSC2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YAxHSipC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42EE3C4CEE7;
	Fri, 17 Oct 2025 13:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760708310;
	bh=lb5IMAkwmYyeA/aloxtFyzqaoIOWSoW+c6CHfKFA3C0=;
	h=From:To:Cc:Subject:Date:From;
	b=YAxHSipCc9Y3BOPUD914pS3CzbJUteia0oiNUgMwFr6YMaOsmcUL4wqOwwBDBbBVF
	 8IGksLHmOddHMzehPZYjAT//pLHNaPj1oxSfv2lO1CtYaOtLOru5T4PXGQC0dVUEMv
	 sRwZYWsQ5ydYpzFoXT3pRy+W7hptTDVJQSXvUpof2ShtQuGg+ZOPWNq0MdI53CTSc3
	 ZM4IsqPa/JqFBykc+9FXO5Kvw1MJSDUuqD9x55LNomNU+ypmf2DdMK0m3Ehk2+BNfd
	 8C/2zu5mVmaS/Bnzk8qmf46N8NLsxVfmPcp7opIsK5OZTclroKY5V5QJjKuM4/MhT0
	 DoqjHL4726ehw==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	laurent.pinchart@ideasonboard.com
Subject: [PATCH 00/14] media: omap3isp: v4l2-compliance fixes
Date: Fri, 17 Oct 2025 15:26:37 +0200
Message-ID: <cover.1760707611.git.hverkuil+cisco@kernel.org>
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

The last two patches in this series are for reference only and not
meant to be merged.

The first patch ("configure entity functions") definitely needs to be
reviewed: I'm not certain what all blocks did, so in a few places I had
to guess what the entity function is.

This series doesn't fix all compliance problems, but at least it is
a lot better now.

Regards,

	Hans

Hans Verkuil (14):
  media: omap3isp: configure entity functions
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
  DO NOT MERGE: media: omap3isp: change default resolution to 864x648
  DO NOT MERGE: omap3-beagle-xm.dts: add Leopard Imaging li5m03 support

 .../dts/ti/omap/omap3-beagle-xm-li5m03.dtsi   |  64 +++++++
 arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dts |   2 +
 drivers/media/platform/ti/omap3isp/ispccdc.c  |   1 +
 drivers/media/platform/ti/omap3isp/ispccp2.c  |   3 +-
 drivers/media/platform/ti/omap3isp/ispcsi2.c  |   1 +
 .../media/platform/ti/omap3isp/isppreview.c   |  26 ++-
 .../media/platform/ti/omap3isp/ispresizer.c   |   3 +-
 drivers/media/platform/ti/omap3isp/ispstat.c  |   1 +
 drivers/media/platform/ti/omap3isp/ispvideo.c | 174 +++++++++++++-----
 9 files changed, 216 insertions(+), 59 deletions(-)
 create mode 100644 arch/arm/boot/dts/ti/omap/omap3-beagle-xm-li5m03.dtsi

-- 
2.51.0


