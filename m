Return-Path: <linux-media+bounces-40691-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D1333B30A4B
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 02:28:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AA4431D005D9
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 00:28:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 019FA6FC3;
	Fri, 22 Aug 2025 00:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="F9J1ksJ7"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C9B4A3E;
	Fri, 22 Aug 2025 00:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755822483; cv=none; b=RX+fgOL5jASwqVgwwgn8qWHvawUgE6JOdN08Tfhru8ho71CMHX4nyfMljJNgr2+I465SDCNsC7zXPTf2P27MweYLePQxgf6RXDcYArxCH0e9hPUSk34EG2ZhvZDqlT3p5nQ1ZrLddz5UXUAIr4AlFk2PQY+nfmD4ncSEauyOlGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755822483; c=relaxed/simple;
	bh=hvocuKs0+lw53BxD/QtBS2ovnPYm5W3zP08TmRzB3Eg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aFLoWF/S7jHHOXnOe4b/1htjEQnIZWU5yOZ7kUDKaaRjZGXGfd+z2Z6yau8BqaFOJRUhqtQMybv1AcT8ok29xrRWWABA27dnRwmiOVXaRELHUCLvwNxGVrXI8oxw7jEe/DruT9NXreefmtJrns0Jhojweo5J+i8Voym2qP2twIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=F9J1ksJ7; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 77C36228;
	Fri, 22 Aug 2025 02:26:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755822418;
	bh=hvocuKs0+lw53BxD/QtBS2ovnPYm5W3zP08TmRzB3Eg=;
	h=From:To:Cc:Subject:Date:From;
	b=F9J1ksJ7ShlCf2QiTyLFtXUeecI3jn8g0Iz2Er3pQMMVky6EqM+YG/3wic5ZcHmes
	 Ig0cgiOtD4ZwGmuDsP2Z9aFJM+Lan6d6bw/EvDiXutQkUQyJI13MhicK+Ti+xHmFnT
	 M1miaP9s/xGxH4eg0qcKUWf9ZRFoBizFbAQaEUEM=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Inbaraj E <inbaraj.e@samsung.com>,
	Isaac Scott <isaac.scott@ideasonboard.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Martin Kepplinger <martink@posteo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Purism Kernel Team <kernel@puri.sm>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 00/13] media: imx-mipi-csis: Cleanups and debugging improvements
Date: Fri, 22 Aug 2025 03:27:20 +0300
Message-ID: <20250822002734.23516-1-laurent.pinchart@ideasonboard.com>
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

Patch 01/13 starts by making the v4l2_get_link_freq() function accept a
const media_pad argument. This conflicts with [1], I don't mind rebasing
on top of it. Sakari, if you plan to get that patch merged soon, feel
free to take 01/13 too.

The next three patches, 02/13 to 04/13, are small cleanups. Patch 05/13
then aligns the code with the reference manual for register field names,
increasing readability of the driver when read alongside the hardware
documentation. Patch 06/13 (new in this version) also improves the
register macros by standardizing usage of GENMASK. Patch 07/13 fixes a
small alignment issue in register dumps, and patch 08/13 logs per-lane
start of transmission error instead of supporting the first data lane
only, easing debugging of D-PHY issues.

The next two patches deprecate the clock-frequency DT property, which
shouldn't have been added in the first place. Patch 09/13 improves
handling of the clock frequency in the driver, and patch 10/13
deprecates the property in the DT bindings. The driver still supports
the property to ensure backward compatibility.

The last three patches introduce support for multiple output channels
and wire it up in the debugging infrastructure. The CSIS IP core
supports up to 4 output channels, with the number of instantiated
channels being a property of the SoC integration. So far, only the
i.MX8MP is known to have multiple output channels. Patch 11/13 adds a
corresponding DT property, and patch 12/13 adds initial support for that
property in the driver, and uses it to dump per-channel registers and
event counters. Finally, patch 13/13 sets the property in the i.MX8MP
DT.

[1] https://lore.kernel.org/linux-media/20250819094533.2335-3-sakari.ailus@linux.intel.com

Laurent Pinchart (13):
  media: v4l2-common: Constify media_pad argument to
    v4l2_get_link_freq()
  media: imx-mipi-csis: Simplify access to source pad
  media: imx-mipi-csis: Standardize const keyword placement
  media: imx-mipi-csis: Shorten name of subdev state variables
  media: imx-mipi-csis: Rename register macros to match reference manual
  media: imx-mipi-csis: Use GENMASK for all register field masks
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
 drivers/media/platform/nxp/imx-mipi-csis.c    | 353 +++++++++++-------
 drivers/media/v4l2-core/v4l2-common.c         |   2 +-
 include/media/v4l2-common.h                   |   3 +-
 5 files changed, 232 insertions(+), 146 deletions(-)


base-commit: a75b8d198c55e9eb5feb6f6e155496305caba2dc
-- 
Regards,

Laurent Pinchart


