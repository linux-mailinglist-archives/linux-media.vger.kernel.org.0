Return-Path: <linux-media+bounces-40502-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E67B2E94C
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 02:10:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 63FF55E2DD6
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 00:10:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00E5A1A255C;
	Thu, 21 Aug 2025 00:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="GBjs2YYd"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D62F53594F;
	Thu, 21 Aug 2025 00:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755735022; cv=none; b=fU2V4JQ25Zd0OqNKFf6M5a/z63T/p4uE85OCCap1GLg94Hv5c5nzQLg7CtWaETHav4Ij7cK7FUk1VYelonLR1asl/n2L+vWHOE35vOm/67WSAzoa/g0eaPpQuX3fQz7z/oIXrc+qbeysTOcfURWOGlsytb/B08CNwnuITJSL42A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755735022; c=relaxed/simple;
	bh=DTKsCVWip/h4U+ZWonBrRaY1x2Xej9RXfJkFFFiMgI0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cpi+aKulGFZHOEU3nxV9ypykxx7rbRXCuhDG5HUCc5c+b9a5jkn31KkddNr255BDqonMZ+zhc2lJU+OLlsq+ryZxDx2o4vo0KJdlZaNgPftTqFqV5EejVSe30n3Md+uJjxMFkaz2rdbPPptJhuiXlEYrCXlN8dxkA/fFGeMx8aE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=GBjs2YYd; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 15D4E11D5;
	Thu, 21 Aug 2025 02:09:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755734959;
	bh=DTKsCVWip/h4U+ZWonBrRaY1x2Xej9RXfJkFFFiMgI0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GBjs2YYdl5OVXgU3KhRcbNhqqvwOYyLJYDC/v7Rh0vpUHBOaU27XjV2OWi1RWMdnf
	 S4DZev1sfNdHjuz2hgJhMAsWykj9d8zGN+QvgFZi6S23RcS9bVRs0dqbdR20Hknr7X
	 fuSPrXwpCydrw0lY5OM7N8UI/7+sEFSZysSyvq7w=
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
Subject: [PATCH v2 06/12] media: imx-mipi-csis: Fix field alignment in register dump
Date: Thu, 21 Aug 2025 03:09:38 +0300
Message-ID: <20250821000944.27849-7-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250821000944.27849-1-laurent.pinchart@ideasonboard.com>
References: <20250821000944.27849-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 95a1379004cb ("media: staging: media: imx: imx7-mipi-csis: Dump
MIPI_CSIS_FRAME_COUNTER_CH0 register") forgot to increase the maximum
register name length, resulting in misalignment of names printed in the
kernel log. Fix it.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/media/platform/nxp/imx-mipi-csis.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
index 1ca327e6be00..35c8d5309424 100644
--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -893,7 +893,7 @@ static int mipi_csis_dump_regs(struct mipi_csis_device *csis)
 
 	for (i = 0; i < ARRAY_SIZE(registers); i++) {
 		cfg = mipi_csis_read(csis, registers[i].offset);
-		dev_info(csis->dev, "%14s: 0x%08x\n", registers[i].name, cfg);
+		dev_info(csis->dev, "%17s: 0x%08x\n", registers[i].name, cfg);
 	}
 
 	pm_runtime_put(csis->dev);
-- 
Regards,

Laurent Pinchart


