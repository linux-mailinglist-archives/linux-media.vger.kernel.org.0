Return-Path: <linux-media+bounces-35118-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D4757ADE0DA
	for <lists+linux-media@lfdr.de>; Wed, 18 Jun 2025 03:55:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 823EE7A8E54
	for <lists+linux-media@lfdr.de>; Wed, 18 Jun 2025 01:53:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC89219882B;
	Wed, 18 Jun 2025 01:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="RK8kzRoU"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9673938DF9;
	Wed, 18 Jun 2025 01:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750211712; cv=none; b=aebxFWwqxiSsfLv6Zoh/O4HkMa7Gc75YaLsBeL2sL4A2uDhs8epN7xqe9QoVJU7lSdtKZZ54ODVyfl3O2T9ej4VDD70ergM5t6nacvNPjvtwr20kdSIsKD62EKNizkMH1HTrgiWDSDxuwOLll8rTm3+FZlehuC4cC4t5BjiDZZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750211712; c=relaxed/simple;
	bh=AJo2GFUQLY+unpkYzcxLRimF1as5cXTliDIToPrEOYc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pz4CN6DxctcDv+KQ6SCRsypOou0CNWzqFgkMos9wh32Os3CZh7QYosBfdGQYCLe/14e9J71DzKMOJmM2+p0YWx6Olx/gNG0tLC6Int5vUOrF6DnXEYaoBAGex95Hg26yxgzM01LefqGZR8Tnc7qGng3e1CaRLMrZrdjWTEjYfAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=RK8kzRoU; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 86459593;
	Wed, 18 Jun 2025 03:54:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750211695;
	bh=AJo2GFUQLY+unpkYzcxLRimF1as5cXTliDIToPrEOYc=;
	h=Date:From:To:Cc:Subject:From;
	b=RK8kzRoU1YIV/kci7qp2RiKMYBEsv4X2wFvmn3UU7ZoB66ZDgTQpq6+jwFCotusDr
	 W0iUg8iSBsLYBD2KiBShQNCNabOul19DjzPHVHauO+4M6ZRbDSqgYDnm9A2LhN8zfI
	 mZCC1zGIsKnADwDXM5UVwc2ZPvTve5rnPSmksE3I=
Date: Wed, 18 Jun 2025 04:54:51 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hans@jjverkuil.nl>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Koji Matsuoka <koji.matsuoka.xm@renesas.com>
Subject: [GIT PULL FOR v6.17] Improvements for Renesas media drivers
Message-ID: <20250618015451.GB22301@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Hans, Mauro,

The following changes since commit c3021d6a80ff05034dfee494115ec71f1954e311:

  media: v4l2-jpeg: Remove unused v4l2_jpeg_parse_* wrappers (2025-06-17 10:35:17 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/linux-media/users/pinchartl.git tags/next-media-renesas-20250618

for you to fetch changes up to d20469375306163719ee458dd83b7d6c1c93d4d1:

  media: vsp1: Add VSPX support (2025-06-18 04:20:39 +0300)

----------------------------------------------------------------
Improvements for Renesas media drivers:

- V4H VSPX support in the vsp1 driver
- FRAME_SYNC events support in the rcar-vin driver
- Improve reset sequence for vsp1

----------------------------------------------------------------
Jacopo Mondi (4):
      media: rcar-fcp: Add rcar_fcp_soft_reset()
      media: vsp1: vsp1_dl: Detect double list release
      media: vsp1: vsp1_dl: Count display lists
      media: vsp1: Add VSPX support

Koji Matsuoka (1):
      media: vsp1: Reset FCP after VSPD

Niklas Söderlund (3):
      media: rcar-vin: Fold interrupt helpers into only callers
      media: rcar-vin: Check for correct capture interrupt event
      media: rcar-vin: Generate FRAME_SYNC events

 drivers/media/platform/renesas/rcar-fcp.c          |  36 ++
 drivers/media/platform/renesas/rcar-vin/rcar-dma.c |  54 +-
 .../media/platform/renesas/rcar-vin/rcar-v4l2.c    |   2 +
 drivers/media/platform/renesas/vsp1/Makefile       |   1 +
 drivers/media/platform/renesas/vsp1/vsp1.h         |   1 +
 drivers/media/platform/renesas/vsp1/vsp1_dl.c      |  20 +
 drivers/media/platform/renesas/vsp1/vsp1_drv.c     |  22 +-
 drivers/media/platform/renesas/vsp1/vsp1_regs.h    |   1 +
 drivers/media/platform/renesas/vsp1/vsp1_vspx.c    | 632 +++++++++++++++++++++
 drivers/media/platform/renesas/vsp1/vsp1_vspx.h    |  16 +
 include/media/rcar-fcp.h                           |   5 +
 include/media/vsp1.h                               |  89 +++
 12 files changed, 853 insertions(+), 26 deletions(-)
 create mode 100644 drivers/media/platform/renesas/vsp1/vsp1_vspx.c
 create mode 100644 drivers/media/platform/renesas/vsp1/vsp1_vspx.h

-- 
Regards,

Laurent Pinchart

