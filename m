Return-Path: <linux-media+bounces-27404-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5104DA4C728
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 17:31:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6441B3A3DD4
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 16:27:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 109132153D0;
	Mon,  3 Mar 2025 16:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="lhF3ykkk"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39E02144A7
	for <linux-media@vger.kernel.org>; Mon,  3 Mar 2025 16:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741019123; cv=pass; b=P6ZA/+beq1IfXd9CDRAkeqrW0LfQGFVmUJ7+Lsby3P1N7KobaBnUlLIp+BFhA1QIGEQQXeIZbApDQGEO2wCgsfdHZKw6TRvPUTAYppOxSf1sUVWsLNGlKSjWWaHjdZUdy9HI1KmS0HGVuLpU/oLsjDFgNFa+6w8Qu7kyrueANGk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741019123; c=relaxed/simple;
	bh=7p3TzZRSghTRraVs7a3n8x2XWkU0p0w3/505+Vnfi3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fuuuw1pfChhlyr0LBGoIBCKtiXazw6XvMEXKbiJT13d4NnTljHKjZuB9MyrXvTUVoCGLdtC03h2EtpLBM/C6wDYeuB9aVjnXD29C5D0GK/6I72KvruJ7YPn+cZH59BNtXDbGNBNPkNRKMX/ZGM1KBmzZBIxCI+wugCjNdbGxfrY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=lhF3ykkk; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4Z640k1KbZz49PsJ;
	Mon,  3 Mar 2025 18:25:10 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1741019110;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=YMFQPv4ybPHPoJ4HN9J3fe38sp+aBsrYu09nKMV0rT4=;
	b=lhF3ykkkXGuArR+nkDsW0u4t2pUbTB5DL4+PUjEp/xh7eo/2di7h/iSbxFvEAwJTNnHFJk
	XaZU0PWiNCxMHsGJBnaEKHdEp+jBaCfIcsexCqnde8vvw47PM+3TaeKDFV+kfAizy8ApnB
	9uJrvliuvy7H6gjDU8KamQlfePf/GnbFOYwhhufahrRWNJmsNTqHjF8TCoBXpjkyX8VNVR
	+TZSSVLDtUb/zbuWViBSeocWF4xvZQGgP0WdWaYKNjUGBXz8uOWyuQh9AdLOvWbsUCFeKR
	iZ1rBhzMy1Kd7yiMZ/rRn34JGY1bJejSdrRoQGxKU3+y6uVA2mbrgI4/vSekjg==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1741019110; a=rsa-sha256;
	cv=none;
	b=iPcCqr0kwqIvJhKwClQ1OgvOuTtLN7n6Id4SKVRCRz3/72QfW/3P1gOqNNey4MOqfbHQIL
	L5C0y0AkXZg3UyeJq+1gWOuEFKZhX1B4o+/ek1JXtZBsgOzdlnDUdSN2wIlWLANOO3U7PF
	kNuF4JBV0PjoT7HJMl5DieBnCCaN8Y1cUA2Zwo71wO+C6n9DFgChUjoNhjeMu+CWtQ6t1C
	pqjlSYl+alAK8LNDFC0NWbMta4zCb2g84bFngRE5SsEzB4ifp3ki70wBCtBfQvr3r5Z1Ho
	EqnKajnHmWKAxhdtGvwnV9bXDJJxKagnv7I36420Q1kQODtdonEy8dREeQQM4A==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1741019110;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=YMFQPv4ybPHPoJ4HN9J3fe38sp+aBsrYu09nKMV0rT4=;
	b=bR4IjHH62ogfuuYNYoiXd+uUf80xZxmjnBrsjVlwsnoAndGmL39FZSA+iAuF4mkbUC08wq
	UV15rEC2uV/WDuWb6V9C5CxrjxkQZIaHxnM/UDWsAKz5tRJALlElZabkGVoDrM8qzcezyX
	4CHPa7NzhzqeI4iUukxZOtFYGXUJJaHUD9+647a+2/2x4wzeyMPlst2Z5qKltrk42C+val
	L4elGNHhGUjMaq2LPm2fxlADTCc0M3nbHVkwXWn+bHAAZK+qQocfJABRVO/gVBostl5cHo
	oAeAOUvqnfT1MOWrFoI6nlssBDJza5gA/gNz38/d+LqRjYOXXAYXTqX7/xh14A==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id C6082634C93;
	Mon,  3 Mar 2025 18:25:09 +0200 (EET)
Date: Mon, 3 Mar 2025 16:25:09 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR 6.15] Mostly camera sensor patches
Message-ID: <Z8XX5YnvC1YfT88T@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hans, Mauro,

