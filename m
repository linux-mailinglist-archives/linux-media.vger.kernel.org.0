Return-Path: <linux-media+bounces-16819-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFDE895F39C
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 16:10:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 34C39B207C6
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 14:10:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 675D7188A09;
	Mon, 26 Aug 2024 14:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rVZZtPmQ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B866154456
	for <linux-media@vger.kernel.org>; Mon, 26 Aug 2024 14:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724681447; cv=none; b=hX/WnyfFq1tkAY4WPdxgy21jHMsUkYWc0wmfu7F4Afs3K06HkCJKv0Ea9WAe0E+xHk0IlRCn3g5wCoTEKul5WA/YknE2GDae+fkewUC5SNGz6c/RcuWxMiVNHtGWFbHRQQHjoPFy6lfdOmWv2xa1hYVLDa74pHRRju1AjnGEubM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724681447; c=relaxed/simple;
	bh=FcSLJGv18EMPNdPDGH3t/BgmWlXbzV1VePQ833zKD4k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pc82tFrnp70wKIlr838wsucOqPGpn5bl8IFtHIf8oD/x0i5r2pTB40SuK+/dsA/hAumesKnghkPmFuOyValKHkIkNjQtZ+VRTwexrczAjWqw1Em5/sWrT8homZrKjS27nbJgHROY0ahvg5pH1ukqthsGP0BIw0iNLRLRKzx+kfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=rVZZtPmQ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0598A6CA;
	Mon, 26 Aug 2024 16:09:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724681378;
	bh=FcSLJGv18EMPNdPDGH3t/BgmWlXbzV1VePQ833zKD4k=;
	h=Date:From:To:Cc:Subject:From;
	b=rVZZtPmQeNz8FDMOqoZUJmAXT3aheFH4p38oh+ahdCKXN3qZcq4ScefHbA56JXssp
	 e779VsEM58oEynC1gOb64qZlZS7otBl2zK20zi57culLyVZq0NtShZYtKMvcuqD7vW
	 0C4HYJLMfGVYRBeu9TNALUL9l8AETHER9pM8U0YU=
Date: Mon, 26 Aug 2024 17:10:40 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [GIT PULL FOR v6.12] V4L2 subdev and video device link validation
 improvements
Message-ID: <20240826141040.GC11033@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Mauro, Hans,

The following changes since commit ea2e2ea551abf0ce8350f82e8cd431b7f8a1e5e9:

  media: dt-bindings: qcom,sc7280-venus: Allow one IOMMU entry (2024-08-25 09:16:08 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git next-media-20240826

for you to fetch changes up to a3d44f011c6b7a87c9ad0d5be2f5fa092fa419bf:

  media: renesas: vsp1: Implement .link_validate() for video devices (2024-08-26 16:36:14 +0300)

----------------------------------------------------------------
media: Improvements to link validation in media graph

----------------------------------------------------------------
Laurent Pinchart (6):
      media: microchip-isc: Drop v4l2_subdev_link_validate() for video devices
      media: sun4i_csi: Implement link validate for sun4i_csi subdev
      media: sun4i_csi: Don't use v4l2_subdev_link_validate() for video device
      media: v4l2-subdev: Refactor warnings in v4l2_subdev_link_validate()
      media: v4l2-subdev: Support hybrid links in v4l2_subdev_link_validate()
      media: renesas: vsp1: Implement .link_validate() for video devices

 .../media/platform/microchip/microchip-isc-base.c  | 19 ++------
 drivers/media/platform/renesas/vsp1/vsp1_video.c   | 22 +++++++++
 drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c | 12 +++++
 drivers/media/v4l2-core/v4l2-subdev.c              | 53 ++++++++++++++++++----
 include/media/v4l2-subdev.h                        |  6 +++
 5 files changed, 89 insertions(+), 23 deletions(-)

-- 
Regards,

Laurent Pinchart


