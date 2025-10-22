Return-Path: <linux-media+bounces-45223-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C1CBFB63D
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 12:23:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 45F3E19C692D
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 10:23:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36348324B3A;
	Wed, 22 Oct 2025 10:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="IvJHQBfv"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E74FC328625;
	Wed, 22 Oct 2025 10:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761128564; cv=none; b=gurHCb5zD+FcBUxgZtJ5mXK0OUyozt00nTKLNUM7d+AfUqho3NPNUugsqqIPTYhCW5sAJG51E5WzUgnV9+7ISvNFkvrP4vYhcZsnfTa1PT7HCicdPr5U0UDkh9CCYmRBnoXzvO2xBcwDwcFhdycXIKAysmlHVkFS3qpaGeM/4aM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761128564; c=relaxed/simple;
	bh=YxLHFykL3sVDstB6QqAhE2alQAOsXneyIHwU8PQ/9I4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=InBtjnMbC0zxiWRqZYDC5V0D1FKa7V31UCNXAfoaw3fxdh+8qr/mtma5XVpn9CcmkiO33q1dMOA0E//5tdCT1i+uBAlB3wEYXqe6gBtKs7pSqNDeNEWvFOpugVDDBbUk1kcBzqc4idOcK5kDLXyY4u/1y2B2pI7Mc42nJJJWbD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=IvJHQBfv; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from isaac-ThinkPad-T16-Gen-2.infra.iob (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C0E1A178A;
	Wed, 22 Oct 2025 12:20:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761128456;
	bh=YxLHFykL3sVDstB6QqAhE2alQAOsXneyIHwU8PQ/9I4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IvJHQBfv/w/CGAJCH6/+bepYpYHaqLpWXCLP+k/jTb1hrZYqrwQhIvczOXGuwrKQq
	 FabTU3iNazT54Cyyj6Kj7Zwn4qr/yzFmqoAgTDHJPNUbvbMn3014sZp3Strl6tMY8o
	 rroe0T+M6A6MBZgxTCey+Ei24RzPyG/DZtIQpZi0=
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
Subject: [PATCH v5 4/4] media: imx-mipi-csis: Support active data lanes differing from maximum
Date: Wed, 22 Oct 2025 11:22:28 +0100
Message-ID: <20251022102228.275627-5-isaac.scott@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251022102228.275627-1-isaac.scott@ideasonboard.com>
References: <20251022102228.275627-1-isaac.scott@ideasonboard.com>
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

If the number of active data lanes reported by the driver is invalid, or
the operation is not supported, fall back to the number of allowed data
lanes.

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


