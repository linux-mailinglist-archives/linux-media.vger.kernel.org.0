Return-Path: <linux-media+bounces-43206-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF4ABA07DE
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 17:56:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 993004E3A4C
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 15:56:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7B2F308F38;
	Thu, 25 Sep 2025 15:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="kPzyiha4"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73EEB3019C1;
	Thu, 25 Sep 2025 15:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758815738; cv=none; b=pSIyjwWkpZuTr5Y4g6uCVZ0FLqiCpjQS9TVEcohYIdy2+sL6z3TIeL/3NgS9RerEEkTaHmt+jSCOrxg8+L0W2tCRLiALgh+ov3V15/JJ6GaLL2WxE4qGgn36oQKVRLgGWEv26A/VNBnp25TNFkEknCPpGzdErnJCtm4pn+EoTe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758815738; c=relaxed/simple;
	bh=/lYx9HajpxPlfcmmhJX0reUWRFqHU9LFR9AeyxwXFvs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O0R8mDIdvPJkbdmeoj0k6qbTDgm7GChYS20zyFYPSGyS5u1rRJoAq43eYeKNShjvUQ5tljQ1JUC2Aee2caZxHbWskyTAx/Px7kS7CGtRsIIHjlGLK0xHbF9JVjt1fCAwTEVbPBCFTUsn+1AWd8ar0RwWgkCRxAOLwq6htI9RzUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=kPzyiha4; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8760AD0;
	Thu, 25 Sep 2025 17:54:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1758815644;
	bh=/lYx9HajpxPlfcmmhJX0reUWRFqHU9LFR9AeyxwXFvs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kPzyiha4JC5Hq+Csjvya3qKr/yrHn0ySD9dej4E3Z14t/3SUAjucOnnZeWwSY9Dpk
	 r2MdDMzyvk5zcf29zim9/bqMAXX1kLBzovOzdeFq/biX9/51ojTqd2EiViTF6CEFJV
	 zXRUSdQO+EAAfyCREfn7dMuXFmsThJVj+6LfMCto=
From: Isaac Scott <isaac.scott@ideasonboard.com>
Date: Thu, 25 Sep 2025 16:54:29 +0100
Subject: [PATCH v4 4/4] media: imx-mipi-csis: Get number of active lanes
 via mbus_config
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-active-data-lanes-v4-4-8b54e3d5af6c@ideasonboard.com>
References: <20250925-active-data-lanes-v4-0-8b54e3d5af6c@ideasonboard.com>
In-Reply-To: <20250925-active-data-lanes-v4-0-8b54e3d5af6c@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Isaac Scott <isaac.scott@ideasonboard.com>
X-Mailer: b4 0.13.0

The number of lanes actively used by a MIPI CSI transmitter may differ
from that which is defined in device tree, due to the source device not
using all of the connected data lanes on the board. As such, call on
v4l2_get_active_data_lanes() to check if the driver reports a differing
number of lanes to the maximum, and use that number of active lanes.

If the number of active data lanes is invalid, or the op is not
supported, use the maximum number of allowed data lanes.

Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
---
 drivers/media/platform/nxp/imx-mipi-csis.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
index 838a1ad123b5..637ef6e614fa 100644
--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -1034,6 +1034,10 @@ static int mipi_csis_s_stream(struct v4l2_subdev *sd, int enable)
 	format = v4l2_subdev_state_get_format(state, CSIS_PAD_SINK);
 	csis_fmt = find_csis_format(format->code);
 
+	ret = v4l2_get_active_data_lanes(csis->source.pad,
+					 csis->bus.num_data_lanes);
+	csis->num_data_lanes = ret < 0 ? csis->bus.num_data_lanes : ret;
+
 	ret = mipi_csis_calculate_params(csis, csis_fmt);
 	if (ret < 0)
 		goto err_unlock;

-- 
2.43.0


