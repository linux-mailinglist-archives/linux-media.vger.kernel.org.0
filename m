Return-Path: <linux-media+bounces-31480-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D290AA5402
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 20:45:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F106216FF32
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 18:45:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04BCC25A32F;
	Wed, 30 Apr 2025 18:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="e+ahhjUx"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0C6D28399
	for <linux-media@vger.kernel.org>; Wed, 30 Apr 2025 18:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746038742; cv=none; b=KgqLIuJ+ctX7ecLj4K3TgaUwzYVzgk5OZVLqQiFQP9B+Tl3wMVboOhO9sxfjhb1iyjBGJ+TCD5C7cgNvp3lwpS1qjSPn5v6VwctXWQZbRTEYB+HiFEFrRC0/7EiRo2K4C9RBXxa2OztwsX8w800eFYD7FWPP3b9H4ghRQV75chU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746038742; c=relaxed/simple;
	bh=G+uJ2QwetijjW1vPJXF+fpAnlIVx+3DwXgbWZGh5CnM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kYaCWcn2lMyAAAOT6YCXV21yiMmyciSOFBamcVFDjNF+uk0X/NbGFKNEEJADvRxN78i8ObcYPRTTni1+g1e3DMs2mIN/tU1d7VQFd7IIMSN6GNE5LIJUmQYeFzm1ohOTDA6uRtke3TkfU6RsY693BMWQqWlgp1a06XmIhW+B4AI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=e+ahhjUx; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 083CB725;
	Wed, 30 Apr 2025 20:45:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1746038732;
	bh=G+uJ2QwetijjW1vPJXF+fpAnlIVx+3DwXgbWZGh5CnM=;
	h=Date:From:To:Cc:Subject:From;
	b=e+ahhjUxOUErdVVwXYLB6mQaHMGxvTBrD+ozwKOXVy6KQ0f/yiNqHyiDoGpW9A+lg
	 zeARVulk9wK7kD4beXKa/Bl0RN3oxPT2HX5RDj1U8FjnYF6x2cP86aMgDXS17kmts5
	 AY7PG97tgwNwCzoo7OvwzNNFBjUleRUlcZLq/hM8=
Date: Wed, 30 Apr 2025 21:45:30 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hans@jjverkuil.nl>
Cc: linux-media@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [GIT PULL FOR v6.16] Renesas media drivers changes
Message-ID: <20250430184530.GA31594@pendragon.ideasonboard.com>
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

