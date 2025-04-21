Return-Path: <linux-media+bounces-30641-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 16801A955F4
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 20:30:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4E3D5164036
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 18:30:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 239631E51EF;
	Mon, 21 Apr 2025 18:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="mvT5nJ8H"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D34701A304A
	for <linux-media@vger.kernel.org>; Mon, 21 Apr 2025 18:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745260209; cv=none; b=dp+oSzEKUtxFHuay6tHy5tOKV7nkE5TsmYf6vv9WYEj0n70H2s1fjOSbK0cwqxnCWb+t82Qu+tKto67KAutGkeHDoAaZTBFBpgmTo5rTgGV6V6ShpuYn35TbFyBZuTa0uGwXIDxA6Jkc5GcpTvs4fAPtczHP+SWim7HeJ5ZgIDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745260209; c=relaxed/simple;
	bh=ooIhUZjDq9y8bVYFnJOUPWC6loOge3bfC/aQuQpD/wY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SozfHC88d8mhJ272oeseLGBFxe6CfPVLBBBO1qUN/awnI36JbdcJ+8Kfxat7ZRuy3iqOWVspgzg1fcVOYU01aICaEC+Z8BnRn5AS8x/RgHOZ20GxmXAZpCqj1ZfPO0+kikEG2sgTC+85/dhKU0rANu+BoQafNDYe1NfKSzGWiPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=mvT5nJ8H; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0E88856D;
	Mon, 21 Apr 2025 20:27:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745260078;
	bh=ooIhUZjDq9y8bVYFnJOUPWC6loOge3bfC/aQuQpD/wY=;
	h=Date:From:To:Cc:Subject:From;
	b=mvT5nJ8HObyg5NXWvOwqXCK3G6aR5ow5EI8Lt0VXoquE9Dmx5stUgjf8KJhaUIz8b
	 wtdrlItzpMBrld0BP+eSiayZHuzBt9Sq995tW+M5RdYW04pB0DRTO5LBVlaWYiYKA4
	 VoAfrW22SkqZ5hXsRxrM6aRLwczjybvjhBXj/voY=
Date: Mon, 21 Apr 2025 21:30:02 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hans@jjverkuil.nl>
Cc: linux-media@vger.kernel.org,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Subject: [GIT PULL FOR v6.16] Improvements and fixes to Renesas media drivers
Message-ID: <20250421183002.GA6463@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

The following changes since commit 14423fc3a4a21fb436dda85450339ec2bf191b36:

  media: venus: pm_helpers: add compatibility for dev_pm_genpd_set_hwmode on V4 (2025-04-11 13:29:07 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/linux-media/users/pinchartl.git tags/next-media-renesas-20250421

for you to fetch changes up to 70dfc2fc42ee2a5da6f6e79b0b991168af9c922a:

  media: rzg2l-cru: Add support for RZ/G3E SoC (2025-04-21 18:38:27 +0300)

----------------------------------------------------------------
Improvements and fixes to Renesas media drivers:

- Add RZ/V2H support to the fcp, vsp1 and rzg2l-csi2 DT bindings
- Add RZ/G3E support to the rzg2l-csi2 and rzg2l-cru drivers
- Fix RAW8 stride handling in the rcar-vin driver

----------------------------------------------------------------
Lad Prabhakar (14):
      media: dt-bindings: media: renesas,vsp1: Document RZ/V2H(P)
      media: dt-bindings: media: renesas,fcp: Document RZ/V2H(P) SoC
      media: dt-bindings: renesas,rzg2l-csi2: Document Renesas RZ/V2H(P) SoC
      media: rzg2l-cru: csi2: Use local variable for struct device in rzg2l_csi2_probe()
      media: rzg2l-cru: rzg2l-core: Use local variable for struct device in rzg2l_cru_probe()
      media: rzg2l-cru: csi2: Introduce SoC-specific D-PHY handling
      media: rzg2l-cru: csi2: Add support for RZ/V2H(P) SoC
      media: rzg2l-cru: Add register mapping support
      media: rzg2l-cru: Pass resolution limits via OF data
      media: rzg2l-cru: Add image_conv offset to OF data
      media: rzg2l-cru: Add IRQ handler to OF data
      media: rzg2l-cru: Add function pointer to check if FIFO is empty
      media: rzg2l-cru: Add function pointer to configure CSI
      media: rzg2l-cru: Add support for RZ/G3E SoC

Niklas Söderlund (1):
      media: rcar-vin: Fix stride setting for RAW8 formats

Tommaso Merciai (5):
      media: dt-bindings: renesas,rzg2l-csi2: Document Renesas RZ/G3E CSI-2 block
      media: dt-bindings: renesas,rzg2l-cru: Document Renesas RZ/G3E SoC
      media: rzg2l-cru: csi2: Use devm_pm_runtime_enable()
      media: rzg2l-cru: rzg2l-core: Use devm_pm_runtime_enable()
      media: rzg2l-cru: csi2: Skip system clock for RZ/V2H(P) SoC

 .../devicetree/bindings/media/renesas,fcp.yaml     |   2 +
 .../bindings/media/renesas,rzg2l-cru.yaml          |  65 ++++-
 .../bindings/media/renesas,rzg2l-csi2.yaml         |  62 +++--
 .../devicetree/bindings/media/renesas,vsp1.yaml    |   1 +
 drivers/media/platform/renesas/rcar-vin/rcar-dma.c |  16 --
 .../media/platform/renesas/rzg2l-cru/rzg2l-core.c  | 139 ++++++++--
 .../platform/renesas/rzg2l-cru/rzg2l-cru-regs.h    |  91 ++++---
 .../media/platform/renesas/rzg2l-cru/rzg2l-cru.h   |  39 ++-
 .../media/platform/renesas/rzg2l-cru/rzg2l-csi2.c  | 165 ++++++++++--
 .../media/platform/renesas/rzg2l-cru/rzg2l-ip.c    |  13 +-
 .../media/platform/renesas/rzg2l-cru/rzg2l-video.c | 295 +++++++++++++++++++--
 11 files changed, 740 insertions(+), 148 deletions(-)

-- 
Regards,

Laurent Pinchart

