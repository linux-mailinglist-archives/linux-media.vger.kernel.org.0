Return-Path: <linux-media+bounces-34830-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B6AADA336
	for <lists+linux-media@lfdr.de>; Sun, 15 Jun 2025 21:41:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 20E8D188F43D
	for <lists+linux-media@lfdr.de>; Sun, 15 Jun 2025 19:41:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82BD327D770;
	Sun, 15 Jun 2025 19:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="s7YKI/hj"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341E01A5BB1;
	Sun, 15 Jun 2025 19:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750016484; cv=none; b=cjzK2E0+r857VceJ+Bg2WIlBcPX9j1kV3Bo9x/cYNbW3XFhdB7s9Mslyq66rdEgRiw87R2xDzdAGk0TIbw2CFiMA9PhoX8TSRkw91WoGApIP1PAUwc9Rc5ksi3st8xKxIHhzjaP/bpSZRTD3MJcUqgEmir7EE28vszC5Q9IItGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750016484; c=relaxed/simple;
	bh=vTuyLBtRcLUI/GsRSjCdJJfXAcMGKPMqr8hp/4XDRwY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fqOcu+FJVwfZzTLL3sFDiB+UMLt9s1x/ylVpveZRz94oFG1JuVxHyXHiy6YP58oYOsJB/PC/kWWQcw497I0YNSa1mvVCFppqoLj90eqbNsLM+3xXo1B90/4egyswTVmLqN36+FDwOCBA1mswSD3lkrrYHWeDC2iLehgKSnaCRUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=s7YKI/hj; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id ECA1089A;
	Sun, 15 Jun 2025 21:41:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750016470;
	bh=vTuyLBtRcLUI/GsRSjCdJJfXAcMGKPMqr8hp/4XDRwY=;
	h=Date:From:To:Cc:Subject:From;
	b=s7YKI/hj4dqL8wOY/7IAVYyRS1aWWPDHg5Sm58CddgGgOgJnQ3jMp8Tsrnfeg8JOL
	 fw1M5QB2VyQenEJGRmnIxGkb3bG9dxYV4U3TQb6QpNQGQx5fcW53Cpj0l8MbCc8F4t
	 wGM/3puYOloG1G8m4cn0kJQzmJ7yv4eSGuof2GoA=
Date: Sun, 15 Jun 2025 22:41:06 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hans@jjverkuil.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [GIT PULL FOR v6.17] Renesas media changes
Message-ID: <20250615194106.GA4311@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Mauro, Hans,

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/linux-media/users/pinchartl.git tags/next-media-renesas-20250615

for you to fetch changes up to 209d6f37ceabbffeb81ab848a78930dc9ec417d3:

  media: rcar-vin: Fold event notifier into only user (2025-06-15 20:55:37 +0300)

----------------------------------------------------------------
Renesas media drivers improvements:

- Document RZ/V2N DT bindings for FCP and VSP1
- Add D-PHY support for V4H CSI-2 receiver
- Unify VIN notifiers and enable MC on Gen2

----------------------------------------------------------------
Lad Prabhakar (2):
      media: dt-bindings: media: renesas,fcp: Document RZ/V2N SoC
      media: dt-bindings: media: renesas,vsp1: Document RZ/V2N SoC

Niklas Söderlund (17):
      media: rcar-csi2: Clarify usage of mbps and msps
      media: rcar-csi2: Rework macros to access AFE lanes
      media: rcar-csi2: Update start procedure for V4H
      media: rcar-csi2: Add D-PHY support for V4H
      media: rcar-vin: Use correct count of remote subdevices
      media: rcar-vin: Store platform info with group structure
      media: rcar-vin: Change link setup argument
      media: rcar-vin: Use error labels in probe
      media: rcar-vin: Generate a VIN group ID for Gen2
      media: rcar-vin: Prepare for unifying all v4l-async notifiers
      media: rcar-vin: Improve error paths for parallel devices
      media: rcar-vin: Merge all notifiers
      media: rcar-vin: Always create a media pad
      media: rcar-vin: Remove NTSC workaround
      media: rcar-vin: Only expose VIN controls
      media: rcar-vin: Enable media-graph on Gen2
      media: rcar-vin: Fold event notifier into only user

 .../devicetree/bindings/media/renesas,fcp.yaml     |   1 +
 .../devicetree/bindings/media/renesas,vsp1.yaml    |   1 +
 drivers/media/platform/renesas/rcar-csi2.c         | 332 ++++++++--
 .../media/platform/renesas/rcar-vin/rcar-core.c    | 698 ++++++++-------------
 drivers/media/platform/renesas/rcar-vin/rcar-dma.c |  23 +-
 .../media/platform/renesas/rcar-vin/rcar-v4l2.c    | 490 +--------------
 drivers/media/platform/renesas/rcar-vin/rcar-vin.h |  16 +-
 7 files changed, 585 insertions(+), 976 deletions(-)

-- 
Regards,

Laurent Pinchart