Here are a few more patches for mostly camera sensors (improvements and
fixes for imx219, imx214, ov08x40, ov9282, vgxy61 and imx283 drivers), but
also fixes and improvements for CSI-2 receiver and ISP drivers (ipu6, rcar
and omap3isp) and a DT binding rename.

Please pull.


The following changes since commit d98e9213a768a3cc3a99f5e1abe09ad3baff2104:

  media: visl: Fix ERANGE error when setting enum controls (2025-02-25 11:11:06 +0100)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-6.15-2-signed

for you to fetch changes up to c4b10a915e222c5a72a9092b0488cbac1436f78b:

  media: rcar-csi2: Convert to .{enable|disable}_streams (2025-03-03 10:29:44 +0200)

----------------------------------------------------------------
V4L2 patches for 6.15

----------------------------------------------------------------
Bingbu Cao (1):
      media: intel/ipu6: set the dev_parent of video device to pdev

Cosmin Tanislav (1):
      media: i2c: imx219: remove context around case

Dan Carpenter (1):
      media: i2c: imx214: Fix uninitialized variable in imx214_set_ctrl()

Hans de Goede (2):
      media: ov08x40: Fix value of reset GPIO when requesting it
      media: ov08x40: Log chip ID when identifying the chip

Jai Luthra (3):
      media: i2c: imx219: Simplify binning mode
      media: i2c: imx219: Use subdev state to calculate binning and pixelrate
      media: i2c: imx219: Only use higher LLP_MIN for binned resolutions

Krzysztof Kozlowski (1):
      media: omap3isp: Use syscon_regmap_lookup_by_phandle_args

Laurent Pinchart (1):
      dt-bindings: media: imx219: Rename binding file with vendor prefix

Paul Elder (1):
      media: imx335: Set vblank immediately

Qasim Ijaz (1):
      media: vgxy61: Replace nested min() with single min3()

Richard Leitner (2):
      media: i2c: ov9282: use register definitions
      media: i2c: ov9282: add AEC Manual register definition

Robin Murphy (1):
      media: omap3isp: Handle ARM dma_iommu_mapping

Sakari Ailus (1):
      media: ipu6: Drop unused ipu6_dma_get_sgtable()

Tarang Raval (1):
      media: i2c: imx283: Drop runtime suspend/resume functions

Tomi Valkeinen (10):
      media: rcar-csi2: Move Y8 entry to a better place
      media: rcar-csi2: Add RAW10 and RAW12 formats
      media: rcar-isp: Add RAW8, RAW10 and RAW12 formats
      media: rcar-csi2: Use v4l2_get_link_freq()
      media: rcar-vin: Use v4l2_subdev_{enable|disable}_streams()
      media: rcar-isp: Use v4l2_subdev_{enable|disable}_streams()
      media: rcar-csi2: Use v4l2_subdev_{enable|disable}_streams()
      media: rcar-isp: Convert to subdev state
      media: rcar-isp: Convert to .{enable|disable}_streams
      media: rcar-csi2: Convert to .{enable|disable}_streams

 .../media/i2c/{imx219.yaml => sony,imx219.yaml}    |   2 +-
 MAINTAINERS                                        |   2 +-
 drivers/media/i2c/imx214.c                         |   2 +-
 drivers/media/i2c/imx219.c                         |  95 ++++++------
 drivers/media/i2c/imx283.c                         |  37 ++---
 drivers/media/i2c/imx335.c                         |  21 ++-
 drivers/media/i2c/ov08x40.c                        |   3 +-
 drivers/media/i2c/ov9282.c                         |  23 ++-
 drivers/media/i2c/vgxy61.c                         |   4 +-
 drivers/media/pci/intel/ipu6/ipu6-dma.c            |  33 -----
 drivers/media/pci/intel/ipu6/ipu6-dma.h            |   3 -
 drivers/media/pci/intel/ipu6/ipu6-isys-video.c     |   1 +
 drivers/media/platform/renesas/rcar-csi2.c         | 118 ++++++++++-----
 drivers/media/platform/renesas/rcar-isp.c          | 162 +++++++++++++--------
 drivers/media/platform/renesas/rcar-vin/rcar-dma.c |   4 +-
 drivers/media/platform/ti/omap3isp/isp.c           |  17 ++-
 16 files changed, 300 insertions(+), 227 deletions(-)
 rename Documentation/devicetree/bindings/media/i2c/{imx219.yaml => sony,imx219.yaml} (97%)

-- 
Kind regards,

Sakari Ailus

