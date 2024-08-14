Return-Path: <linux-media+bounces-16300-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0FF951C5A
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2024 15:57:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D80FCB222F6
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2024 13:57:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 964C01B1439;
	Wed, 14 Aug 2024 13:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="OnzMeVGg"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799CE394
	for <linux-media@vger.kernel.org>; Wed, 14 Aug 2024 13:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723643849; cv=none; b=gXe8yI2K5L0ZTzD8nrdDNdPfiZJ/gCgBOJarqEq4p1HBT6YBen6Bx/WObjCjF5u9UfhBG0JvM95kd1zaZyqlfgfICLQMXyx6bS0Q5JXjmYxWE3P//B0JsmG9oDV/DZZSqyp8dAR6DpySCawYxFwvgqI7c91yUQbASIb0d8lFdEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723643849; c=relaxed/simple;
	bh=Ucw4vCo8A3mX9E6HozPiPG/2LCOrWU/gHIFIWsHPwIM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ncG+q2IsKxKXiM5Wwq2UNNBaZRNLuACBwsv+hMKyuddercFNm1gYo97k+Vw9h/AERsxvrCpZ8mXLDYiIAAidq+5z3wN+fN95ALX+JkbEwlH2S9iiMa8DLEOVuM2sol021r5T1k5Zn1IKOaJ8gEbvfNcltLX+aqhMlpl/VgRPUTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=OnzMeVGg; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C766E66F;
	Wed, 14 Aug 2024 15:56:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1723643788;
	bh=Ucw4vCo8A3mX9E6HozPiPG/2LCOrWU/gHIFIWsHPwIM=;
	h=Date:From:To:Cc:Subject:From;
	b=OnzMeVGgw7BmCyxwD27b4OebPH8Lq1mAlzsMrhQ8e4N+rAFA/I7ulxu+DPqFMUIAH
	 FT9Sj97BXSQ94EKqsqk0ZAIsjp7rnwv5pvc4TMhcNViU1xKg49WaaCpwrm3csGIkEQ
	 MrTa/LXBWAlAC5iFehygWOxj4vBHZP5OpfS3I+6M=
Date: Wed, 14 Aug 2024 16:57:00 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [GIT PULL v2 FOR v6.12] rkisp1 extensible parameters format
Message-ID: <20240814135700.GA2954@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

The following changes since commit c80bfa4f9e0ebfce6ac909488d412347acbcb4f9:

  media: ti: cal: use 'time_left' variable with wait_event_timeout() (2024-08-09 07:56:39 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git tags/next-media-rkisp1-20240814

for you to fetch changes up to ac79beb913dc40b1a49b628e31afdfeb20194ab6:

  media: rkisp1: Add support for the companding block (2024-08-14 16:42:58 +0300)

----------------------------------------------------------------
Extensible parameters support for the rkisp1 driver

----------------------------------------------------------------
Jacopo Mondi (7):
      media: uapi: rkisp1-config: Add extensible params format
      media: uapi: videodev2: Add V4L2_META_FMT_RK_ISP1_EXT_PARAMS
      media: rkisp1: Add struct rkisp1_params_buffer
      media: rkisp1: Copy the parameters buffer
      media: rkisp1: Cache the currently active format
      media: rkisp1: Implement extensible params support
      media: rkisp1: Implement s_fmt/try_fmt

Laurent Pinchart (2):
      media: rkisp1: Add helper function to swap colour channels
      media: rkisp1: Add features mask to extensible block handlers

Ondrej Jirman (1):
      media: rkisp1: Adapt to different SoCs having different size limits

Paul Elder (3):
      media: rkisp1: Add register definitions for the companding block
      media: rkisp1: Add feature flags for BLS and compand
      media: rkisp1: Add support for the companding block

 Documentation/admin-guide/media/rkisp1.rst         |   11 +-
 .../userspace-api/media/v4l/metafmt-rkisp1.rst     |   57 +-
 .../media/platform/rockchip/rkisp1/rkisp1-common.c |   14 +
 .../media/platform/rockchip/rkisp1/rkisp1-common.h |   49 +-
 .../media/platform/rockchip/rkisp1/rkisp1-csi.c    |    5 +-
 .../media/platform/rockchip/rkisp1/rkisp1-dev.c    |   15 +-
 .../media/platform/rockchip/rkisp1/rkisp1-isp.c    |    9 +-
 .../media/platform/rockchip/rkisp1/rkisp1-params.c | 1037 ++++++++++++++++++--
 .../media/platform/rockchip/rkisp1/rkisp1-regs.h   |   23 +
 .../platform/rockchip/rkisp1/rkisp1-resizer.c      |    4 +-
 .../media/platform/rockchip/rkisp1/rkisp1-stats.c  |   51 +-
 drivers/media/v4l2-core/v4l2-ioctl.c               |    1 +
 include/uapi/linux/rkisp1-config.h                 |  578 +++++++++++
 include/uapi/linux/videodev2.h                     |    1 +
 14 files changed, 1689 insertions(+), 166 deletions(-)

-- 
Regards,

Laurent Pinchart


