Return-Path: <linux-media+bounces-45955-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC5EC1CAA0
	for <lists+linux-media@lfdr.de>; Wed, 29 Oct 2025 19:04:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id BD80634CAF8
	for <lists+linux-media@lfdr.de>; Wed, 29 Oct 2025 18:04:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 823A73563CB;
	Wed, 29 Oct 2025 18:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="l4XNVpdg"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15DAE3559C9;
	Wed, 29 Oct 2025 18:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761761045; cv=none; b=duTvWCTsApCzgPMX32kfftQTXx6a0dEj9CauRYSS8n1j+CN6r4HAarMMXj1HjCzNu7FDxCZxF7uUg90cvU62AZzQqZ0BsB0tZbW0X9u7nWwn8kyvtIo8RQ6BWrMSHqcFQ5YMifpilMlX73gTSMa//nA3GfV9+8G2dRZbYcbm7E8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761761045; c=relaxed/simple;
	bh=eY/oR6gIBneCiyv1U57xLJ4h9FoVnMvAOPH0It6RWj4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=joFdDg1/WUOz5AxqJuDn1oklTascahOy1rqPwe6RlFRxhL4rTGi9PjL+q0IdnSF+8aXeVre+KlaX66VuAiTmrn+adkdST8PKbhGqNqqGHUfC+cq1TFKbyUh29RLxlHTqOdzZkhCqADKsoxVXVSZFVdaop7rBIugBOARuXWK6Nd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=l4XNVpdg; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from isaac-ThinkPad-T16-Gen-2.infra.iob (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E28794EE1;
	Wed, 29 Oct 2025 19:02:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761760922;
	bh=eY/oR6gIBneCiyv1U57xLJ4h9FoVnMvAOPH0It6RWj4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=l4XNVpdgcKPaIF7GwHLThY9iMTK5s4n9KB6+6dGhPmHrvNmzZFyA6zNy1U8lfFjyc
	 m76vHEJqWHAZCMSuid3In3EoHG9551FwW9TLAUXQidm+5L6WuZ4RvTEyi0V1FXZdOM
	 z5IGxTTO22ARunLtV4WqwGeO6uYXkhRIWMbM+uI0=
From: Isaac Scott <isaac.scott@ideasonboard.com>
To: mchehab@kernel.org
Cc: rmfrfs@gmail.com,
	laurent.pinchart@ideasonboard.com,
	martink@posteo.de,
	kernel@puri.sm,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Frank.Li@nxp.com,
	Isaac Scott <isaac.scott@ideasonboard.com>
Subject: [PATCH v6 4/4] media: imx-mipi-csis: Support active data lanes differing from maximum
Date: Wed, 29 Oct 2025 18:03:21 +0000
Message-ID: <20251029180321.153680-5-isaac.scott@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251029180321.153680-1-isaac.scott@ideasonboard.com>
References: <20251029180321.153680-1-isaac.scott@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Call on v4l2_get_active_data_lanes() to check if the driver reports that
the number of lanes actively used by the MIPI CSI transmitter differs to
the maximum defined in device tree.

If the number of active data lanes reported by the driver is invalid,
catch and return the error. If the operation is not supported, fall back
to the number of allowed data lanes.

Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
---
 drivers/media/platform/nxp/imx-mipi-csis.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
index 838a1ad123b5..4224ea2d80b6 100644
--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -1034,6 +1034,12 @@ static int mipi_csis_s_stream(struct v4l2_subdev *sd, int enable)
 	format = v4l2_subdev_state_get_format(state, CSIS_PAD_SINK);
 	csis_fmt = find_csis_format(format->code);
 
+	ret = v4l2_get_active_data_lanes(csis->source.pad, csis->bus.num_data_lanes);
+	if (ret < 0)
+		goto err_unlock;
+
+	csis->num_data_lanes = ret;
+
 	ret = mipi_csis_calculate_params(csis, csis_fmt);
 	if (ret < 0)
 		goto err_unlock;
-- 
2.43.0


