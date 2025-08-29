Return-Path: <linux-media+bounces-41331-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CC301B3BBD2
	for <lists+linux-media@lfdr.de>; Fri, 29 Aug 2025 15:01:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1FB1118997BF
	for <lists+linux-media@lfdr.de>; Fri, 29 Aug 2025 13:01:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C8901D5ABA;
	Fri, 29 Aug 2025 13:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="lIV45rRi"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26BDA1891A9
	for <linux-media@vger.kernel.org>; Fri, 29 Aug 2025 13:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756472454; cv=none; b=XzPr0Ibp9MrCW7aR4KoxDShyyd72E6fJpTXx+TpCUxIhjkmt4nuAaa0/IQbm1NrhWEFUWB6CUjiyzjMjirHdp1msckWqtDWXG3fMMT3sC5BlvGrfvMU/IgoAqSkpLPvudvcgHuO/b0OftLbnEc8qeuLDTmDAzpZdomoWtqAcwuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756472454; c=relaxed/simple;
	bh=1PA2zSAPf3xSL/n3j1lrFcgMbQgvpmZQK9xLaJ4Abv0=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hOeUZ43bl2lMwQUrEcu9JL9DKpoGHJF8aiRBFqqTOCiI/+laiv6Huwp5NG7poULErYFxIenArWXJUeo8dr9KJWweLyILU3EAGoZg/SjzO9Sj6PuqJfDOX5vjyuYV0AqHACvZzR/D7Sm/MDEHuvK9lyCbHZ5jLddmbzF/MBObKDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=lIV45rRi; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (85-76-13-20-nat.elisa-mobile.fi [85.76.13.20])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id B0B4F13BE;
	Fri, 29 Aug 2025 14:59:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756472385;
	bh=1PA2zSAPf3xSL/n3j1lrFcgMbQgvpmZQK9xLaJ4Abv0=;
	h=Date:From:To:Subject:From;
	b=lIV45rRiJFYr+mey/v7nzPcUgsOg9usVmsE5YUWjY6xnXMig0ouKPnf+1DURKSDtj
	 LnFPfz2Adi5ivA+ALEo1lwk++WlDOrUuuJ4uX8d6vKThm8uPESU4oqFdjVH1jzhupP
	 GficAE97P7Co4TP1z3D1wDYWYNI230DMP/IUA7iY=
Date: Fri, 29 Aug 2025 15:00:22 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hans@jjverkuil.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>,
	Richard Leitner <richard.leitner@linux.dev>
Subject: [GIT PULL FOR v6.18] NXP drivers changes
Message-ID: <20250829130022.GA23562@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Hans, Mauro,

The following changes since commit 16428e2449ab96cce27be6ab17b750b404c76c7c:

  media: mc: Improve unconnected pads debugging message in link exploration (2025-08-25 15:40:44 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/linux-media/users/pinchartl.git tags/next-media-nxp-20250827

for you to fetch changes up to 5a5f84227c93a53f7d98f8a52b731597f1fe0ebe:

  media: rkisp1: Add support for multiple power domains (2025-08-29 10:35:33 +0200)

----------------------------------------------------------------
NXP media drivers changes:

- imx-mipi-csis initial support for multiple output channels
- imx8-isi leaks and crash fixes
- imx8-isi suspend/resume support
- rkisp1 support for multiple power domains
- Miscellaneous cleanups

----------------------------------------------------------------
Guoniu Zhou (2):
      media: nxp: imx8-isi: Add suspend/resume support for ISI mem2mem
      media: nxp: imx8-isi: m2m: Fix streaming cleanup on release

Laurent Pinchart (20):
      media: v4l2-common: Constify media_pad argument to v4l2_get_link_freq()
      media: imx-mipi-csis: Simplify access to source pad
      media: imx-mipi-csis: Standardize const keyword placement
      media: imx-mipi-csis: Shorten name of subdev state variables
      media: imx-mipi-csis: Rename register macros to match reference manual
      media: imx-mipi-csis: Use GENMASK for all register field masks
      media: imx-mipi-csis: Fix field alignment in register dump
      media: imx-mipi-csis: Log per-lane start of transmission errors
      media: imx-mipi-csis: Only set clock rate when specified in DT
      dt-bindings: media: nxp,imx-mipi-csi2: Mark clock-frequency as deprecated
      dt-bindings: media: nxp,imx-mipi-csi2: Add fsl,num-channels property
      media: imx-mipi-csis: Initial support for multiple output channels
      media: nxp: imx8-isi: Drop mxc_isi_video.is_streaming field
      media: nxp: imx8-isi: Drop unused argument to mxc_isi_channel_chain()
      media: nxp: imx8-isi: m2m: Delay power up until streamon
      dt-bindings: media: rkisp1: Require pclk clock on i.MX8MP variant
      dt-bindings: media: rkisp1: Add second power domain on i.MX8MP
      media: rkisp1: Refactor clocks initialization
      media: rkisp1: Acquire pclk clock on i.MX8MP
      media: rkisp1: Add support for multiple power domains

Richard Leitner (1):
      media: nxp: imx8-isi: Fix streaming cleanup on release

 .../bindings/media/nxp,imx-mipi-csi2.yaml          |  18 +-
 .../devicetree/bindings/media/rockchip-isp1.yaml   |  23 +-
 drivers/media/platform/nxp/imx-mipi-csis.c         | 353 ++++++++++++---------
 .../media/platform/nxp/imx8-isi/imx8-isi-core.c    |   8 +
 .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |  14 +-
 drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c  |   2 +-
 drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c | 275 ++++++++--------
 .../media/platform/nxp/imx8-isi/imx8-isi-pipe.c    |   2 +-
 .../media/platform/nxp/imx8-isi/imx8-isi-video.c   | 156 ++++-----
 .../media/platform/rockchip/rkisp1/rkisp1-common.h |  17 +-
 .../media/platform/rockchip/rkisp1/rkisp1-dev.c    | 123 +++++--
 drivers/media/v4l2-core/v4l2-common.c              |   2 +-
 include/media/v4l2-common.h                        |   2 +-
 13 files changed, 567 insertions(+), 428 deletions(-)

-- 
Regards,

Laurent Pinchart

