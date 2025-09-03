Return-Path: <linux-media+bounces-41659-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9A7B41BBC
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 12:24:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 21FBD203ECE
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 10:24:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3509B2F290C;
	Wed,  3 Sep 2025 10:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="m1LIxV1k"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC942F0C6E;
	Wed,  3 Sep 2025 10:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756895004; cv=none; b=m1T2SeON1dfn21nfyHFIynKGntICDgjLoA45RF/IALtDWGLKYKb4xGKDI8dNiyBrAhKKBYKk1c0bAQk7KMnE/YqW+zF2FJj1x/MRn62Db0iVtCf15xGnykOSsdcZNg/on/C3ODCmORHzExtRDFFwKLOfa8a3g9xLI+EAx0JMP8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756895004; c=relaxed/simple;
	bh=j1y9w4zVSTWdKaySI00pSSbx5Q3O9jpXo7haUuEXkdc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sTNVKHwvCgB+xAcsymqCeYkf/jKT9WugDZ9yBX4JSJ7pgGaUYWRyTJYBMKcJWQIxeqTTayz0o+PUno4SEWqc5F7lzLNHqA6kZapsU/NUMk29fglUIl2ed/Fd9KtvqGax9U8wqKtMhQEp4Uyh6jrHObZFxCZDfrU0FW4InClITK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=m1LIxV1k; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from isaac-ThinkPad-T16-Gen-2.lan (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0BC271026;
	Wed,  3 Sep 2025 12:22:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756894929;
	bh=j1y9w4zVSTWdKaySI00pSSbx5Q3O9jpXo7haUuEXkdc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=m1LIxV1kOlHdB5TjOrinTOZZvgc2N1xIEBzcH0wrmaA7X0+ddSb60RmdOCmX1500e
	 ZxsrZEQnA/sMf4x+o90/65HHyUEvRseJ8+lrCieeHGV6dRDzRUvC5rdytReL0ORLRz
	 kcy+vdfNfa1kO2/R28uAgO5rjEli4fYOQ6gXKFXg=
From: Isaac Scott <isaac.scott@ideasonboard.com>
To: laurent.pinchart@ideasonboard.com
Cc: rmfrfs@gmail.com,
	martink@posteo.de,
	kernel@puri.sm,
	mchehab@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-media@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	hverkuil@kernel.org,
	nicolas.dufresne@collabora.com,
	sakari.ailus@linux.intel.com,
	tomi.valkeinen@ideasonboard.com,
	jonas@kwiboo.se,
	dan.scally+renesas@ideasonboard.com,
	m.szyprowski@samsung.com,
	mehdi.djait@linux.intel.com,
	niklas.soderlund+renesas@ragnatech.se,
	Isaac Scott <isaac.scott@ideasonboard.com>
Subject: [PATCH v2 3/3] media: imx-mipi-csis: Get number of active lanes via mbus_config
Date: Wed,  3 Sep 2025 11:22:42 +0100
Message-ID: <20250903102243.1563527-4-isaac.scott@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250903102243.1563527-1-isaac.scott@ideasonboard.com>
References: <20250903102243.1563527-1-isaac.scott@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The number of lanes actively used by a MIPI CSI transmitter may differ
from that which is defined in device tree. As such, call on
v4l2_get_active_data_lanes to check if the driver reports a
differing number of lanes to device tree, and use that number of active
lanes.

If the number of active data lanes is invalid, or the op is not
supported, it will use the number of lanes defined in device tree.

Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
---
 drivers/media/platform/nxp/imx-mipi-csis.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
index fc89325f2f94..985be511bcd0 100644
--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -967,6 +967,9 @@ static int mipi_csis_s_stream(struct v4l2_subdev *sd, int enable)
 	format = v4l2_subdev_state_get_format(state, CSIS_PAD_SINK);
 	csis_fmt = find_csis_format(format->code);
 
+	csis->bus.num_data_lanes = v4l2_get_active_data_lanes(csis->source.pad,
+							      csis->max_data_lanes);
+
 	ret = mipi_csis_calculate_params(csis, csis_fmt);
 	if (ret < 0)
 		goto err_unlock;
-- 
2.43.0