The following changes since commit 543f81b86cf4046c7454a05c741c491a4fac44dd:

  media: rc: add keymap for Hauppauge Credit Card RC (2025-04-30 09:35:24 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/linux-media/users/pinchartl.git tags/next-media-renesas-20250430

for you to fetch changes up to 90ae2e1ab1f7f4f39fd80d8d5a1a92c153976405:

  media: renesas: vsp1: Expose color space through the DRM API (2025-04-30 20:33:15 +0300)

----------------------------------------------------------------
Renesas R-Car preparation for ISP support:

- RAW image support in VIN driver
- Initial refactoring of ISP-CS
- Colorspace and VSPX support in the VSP driver

----------------------------------------------------------------
Biju Das (1):
      media: renesas: vsp1: Use %p4cc printk modifier to print FourCC codes

Jacopo Mondi (4):
      media: renesas: vsp1: Add support IIF ISP Interface
      media: renesas: vsp1: dl: Use singleshot DL for VSPX
      media: renesas: vsp1: wpf: Propagate vsp1_rwpf_init_ctrls()
      media: renesas: vsp1: rwpf: Support operations with IIF

Laurent Pinchart (8):
      media: renesas: vsp1: Implement pixel format enumeration
      media: renesas: vsp1: Make HSI and HST modules optional
      media: renesas: vsp1: Fix HSV format enumeration
      media: renesas: vsp1: Fix media bus code setup on RWPF source pad
      media: renesas: vsp1: Report colour space information to userspace
      media: renesas: vsp1: Allow setting encoding and quantization
      media: renesas: vsp1: Name nested structure in vsp1_drm
      media: renesas: vsp1: Expose color space through the DRM API

Niklas Söderlund (4):
      dt-bindings: media: renesas,isp: Add ISP core function block
      media: rcar-isp: Move driver to own directory
      media: rcar-isp: Rename base register variable
      media: rcar-isp: Parse named cs memory region

Tomi Valkeinen (4):
      media: rcar-vin: Add RCAR_GEN4 model value
      media: rcar-vin: Remove unnecessary checks
      media: rcar-vin: Fix RAW8
      media: rcar-vin: Fix RAW10

 .../devicetree/bindings/media/renesas,isp.yaml     |  63 ++++++-
 MAINTAINERS                                        |   2 +-
 drivers/media/platform/renesas/Kconfig             |  18 +-
 drivers/media/platform/renesas/Makefile            |   2 +-
 drivers/media/platform/renesas/rcar-isp/Kconfig    |  18 ++
 drivers/media/platform/renesas/rcar-isp/Makefile   |   4 +
 .../renesas/{rcar-isp.c => rcar-isp/csisp.c}       |  57 ++++---
 .../media/platform/renesas/rcar-vin/rcar-core.c    |   2 +-
 drivers/media/platform/renesas/rcar-vin/rcar-dma.c |  34 +---
 .../media/platform/renesas/rcar-vin/rcar-v4l2.c    |   8 +-
 drivers/media/platform/renesas/rcar-vin/rcar-vin.h |   1 +
 drivers/media/platform/renesas/vsp1/Makefile       |   2 +-
 drivers/media/platform/renesas/vsp1/vsp1.h         |   4 +
 drivers/media/platform/renesas/vsp1/vsp1_brx.c     |   9 +-
 drivers/media/platform/renesas/vsp1/vsp1_dl.c      |   7 +-
 drivers/media/platform/renesas/vsp1/vsp1_drm.c     |  30 ++--
 drivers/media/platform/renesas/vsp1/vsp1_drm.h     |   8 +-
 drivers/media/platform/renesas/vsp1/vsp1_drv.c     |  70 +++++---
 drivers/media/platform/renesas/vsp1/vsp1_entity.c  |  30 +++-
 drivers/media/platform/renesas/vsp1/vsp1_entity.h  |   3 +
 drivers/media/platform/renesas/vsp1/vsp1_hsit.c    |  11 +-
 drivers/media/platform/renesas/vsp1/vsp1_iif.c     | 121 +++++++++++++
 drivers/media/platform/renesas/vsp1/vsp1_iif.h     |  29 ++++
 drivers/media/platform/renesas/vsp1/vsp1_pipe.c    | 189 ++++++++++++++++++---
 drivers/media/platform/renesas/vsp1/vsp1_pipe.h    |   6 +
 drivers/media/platform/renesas/vsp1/vsp1_regs.h    |   8 +
 drivers/media/platform/renesas/vsp1/vsp1_rpf.c     |  38 ++++-
 drivers/media/platform/renesas/vsp1/vsp1_rwpf.c    |  51 +++++-
 drivers/media/platform/renesas/vsp1/vsp1_sru.c     |   9 +-
 drivers/media/platform/renesas/vsp1/vsp1_uds.c     |   9 +-
 drivers/media/platform/renesas/vsp1/vsp1_video.c   |  50 +++++-
 drivers/media/platform/renesas/vsp1/vsp1_wpf.c     |  53 ++++--
 include/media/vsp1.h                               |   4 +
 33 files changed, 771 insertions(+), 179 deletions(-)
 create mode 100644 drivers/media/platform/renesas/rcar-isp/Kconfig
 create mode 100644 drivers/media/platform/renesas/rcar-isp/Makefile
 rename drivers/media/platform/renesas/{rcar-isp.c => rcar-isp/csisp.c} (90%)
 create mode 100644 drivers/media/platform/renesas/vsp1/vsp1_iif.c
 create mode 100644 drivers/media/platform/renesas/vsp1/vsp1_iif.h

-- 
Regards,

Laurent Pinchart

