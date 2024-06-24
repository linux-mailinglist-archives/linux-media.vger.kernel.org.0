Return-Path: <linux-media+bounces-14024-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4A79144F1
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2024 10:34:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 43D9EB23A36
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2024 08:34:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD1EB61FD7;
	Mon, 24 Jun 2024 08:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="g/y44qlX"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4491E5027F
	for <linux-media@vger.kernel.org>; Mon, 24 Jun 2024 08:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719218021; cv=none; b=AAKh3Dkktalr5qyJjOWZ4zmw+uGYqzfM1iC6KKqnPEt5whrEFCA2HbITtD/JN3A9hDsBln2Fm7C5TuDisGsg8YyeT4QGdCyqGyp0PqkebtNKHuiYSi6ROjhC/anB01SJOVSIC5Uc9tUA/VMhMMpAqPBPYyrOF6GBI09u/iKkGrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719218021; c=relaxed/simple;
	bh=1T9djAg4rBmtiXztqlIckqNEmWtJFOlDZoqlMF/mK8o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TAXpIf9RQ4Gf2Mn2iP6VNiCyFtO/1uBqq0pBYXLiOsHh2TDa30c9XzstcBYgvIlyQJu13TVIfEyQZ9fSonBlUw0BoTlQBhT5+Okf+9i8ujPih4u+ue0A4IvukFeUH6aZ9W+KerlH7J+QL/TOqP5iSNaPApchYxjl56iujbLAZqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=g/y44qlX; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D44267E0;
	Mon, 24 Jun 2024 10:33:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1719217996;
	bh=1T9djAg4rBmtiXztqlIckqNEmWtJFOlDZoqlMF/mK8o=;
	h=Date:From:To:Cc:Subject:From;
	b=g/y44qlXqFTDlNjGiTDV+JxU+ik0gAQ4pGhBW+MmXCqr8DGvBVc94oceI2jc0LY3E
	 vTNGZMOUOO46VinB/vKWwtkb70rzzECVFt4OQT65q2YYg0ejHR/FPp/6z9vT28bhyn
	 jhFhdy6xb9wqkUL1jEB7DAL8q8abFM1qPmnsyFGw=
Date: Mon, 24 Jun 2024 11:33:15 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [GIT PULL FOR v6.11] Renesas-related changes
Message-ID: <20240624083315.GA14791@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Hans, Mauro,

