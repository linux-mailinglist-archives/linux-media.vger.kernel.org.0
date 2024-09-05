Return-Path: <linux-media+bounces-17713-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1F696E5ED
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 00:53:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 574D9286F82
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2024 22:53:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83A6E1B12CD;
	Thu,  5 Sep 2024 22:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="kVWuU4cd"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F3B1482E9;
	Thu,  5 Sep 2024 22:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725576814; cv=none; b=uRz/ZLJ50tcpg7IZ9pqq+htUcN9clQldET2fl4redeC5AQniY1eqn2I+p61v9FWiCPboDqiSOYoqgLpJtikDjFur63nBIUC8wuK9FDhrwOvsWLpCChhIjYr3Rn9slr0GNJ+K1zsqUrUrFtDB0ZCVg4Hfmfx8mYUUhUEzLTn4CA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725576814; c=relaxed/simple;
	bh=KqQ+djuT8kGjmHI7AJhiC4YINbWMttDUbU+2ULLO/Xo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oQqq2qH1DB6pc1q5wdhxzWeN+spqOgC5lHnpWhIKD/i2w51GV6/ADzn/kk1YWEciPDf7hxPmbw1eL3jPOv0ZB2bcVjprIkb6/DNpjMlkYEVTHclR6RG9MDt0gXUv5tKXLTHHJf6R5x28E1G1ehUrcptjfV+r1iJs5Lqf4vj4pzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=kVWuU4cd; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E22611574;
	Fri,  6 Sep 2024 00:52:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1725576727;
	bh=KqQ+djuT8kGjmHI7AJhiC4YINbWMttDUbU+2ULLO/Xo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kVWuU4cdh/7wmYIre+K6SuM0lavabzSlVZnmb3wZRe9G4hM4GIMAaKHLbxVf1AOOL
	 sxAhTicSSlcgsCleC0LET0CR+emGO8B7EcZeN8L/hozbrcrxaQXxSxz+71gMxSqDwg
	 e7eQY3u9fm5s3MNuH8OYEKUoCj86wY1JPa0d2sk4=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH/RFC v2 3/9] media: i2c: ar0144: Add support for the parallel interface
Date: Fri,  6 Sep 2024 01:53:01 +0300
Message-ID: <20240905225308.11267-4-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240905225308.11267-1-laurent.pinchart@ideasonboard.com>
References: <20240905225308.11267-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add basic support for the parallel interface. This hasn't been tested
due to the lack of a test platform, and will thus likely not work out of
the box.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes since v1:

- Fix reset_bits when stopping streaming
---
 drivers/media/i2c/ar0144.c | 31 +++++++++++++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ar0144.c b/drivers/media/i2c/ar0144.c
index f9224fd2bb9f..e03806ed12f4 100644
--- a/drivers/media/i2c/ar0144.c
+++ b/drivers/media/i2c/ar0144.c
@@ -10,7 +10,8 @@
  * - Use grouped parameter hold to update controls atomically
  * - Expose debug information through debugfs (FRAME_COUNT, FRAME_STATUS, ...)
  * - Make MIPI D-PHY timings configurable
- * - Support the parallel interface
+ * - Program additional parallel interface parameters (slew rates, polarities,
+ *   ...)
  * - Expose additional controls (in particular the temperature sensor and the
  *   on-chip black level correction)
  * - Make binning configurable
@@ -300,6 +301,8 @@
 #define AR0144_MIN_CSI2_LINK_FREQ		150000000U
 #define AR0144_MAX_CSI2_LINK_FREQ		384000000U
 
+#define AR0144_MAX_PARALLEL_LINK_FREQ		74250000U
+
 /*
  * The pixel array contains 1300x820 optically transparent pixels, with 6 dummy
  * pixels on each side that can't be read out. The active size is 1288x808.
@@ -466,6 +469,12 @@ static int ar0144_configure_pll(struct ar0144 *sensor)
 	return ret;
 }
 
+static int ar0144_configure_parallel(struct ar0144 *sensor,
+				     const struct ar0144_format_info *info)
+{
+	return cci_write(sensor->regmap, AR0144_SERIAL_FORMAT, 0x0200, NULL);
+}
+
 static int ar0144_configure_mipi(struct ar0144 *sensor,
 				 const struct ar0144_format_info *info)
 {
@@ -558,13 +567,19 @@ static int ar0144_start_streaming(struct ar0144 *sensor,
 	if (ret)
 		goto error;
 
-	ret = ar0144_configure_mipi(sensor, info);
+	if (sensor->bus_cfg.bus_type == V4L2_MBUS_PARALLEL)
+		ret = ar0144_configure_parallel(sensor, info);
+	else
+		ret = ar0144_configure_mipi(sensor, info);
 
 	/*
 	 * We're all set, start streaming. Mask bad frames and keep read-only
 	 * registers locked.
 	 */
 	val = AR0144_MASK_BAD | AR0144_LOCK_REG | AR0144_STREAM | 0x2010;
+	if (sensor->bus_cfg.bus_type == V4L2_MBUS_PARALLEL)
+		val |= AR0144_SMIA_SERIALIZER_DIS | AR0144_PARALLEL_EN
+		    |  AR0144_DRIVE_PINS;
 	cci_write(sensor->regmap, AR0144_RESET_REGISTER, val, &ret);
 
 	if (ret)
@@ -598,6 +613,10 @@ static int ar0144_stop_streaming(struct ar0144 *sensor)
 	 * Initiate the transition to standby by clearing the STREAM bit. Don't
 	 * clear the bits that affect the output interface yet.
 	 */
+	if (sensor->bus_cfg.bus_type == V4L2_MBUS_PARALLEL)
+		reset_bits |= AR0144_SMIA_SERIALIZER_DIS | AR0144_PARALLEL_EN
+			   |  AR0144_DRIVE_PINS;
+
 	ret = cci_write(sensor->regmap, AR0144_RESET_REGISTER, reset_bits, NULL);
 	if (ret)
 		return ret;
@@ -1282,6 +1301,10 @@ static int ar0144_get_mbus_config(struct v4l2_subdev *sd, unsigned int pad,
 	default:
 		cfg->bus.mipi_csi2 = sensor->bus_cfg.bus.mipi_csi2;
 		break;
+
+	case V4L2_MBUS_PARALLEL:
+		cfg->bus.parallel = sensor->bus_cfg.bus.parallel;
+		break;
 	}
 
 	return 0;
@@ -1623,6 +1646,10 @@ static int ar0144_parse_dt(struct ar0144 *sensor)
 		}
 		break;
 
+	case V4L2_MBUS_PARALLEL:
+		nlanes = ep->bus.parallel.bus_width ? : 12;
+		break;
+
 	default:
 		dev_err(sensor->dev, "Unsupported bus type %u\n", ep->bus_type);
 		goto error;
-- 
Regards,

Laurent Pinchart


