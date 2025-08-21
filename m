Return-Path: <linux-media+bounces-40499-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA70B2E948
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 02:10:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 606C55E11C8
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 00:10:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 866341898F8;
	Thu, 21 Aug 2025 00:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="I+ckUQAM"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59EA9155393;
	Thu, 21 Aug 2025 00:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755735017; cv=none; b=DYcmnITmtqn72M9MSa1nTriTdq2PblfGGtROW8JVebdA14kr0xRJ3nk5rGQcy91N8Xc6D5x5AbSYV+iOaCoMaSxqk1BzilvpQy64EEscULgMDs8umWmiGRUK06YlScuwZ8ov5Zl71VoXFQ2q4bHF8SGlKtZQ6dTgb14AZtGCZKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755735017; c=relaxed/simple;
	bh=djc1VqDhJSWUH2aq2eWbBkRokHwmjR7jp4fL7ZQQIWA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XN70TVHzd5QYsj/il4R/Tt8F1/Md6UfpVu1VfqnCcThx2X0EdRvRTOd9Yy54mv+MPpFuX5hdQrjwc01JirUXS8DG2I+5VTao9s0kc67AZEY6sOfKg5MxA+Y2nPy3NHK6DVVev8GEyaKpmc78Gupm3qnS7joWJzuANYuyBz9Bu2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=I+ckUQAM; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 8D36919E7;
	Thu, 21 Aug 2025 02:09:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755734954;
	bh=djc1VqDhJSWUH2aq2eWbBkRokHwmjR7jp4fL7ZQQIWA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=I+ckUQAMIknNeMk8ssliR8WmdEzfv2Kyo1dVOFtSaJyjw11K2AoIZEW1ZfCtimjFC
	 hvFkTf04WMNbtuKUdKcWTQuJXIYjGVl8Ywq3RmGheDWKcXobbuPfUEQKGDyFhK3O+e
	 edkKpc/NJV+M5PzQCu/ZQFQqu5wo61AKpffXIgWY=
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
Subject: [PATCH v2 03/12] media: imx-mipi-csis: Standardize const keyword placement
Date: Thu, 21 Aug 2025 03:09:35 +0300
Message-ID: <20250821000944.27849-4-laurent.pinchart@ideasonboard.com>
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

The const keyword for pointer variables is placed before the type
everywhere except in one location. Change it to improve consistency.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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