The following changes since commit 91798162245991e26949ef62851719bb2177a9c2:

  media: v4l: add missing MODULE_DESCRIPTION() macros (2024-06-15 11:16:40 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git tags/next-media-renesas-20240619

for you to fetch changes up to 1b9fd2f0b5133974917efafd066f79e0e309e602:

  media: renesas: vsp1: Initialize control handler after subdev (2024-06-20 01:36:49 +0300)

----------------------------------------------------------------
- Conversion of max9286 and adv748x to V4L2 subdev active state
- Cleanups and fixes for the Renesas R-Car VSP and VIN drivers
- Miscellaneous cleanups to V4L2 core

----------------------------------------------------------------
Jacopo Mondi (11):
      media: rcar-vin: Fix YUYV8_1X16 handling for CSI-2
      media: rcar-csi2: Disable runtime_pm in probe error
      media: rcar-csi2: Cleanup subdevice in remove()
      media: rcar-csi2: Use the subdev active state
      media: adv748x-csi2: Implement enum_mbus_codes
      media: adv748x-afe: Use 1X16 media bus code
      media: adv748x-csi2: Validate the image format
      media: adv748x-csi2: Use the subdev active state
      media: max9286: Fix enum_mbus_code
      media: max9286: Use the subdev active state
      media: max9286: Use frame interval from subdev state

Laurent Pinchart (21):
      media: renesas: vsp1: Fix _irqsave and _irq mix
      media: videobuf2: core: Drop unneeded forward declaration
      media: v4l2-subdev: Drop unreacheable warning
      media: renesas: vsp1: Print debug message to diagnose validation failure
      media: renesas: vsp1: Drop vsp1_entity_get_pad_format() wrapper
      media: renesas: vsp1: Drop vsp1_entity_get_pad_selection() wrapper
      media: renesas: vsp1: Drop vsp1_rwpf_get_crop() wrapper
      media: renesas: vsp1: Drop brx_get_compose() wrapper
      media: renesas: vsp1: Drop custom .get_fmt() handler for histogram
      media: renesas: vsp1: Move partition calculation to vsp1_pipe.c
      media: renesas: vsp1: Simplify partition calculation
      media: renesas: vsp1: Store RPF partition configuration per RPF instance
      media: renesas: vsp1: Pass partition pointer to .configure_partition()
      media: renesas: vsp1: Replace vsp1_partition_window with v4l2_rect
      media: renesas: vsp1: Add and use function to dump a pipeline to the log
      media: renesas: vsp1: Keep the DRM pipeline entities sorted
      media: renesas: vsp1: Compute partitions for DRM pipelines
      media: renesas: vsp1: Get configuration from partition instead of state
      media: renesas: vsp1: Name parameters to entity operations
      media: renesas: vsp1: Pass subdev state to entity operations
      media: renesas: vsp1: Initialize control handler after subdev

 drivers/media/common/videobuf2/videobuf2-core.c    |   1 -
 drivers/media/i2c/adv748x/adv748x-afe.c            |   4 +-
 drivers/media/i2c/adv748x/adv748x-csi2.c           | 147 +++++++++------
 drivers/media/i2c/adv748x/adv748x.h                |   1 -
 drivers/media/i2c/max9286.c                        | 181 +++++++------------
 drivers/media/platform/renesas/rcar-csi2.c         | 155 +++++++++-------
 drivers/media/platform/renesas/rcar-vin/rcar-dma.c |  16 +-
 drivers/media/platform/renesas/vsp1/vsp1_brx.c     |  31 ++--
 drivers/media/platform/renesas/vsp1/vsp1_clu.c     |   4 +-
 drivers/media/platform/renesas/vsp1/vsp1_drm.c     |  27 ++-
 drivers/media/platform/renesas/vsp1/vsp1_drm.h     |   2 +
 drivers/media/platform/renesas/vsp1/vsp1_entity.c  |  66 ++-----
 drivers/media/platform/renesas/vsp1/vsp1_entity.h  |  48 ++---
 drivers/media/platform/renesas/vsp1/vsp1_hgo.c     |  28 ++-
 drivers/media/platform/renesas/vsp1/vsp1_hgt.c     |  20 +--
 drivers/media/platform/renesas/vsp1/vsp1_histo.c   |  86 +++------
 drivers/media/platform/renesas/vsp1/vsp1_hsit.c    |   6 +-
 drivers/media/platform/renesas/vsp1/vsp1_lif.c     |   4 +-
 drivers/media/platform/renesas/vsp1/vsp1_lut.c     |   1 +
 drivers/media/platform/renesas/vsp1/vsp1_pipe.c    | 103 ++++++++++-
 drivers/media/platform/renesas/vsp1/vsp1_pipe.h    |  48 ++---
 drivers/media/platform/renesas/vsp1/vsp1_rpf.c     |  56 +++---
 drivers/media/platform/renesas/vsp1/vsp1_rwpf.c    |  26 +--
 drivers/media/platform/renesas/vsp1/vsp1_rwpf.h    |   3 -
 drivers/media/platform/renesas/vsp1/vsp1_sru.c     |  37 ++--
 drivers/media/platform/renesas/vsp1/vsp1_uds.c     |  51 +++---
 drivers/media/platform/renesas/vsp1/vsp1_uif.c     |  15 +-
 drivers/media/platform/renesas/vsp1/vsp1_video.c   | 200 +++++++--------------
 drivers/media/platform/renesas/vsp1/vsp1_wpf.c     |  43 ++---
 drivers/media/v4l2-core/v4l2-subdev.c              |   8 -
 30 files changed, 689 insertions(+), 729 deletions(-)

-- 
Regards,

Laurent Pinchart

