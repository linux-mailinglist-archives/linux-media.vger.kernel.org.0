Return-Path: <linux-media+bounces-34320-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC37AD1623
	for <lists+linux-media@lfdr.de>; Mon,  9 Jun 2025 01:59:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB11B3A98B1
	for <lists+linux-media@lfdr.de>; Sun,  8 Jun 2025 23:58:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A20F267AF8;
	Sun,  8 Jun 2025 23:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="EdxVyBa2"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175AE267AFD;
	Sun,  8 Jun 2025 23:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749427147; cv=none; b=XBpUnOpEVnhn28CUCBHqrOAim8RglSluKg14XNX0gUWNdma5GrJc3iUL8Agn1KbhTa6QabZLEnpNZDPxvgaUXEN6uA8b8Fo6GwLoi2n4ayWzds3jIflbFOXPsHEPbcGY5+lwx7DwAYmQ7/N4GW5up42fQDPjrNrm6BPVIjeKubI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749427147; c=relaxed/simple;
	bh=FGSupA2QMdrbodjciF/njqy3XB34wNaxowFmiu2URbI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ioi1oGqMkPSGAunJAWffUoV/3WOGAASloGaBoCeyzDEcNKrL55/rPCjDP0O00QftqT7cVb1qqHAS8G8Zo9SCptZcymRJJGoSRiMV/EwypSlKFtGh31PlcQAtFfjy+2bELEIGm+HqqbsV+5Zp4uJc3mLILPJBA8rcmaC/FA5/ZIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=EdxVyBa2; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E1E711352;
	Mon,  9 Jun 2025 01:58:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1749427131;
	bh=FGSupA2QMdrbodjciF/njqy3XB34wNaxowFmiu2URbI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EdxVyBa2GRVNUVv9i8L9gxt85YKfhcJ1Qxd0yLQkMeEGHaYKapbdVNnccYbeE2tcm
	 gecbK/YTwpb/de+R/36+aGsMa7lCHwRvvKfDcnVm/9a5jZ3Idlj3SGPg6HuxFJ15NQ
	 FDSUnwA7tSPECs2bA5EIr0AtVqJNwNvv5yTrXBfQ=
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
Subject: [PATCH 3/8] media: imx-mipi-csis: Log per-lane start of transmission errors
Date: Mon,  9 Jun 2025 02:58:35 +0300
Message-ID: <20250608235840.23871-4-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250608235840.23871-1-laurent.pinchart@ideasonboard.com>
References: <20250608235840.23871-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The CSIS has per-line start of transmission error interrupts. Log them
all, instead of only the first data lane.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/nxp/imx-mipi-csis.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
index b652d59851c2..e27467e6372f 100644
--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -100,7 +100,7 @@
 #define MIPI_CSIS_INT_SRC_NON_IMAGE_DATA	(0xf << 28)
 #define MIPI_CSIS_INT_SRC_FRAME_START		BIT(24)
 #define MIPI_CSIS_INT_SRC_FRAME_END		BIT(20)
-#define MIPI_CSIS_INT_SRC_ERR_SOT_HS		BIT(16)
+#define MIPI_CSIS_INT_SRC_ERR_SOT_HS(n)		BIT((n) + 16)
 #define MIPI_CSIS_INT_SRC_ERR_LOST_FS		BIT(12)
 #define MIPI_CSIS_INT_SRC_ERR_LOST_FE		BIT(8)
 #define MIPI_CSIS_INT_SRC_ERR_OVER		BIT(4)
@@ -241,7 +241,10 @@ struct mipi_csis_event {
 
 static const struct mipi_csis_event mipi_csis_events[] = {
 	/* Errors */
-	{ false, MIPI_CSIS_INT_SRC_ERR_SOT_HS,		"SOT Error" },
+	{ false, MIPI_CSIS_INT_SRC_ERR_SOT_HS(0),	"SOT 0 Error" },
+	{ false, MIPI_CSIS_INT_SRC_ERR_SOT_HS(1),	"SOT 1 Error" },
+	{ false, MIPI_CSIS_INT_SRC_ERR_SOT_HS(2),	"SOT 2 Error" },
+	{ false, MIPI_CSIS_INT_SRC_ERR_SOT_HS(3),	"SOT 3 Error" },
 	{ false, MIPI_CSIS_INT_SRC_ERR_LOST_FS,		"Lost Frame Start Error" },
 	{ false, MIPI_CSIS_INT_SRC_ERR_LOST_FE,		"Lost Frame End Error" },
 	{ false, MIPI_CSIS_INT_SRC_ERR_OVER,		"FIFO Overflow Error" },
-- 
Regards,

Laurent Pinchart


