Return-Path: <linux-media+bounces-42561-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 168E5B57CA5
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 15:19:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 80A6B2011EC
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 13:19:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D666314A8E;
	Mon, 15 Sep 2025 13:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="pojt6AqJ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C7D313261;
	Mon, 15 Sep 2025 13:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757942329; cv=none; b=Y1Jh136RXJ07k4hDHxAWA4b0W+kfpx71VyJt+96vZCJhTuqvfpZlhHZywuNlSrDVr3AsYwcBmqdZSVIq5xPe/C5Cg0tbY5Pl2iXqCVXut3T4yyV4xVILSiEN4odTYi+ohUUcN9oXrOZp2qTK9Hvva2EUO1DJWj+ea5Ig5xS4SNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757942329; c=relaxed/simple;
	bh=c4yZf5AiBVUDuy3InXPlki0Snp/s01BBP2Iy0btwSkM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gp497vhJrGVuqTPBRjG6imDdFmEaHt/riRy97Au1OtKho4WE63XFUSYRYlRQ0aaQmaFAtm67XGmpkDnsDIcdObK/QqlzPMoU+ekNJtX7hLo936cDBu2S3NEJsMrKN/KQcjKNSxhG2btKTeNnyIpvn1svCemTqPmsUl62+lCcuhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=pojt6AqJ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 082A03FCE;
	Mon, 15 Sep 2025 15:17:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1757942242;
	bh=c4yZf5AiBVUDuy3InXPlki0Snp/s01BBP2Iy0btwSkM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pojt6AqJkxMINXvJxQZxHVm7kpOq6nQXdFrHOCKJ9d3TD+/jS+I8y9gsrf8vcupuL
	 s8Zl7wchKZWBz8yfxVDv7Hw9UUkXuXEbUWwm5I5sdhZTz8/VUwkCMxtvKhLDOLwUP/
	 6zRThlCdMkxTV/zvFJ45dsEf46HQYAlESSmtJeTA=
From: Isaac Scott <isaac.scott@ideasonboard.com>
Date: Mon, 15 Sep 2025 14:18:35 +0100
Subject: [PATCH v3 3/3] media: imx-mipi-csis: Get number of active lanes
 via mbus_config
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250915-mbus-config-active-lanes-v3-3-97a1282a410b@ideasonboard.com>
References: <20250915-mbus-config-active-lanes-v3-0-97a1282a410b@ideasonboard.com>
In-Reply-To: <20250915-mbus-config-active-lanes-v3-0-97a1282a410b@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Isaac Scott <isaac.scott@ideasonboard.com>
X-Mailer: b4 0.13.0

The number of lanes actively used by a MIPI CSI transmitter may differ
from that which is defined in device tree. As such, call on
v4l2_get_active_data_lanes() to check if the driver reports a
differing number of lanes to device tree, and use that number of active
lanes.

If the number of active data lanes is invalid, or the op is not
supported, use the number of lanes defined in device tree.

Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
---
 drivers/media/platform/nxp/imx-mipi-csis.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
index 6afbedfe131e..d3424ad54b4e 100644
--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -967,6 +967,9 @@ static int mipi_csis_s_stream(struct v4l2_subdev *sd, int enable)
 	format = v4l2_subdev_state_get_format(state, CSIS_PAD_SINK);
 	csis_fmt = find_csis_format(format->code);
 
+	csis->num_data_lanes = v4l2_get_active_data_lanes(csis->source.pad,
+							  csis->bus.num_data_lanes);
+
 	ret = mipi_csis_calculate_params(csis, csis_fmt);
 	if (ret < 0)
 		goto err_unlock;

-- 
2.43.0


