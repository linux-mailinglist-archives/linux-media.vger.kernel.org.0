Return-Path: <linux-media+bounces-34839-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41968ADA565
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 03:11:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED0F116D6A7
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 01:11:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1060F13EFF3;
	Mon, 16 Jun 2025 01:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="je2Wvz8W"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D414A23AD;
	Mon, 16 Jun 2025 01:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750036299; cv=none; b=nxHmes468ZPpI3EL0ANJpeuroLh/7/7/gYGczetvoAeAmUGd8bAEwmfgehbReT2POIqucHAY78A1JWeAFVkLobpzwNqvkgwhipsWsWvQY0F0TleCyB/axmqWlC7I4IkArJ1bGH/LQfCal2ULIfg2SU+LxDWogOSpxSCDmV4mp2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750036299; c=relaxed/simple;
	bh=qAYK7QG3ajbAt09rfSm4ch3HgN3Q+fSiynbGtLRHRZY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uAaGpfdmBnPii2R2kFM7Tw5sXOf91QRx5s69GwpLFwFvH9k1M6tgZxrAA8hRlOT20f93XmpU0oZ4w7a6thV0Tiu/D+dvxSzWDQH7EJxD46f/tAGMIqvOyIBfZGaDCyCWFcdwdtu+jMrqMEUM5ZFDZX72lIZvPP7hP5DVtNf2p6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=je2Wvz8W; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BB3CE465;
	Mon, 16 Jun 2025 03:11:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750036278;
	bh=qAYK7QG3ajbAt09rfSm4ch3HgN3Q+fSiynbGtLRHRZY=;
	h=From:To:Cc:Subject:Date:From;
	b=je2Wvz8WxEa8Gonr2WMJ/2klH8QAwbcs9kdqdPxnfcz4bUhJ1mUiAbPhu2hh3X3rm
	 fQC+OUUHmBVn/bo4aHTh0ZJOKNuxlNEJkuxVBRUhp3tfE6oqHxXG1uRrYV4dDSYMFa
	 lJUQXTc8nUqu+zIaqr+4TonpKQJrQtGrn+6hKclw=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Stefan Klug <stefan.klug@ideasonboard.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH 0/6] media: rkisp1: Prepare for HDR stitching support
Date: Mon, 16 Jun 2025 04:11:09 +0300
Message-ID: <20250616011115.19515-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello everybody,

This patch series prepares the rkisp1 driver for HDR stitching support
by adding a new clock and power domain.

The ISP instance integrated in the NXP i.MX8MP includes an HDR stitching
module. Unlike other ISP modules, the HDR stitching module requires the
pixel clock to be enabled to access control registers, otherwise the
system freezes. To make the problem more complex, the pixel clock is
gated by the media-blk, which controls the clock gate through the
MIPI_CSI2 power domain.

Adding the pixel clock to the ISP DT node is easy, but enabling the gate
as part of the ISP power domain would be more difficult. This series
instead adds the MIPI_CSI2 power domain as a secondary power domain for
the ISP. Given that the ISP can't be used without the CSI-2 receiver in
the i.MX8MP, this won't result in extra power consumption. Lucas, your
feedback on this approach would be appreciated.

Patches 1/6 and 2/6 update the DT binding to add the clock and power
domain. Patches 3/6 then refactors clock handling in the rkisp1 driver,
and patches 4/6 and 5/6 add support for the additional clock and power
domain. They are optional to avoid breaking backward compatibility with
older device trees. Finally, patch 6/6 updates imx8mp.dtsi to add the
clock and power domain.

The series has been tested by trying to read the HDR stitching registers
at probe time. Without these changes the system locks up, with this
series applied the registers read correctly.

Laurent Pinchart (6):
  dt-bindings: media: rkisp1: Require pclk clock on i.MX8MP variant
  dt-bindings: media: rkisp1: Add second power domain on i.MX8MP
  media: rkisp1: Refactor clocks initialization
  media: rkisp1: Acquire pclk clock on i.MX8MP
  media: rkisp1: Add support for multiple power domains
  arm64: dts: imx8mp: Add pclk clock and second power domain for the ISP

 .../bindings/media/rockchip-isp1.yaml         |  23 +++-
 arch/arm64/boot/dts/freescale/imx8mp.dtsi     |  18 ++-
 .../platform/rockchip/rkisp1/rkisp1-common.h  |  17 ++-
 .../platform/rockchip/rkisp1/rkisp1-dev.c     | 123 +++++++++++++-----
 4 files changed, 140 insertions(+), 41 deletions(-)


base-commit: 0ff41df1cb268fc69e703a08a57ee14ae967d0ca
-- 
Regards,

Laurent Pinchart


