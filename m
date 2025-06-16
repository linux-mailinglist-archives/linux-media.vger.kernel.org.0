Return-Path: <linux-media+bounces-34840-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D13ADA567
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 03:11:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF779188F8E2
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 01:12:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 117DF18C008;
	Mon, 16 Jun 2025 01:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="VTFIuKji"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0217E17333F;
	Mon, 16 Jun 2025 01:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750036301; cv=none; b=RMEsqWwCXZPT7+lqF3QcB0mvY3ZHyLe49M5vz6sBaY0B3C5xm2eRfZxFreOSn7EPsXANU5te+gT+L8k9htbf9rmlfOAnCFsoeXpgSXejDp18WjzPXpIPneu8B7mvD6e45Rz/mXHypeTQ2g3mFk+nhXzou3J7Y2EP50Ptxny6TUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750036301; c=relaxed/simple;
	bh=piIxfjmnbzqlRtW2ImACnwrTWkWN22EnU9JoAnaqr/c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SMzLTwRoe52wA3cBHywjELlZf6VCfl5527Jch5PApge3eKwS8URFL8JGA3fak/pt01vknS9/91+hCoNt2U7g+TgWgTxyrUzEeKAh2TH170EttCEntbbXY5qCogQuuS/mCV2hJqUp1DqVYKeqHkRj5EjEGSQtgxPlkFbMfXqObd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=VTFIuKji; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 799086F9;
	Mon, 16 Jun 2025 03:11:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750036280;
	bh=piIxfjmnbzqlRtW2ImACnwrTWkWN22EnU9JoAnaqr/c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VTFIuKjisnCji+9gNxdXPL1yQ8sVkmSM16trOAlTdVHgSR+H4bp62V3l67QD0cblN
	 yrcUf5vPdgjX5eEiftBuWO4FRCCI3yhl06bGRvdYEm33/w1g9aCm9LhQq2C1v5Rowi
	 9gnQTkEHX5eOZnKABPRfeWp9TgngYqvywZa7XJl0=
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
Subject: [PATCH 1/6] dt-bindings: media: rkisp1: Require pclk clock on i.MX8MP variant
Date: Mon, 16 Jun 2025 04:11:10 +0300
Message-ID: <20250616011115.19515-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250616011115.19515-1-laurent.pinchart@ideasonboard.com>
References: <20250616011115.19515-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ISP integrated in the NXP i.MX8MP requires the pclk clock to access
the HDR stitching registers. Make it mandatory in the DT binding.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 Documentation/devicetree/bindings/media/rockchip-isp1.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/rockchip-isp1.yaml b/Documentation/devicetree/bindings/media/rockchip-isp1.yaml
index 6be00aca4181..6b360cbb42e0 100644
--- a/Documentation/devicetree/bindings/media/rockchip-isp1.yaml
+++ b/Documentation/devicetree/bindings/media/rockchip-isp1.yaml
@@ -155,6 +155,10 @@ allOf:
             const: fsl,imx8mp-isp
     then:
       properties:
+        clocks:
+          minItems: 4
+        clock-names:
+          minItems: 4
         iommus: false
         phys: false
         phy-names: false
-- 
Regards,

Laurent Pinchart


