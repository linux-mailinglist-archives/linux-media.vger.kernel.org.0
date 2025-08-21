Return-Path: <linux-media+bounces-40496-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 498C3B2E942
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 02:10:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 09E745E2D23
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 00:10:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F266376C61;
	Thu, 21 Aug 2025 00:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SG//Vw4f"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6930C3FB1B;
	Thu, 21 Aug 2025 00:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755735012; cv=none; b=fkhQAj0AlDJ8KjzAZNWwggyU1zBt3oblaiamxzZamB2calDD6YK8brRBKrQx36ASW+2GTNPun60CknE6OtaoJUOEkanuY0DJwLUgRsNTbHhdzmm3k0JNPpN9vOhJCW+rS1iKwWTiT1HBNRqlmded6pjT4ODiAjMx3Nt0g7YxIQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755735012; c=relaxed/simple;
	bh=8ClzBERjiu/dcdsv4dci9I660kzzTd9ObtnQJZj6cP0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lX7GsxFjV0cqXytO2E5kxAMHj8fMPlDvYXveIKDBUHTsOA4rTxeOkg1W2E82YQaixKRwvgLMcgKP6i2rc87I32M7NzmPJTMMrDOg50NDiUoaHstqlZXtLXU3XtsQmcLBSMtmNCzg6ZzIwu9HYA2lAy22bAiBF4QncGv2aN5G9go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=SG//Vw4f; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 52B171026;
	Thu, 21 Aug 2025 02:09:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755734949;
	bh=8ClzBERjiu/dcdsv4dci9I660kzzTd9ObtnQJZj6cP0=;
	h=From:To:Cc:Subject:Date:From;
	b=SG//Vw4f7pTlBq2sQTDb6r5nhjllRmCn5/QKhcu5ggQMOcaDzpSS2l7VnIUEwKMjW
	 ZazqAHsngmIRZbWnEfzgj46tmXOp8XXNjZtTWjL+rLvigmY/MgIvVnaTJEBL9qGoY8
	 ZQXxN4w5PNm+Zcfcw1D/AT7yuGMPbeSoXsieD2SU=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Isaac Scott <isaac.scott@ideasonboard.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 00/12] media: imx-mipi-csis: Cleanups and debugging improvements
Date: Thu, 21 Aug 2025 03:09:32 +0300
Message-ID: <20250821000944.27849-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

This patch series bring a few miscellaneous improvements to the
imx-mipi-csis driver, and in particular improves the debugging
infrastructure.

Patch 01/12 starts by making the v4l2_get_link_freq() function accept a
const media_pad argument. This conflicts with [1], I don't mind rebasing
on top of it. Sakari, if you plan to get that patch merged soon, feel
free to take 01/12 too.

The next three patches, 02/12 to 04/12, are small cleanups. They are new
in this version of the series. Patch 05/12 then aligns the code with the
reference manual for register field names, increasing readability of the
driver when read alongside the hardware documentation. Patch 06/12 fixes
a small alignment issue in register dumps, and patch 07/12 logs per-lane
start of transmission error instead of supporting the first data lane
only, easing debugging of D-PHY issues.

The next two patches deprecate the clock-frequency DT property, which
shouldn't have been added in the first place. Patch 08/12 improves
handling of the clock frequency in the driver, and patch 09/12
deprecates the property in the DT bindings. The driver still supports
the property to ensure backward compatibility.

The last three patches introduce support for multiple output channels
and wire it up in the debugging infrastructure. The CSIS IP core
supports up to 4 output channels, with the number of instantiated
channels being a property of the SoC integration. So far, only the
i.MX8MP is known to have multiple output channels. Patch 10/12 adds a
corresponding DT property, and patch 11/12 adds initial support for that
property in the driver, and uses it to dump per-channel registers and
event counters. Finally, patch 12/12 sets the property in the i.MX8MP
DT.

[1] https://lore.kernel.org/linux-media/20250819094533.2335-3-sakari.ailus@linux.intel.com

Laurent Pinchart (12):
  media: v4l2-common: Constify media_pad argument to
    v4l2_get_link_freq()
  media: imx-mipi-csis: Simplify access to source pad
  media: imx-mipi-csis: Standardize const keyword placement
  media: imx-mipi-csis: Shorten name of subdev state variables
  media: imx-mipi-csis: Rename register macros to match reference manual
  media: imx-mipi-csis: Fix field alignment in register dump
  media: imx-mipi-csis: Log per-lane start of transmission errors
  media: imx-mipi-csis: Only set clock rate when specified in DT
  dt-bindings: media: nxp,imx-mipi-csi2: Mark clock-frequency as
    deprecated
  dt-bindings: media: nxp,imx-mipi-csi2: Add fsl,num-channels property
  media: imx-mipi-csis: Initial support for multiple output channels
  arm64: dts: imx8mp: Specify the number of channels for CSI-2 receivers

 .../bindings/media/nxp,imx-mipi-csi2.yaml     |  18 +-
 arch/arm64/boot/dts/freescale/imx8mp.dtsi     |   2 +
 drivers/media/platform/nxp/imx-mipi-csis.c    | 348 +++++++++++-------
 drivers/media/v4l2-core/v4l2-common.c         |   2 +-
 include/media/v4l2-common.h                   |   3 +-
 5 files changed, 230 insertions(+), 143 deletions(-)


base-commit: a75b8d198c55e9eb5feb6f6e155496305caba2dc
-- 
Regards,

Laurent Pinchart


