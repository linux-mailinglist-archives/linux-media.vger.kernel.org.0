Return-Path: <linux-media+bounces-34317-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFCBEAD161D
	for <lists+linux-media@lfdr.de>; Mon,  9 Jun 2025 01:59:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DACE23A9685
	for <lists+linux-media@lfdr.de>; Sun,  8 Jun 2025 23:58:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 414E82676D1;
	Sun,  8 Jun 2025 23:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="L4VOCFaJ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A322F267701;
	Sun,  8 Jun 2025 23:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749427143; cv=none; b=VxIqZ6xhdXuAgbYhH8V5sqSLIow40NmdFeRlt4T3kYYEZ24k7uUpG63jmWpmrrXjZBY4wMcNIRAhy41tgIC1cCgFPBIQspxdagEQ8V2dWU84qNaQXbqZn0PmljjvbA57VEzW/DNMxjYvRvgH0JRtd/hxWc6DLEwtYVgvMYBHCJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749427143; c=relaxed/simple;
	bh=ipYLzcWZGX+tRjCGL9FXxMB6odXJQholEUrDk82Bo5g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MWecee1Pbj6JCPPTVHzVeGU5OPF2w/8XsTCabhm1AZwocfgv8W+bliZ1wM+uvJwTs3wamNM5kkRw/peokQ+yvzn2Z5BkCC4KmP8/soe4+5vwGeHlPM3BvoEV5vLQu2iEw9CU/WIboc4O/5wnXrLOJq8haNFDrhxrG1bNh4sOFP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=L4VOCFaJ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AB33AF0B;
	Mon,  9 Jun 2025 01:58:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1749427126;
	bh=ipYLzcWZGX+tRjCGL9FXxMB6odXJQholEUrDk82Bo5g=;
	h=From:To:Cc:Subject:Date:From;
	b=L4VOCFaJ4mNEABey+F4VUdugQ06jGHxt3Cr60m6TG1llpUNoqEf6hFTDylT9v9DdV
	 EVZVhLpEOjZ/7E2LA44KoaeJoEeNXBaNd5rF5ik3L/g2C0LIK+TYz3Kig5XExJA8w2
	 o9olAbNSUjUw8bIWzMd6LMM0XlDG9BCPr2PVrXXY=
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
Subject: [PATCH 0/8] media: imx-mipi-csis: Cleanups and debugging improvements
Date: Mon,  9 Jun 2025 02:58:32 +0300
Message-ID: <20250608235840.23871-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.0
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

Patch 1/8 starts by aligning the code with the reference manual for
register field names, increasing readability of the driver when read
alongside the hardware documentation. Patch 2/8 then fixes a small
alignment issue in register dumps. Patch 3/8 logs per-lane start of
transmission error instead of supporting the first data lane only,
easing debugging of D-PHY issues.

The next two patches deprecate the clock-frequency DT property, which
shouldn't have been added in the first place. Patch 4/8 improves
handling of the clock frequency in the driver, and patch 5/8 deprecates
the property in the DT bindings. The driver still supports the property
to ensure backward compatibility.

The last three patches introduce support for multiple output channels
and wire it up in the debugging infrastructure. The CSIS IP core
supports up to 4 output channels, with the number of instantiated
channels being a property of the SoC integration. So far, only the
i.MX8MP is known to have multiple output channels. Patch 6/8 adds a
corresponding DT property, and patch 7/8 sets it in the i.MX8MP DT.
Patch 8/8 then adds initial support for that property in the driver, and
uses it to dump per-channel registers and event counters.

Laurent Pinchart (8):
  media: imx-mipi-csis: Rename register macros to match reference manual
  media: imx-mipi-csis: Fix field alignment in register dump
  media: imx-mipi-csis: Log per-lane start of transmission errors
  media: imx-mipi-csis: Only set clock rate when specified in DT
  dt-bindings: media: nxp,imx-mipi-csi2: Mark clock-frequency as
    deprecated
  dt-bindings: media: nxp,imx-mipi-csi2: Add fsl,num-channels property
  arm64: dts: imx8mp: Specify the number of channels for CSI-2 receivers
  media: imx-mipi-csis: Initial support for multiple output channels

 .../bindings/media/nxp,imx-mipi-csi2.yaml     |  18 +-
 arch/arm64/boot/dts/freescale/imx8mp.dtsi     |   2 +
 drivers/media/platform/nxp/imx-mipi-csis.c    | 311 +++++++++++-------
 3 files changed, 211 insertions(+), 120 deletions(-)


base-commit: 3c699df678515355e871141e142adae3bbf44216
prerequisite-patch-id: 7200af6e6d693b425b5cdb9ae6be1c55e23e2a45
-- 
Regards,

Laurent Pinchart


