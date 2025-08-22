Return-Path: <linux-media+bounces-40693-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 20865B30A56
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 02:28:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9ED50B622EB
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 00:26:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1467754723;
	Fri, 22 Aug 2025 00:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rxpjLxRb"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C1C6FBF;
	Fri, 22 Aug 2025 00:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755822486; cv=none; b=Mb+7UDY1CmyGjeLSA4JiZ3rnDgJdyvm2rnL3b4ZGMLHosy40De/5QPQDrSLRnr4zRMBHSz+L/TH63Ej6NDhG3U6ceEx4+2wFSFZKdqGkS6d1Zr2TBnPg6fIyS1TA/vkCRu5gplHpoZg2h0J9RYrJbxoK/e3R56OxaFTiiijBe2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755822486; c=relaxed/simple;
	bh=la80gbOKfRBicT11Der9MQ4qlVEV/HY7RqFKZw2/94M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ol6fucei0eJzVXhKzTEH9f/yJFKU3xYsND+0snDiumpdqKUdiUJGTgUgsHy1KkwpR5f0+7MwNIsXs7i0uYfKMGlBABHErl1uJUR1o5ruBwPaBAWoQHTXranRkrJLlOW77OBmPI/FkgZgFKc9NGKTYvELgViAE43ZQFLerQWZXFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=rxpjLxRb; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 4D3F7101F;
	Fri, 22 Aug 2025 02:27:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755822423;
	bh=la80gbOKfRBicT11Der9MQ4qlVEV/HY7RqFKZw2/94M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rxpjLxRbXIbcaxq6T4K6TE92bkFYAE8LfiIzTpWeD9Yl0ceUCrYknY1BMR/6mThws
	 2W45FznOSA4dwCkys7s+i4YGddd9lLJhv6iGEh603YfS4jVGdeef5kew3yYBIF3oYY
	 GRY22yL2cUh9Z3Ft+aVG29x/NUkzZ8rwsOj3fVS8=
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
Subject: [PATCH v3 03/13] media: imx-mipi-csis: Standardize const keyword placement
Date: Fri, 22 Aug 2025 03:27:23 +0300
Message-ID: <20250822002734.23516-4-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250822002734.23516-1-laurent.pinchart@ideasonboard.com>
References: <20250822002734.23516-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The const keyword for pointer variables is placed before the type
everywhere except in one location. Change it to improve consistency.

No functional change is intended.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/media/platform/nxp/imx-mipi-csis.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
index 46f93cd677e3..0f0863011230 100644
--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -1029,7 +1029,7 @@ static int mipi_csis_set_fmt(struct v4l2_subdev *sd,
 			     struct v4l2_subdev_state *sd_state,
 			     struct v4l2_subdev_format *sdformat)
 {
-	struct csis_pix_format const *csis_fmt;
+	const struct csis_pix_format *csis_fmt;
 	struct v4l2_mbus_framefmt *fmt;
 	unsigned int align;
 
-- 
Regards,

Laurent Pinchart


