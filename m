Return-Path: <linux-media+bounces-35116-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4189CADE07B
	for <lists+linux-media@lfdr.de>; Wed, 18 Jun 2025 03:15:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 211113BA500
	for <lists+linux-media@lfdr.de>; Wed, 18 Jun 2025 01:14:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 904FA171D2;
	Wed, 18 Jun 2025 01:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="UpYtbVwi"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE2F7188CCA
	for <linux-media@vger.kernel.org>; Wed, 18 Jun 2025 01:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750209317; cv=none; b=fgAkERUzPtFTax3GfB3Mz+p6CqtCOcY5V0NDRhcCmcLqYor0NeuEaAQxpgqOgKqyhqsXJlYDO9le1FVrgCjC+PoYYQZ3+kT5Jvz//pS1JmvhU0Qbqwlm90pjzAFTfcxBpWTtuj2cw5TzFMx97dQoVurfkHGjzgYopc06J9zD3CQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750209317; c=relaxed/simple;
	bh=YXvBlJoQ1ksa8yFfjNBOl35y51fduhAvcFAtKmjxlOk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YX10Wd7kRRDCxucNxi2QS1bMCuOv5D8o1t9NyIOjOr91dWIvi/y0XDIWLieRvl5qUw/GrW2TvliY/aiAdqBG3l8yYDXJiABOMo56Y8oFQGk33MkXQn0SjXPgatFR9uK1Ueb0558sM1vfiMmUgbUXDJUMNYCT2ZcAG1VbJfLelf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=UpYtbVwi; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CF2E3593;
	Wed, 18 Jun 2025 03:14:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750209300;
	bh=YXvBlJoQ1ksa8yFfjNBOl35y51fduhAvcFAtKmjxlOk=;
	h=Date:From:To:Cc:Subject:From;
	b=UpYtbVwi7DMp7/24hNYvJkOQrMaquXgGwM2hb80V5y0Dx0VEhSpaJ//912vp0AHQ+
	 X/BXk+pdP3+DOYDWCZWvF7DLF9zSvp9Hjmp/pR81X17FKBzgv5uwSaAZ8ydTi10Sws
	 woysk4MR9BGLNII1Gv4zVFTaq0BhOCKOszNbLg4o=
Date: Wed, 18 Jun 2025 04:14:56 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hans@jjverkuil.nl>
Cc: linux-media@vger.kernel.org, Frank Li <Frank.Li@nxp.com>,
	"Guoniu.zhou" <guoniu.zhou@nxp.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>,
	Robert Chiras <robert.chiras@nxp.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>
Subject: [GIT PULL FOR v6.17] Improvements to NXP media drivers
Message-ID: <20250618011456.GA22301@pendragon.ideasonboard.com>
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

The following changes since commit c3021d6a80ff05034dfee494115ec71f1954e311:

  media: v4l2-jpeg: Remove unused v4l2_jpeg_parse_* wrappers (2025-06-17 10:35:17 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/linux-media/users/pinchartl.git tags/next-media-nxp-20250618

for you to fetch changes up to 977cb68a913662f7808d8a5e016ad9615968ad03:

  media: imx8mq-mipi-csi2: Add support for i.MX8QXP (2025-06-18 03:52:08 +0300)

----------------------------------------------------------------
Improvements to NXP media drivers:

- i.MX8QM and i.MX8QXP SoCs support in imx8mq-mipi-csi2
- i.MX8QM and i.MX8QXP SoCs support in imx8-isi
- WDR support in rkisp1
- Miscellaneous cleanups

----------------------------------------------------------------
Frank Li (7):
      media: dt-bindings: Add binding doc for i.MX8QXP and i.MX8QM ISI
      media: nxp: imx8-isi: Allow num_sources to be greater than num_sink
      media: nxp: imx8-isi: Remove unused offset in mxc_isi_reg and use BIT() macro for mask
      media: nxp: imx8-isi: Use devm_clk_bulk_get_all() to fetch clocks
      media: nxp: imx8-isi: Remove redundant check for dma_set_mask_and_coherent()
      media: nxp: imx8-isi: Use dev_err_probe() to simplify code
      media: imx8mq-mipi-csi2: Add support for i.MX8QXP

Guoniu.zhou (1):
      media: imx8mq-mipi-csi2: Add imx8mq_plat_data for different compatible strings

Jai Luthra (1):
      media: rockchip: rkisp1: Add support for Wide Dynamic Range

Krzysztof Hałasa (1):
      media: nxp: imx8-isi: Simplify a couple of error messages

Laurent Pinchart (1):
      media: imx-mipi-csis: Use CSI-2 data type macros from mipi-csi2.h

Robert Chiras (2):
      media: imx8-isi: Add support for i.MX8QM and i.MX8QXP
      media: dt-bindings: nxp,imx8mq-mipi-csi2: Add i.MX8QM(QXP) compatible strings

Stefan Klug (2):
      media: rkisp1: Properly handle result of rkisp1_params_init_vb2_queue()
      media: rkisp1: Add RKISP1_CID_SUPPORTED_PARAMS_BLOCKS control

 .../devicetree/bindings/media/fsl,imx8qm-isi.yaml  | 117 ++++++++++++++
 .../devicetree/bindings/media/fsl,imx8qxp-isi.yaml | 106 +++++++++++++
 .../bindings/media/nxp,imx8mq-mipi-csi2.yaml       |  38 ++++-
 MAINTAINERS                                        |   1 +
 drivers/media/platform/nxp/imx-mipi-csis.c         |  68 +++------
 .../media/platform/nxp/imx8-isi/imx8-isi-core.c    | 135 ++++++++--------
 .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |   6 +-
 .../platform/nxp/imx8-isi/imx8-isi-crossbar.c      |  18 +--
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c      | 169 +++++++++++++++++++--
 .../media/platform/rockchip/rkisp1/rkisp1-common.h |   2 +
 .../media/platform/rockchip/rkisp1/rkisp1-params.c | 150 +++++++++++++++++-
 .../media/platform/rockchip/rkisp1/rkisp1-regs.h   |  99 +++---------
 include/uapi/linux/rkisp1-config.h                 | 106 ++++++++++++-
 include/uapi/linux/v4l2-controls.h                 |   6 +
 14 files changed, 799 insertions(+), 222 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/fsl,imx8qm-isi.yaml
 create mode 100644 Documentation/devicetree/bindings/media/fsl,imx8qxp-isi.yaml

-- 
Regards,

Laurent Pinchart

